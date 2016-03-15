inherited frmLote: TfrmLote
  Caption = 'Lotes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Width = 37
            end
            object viewRegistrosNOME: TcxGridDBColumn [1]
              DataBinding.FieldName = 'NOME'
            end
            object viewRegistrosDATA: TcxGridDBColumn [2]
              DataBinding.FieldName = 'DATA'
              Width = 84
            end
            object viewRegistrosNOME_ESPECIE: TcxGridDBColumn [3]
              DataBinding.FieldName = 'NOME_ESPECIE'
              Width = 227
            end
            object viewRegistrosQTDE_GRAMAS: TcxGridDBColumn [4]
              DataBinding.FieldName = 'QTDE_GRAMAS'
            end
            object viewRegistrosID_PESSOA_COLETOU: TcxGridDBColumn [5]
              DataBinding.FieldName = 'ID_PESSOA_COLETOU'
              RepositoryItem = dmLookup.repLcbPessoa
              Width = 98
            end
            object viewRegistrosTIPO: TcxGridDBColumn [6]
              DataBinding.FieldName = 'TIPO'
              Visible = False
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
          ExplicitLeft = 6
          ExplicitTop = 86
          ExplicitWidth = 963
          ExplicitHeight = 315
          inline frameMatrizes: TframeGrids
            Left = 1
            Top = 1
            Width = 972
            Height = 320
            Align = alClient
            TabOrder = 0
            ExplicitTop = -128
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
              inherited cxGrid1: TcxGrid
                Width = 455
                Height = 299
              end
              inherited pnBotoes: TPanel
                Left = 456
                Width = 48
                Height = 299
              end
              inherited cxGrid2: TcxGrid
                Left = 504
                Width = 467
                Height = 299
              end
            end
            inherited pnLabels: TPanel
              Width = 972
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
                inherited lbInfoGridDireita: TLabel
                  Left = 503
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
            Width = 99
            Height = 13
            Caption = 'Nome/Indentifica'#231#227'o'
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
            Width = 93
            Height = 13
            Caption = 'Pessoa que coletou'
            FocusControl = cbPessoaColetou
          end
          object Label5: TLabel
            Left = 441
            Top = 0
            Width = 23
            Height = 13
            Caption = 'Data'
            FocusControl = EditData
          end
          object Label6: TLabel
            Left = 565
            Top = 0
            Width = 70
            Height = 13
            Caption = 'Quantidade(g)'
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
            Width = 218
          end
          object EditData: TcxDBDateEdit
            Left = 439
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
            Left = 565
            Top = 16
            DataBinding.DataField = 'QTDE_GRAMAS'
            DataBinding.DataSource = dsMaster
            Properties.DisplayFormat = ',0.00'
            Properties.ImmediatePost = True
            TabOrder = 3
            Width = 121
          end
        end
      end
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
      FieldName = 'ID'
      ProviderFlags = []
    end
    object cdsLocalMatrizesNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object dsLocalMatrizes: TDataSource
    DataSet = cdsLocalMatrizes
    Left = 144
    Top = 312
  end
end
