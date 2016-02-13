inherited dmAdministrativo: TdmAdministrativo
  OldCreateOrder = True
  Height = 323
  Width = 507
  object cdsPerfil: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqPerfil'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 216
    Top = 24
    object cdsPerfilID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPerfilNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsPerfilDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
  end
  object cdsPerfil_Permissao: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_PERFIL'
    MasterFields = 'ID'
    MasterSource = dsPerfil
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PERFIL'
        ParamType = ptInput
      end>
    ProviderName = 'dspqPerfil_Permissao'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    RFApplyAutomatico = False
    Left = 296
    Top = 24
    object cdsPerfil_PermissaoID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPerfil_PermissaoID_PERFIL: TIntegerField
      DisplayLabel = 'Perfil'
      FieldName = 'ID_PERFIL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsPerfil_PermissaoPERMISSAO: TStringField
      DisplayLabel = 'Permiss'#227'o'
      FieldName = 'PERMISSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsPerfil_PermissaoVISUALIZAR: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Visualizar'
      FieldName = 'VISUALIZAR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPerfil_PermissaoINCLUIR: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Incluir'
      FieldName = 'INCLUIR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPerfil_PermissaoALTERAR: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Alterar'
      FieldName = 'ALTERAR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPerfil_PermissaoEXCLUIR: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Excluir'
      FieldName = 'EXCLUIR'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsPerfil: TDataSource
    DataSet = cdsPerfil
    Left = 216
    Top = 80
  end
  object cdsPessoa: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqPessoa'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 32
    Top = 16
    object cdsPessoaID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Required = True
    end
    object cdsPessoaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object cdsPessoaRG: TStringField
      FieldName = 'RG'
      Size = 30
    end
    object cdsPessoaCPF: TStringField
      FieldName = 'CPF'
    end
    object cdsPessoaENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Size = 100
    end
    object cdsPessoaLOGIN: TStringField
      DisplayLabel = 'Login'
      FieldName = 'LOGIN'
      Size = 100
    end
    object cdsPessoaSENHA: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'SENHA'
      Size = 100
    end
    object cdsPessoaBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsPessoaCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Size = 100
    end
    object cdsPessoaEMAIL: TStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsPessoaCELULAR: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'CELULAR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPessoaTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPessoaATIVO: TSmallintField
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPessoaCIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cdsPessoa_Perfil: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_PESSOA'
    MasterFields = 'ID'
    MasterSource = dsPessoa
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqPessoa_Perfil'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    RFApplyAutomatico = False
    Left = 120
    Top = 16
    object cdsPessoa_PerfilID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Required = True
    end
    object cdsPessoa_PerfilID_PESSOA: TIntegerField
      DisplayLabel = 'Pessoa'
      FieldName = 'ID_PESSOA'
      Required = True
    end
    object cdsPessoa_PerfilID_PERFIL: TIntegerField
      DisplayLabel = 'Perfil'
      FieldName = 'ID_PERFIL'
      Required = True
    end
  end
  object dsPessoa: TDataSource
    DataSet = cdsPessoa
    Left = 32
    Top = 72
  end
  object cdsOrganizacao: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqOrganizacao'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 32
    Top = 136
    object cdsOrganizacaoID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOrganizacaoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsOrganizacaoCNPJ: TStringField
      FieldName = 'CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object cdsOrganizacaoINSCRICAO_ESTADUAL: TStringField
      DisplayLabel = 'Inscri'#231#227'o estadual'
      FieldName = 'INSCRICAO_ESTADUAL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrganizacaoENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsOrganizacaoBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrganizacaoCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsOrganizacaoCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrganizacaoTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cdsOrganizacao_Pessoa: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_ORGANIZACAO'
    MasterFields = 'ID'
    MasterSource = dsOrganizacao
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqOrganizacao_Pessoa'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 144
    Top = 136
    object cdsOrganizacao_PessoaID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Required = True
    end
    object cdsOrganizacao_PessoaID_PESSOA: TIntegerField
      DisplayLabel = 'Pessoa'
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsOrganizacao_PessoaID_ORGANIZACAO: TIntegerField
      DisplayLabel = 'Organiza'#231#227'o'
      FieldName = 'ID_ORGANIZACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsOrganizacao_PessoaFUNCAO: TStringField
      DisplayLabel = 'Fun'#231#227'o'
      FieldName = 'FUNCAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsOrganizacao_PessoaOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
  end
  object dsOrganizacao: TDataSource
    DataSet = cdsOrganizacao
    Left = 32
    Top = 192
  end
  object cdsFinanciador: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqFinanciador'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 280
    Top = 184
    object cdsFinanciadorID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFinanciadorNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsFinanciadorID_PESSOA: TIntegerField
      DisplayLabel = 'Contato'
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
end
