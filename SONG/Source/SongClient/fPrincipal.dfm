inherited frmPrincipal: TfrmPrincipal
  Caption = 'Sistema de Gest'#227'o de Organiza'#231#227'o N'#227'o Governamental'
  ClientHeight = 387
  ClientWidth = 785
  Menu = mmMenuPrincipal
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnShow = FormShow
  ExplicitWidth = 801
  ExplicitHeight = 446
  PixelsPerInch = 96
  TextHeight = 13
  object pcPrincipal: TcxPageControl
    Left = 0
    Top = 0
    Width = 785
    Height = 387
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tabDashBoard
    Properties.AllowTabDragDrop = True
    Properties.CloseButtonMode = cbmEveryTab
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.NativeStyle = True
    ClientRectBottom = 383
    ClientRectLeft = 4
    ClientRectRight = 781
    ClientRectTop = 24
    object tabDashBoard: TcxTabSheet
      AllowCloseButton = False
      Caption = 'Avisos'
      ImageIndex = 0
    end
  end
  object mmMenuPrincipal: TMainMenu
    Left = 232
    Top = 104
    object miAdministrativo: TMenuItem
      Caption = 'Recursos Humanos'
      object Pessoa1: TMenuItem
        Action = Ac_Pessoas
      end
      object PerfisdeUsurios1: TMenuItem
        Action = Ac_Perfis
      end
    end
  end
  object ActionList1: TActionList
    Left = 488
    Top = 104
    object Ac_Pessoas: TAction
      Caption = 'Pessoas'
      OnExecute = Ac_PessoasExecute
    end
    object Ac_Perfis: TAction
      Caption = 'Perfis de Usu'#225'rios'
      OnExecute = Ac_PerfisExecute
    end
  end
end
