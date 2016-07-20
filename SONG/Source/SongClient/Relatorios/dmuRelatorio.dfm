inherited dmRelatorio: TdmRelatorio
  OldCreateOrder = True
  Height = 253
  Width = 711
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
    object cdsSaldo_Semente_MudaCALC_QTDE_SEMENTE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_QTDE_SEMENTE'
      Size = 60
      Calculated = True
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
    object cdsSaldo_Semente_MudaCALC_QTDE_MUDA_PRONTA: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_QTDE_MUDA_PRONTA'
      Size = 60
      Calculated = True
    end
    object cdsSaldo_Semente_MudaCALC_QTDE_MUDA_DESENVOLVIMENTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_QTDE_MUDA_DESENVOLVIMENTO'
      Size = 60
      Calculated = True
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
end
