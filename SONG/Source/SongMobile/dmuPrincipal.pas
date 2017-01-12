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
  Datasnap.DSMetadata, Datasnap.DSConnectionMetaDataProvider, uFuncoes;

type
  TdmPrincipal = class(TDataModule)
    Connection: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    DataSnapConn: TRFSQLConnection;
    ProxyGenerator: TDSProxyGenerator;
    DSConnectionMetaDataProvider1: TDSConnectionMetaDataProvider;
    procedure ConnectionBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataSnapConnAfterConnect(Sender: TObject);
    procedure DataSnapConnAfterDisconnect(Sender: TObject);
  private
    FFuncoesViveiro: TSMFuncoesViveiroClient;
    { Private declarations }
  public
    property FuncoesViveiro: TSMFuncoesViveiroClient read FFuncoesViveiro;
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

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
  Connection.Open();

end;

procedure TdmPrincipal.DataSnapConnAfterConnect(Sender: TObject);
begin
  FFuncoesViveiro := TSMFuncoesViveiroClient.Create(DataSnapConn.DBXConnection);
end;

procedure TdmPrincipal.DataSnapConnAfterDisconnect(Sender: TObject);
begin
  if Assigned(FFuncoesViveiro) then
    begin
      FreeAndNil(FFuncoesViveiro);
    end;
end;

end.
