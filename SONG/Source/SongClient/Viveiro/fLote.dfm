inherited frmLote: TfrmLote
  ActiveControl = btnIncluir
  Caption = 'Lotes de Sementes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabPesquisa
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 419
          Width = 556
          ExplicitWidth = 556
          inherited Label1: TLabel
            Left = 141
            ExplicitLeft = 141
          end
          object Label7: TLabel [1]
            Left = 3
            Top = 4
            Width = 36
            Height = 13
            Caption = 'Esp'#233'cie'
          end
          inherited rgStatus: TcxRadioGroup [2]
            Left = 419
            Top = 27
            ExplicitLeft = 419
            ExplicitTop = 27
          end
          inherited pnData: TPanel [3]
            Left = 320
            ExplicitLeft = 320
          end
          inherited EditPesquisa: TcxButtonEdit [4]
            Left = 272
            ExplicitLeft = 272
          end
          inherited cbPesquisarPor: TcxImageComboBox [5]
            Left = 139
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
                Description = 'Nome'
                Value = 3
              end
              item
                Description = 'Data da Coleta'
                Value = 4
              end>
            ExplicitLeft = 139
            ExplicitWidth = 133
            Width = 133
          end
          inherited btnPesquisar: TButton [6]
            Left = 456
            ExplicitLeft = 456
          end
          object cbEspeciePesquisa: TcxLookupComboBox
            Left = 2
            Top = 20
            RepositoryItem = dmLookup.repLcbEspecie
            Properties.ListColumns = <>
            TabOrder = 5
            Width = 137
          end
        end
        inherited pnBotoes: TPanel
          Width = 418
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Options.Editing = False
              Width = 37
            end
            object viewRegistrosNOME: TcxGridDBColumn [1]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
            end
            object viewRegistrosDATA: TcxGridDBColumn [2]
              DataBinding.FieldName = 'DATA'
              Options.Editing = False
              Width = 84
            end
            object viewRegistrosNOME_ESPECIE: TcxGridDBColumn [3]
              DataBinding.FieldName = 'NOME_ESPECIE'
              Options.Editing = False
              Width = 227
            end
            object viewRegistrosQTDE: TcxGridDBColumn [4]
              DataBinding.FieldName = 'QTDE'
              PropertiesClassName = 'TcxCalcEditProperties'
              Properties.DisplayFormat = ',0.00'
              Options.Editing = False
            end
            object viewRegistrosID_PESSOA_COLETOU: TcxGridDBColumn [5]
              DataBinding.FieldName = 'ID_PESSOA_COLETOU'
              RepositoryItem = dmLookup.repLcbPessoa
              Options.Editing = False
              Width = 98
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      inherited pnEditsCadastro: TPanel
        object pnMatrizes: TPanel
          Left = 1
          Top = 75
          Width = 974
          Height = 322
          Align = alClient
          TabOrder = 1
          inline frameMatrizes: TframeGrids
            Left = 1
            Top = 1
            Width = 972
            Height = 320
            Align = alClient
            TabOrder = 0
            ExplicitLeft = 1
            ExplicitTop = 1
            ExplicitWidth = 972
            ExplicitHeight = 320
            inherited gpGrids: TGridPanel
              Width = 972
              Height = 301
              ControlCollection = <
                item
                  Column = 0
                  Control = frameMatrizes.cxGrid1
                  Row = 0
                end
                item
                  Column = 1
                  Control = frameMatrizes.pnBotoes
                  Row = 0
                end
                item
                  Column = 2
                  Control = frameMatrizes.cxGrid2
                  Row = 0
                end>
              ExplicitWidth = 972
              ExplicitHeight = 301
              inherited cxGrid1: TcxGrid
                Width = 455
                Height = 299
                ExplicitWidth = 455
                ExplicitHeight = 299
              end
              inherited pnBotoes: TPanel
                Left = 456
                Width = 48
                Height = 299
                ExplicitLeft = 456
                ExplicitWidth = 48
                ExplicitHeight = 299
                inherited btnAdd: TButton
                  OnClick = nil
                  ExplicitWidth = 48
                end
                inherited btnAddTodos: TButton
                  ExplicitWidth = 48
                end
                inherited btnRemover: TButton
                  ExplicitWidth = 48
                end
                inherited btnRemoverTodos: TButton
                  ExplicitWidth = 48
                end
              end
              inherited cxGrid2: TcxGrid
                Left = 504
                Width = 467
                Height = 299
                ExplicitLeft = 504
                ExplicitWidth = 467
                ExplicitHeight = 299
              end
            end
            inherited pnLabels: TPanel
              Width = 972
              ExplicitWidth = 972
              inherited gpLabels: TGridPanel
                Width = 970
                ControlCollection = <
                  item
                    Column = 0
                    Control = frameMatrizes.lbInfoGridEsquerda
                    Row = 0
                  end
                  item
                    Column = 2
                    Control = frameMatrizes.lbInfoGridDireita
                    Row = 0
                  end>
                ExplicitWidth = 970
                inherited lbInfoGridEsquerda: TLabel
                  Width = 110
                  Caption = 'Matrizes dessa esp'#233'cie'
                  ExplicitWidth = 110
                end
                inherited lbInfoGridDireita: TLabel
                  Left = 503
                  Width = 92
                  Caption = 'Matr'#237'zes desse lote'
                  ExplicitLeft = 503
                  ExplicitWidth = 92
                end
              end
            end
            inherited dsEsquerda: TDataSource
              DataSet = cdsLocalMatrizes
            end
            inherited dsDireita: TDataSource
              DataSet = dmViveiro.cdsLote_Matriz
            end
          end
        end
        object pnTopEditsCadastro: TPanel
          Left = 1
          Top = 1
          Width = 974
          Height = 74
          Align = alTop
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 0
          object Label3: TLabel
            Left = 4
            Top = 0
            Width = 93
            Height = 13
            Caption = 'Nome/Identifica'#231#227'o'
            FocusControl = EditNome
          end
          object lbl1: TLabel
            Left = 6
            Top = 38
            Width = 36
            Height = 13
            Caption = 'Esp'#233'cie'
            FocusControl = cbEspecie
          end
          object Label4: TLabel
            Left = 217
            Top = 0
            Width = 116
            Height = 13
            Caption = 'Pessoa que coletou (F2)'
            FocusControl = cbPessoaColetou
          end
          object Label5: TLabel
            Left = 461
            Top = 0
            Width = 23
            Height = 13
            Caption = 'Data'
            FocusControl = EditData
          end
          object Label6: TLabel
            Left = 585
            Top = 0
            Width = 79
            Height = 13
            Caption = 'Quantidade (Kg)'
            FocusControl = EditQtde
          end
          object EditNome: TcxDBTextEdit
            Left = 4
            Top = 15
            DataBinding.DataField = 'NOME'
            DataBinding.DataSource = dsMaster
            TabOrder = 0
            Width = 205
          end
          object cbEspecie: TcxDBLookupComboBox
            Left = 4
            Top = 53
            RepositoryItem = dmLookup.repLcbEspecie
            DataBinding.DataField = 'ID_ESPECIE'
            DataBinding.DataSource = dsMaster
            Properties.ListColumns = <>
            Properties.OnEditValueChanged = cbEspeciePropertiesEditValueChanged
            TabOrder = 4
            Width = 205
          end
          object cbPessoaColetou: TcxDBLookupComboBox
            Left = 215
            Top = 15
            RepositoryItem = dmLookup.repLcbPessoa
            DataBinding.DataField = 'ID_PESSOA_COLETOU'
            DataBinding.DataSource = dsMaster
            Properties.ListColumns = <>
            TabOrder = 1
            OnKeyDown = cbPessoaColetouKeyDown
            Width = 218
          end
          object EditData: TcxDBDateEdit
            Left = 459
            Top = 15
            DataBinding.DataField = 'DATA'
            DataBinding.DataSource = dsMaster
            Properties.ClearKey = 46
            Properties.PostPopupValueOnTab = True
            Properties.SaveTime = False
            Properties.ShowTime = False
            TabOrder = 2
            Width = 121
          end
          object EditQtde: TcxDBCalcEdit
            Left = 586
            Top = 15
            DataBinding.DataField = 'QTDE'
            DataBinding.DataSource = dsMaster
            Properties.DisplayFormat = ',0.00'
            Properties.ImmediatePost = True
            TabOrder = 3
            Width = 121
          end
          object btnPesquisarAtividade: TButton
            Left = 435
            Top = 15
            Width = 22
            Height = 21
            Action = Ac_Pesquisar_Pessoa
            Images = dmPrincipal.imgIcons_16
            TabOrder = 5
            TabStop = False
          end
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
    DataSet = dmViveiro.cdsLote
  end
  object cdsLocalMatrizes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 256
    object cdsLocalMatrizesID: TIntegerField
      DisplayLabel = 'Matriz'
      FieldName = 'ID'
      ProviderFlags = []
    end
  end
  object dsLocalMatrizes: TDataSource
    DataSet = cdsLocalMatrizes
    Left = 144
    Top = 312
  end
end
