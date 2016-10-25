inherited frmOrcamento: TfrmOrcamento
  ActiveControl = btnIncluir
  Caption = 'Or'#231'amento'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabPesquisa
    inherited tabPesquisa: TcxTabSheet
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
              inherited cxGridRegistrosDetail: TcxGrid
                inherited viewRegistrosDetail: TcxGridDBTableView
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
                  object viewRegistrosDetailID_ESPECIE: TcxGridDBColumn [3]
                    DataBinding.FieldName = 'ID_ESPECIE'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailESPECIE: TcxGridDBColumn [4]
                    DataBinding.FieldName = 'ESPECIE'
                    Options.Editing = False
                    Width = 303
                  end
                  object viewRegistrosDetailQTDE: TcxGridDBColumn [5]
                    DataBinding.FieldName = 'QTDE'
                    Options.Editing = False
                  end
                  object viewRegistrosDetailVALOR_UNITARIO: TcxGridDBColumn [6]
                    DataBinding.FieldName = 'VALOR_UNITARIO'
                    Options.Editing = False
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
          Properties.ActivePage = tabCadastroCampoCustomizavel
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
              Left = 485
              Top = 8
              Width = 64
              Height = 13
              Caption = 'Valor Unit'#225'rio'
              FocusControl = EditValorUnitario
            end
            object Label7: TLabel
              Left = 609
              Top = 8
              Width = 56
              Height = 13
              Caption = 'Quantidade'
              FocusControl = EditQtde
            end
            object lbUnidade: TLabel
              Left = 730
              Top = 31
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
              Left = 484
              Top = 24
              RepositoryItem = dmLookup.repCurPadrao
              DataBinding.DataField = 'VALOR_UNITARIO'
              DataBinding.DataSource = dsDetail
              TabOrder = 2
              Width = 121
            end
            object EditQtde: TcxDBCalcEdit
              Left = 607
              Top = 24
              RepositoryItem = dmLookup.repCalcPadrao
              DataBinding.DataField = 'QTDE'
              DataBinding.DataSource = dsDetail
              TabOrder = 3
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
              object RichAux: TcxRichEdit
                Left = 3
                Top = 64
                Lines.Strings = (
                  'RichAux')
                TabOrder = 0
                Visible = False
                Height = 121
                Width = 385
              end
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
    Left = 168
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
end
