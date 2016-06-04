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
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsTaxas_EspecieNOME_CIENTIFICO: TStringField
      FieldName = 'NOME_CIENTIFICO'
      ProviderFlags = []
      Size = 100
    end
    object cdsTaxas_EspecieFAMILIA_BOTANICA: TStringField
      FieldName = 'FAMILIA_BOTANICA'
      ProviderFlags = []
      Size = 100
    end
    object cdsTaxas_EspecieTEMPO_GERMINACAO: TIntegerField
      FieldName = 'TEMPO_GERMINACAO'
      ProviderFlags = []
    end
    object cdsTaxas_EspecieTEMPO_DESENVOLVIMENTO: TIntegerField
      FieldName = 'TEMPO_DESENVOLVIMENTO'
      ProviderFlags = []
    end
    object cdsTaxas_EspecieTAXA_CLASSIFICACAO: TBCDField
      FieldName = 'TAXA_CLASSIFICACAO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object cdsTaxas_EspecieTAXA_GERMINACAO: TBCDField
      FieldName = 'TAXA_GERMINACAO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object cdsTaxas_EspecieQTDE_SEMENTE_ESTOQUE: TBCDField
      FieldName = 'QTDE_SEMENTE_ESTOQUE'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object cdsTaxas_EspecieQTDE_MUDA_DESENVOLVIMENTO: TIntegerField
      FieldName = 'QTDE_MUDA_DESENVOLVIMENTO'
      ProviderFlags = []
    end
    object cdsTaxas_EspecieQTDE_MUDA_PRONTA: TIntegerField
      FieldName = 'QTDE_MUDA_PRONTA'
      ProviderFlags = []
    end
    object cdsTaxas_EspecieQTDE_SEMENTE_KILO: TIntegerField
      FieldName = 'QTDE_SEMENTE_KILO'
      ProviderFlags = []
      Required = True
    end
  end
end
