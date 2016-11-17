unit dmuPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, Data.DB, FireDAC.Comp.Client,
  System.IOUtils, FireDAC.FMXUI.Wait, FireDAC.Comp.UI;

type
  TdmPrincipal = class(TDataModule)
    Connection: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure ConnectionBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
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

end.
