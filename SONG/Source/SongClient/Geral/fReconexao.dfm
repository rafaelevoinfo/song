inherited frmReconexao: TfrmReconexao
  BorderIcons = []
  Caption = 'Reconectando...'
  ClientHeight = 182
  ClientWidth = 533
  ExplicitWidth = 549
  ExplicitHeight = 221
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 533
    Height = 24
    Align = alTop
    Alignment = taCenter
    Caption = 'A conex'#227'o com o servidor foi perdida.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 336
  end
  object Label2: TLabel
    Left = 0
    Top = 24
    Width = 533
    Height = 16
    Align = alTop
    Alignment = taCenter
    Caption = 'Aguarde enquanto tentamos restabelcer a conex'#227'o.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 296
  end
  object Label3: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 60
    Width = 527
    Height = 14
    Margins.Top = 20
    Align = alTop
    Alignment = taCenter
    Caption = 'Quantidade de tentativas j'#225' realizadas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 206
  end
  object lbQtdeTentativas: TLabel
    Left = 0
    Top = 74
    Width = 533
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = '00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 14
  end
  object lbStatus: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 97
    Width = 527
    Height = 14
    Margins.Top = 10
    Align = alTop
    Alignment = taCenter
    Caption = 'Pr'#243'xima tentativa em'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitLeft = 0
    ExplicitTop = 87
    ExplicitWidth = 116
  end
  object lbTempo: TLabel
    Left = 0
    Top = 111
    Width = 533
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = '10'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 14
  end
  object btnFechar: TButton
    Left = 202
    Top = 134
    Width = 129
    Height = 45
    Caption = 'Fechar Sistema'
    ImageIndex = 5
    Images = dmPrincipal.imgIcons_32
    TabOrder = 0
    OnClick = btnFecharClick
  end
  object tmrTempo: TTimer
    Enabled = False
    OnTimer = tmrTempoTimer
    Left = 408
    Top = 88
  end
end
