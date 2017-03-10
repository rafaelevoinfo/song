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
  System.RegularExpressions;

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
    procedure ppuConectarServidor;
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

procedure TdmPrincipal.ppuConectarServidor;
begin
  SongServerCon.Close;
  SongServerCon.Params.Values['ConnectTimeout'] := '3000';

  SongServerCon.Params.Values['hostname'] := qConfigHOST_SERVIDOR_INTERNO.AsString;
  SongServerCon.Params.Values['Port'] := '3004';
  if qConfigLOGIN.AsString = '' then
    // tem que passar alguma coisa senao o song server vai deixar passar e so vai bloquear quando chamar uma funcao
    SongServerCon.Params.Values['DSAuthenticationUser'] := 'USUARIO'
  else
    SongServerCon.Params.Values['DSAuthenticationUser'] := qConfigLOGIN.AsString;

  if qConfigSENHA.AsString = '' then
    SongServerCon.Params.Values['DSAuthenticationUser'] := 'SENHA'
  else
    SongServerCon.Params.Values['DSAuthenticationPassword'] := qConfigSENHA.AsString;

  try
    SongServerCon.Open;
  except
    on e: Exception do
      begin
        if TRegEx.IsMatch(e.message, 'Authentication manager rejected user credentials', [roIgnoreCase]) then
          raise Exception.Create('O Usuário/Senha de acesso ao SONG incorreto.');

        SongServerCon.Close;
        SongServerCon.Params.Values['hostname'] := qConfigHOST_SERVIDOR_EXTERNO.AsString;
        try
          SongServerCon.Open;
        except
          on ex: Exception do
            begin
              if TRegEx.IsMatch(e.message, 'Authentication manager rejected user credentials', [roIgnoreCase]) then
                raise Exception.Create('O Usuário/Senha de acesso ao SONG incorreto.')
              else
                raise Exception.Create('Não foi possível conectar ao servidor. Detalhes: ' + ex.message);

            end;
        end;
      end;
  end;

  SongServerCon.Params.Delete(SongServerCon.Params.IndexOfName('ConnectTimeout'));
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
