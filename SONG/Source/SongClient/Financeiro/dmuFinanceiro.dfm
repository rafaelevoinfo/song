inherited dmFinanceiro: TdmFinanceiro
  OldCreateOrder = True
  Height = 345
  Width = 590
  object cdsBanco: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqBanco'
    RemoteServer = dmPrincipal.ProviderFinanceiro
    Left = 400
    Top = 8
    object cdsBancoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsBancoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object cdsBanco_Conta_Corrente: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_BANCO'
    MasterFields = 'ID'
    MasterSource = dsBanco
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_BANCO'
        ParamType = ptInput
      end>
    ProviderName = 'dspqBanco_Conta_Corrente'
    RemoteServer = dmPrincipal.ProviderFinanceiro
    Left = 400
    Top = 80
    object cdsBanco_Conta_CorrenteID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsBanco_Conta_CorrenteID_BANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'ID_BANCO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsBanco_Conta_CorrenteAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object cdsBanco_Conta_CorrenteCONTA: TStringField
      DisplayLabel = 'Conta Corrente'
      FieldName = 'CONTA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dsBanco: TDataSource
    DataSet = cdsBanco
    Left = 272
    Top = 16
  end
  object cdsFinanciador: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqFinanciador'
    RemoteServer = dmPrincipal.ProviderFinanceiro
    Left = 400
    Top = 160
    object cdsFinanciadorID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFinanciadorNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsFinanciadorID_PESSOA: TIntegerField
      DisplayLabel = 'Contato'
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
end