unit dmuPrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, IPPeerClient,
  Data.DBXCommon, Data.DB, Data.SqlExpr, dxSkinsCore, dxSkinBlack, cxClasses,
  cxLookAndFeels, dxSkinsForm;

type
  TdmPrincipal = class(TDataModule)
    DataSnapConn: TSQLConnection;
    dxSkinController1: TdxSkinController;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
