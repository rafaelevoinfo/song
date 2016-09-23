unit dmuRelatorio;

interface

uses
  System.SysUtils, System.Classes, dmuBasico, dmuPrincipal, Data.DB,
  Datasnap.DBClient, uClientDataSet;

type
  TdmRelatorio = class(TdmBasico)
    cdsSaldo_Rubrica: TRFClientDataSet;
    cdsSaldo_RubricaID_RUBRICA: TIntegerField;
    cdsSaldo_RubricaID_PROJETO: TIntegerField;
    cdsSaldo_RubricaNOME_PROJETO: TStringField;
    cdsSaldo_RubricaNOME_RUBRICA: TStringField;
    cdsSaldo_RubricaRECEBIDO: TBCDField;
    cdsSaldo_RubricaGASTO: TFMTBCDField;
    cdsSaldo_RubricaAPROVISIONADO: TFMTBCDField;
    cdsSaldo_RubricaSALDO_REAL: TFMTBCDField;
    dsSaldo_Rubrica: TDataSource;
    cdsSaldo_RubricaORCAMENTO: TBCDField;
    cdsSaldo_Semente_Muda: TRFClientDataSet;
    dsSaldo_Semente_Muda: TDataSource;
    cdsSaldo_Semente_MudaNOME: TStringField;
    cdsSaldo_Semente_MudaNOME_CIENTIFICO: TStringField;
    cdsSaldo_Semente_MudaFAMILIA_BOTANICA: TStringField;
    cdsSaldo_Semente_MudaQTDE_SEMENTE_ESTOQUE: TBCDField;
    cdsTaxas_Especie: TRFClientDataSet;
    cdsTaxas_EspecieID: TIntegerField;
    cdsTaxas_EspecieNOME: TStringField;
    cdsTaxas_EspecieNOME_CIENTIFICO: TStringField;
    cdsTaxas_EspecieFAMILIA_BOTANICA: TStringField;
    cdsTaxas_EspecieTEMPO_GERMINACAO: TIntegerField;
    cdsTaxas_EspecieTEMPO_DESENVOLVIMENTO: TIntegerField;
    cdsTaxas_EspecieTAXA_CLASSIFICACAO: TBCDField;
    cdsTaxas_EspecieTAXA_GERMINACAO: TBCDField;
    cdsSaldo_Semente_MudaQTDE_MUDA_PRONTA: TIntegerField;
    cdsSaldo_Semente_MudaQTDE_MUDA_DESENVOLVIMENTO: TIntegerField;
    cdsTaxas_EspecieQTDE_SEMENTE_ESTOQUE: TBCDField;
    cdsTaxas_EspecieQTDE_MUDA_DESENVOLVIMENTO: TIntegerField;
    cdsTaxas_EspecieQTDE_MUDA_PRONTA: TIntegerField;
    cdsTaxas_EspecieQTDE_SEMENTE_KILO: TIntegerField;
    cdsSaldo_Semente_MudaCALC_TOTAL_MUDA: TIntegerField;
    cdsPatrimonio: TRFClientDataSet;
    cdsPatrimonioIDENTIFICACAO: TStringField;
    cdsPatrimonioNOME_ITEM: TStringField;
    cdsPatrimonioDATA_AQUISICAO: TSQLTimeStampField;
    cdsPatrimonioVALOR_INICIAL: TBCDField;
    cdsPatrimonioLOCALIZACAO: TStringField;
    cdsPatrimonioSTATUS: TSmallintField;
    cdsPatrimonioCALC_VALOR_ATUAL: TBCDField;
    cdsPatrimonioTAXA_DEPRECIACAO_ANUAL: TIntegerField;
    cdsPatrimonioID_ITEM_PATRIMONIO: TIntegerField;
    cdsGasto_Area_Atuacao: TRFClientDataSet;
    cdsGasto_Area_AtuacaoID_AREA_ATUACAO_ORIGEM: TIntegerField;
    cdsGasto_Area_AtuacaoAREA_ATUACAO: TStringField;
    cdsGasto_Area_AtuacaoGASTO: TFMTBCDField;
    cdsGasto_Area_AtuacaoPROJETO: TStringField;
    cdsTrasnferencia_Financeira: TRFClientDataSet;
    cdsTrasnferencia_FinanceiraID: TIntegerField;
    cdsTrasnferencia_FinanceiraID_PESSOA: TIntegerField;
    cdsTrasnferencia_FinanceiraID_FUNDO_ORIGEM: TIntegerField;
    cdsTrasnferencia_FinanceiraFUNDO_ORIGEM: TStringField;
    cdsTrasnferencia_FinanceiraID_FUNDO_DESTINO: TIntegerField;
    cdsTrasnferencia_FinanceiraFUNDO_DESTINO: TStringField;
    cdsTrasnferencia_FinanceiraID_PROJETO_RUBRICA_ORIGEM: TIntegerField;
    cdsTrasnferencia_FinanceiraPROJETO_ORIGEM: TStringField;
    cdsTrasnferencia_FinanceiraRUBRICA_ORIGEM: TStringField;
    cdsTrasnferencia_FinanceiraID_PROJETO_RUBRICA_DESTINO: TIntegerField;
    cdsTrasnferencia_FinanceiraPROJETO_DESTINO: TStringField;
    cdsTrasnferencia_FinanceiraRUBRICA_DESTINO: TStringField;
    cdsTrasnferencia_FinanceiraVALOR: TBCDField;
    cdsTrasnferencia_FinanceiraDATA: TSQLTimeStampField;
    cdsTrasnferencia_FinanceiraTIPO: TSmallintField;
    cdsTrasnferencia_FinanceiraORIGEM: TStringField;
    cdsTrasnferencia_FinanceiraDESTINO: TStringField;
    cdsTrasnferencia_FinanceiraCALC_TIPO: TStringField;
    cdsTrasnferencia_FinanceiraRESPONSAVEL: TStringField;
    cdsGasto_Fornecedor: TRFClientDataSet;
    cdsGasto_FornecedorVALOR_PAGO: TBCDField;
    cdsGasto_FornecedorID_FORNECEDOR: TIntegerField;
    cdsGasto_FornecedorNOME_FANTASIA: TStringField;
    cdsGasto_FornecedorRAZAO_SOCIAL: TStringField;
    cdsGasto_FornecedorCPF_CNPJ: TStringField;
    cdsGasto_FornecedorVALOR_TOTAL: TBCDField;
    cdsGasto_FornecedorDATA_PAGAMENTO: TDateField;
    cdsGasto_Atividade: TRFClientDataSet;
    cdsGasto_AtividadeID: TIntegerField;
    cdsGasto_AtividadeNOME: TStringField;
    cdsGasto_AtividadeID_SOLICITANTE: TIntegerField;
    cdsGasto_AtividadeID_RESPONSAVEL: TIntegerField;
    cdsGasto_AtividadeSOLICITANTE: TStringField;
    cdsGasto_AtividadeRESPONSAVEL: TStringField;
    cdsGasto_AtividadeSTATUS: TSmallintField;
    cdsGasto_AtividadeDATA_INICIAL: TSQLTimeStampField;
    cdsGasto_AtividadeDATA_FINAL: TSQLTimeStampField;
    cdsGasto_AtividadeDESCRICAO: TStringField;
    cdsGasto_AtividadeVALOR: TBCDField;
    cdsGasto_AtividadeVALOR_PAGO: TFMTBCDField;
    cdsGasto_AtividadeCALC_STATUS: TStringField;
    cdsMatriz_Produtiva: TRFClientDataSet;
    cdsMatriz_ProdutivaID_ESPECIE: TIntegerField;
    cdsMatriz_ProdutivaESPECIE: TStringField;
    cdsMatriz_ProdutivaID_MATRIZ: TIntegerField;
    cdsMatriz_ProdutivaMATRIZ: TStringField;
    cdsMatriz_ProdutivaTAXA: TBCDField;
    cdsGasto_Plano_Contas: TRFClientDataSet;
    cdsGasto_Plano_ContasID: TIntegerField;
    cdsGasto_Plano_ContasNOME: TStringField;
    cdsGasto_Plano_ContasID_PROJETO: TIntegerField;
    cdsGasto_Plano_ContasPROJETO: TStringField;
    cdsGasto_Plano_ContasID_FUNDO: TIntegerField;
    cdsGasto_Plano_ContasNOME_FUNDO: TStringField;
    cdsGasto_Plano_ContasID_RUBRICA: TIntegerField;
    cdsGasto_Plano_ContasRUBRICA: TStringField;
    cdsGasto_Plano_ContasVALOR_TOTAL: TBCDField;
    cdsGasto_Plano_ContasVALOR_PAGO: TBCDField;
    cdsGasto_Plano_ContasCALC_ORIGEM: TStringField;
    cdsLote_Muda_Comprado: TRFClientDataSet;
    cdsLote_Semente_Comprado: TRFClientDataSet;
    cdsLote_Semente_CompradoID: TIntegerField;
    cdsLote_Semente_CompradoNOME: TStringField;
    cdsLote_Semente_CompradoID_ESPECIE: TIntegerField;
    cdsLote_Semente_CompradoESPECIE: TStringField;
    cdsLote_Semente_CompradoID_FORNECEDOR: TIntegerField;
    cdsLote_Semente_CompradoFORNECEDOR: TStringField;
    cdsLote_Semente_CompradoQTDE: TBCDField;
    cdsLote_Semente_CompradoVALOR_UNITARIO: TBCDField;
    cdsLote_Semente_CompradoVALOR: TBCDField;
    cdsLote_Semente_CompradoDATA: TDateField;
    cdsLote_Muda_CompradoID: TIntegerField;
    cdsLote_Muda_CompradoNOME: TStringField;
    cdsLote_Muda_CompradoID_ESPECIE: TIntegerField;
    cdsLote_Muda_CompradoESPECIE: TStringField;
    cdsLote_Muda_CompradoID_FORNECEDOR: TIntegerField;
    cdsLote_Muda_CompradoFORNECEDOR: TStringField;
    cdsLote_Muda_CompradoVALOR_UNITARIO: TBCDField;
    cdsLote_Muda_CompradoVALOR: TBCDField;
    cdsLote_Muda_CompradoDATA: TDateField;
    cdsGasto_Plano_Contas_Detalhado: TRFClientDataSet;
    cdsGasto_Plano_Contas_DetalhadoID: TIntegerField;
    cdsGasto_Plano_Contas_DetalhadoNOME: TStringField;
    cdsGasto_Plano_Contas_DetalhadoID_PROJETO: TIntegerField;
    cdsGasto_Plano_Contas_DetalhadoPROJETO: TStringField;
    cdsGasto_Plano_Contas_DetalhadoID_FUNDO: TIntegerField;
    cdsGasto_Plano_Contas_DetalhadoNOME_FUNDO: TStringField;
    cdsGasto_Plano_Contas_DetalhadoID_RUBRICA: TIntegerField;
    cdsGasto_Plano_Contas_DetalhadoRUBRICA: TStringField;
    cdsGasto_Plano_Contas_DetalhadoDESCRICAO: TStringField;
    cdsGasto_Plano_Contas_DetalhadoVALOR_TOTAL: TBCDField;
    cdsGasto_Plano_Contas_DetalhadoVALOR_PAGO: TBCDField;
    cdsGasto_Plano_Contas_DetalhadoCALC_ORIGEM: TStringField;
    cdsLote_Muda_CompradoQTDE: TBCDField;
    cdsLote_Semente_Vendido: TRFClientDataSet;
    cdsLote_Muda_Vendido: TRFClientDataSet;
    cdsLote_Muda_VendidoID: TIntegerField;
    cdsLote_Muda_VendidoNOME: TStringField;
    cdsLote_Muda_VendidoID_ESPECIE: TIntegerField;
    cdsLote_Muda_VendidoESPECIE: TStringField;
    cdsLote_Muda_VendidoID_CLIENTE: TIntegerField;
    cdsLote_Muda_VendidoQTDE: TBCDField;
    cdsLote_Muda_VendidoVALOR_UNITARIO: TBCDField;
    cdsLote_Muda_VendidoVALOR: TBCDField;
    cdsLote_Muda_VendidoDATA: TDateField;
    cdsLote_Muda_VendidoCLIENTE: TStringField;
    cdsLote_Semente_VendidoID: TIntegerField;
    cdsLote_Semente_VendidoNOME: TStringField;
    cdsLote_Semente_VendidoID_ESPECIE: TIntegerField;
    cdsLote_Semente_VendidoESPECIE: TStringField;
    cdsLote_Semente_VendidoID_CLIENTE: TIntegerField;
    cdsLote_Semente_VendidoQTDE: TBCDField;
    cdsLote_Semente_VendidoVALOR_UNITARIO: TBCDField;
    cdsLote_Semente_VendidoVALOR: TBCDField;
    cdsLote_Semente_VendidoDATA: TDateField;
    cdsLote_Semente_VendidoCLIENTE: TStringField;
    cdsView_Movimentacao_Financeira: TRFClientDataSet;
    cdsView_Movimentacao_FinanceiraID_MOVIMENTACAO: TIntegerField;
    cdsView_Movimentacao_FinanceiraID_ORGANIZACAO: TIntegerField;
    cdsView_Movimentacao_FinanceiraNOME_ORGANIZACAO: TStringField;
    cdsView_Movimentacao_FinanceiraID_ORIGEM_RECURSO: TIntegerField;
    cdsView_Movimentacao_FinanceiraID_UNICO_ORIGEM_RECURSO: TStringField;
    cdsView_Movimentacao_FinanceiraORIGEM_RECURSO: TStringField;
    cdsView_Movimentacao_FinanceiraTIPO: TIntegerField;
    cdsView_Movimentacao_FinanceiraDESCRICAO_TIPO: TStringField;
    cdsView_Movimentacao_FinanceiraDESCRICAO_MOVIMENTACAO: TStringField;
    cdsView_Movimentacao_FinanceiraDATA: TDateField;
    cdsView_Movimentacao_FinanceiraDATA_PAGAMENTO_RECEBIMENTO: TDateField;
    cdsView_Movimentacao_FinanceiraFORMA_PAGAMENTO_RECEBIMENTO: TIntegerField;
    cdsView_Movimentacao_FinanceiraVALOR_TOTAL: TBCDField;
    cdsView_Movimentacao_FinanceiraVALOR_TOTAL_PAGO_RECEBIDO: TBCDField;
    cdsView_Movimentacao_FinanceiraCALC_VALOR_RESTANTE: TBCDField;
    cdsView_Movimentacao_FinanceiraCALC_SALDO: TBCDField;
    cdsSaldo: TRFClientDataSet;
    cdsSaldoID_ORGANIZACAO: TIntegerField;
    cdsSaldoNOME_ORGANIZACAO: TStringField;
    cdsSaldoID_ORIGEM_RECURSO: TIntegerField;
    cdsSaldoID_UNICO_ORIGEM_RECURSO: TStringField;
    cdsSaldoORIGEM_RECURSO: TStringField;
    cdsSaldoSALDO: TBCDField;
    cdsSaldoTIPO_ORIGEM: TIntegerField;
    cdsView_Movimentacao_FinanceiraCALC_DESCRICAO_FORMA_PGTO: TStringField;
    cdsTubete_Semeado: TRFClientDataSet;
    cdsTubete_SemeadoQTDE_TUBETE: TLargeintField;
    cdsTubete_SemeadoID_ESPECIE: TIntegerField;
    cdsTubete_SemeadoNOME: TStringField;
    cdsTubete_SemeadoNOME_CIENTIFICO: TStringField;
    cdsConta_Pagar: TRFClientDataSet;
    cdsConta_PagarID: TIntegerField;
    cdsConta_PagarID_VINCULO: TIntegerField;
    cdsConta_PagarRAZAO_SOCIAL: TStringField;
    cdsConta_PagarCPF_CNPJ: TStringField;
    cdsConta_PagarNUMERO_DOCUMENTO: TStringField;
    cdsConta_PagarDATA_PAGAMENTO: TDateField;
    cdsConta_PagarVALOR: TBCDField;
    cdsConta_PagarVALOR_PAGO: TBCDField;
    cdsSaldo_Semente_MudaID_FAMILIA_BOTANICA: TIntegerField;
    cdsSaldo_Semente_MudaID: TIntegerField;
    cdsSaldo_Semente_MudaQTDE_FAMILIA: TIntegerField;
    procedure cdsSaldo_Semente_MudaCalcFields(DataSet: TDataSet);
    procedure cdsTrasnferencia_FinanceiraCalcFields(DataSet: TDataSet);
    procedure cdsGasto_AtividadeCalcFields(DataSet: TDataSet);
    procedure cdsGasto_Plano_ContasCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRelatorio: TdmRelatorio;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}


