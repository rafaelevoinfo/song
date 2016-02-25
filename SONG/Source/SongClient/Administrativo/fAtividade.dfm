inherited frmAtividade: TfrmAtividade
  ActiveControl = nil
  Caption = 'Atividades'
  ExplicitWidth = 1000
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
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
            TabOrder = 2
            ExplicitLeft = 389
            ExplicitTop = 4
          end
          inherited pnData: TPanel [3]
            Left = 265
            Width = 153
            TabOrder = 0
            ExplicitLeft = 265
            ExplicitWidth = 153
            inherited EditDataInicial: TcxDateEdit
              ExplicitWidth = 130
              Width = 130
            end
            inherited EditDataFinal: TcxDateEdit
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
                Description = 'C'#243'digo'
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
            TabOrder = 1
            ExplicitLeft = 422
          end
          object cbProjetos: TcxCheckComboBox
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
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
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
            object viewRegistrosID_SOLICITANTE: TcxGridDBColumn [2]
              DataBinding.FieldName = 'ID_SOLICITANTE'
              RepositoryItem = dmLookup.repLcbPessoa
              Options.Editing = False
              Options.ShowEditButtons = isebNever
              Width = 131
            end
            object viewRegistrosID_RESPONSAVEL: TcxGridDBColumn [3]
              DataBinding.FieldName = 'ID_RESPONSAVEL'
              RepositoryItem = dmLookup.repLcbPessoa
              Options.Editing = False
              Options.ShowEditButtons = isebNever
              Width = 157
            end
            object viewRegistrosSTATUS: TcxGridDBColumn [4]
              DataBinding.FieldName = 'STATUS'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <>
              Properties.OnEditValueChanged = viewRegistrosSTATUSPropertiesEditValueChanged
              RepositoryItem = dmLookup.repIcbStatusAtividade
              Width = 129
            end
            object viewRegistrosDATA_INICIAL: TcxGridDBColumn [5]
              DataBinding.FieldName = 'DATA_INICIAL'
              Options.Editing = False
              Options.ShowEditButtons = isebNever
              Width = 63
            end
            object viewRegistrosDATA_FINAL: TcxGridDBColumn [6]
              DataBinding.FieldName = 'DATA_FINAL'
              Options.Editing = False
              Options.ShowEditButtons = isebNever
              Width = 55
            end
            object viewRegistrosNOTIFICAR_ENVOLVIDOS: TcxGridDBColumn [7]
              DataBinding.FieldName = 'NOTIFICAR_ENVOLVIDOS'
              Visible = False
              Options.Editing = False
            end
          end
        end
        inherited cxSplitter1: TcxSplitter
          ExplicitWidth = 974
        end
        inherited pnDetail: TPanel
          ExplicitWidth = 974
          inherited pcDetails: TcxPageControl
            Properties.ActivePage = tabDetailComentario
            OnChange = pcDetailsChange
            ExplicitWidth = 972
            inherited tabDetail: TcxTabSheet
              Caption = 'Pessoas envolvidas'
              ExplicitLeft = 2
              ExplicitTop = 25
              ExplicitWidth = 965
              ExplicitHeight = 156
              inherited pnBotoesDetail: TPanel
                Width = 965
                ExplicitWidth = 965
              end
              inherited cxGridRegistrosDetail: TcxGrid
                Width = 965
                ExplicitWidth = 965
                inherited viewRegistrosDetail: TcxGridDBTableView
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                  end
                  object viewRegistrosDetailID_PESSOA: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'ID_PESSOA'
                    RepositoryItem = dmLookup.repLcbPessoa
                    Width = 336
                  end
                  object viewRegistrosDetailFUNCAO: TcxGridDBColumn [2]
                    DataBinding.FieldName = 'FUNCAO'
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
                ExplicitTop = 8
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
                Height = 131
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 1
                LockedStateImageOptions.Effect = lsieDark
                LockedStateImageOptions.ShowText = True
                LockedStateImageOptions.Text = 'Pesquisando...'
                object viewProjetos: TcxGridDBTableView
                  OnDblClick = viewRegistrosDetailDblClick
                  Navigator.Buttons.CustomButtons = <>
                  DataController.DataSource = dsAtividade_Projeto
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
                  object viewProjetosID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                  end
                  object viewProjetosID_PROJETO: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_PROJETO'
                    Width = 296
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
                ExplicitTop = 8
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
                Height = 131
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 1
                LockedStateImageOptions.Effect = lsieDark
                LockedStateImageOptions.ShowText = True
                LockedStateImageOptions.Text = 'Pesquisando...'
                object viewDetailVinculo: TcxGridDBTableView
                  OnDblClick = viewRegistrosDetailDblClick
                  Navigator.Buttons.CustomButtons = <>
                  DataController.DataSource = dsAtividade_Vinculo
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
                  object viewDetailVinculoID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                  end
                  object viewDetailVinculoTIPO_VINCULO: TcxGridDBColumn
                    DataBinding.FieldName = 'TIPO_VINCULO'
                    RepositoryItem = dmLookup.repIcbTipoVinculo
                    Width = 76
                  end
                  object viewDetailVinculoID_ATIVIDADE_ORIGEM: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_ATIVIDADE_ORIGEM'
                    Width = 114
                  end
                  object viewDetailVinculoID_ATIVIDADE_ALVO: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_ATIVIDADE_ALVO'
                    Width = 110
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
                ExplicitTop = 8
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
                Height = 131
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 1
                LockedStateImageOptions.Effect = lsieDark
                LockedStateImageOptions.ShowText = True
                LockedStateImageOptions.Text = 'Pesquisando...'
                object cxGridDBTableView1: TcxGridDBTableView
                  OnDblClick = viewRegistrosDetailDblClick
                  Navigator.Buttons.CustomButtons = <>
                  DataController.DataSource = dsAtividade_Arquivo
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
                  object cxGridDBTableView1ID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                  end
                  object cxGridDBTableView1NOME: TcxGridDBColumn
                    DataBinding.FieldName = 'NOME'
                    Width = 462
                  end
                  object cxGridDBTableView1DATA_UPLOAD: TcxGridDBColumn
                    DataBinding.FieldName = 'DATA_UPLOAD'
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
            object tabDetailComentario: TcxTabSheet
              Caption = 'Coment'#225'rios'
              ImageIndex = 4
              object Panel3: TPanel
                Left = 0
                Top = 0
                Width = 965
                Height = 25
                Align = alTop
                TabOrder = 0
                ExplicitTop = 8
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
                Height = 131
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 1
                LockedStateImageOptions.Effect = lsieDark
                LockedStateImageOptions.ShowText = True
                LockedStateImageOptions.Text = 'Pesquisando...'
                object viewDetailComentario: TcxGridDBTableView
                  OnDblClick = viewRegistrosDetailDblClick
                  Navigator.Buttons.CustomButtons = <>
                  DataController.DataSource = dsAtividade_Comentario
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
                  object viewDetailComentarioID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                  end
                  object viewDetailComentarioID_PESSOA: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_PESSOA'
                    Width = 252
                  end
                  object viewDetailComentarioCOMENTARIO: TcxGridDBColumn
                    DataBinding.FieldName = 'COMENTARIO'
                    Width = 358
                  end
                  object viewDetailComentarioDATA_HORA: TcxGridDBColumn
                    DataBinding.FieldName = 'DATA_HORA'
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
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      ExplicitWidth = 976
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
          FocusControl = EditDataInicio
        end
        object Label6: TLabel
          Left = 519
          Top = 2
          Width = 79
          Height = 13
          Caption = 'Data de T'#233'rmino'
          FocusControl = EditDataTermino
        end
        object Label7: TLabel
          Left = 6
          Top = 80
          Width = 49
          Height = 13
          Caption = 'Solicitante'
          FocusControl = cbSolicitante
        end
        object Label8: TLabel
          Left = 216
          Top = 80
          Width = 61
          Height = 13
          Caption = 'Respons'#225'vel'
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
          Left = 5
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
        object EditNome: TcxDBTextEdit
          Left = 4
          Top = 17
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 421
        end
        object EditDataInicio: TcxDBDateEdit
          Left = 428
          Top = 17
          DataBinding.DataField = 'DATA_INICIAL'
          DataBinding.DataSource = dsMaster
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 1
          Width = 84
        end
        object EditDataTermino: TcxDBDateEdit
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
          Left = 5
          Top = 96
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_SOLICITANTE'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 4
          Width = 209
        end
        object cbResponsavel: TcxDBLookupComboBox
          Left = 216
          Top = 96
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_RESPONSAVEL'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 5
          Width = 209
        end
        object cbStatus: TcxDBImageComboBox
          Left = 427
          Top = 96
          RepositoryItem = dmLookup.repIcbStatusAtividade
          DataBinding.DataField = 'STATUS'
          DataBinding.DataSource = dsMaster
          Properties.Items = <>
          TabOrder = 6
          Width = 173
        end
        object chkNotificarEnvolvidos: TcxDBCheckBox
          Left = 5
          Top = 230
          Caption = 
            'Notificar pessoas envolvidas quando houver altera'#231#245'es na ativida' +
            'de'
          DataBinding.DataField = 'NOTIFICAR_ENVOLVIDOS'
          DataBinding.DataSource = dsMaster
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          TabOrder = 8
          Width = 594
        end
        object EditDescricao: TcxDBMemo
          Left = 4
          Top = 135
          DataBinding.DataField = 'DESCRICAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 7
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
          TabOrder = 3
          Width = 420
        end
        object btnPesquisarProjeto: TButton
          Left = 430
          Top = 55
          Width = 21
          Height = 20
          Action = Ac_Pesquisar_Projeto
          Images = dmPrincipal.imgIcons_16
          TabOrder = 9
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnBotoesCadastroDetail: TPanel
        Width = 976
        TabOrder = 0
        ExplicitWidth = 976
      end
      inherited pnEditsCadastroDetail: TPanel
        Width = 976
        TabOrder = 1
        ExplicitWidth = 976
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
          Width = 83
          Height = 13
          Caption = 'Pessoa envolvida'
          FocusControl = cbPessoaEnvolvida
        end
        object EditFuncaoPessoa: TcxDBTextEdit
          Left = 4
          Top = 59
          DataBinding.DataField = 'FUNCAO'
          DataBinding.DataSource = dsDetail
          TabOrder = 1
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
          Width = 209
        end
      end
    end
    object tabCadastroDetailProjeto: TcxTabSheet
      Caption = 'tabCadastroDetailProjeto'
      ImageIndex = 3
      ExplicitLeft = -100
      ExplicitTop = -48
      object Label13: TLabel
        Left = 5
        Top = 59
        Width = 58
        Height = 13
        Caption = 'Projeto (F2)'
        FocusControl = cbProjeto
      end
      object Label14: TLabel
        Left = 4
        Top = 99
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object pnCadastroDetailProjeto: TPanel
        Left = 0
        Top = 0
        Width = 976
        Height = 50
        Align = alTop
        TabOrder = 0
        ExplicitTop = 8
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
      object cbProjeto: TcxDBLookupComboBox
        Left = 3
        Top = 75
        RepositoryItem = dmLookup.repLcbProjeto
        DataBinding.DataField = 'ID_PROJETO'
        DataBinding.DataSource = dsAtividade_Projeto
        Properties.ListColumns = <>
        TabOrder = 1
        Width = 209
      end
      object EditObsAtividadeProjeto: TcxDBMemo
        Left = 3
        Top = 115
        DataBinding.DataField = 'OBSERVACAO'
        DataBinding.DataSource = dsAtividade_Projeto
        TabOrder = 2
        Height = 89
        Width = 596
      end
      object Button1: TButton
        Left = 215
        Top = 75
        Width = 22
        Height = 21
        Action = Ac_Pesquisar_Projeto
        Images = dmPrincipal.imgIcons_16
        TabOrder = 3
      end
    end
    object tabCadastroDetailVinculo: TcxTabSheet
      Caption = 'tabCadastroDetailVinculo'
      ImageIndex = 4
      object Label15: TLabel
        Left = 6
        Top = 51
        Width = 71
        Height = 13
        Caption = 'Tipo de V'#237'nculo'
        FocusControl = cbTipoVinculo
      end
      object Label16: TLabel
        Left = 5
        Top = 91
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object Label18: TLabel
        Left = 214
        Top = 52
        Width = 68
        Height = 13
        Caption = 'Atividade (F2)'
        FocusControl = cbAtividadeVinculo
      end
      object pnCadastroDetailVinculo: TPanel
        Left = 0
        Top = 0
        Width = 976
        Height = 50
        Align = alTop
        TabOrder = 0
        ExplicitTop = 8
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
      object EditObservacaoVinculo: TcxDBMemo
        Left = 4
        Top = 107
        DataBinding.DataField = 'OBSERVACAO'
        DataBinding.DataSource = dsAtividade_Vinculo
        TabOrder = 2
        Height = 89
        Width = 596
      end
      object cbTipoVinculo: TcxDBImageComboBox
        Left = 5
        Top = 68
        RepositoryItem = dmLookup.repIcbTipoVinculo
        DataBinding.DataField = 'TIPO_VINCULO'
        DataBinding.DataSource = dsAtividade_Vinculo
        Properties.Items = <>
        TabOrder = 1
        Width = 204
      end
      object cbAtividadeVinculo: TcxDBLookupComboBox
        Left = 212
        Top = 68
        RepositoryItem = dmLookup.repLcbAtividade
        DataBinding.DataField = 'ID_ATIVIDADE_ALVO'
        DataBinding.DataSource = dsAtividade_Vinculo
        Properties.ListColumns = <>
        TabOrder = 3
        Width = 209
      end
      object btnPesquisarAtividade: TButton
        Left = 422
        Top = 68
        Width = 22
        Height = 21
        Action = Ac_Pesquisar_Projeto
        Images = dmPrincipal.imgIcons_16
        TabOrder = 4
      end
    end
    object tabCadastroDetailArquivo: TcxTabSheet
      Caption = 'tabCadastroDetailArquivo'
      ImageIndex = 5
      object Label19: TLabel
        Left = 5
        Top = 54
        Width = 82
        Height = 13
        Caption = 'Nome do Arquivo'
        FocusControl = EditNomeArquivo
      end
      object Label20: TLabel
        Left = 5
        Top = 97
        Width = 114
        Height = 13
        Caption = 'Caminho para o arquivo'
        FocusControl = EditNomeArquivo
      end
      object Label21: TLabel
        Left = 6
        Top = 140
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object pnCadastroDetailArquivo: TPanel
        Left = 0
        Top = 0
        Width = 976
        Height = 50
        Align = alTop
        TabOrder = 0
        ExplicitTop = 8
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
      object EditNomeArquivo: TcxDBTextEdit
        Left = 4
        Top = 70
        DataBinding.DataField = 'NOME'
        DataBinding.DataSource = dsAtividade_Arquivo
        TabOrder = 1
        Width = 317
      end
      object EditCaminhoArquivo: TcxButtonEdit
        Left = 5
        Top = 113
        Properties.Buttons = <
          item
            Action = Ac_CarregarArquivo
            Default = True
            Kind = bkGlyph
          end>
        Properties.Images = dmPrincipal.imgIcons_16
        TabOrder = 2
        Width = 316
      end
      object EditDescricaoArquivo: TcxDBMemo
        Left = 5
        Top = 155
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = dsAtividade_Arquivo
        TabOrder = 3
        Height = 89
        Width = 596
      end
    end
    object tabCadastroDetailComentario: TcxTabSheet
      Caption = 'tabCadastroDetailComentario'
      ImageIndex = 6
      object Label22: TLabel
        Left = 4
        Top = 56
        Width = 55
        Height = 13
        Caption = 'Coment'#225'rio'
        FocusControl = EditComentario
      end
      object pnCadastroDetailComentario: TPanel
        Left = 0
        Top = 0
        Width = 976
        Height = 50
        Align = alTop
        TabOrder = 0
        ExplicitTop = 8
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
      object EditComentario: TcxDBMemo
        Left = 3
        Top = 71
        DataBinding.DataField = 'COMENTARIO'
        DataBinding.DataSource = dsAtividade_Comentario
        TabOrder = 1
        Height = 89
        Width = 596
      end
    end
  end
  inherited ActionList1: TActionList
    object Ac_Pesquisar_Projeto: TAction
      Category = 'Master'
      ImageIndex = 0
    end
    object Ac_CarregarArquivo: TAction
      Category = 'Detail'
      ImageIndex = 0
      OnExecute = Ac_CarregarArquivoExecute
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmAdministrativo.cdsAtividade
    Left = 264
    Top = 200
  end
  inherited dsDetail: TDataSource
    DataSet = dmAdministrativo.cdsAtividade_Pessoa
  end
  object dsAtividade_Projeto: TDataSource
    DataSet = dmAdministrativo.cdsAtividade_Projeto
    Left = 384
    Top = 152
  end
  object dsAtividade_Vinculo: TDataSource
    DataSet = dmAdministrativo.cdsAtividade_Vinculo
    Left = 504
    Top = 144
  end
  object dsAtividade_Arquivo: TDataSource
    DataSet = dmAdministrativo.cdsAtividade_Arquivo
    Left = 616
    Top = 160
  end
  object dsAtividade_Comentario: TDataSource
    DataSet = dmAdministrativo.cdsAtividade_Comentario
    Left = 544
    Top = 256
  end
  object SaveDialogDocumento: TSaveDialog
    Left = 608
    Top = 400
  end
  object FileDialog: TOpenTextFileDialog
    Left = 192
    Top = 232
  end
end
