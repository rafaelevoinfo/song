inherited frmItemPatrimonio: TfrmItemPatrimonio
  ActiveControl = EditNome
  Caption = 'Itens do Patrim'#244'nio'
  ExplicitWidth = 1000
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabCadastro
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
          inherited rgStatus: TcxRadioGroup
            Visible = True
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
              Width = 485
            end
            object viewRegistrosTAXA_DEPRECIACAO_ANUAL: TcxGridDBColumn [2]
              DataBinding.FieldName = 'TAXA_DEPRECIACAO_ANUAL'
              Options.Editing = False
              Width = 193
            end
            inherited ColumnExcluir: TcxGridDBColumn
              Caption = 'Ativar/Inativar'
              MinWidth = 80
              Width = 80
              OnCustomDrawHeader = ColumnExcluirCustomDrawHeader
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
        object Label3: TLabel
          Left = 5
          Top = 1
          Width = 67
          Height = 13
          Caption = 'Nome do Item'
          FocusControl = EditNome
        end
        object Label4: TLabel
          Left = 306
          Top = 0
          Width = 168
          Height = 13
          Caption = 'Taxa Padr'#227'o de Deprecia'#231#227'o Anual'
          FocusControl = EditTaxaDepreciacao
        end
        object EditNome: TcxDBTextEdit
          Left = 4
          Top = 16
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 296
        end
        object EditTaxaDepreciacao: TcxDBSpinEdit
          Left = 306
          Top = 16
          DataBinding.DataField = 'TAXA_DEPRECIACAO_ANUAL'
          DataBinding.DataSource = dsMaster
          Properties.DisplayFormat = '0 %'
          Properties.MaxValue = 100.000000000000000000
          TabOrder = 1
          Width = 87
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmEstoque.cdsItem_Patrimonio
  end
end
