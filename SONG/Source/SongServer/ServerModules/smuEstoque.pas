unit smuEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, dmuPrincipal,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uQuery, uUtils, uClientDataSet, uSQLGenerator;

type
  TsmEstoque = class(TsmBasico)
    qItem: TRFQuery;
    qItemID: TIntegerField;
    qItemNOME: TStringField;
    qItemTIPO: TSmallintField;
    qEntrada: TRFQuery;
    qEntradaID: TIntegerField;
    qEntradaDATA: TSQLTimeStampField;
    qItemUNIDADE: TStringField;
    qSolicitacao_Compra: TRFQuery;
    qSolicitacao_CompraID: TIntegerField;
    qSolicitacao_CompraID_PESSOA_SOLICITOU: TIntegerField;
    qSolicitacao_CompraID_PESSOA_ANALISOU: TIntegerField;
    qSolicitacao_CompraDATA: TSQLTimeStampField;
    qSolicitacao_CompraDATA_ANALISE: TSQLTimeStampField;
    qSolicitacao_CompraSTATUS: TSmallintField;
    qSolicitacao_CompraSOLICITANTE: TStringField;
    qSolicitacao_CompraRESPONSAVEL_ANALISE: TStringField;
    qSolicitacao_Compra_Item: TRFQuery;
    qSolicitacao_Compra_ItemID: TIntegerField;
    qSolicitacao_Compra_ItemID_SOLICITACAO_COMPRA: TIntegerField;
    qSolicitacao_Compra_ItemID_ITEM: TIntegerField;
    qSolicitacao_Compra_ItemID_ESPECIE: TIntegerField;
    qSolicitacao_Compra_ItemQTDE: TBCDField;
    qSolicitacao_Compra_ItemNOME_ITEM: TStringField;
    qSolicitacao_Compra_ItemESPECIE: TStringField;
    qSolicitacao_CompraOBSERVACAO: TStringField;
    qCompra: TRFQuery;
    qCompraID: TIntegerField;
    qCompraID_FORNECEDOR: TIntegerField;
    qCompraID_PESSOA_COMPROU: TIntegerField;
    qCompraDATA: TSQLTimeStampField;
    qCompraSTATUS_ENTREGA: TSmallintField;
    qCompraVALOR_FRETE: TBCDField;
    qCompraCODIGO_RASTREIO: TStringField;
    qCompraDESCRICAO: TStringField;
    qCompraFORNECEDOR: TStringField;
    qCompraPESSOA_COMPROU: TStringField;
    qCompra_Item: TRFQuery;
    qCompra_ItemID: TIntegerField;
    qCompra_ItemID_COMPRA: TIntegerField;
    qCompra_ItemID_ITEM: TIntegerField;
    qCompra_ItemID_ESPECIE: TIntegerField;
    qCompra_ItemQTDE: TBCDField;
    qCompra_ItemVALOR_UNITARIO: TBCDField;
    qCompra_ItemITEM: TStringField;
    qCompra_ItemESPECIE: TStringField;
    qCompraVALOR_TOTAL: TBCDField;
    qEntrada_Item: TRFQuery;
    qEntrada_ItemID: TIntegerField;
    qEntrada_ItemID_ENTRADA: TIntegerField;
    qEntrada_ItemID_ITEM: TIntegerField;
    qEntrada_ItemQTDE: TBCDField;
    qEntrada_ItemNOME_ITEM: TStringField;
    qCompra_ItemTIPO_ITEM: TSmallintField;
    qCompraID_SOLICITACAO_COMPRA: TIntegerField;
    qEntradaID_PESSOA: TIntegerField;
    qEntradaPESSOA: TStringField;
    qEntrada_ItemID_COMPRA_ITEM: TIntegerField;
    qSaida: TRFQuery;
    qSaidaID: TIntegerField;
    qSaidaID_VENDA: TIntegerField;
    qSaidaDATA: TSQLTimeStampField;
    qSaidaTIPO: TSmallintField;
    qSaida_Item: TRFQuery;
    qSaida_ItemID: TIntegerField;
    qSaida_ItemID_SAIDA: TIntegerField;
    qSaida_ItemID_ITEM: TIntegerField;
    qSaida_ItemID_LOTE_SEMENTE: TIntegerField;
    qSaida_ItemID_LOTE_MUDA: TIntegerField;
    qSaida_ItemQTDE: TBCDField;
    qSaida_ItemNOME_ITEM: TStringField;
    qSaida_ItemLOTE_SEMENTE: TStringField;
    qSaida_ItemLOTE_MUDA: TStringField;
    qSaida_ItemID_ESPECIE: TIntegerField;
    qSaida_ItemNOME_ESPECIE: TStringField;
    qItemSALDO: TBCDField;
  private
  protected
    function fprMontarWhere(ipTabela, ipWhere: string; ipParam: TParam): string; override;
    { Public declarations }
  end;

