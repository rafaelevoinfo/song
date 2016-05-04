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
  FireDAC.Comp.DataSet, uQuery, Vcl.AppEvnts, CodeSiteLogging, Datasnap.DBClient,
  System.IOUtils, System.RegularExpressions, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

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
    SCLookup: TDSServerClass;
    SCFuncoesAdministrativo: TDSServerClass;
    SCFinanceiro: TDSServerClass;
    SCViveiro: TDSServerClass;
    cdsAtualizacoes: TClientDataSet;
    cdsAtualizacoesMAJOR: TIntegerField;
    cdsAtualizacoesMINOR: TIntegerField;
    cdsAtualizacoesRELEASE: TIntegerField;
    cdsAtualizacoesBUILD: TIntegerField;
    cdsAtualizacoesENDERECO: TStringField;
    cdsAtualizacoesVERSAO: TStringField;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    SCFuncoesViveiro: TDSServerClass;
    SCFuncoesFinanceiro: TDSServerClass;
    SCEstoque: TDSServerClass;
    SCFuncoesEstoque: TDSServerClass;
    SCRelatorio: TDSServerClass;
    SCFuncoesRelatorio: TDSServerClass;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure SCAdministrativoGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
    procedure AuthenticationUserAuthenticate(Sender: TObject; const Protocol, Context, User, Password: string;
      var valid: Boolean; UserRoles: TStrings);
    procedure SCFuncoesGeralGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
    procedure AuthenticationUserAuthorize(Sender: TObject; AuthorizeEventObject: TDSAuthorizeEventObject;
      var valid: Boolean);
    procedure ServerTransportDisconnect(Event: TDSTCPDisconnectEventObject);
    procedure SCLookupGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
    procedure SCFuncoesAdministrativoGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure SCFinanceiroGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure SCViveiroGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure SCFuncoesViveiroGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure SCFuncoesFinanceiroGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure SCEstoqueGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure SCFuncoesEstoqueGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure SCRelatorioGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
    procedure SCFuncoesRelatorioGetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
  private
    FSyncro: TMultiReadExclusiveWriteSynchronizer;
    FSyncroAtualizacoes: TMultiReadExclusiveWriteSynchronizer;
    FConnections: TDictionary<Integer, TFDConnection>;
    function GetConnection: TFDConnection;
    { Private declarations }
  public
    procedure ppuIniciarServidor(ipServidor, ipEnderecoBanco, ipUsuario, ipSenha: String; ipPorta: Integer);

    procedure ppuAdicionarAtualizacao(ipVersao, ipEndereco: String);
    procedure ppuExcluirAtualizacao(ipVersao: String);
    function fpuBuscarAtualizacao(ipVersao: String; out opNovaVersao: String): string;
    function fpuPegarArquivoAtualizacao(ipVersao: string): string;
    function fpuCarregarAtualizacoes(): OleVariant;

    property Connection: TFDConnection read GetConnection;
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{$R *.dfm}


uses smuAdministrativo, smuFuncoesGeral, smuLookup, smuFuncoesAdministrativo,
  smuFinanceiro, smuViveiro, smuFuncoesViveiro, smuFuncoesFinanceiro, smuEstoque,
  smuFuncoesEstoque, smuRelatorio, smuFuncoesRelatorio;

{ TdmPrincipal }

procedure TdmPrincipal.AuthenticationUserAuthenticate(Sender: TObject; const Protocol, Context, User, Password: string;
  var valid: Boolean; UserRoles: TStrings);
begin
  valid := True;
  if (User <> '') or (Password <> '') then
    begin
      // if (not qLogin.Active) or (qLoginLOGIN.AsString <> User) or (qLoginSENHA.AsString <> Password) then
      // begin
      qLogin.Close;
      qLogin.ParamByName('LOGIN').AsString := User;
      qLogin.ParamByName('SENHA').AsString := Password;
      qLogin.Open();
      valid := not qLogin.Eof;
      // end;
    end;

end;

procedure TdmPrincipal.AuthenticationUserAuthorize(Sender: TObject; AuthorizeEventObject: TDSAuthorizeEventObject;
  var valid: Boolean);
