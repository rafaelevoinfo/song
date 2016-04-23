inherited smFinanceiro: TsmFinanceiro
  OldCreateOrder = True
  Height = 413
  Width = 909
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
      Size = 18
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
      '       Conta_Pagar.Id_Plano_Contas,'
      '       Conta_Pagar.Id_Conta_Corrente,'
      '       Conta_Pagar.Descricao,'
      '       Conta_Pagar.Valor_Total,'
      '       Conta_Pagar.Forma_Pagto,'
      '       Conta_Pagar.Observacao,'
      '       Conta_Pagar.Numero_Documento,'
      '       Conta_Pagar.id_compra,'
      '       fin_for_cli.nome_fantasia as fornecedor,'
      '       plano_contas.nome as plano_contas,'
      
        '       (banco.nome || '#39' - '#39'|| banco_conta_corrente.agencia||'#39'/'#39'|' +
        '|banco_conta_corrente.conta) as conta_corrente'
      'from Conta_Pagar'
      
        'inner join fin_for_cli on (fin_for_cli.id = conta_pagar.id_forne' +
        'cedor)'
      
        'inner join plano_contas on (plano_contas.id = conta_pagar.id_pla' +
        'no_contas)'
      
        'left join banco_conta_corrente on (banco_conta_corrente.id = con' +
        'ta_pagar.id_conta_corrente)'
      'left join banco on (banco.id = banco_conta_corrente.id_banco)'
      
        'LEFT JOIN CONTA_PAGAR_PARCELA ON (CONTA_PAGAR_PARCELA.ID_CONTA_P' +
        'AGAR = CONTA_PAGAR.ID)'
      
        'left join conta_pagar_vinculo on (conta_pagar_vinculo.id_conta_p' +
        'agar = conta_pagar.id)'
      '&where')
    Left = 408
    Top = 8
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
    object qConta_PagarNUMERO_DOCUMENTO: TStringField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'NUMERO_DOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qConta_PagarID_COMPRA: TIntegerField
      FieldName = 'ID_COMPRA'
      Origin = 'ID_COMPRA'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qConta_Pagar_Parcela: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Conta_Pagar_Parcela.Id,'
      '       Conta_Pagar_Parcela.Id_Conta_Pagar,'
      '       Conta_Pagar_Parcela.Vencimento,'
      '       Conta_Pagar_Parcela.Valor,'
      '       Conta_Pagar_Parcela.Parcela,'
      '       coalesce(Conta_Pagar_Parcela.Status,0) as Status,'
      '       Conta_Pagar_Parcela.Data_Pagamento'
      'from Conta_Pagar_Parcela  '
      'WHERE Conta_Pagar_Parcela.id_conta_pagar = :ID_CONTA_PAGAR')
    Left = 416
    Top = 128
    ParamData = <
      item
        Name = 'ID_CONTA_PAGAR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
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
    object qConta_Pagar_ParcelaSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = [pfInUpdate]
    end
    object qConta_Pagar_ParcelaDATA_PAGAMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO'
      Origin = 'DATA_PAGAMENTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qConta_Receber: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select distinct Conta_Receber.Id,'
      '                Conta_Receber.Id_Cliente_Financiador,'
      '                Conta_Receber.Id_Plano_Contas,'
      '                Conta_Receber.Id_Conta_Corrente,'
      '                Conta_Receber.Descricao,'
      '                Conta_Receber.Valor_Total,'
      '                Conta_Receber.Forma_Pagto,'
      '                Conta_Receber.Observacao,'
      '                Conta_Receber.Numero_Documento,'
      '                Fin_For_Cli.Tipo,'
      '                Fin_For_Cli.Nome_Fantasia,'
      '                Plano_Contas.Nome as Plano_Contas,'
      
        '                (Banco.Nome || '#39' - '#39' || Banco_Conta_Corrente.Age' +
        'ncia || '#39'/'#39' || Banco_Conta_Corrente.Conta) as Conta_Corrente'
      'from Conta_Receber'
      
        'inner join Fin_For_Cli on (Fin_For_Cli.Id = Conta_Receber.Id_Cli' +
        'ente_Financiador)'
      
        'inner join Plano_Contas on (Plano_Contas.Id = Conta_Receber.Id_P' +
        'lano_Contas)'
      
        'left join Banco_Conta_Corrente on (Banco_Conta_Corrente.Id = Con' +
        'ta_Receber.Id_Conta_Corrente)'
      'left join Banco on (Banco.Id = Banco_Conta_Corrente.Id_Banco)'
      
        'left join Conta_Receber_Parcela on (Conta_Receber_Parcela.Id_Con' +
        'ta_Receber = Conta_Receber.Id)  '
      '&where')
    Left = 600
    Top = 8
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qConta_ReceberID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qConta_ReceberID_CLIENTE_FINANCIADOR: TIntegerField
      FieldName = 'ID_CLIENTE_FINANCIADOR'
      Origin = 'ID_CLIENTE_FINANCIADOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qConta_ReceberID_PLANO_CONTAS: TIntegerField
      FieldName = 'ID_PLANO_CONTAS'
      Origin = 'ID_PLANO_CONTAS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qConta_ReceberID_CONTA_CORRENTE: TIntegerField
      FieldName = 'ID_CONTA_CORRENTE'
      Origin = 'ID_CONTA_CORRENTE'
      ProviderFlags = [pfInUpdate]
    end
    object qConta_ReceberDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qConta_ReceberVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qConta_ReceberFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = 'FORMA_PAGTO'
      ProviderFlags = [pfInUpdate]
    end
    object qConta_ReceberOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object qConta_ReceberTIPO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
    end
    object qConta_ReceberNOME_FANTASIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      ProviderFlags = []
      Size = 100
    end
    object qConta_ReceberPLANO_CONTAS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PLANO_CONTAS'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qConta_ReceberCONTA_CORRENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CONTA_CORRENTE'
      Origin = 'CONTA_CORRENTE'
      ProviderFlags = []
      Size = 134
    end
    object qConta_ReceberNUMERO_DOCUMENTO: TStringField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'NUMERO_DOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
  end
  object qConta_Receber_Projeto: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Conta_Receber_Projeto.Id,'
      '       Conta_Receber_Projeto.Id_Conta_Receber,'
      '       Conta_Receber_Projeto.Id_Projeto,'
      '       Conta_Receber_Projeto.Id_Projeto_area,'
      '       Projeto.Nome as Projeto,'
      '       Projeto_Area.nome as Area'
      'from Conta_Receber_Projeto'
      
        'inner join Projeto on (Projeto.Id = Conta_Receber_Projeto.Id_Pro' +
        'jeto)'
      
        'inner join Projeto_Area on (Projeto_Area.id = Conta_Receber_Proj' +
        'eto.id_projeto_area)'
      
        'where Conta_Receber_Projeto.Id_Conta_Receber = :Id_Conta_Receber' +
        '   ')
    Left = 608
    Top = 72
    ParamData = <
      item
        Name = 'ID_CONTA_RECEBER'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qConta_Receber_ProjetoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qConta_Receber_ProjetoID_CONTA_RECEBER: TIntegerField
      FieldName = 'ID_CONTA_RECEBER'
      Origin = 'ID_CONTA_RECEBER'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qConta_Receber_ProjetoID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      Origin = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qConta_Receber_ProjetoPROJETO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PROJETO'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qConta_Receber_ProjetoID_PROJETO_AREA: TIntegerField
      FieldName = 'ID_PROJETO_AREA'
      Origin = 'ID_PROJETO_AREA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qConta_Receber_ProjetoAREA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AREA'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object qConta_Receber_Atividade: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Conta_Receber_Atividade.Id,'
      '       Conta_Receber_Atividade.Id_Conta_Receber,'
      '       Conta_Receber_Atividade.Id_Atividade,'
      '       Conta_Receber_Atividade.id_projeto_area,'
      '       Atividade.Nome as Atividade,'
      '       Projeto_Area.nome as Area'
      'from Conta_Receber_Atividade'
      
        'inner join Atividade on (Atividade.Id = Conta_Receber_Atividade.' +
        'Id_Atividade)'
      
        'inner join Projeto_Area on (Projeto_Area.id = Conta_Receber_Ativ' +
        'idade.id_projeto_area)'
      
        'where Conta_Receber_Atividade.Id_Conta_Receber = :Id_Conta_Receb' +
        'er   ')
    Left = 616
    Top = 192
    ParamData = <
      item
        Name = 'ID_CONTA_RECEBER'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qConta_Receber_AtividadeID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qConta_Receber_AtividadeID_CONTA_RECEBER: TIntegerField
      FieldName = 'ID_CONTA_RECEBER'
      Origin = 'ID_CONTA_RECEBER'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qConta_Receber_AtividadeID_ATIVIDADE: TIntegerField
      FieldName = 'ID_ATIVIDADE'
      Origin = 'ID_ATIVIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qConta_Receber_AtividadeATIVIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ATIVIDADE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qConta_Receber_AtividadeID_PROJETO_AREA: TIntegerField
      FieldName = 'ID_PROJETO_AREA'
      Origin = 'ID_PROJETO_AREA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qConta_Receber_AtividadeAREA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AREA'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object qConta_Receber_Parcela: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Conta_Receber_Parcela.Id,'
      '       Conta_Receber_Parcela.Id_Conta_Receber,'
      '       Conta_Receber_Parcela.Vencimento,'
      '       Conta_Receber_Parcela.Valor,'
      '       Conta_Receber_Parcela.Parcela,'
      '       coalesce(Conta_Receber_Parcela.Status,0) as Status,'
      '       Conta_Receber_Parcela.Data_Recebimento'
      'from Conta_Receber_Parcela'
      
        'where Conta_Receber_Parcela.Id_Conta_Receber = :Id_Conta_Receber' +
        '  ')
    Left = 608
    Top = 128
    ParamData = <
      item
        Name = 'ID_CONTA_RECEBER'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qConta_Receber_ParcelaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qConta_Receber_ParcelaID_CONTA_RECEBER: TIntegerField
      FieldName = 'ID_CONTA_RECEBER'
      Origin = 'ID_CONTA_RECEBER'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qConta_Receber_ParcelaVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      Origin = 'VENCIMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qConta_Receber_ParcelaVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qConta_Receber_ParcelaPARCELA: TSmallintField
      FieldName = 'PARCELA'
      Origin = 'PARCELA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qConta_Receber_ParcelaSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = [pfInUpdate]
    end
    object qConta_Receber_ParcelaDATA_RECEBIMENTO: TDateField
      FieldName = 'DATA_RECEBIMENTO'
      Origin = 'DATA_RECEBIMENTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qFundo: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Fundo.Id,'
      '       Fundo.Nome,'
      '       Fundo.Saldo,'
      '       Fundo.Descricao'
      'from Fundo  '
      '&WHERE')
    Left = 416
    Top = 264
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qFundoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qFundoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qFundoSALDO: TBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qFundoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
  end
  object qConta_Pagar_Vinculo: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Conta_Pagar_Vinculo.Id,'
      '       Conta_Pagar_Vinculo.Id_Conta_Pagar,'
      '       Conta_Pagar_Vinculo.Id_Fundo,'
      '       Fundo.nome as Nome_fundo,'
      '       Conta_Pagar_Vinculo.Id_Projeto_Origem,'
      '       projeto_origem.nome as projeto_origem,'
      '       Conta_Pagar_Vinculo.Id_Atividade_Origem,'
      '       atividade_origem.nome as atividade_origem,'
      '       Conta_Pagar_Vinculo.Id_Rubrica_Origem,'
      '       rubrica_origem.nome as rubrica_origem,'
      '       Conta_Pagar_Vinculo.Id_Area_Atuacao_Origem,'
      '       area_origem.nome as area_atuacao_origem,'
      '       Conta_Pagar_Vinculo.Id_Projeto_Alocado,'
      '       projeto_alocado.nome as projeto_alocado,'
      '       Conta_Pagar_Vinculo.Id_Atividade_Alocado,'
      '       atividade_alocado.nome as atividade_alocada,'
      '       Conta_Pagar_Vinculo.Id_Rubrica_Alocado,'
      '       rubrica_alocado.nome as rubrica_alocada,'
      '       Conta_Pagar_Vinculo.Id_Area_Atuacao_Alocado,'
      '       area_alocado.nome as area_atuacao_alocada,'
      '       Conta_Pagar_Vinculo.Valor'
      ''
      'from Conta_Pagar_Vinculo  '
      'left join Fundo on (Fundo.Id = Conta_Pagar_Vinculo.Id_Fundo)'
      
        'left join projeto projeto_origem on (projeto_origem.id = conta_p' +
        'agar_vinculo.id_projeto_origem)'
      
        'left join atividade atividade_origem on (atividade_origem.id = c' +
        'onta_pagar_vinculo.id_atividade_origem)'
      
        'left join rubrica rubrica_origem on (rubrica_origem.id = conta_p' +
        'agar_vinculo.id_rubrica_origem)'
      
        'left join projeto_area area_origem on (area_origem.id = conta_pa' +
        'gar_vinculo.id_area_atuacao_origem)'
      ''
      ''
      
        'left join projeto projeto_alocado on (projeto_alocado.id = conta' +
        '_pagar_vinculo.id_projeto_alocado)'
      
        'left join atividade atividade_alocado on (atividade_alocado.id =' +
        ' conta_pagar_vinculo.id_atividade_alocado)'
      
        'left join rubrica rubrica_alocado on (rubrica_alocado.id = conta' +
        '_pagar_vinculo.id_rubrica_alocado)'
      
        'left join projeto_area area_alocado on (area_alocado.id = conta_' +
        'pagar_vinculo.id_area_atuacao_alocado)'
      'where conta_pagar_vinculo.id_conta_pagar = :id_conta_pagar')
    Left = 408
    Top = 64
    ParamData = <
      item
        Name = 'ID_CONTA_PAGAR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qConta_Pagar_VinculoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qConta_Pagar_VinculoID_CONTA_PAGAR: TIntegerField
      FieldName = 'ID_CONTA_PAGAR'
      Origin = 'ID_CONTA_PAGAR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qConta_Pagar_VinculoID_FUNDO: TIntegerField
      FieldName = 'ID_FUNDO'
      Origin = 'ID_FUNDO'
      ProviderFlags = [pfInUpdate]
    end
    object qConta_Pagar_VinculoNOME_FUNDO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_FUNDO'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qConta_Pagar_VinculoID_PROJETO_ORIGEM: TIntegerField
      FieldName = 'ID_PROJETO_ORIGEM'
      Origin = 'ID_PROJETO_ORIGEM'
      ProviderFlags = [pfInUpdate]
    end
    object qConta_Pagar_VinculoPROJETO_ORIGEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PROJETO_ORIGEM'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qConta_Pagar_VinculoID_ATIVIDADE_ORIGEM: TIntegerField
      FieldName = 'ID_ATIVIDADE_ORIGEM'
      Origin = 'ID_ATIVIDADE_ORIGEM'
      ProviderFlags = [pfInUpdate]
    end
    object qConta_Pagar_VinculoATIVIDADE_ORIGEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ATIVIDADE_ORIGEM'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qConta_Pagar_VinculoID_RUBRICA_ORIGEM: TIntegerField
      FieldName = 'ID_RUBRICA_ORIGEM'
      Origin = 'ID_RUBRICA_ORIGEM'
      ProviderFlags = [pfInUpdate]
    end
    object qConta_Pagar_VinculoRUBRICA_ORIGEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RUBRICA_ORIGEM'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qConta_Pagar_VinculoID_AREA_ATUACAO_ORIGEM: TIntegerField
      FieldName = 'ID_AREA_ATUACAO_ORIGEM'
      Origin = 'ID_AREA_ATUACAO_ORIGEM'
      ProviderFlags = [pfInUpdate]
    end
    object qConta_Pagar_VinculoAREA_ATUACAO_ORIGEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AREA_ATUACAO_ORIGEM'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qConta_Pagar_VinculoID_PROJETO_ALOCADO: TIntegerField
      FieldName = 'ID_PROJETO_ALOCADO'
      Origin = 'ID_PROJETO_ALOCADO'
      ProviderFlags = [pfInUpdate]
    end
    object qConta_Pagar_VinculoPROJETO_ALOCADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PROJETO_ALOCADO'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qConta_Pagar_VinculoID_ATIVIDADE_ALOCADO: TIntegerField
      FieldName = 'ID_ATIVIDADE_ALOCADO'
      Origin = 'ID_ATIVIDADE_ALOCADO'
      ProviderFlags = [pfInUpdate]
    end
    object qConta_Pagar_VinculoATIVIDADE_ALOCADA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ATIVIDADE_ALOCADA'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qConta_Pagar_VinculoID_RUBRICA_ALOCADO: TIntegerField
      FieldName = 'ID_RUBRICA_ALOCADO'
      Origin = 'ID_RUBRICA_ALOCADO'
      ProviderFlags = [pfInUpdate]
    end
    object qConta_Pagar_VinculoRUBRICA_ALOCADA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RUBRICA_ALOCADA'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qConta_Pagar_VinculoID_AREA_ATUACAO_ALOCADO: TIntegerField
      FieldName = 'ID_AREA_ATUACAO_ALOCADO'
      Origin = 'ID_AREA_ATUACAO_ALOCADO'
      ProviderFlags = [pfInUpdate]
    end
    object qConta_Pagar_VinculoAREA_ATUACAO_ALOCADA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AREA_ATUACAO_ALOCADA'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qConta_Pagar_VinculoVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
  end
end
