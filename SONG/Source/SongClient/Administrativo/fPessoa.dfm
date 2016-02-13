inherited frmPessoa: TfrmPessoa
  Caption = 'Pessoas'
  ExplicitTop = -22
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
                Value = 0
              end
              item
                Description = 'C'#243'digo'
                ImageIndex = 0
                Value = 1
              end
              item
                Description = 'Nome'
                Value = 2
              end
              item
                Description = 'Login'
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
              Width = 53
            end
            object viewRegistrosNOME: TcxGridDBColumn [1]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
              Width = 285
            end
            object viewRegistrosEMAIL: TcxGridDBColumn [2]
              DataBinding.FieldName = 'EMAIL'
              Options.Editing = False
              Width = 155
            end
            object viewRegistrosCELULAR: TcxGridDBColumn [3]
              DataBinding.FieldName = 'CELULAR'
              Options.Editing = False
            end
            object viewRegistrosLOGIN: TcxGridDBColumn [4]
              DataBinding.FieldName = 'LOGIN'
              Options.Editing = False
              Width = 176
            end
            object viewRegistrosRG: TcxGridDBColumn [5]
              DataBinding.FieldName = 'RG'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosCPF: TcxGridDBColumn [6]
              DataBinding.FieldName = 'CPF'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosENDERECO: TcxGridDBColumn [7]
              DataBinding.FieldName = 'ENDERECO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosBAIRRO: TcxGridDBColumn [8]
              DataBinding.FieldName = 'BAIRRO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosTELEFONE: TcxGridDBColumn [9]
              DataBinding.FieldName = 'TELEFONE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosCOMPLEMENTO: TcxGridDBColumn [10]
              DataBinding.FieldName = 'COMPLEMENTO'
              Visible = False
              Options.Editing = False
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
      inherited pnEditsCadastro: TPanel
        object rgInfoPessoais: TcxGroupBox
          Left = 4
          Top = 4
          Caption = 'Informa'#231#245'es Pessoais'
          TabOrder = 0
          Height = 107
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
        end
        object rgInfoContato: TcxGroupBox
          Left = 4
          Top = 117
          Caption = 'Informa'#231#245'es para Contato'
          TabOrder = 1
          Height = 147
          Width = 624
          object Label6: TLabel
            Left = 8
            Top = 16
            Width = 28
            Height = 13
            Caption = 'E-Mail'
            FocusControl = EditEmail
          end
          object Label7: TLabel
            Left = 380
            Top = 15
            Width = 33
            Height = 13
            Caption = 'Celular'
          end
          object Label8: TLabel
            Left = 504
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
            Left = 506
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
            Width = 366
          end
          object EditEndereco: TcxDBTextEdit
            Left = 8
            Top = 70
            DataBinding.DataField = 'ENDERECO'
            DataBinding.DataSource = dsMaster
            TabOrder = 3
            Width = 490
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
            Width = 437
          end
          object EditCelular: TcxDBMaskEdit
            Left = 377
            Top = 31
            DataBinding.DataField = 'CELULAR'
            DataBinding.DataSource = dsMaster
            Properties.MaskKind = emkRegExprEx
            Properties.EditMask = '\(\d\d\)\d{4}-\d{4,5}'
            TabOrder = 1
            Width = 121
          end
          object EditTelefone: TcxDBMaskEdit
            Left = 503
            Top = 31
            DataBinding.DataField = 'TELEFONE'
            DataBinding.DataSource = dsMaster
            Properties.MaskKind = emkRegExprEx
            Properties.EditMask = '\(\d\d\)\d{4}-\d{4,5}'
            TabOrder = 2
            Width = 118
          end
          object EditBairro: TcxDBTextEdit
            Left = 504
            Top = 70
            DataBinding.DataField = 'BAIRRO'
            DataBinding.DataSource = dsMaster
            TabOrder = 4
            Width = 117
          end
        end
        object rgInfoLogin: TcxGroupBox
          Left = 319
          Top = 4
          Caption = 'Informa'#231#245'es para Login no Sistema'
          TabOrder = 2
          Height = 107
          Width = 309
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
            Width = 302
          end
          object EditSenha: TcxTextEdit
            Left = 3
            Top = 72
            Properties.EchoMode = eemPassword
            Properties.PasswordChar = '*'
            TabOrder = 1
            Width = 303
          end
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      inherited pnEditsCadastroDetail: TPanel
        inline frameGrids: TframeGrids
          Left = 0
          Top = 0
          Width = 854
          Height = 398
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 854
          ExplicitHeight = 398
          inherited gpGrids: TGridPanel
            Width = 854
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
            ExplicitWidth = 854
            ExplicitHeight = 379
            inherited cxGrid1: TcxGrid
              Width = 400
              Height = 377
              ExplicitWidth = 400
              ExplicitHeight = 377
            end
            inherited pnBotoes: TPanel
              Left = 401
              Width = 42
              Height = 377
              ExplicitLeft = 401
              ExplicitWidth = 42
              ExplicitHeight = 377
              inherited btnAdd: TButton
                Width = 42
                ExplicitWidth = 42
              end
              inherited btnAddTodos: TButton
                Width = 42
                ExplicitWidth = 42
              end
              inherited btnRemover: TButton
                Width = 42
                ExplicitWidth = 42
              end
              inherited btnRemoverTodos: TButton
                Width = 42
                ExplicitWidth = 42
              end
            end
            inherited cxGrid2: TcxGrid
              Left = 443
              Width = 410
              Height = 377
              ExplicitLeft = 443
              ExplicitWidth = 410
              ExplicitHeight = 377
              inherited viewDireita: TcxGridDBTableView
                DataController.DataSource = dsDetail
              end
            end
          end
          inherited pnLabels: TPanel
            Width = 854
            ExplicitWidth = 854
            inherited gpLabels: TGridPanel
              Width = 852
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
              ExplicitWidth = 852
              inherited lbInfoGridEsquerda: TLabel
                Width = 82
                Caption = 'Perfis dispon'#237'veis'
                ExplicitWidth = 82
              end
              inherited lbInfoGridDireita: TLabel
                Left = 442
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
    Left = 272
    Top = 24
  end
  inherited dsMaster: TDataSource
    DataSet = dmAdministrativo.cdsPessoa
    Left = 216
    Top = 24
  end
  inherited dsDetail: TDataSource
    DataSet = dmAdministrativo.cdsPessoa_Perfil
    Left = 352
    Top = 24
  end
  object cdsLocalPerfis: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 248
    Top = 152
    object cdsLocalPerfisID: TIntegerField
      DisplayLabel = 'Perfil'
      FieldName = 'ID'
    end
  end
end
