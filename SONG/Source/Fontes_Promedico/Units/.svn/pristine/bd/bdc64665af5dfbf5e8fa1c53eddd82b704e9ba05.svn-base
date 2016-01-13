inherited frmChatTelaModal: TfrmChatTelaModal
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeable
  Caption = 'frmChatModal'
  ClientHeight = 261
  ClientWidth = 384
  Constraints.MinHeight = 300
  Constraints.MinWidth = 400
  OnCloseQuery = pmfrmZeroFormCloseQuery
  pmNaoAjustarTamTela = True
  ExplicitWidth = 400
  ExplicitHeight = 300
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPrincipal: TcxPageControl
    Left = 0
    Top = 0
    Width = 384
    Height = 261
    Align = alClient
    TabOrder = 0
    TabStop = False
    Properties.ActivePage = tabConversa
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 255
    ClientRectLeft = 3
    ClientRectRight = 378
    ClientRectTop = 26
    object tabConversa: TcxTabSheet
      Caption = 'tabConversa'
      ImageIndex = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlConversaEdit: TPanel
        Left = 0
        Top = 127
        Width = 375
        Height = 64
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'pnlConversaEdit'
        Constraints.MaxHeight = 135
        Constraints.MinHeight = 64
        ShowCaption = False
        TabOrder = 2
        object pnlConversaEditBotoes: TPanel
          Left = 343
          Top = 0
          Width = 32
          Height = 64
          Align = alRight
          BevelOuter = bvNone
          Caption = 'pnlConversaEditBotoes'
          ShowCaption = False
          TabOrder = 1
          object bttEnviar: TButton
            Left = 0
            Top = 31
            Width = 33
            Height = 33
            Action = DMChat.Ac_Enviar
            Images = DMChat.ImgListBotoes24x24
            TabOrder = 0
            TabStop = False
          end
          object bttSmiley: TButton
            Left = 0
            Top = -1
            Width = 33
            Height = 33
            Action = DMChat.Ac_Smiles
            ImageAlignment = iaCenter
            Images = DMChat.ImgListBotoes24x24
            TabOrder = 1
            TabStop = False
          end
        end
        object rveMensagensEdit: TRichViewEdit
          Left = 0
          Top = 0
          Width = 343
          Height = 64
          AcceptDragDropFormats = [rvddText, rvddMetafile, rvddURL, rvddHTML]
          AcceptPasteFormats = [rvddText, rvddMetafile, rvddURL, rvddHTML]
          ReadOnly = False
          Align = alClient
          TabOrder = 0
          DoInPaletteMode = rvpaCreateCopies
          HScrollVisible = False
          Options = [rvoAllowSelection, rvoShowPageBreaks, rvoAutoCopyUnicodeText, rvoAutoCopyRVF, rvoAutoCopyImage, rvoAutoCopyRTF, rvoFormatInvalidate, rvoDblClickSelectsWord, rvoRClickDeselects, rvoShowGridLines, rvoFastFormatting]
          RTFReadProperties.TextStyleMode = rvrsAddIfNeeded
          RTFReadProperties.ParaStyleMode = rvrsAddIfNeeded
          RVFOptions = [rvfoSavePicturesBody, rvfoSaveControlsBody, rvfoSaveBinary, rvfoSaveTextStyles, rvfoSaveParaStyles, rvfoSaveDocProperties, rvfoLoadDocProperties]
          Style = DMChat.RVStyle1
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 191
        Width = 375
        Height = 38
        Align = alBottom
        Caption = 'Panel3'
        ShowCaption = False
        TabOrder = 3
        object Button1: TButton
          Left = 1
          Top = 1
          Width = 96
          Height = 36
          Action = DMChat.Ac_Retornar
          Align = alLeft
          Images = DMChat.ImgListBotoes32x32
          TabOrder = 0
          TabStop = False
        end
        object Button2: TButton
          Left = 278
          Top = 1
          Width = 96
          Height = 36
          Action = DMChat.Ac_VerTodasMensagens
          Align = alRight
          Images = DMChat.ImgListBotoes32x32
          TabOrder = 2
          TabStop = False
          WordWrap = True
        end
        object Button3: TButton
          Left = 242
          Top = 1
          Width = 36
          Height = 36
          Action = DMChat.Ac_Configuracao
          Align = alRight
          Images = DMChat.ImgListBotoes32x32
          TabOrder = 1
          TabStop = False
          WordWrap = True
        end
      end
      object cxSplitter1: TcxSplitter
        Left = 0
        Top = 123
        Width = 375
        Height = 4
        AlignSplitter = salBottom
      end
      object rveMensagens: TRichViewEdit
        Left = 0
        Top = 41
        Width = 375
        Height = 82
        AcceptDragDropFormats = []
        AcceptPasteFormats = []
        ReadOnly = True
        Align = alClient
        TabOrder = 1
        TabStop = False
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
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 375
        Height = 41
        Align = alTop
        Caption = 'Panel1'
        ShowCaption = False
        TabOrder = 0
        object spStatusUsuario: TShape
          Left = 1
          Top = 4
          Width = 5
          Height = 33
          Brush.Color = clGrayText
          Pen.Style = psClear
        end
        object imgFotoUsuario: TImage
          Left = 7
          Top = 4
          Width = 33
          Height = 33
          Center = True
        end
        object lblNomeUsuario: TLabel
          Left = 42
          Top = 6
          Width = 152
          Height = 13
          AutoSize = False
          Caption = 'lblNomeUsuario'
        end
        object lblStatusUsuario: TLabel
          Left = 42
          Top = 22
          Width = 152
          Height = 13
          AutoSize = False
          Caption = 'lblStatusUsuario'
        end
        object lblNovaMensagem: TLabel
          Left = 200
          Top = 8
          Width = 173
          Height = 25
          Caption = 'Nova Mensagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object dockSiteSmileys: TdxDockSite
        Left = 72
        Top = 64
        Width = 92
        Height = 48
        DockingType = 5
        OriginalWidth = 92
        OriginalHeight = 48
        object dxLayoutDockSite2: TdxLayoutDockSite
          Left = 0
          Top = 0
          Width = 92
          Height = 20
          Visible = False
          DockingType = 0
          OriginalWidth = 300
          OriginalHeight = 200
        end
        object dockPanelSmileys: TdxDockPanel
          Left = 0
          Top = -200
          Width = 185
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
    end
    object TabConfiguracao: TcxTabSheet
      Caption = 'TabConfiguracao'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 112
        Height = 229
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Panel2'
        ShowCaption = False
        TabOrder = 1
        object Button4: TButton
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
        object Button5: TButton
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
        object Button6: TButton
          Left = 0
          Top = 72
          Width = 112
          Height = 36
          Action = DMChat.Ac_Retornar
          Align = alTop
          Images = DMChat.ImgListBotoes32x32
          TabOrder = 2
        end
      end
      object rgConfigNovaMensagemApenasAlerta: TcxRadioGroup
        Left = 120
        Top = 8
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
end
