object frmRecordPlayer: TfrmRecordPlayer
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 220
  BorderStyle = bsNone
  Caption = 'Pr'#243'-M'#233'dico - Gravador e Reprodutor de '#193'udio'
  ClientHeight = 296
  ClientWidth = 452
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  PopupMode = pmExplicit
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    452
    296)
  PixelsPerInch = 96
  TextHeight = 13
  object pnPai: TPanel
    Left = 0
    Top = 0
    Width = 452
    Height = 214
    Align = alTop
    AutoSize = True
    Color = clBlack
    ParentBackground = False
    TabOrder = 0
    OnMouseDown = pnPaiMouseDown
    DesignSize = (
      452
      214)
    object lbAutor: TLabel
      Left = 1
      Top = 153
      Width = 450
      Height = 13
      Align = alTop
      Caption = 'Autor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 31
    end
    object lbTitulo: TcxLabel
      Left = 1
      Top = 1
      Align = alTop
      AutoSize = False
      Caption = 'T'#237'tulo'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clTeal
      Style.Font.Height = 15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextColor = 15658734
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      Properties.Orientation = cxoLeft
      OnMouseDown = pnPaiMouseDown
      Height = 19
      Width = 450
    end
    object lbSubTitulo: TcxLabel
      Left = 1
      Top = 20
      Align = alTop
      AutoSize = False
      Caption = 'SubTitulo'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = 14
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextColor = 15658734
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      Properties.Orientation = cxoLeft
      OnMouseDown = pnPaiMouseDown
      Height = 18
      Width = 450
    end
    object btnSair: TcxButton
      Left = 428
      Top = 4
      Width = 22
      Height = 16
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Action = Ac_Sair
      Anchors = [akTop, akRight]
      Colors.Normal = clBlack
      Colors.Hot = 15658734
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
      PaintStyle = bpsGlyph
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 2
    end
    object pnLinhaTempo: TPanel
      Left = 1
      Top = 38
      Width = 450
      Height = 48
      Align = alTop
      BevelOuter = bvNone
      Caption = 'pnLinhaTempo'
      TabOrder = 3
      object lbStatus: TLabel
        Left = 203
        Top = 3
        Width = 49
        Height = 19
        Caption = 'Parado'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clCream
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTempoTotal: TLabel
        Left = 393
        Top = 9
        Width = 44
        Height = 13
        Caption = '00:00:00'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clCream
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTempoAtual: TLabel
        Left = 10
        Top = 9
        Width = 44
        Height = 13
        Caption = '00:00:00'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clCream
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object tbLinhaTempo: TAdvTrackBar
        Left = 6
        Top = 24
        Width = 448
        Height = 21
        BorderColor = clNone
        BorderColorDisabled = clNone
        Buttons.BorderColor = 9262895
        Buttons.BorderColorHot = 10079963
        Buttons.BorderColorDown = 4548219
        Buttons.Color = 15653832
        Buttons.ColorTo = 16178633
        Buttons.ColorHot = 15465983
        Buttons.ColorHotTo = 11332863
        Buttons.ColorDown = 7778289
        Buttons.ColorDownTo = 4296947
        Buttons.ColorMirror = 15586496
        Buttons.ColorMirrorTo = 16245200
        Buttons.ColorMirrorHot = 5888767
        Buttons.ColorMirrorHotTo = 10807807
        Buttons.ColorMirrorDown = 946929
        Buttons.ColorMirrorDownTo = 5021693
        Buttons.GradientMirror = ggVertical
        ColorTo = clNone
        ColorDisabled = clNone
        ColorDisabledTo = clNone
        Direction = gdHorizontal
        Color = clNone
        Max = 0
        Slider.BorderColor = clNone
        Slider.BorderColorDisabled = clBlack
        Slider.Color = clWhite
        Slider.ColorTo = clBlack
        Slider.ColorDisabled = clBlack
        Slider.ColorDisabledTo = clBlack
        Slider.ColorCompleted = clNone
        Slider.ColorCompletedTo = clNone
        Slider.ColorCompletedDisabled = clNone
        Slider.ColorCompletedDisabledTo = clNone
        Slider.Direction = gdHorizontal
        Slider.Picture.Data = {
          89504E470D0A1A0A0000000D49484452000001B00000000C08060000000331E8
          90000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
          00097048597300000EC200000EC20115284A800000001C74455874536F667477
          6172650041646F62652046697265776F726B7320435336E8BCB28C000001E649
          444154785EED9B3B6A02511486DD444088EBD14A884D5010418C4644C407F840
          457CA28246C5291CF1817693266409D9839B481342167072EF1493768A304CF1
          09A75187818F0F7E7ECEBD81001F08400002108000042000010840000210F090
          402814BA8FC562CFE974DA2C168B56B95CB66AB59A55AFD7AD66B3C9C0000770
          000770C073077406E92CD299542814AC542A6544A3D1C7603078E74464241279
          4A26931FF97CFEA75AAD8A0A2DE976BBD2EBF5A4DFEFCB603060608003388003
          38E099033A7B7406753A1D69341A52A9542497CB7DC5E3F1B77038FCE00498FA
          E25DFDF0AD92CEFEF3683492F97C2ECBE55256AB95ACD76B0606388003388003
          9E39A0B367B158C86C3693E17028ED765B5413934C26F39948245E9C00CB66B3
          B752A924AD564BC6E3B11D5C8661C87EBF97E3F128A7D38981010EE0000EE080
          670E1C0E07314D53B6DBAD1D643AC47413536B2E5199F5EA04986A5F379D6CBA
          7D4DA753D96C36F683E7F3592E978B5CAF5706063880033880039E39A0B34797
          A7DD6E67B7BEC96462972C5DB65466FD05180D8C8649CBC6011CC0013F39E0BA
          81B10363C7C79E1307700007FCE480EB1D18A7103965C949531CC0011CF09303
          AE4F21720F8CBB6EDCF7C3011CC001BF39E0EA1E988777A67915042000010840
          E05F08FC02D024C5C3E9D4CB450000000049454E44AE426082}
        Slider.Size = 12
        Slider.Offset = 0
        TabOrder = 0
        Thumb.BorderColor = 10317632
        Thumb.BorderColorHot = 10079963
        Thumb.BorderColorDown = 4548219
        Thumb.BorderColorDisabled = clBlack
        Thumb.Color = 15653832
        Thumb.ColorTo = 16178633
        Thumb.ColorDown = 7778289
        Thumb.ColorDownTo = 4296947
        Thumb.ColorHot = 15465983
        Thumb.ColorHotTo = 11332863
        Thumb.ColorDisabled = clBlack
        Thumb.ColorDisabledTo = clBlack
        Thumb.ColorMirror = 15586496
        Thumb.ColorMirrorTo = 16245200
        Thumb.ColorMirrorHot = 5888767
        Thumb.ColorMirrorHotTo = 10807807
        Thumb.ColorMirrorDown = 946929
        Thumb.ColorMirrorDownTo = 5021693
        Thumb.ColorMirrorDisabled = clBlack
        Thumb.ColorMirrorDisabledTo = clBlack
        Thumb.Gradient = ggVertical
        Thumb.GradientMirror = ggRadial
        Thumb.Picture.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F80000000473424954080808087C086488000000097048597300000EC300000E
          C301C76FA8640000001C74455874536F6674776172650041646F626520466972
          65776F726B7320435336E8BCB28C00000016744558744372656174696F6E2054
          696D650030312F30372F3133A56FB49600000342494441544889B5963F4F2A59
          18879F51B83893258A5EC3A2A3588A18280CD26CA18561FC43B37626167E85ED
          6C2CE8BDB5F113D0AC898A0663684C2C30713AC4488C1043F692350861C3CDDC
          41660B468232E4DE64D7934C26E49C3C0FEF7B667E6704C330F8C8D1F7A174C0
          D66B4210843E40029CC027A0FFDD9217E03B5003EA8661342D39562D32E143C0
          B07949167FA601D481B27955AC245D1574C03F036E5320D2DDCE26F00D70BCCE
          0982D02579237807FF15F81C8D46D72391C86A381C1EEC5C9B4EA7AB67676727
          C7C7C77F024207E38DA4DD222B782C16FB128944BCD7D7D79C9F9F93CD661104
          81B9B939969696F0F97C2493C9C2CECECE1FC013F0D5BCB7259D825F4CB00718
          8DC5625F42A190776F6F8F9B9B1B2449421445FAFAFA68369BE8BACEECEC2C5B
          5B5B5C5C5CBC4AFE06FE02BE1A86F10FEFFAEA34FBED8A46A3EB8AA278F7F7F7
          B9BDBD65747494F1F171645966727212599671BBDDE47239E2F1388AA278D7D6
          D67E075C26C3F90AED147CA2F5B4889148643593C990C964181919C1ED76E3F1
          789065998989096459C6E3F1E076BBC966B3DCDFDFB3B2B2B2663E0C92C9EADA
          E47EF3777F381C1EDCDDDD451445868686181E1E666161019FCF07403E9F4755
          5500344DE3EAEA8A8D8D8DC14E8655056F86AAAA88A2882449389DCE361C606A
          6A0A97CB85D3E944922472B95C2F8CB5401084F686DA6C36EC767BD71A87C381
          DD6EC766EB1906BD058661100C0669369B341A0D745D279FCFB7E79F9E9ED034
          0D5DD769341A0483C19E824EFD0BADD7FF259D4E571717170733990CF57A9D5A
          AD86AAAA3C3C3CE07038D0348DE7E7676AB51ABAAE130A855055B5DAC9B0AAE0
          3BAD6CF9964C26133333330402012A950AE5729952A944B158E4F1F19162B148
          A954A25C2E333D3DCDD8D818A7A7A7095AD15137595D15D46885962391481CCC
          CFCFFFB6B9B9E98DC7E364B359344DA35AAD62B3D9DA6DF3FBFD288A422A952A
          1C1E1E1E00CF26A3F60AFD6154288AE22D140A5C5E5E727777C7C0C0007EBF9F
          402080D7EB25954A15B6B7B77F1C15BD24D168747D79797935140ABD093B5555
          AB27272789A3A3A3835EF02E8185E467E2BA0C94ACE0EFF70000C3309A822054
          3A201AFFE1C0B13CD13A2AF99823F3FF1C1FFE55F12FF42482A6E1569DD00000
          000049454E44AE426082}
        Thumb.Size = 24
        Thumb.Width = 24
        Thumb.Shape = tsLine
        TickMark.Color = clBlack
        TickMark.ColorDisabled = clBlack
        TickMark.Font.Charset = DEFAULT_CHARSET
        TickMark.Font.Color = clWindowText
        TickMark.Font.Height = -11
        TickMark.Font.Name = 'Tahoma'
        TickMark.Font.Style = []
        TickMark.Style = tsNone
        TrackHint = False
        TrackLabel.Font.Charset = DEFAULT_CHARSET
        TrackLabel.Font.Color = clWindowText
        TrackLabel.Font.Height = -11
        TrackLabel.Font.Name = 'Tahoma'
        TrackLabel.Font.Style = []
        TrackLabel.Format = 'Pos: %d'
        Version = '1.6.7.0'
        OnChange = tbLinhaTempoChange
      end
      object pbProgresso: TcxProgressBar
        Left = 89
        Top = 23
        TabOrder = 1
        Visible = False
        Width = 271
      end
    end
    object pnBotoes: TPanel
      AlignWithMargins = True
      Left = 6
      Top = 86
      Width = 442
      Height = 67
      Margins.Left = 5
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Caption = 'pnBotoes'
      TabOrder = 4
      OnMouseDown = pnPaiMouseDown
      object btnGravar: TcxButton
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 21
        Height = 61
        Margins.Left = 0
        Align = alLeft
        Action = Ac_Gravar
        OptionsImage.Images = cxImageList1
        SpeedButtonOptions.CanBeFocused = False
        SpeedButtonOptions.Transparent = True
        TabOrder = 0
      end
      object btnAnterior: TcxButton
        AlignWithMargins = True
        Left = 24
        Top = 3
        Width = 28
        Height = 61
        Margins.Left = 0
        Align = alLeft
        Action = Ac_Inicio
        OptionsImage.Images = cxImageList1
        PaintStyle = bpsGlyph
        SpeedButtonOptions.CanBeFocused = False
        SpeedButtonOptions.Transparent = True
        TabOrder = 1
      end
      object btnVoltar: TcxButton
        AlignWithMargins = True
        Left = 55
        Top = 3
        Width = 21
        Height = 61
        Margins.Left = 0
        Align = alLeft
        Action = Ac_Voltar
        OptionsImage.Images = cxImageList1
        SpeedButtonOptions.CanBeFocused = False
        SpeedButtonOptions.Transparent = True
        TabOrder = 2
      end
      object btnPlayPause: TcxButton
        AlignWithMargins = True
        Left = 79
        Top = 3
        Width = 20
        Height = 61
        Margins.Left = 0
        Align = alLeft
        Action = Ac_PlayPause
        OptionsImage.Images = cxImageList1
        SpeedButtonOptions.CanBeFocused = False
        SpeedButtonOptions.Transparent = True
        TabOrder = 3
      end
      object btnStop: TcxButton
        AlignWithMargins = True
        Left = 102
        Top = 3
        Width = 21
        Height = 61
        Margins.Left = 0
        Align = alLeft
        Action = Ac_Parar
        OptionsImage.Images = cxImageList1
        SpeedButtonOptions.CanBeFocused = False
        SpeedButtonOptions.Transparent = True
        TabOrder = 4
      end
      object btnAvancar: TcxButton
        AlignWithMargins = True
        Left = 126
        Top = 3
        Width = 21
        Height = 61
        Margins.Left = 0
        Align = alLeft
        Action = Ac_Avancar
        OptionsImage.Images = cxImageList1
        SpeedButtonOptions.CanBeFocused = False
        SpeedButtonOptions.Transparent = True
        TabOrder = 5
      end
      object btnProximo: TcxButton
        AlignWithMargins = True
        Left = 150
        Top = 3
        Width = 21
        Height = 61
        Margins.Left = 0
        Align = alLeft
        Action = Ac_Final
        OptionsImage.Images = cxImageList1
        SpeedButtonOptions.CanBeFocused = False
        SpeedButtonOptions.Transparent = True
        TabOrder = 6
      end
      object btnSalvar: TcxButton
        AlignWithMargins = True
        Left = 177
        Top = 3
        Width = 21
        Height = 61
        Margins.Right = 0
        Align = alLeft
        Action = Ac_Salvar
        OptionsImage.Images = cxImageList1
        SpeedButtonOptions.CanBeFocused = False
        SpeedButtonOptions.Transparent = True
        TabOrder = 7
      end
      object pnBarras: TPanel
        Left = 198
        Top = 0
        Width = 244
        Height = 67
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnFaixa'
        TabOrder = 8
        object lbFaixaAtual: TLabel
          Left = 72
          Top = 5
          Width = 41
          Height = 13
          Caption = 'Faixa 01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Panel1: TPanel
          Left = 163
          Top = 0
          Width = 81
          Height = 67
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          object tbVolume: TAdvTrackBar
            Left = 0
            Top = 0
            Width = 81
            Height = 31
            Align = alTop
            BackGround.Data = {
              89504E470D0A1A0A0000000D494844520000006E000000190806000000D07C1B
              820000000473424954080808087C086488000000097048597300000EC300000E
              C301C76FA86400000016744558744372656174696F6E2054696D650030312F30
              382F3133FD0CA4C00000001C74455874536F6674776172650041646F62652046
              697265776F726B7320435336E8BCB28C00000100494441546881EDDA2B0E8350
              1484E1A1A96F5941EF12D841EF525118140A83426150280C0A85610954B4491F
              699B400E170ECC97E00890FC610C78C33080F4392CFD00340DC329C5704A319C
              52C7A51F80EEFABE0F009C015800E67104004EBEEF7B9FE7339C435DD7193C83
              BC46BA8CBD16C3CDA06D5B8BF7B7E60CE02A790F869BA8699A9FD3E6E2FE0CF7
              475DD70642D3268DE10054556531F3B449DB4DB8B22C179D36699B0A571485C1
              4AA74D9ACA70799E5B289B3669AB0D9765D9A6A64DDAA2E1D23435D8C9B44973
              122E49128B9D4F9B34B170711C73DA1C1A152E8A22034EDB2A7C0D1786A105A7
              6DD53CFE73A2133FA42AC5704A319C520CA7D40DB0A13887DB16613C00000000
              49454E44AE426082}
            BorderColor = clNone
            BorderColorDisabled = clNone
            Buttons.BorderColor = 9262895
            Buttons.BorderColorHot = 10079963
            Buttons.BorderColorDown = 4548219
            Buttons.Color = 15653832
            Buttons.ColorTo = 16178633
            Buttons.ColorHot = 15465983
            Buttons.ColorHotTo = 11332863
            Buttons.ColorDown = 7778289
            Buttons.ColorDownTo = 4296947
            Buttons.ColorMirror = 15586496
            Buttons.ColorMirrorTo = 16245200
            Buttons.ColorMirrorHot = 5888767
            Buttons.ColorMirrorHotTo = 10807807
            Buttons.ColorMirrorDown = 946929
            Buttons.ColorMirrorDownTo = 5021693
            Buttons.GradientMirror = ggVertical
            ColorTo = clNone
            ColorDisabled = clNone
            ColorDisabledTo = clNone
            Direction = gdHorizontal
            Color = clNone
            Max = 100
            Position = 50
            Slider.BorderColor = clNone
            Slider.BorderColorDisabled = clNone
            Slider.Color = clNone
            Slider.ColorTo = clNone
            Slider.ColorDisabled = clNone
            Slider.ColorDisabledTo = clNone
            Slider.ColorCompleted = clNone
            Slider.ColorCompletedTo = clNone
            Slider.ColorCompletedDisabled = clNone
            Slider.ColorCompletedDisabledTo = clNone
            Slider.Direction = gdHorizontal
            Slider.Size = 12
            Slider.Border3D = False
            Slider.Rounded = True
            Slider.Visible = False
            Slider.Offset = 0
            TabOrder = 0
            Thumb.BorderColor = clGray
            Thumb.BorderColorHot = clGray
            Thumb.BorderColorDown = clGray
            Thumb.BorderColorDisabled = clGray
            Thumb.Color = clGray
            Thumb.ColorTo = clGray
            Thumb.ColorDown = clGray
            Thumb.ColorDownTo = clGray
            Thumb.ColorHot = clGray
            Thumb.ColorHotTo = clGray
            Thumb.ColorDisabled = clGray
            Thumb.ColorDisabledTo = clGray
            Thumb.ColorMirror = clGray
            Thumb.ColorMirrorTo = clGray
            Thumb.ColorMirrorHot = clGray
            Thumb.ColorMirrorHotTo = clGray
            Thumb.ColorMirrorDown = clGray
            Thumb.ColorMirrorDownTo = clGray
            Thumb.ColorMirrorDisabled = clGray
            Thumb.ColorMirrorDisabledTo = clGray
            Thumb.Gradient = ggVertical
            Thumb.GradientMirror = ggVertical
            Thumb.Picture.Data = {
              89504E470D0A1A0A0000000D494844520000000500000014080600000045E5F7
              DB0000000473424954080808087C086488000000097048597300000EC300000E
              C301C76FA86400000016744558744372656174696F6E2054696D650030312F30
              382F3133FD0CA4C00000001C74455874536F6674776172650041646F62652046
              697265776F726B7320435336E8BCB28C0000002849444154189563FCFFFF7F14
              0303432403022C67FCFFFFFF660634C0842E302A481BC1E56862CB01EB67097C
              9333D0630000000049454E44AE426082}
            Thumb.Size = 20
            Thumb.Width = 5
            Thumb.Shape = tsRectangle
            TickMark.Color = clBlack
            TickMark.ColorDisabled = clBlack
            TickMark.Font.Charset = DEFAULT_CHARSET
            TickMark.Font.Color = clWindowText
            TickMark.Font.Height = -11
            TickMark.Font.Name = 'Tahoma'
            TickMark.Font.Style = []
            TickMark.Style = tsNone
            TrackHint = False
            TrackLabel.Font.Charset = DEFAULT_CHARSET
            TrackLabel.Font.Color = clWindowText
            TrackLabel.Font.Height = -11
            TrackLabel.Font.Name = 'Tahoma'
            TrackLabel.Font.Style = []
            TrackLabel.Format = 'Pos: %d'
            Version = '1.6.7.0'
            OnChange = tbVolumeChange
          end
          object tbVelocidade: TcxTrackBar
            Left = 0
            Top = 31
            Align = alTop
            Position = 1
            Properties.Max = 2
            Properties.OnChange = tbVelocidadePropertiesChange
            TabOrder = 1
            Transparent = True
            Height = 41
            Width = 81
          end
        end
      end
    end
    object pnConfig: TPanel
      Left = 1
      Top = 166
      Width = 450
      Height = 47
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 5
      object rgConfig: TcxRadioGroup
        Left = 0
        Top = 0
        Align = alClient
        Caption = 'Configura'#231#245'es'
        ParentBackground = False
        ParentColor = False
        Properties.Items = <
          item
            Caption = 'Executar play ao manter pressionado o pedal'
          end
          item
            Caption = 'Executar play ao pressionar e soltar o pedal'
          end>
        ItemIndex = 1
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsFlat
        Style.Color = clBlack
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = True
        Style.Shadow = False
        Style.TextColor = clWhite
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Height = 47
        Width = 450
      end
    end
  end
  object dockPlayList: TdxDockSite
    Left = 0
    Top = 214
    Width = 452
    Height = 28
    Align = alTop
    AutoSize = True
    DockingType = 5
    OriginalWidth = 450
    OriginalHeight = 85
    object dxLayoutDockSite1: TdxLayoutDockSite
      Left = 0
      Top = 0
      Width = 452
      Height = 0
      Visible = False
      DockingType = 0
      OriginalWidth = 300
      OriginalHeight = 140
    end
    object dxDockPanel1: TdxDockPanel
      Left = 0
      Top = -140
      Width = 0
      Height = 140
      Visible = False
      AllowFloating = True
      AutoHide = True
      Caption = 'Faixas Gravadas'
      CaptionButtons = [cbHide]
      CustomCaptionButtons.Buttons = <>
      ShowCaption = False
      TabsProperties.CustomButtons.Buttons = <>
      AutoHidePosition = 1
      DockingType = 0
      OriginalWidth = 185
      OriginalHeight = 140
      object cxGridPlayList: TcxGrid
        Left = 0
        Top = 0
        Width = 0
        Height = 136
        Align = alClient
        TabOrder = 0
        object cxGridPlayListDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Visible = True
          Navigator.Buttons.PriorPage.Visible = True
          Navigator.Buttons.Prior.Visible = True
          Navigator.Buttons.Next.Visible = True
          Navigator.Buttons.NextPage.Visible = True
          Navigator.Buttons.Last.Visible = True
          Navigator.Buttons.Insert.Visible = True
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Delete.Visible = True
          Navigator.Buttons.Edit.Visible = True
          Navigator.Buttons.Post.Visible = True
          Navigator.Buttons.Cancel.Visible = True
          Navigator.Buttons.Refresh.Visible = True
          Navigator.Buttons.SaveBookmark.Visible = True
          Navigator.Buttons.GotoBookmark.Visible = True
          Navigator.Buttons.Filter.Visible = True
          OnCellDblClick = cxGridPlayListDBTableView1CellDblClick
          DataController.DataSource = dsPlayList
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnGrouping = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.GroupByBox = False
          object cxGridPlayListDBTableView1FAIXA: TcxGridDBColumn
            DataBinding.FieldName = 'FAIXA'
            Visible = False
            VisibleForCustomization = False
          end
          object cxGridPlayListDBTableView1Nome: TcxGridDBColumn
            DataBinding.FieldName = 'Nome'
            Options.Editing = False
            Options.SortByDisplayText = isbtOn
            Width = 440
          end
        end
        object cxGridPlayListLevel1: TcxGridLevel
          GridView = cxGridPlayListDBTableView1
        end
      end
    end
  end
  object smAudio: TSmAudio
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    OnEOS = smAudioEOS
    OnSoundLength = smAudioSoundLength
    OnSoundPosition = smAudioSoundPosition
    OnState = smAudioState
    Left = 391
    Top = 196
  end
  object SpeechMikeControl: TSpeechMikeControl
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    OnSPMEventButton = SpeechMikeControlSPMEventButton
    Left = 387
    Top = 252
  end
  object ActionList1: TActionList
    Images = cxImageList1
    Left = 184
    Top = 204
    object Ac_Gravar: TAction
      ImageIndex = 4
      OnExecute = Ac_GravarExecute
    end
    object Ac_Voltar: TAction
      ImageIndex = 11
      OnExecute = Ac_VoltarExecute
    end
    object Ac_Avancar: TAction
      ImageIndex = 10
      OnExecute = Ac_AvancarExecute
    end
    object Ac_Parar: TAction
      ImageIndex = 5
      OnExecute = Ac_PararExecute
    end
    object Ac_Final: TAction
      ImageIndex = 6
      OnExecute = Ac_FinalExecute
    end
    object Ac_Inicio: TAction
      ImageIndex = 8
      OnExecute = Ac_InicioExecute
    end
    object Ac_PlayPause: TAction
      ImageIndex = 3
      OnExecute = Ac_PlayPauseExecute
    end
    object Ac_Sair: TAction
      Caption = 'Sair'
      ImageIndex = 7
      OnExecute = Ac_SairExecute
    end
    object Ac_Salvar: TAction
      ImageIndex = 9
      OnExecute = Ac_SalvarExecute
    end
  end
  object dxSkinController1: TdxSkinController
    SkinName = 'pmSilverSkin'
    OnSkinForm = dxSkinController1SkinForm
    Left = 393
    Top = 150
  end
  object cdsLocalPlayList: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 258
    Top = 150
    object cdsLocalPlayListFAIXA: TIntegerField
      FieldName = 'FAIXA'
      ProviderFlags = []
    end
    object cdsLocalPlayListNOME: TStringField
      FieldName = 'Nome'
      ProviderFlags = []
      Size = 100
    end
  end
  object dsPlayList: TDataSource
    DataSet = cdsLocalPlayList
    Left = 317
    Top = 151
  end
  object cxImageList1: TcxImageList
    Height = 20
    Width = 20
    FormatVersion = 1
    DesignInfo = 12255305
    ImageInfo = <
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000006464
          64A0828282D00000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000343434503E3E
          3E60000000000000000000000000686868A0A5A5A5FF5D5D5D90000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000006B6B6BA0ABABABFF5656568000000000818181C0767676B00B0B
          0B10969696E0ABABABFF15151520000000000000000000000000000000000000
          00000000000000000000000000000B0B0B10858585C0B1B1B1FFB1B1B1FF5959
          5980000000007A7A7AB0B1B1B1FF4343436043434360B1B1B1FF595959800000
          000000000000000000000000000000000000515151705C5C5C805C5C5C80A2A2
          A2E0B8B8B8FFB8B8B8FFB8B8B8FF5C5C5C800000000017171720B8B8B8FFA2A2
          A2E000000000ADADADF0969696D0000000000000000000000000000000000000
          0000BEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFF5F5F
          5F800000000000000000777777A0BEBEBEFF18181820838383B0BEBEBEFF0000
          000000000000000000000000000000000000C4C4C4FFC4C4C4FFC4C4C4FFC4C4
          C4FFC4C4C4FFC4C4C4FFC4C4C4FF62626280000000000000000056565670C4C4
          C4FF3131314062626280C4C4C4FF000000000000000000000000000000000000
          0000CACACAFFCACACAFFCACACAFFCACACAFFCACACAFFCACACAFFCACACAFF6565
          6580000000000000000059595970CACACAFF3333334065656580CACACAFF0000
          000000000000000000000000000000000000D0D0D0FFD0D0D0FFD0D0D0FFD0D0
          D0FFD0D0D0FFD0D0D0FFD0D0D0FF686868800000000000000000838383A0D0D0
          D0FF1A1A1A20838383A0D0D0D0FF000000000000000000000000000000000000
          00006B6B6B806B6B6B80868686A0D6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FF6B6B
          6B80000000000D0D0D10C9C9C9F0BCBCBCE000000000C9C9C9F0AFAFAFD00000
          0000000000000000000000000000000000000000000000000000000000002929
          2930B3B3B3D0DCDCDCFFDCDCDCFF6E6E6E80000000008A8A8AA0DCDCDCFF5353
          536045454550DCDCDCFF6E6E6E80000000000000000000000000000000000000
          0000000000000000000000000000000000000E0E0E109C9C9CB0E2E2E2FF7171
          7180000000008E8E8EA09C9C9CB000000000B8B8B8D0E2E2E2FF1C1C1C200000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000929292A0747474800000000000000000000000009292
          92A0E8E8E8FF8383839000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000959595A0C2C2C2D000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000D1212
          1258070707200000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000223C3C3CA9878787FD1919194300000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000060606495A5A5ACA9D9D9DFF9F9F
          9FFD1515153D0000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000B0000002B00000027000000292121
          217A808080EAA9A9A9FFA3A3A3FF999999F81616163900000000101010540E0E
          0E5000000000000000000A0A0A42151515600000000000000000000000003131
          3175797979E9757575E3777777E5A2A2A2FFB3B3B3FFAAAAAAFFAAAAAAFF9F9F
          9FF60B0B0B241F1F1F41949494FE8A8A8AF4101010510404043E7C7C7CE19797
          97FF2D2D2D630000000000000000626262A2B8B8B8FFB6B6B6FFB5B5B5FFB4B4
          B4FFB0B0B0FFB0B0B0FFB0B0B0FFA5A5A5F7080808262E2E2E3EB7B7B7F1BFBF
          BFFF848484E6767676DEBABABAFFBFBFBFF84040405900000000000000006161
          619BBBBBBBFFB9B9B9FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB9B9B9FFADAD
          ADF91818183E00000000232323319A9A9AE0BDBDBDFFBDBDBDFFA4A4A4EE3030
          30490000000000000000000000006868689FC3C3C3FFC0C0C0FFBFBFBFFFC0C0
          C0FFC0C0C0FFC0C0C0FFC1C1C1FFB5B5B5F81818183700000000131313569595
          95E2C5C5C5FFC5C5C5FFA6A6A6F21919196A0000000600000000000000007272
          729AD0D0D0FFCECECEFFCDCDCDFFCACACAFFC9C9C9FFC9C9C9FFCACACAFFBDBD
          BDF60B0B0B222C2C2C4EB4B4B4FFCECECEFFABABABD4A2A2A2C9D1D1D1FFBABA
          BAFF3F3F3F7100000000000000002828282F73737386686868796C6C6C7EB6B6
          B6D8D3D3D3FFD0D0D0FFD1D1D1FFC4C4C4F80B0B0B2B2828282FC0C0C0DFB9B9
          B9DC1A1A1A200C0C0C10A5A5A5C7CECECEEF3E3E3E4900000000000000000000
          00000000000000000000000000001616161B909090A9DADADAFFD7D7D7FFC8C8
          C8F81B1B1B3D00000000202020241B1B1B1F0000000000000000121212152929
          292F000000000000000000000000000000000000000000000000000000000000
          0000000000026A6A6A7ADFDFDFFDD5D5D5FF1A1A1A3E00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000004F4F4F59B4B4
          B4CE1F1F1F320000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000001818181B0707070700000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000009090
          90F0999999FF909090F000000000000000000000000000000000909090F09999
          99FF909090F00000000000000000000000000000000000000000000000000000
          00000000000000000000000000009F9F9FFF9F9F9FFF9F9F9FFF000000000000
          000000000000000000009F9F9FFF9F9F9FFF9F9F9FFF00000000000000000000
          000000000000000000000000000000000000000000000000000000000000A5A5
          A5FFA5A5A5FFA5A5A5FF00000000000000000000000000000000A5A5A5FFA5A5
          A5FFA5A5A5FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000ABABABFFABABABFFABABABFF000000000000
          00000000000000000000ABABABFFABABABFFABABABFF00000000000000000000
          000000000000000000000000000000000000000000000000000000000000B1B1
          B1FFB1B1B1FFB1B1B1FF00000000000000000000000000000000B1B1B1FFB1B1
          B1FFB1B1B1FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000B8B8B8FFB8B8B8FFB8B8B8FF000000000000
          00000000000000000000B8B8B8FFB8B8B8FFB8B8B8FF00000000000000000000
          000000000000000000000000000000000000000000000000000000000000BEBE
          BEFFBEBEBEFFBEBEBEFF00000000000000000000000000000000BEBEBEFFBEBE
          BEFFBEBEBEFF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000C4C4C4FFC4C4C4FFC4C4C4FF000000000000
          00000000000000000000C4C4C4FFC4C4C4FFC4C4C4FF00000000000000000000
          000000000000000000000000000000000000000000000000000000000000CACA
          CAFFCACACAFFCACACAFF00000000000000000000000000000000CACACAFFCACA
          CAFFCACACAFF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000D0D0D0FFD0D0D0FFD0D0D0FF000000000000
          00000000000000000000D0D0D0FFD0D0D0FFD0D0D0FF00000000000000000000
          000000000000000000000000000000000000000000000000000000000000D6D6
          D6FFD6D6D6FFD6D6D6FF00000000000000000000000000000000D6D6D6FFD6D6
          D6FFD6D6D6FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000DCDCDCFFDCDCDCFFDCDCDCFF000000000000
          00000000000000000000DCDCDCFFDCDCDCFFDCDCDCFF00000000000000000000
          000000000000000000000000000000000000000000000000000000000000E2E2
          E2FFE2E2E2FFE2E2E2FF00000000000000000000000000000000E2E2E2FFE2E2
          E2FFE2E2E2FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000E8E8E8FFE8E8E8FFE8E8E8FF000000000000
          00000000000000000000E8E8E8FFE8E8E8FFE8E8E8FF00000000000000000000
          000000000000000000000000000000000000000000000000000000000000E0E0
          E0F0EEEEEEFFE0E0E0F000000000000000000000000000000000E0E0E0F0EEEE
          EEFFE0E0E0F00000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000828282D01E1E
          1E30000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000A5A5A5FFA5A5A5FF5353538000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000AAAAAAFFAAAA
          AAFFAAAAAAFF8B8B8BD020202030000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000B0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FF5858
          5880000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000B6B6B6FFB6B6
          B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FF949494D022222230000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000BBBBBBFFBBBBBBFFBBBBBBFFBBBBBBFFBBBBBBFFBBBB
          BBFFBBBBBBFFBBBBBBFF5E5E5E80000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000C1C1C1FFC1C1
          C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FF9D9D
          9DD0242424300000000000000000000000000000000000000000000000000000
          00000000000000000000C7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7
          C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FF19191920000000000000
          0000000000000000000000000000000000000000000000000000CCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFA6A6
          A6D0262626300000000000000000000000000000000000000000000000000000
          00000000000000000000D2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2
          D2FFD2D2D2FFD2D2D2FF69696980000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000D8D8D8FFD8D8
          D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFB0B0B0D029292930000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000DDDDDDFFDDDDDDFFDDDDDDFFDDDDDDFFDDDDDDFF6F6F
          6F80000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000E3E3E3FFE3E3
          E3FFE3E3E3FFB9B9B9D02B2B2B30000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000E9E9E9FFE9E9E9FF7575758000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000C2C2C2D02D2D
          2D30000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000505
          10102B2B80804B4BE0E05555FFFF5555FFFF5555FFFF4B4BE0E02B2B80800505
          1010000000000000000000000000000000000000000000000000000000000000
          000000000000000000001D1D50505858F0F05D5DFFFF5D5DFFFF5D5DFFFF5D5D
          FFFF5D5DFFFF5D5DFFFF5D5DFFFF5858F0F01D1D505000000000000000000000
          000000000000000000000000000000000000000000001F1F50506464FFFF6464
          FFFF6464FFFF6464FFFF6464FFFF6464FFFF6464FFFF6464FFFF6464FFFF6464
          FFFF6464FFFF1F1F505000000000000000000000000000000000000000000000
          0000070710106565F0F06B6BFFFF6B6BFFFF6B6BFFFF6B6BFFFF6B6BFFFF6B6B
          FFFF6B6BFFFF6B6BFFFF6B6BFFFF6B6BFFFF6B6BFFFF6565F0F0070710100000
          0000000000000000000000000000000000003A3A80807373FFFF7373FFFF7373
          FFFF7373FFFF7373FFFF7373FFFF7373FFFF7373FFFF7373FFFF7373FFFF7373
          FFFF7373FFFF7373FFFF3A3A8080000000000000000000000000000000000000
          00006C6CE0E07B7BFFFF7B7BFFFF7B7BFFFF7B7BFFFF7B7BFFFF7B7BFFFF7B7B
          FFFF7B7BFFFF7B7BFFFF7B7BFFFF7B7BFFFF7B7BFFFF7B7BFFFF6C6CE0E00000
          0000000000000000000000000000000000008282FFFF8282FFFF8282FFFF8282
          FFFF8282FFFF8282FFFF8282FFFF8282FFFF8282FFFF8282FFFF8282FFFF8282
          FFFF8282FFFF8282FFFF8282FFFF000000000000000000000000000000000000
          00008A8AFFFF8A8AFFFF8A8AFFFF8A8AFFFF8A8AFFFF8A8AFFFF8A8AFFFF8A8A
          FFFF8A8AFFFF8A8AFFFF8A8AFFFF8A8AFFFF8A8AFFFF8A8AFFFF8A8AFFFF0000
          0000000000000000000000000000000000009191FFFF9191FFFF9191FFFF9191
          FFFF9191FFFF9191FFFF9191FFFF9191FFFF9191FFFF9191FFFF9191FFFF9191
          FFFF9191FFFF9191FFFF9191FFFF000000000000000000000000000000000000
          00008686E0E09999FFFF9999FFFF9999FFFF9999FFFF9999FFFF9999FFFF9999
          FFFF9999FFFF9999FFFF9999FFFF9999FFFF9999FFFF9999FFFF8686E0E00000
          00000000000000000000000000000000000051518080A1A1FFFFA1A1FFFFA1A1
          FFFFA1A1FFFFA1A1FFFFA1A1FFFFA1A1FFFFA1A1FFFFA1A1FFFFA1A1FFFFA1A1
          FFFFA1A1FFFFA1A1FFFF51518080000000000000000000000000000000000000
          00000B0B10109E9EF0F0A8A8FFFFA8A8FFFFA8A8FFFFA8A8FFFFA8A8FFFFA8A8
          FFFFA8A8FFFFA8A8FFFFA8A8FFFFA8A8FFFFA8A8FFFF9E9EF0F00B0B10100000
          0000000000000000000000000000000000000000000037375050B0B0FFFFB0B0
          FFFFB0B0FFFFB0B0FFFFB0B0FFFFB0B0FFFFB0B0FFFFB0B0FFFFB0B0FFFFB0B0
          FFFFB0B0FFFF3737505000000000000000000000000000000000000000000000
          000000000000000000003A3A5050ADADF0F0B8B8FFFFB8B8FFFFB8B8FFFFB8B8
          FFFFB8B8FFFFB8B8FFFFB8B8FFFFADADF0F03A3A505000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000C0C
          101060608080A8A8E0E0BFBFFFFFBFBFFFFFBFBFFFFFA8A8E0E0606080800C0C
          1010000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000A0A0A10737373C0999999FF9999
          99FF999999FF999999FF999999FF999999FF999999FF999999FF999999FF9999
          99FF999999FF737373C00A0A0A10000000000000000000000000000000000000
          0000737373C0999999FF999999FF999999FF999999FF999999FF999999FF9999
          99FF999999FF999999FF999999FF999999FF999999FF999999FF737373C00000
          000000000000000000000000000000000000A0A0A0FFA0A0A0FFA0A0A0FFA0A0
          A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0A0FFA0A0
          A0FFA0A0A0FFA0A0A0FFA0A0A0FF000000000000000000000000000000000000
          0000A6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6
          A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FF0000
          000000000000000000000000000000000000ADADADFFADADADFFADADADFFADAD
          ADFFADADADFFADADADFFADADADFFADADADFFADADADFFADADADFFADADADFFADAD
          ADFFADADADFFADADADFFADADADFF000000000000000000000000000000000000
          0000B3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3
          B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FFB3B3B3FF0000
          000000000000000000000000000000000000BABABAFFBABABAFFBABABAFFBABA
          BAFFBABABAFFBABABAFFBABABAFFBABABAFFBABABAFFBABABAFFBABABAFFBABA
          BAFFBABABAFFBABABAFFBABABAFF000000000000000000000000000000000000
          0000C0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0
          C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FFC0C0C0FF0000
          000000000000000000000000000000000000C7C7C7FFC7C7C7FFC7C7C7FFC7C7
          C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7
          C7FFC7C7C7FFC7C7C7FFC7C7C7FF000000000000000000000000000000000000
          0000CDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
          CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF0000
          000000000000000000000000000000000000D4D4D4FFD4D4D4FFD4D4D4FFD4D4
          D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4D4FFD4D4
          D4FFD4D4D4FFD4D4D4FFD4D4D4FF000000000000000000000000000000000000
          0000DBDBDBFFDBDBDBFFDBDBDBFFDBDBDBFFDBDBDBFFDBDBDBFFDBDBDBFFDBDB
          DBFFDBDBDBFFDBDBDBFFDBDBDBFFDBDBDBFFDBDBDBFFDBDBDBFFDBDBDBFF0000
          000000000000000000000000000000000000E1E1E1FFE1E1E1FFE1E1E1FFE1E1
          E1FFE1E1E1FFE1E1E1FFE1E1E1FFE1E1E1FFE1E1E1FFE1E1E1FFE1E1E1FFE1E1
          E1FFE1E1E1FFE1E1E1FFE1E1E1FF000000000000000000000000000000000000
          0000AFAFAFC0E8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8
          E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFE8E8E8FFAFAFAFC00000
          0000000000000000000000000000000000000F0F0F10B3B3B3C0EEEEEEFFEEEE
          EEFFEEEEEEFFEEEEEEFFEEEEEEFFEEEEEEFFEEEEEEFFEEEEEEFFEEEEEEFFEEEE
          EEFFEEEEEEFFB3B3B3C00F0F0F10000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000828282D01E1E1E300000000000000000000000000000
          00000000000000000000828282D01E1E1E300000000000000000000000000000
          0000000000000000000000000000909090F0999999FF909090F0A5A5A5FFA5A5
          A5FF535353800000000000000000000000000000000000000000A5A5A5FFA5A5
          A5FF535353800000000000000000000000000000000000000000000000009F9F
          9FFF9F9F9FFF9F9F9FFFAAAAAAFFAAAAAAFFAAAAAAFF8B8B8BD0202020300000
          00000000000000000000AAAAAAFFAAAAAAFFAAAAAAFF8B8B8BD0202020300000
          0000000000000000000000000000A5A5A5FFA5A5A5FFA5A5A5FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FF585858800000000000000000B0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FF58585880000000000000000000000000ABAB
          ABFFABABABFFABABABFFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6
          B6FF949494D022222230B6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6
          B6FF949494D02222223000000000B1B1B1FFB1B1B1FFB1B1B1FFBBBBBBFFBBBB
          BBFFBBBBBBFFBBBBBBFFBBBBBBFFBBBBBBFFBBBBBBFFBBBBBBFFBBBBBBFFBBBB
          BBFFBBBBBBFFBBBBBBFFBBBBBBFFBBBBBBFFBBBBBBFFBBBBBBFF5E5E5E80B8B8
          B8FFB8B8B8FFB8B8B8FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1
          C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1
          C1FFC1C1C1FFC1C1C1FFC1C1C1FFBEBEBEFFBEBEBEFFBEBEBEFFC7C7C7FFC7C7
          C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7
          C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC4C4
          C4FFC4C4C4FFC4C4C4FFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCACACAFFCACACAFFCACACAFFD2D2D2FFD2D2
          D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2
          D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FF69696980D0D0
          D0FFD0D0D0FFD0D0D0FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8
          D8FFB0B0B0D029292930D8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8
          D8FFB0B0B0D02929293000000000D6D6D6FFD6D6D6FFD6D6D6FFDDDDDDFFDDDD
          DDFFDDDDDDFFDDDDDDFFDDDDDDFF6F6F6F800000000000000000DDDDDDFFDDDD
          DDFFDDDDDDFFDDDDDDFFDDDDDDFF6F6F6F80000000000000000000000000DCDC
          DCFFDCDCDCFFDCDCDCFFE3E3E3FFE3E3E3FFE3E3E3FFB9B9B9D02B2B2B300000
          00000000000000000000E3E3E3FFE3E3E3FFE3E3E3FFB9B9B9D02B2B2B300000
          0000000000000000000000000000E2E2E2FFE2E2E2FFE2E2E2FFE9E9E9FFE9E9
          E9FF757575800000000000000000000000000000000000000000E9E9E9FFE9E9
          E9FF75757580000000000000000000000000000000000000000000000000E8E8
          E8FFE8E8E8FFE8E8E8FFC2C2C2D02D2D2D300000000000000000000000000000
          00000000000000000000C2C2C2D02D2D2D300000000000000000000000000000
          0000000000000000000000000000E0E0E0F0EEEEEEFFE0E0E0F0000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000101010102020202000000000000000000000
          0000000000002020202010101010000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000010101010D0D0
          D0D0F0F0F0F030303030000000000000000030303030F0F0F0F0D0D0D0D01010
          1010000000000000000000000000000000000000000000000000000000000000
          0000000000000000000020202020F0F0F0F0FFFFFFFFF0F0F0F0303030303030
          3030F0F0F0F0FFFFFFFFF0F0F0F0202020200000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003030
          3030F0F0F0F0FFFFFFFFF0F0F0F0F0F0F0F0FFFFFFFFF0F0F0F0303030300000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000030303030F0F0F0F0FFFFFFFFFFFF
          FFFFF0F0F0F03030303000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000030303030F0F0F0F0FFFFFFFFFFFFFFFFF0F0F0F030303030000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000030303030F0F0F0F0FFFFFFFFF0F0F0F0F0F0
          F0F0FFFFFFFFF0F0F0F030303030000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000020202020F0F0
          F0F0FFFFFFFFF0F0F0F03030303030303030F0F0F0F0FFFFFFFFF0F0F0F02020
          2020000000000000000000000000000000000000000000000000000000000000
          0000000000000000000010101010D0D0D0D0F0F0F0F030303030000000000000
          000030303030F0F0F0F0D0D0D0D0101010100000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000001010
          1010202020200000000000000000000000000000000020202020101010100000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000919191F2999999FF909090F000000000000000000000
          0000000000000000000000000000010101011F1F1F32828282D1000000000000
          0000000000000000000000000000010101011F1F1F32828282D19F9F9FFF9F9F
          9FFF9E9E9EFE0000000000000000000000000000000000000000010101015454
          5482A5A5A5FFA4A4A4FE00000000000000000000000000000000010101015454
          5482A5A5A5FFA5A5A5FFA5A5A5FFA5A5A5FFA4A4A4FE00000000000000000000
          000001010101212121328C8C8CD2AAAAAAFFAAAAAAFFA9A9A9FE000000000000
          000001010101212121328C8C8CD2AAAAAAFFAAAAAAFFAAAAAAFFABABABFFABAB
          ABFFAAAAAAFE0000000000000000010101015A5A5A82B0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFAFAFAFFE00000000010101015A5A5A82B0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB1B1B1FFB1B1B1FFB0B0B0FE00000000242424329696
          96D2B6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB5B5B5FE232323319696
          96D2B6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FFB8B8B8FFB8B8
          B8FFB8B8B8FF5F5F5F81BBBBBBFFBBBBBBFFBBBBBBFFBBBBBBFFBBBBBBFFBBBB
          BBFFBBBBBBFFBBBBBBFFBBBBBBFFBBBBBBFFBBBBBBFFBBBBBBFFBBBBBBFFBBBB
          BBFFBBBBBBFFBBBBBBFFBEBEBEFFBEBEBEFFBEBEBEFFC1C1C1FFC1C1C1FFC1C1
          C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1
          C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC4C4C4FFC4C4
          C4FFC4C4C4FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7
          C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7
          C7FFC7C7C7FFC7C7C7FFCACACAFFCACACAFFCACACAFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFD0D0D0FFD0D0
          D0FFCFCFCFFE6969697FD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2
          D2FFD2D2D2FFD2D2D2FFD1D1D1FED2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2
          D2FFD2D2D2FFD2D2D2FFD6D6D6FFD6D6D6FFD5D5D5FE0000000029292930B0B0
          B0D0D8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFD7D7D7FE2828282FB0B0
          B0D0D8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFDCDCDCFFDCDC
          DCFFDBDBDBFE0000000000000000000000006F6F6F80DDDDDDFFDDDDDDFFDDDD
          DDFFDDDDDDFFDCDCDCFE00000000000000006F6F6F80DDDDDDFFDDDDDDFFDDDD
          DDFFDDDDDDFFDDDDDDFFE2E2E2FFE2E2E2FFE1E1E1FE00000000000000000000
          0000000000002B2B2B30B9B9B9D0E3E3E3FFE3E3E3FFE2E2E2FE000000000000
          0000000000002B2B2B30B9B9B9D0E3E3E3FFE3E3E3FFE3E3E3FFE8E8E8FFE8E8
          E8FFE7E7E7FE0000000000000000000000000000000000000000000000007575
          7580E9E9E9FFE8E8E8FE00000000000000000000000000000000000000007575
          7580E9E9E9FFE9E9E9FFE1E1E1F1EEEEEEFFDFDFDFEF00000000000000000000
          0000000000000000000000000000000000002E2E2E31C2C2C2D0000000000000
          0000000000000000000000000000000000002E2E2E31C2C2C2D0000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000004A4A4A5CBEBEBEEDAAAAAAD59595
          95BA959595BA969696BB969696BB969696BB969696BB969696BB959595BA9494
          94B9A7A7A7D1BEBEBEEE4A4A4A5C000000000000000000000000000000000000
          0000C3C3C3F4AFAFAFDB1717171D000000000000000000000000000000000000
          00000000000000000000000000000000000014141419AFAFAFDBC3C3C3F40000
          000000000000000000000000000000000000CCCCCCFFA0A0A0C8070707090000
          0000000000000000000000000000000000000000000000000000000000000000
          00000808080AA0A0A0C8CCCCCCFF000000000000000000000000000000000000
          0000CCCCCCFFA5A5A5CE0C0C0C0F000000000000000000000000000000000000
          0000000000000000000000000000000000000C0C0C0FA5A5A5CECCCCCCFF0000
          000000000000000000000000000000000000CCCCCCFFA5A5A5CE0C0C0C0F0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000C0C0C0FA5A5A5CECCCCCCFF000000000000000000000000000000000000
          0000CCCCCCFFA2A2A2CB0A0A0A0C000000000000000000000000000000000000
          0000000000000000000000000000000000000A0A0A0CA2A2A2CBCCCCCCFF0000
          000000000000000000000000000000000000CCCCCCFFA6A6A6CF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000A6A6A6CFCCCCCCFF000000000000000000000000000000000000
          0000CCCCCCFFC6C6C6F87A7A7A996262627A6666667F66666680666666806666
          668066666680666666806666667F6262627A7A7A7A99C6C6C6F8CCCCCCFF0000
          000000000000000000000000000000000000CCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFF000000000000000000000000000000000000
          0000CCCCCCFFCCCCCCFFCACACAFC525252672525252E29292933292929332828
          28323A3A3A485858586E3A3A3A489D9D9DC4CCCCCCFFCCCCCCFFCCCCCCFF0000
          000000000000000000000000000000000000CCCCCCFFCCCCCCFFC1C1C1F10505
          0506000000000000000000000000000000004E4E4E61CCCCCCFF353535426464
          647DCCCCCCFFCCCCCCFFCCCCCCFF000000000000000000000000000000000000
          0000CCCCCCFFCCCCCCFFC2C2C2F20E0E0E120000000000000000000000000000
          00005555556ACCCCCCFF3B3B3B4A69696983CCCCCCFFCCCCCCFFCCCCCCFF0000
          000000000000000000000000000000000000CCCCCCFFCCCCCCFFC1C1C1F10A0A
          0A0C000000000000000000000000000000005D5D5D74CCCCCCFF434343546262
          627ACCCCCCFFCBCBCBFE6F6F6F8B000000000000000000000000000000000000
          0000BEBEBEEDCCCCCCFFC6C6C6F82222222A0000000000000000000000000000
          00003131313D7575759227272731828282A2CCCCCCFF5858586E000000000000
          00000000000000000000000000000000000046464658BDBDBDECCCCCCCFFADAD
          ADD8959595BA969696BB969696BB969696BC8B8B8BAE7E7E7E9D929292B6C9C9
          C9FB7272728F0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000828282D01E1E
          1E30000000000000000000000000000000000000000000000000000000009090
          90F0999999FF909090F000000000000000000000000000000000000000000000
          00000000000000000000A5A5A5FFA5A5A5FF5353538000000000000000000000
          00000000000000000000000000009F9F9FFF9F9F9FFF9F9F9FFF000000000000
          0000000000000000000000000000000000000000000000000000AAAAAAFFAAAA
          AAFFAAAAAAFF8B8B8BD02020203000000000000000000000000000000000A5A5
          A5FFA5A5A5FFA5A5A5FF00000000000000000000000000000000000000000000
          00000000000000000000B0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FF5858
          5880000000000000000000000000ABABABFFABABABFFABABABFF000000000000
          0000000000000000000000000000000000000000000000000000B6B6B6FFB6B6
          B6FFB6B6B6FFB6B6B6FFB6B6B6FFB6B6B6FF949494D02222223000000000B1B1
          B1FFB1B1B1FFB1B1B1FF00000000000000000000000000000000000000000000
          00000000000000000000BBBBBBFFBBBBBBFFBBBBBBFFBBBBBBFFBBBBBBFFBBBB
          BBFFBBBBBBFFBBBBBBFF5E5E5E80B8B8B8FFB8B8B8FFB8B8B8FF000000000000
          0000000000000000000000000000000000000000000000000000C1C1C1FFC1C1
          C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFBEBE
          BEFFBEBEBEFFBEBEBEFF00000000000000000000000000000000000000000000
          00000000000000000000C7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7
          C7FFC7C7C7FFC7C7C7FFC7C7C7FFC4C4C4FFC4C4C4FFC4C4C4FF000000000000
          0000000000000000000000000000000000000000000000000000CCCCCCFFCCCC
          CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCACA
          CAFFCACACAFFCACACAFF00000000000000000000000000000000000000000000
          00000000000000000000D2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2
          D2FFD2D2D2FFD2D2D2FF69696980D0D0D0FFD0D0D0FFD0D0D0FF000000000000
          0000000000000000000000000000000000000000000000000000D8D8D8FFD8D8
          D8FFD8D8D8FFD8D8D8FFD8D8D8FFD8D8D8FFAFAFAFD02929293000000000D6D6
          D6FFD6D6D6FFD6D6D6FF00000000000000000000000000000000000000000000
          00000000000000000000DDDDDDFFDDDDDDFFDDDDDDFFDDDDDDFFDDDDDDFF6F6F
          6F80000000000000000000000000DCDCDCFFDCDCDCFFDCDCDCFF000000000000
          0000000000000000000000000000000000000000000000000000E3E3E3FFE3E3
          E3FFE3E3E3FFB8B8B8D02B2B2B3000000000000000000000000000000000E2E2
          E2FFE2E2E2FFE2E2E2FF00000000000000000000000000000000000000000000
          00000000000000000000E9E9E9FFE9E9E9FF7575758000000000000000000000
          0000000000000000000000000000E8E8E8FFE8E8E8FFE8E8E8FF000000000000
          0000000000000000000000000000000000000000000000000000C1C1C1D02D2D
          2D3000000000000000000000000000000000000000000000000000000000E0E0
          E0F0EEEEEEFFE0E0E0F000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000008F8F8FF29999
          99FF909090F00000000000000000000000000000000000000000000000000101
          01011F1F1F320000000000000000000000000000000000000000000000000000
          000000000000000000009F9F9FFF9F9F9FFF9C9C9CFE00000000000000000000
          000000000000000000000101010154545482A5A5A5FF00000000000000000000
          0000000000000000000000000000000000000000000000000000A5A5A5FFA5A5
          A5FFA2A2A2FE00000000000000000000000001010101212121328A8A8AD2AAAA
          AAFFAAAAAAFF0000000000000000000000000000000000000000000000000000
          00000000000000000000ABABABFFABABABFFA8A8A8FE00000000000000000101
          01015A5A5A82B0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FF00000000000000000000
          0000000000000000000000000000000000000000000000000000B1B1B1FFB1B1
          B1FFAEAEAEFE0000000024242432969696D2B6B6B6FFB6B6B6FFB6B6B6FFB6B6
          B6FFB6B6B6FF0000000000000000000000000000000000000000000000000000
          00000000000000000000B8B8B8FFB8B8B8FFB8B8B8FF5F5F5F81BBBBBBFFBBBB
          BBFFBBBBBBFFBBBBBBFFBBBBBBFFBBBBBBFFBBBBBBFF00000000000000000000
          0000000000000000000000000000000000000000000000000000BEBEBEFFBEBE
          BEFFBEBEBEFFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1C1FFC1C1
          C1FFC1C1C1FF0000000000000000000000000000000000000000000000000000
          00000000000000000000C4C4C4FFC4C4C4FFC4C4C4FFC7C7C7FFC7C7C7FFC7C7
          C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FF00000000000000000000
          0000000000000000000000000000000000000000000000000000CACACAFFCACA
          CAFFCACACAFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
          CCFFCCCCCCFF0000000000000000000000000000000000000000000000000000
          00000000000000000000D0D0D0FFD0D0D0FFCDCDCDFE6969697FD2D2D2FFD2D2
          D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FF00000000000000000000
          0000000000000000000000000000000000000000000000000000D6D6D6FFD6D6
          D6FFD3D3D3FE0000000029292930AFAFAFD0D8D8D8FFD8D8D8FFD8D8D8FFD8D8
          D8FFD8D8D8FF0000000000000000000000000000000000000000000000000000
          00000000000000000000DCDCDCFFDCDCDCFFD9D9D9FE00000000000000000000
          00006F6F6F80DDDDDDFFDDDDDDFFDDDDDDFFDDDDDDFF00000000000000000000
          0000000000000000000000000000000000000000000000000000E2E2E2FFE2E2
          E2FFDFDFDFFE000000000000000000000000000000002B2B2B30B8B8B8D0E3E3
          E3FFE3E3E3FF0000000000000000000000000000000000000000000000000000
          00000000000000000000E8E8E8FFE8E8E8FFE5E5E5FE00000000000000000000
          000000000000000000000000000075757580E9E9E9FF00000000000000000000
          0000000000000000000000000000000000000000000000000000E1E1E1F1EEEE
          EEFFDDDDDDEF0000000000000000000000000000000000000000000000000000
          00002E2E2E310000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76060000424D7606000000000000360000002800000014000000140000000100
          2000000000004006000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000002C21FFFF2C21FFFF2C21FFFF00000000010101010000
          000005050509000000002C21FFFF2C21FFFF2C21FFFF0B0B0B12000000000000
          00000000000000000000000000000000000000000000000000002C21FFFF2C21
          FFFF2C21FFFF00000000010101010000000000000000000000002C21FFFF2C21
          FFFF2C21FFFF0303030500000000000000000000000000000000000000000000
          000000000000000000002C21FFFF2C21FFFF2C21FFFF00000000010101010000
          000000000000000000002C21FFFF2C21FFFF2C21FFFF02020203000000000000
          00000000000000000000000000000000000000000000000000002C21FFFF2C21
          FFFF2C21FFFF00000000030303050000000000000000000000002C21FFFF2C21
          FFFF2C21FFFF0101010100000000000000000000000000000000000000000000
          000000000000000000002C21FFFF2C21FFFF2C21FFFF00000000030303050000
          000000000000000000002C21FFFF2C21FFFF2C21FFFF02020203000000000000
          00000000000000000000000000000000000000000000000000002C21FFFF2C21
          FFFF2C21FFFF00000000030303040000000000000000000000002C21FFFF2C21
          FFFF2C21FFFF0707070A00000000000000000000000000000000000000000000
          000000000000000000002C21FFFF2C21FFFF2C21FFFF00000000010101010000
          000000000000000000002C21FFFF2C21FFFF2C21FFFF0A0A0A0D000000000000
          00000000000000000000000000000000000000000000000000002C21FFFF2C21
          FFFF2C21FFFF00000000010101010000000000000000000000002C21FFFF2C21
          FFFF2C21FFFF1717171E00000000000000000000000000000000000000000000
          000000000000000000002C21FFFF2C21FFFF2C21FFFF00000000020202020000
          000000000000000000002C21FFFF2C21FFFF2C21FFFF0F0F0F13000000000000
          00000000000000000000000000000000000000000000000000002C21FFFF2C21
          FFFF2C21FFFF00000000040404050000000000000000000000002C21FFFF2C21
          FFFF2C21FFFF0A0A0A0C00000000000000000000000000000000000000000000
          000000000000000000002C21FFFF2C21FFFF2C21FFFF00000000020202020000
          000001010101000000002C21FFFF2C21FFFF2C21FFFF04040405000000000000
          00000000000000000000000000000000000000000000000000002C21FFFF2C21
          FFFF2C21FFFF00000000010101010000000001010101000000002C21FFFF2C21
          FFFF2C21FFFF0E0E0E1000000000000000000000000000000000000000000000
          000000000000000000002C21FFFF2C21FFFF2C21FFFF00000000000000000000
          000001010101000000002C21FFFF2C21FFFF2C21FFFF13131315000000000000
          00000000000000000000000000000000000000000000000000002C21FFFF2C21
          FFFF2C21FFFF00000000000000000000000001010101000000002C21FFFF2C21
          FFFF2C21FFFF0909090A00000000000000000000000000000000000000000000
          000000000000000000002C21FFFF2C21FFFF2C21FFFF00000000050505050000
          000001010101000000002C21FFFF2C21FFFF2C21FFFF14141415000000000101
          01010000000000000000000000000000000000000000000000002C21FFFF2C21
          FFFF2C21FFFF00000000000000000000000000000000000000002C21FFFF2C21
          FFFF2C21FFFF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object tmrGravando: TTimer
    Interval = 500
    OnTimer = tmrGravandoTimer
    Left = 248
    Top = 248
  end
  object advMessage: TAdvSmartMessageBox
    DefaultMessage.Font.Charset = ANSI_CHARSET
    DefaultMessage.Font.Color = clBlack
    DefaultMessage.Font.Height = -13
    DefaultMessage.Font.Name = 'Segoe UI'
    DefaultMessage.Font.Style = []
    DefaultMessage.Shadow = True
    DefaultMessage.MaxDuration = 10000
    DefaultMessage.MinDuration = 4000
    Messages = <>
    DisplayType = dtStackedInOut
    DisplayPointX = 0
    DisplayPointY = 0
    DisplayRelative = drForm
    Version = '1.4.4.0'
    Left = 137
    Top = 242
  end
end
