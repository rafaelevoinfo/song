inherited frmSaida: TfrmSaida
  Caption = 'Sa'#237'da'
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
          Left = 428
          Width = 547
          ExplicitLeft = 428
          ExplicitWidth = 547
          inherited Label1: TLabel
            Left = 4
            ExplicitLeft = 4
          end
          object Label8: TLabel [1]
            Left = 135
            Top = 4
            Width = 36
            Height = 13
            Caption = 'Esp'#233'cie'
          end
          inherited rgStatus: TcxRadioGroup [2]
            Left = 5
            Top = 38
            ExplicitLeft = 5
            ExplicitTop = 38
          end
          inherited pnData: TPanel [3]
            Left = 319
            ExplicitLeft = 319
          end
          inherited EditPesquisa: TcxButtonEdit [4]
            Left = 271
            ExplicitLeft = 271
          end
          inherited cbPesquisarPor: TcxImageComboBox [5]
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
                Description = 'Data'
                Value = 4
              end
              item
                Description = 'Item'
                Value = 5
              end
              item
                Description = 'Tipo de Sa'#237'da'
                Value = 6
              end
              item
                Description = 'Id da Venda'
                Value = 7
              end>
            ExplicitLeft = 2
          end
          inherited btnPesquisar: TButton [6]
            Left = 447
            ExplicitLeft = 447
          end
          object cbPesquisaItem: TcxLookupComboBox
            Left = 271
            Top = 21
            RepositoryItem = dmLookup.repLcbItem
            Properties.ListColumns = <>
            TabOrder = 5
            Visible = False
            Width = 175
          end
          object cbPesquisaTipoSaida: TcxImageComboBox
            Left = 273
            Top = 20
            RepositoryItem = dmLookup.repIcbTipoSaida
            Properties.Items = <>
            TabOrder = 6
            Visible = False
            Width = 175
          end
          object cbPesquisaEspecie: TcxLookupComboBox
            Left = 132
            Top = 20
            RepositoryItem = dmLookup.repLcbEspecie
            Properties.ListColumns = <>
            TabOrder = 7
            Width = 137
          end
        end
        inherited pnBotoes: TPanel
          Width = 427
          ExplicitWidth = 427
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Options.Editing = False
            end
            object viewRegistrosDATA: TcxGridDBColumn [1]
              DataBinding.FieldName = 'DATA'
              Options.Editing = False
              Width = 106
            end
            object viewRegistrosTIPO: TcxGridDBColumn [2]
              DataBinding.FieldName = 'TIPO'
              RepositoryItem = dmLookup.repIcbTipoSaida
              Options.Editing = False
              Width = 122
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
                    Width = 47
                  end
                  object viewRegistrosDetailID_SAIDA: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'ID_SAIDA'
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
                  end
                  object viewRegistrosDetailNOME_ITEM: TcxGridDBColumn [4]
                    DataBinding.FieldName = 'NOME_ITEM'
                    Options.Editing = False
                    Width = 179
                  end
                  object viewRegistrosDetailNOME_ESPECIE: TcxGridDBColumn [5]
                    DataBinding.FieldName = 'NOME_ESPECIE'
                    Width = 183
                  end
                  object viewRegistrosDetailID_LOTE_SEMENTE: TcxGridDBColumn [6]
                    DataBinding.FieldName = 'ID_LOTE_SEMENTE'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailID_LOTE_MUDA: TcxGridDBColumn [7]
                    DataBinding.FieldName = 'ID_LOTE_MUDA'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailLOTE_SEMENTE: TcxGridDBColumn [8]
                    DataBinding.FieldName = 'LOTE_SEMENTE'
                    Options.Editing = False
                    Width = 150
                  end
                  object viewRegistrosDetailLOTE_MUDA: TcxGridDBColumn [9]
                    DataBinding.FieldName = 'LOTE_MUDA'
                    Options.Editing = False
                    Width = 178
                  end
                  object viewRegistrosDetailQTDE: TcxGridDBColumn [10]
                    DataBinding.FieldName = 'QTDE'
                    Options.Editing = False
                    Width = 88
                  end
                  object viewRegistrosDetailID_VENDA_ITEM: TcxGridDBColumn [11]
                    DataBinding.FieldName = 'ID_VENDA_ITEM'
                    Visible = False
                    Options.Editing = False
                  end
                  inherited ColumnExcluirDetail: TcxGridDBColumn
                    MinWidth = 54
                    Width = 54
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
        object Label4: TLabel
          Left = 6
          Top = 2
          Width = 67
          Height = 13
          Caption = 'Data da Sa'#237'da'
          FocusControl = EditDataSaida
        end
        object Label3: TLabel
          Left = 217
          Top = 2
          Width = 64
          Height = 13
          Caption = 'Tipo de Sa'#237'da'
          FocusControl = cbTipoSaida
        end
        object EditDataSaida: TcxDBDateEdit
          Left = 5
          Top = 18
          DataBinding.DataField = 'DATA'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 204
        end
        object cbTipoSaida: TcxDBImageComboBox
          Left = 214
          Top = 18
          RepositoryItem = dmLookup.repIcbTipoSaida
          DataBinding.DataField = 'TIPO'
          DataBinding.DataSource = dsMaster
          Properties.Items = <>
          TabOrder = 1
          Width = 179
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnEditsCadastroDetail: TPanel
        object Label5: TLabel
          Left = 7
          Top = 2
          Width = 22
          Height = 13
          Caption = 'Item'
          FocusControl = cbItem
        end
        object Label6: TLabel
          Left = 6
          Top = 42
          Width = 56
          Height = 13
          Caption = 'Quantidade'
          FocusControl = EditQtde
        end
        object lbUnidade: TLabel
          Left = 211
          Top = 61
          Width = 19
          Height = 13
          Caption = 'Und'
        end
        object cbItem: TcxDBLookupComboBox
          Left = 4
          Top = 18
          RepositoryItem = dmLookup.repLcbItem
          DataBinding.DataField = 'ID_ITEM'
          DataBinding.DataSource = dsDetail
          Properties.ListColumns = <>
          Properties.ListOptions.SyncMode = True
          Properties.OnEditValueChanged = cbItemPropertiesEditValueChanged
          TabOrder = 0
          Width = 205
        end
        object EditQtde: TcxDBCalcEdit
          Left = 5
          Top = 58
          RepositoryItem = dmLookup.repCalcPadrao
          DataBinding.DataField = 'QTDE'
          DataBinding.DataSource = dsDetail
          TabOrder = 2
          Width = 204
        end
        object pnEspecieLotes: TPanel
          Left = 212
          Top = 3
          Width = 572
          Height = 36
          BevelOuter = bvNone
          TabOrder = 1
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
            object Label7: TLabel
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
  inherited dsMaster: TDataSource
    DataSet = dmEstoque.cdsSaida
  end
  inherited dsDetail: TDataSource
    DataSet = dmEstoque.cdsSaida_Item
  end
end
