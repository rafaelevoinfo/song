object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 314
  Width = 431
  object Connection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\rafae\Repositorios\SONG\BancoDados\song_mobile' +
        '.db'
      'DriverID=SQLite')
    ConnectedStoredUsage = []
    LoginPrompt = False
    BeforeConnect = ConnectionBeforeConnect
    Left = 48
    Top = 38
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 152
    Top = 38
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 287
    Top = 38
  end
  object DataSnapConn: TRFSQLConnection
    DriverName = 'DataSnap'
    KeepConnection = False
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
      'Filters={"ZLibCompression":{"CompressMoreThan":"512"}}'
      'DSAuthenticationUser=1'
      
        'DSAuthenticationPassword=356A192B7913B04C54574D18C28D46E6395428A' +
        'B')
    AfterConnect = DataSnapConnAfterConnect
    AfterDisconnect = DataSnapConnAfterDisconnect
    Left = 56
    Top = 128
  end
  object ProxyGenerator: TDSProxyGenerator
    IncludeClasses = 'TSMFuncoesViveiro'
    MetaDataProvider = DSConnectionMetaDataProvider1
    TargetUnitName = 'uFuncoes'
    Writer = 'Object Pascal DBX'
    Left = 144
    Top = 128
  end
  object DSConnectionMetaDataProvider1: TDSConnectionMetaDataProvider
    SQLConnection = DataSnapConn
    Left = 120
    Top = 208
  end
end
