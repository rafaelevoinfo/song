inherited smRelatorio: TsmRelatorio
  OldCreateOrder = True
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
      
        '       (Projeto.Orcamento - sum(View_Rubrica_Projeto.Valor_Gasto' +
        ')) as Saldo_Previsto'
      'from Projeto'
      
        'left join View_Rubrica_Projeto on (View_Rubrica_Projeto.Id_Proje' +
        'to = Projeto.Id)'
      'where Projeto.Id = :Id_Projeto or :Id_Projeto is null'
      'group by Projeto.id, Projeto.Nome, Projeto.Orcamento')
    Left = 48
    Top = 24
    ParamData = <
      item
        Name = 'ID_PROJETO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
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
  object qSaldoDetalhado: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select '#39'Despesas'#39' as Tipo,'
      '       Coalesce(Projeto.nome,Fundo.nome) as Projeto_Fundo,'
      '       Fin_For_Cli.Nome_Fantasia as Origem,'
      '       Conta_Pagar.Descricao,'
      '       Conta_Pagar_Vinculo.Valor,'
      '       (select first 1 Conta_Pagar_Parcela.Vencimento'
      '        from Conta_Pagar_Parcela'
      
        '        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_V' +
        'inculo.Id_Conta_Pagar) as Data'
      'from Conta_Pagar_Vinculo'
      
        'inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Vinculo.' +
        'Id_Conta_Pagar)'
      
        'inner join Fin_For_Cli on (Fin_For_Cli.Id = Conta_Pagar.Id_Forne' +
        'cedor)'
      
        'left join projeto on (projeto.id = Conta_Pagar_Vinculo.id_projet' +
        'o_origem)'
      'left join fundo on (fundo.id = Conta_Pagar_Vinculo.id_fundo)'
      
        'where Conta_Pagar_Vinculo.Id_Projeto_Origem = :Id_Projeto or Con' +
        'ta_Pagar_Vinculo.Id_Fundo = :Id_Fundo'
      ''
      'union all'
      ''
      'select '#39'Receitas'#39' as Tipo,'
      '       Projeto.nome as Projeto_Fundo,'
      '       Fin_For_Cli.Nome_Fantasia as Origem,'
      
        '       '#39'Recebimento de '#39' || Projeto_Financiador_Pagto.Percentual' +
        ' || '#39'% do valor do projeto'#39' as Descricao,'
      '       Projeto_Financiador_Pagto.Valor,'
      '       Projeto_Financiador_Pagto.Data'
      'from Projeto_Financiador'
      
        'inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pag' +
        'to.Id_Projeto_Financiador = Projeto_Financiador.Id)'
      
        'inner join Fin_For_Cli on (Fin_For_Cli.Id = Projeto_Financiador.' +
        'id_financiador)'
      
        'inner join projeto on (projeto.id = projeto_financiador.id_proje' +
        'to)'
      'where Projeto_Financiador.Id_Projeto = :Id_Projeto'
      ''
      'union all'
      ''
      'select '#39'Receitas'#39' as Tipo,'
      '       Fundo.nome as Projeto_Fundo,'
      '       Fin_For_Cli.nome_fantasia as Origem,'
      '       Conta_Receber.Descricao,'
      '       Conta_Receber_Vinculo.Valor,'
      '       (select first 1 Conta_Receber_Parcela.Vencimento'
      '        from Conta_Receber_Parcela'
      
        '        where Conta_Receber_Parcela.Id_Conta_Receber = Conta_Rec' +
        'eber_Vinculo.Id_Conta_Receber) as Data'
      'from Conta_Receber_Vinculo'
      
        'inner join Conta_Receber on (Conta_Receber.Id = Conta_Receber_Vi' +
        'nculo.id_conta_receber)'
      
        'inner join Fin_For_Cli on (Fin_For_Cli.Id = Conta_Receber.id_cli' +
        'ente_financiador)'
      'inner join fundo on (fundo.id =  conta_receber_vinculo.id_fundo)'
      'where Conta_Receber_Vinculo.Id_Fundo = :Id_Fundo     ')
    Left = 152
    Top = 32
    ParamData = <
      item
        Name = 'ID_PROJETO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ID_FUNDO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qSaldoDetalhadoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      Required = True
      FixedChar = True
      Size = 8
    end
    object qSaldoDetalhadoORIGEM: TStringField
      FieldName = 'ORIGEM'
      Origin = 'ORIGEM'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object qSaldoDetalhadoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object qSaldoDetalhadoVALOR: TBCDField
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
    object qSaldoDetalhadoPROJETO_FUNDO: TStringField
      FieldName = 'PROJETO_FUNDO'
      Origin = 'PROJETO_FUNDO'
      ProviderFlags = []
      Size = 100
    end
  end
end
