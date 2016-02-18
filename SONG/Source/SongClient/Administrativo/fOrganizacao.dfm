inherited frmOrganizacao: TfrmOrganizacao
  Caption = 'Organiza'#231#245'es'
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
                Description = 'C'#243'digo'
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
              Width = 544
            end
            object viewRegistrosCNPJ: TcxGridDBColumn [2]
              DataBinding.FieldName = 'CNPJ'
              Options.Editing = False
            end
            object viewRegistrosINSCRICAO_ESTADUAL: TcxGridDBColumn [3]
              DataBinding.FieldName = 'INSCRICAO_ESTADUAL'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosENDERECO: TcxGridDBColumn [4]
              DataBinding.FieldName = 'ENDERECO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosBAIRRO: TcxGridDBColumn [5]
              DataBinding.FieldName = 'BAIRRO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosCOMPLEMENTO: TcxGridDBColumn [6]
              DataBinding.FieldName = 'COMPLEMENTO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosCIDADE: TcxGridDBColumn [7]
              DataBinding.FieldName = 'CIDADE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosTELEFONE: TcxGridDBColumn [8]
              DataBinding.FieldName = 'TELEFONE'
              Visible = False
              Options.Editing = False
            end
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              Caption = 'Contatos da Organiza'#231#227'o'
              inherited cxGridRegistrosDetail: TcxGrid
                inherited viewRegistrosDetail: TcxGridDBTableView
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewRegistrosDetailID_PESSOA: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'ID_PESSOA'
                    RepositoryItem = dmLookup.repLcbPessoa
                    Options.Editing = False
                    Options.ShowEditButtons = isebNever
                    Width = 210
                  end
                  object viewRegistrosDetailFUNCAO: TcxGridDBColumn [2]
                    DataBinding.FieldName = 'FUNCAO'
                    Options.Editing = False
                  end
                end
              end
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      inherited pnEditsCadastro: TPanel
        object Label3: TLabel
          Left = 8
          Top = 6
          Width = 27
          Height = 13
          Caption = 'Nome'
          FocusControl = EditNome
        end
        object Label4: TLabel
          Left = 249
          Top = 6
          Width = 25
          Height = 13
          Caption = 'CNPJ'
          FocusControl = EditCnpj
        end
        object Label5: TLabel
          Left = 410
          Top = 6
          Width = 87
          Height = 13
          Caption = 'Inscri'#231#227'o Estadual'
          FocusControl = EditInscricaoEstadual
        end
        object Label10: TLabel
          Left = 7
          Top = 45
          Width = 42
          Height = 13
          Caption = 'Telefone'
        end
        object EditNome: TcxDBTextEdit
          Left = 6
          Top = 22
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 237
        end
        object EditCnpj: TcxDBMaskEdit
          Left = 248
          Top = 22
          DataBinding.DataField = 'CNPJ'
          DataBinding.DataSource = dsMaster
          Properties.EditMask = '99.999.999/9999-99;0;_'
          TabOrder = 1
          Width = 155
        end
        object EditInscricaoEstadual: TcxDBTextEdit
          Left = 409
          Top = 22
          DataBinding.DataField = 'INSCRICAO_ESTADUAL'
          DataBinding.DataSource = dsMaster
          TabOrder = 2
          Width = 237
        end
        object rgEndereco: TcxGroupBox
          Left = 6
          Top = 86
          Caption = 'Endere'#231'o'
          TabOrder = 4
          Height = 96
          Width = 640
          object Label6: TLabel
            Left = 5
            Top = 16
            Width = 45
            Height = 13
            Caption = 'Endere'#231'o'
            FocusControl = EditEndereco
          end
          object Label7: TLabel
            Left = 503
            Top = 16
            Width = 28
            Height = 13
            Caption = 'Bairro'
            FocusControl = EditBairro
          end
          object Label8: TLabel
            Left = 149
            Top = 52
            Width = 65
            Height = 13
            Caption = 'Complemento'
            FocusControl = EditComplemento
          end
          object Label9: TLabel
            Left = 5
            Top = 52
            Width = 33
            Height = 13
            Caption = 'Cidade'
            FocusControl = EditCidade
          end
          object EditEndereco: TcxDBTextEdit
            Left = 3
            Top = 30
            DataBinding.DataField = 'ENDERECO'
            DataBinding.DataSource = dsMaster
            TabOrder = 0
            Width = 496
          end
          object EditBairro: TcxDBTextEdit
            Left = 501
            Top = 30
            DataBinding.DataField = 'BAIRRO'
            DataBinding.DataSource = dsMaster
            TabOrder = 1
            Width = 136
          end
          object EditComplemento: TcxDBTextEdit
            Left = 147
            Top = 66
            DataBinding.DataField = 'COMPLEMENTO'
            DataBinding.DataSource = dsMaster
            TabOrder = 3
            Width = 490
          end
          object EditCidade: TcxDBTextEdit
            Left = 3
            Top = 66
            DataBinding.DataField = 'CIDADE'
            DataBinding.DataSource = dsMaster
            TabOrder = 2
            Width = 142
          end
        end
        object EditTelefone: TcxDBMaskEdit
          Left = 6
          Top = 59
          DataBinding.DataField = 'TELEFONE'
          DataBinding.DataSource = dsMaster
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\(\d\d\)\d{4}-\d{4,5}'
          TabOrder = 3
          Width = 135
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 854
      ExplicitHeight = 448
      inherited pnEditsCadastroDetail: TPanel
        object Label11: TLabel
          Left = 258
          Top = 6
          Width = 35
          Height = 13
          Caption = 'Fun'#231#227'o'
          FocusControl = EditFuncao
        end
        object Label12: TLabel
          Left = 5
          Top = 6
          Width = 34
          Height = 13
          Caption = 'Pessoa'
          FocusControl = cbPessoa
        end
        object Label13: TLabel
          Left = 5
          Top = 46
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
          FocusControl = EditObs
        end
        object EditFuncao: TcxDBTextEdit
          Left = 257
          Top = 22
          DataBinding.DataField = 'FUNCAO'
          DataBinding.DataSource = dsDetail
          TabOrder = 1
          Width = 247
        end
        object cbPessoa: TcxDBLookupComboBox
          Left = 4
          Top = 22
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_PESSOA'
          DataBinding.DataSource = dsDetail
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 247
        end
        object EditObs: TcxDBMemo
          Left = 4
          Top = 62
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsDetail
          TabOrder = 2
          Height = 89
          Width = 500
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmAdministrativo.cdsOrganizacao
  end
  inherited dsDetail: TDataSource
    DataSet = dmAdministrativo.cdsOrganizacao_Pessoa
    Left = 464
    Top = 200
  end
end
