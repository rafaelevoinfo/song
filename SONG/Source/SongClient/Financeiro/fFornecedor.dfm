inherited frmFornecedor: TfrmFornecedor
  Caption = 'Fornecedores'
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
          inherited EditEmail: TcxDBTextEdit
            TabOrder = 3
          end
          inherited EditEndereco: TcxDBTextEdit
            TabOrder = 6
          end
          inherited EditComplemento: TcxDBTextEdit
            TabOrder = 8
          end
          inherited EditCelular: TcxDBMaskEdit
            TabOrder = 4
          end
          inherited EditTelefone: TcxDBMaskEdit
            TabOrder = 5
          end
          inherited EditBairro: TcxDBTextEdit
            TabOrder = 7
          end
          inherited cbCidade: TcxDBLookupComboBox
            TabOrder = 9
          end
          inherited EditSite: TcxDBTextEdit
            TabOrder = 10
          end
          inherited btnPesquisarPessoa: TButton
            TabOrder = 1
          end
          object EditCargoContato: TcxDBTextEdit
            Left = 428
            Top = 32
            DataBinding.DataField = 'CARGO_CONTATO'
            DataBinding.DataSource = dsMaster
            TabOrder = 2
            Width = 221
          end
        end
      end
    end
  end
end
