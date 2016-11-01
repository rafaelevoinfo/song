inherited frmOrcamento: TfrmOrcamento
  ActiveControl = btnIncluir
  Caption = 'Or'#231'amento'
  OnDestroy = FormDestroy
  ExplicitTop = -103
  ExplicitWidth = 1000
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabPesquisa
    inherited tabPesquisa: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 564
          Width = 411
          ExplicitLeft = 564
          ExplicitWidth = 411
          inherited Label1: TLabel
            Left = 4
            ExplicitLeft = 4
          end
          object cbPesquisaCliente: TcxLookupComboBox [1]
            Left = 136
            Top = 20
            RepositoryItem = dmLookup.repLcbFinForCli
            Properties.ListColumns = <>
            TabOrder = 4
            Visible = False
            Width = 176
          end
          object cbPesquisaVendedor: TcxLookupComboBox [2]
            Left = 136
            Top = 20
            RepositoryItem = dmLookup.repLcbPessoa
            Properties.ListColumns = <>
            TabOrder = 5
            Visible = False
            Width = 176
          end
          inherited pnData: TPanel
            Left = 183
            ExplicitLeft = 183
          end
          inherited EditPesquisa: TcxButtonEdit
            Left = 135
            TabOrder = 3
            ExplicitLeft = 135
          end
          inherited cbPesquisarPor: TcxImageComboBox
            Left = 2
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
                Description = 'Data do Or'#231'amento'
                Value = 4
              end
              item
                Description = 'Cliente'
                Value = 5
              end
              item
                Description = 'Respons'#225'vel'
                Value = 6
              end>
            TabOrder = 2
            ExplicitLeft = 2
          end
          inherited btnPesquisar: TButton
            Left = 311
            TabOrder = 1
            ExplicitLeft = 311
          end
          inherited rgStatus: TcxRadioGroup
            Left = 6
            Top = 39
            TabOrder = 6
            ExplicitLeft = 6
            ExplicitTop = 39
          end
        end
        inherited pnBotoes: TPanel
          Width = 557
          ExplicitWidth = 557
          inherited btnUtilizar: TButton
            Left = 377
            ExplicitLeft = 377
          end
          object btnGerar_Saida: TButton
            AlignWithMargins = True
            Left = 275
            Top = 1
            Width = 100
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 2
            Margins.Bottom = 1
            Action = Ac_Gerar_Saida
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 3
            WordWrap = True
          end
          object btnGerar_Venda: TButton
            AlignWithMargins = True
            Left = 188
            Top = 1
            Width = 85
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 2
            Margins.Bottom = 1
            Action = Ac_Gerar_Venda
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 4
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
              Width = 43
            end
            object viewRegistrosID_MODELO_ORCAMENTO: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ID_MODELO_ORCAMENTO'
              Visible = False
              Options.Editing = False
              Width = 79
            end
            object viewRegistrosDATA: TcxGridDBColumn [2]
              DataBinding.FieldName = 'DATA'
              Options.Editing = False
              Width = 86
            end
            object viewRegistrosNOME: TcxGridDBColumn [3]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
              Width = 201
            end
            object viewRegistrosID_RESPONSAVEL: TcxGridDBColumn [4]
              DataBinding.FieldName = 'ID_RESPONSAVEL'
              Visible = False
              Options.Editing = False
              Width = 94
            end
            object viewRegistrosRESPONSAVEL: TcxGridDBColumn [5]
              DataBinding.FieldName = 'RESPONSAVEL'
              Options.Editing = False
              Width = 200
            end
            object viewRegistrosID_CLIENTE: TcxGridDBColumn [6]
              DataBinding.FieldName = 'ID_CLIENTE'
              Visible = False
              Options.Editing = False
              Width = 78
            end
            object viewRegistrosCLIENTE: TcxGridDBColumn [7]
              DataBinding.FieldName = 'CLIENTE'
              Options.Editing = False
              Width = 198
            end
            object ColumnImprimir: TcxGridDBColumn
              Caption = 'Imprimir'
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Buttons = <
                item
                  Action = Ac_Imprimir
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
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              Caption = 'Itens do Or'#231'amento'
              ExplicitLeft = 2
              ExplicitTop = 25
              ExplicitWidth = 965
              ExplicitHeight = 195
              inherited pnBotoesDetail: TPanel
                inherited btnUtilizarDetailSelecionado: TButton
                  Left = 211
                  ExplicitLeft = 211
                end
                object btnEditarOrcamento: TButton
                  AlignWithMargins = True
                  Left = 82
                  Top = 2
                  Width = 127
                  Height = 21
                  Margins.Left = 0
                  Margins.Top = 1
                  Margins.Right = 2
                  Margins.Bottom = 1
                  Action = Ac_Editar_Orcamento
                  Align = alLeft
                  Images = dmPrincipal.imgIcons_16
                  TabOrder = 2
                  WordWrap = True
                end
              end
              inherited cxGridRegistrosDetail: TcxGrid
                inherited viewRegistrosDetail: TcxGridDBTableView
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = '$ ,0.00'
                      Kind = skSum
                      FieldName = 'VALOR_UNITARIO'
                      Column = viewRegistrosDetailVALOR_UNITARIO
                    end
                    item
                      Format = ',0.00'
                      Kind = skSum
                      FieldName = 'QTDE'
                      Column = viewRegistrosDetailQTDE
                    end
                    item
                      Format = '$ ,0.00'
                      Kind = skSum
                      FieldName = 'CALC_VALOR_TOTAL'
                      Column = viewRegistrosDetailCALC_VALOR_TOTAL
                    end>
                  OptionsView.Footer = True
                  OptionsView.FooterAutoHeight = True
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewRegistrosDetailID_ITEM: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'ID_ITEM'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailITEM: TcxGridDBColumn [2]
                    DataBinding.FieldName = 'ITEM'
                    Options.Editing = False
                    Width = 189
                  end
                  object viewRegistrosDetailTAMANHO: TcxGridDBColumn [3]
                    DataBinding.FieldName = 'TAMANHO'
                  end
                  object viewRegistrosDetailID_ESPECIE: TcxGridDBColumn [4]
                    DataBinding.FieldName = 'ID_ESPECIE'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailESPECIE: TcxGridDBColumn [5]
                    DataBinding.FieldName = 'ESPECIE'
                    Options.Editing = False
                    Width = 241
                  end
                  object viewRegistrosDetailNOME_CIENTIFICO: TcxGridDBColumn [6]
                    DataBinding.FieldName = 'NOME_CIENTIFICO'
                    Visible = False
                    Width = 150
                  end
                  object viewRegistrosDetailFAMILIA_BOTANICA: TcxGridDBColumn [7]
                    DataBinding.FieldName = 'FAMILIA_BOTANICA'
                    Visible = False
                    Width = 150
                  end
                  object viewRegistrosDetailQTDE: TcxGridDBColumn [8]
                    DataBinding.FieldName = 'QTDE'
                    Options.Editing = False
                  end
                  object viewRegistrosDetailVALOR_UNITARIO: TcxGridDBColumn [9]
                    DataBinding.FieldName = 'VALOR_UNITARIO'
                    Options.Editing = False
                  end
                  object viewRegistrosDetailCALC_VALOR_TOTAL: TcxGridDBColumn [10]
                    DataBinding.FieldName = 'CALC_VALOR_TOTAL'
                    Width = 103
                  end
                end
              end
            end
            object tabOrcamentoCustomizado: TcxTabSheet
              Caption = 'Campos Customizados'
              ImageIndex = 1
              object Panel1: TPanel
                Left = 0
                Top = 0
                Width = 965
                Height = 25
                Align = alTop
                TabOrder = 0
                object btnIncluirCampoCustomizado: TButton
                  Left = 1
                  Top = 1
                  Width = 200
                  Height = 23
                  Action = Ac_Incluir_Campo_Customizado
                  Align = alLeft
                  Images = dmPrincipal.imgIcons_16
                  TabOrder = 0
                end
                object btnEditar_Orcamento2: TButton
                  AlignWithMargins = True
                  Left = 201
                  Top = 2
                  Width = 127
                  Height = 21
                  Margins.Left = 0
                  Margins.Top = 1
                  Margins.Right = 2
                  Margins.Bottom = 1
                  Action = Ac_Editar_Orcamento
                  Align = alLeft
                  Images = dmPrincipal.imgIcons_16
                  TabOrder = 1
                  WordWrap = True
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
                object viewCamposCustomizados: TcxGridDBTableView
                  OnDblClick = viewRegistrosDetailDblClick
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
                  DataController.DataSource = dsOrcamento_Customizado
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  FilterRow.Visible = True
                  OptionsCustomize.ColumnsQuickCustomization = True
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsSelection.MultiSelect = True
                  OptionsView.NoDataToDisplayInfoText = '<Sem dados para mostrar>'
                  OptionsView.GroupByBox = False
                  object viewCamposCustomizadosID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewCamposCustomizadosCAMPO: TcxGridDBColumn
                    DataBinding.FieldName = 'CAMPO'
                    Options.Editing = False
                    Width = 307
                  end
                  object viewCamposCustomizadosCONTEUDO: TcxGridDBColumn
                    DataBinding.FieldName = 'CONTEUDO'
                    Options.Editing = False
                    Width = 449
                  end
                end
                object cxGridLevel2: TcxGridLevel
                  GridView = viewCamposCustomizados
                end
              end
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      OnShow = tabCadastroShow
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnEditsCadastro: TPanel
        object pnEditsCadastroTop: TPanel
          Left = 1
          Top = 1
          Width = 974
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label3: TLabel
            Left = 528
            Top = 2
            Width = 34
            Height = 13
            Caption = 'Modelo'
            FocusControl = cbModelo
          end
          object lbl1: TLabel
            Left = 318
            Top = 2
            Width = 46
            Height = 13
            Caption = 'Vendedor'
            FocusControl = cbVendedor
          end
          object lbl2: TLabel
            Left = 193
            Top = 2
            Width = 94
            Height = 13
            Caption = 'Data do Or'#231'amento'
            FocusControl = EditDataOrcamento
          end
          object lbl5: TLabel
            Left = 4
            Top = 2
            Width = 56
            Height = 13
            Caption = 'Cliente (F2)'
            FocusControl = cbCliente
          end
          object btnAdicionarCliente: TButton
            Left = 166
            Top = 16
            Width = 22
            Height = 21
            Action = Ac_Adicionar_Cliente
            Images = dmPrincipal.imgIcons_16
            TabOrder = 1
            TabStop = False
          end
          object cbCliente: TcxDBLookupComboBox
            Left = 2
            Top = 16
            RepositoryItem = dmLookup.repLcbFinForCli
            DataBinding.DataField = 'ID_CLIENTE'
            DataBinding.DataSource = dsMaster
            Properties.ListColumns = <>
            TabOrder = 0
            OnKeyDown = cbClienteKeyDown
            Width = 165
          end
          object cbModelo: TcxDBLookupComboBox
            Left = 526
            Top = 16
            RepositoryItem = dmLookup.repLcbModelo_Orcamento
            DataBinding.DataField = 'ID_MODELO_ORCAMENTO'
            DataBinding.DataSource = dsMaster
            Properties.ListColumns = <>
            Properties.OnEditValueChanged = cbModeloPropertiesEditValueChanged
            TabOrder = 4
            Width = 243
          end
          object cbVendedor: TcxDBLookupComboBox
            Left = 315
            Top = 16
            RepositoryItem = dmLookup.repLcbPessoa
            DataBinding.DataField = 'ID_RESPONSAVEL'
            DataBinding.DataSource = dsMaster
            Properties.ListColumns = <>
            TabOrder = 3
            Width = 209
          end
          object EditDataOrcamento: TcxDBDateEdit
            Left = 191
            Top = 16
            RepositoryItem = dmLookup.repDateDataPadrao
            DataBinding.DataField = 'DATA'
            DataBinding.DataSource = dsMaster
            TabOrder = 2
            Width = 121
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
        inherited btnSalvarDetail: TButton
          Width = 181
          WordWrap = True
          ExplicitWidth = 181
        end
        inherited btnCancelarDetail: TButton
          Left = 311
          ExplicitLeft = 311
        end
        inherited btnSalvarIncluirDetail: TButton
          Left = 191
          ExplicitLeft = 191
        end
        object btnRetornarConfiguracaoCampos: TButton
          AlignWithMargins = True
          Left = 402
          Top = 4
          Width = 143
          Height = 42
          Action = Ac_Retornar_Configuracao_Campos
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 3
          Visible = False
          WordWrap = True
        end
      end
      inherited pnEditsCadastroDetail: TPanel
        object pcCadastroDetail: TcxPageControl
          Left = 0
          Top = 0
          Width = 976
          Height = 398
          Align = alClient
          TabOrder = 0
          Properties.ActivePage = tabPreVisualizacao
          Properties.CustomButtons.Buttons = <>
          OnChange = pcCadastroDetailChange
          ClientRectBottom = 393
          ClientRectLeft = 2
          ClientRectRight = 971
          ClientRectTop = 25
          object tabCadastroItem: TcxTabSheet
            Caption = 'Itens do Or'#231'amento'
            ImageIndex = 0
            object Label4: TLabel
              Left = 7
              Top = 8
              Width = 22
              Height = 13
              Caption = 'Item'
              FocusControl = cbItem
            end
            object lbl6: TLabel
              Left = 7
              Top = 48
              Width = 64
              Height = 13
              Caption = 'Valor Unit'#225'rio'
              FocusControl = EditValorUnitario
            end
            object Label7: TLabel
              Left = 130
              Top = 48
              Width = 56
              Height = 13
              Caption = 'Quantidade'
              FocusControl = EditQtde
            end
            object lbUnidade: TLabel
              Left = 251
              Top = 71
              Width = 19
              Height = 13
              Caption = 'Und'
            end
            object lb2: TLabel
              AlignWithMargins = True
              Left = 253
              Top = 9
              Width = 36
              Height = 13
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 2
              Caption = 'Esp'#233'cie'
              FocusControl = cbEspecie
            end
            object Label5: TLabel
              AlignWithMargins = True
              Left = 488
              Top = 8
              Width = 68
              Height = 13
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 2
              Caption = 'Tamanho (cm)'
              FocusControl = cbEspecie
            end
            object cbItem: TcxDBLookupComboBox
              Left = 5
              Top = 24
              RepositoryItem = dmLookup.repLcbItem
              DataBinding.DataField = 'ID_ITEM'
              DataBinding.DataSource = dsDetail
              Properties.ListColumns = <>
              TabOrder = 0
              Width = 244
            end
            object EditValorUnitario: TcxDBCurrencyEdit
              Left = 5
              Top = 64
              RepositoryItem = dmLookup.repCurPadrao
              DataBinding.DataField = 'VALOR_UNITARIO'
              DataBinding.DataSource = dsDetail
              TabOrder = 3
              Width = 121
            end
            object EditQtde: TcxDBCalcEdit
              Left = 128
              Top = 64
              RepositoryItem = dmLookup.repCalcPadrao
              DataBinding.DataField = 'QTDE'
              DataBinding.DataSource = dsDetail
              TabOrder = 4
              Width = 121
            end
            object cbEspecie: TcxDBLookupComboBox
              Left = 250
              Top = 24
              RepositoryItem = dmLookup.repLcbEspecie
              DataBinding.DataField = 'ID_ESPECIE'
              DataBinding.DataSource = dsDetail
              Properties.ListColumns = <>
              Properties.ListOptions.SyncMode = True
              Properties.OnEditValueChanged = cbEspeciePropertiesEditValueChanged
              TabOrder = 1
              Width = 233
            end
            object EditTamanho: TcxDBCalcEdit
              Left = 487
              Top = 24
              DataBinding.DataField = 'TAMANHO'
              DataBinding.DataSource = dsDetail
              Properties.ClearKey = 46
              Properties.DisplayFormat = ',0.00 cm'
              Properties.UseThousandSeparator = True
              TabOrder = 2
              Width = 121
            end
          end
          object tabCadastroCampoCustomizavel: TcxTabSheet
            Caption = 'Campos Customizados'
            ImageIndex = 2
            object ScrollCampos: TcxScrollBox
              Left = 0
              Top = 0
              Width = 969
              Height = 368
              Align = alClient
              TabOrder = 0
            end
            object RichAux: TcxRichEdit
              Left = 195
              Top = 74
              Lines.Strings = (
                'RichAux')
              TabOrder = 1
              Visible = False
              Height = 289
              Width = 518
            end
          end
          object tabPreVisualizacao: TcxTabSheet
            Caption = 'Pr'#233'-Visualiza'#231#227'o do Or'#231'amento'
            ImageIndex = 1
            OnShow = tabPreVisualizacaoShow
            inline frameEditor: TframeEditor
              Left = 0
              Top = 0
              Width = 969
              Height = 368
              Align = alClient
              TabOrder = 0
              ExplicitWidth = 969
              ExplicitHeight = 368
              inherited pnRich: TPanel
                Width = 969
                Height = 346
                ExplicitWidth = 969
                ExplicitHeight = 346
                inherited Rich: TcxDBRichEdit
                  Left = 105
                  DataBinding.DataField = 'ORCAMENTO'
                  DataBinding.DataSource = dsOrcamento_Orcamento
                  ExplicitLeft = 105
                end
              end
              inherited ToolBar1: TToolBar
                Width = 969
                ExplicitWidth = 969
              end
            end
          end
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 184
    Top = 168
    inherited Ac_Salvar_Detail: TAction
      Caption = 'Salvar/Configurar Campos Customzados'
    end
    inherited Ac_Salvar_Incluir_Detail: TAction
      OnUpdate = Ac_Salvar_Incluir_DetailUpdate
    end
    object Ac_Adicionar_Cliente: TAction
      ImageIndex = 3
      OnExecute = Ac_Adicionar_ClienteExecute
    end
    object Ac_Incluir_Campo_Customizado: TAction
      Category = 'Detail'
      Caption = 'Configurar Campos Customiz'#225'veis'
      ImageIndex = 47
      OnExecute = Ac_Incluir_Campo_CustomizadoExecute
    end
    object Ac_Retornar_Configuracao_Campos: TAction
      Category = 'Detail'
      Caption = 'Configurar Campos Customizados'
      ImageIndex = 47
      OnExecute = Ac_Retornar_Configuracao_CamposExecute
    end
    object Ac_Gerar_Saida: TAction
      Category = 'Master'
      Caption = 'Gerar Sa'#237'da do Estoque'
      ImageIndex = 26
      OnExecute = Ac_Gerar_SaidaExecute
      OnUpdate = Ac_Gerar_SaidaUpdate
    end
    object Ac_Gerar_Venda: TAction
      Category = 'Master'
      Caption = 'Gerar Venda'
      ImageIndex = 27
      OnExecute = Ac_Gerar_VendaExecute
      OnUpdate = Ac_Gerar_SaidaUpdate
    end
    object Ac_Imprimir: TAction
      Category = 'Master'
      ImageIndex = 19
      OnExecute = Ac_ImprimirExecute
    end
    object Ac_Editar_Orcamento: TAction
      Caption = 'Editar Or'#231'amento'
      ImageIndex = 1
      OnExecute = Ac_Editar_OrcamentoExecute
      OnUpdate = Ac_Editar_OrcamentoUpdate
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmEstoque.cdsOrcamento
    Left = 264
    Top = 168
  end
  inherited dsDetail: TDataSource
    DataSet = dmEstoque.cdsOrcamento_Item
    Left = 344
    Top = 344
  end
  inherited fdExportDialog: TSaveTextFileDialog
    Left = 504
    Top = 344
  end
  object dsOrcamento_Orcamento: TDataSource
    DataSet = dmEstoque.cdsOrcamento_Orcamento
    Left = 360
    Top = 192
  end
  object dsOrcamento_Customizado: TDataSource
    DataSet = dmEstoque.cdsOrcamento_Customizado
    Left = 552
    Top = 176
  end
  object DBPipeOrganizacao: TppDBPipeline
    DataSource = dmLookup.dslkOrganizacao
    UserName = 'DBPipeOrganizacao'
    Left = 120
    Top = 160
    object DBPipeOrganizacaoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object DBPipeOrganizacaoppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 100
      DisplayWidth = 100
      Position = 1
    end
    object DBPipeOrganizacaoppField3: TppField
      FieldAlias = 'CNPJ'
      FieldName = 'CNPJ'
      FieldLength = 14
      DisplayWidth = 14
      Position = 2
    end
    object DBPipeOrganizacaoppField4: TppField
      FieldAlias = 'LOGO'
      FieldName = 'LOGO'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DBPipeOrganizacaoppField5: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 4
    end
    object DBPipeOrganizacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object DBPipeOrganizacaoppField7: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 6
    end
    object DBPipeOrganizacaoppField8: TppField
      FieldAlias = 'TELEFONE'
      FieldName = 'TELEFONE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object DBPipeOrganizacaoppField9: TppField
      FieldAlias = 'SITE'
      FieldName = 'SITE'
      FieldLength = 100
      DisplayWidth = 100
      Position = 8
    end
    object DBPipeOrganizacaoppField10: TppField
      FieldAlias = 'EMAIL'
      FieldName = 'EMAIL'
      FieldLength = 100
      DisplayWidth = 100
      Position = 9
    end
    object DBPipeOrganizacaoppField11: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 120
      DisplayWidth = 120
      Position = 10
    end
    object DBPipeOrganizacaoppField12: TppField
      FieldAlias = 'LOGO_SECUNDARIA'
      FieldName = 'LOGO_SECUNDARIA'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 11
      Searchable = False
      Sortable = False
    end
  end
  object ppOrcamento: TppReport
    AutoStop = False
    DataPipeline = DBPipeOrcamento
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
    Units = utMillimeters
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
    Left = 32
    Top = 160
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'DBPipeOrcamento'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 26458
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
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object ppDBRichText1: TppDBRichText
        DesignLayer = ppDesignLayer1
        UserName = 'DBRichText1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ExportRTFAsBitmap = True
        DataField = 'INICIO'
        DataPipeline = DBPipeOrcamento
        RemoveEmptyLines = False
        Stretch = True
        DataPipelineName = 'DBPipeOrcamento'
        mmHeight = 12267
        mmLeft = 9381
        mmTop = 265
        mmWidth = 178955
        BandType = 4
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
      end
      object ppSubReport1: TppSubReport
        DesignLayer = ppDesignLayer1
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppDBRichText1
        TraverseAllData = False
        DataPipelineName = 'DBPipeItens'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 12481
        mmWidth = 197300
        BandType = 4
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = DBPipeItens
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
          Units = utMillimeters
          Version = '16.02'
          mmColumnWidth = 0
          DataPipelineName = 'DBPipeItens'
          object ppTitleBand1: TppTitleBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 6350
            mmPrintPosition = 0
            object ppTableGrid2: TppTableGrid
              DesignLayer = ppDesignLayer2
              UserName = 'TableGrid2'
              DefaultColWidth = 12.699999809265140000
              DefaultRowHeight = 12.699999809265140000
              mmHeight = 6254
              mmLeft = 12639
              mmTop = 400
              mmWidth = 183184
              BandType = 1
              LayerName = Foreground1
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmMinHeight = 0
              mmDefaultRowHeight = 12700
              mmDefaultColWidth = 12700
              object ppTableRow2: TppTableRow
                DesignLayer = ppDesignLayer2
                UserName = 'TableRow2'
                mmHeight = 6254
                mmLeft = 0
                mmTop = 0
                mmWidth = 48948
                BandType = 4
                LayerName = Foreground1
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmMinHeight = 0
                object ppTableCell2: TppTableCell
                  DesignLayer = ppDesignLayer2
                  UserName = 'TableCell2'
                  Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
                  Border.Visible = True
                  Border.Weight = 1.000000000000000000
                  Brush.Style = bsClear
                  Padding = 1.057999968528748000
                  mmHeight = 23548
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 48948
                  BandType = 4
                  LayerName = Foreground1
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  mmMinHeight = 0
                  mmPadding = 1058
                  object ppLabel4: TppLabel
                    DesignLayer = ppDesignLayer2
                    UserName = 'Label4'
                    Anchors = [atLeft, atRight]
                    AutoSize = False
                    Caption = 'Esp'#233'cie'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    FormField = False
                    TextAlignment = taCentered
                    Transparent = True
                    VerticalAlignment = avCenter
                    mmHeight = 4234
                    mmLeft = 13758
                    mmTop = 2043
                    mmWidth = 22933
                    BandType = 1
                    LayerName = Foreground1
                  end
                end
                object ppTableCell4: TppTableCell
                  DesignLayer = ppDesignLayer2
                  UserName = 'TableCell4'
                  Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
                  Border.Visible = True
                  Border.Weight = 1.000000000000000000
                  Brush.Style = bsClear
                  Padding = 1.057999968528748000
                  mmHeight = 6254
                  mmLeft = 37688
                  mmTop = 0
                  mmWidth = 34154
                  BandType = 4
                  LayerName = Foreground1
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  mmMinHeight = 0
                  mmPadding = 1058
                  object ppLabel5: TppLabel
                    DesignLayer = ppDesignLayer2
                    UserName = 'Label5'
                    Anchors = [atLeft, atRight]
                    AutoSize = False
                    Caption = 'Nome Cient'#237'fico'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    FormField = False
                    TextAlignment = taCentered
                    Transparent = True
                    VerticalAlignment = avCenter
                    mmHeight = 4233
                    mmLeft = 38629
                    mmTop = 2123
                    mmWidth = 32280
                    BandType = 1
                    LayerName = Foreground1
                  end
                end
                object ppTableCell6: TppTableCell
                  DesignLayer = ppDesignLayer2
                  UserName = 'TableCell6'
                  Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
                  Border.Visible = True
                  Border.Weight = 1.000000000000000000
                  Brush.Style = bsClear
                  Padding = 1.057999968528748000
                  mmHeight = 23548
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 48948
                  BandType = 4
                  LayerName = Foreground1
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  mmMinHeight = 0
                  mmPadding = 1058
                  object ppLabel8: TppLabel
                    DesignLayer = ppDesignLayer2
                    UserName = 'Label8'
                    Anchors = [atLeft, atRight]
                    AutoSize = False
                    Caption = 'Fam'#237'lia Bot'#226'nica'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    FormField = False
                    TextAlignment = taCentered
                    Transparent = True
                    VerticalAlignment = avCenter
                    mmHeight = 4233
                    mmLeft = 73142
                    mmTop = 1852
                    mmWidth = 28840
                    BandType = 1
                    LayerName = Foreground1
                  end
                end
                object ppTableCell8: TppTableCell
                  DesignLayer = ppDesignLayer2
                  UserName = 'TableCell8'
                  Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
                  Border.Visible = True
                  Border.Weight = 1.000000000000000000
                  Brush.Style = bsClear
                  Padding = 1.057999968528748000
                  mmHeight = 23548
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 48948
                  BandType = 4
                  LayerName = Foreground1
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  mmMinHeight = 0
                  mmPadding = 1058
                  object ppLabel1: TppLabel
                    DesignLayer = ppDesignLayer2
                    UserName = 'Label1'
                    Anchors = [atLeft, atRight]
                    AutoSize = False
                    Caption = 'Tamanho'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    FormField = False
                    TextAlignment = taCentered
                    Transparent = True
                    VerticalAlignment = avCenter
                    mmHeight = 4233
                    mmLeft = 104098
                    mmTop = 1852
                    mmWidth = 22933
                    BandType = 1
                    LayerName = Foreground1
                  end
                end
                object ppTableCell10: TppTableCell
                  DesignLayer = ppDesignLayer2
                  UserName = 'TableCell10'
                  Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
                  Border.Visible = True
                  Border.Weight = 1.000000000000000000
                  Brush.Style = bsClear
                  Padding = 1.057999968528748000
                  mmHeight = 23548
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 48948
                  BandType = 4
                  LayerName = Foreground1
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  mmMinHeight = 0
                  mmPadding = 1058
                  object ppLabel9: TppLabel
                    DesignLayer = ppDesignLayer2
                    UserName = 'Label9'
                    Anchors = [atLeft, atRight]
                    AutoSize = False
                    Caption = 'Quantidade'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    FormField = False
                    TextAlignment = taCentered
                    Transparent = True
                    VerticalAlignment = avCenter
                    mmHeight = 4233
                    mmLeft = 129147
                    mmTop = 1852
                    mmWidth = 17199
                    BandType = 1
                    LayerName = Foreground1
                  end
                end
                object ppTableCell12: TppTableCell
                  DesignLayer = ppDesignLayer2
                  UserName = 'TableCell12'
                  Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
                  Border.Visible = True
                  Border.Weight = 1.000000000000000000
                  Brush.Style = bsClear
                  Padding = 1.057999968528748000
                  mmHeight = 23548
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 48948
                  BandType = 4
                  LayerName = Foreground1
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  mmMinHeight = 0
                  mmPadding = 1058
                  object ppLabel10: TppLabel
                    DesignLayer = ppDesignLayer2
                    UserName = 'Label10'
                    Anchors = [atLeft, atRight]
                    AutoSize = False
                    Caption = 'Pre'#231'o Unit'#225'rio'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    FormField = False
                    TextAlignment = taCentered
                    Transparent = True
                    VerticalAlignment = avCenter
                    mmHeight = 4233
                    mmLeft = 148432
                    mmTop = 1852
                    mmWidth = 21697
                    BandType = 1
                    LayerName = Foreground1
                  end
                end
                object ppTableCell14: TppTableCell
                  DesignLayer = ppDesignLayer2
                  UserName = 'TableCell14'
                  Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
                  Border.Visible = True
                  Border.Weight = 1.000000000000000000
                  Brush.Style = bsClear
                  Padding = 1.057999968528748000
                  mmHeight = 23548
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 48948
                  BandType = 4
                  LayerName = Foreground1
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  mmMinHeight = 0
                  mmPadding = 1058
                  object ppLabel7: TppLabel
                    DesignLayer = ppDesignLayer2
                    UserName = 'Label7'
                    Anchors = [atLeft, atRight]
                    AutoSize = False
                    Caption = 'Pre'#231'o Total'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    FormField = False
                    TextAlignment = taCentered
                    Transparent = True
                    VerticalAlignment = avCenter
                    mmHeight = 4233
                    mmLeft = 172275
                    mmTop = 1852
                    mmWidth = 22490
                    BandType = 1
                    LayerName = Foreground1
                  end
                end
              end
              object ppTableColumn8: TppTableColumn
                mmWidth = 25049
              end
              object ppTableColumn9: TppTableColumn
                mmWidth = 34396
              end
              object ppTableColumn10: TppTableColumn
                mmWidth = 30956
              end
              object ppTableColumn11: TppTableColumn
                mmWidth = 25049
              end
              object ppTableColumn12: TppTableColumn
                mmWidth = 19315
              end
              object ppTableColumn13: TppTableColumn
                mmWidth = 23813
              end
              object ppTableColumn14: TppTableColumn
                mmWidth = 24606
              end
            end
          end
          object ppDetailBand2: TppDetailBand
            Background1.Brush.Style = bsClear
            Background2.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object ppTableGrid1: TppTableGrid
              DesignLayer = ppDesignLayer2
              UserName = 'TableGrid1'
              DefaultColWidth = 12.699999809265140000
              DefaultRowHeight = 12.699999809265140000
              mmHeight = 5292
              mmLeft = 12713
              mmTop = 0
              mmWidth = 182847
              BandType = 4
              LayerName = Foreground1
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmMinHeight = 0
              mmDefaultRowHeight = 12700
              mmDefaultColWidth = 12700
              object ppTableRow1: TppTableRow
                DesignLayer = ppDesignLayer2
                UserName = 'TableRow1'
                mmHeight = 5292
                mmLeft = 0
                mmTop = 0
                mmWidth = 48948
                BandType = 4
                LayerName = Foreground1
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmMinHeight = 0
                object ppTableCell1: TppTableCell
                  DesignLayer = ppDesignLayer2
                  UserName = 'TableCell1'
                  Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
                  Border.Visible = True
                  Border.Weight = 1.000000000000000000
                  Brush.Style = bsClear
                  Padding = 1.057999968528748000
                  mmHeight = 23548
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 48948
                  BandType = 4
                  LayerName = Foreground1
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  mmMinHeight = 0
                  mmPadding = 1058
                  object ppDBText3: TppDBText
                    DesignLayer = ppDesignLayer2
                    UserName = 'DBText3'
                    Anchors = [atLeft, atRight]
                    DataField = 'ESPECIE'
                    DataPipeline = DBPipeItens
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'DBPipeItens'
                    mmHeight = 4233
                    mmLeft = 13291
                    mmTop = 529
                    mmWidth = 24003
                    BandType = 4
                    LayerName = Foreground1
                  end
                end
                object ppTableCell3: TppTableCell
                  DesignLayer = ppDesignLayer2
                  UserName = 'TableCell3'
                  Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
                  Border.Visible = True
                  Border.Weight = 1.000000000000000000
                  Brush.Style = bsClear
                  Padding = 1.057999968528748000
                  mmHeight = 23548
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 48948
                  BandType = 4
                  LayerName = Foreground1
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  mmMinHeight = 0
                  mmPadding = 1058
                  object ppDBText12: TppDBText
                    DesignLayer = ppDesignLayer2
                    UserName = 'DBText12'
                    Anchors = [atLeft, atRight]
                    DataField = 'NOME_CIENTIFICO'
                    DataPipeline = DBPipeItens
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'DBPipeItens'
                    mmHeight = 4233
                    mmLeft = 38485
                    mmTop = 529
                    mmWidth = 32895
                    BandType = 4
                    LayerName = Foreground1
                  end
                end
                object ppTableCell5: TppTableCell
                  DesignLayer = ppDesignLayer2
                  UserName = 'TableCell5'
                  Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
                  Border.Visible = True
                  Border.Weight = 1.000000000000000000
                  Brush.Style = bsClear
                  Padding = 1.057999968528748000
                  mmHeight = 23548
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 48948
                  BandType = 4
                  LayerName = Foreground1
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  mmMinHeight = 0
                  mmPadding = 1058
                  object ppDBText13: TppDBText
                    DesignLayer = ppDesignLayer2
                    UserName = 'DBText13'
                    Anchors = [atLeft, atRight]
                    DataField = 'FAMILIA_BOTANICA'
                    DataPipeline = DBPipeItens
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'DBPipeItens'
                    mmHeight = 4233
                    mmLeft = 72351
                    mmTop = 529
                    mmWidth = 29990
                    BandType = 4
                    LayerName = Foreground1
                  end
                end
                object ppTableCell7: TppTableCell
                  DesignLayer = ppDesignLayer2
                  UserName = 'TableCell7'
                  Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
                  Border.Visible = True
                  Border.Weight = 1.000000000000000000
                  Brush.Style = bsClear
                  Padding = 1.057999968528748000
                  mmHeight = 23548
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 48948
                  BandType = 4
                  LayerName = Foreground1
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  mmMinHeight = 0
                  mmPadding = 1058
                  object ppDBText4: TppDBText
                    DesignLayer = ppDesignLayer2
                    UserName = 'DBText4'
                    Anchors = [atLeft, atRight]
                    DataField = 'TAMANHO'
                    DataPipeline = DBPipeItens
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'DBPipeItens'
                    mmHeight = 4233
                    mmLeft = 103967
                    mmTop = 529
                    mmWidth = 22963
                    BandType = 4
                    LayerName = Foreground1
                  end
                end
                object ppTableCell9: TppTableCell
                  DesignLayer = ppDesignLayer2
                  UserName = 'TableCell9'
                  Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
                  Border.Visible = True
                  Border.Weight = 1.000000000000000000
                  Brush.Style = bsClear
                  Padding = 1.057999968528748000
                  mmHeight = 23548
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 48948
                  BandType = 4
                  LayerName = Foreground1
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  mmMinHeight = 0
                  mmPadding = 1058
                  object ppDBText15: TppDBText
                    DesignLayer = ppDesignLayer2
                    UserName = 'DBText15'
                    Anchors = [atLeft, atRight]
                    DataField = 'QTDE'
                    DataPipeline = DBPipeItens
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'DBPipeItens'
                    mmHeight = 4233
                    mmLeft = 129032
                    mmTop = 529
                    mmWidth = 17235
                    BandType = 4
                    LayerName = Foreground1
                  end
                end
                object ppTableCell11: TppTableCell
                  DesignLayer = ppDesignLayer2
                  UserName = 'TableCell11'
                  Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
                  Border.Visible = True
                  Border.Weight = 1.000000000000000000
                  Brush.Style = bsClear
                  Padding = 1.057999968528748000
                  mmHeight = 23548
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 48948
                  BandType = 4
                  LayerName = Foreground1
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  mmMinHeight = 0
                  mmPadding = 1058
                  object ppDBText16: TppDBText
                    DesignLayer = ppDesignLayer2
                    UserName = 'DBText16'
                    Anchors = [atLeft, atRight]
                    DataField = 'VALOR_UNITARIO'
                    DataPipeline = DBPipeItens
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'DBPipeItens'
                    mmHeight = 4233
                    mmLeft = 148383
                    mmTop = 529
                    mmWidth = 21727
                    BandType = 4
                    LayerName = Foreground1
                  end
                end
                object ppTableCell13: TppTableCell
                  DesignLayer = ppDesignLayer2
                  UserName = 'TableCell13'
                  Border.BorderPositions = [bpLeft, bpTop, bpRight, bpBottom]
                  Border.Visible = True
                  Border.Weight = 1.000000000000000000
                  Brush.Style = bsClear
                  Padding = 1.057999968528748000
                  mmHeight = 23548
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 48948
                  BandType = 4
                  LayerName = Foreground1
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  mmMinHeight = 0
                  mmPadding = 1058
                  object ppVariable1: TppVariable
                    DesignLayer = ppDesignLayer2
                    UserName = 'Variable1'
                    Anchors = [atLeft, atRight]
                    AutoSize = False
                    BlankWhenZero = False
                    CalcOrder = 0
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    mmHeight = 3704
                    mmLeft = 172240
                    mmTop = 1058
                    mmWidth = 22262
                    BandType = 4
                    LayerName = Foreground1
                  end
                end
              end
              object ppTableColumn1: TppTableColumn
                mmWidth = 25079
              end
              object ppTableColumn2: TppTableColumn
                mmWidth = 34131
              end
              object ppTableColumn3: TppTableColumn
                mmWidth = 30986
              end
              object ppTableColumn4: TppTableColumn
                mmWidth = 25079
              end
              object ppTableColumn5: TppTableColumn
                mmWidth = 19351
              end
              object ppTableColumn6: TppTableColumn
                mmWidth = 23843
              end
              object ppTableColumn7: TppTableColumn
                mmWidth = 24378
              end
            end
          end
          object ppSummaryBand1: TppSummaryBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {
              01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
              5661726961626C65314F6E43616C630B50726F6772616D54797065070B747450
              726F63656475726506536F75726365068D70726F636564757265205661726961
              626C65314F6E43616C63287661722056616C75653A2056617269616E74293B0D
              0A626567696E0D0A0D0A202056616C7565203A3D526F756E64546F2844425069
              70654974656E735B2756414C4F525F554E49544152494F275D2A204442506970
              654974656E735B2751544445275D2C2032293B200D0A0D0A656E643B0D0A0D43
              6F6D706F6E656E744E616D6506095661726961626C6531094576656E744E616D
              6506064F6E43616C63074576656E7449440221084361726574506F7301020002
              00000000}
          end
          object ppDesignLayers2: TppDesignLayers
            object ppDesignLayer2: TppDesignLayer
              UserName = 'Foreground1'
              LayerType = ltBanded
              Index = 0
            end
          end
        end
      end
      object ppDBRichText2: TppDBRichText
        DesignLayer = ppDesignLayer1
        UserName = 'DBRichText2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ExportRTFAsBitmap = True
        DataField = 'FIM'
        DataPipeline = DBPipeOrcamento
        RemoveEmptyLines = False
        ShiftRelativeTo = ppSubReport1
        Stretch = True
        DataPipelineName = 'DBPipeOrcamento'
        mmHeight = 12171
        mmLeft = 9260
        mmTop = 17198
        mmWidth = 178859
        BandType = 4
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
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
    object raCodeModule2: TraCodeModule
      ProgramStream = {00}
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
  object DBPipeOrcamento: TppDBPipeline
    DataSource = dsLocalOrcamento
    UserName = 'DBPipeOrcamento'
    Left = 224
    Top = 120
    object DBPipeOrcamentoppField1: TppField
      FieldAlias = 'INICIO'
      FieldName = 'INICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DBPipeOrcamentoppField2: TppField
      FieldAlias = 'FIM'
      FieldName = 'FIM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  object cdsLocalOrcamento: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 488
    Top = 240
    object cdsLocalOrcamentoINICIO: TBlobField
      FieldName = 'INICIO'
    end
    object cdsLocalOrcamentoFIM: TBlobField
      FieldName = 'FIM'
    end
  end
  object DBPipeItens: TppDBPipeline
    DataSource = dsDetail
    UserName = 'DBPipeItens'
    Left = 520
    Top = 104
    object DBPipeItensppField1: TppField
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DBPipeItensppField2: TppField
      FieldAlias = 'ID_ORCAMENTO'
      FieldName = 'ID_ORCAMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DBPipeItensppField3: TppField
      FieldAlias = 'ID_ITEM'
      FieldName = 'ID_ITEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DBPipeItensppField4: TppField
      FieldAlias = 'ID_ESPECIE'
      FieldName = 'ID_ESPECIE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DBPipeItensppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 4
    end
    object DBPipeItensppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_UNITARIO'
      FieldName = 'VALOR_UNITARIO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 5
    end
    object DBPipeItensppField7: TppField
      FieldAlias = 'ITEM'
      FieldName = 'ITEM'
      FieldLength = 100
      DisplayWidth = 100
      Position = 6
    end
    object DBPipeItensppField8: TppField
      FieldAlias = 'ESPECIE'
      FieldName = 'ESPECIE'
      FieldLength = 100
      DisplayWidth = 100
      Position = 7
    end
    object DBPipeItensppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'TAMANHO'
      FieldName = 'TAMANHO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 8
    end
    object DBPipeItensppField10: TppField
      FieldAlias = 'NOME_CIENTIFICO'
      FieldName = 'NOME_CIENTIFICO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 9
    end
    object DBPipeItensppField11: TppField
      FieldAlias = 'FAMILIA_BOTANICA'
      FieldName = 'FAMILIA_BOTANICA'
      FieldLength = 100
      DisplayWidth = 100
      Position = 10
    end
  end
  object dsLocalOrcamento: TDataSource
    DataSet = cdsLocalOrcamento
    Left = 464
    Top = 296
  end
end
