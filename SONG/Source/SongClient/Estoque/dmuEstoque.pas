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
    cdsEntradaID_COMPRA: TIntegerField;
    cdsEntradaQTDE: TBCDField;
    cdsEntradaDATA: TSQLTimeStampField;
    cdsEntradaNOME_ITEM: TStringField;
    cdsItemUNIDADE: TStringField;
    cdsSolicitacao_Compra: TRFClientDataSet;
    cdsSolicitacao_CompraID: TIntegerField;
    cdsSolicitacao_CompraID_PESSOA_SOLICITOU: TIntegerField;
    cdsSolicitacao_CompraID_PESSOA_ANALISOU: TIntegerField;
    cdsSolicitacao_CompraID_COMPRA: TIntegerField;
    cdsSolicitacao_CompraDATA: TSQLTimeStampField;
    cdsSolicitacao_CompraDATA_ANALISE: TSQLTimeStampField;
    cdsSolicitacao_CompraSTATUS: TSmallintField;
    cdsSolicitacao_CompraSOLICITANTE: TStringField;
    cdsSolicitacao_CompraRESPONSAVEL_ANALISE: TStringField;
    cdsSolicitacao_Compra_Item: TRFClientDataSet;
    cdsSolicitacao_Compra_ItemID: TIntegerField;
    cdsSolicitacao_Compra_ItemID_SOLICITACAO_COMPRA: TIntegerField;
    cdsSolicitacao_Compra_ItemID_ITEM: TIntegerField;
    cdsSolicitacao_Compra_ItemID_ESPECIE: TIntegerField;
    cdsSolicitacao_Compra_ItemQTDE: TBCDField;
    cdsSolicitacao_Compra_ItemNOME_ITEM: TStringField;
    cdsSolicitacao_Compra_ItemESPECIE: TStringField;
    cdsSolicitacao_CompraOBSERVACAO: TStringField;
    dsSolicitacao_Compra: TDataSource;
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
