inherited smRelatorio: TsmRelatorio
  OldCreateOrder = True
  Height = 390
  Width = 551
  object qSaldo_Rubrica: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select distinct view_rubrica_projeto.id_rubrica,'
      '                view_rubrica_projeto.id_projeto,'
      '                view_rubrica_projeto.nome_projeto,'
      '                Rubrica.Nome as Nome_Rubrica,'
      '                view_rubrica_projeto.orcamento,'
      '                case'
      
        '                    when view_rubrica_projeto.valor_gasto_transf' +
        'erido > view_rubrica_projeto.valor_recebido_transferido then'
      
        '                        view_rubrica_projeto.valor_gasto + (view' +
        '_rubrica_projeto.valor_gasto_transferido - view_rubrica_projeto.' +
        'valor_recebido_transferido)'
      '                       else'
      '                        view_rubrica_projeto.valor_gasto'
      '                end as Gasto,'
      '                 case'
      
        '                    when view_rubrica_projeto.valor_gasto_transf' +
        'erido < view_rubrica_projeto.valor_recebido_transferido then'
      
        '                        view_rubrica_projeto.valor_recebido + (v' +
        'iew_rubrica_projeto.valor_recebido_transferido - view_rubrica_pr' +
        'ojeto.valor_gasto_transferido)'
      '                       else'
      '                        view_rubrica_projeto.valor_recebido'
      '                end as Recebido,'
      
        '                view_rubrica_projeto.valor_aprovisionado as Apro' +
        'visionado,'
      '                view_rubrica_projeto.saldo_real'
      ''
      'from view_rubrica_projeto'
      
        'inner join rubrica on (rubrica.id = view_rubrica_projeto.id_rubr' +
        'ica)'
      
        'where (view_rubrica_projeto.id_projeto = :Id_Projeto) or (:ID_PR' +
        'OJETO IS null)'
      
        'order by view_rubrica_projeto.id_projeto,view_rubrica_projeto.id' +
        '_rubrica'
      '         ')
    Left = 40
    Top = 24
    ParamData = <
      item
        Name = 'ID_PROJETO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qSaldo_RubricaID_RUBRICA: TIntegerField
      FieldName = 'ID_RUBRICA'
      Origin = 'ID_RUBRICA'
      ProviderFlags = []
    end
    object qSaldo_RubricaID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      Origin = 'ID_PROJETO'
      ProviderFlags = []
    end
    object qSaldo_RubricaNOME_PROJETO: TStringField
      FieldName = 'NOME_PROJETO'
      Origin = 'NOME_PROJETO'
      ProviderFlags = []
      Size = 100
    end
    object qSaldo_RubricaNOME_RUBRICA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_RUBRICA'
      Origin = 'NOME_RUBRICA'
      ProviderFlags = []
      ReadOnly = True
      Size = 123
    end
    object qSaldo_RubricaRECEBIDO: TBCDField
      FieldName = 'RECEBIDO'
      Origin = 'VALOR_RECEBIDO'
      ProviderFlags = []
      Precision = 18
    end
    object qSaldo_RubricaGASTO: TFMTBCDField
      FieldName = 'GASTO'
      Origin = 'VALOR_GASTO'
      ProviderFlags = []
      Precision = 18
      Size = 6
    end
    object qSaldo_RubricaAPROVISIONADO: TFMTBCDField
      FieldName = 'APROVISIONADO'
      Origin = 'VALOR_APROVISIONADO'
      ProviderFlags = []
      Precision = 18
      Size = 6
    end
    object qSaldo_RubricaSALDO_REAL: TFMTBCDField
      FieldName = 'SALDO_REAL'
      Origin = 'SALDO_REAL'
      ProviderFlags = []
      Precision = 18
      Size = 6
    end
    object qSaldo_RubricaORCAMENTO: TBCDField
      FieldName = 'ORCAMENTO'
      Origin = 'ORCAMENTO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
  end
  object qSaldo_Semente_Muda: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Especie.Nome,'
      '       Especie.Nome_Cientifico,'
      '       familia_botanica.nome as Familia_Botanica,'
      '       Especie.Qtde_Semente_Estoque,'
      '       Especie.Qtde_Muda_Pronta,'
      '       Especie.Qtde_Muda_Desenvolvimento'
      'from Especie'
      
        'inner join familia_botanica on (especie.id_familia_botanica = fa' +
        'milia_botanica.id)'
      'where Especie.id = :ID_ESPECIE OR :ID_ESPECIE IS NULL'
      'order by Especie.Nome')
    Left = 200
    Top = 48
    ParamData = <
      item
        Name = 'ID_ESPECIE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qSaldo_Semente_MudaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qSaldo_Semente_MudaNOME_CIENTIFICO: TStringField
      FieldName = 'NOME_CIENTIFICO'
      Origin = 'NOME_CIENTIFICO'
      ProviderFlags = []
      Size = 100
    end
    object qSaldo_Semente_MudaFAMILIA_BOTANICA: TStringField
      FieldName = 'FAMILIA_BOTANICA'
      Origin = 'FAMILIA_BOTANICA'
      ProviderFlags = []
      Size = 100
    end
    object qSaldo_Semente_MudaQTDE_SEMENTE_ESTOQUE: TBCDField
      FieldName = 'QTDE_SEMENTE_ESTOQUE'
      Origin = 'QTDE_SEMENTE_ESTOQUE'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qSaldo_Semente_MudaQTDE_MUDA_PRONTA: TIntegerField
      FieldName = 'QTDE_MUDA_PRONTA'
      Origin = 'QTDE_MUDA_PRONTA'
      ProviderFlags = []
    end
    object qSaldo_Semente_MudaQTDE_MUDA_DESENVOLVIMENTO: TIntegerField
      FieldName = 'QTDE_MUDA_DESENVOLVIMENTO'
      Origin = 'QTDE_MUDA_DESENVOLVIMENTO'
      ProviderFlags = []
    end
  end
  object qTaxas_Especie: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Especie.Id,'
      '       Especie.Nome,'
      '       Especie.Nome_Cientifico,'
      '       Familia_botanica.nome as Familia_Botanica,'
      '       Especie.Tempo_Germinacao,'
      '       Especie.Tempo_Desenvolvimento,'
      '       Especie.Qtde_Semente_kilo,'
      '       Especie.Qtde_Semente_Estoque,'
      '       Especie.Qtde_Muda_Desenvolvimento,'
      '       Especie.Qtde_Muda_Pronta,'
      
        '       sum(Lote_Muda.Taxa_Classificacao) / count(Lote_Muda.Id) a' +
        's Taxa_Classificacao,'
      
        '       sum(Lote_Semente.Taxa_Germinacao) / count(Lote_Semente.Id' +
        ') as Taxa_Germinacao'
      'from Especie'
      
        'inner join familia_botanica on (especie.id_familia_botanica = fa' +
        'milia_botanica.id)'
      
        'left join Lote_Muda on (Lote_Muda.Id_Especie = Especie.Id and Lo' +
        'te_Muda.Id_Compra_Item is null and Lote_Muda.Id_Lote_Semente is ' +
        'not null)'
      'left join Lote_Semente on (Lote_Semente.Id_Especie = Especie.Id)'
      'where Especie.Tempo_Germinacao is not null and'
      '      Especie.Tempo_Desenvolvimento is not null'
      'group by 1,2,3,4,5,6,7,8,9,10')
    Left = 344
    Top = 48
    object qTaxas_EspecieID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
    end
    object qTaxas_EspecieNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qTaxas_EspecieNOME_CIENTIFICO: TStringField
      FieldName = 'NOME_CIENTIFICO'
      Origin = 'NOME_CIENTIFICO'
      ProviderFlags = []
      Size = 100
    end
    object qTaxas_EspecieFAMILIA_BOTANICA: TStringField
      FieldName = 'FAMILIA_BOTANICA'
      Origin = 'FAMILIA_BOTANICA'
      ProviderFlags = []
      Size = 100
    end
    object qTaxas_EspecieTEMPO_GERMINACAO: TIntegerField
      FieldName = 'TEMPO_GERMINACAO'
      Origin = 'TEMPO_GERMINACAO'
      ProviderFlags = []
    end
    object qTaxas_EspecieTEMPO_DESENVOLVIMENTO: TIntegerField
      FieldName = 'TEMPO_DESENVOLVIMENTO'
      Origin = 'TEMPO_DESENVOLVIMENTO'
      ProviderFlags = []
    end
    object qTaxas_EspecieTAXA_CLASSIFICACAO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TAXA_CLASSIFICACAO'
      Origin = 'TAXA_CLASSIFICACAO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qTaxas_EspecieTAXA_GERMINACAO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TAXA_GERMINACAO'
      Origin = 'TAXA_GERMINACAO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qTaxas_EspecieQTDE_SEMENTE_ESTOQUE: TBCDField
      FieldName = 'QTDE_SEMENTE_ESTOQUE'
      Origin = 'QTDE_SEMENTE_ESTOQUE'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qTaxas_EspecieQTDE_MUDA_DESENVOLVIMENTO: TIntegerField
      FieldName = 'QTDE_MUDA_DESENVOLVIMENTO'
      Origin = 'QTDE_MUDA_DESENVOLVIMENTO'
      ProviderFlags = []
    end
    object qTaxas_EspecieQTDE_MUDA_PRONTA: TIntegerField
      FieldName = 'QTDE_MUDA_PRONTA'
      Origin = 'QTDE_MUDA_PRONTA'
      ProviderFlags = []
    end
    object qTaxas_EspecieQTDE_SEMENTE_KILO: TIntegerField
      FieldName = 'QTDE_SEMENTE_KILO'
      Origin = 'QTDE_SEMENTE_KILO'
      ProviderFlags = []
    end
  end
  object qPatrimonio: TRFQuery
    OnCalcFields = qPatrimonioCalcFields
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Patrimonio.Identificacao,'
      '       Patrimonio.ID_ITEM_PATRIMONIO,'
      '       Item_Patrimonio.Nome as Nome_Item,'
      '       Patrimonio.Data_Aquisicao,'
      '       Patrimonio.Valor_Inicial,'
      '       Patrimonio.Localizacao,'
      '       Patrimonio.Taxa_Depreciacao_Anual,'
      '       Patrimonio.Status'
      'from Patrimonio'
      
        'inner join Item_Patrimonio on (Item_Patrimonio.Id = Patrimonio.I' +
        'd_Item_Patrimonio) '
      '&WHERE'
      'Order by Patrimonio.ID_ITEM_PATRIMONIO, Patrimonio.Identificacao')
    Left = 336
    Top = 160
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qPatrimonioIDENTIFICACAO: TStringField
      FieldName = 'IDENTIFICACAO'
      Origin = 'IDENTIFICACAO'
      ProviderFlags = []
    end
    object qPatrimonioNOME_ITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_ITEM'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qPatrimonioDATA_AQUISICAO: TSQLTimeStampField
      FieldName = 'DATA_AQUISICAO'
      Origin = 'DATA_AQUISICAO'
      ProviderFlags = []
      Required = True
    end
    object qPatrimonioVALOR_INICIAL: TBCDField
      FieldName = 'VALOR_INICIAL'
      Origin = 'VALOR_INICIAL'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qPatrimonioLOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      Origin = 'LOCALIZACAO'
      ProviderFlags = []
      Size = 100
    end
    object qPatrimonioSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = []
    end
    object qPatrimonioCALC_VALOR_ATUAL: TBCDField
      FieldKind = fkCalculated
      FieldName = 'CALC_VALOR_ATUAL'
      ProviderFlags = []
      Precision = 18
      Size = 2
      Calculated = True
    end
    object qPatrimonioTAXA_DEPRECIACAO_ANUAL: TIntegerField
      FieldName = 'TAXA_DEPRECIACAO_ANUAL'
      Origin = 'TAXA_DEPRECIACAO_ANUAL'
      ProviderFlags = []
    end
    object qPatrimonioID_ITEM_PATRIMONIO: TIntegerField
      FieldName = 'ID_ITEM_PATRIMONIO'
      Origin = 'ID_ITEM_PATRIMONIO'
      ProviderFlags = []
      Required = True
    end
  end
  object qGasto_Area_Atuacao: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select sum(Conta_Pagar_Parcela.Valor) as Gasto,'
      '       Conta_Pagar_Vinculo.Id_Area_Atuacao_Origem,'
      '       Projeto_Area.Nome as Area_Atuacao'
      'from Conta_Pagar_Parcela'
      
        'inner join Conta_Pagar on (Conta_Pagar_Parcela.Id_Conta_Pagar = ' +
        'Conta_Pagar.Id)'
      
        'inner join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Conta_' +
        'Pagar = Conta_Pagar.Id)'
      
        'inner join Projeto_Area on (Projeto_Area.Id = Conta_Pagar_Vincul' +
        'o.Id_Area_Atuacao_Origem)'
      
        'where (:Todas_Datas = 1) or (Conta_Pagar_Parcela.Vencimento betw' +
        'een :Data_Inicial and :Data_Final)'
      
        'group by Conta_Pagar_Vinculo.Id_Area_Atuacao_Origem, Projeto_Are' +
        'a.Nome')
    Left = 152
    Top = 176
    ParamData = <
      item
        Name = 'TODAS_DATAS'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA_INICIAL'
        DataType = ftTimeStamp
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA_FINAL'
        DataType = ftTimeStamp
        ParamType = ptInput
        Value = Null
      end>
    object qGasto_Area_AtuacaoGASTO: TBCDField
      FieldName = 'GASTO'
      Origin = 'GASTO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qGasto_Area_AtuacaoID_AREA_ATUACAO_ORIGEM: TIntegerField
      FieldName = 'ID_AREA_ATUACAO_ORIGEM'
      Origin = 'ID_AREA_ATUACAO_ORIGEM'
      ProviderFlags = []
    end
    object qGasto_Area_AtuacaoAREA_ATUACAO: TStringField
      FieldName = 'AREA_ATUACAO'
      Origin = 'AREA_ATUACAO'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
end
