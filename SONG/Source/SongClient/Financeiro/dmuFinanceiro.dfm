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
      Size = 500
    end
  end
end
