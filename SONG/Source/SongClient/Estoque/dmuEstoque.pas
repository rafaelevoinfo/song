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
    cdsEntradaDATA: TSQLTimeStampField;
    cdsItemUNIDADE: TStringField;
    cdsSolicitacao_Compra: TRFClientDataSet;
    cdsSolicitacao_CompraID: TIntegerField;
    cdsSolicitacao_CompraID_PESSOA_SOLICITOU: TIntegerField;
    cdsSolicitacao_CompraID_PESSOA_ANALISOU: TIntegerField;
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
    cdsEntrada_Item: TRFClientDataSet;
    dsEntrada: TDataSource;
    cdsEntrada_ItemID: TIntegerField;
    cdsEntrada_ItemID_ENTRADA: TIntegerField;
    cdsEntrada_ItemID_ITEM: TIntegerField;
    cdsEntrada_ItemQTDE: TBCDField;
    cdsEntrada_ItemNOME_ITEM: TStringField;
    cdsCompra_ItemTIPO_ITEM: TSmallintField;
    cdsCompraID_SOLICITACAO_COMPRA: TIntegerField;
    cdsEntradaID_PESSOA: TIntegerField;
    cdsEntradaPESSOA: TStringField;
    cdsEntrada_ItemID_COMPRA_ITEM: TIntegerField;
    cdsSaida: TRFClientDataSet;
    cdsSaidaID: TIntegerField;
    cdsSaidaDATA: TSQLTimeStampField;
    cdsSaidaTIPO: TSmallintField;
    cdsSaida_Item: TRFClientDataSet;
    cdsSaida_ItemID: TIntegerField;
    cdsSaida_ItemID_SAIDA: TIntegerField;
    cdsSaida_ItemID_ITEM: TIntegerField;
    cdsSaida_ItemID_LOTE_SEMENTE: TIntegerField;
    cdsSaida_ItemID_LOTE_MUDA: TIntegerField;
    cdsSaida_ItemQTDE: TBCDField;
    cdsSaida_ItemNOME_ITEM: TStringField;
    cdsSaida_ItemLOTE_SEMENTE: TStringField;
    cdsSaida_ItemLOTE_MUDA: TStringField;
    dsSaida: TDataSource;
    cdsSaida_ItemID_ESPECIE: TIntegerField;
    cdsSaida_ItemNOME_ESPECIE: TStringField;
    cdsItemSALDO: TBCDField;
    cdsItemCALC_SALDO: TStringField;
    cdsVenda: TRFClientDataSet;
    cdsVendaID: TIntegerField;
    cdsVendaID_CLIENTE: TIntegerField;
    cdsVendaID_PESSOA_VENDEU: TIntegerField;
    cdsVendaDATA: TSQLTimeStampField;
    cdsVendaDESCRICAO: TIntegerField;
    cdsVendaCLIENTE: TStringField;
    cdsVendaVENDEDOR: TStringField;
    cdsVenda_Item: TRFClientDataSet;
    cdsVenda_ItemID: TIntegerField;
    cdsVenda_ItemID_VENDA: TIntegerField;
    cdsVenda_ItemID_ITEM: TIntegerField;
    cdsVenda_ItemID_ESPECIE: TIntegerField;
    cdsVenda_ItemQTDE: TBCDField;
    cdsVenda_ItemVALOR_UNITARIO: TBCDField;
    cdsVenda_ItemITEM: TStringField;
    cdsVenda_ItemESPECIE: TStringField;
    cdsVendaVALOR_TOTAL: TBCDField;
    cdsSaida_ItemID_VENDA_ITEM: TIntegerField;
    cdsVenda_ItemID_LOTE_SEMENTE: TIntegerField;
    cdsVenda_ItemLOTE_SEMENTE: TStringField;
    cdsVenda_ItemID_LOTE_MUDA: TIntegerField;
    cdsVenda_ItemLOTE_MUDA: TStringField;
    dsVenda: TDataSource;
    procedure cdsItemCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEstoque: TdmEstoque;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}


procedure TdmEstoque.cdsItemCalcFields(DataSet: TDataSet);
begin
  inherited;
  cdsItemCALC_SALDO.AsString := FormatFloat(',0.00', cdsItemSALDO.AsFloat) + ' ' + cdsItemUNIDADE.AsString;
end;

end.
