inherited smRelatorio: TsmRelatorio
  object qSaldoProjeto: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Projeto.id,'
      '       Projeto.Nome,'
      '       Projeto.Orcamento,'
      
        '       sum(View_Rubrica_Projeto.Valor_Recebido) as Valor_Recebid' +
        'o,'
      '       sum(View_Rubrica_Projeto.Valor_Gasto) as Valor_Gasto,'
      '       sum(View_Rubrica_Projeto.Saldo_Real) as Saldo_Real,'
      
        '       sum(View_Rubrica_Projeto.Saldo_Previsto) as Saldo_Previst' +
        'o'
      'from Projeto'
      
        'left join View_Rubrica_Projeto on (View_Rubrica_Projeto.Id_Proje' +
        'to = Projeto.Id)'
      'where Projeto.Id = :Id_Projeto'
      'group by Projeto.id, Projeto.Nome, Projeto.Orcamento')
    Left = 48
    Top = 24
    ParamData = <
      item
        Name = 'ID_PROJETO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qSaldoProjetoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
    end
    object qSaldoProjetoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qSaldoProjetoORCAMENTO: TBCDField
      FieldName = 'ORCAMENTO'
      Origin = 'ORCAMENTO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qSaldoProjetoVALOR_RECEBIDO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_RECEBIDO'
      Origin = 'VALOR_RECEBIDO'
      ProviderFlags = []
      Precision = 18
    end
    object qSaldoProjetoVALOR_GASTO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_GASTO'
      Origin = 'VALOR_GASTO'
      ProviderFlags = []
      Precision = 18
      Size = 6
    end
    object qSaldoProjetoSALDO_REAL: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SALDO_REAL'
      Origin = 'SALDO_REAL'
      ProviderFlags = []
      Precision = 18
      Size = 6
    end
    object qSaldoProjetoSALDO_PREVISTO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SALDO_PREVISTO'
      Origin = 'SALDO_PREVISTO'
      ProviderFlags = []
      Precision = 18
      Size = 6
    end
  end
end
