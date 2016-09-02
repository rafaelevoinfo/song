inherited frmCompra: TfrmCompra
  Caption = 'Compras'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
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
          object cbPesquisaPessoa: TcxLookupComboBox [1]
            Left = 138
            Top = 20
            RepositoryItem = dmLookup.repLcbPessoa
            Properties.ListColumns = <>
            TabOrder = 6
            Visible = False
            Width = 174
          end
          object cbItemPesquisa: TcxLookupComboBox [2]
            Left = 137
            Top = 20
            RepositoryItem = dmLookup.repLcbItem
            Properties.ListColumns = <>
            TabOrder = 5
            Visible = False
            Width = 175
          end
          object cbPesquisaFornecedor: TcxLookupComboBox [3]
            Left = 136
            Top = 20
            RepositoryItem = dmLookup.repLcbFornecedor
            Properties.ListColumns = <>
            TabOrder = 4
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
                Description = 'Data da Compra'
                Value = 4
              end
              item
                Description = 'Comprador'
                Value = 5
              end
              item
                Description = 'Item'
                Value = 6
              end
              item
                Description = 'C'#243'digo de Rastreio'
                Value = 7
              end
              item
                Description = 'Fornecedor'
                Value = 8
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
            Top = 33
            TabOrder = 7
            ExplicitLeft = 6
            ExplicitTop = 33
          end
        end
        inherited pnBotoes: TPanel
          Width = 563
          ExplicitWidth = 563
          inherited btnUtilizar: TButton
            Left = 409
            TabOrder = 4
            ExplicitLeft = 409
          end
          object btnProdutoEntregue: TButton
            AlignWithMargins = True
            Left = 188
            Top = 1
            Width = 100
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 2
            Margins.Bottom = 1
            Action = Ac_Produto_Entregue
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 2
            WordWrap = True
          end
          object btnGerarContaPagar: TButton
            AlignWithMargins = True
            Left = 290
            Top = 1
            Width = 117
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 2
            Margins.Bottom = 1
            Action = Ac_Gerar_Conta_Pagar
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 3
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
              Width = 47
            end
            object viewRegistrosID_FORNECEDOR: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ID_FORNECEDOR'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosFORNECEDOR: TcxGridDBColumn [2]
              DataBinding.FieldName = 'FORNECEDOR'
              Options.Editing = False
              Width = 192
            end
            object viewRegistrosID_PESSOA_COMPROU: TcxGridDBColumn [3]
              DataBinding.FieldName = 'ID_PESSOA_COMPROU'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosPESSOA_COMPROU: TcxGridDBColumn [4]
              DataBinding.FieldName = 'PESSOA_COMPROU'
              Options.Editing = False
              Width = 183
            end
            object viewRegistrosDATA: TcxGridDBColumn [5]
              DataBinding.FieldName = 'DATA'
              RepositoryItem = dmLookup.repDateDataPadrao
              Options.Editing = False
              Width = 83
            end
            object viewRegistrosVALOR_FRETE: TcxGridDBColumn [6]
              DataBinding.FieldName = 'VALOR_FRETE'
              RepositoryItem = dmLookup.repCurPadrao
              Options.Editing = False
              Width = 85
            end
            object viewRegistrosVALOR_TOTAL: TcxGridDBColumn [7]
              DataBinding.FieldName = 'VALOR_TOTAL'
              RepositoryItem = dmLookup.repCurPadrao
              Options.Editing = False
            end
            object viewRegistrosSTATUS_ENTREGA: TcxGridDBColumn [8]
              DataBinding.FieldName = 'STATUS_ENTREGA'
              RepositoryItem = dmLookup.repIcbStatusEntrega
              OnCustomDrawCell = viewRegistrosSTATUS_ENTREGACustomDrawCell
              Options.Editing = False
              Width = 92
            end
            object viewRegistrosGEROU_CONTA_PAGAR: TcxGridDBColumn [9]
              DataBinding.FieldName = 'GEROU_CONTA_PAGAR'
              OnCustomDrawCell = viewRegistrosGEROU_CONTA_PAGARCustomDrawCell
              Width = 106
            end
            object viewRegistrosCODIGO_RASTREIO: TcxGridDBColumn [10]
              DataBinding.FieldName = 'CODIGO_RASTREIO'
              Visible = False
              Options.Editing = False
            end
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              Caption = 'Itens'
              inherited cxGridRegistrosDetail: TcxGrid
                inherited viewRegistrosDetail: TcxGridDBTableView
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                    Visible = False
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
                    Width = 441
                  end
                  object viewRegistrosDetailID_ESPECIE: TcxGridDBColumn [3]
                    DataBinding.FieldName = 'ID_ESPECIE'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailESPECIE: TcxGridDBColumn [4]
                    DataBinding.FieldName = 'ESPECIE'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailQTDE: TcxGridDBColumn [5]
                    DataBinding.FieldName = 'CALC_QTDE'
                    Options.Editing = False
                    Width = 78
                  end
                  object viewRegistrosDetailVALOR_UNITARIO: TcxGridDBColumn [6]
                    DataBinding.FieldName = 'VALOR_UNITARIO'
                    RepositoryItem = dmLookup.repCurPadrao
                    Options.Editing = False
                  end
                  object viewRegistrosDetailCALC_VALOR_TOTAL: TcxGridDBColumn [7]
                    DataBinding.FieldName = 'CALC_VALOR_TOTAL'
                  end
                end
              end
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      inherited pnEditsCadastro: TPanel
        object lbl1: TLabel
          Left = 200
          Top = 8
          Width = 53
          Height = 13
          Caption = 'Comprador'
          FocusControl = cbComprador
        end
        object lbl2: TLabel
          Left = 413
          Top = 8
          Width = 78
          Height = 13
          Caption = 'Data da Compra'
          FocusControl = EditDataCompra
        end
        object lbStatusEntrega: TLabel
          Left = 828
          Top = 8
          Width = 87
          Height = 13
          Caption = 'Status da Entrega'
          FocusControl = cbStatusEntrega
        end
        object lbl4: TLabel
          Left = 7
          Top = 51
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = EditDescricao
        end
        object lbl5: TLabel
          Left = 9
          Top = 8
          Width = 78
          Height = 13
          Caption = 'Fornecedor (F2)'
          FocusControl = cbFornecedor
        end
        object Label3: TLabel
          Left = 536
          Top = 8
          Width = 68
          Height = 13
          Caption = 'Valor do Frete'
          FocusControl = EditValorFrete
        end
        object Label6: TLabel
          Left = 661
          Top = 8
          Width = 91
          Height = 13
          Caption = 'C'#243'digo de Rastreio'
          FocusControl = EditCodigoRastreio
        end
        object cbComprador: TcxDBLookupComboBox
          Left = 199
          Top = 24
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_PESSOA_COMPROU'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 2
          Width = 209
        end
        object EditDataCompra: TcxDBDateEdit
          Left = 411
          Top = 24
          RepositoryItem = dmLookup.repDateDataPadrao
          DataBinding.DataField = 'DATA'
          DataBinding.DataSource = dsMaster
          TabOrder = 3
          Width = 121
        end
        object cbStatusEntrega: TcxDBImageComboBox
          Left = 826
          Top = 24
          RepositoryItem = dmLookup.repIcbStatusEntrega
          DataBinding.DataField = 'STATUS_ENTREGA'
          DataBinding.DataSource = dsMaster
          Properties.Items = <>
          TabOrder = 6
          Width = 145
        end
        object EditDescricao: TcxDBMemo
          Left = 7
          Top = 67
          DataBinding.DataField = 'DESCRICAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 7
          Height = 62
          Width = 964
        end
        object cbFornecedor: TcxDBLookupComboBox
          Left = 7
          Top = 24
          RepositoryItem = dmLookup.repLcbFornecedor
          DataBinding.DataField = 'ID_FORNECEDOR'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 0
          OnKeyDown = cbFornecedorKeyDown
          Width = 165
        end
        object EditValorFrete: TcxDBCurrencyEdit
          Left = 535
          Top = 24
          RepositoryItem = dmLookup.repCurPadrao
          DataBinding.DataField = 'VALOR_FRETE'
          DataBinding.DataSource = dsMaster
          TabOrder = 4
          Width = 121
        end
        object EditCodigoRastreio: TcxDBTextEdit
          Left = 661
          Top = 24
          DataBinding.DataField = 'CODIGO_RASTREIO'
          DataBinding.DataSource = dsMaster
          TabOrder = 5
          Width = 156
        end
        object btnAdicionarFornecedor: TButton
          Left = 172
          Top = 24
          Width = 22
          Height = 21
          Action = Ac_Adicionar_Fornecedor
          Images = dmPrincipal.imgIcons_16
          TabOrder = 1
          TabStop = False
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnEditsCadastroDetail: TPanel
        object Label4: TLabel
          Left = 7
          Top = 8
          Width = 45
          Height = 13
          Caption = 'Item (F2)'
          FocusControl = cbItem
        end
        object Label5: TLabel
          Left = 246
          Top = 8
          Width = 36
          Height = 13
          Caption = 'Esp'#233'cie'
          FocusControl = cbEspecie
        end
        object Label7: TLabel
          Left = 579
          Top = 8
          Width = 56
          Height = 13
          Caption = 'Quantidade'
          FocusControl = EditQtde
        end
        object lbUnidade: TLabel
          Left = 700
          Top = 31
          Width = 19
          Height = 13
          Caption = 'Und'
        end
        object lbl6: TLabel
          Left = 455
          Top = 8
          Width = 64
          Height = 13
          Caption = 'Valor Unit'#225'rio'
          FocusControl = EditValorUnitario
        end
        object cbItem: TcxDBLookupComboBox
          Left = 4
          Top = 24
          RepositoryItem = dmLookup.repLcbItem
          DataBinding.DataField = 'ID_ITEM'
          DataBinding.DataSource = dsDetail
          Properties.ListColumns = <>
          Properties.OnEditValueChanged = cbItemPropertiesEditValueChanged
          TabOrder = 0
          OnKeyDown = cbItemKeyDown
          Width = 212
        end
        object cbEspecie: TcxDBLookupComboBox
          Left = 243
          Top = 24
          RepositoryItem = dmLookup.repLcbEspecie
          DataBinding.DataField = 'ID_ESPECIE'
          DataBinding.DataSource = dsDetail
          Enabled = False
          Properties.ListColumns = <>
          TabOrder = 1
          Width = 209
        end
        object EditQtde: TcxDBCalcEdit
          Left = 577
          Top = 24
          RepositoryItem = dmLookup.repCalcPadrao
          DataBinding.DataField = 'QTDE'
          DataBinding.DataSource = dsDetail
          TabOrder = 3
          Width = 121
        end
        object EditValorUnitario: TcxDBCurrencyEdit
          Left = 454
          Top = 24
          RepositoryItem = dmLookup.repCurPadrao
          DataBinding.DataField = 'VALOR_UNITARIO'
          DataBinding.DataSource = dsDetail
          TabOrder = 2
          Width = 121
        end
        object btnAdicionarItem: TButton
          Left = 217
          Top = 24
          Width = 22
          Height = 21
          Action = Ac_Adicionar_Item
          Images = dmPrincipal.imgIcons_16
          TabOrder = 4
          TabStop = False
        end
      end
    end
  end
  inherited ActionList1: TActionList
    object Ac_Produto_Entregue: TAction
      Category = 'Master'
      Caption = 'Entrar no Estoque'
      ImageIndex = 13
      OnExecute = Ac_Produto_EntregueExecute
      OnUpdate = Ac_Produto_EntregueUpdate
    end
    object Ac_Gerar_Conta_Pagar: TAction
      Category = 'Master'
      Caption = 'Gerar Conta a Pagar'
      ImageIndex = 14
      OnExecute = Ac_Gerar_Conta_PagarExecute
      OnUpdate = Ac_Gerar_Conta_PagarUpdate
    end
    object Ac_Adicionar_Item: TAction
      Category = 'Detail'
      ImageIndex = 3
      OnExecute = Ac_Adicionar_ItemExecute
    end
    object Ac_Adicionar_Fornecedor: TAction
      Category = 'Master'
      ImageIndex = 3
      OnExecute = Ac_Adicionar_FornecedorExecute
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmEstoque.cdsCompra
  end
  inherited dsDetail: TDataSource
    DataSet = dmEstoque.cdsCompra_Item
  end
end
