inherited frmBasicoCrud: TfrmBasicoCrud
  ActiveControl = pcPrincipal
  Caption = 'frmBasicoCrud'
  ClientHeight = 476
  ClientWidth = 862
  OnCreate = FormCreate
  ExplicitWidth = 878
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  object pcPrincipal: TcxPageControl
    Left = 0
    Top = 0
    Width = 862
    Height = 476
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tabPesquisa
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 472
    ClientRectLeft = 4
    ClientRectRight = 858
    ClientRectTop = 24
    object tabPesquisa: TcxTabSheet
      Caption = 'tabPesquisa'
      ImageIndex = 0
      ExplicitLeft = 2
      ExplicitTop = 25
      ExplicitWidth = 855
      ExplicitHeight = 446
      object pnPesquisa: TPanel
        Left = 0
        Top = 0
        Width = 854
        Height = 50
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 855
        object pnEditsPesquisa: TPanel
          Left = 335
          Top = 1
          Width = 518
          Height = 48
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitLeft = 336
          object Label1: TLabel
            Left = 3
            Top = 2
            Width = 69
            Height = 13
            Caption = 'Pesquisar por:'
          end
          object pnData: TPanel
            Left = 223
            Top = 0
            Width = 295
            Height = 48
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 2
            object De: TLabel
              Left = 15
              Top = 21
              Width = 13
              Height = 13
              Caption = 'De'
            end
            object Label2: TLabel
              Left = 144
              Top = 22
              Width = 17
              Height = 13
              Caption = 'At'#233
            end
            object EditDataInicial: TcxDateEdit
              Left = 31
              Top = 18
              TabOrder = 0
              Width = 106
            end
            object EditDataFinal: TcxDateEdit
              Left = 167
              Top = 18
              TabOrder = 1
              Width = 106
            end
          end
          object EditPesquisa: TcxButtonEdit
            Left = 232
            Top = 18
            Properties.Buttons = <
              item
                Action = Ac_Pesquisar
                Default = True
                Kind = bkGlyph
              end>
            Properties.Images = dmPrincipal.imgIcons_16
            TabOrder = 0
            TextHint = 'Digite aqui a sua pesquisa'
            Width = 265
          end
          object cbPesquisarPor: TcxImageComboBox
            Left = 3
            Top = 18
            EditValue = 1
            Properties.ImmediatePost = True
            Properties.Items = <
              item
                Description = 'Todos'
                ImageIndex = 0
                Value = 0
              end
              item
                Description = 'C'#243'digo'
                ImageIndex = 0
                Value = 1
              end
              item
                Description = 'Nome'
                Value = 2
              end>
            TabOrder = 1
            Width = 214
          end
        end
        object btnIncluir: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 85
          Height = 42
          Action = Ac_Incluir
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 0
        end
      end
      object pnGrid: TPanel
        Left = 0
        Top = 50
        Width = 854
        Height = 398
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 855
        ExplicitHeight = 396
        object cxGridRegistros: TcxGrid
          Left = 1
          Top = 1
          Width = 852
          Height = 396
          Align = alClient
          Images = dmPrincipal.imgIcons_16
          TabOrder = 0
          ExplicitWidth = 853
          ExplicitHeight = 394
          object viewRegistros: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.MultiSelect = True
            OptionsView.ShowEditButtons = gsebAlways
            object ColumnAlterar: TcxGridDBColumn
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Buttons = <
                item
                  Action = Ac_Alterar
                  Default = True
                  Kind = bkGlyph
                end>
              Properties.Images = dmPrincipal.imgIcons_16
              Properties.ViewStyle = vsButtonsOnly
              MinWidth = 64
              Options.Filtering = False
              Options.ShowEditButtons = isebAlways
              Options.GroupFooters = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
            end
            object ColumnExcluir: TcxGridDBColumn
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Buttons = <
                item
                  Action = Ac_Excluir
                  Default = True
                  Kind = bkGlyph
                end>
              Properties.Images = dmPrincipal.imgIcons_16
              Properties.ViewStyle = vsButtonsOnly
              MinWidth = 64
              Options.Filtering = False
              Options.ShowEditButtons = isebAlways
              Options.GroupFooters = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
            end
          end
          object level: TcxGridLevel
            GridView = viewRegistros
          end
        end
      end
    end
    object tabCadastro: TcxTabSheet
      Caption = 'tabCadastro'
      ImageIndex = 1
      ExplicitLeft = 2
      ExplicitTop = 25
      ExplicitWidth = 855
      ExplicitHeight = 446
      object pnBotoesCadastro: TPanel
        Left = 0
        Top = 0
        Width = 854
        Height = 50
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 855
        object btnSalvar: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 85
          Height = 42
          Action = Ac_Salvar
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 0
        end
        object btnCancelar: TButton
          AlignWithMargins = True
          Left = 95
          Top = 4
          Width = 85
          Height = 42
          Action = Ac_Cancelar
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 1
        end
      end
      object pnEditsCadastro: TPanel
        Left = 0
        Top = 50
        Width = 854
        Height = 398
        Align = alClient
        TabOrder = 1
        ExplicitWidth = 855
        ExplicitHeight = 396
      end
    end
  end
  object ActionList1: TActionList
    Images = dmPrincipal.imgIcons_32
    Left = 80
    Top = 176
    object Ac_Incluir: TAction
      Category = 'Master'
      Caption = 'Incluir'
      ImageIndex = 3
      OnExecute = Ac_IncluirExecute
    end
    object Ac_Pesquisar: TAction
      Category = 'Master'
      Caption = 'Pesquisar'
      ImageIndex = 0
      OnExecute = Ac_PesquisarExecute
    end
    object Ac_Alterar: TAction
      Category = 'Master'
      Caption = 'Alterar'
      ImageIndex = 1
      OnExecute = Ac_AlterarExecute
    end
    object Ac_Excluir: TAction
      Category = 'Master'
      Caption = 'Excluir'
      ImageIndex = 2
      OnExecute = Ac_ExcluirExecute
    end
    object Ac_Salvar: TAction
      Category = 'Master'
      Caption = 'Salvar'
      ImageIndex = 4
      OnExecute = Ac_SalvarExecute
    end
    object Ac_Cancelar: TAction
      Category = 'Master'
      Caption = 'Cancelar'
      ImageIndex = 5
      OnExecute = Ac_CancelarExecute
    end
  end
  object dsMaster: TDataSource
    Left = 256
    Top = 152
  end
end
