object frameEditor: TframeEditor
  Left = 0
  Top = 0
  Width = 722
  Height = 496
  TabOrder = 0
  object pnFormatacao: TPanel
    Left = 0
    Top = 0
    Width = 722
    Height = 73
    Align = alTop
    TabOrder = 0
    object gbFonte: TcxGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 1
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'Fonte'
      TabOrder = 0
      Height = 71
      Width = 180
      object cbFonte: TcxFontNameComboBox
        Left = 3
        Top = 16
        TabOrder = 0
        Width = 121
      end
      object EditFonteSize: TcxSpinEdit
        Left = 126
        Top = 16
        TabOrder = 1
        Width = 49
      end
      object btnNegrito: TButton
        Left = 3
        Top = 37
        Width = 25
        Height = 25
        Action = FormatRichEditBold1
        Images = dmPrincipal.imgIcons_16
        TabOrder = 2
      end
      object btnItalico: TButton
        Left = 27
        Top = 37
        Width = 25
        Height = 25
        Action = FormatRichEditItalic1
        Images = dmPrincipal.imgIcons_16
        TabOrder = 3
      end
      object btnSublinhado: TButton
        Left = 51
        Top = 37
        Width = 25
        Height = 25
        Action = FormatRichEditUnderline1
        Images = dmPrincipal.imgIcons_16
        TabOrder = 4
      end
    end
    object gbAlinhamento: TcxGroupBox
      Left = 187
      Top = 1
      Align = alLeft
      Caption = 'Par'#225'grafo'
      TabOrder = 1
      Height = 71
      Width = 80
      object btnAlinhamentoEsquerda: TButton
        Left = 2
        Top = 38
        Width = 25
        Height = 25
        Action = FormatRichEditAlignLeft1
        ImageIndex = 52
        Images = dmPrincipal.imgIcons_16
        TabOrder = 0
      end
      object btnAlinhamentoCentro: TButton
        Left = 26
        Top = 38
        Width = 25
        Height = 25
        Action = FormatRichEditAlignCenter1
        Images = dmPrincipal.imgIcons_16
        TabOrder = 1
      end
      object btnAlinhamentoDireita: TButton
        Left = 50
        Top = 38
        Width = 25
        Height = 25
        Action = FormatRichEditAlignRight1
        Images = dmPrincipal.imgIcons_16
        TabOrder = 2
      end
      object btnBullet: TButton
        Left = 2
        Top = 13
        Width = 25
        Height = 25
        Action = FormatRichEditBullets1
        Images = dmPrincipal.imgIcons_16
        TabOrder = 3
      end
    end
  end
  object pnRich: TPanel
    Left = 0
    Top = 73
    Width = 722
    Height = 423
    Align = alClient
    Color = clGray
    ParentBackground = False
    TabOrder = 1
    object Rich: TcxDBRichEdit
      AlignWithMargins = True
      Left = 3
      Top = 0
      Margins.Top = 0
      Margins.Bottom = 0
      Properties.ScrollBars = ssVertical
      Style.BorderStyle = ebsUltraFlat
      Style.Shadow = True
      Style.TransparentBorder = True
      TabOrder = 0
      Height = 423
      Width = 481
    end
  end
  object ActionList1: TActionList
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
      ImageIndex = 54
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
