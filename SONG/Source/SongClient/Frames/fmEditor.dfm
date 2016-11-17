object frameEditor: TframeEditor
  Left = 0
  Top = 0
  Width = 722
  Height = 496
  TabOrder = 0
  object pnRich: TPanel
    Left = 0
    Top = 22
    Width = 722
    Height = 474
    Align = alClient
    Color = clGray
    ParentBackground = False
    TabOrder = 0
    object Rich: TcxDBRichEdit
      Left = 114
      Top = 6
      Margins.Bottom = 0
      Properties.HideScrollBars = False
      Properties.ScrollBars = ssVertical
      Properties.WantTabs = True
      Properties.OnSelectionChange = RichPropertiesSelectionChange
      Style.BorderStyle = ebsUltraFlat
      Style.Shadow = True
      Style.TransparentBorder = True
      TabOrder = 0
      Height = 423
      Width = 480
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 722
    Height = 22
    AutoSize = True
    ButtonWidth = 25
    Caption = 'ToolBar1'
    DrawingStyle = dsGradient
    Images = dmPrincipal.imgIcons_16
    Indent = 5
    List = True
    TabOrder = 1
    object btnBold: TToolButton
      Left = 5
      Top = 0
      Action = FormatRichEditBold1
    end
    object btnItalico: TToolButton
      Left = 30
      Top = 0
      Action = FormatRichEditItalic1
    end
    object btnSublinhado: TToolButton
      Left = 55
      Top = 0
      Action = FormatRichEditUnderline1
    end
    object btnMarcador: TToolButton
      Left = 80
      Top = 0
      Action = FormatRichEditBullets1
    end
    object btnAlinharEsquerda: TToolButton
      Left = 105
      Top = 0
      Action = FormatRichEditAlignLeft1
    end
    object btnAlinharCentro: TToolButton
      Left = 130
      Top = 0
      Action = FormatRichEditAlignCenter1
    end
    object btnAlinharDireita: TToolButton
      Left = 155
      Top = 0
      Action = FormatRichEditAlignRight1
    end
    object cbFonte: TcxFontNameComboBox
      Left = 180
      Top = 0
      Properties.ImmediatePost = True
      Properties.OnEditValueChanged = cbFontePropertiesEditValueChanged
      TabOrder = 0
      Width = 121
    end
    object EditFonteSize: TcxSpinEdit
      Left = 301
      Top = 0
      Properties.ImmediatePost = True
      Properties.OnEditValueChanged = EditFonteSizePropertiesEditValueChanged
      TabOrder = 1
      Width = 49
    end
  end
  object ActionListEditor: TActionList
    Images = dmPrincipal.imgIcons_16
    Left = 72
    Top = 128
    object FormatRichEditBold1: TRichEditBold
      Category = 'Format'
      AutoCheck = True
      Hint = 'Bold'
      ImageIndex = 56
      ShortCut = 16450
    end
    object FormatRichEditItalic1: TRichEditItalic
      Category = 'Format'
      AutoCheck = True
      Hint = 'Italic'
      ImageIndex = 57
      ShortCut = 16457
    end
    object FormatRichEditUnderline1: TRichEditUnderline
      Category = 'Format'
      AutoCheck = True
      Hint = 'Underline'
      ImageIndex = 58
      ShortCut = 16469
    end
    object FormatRichEditAlignLeft1: TRichEditAlignLeft
      Category = 'Format'
      AutoCheck = True
      Hint = 'Align Left|Aligns text at the left indent'
      ImageIndex = 52
    end
    object FormatRichEditAlignRight1: TRichEditAlignRight
      Category = 'Format'
      AutoCheck = True
      Hint = 'Align Right|Aligns text at the right indent'
      ImageIndex = 54
    end
    object FormatRichEditAlignCenter1: TRichEditAlignCenter
      Category = 'Format'
      AutoCheck = True
      Hint = 'Center|Centers text between margins'
      ImageIndex = 53
    end
    object FormatRichEditBullets1: TRichEditBullets
      Category = 'Format'
      AutoCheck = True
      Hint = 'Bullets|Inserts a bullet on the current line'
      ImageIndex = 59
    end
  end
end
