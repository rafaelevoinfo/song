object frmAtualizacao: TfrmAtualizacao
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Atualizando...'
  ClientHeight = 144
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbSistema: TLabel
    Left = 8
    Top = 8
    Width = 240
    Height = 25
    Caption = 'Atualizando PWorkStation'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbNovaVersao: TLabel
    Left = 8
    Top = 34
    Width = 151
    Height = 19
    Caption = 'Nova Vers'#227'o: 1.0.0.1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbStatus: TLabel
    Left = 8
    Top = 75
    Width = 100
    Height = 13
    Caption = 'Baixando arquivos...'
  end
  object pbProgresso: TProgressBar
    Left = 8
    Top = 92
    Width = 377
    Height = 41
    TabOrder = 0
  end
  object tmrShow: TTimer
    Enabled = False
    Interval = 200
    OnTimer = tmrShowTimer
    Left = 328
    Top = 8
  end
  object Update: TWebUpdate
    Agent = 'PmedicoUpdate'
    ApplyPatch = True
    DateFormat = 'dd/mm/yyyy'
    DateSeparator = '/'
    ExtractCAB = True
    ExistingConnection = True
    ForceUpdate = True
    LanguageID = '$O416'
    LogFileName = 'Update.Log'
    PostUpdateInfo.Enabled = False
    Signature = 'PmedicoUpdate'
    TempDirectory = '.'
    TimeFormat = 'hh:nn'
    TimeSeparator = ':'
    UpdateType = fileUpdate
    UpdateUpdate = wuuSilent
    UseCRC32 = True
    Version = '2.2.7.1'
    Left = 181
    Top = 97
  end
  object httpCloud: TIdHTTP
    OnWork = httpCloudWork
    OnWorkBegin = httpCloudWorkBegin
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 192
    Top = 40
  end
end
