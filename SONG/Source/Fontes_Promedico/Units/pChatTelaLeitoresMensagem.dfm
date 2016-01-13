inherited frmChatTelaLeitoresMensagem: TfrmChatTelaLeitoresMensagem
  BorderStyle = bsDialog
  Caption = 'frmChatTelaLeitoresMensagem'
  ClientWidth = 482
  OnKeyDown = pmfrmZeroFormKeyDown
  pmNaoAjustarTamTela = True
  ExplicitWidth = 488
  ExplicitHeight = 282
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRodape: TPanel
    Left = 0
    Top = 212
    Width = 482
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlRodape'
    ShowCaption = False
    TabOrder = 2
    object bttRetornar: TButton
      Left = 0
      Top = 0
      Width = 112
      Height = 41
      Action = DMChat.Ac_Retornar
      Align = alLeft
      Images = DMChat.ImgListBotoes32x32
      TabOrder = 0
    end
    object pnlLegenda: TPanel
      Left = 224
      Top = 0
      Width = 258
      Height = 41
      Align = alRight
      BevelOuter = bvNone
      Caption = 'pnlLegenda'
      ShowCaption = False
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 41
        Height = 13
        Caption = 'Legenda'
      end
      object Label2: TLabel
        Left = 40
        Top = 24
        Width = 80
        Height = 13
        Caption = 'Leu a mensagem'
      end
      object Shape1: TShape
        Left = 8
        Top = 24
        Width = 13
        Height = 13
      end
      object Shape2: TShape
        Left = 136
        Top = 24
        Width = 13
        Height = 13
        Brush.Color = 10329599
      end
      object Label3: TLabel
        Left = 152
        Top = 24
        Width = 99
        Height = 13
        Caption = 'N'#227'o leu a mensagem'
      end
      object Shape3: TShape
        Left = 24
        Top = 24
        Width = 13
        Height = 13
        Brush.Color = clSkyBlue
      end
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 41
    Width = 482
    Height = 171
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCustomDrawCell = cxGrid1DBTableView1CustomDrawCell
      DataController.DataSource = DMChat.dsLeitoresMensagem
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.ColumnHeaderHints = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1NOME_SENHAUS: TcxGridDBColumn
        DataBinding.FieldName = 'NOME_SENHAUS'
        Width = 170
      end
      object cxGrid1DBTableView1DATA_HORA: TcxGridDBColumn
        DataBinding.FieldName = 'DATA_HORA'
        HeaderAlignmentHorz = taCenter
        Width = 110
      end
      object cxGrid1DBTableView1NOME_PC: TcxGridDBColumn
        DataBinding.FieldName = 'NOME_PC'
        Width = 125
      end
      object cxGrid1DBTableView1MENSAGEM_LIDA: TcxGridDBColumn
        DataBinding.FieldName = 'MENSAGEM_LIDA'
        RepositoryItem = DMChat.EditRepCbSimNao
        HeaderAlignmentHorz = taCenter
        Width = 56
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object pnlMensagemNaoLida: TPanel
    Left = 0
    Top = 0
    Width = 482
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnlMensagemNaoLida'
    ShowCaption = False
    TabOrder = 0
    object Label4: TLabel
      Left = 8
      Top = 8
      Width = 184
      Height = 23
      Caption = 'Mensagem n'#227'o lida'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
