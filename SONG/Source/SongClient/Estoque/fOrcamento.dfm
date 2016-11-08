inherited frmOrcamento: TfrmOrcamento
  ActiveControl = btnIncluir
  Caption = 'Or'#231'amento'
  OnDestroy = FormDestroy
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
            Left = 479
            ExplicitLeft = 479
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
          object btnEnviarEmail: TButton
            AlignWithMargins = True
            Left = 377
            Top = 1
            Width = 100
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 2
            Margins.Bottom = 1
            Action = Ac_Enviar_Email
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 5
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
                    Options.Editing = False
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
                    Options.Editing = False
                    Width = 150
                  end
                  object viewRegistrosDetailFAMILIA_BOTANICA: TcxGridDBColumn [7]
                    DataBinding.FieldName = 'FAMILIA_BOTANICA'
                    Visible = False
                    Options.Editing = False
                    Width = 150
                  end
                  object viewRegistrosDetailQTDE: TcxGridDBColumn [8]
                    DataBinding.FieldName = 'QTDE'
                    RepositoryItem = dmLookup.repCalcPadrao
                    Options.Editing = False
                  end
                  object viewRegistrosDetailVALOR_UNITARIO: TcxGridDBColumn [9]
                    DataBinding.FieldName = 'VALOR_UNITARIO'
                    Options.Editing = False
                  end
                  object viewRegistrosDetailCALC_VALOR_TOTAL: TcxGridDBColumn [10]
                    DataBinding.FieldName = 'CALC_VALOR_TOTAL'
                    Options.Editing = False
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
          Properties.ActivePage = tabCadastroItem
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
  object pnCorpoEmail: TPanel [1]
    Left = 8
    Top = 190
    Width = 486
    Height = 219
    TabOrder = 1
    Visible = False
    object mmoCorpoEmail: TMemo
      Left = 1
      Top = 57
      Width = 484
      Height = 120
      Align = alClient
      Lines.Strings = (
        'mmoCorpoEmail')
      TabOrder = 0
    end
    object pnBotoesCorpoEmail: TPanel
      Left = 1
      Top = 177
      Width = 484
      Height = 41
      Align = alBottom
      TabOrder = 1
      object btnOk: TButton
        Left = 360
        Top = 1
        Width = 123
        Height = 39
        Align = alRight
        Caption = 'Enviar'
        ImageIndex = 60
        Images = dmPrincipal.imgIcons_32
        ModalResult = 1
        TabOrder = 0
      end
      object btnRetornar: TButton
        Left = 237
        Top = 1
        Width = 123
        Height = 39
        Align = alRight
        Caption = 'Cancelar'
        ImageIndex = 5
        Images = dmPrincipal.imgIcons_32
        ModalResult = 2
        TabOrder = 1
      end
    end
    object pnEmail: TPanel
      Left = 1
      Top = 1
      Width = 484
      Height = 56
      Align = alTop
      TabOrder = 2
      object Label6: TLabel
        Left = 2
        Top = 2
        Width = 243
        Height = 13
        Caption = 'Selecione o e-mail para enviou ou informe um novo'
      end
      object Label8: TLabel
        Left = 1
        Top = 40
        Width = 97
        Height = 13
        Caption = 'Mensagem do e-mail'
      end
      object cbEmails: TcxComboBox
        Left = 0
        Top = 18
        TabOrder = 0
        Width = 481
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
    object Ac_Enviar_Email: TAction
      Category = 'Master'
      Caption = 'Enviar por E-Mail'
      ImageIndex = 60
      OnExecute = Ac_Enviar_EmailExecute
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
  object frxDBOrcamento: TfrxDBDataset
    UserName = 'frxDBOrcamento'
    CloseDataSource = False
    DataSet = dmEstoque.cdsOrcamento_Orcamento
    BCDToCurrency = False
    Left = 134
    Top = 371
  end
  object frxReport: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42679.744301643500000000
    ReportOptions.LastChange = 42679.744301643500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 62
    Top = 371
    Datasets = <
      item
        DataSet = frxDBOrcamento
        DataSetName = 'frxDBOrcamento'
      end
      item
        DataSet = frxDBOrganizacao
        DataSetName = 'frxDBOrganizacao'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 8.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 264.567100000000000000
        Top = 166.299320000000000000
        Width = 725.669760000000000000
        DataSet = frxDBOrcamento
        DataSetName = 'frxDBOrcamento'
        RowCount = 0
        Stretched = True
        object Rich1: TfrxRichView
          Left = 3.779530000000000000
          Width = 702.992580000000000000
          Height = 264.567100000000000000
          StretchMode = smActualHeight
          AllowExpressions = False
          DataField = 'ORCAMENTO'
          DataSet = frxDBOrcamento
          DataSetName = 'frxDBOrcamento'
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          Wysiwyg = False
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C636F
            6C6F7274626C203B5C726564305C677265656E305C626C7565303B7D0D0A7B5C
            2A5C67656E657261746F722052696368656432302031302E302E31343339337D
            5C766965776B696E64345C756331200D0A5C706172645C6366315C66305C6673
            31365C7061720D0A7D0D0A00}
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 725.669760000000000000
        object Picture1: TfrxPictureView
          Align = baLeft
          Top = 3.779530000000001000
          Width = 117.165430000000000000
          Height = 79.370130000000000000
          DataField = 'LOGO'
          DataSet = frxDBOrganizacao
          DataSetName = 'frxDBOrganizacao'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Picture2: TfrxPictureView
          Align = baRight
          Left = 616.063390000000000000
          Width = 109.606370000000000000
          Height = 83.149660000000000000
          DataField = 'LOGO_SECUNDARIA'
          DataSet = frxDBOrganizacao
          DataSetName = 'frxDBOrganizacao'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frxDBOrganizacaoNOME: TfrxMemoView
          Align = baCenter
          Left = 136.063080000000000000
          Top = 3.779530000000001000
          Width = 453.543600000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'NOME'
          DataSet = frxDBOrganizacao
          DataSetName = 'frxDBOrganizacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -17
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBOrganizacao."NOME"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Align = baRight
          Left = 510.236550000000000000
          Top = 22.677180000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Insc. Est.: Isento')
          ParentFont = False
        end
        object FormatMaskText: TfrxMemoView
          Align = baLeft
          Left = 117.165430000000000000
          Top = 22.677180000000000000
          Width = 381.732530000000000000
          Height = 18.897650000000000000
          DataSet = frxDBOrganizacao
          DataSetName = 'frxDBOrganizacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            
              'CNPJ: [FormatMaskText('#39'00\.000\.000\/0000\-00;0;_'#39',<frxDBOrganiz' +
              'acao."CNPJ">)]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 49.133890000000000000
        Top = 536.693260000000000000
        Width = 725.669760000000000000
        object Memo4: TfrxMemoView
          Left = 107.047310000000000000
          Top = 3.779530000000022000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'ENDERECO'
          DataSet = frxDBOrganizacao
          DataSetName = 'frxDBOrganizacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBOrganizacao."ENDERECO"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baLeft
          Left = 254.448980000000000000
          Top = 3.779530000000022000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'BAIRRO'
          DataSet = frxDBOrganizacao
          DataSetName = 'frxDBOrganizacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBOrganizacao."BAIRRO"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Align = baLeft
          Left = 435.866420000000000000
          Top = 3.779530000000022000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'COMPLEMENTO'
          DataSet = frxDBOrganizacao
          DataSetName = 'frxDBOrganizacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBOrganizacao."COMPLEMENTO"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Align = baLeft
          Left = 617.283860000000000000
          Top = 3.779530000000022000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'CIDADE'
          DataSet = frxDBOrganizacao
          DataSetName = 'frxDBOrganizacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBOrganizacao."CIDADE"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 159.181200000000000000
          Top = 22.677180000000020000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'SITE'
          DataSet = frxDBOrganizacao
          DataSetName = 'frxDBOrganizacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBOrganizacao."SITE"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Align = baLeft
          Left = 325.480520000000000000
          Top = 22.677180000000020000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'EMAIL'
          DataSet = frxDBOrganizacao
          DataSetName = 'frxDBOrganizacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBOrganizacao."EMAIL"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Align = baLeft
          Left = 506.897960000000000000
          Top = 22.677180000000020000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'TELEFONE'
          DataSet = frxDBOrganizacao
          DataSetName = 'frxDBOrganizacao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBOrganizacao."TELEFONE"]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 453.543600000000000000
        Width = 725.669760000000000000
        RowCount = 0
      end
    end
  end
  object frxRichObject: TfrxRichObject
    Left = 222
    Top = 379
  end
  object frxDBOrganizacao: TfrxDBDataset
    UserName = 'frxDBOrganizacao'
    CloseDataSource = False
    DataSet = dmLookup.cdslkOrganizacao
    BCDToCurrency = False
    Left = 136
    Top = 304
  end
end
