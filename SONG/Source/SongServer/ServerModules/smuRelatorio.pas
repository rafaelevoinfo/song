unit smuRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery,
  Datasnap.DBClient, uClientDataSet, uUtils, uSQLGenerator, uTypes,
  System.DateUtils;

type
  TsmRelatorio = class(TsmBasico)
    qSaldo_Rubrica: TRFQuery;
    qSaldo_RubricaID_RUBRICA: TIntegerField;
    qSaldo_RubricaID_PROJETO: TIntegerField;
    qSaldo_RubricaNOME_PROJETO: TStringField;
    qSaldo_RubricaNOME_RUBRICA: TStringField;
    qSaldo_Semente_Muda: TRFQuery;
    qSaldo_Semente_MudaNOME: TStringField;
    qSaldo_Semente_MudaNOME_CIENTIFICO: TStringField;
    qSaldo_Semente_MudaFAMILIA_BOTANICA: TStringField;
    qSaldo_Semente_MudaQTDE_SEMENTE_ESTOQUE: TBCDField;
    qTaxas_Especie: TRFQuery;
    qTaxas_EspecieID: TIntegerField;
    qTaxas_EspecieNOME: TStringField;
    qTaxas_EspecieNOME_CIENTIFICO: TStringField;
    qTaxas_EspecieFAMILIA_BOTANICA: TStringField;
    qTaxas_EspecieTEMPO_GERMINACAO: TIntegerField;
    qTaxas_EspecieTEMPO_DESENVOLVIMENTO: TIntegerField;
    qTaxas_EspecieTAXA_CLASSIFICACAO: TBCDField;
    qTaxas_EspecieTAXA_GERMINACAO: TBCDField;
    qSaldo_Semente_MudaQTDE_MUDA_PRONTA: TIntegerField;
    qSaldo_Semente_MudaQTDE_MUDA_DESENVOLVIMENTO: TIntegerField;
    qTaxas_EspecieQTDE_SEMENTE_ESTOQUE: TBCDField;
    qTaxas_EspecieQTDE_MUDA_DESENVOLVIMENTO: TIntegerField;
    qTaxas_EspecieQTDE_MUDA_PRONTA: TIntegerField;
    qTaxas_EspecieQTDE_SEMENTE_KILO: TIntegerField;
    qPatrimonio: TRFQuery;
    qPatrimonioIDENTIFICACAO: TStringField;
    qPatrimonioNOME_ITEM: TStringField;
    qPatrimonioDATA_AQUISICAO: TSQLTimeStampField;
    qPatrimonioVALOR_INICIAL: TBCDField;
    qPatrimonioLOCALIZACAO: TStringField;
    qPatrimonioSTATUS: TSmallintField;
    qPatrimonioCALC_VALOR_ATUAL: TBCDField;
    qPatrimonioTAXA_DEPRECIACAO_ANUAL: TIntegerField;
    qPatrimonioID_ITEM_PATRIMONIO: TIntegerField;
    qGasto_Area_Atuacao: TRFQuery;
    qGasto_Area_AtuacaoID_AREA_ATUACAO_ORIGEM: TIntegerField;
    qGasto_Area_AtuacaoAREA_ATUACAO: TStringField;
    qGasto_Area_AtuacaoGASTO: TBCDField;
    qGasto_Area_AtuacaoPROJETO: TStringField;
    qTransferencia_Financeira: TRFQuery;
    qTransferencia_FinanceiraID: TIntegerField;
    qTransferencia_FinanceiraID_PESSOA: TIntegerField;
    qTransferencia_FinanceiraID_FUNDO_ORIGEM: TIntegerField;
    qTransferencia_FinanceiraFUNDO_ORIGEM: TStringField;
    qTransferencia_FinanceiraID_FUNDO_DESTINO: TIntegerField;
    qTransferencia_FinanceiraFUNDO_DESTINO: TStringField;
    qTransferencia_FinanceiraID_PROJETO_RUBRICA_ORIGEM: TIntegerField;
    qTransferencia_FinanceiraPROJETO_ORIGEM: TStringField;
    qTransferencia_FinanceiraRUBRICA_ORIGEM: TStringField;
    qTransferencia_FinanceiraID_PROJETO_RUBRICA_DESTINO: TIntegerField;
    qTransferencia_FinanceiraPROJETO_DESTINO: TStringField;
    qTransferencia_FinanceiraRUBRICA_DESTINO: TStringField;
    qTransferencia_FinanceiraVALOR: TBCDField;
    qTransferencia_FinanceiraDATA: TSQLTimeStampField;
    qTransferencia_FinanceiraTIPO: TSmallintField;
    qTransferencia_FinanceiraORIGEM: TStringField;
    qTransferencia_FinanceiraDESTINO: TStringField;
    qTransferencia_FinanceiraRESPONSAVEL: TStringField;
    qGasto_Fornecedor: TRFQuery;
    qGasto_FornecedorVALOR_PAGO: TBCDField;
    qGasto_FornecedorID_FORNECEDOR: TIntegerField;
    qGasto_FornecedorNOME_FANTASIA: TStringField;
    qGasto_FornecedorRAZAO_SOCIAL: TStringField;
    qGasto_FornecedorCPF_CNPJ: TStringField;
    qGasto_FornecedorVALOR_TOTAL: TBCDField;
    qGasto_FornecedorDATA_PAGAMENTO: TDateField;
    qGasto_Atividade: TRFQuery;
    qGasto_AtividadeID: TIntegerField;
    qGasto_AtividadeNOME: TStringField;
    qGasto_AtividadeID_SOLICITANTE: TIntegerField;
    qGasto_AtividadeID_RESPONSAVEL: TIntegerField;
    qGasto_AtividadeSOLICITANTE: TStringField;
    qGasto_AtividadeRESPONSAVEL: TStringField;
    qGasto_AtividadeSTATUS: TSmallintField;
    qGasto_AtividadeDATA_INICIAL: TSQLTimeStampField;
    qGasto_AtividadeDATA_FINAL: TSQLTimeStampField;
    qGasto_AtividadeDESCRICAO: TStringField;
    qGasto_AtividadeVALOR: TBCDField;
    qGasto_AtividadeVALOR_PAGO: TBCDField;
    qMatriz_Produtiva: TRFQuery;
    qMatriz_ProdutivaID_ESPECIE: TIntegerField;
    qMatriz_ProdutivaESPECIE: TStringField;
    qMatriz_ProdutivaID_MATRIZ: TIntegerField;
    qMatriz_ProdutivaMATRIZ: TStringField;
    qMatriz_ProdutivaTAXA: TBCDField;
    qGasto_Plano_Contas: TRFQuery;
    qLote_Muda_Comprado: TRFQuery;
    qLote_Muda_CompradoID: TIntegerField;
    qLote_Muda_CompradoNOME: TStringField;
    qLote_Muda_CompradoID_ESPECIE: TIntegerField;
    qLote_Muda_CompradoESPECIE: TStringField;
    qLote_Muda_CompradoID_FORNECEDOR: TIntegerField;
    qLote_Muda_CompradoFORNECEDOR: TStringField;
    qLote_Muda_CompradoVALOR_UNITARIO: TBCDField;
    qLote_Muda_CompradoVALOR: TBCDField;
    qLote_Semente_Comprado: TRFQuery;
    qLote_Semente_CompradoID: TIntegerField;
    qLote_Semente_CompradoNOME: TStringField;
    qLote_Semente_CompradoID_ESPECIE: TIntegerField;
    qLote_Semente_CompradoESPECIE: TStringField;
    qLote_Semente_CompradoID_FORNECEDOR: TIntegerField;
    qLote_Semente_CompradoFORNECEDOR: TStringField;
    qLote_Semente_CompradoVALOR_UNITARIO: TBCDField;
    qLote_Semente_CompradoVALOR: TBCDField;
    qGasto_Plano_Contas_Detalhado: TRFQuery;
    qGasto_Plano_Contas_DetalhadoID: TIntegerField;
    qGasto_Plano_Contas_DetalhadoNOME: TStringField;
    qGasto_Plano_Contas_DetalhadoID_PROJETO: TIntegerField;
    qGasto_Plano_Contas_DetalhadoPROJETO: TStringField;
    qGasto_Plano_Contas_DetalhadoID_FUNDO: TIntegerField;
    qGasto_Plano_Contas_DetalhadoNOME_FUNDO: TStringField;
    qGasto_Plano_Contas_DetalhadoID_RUBRICA: TIntegerField;
    qGasto_Plano_Contas_DetalhadoRUBRICA: TStringField;
    qGasto_Plano_Contas_DetalhadoDESCRICAO: TStringField;
    qGasto_Plano_Contas_DetalhadoVALOR_TOTAL: TBCDField;
    qGasto_Plano_Contas_DetalhadoVALOR_PAGO: TBCDField;
    qLote_Semente_Vendido: TRFQuery;
    qLote_Muda_Vendido: TRFQuery;
    qLote_Muda_VendidoID: TIntegerField;
    qLote_Muda_VendidoNOME: TStringField;
    qLote_Muda_VendidoID_ESPECIE: TIntegerField;
    qLote_Muda_VendidoESPECIE: TStringField;
    qLote_Muda_VendidoID_CLIENTE: TIntegerField;
    qLote_Muda_VendidoQTDE: TBCDField;
    qLote_Muda_VendidoVALOR_UNITARIO: TBCDField;
    qLote_Muda_VendidoVALOR: TBCDField;
    qLote_Semente_VendidoID: TIntegerField;
    qLote_Semente_VendidoNOME: TStringField;
    qLote_Semente_VendidoID_ESPECIE: TIntegerField;
    qLote_Semente_VendidoESPECIE: TStringField;
    qLote_Semente_VendidoID_CLIENTE: TIntegerField;
    qLote_Semente_VendidoQTDE: TBCDField;
    qLote_Semente_VendidoVALOR_UNITARIO: TBCDField;
    qLote_Semente_VendidoVALOR: TBCDField;
    qLote_Muda_CompradoQTDE: TBCDField;
    qLote_Semente_CompradoQTDE: TBCDField;
    qLote_Muda_VendidoCLIENTE: TStringField;
    qLote_Semente_VendidoCLIENTE: TStringField;
    qView_Movimentacao_Financeira: TRFQuery;
    qView_Movimentacao_FinanceiraID_MOVIMENTACAO: TIntegerField;
    qView_Movimentacao_FinanceiraID_ORGANIZACAO: TIntegerField;
    qView_Movimentacao_FinanceiraNOME_ORGANIZACAO: TStringField;
    qView_Movimentacao_FinanceiraID_ORIGEM_RECURSO: TIntegerField;
    qView_Movimentacao_FinanceiraID_UNICO_ORIGEM_RECURSO: TStringField;
    qView_Movimentacao_FinanceiraORIGEM_RECURSO: TStringField;
    qView_Movimentacao_FinanceiraTIPO: TIntegerField;
    qView_Movimentacao_FinanceiraDESCRICAO_TIPO: TStringField;
    qView_Movimentacao_FinanceiraDESCRICAO_MOVIMENTACAO: TStringField;
    qView_Movimentacao_FinanceiraDATA: TDateField;
    qView_Movimentacao_FinanceiraDATA_PAGAMENTO_RECEBIMENTO: TDateField;
    qView_Movimentacao_FinanceiraFORMA_PAGAMENTO_RECEBIMENTO: TIntegerField;
    qView_Movimentacao_FinanceiraVALOR_TOTAL: TBCDField;
    qView_Movimentacao_FinanceiraVALOR_TOTAL_PAGO_RECEBIDO: TBCDField;
    qView_Movimentacao_FinanceiraCALC_VALOR_RESTANTE: TBCDField;
    qView_Movimentacao_FinanceiraCALC_SALDO: TBCDField;
    qSaldo: TRFQuery;
    qSaldoID_ORGANIZACAO: TIntegerField;
    qSaldoNOME_ORGANIZACAO: TStringField;
    qSaldoID_ORIGEM_RECURSO: TIntegerField;
    qSaldoID_UNICO_ORIGEM_RECURSO: TStringField;
    qSaldoORIGEM_RECURSO: TStringField;
    qSaldoSALDO: TBCDField;
    qSaldoTIPO_ORIGEM: TIntegerField;
    qView_Movimentacao_FinanceiraCALC_DESCRICAO_FORMA_PGTO: TStringField;
    qTubete_Semeado: TRFQuery;
    qTubete_SemeadoQTDE_TUBETE: TLargeintField;
    qTubete_SemeadoID_ESPECIE: TIntegerField;
    qTubete_SemeadoNOME: TStringField;
    qTubete_SemeadoNOME_CIENTIFICO: TStringField;
    qConta_Pagar: TRFQuery;
    qConta_PagarID: TIntegerField;
    qConta_PagarID_VINCULO: TIntegerField;
    qConta_PagarRAZAO_SOCIAL: TStringField;
    qConta_PagarCPF_CNPJ: TStringField;
    qConta_PagarNUMERO_DOCUMENTO: TStringField;
    qConta_PagarDATA_PAGAMENTO: TDateField;
    qConta_PagarVALOR: TBCDField;
    qConta_PagarVALOR_PAGO: TBCDField;
    qSaldo_Semente_MudaID_FAMILIA_BOTANICA: TIntegerField;
    qSaldo_Semente_MudaID: TIntegerField;
    qSaldo_Semente_MudaQTDE_FAMILIA: TIntegerField;
    qSaldo_RubricaORCAMENTO: TBCDField;
    qSaldo_RubricaGASTO: TBCDField;
    qSaldo_RubricaGASTO_TRANSFERENCIA: TBCDField;
    qSaldo_RubricaRECEBIDO_TRANSFERENCIA: TBCDField;
    qSaldo_RubricaAPROVISIONADO: TBCDField;
    qLote_Muda_VendidoCALC_MES: TStringField;
    qLote_Muda_CompradoCALC_MES: TStringField;
    qLote_Semente_CompradoCALC_MES: TStringField;
    qLote_Semente_VendidoCALC_MES: TStringField;
    qLote_Muda_VendidoDATA: TSQLTimeStampField;
    qLote_Semente_VendidoDATA: TSQLTimeStampField;
    qLote_Muda_CompradoDATA: TSQLTimeStampField;
    qLote_Semente_CompradoDATA: TSQLTimeStampField;
    qSaldo_RubricaRECEBIDO: TBCDField;
    qSaldo_RubricaSALDO_REAL: TBCDField;
    procedure qPatrimonioCalcFields(DataSet: TDataSet);
    procedure qView_Movimentacao_FinanceiraCalcFields(DataSet: TDataSet);
    procedure qLote_Muda_VendidoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    function fprMontarWhere(ipTabela, ipWhere: string; ipParam: TParam): string; override;

  end;

