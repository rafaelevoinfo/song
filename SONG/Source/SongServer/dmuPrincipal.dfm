object dmPrincipal: TdmPrincipal
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 442
  Width = 911
  PixelsPerInch = 96
  object Server: TDSServer
    AutoStart = False
    Left = 96
    Top = 11
  end
  object ServerTransport: TDSTCPServerTransport
    Port = 3004
    Server = Server
    Filters = <
      item
        FilterId = 'ZLibCompression'
        Properties.Strings = (
          'CompressMoreThan=512')
      end>
    AuthenticationManager = Authentication
    OnDisconnect = ServerTransportDisconnect
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
      
        'Database=C:\Users\rafae\Repositorios\SONG\SONG\BancoDados\Oreade' +
        's\SONG.FDB'
      'Server=localhost'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    ConnectedStoredUsage = []
    LoginPrompt = False
    Left = 192
    Top = 40
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 288
    Top = 64
  end
  object FDManager1: TFDManager
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale, fvDefaultParamDataType, fvDataSnapCompatibility]
    FormatOptions.MaxBcdPrecision = 24
    FormatOptions.MaxBcdScale = 8
    FormatOptions.DefaultParamDataType = ftInteger
    FormatOptions.DataSnapCompatibility = True
    Active = True
    Left = 200
    Top = 144
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
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 680
    Top = 72
  end
  object SCLookup: TDSServerClass
    OnGetClass = SCLookupGetClass
    Server = Server
    Left = 576
    Top = 168
  end
  object SCFuncoesAdministrativo: TDSServerClass
    OnGetClass = SCFuncoesAdministrativoGetClass
    Server = Server
    Left = 680
    Top = 168
  end
  object SCFinanceiro: TDSServerClass
    OnGetClass = SCFinanceiroGetClass
    Server = Server
    Left = 528
    Top = 88
  end
  object SCViveiro: TDSServerClass
    OnGetClass = SCViveiroGetClass
    Server = Server
    Left = 576
    Top = 232
  end
  object cdsAtualizacoes: TClientDataSet
    Aggregates = <>
    FileName = 'Atualizacoes.xml'
    IndexFieldNames = 'MAJOR;MINOR;RELEASE;BUILD'
    Params = <>
    Left = 264
    Top = 304
    object cdsAtualizacoesMAJOR: TIntegerField
      FieldName = 'MAJOR'
    end
    object cdsAtualizacoesMINOR: TIntegerField
      FieldName = 'MINOR'
    end
    object cdsAtualizacoesRELEASE: TIntegerField
      FieldName = 'RELEASE'
    end
    object cdsAtualizacoesBUILD: TIntegerField
      FieldName = 'BUILD'
    end
    object cdsAtualizacoesENDERECO: TStringField
      DisplayLabel = 'Localiza'#231#227'o do Arquivo'
      FieldName = 'ENDERECO'
      Size = 300
    end
    object cdsAtualizacoesVERSAO: TStringField
      DisplayLabel = 'Vers'#227'o'
      FieldName = 'VERSAO'
      Size = 60
    end
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 312
    Top = 152
  end
  object SCFuncoesViveiro: TDSServerClass
    OnGetClass = SCFuncoesViveiroGetClass
    Server = Server
    Left = 680
    Top = 232
  end
  object SCFuncoesFinanceiro: TDSServerClass
    OnGetClass = SCFuncoesFinanceiroGetClass
    Server = Server
    Left = 576
    Top = 312
  end
  object SCEstoque: TDSServerClass
    OnGetClass = SCEstoqueGetClass
    Server = Server
    Left = 680
    Top = 304
  end
  object SCFuncoesEstoque: TDSServerClass
    OnGetClass = SCFuncoesEstoqueGetClass
    Server = Server
    Left = 816
    Top = 176
  end
  object SCRelatorio: TDSServerClass
    OnGetClass = SCRelatorioGetClass
    Server = Server
    Left = 416
    Top = 232
  end
  object SCFuncoesRelatorio: TDSServerClass
    OnGetClass = SCFuncoesRelatorioGetClass
    Server = Server
    Left = 800
    Top = 232
  end
  object SCSistema: TDSServerClass
    OnGetClass = SCSistemaGetClass
    Server = Server
    Left = 776
    Top = 312
  end
  object SCFuncoesSistema: TDSServerClass
    OnGetClass = SCFuncoesSistemaGetClass
    Server = Server
    Left = 680
    Top = 376
  end
end