begin
  valid := True;
  // se nao tiver logado com um usuario e senha valido a unica coisa permitida vai ser baixar uma nova versao
  if (AuthorizeEventObject.UserName = '') and
    (AuthorizeEventObject.MethodAlias <> 'TsmFuncoesGeral.fpuVerificarNovaVersao') and
    (AuthorizeEventObject.MethodAlias <> 'TsmFuncoesGeral.fpuBaixarAtualizacao') then
    begin
      valid := false
    end;
end;

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
  FConnections := TDictionary<Integer, TFDConnection>.Create();
  FSyncro := TMultiReadExclusiveWriteSynchronizer.Create;
  FSyncroAtualizacoes := TMultiReadExclusiveWriteSynchronizer.Create;

  if TFile.Exists(cdsAtualizacoes.FileName) then
    cdsAtualizacoes.LoadFromFile(cdsAtualizacoes.FileName)
  else
    cdsAtualizacoes.CreateDataSet;
end;

procedure TdmPrincipal.DataModuleDestroy(Sender: TObject);
begin
  FConnections.Clear;
  FConnections.Free;

  FSyncro.Free;
  FSyncroAtualizacoes.Free;
end;

function TdmPrincipal.fpuBuscarAtualizacao(ipVersao: String; out opNovaVersao: String): string;
var
  vaVersao: TArray<string>;
begin
  Result := '';
  opNovaVersao := '';
  vaVersao := Tregex.Split(ipVersao, '\.', []);
  if Length(vaVersao) < 4 then
    raise Exception.Create('Versão inválida.');

  FSyncroAtualizacoes.BeginRead;
  try
    // procurando uma build maior
    cdsAtualizacoes.Filter := 'MAJOR=' + vaVersao[0] + ' and MINOR=' + vaVersao[1] + ' and RELEASE=' + vaVersao[2];
    cdsAtualizacoes.Filtered := True;

    cdsAtualizacoes.First;
    while not cdsAtualizacoes.Eof do
      begin
        if cdsAtualizacoesBUILD.AsInteger > vaVersao[3].ToInteger then
          begin
            opNovaVersao := cdsAtualizacoesVERSAO.AsString;
            Exit(cdsAtualizacoesENDERECO.AsString);
          end;

        cdsAtualizacoes.Next;
      end;
    // procurando uma realease maior
    cdsAtualizacoes.Filter := 'MAJOR=' + vaVersao[0] + ' and MINOR=' + vaVersao[1];
    cdsAtualizacoes.Filtered := True;

    cdsAtualizacoes.First;
    while not cdsAtualizacoes.Eof do
      begin
        if cdsAtualizacoesRELEASE.AsInteger > vaVersao[2].ToInteger then
          begin
            opNovaVersao := cdsAtualizacoesVERSAO.AsString;
            Exit(cdsAtualizacoesENDERECO.AsString);
          end;

        cdsAtualizacoes.Next;
      end;

    // procurando uma minor maior
    cdsAtualizacoes.Filter := 'MAJOR=' + vaVersao[0];
    cdsAtualizacoes.Filtered := True;

    cdsAtualizacoes.First;
    while not cdsAtualizacoes.Eof do
      begin
        if cdsAtualizacoesMINOR.AsInteger > vaVersao[1].ToInteger then
          begin
            opNovaVersao := cdsAtualizacoesVERSAO.AsString;
            Exit(cdsAtualizacoesENDERECO.AsString);
          end;

        cdsAtualizacoes.Next;
      end;

    // procurando uma minor maior
    cdsAtualizacoes.Filtered := false;
    cdsAtualizacoes.First;
    while not cdsAtualizacoes.Eof do
      begin
        if cdsAtualizacoesMAJOR.AsInteger > vaVersao[0].ToInteger then
          begin
            opNovaVersao := cdsAtualizacoesVERSAO.AsString;
            Exit(cdsAtualizacoesENDERECO.AsString);
          end;

        cdsAtualizacoes.Next;
      end;

  finally
    cdsAtualizacoes.Filtered := false;
    FSyncroAtualizacoes.EndRead;
  end;
end;

