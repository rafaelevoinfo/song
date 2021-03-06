inherited smLookup: TsmLookup
  OldCreateOrder = True
  Height = 504
  Width = 1021
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
      '       Organizacao.Logo,'
      '       Organizacao.Endereco,'
      '       Organizacao.Bairro,'
      '       Organizacao.Complemento,'
      '       Cidade.Nome|| '#39' - '#39'||estado.uf as Cidade,'
      '       Organizacao.Telefone,'
      '       organizacao.site,'
      '       organizacao.email,'
      '       organizacao.logo_secundaria'
      'from Organizacao  '
      'left join cidade on (cidade.id = organizacao.id_cidade)'
      'left join estado on (cidade.id_estado = estado.id)'
      '&WHERE')
    Left = 260
    Top = 100
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
    object qlkOrganizacaoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      ProviderFlags = []
      Size = 100
    end
    object qlkOrganizacaoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      ProviderFlags = []
    end
    object qlkOrganizacaoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      ProviderFlags = []
      Size = 100
    end
    object qlkOrganizacaoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      ProviderFlags = []
    end
    object qlkOrganizacaoSITE: TStringField
      FieldName = 'SITE'
      Origin = 'SITE'
      ProviderFlags = []
      Size = 100
    end
    object qlkOrganizacaoEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      ProviderFlags = []
      Size = 100
    end
    object qlkOrganizacaoCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 128
    end
    object qlkOrganizacaoLOGO_SECUNDARIA: TBlobField
      FieldName = 'LOGO_SECUNDARIA'
      Origin = 'LOGO_SECUNDARIA'
      ProviderFlags = []
    end
  end
  object qlkFinanciador: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select FIN_FOR_CLI.ID,'
      '       FIN_FOR_CLI.NOME_FANTASIA as NOME_FANTASIA,'
      '       FIN_FOR_CLI.RAZAO_SOCIAL as RAZAO_SOCIAL'
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
    object qlkFinanciadorNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      ProviderFlags = []
      Size = 100
    end
    object qlkFinanciadorRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      ProviderFlags = []
      Required = True
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
      '       Especie.Qtde_Muda_Pronta,'
      '       Especie.Qtde_Muda_Desenvolvimento,'
      '       Especie.Qtde_Semente_Tubete,'
      '       Especie.Peso_Medio_Semente,'
      '       Tipo_Especie.Nativa'
      'from especie'
      
        'left join tipo_especie on (especie.id_tipo_especie = tipo_especi' +
        'e.id)'
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
    object qlkEspecieQTDE_MUDA_PRONTA: TIntegerField
      FieldName = 'QTDE_MUDA_PRONTA'
      Origin = 'QTDE_MUDA_PRONTA'
      ProviderFlags = []
    end
    object qlkEspecieQTDE_MUDA_DESENVOLVIMENTO: TIntegerField
      FieldName = 'QTDE_MUDA_DESENVOLVIMENTO'
      Origin = 'QTDE_MUDA_DESENVOLVIMENTO'
      ProviderFlags = []
    end
    object qlkEspecieQTDE_SEMENTE_TUBETE: TIntegerField
      FieldName = 'QTDE_SEMENTE_TUBETE'
      Origin = 'QTDE_SEMENTE_TUBETE'
      ProviderFlags = []
    end
    object qlkEspeciePESO_MEDIO_SEMENTE: TBCDField
      FieldName = 'PESO_MEDIO_SEMENTE'
      Origin = 'PESO_MEDIO_SEMENTE'
      ProviderFlags = []
      Precision = 18
    end
    object qlkEspecieNATIVA: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'NATIVA'
      Origin = 'NATIVA'
      ProviderFlags = []
      ReadOnly = True
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
      '       Plano_Contas.Nome,'
      '       Plano_Contas.Tipo'
      'from Plano_Contas  '
      '&where'
      'order by Plano_Contas.Nome')
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
      '                Rubrica.Nome as Nome'
      'from Rubrica'
      
        'left join Projeto_Rubrica on (Projeto_Rubrica.Id_Rubrica = Rubri' +
        'ca.Id)'
      '&where'
      'order by Rubrica.Nome ')
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
      '       FIN_FOR_CLI.NOME_FANTASIA as NOME_FANTASIA,'
      '       FIN_FOR_CLI.RAZAO_SOCIAL as RAZAO_SOCIAL'
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
    object qlkFornecedorNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      ProviderFlags = []
      Size = 100
    end
    object qlkFornecedorRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object qlkFin_For_Cli: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select FIN_FOR_CLI.ID,'
      '       FIN_FOR_CLI.NOME_FANTASIA as NOME_FANTASIA,'
      '       FIN_FOR_CLI.RAZAO_SOCIAL as RAZAO_SOCIAL'
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
    object qlkFin_For_CliNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      ProviderFlags = []
      Size = 100
    end
    object qlkFin_For_CliRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      ProviderFlags = []
      Required = True
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
      '       Rubrica.Nome,'
      '       view_rubrica_projeto.saldo_real'
      'from Rubrica'
      
        'left join projeto_rubrica on (projeto_rubrica.id_rubrica = rubri' +
        'ca.id)'
      
        'left join atividade on (projeto_rubrica.id_projeto = atividade.i' +
        'd_projeto)'
      
        'inner join view_rubrica_projeto on (view_rubrica_projeto.id_rubr' +
        'ica = rubrica.id and view_rubrica_projeto.id_projeto = projeto_r' +
        'ubrica.id_projeto)'
      '&WHERE'
      'order by Rubrica.Nome')
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
    object qlkRubrica_AtividadeNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 123
    end
    object qlkRubrica_AtividadeSALDO_REAL: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SALDO_REAL'
      Origin = 'SALDO_REAL'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
  end
  object qlkProjeto_Area: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select distinct Projeto_Area.Id,'
      '       Projeto_Area.Id_Projeto,'
      '       Area_Atuacao.Nome'
      'from Projeto_Area'
      
        'inner join area_atuacao on (area_atuacao.id=projeto_area.id_area' +
        '_atuacao)'
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
      '       Area_Atuacao.Nome'
      'from Projeto_Area'
      
        'inner join area_atuacao on (area_atuacao.id = projeto_area.id_ar' +
        'ea_atuacao)'
      'inner join Projeto on (Projeto.Id = Projeto_Area.Id_Projeto)'
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
      'select distinct Lote_Semente.Id,'
      '       Lote_Semente.Id_Especie,'
      '       Lote_Semente.Nome,'
      '       Lote_Semente.Qtde_Armazenada,'
      
        '       cast(list(distinct semeadura.id_canteiro,'#39';'#39') as varchar(' +
        '100)) as IDS_CANTEIROS'
      'from Lote_Semente'
      
        'left join semeadura on (semeadura.id_lote_semente = lote_semente' +
        '.id)'
      '&where'
      'group by Lote_Semente.Id,'
      '       Lote_Semente.Id_Especie,'
      '       Lote_Semente.Nome,'
      '       Lote_Semente.Qtde_Armazenada'
      ''
      '')
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
    object qlkLote_SementeIDS_CANTEIROS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IDS_CANTEIROS'
      Origin = 'IDS_CANTEIROS'
      ProviderFlags = []
      Size = 100
    end
  end
  object qlkLote_Muda: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      ''
      'select Lote_muda.Id,'
      '       Lote_muda.Id_especie,'
      '       Lote_muda.Nome,'
      '       Lote_muda.Status,'
      '       Lote_muda.Saldo,'
      
        '       cast(list(distinct Lote_muda_canteiro.Id_canteiro, '#39';'#39') a' +
        's varchar(100)) as Ids_canteiros'
      'from Lote_muda'
      
        'left join Lote_muda_canteiro on (Lote_muda_canteiro.Id_lote_muda' +
        ' = Lote_muda.Id)'
      '&WHERE'
      
        'group by Lote_muda.Id, Lote_muda.Id_especie, Lote_muda.Nome, Lot' +
        'e_muda.Status, Lote_muda.Saldo '
      '')
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
    object qlkLote_MudaSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = []
      Required = True
    end
    object qlkLote_MudaIDS_CANTEIROS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IDS_CANTEIROS'
      Origin = 'IDS_CANTEIROS'
      ProviderFlags = []
      Size = 100
    end
  end
  object qlkProjeto_Rubrica: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select distinct Projeto_Rubrica.Id,               '
      '                Projeto_Rubrica.Orcamento,'
      
        '                coalesce(view_rubrica_projeto.saldo_real,0) as S' +
        'aldo_Real,'
      '                Rubrica.Nome as Nome_Rubrica'
      'from Projeto_Rubrica'
      'inner join Rubrica on (Rubrica.Id = Projeto_Rubrica.Id_Rubrica)'
      
        'inner join View_Rubrica_Projeto on (View_Rubrica_Projeto.Id_Proj' +
        'eto = Projeto_Rubrica.Id_Projeto and View_Rubrica_Projeto.Id_Rub' +
        'rica = Projeto_Rubrica.Id_Rubrica)'
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
    object qlkProjeto_RubricaNOME_RUBRICA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_RUBRICA'
      Origin = 'NOME_RUBRICA'
      ProviderFlags = []
      ReadOnly = True
      Size = 123
    end
    object qlkProjeto_RubricaSALDO_REAL: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SALDO_REAL'
      Origin = 'SALDO_REAL'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
  end
  object qlkLocal_Uso: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'Select Local_Uso.Id,'
      '       Local_Uso.Nome'
      'from Local_uso'
      '&WHERE')
    Left = 880
    Top = 304
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkLocal_UsoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkLocal_UsoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object qlkFamilia_Botanica: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'Select Familia_Botanica.Id,'
      '       Familia_botanica.nome'
      'from Familia_Botanica')
    Left = 328
    Top = 360
    object qlkFamilia_BotanicaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkFamilia_BotanicaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object qlkCamara_Fria: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Camara_Fria.Id,'
      '       Camara_Fria.Nome'
      'from Camara_Fria  ')
    Left = 472
    Top = 360
    object qlkCamara_FriaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
    end
    object qlkCamara_FriaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object qlkAgenda: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select distinct Agenda.Id,'
      '                Agenda.Nome,'
      '                Agenda.Tipo'
      'from Agenda'
      'left join Agenda_Pessoa on (Agenda_Pessoa.Id_Agenda = Agenda.Id)'
      'where (Agenda_Pessoa.Id_Pessoa = :Id_Pessoa)'
      'order by Agenda.Nome')
    Left = 616
    Top = 360
    ParamData = <
      item
        Name = 'ID_PESSOA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qlkAgendaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkAgendaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object qlkAgendaTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      Required = True
    end
  end
  object qlkAgenda_Pessoa: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Agenda_Pessoa.Id,'
      '       Agenda_Pessoa.Id_Agenda,'
      '       Agenda_Pessoa.Id_Pessoa,'
      '       Agenda_Pessoa.Somente_Visualizacao'
      'from Agenda_Pessoa'
      'where Agenda_Pessoa.Id_Agenda = :Id_Agenda   ')
    Left = 744
    Top = 360
    ParamData = <
      item
        Name = 'ID_AGENDA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qlkAgenda_PessoaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkAgenda_PessoaID_AGENDA: TIntegerField
      FieldName = 'ID_AGENDA'
      Origin = 'ID_AGENDA'
      ProviderFlags = []
      Required = True
    end
    object qlkAgenda_PessoaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Origin = 'ID_PESSOA'
      ProviderFlags = []
      Required = True
    end
    object qlkAgenda_PessoaSOMENTE_VISUALIZACAO: TSmallintField
      FieldName = 'SOMENTE_VISUALIZACAO'
      Origin = 'SOMENTE_VISUALIZACAO'
      ProviderFlags = []
      Required = True
    end
  end
  object qlkItem_Patrimonio: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Item_Patrimonio.Id,'
      '       Item_Patrimonio.Nome,'
      '       Item_Patrimonio.Ativo,'
      '       Item_Patrimonio.taxa_depreciacao_anual'
      'from Item_Patrimonio  '
      '&WHERE')
    Left = 880
    Top = 368
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkItem_PatrimonioID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkItem_PatrimonioNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object qlkItem_PatrimonioATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      ProviderFlags = []
      Required = True
    end
    object qlkItem_PatrimonioTAXA_DEPRECIACAO_ANUAL: TIntegerField
      FieldName = 'TAXA_DEPRECIACAO_ANUAL'
      Origin = 'TAXA_DEPRECIACAO_ANUAL'
      ProviderFlags = []
    end
  end
  object qlkDoador: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select first 10 Doacao.Id_Pessoa_Doadora,'
      '                Pessoa.Nome,'
      '                sum(Doacao.Valor) as Total'
      'from Doacao'
      'inner join Pessoa on (Pessoa.Id = Doacao.Id_Pessoa_Doadora)'
      'group by Doacao.Id_Pessoa_Doadora, Pessoa.Nome'
      'having sum(Doacao.Valor) > 0'
      'order by sum(Doacao.Valor) desc ')
    Left = 48
    Top = 376
    object qlkDoadorID_PESSOA_DOADORA: TIntegerField
      FieldName = 'ID_PESSOA_DOADORA'
      Origin = 'ID_PESSOA_DOADORA'
      ProviderFlags = []
      Required = True
    end
    object qlkDoadorNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qlkDoadorTOTAL: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
  end
  object qlkArea_Atuacao_Projeto: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'Select distinct Area_Atuacao.id,'
      '       Area_Atuacao.nome,'
      '       projeto_area.id_projeto'
      'from area_atuacao'
      
        'left join projeto_area on (area_atuacao.id = projeto_area.id_are' +
        'a_atuacao)'
      '&WHERE'
      'order by Area_Atuacao.nome')
    Left = 232
    Top = 376
    MacroData = <
      item
        Value = 'where area_atuacao.id = 0'
        Name = 'WHERE'
      end>
    object qlkArea_Atuacao_ProjetoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkArea_Atuacao_ProjetoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object qlkArea_Atuacao_ProjetoID_PROJETO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_PROJETO'
      Origin = 'ID_PROJETO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qlkArea_Execucao: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Area_Execucao.Id,'
      '       Area_Execucao.Id_Area_Atuacao,'
      '       Area_Execucao.Nome'
      'from Area_Execucao '
      'where area_execucao.id_area_atuacao = :ID_AREA_ATUACAO'
      'order by area_execucao.nome')
    Left = 232
    Top = 304
    ParamData = <
      item
        Name = 'ID_AREA_ATUACAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qlkArea_ExecucaoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkArea_ExecucaoID_AREA_ATUACAO: TIntegerField
      FieldName = 'ID_AREA_ATUACAO'
      Origin = 'ID_AREA_ATUACAO'
      ProviderFlags = []
      Required = True
    end
    object qlkArea_ExecucaoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object qlkArea_Atuacao: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Area_Atuacao.Id,'
      '       Area_Atuacao.Nome'
      'from Area_Atuacao  '
      '&WHERE'
      'order by Area_Atuacao.nome')
    Left = 232
    Top = 440
    MacroData = <
      item
        Value = 'WHERE AREA_ATUACAO.ID = 0'
        Name = 'WHERE'
      end>
    object qlkArea_AtuacaoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkArea_AtuacaoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object qlkTipo_Especie: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Tipo_Especie.Id,'
      '       Tipo_Especie.Nome,'
      '       Tipo_Especie.Nativa'
      'from Tipo_Especie '
      '&WHERE')
    Left = 352
    Top = 432
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkTipo_EspecieID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkTipo_EspecieNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object qlkTipo_EspecieNATIVA: TSmallintField
      FieldName = 'NATIVA'
      Origin = 'NATIVA'
      ProviderFlags = []
    end
  end
  object qlkModelo_Orcamento: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select MODELO_ORCAMENTO.ID,'
      '       MODELO_ORCAMENTO.NOME'
      'from MODELO_ORCAMENTO ')
    Left = 472
    Top = 432
    object qlkModelo_OrcamentoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkModelo_OrcamentoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object qlkModelo_Orcamento_Orcamento: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select MODELO_ORCAMENTO.ID,'
      '       MODELO_ORCAMENTO.MODELO'
      'from MODELO_ORCAMENTO '
      'where MODELO_ORCAMENTO.ID = :ID')
    Left = 616
    Top = 440
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qlkModelo_Orcamento_OrcamentoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkModelo_Orcamento_OrcamentoMODELO: TBlobField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      ProviderFlags = []
      Required = True
    end
  end
  object qlkCanteiro_Semeado: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select distinct Canteiro.Id,'
      '                Canteiro.Nome,'
      '                Lote_semente.id_especie'
      'from Semeadura'
      'inner join Canteiro on (Canteiro.Id = Semeadura.Id_canteiro)'
      
        'inner join Lote_semente on (Semeadura.Id_lote_semente = Lote_sem' +
        'ente.Id)'
      'where Lote_semente.id_especie = :ID_ESPECIE and'
      
        '      ((Lote_semente.Status is null) or (Lote_semente.Status = 0' +
        '))')
    Left = 784
    Top = 448
    ParamData = <
      item
        Name = 'ID_ESPECIE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qlkCanteiro_SemeadoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
    end
    object qlkCanteiro_SemeadoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qlkCanteiro_SemeadoID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      ProviderFlags = []
    end
  end
  object qlkCanteiro_Plantado: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select distinct Canteiro.Id,'
      '                Canteiro.Nome,'
      '                Lote_Muda.id_especie'
      'from Lote_muda_canteiro'
      
        'inner join Canteiro on (Canteiro.Id = Lote_muda_canteiro.Id_cant' +
        'eiro)'
      
        'inner join Lote_muda on (Lote_muda_canteiro.Id_lote_muda = Lote_' +
        'muda.Id)'
      'where Lote_muda.Id_especie = :ID_ESPECIE and'
      '      Lote_muda.Saldo > 0')
    Left = 904
    Top = 448
    ParamData = <
      item
        Name = 'ID_ESPECIE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qlkCanteiro_PlantadoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
    end
    object qlkCanteiro_PlantadoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qlkCanteiro_PlantadoID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      ProviderFlags = []
    end
  end
end
