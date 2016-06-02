inherited frmPessoa: TfrmPessoa
  Caption = 'Pessoas'
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabCadastroDetail
    inherited tabPesquisa: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 321
          Width = 654
          ExplicitLeft = 321
          ExplicitWidth = 654
          inherited Label1: TLabel
            Left = 263
            ExplicitLeft = 263
          end
          object Label16: TLabel [1]
            Left = 137
            Top = 4
            Width = 85
            Height = 13
            Caption = 'Tipos de V'#237'nculos:'
          end
          inherited pnData: TPanel
            Left = 418
            ExplicitLeft = 418
          end
          inherited EditPesquisa: TcxButtonEdit
            Left = 392
            TabOrder = 5
            ExplicitLeft = 392
            ExplicitWidth = 155
            Width = 155
          end
          inherited cbPesquisarPor: TcxImageComboBox
            Left = 261
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
                Value = 5
              end>
            TabOrder = 4
            ExplicitLeft = 261
          end
          inherited btnPesquisar: TButton
            Left = 554
            ExplicitLeft = 554
          end
          inherited rgStatus: TcxRadioGroup
            Visible = True
          end
          object cbTipoVinculoPesquisa: TcxCheckComboBox
            Left = 135
            Top = 20
            Properties.EmptySelectionText = 'Todos'
            Properties.DropDownSizeable = True
            Properties.EditValueFormat = cvfIndices
            Properties.Items = <
              item
              end>
            TabOrder = 3
            Width = 126
          end
        end
        inherited pnBotoes: TPanel
          Width = 320
          ExplicitWidth = 320
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
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnEditsCadastro: TPanel
        object rgInfoPessoais: TcxGroupBox
          Left = 4
          Top = 4
          Caption = 'Informa'#231#245'es Gerais'
          TabOrder = 0
          Height = 149
          Width = 657
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
            Left = 105
            Top = 97
            Width = 71
            Height = 13
            Caption = 'Tipo de V'#237'nculo'
            FocusControl = cbTipo
          end
          object Label14: TLabel
            Left = 3
            Top = 97
            Width = 96
            Height = 13
            Caption = 'Data de Nascimento'
            FocusControl = EditRg
          end
          object Label15: TLabel
            Left = 312
            Top = 16
            Width = 58
            Height = 13
            Caption = 'Observa'#231#227'o'
            FocusControl = EditObservacao
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
            TabOrder = 2
            Width = 150
          end
          object EditCpf: TcxDBMaskEdit
            Left = 156
            Top = 72
            DataBinding.DataField = 'CPF'
            DataBinding.DataSource = dsMaster
            Properties.MaskKind = emkRegExprEx
            Properties.EditMask = '\d{3}\.\d{3}\.\d{3}-\d{2}'
            TabOrder = 3
            Width = 149
          end
          object cbTipo: TcxDBImageComboBox
            Left = 105
            Top = 113
            RepositoryItem = dmLookup.repIcbTipoPessoa
            DataBinding.DataField = 'TIPO'
            DataBinding.DataSource = dsMaster
            Properties.Items = <>
            TabOrder = 5
            Width = 200
          end
          object EditDataNascimento: TcxDBDateEdit
            Left = 3
            Top = 113
            DataBinding.DataField = 'DATA_NASCIMENTO'
            DataBinding.DataSource = dsMaster
            TabOrder = 4
            Width = 101
          end
          object EditObservacao: TcxDBMemo
            Left = 310
            Top = 32
            DataBinding.DataField = 'OBSERVACAO'
            DataBinding.DataSource = dsMaster
            TabOrder = 1
            Height = 102
            Width = 344
          end
        end
        object rgInfoContato: TcxGroupBox
          Left = 4
          Top = 159
          Caption = 'Informa'#231#245'es para Contato'
          TabOrder = 1
          Height = 149
          Width = 657
          object Label6: TLabel
            Left = 8
            Top = 16
            Width = 28
            Height = 13
            Caption = 'E-Mail'
            FocusControl = EditEmail
          end
          object Label7: TLabel
            Left = 413
            Top = 15
            Width = 33
            Height = 13
            Caption = 'Celular'
          end
          object Label8: TLabel
            Left = 537
            Top = 14
            Width = 42
            Height = 13
            Caption = 'Telefone'
          end
          object Label9: TLabel
            Left = 8
            Top = 55
            Width = 45
            Height = 13
            Caption = 'Endere'#231'o'
            FocusControl = EditEndereco
          end
          object Label10: TLabel
            Left = 410
            Top = 95
            Width = 33
            Height = 13
            Caption = 'Cidade'
            FocusControl = cbCidade
          end
          object Label11: TLabel
            Left = 8
            Top = 96
            Width = 65
            Height = 13
            Caption = 'Complemento'
            FocusControl = EditComplemento
          end
          object Label12: TLabel
            Left = 410
            Top = 55
            Width = 28
            Height = 13
            Caption = 'Bairro'
            FocusControl = EditBairro
          end
          object lb1: TLabel
            Left = 285
            Top = 95
            Width = 19
            Height = 13
            Caption = 'CEP'
          end
          object EditEmail: TcxDBTextEdit
            Left = 7
            Top = 31
            DataBinding.DataField = 'EMAIL'
            DataBinding.DataSource = dsMaster
            TabOrder = 0
            Width = 400
          end
          object EditEndereco: TcxDBTextEdit
            Left = 7
            Top = 70
            DataBinding.DataField = 'ENDERECO'
            DataBinding.DataSource = dsMaster
            TabOrder = 3
            Width = 400
          end
          object EditComplemento: TcxDBTextEdit
            Left = 6
            Top = 111
            DataBinding.DataField = 'COMPLEMENTO'
            DataBinding.DataSource = dsMaster
            TabOrder = 7
            Width = 275
          end
          object EditCelular: TcxDBMaskEdit
            Left = 410
            Top = 31
            DataBinding.DataField = 'CELULAR'
            DataBinding.DataSource = dsMaster
            Properties.MaskKind = emkRegExprEx
            Properties.EditMask = '\(\d\d\)\d{4}-\d{4,5}'
            TabOrder = 1
            Width = 121
          end
          object EditTelefone: TcxDBMaskEdit
            Left = 536
            Top = 31
            DataBinding.DataField = 'TELEFONE'
            DataBinding.DataSource = dsMaster
            Properties.MaskKind = emkRegExprEx
            Properties.EditMask = '\(\d\d\)\d{4}-\d{4,5}'
            TabOrder = 2
            Width = 118
          end
          object EditBairro: TcxDBTextEdit
            Left = 408
            Top = 70
            DataBinding.DataField = 'BAIRRO'
            DataBinding.DataSource = dsMaster
            TabOrder = 4
            Width = 246
          end
          object cbCidade: TcxDBLookupComboBox
            Left = 408
            Top = 111
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
            Properties.ListSource = dslkCidade
            TabOrder = 6
            Width = 246
          end
          object EditCep: TcxDBMaskEdit
            Left = 282
            Top = 111
            DataBinding.DataField = 'CEP'
            DataBinding.DataSource = dsMaster
            Properties.MaskKind = emkRegExprEx
            Properties.EditMask = '\d{5}-\d{3}'
            TabOrder = 5
            Width = 125
          end
        end
        object rgInfoLogin: TcxGroupBox
          Left = 666
          Top = 4
          Caption = 'Informa'#231#245'es de Login (Somente para usu'#225'rios do sistema)'
          TabOrder = 2
          Height = 109
          Width = 303
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
            Left = 3
            Top = 32
            DataBinding.DataField = 'LOGIN'
            DataBinding.DataSource = dsMaster
            TabOrder = 0
            Width = 295
          end
          object EditSenha: TcxTextEdit
            Left = 3
            Top = 72
            Properties.EchoMode = eemPassword
            Properties.PasswordChar = '*'
            TabOrder = 1
            Width = 295
          end
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnEditsCadastroDetail: TPanel
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
            TabOrder = 1
            ExplicitWidth = 976
            ExplicitHeight = 379
            inherited cxGrid1: TcxGrid
              Width = 457
              Height = 377
              ExplicitWidth = 457
              ExplicitHeight = 377
            end
            inherited pnBotoes: TPanel
              Left = 458
              Width = 48
              Height = 377
              ExplicitLeft = 458
              ExplicitWidth = 48
              ExplicitHeight = 377
              inherited btnAdd: TButton
                ExplicitWidth = 48
              end
              inherited btnAddTodos: TButton
                OnClick = frameGridsbtnAddTodosClick
                ExplicitWidth = 48
              end
              inherited btnRemover: TButton
                OnClick = frameGridsbtnRemoverClick
                ExplicitWidth = 48
              end
              inherited btnRemoverTodos: TButton
                ExplicitWidth = 48
              end
            end
            inherited cxGrid2: TcxGrid
              Left = 506
              Width = 469
              Height = 377
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
            TabOrder = 0
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
                Left = 505
                Width = 91
                Caption = 'Perfis selecionados'
                ExplicitLeft = 505
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
          inherited ActionListFrame: TActionList
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
    Top = 56
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
  object dslkCidade: TDataSource
    DataSet = dmPrincipal.cdslkCidade
    Left = 400
    Top = 184
  end
  object CustomizeDlg1: TCustomizeDlg
    StayOnTop = False
    Left = 464
    Top = 72
  end
end
