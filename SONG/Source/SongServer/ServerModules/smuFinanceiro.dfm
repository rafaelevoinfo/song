inherited smFinanceiro: TsmFinanceiro
  OldCreateOrder = True
  Width = 649
  object qBanco: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select BANCO.ID,'
      '       BANCO.NOME'
      'from BANCO  '
      '&WHERE')
    Left = 32
    Top = 16
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qBancoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qBancoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object qBanco_Conta_Corrente: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select BANCO_CONTA_CORRENTE.ID,'
      '       BANCO_CONTA_CORRENTE.ID_BANCO,'
      '       BANCO_CONTA_CORRENTE.AGENCIA,'
      '       BANCO_CONTA_CORRENTE.CONTA'
      'from BANCO_CONTA_CORRENTE'
      'where BANCO_CONTA_CORRENTE.ID_BANCO = :ID_BANCO    '
      '&WHERE')
    Left = 160
    Top = 24
    ParamData = <
      item
        Name = 'ID_BANCO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qBanco_Conta_CorrenteID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qBanco_Conta_CorrenteID_BANCO: TIntegerField
      FieldName = 'ID_BANCO'
      Origin = 'ID_BANCO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qBanco_Conta_CorrenteAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Origin = 'AGENCIA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object qBanco_Conta_CorrenteCONTA: TStringField
      FieldName = 'CONTA'
      Origin = 'CONTA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qFin_For_Cli: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select FIN_FOR_CLI.ID,'
      '       FIN_FOR_CLI.ID_CONTATO,'
      '       FIN_FOR_CLI.CARGO_CONTATO,'
      '       FIN_FOR_CLI.ID_CIDADE,'
      '       FIN_FOR_CLI.NOME_FANTASIA,'
      '       FIN_FOR_CLI.RAZAO_SOCIAL,'
      '       FIN_FOR_CLI.ENDERECO,'
      '       FIN_FOR_CLI.BAIRRO,'
      '       FIN_FOR_CLI.COMPLEMENTO,'
      '       FIN_FOR_CLI.TIPO,'
      '       FIN_FOR_CLI.TELEFONE,'
      '       FIN_FOR_CLI.CELULAR,'
      '       FIN_FOR_CLI.EMAIL,'
      '       FIN_FOR_CLI.SITE,'
      '       FIN_FOR_CLI.CPF_CNPJ,'
      '       FIN_FOR_CLI.INSCRICAO_ESTADUAL,'
      '       FIN_FOR_CLI.INSCRICAO_MUNICIPAL,'
      '       FIN_FOR_CLI.RAMO_ATIVIDADE,'
      '       FIN_FOR_CLI.PESQUISA,'
      '       FIN_FOR_CLI.OBSERVACAO'
      'from FIN_FOR_CLI  '
      '&WHERE')
    Left = 32
    Top = 88
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qFin_For_CliID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qFin_For_CliID_CONTATO: TIntegerField
      FieldName = 'ID_CONTATO'
      Origin = 'ID_CONTATO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qFin_For_CliID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Origin = 'ID_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object qFin_For_CliNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qFin_For_CliRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qFin_For_CliENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qFin_For_CliBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qFin_For_CliCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qFin_For_CliTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qFin_For_CliTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
    end
    object qFin_For_CliCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      ProviderFlags = [pfInUpdate]
    end
    object qFin_For_CliEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qFin_For_CliSITE: TStringField
      FieldName = 'SITE'
      Origin = 'SITE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qFin_For_CliCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 14
    end
    object qFin_For_CliINSCRICAO_ESTADUAL: TStringField
      FieldName = 'INSCRICAO_ESTADUAL'
      Origin = 'INSCRICAO_ESTADUAL'
      ProviderFlags = [pfInUpdate]
    end
    object qFin_For_CliINSCRICAO_MUNICIPAL: TStringField
      FieldName = 'INSCRICAO_MUNICIPAL'
      Origin = 'INSCRICAO_MUNICIPAL'
      ProviderFlags = [pfInUpdate]
    end
    object qFin_For_CliRAMO_ATIVIDADE: TStringField
      FieldName = 'RAMO_ATIVIDADE'
      Origin = 'RAMO_ATIVIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qFin_For_CliPESQUISA: TStringField
      FieldName = 'PESQUISA'
      Origin = 'PESQUISA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qFin_For_CliOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object qFin_For_CliCARGO_CONTATO: TStringField
      FieldName = 'CARGO_CONTATO'
      Origin = 'CARGO_CONTATO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object qPlano_Contas: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'Select Plano_Contas.Id,'
      '       Plano_Contas.Identificador,'
      '       Plano_Contas.Nome,'
      '       Plano_Contas.Tipo,'
      '       Plano_Contas.Id_Conta_Pai'
      'from Plano_Contas'
      '&WHERE'
      'Order by Plano_Contas.Identificador')
    Left = 144
    Top = 104
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qPlano_ContasID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qPlano_ContasNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qPlano_ContasIDENTIFICADOR: TStringField
      FieldName = 'IDENTIFICADOR'
      Origin = 'IDENTIFICADOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qPlano_ContasTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qPlano_ContasID_CONTA_PAI: TIntegerField
      FieldName = 'ID_CONTA_PAI'
      Origin = 'ID_CONTA_PAI'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qRubrica: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Rubrica.Id,'
      '       Rubrica.Id_Rubrica_Pai,'
      '       Rubrica.Nome,'
      '       Rubrica.Identificador'
      'from Rubrica'
      '&where'
      'Order by Rubrica.Identificador')
    Left = 32
    Top = 168
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qRubricaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qRubricaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qRubricaID_RUBRICA_PAI: TIntegerField
      FieldName = 'ID_RUBRICA_PAI'
      Origin = 'ID_RUBRICA_PAI'
      ProviderFlags = [pfInUpdate]
    end
    object qRubricaIDENTIFICADOR: TStringField
      FieldName = 'IDENTIFICADOR'
      Origin = 'IDENTIFICADOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qConta_Pagar: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select DISTINCT Conta_Pagar.Id,'
      '       Conta_Pagar.Id_Fornecedor,'
      '       Conta_Pagar.Id_Rubrica,'
      '       Conta_Pagar.Id_Plano_Contas,'
      '       Conta_Pagar.Id_Conta_Corrente,'
      '       Conta_Pagar.Descricao,'
      '       Conta_Pagar.Valor_Total,'
      '       Conta_Pagar.Forma_Pagto,'
      '       Conta_Pagar.Observacao,'
      '       fin_for_cli.nome_fantasia as fornecedor,'
      '       rubrica.nome as rubrica,'
      '       plano_contas.nome as plano_contas,'
      
        '       (banco.nome || '#39' - '#39'|| banco_conta_corrente.agencia||'#39'/'#39'|' +
        '|banco_conta_corrente.conta) as conta_corrente'
      'from Conta_Pagar'
      
        'inner join fin_for_cli on (fin_for_cli.id = conta_pagar.id_forne' +
        'cedor)'
      'left join rubrica on (rubrica.id = conta_pagar.id_rubrica)'
      
        'inner join plano_contas on (plano_contas.id = conta_pagar.id_pla' +
        'no_contas)'
      
        'left join banco_conta_corrente on (banco_conta_corrente.id = con' +
        'ta_pagar.id_conta_corrente)'
      'left join banco on (banco.id = banco_conta_corrente.id_banco)'
      
        'LEFT JOIN CONTA_PAGAR_PARCELA ON (CONTA_PAGAR_PARCELA.ID_CONTA_P' +
        'AGAR = CONTA_PAGAR.ID)'
      '&where')
    Left = 152
    Top = 168
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qConta_PagarID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qConta_PagarID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      Origin = 'ID_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qConta_PagarID_RUBRICA: TIntegerField
      FieldName = 'ID_RUBRICA'
      Origin = 'ID_RUBRICA'
      ProviderFlags = [pfInUpdate]
    end
    object qConta_PagarID_PLANO_CONTAS: TIntegerField
      FieldName = 'ID_PLANO_CONTAS'
      Origin = 'ID_PLANO_CONTAS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qConta_PagarID_CONTA_CORRENTE: TIntegerField
      FieldName = 'ID_CONTA_CORRENTE'
      Origin = 'ID_CONTA_CORRENTE'
      ProviderFlags = [pfInUpdate]
    end
    object qConta_PagarDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qConta_PagarVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qConta_PagarFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = 'FORMA_PAGTO'
      ProviderFlags = [pfInUpdate]
    end
    object qConta_PagarOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object qConta_PagarFORNECEDOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FORNECEDOR'
      Origin = 'NOME_FANTASIA'
      ProviderFlags = []
      Size = 100
    end
    object qConta_PagarRUBRICA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RUBRICA'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qConta_PagarPLANO_CONTAS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PLANO_CONTAS'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qConta_PagarCONTA_CORRENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CONTA_CORRENTE'
      Origin = 'CONTA_CORRENTE'
      ProviderFlags = []
      Size = 134
    end
  end
  object qConta_Pagar_Parcela: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Conta_Pagar_Parcela.Id,'
      '       Conta_Pagar_Parcela.Id_Conta_Pagar,'
      '       Conta_Pagar_Parcela.Vencimento,'
      '       Conta_Pagar_Parcela.Valor,'
      '       Conta_Pagar_Parcela.Parcela'
      'from Conta_Pagar_Parcela  '
      'WHERE Conta_Pagar_Parcela.id_conta_pagar = :ID_CONTA_PAGAR')
    Left = 264
    Top = 168
    ParamData = <
      item
        Name = 'ID_CONTA_PAGAR'
        ParamType = ptInput
      end>
    object qConta_Pagar_ParcelaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qConta_Pagar_ParcelaID_CONTA_PAGAR: TIntegerField
      FieldName = 'ID_CONTA_PAGAR'
      Origin = 'ID_CONTA_PAGAR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qConta_Pagar_ParcelaVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      Origin = 'VENCIMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qConta_Pagar_ParcelaVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qConta_Pagar_ParcelaPARCELA: TSmallintField
      FieldName = 'PARCELA'
      Origin = 'PARCELA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qConta_Pagar_Projeto: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Conta_Pagar_Projeto.Id,'
      '       Conta_Pagar_Projeto.Id_Conta_Pagar,'
      '       Conta_Pagar_Projeto.Id_Projeto,'
      '       Projeto.nome as Projeto'
      'from Conta_Pagar_Projeto'
      
        'inner join projeto on (projeto.id = conta_pagar_projeto.Id_Proje' +
        'to)'
      'WHERE Conta_Pagar_Projeto.id_conta_pagar = :ID_CONTA_PAGAR'
      '')
    Left = 264
    Top = 104
    ParamData = <
      item
        Name = 'ID_CONTA_PAGAR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qConta_Pagar_ProjetoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qConta_Pagar_ProjetoID_CONTA_PAGAR: TIntegerField
      FieldName = 'ID_CONTA_PAGAR'
      Origin = 'ID_CONTA_PAGAR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qConta_Pagar_ProjetoID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      Origin = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qConta_Pagar_ProjetoPROJETO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PROJETO'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object qConta_Pagar_Atividade: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Conta_Pagar_Atividade.Id,'
      '       Conta_Pagar_Atividade.Id_Conta_Pagar,'
      '       Conta_Pagar_Atividade.Id_Atividade,'
      '       Atividade.Nome as Atividade'
      'from Conta_Pagar_Atividade'
      
        'inner join atividade on (atividade.id = conta_pagar_atividade.id' +
        '_atividade)'
      'where conta_pagar_atividade.id_conta_pagar = :ID_CONTA_PAGAR')
    Left = 400
    Top = 112
    ParamData = <
      item
        Name = 'ID_CONTA_PAGAR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qConta_Pagar_AtividadeID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qConta_Pagar_AtividadeID_CONTA_PAGAR: TIntegerField
      FieldName = 'ID_CONTA_PAGAR'
      Origin = 'ID_CONTA_PAGAR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qConta_Pagar_AtividadeID_ATIVIDADE: TIntegerField
      FieldName = 'ID_ATIVIDADE'
      Origin = 'ID_ATIVIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qConta_Pagar_AtividadeATIVIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ATIVIDADE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
end
