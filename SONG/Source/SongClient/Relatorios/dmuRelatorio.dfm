inherited dmRelatorio: TdmRelatorio
  OldCreateOrder = True
  Height = 220
  Width = 386
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
    object cdsSaldo_Semente_MudaQTDE_MUDA_ESTOQUE: TIntegerField
      FieldName = 'QTDE_MUDA_ESTOQUE'
      Origin = 'QTDE_MUDA_ESTOQUE'
      ProviderFlags = []
    end
    object cdsSaldo_Semente_MudaCALC_QTDE_SEMENTE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_QTDE_SEMENTE'
      Size = 60
      Calculated = True
    end
    object cdsSaldo_Semente_MudaCALC_QTDE_MUDA: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_QTDE_MUDA'
      Size = 60
      Calculated = True
    end
  end
  object dsSaldo_Semente_Muda: TDataSource
    DataSet = cdsSaldo_Semente_Muda
    Left = 240
    Top = 104
  end
end
