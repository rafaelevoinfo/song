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
    end
    object Ac_Perfis: TAction
      Caption = 'Perfis de Usu'#225'rios'
    end
  end
end
