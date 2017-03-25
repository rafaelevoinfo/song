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
  object SongServerCon: TRFSQLConnection
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
        'B'
      'ConnectTimeout=5000')
    AfterConnect = SongServerConAfterConnect
    AfterDisconnect = SongServerConAfterDisconnect
    Left = 56
    Top = 128
  end
  object ProxyGenerator: TDSProxyGenerator
    IncludeClasses = 'TSMFuncoesViveiro;TSMFuncoesSistema'
    MetaDataProvider = DSConnectionMetaDataProvider1
    TargetUnitName = 'uFuncoes'
    Writer = 'Object Pascal DBX'
    Left = 144
    Top = 128
  end
  object DSConnectionMetaDataProvider1: TDSConnectionMetaDataProvider
    SQLConnection = SongServerCon
    Left = 120
    Top = 208
  end
  object qConfig: TRFQuery
    Connection = Connection
    SQL.Strings = (
      'SELECT ID,'
      '       DATA_ULTIMA_SYNC,'
      '       HOST_SERVIDOR_EXTERNO,'
      '       HOST_SERVIDOR_INTERNO,'
      '       ID_APARELHO,'
      '       LOGIN,'
      '       SENHA'
      '  FROM CONFIG;')
    Left = 256
    Top = 128
    object qConfigID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qConfigDATA_ULTIMA_SYNC: TDateTimeField
      FieldName = 'DATA_ULTIMA_SYNC'
      Origin = 'DATA_ULTIMA_SYNC'
      ProviderFlags = [pfInUpdate]
    end
    object qConfigHOST_SERVIDOR_EXTERNO: TWideStringField
      FieldName = 'HOST_SERVIDOR_EXTERNO'
      Origin = 'HOST_SERVIDOR_EXTERNO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qConfigHOST_SERVIDOR_INTERNO: TWideStringField
      FieldName = 'HOST_SERVIDOR_INTERNO'
      Origin = 'HOST_SERVIDOR_INTERNO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qConfigID_APARELHO: TIntegerField
      FieldName = 'ID_APARELHO'
      Origin = 'ID_APARELHO'
      ProviderFlags = [pfInUpdate]
    end
    object qConfigLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qConfigSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object qEspecie: TRFQuery
    Connection = Connection
    SQL.Strings = (
      'Select especie.id,'
      '       especie.nome'
      'from especie'
      'order by especie.nome')
    Left = 280
    Top = 202
    object qEspecieID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      ReadOnly = True
    end
    object qEspecieNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object BindSourceEspecie: TBindSourceDB
    DataSet = qEspecie
    ScopeMappings = <>
    Left = 280
    Top = 258
  end
end
