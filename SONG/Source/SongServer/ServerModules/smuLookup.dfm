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
  end
  object qlkOrganizacao: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select ORGANIZACAO.ID,'
      '       ORGANIZACAO.NOME'
      'from ORGANIZACAO  '
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
    SQL.Strings = (
      'select PROJETO.ID,'
      '       PROJETO.NOME'
      'from PROJETO  '
      '&WHERE')
    Left = 336
    Top = 16
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
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
      '       Especie.Tempo_Germinacao'
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
      'select Rubrica.Id,'
      '       Rubrica.Id_Rubrica_Pai,'
      '       (Rubrica.Identificador || '#39' - '#39' || Rubrica.Nome) as Nome'
      'from Rubrica'
      '&where'
      'order by Rubrica.Nome')
    Left = 632
    Top = 16
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
      '       item.unidade'
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
  end
end
