inherited frmTransferenciaFinanceira: TfrmTransferenciaFinanceira
  ActiveControl = btnSalvar
  Caption = 'Transfer'#234'ncia de Saldos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabCadastro
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 564
          Width = 411
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
            ExplicitLeft = 2
          end
          inherited btnPesquisar: TButton
            Left = 311
            ExplicitLeft = 311
          end
          inherited rgStatus: TcxRadioGroup
            Left = 3
            Top = 34
            ExplicitLeft = 3
            ExplicitTop = 34
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
            end
            object viewRegistrosORIGEM: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ORIGEM'
              Options.Editing = False
              Width = 253
            end
            object viewRegistrosDESTINO: TcxGridDBColumn [2]
              DataBinding.FieldName = 'DESTINO'
              Options.Editing = False
              Width = 262
            end
            object viewRegistrosVALOR: TcxGridDBColumn [3]
              DataBinding.FieldName = 'VALOR'
              Options.Editing = False
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      inherited pnEditsCadastro: TPanel
        ExplicitTop = 52
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmFinanceiro.cdsTransferencia_Financeira
  end
end
