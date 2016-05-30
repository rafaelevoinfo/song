inherited frmLoteSemente: TfrmLoteSemente
  ActiveControl = btnSalvarDetail
  Caption = 'Lotes de Sementes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabCadastroDetail
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 291
          Width = 684
          ExplicitLeft = 291
          ExplicitWidth = 684
          inherited Label1: TLabel
            Left = 298
            ExplicitLeft = 298
          end
          object Label7: TLabel [1]
            Left = 160
            Top = 4
            Width = 36
            Height = 13
            Caption = 'Esp'#233'cie'
          end
          inherited rgStatus: TcxRadioGroup [2]
            Caption = 'Status da Germina'#231#227'o'
            Properties.Items = <
              item
                Caption = 'Iniciada'
              end
              item
                Caption = 'Finalizada'
              end>
            Properties.OnEditValueChanged = rgStatusPropertiesEditValueChanged
            Visible = True
            ExplicitWidth = 156
            Width = 156
          end
          inherited pnData: TPanel [3]
            Left = 448
            ExplicitLeft = 448
          end
          inherited EditPesquisa: TcxButtonEdit [4]
            Left = 428
            ExplicitLeft = 428
            ExplicitWidth = 149
            Width = 149
          end
          inherited cbPesquisarPor: TcxImageComboBox [5]
            Left = 296
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
                Description = 'Nome/Identifica'#231#227'o'
                Value = 3
              end
              item
                Description = 'Data da Coleta'
                Value = 4
              end>
            ExplicitLeft = 296
            ExplicitWidth = 133
            Width = 133
          end
          inherited btnPesquisar: TButton [6]
            Left = 584
            ExplicitLeft = 584
          end
          object cbEspeciePesquisa: TcxLookupComboBox
            Left = 159
            Top = 20
            RepositoryItem = dmLookup.repLcbEspecie
            Properties.ListColumns = <>
            TabOrder = 5
            Width = 137
          end
        end
        inherited pnBotoes: TPanel
          Width = 290
          ExplicitWidth = 290
          object btnFinalizarReiniciarGerminacao: TButton
            AlignWithMargins = True
            Left = 188
            Top = 1
            Width = 101
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 2
            Margins.Bottom = 1
            Action = Ac_Finalizar_Etapa_Germinacao
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 2
            WordWrap = True
          end
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Options.Editing = False
              Width = 37
            end
            object viewRegistrosID_ESPECIE: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ID_ESPECIE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosNOME_ESPECIE: TcxGridDBColumn [2]
              DataBinding.FieldName = 'NOME_ESPECIE'
              Options.Editing = False
              Width = 121
            end
            object viewRegistrosNOME: TcxGridDBColumn [3]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
              Width = 104
            end
            object viewRegistrosDATA: TcxGridDBColumn [4]
              DataBinding.FieldName = 'DATA'
              Options.Editing = False
              Width = 84
            end
            object viewRegistrosQTDE: TcxGridDBColumn [5]
              DataBinding.FieldName = 'QTDE'
              RepositoryItem = dmLookup.repCalcPadrao
              Options.Editing = False
              Width = 158
            end
            object viewRegistrosQTDE_ARMAZENADA: TcxGridDBColumn [6]
              DataBinding.FieldName = 'QTDE_ARMAZENADA'
              RepositoryItem = dmLookup.repCalcPadrao
              Options.Editing = False
              Width = 118
            end
            object viewRegistrosQTDE_SEMEADA: TcxGridDBColumn [7]
              DataBinding.FieldName = 'QTDE_SEMEADA'
              RepositoryItem = dmLookup.repCalcPadrao
              Options.Editing = False
              Width = 104
            end
            object viewRegistrosID_PESSOA_COLETOU: TcxGridDBColumn [8]
              DataBinding.FieldName = 'ID_PESSOA_COLETOU'
              Visible = False
              Options.Editing = False
              Width = 98
            end
            object viewRegistrosPESSOA_COLETOU: TcxGridDBColumn [9]
              DataBinding.FieldName = 'PESSOA_COLETOU'
              Options.Editing = False
              Width = 103
            end
            object viewRegistrosTAXA_GERMINACAO: TcxGridDBColumn [10]
              DataBinding.FieldName = 'TAXA_GERMINACAO'
              PropertiesClassName = 'TcxCalcEditProperties'
              Properties.DisplayFormat = ',0.00 %'
              Options.Editing = False
              Width = 90
            end
            object viewRegistrosTAXA_DESCARTE: TcxGridDBColumn [11]
              DataBinding.FieldName = 'TAXA_DESCARTE'
              PropertiesClassName = 'TcxCalcEditProperties'
              Properties.DisplayFormat = ',0.00 %'
              Options.Editing = False
              Width = 77
            end
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            OnChange = pcDetailsChange
            inherited tabDetail: TcxTabSheet
              Caption = 'Semeaduras'
              inherited cxGridRegistrosDetail: TcxGrid
                inherited viewRegistrosDetail: TcxGridDBTableView
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                    Width = 40
                  end
                  object viewRegistrosDetailDATA: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'DATA'
                    Options.Editing = False
                    SortIndex = 0
                    SortOrder = soDescending
                    Width = 104
                  end
                  object viewRegistrosDetailPESSOA_SEMEOU: TcxGridDBColumn [2]
                    DataBinding.FieldName = 'PESSOA_SEMEOU'
                    Options.Editing = False
                    Width = 140
                  end
                  object viewRegistrosDetailNOME_CANTEIRO: TcxGridDBColumn [3]
                    DataBinding.FieldName = 'NOME_CANTEIRO'
                    Options.Editing = False
                    Width = 136
                  end
                  object viewRegistrosDetailQTDE_SEMEADA: TcxGridDBColumn [4]
                    DataBinding.FieldName = 'QTDE_SEMEADA'
                    RepositoryItem = dmLookup.repCalcPadrao
                    Options.Editing = False
                    Width = 107
                  end
                  object viewRegistrosDetailQTDE_TUBETE: TcxGridDBColumn [5]
                    DataBinding.FieldName = 'QTDE_TUBETE'
                    RepositoryItem = dmLookup.repCalcPadrao
                    Width = 142
                  end
                  object viewRegistrosDetailDATA_PREVISTA_GERMINACAO: TcxGridDBColumn [6]
                    DataBinding.FieldName = 'DATA_PREVISTA_GERMINACAO'
                    Options.Editing = False
                    Width = 148
                  end
                  object viewRegistrosDetailID_PESSOA_SEMEOU: TcxGridDBColumn [7]
                    DataBinding.FieldName = 'ID_PESSOA_SEMEOU'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailID_CANTEIRO: TcxGridDBColumn [8]
                    DataBinding.FieldName = 'ID_CANTEIRO'
                    Visible = False
                    Options.Editing = False
                  end
                end
              end
            end
            object tabDetailGerminacao: TcxTabSheet
              Caption = 'Hist'#243'rico de Germina'#231#227'o'
              ImageIndex = 1
              object pn1: TPanel
                Left = 0
                Top = 0
                Width = 965
                Height = 25
                Align = alTop
                TabOrder = 0
                object btnactCnPrefixWizard: TButton
                  Left = 1
                  Top = 1
                  Width = 81
                  Height = 23
                  Action = Ac_Incluir_Detail
                  Align = alLeft
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
                object viewGerminacao: TcxGridDBTableView
                  OnDblClick = viewRegistrosDetailDblClick
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
                  DataController.DataSource = dsGerminacao
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
                  object viewGerminacaoID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewGerminacaoDATA: TcxGridDBColumn
                    DataBinding.FieldName = 'DATA'
                    Options.Editing = False
                    Width = 119
                  end
                  object viewGerminacaoQTDE_GERMINADA: TcxGridDBColumn
                    DataBinding.FieldName = 'QTDE_GERMINADA'
                    PropertiesClassName = 'TcxCalcEditProperties'
                    Properties.DisplayFormat = ',0'
                    Options.Editing = False
                    Width = 87
                  end
                  object viewGerminacaoPESSOA_VERIFICOU: TcxGridDBColumn
                    DataBinding.FieldName = 'PESSOA_VERIFICOU'
                    Options.Editing = False
                    Width = 439
                  end
                  object ColumnAlterarGerminacao: TcxGridDBColumn
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
                  object ColumnExcluirGerminacao: TcxGridDBColumn
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
                object level1: TcxGridLevel
                  GridView = viewGerminacao
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
        object pnMatrizes: TPanel
          Left = 1
          Top = 75
          Width = 974
          Height = 322
          Align = alClient
          TabOrder = 1
          inline frameMatrizes: TframeGrids
            Left = 1
            Top = 1
            Width = 972
            Height = 320
            Align = alClient
            TabOrder = 0
            ExplicitLeft = 1
            ExplicitTop = 1
            ExplicitWidth = 972
            ExplicitHeight = 320
            inherited gpGrids: TGridPanel
              Width = 972
              Height = 301
              ControlCollection = <
                item
                  Column = 0
                  Control = frameMatrizes.cxGrid1
                  Row = 0
                end
                item
                  Column = 1
                  Control = frameMatrizes.pnBotoes
                  Row = 0
                end
                item
                  Column = 2
                  Control = frameMatrizes.cxGrid2
                  Row = 0
                end>
              ExplicitWidth = 972
              ExplicitHeight = 301
              inherited cxGrid1: TcxGrid
                Width = 455
                Height = 299
                ExplicitWidth = 455
                ExplicitHeight = 299
              end
              inherited pnBotoes: TPanel
                Left = 456
                Width = 48
                Height = 299
                ExplicitLeft = 456
                ExplicitWidth = 48
                ExplicitHeight = 299
                inherited btnAdd: TButton
                  Width = 48
                  ExplicitWidth = 48
                end
                inherited btnAddTodos: TButton
                  Width = 48
                  ExplicitWidth = 48
                end
                inherited btnRemover: TButton
                  Width = 48
                  ExplicitWidth = 48
                end
                inherited btnRemoverTodos: TButton
                  Width = 48
                  ExplicitWidth = 48
                end
              end
              inherited cxGrid2: TcxGrid
                Left = 504
                Width = 467
                Height = 299
                ExplicitLeft = 504
                ExplicitWidth = 467
                ExplicitHeight = 299
              end
            end
            inherited pnLabels: TPanel
              Width = 972
              ExplicitWidth = 972
              inherited gpLabels: TGridPanel
                Width = 970
                ControlCollection = <
                  item
                    Column = 0
                    Control = frameMatrizes.lbInfoGridEsquerda
                    Row = 0
                  end
                  item
                    Column = 2
                    Control = frameMatrizes.lbInfoGridDireita
                    Row = 0
                  end>
                ExplicitWidth = 970
                inherited lbInfoGridEsquerda: TLabel
                  Width = 110
                  Height = 15
                  Caption = 'Matrizes dessa esp'#233'cie'
                  ExplicitWidth = 110
                end
                inherited lbInfoGridDireita: TLabel
                  Left = 503
                  Width = 92
                  Height = 15
                  Caption = 'Matr'#237'zes desse lote'
                  ExplicitLeft = 503
                  ExplicitWidth = 92
                end
              end
            end
            inherited dsEsquerda: TDataSource
              DataSet = cdsLocalMatrizes
            end
            inherited dsDireita: TDataSource
              DataSet = dmViveiro.cdsLote_Semente_Matriz
            end
          end
        end
        object pnTopEditsCadastro: TPanel
          Left = 1
          Top = 1
          Width = 974
          Height = 74
          Align = alTop
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 0
          object Label3: TLabel
            Left = 4
            Top = 0
            Width = 93
            Height = 13
            Caption = 'Nome/Identifica'#231#227'o'
            FocusControl = EditNome
          end
          object lbl1: TLabel
            Left = 6
            Top = 38
            Width = 36
            Height = 13
            Caption = 'Esp'#233'cie'
            FocusControl = cbEspecie
          end
          object Label4: TLabel
            Left = 217
            Top = 0
            Width = 165
            Height = 13
            Caption = 'Pessoa que Coletou/Comprou (F2)'
            FocusControl = cbPessoaColetou
          end
          object Label5: TLabel
            Left = 461
            Top = 0
            Width = 23
            Height = 13
            Caption = 'Data'
            FocusControl = EditData
          end
          object Label6: TLabel
            Left = 585
            Top = 0
            Width = 79
            Height = 13
            Caption = 'Quantidade (Kg)'
            FocusControl = EditQtde
          end
          object EditNome: TcxDBTextEdit
            Left = 4
            Top = 15
            DataBinding.DataField = 'NOME'
            DataBinding.DataSource = dsMaster
            TabOrder = 0
            Width = 205
          end
          object cbEspecie: TcxDBLookupComboBox
            Left = 4
            Top = 53
            RepositoryItem = dmLookup.repLcbEspecie
            DataBinding.DataField = 'ID_ESPECIE'
            DataBinding.DataSource = dsMaster
            Properties.ListColumns = <>
            Properties.OnEditValueChanged = cbEspeciePropertiesEditValueChanged
            TabOrder = 5
            Width = 205
          end
          object cbPessoaColetou: TcxDBLookupComboBox
            Left = 215
            Top = 15
            RepositoryItem = dmLookup.repLcbPessoa
            DataBinding.DataField = 'ID_PESSOA_COLETOU'
            DataBinding.DataSource = dsMaster
            Properties.ListColumns = <>
            TabOrder = 1
            OnKeyDown = cbPessoaColetouKeyDown
            Width = 218
          end
          object EditData: TcxDBDateEdit
            Left = 459
            Top = 15
            DataBinding.DataField = 'DATA'
            DataBinding.DataSource = dsMaster
            Properties.ClearKey = 46
            Properties.PostPopupValueOnTab = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            TabOrder = 3
            Width = 121
          end
          object EditQtde: TcxDBCalcEdit
            Left = 586
            Top = 15
            DataBinding.DataField = 'QTDE'
            DataBinding.DataSource = dsMaster
            Properties.DisplayFormat = ',0.00'
            Properties.ImmediatePost = True
            TabOrder = 4
            Width = 121
          end
          object btnPesquisarAtividade: TButton
            Left = 435
            Top = 15
            Width = 22
            Height = 21
            Action = Ac_Pesquisar_Pessoa
            Images = dmPrincipal.imgIcons_16
            TabOrder = 2
            TabStop = False
          end
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnBotoesCadastroDetail: TPanel
        TabOrder = 0
      end
      inherited pnEditsCadastroDetail: TPanel
        TabOrder = 1
        object Label8: TLabel
          Left = 6
          Top = 8
          Width = 119
          Height = 13
          Caption = 'Pessoa que Semeou (F2)'
          FocusControl = cbPessoaSemeou
        end
        object lbl2: TLabel
          Left = 204
          Top = 8
          Width = 41
          Height = 13
          Caption = 'Canteiro'
          FocusControl = cbCanteiro
        end
        object Label9: TLabel
          Left = 394
          Top = 8
          Width = 98
          Height = 13
          Caption = 'Qtde. Semeada (Kg)'
          FocusControl = EditQtdeSemeada
        end
        object Label10: TLabel
          Left = 605
          Top = 8
          Width = 95
          Height = 13
          Caption = 'Data da Semeadura'
          FocusControl = EditQtdeSemeada
        end
        object Label11: TLabel
          Left = 6
          Top = 50
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
          FocusControl = EditObservacaoSemeadura
        end
        object Label15: TLabel
          Left = 732
          Top = 8
          Width = 139
          Height = 13
          Caption = 'Data Prevista de Germina'#231#227'o'
        end
        object lbl3: TLabel
          Left = 507
          Top = 9
          Width = 70
          Height = 13
          Caption = 'Qtde. Tubetes'
          FocusControl = EditQtdeTubete
        end
        object cbPessoaSemeou: TcxDBLookupComboBox
          Left = 4
          Top = 23
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_PESSOA_SEMEOU'
          DataBinding.DataSource = dsDetail
          Properties.ListColumns = <>
          TabOrder = 0
          OnKeyDown = cbPessoaSemeouKeyDown
          Width = 173
        end
        object btnPesquisar_Pessoa_Semeadura: TButton
          Left = 179
          Top = 23
          Width = 22
          Height = 21
          Action = Ac_Pesquisar_Pessoa_Semeou
          Images = dmPrincipal.imgIcons_16
          TabOrder = 1
          TabStop = False
        end
        object cbCanteiro: TcxDBLookupComboBox
          Left = 202
          Top = 23
          RepositoryItem = dmLookup.repLcbCanteiro
          DataBinding.DataField = 'ID_CANTEIRO'
          DataBinding.DataSource = dsDetail
          Properties.ListColumns = <>
          TabOrder = 2
          OnKeyDown = cbPessoaSemeouKeyDown
          Width = 191
        end
        object EditQtdeSemeada: TcxDBCalcEdit
          Left = 394
          Top = 23
          DataBinding.DataField = 'QTDE_SEMEADA'
          DataBinding.DataSource = dsDetail
          TabOrder = 3
          Width = 111
        end
        object EditDataSemeadura: TcxDBDateEdit
          Left = 603
          Top = 23
          DataBinding.DataField = 'DATA'
          DataBinding.DataSource = dsDetail
          Properties.OnEditValueChanged = EditDataSemeaduraPropertiesEditValueChanged
          TabOrder = 5
          Width = 121
        end
        object EditObservacaoSemeadura: TcxDBMemo
          Left = 4
          Top = 66
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsDetail
          TabOrder = 7
          Height = 89
          Width = 867
        end
        object EditDataPrevistaGerminacao: TcxDBDateEdit
          Left = 730
          Top = 23
          DataBinding.DataField = 'DATA_PREVISTA_GERMINACAO'
          DataBinding.DataSource = dsDetail
          Enabled = False
          TabOrder = 6
          Width = 141
        end
        object EditQtdeTubete: TcxDBSpinEdit
          Left = 507
          Top = 23
          DataBinding.DataField = 'QTDE_TUBETE'
          DataBinding.DataSource = dsDetail
          TabOrder = 4
          Width = 95
        end
      end
    end
    object tabCadastroGerminacao: TcxTabSheet
      Caption = 'tabCadastroGerminacao'
      ImageIndex = 3
      object pnBotoesCadastroGerminacao: TPanel
        Left = 0
        Top = 0
        Width = 976
        Height = 50
        Align = alTop
        TabOrder = 0
        object btnSalvar_Germinacao: TButton
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
        object btnCancelar_Germinacao: TButton
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
        object btnSalvar_Incluir_Germinacao: TButton
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
      object pnEditsCadastroGerminacao: TPanel
        Left = 0
        Top = 50
        Width = 976
        Height = 398
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label12: TLabel
          Left = 4
          Top = 3
          Width = 122
          Height = 13
          Caption = 'Pessoa que Verificou (F2)'
          FocusControl = cbPessoaVerificou
        end
        object Label13: TLabel
          Left = 250
          Top = 3
          Width = 112
          Height = 13
          Caption = 'Qtde. Germinada (Und)'
          FocusControl = EditQtdeGerminada
        end
        object Label14: TLabel
          Left = 379
          Top = 3
          Width = 93
          Height = 13
          Caption = 'Data da Verifica'#231#227'o'
          FocusControl = EditDataVerificacao
        end
        object cbPessoaVerificou: TcxDBLookupComboBox
          Left = 2
          Top = 18
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_PESSOA_VERIFICOU'
          DataBinding.DataSource = dsGerminacao
          Properties.ListColumns = <>
          TabOrder = 0
          OnKeyDown = cbPessoaVerificouKeyDown
          Width = 218
        end
        object btnPesquisar_Pessoa_Verificou: TButton
          Left = 222
          Top = 18
          Width = 22
          Height = 21
          Action = Ac_Pesquisar_Pessoa_Verificou
          Images = dmPrincipal.imgIcons_16
          TabOrder = 1
          TabStop = False
        end
        object EditDataVerificacao: TcxDBDateEdit
          Left = 377
          Top = 18
          DataBinding.DataField = 'DATA'
          DataBinding.DataSource = dsGerminacao
          TabOrder = 3
          Width = 121
        end
        object EditQtdeGerminada: TcxDBSpinEdit
          Left = 250
          Top = 18
          DataBinding.DataField = 'QTDE_GERMINADA'
          DataBinding.DataSource = dsGerminacao
          TabOrder = 2
          Width = 121
        end
      end
    end
  end
  inherited ActionList1: TActionList
    object Ac_Pesquisar_Pessoa: TAction
      Category = 'Master'
      ImageIndex = 0
      OnExecute = Ac_Pesquisar_PessoaExecute
    end
    object Ac_Reiniciar_Etapa_Germinacao: TAction
      Caption = 'Reiniciar germina'#231#227'o'
      ImageIndex = 11
      OnExecute = Ac_Reiniciar_Etapa_GerminacaoExecute
      OnUpdate = Ac_Finalizar_Etapa_GerminacaoUpdate
    end
    object Ac_Finalizar_Etapa_Germinacao: TAction
      Caption = 'Finalizar germina'#231#227'o'
      ImageIndex = 10
      OnExecute = Ac_Finalizar_Etapa_GerminacaoExecute
      OnUpdate = Ac_Finalizar_Etapa_GerminacaoUpdate
    end
    object Ac_Pesquisar_Pessoa_Semeou: TAction
      Category = 'Detail'
      ImageIndex = 0
      OnExecute = Ac_Pesquisar_Pessoa_SemeouExecute
    end
    object Ac_Pesquisar_Pessoa_Verificou: TAction
      Category = 'Detail'
      ImageIndex = 0
      OnExecute = Ac_Pesquisar_Pessoa_VerificouExecute
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmViveiro.cdsLote_Semente
  end
  inherited dsDetail: TDataSource
    DataSet = dmViveiro.cdsSemeadura
  end
  object cdsLocalMatrizes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 224
    object cdsLocalMatrizesID: TIntegerField
      DisplayLabel = 'Matriz'
      FieldName = 'ID'
      ProviderFlags = []
    end
  end
  object dsLocalMatrizes: TDataSource
    DataSet = cdsLocalMatrizes
    Left = 304
    Top = 288
  end
  object dsGerminacao: TDataSource
    DataSet = dmViveiro.cdsGerminacao
    Left = 488
    Top = 240
  end
end
