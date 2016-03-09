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
    FormatOptions.AssignedValues = [fvDefaultParamDataType, fvDataSnapCompatibility]
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
  object qLogin: TRFQuery
    Connection = conSong
    SQL.Strings = (
      'select PESSOA.ID,'
      '       Pessoa.login,'
      '       Pessoa.Senha'
      'from PESSOA'
      'where PESSOA.LOGIN = :LOGIN and'
      '      PESSOA.SENHA = :SENHA and'
      '      ((PESSOA.Ativo = 0) or (PESSOA.ATIVO is Null));')
    Left = 472
    Top = 256
    ParamData = <
      item
        Name = 'LOGIN'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SENHA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qLoginID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qLoginLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Size = 100
    end
    object qLoginSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 100
    end
  end
  object ApplicationEvents1: TApplicationEvents
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
end