var
  smRelatorio: TsmRelatorio;

implementation

uses
  dmuPrincipal;

{$R *.dfm}


function TsmRelatorio.fprMontarWhere(ipTabela, ipWhere: string;
  ipParam: TParam): string;
var
  vaValor, vaOperador: string;
  vaArray: TArray<integer>;
begin
  Result := inherited;
  TUtils.ppuExtrairValorOperadorParametro(ipParam.Text, vaValor, vaOperador, TParametros.coDelimitador);

  if (ipTabela = 'PATRIMONIO') then
    begin
      if ipParam.Name = TParametros.coStatus then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'STATUS', vaValor.ToInteger, vaOperador);
    end
  else if (ipTabela = 'TRANSFERENCIA_FINANCEIRA') then
    begin
      if ipParam.Name = TParametros.coData then
        Result := TSQLGenerator.fpuFilterData(Result, ipTabela, 'DATA', TUtils.fpuExtrairData(vaValor, 0), TUtils.fpuExtrairData(vaValor, 1), vaOperador)
      else if ipParam.Name = TParametros.coTipo then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'TIPO', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coPessoa then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_PESSOA', vaValor.ToInteger, vaOperador)
    end
  else if (ipTabela = 'GASTO_FORNECEDOR') then
    begin
      if ipParam.Name = TParametros.coData then
        Result := TSQLGenerator.fpuFilterDataSemHora(Result, 'CONTA_PAGAR_PARCELA', 'DATA_PAGAMENTO', TUtils.fpuExtrairData(vaValor, 0),
          TUtils.fpuExtrairData(vaValor, 1), vaOperador)
      else if ipParam.Name = TParametros.coFornecedor then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'CONTA_PAGAR', 'ID_FORNECEDOR', vaValor.ToInteger, vaOperador);
    end
  else if (ipTabela = 'GASTO_ATIVIDADE') then
    begin
      if ipParam.Name = TParametros.coProjeto then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'ATIVIDADE', 'ID_PROJETO', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coAtividade then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'ATIVIDADE', 'ID', vaValor.ToInteger, vaOperador)
    end
  else if (ipTabela = 'MATRIZ_PRODUTIVA') then
    begin
      if ipParam.Name = TParametros.coEspecie then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'LOTE_SEMENTE', 'ID_ESPECIE', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coData then
        Result := TSQLGenerator.fpuFilterData(Result, 'LOG', 'DATA_HORA', TUtils.fpuExtrairData(vaValor, 0), TUtils.fpuExtrairData(vaValor, 1), vaOperador)
    end
  else if (ipTabela = 'GASTO_PLANO_CONTAS') or (ipTabela = 'GASTO_PLANO_CONTAS_DETALHADO') then
    begin
      if ipParam.Name = TParametros.coProjeto then
        begin
          if vaValor.ToInteger = -1 then
            Result := Result + ' (Projeto.id is null) ' + vaOperador
          else if vaValor.ToInteger = 0 then
            Result := Result + ' (Projeto.id is not null)' + vaOperador
          else
            Result := TSQLGenerator.fpuFilterInteger(Result, 'PROJETO', 'ID', vaValor.ToInteger, vaOperador)
        end
      else if ipParam.Name = TParametros.coFundo then
        begin
          if vaValor.ToInteger = -1 then
            Result := Result + ' (Fundo.id is null) ' + vaOperador
          else if vaValor.ToInteger = 0 then
            Result := Result + ' (Fundo.id is not null)' + vaOperador
          else
            Result := TSQLGenerator.fpuFilterInteger(Result, 'FUNDO', 'ID', vaValor.ToInteger, vaOperador)
        end
      else if ipParam.Name = TParametros.coPlanoConta then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'PLANO_CONTAS', 'ID', vaValor.ToInteger, vaOperador);
    end
  else if (ipTabela = 'LOTE_SEMENTE_COMPRADO') or (ipTabela = 'LOTE_MUDA_COMPRADO') then
    begin
      if ipParam.Name = TParametros.coData then
        Result := TSQLGenerator.fpuFilterData(Result, 'COMPRA', 'DATA', TUtils.fpuExtrairData(vaValor, 0), TUtils.fpuExtrairData(vaValor, 1), vaOperador)
      else if ipParam.Name = TParametros.coEspecie then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'ESPECIE', 'ID', vaValor.ToInteger, vaOperador);
    end
  else if (ipTabela = 'LOTE_SEMENTE_VENDIDO') or (ipTabela = 'LOTE_MUDA_VENDIDO') then
    begin
      if ipParam.Name = TParametros.coData then
        Result := TSQLGenerator.fpuFilterData(Result, 'VENDA', 'DATA', TUtils.fpuExtrairData(vaValor, 0), TUtils.fpuExtrairData(vaValor, 1), vaOperador)
      else if ipParam.Name = TParametros.coEspecie then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'ESPECIE', 'ID', vaValor.ToInteger, vaOperador);
    end
  else if (ipTabela = 'SALDO') or (ipTabela = 'VIEW_MOVIMENTACAO_FINANCEIRA') then
    begin
      if ipParam.Name = TParametros.coData then
        Result := TSQLGenerator.fpuFilterDataSemHora(Result, 'VIEW_MOVIMENTACAO_FINANCEIRA', 'DATA', TUtils.fpuExtrairData(vaValor, 0),
          TUtils.fpuExtrairData(vaValor, 1), vaOperador)
      else if ipParam.Name = TParametros.coOrganizacao then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'VIEW_MOVIMENTACAO_FINANCEIRA', 'ID_ORGANIZACAO', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coProjeto then
        begin
          if vaValor.ToInteger = -1 then // nao quero q sai nenhum projeto
            Result := '(' + Result + ' (VIEW_MOVIMENTACAO_FINANCEIRA.TIPO_ORIGEM <> ' + Ord(oriProjeto).ToString + '))' + vaOperador
          else if vaValor.ToInteger = 0 then // Todos
            Result := TSQLGenerator.fpuFilterInteger(Result, 'VIEW_MOVIMENTACAO_FINANCEIRA', 'TIPO_ORIGEM', Ord(oriProjeto), vaOperador)
          else
            begin
              Result := '(' + Result + '((VIEW_MOVIMENTACAO_FINANCEIRA.TIPO_ORIGEM = ' + Ord(oriProjeto).ToString + ') AND ';
              Result := Result + ' (VIEW_MOVIMENTACAO_FINANCEIRA.ID_ORIGEM_RECURSO = ' + vaValor + ')))' + vaOperador;
            end;
        end
      else if ipParam.Name = TParametros.coFundo then
        begin
          if vaValor.ToInteger = -1 then // nao quero q sai nenhuma conta no relatorio
            Result := '(' + Result + ' (VIEW_MOVIMENTACAO_FINANCEIRA.TIPO_ORIGEM <> ' + Ord(oriFundo).ToString + ')) ' + vaOperador
          else if vaValor.ToInteger = 0 then // Todos
            Result := TSQLGenerator.fpuFilterInteger(Result, 'VIEW_MOVIMENTACAO_FINANCEIRA', 'TIPO_ORIGEM', Ord(oriFundo), vaOperador)
          else
            begin
              Result := '(' + Result + '((VIEW_MOVIMENTACAO_FINANCEIRA.TIPO_ORIGEM = ' + Ord(oriFundo).ToString + ') AND ';
              Result := Result + ' (VIEW_MOVIMENTACAO_FINANCEIRA.ID_ORIGEM_RECURSO = ' + vaValor + ')))' + vaOperador;
            end;
        end
      else if ipParam.Name = TParametros.coTipo then
        begin
          vaArray := TUtils.fpuConverterStringToArrayInteger(vaValor, TParametros.coDelimitador);
          Result := TSQLGenerator.fpuFilterInteger(Result, 'VIEW_MOVIMENTACAO_FINANCEIRA', 'TIPO', vaArray, vaOperador)
        end
      else if ipParam.Name = TParametros.coAberto then
        Result := '(' + Result + ' (VIEW_MOVIMENTACAO_FINANCEIRA.VALOR_TOTAL_PAGO_RECEBIDO <> VIEW_MOVIMENTACAO_FINANCEIRA.VALOR_TOTAL))' + vaOperador
    end
  else if (ipTabela = 'TUBETE_SEMEADO') then
    begin
      if ipParam.Name = TParametros.coEspecie then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'ESPECIE', 'ID', vaValor.ToInteger, vaOperador);
    end
  else if (ipTabela = 'CONTA_PAGAR') then
    begin
      if ipParam.Name = TParametros.coData then
        Result := TSQLGenerator.fpuFilterDataSemHora(Result, 'VIEW_CONTA_PAGAR', 'DATA', TUtils.fpuExtrairData(vaValor, 0),
          TUtils.fpuExtrairData(vaValor, 1), vaOperador)
      else if ipParam.Name = TParametros.coProjeto then
        begin
          if vaValor.ToInteger = -1 then // nao quero q sai nenhum projeto
            Result := '(' + Result + ' (VIEW_CONTA_PAGAR.TIPO_ORIGEM <> ' + Ord(oriProjeto).ToString + '))' + vaOperador
          else if vaValor.ToInteger = 0 then // Todos
            Result := TSQLGenerator.fpuFilterInteger(Result, 'VIEW_CONTA_PAGAR', 'TIPO_ORIGEM', Ord(oriProjeto), vaOperador)
          else
            begin
              Result := '(' + Result + '((VIEW_CONTA_PAGAR.TIPO_ORIGEM = ' + Ord(oriProjeto).ToString + ') AND ';
              Result := Result + ' (VIEW_CONTA_PAGAR.ID_ORIGEM_RECURSO = ' + vaValor + ')))' + vaOperador;
            end;
        end
      else if ipParam.Name = TParametros.coFundo then
        begin
          if vaValor.ToInteger = -1 then // nao quero q sai nenhuma conta no relatorio
            Result := '(' + Result + ' (VIEW_CONTA_PAGAR.TIPO_ORIGEM <> ' + Ord(oriFundo).ToString + ')) ' + vaOperador
          else if vaValor.ToInteger = 0 then // Todos
            Result := TSQLGenerator.fpuFilterInteger(Result, 'VIEW_CONTA_PAGAR', 'TIPO_ORIGEM', Ord(oriFundo), vaOperador)
          else
            begin
              Result := '(' + Result + '((VIEW_CONTA_PAGAR.TIPO_ORIGEM = ' + Ord(oriFundo).ToString + ') AND ';
              Result := Result + ' (VIEW_CONTA_PAGAR.ID_ORIGEM_RECURSO = ' + vaValor + ')))' + vaOperador;
            end;
        end;
    end
  else if (ipTabela = 'SALDO_SEMENTE_MUDA') then
    begin
      if ipParam.Name = TParametros.coID_ESPECIE then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'ESPECIE', 'ID', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coClassificacao then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'ESPECIE', 'CLASSIFICACAO', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coBioma then
        begin
          vaArray := TUtils.fpuConverterStringToArrayInteger(vaValor, TParametros.coDelimitador);
          Result := TSQLGenerator.fpuFilterInteger(Result, 'ESPECIE_BIOMA', 'BIOMA', vaArray, vaOperador)
        end
        else if ipParam.Name = TParametros.coCategoria then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'ESPECIE', 'CATEGORIA_ARMAZENAMENTO', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coTipo then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'ESPECIE', 'ID_TIPO_ESPECIE', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coSaldoPositivo then
        Result := Result + ' ((Especie.Qtde_Semente_Estoque > 0) OR (Especie.Qtde_Muda_Pronta > 0) OR (Especie.Qtde_Muda_Desenvolvimento > 0)) ' + vaOperador;
    end
