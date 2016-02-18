inherited frmProjeto: TfrmProjeto
  Caption = 'Projetos'
  ExplicitWidth = 878
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 854
      ExplicitHeight = 448
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
          inherited rgStatus: TcxRadioGroup
            Left = 2
            ExplicitLeft = 2
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
              Width = 157
            end
            object viewRegistrosSTATUS: TcxGridDBColumn [5]
              DataBinding.FieldName = 'SITUACAO'
              RepositoryItem = dmLookup.repIcbSituacaoProjeto
              Options.Editing = False
              Options.ShowEditButtons = isebNever
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
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            Properties.ActivePage = tabDetailFinanciador
            OnChange = pcDetailsChange
            inherited tabDetail: TcxTabSheet
              Caption = 'Pessoas Envolvidas'
              ExplicitLeft = 2
              ExplicitTop = 25
              ExplicitWidth = 843
              ExplicitHeight = 156
              inherited cxGridRegistrosDetail: TcxGrid
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
                Height = 131
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
              object cxGrid2: TcxGrid
                Left = 0
                Top = 25
                Width = 843
                Height = 131
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 1
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
                    Options.Editing = False
                  end
                  object viewProjetoFinanciadorID_FINANCIADOR: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_FINANCIADOR'
                    RepositoryItem = dmLookup.repLcbFinanciador
                    Options.Editing = False
                    Width = 303
                  end
                  object viewProjetoFinanciadorVALOR_FINANCIADO: TcxGridDBColumn
                    DataBinding.FieldName = 'VALOR_FINANCIADO'
                    PropertiesClassName = 'TcxCalcEditProperties'
                    Properties.DisplayFormat = 'R$ ,0.00'
                    Options.Editing = False
                  end
                  object viewProjetoFinanciadorDATA_PAGAMENTO: TcxGridDBColumn
                    DataBinding.FieldName = 'DATA_PAGAMENTO'
                    PropertiesClassName = 'TcxDateEditProperties'
                    Options.Editing = False
                    Options.ShowEditButtons = isebNever
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
                Height = 131
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
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 854
      ExplicitHeight = 448
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
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 854
      ExplicitHeight = 448
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
        Left = 5
        Top = 54
        Width = 55
        Height = 13
        Caption = 'Financiador'
        FocusControl = cbFinanciador
      end
      object Label13: TLabel
        Left = 380
        Top = 54
        Width = 95
        Height = 13
        Caption = 'Data do Pagamento'
        FocusControl = EditDataPagamento
      end
      object Label14: TLabel
        Left = 243
        Top = 54
        Width = 78
        Height = 13
        Caption = 'Valor Financiado'
        FocusControl = EditValorFinanciamento
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
        Left = 4
        Top = 70
        RepositoryItem = dmLookup.repLcbFinanciador
        DataBinding.DataField = 'ID_FINANCIADOR'
        DataBinding.DataSource = dsFinanciador
        Properties.ListColumns = <>
        TabOrder = 0
        Width = 237
      end
      object EditDataPagamento: TcxDBDateEdit
        Left = 378
        Top = 70
        DataBinding.DataField = 'DATA_PAGAMENTO'
        DataBinding.DataSource = dsFinanciador
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 2
        Width = 101
      end
      object EditValorFinanciamento: TcxDBCalcEdit
        Left = 242
        Top = 70
        DataBinding.DataField = 'VALOR_FINANCIADO'
        DataBinding.DataSource = dsFinanciador
        Properties.DisplayFormat = 'R$ ,0.00'
        Properties.ImmediatePost = True
        Properties.ReadOnly = False
        Properties.UseThousandSeparator = True
        TabOrder = 1
        Width = 132
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
    object Ac_CarregarArquivo: TAction
      Category = 'Detail'
      Caption = 'Ac_CarregarArquivo'
      ImageIndex = 0
      OnExecute = Ac_CarregarArquivoExecute
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmAdministrativo.cdsProjeto
  end
  inherited dsDetail: TDataSource
    DataSet = dmAdministrativo.cdsProjeto_Pessoa
    Top = 224
  end
  object dsOrganizacao: TDataSource
    DataSet = dmAdministrativo.cdsProjeto_Organizacao
    Left = 344
    Top = 224
  end
  object dsFinanciador: TDataSource
    DataSet = dmAdministrativo.cdsProjeto_Financiador
    Left = 264
    Top = 232
  end
  object dsDocumento: TDataSource
    DataSet = dmAdministrativo.cdsProjeto_Documento
    Left = 184
    Top = 232
  end
  object FileDialog: TOpenTextFileDialog
    Left = 384
    Top = 144
  end
end
