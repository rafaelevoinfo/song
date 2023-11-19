inherited frmBasicoCrud: TfrmBasicoCrud
  ActiveControl = btnIncluir
  Caption = 'frmBasicoCrud'
  ClientHeight = 476
  OnCreate = FormCreate
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  object pcPrincipal: TcxPageControl
    Left = 0
    Top = 0
    Width = 984
    Height = 476
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tabPesquisa
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.NativeStyle = True
    ClientRectBottom = 472
    ClientRectLeft = 4
    ClientRectRight = 980
    ClientRectTop = 24
    object tabPesquisa: TcxTabSheet
      Caption = 'tabPesquisa'
      ImageIndex = 0
      object pnPesquisa: TPanel
        Left = 0
        Top = 0
        Width = 976
        Height = 69
        Align = alTop
        TabOrder = 0
        object pnEditsPesquisa: TPanel
          Left = 432
          Top = 1
          Width = 543
          Height = 42
          Align = alRight
          AutoSize = True
          BevelOuter = bvNone
          Color = clMedGray
          DoubleBuffered = True
          Padding.Left = 2
          ParentBackground = False
          ParentDoubleBuffered = False
          TabOrder = 1
          object Label1: TLabel
            Left = 136
            Top = 4
            Width = 69
            Height = 13
            Caption = 'Pesquisar por:'
          end
          object pnData: TPanel
            Left = 315
            Top = 0
            Width = 129
            Height = 41
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 0
            Visible = False
            object De: TLabel
              Left = 1
              Top = 4
              Width = 13
              Height = 13
              Caption = 'De'
            end
            object Label2: TLabel
              Left = 0
              Top = 22
              Width = 17
              Height = 13
              Caption = 'At'#233
            end
            object EditDataInicialPesquisa: TcxDateEdit
              Left = 23
              Top = 0
              Properties.ShowTime = False
              TabOrder = 0
              Width = 106
            end
            object EditDataFinalPesquisa: TcxDateEdit
              Left = 23
              Top = 20
              Properties.ShowTime = False
              TabOrder = 1
              Width = 106
            end
          end
          object EditPesquisa: TcxButtonEdit
            Left = 267
            Top = 20
            Properties.Buttons = <
              item
                Action = Ac_Pesquisar
                Default = True
                Kind = bkGlyph
              end>
            Properties.Images = dmPrincipal.imgIcons_16
            Properties.MaskKind = emkRegExprEx
            Properties.EditMask = '.*'
            TabOrder = 4
            TextHint = 'Digite aqui a sua pesquisa'
            OnKeyPress = EditPesquisaKeyPress
            Width = 177
          end
          object cbPesquisarPor: TcxImageComboBox
            Left = 134
            Top = 20
            EditValue = 1
            Properties.ImmediatePost = True
            Properties.Items = <
              item
                Description = 'Todos'
                ImageIndex = 0
                Value = 1
              end
              item
                Description = 'ID'
                ImageIndex = 0
                Value = 2
              end>
            Properties.OnEditValueChanged = cbPesquisarPorPropertiesEditValueChanged
            TabOrder = 3
            Width = 131
          end
          object btnPesquisar: TButton
            Left = 443
            Top = 5
            Width = 100
            Height = 36
            Action = Ac_Pesquisar
            DropDownMenu = pmPesquisa
            Images = dmPrincipal.imgIcons_32
            Style = bsSplitButton
            TabOrder = 2
          end
          object rgStatus: TcxRadioGroup
            Left = 2
            Top = 1
            Caption = 'Status'
            Properties.Columns = 2
            Properties.Items = <
              item
                Caption = 'Ativo'
              end
              item
                Caption = 'Inativo'
              end>
            ItemIndex = 0
            TabOrder = 1
            Visible = False
            Height = 40
            Width = 131
          end
        end
        object pnBotoes: TPanel
          Left = 1
          Top = 1
          Width = 431
          Height = 42
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object btnIncluir: TButton
            AlignWithMargins = True
            Left = 0
            Top = 1
            Width = 85
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Action = Ac_Incluir
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 0
          end
          object btnUtilizar: TButton
            AlignWithMargins = True
            Left = 188
            Top = 1
            Width = 100
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 2
            Margins.Bottom = 1
            Action = Ac_Utilizar_Selecionado
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 2
            Visible = False
            WordWrap = True
          end
          object btnExportarExcel: TButton
            AlignWithMargins = True
            Left = 86
            Top = 1
            Width = 100
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 2
            Margins.Bottom = 1
            Action = Ac_Exportar_Excel
            Align = alLeft
            ImageIndex = 18
            Images = dmPrincipal.imgIcons_32
            TabOrder = 1
            WordWrap = True
          end
        end
        object pnFiltros: TPanel
          Left = 1
          Top = 43
          Width = 974
          Height = 25
          Align = alBottom
          TabOrder = 2
          Visible = False
        end
      end
      object pnGrid: TPanel
        Left = 0
        Top = 69
        Width = 976
        Height = 379
        Align = alClient
        TabOrder = 1
        object cxGridRegistros: TcxGrid
          Left = 1
          Top = 1
          Width = 974
          Height = 377
          Align = alClient
          Images = dmPrincipal.imgIcons_16
          TabOrder = 0
          LockedStateImageOptions.Effect = lsieDark
          LockedStateImageOptions.ShowText = True
          LockedStateImageOptions.Text = 'Pesquisando...'
          LookAndFeel.NativeStyle = False
          object viewRegistros: TcxGridDBTableView
            OnDblClick = viewRegistrosDblClick
            Navigator.Buttons.CustomButtons = <>
            FindPanel.DisplayMode = fpdmAlways
            FindPanel.InfoText = 'Informe aqui o filtro desejado...'
            ScrollbarAnnotations.CustomAnnotations = <>
            DataController.DataSource = dsMaster
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            FilterRow.InfoText = 'Clique aqui para definir um filtro'
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsSelection.MultiSelect = True
            OptionsView.NoDataToDisplayInfoText = '<Sem dados para mostrar>'
            OptionsView.GroupByBox = False
            object ColumnAlterar: TcxGridDBColumn
              Caption = 'Alterar'
              DataBinding.IsNullValueType = True
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
              VisibleForCustomization = False
            end
            object ColumnExcluir: TcxGridDBColumn
              Caption = 'Excluir'
              DataBinding.IsNullValueType = True
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Buttons = <
                item
                  Action = Ac_Excluir
                  Default = True
                  Kind = bkGlyph
                end>
              Properties.Images = dmPrincipal.imgIcons_16
              Properties.ViewStyle = vsButtonsOnly
              OnGetProperties = ColumnExcluirGetProperties
              MinWidth = 64
              Options.Filtering = False
              Options.ShowEditButtons = isebAlways
              Options.GroupFooters = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              VisibleForCustomization = False
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnBotoesCadastro: TPanel
        Left = 0
        Top = 0
        Width = 976
        Height = 50
        Align = alTop
        TabOrder = 0
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
          Left = 215
          Top = 4
          Width = 85
          Height = 42
          Action = Ac_Cancelar
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 2
        end
        object btnSalvarIncluir: TButton
          AlignWithMargins = True
          Left = 95
          Top = 4
          Width = 114
          Height = 42
          Action = Ac_Salvar_Incluir
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 1
        end
      end
      object pnEditsCadastro: TPanel
        Left = 0
        Top = 50
        Width = 976
        Height = 398
        Align = alClient
        TabOrder = 1
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
      OnUpdate = Ac_AlterarUpdate
    end
    object Ac_Excluir: TAction
      Category = 'Master'
      Caption = 'Excluir'
      ImageIndex = 2
      OnExecute = Ac_ExcluirExecute
      OnUpdate = Ac_ExcluirUpdate
    end
    object Ac_Salvar: TAction
      Category = 'Master'
      Caption = 'Salvar'
      ImageIndex = 4
      OnExecute = Ac_SalvarExecute
      OnUpdate = Ac_SalvarUpdate
    end
    object Ac_Cancelar: TAction
      Category = 'Master'
      Caption = 'Cancelar'
      ImageIndex = 5
      OnExecute = Ac_CancelarExecute
    end
    object Ac_Salvar_Incluir: TAction
      Category = 'Master'
      Caption = 'Salvar/Incluir'
      ImageIndex = 4
      OnExecute = Ac_Salvar_IncluirExecute
      OnUpdate = Ac_SalvarUpdate
    end
    object Ac_Utilizar_Selecionado: TAction
      Caption = 'Utilizar Selecionado'
      ImageIndex = 6
      OnExecute = Ac_Utilizar_SelecionadoExecute
    end
    object Ac_Exportar_Excel: TAction
      Category = 'Master'
      Caption = 'Exportar para Excel'
      OnExecute = Ac_Exportar_ExcelExecute
      OnUpdate = Ac_AlterarUpdate
    end
    object Ac_Adicionar_Filtro_Pesquisa: TAction
      Category = 'Master'
      Caption = 'Adicionar filtro de pesquisa'
      OnExecute = Ac_Adicionar_Filtro_PesquisaExecute
    end
  end
  object dsMaster: TDataSource
    Left = 256
    Top = 152
  end
  object fdExportDialog: TSaveTextFileDialog
    DefaultExt = '.xlsx (Microsoft Excel)'
    Filter = 'Microsoft Excel (*.xlsx)|*.xlsx'
    Left = 488
    Top = 240
  end
  object pmPesquisa: TPopupMenu
    Left = 656
    Top = 168
    object Adicionarfiltrodepesquisa1: TMenuItem
      Action = Ac_Adicionar_Filtro_Pesquisa
    end
  end
end
