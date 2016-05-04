inherited smFuncoesRelatorio: TsmFuncoesRelatorio
  object qMovimentacao: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select View_Movimentacao_Financeira.Id_Movimentacao,'
      '       View_Movimentacao_Financeira.Id_Organizacao,'
      '       View_Movimentacao_Financeira.Nome_Organizacao,'
      '       View_Movimentacao_Financeira.Tipo_Origem_Recurso,'
      '       View_Movimentacao_Financeira.Id_Origem_Recurso,'
      '       View_Movimentacao_Financeira.Origem_Recurso,'
      '       View_Movimentacao_Financeira.Tipo,'
      '       View_Movimentacao_Financeira.Descricao_Tipo,'
      '       View_Movimentacao_Financeira.Descricao_Movimentacao,'
      '       View_Movimentacao_Financeira.Data,'
      '       View_Movimentacao_Financeira.valor_total,'
      '       View_Movimentacao_Financeira.valor_parcial,'
      '       View_Movimentacao_Financeira.Valor_Real'
      'from View_Movimentacao_Financeira  '
      
        'where (View_Movimentacao_Financeira.Data between :data_inicial a' +
        'nd :data_final) or (:todas_datas = 1)'
      
        'ORDER BY View_Movimentacao_Financeira.Id_Movimentacao, View_Movi' +
        'mentacao_Financeira.Id_Origem_Recurso, View_Movimentacao_Finance' +
        'ira.Id_Organizacao')
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
      ProviderFlags = []
    end
    object qMovimentacaoID_ORGANIZACAO: TIntegerField
      FieldName = 'ID_ORGANIZACAO'
      Origin = 'ID_ORGANIZACAO'
      ProviderFlags = []
    end
    object qMovimentacaoNOME_ORGANIZACAO: TStringField
      FieldName = 'NOME_ORGANIZACAO'
      Origin = 'NOME_ORGANIZACAO'
      ProviderFlags = []
      Size = 100
    end
    object qMovimentacaoTIPO_ORIGEM_RECURSO: TIntegerField
      FieldName = 'TIPO_ORIGEM_RECURSO'
      Origin = 'TIPO_ORIGEM_RECURSO'
      ProviderFlags = []
    end
    object qMovimentacaoID_ORIGEM_RECURSO: TIntegerField
      FieldName = 'ID_ORIGEM_RECURSO'
      Origin = 'ID_ORIGEM_RECURSO'
      ProviderFlags = []
    end
    object qMovimentacaoORIGEM_RECURSO: TStringField
      FieldName = 'ORIGEM_RECURSO'
      Origin = 'ORIGEM_RECURSO'
      ProviderFlags = []
      Size = 100
    end
    object qMovimentacaoTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
    end
    object qMovimentacaoDESCRICAO_TIPO: TStringField
      FieldName = 'DESCRICAO_TIPO'
      Origin = 'DESCRICAO_TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 7
    end
    object qMovimentacaoDESCRICAO_MOVIMENTACAO: TStringField
      FieldName = 'DESCRICAO_MOVIMENTACAO'
      Origin = 'DESCRICAO_MOVIMENTACAO'
      ProviderFlags = []
      Size = 100
    end
    object qMovimentacaoVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qMovimentacaoVALOR_PARCIAL: TBCDField
      FieldName = 'VALOR_PARCIAL'
      Origin = 'VALOR_PARCIAL'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qMovimentacaoVALOR_REAL: TBCDField
      FieldName = 'VALOR_REAL'
      Origin = 'VALOR_REAL'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
  end
end
