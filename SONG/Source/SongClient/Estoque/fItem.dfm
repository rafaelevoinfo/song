inherited frmItem: TfrmItem
  ActiveControl = EditNome
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
            object viewRegistrosNOME: TcxGridDBColumn [1]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
            end
            object viewRegistrosTIPO: TcxGridDBColumn [2]
              DataBinding.FieldName = 'TIPO'
              RepositoryItem = dmLookup.repIcbTipoItem
              Options.Editing = False
              Width = 117
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
          Top = 1
          Width = 67
          Height = 13
          Caption = 'Nome do Item'
          FocusControl = EditNome
        end
        object Label4: TLabel
          Left = 305
          Top = 1
          Width = 20
          Height = 13
          Caption = 'Tipo'
          FocusControl = cbTipo
        end
        object EditNome: TcxDBTextEdit
          Left = 4
          Top = 16
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 296
        end
        object cbTipo: TcxDBImageComboBox
          Left = 304
          Top = 16
          RepositoryItem = dmLookup.repIcbTipoItem
          DataBinding.DataField = 'TIPO'
          DataBinding.DataSource = dsMaster
          Properties.Items = <>
          TabOrder = 1
          Width = 161
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmEstoque.cdsItem
  end
end
