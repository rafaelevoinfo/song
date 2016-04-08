inherited frmEntrada: TfrmEntrada
  ActiveControl = cbItem
  Caption = 'Entradas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabCadastro
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 564
          Width = 411
          ExplicitLeft = 560
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
                Description = 'Tipo do Item'
                Value = 6
              end
              item
                Description = 'Id da Compra'
                Value = 7
              end>
            ExplicitLeft = 2
          end
          inherited btnPesquisar: TButton
            Left = 311
            ExplicitLeft = 311
          end
          inherited rgStatus: TcxRadioGroup
            Left = 3
            Top = 33
            ExplicitLeft = 3
            ExplicitTop = 33
          end
          object cbPesquisaTipoItem: TcxImageComboBox
            Left = 136
            Top = 20
            RepositoryItem = dmLookup.repIcbTipoItem
            Properties.Items = <>
            TabOrder = 5
            Width = 175
          end
          object cbPesquisaItem: TcxLookupComboBox
            Left = 137
            Top = 20
            RepositoryItem = dmLookup.repLcbItem
            Properties.ListColumns = <>
            TabOrder = 6
            Width = 175
          end
        end
        inherited pnBotoes: TPanel
          Width = 563
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
            object viewRegistrosID_ITEM: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ID_ITEM'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_ESPECIE: TcxGridDBColumn [2]
              DataBinding.FieldName = 'ID_ESPECIE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_COMPRA: TcxGridDBColumn [3]
              DataBinding.FieldName = 'ID_COMPRA'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosNOME_ITEM: TcxGridDBColumn [4]
              DataBinding.FieldName = 'NOME_ITEM'
              Options.Editing = False
              Width = 195
            end
            object viewRegistrosNOME_ESPECIE: TcxGridDBColumn [5]
              DataBinding.FieldName = 'NOME_ESPECIE'
              Visible = False
              Options.Editing = False
              Width = 150
            end
            object viewRegistrosQTDE: TcxGridDBColumn [6]
              DataBinding.FieldName = 'QTDE'
              Options.Editing = False
              Width = 61
            end
            object viewRegistrosDATA: TcxGridDBColumn [7]
              DataBinding.FieldName = 'DATA'
              Options.Editing = False
              Width = 96
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      inherited pnEditsCadastro: TPanel
        ExplicitTop = 52
        object Label3: TLabel
          Left = 5
          Top = 2
          Width = 22
          Height = 13
          Caption = 'Item'
          FocusControl = cbItem
        end
        object Label4: TLabel
          Left = 6
          Top = 42
          Width = 79
          Height = 13
          Caption = 'Data da Entrada'
          FocusControl = EditDataEntrada
        end
        object lbl1: TLabel
          Left = 216
          Top = 2
          Width = 36
          Height = 13
          Caption = 'Esp'#233'cie'
          FocusControl = cbEspecie
        end
        object Label5: TLabel
          Left = 215
          Top = 42
          Width = 56
          Height = 13
          Caption = 'Quantidade'
          FocusControl = EditQtde
        end
        object lbl2: TLabel
          Left = 6
          Top = 82
          Width = 37
          Height = 13
          Caption = 'Compra'
          FocusControl = EditCompra
        end
        object cbItem: TcxDBLookupComboBox
          Left = 4
          Top = 18
          RepositoryItem = dmLookup.repLcbItem
          DataBinding.DataField = 'ID_ITEM'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          Properties.ListOptions.SyncMode = True
          Properties.OnEditValueChanged = cbItemPropertiesEditValueChanged
          TabOrder = 0
          Width = 205
        end
        object EditDataEntrada: TcxDBDateEdit
          Left = 5
          Top = 58
          DataBinding.DataField = 'DATA'
          DataBinding.DataSource = dsMaster
          TabOrder = 2
          Width = 204
        end
        object cbEspecie: TcxDBLookupComboBox
          Left = 215
          Top = 18
          RepositoryItem = dmLookup.repLcbEspecie
          DataBinding.DataField = 'ID_ESPECIE'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 1
          Width = 205
        end
        object EditQtde: TcxDBCalcEdit
          Left = 215
          Top = 58
          RepositoryItem = dmLookup.repCalcPadrao
          DataBinding.DataField = 'QTDE'
          DataBinding.DataSource = dsMaster
          TabOrder = 3
          Width = 205
        end
        object EditCompra: TcxDBCalcEdit
          Left = 6
          Top = 98
          DataBinding.DataField = 'ID_COMPRA'
          DataBinding.DataSource = dsMaster
          TabOrder = 4
          Width = 205
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmEstoque.cdsEntrada
  end
end
