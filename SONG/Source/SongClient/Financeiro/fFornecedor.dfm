inherited frmFornecedor: TfrmFornecedor
  Caption = 'Fornecedores'
  ClientHeight = 497
  ExplicitHeight = 536
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Height = 497
    ExplicitHeight = 497
    ClientRectBottom = 493
    inherited tabPesquisa: TcxTabSheet
      ExplicitHeight = 469
      inherited pnGrid: TPanel
        Height = 425
        ExplicitHeight = 425
        inherited cxGridRegistros: TcxGrid
          Height = 423
          ExplicitHeight = 423
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      ExplicitHeight = 469
      inherited pnEditsCadastro: TPanel
        Height = 419
        ExplicitHeight = 419
        inherited lbNome: TLabel
          Top = 48
          ExplicitTop = 48
        end
        inherited Label5: TLabel
          Top = 48
          ExplicitTop = 48
        end
        inherited lbCpfCnpj: TLabel
          Top = 48
          ExplicitTop = 48
        end
        inherited Label15: TLabel
          Top = 87
          ExplicitTop = 87
        end
        inherited Label16: TLabel
          Top = 87
          ExplicitTop = 87
        end
        inherited Label17: TLabel
          Top = 87
          ExplicitTop = 87
        end
        inherited Label19: TLabel
          Top = 351
          ExplicitTop = 351
        end
        inherited EditNomeFantasia: TcxDBTextEdit
          Top = 64
          TabOrder = 1
          ExplicitTop = 64
        end
        inherited EditRazaoSocial: TcxDBTextEdit
          Top = 64
          TabOrder = 2
          ExplicitTop = 64
        end
        inherited rgInfoContato: TcxGroupBox
          Top = 126
          TabOrder = 7
          ExplicitTop = 126
        end
        inherited EditInscricaoEstadual: TcxDBTextEdit
          Top = 103
          TabOrder = 4
          ExplicitTop = 103
        end
        inherited EditInscricaoMunicipal: TcxDBTextEdit
          Top = 103
          TabOrder = 5
          ExplicitTop = 103
        end
        inherited EditRamo: TcxDBTextEdit
          Top = 103
          TabOrder = 6
          ExplicitTop = 103
        end
        inherited EditObs: TcxDBMemo
          Top = 367
          TabOrder = 8
          ExplicitTop = 367
        end
        object rgTipoFornecedor: TcxRadioGroup [14]
          Left = 4
          Top = 2
          TabStop = False
          Caption = 'Tipo de Fornecedor'
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = 'Pessoa Jur'#237'dica'
            end
            item
              Caption = 'Pessoa F'#237'sica'
            end>
          Properties.OnEditValueChanged = rgTipoFornecedorPropertiesEditValueChanged
          ItemIndex = 0
          TabOrder = 0
          Height = 44
          Width = 239
        end
        inherited EditCpfCnpj: TcxDBMaskEdit
          Top = 64
          TabOrder = 3
          ExplicitTop = 64
        end
      end
    end
  end
end