var
  smEstoque: TsmEstoque;

implementation

{$R *.dfm}

{ TsmEstoque }

function TsmEstoque.fprMontarWhere(ipTabela, ipWhere: string; ipParam: TParam): string;
var
  vaValor, vaOperador: string;
begin
  Result := inherited;
  TUtils.ppuExtrairValorOperadorParametro(ipParam.Text, vaValor, vaOperador, TParametros.coDelimitador);
  if ipTabela = 'ITEM' then
    begin
      if ipParam.Name = TParametros.coTipo then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'TIPO', vaValor.ToInteger, vaOperador);
    end
  else if ipTabela = 'ENTRADA' then
    begin
      if ipParam.Name = TParametros.coItem then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'ENTRADA_ITEM', 'ID_ITEM', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coCompra then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'COMPRA_ITEM', 'ID_COMPRA', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coTipoItem then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'ITEM', 'TIPO', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coData then
        Result := TSQLGenerator.fpuFilterData(Result,ipTabela,'DATA',TUtils.fpuExtrairData(vaValor, 0),TUtils.fpuExtrairData(vaValor, 1),vaOperador);
    end
  else if (ipTabela = 'SOLICITACAO_COMPRA') then
    begin
      if ipParam.Name = TParametros.coData then
        Result := TSQLGenerator.fpuFilterData(Result, ipTabela, 'DATA', TUtils.fpuExtrairData(vaValor, 0), TUtils.fpuExtrairData(vaValor, 1),
          vaOperador)
      else if ipParam.Name = TParametros.coSolicitante then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_PESSOA_SOLICITOU', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coResponsavelAnalise then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_PESSOA_ANALISOU', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coStatus then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'STATUS', TUtils.fpuConverterStringToArrayInteger(vaValor), vaOperador)
      else if ipParam.Name = TParametros.coItem then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'SOLICITACAO_COMPRA_ITEM', 'ID_ITEM', vaValor.ToInteger, vaOperador)
    end
  else if (ipTabela = 'COMPRA') then
    begin
      if ipParam.Name = TParametros.coData then
        Result := TSQLGenerator.fpuFilterData(Result, ipTabela, 'DATA', TUtils.fpuExtrairData(vaValor, 0), TUtils.fpuExtrairData(vaValor, 1),
          vaOperador)
      else if ipParam.Name = TParametros.coComprador then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_PESSOA_COMPROU', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coStatusEntrega then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'STATUS_ENTREGA', TUtils.fpuConverterStringToArrayInteger(vaValor), vaOperador)
      else if ipParam.Name = TParametros.coItem then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'COMPRA_ITEM', 'ID_ITEM', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coCodigoRastreio then
        Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'CODIGO_RASTREIO', vaValor, vaOperador)
      else if ipParam.Name = TParametros.coFornecedor then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_FORNECEDOR', vaValor.ToInteger, vaOperador)
    end
  else if (ipTabela = 'SAIDA') then
    begin
      if ipParam.Name = TParametros.coData then
        Result := TSQLGenerator.fpuFilterData(Result, ipTabela, 'DATA', TUtils.fpuExtrairData(vaValor, 0), TUtils.fpuExtrairData(vaValor, 1), vaOperador)
      else if ipParam.Name = TParametros.coTipo then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'TIPO', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coVenda then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_VENDA', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coItem then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'SAIDA_ITEM', 'ID_ITEM', vaValor.ToInteger, vaOperador);

    end;
end;

end.
