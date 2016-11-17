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
    Connected = True
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
end