procedure TdmRelatorio.cdsGasto_AtividadeCalcFields(DataSet: TDataSet);
var
  i: Integer;
begin
  inherited;
  for i := 0 to dmPrincipal.repIcbStatusAtividade.Properties.Items.Count - 1 do
    begin
      if dmPrincipal.repIcbStatusAtividade.Properties.Items[i].Value = cdsGasto_AtividadeSTATUS.AsInteger then
        begin
          cdsGasto_AtividadeCALC_STATUS.AsString := dmPrincipal.repIcbStatusAtividade.Properties.Items[i].Description;
          break;
        end;
    end;
end;

procedure TdmRelatorio.cdsGasto_Plano_ContasCalcFields(DataSet: TDataSet);
begin
  inherited;
  if DataSet.FieldByName(cdsGasto_Plano_ContasPROJETO.FieldName).AsString <> '' then
    DataSet.FieldByName(cdsGasto_Plano_ContasCALC_ORIGEM.FieldName).AsString := 'Projeto: ' +
      DataSet.FieldByName(cdsGasto_Plano_ContasPROJETO.FieldName).AsString
  else if DataSet.FieldByName(cdsGasto_Plano_ContasNOME_FUNDO.FieldName).AsString <> '' then
    DataSet.FieldByName(cdsGasto_Plano_ContasCALC_ORIGEM.FieldName).AsString := 'Conta: ' +
      DataSet.FieldByName(cdsGasto_Plano_ContasNOME_FUNDO.FieldName).AsString;

end;

procedure TdmRelatorio.cdsSaldo_Semente_MudaCalcFields(DataSet: TDataSet);
begin
  inherited;
  cdsSaldo_Semente_MudaCALC_TOTAL_MUDA.AsInteger := cdsSaldo_Semente_MudaQTDE_MUDA_DESENVOLVIMENTO.AsInteger +
    cdsSaldo_Semente_MudaQTDE_MUDA_PRONTA.AsInteger;
end;

procedure TdmRelatorio.cdsTrasnferencia_FinanceiraCalcFields(DataSet: TDataSet);
var
  i: Integer;
begin
  inherited;
  for i := 0 to dmPrincipal.repIcbTipoTransferencia.Properties.Items.Count - 1 do
    begin
      if dmPrincipal.repIcbTipoTransferencia.Properties.Items[i].Value = cdsTrasnferencia_FinanceiraTIPO.AsInteger then
        begin
          cdsTrasnferencia_FinanceiraCALC_TIPO.AsString := dmPrincipal.repIcbTipoTransferencia.Properties.Items[i].Description;
          break;
        end;
    end;
end;

end.
