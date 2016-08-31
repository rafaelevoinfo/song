inherited smFuncoesRelatorio: TsmFuncoesRelatorio
  inherited qId: TRFQuery
    Left = 160
    Top = 40
  end
  object qMovimentacao: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select View_Movimentacao_Financeira.Id_Movimentacao,'
      '       View_Movimentacao_Financeira.Id_Organizacao,'
      '       View_Movimentacao_Financeira.Nome_Organizacao,'
      '       View_Movimentacao_Financeira.Id_Origem_Recurso,'
      '       View_Movimentacao_Financeira.Id_Unico_Origem_Recurso,'
      '       View_Movimentacao_Financeira.Origem_Recurso,'
      '       View_Movimentacao_Financeira.Tipo,'
      '       View_Movimentacao_Financeira.Descricao_Tipo,'
      '       View_Movimentacao_Financeira.Descricao_Movimentacao,'
      '       View_Movimentacao_Financeira.Data,'
      '       View_Movimentacao_Financeira.Data_Pagamento_Recebimento,'
      '       View_Movimentacao_Financeira.Forma_Pagamento_Recebimento,'
      '       View_Movimentacao_Financeira.Valor_Total,'
      '       View_Movimentacao_Financeira.Valor_Total_Pago_Recebido,'
      
        '       Sum(View_Movimentacao_Financeira.Valor_Total) as Valor_To' +
        'tal_Organizacao,'
      
        '       Sum(View_Movimentacao_Financeira.Valor_Total_Pago_Recebid' +
        'o) as Valor_Total_Pago_Recebido_Organizacao'
      'from View_Movimentacao_Financeira '
      
        'where (View_Movimentacao_Financeira.Data between :data_inicial a' +
        'nd :data_final) or (:todas_datas = 1)'
      'group by View_Movimentacao_Financeira.Id_Movimentacao,'
      '       View_Movimentacao_Financeira.Id_Organizacao,'
      '       View_Movimentacao_Financeira.Nome_Organizacao,'
      '       View_Movimentacao_Financeira.Id_Origem_Recurso,'
      '       View_Movimentacao_Financeira.Id_Unico_Origem_Recurso,'
      '       View_Movimentacao_Financeira.Origem_Recurso,'
      '       View_Movimentacao_Financeira.Tipo,'
      '       View_Movimentacao_Financeira.Descricao_Tipo,'
      '       View_Movimentacao_Financeira.Descricao_Movimentacao,'
      '       View_Movimentacao_Financeira.Data,'
      '       View_Movimentacao_Financeira.Data_Pagamento_Recebimento,'
      '       View_Movimentacao_Financeira.Forma_Pagamento_Recebimento,'
      '       View_Movimentacao_Financeira.Valor_Total,'
      '       View_Movimentacao_Financeira.Valor_Total_Pago_Recebido'
      'ORDER BY '
      ' View_Movimentacao_Financeira.Id_Organizacao,'
      ' View_Movimentacao_Financeira.Origem_Recurso, '
      ' View_Movimentacao_Financeira.Id_Unico_Origem_Recurso,'
      ' View_Movimentacao_Financeira.Tipo')
    Left = 256
    Top = 176
    ParamData = <
      item
        Name = 'DATA_INICIAL'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA_FINAL'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TODAS_DATAS'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qMovimentacaoID_MOVIMENTACAO: TIntegerField
      FieldName = 'ID_MOVIMENTACAO'
      Origin = 'ID_MOVIMENTACAO'
    end
    object qMovimentacaoID_ORGANIZACAO: TIntegerField
      FieldName = 'ID_ORGANIZACAO'
      Origin = 'ID_ORGANIZACAO'
    end
    object qMovimentacaoNOME_ORGANIZACAO: TStringField
      FieldName = 'NOME_ORGANIZACAO'
      Origin = 'NOME_ORGANIZACAO'
      Size = 100
    end
    object qMovimentacaoID_ORIGEM_RECURSO: TIntegerField
      FieldName = 'ID_ORIGEM_RECURSO'
      Origin = 'ID_ORIGEM_RECURSO'
    end
    object qMovimentacaoID_UNICO_ORIGEM_RECURSO: TStringField
      FieldName = 'ID_UNICO_ORIGEM_RECURSO'
      Origin = 'ID_UNICO_ORIGEM_RECURSO'
      Size = 19
    end
    object qMovimentacaoORIGEM_RECURSO: TStringField
      FieldName = 'ORIGEM_RECURSO'
      Origin = 'ORIGEM_RECURSO'
      Size = 100
    end
    object qMovimentacaoTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
    object qMovimentacaoDESCRICAO_TIPO: TStringField
      FieldName = 'DESCRICAO_TIPO'
      Origin = 'DESCRICAO_TIPO'
      FixedChar = True
      Size = 8
    end
    object qMovimentacaoDESCRICAO_MOVIMENTACAO: TStringField
      FieldName = 'DESCRICAO_MOVIMENTACAO'
      Origin = 'DESCRICAO_MOVIMENTACAO'
      Size = 124
    end
    object qMovimentacaoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qMovimentacaoDATA_PAGAMENTO_RECEBIMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO_RECEBIMENTO'
      Origin = 'DATA_PAGAMENTO_RECEBIMENTO'
    end
    object qMovimentacaoFORMA_PAGAMENTO_RECEBIMENTO: TIntegerField
      FieldName = 'FORMA_PAGAMENTO_RECEBIMENTO'
      Origin = 'FORMA_PAGAMENTO_RECEBIMENTO'
    end
    object qMovimentacaoVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object qMovimentacaoVALOR_TOTAL_PAGO_RECEBIDO: TBCDField
      FieldName = 'VALOR_TOTAL_PAGO_RECEBIDO'
      Origin = 'VALOR_TOTAL_PAGO_RECEBIDO'
      Precision = 18
      Size = 2
    end
    object qMovimentacaoVALOR_TOTAL_ORGANIZACAO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TOTAL_ORGANIZACAO'
      Origin = 'VALOR_TOTAL_ORGANIZACAO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qMovimentacaoVALOR_TOTAL_PAGO_RECEBIDO_ORGAN: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TOTAL_PAGO_RECEBIDO_ORGAN'
      Origin = 'VALOR_TOTAL_PAGO_RECEBIDO_ORGAN'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object cdsSaldo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 41
    Top = 40
    object cdsSaldoID_ORGANIZACAO: TIntegerField
      FieldName = 'ID_ORGANIZACAO'
      ProviderFlags = []
    end
    object cdsSaldoNOME_ORGANIZACAO: TStringField
      FieldName = 'NOME_ORGANIZACAO'
      ProviderFlags = []
      Size = 100
    end
    object cdsSaldoID_PROJETO_FUNDO: TIntegerField
      FieldName = 'ID_PROJETO_FUNDO'
      ProviderFlags = []
    end
    object cdsSaldoNOME_PROJETO_FUNDO: TStringField
      FieldName = 'NOME_PROJETO_FUNDO'
      ProviderFlags = []
      Size = 100
    end
    object cdsSaldoSALDO: TBCDField
      FieldName = 'SALDO'
      ProviderFlags = []
    end
    object cdsSaldoSALDO_GERAL: TBCDField
      FieldName = 'SALDO_GERAL'
      ProviderFlags = []
    end
    object cdsSaldoTIPO_ORIGEM: TIntegerField
      FieldName = 'TIPO_ORIGEM'
    end
  end
end
