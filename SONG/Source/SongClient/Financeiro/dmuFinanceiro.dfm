inherited dmFinanceiro: TdmFinanceiro
  OldCreateOrder = True
  Height = 429
  Width = 889
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
    Left = 264
    Top = 80
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
    Left = 264
    Top = 136
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
    object cdsConta_PagarNUMERO_DOCUMENTO: TStringField
      DisplayLabel = 'Nro. do Documento'
      FieldName = 'NUMERO_DOCUMENTO'
      Size = 30
    end
    object cdsConta_PagarID_COMPRA: TIntegerField
      DisplayLabel = 'Id da Compra'
      FieldName = 'ID_COMPRA'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cdsConta_Pagar_Projeto: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_CONTA_PAGAR'
    MasterFields = 'ID'
    MasterSource = dsConta_Pagar
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_CONTA_PAGAR'
        ParamType = ptInput
      end>
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
    object cdsConta_Pagar_ProjetoID_RUBRICA: TIntegerField
      DisplayLabel = 'Id da Rubrica'
      FieldName = 'ID_RUBRICA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsConta_Pagar_ProjetoID_PROJETO_AREA: TIntegerField
      DisplayLabel = 'Id da '#193'rea do Projeto'
      FieldName = 'ID_PROJETO_AREA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsConta_Pagar_ProjetoRUBRICA: TStringField
      DisplayLabel = 'Rubrica'
      FieldName = 'RUBRICA'
      Size = 100
    end
    object cdsConta_Pagar_ProjetoAREA: TStringField
      DisplayLabel = #193'rea'
      FieldName = 'AREA'
      Size = 100
    end
  end
  object cdsConta_Pagar_Atividade: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_CONTA_PAGAR'
    MasterFields = 'ID'
    MasterSource = dsConta_Pagar
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_CONTA_PAGAR'
        ParamType = ptInput
      end>
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
    object cdsConta_Pagar_AtividadeID_RUBRICA: TIntegerField
      DisplayLabel = 'Id da Rubrica'
      FieldName = 'ID_RUBRICA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsConta_Pagar_AtividadeID_PROJETO_AREA: TIntegerField
      DisplayLabel = 'Id da '#193'rea do Projeto'
      FieldName = 'ID_PROJETO_AREA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsConta_Pagar_AtividadeRUBRICA: TStringField
      DisplayLabel = 'Rubrica'
      FieldName = 'RUBRICA'
      ProviderFlags = []
      Size = 100
    end
    object cdsConta_Pagar_AtividadeAREA: TStringField
      DisplayLabel = #193'rea'
      FieldName = 'AREA'
      ProviderFlags = []
      Size = 100
    end
  end
  object cdsConta_Pagar_Parcela: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_CONTA_PAGAR'
    MasterFields = 'ID'
    MasterSource = dsConta_Pagar
    PacketRecords = 0
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_CONTA_PAGAR'
        ParamType = ptInput
      end>
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
    object cdsConta_Pagar_ParcelaSTATUS: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsConta_Pagar_ParcelaDATA_PAGAMENTO: TDateField
      DisplayLabel = 'Data do Pagamento'
      FieldName = 'DATA_PAGAMENTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsConta_Pagar: TDataSource
    DataSet = cdsConta_Pagar
    Left = 168
    Top = 24
  end
  object cdsConta_Receber: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqConta_Receber'
    RemoteServer = dmPrincipal.ProviderFinanceiro
    Left = 264
    Top = 200
    object cdsConta_ReceberID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConta_ReceberID_CLIENTE_FINANCIADOR: TIntegerField
      DisplayLabel = 'Id do Cliente/Financiador'
      FieldName = 'ID_CLIENTE_FINANCIADOR'
      Required = True
    end
    object cdsConta_ReceberID_PLANO_CONTAS: TIntegerField
      DisplayLabel = 'Id do Plano de Contas'
      FieldName = 'ID_PLANO_CONTAS'
      Required = True
    end
    object cdsConta_ReceberID_CONTA_CORRENTE: TIntegerField
      DisplayLabel = 'Id da Conta Corrente'
      FieldName = 'ID_CONTA_CORRENTE'
    end
    object cdsConta_ReceberDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Required = True
      Size = 100
    end
    object cdsConta_ReceberVALOR_TOTAL: TBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConta_ReceberFORMA_PAGTO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMA_PAGTO'
    end
    object cdsConta_ReceberOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      Size = 1000
    end
    object cdsConta_ReceberTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object cdsConta_ReceberNOME_FANTASIA: TStringField
      DisplayLabel = 'Cliente/Financiador'
      FieldName = 'NOME_FANTASIA'
      Size = 100
    end
    object cdsConta_ReceberPLANO_CONTAS: TStringField
      DisplayLabel = 'Plano de Contas'
      FieldName = 'PLANO_CONTAS'
      Size = 100
    end
    object cdsConta_ReceberCONTA_CORRENTE: TStringField
      DisplayLabel = 'Conta Corrente'
      FieldName = 'CONTA_CORRENTE'
      Size = 134
    end
    object cdsConta_ReceberNUMERO_DOCUMENTO: TStringField
      DisplayLabel = 'Nro. do Documento'
      FieldName = 'NUMERO_DOCUMENTO'
      Size = 30
    end
  end
  object cdsConta_Receber_Parcela: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_CONTA_RECEBER'
    MasterFields = 'ID'
    MasterSource = dsConta_Receber
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqConta_Receber_Parcela'
    RemoteServer = dmPrincipal.ProviderFinanceiro
    RFApplyAutomatico = False
    Left = 264
    Top = 264
    object cdsConta_Receber_ParcelaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConta_Receber_ParcelaID_CONTA_RECEBER: TIntegerField
      DisplayLabel = 'Id do Contas a Receber'
      FieldName = 'ID_CONTA_RECEBER'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsConta_Receber_ParcelaVENCIMENTO: TDateField
      DisplayLabel = 'Vencimento'
      FieldName = 'VENCIMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsConta_Receber_ParcelaVALOR: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsConta_Receber_ParcelaPARCELA: TSmallintField
      DisplayLabel = 'Parcela'
      FieldName = 'PARCELA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsConta_Receber_ParcelaSTATUS: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsConta_Receber_ParcelaDATA_RECEBIMENTO: TDateField
      DisplayLabel = 'Data do Recebimento'
      FieldName = 'DATA_RECEBIMENTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cdsConta_Receber_Atividade: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_CONTA_RECEBER'
    MasterFields = 'ID'
    MasterSource = dsConta_Receber
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqConta_Receber_Atividade'
    RemoteServer = dmPrincipal.ProviderFinanceiro
    RFApplyAutomatico = False
    Left = 408
    Top = 224
    object cdsConta_Receber_AtividadeID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConta_Receber_AtividadeID_CONTA_RECEBER: TIntegerField
      DisplayLabel = 'Id do Conta a Receber'
      FieldName = 'ID_CONTA_RECEBER'
      Required = True
    end
    object cdsConta_Receber_AtividadeID_ATIVIDADE: TIntegerField
      FieldName = 'ID_ATIVIDADE'
      Required = True
    end
    object cdsConta_Receber_AtividadeATIVIDADE: TStringField
      DisplayLabel = 'Atividade'
      FieldName = 'ATIVIDADE'
      Size = 100
    end
    object cdsConta_Receber_AtividadeID_PROJETO_AREA: TIntegerField
      DisplayLabel = 'Id do Projeto '#193'rea'
      FieldName = 'ID_PROJETO_AREA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsConta_Receber_AtividadeAREA: TStringField
      DisplayLabel = #193'rea de Atua'#231#227'o'
      FieldName = 'AREA'
      ProviderFlags = []
      Size = 100
    end
  end
  object cdsConta_Receber_Projeto: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_CONTA_RECEBER'
    MasterFields = 'ID'
    MasterSource = dsConta_Receber
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqConta_Receber_Projeto'
    RemoteServer = dmPrincipal.ProviderFinanceiro
    RFApplyAutomatico = False
    Left = 408
    Top = 280
    object cdsConta_Receber_ProjetoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConta_Receber_ProjetoID_CONTA_RECEBER: TIntegerField
      DisplayLabel = 'Id do Conta a Receber'
      FieldName = 'ID_CONTA_RECEBER'
      Required = True
    end
    object cdsConta_Receber_ProjetoID_PROJETO: TIntegerField
      DisplayLabel = 'Id do Projeto'
      FieldName = 'ID_PROJETO'
      Required = True
    end
    object cdsConta_Receber_ProjetoPROJETO: TStringField
      DisplayLabel = 'Projeto'
      FieldName = 'PROJETO'
      Size = 100
    end
    object cdsConta_Receber_ProjetoID_PROJETO_AREA: TIntegerField
      DisplayLabel = 'Id do Projeto '#193'rea'
      FieldName = 'ID_PROJETO_AREA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsConta_Receber_ProjetoAREA: TStringField
      DisplayLabel = #193'rea de Atua'#231#227'o'
      FieldName = 'AREA'
      ProviderFlags = []
      Size = 100
    end
  end
  object dsConta_Receber: TDataSource
    DataSet = cdsConta_Receber
    Left = 512
    Top = 16
  end
end
