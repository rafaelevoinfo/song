unit dmuPrincipal;

interface

uses System.SysUtils, System.Classes,
  Datasnap.DSTCPServerTransport,
  Datasnap.DSHTTPCommon, Datasnap.DSHTTP,
  Datasnap.DSServer, Datasnap.DSCommonServer,
  Datasnap.DSAuth, IPPeerServer, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.IBBase,
  System.Generics.Collections, System.Generics.Defaults, Datasnap.DSSession,
  uRoles, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, uQuery, Vcl.AppEvnts, CodeSiteLogging;

type
  TdmPrincipal = class(TDataModule)
    Server: TDSServer;
    ServerTransport: TDSTCPServerTransport;
    HttpServer: TDSHTTPService;
    conSong: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDManager1: TFDManager;
    Authentication: TDSAuthenticationManager;
    SCAdministrativo: TDSServerClass;
    SCFuncoesGeral: TDSServerClass;
    qLogin: TRFQuery;
    qLoginLOGIN: TStringField;
    qLoginSENHA: TStringField;
    ApplicationEvents1: TApplicationEvents;
    qLoginID: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure SCAdministrativoGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
    procedure AuthenticationUserAuthenticate(Sender: TObject; const Protocol, Context, User, Password: string;
      var valid: Boolean; UserRoles: TStrings);
    procedure SCFuncoesGeralGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
    procedure AuthenticationUserAuthorize(Sender: TObject; AuthorizeEventObject: TDSAuthorizeEventObject;
      var valid: Boolean);
    procedure ServerTransportDisconnect(Event: TDSTCPDisconnectEventObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
  private
    FSyncro: TMultiReadExclusiveWriteSynchronizer;
    FConnections: TDictionary<Integer, TFDConnection>;
    function GetConnection: TFDConnection;
    { Private declarations }
  public
    procedure ppuIniciarServidor(ipServidor, ipEnderecoBanco, ipUsuario, ipSenha: String; ipPorta: Integer);

    property Connection: TFDConnection read GetConnection;
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{$R *.dfm}

uses smuAdministrativo, smuFuncoesGeral;

{ TdmPrincipal }

procedure TdmPrincipal.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
    //TODO:Implementar log de erros
  CodeSite.send(e.Message);
end;

procedure TdmPrincipal.AuthenticationUserAuthenticate(Sender: TObject; const Protocol, Context, User, Password: string;
  var valid: Boolean; UserRoles: TStrings);
begin
  valid := True;
  // vamos permitir chamar a funcao de verificar a versao para qualquer um
  UserRoles.add(TRoleGeral.coVerificarVersao);
  if (User <> '') and (Password <> '') then
    begin
      if (not qLogin.Active) or (qLoginLOGIN.AsString <> User) or (qLoginSENHA.AsString <> Password) then
        begin
          qLogin.Close;
          qLogin.ParamByName('LOGIN').AsString := User;
          qLogin.ParamByName('SENHA').AsString := Password;
          qLogin.Open();
          valid := not qLogin.Eof;
        end;
    end;

end;

procedure TdmPrincipal.AuthenticationUserAuthorize(Sender: TObject; AuthorizeEventObject: TDSAuthorizeEventObject;
  var valid: Boolean);
begin
  valid := False;
  if (AuthorizeEventObject.MethodAlias = 'TsmFuncoesGeral.fpuVerificarNovaVersao') then
    valid := True
  else if AuthorizeEventObject.UserName = 'admin' then
    valid := True;

  valid := True;
end;

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
  FConnections := TDictionary<Integer, TFDConnection>.Create();
  FSyncro := TMultiReadExclusiveWriteSynchronizer.Create;
end;

procedure TdmPrincipal.DataModuleDestroy(Sender: TObject);
begin
  FConnections.Clear;
  FConnections.Free;

  FSyncro.Free;
end;

function TdmPrincipal.GetConnection: TFDConnection;
begin
  FSyncro.BeginRead;
  try
    if not FConnections.TryGetValue(TDSSessionManager.GetThreadSession.Id, Result) then
      begin
        Result := TFDConnection.Create(nil);
        Result.Params.Assign(conSong.Params);
        FSyncro.BeginWrite;
        try
          FConnections.add(TDSSessionManager.GetThreadSession.Id, Result);
        finally
          FSyncro.EndWrite;
        end;
      end;
  finally
    FSyncro.EndRead;
  end;

end;

procedure TdmPrincipal.ppuIniciarServidor(ipServidor, ipEnderecoBanco, ipUsuario, ipSenha: String; ipPorta: Integer);
begin
  conSong.Close;
  conSong.Params.Values['SERVER'] := ipServidor;
  conSong.Params.Values['DATABASE'] := ipEnderecoBanco;
  conSong.Params.Values['USER_NAME'] := ipUsuario;
  conSong.Params.Values['PASSWORD'] := ipSenha;
  // vamos apenas validar a conexao com o banco
  conSong.Open();
  conSong.Close;

  ServerTransport.Port := ipPorta;
  Server.Start;
end;

procedure TdmPrincipal.SCAdministrativoGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := smuAdministrativo.TsmAdministrativo;
end;

procedure TdmPrincipal.SCFuncoesGeralGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := smuFuncoesGeral.TSMFuncoesGeral;
end;

procedure TdmPrincipal.ServerTransportDisconnect(Event: TDSTCPDisconnectEventObject);
var
  vaConn: TFDConnection;
begin
  FSyncro.BeginWrite;
  try
    if FConnections.TryGetValue(TDSSessionManager.GetThreadSession.Id, vaConn) then
      begin
        vaConn.Close;
        vaConn.Free;

        FConnections.Remove(TDSSessionManager.GetThreadSession.Id);
      end;
  finally
    FSyncro.EndWrite;
  end;
end;

end.
