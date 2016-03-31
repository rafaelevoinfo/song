inherited dmFinanceiro: TdmFinanceiro
  OldCreateOrder = True
  Height = 345
  Width = 590
  object cdsBanco: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqBanco'
    RemoteServer = dmPrincipal.ProviderFinanceiro
    Left = 400
    Top = 8
    object cdsBancoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsBancoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object cdsBanco_Conta_Corrente: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_BANCO'
    MasterFields = 'ID'
    MasterSource = dsBanco
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_BANCO'
        ParamType = ptInput
      end>
    ProviderName = 'dspqBanco_Conta_Corrente'
    RemoteServer = dmPrincipal.ProviderFinanceiro
    Left = 400
    Top = 80
    object cdsBanco_Conta_CorrenteID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsBanco_Conta_CorrenteID_BANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'ID_BANCO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsBanco_Conta_CorrenteAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object cdsBanco_Conta_CorrenteCONTA: TStringField
      DisplayLabel = 'Conta Corrente'
      FieldName = 'CONTA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dsBanco: TDataSource
    DataSet = cdsBanco
    Left = 272
    Top = 16
  end
  object cdsFin_For_Cli: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqFin_For_Cli'
    RemoteServer = dmPrincipal.ProviderFinanceiro
    Left = 400
    Top = 160
    object cdsFin_For_CliID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFin_For_CliID_CONTATO: TIntegerField
      DisplayLabel = 'Contato'
      FieldName = 'ID_CONTATO'
      Required = True
    end
    object cdsFin_For_CliID_CIDADE: TIntegerField
      DisplayLabel = 'Cidade'
      FieldName = 'ID_CIDADE'
    end
    object cdsFin_For_CliNOME_FANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'NOME_FANTASIA'
      Required = True
      Size = 100
    end
    object cdsFin_For_CliRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO_SOCIAL'
      Size = 100
    end
    object cdsFin_For_CliENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Size = 100
    end
    object cdsFin_For_CliBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsFin_For_CliCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Size = 100
    end
    object cdsFin_For_CliTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
    end
    object cdsFin_For_CliTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
    end
    object cdsFin_For_CliCELULAR: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'CELULAR'
    end
    object cdsFin_For_CliEMAIL: TStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'EMAIL'
      Size = 100
    end
    object cdsFin_For_CliSITE: TStringField
      DisplayLabel = 'Site'
      FieldName = 'SITE'
      Size = 100
    end
    object cdsFin_For_CliCPF_CNPJ: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPF_CNPJ'
      Required = True
      Size = 14
    end
    object cdsFin_For_CliINSCRICAO_ESTADUAL: TStringField
      DisplayLabel = 'Inscri'#231#227'o Estadual'
      FieldName = 'INSCRICAO_ESTADUAL'
    end
    object cdsFin_For_CliINSCRICAO_MUNICIPAL: TStringField
      DisplayLabel = 'Inscri'#231#227'o Municipal'
      FieldName = 'INSCRICAO_MUNICIPAL'
    end
    object cdsFin_For_CliRAMO_ATIVIDADE: TStringField
      DisplayLabel = 'Ramo de Atividade'
      FieldName = 'RAMO_ATIVIDADE'
      Size = 50
    end
    object cdsFin_For_CliPESQUISA: TStringField
      DisplayLabel = 'Pesquisa'
      FieldName = 'PESQUISA'
      Size = 100
    end
    object cdsFin_For_CliOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      Size = 1000
    end
    object cdsFin_For_CliCARGO_CONTATO: TStringField
      DisplayLabel = 'Cargo do Contato'
      FieldName = 'CARGO_CONTATO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object cdsPlano_Contas: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqPlano_Contas'
    RemoteServer = dmPrincipal.ProviderFinanceiro
    Left = 280
    Top = 160
    object cdsPlano_ContasID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPlano_ContasNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsPlano_ContasIDENTIFICADOR: TStringField
      DisplayLabel = 'Identificador'
      FieldName = 'IDENTIFICADOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsPlano_ContasTIPO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsPlano_ContasID_CONTA_PAI: TIntegerField
      DisplayLabel = 'Conta Pai'
      FieldName = 'ID_CONTA_PAI'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cdsRubrica: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqRubrica'
    RemoteServer = dmPrincipal.ProviderFinanceiro
    Left = 280
    Top = 224
    object cdsRubricaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsRubricaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsRubricaID_RUBRICA_PAI: TIntegerField
      DisplayLabel = 'Id da Rubrica Pai'
      FieldName = 'ID_RUBRICA_PAI'
      ProviderFlags = [pfInUpdate]
    end
    object cdsRubricaIDENTIFICADOR: TStringField
      DisplayLabel = 'Identificador'
      FieldName = 'IDENTIFICADOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object cdsConta_Pagar: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqConta_Pagar'
    RemoteServer = dmPrincipal.ProviderFinanceiro
    Left = 64
    Top = 16
    object cdsConta_PagarID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConta_PagarID_FORNECEDOR: TIntegerField
      DisplayLabel = 'Id do Fornecedor'
      FieldName = 'ID_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsConta_PagarID_RUBRICA: TIntegerField
      DisplayLabel = 'Id da Rubrica'
      FieldName = 'ID_RUBRICA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsConta_PagarID_PLANO_CONTAS: TIntegerField
      DisplayLabel = 'Id do Plano de Contas'
      FieldName = 'ID_PLANO_CONTAS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsConta_PagarID_CONTA_CORRENTE: TIntegerField
      DisplayLabel = 'Id da Conta Corrente'
      FieldName = 'ID_CONTA_CORRENTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsConta_PagarDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsConta_PagarVALOR_TOTAL: TBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConta_PagarFORMA_PAGTO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMA_PAGTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsConta_PagarOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object cdsConta_PagarFORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORNECEDOR'
      ProviderFlags = []
      Size = 100
    end
    object cdsConta_PagarRUBRICA: TStringField
      DisplayLabel = 'Rubrica'
      FieldName = 'RUBRICA'
      ProviderFlags = []
      Size = 100
    end
    object cdsConta_PagarPLANO_CONTAS: TStringField
      DisplayLabel = 'Plano de Contas'
      FieldName = 'PLANO_CONTAS'
      ProviderFlags = []
      Size = 100
    end
    object cdsConta_PagarCONTA_CORRENTE: TStringField
      DisplayLabel = 'Conta Corrente'
      FieldName = 'CONTA_CORRENTE'
      ProviderFlags = []
      Size = 134
    end
  end
  object cdsConta_Pagar_Projeto: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_CONTA_PAGAR'
    MasterFields = 'ID'
    MasterSource = dsConta_Pagar
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqConta_Pagar_Projeto'
    RemoteServer = dmPrincipal.ProviderFinanceiro
    RFApplyAutomatico = False
    Left = 64
    Top = 80
    object cdsConta_Pagar_ProjetoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsConta_Pagar_ProjetoID_CONTA_PAGAR: TIntegerField
      DisplayLabel = 'Id do Contas a Pagar'
      FieldName = 'ID_CONTA_PAGAR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsConta_Pagar_ProjetoID_PROJETO: TIntegerField
      DisplayLabel = 'Id do Projeto'
      FieldName = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsConta_Pagar_ProjetoPROJETO: TStringField
      DisplayLabel = 'Projeto'
      FieldName = 'PROJETO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object cdsConta_Pagar_Atividade: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_CONTA_PAGAR'
    MasterFields = 'ID'
    MasterSource = dsConta_Pagar
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqConta_Pagar_Atividade'
    RemoteServer = dmPrincipal.ProviderFinanceiro
    RFApplyAutomatico = False
    Left = 64
    Top = 152
    object cdsConta_Pagar_AtividadeID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsConta_Pagar_AtividadeID_CONTA_PAGAR: TIntegerField
      DisplayLabel = 'Id do Contas a Pagar'
      FieldName = 'ID_CONTA_PAGAR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsConta_Pagar_AtividadeID_ATIVIDADE: TIntegerField
      DisplayLabel = 'Id da Atividade'
      FieldName = 'ID_ATIVIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsConta_Pagar_AtividadeATIVIDADE: TStringField
      DisplayLabel = 'Atividade'
      FieldName = 'ATIVIDADE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object cdsConta_Pagar_Parcela: TRFClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Filtered = True
    IndexFieldNames = 'ID_CONTA_PAGAR'
    MasterFields = 'ID'
    MasterSource = dsConta_Pagar
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqConta_Pagar_Parcela'
    RemoteServer = dmPrincipal.ProviderFinanceiro
    RFApplyAutomatico = False
    Left = 64
    Top = 216
    object cdsConta_Pagar_ParcelaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsConta_Pagar_ParcelaID_CONTA_PAGAR: TIntegerField
      DisplayLabel = 'Id da Conta a Pagar'
      FieldName = 'ID_CONTA_PAGAR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsConta_Pagar_ParcelaVENCIMENTO: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCIMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsConta_Pagar_ParcelaVALOR: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConta_Pagar_ParcelaPARCELA: TSmallintField
      DisplayLabel = 'Parcela'
      FieldName = 'PARCELA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsConta_Pagar_ParcelaSUM_VALOR: TAggregateField
      FieldName = 'SUM_VALOR'
      Active = True
      DisplayName = ''
      Expression = 'SUM(VALOR)'
    end
  end
  object dsConta_Pagar: TDataSource
    DataSet = cdsConta_Pagar
    Left = 168
    Top = 24
  end
end
