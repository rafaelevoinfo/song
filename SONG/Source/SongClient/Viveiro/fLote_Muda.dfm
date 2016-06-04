inherited frmLoteMuda: TfrmLoteMuda
  ActiveControl = EditNome
  Caption = 'Lotes de Mudas'
  ExplicitWidth = 1000
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabCadastro
    inherited tabPesquisa: TcxTabSheet
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
          object cbPesquisaStatusMuda: TcxImageComboBox [2]
            Left = 274
            Top = 20
            RepositoryItem = dmLookup.repIcbStatusMudas
            Properties.Items = <>
            TabOrder = 6
            Width = 176
          end
          inherited rgStatus: TcxRadioGroup [3]
            Left = 3
            Top = 31
            TabOrder = 5
            ExplicitLeft = 3
            ExplicitTop = 31
          end
          inherited pnData: TPanel [4]
            Left = 321
            ExplicitLeft = 321
          end
          inherited EditPesquisa: TcxButtonEdit [5]
            Left = 273
            ExplicitLeft = 273
          end
          inherited cbPesquisarPor: TcxImageComboBox [6]
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
              end
              item
                Description = 'Status'
                Value = 5
              end
              item
                Description = 'Id do Lote de Semente'
                Value = 6
              end>
            ExplicitLeft = 140
          end
          inherited btnPesquisar: TButton [7]
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
              Visible = False
              Options.Editing = False
              Width = 33
            end
            object viewRegistrosID_ESPECIE: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ID_ESPECIE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_LOTE_SEMENTE: TcxGridDBColumn [2]
              DataBinding.FieldName = 'ID_LOTE_SEMENTE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_COMPRA_ITEM: TcxGridDBColumn [3]
              DataBinding.FieldName = 'ID_COMPRA_ITEM'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosNOME_ESPECIE: TcxGridDBColumn [4]
              DataBinding.FieldName = 'NOME_ESPECIE'
              Options.Editing = False
              Width = 204
            end
            object viewRegistrosNOME: TcxGridDBColumn [5]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
              Width = 156
            end
            object viewRegistrosDATA: TcxGridDBColumn [6]
              DataBinding.FieldName = 'DATA'
              Visible = False
              Options.Editing = False
              Width = 90
            end
            object viewRegistrosQTDE_INICIAL: TcxGridDBColumn [7]
              DataBinding.FieldName = 'QTDE_INICIAL'
              Options.Editing = False
              Width = 94
            end
            object viewRegistrosQTDE_CLASSIFICADA: TcxGridDBColumn [8]
              DataBinding.FieldName = 'QTDE_CLASSIFICADA'
              Options.Editing = False
              Width = 92
            end
            object viewRegistrosTAXA_CLASSIFICACAO: TcxGridDBColumn [9]
              DataBinding.FieldName = 'TAXA_CLASSIFICACAO'
              PropertiesClassName = 'TcxCalcEditProperties'
              Properties.DisplayFormat = ',0.00 %'
              Options.Editing = False
              Width = 83
            end
            object viewRegistrosSALDO: TcxGridDBColumn [10]
              DataBinding.FieldName = 'SALDO'
              Options.Editing = False
              Width = 105
            end
            object viewRegistrosDATA_CLASSIFICACAO: TcxGridDBColumn [11]
              DataBinding.FieldName = 'DATA_CLASSIFICACAO'
              Visible = False
              Options.Editing = False
              Width = 119
            end
            object viewRegistrosID_PESSOA_CLASSIFICOU: TcxGridDBColumn [12]
              DataBinding.FieldName = 'ID_PESSOA_CLASSIFICOU'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosPESSOA_CLASSIFICOU: TcxGridDBColumn [13]
              DataBinding.FieldName = 'PESSOA_CLASSIFICOU'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosSTATUS: TcxGridDBColumn [14]
              DataBinding.FieldName = 'STATUS'
              RepositoryItem = dmLookup.repIcbStatusMudas
              Options.Editing = False
              Width = 128
            end
            inherited ColumnAlterar: TcxGridDBColumn
              MinWidth = 44
              Width = 44
            end
            inherited ColumnExcluir: TcxGridDBColumn
              MinWidth = 44
              Width = 44
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
        object Label6: TLabel
          Left = 674
          Top = 0
          Width = 85
          Height = 13
          Caption = 'Status das Mudas'
          FocusControl = cbStatusMuda
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
        object EditObsLote: TcxDBMemo
          Left = 5
          Top = 58
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 5
          Height = 71
          Width = 661
        end
        object EditQtdeInicial: TcxDBSpinEdit
          Left = 551
          Top = 15
          DataBinding.DataField = 'QTDE_INICIAL'
          DataBinding.DataSource = dsMaster
          Properties.DisplayFormat = ',0'
          TabOrder = 3
          Width = 115
        end
        object cxGroupBox1: TcxGroupBox
          Left = 7
          Top = 135
          Caption = 'Classifica'#231#227'o'
          TabOrder = 6
          Height = 146
          Width = 659
          object Label8: TLabel
            Left = 5
            Top = 16
            Width = 131
            Height = 13
            Caption = 'Pessoa que Classificou (F2)'
            FocusControl = cbPessoaClassificou
          end
          object Label10: TLabel
            Left = 209
            Top = 15
            Width = 102
            Height = 13
            Caption = 'Data da Classifica'#231#227'o'
            FocusControl = EditDataClassificacao
          end
          object Label9: TLabel
            Left = 335
            Top = 16
            Width = 86
            Height = 13
            Caption = 'Quantidade (Und)'
            FocusControl = EditQtdeClassificada
          end
          object Label11: TLabel
            Left = 5
            Top = 58
            Width = 58
            Height = 13
            Caption = 'Observa'#231#227'o'
            FocusControl = EditObservacaoClassificacao
          end
          object cbPessoaClassificou: TcxDBLookupComboBox
            Left = 3
            Top = 31
            RepositoryItem = dmLookup.repLcbPessoa
            DataBinding.DataField = 'ID_PESSOA_CLASSIFICOU'
            DataBinding.DataSource = dsMaster
            Properties.ListColumns = <>
            TabOrder = 0
            OnKeyDown = cbPessoaClassificouKeyDown
            Width = 173
          end
          object btnPesquisar_Pessoa_Semeadura: TButton
            Left = 178
            Top = 31
            Width = 22
            Height = 21
            Action = Ac_Pesquisar_Pessoa_Classificou
            Images = dmPrincipal.imgIcons_16
            TabOrder = 1
            TabStop = False
          end
          object EditDataClassificacao: TcxDBDateEdit
            Left = 206
            Top = 31
            DataBinding.DataField = 'DATA_CLASSIFICACAO'
            DataBinding.DataSource = dsMaster
            TabOrder = 2
            Width = 121
          end
          object EditQtdeClassificada: TcxDBSpinEdit
            Left = 333
            Top = 31
            DataBinding.DataField = 'QTDE_CLASSIFICADA'
            DataBinding.DataSource = dsMaster
            TabOrder = 3
            Width = 115
          end
          object EditObservacaoClassificacao: TcxDBMemo
            Left = 3
            Top = 74
            DataBinding.DataField = 'OBSERVACAO_CLASSIFICACAO'
            DataBinding.DataSource = dsMaster
            TabOrder = 4
            Height = 63
            Width = 654
          end
        end
        object cbStatusMuda: TcxDBImageComboBox
          Left = 671
          Top = 15
          RepositoryItem = dmLookup.repIcbStatusMudas
          DataBinding.DataField = 'STATUS'
          DataBinding.DataSource = dsMaster
          Properties.Items = <>
          TabOrder = 4
          Width = 153
        end
      end
    end
  end
  inherited ActionList1: TActionList
    object Ac_Pesquisar_Pessoa_Classificou: TAction
      Category = 'Master'
      ImageIndex = 0
      OnExecute = Ac_Pesquisar_Pessoa_ClassificouExecute
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmViveiro.cdsLote_Muda
  end
end
