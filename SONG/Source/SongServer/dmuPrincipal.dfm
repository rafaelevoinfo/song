object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 442
  Width = 911
  object Server: TDSServer
    AutoStart = False
    Left = 96
    Top = 11
  end
  object ServerTransport: TDSTCPServerTransport
    Port = 3004
    Server = Server
    Filters = <>
    AuthenticationManager = Authentication
    Left = 96
    Top = 73
  end
  object HttpServer: TDSHTTPService
    HttpPort = 8080
    Server = Server
    Filters = <>
    AuthenticationManager = Authentication
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
    Left = 208
    Top = 64
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 288
    Top = 64
  end
  object FDManager1: TFDManager
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMapRules, fvDefaultParamDataType, fvDataSnapCompatibility]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    FormatOptions.DefaultParamDataType = ftInteger
    FormatOptions.DataSnapCompatibility = True
    Active = True
    Left = 192
    Top = 120
  end
  object Authentication: TDSAuthenticationManager
    OnUserAuthenticate = AuthenticationUserAuthenticate
    OnUserAuthorize = AuthenticationUserAuthorize
    Roles = <>
    Left = 128
    Top = 208
  end
  object SCAdministrativo: TDSServerClass
    OnGetClass = SCAdministrativoGetClass
    Server = Server
    Left = 448
    Top = 88
  end
  object SCFuncoesGeral: TDSServerClass
    OnGetClass = SCFuncoesGeralGetClass
    Server = Server
    Left = 456
    Top = 168
  end
end
