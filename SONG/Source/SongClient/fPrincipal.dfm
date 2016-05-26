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
    TabStop = False
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
    object Estoque1: TMenuItem
      Caption = 'Estoque'
      object Compras1: TMenuItem
        Action = Ac_Compra
      end
      object Entradas1: TMenuItem
        Action = Ac_Entrada
      end
      object Itens1: TMenuItem
        Action = Ac_Item
      end
      object Sadas1: TMenuItem
        Action = Ac_Saida
      end
      object SolicitaodeCompra1: TMenuItem
        Action = Ac_Solicitacao_Compra
      end
    end
    object miFinanceiro: TMenuItem
      Caption = 'Financeiro'
      object Bancos1: TMenuItem
        Action = Ac_Banco
      end
      object Clientes1: TMenuItem
        Action = Ac_Cliente
      end
      object ContasaPagar1: TMenuItem
        Action = Ac_Conta_Pagar
      end
      object ContasaReceber1: TMenuItem
        Action = Ac_Conta_Receber
      end
      object ransfernciadeRecursos1: TMenuItem
        Action = Ac_Transferencia
      end
      object Financiadores2: TMenuItem
        Action = Ac_Financiador
      end
      object Fornecedores1: TMenuItem
        Action = Ac_Fornecedor
      end
      object readeCusto1: TMenuItem
        Action = Ac_Plano_Contas
      end
      object Rubricas1: TMenuItem
        Action = Ac_Rubricas
      end
      object Relatrios1: TMenuItem
        Action = Ac_Relatorio_Financeiro
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
      object Canteiros1: TMenuItem
        Action = Ac_Canteiro
      end
      object Espcie1: TMenuItem
        Action = Ac_Especie
      end
      object Matrizes1: TMenuItem
        Action = Ac_Matriz
      end
      object LotesdeMudas1: TMenuItem
        Action = Ac_Lote_Muda
      end
      object Lotes1: TMenuItem
        Action = Ac_Lote_Semente
      end
    end
    object Sistema1: TMenuItem
      Caption = 'Sistema'
      object MeusDados1: TMenuItem
        Action = Ac_Meus_Dados
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
    object Ac_Lote_Semente: TAction
      Category = 'Viveiro'
      Caption = 'Lotes de Sementes'
      OnExecute = Ac_Lote_SementeExecute
    end
    object Ac_Canteiro: TAction
      Category = 'Viveiro'
      Caption = 'Canteiros'
      OnExecute = Ac_CanteiroExecute
    end
    object Ac_Lote_Muda: TAction
      Category = 'Viveiro'
      Caption = 'Lotes de Mudas'
      OnExecute = Ac_Lote_MudaExecute
    end
    object Ac_Plano_Contas: TAction
      Category = 'Financeiro'
      Caption = 'Plano de Contas'
      OnExecute = Ac_Plano_ContasExecute
    end
    object Ac_Rubricas: TAction
      Category = 'Financeiro'
      Caption = 'Rubricas'
      OnExecute = Ac_RubricasExecute
    end
    object Ac_Conta_Pagar: TAction
      Category = 'Financeiro'
      Caption = 'Contas a Pagar'
      OnExecute = Ac_Conta_PagarExecute
    end
    object Ac_Conta_Receber: TAction
      Category = 'Financeiro'
      Caption = 'Contas a Receber'
      OnExecute = Ac_Conta_ReceberExecute
    end
    object Ac_Cliente: TAction
      Category = 'Financeiro'
      Caption = 'Clientes'
      OnExecute = Ac_ClienteExecute
    end
    object Ac_Item: TAction
      Category = 'Estoque'
      Caption = 'Itens'
      OnExecute = Ac_ItemExecute
    end
    object Ac_Entrada: TAction
      Category = 'Estoque'
      Caption = 'Entradas'
      OnExecute = Ac_EntradaExecute
    end
    object Ac_Solicitacao_Compra: TAction
      Category = 'Estoque'
      Caption = 'Solicita'#231#227'o de Compra'
      OnExecute = Ac_Solicitacao_CompraExecute
    end
    object Ac_Compra: TAction
      Category = 'Estoque'
      Caption = 'Compras'
      OnExecute = Ac_CompraExecute
    end
    object Ac_Meus_Dados: TAction
      Category = 'Sistema'
      Caption = 'Meus Dados'
      OnExecute = Ac_Meus_DadosExecute
    end
    object Ac_Relatorio_Financeiro: TAction
      Category = 'Financeiro'
      Caption = 'Relat'#243'rios'
      OnExecute = Ac_Relatorio_FinanceiroExecute
    end
    object Ac_Saida: TAction
      Category = 'Estoque'
      Caption = 'Sa'#237'das'
      OnExecute = Ac_SaidaExecute
    end
    object Ac_Transferencia: TAction
      Category = 'Financeiro'
      Caption = 'Transfer'#234'ncia de Recursos'
      OnExecute = Ac_TransferenciaExecute
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
