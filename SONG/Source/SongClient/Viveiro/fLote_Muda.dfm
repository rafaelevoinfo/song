inherited frmLoteMuda: TfrmLoteMuda
  ActiveControl = btnSalvarDetail
  Caption = 'Lotes de Mudas'
  ExplicitWidth = 1000
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
          Left = 418
          Width = 557
          ExplicitLeft = 418
          ExplicitWidth = 557
          inherited Label1: TLabel
            Left = 142
            ExplicitLeft = 142
          end
          object lbl1: TLabel [1]
            Left = 3
            Top = 4
            Width = 36
            Height = 13
            Caption = 'Esp'#233'cie'
          end
          inherited rgStatus: TcxRadioGroup [2]
            Left = 3
            Top = 31
            TabOrder = 5
            ExplicitLeft = 3
            ExplicitTop = 31
          end
          inherited pnData: TPanel [3]
            Left = 321
            ExplicitLeft = 321
          end
          inherited EditPesquisa: TcxButtonEdit [4]
            Left = 273
            ExplicitLeft = 273
          end
          inherited cbPesquisarPor: TcxImageComboBox [5]
            Left = 140
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
                Description = 'Nome/Identifica'#231#227'o'
                Value = 3
              end
              item
                Description = 'Data'
                Value = 4
              end>
            ExplicitLeft = 140
          end
          inherited btnPesquisar: TButton [6]
            Left = 457
            TabOrder = 1
            ExplicitLeft = 457
          end
          object cbEspeciePesquisa: TcxLookupComboBox
            Left = 2
            Top = 20
            RepositoryItem = dmLookup.repLcbEspecie
            Properties.ListColumns = <>
            TabOrder = 2
            Width = 137
          end
        end
        inherited pnBotoes: TPanel
          Width = 417
          ExplicitWidth = 417
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Options.Editing = False
              Width = 33
            end
            object viewRegistrosID_ESPECIE: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ID_ESPECIE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosNOME_ESPECIE: TcxGridDBColumn [2]
              DataBinding.FieldName = 'NOME_ESPECIE'
              Options.Editing = False
              Width = 204
            end
            object viewRegistrosNOME: TcxGridDBColumn [3]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
              Width = 125
            end
            object viewRegistrosDATA: TcxGridDBColumn [4]
              DataBinding.FieldName = 'DATA'
              Options.Editing = False
              Width = 90
            end
            object viewRegistrosQTDE_INICIAL: TcxGridDBColumn [5]
              DataBinding.FieldName = 'QTDE_INICIAL'
              Options.Editing = False
              Width = 98
            end
            object viewRegistrosQTDE_ATUAL: TcxGridDBColumn [6]
              DataBinding.FieldName = 'QTDE_ATUAL'
              Options.Editing = False
              Width = 77
            end
            object viewRegistrosTAXA_CLASSIFICACAO: TcxGridDBColumn [7]
              DataBinding.FieldName = 'TAXA_CLASSIFICACAO'
              PropertiesClassName = 'TcxCalcEditProperties'
              Properties.DisplayFormat = ',0.00 %'
              Options.Editing = False
            end
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              Caption = 'Classifica'#231#245'es'
              ExplicitLeft = 2
              ExplicitTop = 25
              ExplicitWidth = 965
              ExplicitHeight = 156
              inherited cxGridRegistrosDetail: TcxGrid
                inherited viewRegistrosDetail: TcxGridDBTableView
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewRegistrosDetailID_PESSOA_CLASSIFICOU: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'ID_PESSOA_CLASSIFICOU'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailPESSOA_CLASSIFICOU: TcxGridDBColumn [2]
                    DataBinding.FieldName = 'PESSOA_CLASSIFICOU'
                    Options.Editing = False
                    Width = 167
                  end
                  object viewRegistrosDetailDATA: TcxGridDBColumn [3]
                    DataBinding.FieldName = 'DATA'
                    Options.Editing = False
                    SortIndex = 0
                    SortOrder = soDescending
                    Width = 107
                  end
                  object viewRegistrosDetailQTDE: TcxGridDBColumn [4]
                    DataBinding.FieldName = 'QTDE'
                    Options.Editing = False
                    Width = 84
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
          Left = 5
          Top = 0
          Width = 93
          Height = 13
          Caption = 'Nome/Identifica'#231#227'o'
          FocusControl = EditNome
        end
        object Label7: TLabel
          Left = 214
          Top = 0
          Width = 36
          Height = 13
          Caption = 'Esp'#233'cie'
          FocusControl = cbEspecie
        end
        object Label5: TLabel
          Left = 426
          Top = 1
          Width = 23
          Height = 13
          Caption = 'Data'
          FocusControl = EditData
        end
        object lbl2: TLabel
          Left = 7
          Top = 42
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
          FocusControl = EditObsLote
        end
        object Label4: TLabel
          Left = 551
          Top = 0
          Width = 116
          Height = 13
          Caption = 'Quantidade Inicial (Und)'
          FocusControl = EditQtdeInicial
        end
        object EditNome: TcxDBTextEdit
          Left = 5
          Top = 15
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 205
        end
        object cbEspecie: TcxDBLookupComboBox
          Left = 212
          Top = 15
          RepositoryItem = dmLookup.repLcbEspecie
          DataBinding.DataField = 'ID_ESPECIE'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 1
          Width = 205
        end
        object EditData: TcxDBDateEdit
          Left = 424
          Top = 16
          DataBinding.DataField = 'DATA'
          DataBinding.DataSource = dsMaster
          Properties.ClearKey = 46
          Properties.PostPopupValueOnTab = True
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 2
          Width = 121
        end
        object EditObsLote: TcxDBMemo
          Left = 5
          Top = 58
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 4
          Height = 71
          Width = 661
        end
        object EditQtdeInicial: TcxDBSpinEdit
          Left = 551
          Top = 15
          DataBinding.DataField = 'QTDE_INICIAL'
          DataBinding.DataSource = dsMaster
          TabOrder = 3
          Width = 115
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnBotoesCadastroDetail: TPanel
        TabOrder = 0
      end
      inherited pnEditsCadastroDetail: TPanel
        TabOrder = 1
        object Label8: TLabel
          Left = 6
          Top = 8
          Width = 131
          Height = 13
          Caption = 'Pessoa que Classificou (F2)'
          FocusControl = cbPessoaClassificou
        end
        object Label9: TLabel
          Left = 334
          Top = 8
          Width = 86
          Height = 13
          Caption = 'Quantidade (Und)'
          FocusControl = EditQtdeClassificada
        end
        object Label10: TLabel
          Left = 207
          Top = 7
          Width = 102
          Height = 13
          Caption = 'Data da Classifica'#231#227'o'
          FocusControl = EditDataClassificacao
        end
        object Label11: TLabel
          Left = 6
          Top = 50
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
          FocusControl = EditObservacaoClassificacao
        end
        object cbPessoaClassificou: TcxDBLookupComboBox
          Left = 4
          Top = 23
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_PESSOA_CLASSIFICOU'
          DataBinding.DataSource = dsDetail
          Properties.ListColumns = <>
          TabOrder = 0
          OnKeyDown = cbPessoaClassificouKeyDown
          Width = 173
        end
        object btnPesquisar_Pessoa_Semeadura: TButton
          Left = 179
          Top = 23
          Width = 22
          Height = 21
          Action = Ac_Pesquisar_Pessoa_Classificou
          Images = dmPrincipal.imgIcons_16
          TabOrder = 1
          TabStop = False
        end
        object EditDataClassificacao: TcxDBDateEdit
          Left = 207
          Top = 23
          DataBinding.DataField = 'DATA'
          DataBinding.DataSource = dsDetail
          TabOrder = 2
          Width = 121
        end
        object EditObservacaoClassificacao: TcxDBMemo
          Left = 4
          Top = 66
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsDetail
          TabOrder = 4
          Height = 63
          Width = 445
        end
        object EditQtdeClassificada: TcxDBSpinEdit
          Left = 334
          Top = 23
          DataBinding.DataField = 'QTDE'
          DataBinding.DataSource = dsDetail
          TabOrder = 3
          Width = 115
        end
      end
    end
  end
  inherited ActionList1: TActionList
    object Ac_Pesquisar_Pessoa_Classificou: TAction
      Category = 'Detail'
      ImageIndex = 0
      OnExecute = Ac_Pesquisar_Pessoa_ClassificouExecute
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmViveiro.cdsLote_Muda
  end
  inherited dsDetail: TDataSource
    DataSet = dmViveiro.cdsClassificacao
  end
end
