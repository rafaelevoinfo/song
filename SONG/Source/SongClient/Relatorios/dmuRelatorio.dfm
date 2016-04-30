inherited dmRelatorio: TdmRelatorio
  OldCreateOrder = True
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
  object cdsSaldoDetalhado: TRFClientDataSet
    Active = True
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PROJETO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_FUNDO'
        ParamType = ptInput
      end>
    ProviderName = 'dspqSaldoDetalhado'
    RemoteServer = dmPrincipal.ProviderRelatorio
    Left = 176
    Top = 96
    object cdsSaldoDetalhadoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      Required = True
      FixedChar = True
      Size = 7
    end
    object cdsSaldoDetalhadoORIGEM: TStringField
      FieldName = 'ORIGEM'
      Origin = 'ORIGEM'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdsSaldoDetalhadoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdsSaldoDetalhadoVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      ProviderFlags = []
      Required = True
      Precision = 18
      Size = 2
    end
    object dtfldSaldoDetalhadoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = []
    end
    object cdsSaldoDetalhadoPROJETO_FUNDO: TStringField
      FieldName = 'PROJETO_FUNDO'
      Origin = 'PROJETO_FUNDO'
      ProviderFlags = []
      Size = 100
    end
  end
end
