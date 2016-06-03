inherited frmVenda: TfrmVenda
  Caption = 'Vendas'
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
                Description = 'Data da Venda'
                Value = 4
              end
              item
                Description = 'Vendedor'
                Value = 5
              end
              item
                Description = 'Cliente'
                Value = 6
              end
              item
                Description = 'Item'
                Value = 7
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
          object cbPesquisaCliente: TcxLookupComboBox
            Left = 134
            Top = 20
            RepositoryItem = dmLookup.repLcbFornecedor
            Properties.ListColumns = <>
            TabOrder = 5
            Visible = False
            Width = 176
          end
          object cbItemPesquisa: TcxLookupComboBox
            Left = 135
            Top = 20
            RepositoryItem = dmLookup.repLcbItem
            Properties.ListColumns = <>
            TabOrder = 6
            Visible = False
            Width = 177
          end
          object cbPesquisaPessoa: TcxLookupComboBox
            Left = 136
            Top = 20
            RepositoryItem = dmLookup.repLcbPessoa
            Properties.ListColumns = <>
            TabOrder = 7
            Visible = False
            Width = 174
          end
        end
        inherited pnBotoes: TPanel
          Width = 563
          ExplicitWidth = 563
          inherited btnUtilizar: TButton
            Left = 307
            ExplicitLeft = 307
          end
          object btnGerarContaReceber: TButton
            AlignWithMargins = True
            Left = 188
            Top = 1
            Width = 117
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 2
            Margins.Bottom = 1
            Action = Ac_Gerar_Conta_Receber
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 2
            WordWrap = True
          end
          object btnGerarSaida: TButton
            AlignWithMargins = True
            Left = 86
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
            object viewRegistrosID_CLIENTE: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ID_CLIENTE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_PESSOA_VENDEU: TcxGridDBColumn [2]
              DataBinding.FieldName = 'ID_PESSOA_VENDEU'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosCLIENTE: TcxGridDBColumn [3]
              DataBinding.FieldName = 'CLIENTE'
              Options.Editing = False
              Width = 351
            end
            object viewRegistrosDATA: TcxGridDBColumn [4]
              DataBinding.FieldName = 'DATA'
              Options.Editing = False
              Width = 88
            end
            object viewRegistrosVALOR_TOTAL: TcxGridDBColumn [5]
              DataBinding.FieldName = 'VALOR_TOTAL'
              Options.Editing = False
              Width = 154
            end
            object viewRegistrosDESCRICAO: TcxGridDBColumn [6]
              DataBinding.FieldName = 'DESCRICAO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosVENDEDOR: TcxGridDBColumn [7]
              DataBinding.FieldName = 'VENDEDOR'
              Options.Editing = False
              Width = 167
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
                  object viewRegistrosDetailID_VENDA: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'ID_VENDA'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailID_ITEM: TcxGridDBColumn [2]
                    DataBinding.FieldName = 'ID_ITEM'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailID_ESPECIE: TcxGridDBColumn [3]
                    DataBinding.FieldName = 'ID_ESPECIE'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailITEM: TcxGridDBColumn [4]
                    DataBinding.FieldName = 'ITEM'
                    Options.Editing = False
                    Width = 370
                  end
                  object viewRegistrosDetailESPECIE: TcxGridDBColumn [5]
                    DataBinding.FieldName = 'ESPECIE'
                    Options.Editing = False
                    Width = 150
                  end
                  object viewRegistrosDetailCALC_QTDE: TcxGridDBColumn [6]
                    DataBinding.FieldName = 'CALC_QTDE'
                    Options.Editing = False
                    Width = 116
                  end
                  object viewRegistrosDetailQTDE: TcxGridDBColumn [7]
                    DataBinding.FieldName = 'QTDE'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailVALOR_UNITARIO: TcxGridDBColumn [8]
                    DataBinding.FieldName = 'VALOR_UNITARIO'
                    Options.Editing = False
                    Width = 141
                  end
                  object viewRegistrosDetailID_LOTE_SEMENTE: TcxGridDBColumn [9]
                    DataBinding.FieldName = 'ID_LOTE_SEMENTE'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailLOTE_SEMENTE: TcxGridDBColumn [10]
                    DataBinding.FieldName = 'LOTE_SEMENTE'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailID_LOTE_MUDA: TcxGridDBColumn [11]
                    DataBinding.FieldName = 'ID_LOTE_MUDA'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailLOTE_MUDA: TcxGridDBColumn [12]
                    DataBinding.FieldName = 'LOTE_MUDA'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailUNIDADE: TcxGridDBColumn [13]
                    DataBinding.FieldName = 'UNIDADE'
                    Visible = False
                    Options.Editing = False
                  end
                  inherited ColumnExcluirDetail: TcxGridDBColumn
                    MinWidth = 40
                    Width = 40
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
        object lbl5: TLabel
          Left = 9
          Top = 8
          Width = 33
          Height = 13
          Caption = 'Cliente'
          FocusControl = cbCliente
        end
        object lbl1: TLabel
          Left = 176
          Top = 8
          Width = 46
          Height = 13
          Caption = 'Vendedor'
          FocusControl = cbVendedor
        end
        object lbl2: TLabel
          Left = 389
          Top = 8
          Width = 71
          Height = 13
          Caption = 'Data da Venda'
          FocusControl = EditDataVenda
        end
        object lbl4: TLabel
          Left = 7
          Top = 51
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = EditDescricao
        end
        object cbCliente: TcxDBLookupComboBox
          Left = 7
          Top = 24
          RepositoryItem = dmLookup.repLcbFinForCli
          DataBinding.DataField = 'ID_CLIENTE'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 165
        end
        object cbVendedor: TcxDBLookupComboBox
          Left = 175
          Top = 24
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_PESSOA_VENDEU'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 1
          Width = 209
        end
        object EditDataVenda: TcxDBDateEdit
          Left = 387
          Top = 24
          RepositoryItem = dmLookup.repDateDataPadrao
          DataBinding.DataField = 'DATA'
          DataBinding.DataSource = dsMaster
          TabOrder = 2
          Width = 121
        end
        object EditDescricao: TcxDBMemo
          Left = 5
          Top = 67
          DataBinding.DataField = 'DESCRICAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 3
          Height = 62
          Width = 964
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
        object lbl6: TLabel
          Left = 5
          Top = 51
          Width = 64
          Height = 13
          Caption = 'Valor Unit'#225'rio'
          FocusControl = EditValorUnitario
        end
        object Label7: TLabel
          Left = 129
          Top = 51
          Width = 56
          Height = 13
          Caption = 'Quantidade'
          FocusControl = EditQtde
        end
        object lbUnidade: TLabel
          Left = 250
          Top = 74
          Width = 19
          Height = 13
          Caption = 'Und'
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
          Width = 244
        end
        object EditValorUnitario: TcxDBCurrencyEdit
          Left = 4
          Top = 67
          RepositoryItem = dmLookup.repCurPadrao
          DataBinding.DataField = 'VALOR_UNITARIO'
          DataBinding.DataSource = dsDetail
          TabOrder = 2
          Width = 121
        end
        object EditQtde: TcxDBCalcEdit
          Left = 127
          Top = 67
          RepositoryItem = dmLookup.repCalcPadrao
          DataBinding.DataField = 'QTDE'
          DataBinding.DataSource = dsDetail
          TabOrder = 3
          Width = 121
        end
        object pnEspecieLotes: TPanel
          Left = 248
          Top = 9
          Width = 572
          Height = 36
          BevelOuter = bvNone
          TabOrder = 1
          Visible = False
          object pnLoteSemente: TPanel
            Left = 185
            Top = 0
            Width = 185
            Height = 36
            Align = alLeft
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
            object lb1: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 0
              Width = 182
              Height = 13
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 2
              Align = alTop
              Caption = 'Lote de Semente'
              FocusControl = cbLoteSemente
              ExplicitWidth = 81
            end
            object cbLoteSemente: TcxDBLookupComboBox
              Left = 0
              Top = 15
              Align = alTop
              RepositoryItem = dmLookup.repLcbLoteSemente
              DataBinding.DataField = 'ID_LOTE_SEMENTE'
              DataBinding.DataSource = dsDetail
              Properties.ListColumns = <>
              Properties.ListOptions.SyncMode = True
              TabOrder = 0
              Width = 185
            end
          end
          object pnLoteMuda: TPanel
            Left = 370
            Top = 0
            Width = 185
            Height = 36
            Align = alLeft
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 2
            object Label3: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 0
              Width = 182
              Height = 13
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 2
              Align = alTop
              Caption = 'Lote de Muda'
              FocusControl = cbLoteMuda
              ExplicitWidth = 65
            end
            object cbLoteMuda: TcxDBLookupComboBox
              Left = 0
              Top = 15
              Align = alTop
              RepositoryItem = dmLookup.repLcbLoteMuda
              DataBinding.DataField = 'ID_LOTE_MUDA'
              DataBinding.DataSource = dsDetail
              Properties.ListColumns = <>
              Properties.ListOptions.SyncMode = True
              TabOrder = 0
              Width = 185
            end
          end
          object pnEspecie: TPanel
            Left = 0
            Top = 0
            Width = 185
            Height = 36
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object lb2: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 0
              Width = 182
              Height = 13
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 2
              Align = alTop
              Caption = 'Esp'#233'cie'
              FocusControl = cbEspecie
              ExplicitWidth = 36
            end
            object cbEspecie: TcxDBLookupComboBox
              Left = 0
              Top = 15
              Align = alTop
              RepositoryItem = dmLookup.repLcbEspecie
              DataBinding.DataField = 'ID_ESPECIE'
              DataBinding.DataSource = dsDetail
              Properties.ListColumns = <>
              Properties.ListOptions.SyncMode = True
              Properties.OnEditValueChanged = cbEspeciePropertiesEditValueChanged
              TabOrder = 0
              Width = 185
            end
          end
        end
      end
    end
  end
  inherited ActionList1: TActionList
    object Ac_Gerar_Conta_Receber: TAction
      Category = 'Master'
      Caption = 'Gerar Conta a Receber'
      ImageIndex = 14
      OnExecute = Ac_Gerar_Conta_ReceberExecute
    end
    object Ac_Gerar_Saida: TAction
      Category = 'Master'
      Caption = 'Gerar Sa'#237'da'
      ImageIndex = 13
      OnExecute = Ac_Gerar_SaidaExecute
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmEstoque.cdsVenda
    Left = 272
    Top = 232
  end
  inherited dsDetail: TDataSource
    DataSet = dmEstoque.cdsVenda_Item
  end
end
