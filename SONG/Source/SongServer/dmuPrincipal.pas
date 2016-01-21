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
  System.Generics.Collections, System.Generics.Defaults, Datasnap.DSSession;

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
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure SCAdministrativoGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
  private
    FConnections: TObjectDictionary<Integer, TFDConnection>;
    { Private declarations }
  public
    procedure ppuIniciarServidor(ipServidor, ipEnderecoBanco, ipUsuario, ipSenha: String; ipPorta: Integer);

    function fpuConnection: TFDConnection;
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{$R *.dfm}

uses smuAdministrativo;

{ TdmPrincipal }

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
  FConnections := TObjectDictionary<Integer, TFDConnection>.Create([doOwnsValues]);
end;

procedure TdmPrincipal.DataModuleDestroy(Sender: TObject);
begin
  FConnections.Clear;
  FConnections.Free;
end;

function TdmPrincipal.fpuConnection: TFDConnection;
begin
  if not FConnections.TryGetValue(TDSSessionManager.GetThreadSession.Id, Result) then
    begin
      Result := TFDConnection.Create(nil);
      Result.Params.Assign(conSong.Params);

      FConnections.Add(TDSSessionManager.GetThreadSession.Id, Result);
    end;

end;

procedure TdmPrincipal.ppuIniciarServidor(ipServidor, ipEnderecoBanco, ipUsuario, ipSenha: String; ipPorta: Integer);
begin
  conSong.close;
  conSong.Params.Values['SERVER'] := ipServidor;
  conSong.Params.Values['DATABASE'] := ipEnderecoBanco;
  conSong.Params.Values['USER_NAME'] := ipUsuario;
  conSong.Params.Values['PASSWORD'] := ipSenha;
  // vamos apenas validar a conexao com o banco
  conSong.Open();
  conSong.close;

  ServerTransport.Port := ipPorta;
  Server.Start;
end;

procedure TdmPrincipal.SCAdministrativoGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := smuAdministrativo.TsmAdministrativo;
end;

end.
