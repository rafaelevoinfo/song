inherited frmBasicoCrud: TfrmBasicoCrud
  ActiveControl = btnSalvar
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
    Properties.ActivePage = tabCadastro
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.NativeStyle = True
    ClientRectBottom = 472
    ClientRectLeft = 4
    ClientRectRight = 858
    ClientRectTop = 24
    object tabPesquisa: TcxTabSheet
      Caption = 'tabPesquisa'
      ImageIndex = 0
      object pnPesquisa: TPanel
        Left = 0
        Top = 0
        Width = 854
        Height = 44
        Align = alTop
        TabOrder = 0
        object pnEditsPesquisa: TPanel
          Left = 295
          Top = 1
          Width = 558
          Height = 42
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object Label1: TLabel
            Left = 139
            Top = 4
            Width = 69
            Height = 13
            Caption = 'Pesquisar por:'
          end
          object pnData: TPanel
            Left = 320
            Top = 0
            Width = 129
            Height = 41
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 2
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
            object EditDataInicial: TcxDateEdit
              Left = 23
              Top = 0
              TabOrder = 0
              Width = 106
            end
            object EditDataFinal: TcxDateEdit
              Left = 23
              Top = 20
              TabOrder = 1
              Width = 106
            end
          end
          object EditPesquisa: TcxButtonEdit
            Left = 272
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
            TabOrder = 1
            TextHint = 'Digite aqui a sua pesquisa'
            OnKeyPress = EditPesquisaKeyPress
            Width = 177
          end
          object cbPesquisarPor: TcxImageComboBox
            Left = 139
            Top = 20
            EditValue = 1
            Properties.ImmediatePost = True
            Properties.Items = <
              item
                Description = 'Todos'
                ImageIndex = 0
                Value = 0
              end
              item
                Description = 'ID'
                ImageIndex = 0
                Value = 1
              end>
            Properties.OnEditValueChanged = cbPesquisarPorPropertiesEditValueChanged
            TabOrder = 0
            Width = 131
          end
          object btnPesquisar: TButton
            Left = 456
            Top = 3
            Width = 100
            Height = 36
            Action = Ac_Pesquisar
            Images = dmPrincipal.imgIcons_32
            TabOrder = 3
          end
          object rgStatus: TcxRadioGroup
            Left = 3
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
            TabOrder = 4
            Visible = False
            Height = 40
            Width = 131
          end
        end
        object pnBotoes: TPanel
          Left = 1
          Top = 1
          Width = 185
          Height = 42
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object btnIncluir: TButton
            Left = -1
            Top = 4
            Width = 85
            Height = 36
            Action = Ac_Incluir
            Images = dmPrincipal.imgIcons_32
            TabOrder = 0
          end
        end
      end
      object pnGrid: TPanel
        Left = 0
        Top = 44
        Width = 854
        Height = 404
        Align = alClient
        TabOrder = 1
        object cxGridRegistros: TcxGrid
          Left = 1
          Top = 1
          Width = 852
          Height = 402
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
            DataController.DataSource = dsMaster
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            FilterRow.InfoText = 'Clique aqui para definir um filtro'
            FilterRow.Visible = True
            OptionsCustomize.ColumnsQuickCustomization = True
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsSelection.MultiSelect = True
            OptionsView.NoDataToDisplayInfoText = '<Sem dados para mostrar>'
            OptionsView.ShowEditButtons = gsebAlways
            OptionsView.GroupByBox = False
            object ColumnAlterar: TcxGridDBColumn
              Caption = 'Alterar'
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
              Caption = 'Excluir'
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
      object pnBotoesCadastro: TPanel
        Left = 0
        Top = 0
        Width = 854
        Height = 50
        Align = alTop
        TabOrder = 1
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
        Width = 854
        Height = 398
        Align = alClient
        TabOrder = 0
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
  end
  object dsMaster: TDataSource
    Left = 256
    Top = 152
  end
end
