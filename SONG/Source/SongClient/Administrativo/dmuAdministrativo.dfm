inherited dmAdministrativo: TdmAdministrativo
  OldCreateOrder = True
  Height = 323
  Width = 507
  object cdsPerfil: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqPerfil'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 240
    Top = 144
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
    Left = 240
    Top = 200
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
    Left = 336
    Top = 144
  end
  object cdsPessoa: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqPessoa'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 128
    Top = 72
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
    Left = 248
    Top = 64
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
    Left = 120
    Top = 144
  end
end
