unit dmuEstoque;

interface

uses
  System.SysUtils, System.Classes, dmuBasico, Data.DB, Datasnap.DBClient,
  uClientDataSet, dmuPrincipal;

type
  TdmEstoque = class(TdmBasico)
    cdsItem: TRFClientDataSet;
    cdsItemID: TIntegerField;
    cdsItemNOME: TStringField;
    cdsItemTIPO: TSmallintField;
    cdsEntrada: TRFClientDataSet;
    cdsEntradaID: TIntegerField;
    cdsEntradaID_ITEM: TIntegerField;
    cdsEntradaID_ESPECIE: TIntegerField;
    cdsEntradaID_COMPRA: TIntegerField;
    cdsEntradaQTDE: TBCDField;
    cdsEntradaDATA: TSQLTimeStampField;
    cdsEntradaNOME_ITEM: TStringField;
    cdsEntradaNOME_ESPECIE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEstoque: TdmEstoque;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
