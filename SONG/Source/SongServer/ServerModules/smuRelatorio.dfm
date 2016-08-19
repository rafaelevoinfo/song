inherited smRelatorio: TsmRelatorio
  OldCreateOrder = True
  Height = 390
  Width = 995
  inherited qAux: TRFQuery
    Left = 944
    Top = 16
  end
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
    Left = 796
    Top = 16
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
    Left = 204
    Top = 124
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
    Left = 56
    Top = 124
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
    Left = 648
    Top = 16
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
      
        'select coalesce(round(sum(Conta_Pagar_Vinculo.Valor * coalesce((' +
        'Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total), 0)),2), 0)' +
        ' as Gasto,'
      '       Conta_Pagar_Vinculo.Id_Area_Atuacao_Origem,'
      '       Projeto_Area.Nome as Area_Atuacao,'
      '       Projeto.nome as Projeto'
      'from Conta_Pagar_Parcela'
      
        'inner join Conta_Pagar on (Conta_Pagar_Parcela.Id_Conta_Pagar = ' +
        'Conta_Pagar.Id)'
      
        'inner join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Conta_' +
        'Pagar = Conta_Pagar.Id)'
      
        'inner join Projeto_Area on (Projeto_Area.Id = Conta_Pagar_Vincul' +
        'o.Id_Area_Atuacao_Origem)'
      'inner join projeto on (projeto.id = projeto_area.id_projeto)'
      'where (Conta_Pagar_Parcela.Status = 1) and'
      
        '      ((:Todas_Datas = 1) or (Conta_Pagar_Parcela.Vencimento bet' +
        'ween :Data_Inicial and :Data_Final))'
      
        'group by Conta_Pagar_Vinculo.Id_Area_Atuacao_Origem, Projeto_Are' +
        'a.Nome,Projeto.nome'
      'order by Projeto.Nome'
      '  ')
    Left = 204
    Top = 16
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
    object qGasto_Area_AtuacaoGASTO: TFMTBCDField
      FieldName = 'GASTO'
      Origin = 'GASTO'
      Precision = 18
      Size = 6
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
    object qGasto_Area_AtuacaoPROJETO: TStringField
      FieldName = 'PROJETO'
      Origin = 'PROJETO'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object qTransferencia_Financeira: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Transferencia_Financeira.Id,'
      '       Transferencia_Financeira.Id_Pessoa,'
      '       Pessoa.Nome as Responsavel,'
      '       Transferencia_Financeira.Id_Fundo_Origem,'
      '       Fundo_Origem.Nome as Fundo_Origem,'
      '       Transferencia_Financeira.Id_Fundo_Destino,'
      '       Fundo_Destino.Nome as Fundo_Destino,'
      '       Transferencia_Financeira.Id_Projeto_Rubrica_Origem,'
      '       Projeto_Origem.Nome as Projeto_Origem,'
      '       Rubrica_Origem.Nome as Rubrica_Origem,'
      '       Transferencia_Financeira.Id_Projeto_Rubrica_Destino,'
      '       Projeto_Destino.Nome as Projeto_Destino,'
      '       Rubrica_Destino.Nome as Rubrica_Destino,'
      '       Transferencia_Financeira.Valor,'
      '       Transferencia_Financeira.Data,'
      '       Transferencia_Financeira.Tipo,'
      
        '       coalesce(Fundo_Origem.Nome, Projeto_Origem.Nome || '#39' - '#39' ' +
        '|| Rubrica_Origem.Nome) as Origem,'
      
        '       coalesce(Fundo_Destino.Nome, Projeto_Destino.Nome || '#39' - ' +
        #39' || Rubrica_Destino.Nome) as Destino'
      'from Transferencia_Financeira'
      
        'inner join pessoa on (pessoa.id = Transferencia_Financeira.Id_Pe' +
        'ssoa)'
      
        'left join Projeto_Rubrica Projeto_Rubrica_Origem on (Projeto_Rub' +
        'rica_Origem.Id = Transferencia_Financeira.Id_Projeto_Rubrica_Ori' +
        'gem)'
      
        'left join Projeto Projeto_Origem on (Projeto_Origem.Id = Projeto' +
        '_Rubrica_Origem.Id_Projeto)'
      
        'left join Rubrica Rubrica_Origem on (Rubrica_Origem.Id = Projeto' +
        '_Rubrica_Origem.Id_Rubrica)'
      
        'left join Projeto_Rubrica Projeto_Rubrica_Destino on (Projeto_Ru' +
        'brica_Destino.Id = Transferencia_Financeira.Id_Projeto_Rubrica_D' +
        'estino)'
      
        'left join Projeto Projeto_Destino on (Projeto_Destino.Id = Proje' +
        'to_Rubrica_Destino.Id_Projeto)'
      
        'left join Rubrica Rubrica_Destino on (Rubrica_Destino.Id = Proje' +
        'to_Rubrica_Destino.Id_Rubrica)'
      
        'left join Fundo Fundo_Origem on (Fundo_Origem.Id = Transferencia' +
        '_Financeira.Id_Fundo_Origem)'
      
        'left join Fundo Fundo_Destino on (Fundo_Destino.Id = Transferenc' +
        'ia_Financeira.Id_Fundo_Destino)  '
      '&WHERE')
    Left = 56
    Top = 16
    MacroData = <
      item
        Value = 'where Transferencia_Financeira.id = 0'
        Name = 'WHERE'
      end>
    object qTransferencia_FinanceiraID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qTransferencia_FinanceiraID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Origin = 'ID_PESSOA'
      ProviderFlags = []
      Required = True
    end
    object qTransferencia_FinanceiraID_FUNDO_ORIGEM: TIntegerField
      FieldName = 'ID_FUNDO_ORIGEM'
      Origin = 'ID_FUNDO_ORIGEM'
      ProviderFlags = []
    end
    object qTransferencia_FinanceiraFUNDO_ORIGEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FUNDO_ORIGEM'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qTransferencia_FinanceiraID_FUNDO_DESTINO: TIntegerField
      FieldName = 'ID_FUNDO_DESTINO'
      Origin = 'ID_FUNDO_DESTINO'
      ProviderFlags = []
    end
    object qTransferencia_FinanceiraFUNDO_DESTINO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FUNDO_DESTINO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qTransferencia_FinanceiraID_PROJETO_RUBRICA_ORIGEM: TIntegerField
      FieldName = 'ID_PROJETO_RUBRICA_ORIGEM'
      Origin = 'ID_PROJETO_RUBRICA_ORIGEM'
      ProviderFlags = []
    end
    object qTransferencia_FinanceiraPROJETO_ORIGEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PROJETO_ORIGEM'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qTransferencia_FinanceiraRUBRICA_ORIGEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RUBRICA_ORIGEM'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qTransferencia_FinanceiraID_PROJETO_RUBRICA_DESTINO: TIntegerField
      FieldName = 'ID_PROJETO_RUBRICA_DESTINO'
      Origin = 'ID_PROJETO_RUBRICA_DESTINO'
      ProviderFlags = []
    end
    object qTransferencia_FinanceiraPROJETO_DESTINO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PROJETO_DESTINO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qTransferencia_FinanceiraRUBRICA_DESTINO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RUBRICA_DESTINO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qTransferencia_FinanceiraVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      ProviderFlags = []
      Required = True
      Precision = 18
      Size = 2
    end
    object qTransferencia_FinanceiraDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = []
      Required = True
    end
    object qTransferencia_FinanceiraTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      Required = True
    end
    object qTransferencia_FinanceiraORIGEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ORIGEM'
      Origin = 'ORIGEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 203
    end
    object qTransferencia_FinanceiraDESTINO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESTINO'
      Origin = 'DESTINO'
      ProviderFlags = []
      ReadOnly = True
      Size = 203
    end
    object qTransferencia_FinanceiraRESPONSAVEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RESPONSAVEL'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object qGasto_Fornecedor: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select sum(Conta_Pagar_Parcela.Valor) as Valor_Pago,'
      '       Conta_Pagar.Id_Fornecedor,'
      '       Fin_For_Cli.Nome_Fantasia,'
      '       Fin_For_Cli.Razao_Social,'
      '       Fin_For_Cli.Cpf_Cnpj,'
      '       Conta_Pagar.Valor_Total,'
      '       Conta_Pagar_Parcela.Data_Pagamento'
      'from Conta_Pagar_Parcela'
      
        'inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.' +
        'Id_Conta_Pagar)'
      
        'inner join Fin_For_Cli on (Fin_For_Cli.Id = Conta_Pagar.Id_Forne' +
        'cedor)'
      'where (Conta_Pagar_Parcela.Status = 1)'
      '&AND'
      'group by Conta_Pagar.Id_Fornecedor,'
      '         Fin_For_Cli.Nome_Fantasia,'
      '         Fin_For_Cli.Razao_Social,'
      '         Fin_For_Cli.Cpf_Cnpj,'
      '         Conta_Pagar.Valor_Total,'
      '         Conta_Pagar_Parcela.Data_Pagamento'
      
        'order by Conta_Pagar.Id_Fornecedor,Conta_Pagar_Parcela.Data_Paga' +
        'mento ')
    Left = 500
    Top = 16
    MacroData = <
      item
        Value = Null
        Name = 'AND'
      end>
    object qGasto_FornecedorVALOR_PAGO: TBCDField
      FieldName = 'VALOR_PAGO'
      Origin = 'VALOR_PAGO'
      Precision = 18
      Size = 2
    end
    object qGasto_FornecedorID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      Origin = 'ID_FORNECEDOR'
      Required = True
    end
    object qGasto_FornecedorNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      Size = 100
    end
    object qGasto_FornecedorRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Required = True
      Size = 100
    end
    object qGasto_FornecedorCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Required = True
      Size = 18
    end
    object qGasto_FornecedorVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object qGasto_FornecedorDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
      Origin = 'DATA_PAGAMENTO'
    end
  end
  object qGasto_Atividade: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'with Pagamento'
      
        'as (select (sum(Conta_Pagar_Parcela.Valor) / Conta_Pagar.Valor_T' +
        'otal) as Percentual,'
      
        '                                                                ' +
        '      sum(Conta_Pagar_Parcela.Valor) as Valor_Pago,'
      
        '                                                                ' +
        '      count(*) as Qtde_Parcela_Paga,'
      
        '                                                                ' +
        '      Conta_Pagar_Parcela.Id_Conta_Pagar'
      '    from Conta_Pagar_Parcela'
      
        '    inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parc' +
        'ela.Id_Conta_Pagar)'
      '    where Conta_Pagar_Parcela.Status = 1'
      
        '    group by Conta_Pagar_Parcela.Id_Conta_Pagar, Conta_Pagar.Val' +
        'or_Total'
      ''
      ')'
      ''
      'select Atividade.Id,'
      '       Atividade.Nome,'
      '       Atividade.Id_Solicitante,'
      '       Atividade.Id_Responsavel,'
      '       Atividade.Data_Inicial,'
      '       Atividade.Data_Final,'
      '       Solicitante.Nome as Solicitante,'
      '       Responsavel.Nome as Responsavel,'
      '       Atividade.Status,'
      '       Atividade.Data_Inicial,'
      '       Atividade.Data_Final,'
      '       Conta_Pagar.Descricao,'
      '       Conta_Pagar_Vinculo.Valor,'
      '       case Pagamento.Percentual'
      '         when 1 then Conta_Pagar_Vinculo.Valor'
      '         else case'
      
        '                when Conta_Pagar_Vinculo.Id = (select first 1 Co' +
        'nta_Pagar_Vinculo.Id'
      
        '                                               from Conta_Pagar_' +
        'Vinculo'
      
        '                                               where Conta_Pagar' +
        '_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id'
      
        '                                               order by Conta_Pa' +
        'gar_Vinculo.Id desc) then'
      
        '                    Pagamento.Valor_Pago - (trunc((select sum(Ct' +
        'v.Valor * Pagamento.Percentual)'
      
        '                                                    from Conta_P' +
        'agar_Vinculo Ctv'
      
        '                                                    where Ctv.Id' +
        '_Conta_Pagar = Conta_Pagar.Id and'
      
        '                                                          Ctv.Id' +
        ' <> Conta_Pagar_Vinculo.Id), 2))'
      
        '                else trunc(Conta_Pagar_Vinculo.Valor * Pagamento' +
        '.Percentual, 2)'
      '              end'
      '       end as Valor_Pago'
      ''
      'from Atividade'
      
        'inner join Pessoa Solicitante on (Solicitante.Id = Atividade.Id_' +
        'Solicitante)'
      
        'inner join Pessoa Responsavel on (Responsavel.Id = Atividade.Id_' +
        'Responsavel)'
      
        'inner join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Ativid' +
        'ade_Origem = Atividade.Id)'
      
        'inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = ' +
        'Conta_Pagar.Id)'
      
        'inner join Pagamento on (Conta_Pagar.Id = Pagamento.Id_Conta_Pag' +
        'ar)'
      '&WHERE'
      'order by Atividade.Id ')
    Left = 352
    Top = 16
    MacroData = <
      item
        Value = 'where atividade.id = 0'
        Name = 'WHERE'
      end>
    object qGasto_AtividadeID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qGasto_AtividadeNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qGasto_AtividadeID_SOLICITANTE: TIntegerField
      FieldName = 'ID_SOLICITANTE'
      Origin = 'ID_SOLICITANTE'
      Required = True
    end
    object qGasto_AtividadeID_RESPONSAVEL: TIntegerField
      FieldName = 'ID_RESPONSAVEL'
      Origin = 'ID_RESPONSAVEL'
      Required = True
    end
    object qGasto_AtividadeSOLICITANTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SOLICITANTE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qGasto_AtividadeRESPONSAVEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RESPONSAVEL'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qGasto_AtividadeSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
    end
    object qGasto_AtividadeDATA_INICIAL: TSQLTimeStampField
      FieldName = 'DATA_INICIAL'
      Origin = 'DATA_INICIAL'
    end
    object qGasto_AtividadeDATA_FINAL: TSQLTimeStampField
      FieldName = 'DATA_FINAL'
      Origin = 'DATA_FINAL'
    end
    object qGasto_AtividadeDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qGasto_AtividadeVALOR: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR'
      Origin = 'VALOR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qGasto_AtividadeVALOR_PAGO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_PAGO'
      Origin = 'VALOR_PAGO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 6
    end
  end
  object qMatriz_Produtiva: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Lote_Semente.Id_Especie,'
      '       Especie.Nome as Especie,'
      '       Lote_Semente_Matriz.Id_Matriz,'
      '       Matriz.Nome as Matriz,'
      ''
      
        '       (sum((Lote_Semente.Taxa_Germinacao + Lote_Muda.Taxa_Class' +
        'ificacao) / 2) / count(*)) as Taxa'
      ''
      'from Lote_Semente'
      
        'inner join Lote_Semente_Matriz on (Lote_Semente.Id = Lote_Sement' +
        'e_Matriz.Id_Lote_Semente)'
      
        'inner join Lote_Muda on (Lote_Muda.Id_Lote_Semente = Lote_Sement' +
        'e.Id)'
      'inner join Especie on (Especie.Id = Lote_Semente.Id_Especie)'
      'inner join Matriz on (Matriz.Id = Lote_Semente_Matriz.Id_Matriz)'
      
        'left join log on (log.Tabela = '#39'LOTE_SEMENTE'#39' and log.Id_Tabela ' +
        '= Lote_Semente.Id and log.Operacao = 1)'
      'where Lote_Semente.Status = 1 and'
      '      Lote_Muda.Status = 1'
      '&AND'
      'group by Lote_Semente.Id_Especie,'
      '       Especie.Nome,'
      '       Lote_Semente_Matriz.Id_Matriz,'
      '       Matriz.Nome')
    Left = 336
    Top = 128
    MacroData = <
      item
        Value = Null
        Name = 'AND'
      end>
    object qMatriz_ProdutivaID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      Required = True
    end
    object qMatriz_ProdutivaESPECIE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ESPECIE'
      Origin = 'ESPECIE'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qMatriz_ProdutivaID_MATRIZ: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_MATRIZ'
      Origin = 'ID_MATRIZ'
      ProviderFlags = []
      ReadOnly = True
    end
    object qMatriz_ProdutivaMATRIZ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MATRIZ'
      Origin = 'MATRIZ'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qMatriz_ProdutivaTAXA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TAXA'
      Origin = 'TAXA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object qGasto_Plano_Contas: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Plano_Contas.Id,'
      '       Plano_Contas.Nome,'
      '       Projeto.Id as Id_Projeto,'
      '       Projeto.Nome as Projeto,'
      '       Fundo.Id as Id_Fundo,'
      '       Fundo.Nome as Nome_Fundo,'
      '       Rubrica.Id as Id_Rubrica,'
      '       Rubrica.Nome as Rubrica,'
      '       sum(Conta_Pagar.Valor_Total) as Valor_Total,'
      '       sum(Conta_Pagar_Parcela.Valor) as Valor_Pago'
      'from Plano_Contas'
      
        'inner join Conta_Pagar on (Conta_Pagar.Id_Plano_Contas = Plano_C' +
        'ontas.Id)'
      
        'left join Conta_Pagar_Parcela on (Conta_Pagar_Parcela.Id_Conta_P' +
        'agar = Conta_Pagar.Id and Conta_Pagar_Parcela.status = 1)'
      
        'inner join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Conta_' +
        'Pagar = Conta_Pagar.Id)'
      
        'left join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Pr' +
        'ojeto.Id)'
      
        'left join Rubrica on (Conta_Pagar_Vinculo.Id_Rubrica_Origem = Ru' +
        'brica.Id)'
      'left join Fundo on (Fundo.Id = Conta_Pagar_Vinculo.Id_Fundo)'
      'where ((Plano_Contas.Tipo = 0) or (Plano_Contas.Tipo is null))'
      '&AND'
      
        'group by Plano_Contas.Id, Plano_Contas.Nome, Projeto.Id, Projeto' +
        '.Nome, Rubrica.Id, Rubrica.Nome, Fundo.Id, Fundo.Nome'
      
        'order by Projeto.Nome, Fundo.Nome, Rubrica.Nome, Plano_Contas.No' +
        'me')
    Left = 472
    Top = 136
    MacroData = <
      item
        Value = Null
        Name = 'AND'
      end>
  end
  object qLote_Muda_Comprado: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Lote_Muda.Id,'
      '       Lote_Muda.Nome,'
      '       Lote_Muda.Id_Especie,'
      '       Especie.Nome as Especie,'
      '       Compra.Id_Fornecedor,'
      '       case'
      
        '         when Fin_For_Cli.Nome_Fantasia is null then Fin_For_Cli' +
        '.Razao_Social'
      
        '         else Fin_For_Cli.Razao_Social || '#39' ('#39' || Fin_For_Cli.No' +
        'me_Fantasia || '#39')'#39
      '       end as Fornecedor,'
      '       compra_item.qtde,'
      '       compra_item.valor_unitario,'
      '       (compra_item.valor_unitario * compra_item.qtde) as valor,'
      '       Lote_Muda.Data'
      'from Lote_Muda'
      
        'inner join Compra_Item on (Compra_Item.Id = Lote_Muda.Id_Compra_' +
        'Item)'
      'inner join Compra on (Compra.Id = Compra_Item.Id_Compra)'
      'inner join Especie on (Lote_Muda.Id_Especie = Especie.Id)'
      
        'inner join Fin_For_Cli on (Compra.Id_Fornecedor = Fin_For_Cli.Id' +
        ')'
      'where Lote_Muda.Id_Compra_Item is not null'
      '&AND'
      'order by Lote_Muda.Id_Especie  ')
    Left = 600
    Top = 136
    MacroData = <
      item
        Value = Null
        Name = 'AND'
      end>
    object qLote_Muda_CompradoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qLote_Muda_CompradoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qLote_Muda_CompradoID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      Required = True
    end
    object qLote_Muda_CompradoESPECIE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ESPECIE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qLote_Muda_CompradoID_FORNECEDOR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_FORNECEDOR'
      Origin = 'ID_FORNECEDOR'
      ProviderFlags = []
      ReadOnly = True
    end
    object qLote_Muda_CompradoFORNECEDOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 203
    end
    object qLote_Muda_CompradoVALOR_UNITARIO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qLote_Muda_CompradoVALOR: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR'
      Origin = 'VALOR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object qLote_Muda_CompradoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object qLote_Muda_CompradoQTDE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTDE'
      Origin = 'QTDE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object qLote_Semente_Comprado: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Lote_Semente.Id,'
      '       Lote_Semente.Nome,'
      '       Lote_Semente.Id_Especie,'
      '       Especie.Nome as Especie,'
      '       Compra.Id_Fornecedor,'
      '       case'
      
        '         when Fin_For_Cli.Nome_Fantasia is null then Fin_For_Cli' +
        '.Razao_Social'
      
        '         else Fin_For_Cli.Razao_Social || '#39' ('#39' || Fin_For_Cli.No' +
        'me_Fantasia || '#39')'#39
      '       end as Fornecedor,'
      ''
      '       compra_item.qtde,'
      '       compra_item.valor_unitario,'
      '       (compra_item.valor_unitario * compra_item.qtde) as valor,'
      '       Lote_Semente.Data'
      'from Lote_Semente'
      
        'inner join Compra_Item on (Compra_Item.Id = Lote_Semente.Id_Comp' +
        'ra_Item)'
      'inner join Compra on (Compra.Id = Compra_Item.Id_Compra)'
      'inner join Especie on (Lote_Semente.Id_Especie = Especie.Id)'
      
        'inner join Fin_For_Cli on (Compra.Id_Fornecedor = Fin_For_Cli.Id' +
        ')'
      'where Lote_Semente.Id_Compra_Item is not null '
      '&AND'
      'order by Lote_Semente.Id_Especie  ')
    Left = 744
    Top = 136
    MacroData = <
      item
        Value = Null
        Name = 'AND'
      end>
    object qLote_Semente_CompradoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qLote_Semente_CompradoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 30
    end
    object qLote_Semente_CompradoID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      Required = True
    end
    object qLote_Semente_CompradoESPECIE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ESPECIE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qLote_Semente_CompradoID_FORNECEDOR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_FORNECEDOR'
      Origin = 'ID_FORNECEDOR'
      ProviderFlags = []
      ReadOnly = True
    end
    object qLote_Semente_CompradoFORNECEDOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      ProviderFlags = []
      ReadOnly = True
      Size = 203
    end
    object qLote_Semente_CompradoVALOR_UNITARIO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qLote_Semente_CompradoVALOR: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR'
      Origin = 'VALOR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object qLote_Semente_CompradoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object qLote_Semente_CompradoQTDE: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTDE'
      Origin = 'QTDE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object qGasto_Plano_Contas_Detalhado: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Plano_Contas.Id,'
      '       Plano_Contas.Nome,'
      '       Projeto.Id as Id_Projeto,'
      '       Projeto.Nome as Projeto,'
      '       Fundo.Id as Id_Fundo,'
      '       Fundo.Nome as Nome_Fundo,'
      '       Rubrica.Id as Id_Rubrica,'
      '       Rubrica.Nome as Rubrica,'
      '       Conta_Pagar.Descricao,'
      '       Conta_Pagar.Valor_Total,'
      '       sum(Conta_Pagar_Parcela.Valor) as Valor_Pago'
      'from Plano_Contas'
      
        'inner join Conta_Pagar on (Conta_Pagar.Id_Plano_Contas = Plano_C' +
        'ontas.Id)'
      
        'left join Conta_Pagar_Parcela on (Conta_Pagar_Parcela.Id_Conta_P' +
        'agar = Conta_Pagar.Id and Conta_Pagar_Parcela.status = 1)'
      
        'inner join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Conta_' +
        'Pagar = Conta_Pagar.Id)'
      
        'left join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Pr' +
        'ojeto.Id)'
      
        'left join Rubrica on (Conta_Pagar_Vinculo.Id_Rubrica_Origem = Ru' +
        'brica.Id)'
      'left join Fundo on (Fundo.Id = Conta_Pagar_Vinculo.Id_Fundo)'
      'where ((Plano_Contas.Tipo = 0) or (Plano_Contas.Tipo is null))'
      '&AND'
      'group by Plano_Contas.Id,'
      '         Plano_Contas.Nome,'
      '         Projeto.Id,'
      '         Projeto.Nome ,'
      '         Fundo.Id,'
      '         Fundo.Nome,'
      '         Rubrica.Id,'
      '         Rubrica.Nome,'
      '         Conta_Pagar.Descricao,'
      '         Conta_Pagar.Valor_Total'
      
        'order by Projeto.Nome, Fundo.Nome, Rubrica.Nome, Plano_Contas.No' +
        'me')
    Left = 472
    Top = 216
    MacroData = <
      item
        Value = Null
        Name = 'AND'
      end>
    object qGasto_Plano_Contas_DetalhadoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qGasto_Plano_Contas_DetalhadoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qGasto_Plano_Contas_DetalhadoID_PROJETO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_PROJETO'
      Origin = 'ID_PROJETO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qGasto_Plano_Contas_DetalhadoPROJETO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PROJETO'
      Origin = 'PROJETO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qGasto_Plano_Contas_DetalhadoID_FUNDO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_FUNDO'
      Origin = 'ID_FUNDO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qGasto_Plano_Contas_DetalhadoNOME_FUNDO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_FUNDO'
      Origin = 'NOME_FUNDO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qGasto_Plano_Contas_DetalhadoID_RUBRICA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_RUBRICA'
      Origin = 'ID_RUBRICA'
      ProviderFlags = []
      ReadOnly = True
    end
    object qGasto_Plano_Contas_DetalhadoRUBRICA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RUBRICA'
      Origin = 'RUBRICA'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qGasto_Plano_Contas_DetalhadoDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qGasto_Plano_Contas_DetalhadoVALOR_TOTAL: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qGasto_Plano_Contas_DetalhadoVALOR_PAGO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_PAGO'
      Origin = 'VALOR_PAGO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object qLote_Semente_Vendido: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Lote_Semente.Id,'
      '       Lote_Semente.Nome,'
      '       Lote_Semente.Id_Especie,'
      '       Especie.Nome as Especie,'
      '       Venda.Id_Cliente,'
      '       case'
      
        '         when Fin_For_Cli.Nome_Fantasia is null then Fin_For_Cli' +
        '.Razao_Social'
      
        '         else Fin_For_Cli.Razao_Social || '#39' ('#39' || Fin_For_Cli.No' +
        'me_Fantasia || '#39')'#39
      '       end as Cliente,'
      ''
      '       Venda_Item.Qtde,'
      '       Venda_Item.Valor_Unitario,'
      '       (Venda_Item.Valor_Unitario * Venda_Item.Qtde) as Valor,'
      '       Lote_Semente.Data'
      'from Venda_Item'
      
        'inner join Lote_Semente on (Venda_Item.Id_Lote_Semente = Lote_Se' +
        'mente.Id)'
      'inner join Venda on (Venda.Id = Venda_Item.Id_Venda)'
      'inner join Especie on (Lote_Semente.Id_Especie = Especie.Id)'
      'inner join Fin_For_Cli on (Venda.Id_Cliente = Fin_For_Cli.Id)'
      '&WHERE'
      'order by Lote_Semente.Id_Especie  ')
    Left = 56
    Top = 232
    MacroData = <
      item
        Value = 'where venda_item.id = 0'
        Name = 'WHERE'
      end>
    object qLote_Semente_VendidoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qLote_Semente_VendidoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 30
    end
    object qLote_Semente_VendidoID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      Required = True
    end
    object qLote_Semente_VendidoESPECIE: TStringField
      FieldName = 'ESPECIE'
      Origin = 'ESPECIE'
      Required = True
      Size = 100
    end
    object qLote_Semente_VendidoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      Required = True
    end
    object qLote_Semente_VendidoQTDE: TBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      Required = True
      Precision = 18
      Size = 2
    end
    object qLote_Semente_VendidoVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      Required = True
      Precision = 18
      Size = 2
    end
    object qLote_Semente_VendidoVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      Precision = 18
    end
    object qLote_Semente_VendidoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object qLote_Semente_VendidoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Size = 203
    end
  end
  object qLote_Muda_Vendido: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Lote_Muda.Id,'
      '       Lote_Muda.Nome,'
      '       Lote_Muda.Id_Especie,'
      '       Especie.Nome as Especie,'
      '       Venda.Id_Cliente,'
      '       case'
      
        '         when Fin_For_Cli.Nome_Fantasia is null then Fin_For_Cli' +
        '.Razao_Social'
      
        '         else Fin_For_Cli.Razao_Social || '#39' ('#39' || Fin_For_Cli.No' +
        'me_Fantasia || '#39')'#39
      '       end as Cliente,'
      '       Venda_Item.Qtde,'
      '       Venda_Item.Valor_Unitario,'
      '       (Venda_Item.Valor_Unitario * Venda_Item.Qtde) as Valor,'
      '       Lote_Muda.Data'
      'from Venda_Item'
      'inner join Lote_Muda on (Venda_Item.Id_Lote_Muda = Lote_Muda.Id)'
      'inner join Venda on (Venda.Id = Venda_Item.Id_Venda)'
      'inner join Especie on (Lote_Muda.Id_Especie = Especie.Id)'
      'inner join Fin_For_Cli on (Venda.Id_Cliente = Fin_For_Cli.Id)'
      '&WHERE'
      'order by Lote_Muda.Id_Especie')
    Left = 216
    Top = 232
    MacroData = <
      item
        Value = 'where venda_item.id = 0'
        Name = 'WHERE'
      end>
    object qLote_Muda_VendidoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qLote_Muda_VendidoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qLote_Muda_VendidoID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      Required = True
    end
    object qLote_Muda_VendidoESPECIE: TStringField
      FieldName = 'ESPECIE'
      Origin = 'ESPECIE'
      Required = True
      Size = 100
    end
    object qLote_Muda_VendidoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      Required = True
    end
    object qLote_Muda_VendidoQTDE: TBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      Required = True
      Precision = 18
      Size = 2
    end
    object qLote_Muda_VendidoVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      Required = True
      Precision = 18
      Size = 2
    end
    object qLote_Muda_VendidoVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      Precision = 18
    end
    object qLote_Muda_VendidoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object qLote_Muda_VendidoCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Size = 203
    end
  end
end
