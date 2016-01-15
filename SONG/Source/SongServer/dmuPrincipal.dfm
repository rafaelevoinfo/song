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
      'Database=banco.fdb'
      'Server=localhost'
      'User_Name=masterkey'
      'Password=sysdba'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    ConnectedStoredUsage = []
    LoginPrompt = False
    Left = 192
    Top = 64
  end
end
