object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  Height = 279
  Width = 458
  object DataSnapConn: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=3004'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=20.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}'
      'DSAuthenticationUser=admin')
    AfterConnect = DataSnapConnAfterConnect
    Left = 64
    Top = 48
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Black'
    Left = 216
    Top = 120
  end
  object ProxyGenerator: TDSProxyGenerator
    MetaDataProvider = DSConnectionMetaDataProvider1
    TargetUnitName = 'uFuncoes'
    Writer = 'Object Pascal DBX'
    Left = 152
    Top = 48
  end
  object DSConnectionMetaDataProvider1: TDSConnectionMetaDataProvider
    SQLConnection = DataSnapConn
    Left = 64
    Top = 120
  end
end
