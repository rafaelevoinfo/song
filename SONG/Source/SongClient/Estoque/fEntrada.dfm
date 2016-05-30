inherited frmEntrada: TfrmEntrada
  ActiveControl = nil
  Caption = 'Entradas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabCadastroDetail
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
                Description = 'Data da Entrada'
                Value = 4
              end
              item
                Description = 'Item'
                Value = 5
              end
              item
                Description = 'Id da Compra'
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
            Left = 3
            Top = 33
            TabOrder = 5
            ExplicitLeft = 3
            ExplicitTop = 33
          end
          object cbPesquisaItem: TcxLookupComboBox
            Left = 137
            Top = 20
            RepositoryItem = dmLookup.repLcbItem
            Properties.ListColumns = <>
            TabOrder = 4
            Width = 175
          end
        end
        inherited pnBotoes: TPanel
          Width = 563
          ExplicitWidth = 563
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Options.Editing = False
              Width = 38
            end
            object viewRegistrosDATA: TcxGridDBColumn [1]
              DataBinding.FieldName = 'DATA'
              RepositoryItem = dmLookup.repDateDataPadrao
              Options.Editing = False
              Width = 96
            end
            object viewRegistrosPESSOA: TcxGridDBColumn [2]
              DataBinding.FieldName = 'PESSOA'
              Width = 159
            end
            object viewRegistrosID_PESSOA: TcxGridDBColumn
              DataBinding.FieldName = 'ID_PESSOA'
              Visible = False
            end
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              Caption = 'Itens da Entrada'
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              inherited cxGridRegistrosDetail: TcxGrid
                inherited viewRegistrosDetail: TcxGridDBTableView
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewRegistrosDetailID_ITEM: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'ID_ITEM'
                    Visible = False
                  end
                  object viewRegistrosDetailNOME_ITEM: TcxGridDBColumn [2]
                    DataBinding.FieldName = 'NOME_ITEM'
                    Options.Editing = False
                    Width = 570
                  end
                  object viewRegistrosDetailQTDE: TcxGridDBColumn [3]
                    DataBinding.FieldName = 'QTDE'
                    RepositoryItem = dmLookup.repCalcPadrao
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
        object Label4: TLabel
          Left = 6
          Top = 2
          Width = 79
          Height = 13
          Caption = 'Data da Entrada'
          FocusControl = EditDataEntrada
        end
        object EditDataEntrada: TcxDBDateEdit
          Left = 5
          Top = 18
          DataBinding.DataField = 'DATA'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 204
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnEditsCadastroDetail: TPanel
        object Label3: TLabel
          Left = 5
          Top = 2
          Width = 22
          Height = 13
          Caption = 'Item'
          FocusControl = cbItem
        end
        object Label5: TLabel
          Left = 214
          Top = 2
          Width = 56
          Height = 13
          Caption = 'Quantidade'
          FocusControl = EditQtde
        end
        object lbUnidade: TLabel
          Left = 386
          Top = 21
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
          Left = 214
          Top = 18
          RepositoryItem = dmLookup.repCalcPadrao
          DataBinding.DataField = 'QTDE'
          DataBinding.DataSource = dsDetail
          TabOrder = 1
          Width = 170
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmEstoque.cdsEntrada
  end
  inherited dsDetail: TDataSource
    DataSet = dmEstoque.cdsEntrada_Item
  end
end
