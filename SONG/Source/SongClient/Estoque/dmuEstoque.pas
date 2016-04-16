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
    cdsCompra: TRFClientDataSet;
    cdsCompraID: TIntegerField;
    cdsCompraID_FORNECEDOR: TIntegerField;
    cdsCompraID_CONTA_PAGAR: TIntegerField;
    cdsCompraID_PESSOA_COMPROU: TIntegerField;
    cdsCompraDATA: TSQLTimeStampField;
    cdsCompraSTATUS_ENTREGA: TSmallintField;
    cdsCompraVALOR_FRETE: TBCDField;
    cdsCompraCODIGO_RASTREIO: TStringField;
    cdsCompraDESCRICAO: TStringField;
    cdsCompraFORNECEDOR: TStringField;
    cdsCompraPESSOA_COMPROU: TStringField;
    cdsCompra_Item: TRFClientDataSet;
    cdsCompra_ItemID: TIntegerField;
    cdsCompra_ItemID_COMPRA: TIntegerField;
    cdsCompra_ItemID_ITEM: TIntegerField;
    cdsCompra_ItemID_ESPECIE: TIntegerField;
    cdsCompra_ItemQTDE: TBCDField;
    cdsCompra_ItemVALOR_UNITARIO: TBCDField;
    cdsCompra_ItemITEM: TStringField;
    cdsCompra_ItemESPECIE: TStringField;
    dsCompra: TDataSource;
    cdsCompraVALOR_TOTAL: TBCDField;
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
