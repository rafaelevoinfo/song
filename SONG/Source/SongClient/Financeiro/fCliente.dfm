inherited frmCliente: TfrmCliente
  ActiveControl = btnIncluir
  Caption = 'Clientes'
  ClientHeight = 500
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Height = 500
    Properties.ActivePage = tabPesquisa
    ExplicitHeight = 500
    ClientRectBottom = 496
    inherited tabPesquisa: TcxTabSheet
      ExplicitHeight = 472
      inherited pnGrid: TPanel
        Height = 428
        ExplicitHeight = 428
        inherited cxGridRegistros: TcxGrid
          Height = 426
          ExplicitHeight = 426
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      ExplicitHeight = 472
      inherited pnEditsCadastro: TPanel
        Height = 422
        ExplicitHeight = 422
        inherited lbNome: TLabel
          Top = 49
          ExplicitTop = 49
        end
        inherited lbRazaoSocial: TLabel
          Top = 49
          ExplicitTop = 49
        end
        inherited lbCpfCnpj: TLabel
          Top = 49
          ExplicitTop = 49
        end
        inherited Label15: TLabel
          Top = 88
          ExplicitTop = 88
        end
        inherited Label16: TLabel
          Top = 88
          ExplicitTop = 88
        end
        inherited Label17: TLabel
          Top = 88
          ExplicitTop = 88
        end
        inherited Label19: TLabel
          Top = 352
          ExplicitTop = 352
        end
        inherited EditNomeFantasia: TcxDBTextEdit
          Top = 65
          TabOrder = 1
          ExplicitTop = 65
        end
        inherited EditRazaoSocial: TcxDBTextEdit
          Top = 65
          TabOrder = 2
          ExplicitTop = 65
        end
        inherited rgInfoContato: TcxGroupBox
          Top = 127
          TabOrder = 7
          ExplicitTop = 127
        end
        inherited EditInscricaoEstadual: TcxDBTextEdit
          Top = 104
          TabOrder = 4
          ExplicitTop = 104
        end
        inherited EditInscricaoMunicipal: TcxDBTextEdit
          Top = 104
          TabOrder = 5
          ExplicitTop = 104
        end
        inherited EditRamo: TcxDBTextEdit
          Top = 104
          TabOrder = 6
          ExplicitTop = 104
        end
        inherited EditObs: TcxDBMemo
          Top = 368
          TabOrder = 8
          ExplicitTop = 368
        end
        inherited EditCpfCnpj: TcxDBMaskEdit
          Top = 65
          TabOrder = 3
          ExplicitTop = 65
        end
        object rgTipoFornecedor: TcxRadioGroup
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
      end
    end
  end
end
