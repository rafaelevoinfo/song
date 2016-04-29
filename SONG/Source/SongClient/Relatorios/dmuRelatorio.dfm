inherited dmRelatorio: TdmRelatorio
  Height = 220
  Width = 386
  object cdsSaldoProjeto: TRFClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PROJETO'
        ParamType = ptInput
      end>
    ProviderName = 'dspqSaldoProjeto'
    RemoteServer = dmPrincipal.ProviderRelatorio
    Left = 72
    Top = 48
    object cdsSaldoProjetoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
    end
    object cdsSaldoProjetoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsSaldoProjetoORCAMENTO: TBCDField
      FieldName = 'ORCAMENTO'
      Origin = 'ORCAMENTO'
      ProviderFlags = []
      DisplayFormat = 'R$ ,0.00'
      Precision = 18
      Size = 2
    end
    object cdsSaldoProjetoVALOR_RECEBIDO: TBCDField
      FieldName = 'VALOR_RECEBIDO'
      Origin = 'VALOR_RECEBIDO'
      ProviderFlags = []
      DisplayFormat = 'R$ ,0.00'
      Precision = 18
    end
    object cdsSaldoProjetoVALOR_GASTO: TFMTBCDField
      FieldName = 'VALOR_GASTO'
      Origin = 'VALOR_GASTO'
      ProviderFlags = []
      DisplayFormat = 'R$ ,0.00'
      Precision = 18
      Size = 6
    end
    object cdsSaldoProjetoSALDO_REAL: TFMTBCDField
      FieldName = 'SALDO_REAL'
      Origin = 'SALDO_REAL'
      ProviderFlags = []
      DisplayFormat = 'R$ ,0.00'
      Precision = 18
      Size = 6
    end
    object cdsSaldoProjetoSALDO_PREVISTO: TFMTBCDField
      FieldName = 'SALDO_PREVISTO'
      Origin = 'SALDO_PREVISTO'
      ProviderFlags = []
      DisplayFormat = 'R$ ,0.00'
      Precision = 18
      Size = 6
    end
  end
end
