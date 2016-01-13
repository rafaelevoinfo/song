inherited frmChatTelaPesquisa: TfrmChatTelaPesquisa
  BorderStyle = bsDialog
  Caption = 'Pesquisa de Mensagens'
  ClientHeight = 72
  pmNaoAjustarTamTela = True
  ExplicitWidth = 543
  ExplicitHeight = 101
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 113
    Height = 72
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    ExplicitHeight = 76
    object Button1: TButton
      Left = 0
      Top = 0
      Width = 113
      Height = 36
      Action = DMChat.Ac_PesquisarConversa
      Align = alTop
      Images = DMChat.ImgListBotoes32x32
      TabOrder = 0
      TabStop = False
      WordWrap = True
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 111
    end
    object Button2: TButton
      Left = 0
      Top = 36
      Width = 113
      Height = 36
      Action = DMChat.Ac_Retornar
      Align = alTop
      Images = DMChat.ImgListBotoes32x32
      TabOrder = 1
      TabStop = False
      ExplicitLeft = 1
      ExplicitTop = 37
      ExplicitWidth = 111
    end
  end
  object Panel2: TPanel
    Left = 113
    Top = 0
    Width = 424
    Height = 72
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    ShowCaption = False
    TabOrder = 1
    ExplicitHeight = 76
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 103
      Height = 13
      Caption = 'Pesquisar Mensagens'
    end
    object EditPesquisa: TcxTextEdit
      Left = 8
      Top = 24
      TabOrder = 0
      Width = 233
    end
    object EditDataInicial: TcxDateEdit
      Left = 248
      Top = 24
      TabOrder = 2
      Width = 81
    end
    object EditDataFinal: TcxDateEdit
      Left = 336
      Top = 24
      TabOrder = 3
      Width = 81
    end
    object cbxPesquisarPeriodo: TcxCheckBox
      Left = 248
      Top = 8
      Caption = 'Pesquisar por Per'#237'odo'
      TabOrder = 1
      OnClick = cbxPesquisarPeriodoClick
    end
  end
end
