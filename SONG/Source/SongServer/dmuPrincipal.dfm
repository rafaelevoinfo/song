object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  Height = 271
  Width = 415
  object Server: TDSServer
    AutoStart = False
    Left = 96
    Top = 11
  end
  object ServerTransport: TDSTCPServerTransport
    Port = 3004
    Server = Server
    Filters = <>
    Left = 96
    Top = 73
  end
  object HttpServer: TDSHTTPService
    HttpPort = 8080
    Server = Server
    Filters = <>
    Left = 96
    Top = 135
  end
  object conSong: TFDConnection
    Params.Strings = (
      'Database=C:\Users\rafae\Repositorios\SONG\BancoDados\SONG.FDB'
      'Server=localhost'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    ConnectedStoredUsage = []
    LoginPrompt = False
    Left = 192
    Top = 64
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 288
    Top = 64
  end
end
