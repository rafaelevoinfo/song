inherited dmAdministrativo: TdmAdministrativo
  Height = 323
  Width = 507
  object cdsPerfil: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqPerfil'
    RemoteServer = DSProviderConnection1
    Left = 240
    Top = 144
    object cdsPerfilID: TLargeintField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPerfilNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsPerfilDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TsmAdministrativo'
    Connected = True
    SQLConnection = dmPrincipal.DataSnapConn
    Left = 72
    Top = 24
  end
end