function TdmPrincipal.fpuCarregarAtualizacoes: OleVariant;
begin
  FSyncroAtualizacoes.BeginRead;
  try
    Result := cdsAtualizacoes.Data;
  finally
    FSyncroAtualizacoes.EndRead;
  end;

end;

function TdmPrincipal.fpuPegarArquivoAtualizacao(ipVersao: string): string;
begin
  FSyncroAtualizacoes.BeginWrite;
  try
    if cdsAtualizacoes.Locate(cdsAtualizacoesVERSAO.FieldName, ipVersao, []) then
      begin
        Result := cdsAtualizacoesENDERECO.AsString;
      end;
  finally
    FSyncroAtualizacoes.EndWrite;
  end;
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
          FConnections.Add(TDSSessionManager.GetThreadSession.Id, Result);
        finally
          FSyncro.EndWrite;
        end;
      end;
  finally
    FSyncro.EndRead;
  end;

end;

procedure TdmPrincipal.ppuAdicionarAtualizacao(ipVersao, ipEndereco: String);
var
  vaVersao: TArray<String>;
begin
  vaVersao := Tregex.Split(ipVersao, '\.', []);
  if Length(vaVersao) < 4 then
    raise Exception.Create('Versão inválida.');

  FSyncroAtualizacoes.BeginWrite;
  try
    if not cdsAtualizacoes.Locate(cdsAtualizacoesVERSAO.FieldName, ipVersao, []) then
      begin
        cdsAtualizacoes.Append;
        cdsAtualizacoesMAJOR.AsInteger := vaVersao[0].ToInteger();
        cdsAtualizacoesMINOR.AsInteger := vaVersao[1].ToInteger();
        cdsAtualizacoesRELEASE.AsInteger := vaVersao[2].ToInteger();
        cdsAtualizacoesBUILD.AsInteger := vaVersao[3].ToInteger();
        cdsAtualizacoesVERSAO.AsString := ipVersao;
        cdsAtualizacoesENDERECO.AsString := ipEndereco;
        cdsAtualizacoes.Post;

        cdsAtualizacoes.SaveToFile();
      end;
  finally
    FSyncroAtualizacoes.EndWrite;
  end;
end;

procedure TdmPrincipal.ppuExcluirAtualizacao(ipVersao: String);
begin
  FSyncroAtualizacoes.BeginWrite;
  try
    if cdsAtualizacoes.Locate(cdsAtualizacoesVERSAO.FieldName, ipVersao, []) then
      begin
        cdsAtualizacoes.Delete;
        cdsAtualizacoes.SaveToFile();
      end;
  finally
    FSyncroAtualizacoes.EndWrite;
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

procedure TdmPrincipal.SCEstoqueGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := smuEstoque.TsmEstoque;
end;

procedure TdmPrincipal.SCFinanceiroGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := smuFinanceiro.TsmFinanceiro;
end;

procedure TdmPrincipal.SCFuncoesAdministrativoGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := smuFuncoesAdministrativo.TsmFuncoesAdministrativo;
end;

procedure TdmPrincipal.SCFuncoesEstoqueGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := smuFuncoesEstoque.TsmFuncoesEstoque;
end;

procedure TdmPrincipal.SCFuncoesFinanceiroGetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := smuFuncoesFinanceiro.TSMFuncoesFinanceiro;
end;

procedure TdmPrincipal.SCFuncoesGeralGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := smuFuncoesGeral.TSMFuncoesGeral;
end;

procedure TdmPrincipal.SCFuncoesRelatorioGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := smuFuncoesRelatorio.TsmFuncoesRelatorio;
end;

procedure TdmPrincipal.SCFuncoesViveiroGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := smuFuncoesViveiro.TsmFuncoesViveiro;
end;

procedure TdmPrincipal.SCLookupGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := smuLookup.TsmLookup;
end;

procedure TdmPrincipal.SCRelatorioGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := smuRelatorio.TSMRelatorio;
end;

procedure TdmPrincipal.SCViveiroGetClass(DSServerClass: TDSServerClass;
  var PersistentClass: TPersistentClass);
begin
  PersistentClass := smuViveiro.TsmViveiro;
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
