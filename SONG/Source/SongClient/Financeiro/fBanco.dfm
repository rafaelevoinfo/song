inherited frmBanco: TfrmBanco
  Caption = 'Bancos'
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
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              Caption = 'Contas'
              inherited cxGridRegistrosDetail: TcxGrid
                inherited viewRegistrosDetail: TcxGridDBTableView
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewRegistrosDetailAGENCIA: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'AGENCIA'
                    Options.Editing = False
                    Width = 134
                  end
                  object viewRegistrosDetailCONTA: TcxGridDBColumn [2]
                    DataBinding.FieldName = 'CONTA'
                    Options.Editing = False
                    Width = 187
                  end
                end
              end
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      ExplicitWidth = 854
      inherited pnEditsCadastro: TPanel
        object Label3: TLabel
          Left = 4
          Top = 6
          Width = 74
          Height = 13
          Caption = 'Nome do Banco'
          FocusControl = EditNome
        end
        object EditNome: TcxDBTextEdit
          Left = 3
          Top = 22
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 297
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
          Left = 5
          Top = 6
          Width = 38
          Height = 13
          Caption = 'Ag'#234'ncia'
          FocusControl = EditAgencia
        end
        object Label5: TLabel
          Left = 136
          Top = 6
          Width = 75
          Height = 13
          Caption = 'Conta Corrente'
          FocusControl = EditContaCorrente
        end
        object EditAgencia: TcxDBTextEdit
          Left = 4
          Top = 22
          DataBinding.DataField = 'AGENCIA'
          DataBinding.DataSource = dsDetail
          TabOrder = 0
          Width = 125
        end
        object EditContaCorrente: TcxDBTextEdit
          Left = 135
          Top = 22
          DataBinding.DataField = 'CONTA'
          DataBinding.DataSource = dsDetail
          TabOrder = 1
          Width = 125
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmFinanceiro.cdsBanco
  end
  inherited dsDetail: TDataSource
    DataSet = dmFinanceiro.cdsBanco_Conta_Corrente
    Left = 448
    Top = 224
  end
end
