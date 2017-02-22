inherited frmAtividade: TfrmAtividade
  ActiveControl = nil
  Caption = 'Atividades'
  ExplicitWidth = 1000
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabCadastro
    inherited tabPesquisa: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 453
          Width = 522
          ExplicitLeft = 453
          ExplicitWidth = 522
          inherited Label1: TLabel
            Left = 131
            ExplicitLeft = 131
          end
          object Label3: TLabel [1]
            Left = 4
            Top = 4
            Width = 44
            Height = 13
            Caption = 'Projetos:'
          end
          inherited rgStatus: TcxRadioGroup [2]
            Left = 389
            Top = 4
            ExplicitLeft = 389
            ExplicitTop = 4
          end
          inherited pnData: TPanel [3]
            Left = 265
            Width = 153
            ExplicitLeft = 265
            ExplicitWidth = 153
            inherited EditDataInicialPesquisa: TcxDateEdit
              ExplicitWidth = 130
              Width = 130
            end
            inherited EditDataFinalPesquisa: TcxDateEdit
              ExplicitWidth = 130
              Width = 130
            end
          end
          inherited EditPesquisa: TcxButtonEdit [4]
            Left = 262
            TabOrder = 5
            ExplicitLeft = 262
            ExplicitWidth = 156
            Width = 156
          end
          inherited cbPesquisarPor: TcxImageComboBox [5]
            Left = 129
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
              end
              item
                Description = 'Nome'
                Value = 3
              end
              item
                Description = 'Data'
                Value = 4
              end>
            TabOrder = 4
            ExplicitLeft = 129
          end
          inherited btnPesquisar: TButton [6]
            Left = 422
            ExplicitLeft = 422
          end
          object cbProjetosPesquisa: TcxCheckComboBox
            Left = 2
            Top = 20
            Properties.EmptySelectionText = 'Todos'
            Properties.DropDownSizeable = True
            Properties.EditValueFormat = cvfIndices
            Properties.Items = <
              item
              end>
            TabOrder = 3
            Width = 126
          end
        end
        inherited pnBotoes: TPanel
          Width = 452
          ExplicitWidth = 452
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            OnCustomDrawCell = viewRegistrosCustomDrawCell
            OnFocusedRecordChanged = viewRegistrosFocusedRecordChanged
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Options.Editing = False
              Width = 33
            end
            object viewRegistrosNOME: TcxGridDBColumn [1]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
              Width = 383
            end
            object viewRegistrosID_PROJETO: TcxGridDBColumn [2]
              DataBinding.FieldName = 'ID_PROJETO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosNOME_PROJETO: TcxGridDBColumn [3]
              DataBinding.FieldName = 'NOME_PROJETO'
              Options.Editing = False
              Width = 160
            end
            object viewRegistrosID_SOLICITANTE: TcxGridDBColumn [4]
              DataBinding.FieldName = 'ID_SOLICITANTE'
              Visible = False
              Options.Editing = False
              Options.ShowEditButtons = isebNever
              Width = 131
            end
            object viewRegistrosNOME_SOLICITANTE: TcxGridDBColumn [5]
              DataBinding.FieldName = 'NOME_SOLICITANTE'
              Options.Editing = False
              Width = 227
            end
            object viewRegistrosID_RESPONSAVEL: TcxGridDBColumn [6]
              DataBinding.FieldName = 'ID_RESPONSAVEL'
              Visible = False
              Options.Editing = False
              Options.ShowEditButtons = isebNever
              Width = 157
            end
            object viewRegistrosNOME_RESPONSAVEL: TcxGridDBColumn [7]
              DataBinding.FieldName = 'NOME_RESPONSAVEL'
              Options.Editing = False
              Width = 215
            end
            object viewRegistrosSTATUS: TcxGridDBColumn [8]
              DataBinding.FieldName = 'STATUS'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <>
              Properties.OnEditValueChanged = viewRegistrosSTATUSPropertiesEditValueChanged
              RepositoryItem = dmPrincipal.repIcbStatusAtividade
              Options.ShowEditButtons = isebAlways
              Width = 129
            end
            object viewRegistrosDATA_INICIAL: TcxGridDBColumn [9]
              DataBinding.FieldName = 'DATA_INICIAL'
              Options.Editing = False
              Options.ShowEditButtons = isebNever
              Width = 63
            end
            object viewRegistrosDATA_FINAL: TcxGridDBColumn [10]
              DataBinding.FieldName = 'DATA_FINAL'
              Options.Editing = False
              Options.ShowEditButtons = isebNever
              Width = 63
            end
            object viewRegistrosDATA_CADASTRO: TcxGridDBColumn [11]
              DataBinding.FieldName = 'DATA_CADASTRO'
              Visible = False
            end
            object viewRegistrosDATA_FINALIZACAO: TcxGridDBColumn [12]
              DataBinding.FieldName = 'DATA_FINALIZACAO'
              Options.Editing = False
              Width = 103
            end
            object viewRegistrosID_AREA_ATUACAO: TcxGridDBColumn [13]
              DataBinding.FieldName = 'ID_AREA_ATUACAO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_AREA_EXECUCAO: TcxGridDBColumn [14]
              DataBinding.FieldName = 'ID_AREA_EXECUCAO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosAREA_ATUACAO: TcxGridDBColumn [15]
              DataBinding.FieldName = 'AREA_ATUACAO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosAREA_EXECUCAO: TcxGridDBColumn [16]
              DataBinding.FieldName = 'AREA_EXECUCAO'
              Visible = False
              Options.Editing = False
            end
            object ColumnImprimirOS: TcxGridDBColumn [17]
              Caption = 'Imprimir O.S.'
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Buttons = <
                item
                  Action = Ac_Imprimir_OS
                  Default = True
                  Kind = bkGlyph
                end>
              Properties.Images = dmPrincipal.imgIcons_16
              Properties.ViewStyle = vsButtonsOnly
              MinWidth = 80
              Options.Filtering = False
              Options.ShowEditButtons = isebAlways
              Options.GroupFooters = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 80
            end
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            OnChange = pcDetailsChange
            object tabDetailComentario: TcxTabSheet [0]
              Caption = 'Coment'#225'rios'
              ImageIndex = 4
              object Panel3: TPanel
                Left = 0
                Top = 0
                Width = 965
                Height = 25
                Align = alTop
                TabOrder = 0
                object Button4: TButton
                  Left = 0
                  Top = 1
                  Width = 81
                  Height = 23
                  Action = Ac_Incluir_Detail
                  Images = dmPrincipal.imgIcons_16
                  TabOrder = 0
                end
              end
              object cxGrid4: TcxGrid
                Left = 0
                Top = 25
                Width = 965
                Height = 170
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 1
                LockedStateImageOptions.Effect = lsieDark
                LockedStateImageOptions.ShowText = True
                LockedStateImageOptions.Text = 'Pesquisando...'
                object viewDetailComentario: TcxGridDBTableView
                  OnDblClick = viewRegistrosDetailDblClick
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
                  DataController.DataSource = dsAtividade_Comentario
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
                  OptionsView.CellAutoHeight = True
                  OptionsView.GroupByBox = False
                  object viewDetailComentarioID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewDetailComentarioID_PESSOA: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_PESSOA'
                    RepositoryItem = dmLookup.repLcbPessoa
                    Options.Editing = False
                    Options.ShowEditButtons = isebNever
                    Width = 252
                  end
                  object viewDetailComentarioCOMENTARIO: TcxGridDBColumn
                    DataBinding.FieldName = 'COMENTARIO'
                    PropertiesClassName = 'TcxMemoProperties'
                    Options.Editing = False
                    Width = 358
                  end
                  object viewDetailComentarioDATA_HORA: TcxGridDBColumn
                    DataBinding.FieldName = 'DATA_HORA'
                    Options.Editing = False
                    Width = 148
                  end
                  object cxGridDBColumn11: TcxGridDBColumn
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
                  object cxGridDBColumn12: TcxGridDBColumn
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
                object cxGridLevel5: TcxGridLevel
                  GridView = viewDetailComentario
                end
              end
            end
            inherited tabDetail: TcxTabSheet
              Caption = 'Pessoas envolvidas'
              ExplicitLeft = 2
              ExplicitTop = 25
              ExplicitWidth = 965
              ExplicitHeight = 195
              inherited cxGridRegistrosDetail: TcxGrid
                inherited viewRegistrosDetail: TcxGridDBTableView
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewRegistrosDetailID_PESSOA: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'ID_PESSOA'
                    Visible = False
                    Options.Editing = False
                    Options.ShowEditButtons = isebNever
                    Width = 336
                  end
                  object viewRegistrosDetailNOME_PESSOA: TcxGridDBColumn [2]
                    DataBinding.FieldName = 'NOME_PESSOA'
                    Options.Editing = False
                    Width = 328
                  end
                  object viewRegistrosDetailFUNCAO: TcxGridDBColumn [3]
                    DataBinding.FieldName = 'FUNCAO'
                    Options.Editing = False
                  end
                end
              end
            end
            object tabDetailProjeto: TcxTabSheet
              Caption = 'Projetos vinculados'
              ImageIndex = 1
              object Panel1: TPanel
                Left = 0
                Top = 0
                Width = 965
                Height = 25
                Align = alTop
                TabOrder = 0
                object Button2: TButton
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
                Width = 965
                Height = 170
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 1
                LockedStateImageOptions.Effect = lsieDark
                LockedStateImageOptions.ShowText = True
                LockedStateImageOptions.Text = 'Pesquisando...'
                object viewProjetos: TcxGridDBTableView
                  OnDblClick = viewRegistrosDetailDblClick
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
                  DataController.DataSource = dsAtividade_Projeto
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
                  object viewProjetosID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewProjetosID_PROJETO: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_PROJETO'
                    Visible = False
                    Options.Editing = False
                    Width = 296
                  end
                  object viewProjetosNOME_PROJETO: TcxGridDBColumn
                    DataBinding.FieldName = 'NOME_PROJETO'
                    Options.Editing = False
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
                    MinWidth = 64
                    Options.Filtering = False
                    Options.ShowEditButtons = isebAlways
                    Options.GroupFooters = False
                    Options.Grouping = False
                    Options.HorzSizing = False
                    Options.Moving = False
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
                  GridView = viewProjetos
                end
              end
            end
            object tabDetailVinculo: TcxTabSheet
              Caption = 'Atividades v'#237'nculadas'
              ImageIndex = 2
              object pnBotoesDetailVinculo: TPanel
                Left = 0
                Top = 0
                Width = 965
                Height = 25
                Align = alTop
                TabOrder = 0
                object btnIncluirVinculo: TButton
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
                Height = 170
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 1
                LockedStateImageOptions.Effect = lsieDark
                LockedStateImageOptions.ShowText = True
                LockedStateImageOptions.Text = 'Pesquisando...'
                object viewDetailVinculo: TcxGridDBTableView
                  OnDblClick = viewRegistrosDetailDblClick
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
                  DataController.DataSource = dsAtividade_Vinculo
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
                  object viewDetailVinculoID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewDetailVinculoNOME_ATIVIDADE_ORIGEM: TcxGridDBColumn
                    DataBinding.FieldName = 'NOME_ATIVIDADE_ORIGEM'
                    Options.Editing = False
                    Width = 239
                  end
                  object viewDetailVinculoTIPO_VINCULO: TcxGridDBColumn
                    DataBinding.FieldName = 'TIPO_VINCULO'
                    RepositoryItem = dmLookup.repIcbTipoVinculo
                    Options.Editing = False
                    Width = 109
                  end
                  object viewDetailVinculoID_ATIVIDADE_VINCULO: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_ATIVIDADE_VINCULO'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewDetailVinculoID_ATIVIDADE_ORIGEM: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_ATIVIDADE_ORIGEM'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewDetailVinculoNOME_ATIVIDADE_VINCULO: TcxGridDBColumn
                    DataBinding.FieldName = 'NOME_ATIVIDADE_VINCULO'
                    Options.Editing = False
                  end
                  object cxGridDBColumn4: TcxGridDBColumn
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
                  object cxGridDBColumn5: TcxGridDBColumn
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
                object cxGridLevel2: TcxGridLevel
                  GridView = viewDetailVinculo
                end
              end
            end
            object tabDetailArquivo: TcxTabSheet
              Caption = 'Arquivos'
              ImageIndex = 3
              object Panel2: TPanel
                Left = 0
                Top = 0
                Width = 965
                Height = 25
                Align = alTop
                TabOrder = 0
                object Button3: TButton
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
                Height = 170
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 1
                LockedStateImageOptions.Effect = lsieDark
                LockedStateImageOptions.ShowText = True
                LockedStateImageOptions.Text = 'Pesquisando...'
                object cxGridDBTableView1: TcxGridDBTableView
                  OnDblClick = viewRegistrosDetailDblClick
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
                  DataController.DataSource = dsAtividade_Arquivo
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
                  object cxGridDBTableView1ID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object cxGridDBTableView1NOME: TcxGridDBColumn
                    DataBinding.FieldName = 'NOME'
                    Options.Editing = False
                    Width = 462
                  end
                  object cxGridDBTableView1DATA_UPLOAD: TcxGridDBColumn
                    DataBinding.FieldName = 'DATA_UPLOAD'
                    Options.Editing = False
                    Options.ShowEditButtons = isebNever
                  end
                  object ColumnDownload: TcxGridDBColumn
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
                  object cxGridDBColumn3: TcxGridDBColumn
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
                  object cxGridDBColumn8: TcxGridDBColumn
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
                  GridView = cxGridDBTableView1
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
        object Label4: TLabel
          Left = 5
          Top = 2
          Width = 27
          Height = 13
          Caption = 'Nome'
          FocusControl = EditNome
        end
        object Label5: TLabel
          Left = 430
          Top = 2
          Width = 66
          Height = 13
          Caption = 'Data de In'#237'cio'
          FocusControl = EditDataInicioAtividade
        end
        object Label6: TLabel
          Left = 519
          Top = 2
          Width = 79
          Height = 13
          Caption = 'Data de T'#233'rmino'
          FocusControl = EditDataTerminoAtividade
        end
        object Label7: TLabel
          Left = 7
          Top = 80
          Width = 49
          Height = 13
          Caption = 'Solicitante'
          FocusControl = cbSolicitante
        end
        object Label8: TLabel
          Left = 218
          Top = 80
          Width = 84
          Height = 13
          Caption = 'Respons'#225'vel (F2)'
          FocusControl = cbResponsavel
        end
        object Label9: TLabel
          Left = 428
          Top = 81
          Width = 31
          Height = 13
          Caption = 'Status'
          FocusControl = cbStatus
        end
        object Label10: TLabel
          Left = 6
          Top = 120
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object Label17: TLabel
          Left = 5
          Top = 40
          Width = 100
          Height = 13
          Caption = 'Projeto Principal (F2)'
          FocusControl = cbProjetoPrincipal
        end
        object lb1: TLabel
          Left = 254
          Top = 39
          Width = 104
          Height = 13
          Caption = #193'rea de Atua'#231#227'o (F2)'
          FocusControl = cbAreaAtuacao
        end
        object lb2: TLabel
          Left = 429
          Top = 39
          Width = 110
          Height = 13
          Caption = #193'rea de Execu'#231#227'o (F2)'
          FocusControl = cbAreaExecucao
        end
        object EditNome: TcxDBTextEdit
          Left = 4
          Top = 17
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 421
        end
        object EditDataInicioAtividade: TcxDBDateEdit
          Left = 428
          Top = 17
          DataBinding.DataField = 'DATA_INICIAL'
          DataBinding.DataSource = dsMaster
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 1
          Width = 84
        end
        object EditDataTerminoAtividade: TcxDBDateEdit
          Left = 517
          Top = 17
          DataBinding.DataField = 'DATA_FINAL'
          DataBinding.DataSource = dsMaster
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 2
          Width = 84
        end
        object cbSolicitante: TcxDBLookupComboBox
          Left = 4
          Top = 96
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_SOLICITANTE'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 9
          Width = 209
        end
        object cbResponsavel: TcxDBLookupComboBox
          Left = 216
          Top = 96
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_RESPONSAVEL'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 10
          OnKeyDown = cbResponsavelKeyDown
          Width = 187
        end
        object cbStatus: TcxDBImageComboBox
          Left = 427
          Top = 96
          RepositoryItem = dmPrincipal.repIcbStatusAtividade
          DataBinding.DataField = 'STATUS'
          DataBinding.DataSource = dsMaster
          Properties.Items = <>
          TabOrder = 11
          Width = 173
        end
        object EditDescricao: TcxDBMemo
          Left = 4
          Top = 135
          DataBinding.DataField = 'DESCRICAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 12
          Height = 89
          Width = 596
        end
        object cbProjetoPrincipal: TcxDBLookupComboBox
          Left = 4
          Top = 55
          RepositoryItem = dmLookup.repLcbProjeto
          DataBinding.DataField = 'ID_PROJETO'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          Properties.OnEditValueChanged = cbProjetoPrincipalPropertiesEditValueChanged
          TabOrder = 3
          OnKeyDown = cbProjetoPrincipalKeyDown
          Width = 210
        end
        object btnPesquisarProjeto: TButton
          Left = 218
          Top = 55
          Width = 21
          Height = 20
          Action = Ac_Pesquisar_Projeto
          Images = dmPrincipal.imgIcons_16
          TabOrder = 4
          TabStop = False
        end
        object cbAreaAtuacao: TcxDBLookupComboBox
          Left = 251
          Top = 55
          DataBinding.DataField = 'ID_AREA_ATUACAO'
          DataBinding.DataSource = dsMaster
          Properties.ClearKey = 46
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownSizeable = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NOME'
            end>
          Properties.ListOptions.SyncMode = True
          Properties.ListSource = dsLocal_Area_Atuacao
          Properties.OnEditValueChanged = cbAreaAtuacaoPropertiesEditValueChanged
          TabOrder = 5
          OnKeyDown = cbAreaAtuacaoKeyDown
          Width = 152
        end
        object btnAdicionarAreaAtuacao: TButton
          Left = 404
          Top = 55
          Width = 21
          Height = 21
          Action = Ac_Adicionar_Area_Atuacao
          Images = dmPrincipal.imgIcons_16
          TabOrder = 6
          TabStop = False
        end
        object btnAdicionarAreaExecucao: TButton
          Left = 580
          Top = 55
          Width = 21
          Height = 21
          Action = Ac_Adicionar_Area_Execucao
          Images = dmPrincipal.imgIcons_16
          TabOrder = 8
          TabStop = False
        end
        object cbAreaExecucao: TcxDBLookupComboBox
          Left = 427
          Top = 55
          RepositoryItem = dmLookup.repLcbArea_Execucao
          DataBinding.DataField = 'ID_AREA_EXECUCAO'
          DataBinding.DataSource = dsMaster
          Properties.ClearKey = 46
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownSizeable = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NOME'
            end>
          Properties.ListSource = dsLocal_Area_Execucao
          TabOrder = 7
          OnKeyDown = cbAreaExecucaoKeyDown
          Width = 152
        end
        object btnPesquisar_Pessoa_Responsavel: TButton
          Left = 404
          Top = 96
          Width = 22
          Height = 21
          Action = Ac_Pesquisar_Responsavel
          Images = dmPrincipal.imgIcons_16
          TabOrder = 13
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnEditsCadastroDetail: TPanel
        object Label11: TLabel
          Left = 5
          Top = 43
          Width = 35
          Height = 13
          Caption = 'Fun'#231#227'o'
          FocusControl = EditFuncaoPessoa
        end
        object Label12: TLabel
          Left = 5
          Top = 3
          Width = 106
          Height = 13
          Caption = 'Pessoa envolvida (F2)'
          FocusControl = cbPessoaEnvolvida
        end
        object EditFuncaoPessoa: TcxDBTextEdit
          Left = 4
          Top = 59
          DataBinding.DataField = 'FUNCAO'
          DataBinding.DataSource = dsDetail
          TabOrder = 2
          Width = 209
        end
        object cbPessoaEnvolvida: TcxDBLookupComboBox
          Left = 4
          Top = 19
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_PESSOA'
          DataBinding.DataSource = dsDetail
          Properties.ListColumns = <>
          TabOrder = 0
          OnKeyDown = cbPessoaEnvolvidaKeyDown
          Width = 209
        end
        object btnPesquisarPessoa: TButton
          Left = 216
          Top = 19
          Width = 22
          Height = 21
          Action = Ac_Pesquisar_Pessoa_Envolvida
          Images = dmPrincipal.imgIcons_16
          TabOrder = 1
        end
      end
    end
    object tabCadastroDetailProjeto: TcxTabSheet
      Caption = 'tabCadastroDetailProjeto'
      ImageIndex = 3
      object pnCadastroDetailProjeto: TPanel
        Left = 0
        Top = 0
        Width = 976
        Height = 50
        Align = alTop
        TabOrder = 0
        object btnSalvarProjeto: TButton
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
        object btnCancelarProjeto: TButton
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
        object btnSalvarIncluirProjeto: TButton
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
      object pnCadastroProjeto: TPanel
        Left = 0
        Top = 50
        Width = 976
        Height = 398
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label13: TLabel
          Left = 6
          Top = 3
          Width = 58
          Height = 13
          Caption = 'Projeto (F2)'
          FocusControl = cbProjeto
        end
        object Label14: TLabel
          Left = 5
          Top = 43
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
        end
        object cbProjeto: TcxDBLookupComboBox
          Left = 4
          Top = 19
          RepositoryItem = dmLookup.repLcbProjeto
          DataBinding.DataField = 'ID_PROJETO'
          DataBinding.DataSource = dsAtividade_Projeto
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 209
        end
        object EditObsAtividadeProjeto: TcxDBMemo
          Left = 4
          Top = 59
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsAtividade_Projeto
          TabOrder = 2
          Height = 89
          Width = 596
        end
        object Button1: TButton
          Left = 216
          Top = 19
          Width = 22
          Height = 21
          Action = Ac_Pesquisar_Detail_Projeto
          Images = dmPrincipal.imgIcons_16
          TabOrder = 1
          TabStop = False
        end
      end
    end
    object tabCadastroDetailVinculo: TcxTabSheet
      Caption = 'tabCadastroDetailVinculo'
      ImageIndex = 4
      object pnCadastroVinculo: TPanel
        Left = 0
        Top = 50
        Width = 976
        Height = 398
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label15: TLabel
          Left = 6
          Top = 3
          Width = 71
          Height = 13
          Caption = 'Tipo de V'#237'nculo'
          FocusControl = cbTipoVinculo
        end
        object Label18: TLabel
          Left = 214
          Top = 4
          Width = 68
          Height = 13
          Caption = 'Atividade (F2)'
          FocusControl = cbAtividadeVinculo
        end
        object Label16: TLabel
          Left = 5
          Top = 43
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
        end
        object cbTipoVinculo: TcxDBImageComboBox
          Left = 5
          Top = 20
          RepositoryItem = dmLookup.repIcbTipoVinculo
          DataBinding.DataField = 'TIPO_VINCULO'
          DataBinding.DataSource = dsAtividade_Vinculo
          Properties.Items = <>
          TabOrder = 0
          Width = 204
        end
        object cbAtividadeVinculo: TcxDBLookupComboBox
          Left = 212
          Top = 20
          RepositoryItem = dmLookup.repLcbAtividade
          DataBinding.DataField = 'ID_ATIVIDADE_VINCULO'
          DataBinding.DataSource = dsAtividade_Vinculo
          Properties.ListColumns = <>
          TabOrder = 1
          OnKeyDown = cbAtividadeVinculoKeyDown
          Width = 209
        end
        object btnPesquisarAtividade: TButton
          Left = 422
          Top = 20
          Width = 22
          Height = 21
          Action = Ac_Pesquisar_Atividade
          Images = dmPrincipal.imgIcons_16
          TabOrder = 2
          TabStop = False
        end
        object EditObservacaoVinculo: TcxDBMemo
          Left = 4
          Top = 59
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsAtividade_Vinculo
          TabOrder = 3
          Height = 89
          Width = 596
        end
      end
      object pnCadastroDetailVinculo: TPanel
        Left = 0
        Top = 0
        Width = 976
        Height = 50
        Align = alTop
        TabOrder = 0
        object btnSalvarAtividadeVinculo: TButton
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
        object btnSalvarIncluirAtividadeVinculo: TButton
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
        object btnactCnPrefixWizard2: TButton
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
    object tabCadastroDetailArquivo: TcxTabSheet
      Caption = 'tabCadastroDetailArquivo'
      ImageIndex = 5
      object pnCadastroDetailArquivo: TPanel
        Left = 0
        Top = 0
        Width = 976
        Height = 50
        Align = alTop
        TabOrder = 0
        object btnSalvarArquivo: TButton
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
        object btnCancelarArquivo: TButton
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
        object btnSalvarIncluirArquivo: TButton
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
      object pnCadastroArquivo: TPanel
        Left = 0
        Top = 50
        Width = 976
        Height = 398
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label19: TLabel
          Left = 5
          Top = 6
          Width = 82
          Height = 13
          Caption = 'Nome do Arquivo'
          FocusControl = EditNomeArquivo
        end
        object Label20: TLabel
          Left = 5
          Top = 49
          Width = 114
          Height = 13
          Caption = 'Caminho para o arquivo'
          FocusControl = EditNomeArquivo
        end
        object Label21: TLabel
          Left = 6
          Top = 92
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object EditNomeArquivo: TcxDBTextEdit
          Left = 4
          Top = 22
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsAtividade_Arquivo
          TabOrder = 0
          Width = 317
        end
        object EditCaminhoArquivo: TcxButtonEdit
          Left = 5
          Top = 65
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
        object EditDescricaoArquivo: TcxDBMemo
          Left = 5
          Top = 107
          DataBinding.DataField = 'DESCRICAO'
          DataBinding.DataSource = dsAtividade_Arquivo
          TabOrder = 2
          Height = 89
          Width = 596
        end
      end
    end
    object tabCadastroDetailComentario: TcxTabSheet
      Caption = 'tabCadastroDetailComentario'
      ImageIndex = 6
      object pnCadastroDetailComentario: TPanel
        Left = 0
        Top = 0
        Width = 976
        Height = 50
        Align = alTop
        TabOrder = 0
        object btnSalvarComentario: TButton
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
        object btnCancelarComentario: TButton
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
        object btnSalvarIncluirComentario: TButton
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
      object pnCadastroComentario: TPanel
        Left = 0
        Top = 50
        Width = 976
        Height = 398
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label22: TLabel
          Left = 5
          Top = 3
          Width = 55
          Height = 13
          Caption = 'Coment'#225'rio'
          FocusControl = EditComentario
        end
        object EditComentario: TcxDBMemo
          Left = 4
          Top = 19
          DataBinding.DataField = 'COMENTARIO'
          DataBinding.DataSource = dsAtividade_Comentario
          TabOrder = 0
          Height = 89
          Width = 596
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 16
    Top = 16
    object Ac_Pesquisar_Projeto: TAction [13]
      Category = 'Master'
      ImageIndex = 0
      OnExecute = Ac_Pesquisar_ProjetoExecute
    end
    object Ac_CarregarArquivo: TAction [14]
      Category = 'Detail'
      ImageIndex = 0
      OnExecute = Ac_CarregarArquivoExecute
    end
    object Ac_Pesquisar_Detail_Projeto: TAction
      Category = 'Detail'
      ImageIndex = 0
      OnExecute = Ac_Pesquisar_Detail_ProjetoExecute
    end
    object Ac_Pesquisar_Atividade: TAction
      Category = 'Detail'
      ImageIndex = 0
      OnExecute = Ac_Pesquisar_AtividadeExecute
    end
    object Ac_Download: TAction
      Caption = 'Baixar'
      ImageIndex = 8
      OnExecute = Ac_DownloadExecute
    end
    object Ac_Pesquisar_Pessoa_Envolvida: TAction
      Category = 'Detail'
      ImageIndex = 0
      OnExecute = Ac_Pesquisar_Pessoa_EnvolvidaExecute
    end
    object Ac_Adicionar_Area_Atuacao: TAction
      Category = 'Master'
      ImageIndex = 3
      OnExecute = Ac_Adicionar_Area_AtuacaoExecute
    end
    object Ac_Adicionar_Area_Execucao: TAction
      Category = 'Master'
      ImageIndex = 3
      OnExecute = Ac_Adicionar_Area_ExecucaoExecute
    end
    object Ac_Imprimir_OS: TAction
      Category = 'Master'
      ImageIndex = 19
      OnExecute = Ac_Imprimir_OSExecute
    end
    object Ac_Pesquisar_Responsavel: TAction
      Category = 'Master'
      ImageIndex = 0
      OnExecute = Ac_Pesquisar_ResponsavelExecute
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmAdministrativo.cdsAtividade
    Left = 312
    Top = 124
  end
  inherited dsDetail: TDataSource
    DataSet = dmAdministrativo.cdsAtividade_Pessoa
    Left = 164
    Top = 124
  end
  inherited fdExportDialog: TSaveTextFileDialog
    Left = 312
    Top = 232
  end
  object dsAtividade_Projeto: TDataSource
    DataSet = dmAdministrativo.cdsAtividade_Projeto
    Left = 16
    Top = 124
  end
  object dsAtividade_Vinculo: TDataSource
    DataSet = dmAdministrativo.cdsAtividade_Vinculo
    Left = 460
    Top = 124
  end
  object dsAtividade_Arquivo: TDataSource
    DataSet = dmAdministrativo.cdsAtividade_Arquivo
    Left = 904
    Top = 16
  end
  object dsAtividade_Comentario: TDataSource
    DataSet = dmAdministrativo.cdsAtividade_Comentario
    Left = 460
    Top = 16
  end
  object SaveDialogDocumento: TSaveDialog
    Left = 164
    Top = 232
  end
  object FileDialog: TOpenTextFileDialog
    Left = 608
    Top = 124
  end
  object cdsLocal_Area_Atuacao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 164
    Top = 16
    object cdsLocal_Area_AtuacaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
    end
    object cdsLocal_Area_AtuacaoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object cdsLocal_Area_Execucao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 16
    object cdsLocal_Area_ExecucaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
    end
    object cdsLocal_Area_ExecucaoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsLocal_Area_ExecucaoID_AREA_ATUACAO: TIntegerField
      FieldName = 'ID_AREA_ATUACAO'
      ProviderFlags = []
    end
  end
  object dsLocal_Area_Atuacao: TDataSource
    DataSet = cdsLocal_Area_Atuacao
    Left = 756
    Top = 16
  end
  object dsLocal_Area_Execucao: TDataSource
    DataSet = cdsLocal_Area_Execucao
    Left = 608
    Top = 16
  end
  object ppOrdemServico: TppReport
    AutoStop = False
    DataPipeline = DBPipeAtividade
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utScreenPixels
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPageWidth
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 16
    Top = 232
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'DBPipeAtividade'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 26194
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 13
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 5027
        mmLeft = 45508
        mmTop = 4763
        mmWidth = 99749
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'CNPJ'
        DataPipeline = DBPipeOrganizacao
        DisplayFormat = '000\.000\.0000\/00-00;0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 3969
        mmLeft = 66940
        mmTop = 13758
        mmWidth = 29369
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        Caption = 'CNPJ:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 56092
        mmTop = 13493
        mmWidth = 10054
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        Caption = 'Insc. Est.: Isento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 105040
        mmTop = 13758
        mmWidth = 24342
        BandType = 0
        LayerName = Foreground
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Border.Color = clBlue
        Pen.Color = 10485760
        Pen.Width = 3
        Weight = 2.000000000000000000
        mmHeight = 1323
        mmLeft = 13229
        mmTop = 23283
        mmWidth = 163513
        BandType = 0
        LayerName = Foreground
      end
      object ppDBImage2: TppDBImage
        DesignLayer = ppDesignLayer1
        UserName = 'DBImage2'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'LOGO_SECUNDARIA'
        DataPipeline = DBPipeOrganizacao
        GraphicType = 'AutoDetect'
        ParentDataPipeline = False
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 19579
        mmLeft = 151342
        mmTop = 2646
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground
      end
      object ppDBImage1: TppDBImage
        DesignLayer = ppDesignLayer1
        UserName = 'DBImage1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'LOGO'
        DataPipeline = DBPipeOrganizacao
        GraphicType = 'AutoDetect'
        ParentDataPipeline = False
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 19579
        mmLeft = 13179
        mmTop = 2556
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 235480
      mmPrintPosition = 0
      object ppRegion1: TppRegion
        DesignLayer = ppDesignLayer1
        UserName = 'Region1'
        Brush.Style = bsClear
        Stretch = True
        Transparent = True
        mmHeight = 233315
        mmLeft = 0
        mmTop = 0
        mmWidth = 196321
        BandType = 4
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppLabel4: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label4'
          Caption = 'Projeto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 2510
          mmTop = 12964
          mmWidth = 11906
          BandType = 4
          LayerName = Foreground
        end
        object ppDBText3: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'ppEditCliente'
          DataField = 'NOME_PROJETO'
          DataPipeline = DBPipeAtividade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'DBPipeAtividade'
          mmHeight = 4233
          mmLeft = 14991
          mmTop = 12964
          mmWidth = 45941
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel8: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label8'
          Caption = 'Ordem de Servi'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold, fsUnderline]
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 1443
          mmTop = 2425
          mmWidth = 194349
          BandType = 4
          LayerName = Foreground
        end
        object ppDBText4: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'ppEditCliente1'
          DataField = 'AREA_ATUACAO'
          DataPipeline = DBPipeAtividade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'DBPipeAtividade'
          mmHeight = 4233
          mmLeft = 89716
          mmTop = 12964
          mmWidth = 33193
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel1: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label1'
          Caption = #193'rea de Atua'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 62200
          mmTop = 12964
          mmWidth = 26723
          BandType = 4
          LayerName = Foreground
        end
        object ppDBText18: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'ppEditCliente2'
          DataField = 'AREA_EXECUCAO'
          DataPipeline = DBPipeAtividade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'DBPipeAtividade'
          mmHeight = 4233
          mmLeft = 154527
          mmTop = 12964
          mmWidth = 40169
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel5: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label7'
          Caption = 'Local de Execu'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 123571
          mmTop = 12964
          mmWidth = 30427
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel9: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label9'
          Caption = 'Solicitante:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 5027
          mmLeft = 2383
          mmTop = 24386
          mmWidth = 22754
          BandType = 4
          LayerName = Foreground
        end
        object ppDBText19: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'ppEditCliente3'
          DataField = 'NOME_SOLICITANTE'
          DataPipeline = DBPipeAtividade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'DBPipeAtividade'
          mmHeight = 4233
          mmLeft = 26195
          mmTop = 24387
          mmWidth = 144992
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel10: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label10'
          Caption = 'Respons'#225'vel:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 5027
          mmLeft = 2383
          mmTop = 30208
          mmWidth = 28046
          BandType = 4
          LayerName = Foreground
        end
        object ppDBText20: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'DBText20'
          DataField = 'NOME_RESPONSAVEL'
          DataPipeline = DBPipeAtividade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'DBPipeAtividade'
          mmHeight = 4233
          mmLeft = 31224
          mmTop = 30209
          mmWidth = 139965
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel11: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label11'
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 89209
          mmTop = 47096
          mmWidth = 20373
          BandType = 4
          LayerName = Foreground
        end
        object ppDBMemo1: TppDBMemo
          DesignLayer = ppDesignLayer1
          UserName = 'DBMemo1'
          CharWrap = False
          DataField = 'DESCRICAO'
          DataPipeline = DBPipeAtividade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          RemoveEmptyLines = False
          Transparent = True
          DataPipelineName = 'DBPipeAtividade'
          mmHeight = 135178
          mmLeft = 2379
          mmTop = 52797
          mmWidth = 189710
          BandType = 4
          LayerName = Foreground
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          mmLeading = 0
        end
        object ppDBText12: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'DBText12'
          DataField = 'NOME_SOLICITANTE'
          DataPipeline = DBPipeAtividade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'DBPipeAtividade'
          mmHeight = 4233
          mmLeft = 10583
          mmTop = 195971
          mmWidth = 46831
          BandType = 4
          LayerName = Foreground
        end
        object ppLine2: TppLine
          DesignLayer = ppDesignLayer1
          UserName = 'Line2'
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 3969
          mmTop = 194645
          mmWidth = 62971
          BandType = 4
          LayerName = Foreground
        end
        object ppDBText13: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'DBText3'
          DataField = 'NOME_RESPONSAVEL'
          DataPipeline = DBPipeAtividade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'DBPipeAtividade'
          mmHeight = 4233
          mmLeft = 10583
          mmTop = 209225
          mmWidth = 46831
          BandType = 4
          LayerName = Foreground
        end
        object ppLine3: TppLine
          DesignLayer = ppDesignLayer1
          UserName = 'Line3'
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 3969
          mmTop = 208562
          mmWidth = 62971
          BandType = 4
          LayerName = Foreground
        end
        object ppSystemVariable1: TppSystemVariable
          DesignLayer = ppDesignLayer1
          UserName = 'SystemVariable1'
          DisplayFormat = '"Mineiros," dd "de" MMMM "de" YYYY.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 137054
          mmTop = 225014
          mmWidth = 43921
          BandType = 4
          LayerName = Foreground
        end
        object ppLabel12: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label12'
          Caption = 'Data de Entrega do Servi'#231'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          FormField = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 97102
          mmTop = 214960
          mmWidth = 42863
          BandType = 4
          LayerName = Foreground
        end
        object ppDBText14: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'DBText201'
          DataField = 'NOME'
          DataPipeline = DBPipeAtividade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'DBPipeAtividade'
          mmHeight = 4233
          mmLeft = 2381
          mmTop = 41215
          mmWidth = 190500
          BandType = 4
          LayerName = Foreground
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13228
      mmPrintPosition = 0
      object ppShape1: TppShape
        DesignLayer = ppDesignLayer1
        UserName = 'Shape1'
        mmHeight = 12700
        mmLeft = 13229
        mmTop = 265
        mmWidth = 163513
        BandType = 8
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        DataField = 'ENDERECO'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 21960
        mmTop = 1583
        mmWidth = 42069
        BandType = 8
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText6'
        DataField = 'BAIRRO'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 64822
        mmTop = 1583
        mmWidth = 29369
        BandType = 8
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText7'
        DataField = 'COMPLEMENTO'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 94456
        mmTop = 1584
        mmWidth = 46831
        BandType = 8
        LayerName = Foreground
      end
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText8'
        DataField = 'CIDADE'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 142350
        mmTop = 1583
        mmWidth = 24077
        BandType = 8
        LayerName = Foreground
      end
      object ppDBText9: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText9'
        HyperlinkEnabled = False
        DataField = 'SITE'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 29898
        mmTop = 6611
        mmWidth = 32015
        BandType = 8
        LayerName = Foreground
      end
      object ppDBText10: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText10'
        HyperlinkEnabled = False
        DataField = 'EMAIL'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 63500
        mmTop = 6615
        mmWidth = 42069
        BandType = 8
        LayerName = Foreground
      end
      object ppDBText11: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText101'
        HyperlinkEnabled = False
        DataField = 'TELEFONE'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 124617
        mmTop = 6615
        mmWidth = 23548
        BandType = 8
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label6'
        Caption = 'Fone (Fax):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 106363
        mmTop = 6615
        mmWidth = 17727
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object DBPipeAtividade: TppDBPipeline
    DataSource = dsMaster
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DBPipeAtividade'
    Left = 904
    Top = 124
    object DBPipeAtividadeppField1: TppField
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DBPipeAtividadeppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DBPipeAtividadeppField3: TppField
      FieldAlias = 'ID_SOLICITANTE'
      FieldName = 'ID_SOLICITANTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DBPipeAtividadeppField4: TppField
      FieldAlias = 'ID_RESPONSAVEL'
      FieldName = 'ID_RESPONSAVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DBPipeAtividadeppField5: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DBPipeAtividadeppField6: TppField
      FieldAlias = 'DATA_INICIAL'
      FieldName = 'DATA_INICIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object DBPipeAtividadeppField7: TppField
      FieldAlias = 'DATA_FINAL'
      FieldName = 'DATA_FINAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object DBPipeAtividadeppField8: TppField
      FieldAlias = 'ID_PROJETO'
      FieldName = 'ID_PROJETO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object DBPipeAtividadeppField9: TppField
      FieldAlias = 'NOME_PROJETO'
      FieldName = 'NOME_PROJETO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object DBPipeAtividadeppField10: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object DBPipeAtividadeppField11: TppField
      FieldAlias = 'DATA_CADASTRO'
      FieldName = 'DATA_CADASTRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object DBPipeAtividadeppField12: TppField
      FieldAlias = 'DATA_ALTERACAO'
      FieldName = 'DATA_ALTERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object DBPipeAtividadeppField13: TppField
      FieldAlias = 'DATA_FINALIZACAO'
      FieldName = 'DATA_FINALIZACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object DBPipeAtividadeppField14: TppField
      FieldAlias = 'ID_AREA_ATUACAO'
      FieldName = 'ID_AREA_ATUACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object DBPipeAtividadeppField15: TppField
      FieldAlias = 'ID_AREA_EXECUCAO'
      FieldName = 'ID_AREA_EXECUCAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object DBPipeAtividadeppField16: TppField
      FieldAlias = 'AREA_ATUACAO'
      FieldName = 'AREA_ATUACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object DBPipeAtividadeppField17: TppField
      FieldAlias = 'AREA_EXECUCAO'
      FieldName = 'AREA_EXECUCAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object DBPipeAtividadeppField18: TppField
      FieldAlias = 'NOME_SOLICITANTE'
      FieldName = 'NOME_SOLICITANTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object DBPipeAtividadeppField19: TppField
      FieldAlias = 'NOME_RESPONSAVEL'
      FieldName = 'NOME_RESPONSAVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
  end
  object DBPipeOrganizacao: TppDBPipeline
    DataSource = dmLookup.dslkOrganizacao
    UserName = 'DBPipeOrganizacao'
    Left = 756
    Top = 124
    object DBPipeOrganizacaoppField1: TppField
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DBPipeOrganizacaoppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DBPipeOrganizacaoppField3: TppField
      FieldAlias = 'CNPJ'
      FieldName = 'CNPJ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DBPipeOrganizacaoppField4: TppField
      FieldAlias = 'LOGO'
      FieldName = 'LOGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DBPipeOrganizacaoppField5: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DBPipeOrganizacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object DBPipeOrganizacaoppField7: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object DBPipeOrganizacaoppField8: TppField
      FieldAlias = 'TELEFONE'
      FieldName = 'TELEFONE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object DBPipeOrganizacaoppField9: TppField
      FieldAlias = 'SITE'
      FieldName = 'SITE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object DBPipeOrganizacaoppField10: TppField
      FieldAlias = 'EMAIL'
      FieldName = 'EMAIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object DBPipeOrganizacaoppField11: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object DBPipeOrganizacaoppField12: TppField
      FieldAlias = 'LOGO_SECUNDARIA'
      FieldName = 'LOGO_SECUNDARIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
  end
end
