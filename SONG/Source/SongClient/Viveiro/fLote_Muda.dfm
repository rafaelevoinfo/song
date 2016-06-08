inherited frmLoteMuda: TfrmLoteMuda
  Caption = 'Lotes de Mudas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 418
          Width = 557
          ExplicitLeft = 418
          ExplicitWidth = 557
          inherited Label1: TLabel
            Left = 142
            ExplicitLeft = 142
          end
          object lbl1: TLabel [1]
            Left = 3
            Top = 4
            Width = 36
            Height = 13
            Caption = 'Esp'#233'cie'
          end
          object cbPesquisaStatusMuda: TcxImageComboBox [2]
            Left = 274
            Top = 20
            RepositoryItem = dmLookup.repIcbStatusMudas
            Properties.Items = <>
            TabOrder = 6
            Width = 176
          end
          inherited rgStatus: TcxRadioGroup [3]
            Left = 3
            Top = 31
            TabOrder = 5
            ExplicitLeft = 3
            ExplicitTop = 31
          end
          inherited pnData: TPanel [4]
            Left = 321
            ExplicitLeft = 321
          end
          inherited EditPesquisa: TcxButtonEdit [5]
            Left = 273
            ExplicitLeft = 273
          end
          inherited cbPesquisarPor: TcxImageComboBox [6]
            Left = 140
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
                Description = 'Nome/Identifica'#231#227'o'
                Value = 3
              end
              item
                Description = 'Data'
                Value = 4
              end
              item
                Description = 'Status'
                Value = 5
              end
              item
                Description = 'Id do Lote de Semente'
                Value = 6
              end>
            ExplicitLeft = 140
          end
          inherited btnPesquisar: TButton [7]
            Left = 457
            TabOrder = 1
            ExplicitLeft = 457
          end
          object cbEspeciePesquisa: TcxLookupComboBox
            Left = 2
            Top = 20
            RepositoryItem = dmLookup.repLcbEspecie
            Properties.ListColumns = <>
            TabOrder = 2
            Width = 137
          end
        end
        inherited pnBotoes: TPanel
          Width = 417
          ExplicitWidth = 417
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Visible = False
              Options.Editing = False
              Width = 33
            end
            object viewRegistrosID_ESPECIE: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ID_ESPECIE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_LOTE_SEMENTE: TcxGridDBColumn [2]
              DataBinding.FieldName = 'ID_LOTE_SEMENTE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_COMPRA_ITEM: TcxGridDBColumn [3]
              DataBinding.FieldName = 'ID_COMPRA_ITEM'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosNOME_ESPECIE: TcxGridDBColumn [4]
              DataBinding.FieldName = 'NOME_ESPECIE'
              Options.Editing = False
              Width = 204
            end
            object viewRegistrosNOME: TcxGridDBColumn [5]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
              Width = 156
            end
            object viewRegistrosQTDE_INICIAL: TcxGridDBColumn [6]
              DataBinding.FieldName = 'QTDE_INICIAL'
              RepositoryItem = dmLookup.repCalcInteiro
              Options.Editing = False
              Width = 94
            end
            object viewRegistrosTAXA_CLASSIFICACAO: TcxGridDBColumn [7]
              DataBinding.FieldName = 'TAXA_CLASSIFICACAO'
              PropertiesClassName = 'TcxCalcEditProperties'
              Properties.DisplayFormat = ',0.00 %'
              Options.Editing = False
              Width = 83
            end
            object viewRegistrosSALDO: TcxGridDBColumn [8]
              DataBinding.FieldName = 'SALDO'
              Options.Editing = False
              Width = 105
            end
            object viewRegistrosDATA: TcxGridDBColumn [9]
              DataBinding.FieldName = 'DATA'
              Options.Editing = False
              Width = 90
            end
            object viewRegistrosSTATUS: TcxGridDBColumn [10]
              DataBinding.FieldName = 'STATUS'
              RepositoryItem = dmLookup.repIcbStatusMudas
              Options.Editing = False
              Width = 128
            end
            inherited ColumnAlterar: TcxGridDBColumn
              MinWidth = 44
              Width = 44
            end
            inherited ColumnExcluir: TcxGridDBColumn
              MinWidth = 44
              Width = 44
            end
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            OnChange = pcDetailsChange
            inherited tabDetail: TcxTabSheet
              Caption = 'Classifica'#231#245'es'
              inherited cxGridRegistrosDetail: TcxGrid
                inherited viewRegistrosDetail: TcxGridDBTableView
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                    Width = 41
                  end
                  object viewRegistrosDetailID_PESSOA_CLASSIFICOU: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'ID_PESSOA_CLASSIFICOU'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailDATA: TcxGridDBColumn [2]
                    DataBinding.FieldName = 'DATA'
                    Options.Editing = False
                    SortIndex = 0
                    SortOrder = soDescending
                    Width = 139
                  end
                  object viewRegistrosDetailQTDE: TcxGridDBColumn [3]
                    DataBinding.FieldName = 'QTDE'
                    RepositoryItem = dmLookup.repCalcInteiro
                    Options.Editing = False
                    Width = 131
                  end
                  object viewRegistrosDetailPESSOA_CLASSIFICOU: TcxGridDBColumn [4]
                    DataBinding.FieldName = 'PESSOA_CLASSIFICOU'
                    Options.Editing = False
                    Width = 535
                  end
                end
              end
            end
            object tabDetailCanteiros: TcxTabSheet
              Caption = 'Canteiros'
              ImageIndex = 1
              object pnBotoesCanteiro: TPanel
                Left = 0
                Top = 0
                Width = 965
                Height = 25
                Align = alTop
                TabOrder = 0
                ExplicitTop = 8
                object btnIncluirCanteiro: TButton
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
                object viewCanteiros: TcxGridDBTableView
                  OnDblClick = viewRegistrosDetailDblClick
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
                  DataController.DataSource = dsLote_Muda_Canteiro
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
                  object viewCanteirosID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewCanteirosID_CANTEIRO: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_CANTEIRO'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewCanteirosNOME_CANTEIRO: TcxGridDBColumn
                    DataBinding.FieldName = 'NOME_CANTEIRO'
                    Options.Editing = False
                  end
                  object ColumnAlterarCanteiro: TcxGridDBColumn
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
                  object ColumnExcluirCanteiro: TcxGridDBColumn
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
                  GridView = viewCanteiros
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
          Top = 0
          Width = 93
          Height = 13
          Caption = 'Nome/Identifica'#231#227'o'
          FocusControl = EditNome
        end
        object Label7: TLabel
          Left = 214
          Top = 0
          Width = 36
          Height = 13
          Caption = 'Esp'#233'cie'
          FocusControl = cbEspecie
        end
        object Label5: TLabel
          Left = 426
          Top = 1
          Width = 23
          Height = 13
          Caption = 'Data'
          FocusControl = EditData
        end
        object lbl2: TLabel
          Left = 7
          Top = 42
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
          FocusControl = EditObsLote
        end
        object Label4: TLabel
          Left = 551
          Top = 0
          Width = 116
          Height = 13
          Caption = 'Quantidade Inicial (Und)'
          FocusControl = EditQtdeInicial
        end
        object Label6: TLabel
          Left = 674
          Top = 0
          Width = 85
          Height = 13
          Caption = 'Status das Mudas'
          FocusControl = cbStatusMuda
        end
        object EditNome: TcxDBTextEdit
          Left = 5
          Top = 15
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 205
        end
        object cbEspecie: TcxDBLookupComboBox
          Left = 212
          Top = 15
          RepositoryItem = dmLookup.repLcbEspecie
          DataBinding.DataField = 'ID_ESPECIE'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 1
          Width = 205
        end
        object EditData: TcxDBDateEdit
          Left = 424
          Top = 15
          DataBinding.DataField = 'DATA'
          DataBinding.DataSource = dsMaster
          Properties.ClearKey = 46
          Properties.PostPopupValueOnTab = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 2
          Width = 121
        end
        object EditObsLote: TcxDBMemo
          Left = 5
          Top = 58
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 5
          Height = 71
          Width = 661
        end
        object EditQtdeInicial: TcxDBSpinEdit
          Left = 551
          Top = 15
          DataBinding.DataField = 'QTDE_INICIAL'
          DataBinding.DataSource = dsMaster
          Properties.DisplayFormat = ',0'
          TabOrder = 3
          Width = 115
        end
        object cxGroupBox1: TcxGroupBox
          Left = 7
          Top = 135
          Caption = 'Classifica'#231#227'o'
          TabOrder = 6
          Height = 146
          Width = 659
        end
        object cbStatusMuda: TcxDBImageComboBox
          Left = 671
          Top = 15
          RepositoryItem = dmLookup.repIcbStatusMudas
          DataBinding.DataField = 'STATUS'
          DataBinding.DataSource = dsMaster
          Properties.Items = <>
          TabOrder = 4
          Width = 153
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      inherited pnEditsCadastroDetail: TPanel
        ExplicitLeft = 4
        ExplicitTop = 52
        object Label8: TLabel
          Left = 5
          Top = 8
          Width = 131
          Height = 13
          Caption = 'Pessoa que Classificou (F2)'
          FocusControl = cbPessoaClassificou
        end
        object Label10: TLabel
          Left = 209
          Top = 7
          Width = 102
          Height = 13
          Caption = 'Data da Classifica'#231#227'o'
          FocusControl = EditDataClassificacao
        end
        object Label9: TLabel
          Left = 335
          Top = 8
          Width = 86
          Height = 13
          Caption = 'Quantidade (Und)'
          FocusControl = EditQtdeClassificada
        end
        object Label11: TLabel
          Left = 5
          Top = 50
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
          FocusControl = EditObservacaoClassificacao
        end
        object cbPessoaClassificou: TcxDBLookupComboBox
          Left = 3
          Top = 23
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_PESSOA_CLASSIFICOU'
          DataBinding.DataSource = dsDetail
          Properties.ListColumns = <>
          TabOrder = 0
          OnKeyDown = cbPessoaClassificouKeyDown
          Width = 173
        end
        object btnPesquisar_Pessoa_Semeadura: TButton
          Left = 178
          Top = 23
          Width = 22
          Height = 21
          Action = Ac_Pesquisar_Pessoa_Classificou
          Images = dmPrincipal.imgIcons_16
          TabOrder = 1
          TabStop = False
        end
        object EditDataClassificacao: TcxDBDateEdit
          Left = 206
          Top = 23
          DataBinding.DataField = 'DATA'
          DataBinding.DataSource = dsDetail
          TabOrder = 2
          Width = 121
        end
        object EditQtdeClassificada: TcxDBSpinEdit
          Left = 333
          Top = 23
          DataBinding.DataField = 'QTDE'
          DataBinding.DataSource = dsDetail
          Properties.DisplayFormat = ',0'
          TabOrder = 3
          Width = 115
        end
        object EditObservacaoClassificacao: TcxDBMemo
          Left = 3
          Top = 66
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsDetail
          TabOrder = 4
          Height = 63
          Width = 445
        end
      end
    end
    object tabCadastroCanteiro: TcxTabSheet
      Caption = 'tabCadastroCanteiro'
      ImageIndex = 3
      object lb1: TLabel
        Left = 5
        Top = 56
        Width = 41
        Height = 13
        Caption = 'Canteiro'
        FocusControl = cbCanteiro
      end
      object pnBotoesCadastrarCanteiro: TPanel
        Left = 0
        Top = 0
        Width = 976
        Height = 50
        Align = alTop
        TabOrder = 1
        ExplicitTop = 8
        object btnSalvarCanteiro: TButton
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
        object btnCancelarCanteiro: TButton
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
        object btnSalvarIncluirCanteiro: TButton
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
      object cbCanteiro: TcxDBLookupComboBox
        Left = 3
        Top = 71
        RepositoryItem = dmLookup.repLcbCanteiro
        DataBinding.DataField = 'ID_CANTEIRO'
        DataBinding.DataSource = dsLote_Muda_Canteiro
        Properties.ListColumns = <>
        TabOrder = 0
        OnKeyDown = cbPessoaClassificouKeyDown
        Width = 173
      end
    end
  end
  inherited ActionList1: TActionList
    object Ac_Pesquisar_Pessoa_Classificou: TAction
      Category = 'Master'
      ImageIndex = 0
      OnExecute = Ac_Pesquisar_Pessoa_ClassificouExecute
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmViveiro.cdsLote_Muda
  end
  inherited dsDetail: TDataSource
    DataSet = dmViveiro.cdsClassificacao
  end
  object dsLote_Muda_Canteiro: TDataSource
    DataSet = dmViveiro.cdsLote_Muda_Canteiro
    Left = 488
    Top = 240
  end
end
