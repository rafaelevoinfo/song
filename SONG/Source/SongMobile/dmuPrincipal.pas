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
  FireDAC.Comp.DataSet, uQuery;

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
    procedure ConnectionBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure SongServerConAfterConnect(Sender: TObject);
    procedure SongServerConAfterDisconnect(Sender: TObject);
  private
    FFuncoesViveiro: TSMFuncoesViveiroClient;

    { Private declarations }
  public
    property FuncoesViveiro: TSMFuncoesViveiroClient read FFuncoesViveiro;
    procedure ppuAbrirConfig;
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

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
  Connection.Open();
  ppuAbrirConfig;
end;

procedure TdmPrincipal.ppuConectarServidor;
begin
  SongServerCon.Close;
  SongServerCon.Params.Values['ConnectTimeout'] := '3000';
  if not qConfig.Eof then
    SongServerCon.Params.Values['hostname'] := qConfigHOST_SERVIDOR_INTERNO.AsString;

  try
    SongServerCon.Open;
  except
     SongServerCon.Params.Values['hostname'] := qConfigHOST_SERVIDOR_EXTERNO.AsString;
     try
       SongServerCon.Open;
     except
      raise Exception.Create('Não foi possível conectar ao servidor.');
     end;
  end;

  SongServerCon.Params.Delete(SongServerCon.Params.IndexOfName('ConnectTimeout'));
end;

procedure TdmPrincipal.SongServerConAfterConnect(Sender: TObject);
begin
  FFuncoesViveiro := TSMFuncoesViveiroClient.Create(SongServerCon.DBXConnection);
end;

procedure TdmPrincipal.SongServerConAfterDisconnect(Sender: TObject);
begin
  if Assigned(FFuncoesViveiro) then
    begin
      FreeAndNil(FFuncoesViveiro);
    end;
end;

end.
