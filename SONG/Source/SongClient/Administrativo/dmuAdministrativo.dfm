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
    object cdsPerfilID: TLargeintField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
    IndexFieldNames = 'PERFIL_ID'
    MasterFields = 'ID'
    MasterSource = dsPerfil
    PacketRecords = 0
    Params = <
      item
        DataType = ftLargeint
        Name = 'PERFIL_ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspqPerfil_Permissao'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    RFApplyAutomatico = False
    Left = 240
    Top = 200
    object cdsPerfil_PermissaoID: TLargeintField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPerfil_PermissaoPERFIL_ID: TLargeintField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL_ID'
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
      DisplayLabel = 'Visualizar'
      FieldName = 'VISUALIZAR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPerfil_PermissaoINCLUIR: TSmallintField
      DisplayLabel = 'Incluir'
      FieldName = 'INCLUIR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPerfil_PermissaoALTERAR: TSmallintField
      DisplayLabel = 'Alterar'
      FieldName = 'ALTERAR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPerfil_PermissaoEXCLUIR: TSmallintField
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
end
