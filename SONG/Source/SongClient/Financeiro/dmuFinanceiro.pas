unit dmuFinanceiro;

interface

uses
  System.SysUtils, System.Classes, dmuBasico, dmuPrincipal, Data.DB,
  Datasnap.DBClient, uClientDataSet;

type
  TdmFinanceiro = class(TdmBasico)
    cdsBanco: TRFClientDataSet;
    cdsBancoID: TIntegerField;
    cdsBancoNOME: TStringField;
    cdsBanco_Conta_Corrente: TRFClientDataSet;
    cdsBanco_Conta_CorrenteID: TIntegerField;
    cdsBanco_Conta_CorrenteID_BANCO: TIntegerField;
    cdsBanco_Conta_CorrenteAGENCIA: TStringField;
    cdsBanco_Conta_CorrenteCONTA: TStringField;
    dsBanco: TDataSource;
    cdsFin_For_Cli: TRFClientDataSet;
    cdsFin_For_CliID: TIntegerField;
    cdsFin_For_CliID_CONTATO: TIntegerField;
    cdsFin_For_CliID_CIDADE: TIntegerField;
    cdsFin_For_CliNOME_FANTASIA: TStringField;
    cdsFin_For_CliRAZAO_SOCIAL: TStringField;
    cdsFin_For_CliENDERECO: TStringField;
    cdsFin_For_CliBAIRRO: TStringField;
    cdsFin_For_CliCOMPLEMENTO: TStringField;
    cdsFin_For_CliTIPO: TIntegerField;
    cdsFin_For_CliTELEFONE: TStringField;
    cdsFin_For_CliCELULAR: TStringField;
    cdsFin_For_CliEMAIL: TStringField;
    cdsFin_For_CliSITE: TStringField;
    cdsFin_For_CliCPF_CNPJ: TStringField;
    cdsFin_For_CliINSCRICAO_ESTADUAL: TStringField;
    cdsFin_For_CliINSCRICAO_MUNICIPAL: TStringField;
    cdsFin_For_CliRAMO_ATIVIDADE: TStringField;
    cdsFin_For_CliOBSERVACAO: TStringField;
    cdsFin_For_CliCARGO_CONTATO: TStringField;
    cdsPlano_Contas: TRFClientDataSet;
    cdsPlano_ContasID: TIntegerField;
    cdsPlano_ContasNOME: TStringField;
    cdsPlano_ContasIDENTIFICADOR: TStringField;
    cdsPlano_ContasTIPO: TSmallintField;
    cdsPlano_ContasID_CONTA_PAI: TIntegerField;
    cdsRubrica: TRFClientDataSet;
    cdsRubricaID: TIntegerField;
    cdsRubricaNOME: TStringField;
    cdsRubricaID_RUBRICA_PAI: TIntegerField;
    cdsRubricaIDENTIFICADOR: TStringField;
    cdsConta_Pagar: TRFClientDataSet;
    cdsConta_PagarID: TIntegerField;
    cdsConta_PagarID_FORNECEDOR: TIntegerField;
    cdsConta_PagarID_PLANO_CONTAS: TIntegerField;
    cdsConta_PagarID_CONTA_CORRENTE: TIntegerField;
    cdsConta_PagarDESCRICAO: TStringField;
    cdsConta_PagarVALOR_TOTAL: TBCDField;
    cdsConta_PagarFORMA_PAGTO: TSmallintField;
    cdsConta_PagarOBSERVACAO: TStringField;
    cdsConta_PagarFORNECEDOR: TStringField;
    cdsConta_PagarPLANO_CONTAS: TStringField;
    cdsConta_PagarCONTA_CORRENTE: TStringField;
    cdsConta_Pagar_Parcela: TRFClientDataSet;
    cdsConta_Pagar_ParcelaID: TIntegerField;
    cdsConta_Pagar_ParcelaID_CONTA_PAGAR: TIntegerField;
    cdsConta_Pagar_ParcelaVENCIMENTO: TDateField;
    cdsConta_Pagar_ParcelaVALOR: TBCDField;
    cdsConta_Pagar_ParcelaPARCELA: TSmallintField;
    dsConta_Pagar: TDataSource;
    cdsConta_Pagar_ParcelaSTATUS: TSmallintField;
    cdsConta_Pagar_ParcelaDATA_PAGAMENTO: TDateField;
    cdsConta_Receber: TRFClientDataSet;
    cdsConta_ReceberID: TIntegerField;
    cdsConta_ReceberID_CLIENTE_FINANCIADOR: TIntegerField;
    cdsConta_ReceberID_PLANO_CONTAS: TIntegerField;
    cdsConta_ReceberID_CONTA_CORRENTE: TIntegerField;
    cdsConta_ReceberDESCRICAO: TStringField;
    cdsConta_ReceberVALOR_TOTAL: TBCDField;
    cdsConta_ReceberFORMA_PAGTO: TSmallintField;
    cdsConta_ReceberOBSERVACAO: TStringField;
    cdsConta_ReceberTIPO: TIntegerField;
    cdsConta_ReceberNOME_FANTASIA: TStringField;
    cdsConta_ReceberPLANO_CONTAS: TStringField;
    cdsConta_ReceberCONTA_CORRENTE: TStringField;
    cdsConta_Receber_Parcela: TRFClientDataSet;
    cdsConta_Receber_ParcelaID: TIntegerField;
    cdsConta_Receber_ParcelaID_CONTA_RECEBER: TIntegerField;
    cdsConta_Receber_ParcelaVENCIMENTO: TDateField;
    cdsConta_Receber_ParcelaVALOR: TBCDField;
    cdsConta_Receber_ParcelaPARCELA: TSmallintField;
    cdsConta_Receber_ParcelaSTATUS: TSmallintField;
    cdsConta_Receber_ParcelaDATA_RECEBIMENTO: TDateField;
    dsConta_Receber: TDataSource;
    cdsConta_PagarNUMERO_DOCUMENTO: TStringField;
    cdsConta_ReceberNUMERO_DOCUMENTO: TStringField;
    cdsConta_PagarID_COMPRA: TIntegerField;
    cdsConta_Pagar_Vinculo: TRFClientDataSet;
    cdsConta_Pagar_VinculoID: TIntegerField;
    cdsConta_Pagar_VinculoID_CONTA_PAGAR: TIntegerField;
    cdsConta_Pagar_VinculoID_FUNDO: TIntegerField;
    cdsConta_Pagar_VinculoNOME_FUNDO: TStringField;
    cdsConta_Pagar_VinculoID_PROJETO_ORIGEM: TIntegerField;
    cdsConta_Pagar_VinculoPROJETO_ORIGEM: TStringField;
    cdsConta_Pagar_VinculoID_ATIVIDADE_ORIGEM: TIntegerField;
    cdsConta_Pagar_VinculoATIVIDADE_ORIGEM: TStringField;
    cdsConta_Pagar_VinculoID_RUBRICA_ORIGEM: TIntegerField;
    cdsConta_Pagar_VinculoRUBRICA_ORIGEM: TStringField;
    cdsConta_Pagar_VinculoID_AREA_ATUACAO_ORIGEM: TIntegerField;
    cdsConta_Pagar_VinculoAREA_ATUACAO_ORIGEM: TStringField;
    cdsConta_Pagar_VinculoID_PROJETO_ALOCADO: TIntegerField;
    cdsConta_Pagar_VinculoPROJETO_ALOCADO: TStringField;
    cdsConta_Pagar_VinculoID_ATIVIDADE_ALOCADO: TIntegerField;
    cdsConta_Pagar_VinculoATIVIDADE_ALOCADA: TStringField;
    cdsConta_Pagar_VinculoID_RUBRICA_ALOCADO: TIntegerField;
    cdsConta_Pagar_VinculoRUBRICA_ALOCADA: TStringField;
    cdsConta_Pagar_VinculoID_AREA_ATUACAO_ALOCADO: TIntegerField;
    cdsConta_Pagar_VinculoAREA_ATUACAO_ALOCADA: TStringField;
    cdsConta_Pagar_VinculoVALOR: TBCDField;
    cdsConta_Receber_Vinculo: TRFClientDataSet;
    cdsConta_Receber_VinculoID: TIntegerField;
    cdsConta_Receber_VinculoID_CONTA_RECEBER: TIntegerField;
    cdsConta_Receber_VinculoID_FUNDO: TIntegerField;
    cdsConta_Receber_VinculoVALOR: TBCDField;
    cdsConta_Receber_VinculoFUNDO: TStringField;
    cdsConta_Pagar_VinculoID_ORGANIZACAO_ORIGEM: TIntegerField;
    cdsConta_Pagar_VinculoNOME_ORGANIZACAO: TStringField;
    cdsConta_PagarID_RESPONSAVEL: TIntegerField;
    cdsConta_PagarNOME_RESPONSAVEL: TStringField;
    cdsFin_For_CliCEP: TStringField;
    cdsTransferencia_Financeira: TRFClientDataSet;
    cdsTransferencia_FinanceiraID: TIntegerField;
    cdsTransferencia_FinanceiraID_FUNDO_ORIGEM: TIntegerField;
    cdsTransferencia_FinanceiraID_FUNDO_DESTINO: TIntegerField;
    cdsTransferencia_FinanceiraID_PROJETO_RUBRICA_ORIGEM: TIntegerField;
    cdsTransferencia_FinanceiraID_PROJETO_RUBRICA_DESTINO: TIntegerField;
    cdsTransferencia_FinanceiraVALOR: TBCDField;
    cdsTransferencia_FinanceiraFUNDO_ORIGEM: TStringField;
    cdsTransferencia_FinanceiraFUNDO_DESTINO: TStringField;
    cdsTransferencia_FinanceiraRUBRICA_ORIGEM: TStringField;
    cdsTransferencia_FinanceiraRUBRICA_DESTINO: TStringField;
    cdsTransferencia_FinanceiraORIGEM: TStringField;
    cdsTransferencia_FinanceiraDESTINO: TStringField;
    cdsTransferencia_FinanceiraID_PESSOA: TIntegerField;
    cdsTransferencia_FinanceiraRESPONSAVEL: TStringField;
    cdsTransferencia_FinanceiraDATA: TSQLTimeStampField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFinanceiro: TdmFinanceiro;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
