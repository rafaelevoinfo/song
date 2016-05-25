inherited frmCompra: TfrmCompra
  Caption = 'Compras'
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
          Left = 564
          Width = 411
          ExplicitLeft = 564
          ExplicitWidth = 411
          inherited Label1: TLabel
            Left = 4
            ExplicitLeft = 4
          end
          inherited pnData: TPanel
            Left = 183
            ExplicitLeft = 183
          end
          inherited EditPesquisa: TcxButtonEdit
            Left = 135
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
                Description = 'C'#243'digo'
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
            ExplicitLeft = 2
          end
          inherited btnPesquisar: TButton
            Left = 311
            ExplicitLeft = 311
          end
          inherited rgStatus: TcxRadioGroup
            Left = 6
            Top = 33
            ExplicitLeft = 6
            ExplicitTop = 33
          end
          object cbPesquisaPessoa: TcxLookupComboBox
            Left = 138
            Top = 20
            RepositoryItem = dmLookup.repLcbPessoa
            Properties.ListColumns = <>
            TabOrder = 5
            Visible = False
            Width = 174
          end
          object cbItemPesquisa: TcxLookupComboBox
            Left = 137
            Top = 20
            RepositoryItem = dmLookup.repLcbItem
            Properties.ListColumns = <>
            TabOrder = 6
            Visible = False
            Width = 175
          end
          object cbPesquisaFornecedor: TcxLookupComboBox
            Left = 136
            Top = 20
            RepositoryItem = dmLookup.repLcbFornecedor
            Properties.ListColumns = <>
            TabOrder = 7
            Visible = False
            Width = 176
          end
        end
        inherited pnBotoes: TPanel
          Width = 563
          ExplicitWidth = 563
          inherited btnUtilizar: TButton
            Left = 307
            ExplicitLeft = 307
          end
          object btnProdutoEntregue: TButton
            AlignWithMargins = True
            Left = 86
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
            Left = 188
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
            object viewRegistrosSTATUS_ENTREGA: TcxGridDBColumn [6]
              DataBinding.FieldName = 'STATUS_ENTREGA'
              RepositoryItem = dmLookup.repIcbStatusEntrega
              OnCustomDrawCell = viewRegistrosSTATUS_ENTREGACustomDrawCell
              Options.Editing = False
              Width = 92
            end
            object viewRegistrosVALOR_FRETE: TcxGridDBColumn [7]
              DataBinding.FieldName = 'VALOR_FRETE'
              RepositoryItem = dmLookup.repCurPadrao
              Options.Editing = False
              Width = 85
            end
            object viewRegistrosVALOR_TOTAL: TcxGridDBColumn [8]
              DataBinding.FieldName = 'VALOR_TOTAL'
              RepositoryItem = dmLookup.repCurPadrao
              Options.Editing = False
            end
            object viewRegistrosCODIGO_RASTREIO: TcxGridDBColumn [9]
              DataBinding.FieldName = 'CODIGO_RASTREIO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosDESCRICAO: TcxGridDBColumn [10]
              DataBinding.FieldName = 'DESCRICAO'
              Visible = False
              Options.Editing = False
            end
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              Caption = 'Itens'
              ExplicitLeft = 2
              ExplicitTop = 25
              ExplicitWidth = 965
              ExplicitHeight = 156
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
                    Width = 520
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
                    DataBinding.FieldName = 'QTDE'
                    Options.Editing = False
                  end
                  object viewRegistrosDetailVALOR_UNITARIO: TcxGridDBColumn [6]
                    DataBinding.FieldName = 'VALOR_UNITARIO'
                    RepositoryItem = dmLookup.repCurPadrao
                    Options.Editing = False
                  end
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
        object lbl1: TLabel
          Left = 176
          Top = 8
          Width = 53
          Height = 13
          Caption = 'Comprador'
          FocusControl = cbComprador
        end
        object lbl2: TLabel
          Left = 389
          Top = 8
          Width = 78
          Height = 13
          Caption = 'Data da Compra'
          FocusControl = EditDataCompra
        end
        object lbl3: TLabel
          Left = 640
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
          Width = 55
          Height = 13
          Caption = 'Fornecedor'
          FocusControl = cbFornecedor
        end
        object Label3: TLabel
          Left = 512
          Top = 8
          Width = 68
          Height = 13
          Caption = 'Valor do Frete'
          FocusControl = EditValorFrete
        end
        object Label6: TLabel
          Left = 789
          Top = 8
          Width = 91
          Height = 13
          Caption = 'C'#243'digo de Rastreio'
          FocusControl = EditCodigoRastreio
        end
        object cbComprador: TcxDBLookupComboBox
          Left = 175
          Top = 24
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_PESSOA_COMPROU'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 1
          Width = 209
        end
        object EditDataCompra: TcxDBDateEdit
          Left = 387
          Top = 24
          RepositoryItem = dmLookup.repDateDataPadrao
          DataBinding.DataField = 'DATA'
          DataBinding.DataSource = dsMaster
          TabOrder = 2
          Width = 121
        end
        object cbStatusEntrega: TcxDBImageComboBox
          Left = 638
          Top = 24
          RepositoryItem = dmLookup.repIcbStatusEntrega
          DataBinding.DataField = 'STATUS_ENTREGA'
          DataBinding.DataSource = dsMaster
          Properties.Items = <>
          TabOrder = 4
          Width = 145
        end
        object EditDescricao: TcxDBMemo
          Left = 5
          Top = 67
          DataBinding.DataField = 'DESCRICAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 6
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
          Width = 165
        end
        object EditValorFrete: TcxDBCurrencyEdit
          Left = 511
          Top = 24
          RepositoryItem = dmLookup.repCurPadrao
          DataBinding.DataField = 'VALOR_FRETE'
          DataBinding.DataSource = dsMaster
          TabOrder = 3
          Width = 121
        end
        object EditCodigoRastreio: TcxDBTextEdit
          Left = 789
          Top = 24
          DataBinding.DataField = 'CODIGO_RASTREIO'
          DataBinding.DataSource = dsMaster
          TabOrder = 5
          Width = 180
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
          Width = 22
          Height = 13
          Caption = 'Item'
          FocusControl = cbItem
        end
        object Label5: TLabel
          Left = 222
          Top = 8
          Width = 36
          Height = 13
          Caption = 'Esp'#233'cie'
          FocusControl = cbEspecie
        end
        object Label7: TLabel
          Left = 555
          Top = 8
          Width = 56
          Height = 13
          Caption = 'Quantidade'
          FocusControl = EditQtde
        end
        object lbUnidade: TLabel
          Left = 676
          Top = 31
          Width = 19
          Height = 13
          Caption = 'Und'
        end
        object lbl6: TLabel
          Left = 431
          Top = 8
          Width = 79
          Height = 13
          Caption = 'Valor do Unit'#225'rio'
          FocusControl = EditDataCompra
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
          Width = 212
        end
        object cbEspecie: TcxDBLookupComboBox
          Left = 219
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
          Left = 553
          Top = 24
          RepositoryItem = dmLookup.repCalcPadrao
          DataBinding.DataField = 'QTDE'
          DataBinding.DataSource = dsDetail
          TabOrder = 3
          Width = 121
        end
        object EditValorUnitario: TcxDBCurrencyEdit
          Left = 430
          Top = 24
          RepositoryItem = dmLookup.repCurPadrao
          DataBinding.DataField = 'VALOR_UNITARIO'
          DataBinding.DataSource = dsDetail
          TabOrder = 2
          Width = 121
        end
      end
    end
  end
  inherited ActionList1: TActionList
    object Ac_Produto_Entregue: TAction
      Category = 'Master'
      Caption = 'Produto Entregue'
      ImageIndex = 13
      OnExecute = Ac_Produto_EntregueExecute
      OnUpdate = Ac_Produto_EntregueUpdate
    end
    object Ac_Gerar_Conta_Pagar: TAction
      Category = 'Master'
      Caption = 'Gerar Conta a Pagar'
      ImageIndex = 14
      OnExecute = Ac_Gerar_Conta_PagarExecute
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmEstoque.cdsCompra
  end
  inherited dsDetail: TDataSource
    DataSet = dmEstoque.cdsCompra_Item
  end
end
