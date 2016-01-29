inherited dmAdministrativo: TdmAdministrativo
  OldCreateOrder = True
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
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TsmAdministrativo'
    Connected = True
    SQLConnection = dmPrincipal.DataSnapConn
    Left = 72
    Top = 24
  end
end
