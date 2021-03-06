inherited frmFinanciador: TfrmFinanciador
  ActiveControl = EditNomeFantasia
  Caption = 'Financiadores'
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
                Description = 'Nome Fantasia'
                Value = 5
              end
              item
                Description = 'Raz'#227'o Social'
                Value = 6
              end
              item
                Description = 'CPF/CNPJ'
                Value = 7
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
              Width = 26
            end
            object viewRegistrosID_CIDADE: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ID_CIDADE'
              RepositoryItem = dmPrincipal.repLcbCidade
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosNOME_FANTASIA: TcxGridDBColumn [2]
              DataBinding.FieldName = 'NOME_FANTASIA'
              Options.Editing = False
              Width = 356
            end
            object viewRegistrosRAZAO_SOCIAL: TcxGridDBColumn [3]
              DataBinding.FieldName = 'RAZAO_SOCIAL'
              Options.Editing = False
              Width = 314
            end
            object viewRegistrosID_CONTATO: TcxGridDBColumn [4]
              DataBinding.FieldName = 'ID_CONTATO'
              RepositoryItem = dmLookup.repLcbPessoa
              Options.Editing = False
              Width = 125
            end
            object viewRegistrosTELEFONE: TcxGridDBColumn [5]
              DataBinding.FieldName = 'TELEFONE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosCELULAR: TcxGridDBColumn [6]
              DataBinding.FieldName = 'CELULAR'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosEMAIL: TcxGridDBColumn [7]
              DataBinding.FieldName = 'EMAIL'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosSITE: TcxGridDBColumn [8]
              DataBinding.FieldName = 'SITE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosCPF_CNPJ: TcxGridDBColumn [9]
              DataBinding.FieldName = 'CPF_CNPJ'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosINSCRICAO_ESTADUAL: TcxGridDBColumn [10]
              DataBinding.FieldName = 'INSCRICAO_ESTADUAL'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosINSCRICAO_MUNICIPAL: TcxGridDBColumn [11]
              DataBinding.FieldName = 'INSCRICAO_MUNICIPAL'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosRAMO_ATIVIDADE: TcxGridDBColumn [12]
              DataBinding.FieldName = 'RAMO_ATIVIDADE'
              Visible = False
              Options.Editing = False
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      inherited pnBotoesCadastro: TPanel
        TabOrder = 1
      end
      inherited pnEditsCadastro: TPanel
        TabOrder = 0
        object lbNome: TLabel
          Left = 5
          Top = 6
          Width = 71
          Height = 13
          Caption = 'Nome Fantasia'
          FocusControl = EditNomeFantasia
        end
        object lbRazaoSocial: TLabel
          Left = 259
          Top = 6
          Width = 60
          Height = 13
          Caption = 'Raz'#227'o Social'
          FocusControl = EditRazaoSocial
        end
        object lbCpfCnpj: TLabel
          Left = 515
          Top = 6
          Width = 25
          Height = 13
          Caption = 'CNPJ'
          FocusControl = EditCpfCnpj
        end
        object Label15: TLabel
          Left = 4
          Top = 45
          Width = 87
          Height = 13
          Caption = 'Inscri'#231#227'o Estadual'
          FocusControl = EditInscricaoEstadual
        end
        object Label16: TLabel
          Left = 149
          Top = 45
          Width = 89
          Height = 13
          Caption = 'Inscri'#231#227'o Municipal'
          FocusControl = EditInscricaoMunicipal
        end
        object Label17: TLabel
          Left = 306
          Top = 45
          Width = 90
          Height = 13
          Caption = 'Ramo de Atividade'
          FocusControl = EditRamo
        end
        object Label19: TLabel
          Left = 5
          Top = 309
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
          FocusControl = EditInscricaoEstadual
        end
        object EditNomeFantasia: TcxDBTextEdit
          Left = 4
          Top = 22
          DataBinding.DataField = 'NOME_FANTASIA'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 250
        end
        object EditRazaoSocial: TcxDBTextEdit
          Left = 258
          Top = 22
          DataBinding.DataField = 'RAZAO_SOCIAL'
          DataBinding.DataSource = dsMaster
          TabOrder = 1
          Width = 250
        end
        object rgInfoContato: TcxGroupBox
          Left = 4
          Top = 84
          Caption = 'Informa'#231#245'es para Contato'
          TabOrder = 6
          Height = 221
          Width = 657
          object Label6: TLabel
            Left = 7
            Top = 55
            Width = 28
            Height = 13
            Caption = 'E-Mail'
            FocusControl = EditEmail
          end
          object Label7: TLabel
            Left = 407
            Top = 54
            Width = 33
            Height = 13
            Caption = 'Celular'
          end
          object Label8: TLabel
            Left = 534
            Top = 53
            Width = 42
            Height = 13
            Caption = 'Telefone'
          end
          object Label9: TLabel
            Left = 8
            Top = 94
            Width = 45
            Height = 13
            Caption = 'Endere'#231'o'
            FocusControl = EditEndereco
          end
          object Label10: TLabel
            Left = 407
            Top = 135
            Width = 33
            Height = 13
            Caption = 'Cidade'
            FocusControl = cbCidade
          end
          object Label11: TLabel
            Left = 9
            Top = 135
            Width = 65
            Height = 13
            Caption = 'Complemento'
            FocusControl = EditComplemento
          end
          object Label12: TLabel
            Left = 407
            Top = 94
            Width = 28
            Height = 13
            Caption = 'Bairro'
            FocusControl = EditBairro
          end
          object Label13: TLabel
            Left = 8
            Top = 174
            Width = 18
            Height = 13
            Caption = 'Site'
            FocusControl = EditSite
          end
          object Label4: TLabel
            Left = 7
            Top = 16
            Width = 62
            Height = 13
            Caption = 'Contato (F2)'
            FocusControl = cbContato
          end
          object lbl1: TLabel
            Left = 430
            Top = 16
            Width = 86
            Height = 13
            Caption = 'Cargo do Contato'
            FocusControl = EditCargoContato
          end
          object lb1: TLabel
            Left = 284
            Top = 135
            Width = 19
            Height = 13
            Caption = 'CEP'
          end
          object EditEmail: TcxDBTextEdit
            Left = 5
            Top = 70
            DataBinding.DataField = 'EMAIL'
            DataBinding.DataSource = dsMaster
            TabOrder = 3
            Width = 397
          end
          object EditEndereco: TcxDBTextEdit
            Left = 5
            Top = 109
            DataBinding.DataField = 'ENDERECO'
            DataBinding.DataSource = dsMaster
            TabOrder = 6
            Width = 397
          end
          object EditComplemento: TcxDBTextEdit
            Left = 5
            Top = 150
            DataBinding.DataField = 'COMPLEMENTO'
            DataBinding.DataSource = dsMaster
            TabOrder = 8
            Width = 273
          end
          object EditCelular: TcxDBMaskEdit
            Left = 405
            Top = 70
            DataBinding.DataField = 'CELULAR'
            DataBinding.DataSource = dsMaster
            Properties.MaskKind = emkRegExprEx
            Properties.EditMask = '\(\d\d\)\d{4}-\d{4,5}'
            TabOrder = 4
            Width = 121
          end
          object EditTelefone: TcxDBMaskEdit
            Left = 531
            Top = 70
            DataBinding.DataField = 'TELEFONE'
            DataBinding.DataSource = dsMaster
            Properties.MaskKind = emkRegExprEx
            Properties.EditMask = '\(\d\d\)\d{4}-\d{4,5}'
            TabOrder = 5
            Width = 118
          end
          object EditBairro: TcxDBTextEdit
            Left = 405
            Top = 109
            DataBinding.DataField = 'BAIRRO'
            DataBinding.DataSource = dsMaster
            TabOrder = 7
            Width = 244
          end
          object cbCidade: TcxDBLookupComboBox
            Left = 405
            Top = 150
            RepositoryItem = dmPrincipal.repLcbCidade
            DataBinding.DataField = 'ID_CIDADE'
            DataBinding.DataSource = dsMaster
            Properties.ClearKey = 46
            Properties.DropDownListStyle = lsFixedList
            Properties.DropDownSizeable = True
            Properties.DropDownWidth = 250
            Properties.KeyFieldNames = 'ID'
            Properties.ListColumns = <
              item
                FieldName = 'NOME'
              end>
            TabOrder = 10
            Width = 244
          end
          object EditSite: TcxDBTextEdit
            Left = 5
            Top = 189
            DataBinding.DataField = 'SITE'
            DataBinding.DataSource = dsMaster
            TabOrder = 11
            Width = 644
          end
          object cbContato: TcxDBLookupComboBox
            Left = 5
            Top = 32
            RepositoryItem = dmLookup.repLcbPessoa
            DataBinding.DataField = 'ID_CONTATO'
            DataBinding.DataSource = dsMaster
            Properties.ListColumns = <>
            TabOrder = 0
            OnKeyDown = cbContatoKeyDown
            Width = 397
          end
          object btnPesquisarPessoa: TButton
            Left = 405
            Top = 32
            Width = 22
            Height = 21
            Action = Ac_Pesquisar_Pessoa
            Images = dmPrincipal.imgIcons_16
            TabOrder = 1
            TabStop = False
          end
          object EditCargoContato: TcxDBTextEdit
            Left = 428
            Top = 32
            DataBinding.DataField = 'CARGO_CONTATO'
            DataBinding.DataSource = dsMaster
            TabOrder = 2
            Width = 221
          end
          object EditCep: TcxDBMaskEdit
            Left = 281
            Top = 150
            DataBinding.DataField = 'CEP'
            DataBinding.DataSource = dsMaster
            Properties.MaskKind = emkRegExprEx
            Properties.EditMask = '\d{5}-\d{3}'
            TabOrder = 9
            Width = 121
          end
        end
        object EditInscricaoEstadual: TcxDBTextEdit
          Left = 3
          Top = 61
          DataBinding.DataField = 'INSCRICAO_ESTADUAL'
          DataBinding.DataSource = dsMaster
          TabOrder = 3
          Width = 142
        end
        object EditInscricaoMunicipal: TcxDBTextEdit
          Left = 148
          Top = 61
          DataBinding.DataField = 'INSCRICAO_MUNICIPAL'
          DataBinding.DataSource = dsMaster
          TabOrder = 4
          Width = 154
        end
        object EditRamo: TcxDBTextEdit
          Left = 305
          Top = 61
          DataBinding.DataField = 'RAMO_ATIVIDADE'
          DataBinding.DataSource = dsMaster
          TabOrder = 5
          Width = 203
        end
        object EditObs: TcxDBMemo
          Left = 4
          Top = 325
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 7
          Height = 50
          Width = 658
        end
        object EditCpfCnpj: TcxDBMaskEdit
          Left = 512
          Top = 22
          DataBinding.DataField = 'CPF_CNPJ'
          DataBinding.DataSource = dsMaster
          Properties.ClearKey = 46
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d\d\.\d\d\d\.\d\d\d/\d\d\d\d-\d\d'
          Properties.ValidationOptions = [evoShowErrorIcon, evoAllowLoseFocus]
          TabOrder = 2
          Width = 150
        end
      end
    end
  end
  inherited ActionList1: TActionList
    object Ac_Pesquisar_Pessoa: TAction
      Category = 'Master'
      ImageIndex = 0
      OnExecute = Ac_Pesquisar_PessoaExecute
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmFinanceiro.cdsFin_For_Cli
  end
end
