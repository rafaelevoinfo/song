inherited frmSaida: TfrmSaida
  Caption = 'Sa'#237'da'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 429
          Width = 546
          ExplicitLeft = 429
          ExplicitWidth = 546
          inherited Label1: TLabel
            Left = 141
            ExplicitLeft = 141
          end
          object Label8: TLabel [1]
            Left = 5
            Top = 4
            Width = 36
            Height = 13
            Caption = 'Esp'#233'cie'
          end
          inherited rgStatus: TcxRadioGroup [2]
            Left = 4
            Top = 38
            TabOrder = 3
            ExplicitLeft = 4
            ExplicitTop = 38
          end
          inherited pnData: TPanel [3]
            Left = 318
            TabOrder = 2
            ExplicitLeft = 318
          end
          inherited EditPesquisa: TcxButtonEdit [4]
            Left = 270
            ExplicitLeft = 270
          end
          inherited cbPesquisarPor: TcxImageComboBox [5]
            Left = 139
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
            TabOrder = 1
            ExplicitLeft = 139
          end
          inherited btnPesquisar: TButton [6]
            Left = 446
            TabOrder = 7
            ExplicitLeft = 446
          end
          object cbPesquisaItem: TcxLookupComboBox
            Left = 270
            Top = 21
            RepositoryItem = dmLookup.repLcbItem
            Properties.ListColumns = <>
            TabOrder = 5
            Visible = False
            Width = 175
          end
          object cbPesquisaTipoSaida: TcxImageComboBox
            Left = 272
            Top = 20
            RepositoryItem = dmLookup.repIcbTipoSaida
            Properties.Items = <>
            TabOrder = 6
            Visible = False
            Width = 175
          end
          object cbPesquisaEspecie: TcxLookupComboBox
            Left = 2
            Top = 20
            RepositoryItem = dmLookup.repLcbEspecie
            Properties.ListColumns = <>
            TabOrder = 0
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
            object viewRegistrosID_LOCAL_USO: TcxGridDBColumn [3]
              DataBinding.FieldName = 'ID_LOCAL_USO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosLOCAL_USO: TcxGridDBColumn [4]
              DataBinding.FieldName = 'LOCAL_USO'
              Options.Editing = False
              Width = 423
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
                    Options.Editing = False
                  end
                  object viewRegistrosDetailNOME_ITEM: TcxGridDBColumn [4]
                    DataBinding.FieldName = 'NOME_ITEM'
                    Options.Editing = False
                    Width = 179
                  end
                  object viewRegistrosDetailNOME_ESPECIE: TcxGridDBColumn [5]
                    DataBinding.FieldName = 'NOME_ESPECIE'
                    Options.Editing = False
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
                    Width = 144
                  end
                  object viewRegistrosDetailQTDE: TcxGridDBColumn [10]
                    DataBinding.FieldName = 'QTDE'
                    Visible = False
                    Options.Editing = False
                    Width = 88
                  end
                  object viewRegistrosDetailCALC_QTDE: TcxGridDBColumn [11]
                    DataBinding.FieldName = 'CALC_QTDE'
                    Options.Editing = False
                    Width = 130
                  end
                  object viewRegistrosDetailUNIDADE: TcxGridDBColumn [12]
                    DataBinding.FieldName = 'UNIDADE'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailID_VENDA_ITEM: TcxGridDBColumn [13]
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
          Properties.OnEditValueChanged = cbTipoSaidaPropertiesEditValueChanged
          TabOrder = 1
          Width = 179
        end
        object pnLocalUso: TPanel
          Left = 399
          Top = 2
          Width = 145
          Height = 37
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 2
          object Label9: TLabel
            Left = 2
            Top = 0
            Width = 60
            Height = 13
            Caption = 'Local de Uso'
            FocusControl = cbLocalUso
          end
          object cbLocalUso: TcxDBLookupComboBox
            Left = 0
            Top = 16
            RepositoryItem = dmLookup.repLcbLocalUso
            DataBinding.DataField = 'ID_LOCAL_USO'
            DataBinding.DataSource = dsMaster
            Properties.ListColumns = <>
            TabOrder = 0
            Width = 145
          end
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
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
              Width = 81
              Height = 13
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 2
              Align = alTop
              Caption = 'Lote de Semente'
              FocusControl = cbLoteSemente
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
              Width = 65
              Height = 13
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 2
              Align = alTop
              Caption = 'Lote de Muda'
              FocusControl = cbLoteMuda
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
              Width = 36
              Height = 13
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 2
              Align = alTop
              Caption = 'Esp'#233'cie'
              FocusControl = cbEspecie
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
