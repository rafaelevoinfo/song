inherited frmPessoa: TfrmPessoa
  Caption = 'Pessoas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
      ExplicitWidth = 976
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
              end
              item
                Description = 'Login'
                Value = 4
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
              Width = 30
            end
            object viewRegistrosNOME: TcxGridDBColumn [1]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
              Width = 213
            end
            object viewRegistrosEMAIL: TcxGridDBColumn [2]
              DataBinding.FieldName = 'EMAIL'
              Options.Editing = False
              Width = 181
            end
            object viewRegistrosCELULAR: TcxGridDBColumn [3]
              DataBinding.FieldName = 'CELULAR'
              Options.Editing = False
            end
            object viewRegistrosLOGIN: TcxGridDBColumn [4]
              DataBinding.FieldName = 'LOGIN'
              Options.Editing = False
              Width = 128
            end
            object viewRegistrosTIPO: TcxGridDBColumn [5]
              DataBinding.FieldName = 'TIPO'
              RepositoryItem = dmLookup.repIcbTipoPessoa
              Options.Editing = False
              Options.ShowEditButtons = isebNever
              Options.SortByDisplayText = isbtOn
              Width = 79
            end
            object viewRegistrosRG: TcxGridDBColumn [6]
              DataBinding.FieldName = 'RG'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosCPF: TcxGridDBColumn [7]
              DataBinding.FieldName = 'CPF'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosENDERECO: TcxGridDBColumn [8]
              DataBinding.FieldName = 'ENDERECO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosCIDADE: TcxGridDBColumn [9]
              DataBinding.FieldName = 'CIDADE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosBAIRRO: TcxGridDBColumn [10]
              DataBinding.FieldName = 'BAIRRO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosTELEFONE: TcxGridDBColumn [11]
              DataBinding.FieldName = 'TELEFONE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosCOMPLEMENTO: TcxGridDBColumn [12]
              DataBinding.FieldName = 'COMPLEMENTO'
              Visible = False
              Options.Editing = False
            end
            inherited ColumnExcluir: TcxGridDBColumn
              Caption = 'Ativar/Desativar'
              MinWidth = 90
              Width = 90
              OnCustomDrawHeader = ColumnExcluirCustomDrawHeader
            end
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              Caption = 'Perfis da Pessoa'
              inherited cxGridRegistrosDetail: TcxGrid
                inherited viewRegistrosDetail: TcxGridDBTableView
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewRegistrosDetailID_PERFIL: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'ID_PERFIL'
                    RepositoryItem = dmLookup.repLcbPerfil
                    Options.Editing = False
                    Options.ShowEditButtons = isebNever
                    Width = 216
                  end
                end
              end
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      ExplicitWidth = 976
      inherited pnBotoesCadastro: TPanel
        Width = 976
        ExplicitWidth = 976
      end
      inherited pnEditsCadastro: TPanel
        Width = 976
        ExplicitWidth = 976
        object rgInfoPessoais: TcxGroupBox
          Left = 4
          Top = 4
          Caption = 'Informa'#231#245'es Gerais'
          TabOrder = 0
          Height = 143
          Width = 309
          object Label3: TLabel
            Left = 4
            Top = 16
            Width = 27
            Height = 13
            Caption = 'Nome'
            FocusControl = EditNome
          end
          object Label4: TLabel
            Left = 4
            Top = 56
            Width = 14
            Height = 13
            Caption = 'RG'
            FocusControl = EditRg
          end
          object Label5: TLabel
            Left = 160
            Top = 56
            Width = 19
            Height = 13
            Caption = 'CPF'
            FocusControl = EditCpf
          end
          object Label13: TLabel
            Left = 3
            Top = 95
            Width = 71
            Height = 13
            Caption = 'Tipo de V'#237'nculo'
            FocusControl = cbTipo
          end
          object EditNome: TcxDBTextEdit
            Left = 3
            Top = 32
            DataBinding.DataField = 'NOME'
            DataBinding.DataSource = dsMaster
            TabOrder = 0
            Width = 302
          end
          object EditRg: TcxDBTextEdit
            Left = 3
            Top = 72
            DataBinding.DataField = 'RG'
            DataBinding.DataSource = dsMaster
            TabOrder = 1
            Width = 150
          end
          object EditCpf: TcxDBMaskEdit
            Left = 156
            Top = 72
            DataBinding.DataField = 'CPF'
            DataBinding.DataSource = dsMaster
            Properties.MaskKind = emkRegExprEx
            Properties.EditMask = '\d{3}\.\d{3}\.\d{3}-\d{2}'
            TabOrder = 2
            Width = 149
          end
          object cbTipo: TcxDBImageComboBox
            Left = 3
            Top = 111
            RepositoryItem = dmLookup.repIcbTipoPessoa
            DataBinding.DataField = 'TIPO'
            DataBinding.DataSource = dsMaster
            Properties.Items = <>
            TabOrder = 3
            Width = 302
          end
        end
        object rgInfoContato: TcxGroupBox
          Left = 4
          Top = 149
          Caption = 'Informa'#231#245'es para Contato'
          TabOrder = 1
          Height = 147
          Width = 757
          object Label6: TLabel
            Left = 8
            Top = 16
            Width = 28
            Height = 13
            Caption = 'E-Mail'
            FocusControl = EditEmail
          end
          object Label7: TLabel
            Left = 513
            Top = 15
            Width = 33
            Height = 13
            Caption = 'Celular'
          end
          object Label8: TLabel
            Left = 637
            Top = 14
            Width = 42
            Height = 13
            Caption = 'Telefone'
          end
          object Label9: TLabel
            Left = 9
            Top = 55
            Width = 45
            Height = 13
            Caption = 'Endere'#231'o'
            FocusControl = EditEndereco
          end
          object Label10: TLabel
            Left = 10
            Top = 96
            Width = 33
            Height = 13
            Caption = 'Cidade'
            FocusControl = EditCidade
          end
          object Label11: TLabel
            Left = 184
            Top = 96
            Width = 65
            Height = 13
            Caption = 'Complemento'
            FocusControl = EditComplemento
          end
          object Label12: TLabel
            Left = 512
            Top = 55
            Width = 28
            Height = 13
            Caption = 'Bairro'
            FocusControl = EditBairro
          end
          object EditEmail: TcxDBTextEdit
            Left = 7
            Top = 31
            DataBinding.DataField = 'EMAIL'
            DataBinding.DataSource = dsMaster
            TabOrder = 0
            Width = 500
          end
          object EditEndereco: TcxDBTextEdit
            Left = 8
            Top = 70
            DataBinding.DataField = 'ENDERECO'
            DataBinding.DataSource = dsMaster
            TabOrder = 3
            Width = 499
          end
          object EditCidade: TcxDBTextEdit
            Left = 8
            Top = 111
            DataBinding.DataField = 'CIDADE'
            DataBinding.DataSource = dsMaster
            TabOrder = 5
            Width = 168
          end
          object EditComplemento: TcxDBTextEdit
            Left = 183
            Top = 111
            DataBinding.DataField = 'COMPLEMENTO'
            DataBinding.DataSource = dsMaster
            TabOrder = 6
            Width = 571
          end
          object EditCelular: TcxDBMaskEdit
            Left = 510
            Top = 31
            DataBinding.DataField = 'CELULAR'
            DataBinding.DataSource = dsMaster
            Properties.MaskKind = emkRegExprEx
            Properties.EditMask = '\(\d\d\)\d{4}-\d{4,5}'
            TabOrder = 1
            Width = 121
          end
          object EditTelefone: TcxDBMaskEdit
            Left = 636
            Top = 31
            DataBinding.DataField = 'TELEFONE'
            DataBinding.DataSource = dsMaster
            Properties.MaskKind = emkRegExprEx
            Properties.EditMask = '\(\d\d\)\d{4}-\d{4,5}'
            TabOrder = 2
            Width = 118
          end
          object EditBairro: TcxDBTextEdit
            Left = 510
            Top = 70
            DataBinding.DataField = 'BAIRRO'
            DataBinding.DataSource = dsMaster
            TabOrder = 4
            Width = 244
          end
        end
        object rgInfoLogin: TcxGroupBox
          Left = 319
          Top = 4
          Caption = 
            'Informa'#231#245'es de Login (Somente caso deseje que esta pessoa tenha ' +
            'acesso ao sistema)'
          TabOrder = 2
          Height = 143
          Width = 442
          object lbl1: TLabel
            Left = 6
            Top = 16
            Width = 25
            Height = 13
            Caption = 'Login'
            FocusControl = EditLogin
          end
          object lbl2: TLabel
            Left = 6
            Top = 56
            Width = 30
            Height = 13
            Caption = 'Senha'
            FocusControl = EditSenha
          end
          object EditLogin: TcxDBTextEdit
            Left = 4
            Top = 32
            DataBinding.DataField = 'LOGIN'
            DataBinding.DataSource = dsMaster
            TabOrder = 0
            Width = 435
          end
          object EditSenha: TcxTextEdit
            Left = 3
            Top = 72
            Properties.EchoMode = eemPassword
            Properties.PasswordChar = '*'
            TabOrder = 1
            Width = 436
          end
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnBotoesCadastroDetail: TPanel
        Width = 976
        ExplicitWidth = 976
      end
      inherited pnEditsCadastroDetail: TPanel
        Width = 976
        ExplicitWidth = 976
        inline frameGrids: TframeGrids
          Left = 0
          Top = 0
          Width = 976
          Height = 398
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 976
          ExplicitHeight = 398
          inherited gpGrids: TGridPanel
            Width = 976
            Height = 379
            ControlCollection = <
              item
                Column = 0
                Control = frameGrids.cxGrid1
                Row = 0
              end
              item
                Column = 1
                Control = frameGrids.pnBotoes
                Row = 0
              end
              item
                Column = 2
                Control = frameGrids.cxGrid2
                Row = 0
              end>
            ExplicitWidth = 976
            ExplicitHeight = 379
            inherited cxGrid1: TcxGrid
              ExplicitWidth = 457
              ExplicitHeight = 377
            end
            inherited pnBotoes: TPanel
              ExplicitLeft = 458
              ExplicitWidth = 48
              ExplicitHeight = 377
              inherited btnAdd: TButton
                Width = 48
                ExplicitWidth = 48
              end
              inherited btnAddTodos: TButton
                Width = 48
                ExplicitWidth = 48
              end
              inherited btnRemover: TButton
                Width = 48
                ExplicitWidth = 48
              end
              inherited btnRemoverTodos: TButton
                Width = 48
                ExplicitWidth = 48
              end
            end
            inherited cxGrid2: TcxGrid
              ExplicitLeft = 506
              ExplicitWidth = 469
              ExplicitHeight = 377
              inherited viewDireita: TcxGridDBTableView
                DataController.DataSource = dsDetail
              end
            end
          end
          inherited pnLabels: TPanel
            Width = 976
            ExplicitWidth = 976
            inherited gpLabels: TGridPanel
              Width = 974
              ControlCollection = <
                item
                  Column = 0
                  Control = frameGrids.lbInfoGridEsquerda
                  Row = 0
                end
                item
                  Column = 2
                  Control = frameGrids.lbInfoGridDireita
                  Row = 0
                end>
              ExplicitWidth = 974
              inherited lbInfoGridEsquerda: TLabel
                Width = 82
                Caption = 'Perfis dispon'#237'veis'
                ExplicitWidth = 82
              end
              inherited lbInfoGridDireita: TLabel
                Width = 91
                Caption = 'Perfis selecionados'
                ExplicitLeft = 442
                ExplicitWidth = 91
              end
            end
          end
          inherited dsEsquerda: TDataSource
            DataSet = cdsLocalPerfis
          end
          inherited dsDireita: TDataSource
            DataSet = dmAdministrativo.cdsPessoa_Perfil
            Left = 728
            Top = 232
          end
          inherited ActionList1: TActionList
            Left = 168
            Top = 224
          end
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 288
    Top = 80
  end
  inherited dsMaster: TDataSource
    DataSet = dmAdministrativo.cdsPessoa
    Left = 232
    Top = 72
  end
  inherited dsDetail: TDataSource
    DataSet = dmAdministrativo.cdsPessoa_Perfil
    Left = 360
    Top = 104
  end
  object cdsLocalPerfis: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 256
    Top = 112
    object cdsLocalPerfisID: TIntegerField
      DisplayLabel = 'Perfil'
      FieldName = 'ID'
    end
  end
end
