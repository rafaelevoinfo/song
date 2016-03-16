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
    Left = 32
    Top = 272
    object miFinanceiro: TMenuItem
      Caption = 'Financeiro'
      object Bancos1: TMenuItem
        Action = Ac_Banco
      end
      object Financiadores2: TMenuItem
        Action = Ac_Financiador
      end
      object Fornecedores1: TMenuItem
        Action = Ac_Fornecedor
      end
    end
    object miGestao: TMenuItem
      Caption = 'Gest'#227'o'
      object Atividades1: TMenuItem
        Action = Ac_Atividade
      end
      object Organizaes1: TMenuItem
        Action = Ac_Organizacao
      end
      object Projetos1: TMenuItem
        Action = Ac_Projeto
      end
    end
    object miRecursosHumanos: TMenuItem
      Caption = 'Recursos Humanos'
      object Pessoa1: TMenuItem
        Action = Ac_Pessoas
      end
      object PerfisdeUsurios1: TMenuItem
        Action = Ac_Perfis
      end
    end
    object miViveiro: TMenuItem
      Caption = 'Viveiro'
      object Espcie1: TMenuItem
        Action = Ac_Especie
      end
      object Matrizes1: TMenuItem
        Action = Ac_Matriz
      end
      object Lotes1: TMenuItem
        Action = Ac_Lote
      end
    end
  end
  object ActionList1: TActionList
    Left = 264
    Top = 272
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
      Category = 'Financeiro'
      Caption = 'Financiadores'
      OnExecute = Ac_FinanciadorExecute
    end
    object Ac_Banco: TAction
      Category = 'Financeiro'
      Caption = 'Bancos'
      OnExecute = Ac_BancoExecute
    end
    object Ac_Atividade: TAction
      Category = 'Administrativo'
      Caption = 'Atividades'
      OnExecute = Ac_AtividadeExecute
    end
    object Ac_Especie: TAction
      Category = 'Viveiro'
      Caption = 'Esp'#233'cies'
      OnExecute = Ac_EspecieExecute
    end
    object Ac_Fornecedor: TAction
      Category = 'Financeiro'
      Caption = 'Fornecedores'
      OnExecute = Ac_FornecedorExecute
    end
    object Ac_Matriz: TAction
      Category = 'Viveiro'
      Caption = 'Matrizes'
      OnExecute = Ac_MatrizExecute
    end
    object Ac_Lote: TAction
      Category = 'Viveiro'
      Caption = 'Lotes de Sementes'
      OnExecute = Ac_LoteExecute
    end
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Black'
    OnSkinControl = dxSkinController1SkinControl
    Left = 136
    Top = 280
  end
end
