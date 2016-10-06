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
    Properties.ActivePage = tabNotificacoes
    Properties.AllowTabDragDrop = True
    Properties.CloseButtonMode = cbmEveryTab
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.NativeStyle = False
    ClientRectBottom = 382
    ClientRectLeft = 2
    ClientRectRight = 780
    ClientRectTop = 25
    object tabNotificacoes: TcxTabSheet
      AllowCloseButton = False
      Caption = 'Notifica'#231#245'es'
      ImageIndex = 36
      object TileControl: TdxTileControl
        Left = 0
        Top = 33
        Width = 478
        Height = 324
        BorderStyle = cxcbsDefault
        OptionsBehavior.ItemCheckMode = tcicmNone
        OptionsView.CenterContentHorz = True
        OptionsView.GroupIndent = 30
        OptionsView.GroupLayout = glVertical
        OptionsView.GroupMaxRowCount = 2
        OptionsView.IndentHorz = 10
        OptionsView.IndentVert = 10
        OptionsView.ItemIndent = 4
        OptionsView.ItemWidth = 200
        Style.FocusedColor = clBlack
        TabOrder = 1
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clDefault
        Title.Font.Height = -16
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = []
        Title.Text = 'Notifica'#231#245'es Diversas'
      end
      object btnAtualizar: TButton
        Left = 0
        Top = 0
        Width = 778
        Height = 33
        Action = Ac_Atualizar_Notificacoes
        Align = alTop
        ImageAlignment = iaCenter
        Images = dmPrincipal.imgIcons_32
        TabOrder = 0
        TabStop = False
      end
      object TileControlAniversario: TdxTileControl
        Left = 478
        Top = 33
        Width = 300
        Height = 324
        Align = alRight
        BorderStyle = cxcbsDefault
        OptionsBehavior.ItemCheckMode = tcicmNone
        OptionsView.CenterContentHorz = True
        OptionsView.GroupIndent = 30
        OptionsView.GroupLayout = glVertical
        OptionsView.GroupMaxRowCount = 2
        OptionsView.IndentHorz = 10
        OptionsView.IndentVert = 10
        OptionsView.ItemIndent = 4
        OptionsView.ItemWidth = 200
        Style.FocusedColor = clBlack
        TabOrder = 2
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clDefault
        Title.Font.Height = -16
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = []
        Title.IndentVert = 2
        Title.Text = 'Anivers'#225'rios'
      end
    end
  end
  object mmMenuPrincipal: TMainMenu
    Images = dmPrincipal.imgIcons_32
    Left = 40
    Top = 272
    object ComprasVendas1: TMenuItem
      Caption = 'Compras/Vendas e Servi'#231'os'
      object SolicitaodeCompra2: TMenuItem
        Action = Ac_Solicitacao_Compra
      end
      object Compras2: TMenuItem
        Action = Ac_Compra
      end
      object Vendas2: TMenuItem
        Action = Ac_Venda
      end
      object Clientes2: TMenuItem
        Action = Ac_Cliente
      end
      object Fornecedores2: TMenuItem
        Action = Ac_Fornecedor
      end
    end
    object Estoque1: TMenuItem
      Caption = 'Estoque'
      object Entradas1: TMenuItem
        Action = Ac_Entrada
      end
      object Sadas1: TMenuItem
        Action = Ac_Saida
      end
      object Itens1: TMenuItem
        Action = Ac_Item
      end
      object LocaisdeUso1: TMenuItem
        Action = Ac_Local_Uso
      end
    end
    object miFinanceiro: TMenuItem
      Caption = 'Financeiro'
      object Bancos1: TMenuItem
        Action = Ac_Banco
      end
      object ContasaPagar1: TMenuItem
        Action = Ac_Conta_Pagar
      end
      object ContasaReceber1: TMenuItem
        Action = Ac_Conta_Receber
      end
      object Doaes1: TMenuItem
        Action = Ac_Doacao
      end
      object ransfernciadeRecursos1: TMenuItem
        Action = Ac_Transferencia
      end
      object Financiadores2: TMenuItem
        Action = Ac_Financiador
      end
      object readeCusto1: TMenuItem
        Action = Ac_Plano_Contas
      end
      object Relatrios1: TMenuItem
        Action = Ac_Relatorio_Financeiro
      end
    end
    object miGestao: TMenuItem
      Caption = 'Gest'#227'o'
      object Agendas1: TMenuItem
        Action = Ac_Agenda
      end
      object Agendas2: TMenuItem
        Action = Ac_Agendamento
      end
      object reasdeAtuao1: TMenuItem
        Action = Ac_Area_Atuacao
      end
      object Atividades1: TMenuItem
        Action = Ac_Atividade
      end
      object Organizaes1: TMenuItem
        Action = Ac_Organizacao
      end
      object Projetos1: TMenuItem
        Action = Ac_Projeto
      end
      object Rubricas2: TMenuItem
        Action = Ac_Rubricas
      end
    end
    object Patrimnio1: TMenuItem
      Caption = 'Patrim'#244'nio'
      object ItensdoPatrimnio1: TMenuItem
        Action = Ac_Item_Patrimonio
      end
      object Patrimnio2: TMenuItem
        Action = Ac_Patrimonio
      end
      object Relatrio1: TMenuItem
        Action = Ac_Relatorio_Patrimonio
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
      object CmaraFria1: TMenuItem
        Action = Ac_Camara_Fria
      end
      object Canteiros1: TMenuItem
        Action = Ac_Canteiro
      end
      object FamliaBotnica1: TMenuItem
        Action = Ac_Familia_Botanica
        Caption = 'Fam'#237'lias Bot'#226'nicas'
      end
      object ipodeEspcie1: TMenuItem
        Action = Ac_Tipo_Especie
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
      object MixdeMudas1: TMenuItem
        Action = Ac_Mix_Muda
      end
      object Relatrios2: TMenuItem
        Action = Ac_Relatorio_Viveiro
      end
    end
    object Sistema1: TMenuItem
      Caption = 'Sistema'
      object ConfiguraodeNotificaes1: TMenuItem
        Action = Ac_Notificacao
      end
      object MeusDados1: TMenuItem
        Action = Ac_Meus_Dados
      end
      object Sair1: TMenuItem
        Action = Ac_Sair
      end
    end
  end
  object ActionList1: TActionList
    Images = dmPrincipal.imgIcons_32
    Left = 264
    Top = 272
    object Ac_Pessoas: TAction
      Category = 'RecursosHumanos'
      Caption = 'Pessoas'
      ImageIndex = 20
      OnExecute = Ac_PessoasExecute
    end
    object Ac_Perfis: TAction
      Category = 'RecursosHumanos'
      Caption = 'Perfis de Usu'#225'rios'
      ImageIndex = 21
      OnExecute = Ac_PerfisExecute
    end
    object Ac_Organizacao: TAction
      Category = 'Administrativo'
      Caption = 'Organiza'#231#245'es'
      ImageIndex = 22
      OnExecute = Ac_OrganizacaoExecute
    end
    object Ac_Projeto: TAction
      Category = 'Administrativo'
      Caption = 'Projetos'
      ImageIndex = 23
      OnExecute = Ac_ProjetoExecute
    end
    object Ac_Financiador: TAction
      Category = 'Financeiro'
      Caption = 'Financiadores'
      ImageIndex = 29
      OnExecute = Ac_FinanciadorExecute
    end
    object Ac_Banco: TAction
      Category = 'Financeiro'
      Caption = 'Bancos'
      ImageIndex = 30
      OnExecute = Ac_BancoExecute
    end
    object Ac_Atividade: TAction
      Category = 'Administrativo'
      Caption = 'Atividades'
      ImageIndex = 24
      OnExecute = Ac_AtividadeExecute
    end
    object Ac_Especie: TAction
      Category = 'Viveiro'
      Caption = 'Esp'#233'cies'
      ImageIndex = 39
      OnExecute = Ac_EspecieExecute
    end
    object Ac_Fornecedor: TAction
      Category = 'CompraVenda'
      Caption = 'Fornecedores'
      ImageIndex = 45
      OnExecute = Ac_FornecedorExecute
    end
    object Ac_Matriz: TAction
      Category = 'Viveiro'
      Caption = 'Matrizes'
      ImageIndex = 9
      OnExecute = Ac_MatrizExecute
    end
    object Ac_Lote_Semente: TAction
      Category = 'Viveiro'
      Caption = 'Lotes de Sementes'
      ImageIndex = 33
      OnExecute = Ac_Lote_SementeExecute
    end
    object Ac_Canteiro: TAction
      Category = 'Viveiro'
      Caption = 'Canteiros'
      ImageIndex = 49
      OnExecute = Ac_CanteiroExecute
    end
    object Ac_Lote_Muda: TAction
      Category = 'Viveiro'
      Caption = 'Lotes de Mudas'
      ImageIndex = 11
      OnExecute = Ac_Lote_MudaExecute
    end
    object Ac_Plano_Contas: TAction
      Category = 'Financeiro'
      Caption = 'Plano de Contas'
      ImageIndex = 42
      OnExecute = Ac_Plano_ContasExecute
    end
    object Ac_Rubricas: TAction
      Category = 'Administrativo'
      Caption = 'Rubricas'
      ImageIndex = 43
      OnExecute = Ac_RubricasExecute
    end
    object Ac_Conta_Pagar: TAction
      Category = 'Financeiro'
      Caption = 'Contas a Pagar'
      ImageIndex = 14
      OnExecute = Ac_Conta_PagarExecute
    end
    object Ac_Conta_Receber: TAction
      Category = 'Financeiro'
      Caption = 'Contas a Receber'
      ImageIndex = 31
      OnExecute = Ac_Conta_ReceberExecute
    end
    object Ac_Cliente: TAction
      Category = 'CompraVenda'
      Caption = 'Clientes'
      ImageIndex = 32
      OnExecute = Ac_ClienteExecute
    end
    object Ac_Item: TAction
      Category = 'Estoque'
      Caption = 'Itens'
      ImageIndex = 25
      OnExecute = Ac_ItemExecute
    end
    object Ac_Entrada: TAction
      Category = 'Estoque'
      Caption = 'Entradas'
      ImageIndex = 13
      OnExecute = Ac_EntradaExecute
    end
    object Ac_Solicitacao_Compra: TAction
      Category = 'CompraVenda'
      Caption = 'Solicita'#231#227'o de Compra'
      ImageIndex = 47
      OnExecute = Ac_Solicitacao_CompraExecute
    end
    object Ac_Compra: TAction
      Category = 'CompraVenda'
      Caption = 'Compras'
      ImageIndex = 12
      OnExecute = Ac_CompraExecute
    end
    object Ac_Meus_Dados: TAction
      Category = 'Sistema'
      Caption = 'Meus Dados'
      ImageIndex = 35
      OnExecute = Ac_Meus_DadosExecute
    end
    object Ac_Relatorio_Financeiro: TAction
      Category = 'Financeiro'
      Caption = 'Relat'#243'rios'
      ImageIndex = 15
      OnExecute = Ac_Relatorio_FinanceiroExecute
    end
    object Ac_Saida: TAction
      Category = 'Estoque'
      Caption = 'Sa'#237'das'
      ImageIndex = 26
      OnExecute = Ac_SaidaExecute
    end
    object Ac_Transferencia: TAction
      Category = 'Financeiro'
      Caption = 'Transfer'#234'ncia de Recursos'
      ImageIndex = 48
      OnExecute = Ac_TransferenciaExecute
    end
    object Ac_Venda: TAction
      Category = 'CompraVenda'
      Caption = 'Vendas'
      ImageIndex = 27
      OnExecute = Ac_VendaExecute
    end
    object Ac_Relatorio_Viveiro: TAction
      Category = 'Viveiro'
      Caption = 'Relat'#243'rios'
      ImageIndex = 15
      OnExecute = Ac_Relatorio_ViveiroExecute
    end
    object Ac_Local_Uso: TAction
      Category = 'Estoque'
      Caption = 'Locais de Uso'
      ImageIndex = 46
      OnExecute = Ac_Local_UsoExecute
    end
    object Ac_Familia_Botanica: TAction
      Category = 'Viveiro'
      Caption = 'Fam'#237'lia Bot'#226'nica'
      ImageIndex = 40
      OnExecute = Ac_Familia_BotanicaExecute
    end
    object Ac_Notificacao: TAction
      Category = 'Sistema'
      Caption = 'Configura'#231#227'o de Notifica'#231#245'es'
      ImageIndex = 36
      OnExecute = Ac_NotificacaoExecute
    end
    object Ac_Camara_Fria: TAction
      Category = 'Viveiro'
      Caption = 'C'#226'mara Fria'
      ImageIndex = 38
      OnExecute = Ac_Camara_FriaExecute
    end
    object Ac_Agenda: TAction
      Category = 'Administrativo'
      Caption = 'Cadastro de Agendas'
      ImageIndex = 34
      OnExecute = Ac_AgendaExecute
    end
    object Ac_Agendamento: TAction
      Category = 'Administrativo'
      Caption = 'Agendamentos'
      ImageIndex = 28
      OnExecute = Ac_AgendamentoExecute
    end
    object Ac_Item_Patrimonio: TAction
      Category = 'Patrimonio'
      Caption = 'Itens do Patrim'#244'nio'
      ImageIndex = 37
      OnExecute = Ac_Item_PatrimonioExecute
    end
    object Ac_Sair: TAction
      Category = 'Sistema'
      Caption = 'Sair'
      ImageIndex = 5
      OnExecute = Ac_SairExecute
    end
    object Ac_Patrimonio: TAction
      Category = 'Patrimonio'
      Caption = 'Patrim'#244'nio'
      ImageIndex = 41
      OnExecute = Ac_PatrimonioExecute
    end
    object Ac_Relatorio_Patrimonio: TAction
      Category = 'Patrimonio'
      Caption = 'Relat'#243'rio'
      ImageIndex = 15
      OnExecute = Ac_Relatorio_PatrimonioExecute
    end
    object Ac_Doacao: TAction
      Category = 'Financeiro'
      Caption = 'Doa'#231#245'es'
      ImageIndex = 44
      OnExecute = Ac_DoacaoExecute
    end
    object Ac_Atualizar_Notificacoes: TAction
      ImageIndex = 17
      OnExecute = Ac_Atualizar_NotificacoesExecute
    end
    object Ac_Area_Atuacao: TAction
      Category = 'Administrativo'
      Caption = #193'reas de Atua'#231#227'o'
      ImageIndex = 46
      OnExecute = Ac_Area_AtuacaoExecute
    end
    object Ac_Tipo_Especie: TAction
      Category = 'Viveiro'
      Caption = 'Tipos de Esp'#233'cies'
      ImageIndex = 40
      OnExecute = Ac_Tipo_EspecieExecute
    end
    object Ac_Mix_Muda: TAction
      Category = 'Viveiro'
      Caption = 'Mix de Mudas'
      ImageIndex = 51
      OnExecute = Ac_Mix_MudaExecute
    end
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Black'
    OnSkinControl = dxSkinController1SkinControl
    Left = 136
    Top = 280
  end
  object tmrAtualizacoes: TTimer
    Enabled = False
    Interval = 600000
    OnTimer = tmrAtualizacoesTimer
    Left = 384
    Top = 208
  end
  object AlertWindowManager: TdxAlertWindowManager
    OptionsAnimate.HidingAnimation = awaMove
    OptionsAnimate.HidingAnimationTime = 500
    OptionsAnimate.HotTrackFadeOutTime = 500
    OptionsBehavior.DisplayTime = 5000
    OptionsButtons.Buttons = <>
    OptionsCaptionButtons.CaptionButtons = [awcbClose]
    OptionsMessage.Caption.Font.Charset = DEFAULT_CHARSET
    OptionsMessage.Caption.Font.Color = clWindowText
    OptionsMessage.Caption.Font.Height = -13
    OptionsMessage.Caption.Font.Name = 'Tahoma'
    OptionsMessage.Caption.Font.Style = [fsBold]
    OptionsMessage.Text.Font.Charset = DEFAULT_CHARSET
    OptionsMessage.Text.Font.Color = clWindowText
    OptionsMessage.Text.Font.Height = -11
    OptionsMessage.Text.Font.Name = 'Tahoma'
    OptionsMessage.Text.Font.Style = []
    OptionsNavigationPanel.Font.Charset = DEFAULT_CHARSET
    OptionsNavigationPanel.Font.Color = clWindowText
    OptionsNavigationPanel.Font.Height = -11
    OptionsNavigationPanel.Font.Name = 'Tahoma'
    OptionsNavigationPanel.Font.Style = []
    OptionsSize.AutoWidth = True
    WindowPosition = awpBottomRight
    OnClick = AlertWindowManagerClick
    Left = 672
    Top = 88
    PixelsPerInch = 96
  end
end
