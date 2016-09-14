inherited dmRelatorio: TdmRelatorio
  OldCreateOrder = True
  Height = 387
  Width = 878
  object cdsSaldo_Rubrica: TRFClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PROJETO'
        ParamType = ptInput
      end>
    ProviderName = 'dspqSaldo_Rubrica'
    RemoteServer = dmPrincipal.ProviderRelatorio
    Left = 48
    Top = 16
    object cdsSaldo_RubricaID_RUBRICA: TIntegerField
      FieldName = 'ID_RUBRICA'
      Origin = 'ID_RUBRICA'
      ProviderFlags = []
    end
    object cdsSaldo_RubricaID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      Origin = 'ID_PROJETO'
      ProviderFlags = []
    end
    object cdsSaldo_RubricaNOME_PROJETO: TStringField
      FieldName = 'NOME_PROJETO'
      Origin = 'NOME_PROJETO'
      ProviderFlags = []
      Size = 100
    end
    object cdsSaldo_RubricaNOME_RUBRICA: TStringField
      FieldName = 'NOME_RUBRICA'
      Origin = 'NOME_RUBRICA'
      ProviderFlags = []
      ReadOnly = True
      Size = 123
    end
    object cdsSaldo_RubricaRECEBIDO: TBCDField
      FieldName = 'RECEBIDO'
      Origin = 'VALOR_RECEBIDO'
      ProviderFlags = []
      Precision = 18
    end
    object cdsSaldo_RubricaGASTO: TFMTBCDField
      FieldName = 'GASTO'
      Origin = 'VALOR_GASTO'
      ProviderFlags = []
      Precision = 18
      Size = 6
    end
    object cdsSaldo_RubricaAPROVISIONADO: TFMTBCDField
      FieldName = 'APROVISIONADO'
      Origin = 'VALOR_APROVISIONADO'
      ProviderFlags = []
      Precision = 18
      Size = 6
    end
    object cdsSaldo_RubricaSALDO_REAL: TFMTBCDField
      FieldName = 'SALDO_REAL'
      Origin = 'SALDO_REAL'
      ProviderFlags = []
      Precision = 18
      Size = 6
    end
    object cdsSaldo_RubricaORCAMENTO: TBCDField
      FieldName = 'ORCAMENTO'
      Origin = 'ORCAMENTO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
  end
  object dsSaldo_Rubrica: TDataSource
    DataSet = cdsSaldo_Rubrica
    Left = 56
    Top = 96
  end
  object cdsSaldo_Semente_Muda: TRFClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_ESPECIE'
        ParamType = ptInput
      end>
    ProviderName = 'dspqSaldo_Semente_Muda'
    RemoteServer = dmPrincipal.ProviderRelatorio
    OnCalcFields = cdsSaldo_Semente_MudaCalcFields
    Left = 240
    Top = 32
    object cdsSaldo_Semente_MudaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsSaldo_Semente_MudaNOME_CIENTIFICO: TStringField
      FieldName = 'NOME_CIENTIFICO'
      Origin = 'NOME_CIENTIFICO'
      ProviderFlags = []
      Size = 100
    end
    object cdsSaldo_Semente_MudaFAMILIA_BOTANICA: TStringField
      FieldName = 'FAMILIA_BOTANICA'
      Origin = 'FAMILIA_BOTANICA'
      ProviderFlags = []
      Size = 100
    end
    object cdsSaldo_Semente_MudaQTDE_SEMENTE_ESTOQUE: TBCDField
      FieldName = 'QTDE_SEMENTE_ESTOQUE'
      Origin = 'QTDE_SEMENTE_ESTOQUE'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object cdsSaldo_Semente_MudaQTDE_MUDA_PRONTA: TIntegerField
      FieldName = 'QTDE_MUDA_PRONTA'
      Origin = 'QTDE_MUDA_PRONTA'
      ProviderFlags = []
    end
    object cdsSaldo_Semente_MudaQTDE_MUDA_DESENVOLVIMENTO: TIntegerField
      FieldName = 'QTDE_MUDA_DESENVOLVIMENTO'
      Origin = 'QTDE_MUDA_DESENVOLVIMENTO'
      ProviderFlags = []
    end
    object cdsSaldo_Semente_MudaCALC_TOTAL_MUDA: TIntegerField
      DisplayLabel = 'Total de Mudas'
      FieldKind = fkCalculated
      FieldName = 'CALC_TOTAL_MUDA'
      Calculated = True
    end
  end
  object dsSaldo_Semente_Muda: TDataSource
    DataSet = cdsSaldo_Semente_Muda
    Left = 240
    Top = 104
  end
  object cdsTaxas_Especie: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqTaxas_Especie'
    RemoteServer = dmPrincipal.ProviderRelatorio
    RFApplyAutomatico = False
    Left = 408
    Top = 40
    object cdsTaxas_EspecieID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
    end
    object cdsTaxas_EspecieNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsTaxas_EspecieNOME_CIENTIFICO: TStringField
      DisplayLabel = 'Nome Cient'#237'fico'
      FieldName = 'NOME_CIENTIFICO'
      ProviderFlags = []
      Size = 100
    end
    object cdsTaxas_EspecieFAMILIA_BOTANICA: TStringField
      DisplayLabel = 'Fam'#237'lia Bot'#226'nica'
      FieldName = 'FAMILIA_BOTANICA'
      ProviderFlags = []
      Size = 100
    end
    object cdsTaxas_EspecieTEMPO_GERMINACAO: TIntegerField
      DisplayLabel = 'Tempo de Germina'#231#227'o'
      FieldName = 'TEMPO_GERMINACAO'
      ProviderFlags = []
    end
    object cdsTaxas_EspecieTEMPO_DESENVOLVIMENTO: TIntegerField
      DisplayLabel = 'Tempo de Desenvolvimento'
      FieldName = 'TEMPO_DESENVOLVIMENTO'
      ProviderFlags = []
    end
    object cdsTaxas_EspecieTAXA_CLASSIFICACAO: TBCDField
      DisplayLabel = 'Taxa de Classifica'#231#227'o'
      FieldName = 'TAXA_CLASSIFICACAO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object cdsTaxas_EspecieTAXA_GERMINACAO: TBCDField
      DisplayLabel = 'Taxa de Germina'#231#227'o'
      FieldName = 'TAXA_GERMINACAO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object cdsTaxas_EspecieQTDE_SEMENTE_ESTOQUE: TBCDField
      DisplayLabel = 'Qtde. de Semente em Estoque'
      FieldName = 'QTDE_SEMENTE_ESTOQUE'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object cdsTaxas_EspecieQTDE_MUDA_DESENVOLVIMENTO: TIntegerField
      DisplayLabel = 'Qtde. de Muda em Desenvolvimento'
      FieldName = 'QTDE_MUDA_DESENVOLVIMENTO'
      ProviderFlags = []
    end
    object cdsTaxas_EspecieQTDE_MUDA_PRONTA: TIntegerField
      DisplayLabel = 'Qtde. de Muda Pronta'
      FieldName = 'QTDE_MUDA_PRONTA'
      ProviderFlags = []
    end
    object cdsTaxas_EspecieQTDE_SEMENTE_KILO: TIntegerField
      DisplayLabel = 'Qtde. de Semente Por Kilo'
      FieldName = 'QTDE_SEMENTE_KILO'
      ProviderFlags = []
    end
  end
  object cdsPatrimonio: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqPatrimonio'
    RemoteServer = dmPrincipal.ProviderRelatorio
    Left = 336
    Top = 112
    object cdsPatrimonioIDENTIFICACAO: TStringField
      FieldName = 'IDENTIFICACAO'
      Origin = 'IDENTIFICACAO'
      ProviderFlags = []
    end
    object cdsPatrimonioNOME_ITEM: TStringField
      FieldName = 'NOME_ITEM'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsPatrimonioDATA_AQUISICAO: TSQLTimeStampField
      FieldName = 'DATA_AQUISICAO'
      Origin = 'DATA_AQUISICAO'
      ProviderFlags = []
      Required = True
    end
    object cdsPatrimonioVALOR_INICIAL: TBCDField
      FieldName = 'VALOR_INICIAL'
      Origin = 'VALOR_INICIAL'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object cdsPatrimonioLOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      Origin = 'LOCALIZACAO'
      ProviderFlags = []
      Size = 100
    end
    object cdsPatrimonioSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = []
    end
    object cdsPatrimonioCALC_VALOR_ATUAL: TBCDField
      FieldName = 'CALC_VALOR_ATUAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsPatrimonioTAXA_DEPRECIACAO_ANUAL: TIntegerField
      FieldName = 'TAXA_DEPRECIACAO_ANUAL'
      Origin = 'TAXA_DEPRECIACAO_ANUAL'
      ProviderFlags = []
    end
    object cdsPatrimonioID_ITEM_PATRIMONIO: TIntegerField
      FieldName = 'ID_ITEM_PATRIMONIO'
      Origin = 'ID_ITEM_PATRIMONIO'
      ProviderFlags = []
      Required = True
    end
  end
  object cdsGasto_Area_Atuacao: TRFClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'TODAS_DATAS'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATA_INICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATA_FINAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspqGasto_Area_Atuacao'
    RemoteServer = dmPrincipal.ProviderRelatorio
    Left = 480
    Top = 120
    object cdsGasto_Area_AtuacaoGASTO: TFMTBCDField
      FieldName = 'GASTO'
      Origin = 'GASTO'
      currency = True
      Precision = 18
      Size = 6
    end
    object cdsGasto_Area_AtuacaoID_AREA_ATUACAO_ORIGEM: TIntegerField
      FieldName = 'ID_AREA_ATUACAO_ORIGEM'
      Origin = 'ID_AREA_ATUACAO_ORIGEM'
      ProviderFlags = []
    end
    object cdsGasto_Area_AtuacaoAREA_ATUACAO: TStringField
      FieldName = 'AREA_ATUACAO'
      Origin = 'AREA_ATUACAO'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdsGasto_Area_AtuacaoPROJETO: TStringField
      FieldName = 'PROJETO'
      Origin = 'PROJETO'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object cdsTrasnferencia_Financeira: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'DATA'
    Params = <>
    ProviderName = 'dspqTransferencia_Financeira'
    RemoteServer = dmPrincipal.ProviderRelatorio
    OnCalcFields = cdsTrasnferencia_FinanceiraCalcFields
    Left = 472
    Top = 184
    object cdsTrasnferencia_FinanceiraID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdsTrasnferencia_FinanceiraID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Origin = 'ID_PESSOA'
      ProviderFlags = []
      Required = True
    end
    object cdsTrasnferencia_FinanceiraID_FUNDO_ORIGEM: TIntegerField
      FieldName = 'ID_FUNDO_ORIGEM'
      Origin = 'ID_FUNDO_ORIGEM'
      ProviderFlags = []
    end
    object cdsTrasnferencia_FinanceiraFUNDO_ORIGEM: TStringField
      FieldName = 'FUNDO_ORIGEM'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsTrasnferencia_FinanceiraID_FUNDO_DESTINO: TIntegerField
      FieldName = 'ID_FUNDO_DESTINO'
      Origin = 'ID_FUNDO_DESTINO'
      ProviderFlags = []
    end
    object cdsTrasnferencia_FinanceiraFUNDO_DESTINO: TStringField
      FieldName = 'FUNDO_DESTINO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsTrasnferencia_FinanceiraID_PROJETO_RUBRICA_ORIGEM: TIntegerField
      FieldName = 'ID_PROJETO_RUBRICA_ORIGEM'
      Origin = 'ID_PROJETO_RUBRICA_ORIGEM'
      ProviderFlags = []
    end
    object cdsTrasnferencia_FinanceiraPROJETO_ORIGEM: TStringField
      FieldName = 'PROJETO_ORIGEM'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsTrasnferencia_FinanceiraRUBRICA_ORIGEM: TStringField
      FieldName = 'RUBRICA_ORIGEM'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsTrasnferencia_FinanceiraID_PROJETO_RUBRICA_DESTINO: TIntegerField
      FieldName = 'ID_PROJETO_RUBRICA_DESTINO'
      Origin = 'ID_PROJETO_RUBRICA_DESTINO'
      ProviderFlags = []
    end
    object cdsTrasnferencia_FinanceiraPROJETO_DESTINO: TStringField
      FieldName = 'PROJETO_DESTINO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsTrasnferencia_FinanceiraRUBRICA_DESTINO: TStringField
      FieldName = 'RUBRICA_DESTINO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsTrasnferencia_FinanceiraVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      ProviderFlags = []
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsTrasnferencia_FinanceiraDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = []
      Required = True
    end
    object cdsTrasnferencia_FinanceiraTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      Required = True
    end
    object cdsTrasnferencia_FinanceiraORIGEM: TStringField
      FieldName = 'ORIGEM'
      Origin = 'ORIGEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 203
    end
    object cdsTrasnferencia_FinanceiraDESTINO: TStringField
      FieldName = 'DESTINO'
      Origin = 'DESTINO'
      ProviderFlags = []
      ReadOnly = True
      Size = 203
    end
    object cdsTrasnferencia_FinanceiraCALC_TIPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_TIPO'
      Size = 100
      Calculated = True
    end
    object cdsTrasnferencia_FinanceiraRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object cdsGasto_Fornecedor: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqGasto_Fornecedor'
    RemoteServer = dmPrincipal.ProviderRelatorio
    Left = 320
    Top = 200
    object cdsGasto_FornecedorVALOR_PAGO: TBCDField
      FieldName = 'VALOR_PAGO'
      Origin = 'VALOR_PAGO'
      currency = True
      Precision = 18
      Size = 2
    end
    object cdsGasto_FornecedorID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      Origin = 'ID_FORNECEDOR'
      Required = True
    end
    object cdsGasto_FornecedorNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      Size = 100
    end
    object cdsGasto_FornecedorRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Required = True
      Size = 100
    end
    object cdsGasto_FornecedorCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Required = True
      Size = 18
    end
    object cdsGasto_FornecedorVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object cdsGasto_FornecedorDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
      Origin = 'DATA_PAGAMENTO'
    end
  end
  object cdsGasto_Atividade: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqGasto_Atividade'
    RemoteServer = dmPrincipal.ProviderRelatorio
    OnCalcFields = cdsGasto_AtividadeCalcFields
    Left = 184
    Top = 184
    object cdsGasto_AtividadeID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGasto_AtividadeNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdsGasto_AtividadeID_SOLICITANTE: TIntegerField
      FieldName = 'ID_SOLICITANTE'
      Origin = 'ID_SOLICITANTE'
      ProviderFlags = []
      Required = True
    end
    object cdsGasto_AtividadeID_RESPONSAVEL: TIntegerField
      FieldName = 'ID_RESPONSAVEL'
      Origin = 'ID_RESPONSAVEL'
      ProviderFlags = []
      Required = True
    end
    object cdsGasto_AtividadeSOLICITANTE: TStringField
      FieldName = 'SOLICITANTE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsGasto_AtividadeRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsGasto_AtividadeSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = []
      Required = True
    end
    object cdsGasto_AtividadeDATA_INICIAL: TSQLTimeStampField
      FieldName = 'DATA_INICIAL'
      Origin = 'DATA_INICIAL'
      ProviderFlags = []
    end
    object cdsGasto_AtividadeDATA_FINAL: TSQLTimeStampField
      FieldName = 'DATA_FINAL'
      Origin = 'DATA_FINAL'
      ProviderFlags = []
    end
    object cdsGasto_AtividadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsGasto_AtividadeVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsGasto_AtividadeVALOR_PAGO: TFMTBCDField
      FieldName = 'VALOR_PAGO'
      Origin = 'VALOR_PAGO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 6
    end
    object cdsGasto_AtividadeCALC_STATUS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_STATUS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfHidden]
      Size = 60
      Calculated = True
    end
  end
  object cdsMatriz_Produtiva: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqMatriz_Produtiva'
    RemoteServer = dmPrincipal.ProviderRelatorio
    Left = 616
    Top = 48
    object cdsMatriz_ProdutivaID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Required = True
    end
    object cdsMatriz_ProdutivaESPECIE: TStringField
      FieldName = 'ESPECIE'
      ReadOnly = True
      Size = 100
    end
    object cdsMatriz_ProdutivaID_MATRIZ: TIntegerField
      FieldName = 'ID_MATRIZ'
      ReadOnly = True
    end
    object cdsMatriz_ProdutivaMATRIZ: TStringField
      FieldName = 'MATRIZ'
      ReadOnly = True
      Size = 100
    end
    object cdsMatriz_ProdutivaTAXA: TBCDField
      FieldName = 'TAXA'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object cdsGasto_Plano_Contas: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqGasto_Plano_Contas'
    RemoteServer = dmPrincipal.ProviderRelatorio
    OnCalcFields = cdsGasto_Plano_ContasCalcFields
    Left = 616
    Top = 168
    object cdsGasto_Plano_ContasID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGasto_Plano_ContasNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object cdsGasto_Plano_ContasID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      Origin = 'ID_PROJETO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsGasto_Plano_ContasPROJETO: TStringField
      FieldName = 'PROJETO'
      Origin = 'PROJETO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsGasto_Plano_ContasID_FUNDO: TIntegerField
      FieldName = 'ID_FUNDO'
      Origin = 'ID_FUNDO'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsGasto_Plano_ContasNOME_FUNDO: TStringField
      FieldName = 'NOME_FUNDO'
      Origin = 'NOME_FUNDO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsGasto_Plano_ContasID_RUBRICA: TIntegerField
      FieldName = 'ID_RUBRICA'
      Origin = 'ID_RUBRICA'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsGasto_Plano_ContasRUBRICA: TStringField
      FieldName = 'RUBRICA'
      Origin = 'RUBRICA'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsGasto_Plano_ContasVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsGasto_Plano_ContasVALOR_PAGO: TBCDField
      FieldName = 'VALOR_PAGO'
      Origin = 'VALOR_PAGO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsGasto_Plano_ContasCALC_ORIGEM: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_ORIGEM'
      Size = 200
      Calculated = True
    end
  end
  object cdsLote_Muda_Comprado: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqLote_Muda_Comprado'
    RemoteServer = dmPrincipal.ProviderRelatorio
    Left = 64
    Top = 280
    object cdsLote_Muda_CompradoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLote_Muda_CompradoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object cdsLote_Muda_CompradoID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      Required = True
    end
    object cdsLote_Muda_CompradoESPECIE: TStringField
      FieldName = 'ESPECIE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsLote_Muda_CompradoID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      Origin = 'ID_FORNECEDOR'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsLote_Muda_CompradoFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 203
    end
    object cdsLote_Muda_CompradoVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsLote_Muda_CompradoVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object cdsLote_Muda_CompradoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object cdsLote_Muda_CompradoQTDE: TBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object cdsLote_Semente_Comprado: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqLote_Semente_Comprado'
    RemoteServer = dmPrincipal.ProviderRelatorio
    Left = 208
    Top = 272
    object cdsLote_Semente_CompradoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsLote_Semente_CompradoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 30
    end
    object cdsLote_Semente_CompradoID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Required = True
    end
    object cdsLote_Semente_CompradoESPECIE: TStringField
      FieldName = 'ESPECIE'
      ReadOnly = True
      Size = 100
    end
    object cdsLote_Semente_CompradoID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      ReadOnly = True
    end
    object cdsLote_Semente_CompradoFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      ReadOnly = True
      Size = 203
    end
    object cdsLote_Semente_CompradoQTDE: TBCDField
      FieldName = 'QTDE'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsLote_Semente_CompradoVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsLote_Semente_CompradoVALOR: TBCDField
      FieldName = 'VALOR'
      ReadOnly = True
      Precision = 18
    end
    object cdsLote_Semente_CompradoDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
  end
  object cdsGasto_Plano_Contas_Detalhado: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqGasto_Plano_Contas_Detalhado'
    RemoteServer = dmPrincipal.ProviderRelatorio
    OnCalcFields = cdsGasto_Plano_ContasCalcFields
    Left = 624
    Top = 248
    object cdsGasto_Plano_Contas_DetalhadoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsGasto_Plano_Contas_DetalhadoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object cdsGasto_Plano_Contas_DetalhadoID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      ReadOnly = True
    end
    object cdsGasto_Plano_Contas_DetalhadoPROJETO: TStringField
      FieldName = 'PROJETO'
      ReadOnly = True
      Size = 100
    end
    object cdsGasto_Plano_Contas_DetalhadoID_FUNDO: TIntegerField
      FieldName = 'ID_FUNDO'
      ReadOnly = True
    end
    object cdsGasto_Plano_Contas_DetalhadoNOME_FUNDO: TStringField
      FieldName = 'NOME_FUNDO'
      ReadOnly = True
      Size = 100
    end
    object cdsGasto_Plano_Contas_DetalhadoID_RUBRICA: TIntegerField
      FieldName = 'ID_RUBRICA'
      ReadOnly = True
    end
    object cdsGasto_Plano_Contas_DetalhadoRUBRICA: TStringField
      FieldName = 'RUBRICA'
      ReadOnly = True
      Size = 100
    end
    object cdsGasto_Plano_Contas_DetalhadoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ReadOnly = True
      Size = 100
    end
    object cdsGasto_Plano_Contas_DetalhadoVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsGasto_Plano_Contas_DetalhadoVALOR_PAGO: TBCDField
      FieldName = 'VALOR_PAGO'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsGasto_Plano_Contas_DetalhadoCALC_ORIGEM: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_ORIGEM'
      Size = 200
      Calculated = True
    end
  end
  object cdsLote_Semente_Vendido: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqLote_Semente_Vendido'
    RemoteServer = dmPrincipal.ProviderRelatorio
    Left = 376
    Top = 280
    object cdsLote_Semente_VendidoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsLote_Semente_VendidoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 30
    end
    object cdsLote_Semente_VendidoID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Required = True
    end
    object cdsLote_Semente_VendidoESPECIE: TStringField
      FieldName = 'ESPECIE'
      Required = True
      Size = 100
    end
    object cdsLote_Semente_VendidoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Required = True
    end
    object cdsLote_Semente_VendidoQTDE: TBCDField
      FieldName = 'QTDE'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsLote_Semente_VendidoVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsLote_Semente_VendidoVALOR: TBCDField
      FieldName = 'VALOR'
      Required = True
      Precision = 18
    end
    object cdsLote_Semente_VendidoDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object cdsLote_Semente_VendidoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Size = 203
    end
  end
  object cdsLote_Muda_Vendido: TRFClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqLote_Muda_Vendido'
    RemoteServer = dmPrincipal.ProviderRelatorio
    Left = 496
    Top = 288
    object cdsLote_Muda_VendidoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLote_Muda_VendidoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object cdsLote_Muda_VendidoID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      Required = True
    end
    object cdsLote_Muda_VendidoESPECIE: TStringField
      FieldName = 'ESPECIE'
      Origin = 'ESPECIE'
      Required = True
      Size = 100
    end
    object cdsLote_Muda_VendidoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      Required = True
    end
    object cdsLote_Muda_VendidoQTDE: TBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsLote_Muda_VendidoVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsLote_Muda_VendidoVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      Precision = 18
    end
    object cdsLote_Muda_VendidoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object cdsLote_Muda_VendidoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Size = 203
    end
  end
  object cdsView_Movimentacao_Financeira: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqView_Movimentacao_Financeira'
    RemoteServer = dmPrincipal.ProviderRelatorio
    Left = 688
    Top = 320
    object cdsView_Movimentacao_FinanceiraID_MOVIMENTACAO: TIntegerField
      FieldName = 'ID_MOVIMENTACAO'
      Origin = 'ID_MOVIMENTACAO'
      ProviderFlags = []
    end
    object cdsView_Movimentacao_FinanceiraID_ORGANIZACAO: TIntegerField
      FieldName = 'ID_ORGANIZACAO'
      Origin = 'ID_ORGANIZACAO'
      ProviderFlags = []
    end
    object cdsView_Movimentacao_FinanceiraNOME_ORGANIZACAO: TStringField
      FieldName = 'NOME_ORGANIZACAO'
      Origin = 'NOME_ORGANIZACAO'
      ProviderFlags = []
      Size = 100
    end
    object cdsView_Movimentacao_FinanceiraID_ORIGEM_RECURSO: TIntegerField
      FieldName = 'ID_ORIGEM_RECURSO'
      Origin = 'ID_ORIGEM_RECURSO'
      ProviderFlags = []
    end
    object cdsView_Movimentacao_FinanceiraID_UNICO_ORIGEM_RECURSO: TStringField
      FieldName = 'ID_UNICO_ORIGEM_RECURSO'
      Origin = 'ID_UNICO_ORIGEM_RECURSO'
      ProviderFlags = []
      Size = 19
    end
    object cdsView_Movimentacao_FinanceiraORIGEM_RECURSO: TStringField
      FieldName = 'ORIGEM_RECURSO'
      Origin = 'ORIGEM_RECURSO'
      ProviderFlags = []
      Size = 100
    end
    object cdsView_Movimentacao_FinanceiraTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
    end
    object cdsView_Movimentacao_FinanceiraDESCRICAO_TIPO: TStringField
      FieldName = 'DESCRICAO_TIPO'
      Origin = 'DESCRICAO_TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 8
    end
    object cdsView_Movimentacao_FinanceiraDESCRICAO_MOVIMENTACAO: TStringField
      FieldName = 'DESCRICAO_MOVIMENTACAO'
      Origin = 'DESCRICAO_MOVIMENTACAO'
      ProviderFlags = []
      Size = 124
    end
    object cdsView_Movimentacao_FinanceiraDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = []
    end
    object cdsView_Movimentacao_FinanceiraDATA_PAGAMENTO_RECEBIMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO_RECEBIMENTO'
      Origin = 'DATA_PAGAMENTO_RECEBIMENTO'
      ProviderFlags = []
    end
    object cdsView_Movimentacao_FinanceiraFORMA_PAGAMENTO_RECEBIMENTO: TIntegerField
      FieldName = 'FORMA_PAGAMENTO_RECEBIMENTO'
      Origin = 'FORMA_PAGAMENTO_RECEBIMENTO'
      ProviderFlags = []
    end
    object cdsView_Movimentacao_FinanceiraVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      ProviderFlags = []
      currency = True
      Precision = 18
      Size = 2
    end
    object cdsView_Movimentacao_FinanceiraVALOR_TOTAL_PAGO_RECEBIDO: TBCDField
      FieldName = 'VALOR_TOTAL_PAGO_RECEBIDO'
      Origin = 'VALOR_TOTAL_PAGO_RECEBIDO'
      ProviderFlags = []
      currency = True
      Precision = 18
      Size = 2
    end
    object cdsView_Movimentacao_FinanceiraCALC_VALOR_RESTANTE: TBCDField
      FieldName = 'CALC_VALOR_RESTANTE'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
    object cdsView_Movimentacao_FinanceiraCALC_SALDO: TBCDField
      FieldName = 'CALC_SALDO'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
    object cdsView_Movimentacao_FinanceiraCALC_DESCRICAO_FORMA_PGTO: TStringField
      FieldName = 'CALC_DESCRICAO_FORMA_PGTO'
      ProviderFlags = []
      Size = 120
    end
  end
  object cdsSaldo: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqSaldo'
    RemoteServer = dmPrincipal.ProviderRelatorio
    Left = 784
    Top = 280
    object cdsSaldoID_ORGANIZACAO: TIntegerField
      FieldName = 'ID_ORGANIZACAO'
      Origin = 'ID_ORGANIZACAO'
      ProviderFlags = []
    end
    object cdsSaldoNOME_ORGANIZACAO: TStringField
      FieldName = 'NOME_ORGANIZACAO'
      Origin = 'NOME_ORGANIZACAO'
      ProviderFlags = []
      Size = 100
    end
    object cdsSaldoID_ORIGEM_RECURSO: TIntegerField
      FieldName = 'ID_ORIGEM_RECURSO'
      Origin = 'ID_ORIGEM_RECURSO'
      ProviderFlags = []
    end
    object cdsSaldoID_UNICO_ORIGEM_RECURSO: TStringField
      FieldName = 'ID_UNICO_ORIGEM_RECURSO'
      Origin = 'ID_UNICO_ORIGEM_RECURSO'
      ProviderFlags = []
      Size = 19
    end
    object cdsSaldoORIGEM_RECURSO: TStringField
      FieldName = 'ORIGEM_RECURSO'
      Origin = 'ORIGEM_RECURSO'
      ProviderFlags = []
      Size = 100
    end
    object cdsSaldoSALDO: TBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object cdsSaldoTIPO_ORIGEM: TIntegerField
      FieldName = 'TIPO_ORIGEM'
      Origin = 'TIPO_ORIGEM'
      ProviderFlags = []
    end
  end
  object cdsTubete_Semeado: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqTubete_Semeado'
    RemoteServer = dmPrincipal.ProviderRelatorio
    Left = 776
    Top = 160
    object cdsTubete_SemeadoQTDE_TUBETE: TLargeintField
      FieldName = 'QTDE_TUBETE'
      ProviderFlags = []
    end
    object cdsTubete_SemeadoID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      ProviderFlags = []
      Required = True
    end
    object cdsTubete_SemeadoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdsTubete_SemeadoNOME_CIENTIFICO: TStringField
      FieldName = 'NOME_CIENTIFICO'
      ProviderFlags = []
      Size = 100
    end
  end
  object cdsConta_Pagar: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqConta_Pagar'
    RemoteServer = dmPrincipal.ProviderRelatorio
    Left = 792
    Top = 48
    object cdsConta_PagarID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
    end
    object cdsConta_PagarID_VINCULO: TIntegerField
      FieldName = 'ID_VINCULO'
      ProviderFlags = []
    end
    object cdsConta_PagarRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsConta_PagarCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      ProviderFlags = []
      ReadOnly = True
      Size = 18
    end
    object cdsConta_PagarNUMERO_DOCUMENTO: TStringField
      FieldName = 'NUMERO_DOCUMENTO'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object cdsConta_PagarDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
      ProviderFlags = []
    end
    object cdsConta_PagarVALOR: TBCDField
      FieldName = 'VALOR'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object cdsConta_PagarVALOR_PAGO: TBCDField
      FieldName = 'VALOR_PAGO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
  end
end
