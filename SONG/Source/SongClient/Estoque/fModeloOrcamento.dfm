inherited frmModeloOrcamento: TfrmModeloOrcamento
  ActiveControl = btnSalvar
  Caption = 'Modelos de Or'#231'amento'
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
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      OnShow = tabCadastroShow
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnEditsCadastro: TPanel
        inline frameEditor: TframeEditor
          Left = 1
          Top = 133
          Width = 974
          Height = 264
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 1
          ExplicitTop = 133
          ExplicitWidth = 974
          ExplicitHeight = 264
          inherited pnFormatacao: TPanel
            Width = 974
            ExplicitWidth = 974
          end
          inherited pnRich: TPanel
            Width = 974
            Height = 191
            ExplicitWidth = 974
            ExplicitHeight = 191
            inherited Rich: TcxDBRichEdit
              DataBinding.DataField = 'MODELO'
              DataBinding.DataSource = dsMaster
            end
          end
        end
        object pnNomeDescricao: TPanel
          Left = 1
          Top = 1
          Width = 974
          Height = 132
          Align = alTop
          TabOrder = 1
          object Label3: TLabel
            Left = 6
            Top = 1
            Width = 27
            Height = 13
            Caption = 'Nome'
            FocusControl = EditNome
          end
          object Label4: TLabel
            Left = 6
            Top = 41
            Width = 46
            Height = 13
            Caption = 'Descri'#231#227'o'
            FocusControl = EditDescricao
          end
          object Label5: TLabel
            Left = 6
            Top = 115
            Width = 34
            Height = 13
            Caption = 'Modelo'
          end
          object EditNome: TcxDBTextEdit
            Left = 4
            Top = 16
            DataBinding.DataField = 'NOME'
            DataBinding.DataSource = dsMaster
            TabOrder = 0
            Width = 295
          end
          object EditDescricao: TcxDBMemo
            Left = 4
            Top = 57
            DataBinding.DataField = 'DESCRICAO'
            DataBinding.DataSource = dsMaster
            TabOrder = 1
            Height = 56
            Width = 669
          end
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 280
    Top = 248
  end
  inherited dsMaster: TDataSource
    DataSet = dmEstoque.cdsModelo_Orcamento
  end
end
