inherited frmItem: TfrmItem
  Caption = 'Itens'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          inherited cbPesquisarPor: TcxImageComboBox
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
                Description = 'Nome'
                Value = 3
              end>
          end
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Options.Editing = False
            end
            object viewRegistrosTIPO: TcxGridDBColumn [1]
              DataBinding.FieldName = 'TIPO'
              RepositoryItem = dmLookup.repIcbTipoItem
              Visible = False
              Options.Editing = False
              Width = 117
            end
            object viewRegistrosNOME: TcxGridDBColumn [2]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
              Width = 434
            end
            object viewRegistrosCALC_SALDO: TcxGridDBColumn [3]
              DataBinding.FieldName = 'CALC_SALDO'
              Options.Editing = False
              Width = 132
            end
            object viewRegistrosUNIDADE: TcxGridDBColumn [4]
              DataBinding.FieldName = 'UNIDADE'
              Visible = False
              Options.Editing = False
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      inherited pnBotoesCadastro: TPanel
        TabOrder = 1
      end
      inherited pnEditsCadastro: TPanel
        TabOrder = 0
        object Label3: TLabel
          Left = 5
          Top = 1
          Width = 67
          Height = 13
          Caption = 'Nome do Item'
          FocusControl = EditNome
        end
        object lbl1: TLabel
          Left = 304
          Top = 1
          Width = 134
          Height = 13
          Caption = 'Unidade de armazenamento'
          FocusControl = EditUnidade
        end
        object EditNome: TcxDBTextEdit
          Left = 4
          Top = 16
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 296
        end
        object EditUnidade: TcxDBTextEdit
          Left = 302
          Top = 16
          DataBinding.DataField = 'UNIDADE'
          DataBinding.DataSource = dsMaster
          TabOrder = 1
          Width = 137
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmEstoque.cdsItem
  end
end
