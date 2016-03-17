inherited frmLote: TfrmLote
  Caption = 'Lotes de Sementes'
  ExplicitWidth = 1000
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 312
          Width = 663
          ExplicitLeft = 313
          ExplicitWidth = 663
          inherited Label1: TLabel
            Left = 277
            ExplicitLeft = 277
          end
          object Label7: TLabel [1]
            Left = 139
            Top = 4
            Width = 36
            Height = 13
            Caption = 'Esp'#233'cie'
          end
          inherited rgStatus: TcxRadioGroup [2]
            Properties.Items = <
              item
                Caption = 'Aberto'
              end
              item
                Caption = 'Fechado'
              end>
            Properties.OnEditValueChanged = rgStatusPropertiesEditValueChanged
            Visible = True
            ExplicitWidth = 135
            Width = 135
          end
          inherited pnData: TPanel [3]
            Left = 427
            ExplicitLeft = 427
          end
          inherited EditPesquisa: TcxButtonEdit [4]
            Left = 407
            ExplicitLeft = 407
            ExplicitWidth = 149
            Width = 149
          end
          inherited cbPesquisarPor: TcxImageComboBox [5]
            Left = 275
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
            ExplicitLeft = 275
            ExplicitWidth = 133
            Width = 133
          end
          inherited btnPesquisar: TButton [6]
            Left = 563
            ExplicitLeft = 563
          end
          object cbEspeciePesquisa: TcxLookupComboBox
            Left = 138
            Top = 20
            RepositoryItem = dmLookup.repLcbEspecie
            Properties.ListColumns = <>
            TabOrder = 5
            Width = 137
          end
        end
        inherited pnBotoes: TPanel
          Width = 311
          ExplicitWidth = 315
          object btnAbrirFecharLote: TButton
            AlignWithMargins = True
            Left = 188
            Top = 1
            Width = 100
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 2
            Margins.Bottom = 1
            Action = Ac_Fechar_Lote
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 2
            WordWrap = True
          end
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Options.Editing = False
              Width = 37
            end
            object viewRegistrosNOME_ESPECIE: TcxGridDBColumn [1]
              DataBinding.FieldName = 'NOME_ESPECIE'
              Options.Editing = False
              Width = 121
            end
            object viewRegistrosNOME: TcxGridDBColumn [2]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
              Width = 104
            end
            object viewRegistrosDATA: TcxGridDBColumn [3]
              DataBinding.FieldName = 'DATA'
              Options.Editing = False
              Width = 84
            end
            object viewRegistrosQTDE: TcxGridDBColumn [4]
              DataBinding.FieldName = 'QTDE'
              RepositoryItem = dmLookup.repCalcPadrao
              Options.Editing = False
              Width = 154
            end
            object viewRegistrosQTDE_ARMAZENADA: TcxGridDBColumn [5]
              DataBinding.FieldName = 'QTDE_ARMAZENADA'
              RepositoryItem = dmLookup.repCalcPadrao
              Options.Editing = False
              Width = 96
            end
            object viewRegistrosQTDE_SEMEADA: TcxGridDBColumn [6]
              DataBinding.FieldName = 'QTDE_SEMEADA'
              RepositoryItem = dmLookup.repCalcPadrao
              Options.Editing = False
              Width = 80
            end
            object viewRegistrosID_PESSOA_COLETOU: TcxGridDBColumn [7]
              DataBinding.FieldName = 'ID_PESSOA_COLETOU'
              RepositoryItem = dmLookup.repLcbPessoa
              Visible = False
              Options.Editing = False
              Width = 98
            end
            object viewRegistrosTAXA_GERMINACAO: TcxGridDBColumn [8]
              DataBinding.FieldName = 'TAXA_GERMINACAO'
              PropertiesClassName = 'TcxCalcEditProperties'
              Properties.DisplayFormat = ',0.00 %'
              Options.Editing = False
              Width = 90
            end
            object viewRegistrosTAXA_DESCARTE: TcxGridDBColumn [9]
              DataBinding.FieldName = 'TAXA_DESCARTE'
              PropertiesClassName = 'TcxCalcEditProperties'
              Properties.DisplayFormat = ',0.00 %'
              Options.Editing = False
              Width = 77
            end
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            ExplicitLeft = 0
            ExplicitTop = 0
            inherited tabDetail: TcxTabSheet
              Caption = 'Semeaduras'
              ExplicitLeft = 2
              ExplicitTop = 25
              ExplicitWidth = 965
              ExplicitHeight = 156
              inherited pnBotoesDetail: TPanel
                inherited btnIncluirDetail: TButton
                  ExplicitLeft = 1
                end
              end
            end
            object tabDetailGerminacao: TcxTabSheet
              Caption = 'Hist'#243'rico de Germina'#231#227'o'
              ImageIndex = 1
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
                ExplicitWidth = 455
                ExplicitHeight = 299
              end
              inherited pnBotoes: TPanel
                ExplicitLeft = 456
                ExplicitWidth = 48
                ExplicitHeight = 299
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
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
    end
  end
  inherited ActionList1: TActionList
    object Ac_Pesquisar_Pessoa: TAction
      Category = 'Master'
      ImageIndex = 0
      OnExecute = Ac_Pesquisar_PessoaExecute
    end
    object Ac_Reabrir_Lote: TAction
      Caption = 'Reabrir Lote'
      OnExecute = Ac_Reabrir_LoteExecute
      OnUpdate = Ac_Fechar_LoteUpdate
    end
    object Ac_Fechar_Lote: TAction
      Caption = 'Fechar Lote'
      OnExecute = Ac_Fechar_LoteExecute
      OnUpdate = Ac_Fechar_LoteUpdate
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmViveiro.cdsLote
  end
  inherited dsDetail: TDataSource
    DataSet = dmViveiro.cdsSemeadura
  end
  object cdsLocalMatrizes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 224
    object cdsLocalMatrizesID: TIntegerField
      DisplayLabel = 'Matriz'
      FieldName = 'ID'
      ProviderFlags = []
    end
  end
  object dsLocalMatrizes: TDataSource
    DataSet = cdsLocalMatrizes
    Left = 272
    Top = 320
  end
end
