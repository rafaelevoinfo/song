inherited frmPrincipal: TfrmPrincipal
  Caption = 'Sistema de Gest'#227'o de Organiza'#231#227'o N'#227'o Governamental'
  ClientHeight = 387
  ClientWidth = 785
  Menu = mmMenuPrincipal
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
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
    LookAndFeel.NativeStyle = False
    ClientRectBottom = 382
    ClientRectLeft = 2
    ClientRectRight = 780
    ClientRectTop = 25
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
      object Financiadores1: TMenuItem
        Action = Ac_Financiador
      end
      object AcOrganizacao1: TMenuItem
        Action = Ac_Organizacao
      end
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
      Category = 'Administrativo'
      Caption = 'Pessoas'
      OnExecute = Ac_PessoasExecute
    end
    object Ac_Perfis: TAction
      Category = 'Administrativo'
      Caption = 'Perfis de Usu'#225'rios'
      OnExecute = Ac_PerfisExecute
    end
    object Ac_Organizacao: TAction
      Category = 'Administrativo'
      Caption = 'Organiza'#231#245'es'
      OnExecute = Ac_OrganizacaoExecute
    end
    object Ac_Projeto: TAction
      Category = 'Administrativo'
      Caption = 'Projetos'
      OnExecute = Ac_ProjetoExecute
    end
    object Ac_Financiador: TAction
      Category = 'Administrativo'
      Caption = 'Financiadores'
      OnExecute = Ac_FinanciadorExecute
    end
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Black'
    OnSkinControl = dxSkinController1SkinControl
    Left = 384
    Top = 208
  end
end
