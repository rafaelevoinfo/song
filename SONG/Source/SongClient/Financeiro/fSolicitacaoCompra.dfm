inherited frmSolicitacaoCompra: TfrmSolicitacaoCompra
  Caption = 'Solicita'#231#227'o de Compras'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 430
          Width = 545
          ExplicitLeft = 428
          ExplicitWidth = 545
          inherited Label1: TLabel
            Left = 138
            ExplicitLeft = 138
          end
          object Label3: TLabel [1]
            Left = 2
            Top = 4
            Width = 35
            Height = 13
            Caption = 'Status:'
          end
          inherited pnData: TPanel
            Left = 317
            ExplicitLeft = 317
          end
          inherited EditPesquisa: TcxButtonEdit
            Left = 269
            ExplicitLeft = 269
          end
          inherited cbPesquisarPor: TcxImageComboBox
            Left = 136
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
                Description = 'Data da Solicita'#231#227'o'
                Value = 4
              end
              item
                Description = 'Item'
                Value = 5
              end
              item
                Description = 'Solicitante'
                Value = 6
              end
              item
                Description = 'Respons'#225'vel Pela An'#225'lise'
                Value = 7
              end>
            ExplicitLeft = 136
          end
          inherited btnPesquisar: TButton
            Left = 445
            ExplicitLeft = 445
          end
          inherited rgStatus: TcxRadioGroup
            Left = 4
            Top = 33
            ExplicitLeft = 4
            ExplicitTop = 33
          end
          object cbStatusPesquisa: TcxCheckComboBox
            Left = 2
            Top = 20
            Properties.EmptySelectionText = 'Todos'
            Properties.DropDownSizeable = True
            Properties.EditValueFormat = cvfIndices
            Properties.Items = <
              item
                Description = 'Solicitada'
              end
              item
                Description = 'Aprovada'
              end
              item
                Description = 'Negada'
              end>
            TabOrder = 5
            Width = 130
          end
        end
        inherited pnBotoes: TPanel
          Width = 429
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Width = 39
            end
            object viewRegistrosID_ITEM: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ID_ITEM'
              Visible = False
            end
            object viewRegistrosID_PESSOA_SOLICITOU: TcxGridDBColumn [2]
              DataBinding.FieldName = 'ID_PESSOA_SOLICITOU'
              Visible = False
            end
            object viewRegistrosID_PESSOA_ANALISOU: TcxGridDBColumn [3]
              DataBinding.FieldName = 'ID_PESSOA_ANALISOU'
              Visible = False
            end
            object viewRegistrosID_COMPRA: TcxGridDBColumn [4]
              DataBinding.FieldName = 'ID_COMPRA'
              Visible = False
            end
            object viewRegistrosDATA: TcxGridDBColumn [5]
              DataBinding.FieldName = 'DATA'
              Width = 102
            end
            object viewRegistrosSOLICITANTE: TcxGridDBColumn [6]
              DataBinding.FieldName = 'SOLICITANTE'
              Width = 154
            end
            object viewRegistrosQTDE: TcxGridDBColumn [7]
              DataBinding.FieldName = 'QTDE'
              Width = 46
            end
            object viewRegistrosNOME_ITEM: TcxGridDBColumn [8]
              DataBinding.FieldName = 'NOME_ITEM'
              Width = 158
            end
            object viewRegistrosSTATUS: TcxGridDBColumn [9]
              DataBinding.FieldName = 'STATUS'
              Width = 119
            end
            object viewRegistrosRESPONSAVEL_ANALISE: TcxGridDBColumn [10]
              DataBinding.FieldName = 'RESPONSAVEL_ANALISE'
              Width = 154
            end
            object viewRegistrosDATA_ANALISE: TcxGridDBColumn [11]
              DataBinding.FieldName = 'DATA_ANALISE'
              Visible = False
              Width = 80
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
        object Label7: TLabel
          Left = 216
          Top = 8
          Width = 22
          Height = 13
          Caption = 'Item'
          FocusControl = cbItem
        end
        object Label4: TLabel
          Left = 5
          Top = 8
          Width = 49
          Height = 13
          Caption = 'Solicitante'
          FocusControl = cbSolicitante
        end
        object cbItem: TcxDBLookupComboBox
          Left = 215
          Top = 24
          RepositoryItem = dmLookup.repLcbItem
          DataBinding.DataField = 'ID_SOLICITANTE'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 209
        end
        object cbSolicitante: TcxDBLookupComboBox
          Left = 4
          Top = 24
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_SOLICITANTE'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 1
          Width = 209
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmFinanceiro.cdsSolicitacao_Compra
  end
end
