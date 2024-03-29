unit dmuPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, Data.DB, FireDAC.Comp.Client,
  System.IOUtils, FireDAC.FMXUI.Wait, FireDAC.Comp.UI, Data.DBXDataSnap,
  Data.DBXCommon, IPPeerClient, Datasnap.DSProxyDelphiNative,
  Datasnap.DSProxyDelphi, Datasnap.DSClientMetadata, Data.SqlExpr, uConnection,
  Datasnap.DSMetadata, Datasnap.DSConnectionMetaDataProvider, uFuncoes,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, uQuery, Data.Bind.Components, Data.Bind.DBScope,
  System.RegularExpressions, FMX.Dialogs;

type
  TdmPrincipal = class(TDataModule)
    Connection: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    SongServerCon: TRFSQLConnection;
    ProxyGenerator: TDSProxyGenerator;
    DSConnectionMetaDataProvider1: TDSConnectionMetaDataProvider;
    qConfig: TRFQuery;
    qConfigID: TFDAutoIncField;
    qConfigDATA_ULTIMA_SYNC: TDateTimeField;
    qConfigHOST_SERVIDOR_EXTERNO: TWideStringField;
    qConfigHOST_SERVIDOR_INTERNO: TWideStringField;
    qConfigID_APARELHO: TIntegerField;
    qConfigLOGIN: TStringField;
    qConfigSENHA: TStringField;
    qEspecie: TRFQuery;
    qEspecieID: TFDAutoIncField;
    qEspecieNOME: TStringField;
    BindSourceEspecie: TBindSourceDB;
    procedure ConnectionBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure SongServerConAfterConnect(Sender: TObject);
    procedure SongServerConAfterDisconnect(Sender: TObject);
  private
    FFuncoesViveiro: TSMFuncoesViveiroClient;
    FFuncoesSistema: TSMfuncoesSistemaClient;

    { Private declarations }
  public
    property FuncoesViveiro: TSMFuncoesViveiroClient read FFuncoesViveiro;
    property FuncoesSistema: TSMfuncoesSistemaClient read FFuncoesSistema;

    procedure ppuAbrirConfig;
    procedure ppuAbrirEspecie;
    procedure ppuConfigurarConexaoServidor(ipHost: String; ipParametros: TStrings);
    procedure ppuConectarServidor(ipConn: TRFSQLConnection=nil);
    procedure ppuDesconectarServidor(ipConn: TRFSQLConnection = nil);
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{ %CLASSGROUP 'FMX.Controls.TControl' }

{$R *.dfm}

procedure TdmPrincipal.ConnectionBeforeConnect(Sender: TObject);
begin
{$IFDEF ANDROID}
  Connection.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'song_mobile.db');
{$ENDIF}
end;

procedure TdmPrincipal.ppuAbrirConfig;
begin
  if not qConfig.Active then
    qConfig.Open();
end;

procedure TdmPrincipal.ppuAbrirEspecie;
begin
  if not qEspecie.Active then
    qEspecie.Open();
end;

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
  Connection.Open();
  ppuAbrirConfig;
end;

procedure TdmPrincipal.ppuDesconectarServidor(ipConn: TRFSQLConnection);
var
  vaConn: TRFSQLConnection;
begin
  if Assigned(ipConn) then
    vaConn := ipConn
  else
    vaConn := SongServerCon;

  try
    vaConn.Close;
  except
  end;
end;

procedure TdmPrincipal.ppuConfigurarConexaoServidor(ipHost: String; ipParametros: TStrings);
begin
  //ipParametros.Values[TDBXPropertyNames.ConnectTimeout] := '3000';

  ipParametros.Values[TDBXPropertyNames.HostName] := ipHost;
  ipParametros.Values[TDBXPropertyNames.Port] := '3004';
  if qConfigLOGIN.AsString = '' then
    // tem que passar alguma coisa senao o song server vai deixar passar e so vai bloquear quando chamar uma funcao
    ipParametros.Values[TDBXPropertyNames.DSAuthenticationUser] := 'USUARIO'
  else
    ipParametros.Values[TDBXPropertyNames.DSAuthenticationUser] := qConfigLOGIN.AsString;

  if qConfigSENHA.AsString = '' then
    ipParametros.Values[TDBXPropertyNames.DSAuthenticationUser] := 'SENHA'
  else
    ipParametros.Values[TDBXPropertyNames.DSAuthenticationPassword] := qConfigSENHA.AsString;
end;

procedure TdmPrincipal.ppuConectarServidor(ipConn: TRFSQLConnection);
var
  vaConn: TRFSQLConnection;
begin
//  if Assigned(ipConn) then
//    vaConn := ipConn
//  else
//    vaConn := SongServerCon;
//
//  vaConn.Close;
//  ppuConfigurarConexaoServidor( vaConn.Params);
//
//  try
//
//
//
//    // else if qConfigHOST_SERVIDOR_EXTERNO.AsString <> '' then
//    // vaConn.Params.Values['hostname'] := qConfigHOST_SERVIDOR_EXTERNO.AsString
//    // else
//    // raise Exception.Create('Informe pelo menos um dos endere�o de acesso do servidor.');
//
//    vaConn.Open;
//  except
//    on e: Exception do
//      begin
//        if TRegEx.IsMatch(e.message, 'Authentication manager rejected user credentials', [roIgnoreCase]) then
//          raise Exception.Create('Usu�rio e/ou Senha de acesso ao SONG incorreto.');
//
//        if (qConfigHOST_SERVIDOR_EXTERNO.AsString <> '') and
//          (qConfigHOST_SERVIDOR_EXTERNO.AsString <> vaConn.Params.Values['hostname']) then
//          begin
//
//            vaConn.Close;
//            vaConn.Params.Values['hostname'] := qConfigHOST_SERVIDOR_EXTERNO.AsString;
//            try
//              vaConn.Open;
//            except
//              on ex: Exception do
//                begin
//                  if TRegEx.IsMatch(e.message, 'Authentication manager rejected user credentials', [roIgnoreCase]) then
//                    raise Exception.Create('Usu�rio e/ou Senha de acesso ao SONG incorreto.')
//                  else
//                    raise Exception.Create('N�o foi poss�vel conectar ao servidor. Detalhes: ' + ex.message);
//                end;
//            end;
//          end
//        else
//          raise Exception.Create('N�o foi poss�vel conectar ao servidor. Detalhes: ' + e.message);
//      end;
//  end;
//
//  vaConn.Params.Delete(vaConn.Params.IndexOfName('ConnectTimeout'));
end;

procedure TdmPrincipal.SongServerConAfterConnect(Sender: TObject);
begin
  FFuncoesViveiro := TSMFuncoesViveiroClient.Create(SongServerCon.DBXConnection);
  FFuncoesSistema := TSMfuncoesSistemaClient.Create(SongServerCon.DBXConnection);
end;

procedure TdmPrincipal.SongServerConAfterDisconnect(Sender: TObject);
begin
  if Assigned(FFuncoesViveiro) then
    begin
      FreeAndNil(FFuncoesViveiro);
    end;

  if Assigned(FFuncoesSistema) then
    begin
      FreeAndNil(FFuncoesSistema);
    end;
end;

end.
