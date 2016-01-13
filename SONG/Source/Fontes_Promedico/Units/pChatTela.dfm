inherited frmChatTela: TfrmChatTela
  Caption = 'frmChatTela'
  ClientHeight = 561
  ClientWidth = 974
  Constraints.MinWidth = 600
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnMouseWheel = FormMouseWheel
  OnMouseWheelDown = FormMouseWheelDown
  OnMouseWheelUp = FormMouseWheelUp
  OnResize = FormResize
  OnShow = FormShow
  ExplicitWidth = 980
  ExplicitHeight = 590
  DesignSize = (
    974
    561)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlConversasListaUsuarios: TPanel
    Left = 0
    Top = 28
    Width = 210
    Height = 533
    Align = alLeft
    BevelOuter = bvNone
    Constraints.MinWidth = 185
    TabOrder = 1
    object slbConversasListaUsuarios: TcxScrollBox
      Left = 0
      Top = 49
      Width = 210
      Height = 406
      Align = alClient
      Color = clBtnFace
      HorzScrollBar.Visible = False
      ParentColor = False
      TabOrder = 0
      VertScrollBar.Tracking = True
    end
    object pnlPesquisa: TPanel
      Left = 0
      Top = 0
      Width = 210
      Height = 49
      Align = alTop
      TabOrder = 1
      DesignSize = (
        210
        49)
      object lblPesquisa: TLabel
        Left = 8
        Top = 8
        Width = 127
        Height = 13
        Caption = 'Pesquisar Usu'#225'rio (F2)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EditPesquisaUsuario: TcxTextEdit
        Left = 8
        Top = 24
        Hint = 'Digite o nome de um usu'#225'rio ou grupo para iniciar uma conversa'
        Anchors = [akLeft, akTop, akRight]
        ParentShowHint = False
        Properties.CharCase = ecUpperCase
        Properties.OnChange = EditPesquisaPropertiesChange
        ShowHint = True
        TabOrder = 0
        TextHint = 'Pesquise usu'#225'rio ou grupo'
        OnEnter = EditPesquisaUsuarioEnter
        OnKeyDown = EditPesquisaUsuarioKeyDown
        Width = 194
      end
    end
    object bttRetornar: TButton
      Left = 0
      Top = 496
      Width = 210
      Height = 37
      Action = DMChat.Ac_Retornar
      Align = alBottom
      Images = DMChat.ImgListBotoes32x32
      TabOrder = 2
    end
    object pnlUsuario: TPanel
      Left = 0
      Top = 455
      Width = 210
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      object imgFotoUsuarioLogado: TImage
        Left = 7
        Top = 4
        Width = 33
        Height = 33
        Center = True
      end
      object lblStatusUsuarioLogado: TLabel
        Left = 42
        Top = 22
        Width = 114
        Height = 13
        AutoSize = False
        Caption = 'lblStatusUsuarioLogado'
      end
      object spStatusUsuarioLogado: TShape
        Left = 1
        Top = 4
        Width = 5
        Height = 33
        Brush.Color = clGrayText
        Pen.Style = psClear
      end
      object lblNomeUsuarioLogado: TLabel
        Left = 42
        Top = 6
        Width = 114
        Height = 13
        AutoSize = False
        Caption = 'lblNomeUsuarioLogado'
      end
      object bttConfiguracoes: TButton
        Left = 169
        Top = 0
        Width = 41
        Height = 41
        Action = DMChat.Ac_Configuracao
        Align = alRight
        ImageAlignment = iaCenter
        ImageMargins.Left = 2
        ImageMargins.Top = 2
        Images = DMChat.ImgListBotoes32x32
        TabOrder = 0
        TabStop = False
      end
    end
  end
  object pgcPrincipal: TcxPageControl
    Left = 214
    Top = 28
    Width = 760
    Height = 533
    Align = alClient
    TabOrder = 0
    TabStop = False
    Properties.ActivePage = tabConversa
    Properties.CustomButtons.Buttons = <>
    OnPageChanging = pgcPrincipalPageChanging
    ClientRectBottom = 527
    ClientRectLeft = 3
    ClientRectRight = 754
    ClientRectTop = 26
    object tabInicial: TcxTabSheet
      Caption = 'TabInicial'
      ImageIndex = 0
    end
    object tabConversa: TcxTabSheet
      Caption = 'TabConversa'
      ImageIndex = 1
      object pnlConversa: TPanel
        Left = 0
        Top = 0
        Width = 562
        Height = 501
        Align = alClient
        BevelOuter = bvNone
        Constraints.MinWidth = 497
        TabOrder = 0
        object cxSplitter3: TcxSplitter
          Left = 0
          Top = 335
          Width = 562
          Height = 4
          AlignSplitter = salBottom
        end
        object rveMensagens: TRichViewEdit
          Left = 0
          Top = 56
          Width = 562
          Height = 279
          AcceptDragDropFormats = []
          AcceptPasteFormats = []
          ReadOnly = True
          Align = alClient
          TabOrder = 0
          OnKeyDown = rveMensagensKeyDown
          OnMouseWheel = FormMouseWheel
          BottomMargin = 0
          DoInPaletteMode = rvpaCreateCopies
          HScrollVisible = False
          LeftMargin = 0
          RightMargin = 0
          RTFReadProperties.TextStyleMode = rvrsAddIfNeeded
          RTFReadProperties.ParaStyleMode = rvrsAddIfNeeded
          RVFOptions = [rvfoSavePicturesBody, rvfoSaveControlsBody, rvfoSaveBinary, rvfoSaveTextStyles, rvfoSaveParaStyles, rvfoSaveDocProperties, rvfoLoadDocProperties]
          Style = DMChat.RVStyle1
          TopMargin = 0
        end
        object pnlAlertaConversa: TPanel
          Left = 0
          Top = 0
          Width = 562
          Height = 56
          Align = alTop
          BevelOuter = bvNone
          Caption = 'pnlAlertaConversa'
          Color = clRed
          ParentBackground = False
          ShowCaption = False
          TabOrder = 2
          Visible = False
          object Label6: TLabel
            Left = 8
            Top = 8
            Width = 304
            Height = 39
            Caption = 
              'ATEN'#199#195'O:'#13#10'Seu usu'#225'rio n'#227'o faz parte deste grupo, por tanto voc'#234#13 +
              #10'ver'#225' somente as mensagens enviadas por voc'#234'.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object pnlConversaRodape: TPanel
          Left = 0
          Top = 339
          Width = 562
          Height = 162
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'pnlConversaRodape'
          Constraints.MaxHeight = 180
          Constraints.MinHeight = 64
          ShowCaption = False
          TabOrder = 3
          object pnlEnviarMensagemUsuariosConectados: TPanel
            Left = 0
            Top = 0
            Width = 562
            Height = 41
            Align = alTop
            BevelOuter = bvNone
            Caption = 'pnlEnviarMensagemUsuariosConectados'
            Color = 16311249
            Constraints.MinHeight = 41
            ParentBackground = False
            ShowCaption = False
            TabOrder = 0
            object Label2: TLabel
              Left = 8
              Top = 8
              Width = 359
              Height = 26
              Caption = 
                'ATEN'#199#195'O:'#13#10'Esta mensagem ser'#225' enviada para todos os usu'#225'rio conec' +
                'tados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
          object pnlConversaAnexos: TPanel
            Left = 0
            Top = 105
            Width = 562
            Height = 57
            Align = alBottom
            BevelOuter = bvNone
            Caption = 'pnlConversaAnexos'
            Constraints.MinHeight = 57
            ShowCaption = False
            TabOrder = 1
            object slbAnexos: TcxScrollBox
              AlignWithMargins = True
              Left = 92
              Top = 3
              Width = 470
              Height = 54
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              TabOrder = 0
              VertScrollBar.Visible = False
            end
            object Panel1: TPanel
              Left = 0
              Top = 0
              Width = 89
              Height = 57
              Align = alLeft
              BevelOuter = bvNone
              Caption = 'Panel1'
              ShowCaption = False
              TabOrder = 1
              object lblAnexosQtde: TLabel
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 83
                Height = 16
                Align = alTop
                Alignment = taCenter
                Caption = 'Anexos - 0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ExplicitWidth = 70
              end
              object lblAnexos: TLabel
                Left = 0
                Top = 22
                Width = 89
                Height = 35
                Align = alClient
                Alignment = taCenter
                Caption = 'Lim: 5,00MB'#13#10'Tot: 0,00MB'
                ExplicitWidth = 59
                ExplicitHeight = 26
              end
            end
          end
          object pnlConversaEdit: TPanel
            Left = 0
            Top = 41
            Width = 562
            Height = 64
            Align = alClient
            BevelOuter = bvNone
            Caption = 'pnlConversaEdit'
            Constraints.MinHeight = 64
            ShowCaption = False
            TabOrder = 2
            object pnlConversaEditBotoes: TPanel
              Left = 434
              Top = 0
              Width = 128
              Height = 64
              Align = alRight
              BevelOuter = bvNone
              Caption = 'pnlConversaEditBotoes'
              ShowCaption = False
              TabOrder = 1
              object bttEnviar: TButton
                Left = 0
                Top = -1
                Width = 65
                Height = 33
                Action = DMChat.Ac_Enviar
                Images = DMChat.ImgListBotoes24x24
                TabOrder = 0
                TabStop = False
              end
              object bttSmiley: TButton
                Left = 64
                Top = -1
                Width = 33
                Height = 33
                Action = DMChat.Ac_Smiles
                ImageAlignment = iaCenter
                Images = DMChat.ImgListBotoes24x24
                TabOrder = 1
                TabStop = False
              end
              object bttAnexo: TButton
                Left = 96
                Top = -1
                Width = 33
                Height = 33
                Action = DMChat.Ac_Anexar
                ImageAlignment = iaCenter
                Images = DMChat.ImgListBotoes24x24
                TabOrder = 2
                TabStop = False
              end
              object bttPesquisarConversas: TButton
                Tag = -1
                Left = 0
                Top = 31
                Width = 129
                Height = 34
                Action = DMChat.Ac_PesquisarConversa
                DropDownMenu = DMChat.PopupMenuPesquisa
                Images = DMChat.ImgListBotoes32x32
                Style = bsSplitButton
                TabOrder = 3
                TabStop = False
                WordWrap = True
              end
            end
            object rveMensagensEdit: TRichViewEdit
              Left = 0
              Top = 0
              Width = 434
              Height = 64
              AcceptDragDropFormats = [rvddText, rvddMetafile, rvddURL, rvddHTML]
              AcceptPasteFormats = [rvddText, rvddMetafile, rvddURL, rvddHTML]
              ReadOnly = False
              Align = alClient
              TabOrder = 0
              OnKeyDown = rveMensagensEditKeyDown
              OnKeyPress = rveMensagensEditKeyPress
              OnKeyUp = rveMensagensEditKeyUp
              OnMouseWheel = FormMouseWheel
              DoInPaletteMode = rvpaCreateCopies
              Options = [rvoAllowSelection, rvoShowPageBreaks, rvoAutoCopyUnicodeText, rvoAutoCopyRVF, rvoAutoCopyImage, rvoAutoCopyRTF, rvoFormatInvalidate, rvoDblClickSelectsWord, rvoRClickDeselects, rvoShowGridLines, rvoFastFormatting]
              RTFReadProperties.TextStyleMode = rvrsAddIfNeeded
              RTFReadProperties.ParaStyleMode = rvrsAddIfNeeded
              RVFOptions = [rvfoSavePicturesBody, rvfoSaveControlsBody, rvfoSaveBinary, rvfoSaveTextStyles, rvfoSaveParaStyles, rvfoSaveDocProperties, rvfoLoadDocProperties]
              Style = DMChat.RVStyle1
            end
          end
        end
      end
      object dockSiteSmileys: TdxDockSite
        Left = 72
        Top = 112
        Width = 318
        Height = 200
        DockingType = 5
        OriginalWidth = 318
        OriginalHeight = 200
        object dxLayoutDockSite2: TdxLayoutDockSite
          Left = 0
          Top = 0
          Width = 318
          Height = 172
          Visible = False
          DockingType = 0
          OriginalWidth = 300
          OriginalHeight = 200
        end
        object dockPanelSmileys: TdxDockPanel
          Left = 0
          Top = -200
          Width = 0
          Height = 200
          Visible = False
          AllowFloating = True
          AutoHide = True
          Caption = 'Smileys'
          CaptionButtons = [cbMaximize, cbHide]
          CustomCaptionButtons.Buttons = <>
          TabsProperties.CustomButtons.Buttons = <>
          AutoHidePosition = 1
          DockingType = 0
          OriginalWidth = 185
          OriginalHeight = 200
          object slbSmileys: TcxScrollBox
            Left = 0
            Top = 0
            Width = 0
            Height = 172
            Align = alClient
            HorzScrollBar.Visible = False
            TabOrder = 0
            VertScrollBar.Increment = 24
          end
        end
      end
      object pnlDadosConversa: TPanel
        Left = 566
        Top = 0
        Width = 185
        Height = 501
        Align = alRight
        BevelOuter = bvNone
        Caption = 'pnlDadosConversa'
        ShowCaption = False
        TabOrder = 2
        object pnlDadosConversaEnvioMensagem: TPanel
          Left = 0
          Top = 395
          Width = 185
          Height = 106
          Align = alBottom
          BevelOuter = bvNone
          Caption = 'pnlDadosConversaEnvioMensagem'
          ShowCaption = False
          TabOrder = 0
          object lblEnvioMensagemTitulo: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 179
            Height = 16
            Align = alTop
            Alignment = taCenter
            Caption = 'Enviando Anexo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 103
          end
          object slbEnvioMensagens: TcxScrollBox
            Left = 0
            Top = 22
            Width = 185
            Height = 84
            Align = alClient
            HorzScrollBar.Visible = False
            TabOrder = 0
          end
        end
        object pgcDadosConversa: TcxPageControl
          Left = 0
          Top = 0
          Width = 185
          Height = 395
          Align = alClient
          Constraints.MinWidth = 185
          TabOrder = 1
          TabStop = False
          Properties.ActivePage = tabArquivos
          Properties.CustomButtons.Buttons = <>
          ClientRectBottom = 389
          ClientRectLeft = 3
          ClientRectRight = 179
          ClientRectTop = 26
          object tabPerfil: TcxTabSheet
            Caption = 'Perfil'
            ImageIndex = 3
            object imgFotoUsuario: TImage
              Left = 8
              Top = 8
              Width = 128
              Height = 128
              Center = True
            end
            object lblNomeUsuario: TLabel
              Left = 8
              Top = 144
              Width = 97
              Height = 16
              Caption = 'lblNomeUsuario'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblFuncao: TLabel
              Left = 8
              Top = 160
              Width = 45
              Height = 13
              Caption = 'lblFuncao'
            end
            object lblEmail: TLabel
              Left = 8
              Top = 176
              Width = 34
              Height = 13
              Caption = 'lblEmail'
            end
            object lblStatus: TLabel
              Left = 24
              Top = 208
              Width = 41
              Height = 13
              Caption = 'lblStatus'
            end
            object lblHospital: TLabel
              Left = 8
              Top = 192
              Width = 48
              Height = 13
              Caption = 'lblHospital'
            end
            object spStatus: TShape
              Left = 8
              Top = 208
              Width = 13
              Height = 13
              Brush.Color = clGrayText
              Pen.Style = psClear
            end
          end
          object tabGrupo: TcxTabSheet
            Caption = 'Grupo'
            ImageIndex = 3
            object slbListaUsuariosGrupo: TcxScrollBox
              Left = 0
              Top = 57
              Width = 176
              Height = 306
              Align = alClient
              Color = clBtnFace
              HorzScrollBar.Visible = False
              ParentColor = False
              TabOrder = 0
            end
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 176
              Height = 57
              Align = alTop
              Caption = 'Panel3'
              ShowCaption = False
              TabOrder = 1
              object lblListaUsuariosGrupo: TLabel
                AlignWithMargins = True
                Left = 4
                Top = 40
                Width = 168
                Height = 13
                Margins.Top = 0
                Align = alBottom
                Caption = 'Lista de Usu'#225'rios do Grupo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ExplicitWidth = 128
              end
              object lblNomeGrupo: TLabel
                AlignWithMargins = True
                Left = 4
                Top = 4
                Width = 168
                Height = 16
                Align = alTop
                Alignment = taCenter
                Caption = 'lblNomeGrupo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ExplicitWidth = 87
              end
              object lblHospitalGrupo: TLabel
                AlignWithMargins = True
                Left = 4
                Top = 23
                Width = 168
                Height = 13
                Margins.Top = 0
                Align = alTop
                Alignment = taCenter
                Caption = 'lblHospitalGrupo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ExplicitWidth = 77
              end
            end
          end
          object tabArquivos: TcxTabSheet
            Caption = 'Arquivos'
            ImageIndex = 1
            object slbListaArquivos: TcxScrollBox
              Left = 0
              Top = 0
              Width = 176
              Height = 363
              Align = alClient
              HorzScrollBar.Visible = False
              TabOrder = 0
            end
          end
        end
      end
      object cxSplitter2: TcxSplitter
        Left = 562
        Top = 0
        Width = 4
        Height = 501
        AlignSplitter = salRight
        ExplicitLeft = 558
      end
    end
    object TabPesquisa: TcxTabSheet
      Caption = 'TabPesquisa'
      ImageIndex = 3
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 751
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel4'
        ShowCaption = False
        TabOrder = 0
        DesignSize = (
          751
          49)
        object imgFotoTabPesquisa: TImage
          Left = 8
          Top = 8
          Width = 37
          Height = 37
          Center = True
        end
        object lblNomeUsuarioTabPesquisa: TLabel
          Left = 48
          Top = 8
          Width = 241
          Height = 13
          AutoSize = False
          Caption = 'lblNomeUsuarioTabPesquisa'
        end
        object lblFuncaoTabPesquisa: TLabel
          Left = 48
          Top = 20
          Width = 241
          Height = 13
          AutoSize = False
          Caption = 'lblFuncaoTabPesquisa'
        end
        object lblHospitalTabPesquisa: TLabel
          Left = 48
          Top = 32
          Width = 241
          Height = 13
          AutoSize = False
          Caption = 'lblHospitalTabPesquisa'
        end
        object lblDadosPesquisa: TLabel
          Left = 304
          Top = 8
          Width = 323
          Height = 13
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Dados da Pesquisa:'
          ExplicitWidth = 258
        end
        object lblDadosPesquisaLinha1: TLabel
          Left = 304
          Top = 20
          Width = 323
          Height = 13
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'lblDadosPesquisaLinha1'
          ExplicitWidth = 258
        end
        object lblDadosPesquisaLinha2: TLabel
          Left = 304
          Top = 32
          Width = 323
          Height = 13
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'lblDadosPesquisaLinha2'
          ExplicitWidth = 258
        end
        object bttPesquisaTabPesquisa: TButton
          Left = 633
          Top = 8
          Width = 115
          Height = 36
          Action = DMChat.Ac_PesquisarConversa
          Anchors = [akTop, akRight]
          DropDownMenu = DMChat.PopupMenuPesquisa
          Images = DMChat.ImgListBotoes32x32
          Style = bsSplitButton
          TabOrder = 0
          WordWrap = True
        end
      end
      object rvePesquisa: TRichViewEdit
        Left = 0
        Top = 105
        Width = 751
        Height = 396
        AcceptDragDropFormats = []
        AcceptPasteFormats = []
        ReadOnly = True
        Align = alClient
        TabOrder = 1
        OnMouseWheel = FormMouseWheel
        BottomMargin = 0
        DoInPaletteMode = rvpaCreateCopies
        LeftMargin = 0
        RightMargin = 0
        RTFReadProperties.TextStyleMode = rvrsAddIfNeeded
        RTFReadProperties.ParaStyleMode = rvrsAddIfNeeded
        RVFOptions = [rvfoSavePicturesBody, rvfoSaveControlsBody, rvfoSaveBinary, rvfoSaveTextStyles, rvfoSaveParaStyles, rvfoSaveDocProperties, rvfoLoadDocProperties]
        Style = DMChat.RVStyle1
        TopMargin = 0
      end
      object pnlAlertaPesquisa: TPanel
        Left = 0
        Top = 49
        Width = 751
        Height = 56
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel6'
        Color = clRed
        ParentBackground = False
        ShowCaption = False
        TabOrder = 2
        object Label7: TLabel
          Left = 8
          Top = 8
          Width = 304
          Height = 39
          Caption = 
            'ATEN'#199#195'O:'#13#10'Seu usu'#225'rio n'#227'o faz parte deste grupo, por tanto voc'#234#13 +
            #10'ver'#225' somente as mensagens enviadas por voc'#234'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object TabConfiguracao: TcxTabSheet
      Caption = 'TabConfiguracao'
      ImageIndex = 2
      object cxGroupBox1: TcxGroupBox
        Left = 120
        Top = 368
        Caption = 'Configur'#231#245'es de Fonte'
        TabOrder = 1
        Height = 129
        Width = 305
        object Label3: TLabel
          Left = 8
          Top = 16
          Width = 27
          Height = 13
          Caption = 'Nome'
        end
        object Label4: TLabel
          Left = 240
          Top = 16
          Width = 44
          Height = 13
          Caption = 'Tamanho'
        end
        object cbConfigFonteNome: TcxImageComboBox
          Left = 8
          Top = 32
          Properties.Items = <>
          Properties.OnChange = cbConfigFonteNomePropertiesChange
          TabOrder = 0
          Width = 225
        end
        object EditConfigFonteTamanho: TcxSpinEdit
          Left = 240
          Top = 32
          Properties.MaxValue = 100.000000000000000000
          Properties.MinValue = 6.000000000000000000
          Properties.OnChange = EditConfigFonteTamanhoPropertiesChange
          TabOrder = 1
          Value = 11
          Width = 57
        end
        object lblConfigFonteVisualizacao: TcxLabel
          Left = 8
          Top = 56
          AutoSize = False
          Caption = 'Visualiza'#231#227'o do Estilo da Fonte'
          ParentColor = False
          ParentFont = False
          Style.BorderColor = clBlack
          Style.BorderStyle = ebsSingle
          Style.Color = clWhite
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.TransparentBorder = False
          Style.IsFontAssigned = True
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Height = 57
          Width = 289
          AnchorX = 153
          AnchorY = 85
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 112
        Height = 501
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Panel2'
        ShowCaption = False
        TabOrder = 3
        object Button1: TButton
          Left = 0
          Top = 0
          Width = 112
          Height = 36
          Action = DMChat.Ac_ConfigGravar
          Align = alTop
          Images = DMChat.ImgListBotoes32x32
          TabOrder = 0
          TabStop = False
        end
        object Button2: TButton
          Left = 0
          Top = 36
          Width = 112
          Height = 36
          Action = DMChat.Ac_ConfigRestaurar
          Align = alTop
          Images = DMChat.ImgListBotoes32x32
          TabOrder = 1
          TabStop = False
        end
      end
      object cxGroupBox2: TcxGroupBox
        Left = 120
        Top = 8
        Caption = 'Dados do Usu'#225'rio'
        TabOrder = 0
        Height = 353
        Width = 553
        object Label8: TLabel
          Left = 272
          Top = 16
          Width = 28
          Height = 13
          Caption = 'E-Mail'
        end
        object Label10: TLabel
          Left = 272
          Top = 56
          Width = 33
          Height = 13
          Caption = 'Celular'
        end
        object imgConfigFotoUsuario: TImage
          Left = 8
          Top = 32
          Width = 256
          Height = 256
          Center = True
        end
        object Label11: TLabel
          Left = 8
          Top = 16
          Width = 237
          Height = 13
          Caption = 'Foto - Utilize os bot'#245'es abaixo para alterar a foto'
        end
        object Button5: TButton
          Left = 8
          Top = 304
          Width = 112
          Height = 36
          Action = DMChat.Ac_ConfigCapturarImagem
          Images = DMChat.ImgListBotoes32x32
          TabOrder = 0
          TabStop = False
        end
        object Button6: TButton
          Left = 152
          Top = 304
          Width = 112
          Height = 36
          Action = DMChat.Ac_ConfigPegarArquivoImagem
          Images = DMChat.ImgListBotoes32x32
          TabOrder = 1
          TabStop = False
        end
        object EditConfigEMail: TcxTextEdit
          Left = 272
          Top = 32
          Properties.CharCase = ecLowerCase
          TabOrder = 2
          Width = 273
        end
        object EditConfigTelefone: TcxTextEdit
          Left = 272
          Top = 72
          TabOrder = 3
          Width = 97
        end
      end
      object cxGroupBox3: TcxGroupBox
        Left = 432
        Top = 368
        Caption = 'Outras Configura'#231#245'es'
        TabOrder = 2
        Height = 129
        Width = 241
        object rgConfigNovaMensagemApenasAlerta: TcxRadioGroup
          Left = 8
          Top = 16
          Caption = 'Novas Mensagens'
          Properties.Items = <
            item
              Caption = 'Apenas alerta'
              Value = 1
            end
            item
              Caption = 'Tela simplificada'
              Value = 2
            end
            item
              Caption = 'Tela padr'#227'o'
              Value = 0
            end>
          TabOrder = 0
          Height = 97
          Width = 225
        end
      end
    end
    object tabCapturaFoto: TcxTabSheet
      Caption = 'Capturar Foto'
      ImageIndex = 4
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 210
    Top = 28
    Width = 4
    Height = 533
  end
  object dockSitePesqUsuarios: TdxDockSite
    Left = 0
    Top = 0
    Width = 974
    Height = 28
    Align = alTop
    AutoSize = True
    OnHideControl = dockSitePesqUsuariosHideControl
    OnShowControl = dockSitePesqUsuariosShowControl
    DockingType = 5
    OriginalWidth = 884
    OriginalHeight = 200
    object dxLayoutDockSite1: TdxLayoutDockSite
      Left = 0
      Top = 0
      Width = 974
      Height = 0
      Visible = False
      DockingType = 0
      OriginalWidth = 300
      OriginalHeight = 276
    end
    object dockPanelPesqUsuarios: TdxDockPanel
      Left = 0
      Top = -276
      Width = 0
      Height = 276
      Visible = False
      AllowFloating = True
      AutoHide = True
      Caption = 'Usu'#225'rios'
      CaptionButtons = [cbMaximize, cbHide]
      CustomCaptionButtons.Buttons = <>
      TabsProperties.CustomButtons.Buttons = <>
      AutoHidePosition = 1
      DockingType = 0
      OriginalWidth = 185
      OriginalHeight = 276
      object pnlPesqUsuario: TPanel
        Left = 0
        Top = 0
        Width = 0
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 0
          Width = 128
          Height = 13
          Caption = 'Nome do Usu'#225'rio ou Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object ckbTodosGrupos: TcxCheckBox
          Left = 288
          Top = 0
          Caption = 'Todos os Grupos'
          Properties.OnEditValueChanged = cbTodosGruposPropertiesEditValueChanged
          State = cbsChecked
          TabOrder = 1
        end
        object EditNomeUsuario: TcxTextEdit
          Left = 8
          Top = 16
          Properties.CharCase = ecUpperCase
          Properties.ClearKey = 27
          Properties.OnChange = EditNomeUsuarioPropertiesChange
          TabOrder = 0
          Width = 265
        end
        object cbGrupo: TcxLookupComboBox
          Left = 288
          Top = 16
          Properties.KeyFieldNames = 'CODIGO'
          Properties.ListColumns = <
            item
              FieldName = 'NOME'
            end>
          Properties.ListSource = DMChat.dsGrupos
          Properties.OnEditValueChanged = cbGrupoPropertiesEditValueChanged
          TabOrder = 2
          Width = 265
        end
        object ckbStatus: TcxCheckBox
          Left = 568
          Top = 0
          Caption = 'Todos os Status'
          State = cbsChecked
          TabOrder = 3
          OnClick = ckbStatusClick
        end
        object cbStatus: TcxImageComboBox
          Left = 568
          Top = 16
          EditValue = 1
          Properties.Images = DMChat.ImgListStatus16x16
          Properties.Items = <
            item
              Description = 'Conectado'
              ImageIndex = 1
              Value = 1
            end
            item
              Description = 'Desconectado'
              ImageIndex = 0
              Value = 0
            end>
          Properties.OnEditValueChanged = cbStatusPropertiesEditValueChanged
          TabOrder = 4
          Width = 121
        end
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 41
        Width = 0
        Height = 207
        Align = alClient
        TabOrder = 1
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          OnCellDblClick = cxGrid1DBTableView1CellDblClick
          DataController.DataSource = DMChat.dsUsuarios
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
          object cxGrid1DBTableView1CODIGO: TcxGridDBColumn
            DataBinding.FieldName = 'CODIGO'
            Visible = False
          end
          object cxGrid1DBTableView1NOME: TcxGridDBColumn
            DataBinding.FieldName = 'NOME'
            Width = 350
          end
          object cxGrid1DBTableView1USUARIO_GRUPO: TcxGridDBColumn
            DataBinding.FieldName = 'USUARIO_GRUPO'
            RepositoryItem = DMChat.EditRepCbUsuarioGrupo
            Width = 60
          end
          object cxGrid1DBTableView1FUNCAO: TcxGridDBColumn
            DataBinding.FieldName = 'FUNCAO'
            Width = 350
          end
          object cxGrid1DBTableView1ATIVO_INATIVO: TcxGridDBColumn
            DataBinding.FieldName = 'ATIVO_INATIVO'
            Visible = False
            Width = 50
          end
          object cxGrid1DBTableView1STATUS: TcxGridDBColumn
            DataBinding.FieldName = 'STATUS'
            RepositoryItem = DMChat.EditRepCbStatus
            Width = 101
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
  end
end
