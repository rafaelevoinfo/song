inherited frmProjeto: TfrmProjeto
  ActiveControl = nil
  Caption = 'Projetos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabCadastro
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          inherited cbPesquisarPor: TcxImageComboBox
            Properties.Items = <
              item
                Description = 'Todos'
                ImageIndex = 0
                Value = 1
              end
              item
                Description = 'C'#243'digo'
                ImageIndex = 0
                Value = 2
              end
              item
                Description = 'Nome'
                Value = 3
              end
              item
                Description = 'Situa'#231#227'o'
                Value = 4
              end>
          end
          object cbSituacaoPesquisa: TcxImageComboBox
            Left = 272
            Top = 20
            RepositoryItem = dmLookup.repIcbSituacaoProjeto
            Properties.Items = <>
            TabOrder = 5
            Visible = False
            Width = 178
          end
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          Height = 146
          ExplicitHeight = 146
          inherited viewRegistros: TcxGridDBTableView
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Options.Editing = False
              Options.ShowEditButtons = isebNever
              Width = 35
            end
            object viewRegistrosNOME: TcxGridDBColumn [1]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
              Options.ShowEditButtons = isebNever
              Width = 202
            end
            object viewRegistrosDATA_INICIO: TcxGridDBColumn [2]
              DataBinding.FieldName = 'DATA_INICIO'
              Options.Editing = False
              Options.ShowEditButtons = isebNever
              Width = 83
            end
            object viewRegistrosDATA_TERMINO: TcxGridDBColumn [3]
              DataBinding.FieldName = 'DATA_TERMINO'
              Options.Editing = False
              Options.ShowEditButtons = isebNever
              Width = 84
            end
            object viewRegistrosID_BANCO_CONTA_CORRENTE: TcxGridDBColumn [4]
              DataBinding.FieldName = 'ID_BANCO_CONTA_CORRENTE'
              RepositoryItem = dmLookup.repLcbContaCorrente
              Options.Editing = False
              Width = 157
            end
            object viewRegistrosSTATUS: TcxGridDBColumn [5]
              DataBinding.FieldName = 'SITUACAO'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <>
              Properties.OnEditValueChanged = viewRegistrosSTATUSPropertiesEditValueChanged
              RepositoryItem = dmLookup.repIcbSituacaoProjeto
              Options.SortByDisplayText = isbtOn
              Width = 156
            end
            object viewRegistrosORCAMENTO: TcxGridDBColumn [6]
              DataBinding.FieldName = 'ORCAMENTO'
              PropertiesClassName = 'TcxCalcEditProperties'
              Properties.DisplayFormat = 'R$ ,0.00'
              Options.Editing = False
              Options.ShowEditButtons = isebNever
            end
          end
        end
        inherited cxSplitter1: TcxSplitter
          Top = 147
          ExplicitTop = 147
        end
        inherited pnDetail: TPanel
          Top = 153
          Height = 250
          ExplicitTop = 153
          ExplicitHeight = 250
          inherited pcDetails: TcxPageControl
            Height = 248
            Properties.ActivePage = tabDetailFinanciador
            OnChange = pcDetailsChange
            ExplicitHeight = 248
            ClientRectBottom = 243
            inherited tabDetail: TcxTabSheet
              Caption = 'Pessoas Envolvidas'
              ExplicitHeight = 218
              inherited cxGridRegistrosDetail: TcxGrid
                Height = 193
                ExplicitHeight = 193
                inherited viewRegistrosDetail: TcxGridDBTableView
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                    Options.ShowEditButtons = isebNever
                  end
                  object viewRegistrosDetailID_PESSOA: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'ID_PESSOA'
                    RepositoryItem = dmLookup.repLcbPessoa
                    Options.Editing = False
                    Options.ShowEditButtons = isebNever
                    Options.SortByDisplayText = isbtOn
                    Width = 235
                  end
                  object viewRegistrosDetailFUNCAO: TcxGridDBColumn [2]
                    DataBinding.FieldName = 'FUNCAO'
                    Options.Editing = False
                    Options.ShowEditButtons = isebNever
                    Width = 223
                  end
                end
              end
            end
            object tabDetailOrganizacao: TcxTabSheet
              Caption = 'Organiza'#231#245'es'
              ImageIndex = 1
              object Panel1: TPanel
                Left = 0
                Top = 0
                Width = 843
                Height = 25
                Align = alTop
                TabOrder = 0
                object btnIncluirOrganizacao: TButton
                  Left = 0
                  Top = 1
                  Width = 81
                  Height = 23
                  Action = Ac_Incluir_Detail
                  Images = dmPrincipal.imgIcons_16
                  TabOrder = 0
                end
              end
              object cxGrid1: TcxGrid
                Left = 0
                Top = 25
                Width = 843
                Height = 193
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 1
                LockedStateImageOptions.Effect = lsieDark
                LockedStateImageOptions.ShowText = True
                LockedStateImageOptions.Text = 'Pesquisando...'
                object viewProjetoOrganizacao: TcxGridDBTableView
                  OnDblClick = viewRegistrosDetailDblClick
                  Navigator.Buttons.CustomButtons = <>
                  DataController.DataSource = dsOrganizacao
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
                  object viewProjetoOrganizacaoID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewProjetoOrganizacaoID_ORGANIZACAO: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_ORGANIZACAO'
                    RepositoryItem = dmLookup.repLcbOrganizacao
                    Options.Editing = False
                    Options.ShowEditButtons = isebNever
                    Width = 335
                  end
                  object ColumnAlterarDetailOrganizacao: TcxGridDBColumn
                    Caption = 'Alterar'
                    PropertiesClassName = 'TcxButtonEditProperties'
                    Properties.Buttons = <
                      item
                        Action = Ac_Alterar_Detail
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
                  object ColumnExcluirDetailOrganizacao: TcxGridDBColumn
                    Caption = 'Excluir'
                    PropertiesClassName = 'TcxButtonEditProperties'
                    Properties.Buttons = <
                      item
                        Action = Ac_Excluir_Detail
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
                object level1: TcxGridLevel
                  GridView = viewProjetoOrganizacao
                end
              end
            end
            object tabDetailFinanciador: TcxTabSheet
              Caption = 'Financiadores'
              ImageIndex = 2
              object Panel2: TPanel
                Left = 0
                Top = 0
                Width = 843
                Height = 25
                Align = alTop
                TabOrder = 0
                object Label19: TLabel
                  Left = 425
                  Top = 9
                  Width = 71
                  Height = 13
                  Caption = 'Pagamentos'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object btnIncluirFinanciador: TButton
                  Left = 0
                  Top = 1
                  Width = 81
                  Height = 23
                  Action = Ac_Incluir_Detail
                  Images = dmPrincipal.imgIcons_16
                  TabOrder = 0
                end
              end
              object pnProjetoFinanciador: TPanel
                Left = 0
                Top = 25
                Width = 424
                Height = 193
                Align = alLeft
                BevelOuter = bvNone
                Caption = 'pnProjetoFinanciador'
                TabOrder = 1
                object cxGrid2: TcxGrid
                  Left = 0
                  Top = 0
                  Width = 424
                  Height = 193
                  Align = alClient
                  Images = dmPrincipal.imgIcons_16
                  TabOrder = 0
                  LockedStateImageOptions.Effect = lsieDark
                  LockedStateImageOptions.ShowText = True
                  LockedStateImageOptions.Text = 'Pesquisando...'
                  object viewProjetoFinanciador: TcxGridDBTableView
                    OnDblClick = viewRegistrosDetailDblClick
                    Navigator.Buttons.CustomButtons = <>
                    DataController.DataSource = dsFinanciador
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
                    object viewProjetoFinanciadorID: TcxGridDBColumn
                      DataBinding.FieldName = 'ID'
                      Visible = False
                      Options.Editing = False
                      Width = 40
                    end
                    object viewProjetoFinanciadorID_FINANCIADOR: TcxGridDBColumn
                      DataBinding.FieldName = 'ID_FINANCIADOR'
                      RepositoryItem = dmLookup.repLcbFinanciador
                      Options.Editing = False
                      Options.ShowEditButtons = isebNever
                      Width = 263
                    end
                    object ColumnAlterarDetailFinanciador: TcxGridDBColumn
                      Caption = 'Alterar'
                      PropertiesClassName = 'TcxButtonEditProperties'
                      Properties.Buttons = <
                        item
                          Action = Ac_Alterar_Detail
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
                    object ColumnExcluirDetailFinanciador: TcxGridDBColumn
                      Caption = 'Excluir'
                      PropertiesClassName = 'TcxButtonEditProperties'
                      Properties.Buttons = <
                        item
                          Action = Ac_Excluir_Detail
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
                  object cxGridLevel3: TcxGridLevel
                    GridView = viewProjetoFinanciador
                  end
                end
              end
              object cxGrid4: TcxGrid
                Left = 424
                Top = 25
                Width = 419
                Height = 193
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 2
                LockedStateImageOptions.Effect = lsieDark
                LockedStateImageOptions.ShowText = True
                LockedStateImageOptions.Text = 'Pesquisando...'
                object viewPagamentos: TcxGridDBTableView
                  OnDblClick = viewRegistrosDetailDblClick
                  Navigator.Buttons.CustomButtons = <>
                  DataController.DataSource = dsFinanciador_Pagto
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
                  object viewPagamentosID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewPagamentosVALOR: TcxGridDBColumn
                    DataBinding.FieldName = 'VALOR'
                    RepositoryItem = dmLookup.repCurPadrao
                    Options.Editing = False
                  end
                  object viewPagamentosDATA: TcxGridDBColumn
                    DataBinding.FieldName = 'DATA'
                    Options.Editing = False
                    Width = 147
                  end
                  object cxGridDBColumn4: TcxGridDBColumn
                    Caption = 'Excluir'
                    PropertiesClassName = 'TcxButtonEditProperties'
                    Properties.Buttons = <
                      item
                        Action = Ac_Excluir_Pagamento
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
                object cxGridLevel2: TcxGridLevel
                  GridView = viewPagamentos
                end
              end
            end
            object tabDetailDocumento: TcxTabSheet
              Caption = 'Documentos'
              ImageIndex = 3
              object Panel3: TPanel
                Left = 0
                Top = 0
                Width = 843
                Height = 25
                Align = alTop
                TabOrder = 0
                object btnIncluirDocumento: TButton
                  Left = 0
                  Top = 1
                  Width = 81
                  Height = 23
                  Action = Ac_Incluir_Detail
                  Images = dmPrincipal.imgIcons_16
                  TabOrder = 0
                end
              end
              object cxGrid3: TcxGrid
                Left = 0
                Top = 25
                Width = 843
                Height = 193
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 1
                LockedStateImageOptions.Effect = lsieDark
                LockedStateImageOptions.ShowText = True
                LockedStateImageOptions.Text = 'Pesquisando...'
                object viewProjetoDocumento: TcxGridDBTableView
                  OnDblClick = viewRegistrosDetailDblClick
                  Navigator.Buttons.CustomButtons = <>
                  DataController.DataSource = dsDocumento
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
                  object viewProjetoDocumentoID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewProjetoDocumentoNOME: TcxGridDBColumn
                    DataBinding.FieldName = 'NOME'
                    Options.Editing = False
                    Width = 418
                  end
                  object viewProjetoDocumentoDATA_UPLOAD: TcxGridDBColumn
                    DataBinding.FieldName = 'DATA_UPLOAD'
                    Options.Editing = False
                    Options.ShowEditButtons = isebNever
                  end
                  object ColumnDownloadProjetoDocumento: TcxGridDBColumn
                    Caption = 'Baixar'
                    PropertiesClassName = 'TcxButtonEditProperties'
                    Properties.Buttons = <
                      item
                        Action = Ac_Download
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
                  object ColumnAlterarDetailDocumento: TcxGridDBColumn
                    Caption = 'Alterar'
                    PropertiesClassName = 'TcxButtonEditProperties'
                    Properties.Buttons = <
                      item
                        Action = Ac_Alterar_Detail
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
                  object ColumnExcluirDetailDocumentos: TcxGridDBColumn
                    Caption = 'Excluir'
                    PropertiesClassName = 'TcxButtonEditProperties'
                    Properties.Buttons = <
                      item
                        Action = Ac_Excluir_Detail
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
                object cxGridLevel4: TcxGridLevel
                  GridView = viewProjetoDocumento
                end
              end
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      inherited pnEditsCadastro: TPanel
        object Label3: TLabel
          Left = 5
          Top = 2
          Width = 27
          Height = 13
          Caption = 'Nome'
          FocusControl = EditNome
        end
        object Label4: TLabel
          Left = 430
          Top = 2
          Width = 66
          Height = 13
          Caption = 'Data de In'#237'cio'
          FocusControl = EditDataInicio
        end
        object Label5: TLabel
          Left = 519
          Top = 2
          Width = 79
          Height = 13
          Caption = 'Data de T'#233'rmino'
          FocusControl = EditDataTermino
        end
        object Label6: TLabel
          Left = 4
          Top = 44
          Width = 41
          Height = 13
          Caption = 'Situa'#231#227'o'
          FocusControl = cbSituacao
        end
        object Label7: TLabel
          Left = 5
          Top = 93
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = EditDescricao
        end
        object Label8: TLabel
          Left = 608
          Top = 2
          Width = 53
          Height = 13
          Caption = 'Or'#231'amento'
          FocusControl = EditOrcamento
        end
        object Label17: TLabel
          Left = 206
          Top = 44
          Width = 75
          Height = 13
          Caption = 'Conta Corrente'
          FocusControl = cbContaCorrente
        end
        object EditNome: TcxDBTextEdit
          Left = 4
          Top = 18
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 421
        end
        object EditDataInicio: TcxDBDateEdit
          Left = 428
          Top = 18
          DataBinding.DataField = 'DATA_INICIO'
          DataBinding.DataSource = dsMaster
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 1
          Width = 84
        end
        object EditDataTermino: TcxDBDateEdit
          Left = 517
          Top = 18
          DataBinding.DataField = 'DATA_TERMINO'
          DataBinding.DataSource = dsMaster
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 2
          Width = 84
        end
        object cbSituacao: TcxDBImageComboBox
          Left = 4
          Top = 60
          RepositoryItem = dmLookup.repIcbSituacaoProjeto
          DataBinding.DataField = 'SITUACAO'
          DataBinding.DataSource = dsMaster
          Properties.Items = <>
          TabOrder = 4
          Width = 195
        end
        object EditDescricao: TcxDBMemo
          Left = 4
          Top = 109
          DataBinding.DataField = 'DESCRICAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 5
          Height = 89
          Width = 838
        end
        object EditOrcamento: TcxDBCalcEdit
          Left = 607
          Top = 18
          DataBinding.DataField = 'ORCAMENTO'
          DataBinding.DataSource = dsMaster
          Properties.DisplayFormat = 'R$ ,0.00'
          Properties.ImmediatePost = True
          Properties.ReadOnly = False
          Properties.UseThousandSeparator = True
          TabOrder = 3
          Width = 133
        end
        object cbContaCorrente: TcxDBLookupComboBox
          Left = 205
          Top = 60
          RepositoryItem = dmLookup.repLcbContaCorrente
          DataBinding.DataField = 'ID_BANCO_CONTA_CORRENTE'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 6
          Width = 220
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      inherited pnEditsCadastroDetail: TPanel
        object Label9: TLabel
          Left = 5
          Top = 6
          Width = 34
          Height = 13
          Caption = 'Pessoa'
          FocusControl = cbPessoa
        end
        object Label10: TLabel
          Left = 248
          Top = 6
          Width = 35
          Height = 13
          Caption = 'Fun'#231#227'o'
          FocusControl = EditFuncao
        end
        object cbPessoa: TcxDBLookupComboBox
          Left = 4
          Top = 22
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_PESSOA'
          DataBinding.DataSource = dsDetail
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 237
        end
        object EditFuncao: TcxDBTextEdit
          Left = 245
          Top = 22
          DataBinding.DataField = 'FUNCAO'
          DataBinding.DataSource = dsDetail
          TabOrder = 1
          Width = 356
        end
      end
    end
    object tabCadastroDetailOrganizacao: TcxTabSheet
      Caption = 'tabCadastroDetailOrganizacao'
      ImageIndex = 3
      object Label11: TLabel
        Left = 5
        Top = 54
        Width = 60
        Height = 13
        Caption = 'Organiza'#231#227'o'
        FocusControl = cbOrganizacao
      end
      object cbOrganizacao: TcxDBLookupComboBox
        Left = 4
        Top = 70
        RepositoryItem = dmLookup.repLcbOrganizacao
        DataBinding.DataField = 'ID_ORGANIZACAO'
        DataBinding.DataSource = dsOrganizacao
        Properties.ListColumns = <>
        TabOrder = 0
        Width = 237
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 854
        Height = 50
        Align = alTop
        TabOrder = 1
        object btnSalvarDetailOrganizacao: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 85
          Height = 42
          Action = Ac_Salvar_Detail
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 0
        end
        object btnCancelarDetailOrganizacao: TButton
          AlignWithMargins = True
          Left = 215
          Top = 4
          Width = 85
          Height = 42
          Action = Ac_Cancelar_Detail
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 2
        end
        object btnSalvarIncluirDetailOrganizacao: TButton
          AlignWithMargins = True
          Left = 95
          Top = 4
          Width = 114
          Height = 42
          Action = Ac_Salvar_Incluir_Detail
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 1
        end
      end
    end
    object tabCadastroDetailFinanciador: TcxTabSheet
      Caption = 'tabCadastroDetailFinanciador'
      ImageIndex = 4
      object Label12: TLabel
        Left = 7
        Top = 54
        Width = 55
        Height = 13
        Caption = 'Financiador'
        FocusControl = cbFinanciador
      end
      object Label18: TLabel
        Left = 7
        Top = 96
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
        FocusControl = EditObservacao
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 854
        Height = 50
        Align = alTop
        TabOrder = 3
        object btnSalvarDetailFinanciador: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 85
          Height = 42
          Action = Ac_Salvar_Detail
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 0
        end
        object btnCancelarDetailFinanciador: TButton
          AlignWithMargins = True
          Left = 215
          Top = 4
          Width = 85
          Height = 42
          Action = Ac_Cancelar_Detail
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 2
        end
        object btnSalvarIncluirDetailFinanciador: TButton
          AlignWithMargins = True
          Left = 95
          Top = 4
          Width = 114
          Height = 42
          Action = Ac_Salvar_Incluir_Detail
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 1
        end
      end
      object cbFinanciador: TcxDBLookupComboBox
        Left = 6
        Top = 70
        RepositoryItem = dmLookup.repLcbFinanciador
        DataBinding.DataField = 'ID_FINANCIADOR'
        DataBinding.DataSource = dsFinanciador
        Properties.ListColumns = <>
        TabOrder = 0
        Width = 237
      end
      object EditObservacao: TcxDBMemo
        Left = 6
        Top = 112
        DataBinding.DataField = 'OBSERVACAO'
        DataBinding.DataSource = dsFinanciador
        TabOrder = 1
        Height = 57
        Width = 837
      end
      object rgPagamentos: TcxGroupBox
        Left = 6
        Top = 175
        Caption = 'Pagamentos'
        TabOrder = 2
        Height = 274
        Width = 837
        object pnEditsPagamento: TPanel
          Left = 3
          Top = 15
          Width = 831
          Height = 46
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label14: TLabel
            Left = 2
            Top = 4
            Width = 78
            Height = 13
            Caption = 'Valor Financiado'
          end
          object Label13: TLabel
            Left = 139
            Top = 4
            Width = 95
            Height = 13
            Caption = 'Data do Pagamento'
          end
          object btnSalvarPagamento: TButton
            Left = 268
            Top = 18
            Width = 81
            Height = 23
            Action = Ac_Salvar_Pagamento
            Images = dmPrincipal.imgIcons_16
            TabOrder = 2
          end
          object EditDataPagamento: TcxDateEdit
            Left = 139
            Top = 20
            TabOrder = 1
            Width = 121
          end
          object EditValorPagamento: TcxCurrencyEdit
            Left = 1
            Top = 20
            RepositoryItem = dmLookup.repCurPadrao
            TabOrder = 0
            Width = 134
          end
        end
        object cxGrid5: TcxGrid
          Left = 3
          Top = 61
          Width = 831
          Height = 203
          Align = alClient
          Images = dmPrincipal.imgIcons_16
          TabOrder = 1
          TabStop = False
          LockedStateImageOptions.Effect = lsieDark
          LockedStateImageOptions.ShowText = True
          LockedStateImageOptions.Text = 'Pesquisando...'
          object viewPagamentosCadastro: TcxGridDBTableView
            OnDblClick = viewRegistrosDetailDblClick
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsFinanciador_Pagto
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
            object Column1: TcxGridDBColumn
              DataBinding.FieldName = 'ID'
              Options.Editing = False
            end
            object Column2: TcxGridDBColumn
              DataBinding.FieldName = 'VALOR'
              RepositoryItem = dmLookup.repCurPadrao
              Options.Editing = False
            end
            object Column3: TcxGridDBColumn
              DataBinding.FieldName = 'DATA'
              Options.Editing = False
              Width = 147
            end
            object Column4: TcxGridDBColumn
              Caption = 'Excluir'
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Buttons = <
                item
                  Action = Ac_Excluir_Pagamento
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
          object level2: TcxGridLevel
            GridView = viewPagamentosCadastro
          end
        end
      end
    end
    object tabCadastroDetailDocumento: TcxTabSheet
      Caption = 'tabCadastroDetailDocumento'
      ImageIndex = 5
      object Label15: TLabel
        Left = 5
        Top = 54
        Width = 99
        Height = 13
        Caption = 'Nome do Documento'
        FocusControl = EditNomeDocumento
      end
      object Label16: TLabel
        Left = 5
        Top = 97
        Width = 131
        Height = 13
        Caption = 'Caminho para o documento'
        FocusControl = EditNomeDocumento
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 854
        Height = 50
        Align = alTop
        TabOrder = 2
        object btnSalvarDetailDocumento: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 85
          Height = 42
          Action = Ac_Salvar_Detail
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 0
        end
        object btnCancelarDetailDocumento: TButton
          AlignWithMargins = True
          Left = 215
          Top = 4
          Width = 85
          Height = 42
          Action = Ac_Cancelar_Detail
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 2
        end
        object btnSalvarIncluirDetailDocumento: TButton
          AlignWithMargins = True
          Left = 95
          Top = 4
          Width = 114
          Height = 42
          Action = Ac_Salvar_Incluir_Detail
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 1
        end
      end
      object EditNomeDocumento: TcxDBTextEdit
        Left = 4
        Top = 70
        DataBinding.DataField = 'NOME'
        DataBinding.DataSource = dsDocumento
        TabOrder = 0
        Width = 317
      end
      object EditCaminhoDocumento: TcxButtonEdit
        Left = 5
        Top = 113
        Properties.Buttons = <
          item
            Action = Ac_CarregarArquivo
            Default = True
            Kind = bkGlyph
          end>
        Properties.Images = dmPrincipal.imgIcons_16
        TabOrder = 1
        Width = 316
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 88
    Top = 152
    object Ac_CarregarArquivo: TAction
      Category = 'Detail'
      Caption = 'Ac_CarregarArquivo'
      ImageIndex = 0
      OnExecute = Ac_CarregarArquivoExecute
    end
    object Ac_Excluir_Pagamento: TAction
      Category = 'Detail'
      Caption = 'Excluir'
      ImageIndex = 2
      OnExecute = Ac_Excluir_PagamentoExecute
    end
    object Ac_Salvar_Pagamento: TAction
      Category = 'Detail'
      Caption = 'Salvar'
      ImageIndex = 4
      OnExecute = Ac_Salvar_PagamentoExecute
    end
    object Ac_Download: TAction
      Category = 'Detail'
      Caption = 'Baixar'
      ImageIndex = 8
      OnExecute = Ac_DownloadExecute
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmAdministrativo.cdsProjeto
  end
  inherited dsDetail: TDataSource
    DataSet = dmAdministrativo.cdsProjeto_Pessoa
    Left = 664
    Top = 152
  end
  object dsOrganizacao: TDataSource
    DataSet = dmAdministrativo.cdsProjeto_Organizacao
    Left = 448
    Top = 144
  end
  object dsFinanciador: TDataSource
    DataSet = dmAdministrativo.cdsProjeto_Financiador
    Left = 312
    Top = 152
  end
  object dsDocumento: TDataSource
    DataSet = dmAdministrativo.cdsProjeto_Documento
    Left = 176
    Top = 144
  end
  object FileDialog: TOpenTextFileDialog
    Left = 384
    Top = 144
  end
  object dsFinanciador_Pagto: TDataSource
    DataSet = dmAdministrativo.cdsProjeto_Financiador_Pagto
    Left = 552
    Top = 144
  end
  object SaveDialogDocumento: TSaveDialog
    Left = 424
    Top = 240
  end
end