end;

procedure TsmRelatorio.qLote_Muda_VendidoCalcFields(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('CALC_MES').AsString := FormatDateTime('mmmm "de" yyyy',DataSet.FieldByName('DATA').AsDateTime);
  DataSet.FieldByName('CALC_MES').AsString := Copy(DataSet.FieldByName('CALC_MES').AsString,1,1).ToUpper+ Copy(DataSet.FieldByName('CALC_MES').AsString,2);


end;

procedure TsmRelatorio.qPatrimonioCalcFields(DataSet: TDataSet);
begin
  inherited;
  qPatrimonioCALC_VALOR_ATUAL.AsFloat := TUtils.fpuCalcularDepreciacao(qPatrimonioDATA_AQUISICAO.AsDateTime, qPatrimonioVALOR_INICIAL.AsFloat,
    qPatrimonioTAXA_DEPRECIACAO_ANUAL.AsInteger);
end;

procedure TsmRelatorio.qView_Movimentacao_FinanceiraCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qView_Movimentacao_FinanceiraCALC_VALOR_RESTANTE.AsFloat := qView_Movimentacao_FinanceiraVALOR_TOTAL.AsFloat -
    qView_Movimentacao_FinanceiraVALOR_TOTAL_PAGO_RECEBIDO.AsFloat;
  if qView_Movimentacao_FinanceiraTIPO.AsInteger = Ord(tmReceita) then
    qView_Movimentacao_FinanceiraCALC_SALDO.AsFloat := qView_Movimentacao_FinanceiraVALOR_TOTAL_PAGO_RECEBIDO.AsFloat
  else
    qView_Movimentacao_FinanceiraCALC_SALDO.AsFloat := -qView_Movimentacao_FinanceiraVALOR_TOTAL_PAGO_RECEBIDO.AsFloat;

  if not qView_Movimentacao_FinanceiraFORMA_PAGAMENTO_RECEBIMENTO.IsNull then
    qView_Movimentacao_FinanceiraCALC_DESCRICAO_FORMA_PGTO.AsString :=
      FormaPagamennto[TFormaPagamento(qView_Movimentacao_FinanceiraFORMA_PAGAMENTO_RECEBIMENTO.AsInteger)];
end;

end.
