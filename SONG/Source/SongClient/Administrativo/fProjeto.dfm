inherited frmProjeto: TfrmProjeto
  ActiveControl = nil
  Caption = 'Projetos'
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabCadastroDetailFinanciador
    inherited tabPesquisa: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 556
          Width = 419
          ExplicitLeft = 556
          ExplicitWidth = 419
          inherited Label1: TLabel
            Left = 4
            ExplicitLeft = 4
          end
          inherited rgStatus: TcxRadioGroup [1]
            Top = 25
            TabOrder = 5
            ExplicitTop = 25
          end
          inherited pnData: TPanel [2]
            Left = 183
            ExplicitLeft = 183
          end
          inherited EditPesquisa: TcxButtonEdit [3]
            Left = 135
            TabOrder = 3
            ExplicitLeft = 135
          end
          inherited cbPesquisarPor: TcxImageComboBox [4]
            Left = 2
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
                Description = 'Status'
                Value = 4
              end>
            TabOrder = 2
            ExplicitLeft = 2
          end
          inherited btnPesquisar: TButton [5]
            Left = 319
            TabOrder = 1
            ExplicitLeft = 319
          end
          object cbStatusPesquisa: TcxImageComboBox
            Left = 136
            Top = 20
            RepositoryItem = dmLookup.repIcbStatusProjeto
            Properties.Items = <>
            TabOrder = 4
            Visible = False
            Width = 178
          end
        end
        inherited pnBotoes: TPanel
          Width = 555
          ExplicitWidth = 555
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
              DataBinding.FieldName = 'STATUS'
              RepositoryItem = dmLookup.repIcbStatusProjeto
              Width = 151
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
            OnChange = pcDetailsChange
            ExplicitHeight = 248
            ClientRectBottom = 243
            inherited tabDetail: TcxTabSheet
              Caption = 'Pessoas Envolvidas'
              ExplicitLeft = 2
              ExplicitTop = 25
              ExplicitWidth = 965
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
                Width = 965
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
                Width = 965
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
                  Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
                  DataController.DataSource = dsOrganizacao
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
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
            object tabDetailRubrica: TcxTabSheet
              Caption = 'Rubricas'
              ImageIndex = 4
              object Panel7: TPanel
                Left = 0
                Top = 0
                Width = 965
                Height = 25
                Align = alTop
                TabOrder = 0
                object btnIncluirRubrica: TButton
                  Left = 0
                  Top = 1
                  Width = 81
                  Height = 23
                  Action = Ac_Incluir_Detail
                  Images = dmPrincipal.imgIcons_16
                  TabOrder = 0
                end
              end
              object cxGrid6: TcxGrid
                Left = 0
                Top = 25
                Width = 965
                Height = 193
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 1
                LockedStateImageOptions.Effect = lsieDark
                LockedStateImageOptions.ShowText = True
                LockedStateImageOptions.Text = 'Pesquisando...'
                object viewRubricas: TcxGridDBTableView
                  OnDblClick = viewRegistrosDetailDblClick
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
                  OnCustomDrawCell = viewRubricasCustomDrawCell
                  DataController.DataSource = dsRubrica
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = 'R$ ,0.00'
                      Kind = skSum
                      Column = viewRubricasORCAMENTO
                    end
                    item
                      Format = 'R$ ,0.00'
                      Kind = skSum
                      Column = viewRubricasGASTO
                    end
                    item
                      Format = 'R$ ,0.00'
                      Kind = skSum
                      Column = viewRubricasRECEBIDO
                    end
                    item
                      Format = 'R$ ,0.00'
                      Kind = skSum
                      Column = viewRubricasAPROVISIONADO
                    end
                    item
                      Format = 'R$ ,0.00'
                      Kind = skSum
                      FieldName = 'CALC_SALDO_REAL'
                      Column = ColumnRubricasCALC_SALDO_REAL
                    end
                    item
                      Format = 'R$ ,0.00'
                      Kind = skSum
                      FieldName = 'CALC_SALDO_PREVISTO'
                      Column = ColumnRubricasCALC_SALDO_PREVISTO
                    end>
                  DataController.Summary.SummaryGroups = <>
                  FilterRow.Visible = True
                  OptionsCustomize.ColumnsQuickCustomization = True
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Inserting = False
                  OptionsSelection.MultiSelect = True
                  OptionsView.NoDataToDisplayInfoText = '<Sem dados para mostrar>'
                  OptionsView.ShowEditButtons = gsebAlways
                  OptionsView.Footer = True
                  OptionsView.FooterAutoHeight = True
                  OptionsView.GroupByBox = False
                  object viewRubricasID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Visible = False
                    Options.Editing = False
                    Width = 34
                  end
                  object viewRubricasID_RUBRICA: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_RUBRICA'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRubricasNOME_RUBRICA: TcxGridDBColumn
                    DataBinding.FieldName = 'NOME_RUBRICA'
                    Options.Editing = False
                    Width = 252
                  end
                  object viewRubricasORCAMENTO: TcxGridDBColumn
                    DataBinding.FieldName = 'ORCAMENTO'
                    RepositoryItem = dmLookup.repCurPadrao
                    Options.Editing = False
                    Width = 128
                  end
                  object viewRubricasRECEBIDO: TcxGridDBColumn
                    DataBinding.FieldName = 'CALC_VALOR_RECEBIDO'
                    RepositoryItem = dmLookup.repCurPadrao
                    Options.Editing = False
                    Width = 128
                  end
                  object viewRubricasGASTO: TcxGridDBColumn
                    DataBinding.FieldName = 'CALC_VALOR_GASTO'
                    RepositoryItem = dmLookup.repCurPadrao
                    Options.Editing = False
                    Width = 128
                  end
                  object viewRubricasAPROVISIONADO: TcxGridDBColumn
                    DataBinding.FieldName = 'APROVISIONADO'
                    RepositoryItem = dmLookup.repCurPadrao
                    Options.Editing = False
                    Width = 128
                  end
                  object ColumnRubricasCALC_SALDO_REAL: TcxGridDBColumn
                    DataBinding.FieldName = 'SALDO_REAL'
                    RepositoryItem = dmLookup.repCurPadrao
                    Options.Editing = False
                    Width = 128
                  end
                  object ColumnRubricasCALC_SALDO_PREVISTO: TcxGridDBColumn
                    DataBinding.FieldName = 'SALDO_PREVISTO'
                    RepositoryItem = dmLookup.repCurPadrao
                    Options.Editing = False
                    Width = 128
                  end
                  object cxGridDBColumn6: TcxGridDBColumn
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
                    MinWidth = 45
                    Options.Filtering = False
                    Options.ShowEditButtons = isebAlways
                    Options.GroupFooters = False
                    Options.Grouping = False
                    Options.HorzSizing = False
                    Options.Moving = False
                    Width = 45
                  end
                  object cxGridDBColumn7: TcxGridDBColumn
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
                    MinWidth = 45
                    Options.Filtering = False
                    Options.ShowEditButtons = isebAlways
                    Options.GroupFooters = False
                    Options.Grouping = False
                    Options.HorzSizing = False
                    Options.Moving = False
                    Width = 45
                  end
                end
                object cxGridLevel5: TcxGridLevel
                  GridView = viewRubricas
                end
              end
            end
            object tabDetailFinanciador: TcxTabSheet
              Caption = 'Financiadores'
              ImageIndex = 2
              object Panel2: TPanel
                Left = 0
                Top = 0
                Width = 965
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
                    Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
                    DataController.DataSource = dsFinanciador
                    DataController.Summary.DefaultGroupSummaryItems = <>
                    DataController.Summary.FooterSummaryItems = <>
                    DataController.Summary.SummaryGroups = <>
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
                      Width = 193
                    end
                    object viewProjetoFinanciadorVALOR_FINANCIADO: TcxGridDBColumn
                      DataBinding.FieldName = 'VALOR_FINANCIADO'
                      RepositoryItem = dmLookup.repCurPadrao
                      Options.Editing = False
                      Width = 88
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
                Width = 541
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
                  Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
                  DataController.DataSource = dsFinanciador_Pagto
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  FilterRow.Visible = True
                  OptionsCustomize.ColumnsQuickCustomization = True
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Inserting = False
                  OptionsSelection.MultiSelect = True
                  OptionsView.NoDataToDisplayInfoText = '<Sem dados para mostrar>'
                  OptionsView.GroupByBox = False
                  object viewPagamentosID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewPagamentosNOME_ORGANIZACAO: TcxGridDBColumn
                    DataBinding.FieldName = 'NOME_ORGANIZACAO'
                    Width = 197
                  end
                  object viewPagamentosDATA: TcxGridDBColumn
                    DataBinding.FieldName = 'DATA'
                    Options.Editing = False
                    Width = 147
                  end
                  object viewPagamentosVALOR: TcxGridDBColumn
                    DataBinding.FieldName = 'VALOR'
                    RepositoryItem = dmLookup.repCurPadrao
                    Options.Editing = False
                  end
                  object viewPagamentosPERCENTUAL: TcxGridDBColumn
                    DataBinding.FieldName = 'PERCENTUAL'
                    PropertiesClassName = 'TcxCalcEditProperties'
                    Properties.DisplayFormat = ',0.00 %'
                    Options.Editing = False
                    Width = 63
                  end
                end
                object cxGridLevel2: TcxGridLevel
                  GridView = viewPagamentos
                end
              end
            end
            object tabDetailArea: TcxTabSheet
              Caption = #193'reas de Atua'#231#227'o'
              ImageIndex = 5
              object Panel10: TPanel
                Left = 0
                Top = 0
                Width = 965
                Height = 25
                Align = alTop
                TabOrder = 0
                object btnIncluirArea: TButton
                  Left = 0
                  Top = 1
                  Width = 81
                  Height = 23
                  Action = Ac_Incluir_Detail
                  Images = dmPrincipal.imgIcons_16
                  TabOrder = 0
                end
              end
              object cxGrid7: TcxGrid
                Left = 0
                Top = 25
                Width = 965
                Height = 193
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 1
                LockedStateImageOptions.Effect = lsieDark
                LockedStateImageOptions.ShowText = True
                LockedStateImageOptions.Text = 'Pesquisando...'
                object viewAreaAtuacao: TcxGridDBTableView
                  OnDblClick = viewRegistrosDetailDblClick
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
                  DataController.DataSource = dsArea
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
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
                  object viewAreaAtuacaoID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewAreaAtuacaoID_PROJETO: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_PROJETO'
                    Visible = False
                  end
                  object viewAreaAtuacaoNOME: TcxGridDBColumn
                    DataBinding.FieldName = 'NOME'
                    Options.Editing = False
                  end
                  object ColumnAlterarDetailArea: TcxGridDBColumn
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
                    Options.ShowEditButtons = isebAlways
                  end
                  object ColumnExcluirDetailArea: TcxGridDBColumn
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
                    Options.ShowEditButtons = isebAlways
                  end
                end
                object level3: TcxGridLevel
                  GridView = viewAreaAtuacao
                end
              end
            end
            object tabDetailDocumento: TcxTabSheet
              Caption = 'Documentos'
              ImageIndex = 3
              object Panel3: TPanel
                Left = 0
                Top = 0
                Width = 965
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
                Width = 965
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
                  Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
                  DataController.DataSource = dsDocumento
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
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
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
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
          Width = 31
          Height = 13
          Caption = 'Status'
          FocusControl = cbStatusProjeto
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
          Width = 98
          Height = 13
          Caption = 'Conta Corrente (F2)'
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
        object cbStatusProjeto: TcxDBImageComboBox
          Left = 4
          Top = 60
          RepositoryItem = dmLookup.repIcbStatusProjeto
          DataBinding.DataField = 'STATUS'
          DataBinding.DataSource = dsMaster
          Properties.Items = <>
          TabOrder = 3
          Width = 195
        end
        object EditDescricao: TcxDBMemo
          Left = 4
          Top = 109
          DataBinding.DataField = 'DESCRICAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 6
          Height = 89
          Width = 838
        end
        object cbContaCorrente: TcxDBLookupComboBox
          Left = 205
          Top = 60
          RepositoryItem = dmLookup.repLcbContaCorrente
          DataBinding.DataField = 'ID_BANCO_CONTA_CORRENTE'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 4
          OnKeyDown = cbContaCorrenteKeyDown
          Width = 220
        end
        object btnAddContaCorrente: TButton
          Left = 428
          Top = 60
          Width = 22
          Height = 21
          Action = Ac_Adicionar_Conta_Corrente
          Images = dmPrincipal.imgIcons_16
          TabOrder = 5
        end
        object EditOrcamento: TcxDBCurrencyEdit
          Left = 606
          Top = 18
          RepositoryItem = dmLookup.repCurPadrao
          DataBinding.DataField = 'ORCAMENTO'
          DataBinding.DataSource = dsMaster
          Properties.AssignedValues.MinValue = True
          TabOrder = 7
          Width = 121
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
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
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 976
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
      object pnCadastroOrganizacao: TPanel
        Left = 0
        Top = 50
        Width = 976
        Height = 398
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label11: TLabel
          Left = 5
          Top = 6
          Width = 60
          Height = 13
          Caption = 'Organiza'#231#227'o'
          FocusControl = cbOrganizacao
        end
        object cbOrganizacao: TcxDBLookupComboBox
          Left = 4
          Top = 22
          RepositoryItem = dmLookup.repLcbOrganizacao
          DataBinding.DataField = 'ID_ORGANIZACAO'
          DataBinding.DataSource = dsOrganizacao
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 237
        end
      end
    end
    object tabCadastroDetailFinanciador: TcxTabSheet
      Caption = 'tabCadastroDetailFinanciador'
      ImageIndex = 4
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 976
        Height = 50
        Align = alTop
        TabOrder = 1
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
      object pnCadastroFinanciador: TPanel
        Left = 0
        Top = 50
        Width = 976
        Height = 398
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnCadastroFinanciador'
        TabOrder = 0
        object Label12: TLabel
          Left = 4
          Top = 6
          Width = 78
          Height = 13
          Caption = 'Financiador (F2)'
          FocusControl = cbFinanciador
        end
        object Label18: TLabel
          Left = 4
          Top = 48
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
          FocusControl = EditObservacao
        end
        object Label23: TLabel
          Left = 269
          Top = 6
          Width = 79
          Height = 13
          Caption = 'Valor a Financiar'
          FocusControl = EditValorFinanciar
        end
        object cbFinanciador: TcxDBLookupComboBox
          Left = 3
          Top = 22
          RepositoryItem = dmLookup.repLcbFinanciador
          DataBinding.DataField = 'ID_FINANCIADOR'
          DataBinding.DataSource = dsFinanciador
          Properties.ListColumns = <>
          TabOrder = 0
          OnKeyDown = cbFinanciadorKeyDown
          Width = 237
        end
        object EditObservacao: TcxDBMemo
          Left = 3
          Top = 64
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsFinanciador
          TabOrder = 2
          Height = 57
          Width = 837
        end
        object rgPagamentos: TcxGroupBox
          Left = 3
          Top = 124
          Caption = 'Pagamentos'
          TabOrder = 3
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
              Left = 298
              Top = 4
              Width = 78
              Height = 13
              Caption = 'Valor Financiado'
            end
            object Label13: TLabel
              Left = 435
              Top = 4
              Width = 95
              Height = 13
              Caption = 'Data do Pagamento'
            end
            object Label22: TLabel
              Left = 561
              Top = 4
              Width = 120
              Height = 13
              Caption = 'Percentual do Valor Total'
            end
            object lb2: TLabel
              Left = 1
              Top = 4
              Width = 60
              Height = 13
              Caption = 'Organiza'#231#227'o'
            end
            object lb1: TLabel
              Left = 152
              Top = 4
              Width = 102
              Height = 13
              Caption = 'Forma de Pagamento'
            end
            object btnSalvarPagamento: TButton
              Left = 683
              Top = 18
              Width = 81
              Height = 23
              Action = Ac_Incluir_Pagamento
              Images = dmPrincipal.imgIcons_16
              TabOrder = 4
            end
            object EditDataPagamento: TcxDateEdit
              Left = 435
              Top = 20
              TabOrder = 2
              Width = 121
            end
            object EditValorPagamento: TcxCurrencyEdit
              Left = 297
              Top = 20
              RepositoryItem = dmLookup.repCurPadrao
              Properties.OnEditValueChanged = EditValorPagamentoPropertiesEditValueChanged
              TabOrder = 1
              Width = 134
            end
            object EditPercentualPagamento: TcxCalcEdit
              Left = 561
              Top = 20
              EditValue = 0.000000000000000000
              Enabled = False
              Properties.BeepOnError = False
              Properties.DisplayFormat = ',0.00 %'
              TabOrder = 3
              Width = 120
            end
            object cbProjetoOrganizacao: TcxLookupComboBox
              Left = 0
              Top = 20
              Properties.DropDownAutoSize = True
              Properties.DropDownListStyle = lsFixedList
              Properties.DropDownSizeable = True
              Properties.KeyFieldNames = 'ID'
              Properties.ListColumns = <
                item
                  FieldName = 'NOME'
                end>
              Properties.ListSource = dmLookup.dslkProjeto_Organizcao
              TabOrder = 0
              Width = 145
            end
            object cbFormaPagamento: TcxImageComboBox
              Left = 150
              Top = 20
              RepositoryItem = dmLookup.repIcbFormaPagamento
              Properties.Items = <>
              TabOrder = 5
              Width = 142
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
              Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
              DataController.DataSource = dsFinanciador_Pagto
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              FilterRow.Visible = True
              OptionsCustomize.ColumnsQuickCustomization = True
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Inserting = False
              OptionsSelection.MultiSelect = True
              OptionsView.NoDataToDisplayInfoText = '<Sem dados para mostrar>'
              OptionsView.GroupByBox = False
              object viewPagamentosCadastroID: TcxGridDBColumn
                DataBinding.FieldName = 'ID'
                Options.Editing = False
                Width = 39
              end
              object viewPagamentosCadastroNOME_ORGANIZACAO: TcxGridDBColumn
                DataBinding.FieldName = 'NOME_ORGANIZACAO'
                Options.Editing = False
                Width = 294
              end
              object viewPagamentosCadastroDATA: TcxGridDBColumn
                DataBinding.FieldName = 'DATA'
                Options.Editing = False
                Width = 100
              end
              object viewPagamentosCadastroVALOR: TcxGridDBColumn
                DataBinding.FieldName = 'VALOR'
                RepositoryItem = dmLookup.repCurPadrao
                Options.Editing = False
                Width = 154
              end
              object viewPagamentosCadastroPERCENTUAL: TcxGridDBColumn
                DataBinding.FieldName = 'PERCENTUAL'
                PropertiesClassName = 'TcxCalcEditProperties'
                Properties.DisplayFormat = ',0.00 %'
                Options.Editing = False
                Width = 61
              end
              object ViewPagamentosCadastroEXCLUIR: TcxGridDBColumn
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
        object btnAdicionar_Financiador: TButton
          Left = 241
          Top = 22
          Width = 22
          Height = 21
          Action = Ac_Adicionar_Financiador
          Images = dmPrincipal.imgIcons_16
          TabOrder = 1
          TabStop = False
        end
        object EditValorFinanciar: TcxDBCurrencyEdit
          Left = 269
          Top = 22
          RepositoryItem = dmLookup.repCurPadrao
          DataBinding.DataField = 'VALOR_FINANCIADO'
          DataBinding.DataSource = dsFinanciador
          TabOrder = 4
          Width = 148
        end
      end
    end
    object tabCadastroDetailDocumento: TcxTabSheet
      Caption = 'tabCadastroDetailDocumento'
      ImageIndex = 5
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 976
        Height = 50
        Align = alTop
        TabOrder = 1
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
      object pnCadastroDocumento: TPanel
        Left = 0
        Top = 50
        Width = 976
        Height = 398
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label15: TLabel
          Left = 5
          Top = 6
          Width = 99
          Height = 13
          Caption = 'Nome do Documento'
          FocusControl = EditNomeDocumento
        end
        object Label16: TLabel
          Left = 5
          Top = 49
          Width = 131
          Height = 13
          Caption = 'Caminho para o documento'
          FocusControl = EditNomeDocumento
        end
        object EditNomeDocumento: TcxDBTextEdit
          Left = 4
          Top = 22
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsDocumento
          TabOrder = 0
          Width = 317
        end
        object EditCaminhoDocumento: TcxButtonEdit
          Left = 4
          Top = 65
          Properties.Buttons = <
            item
              Action = Ac_CarregarArquivo
              Default = True
              Kind = bkGlyph
            end>
          Properties.Images = dmPrincipal.imgIcons_16
          TabOrder = 1
          Width = 317
        end
      end
    end
    object tabCadastroDetailRubrica: TcxTabSheet
      Caption = 'tabCadastroDetailRubrica'
      ImageIndex = 6
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 976
        Height = 50
        Align = alTop
        TabOrder = 1
        object btnSalvarDetailRubrica: TButton
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
        object btnCancelarDetailRubrica: TButton
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
        object btnSalvarIncluirDetailRubrica: TButton
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
      object pnCadastroRubrica: TPanel
        Left = 0
        Top = 50
        Width = 976
        Height = 398
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label20: TLabel
          Left = 5
          Top = 6
          Width = 36
          Height = 13
          Caption = 'Rubrica'
          FocusControl = cbRubrica
        end
        object Label21: TLabel
          Left = 245
          Top = 6
          Width = 53
          Height = 13
          Caption = 'Or'#231'amento'
          FocusControl = EditOrcamentoRubrica
        end
        object cbRubrica: TcxDBLookupComboBox
          Left = 4
          Top = 22
          RepositoryItem = dmLookup.repLcbRubrica
          DataBinding.DataField = 'ID_RUBRICA'
          DataBinding.DataSource = dsRubrica
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 237
        end
        object EditOrcamentoRubrica: TcxDBCurrencyEdit
          Left = 245
          Top = 22
          RepositoryItem = dmLookup.repCurPadrao
          DataBinding.DataField = 'ORCAMENTO'
          DataBinding.DataSource = dsRubrica
          TabOrder = 1
          Width = 148
        end
      end
    end
    object tabCadastroDetailArea: TcxTabSheet
      Caption = 'tabCadastroDetailArea'
      ImageIndex = 7
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 976
        Height = 50
        Align = alTop
        TabOrder = 1
        object btnSalvarDetailArea: TButton
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
        object btnCancelarDetailArea: TButton
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
        object btnSalvarIncluirDetailArea: TButton
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
      object pnEditsCadastroDetailArea: TPanel
        Left = 0
        Top = 50
        Width = 976
        Height = 398
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object lbl2: TLabel
          Left = 7
          Top = 6
          Width = 81
          Height = 13
          Caption = #193'rea de Atua'#231#227'o'
          FocusControl = EditNomeArea
        end
        object EditNomeArea: TcxDBTextEdit
          Left = 4
          Top = 22
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsArea
          TabOrder = 0
          Width = 356
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 88
    Top = 152
    object Ac_CarregarArquivo: TAction [14]
      Category = 'Detail'
      Caption = 'Ac_CarregarArquivo'
      ImageIndex = 0
      OnExecute = Ac_CarregarArquivoExecute
    end
    object Ac_Excluir_Pagamento: TAction [15]
      Category = 'Detail'
      Caption = 'Excluir'
      ImageIndex = 2
      OnExecute = Ac_Excluir_PagamentoExecute
    end
    object Ac_Incluir_Pagamento: TAction [16]
      Category = 'Detail'
      Caption = 'Incluir'
      ImageIndex = 3
      OnExecute = Ac_Incluir_PagamentoExecute
    end
    object Ac_Download: TAction [17]
      Category = 'Detail'
      Caption = 'Baixar'
      ImageIndex = 8
      OnExecute = Ac_DownloadExecute
    end
    object Ac_Adicionar_Conta_Corrente: TAction [18]
      Category = 'Master'
      ImageIndex = 0
      OnExecute = Ac_Adicionar_Conta_CorrenteExecute
    end
    object Ac_Adicionar_Financiador: TAction
      Category = 'Detail'
      ImageIndex = 3
      OnExecute = Ac_Adicionar_FinanciadorExecute
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
    Top = 176
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
    Left = 392
    Top = 168
  end
  object dsRubrica: TDataSource
    DataSet = dmAdministrativo.cdsProjeto_Rubrica
    Left = 544
    Top = 336
  end
  object dsArea: TDataSource
    DataSet = dmAdministrativo.cdsProjeto_Area
    Left = 488
    Top = 184
  end
end
