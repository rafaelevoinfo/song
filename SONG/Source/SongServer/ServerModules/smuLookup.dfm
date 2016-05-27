inherited smLookup: TsmLookup
  OldCreateOrder = True
  Height = 414
  Width = 1025
  object qlkPerfil: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select PERFIL.ID,'
      '       PERFIL.NOME'
      'from PERFIL  ')
    Left = 484
    Top = 124
    object qlkPerfilID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
    end
    object qlkPerfilNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object qlkPessoa: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select PESSOA.ID,'
      '       PESSOA.NOME'
      'from PESSOA'
      '&WHERE')
    Left = 336
    Top = 124
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkPessoaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
    end
    object qlkPessoaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object qlkOrganizacao: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Organizacao.Id,'
      '       Organizacao.Nome,'
      '       Organizacao.Cnpj,'
      '       organizacao.logo'
      'from Organizacao'
      '&WHERE')
    Left = 188
    Top = 124
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkOrganizacaoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkOrganizacaoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object qlkOrganizacaoCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      Size = 14
    end
    object qlkOrganizacaoLOGO: TBlobField
      FieldName = 'LOGO'
      Origin = 'LOGO'
      ProviderFlags = []
    end
  end
  object qlkFinanciador: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select FIN_FOR_CLI.ID,'
      '       FIN_FOR_CLI.NOME_FANTASIA as NOME'
      'from FIN_FOR_CLI'
      'where FIN_FOR_CLI.Tipo = 1'
      '&where')
    Left = 632
    Top = 124
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkFinanciadorID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkFinanciadorNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME_FANTASIA'
      ProviderFlags = []
      Size = 100
    end
  end
  object qlkBanco: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select BANCO.ID,'
      '       BANCO.NOME'
      'from BANCO')
    Left = 40
    Top = 232
    object qlkBancoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkBancoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object qlkBanco_Conta_Corrente: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select BANCO_CONTA_CORRENTE.ID,'
      '       BANCO_CONTA_CORRENTE.ID_BANCO,'
      '       BANCO_CONTA_CORRENTE.AGENCIA,'
      '       BANCO_CONTA_CORRENTE.CONTA'
      'from BANCO_CONTA_CORRENTE'
      'where BANCO_CONTA_CORRENTE.ID_BANCO = :ID_BANCO   ')
    Left = 928
    Top = 124
    ParamData = <
      item
        Name = 'ID_BANCO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qlkBanco_Conta_CorrenteID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkBanco_Conta_CorrenteID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
      Origin = 'ID_BANCO'
      ProviderFlags = []
      Required = True
    end
    object qlkBanco_Conta_CorrenteAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Origin = 'AGENCIA'
      ProviderFlags = []
      Required = True
      Size = 10
    end
    object qlkBanco_Conta_CorrenteCONTA: TStringField
      FieldName = 'CONTA'
      Origin = 'CONTA'
      ProviderFlags = []
      Required = True
    end
  end
  object qlkConta_Corrente: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select BANCO_CONTA_CORRENTE.ID,'
      '       BANCO_CONTA_CORRENTE.ID_BANCO,'
      '       BANCO.NOME,'
      '       BANCO_CONTA_CORRENTE.AGENCIA,'
      '       BANCO_CONTA_CORRENTE.CONTA'
      'from BANCO_CONTA_CORRENTE'
      'inner join BANCO on (BANCO.ID = BANCO_CONTA_CORRENTE.ID_BANCO)  ')
    Left = 780
    Top = 124
    object qlkConta_CorrenteID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkConta_CorrenteID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
      Origin = 'ID_BANCO'
      ProviderFlags = []
      Required = True
    end
    object qlkConta_CorrenteNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qlkConta_CorrenteAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Origin = 'AGENCIA'
      ProviderFlags = []
      Required = True
      Size = 10
    end
    object qlkConta_CorrenteCONTA: TStringField
      FieldName = 'CONTA'
      Origin = 'CONTA'
      ProviderFlags = []
      Required = True
    end
  end
  object qlkAtividade: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select DISTINCT ATIVIDADE.ID,'
      '       ATIVIDADE.NOME,'
      '       ATIVIDADE.STATUS'
      'from ATIVIDADE'
      
        'left join ATIVIDADE_PROJETO on (ATIVIDADE_PROJETO.ID_ATIVIDADE =' +
        ' ATIVIDADE.ID)  '
      '&WHERE')
    Left = 40
    Top = 124
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkAtividadeID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkAtividadeNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object qlkAtividadeSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = []
      Required = True
    end
  end
  object qlkProjeto: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select distinct PROJETO.ID,'
      '       PROJETO.NOME'
      'from PROJETO  '
      
        'inner join projeto_organizacao on (projeto.id = projeto_organiza' +
        'cao.id_projeto)--Todo projeto deve estar vinculado a pelo menos ' +
        'uma organizacao'
      '&WHERE')
    Left = 336
    Top = 16
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkProjetoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkProjetoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object qlkCidade: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select CIDADE.ID,'
      '       CIDADE.NOME||'#39' - '#39'||ESTADO.UF as NOME,'
      '       ESTADO.UF'
      'from CIDADE'
      'inner join ESTADO on (CIDADE.ID_ESTADO = ESTADO.ID)  ')
    Left = 188
    Top = 16
    object qlkCidadeID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkCidadeUF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'UF'
      ProviderFlags = []
      Size = 5
    end
    object qlkCidadeNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 128
    end
  end
  object qlkEspecie: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'Select Especie.id,'
      '       Especie.nome,'
      '       Especie.Valor_Muda,'
      '       Especie.Valor_Kg_Semente,'
      '       Especie.Tempo_Germinacao,'
      '       Especie.Qtde_Semente_Estoque,'
      '       Especie.Qtde_Muda_Estoque'
      'from especie'
      '&where'
      'order by Especie.nome')
    Left = 40
    Top = 16
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkEspecieID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkEspecieNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object qlkEspecieVALOR_MUDA: TBCDField
      FieldName = 'VALOR_MUDA'
      Origin = 'VALOR_MUDA'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qlkEspecieVALOR_KG_SEMENTE: TBCDField
      FieldName = 'VALOR_KG_SEMENTE'
      Origin = 'VALOR_KG_SEMENTE'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qlkEspecieTEMPO_GERMINACAO: TIntegerField
      FieldName = 'TEMPO_GERMINACAO'
      Origin = 'TEMPO_GERMINACAO'
      ProviderFlags = []
    end
    object qlkEspecieQTDE_SEMENTE_ESTOQUE: TBCDField
      FieldName = 'QTDE_SEMENTE_ESTOQUE'
      Origin = 'QTDE_SEMENTE_ESTOQUE'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qlkEspecieQTDE_MUDA_ESTOQUE: TIntegerField
      FieldName = 'QTDE_MUDA_ESTOQUE'
      Origin = 'QTDE_MUDA_ESTOQUE'
      ProviderFlags = []
    end
  end
  object qlkMatriz: TRFQuery
    SQL.Strings = (
      'select MATRIZ.ID,'
      '       MATRIZ.ID_ESPECIE,'
      '       MATRIZ.NOME'
      'from MATRIZ '
      '&WHERE')
    Left = 484
    Top = 16
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
  end
  object qlkCanteiro: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Canteiro.Id,'
      '       Canteiro.Nome'
      'from Canteiro')
    Left = 928
    Top = 16
    object qlkCanteiroID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkCanteiroNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object qlkPlano_Contas: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Plano_Contas.Id,'
      '       Plano_Contas.Id_Conta_Pai,'
      
        '       (Plano_Contas.Identificador || '#39' - '#39' || Plano_Contas.Nome' +
        ') as Nome,'
      '       Plano_Contas.Tipo'
      'from Plano_Contas  '
      '&where'
      
        'order by (Plano_Contas.Identificador || '#39' - '#39' || Plano_Contas.No' +
        'me) ')
    Left = 780
    Top = 16
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkPlano_ContasID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
    end
    object qlkPlano_ContasID_CONTA_PAI: TIntegerField
      FieldName = 'ID_CONTA_PAI'
      Origin = 'ID_CONTA_PAI'
      ProviderFlags = []
    end
    object qlkPlano_ContasTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
    end
    object qlkPlano_ContasNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 123
    end
  end
  object qlkRubrica: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select distinct Rubrica.Id,'
      '                Rubrica.Id_Rubrica_Pai,'
      
        '                (Rubrica.Identificador || '#39' - '#39' || Rubrica.Nome)' +
        ' as Nome'
      'from Rubrica'
      
        'left join Projeto_Rubrica on (Projeto_Rubrica.Id_Rubrica = Rubri' +
        'ca.Id)'
      '&where'
      'order by (Rubrica.Identificador || '#39' - '#39' || Rubrica.Nome) ')
    Left = 616
    Top = 296
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
        DataType = mdIdentifier
      end>
    object qlkRubricaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
    end
    object qlkRubricaID_RUBRICA_PAI: TIntegerField
      FieldName = 'ID_RUBRICA_PAI'
      Origin = 'ID_RUBRICA_PAI'
      ProviderFlags = []
    end
    object qlkRubricaNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 123
    end
  end
  object qlkFornecedor: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select FIN_FOR_CLI.ID,'
      '       FIN_FOR_CLI.NOME_FANTASIA as NOME'
      'from FIN_FOR_CLI'
      'where FIN_FOR_CLI.Tipo = 2'
      '&where')
    Left = 184
    Top = 224
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkFornecedorID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkFornecedorNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME_FANTASIA'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object qlkFin_For_Cli: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select FIN_FOR_CLI.ID,'
      '       FIN_FOR_CLI.NOME_FANTASIA as NOME'
      'from FIN_FOR_CLI'
      '&where')
    Left = 328
    Top = 216
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkFin_For_CliID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
    end
    object qlkFin_For_CliNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME_FANTASIA'
      ProviderFlags = []
      Size = 100
    end
  end
  object qlkItem: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'Select item.id,'
      '       item.nome,'
      '       item.tipo,'
      '       item.unidade,'
      '       item.saldo'
      'from item'
      '&where')
    Left = 472
    Top = 224
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkItemID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
    end
    object qlkItemNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qlkItemTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
    end
    object qlkItemUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = []
      Required = True
      Size = 10
    end
    object qlkItemSALDO: TBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
  end
  object qlkRubrica_Atividade: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select distinct Rubrica.Id,'
      '       Rubrica.Id_Rubrica_Pai,'
      '       (Rubrica.Identificador || '#39' - '#39' || Rubrica.Nome) as Nome'
      'from Rubrica'
      
        'left join projeto_rubrica on (projeto_rubrica.id_rubrica = rubri' +
        'ca.id)'
      
        'left join atividade_projeto on (projeto_rubrica.id_projeto = ati' +
        'vidade_projeto.id_projeto)'
      
        'left join atividade on (projeto_rubrica.id_projeto = atividade.i' +
        'd_projeto)'
      '&WHERE'
      'order by (Rubrica.Identificador || '#39' - '#39' || Rubrica.Nome)')
    Left = 624
    Top = 224
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
        DataType = mdIdentifier
      end>
    object qlkRubrica_AtividadeID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkRubrica_AtividadeID_RUBRICA_PAI: TIntegerField
      FieldName = 'ID_RUBRICA_PAI'
      Origin = 'ID_RUBRICA_PAI'
      ProviderFlags = []
    end
    object qlkRubrica_AtividadeNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 123
    end
  end
  object qlkProjeto_Area: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select distinct Projeto_Area.Id,'
      '       Projeto_Area.Id_Projeto,'
      '       Projeto_Area.Nome'
      'from Projeto_Area'
      '&where')
    Left = 760
    Top = 224
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkProjeto_AreaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
    end
    object qlkProjeto_AreaID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      Origin = 'ID_PROJETO'
      ProviderFlags = []
    end
    object qlkProjeto_AreaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object qlkProjeto_Area_Atividade: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select distinct Projeto_Area.Id,'
      '       Projeto_Area.Id_Projeto,'
      '       Projeto_Area.Nome'
      'from Projeto_Area'
      'inner join Projeto on (Projeto.Id = Projeto_Area.Id_Projeto)'
      
        'left join atividade_projeto on (atividade_projeto.id_projeto = p' +
        'rojeto.id)'
      'left join atividade on (atividade.id_projeto = projeto.id)'
      '&where')
    Left = 872
    Top = 224
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkProjeto_Area_AtividadeID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
    end
    object qlkProjeto_Area_AtividadeID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      Origin = 'ID_PROJETO'
      ProviderFlags = []
    end
    object qlkProjeto_Area_AtividadeNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object qlkCompra: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Compra.Id,'
      '       Compra.Id_Fornecedor,'
      '       Compra.Data,'
      '       Fin_For_Cli.Nome_Fantasia'
      'from Compra'
      
        'inner join Fin_For_Cli on (Fin_For_Cli.Id = Compra.Id_Fornecedor' +
        ') '
      '&where')
    Left = 472
    Top = 288
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkCompraID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qlkCompraID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      Origin = 'ID_FORNECEDOR'
      Required = True
    end
    object qlkCompraDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object qlkCompraNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      ProviderFlags = []
      Size = 100
    end
  end
  object qlkFundo: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Fundo.Id,'
      '       Fundo.Nome,'
      '       Fundo.Id_Organizacao,'
      '       Organizacao.Nome as Organizacao,'
      '       Fundo.Saldo'
      'from Fundo  '
      
        'inner join organizacao on (fundo.id_organizacao = organizacao.id' +
        ')'
      '&WHERE')
    Left = 328
    Top = 288
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkFundoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qlkFundoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qlkFundoSALDO: TBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qlkFundoORGANIZACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ORGANIZACAO'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qlkFundoID_ORGANIZACAO: TIntegerField
      FieldName = 'ID_ORGANIZACAO'
      Origin = 'ID_ORGANIZACAO'
      ProviderFlags = []
      Required = True
    end
  end
  object qlkProjeto_Organizacao: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Projeto_Organizacao.Id,'
      '       Projeto_Organizacao.Id_Organizacao ,'
      '       Organizacao.Nome'
      'from Projeto_Organizacao'
      
        'inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.' +
        'Id_Organizacao)  '
      '&WHERE')
    Left = 584
    Top = 24
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkProjeto_OrganizacaoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
    end
    object qlkProjeto_OrganizacaoID_ORGANIZACAO: TIntegerField
      FieldName = 'ID_ORGANIZACAO'
      Origin = 'ID_ORGANIZACAO'
      Required = True
    end
    object qlkProjeto_OrganizacaoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object qlkLote_Semente: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Lote_Semente.Id,'
      '       Lote_Semente.Id_Especie,'
      '       Lote_Semente.Nome,'
      '       Lote_Semente.Qtde_Armazenada'
      'from Lote_Semente'
      '&where')
    Left = 48
    Top = 312
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkLote_SementeID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qlkLote_SementeNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object qlkLote_SementeQTDE_ARMAZENADA: TBCDField
      FieldName = 'QTDE_ARMAZENADA'
      Origin = 'QTDE_ARMAZENADA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qlkLote_SementeID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      ProviderFlags = []
      Required = True
    end
  end
  object qlkLote_Muda: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Lote_Muda.Id,'
      '       Lote_Muda.Id_Especie,'
      '       Lote_Muda.Nome,'
      '       Lote_Muda.Saldo'
      'from Lote_Muda  '
      '&WHERE')
    Left = 136
    Top = 312
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkLote_MudaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkLote_MudaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object qlkLote_MudaSALDO: TIntegerField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      ProviderFlags = []
    end
    object qlkLote_MudaID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      ProviderFlags = []
      Required = True
    end
  end
  object qlkProjeto_Rubrica: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select distinct Projeto_Rubrica.Id,               '
      '                Projeto_Rubrica.Orcamento,'
      
        '                coalesce(view_rubrica_projeto.saldo_real,0) as S' +
        'aldo_Real,'
      
        '                Rubrica.Identificador || '#39' - '#39' || Rubrica.Nome a' +
        's Nome_Rubrica'
      'from Projeto_Rubrica'
      'inner join Rubrica on (Rubrica.Id = Projeto_Rubrica.Id_Rubrica)'
      
        'left join View_Rubrica_Projeto on (View_Rubrica_Projeto.Id_Proje' +
        'to = Projeto_Rubrica.Id_Projeto and View_Rubrica_Projeto.Id_Rubr' +
        'ica = Projeto_Rubrica.Id_Rubrica)'
      '&WHERE ')
    Left = 744
    Top = 304
    MacroData = <
      item
        Value = 'where Projeto_Rubrica.Id = 0'
        Name = 'WHERE'
      end>
    object qlkProjeto_RubricaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkProjeto_RubricaORCAMENTO: TBCDField
      FieldName = 'ORCAMENTO'
      Origin = 'ORCAMENTO'
      ProviderFlags = []
      Required = True
      Precision = 18
      Size = 2
    end
    object qlkProjeto_RubricaSALDO_REAL: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SALDO_REAL'
      Origin = 'SALDO_REAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 6
    end
    object qlkProjeto_RubricaNOME_RUBRICA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_RUBRICA'
      Origin = 'NOME_RUBRICA'
      ProviderFlags = []
      ReadOnly = True
      Size = 123
    end
  end
end
