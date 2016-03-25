inherited frmFornecedor: TfrmFornecedor
  Caption = 'Fornecedores'
  ExplicitWidth = 1000
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabCadastro: TcxTabSheet
      inherited pnEditsCadastro: TPanel
        inherited rgInfoContato: TcxGroupBox
          object lbl1: TLabel [9]
            Left = 430
            Top = 16
            Width = 86
            Height = 13
            Caption = 'Cargo do Contato'
            FocusControl = EditCargoContato
          end
          object EditCargoContato: TcxDBTextEdit
            Left = 428
            Top = 31
            DataBinding.DataField = 'CARGO_CONTATO'
            DataBinding.DataSource = dsMaster
            TabOrder = 10
            Width = 221
          end
        end
      end
    end
  end
end
