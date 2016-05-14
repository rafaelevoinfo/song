inherited frmEspecie: TfrmEspecie
  ActiveControl = btnIncluir
  Caption = 'Esp'#233'cies Produzidas'
  ExplicitTop = -136
  ExplicitWidth = 1000
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabPesquisa
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
                Description = 'Nome Popular'
                Value = 3
              end
              item
                Description = 'Nome Cient'#237'fico'
                Value = 5
              end
              item
                Description = 'Fam'#237'lia Bot'#226'nica'
                Value = 6
              end>
          end
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Visible = False
              Options.Editing = False
              Width = 47
            end
            object viewRegistrosNOME: TcxGridDBColumn [1]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
              Width = 249
            end
            object viewRegistrosNOME_CIENTIFICO: TcxGridDBColumn [2]
              DataBinding.FieldName = 'NOME_CIENTIFICO'
              Options.Editing = False
              Width = 174
            end
            object viewRegistrosFAMILIA_BOTANICA: TcxGridDBColumn [3]
              DataBinding.FieldName = 'FAMILIA_BOTANICA'
              Visible = False
              Options.Editing = False
              Width = 178
            end
            object viewRegistrosQTDE_POR_KILO: TcxGridDBColumn [4]
              DataBinding.FieldName = 'QTDE_SEMENTE_KILO'
              PropertiesClassName = 'TcxCalcEditProperties'
              Properties.AssignedValues.DisplayFormat = True
              Options.Editing = False
              Width = 121
            end
            object viewRegistrosQTDE_SEMENTE_ESTOQUE: TcxGridDBColumn [5]
              DataBinding.FieldName = 'QTDE_SEMENTE_ESTOQUE'
              PropertiesClassName = 'TcxCalcEditProperties'
              Properties.DisplayFormat = ',0.00 Kg'
              Options.Editing = False
              Width = 152
            end
            object viewRegistrosQTDE_MUDA_ESTOQUE: TcxGridDBColumn [6]
              DataBinding.FieldName = 'QTDE_MUDA_ESTOQUE'
              PropertiesClassName = 'TcxCalcEditProperties'
              Properties.DisplayFormat = ',0 Und'
              Options.Editing = False
              Width = 136
            end
            object viewRegistrosVALOR_MUDA: TcxGridDBColumn [7]
              DataBinding.FieldName = 'VALOR_MUDA'
              RepositoryItem = dmLookup.repCurPadrao
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosVALOR_KG_SEMENTE: TcxGridDBColumn [8]
              DataBinding.FieldName = 'VALOR_KG_SEMENTE'
              RepositoryItem = dmLookup.repCurPadrao
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosTEMPO_GERMINACAO: TcxGridDBColumn [9]
              DataBinding.FieldName = 'TEMPO_GERMINACAO'
              Visible = False
              Options.Editing = False
              Width = 152
            end
            object viewRegistrosINICIO_PERIODO_COLETA: TcxGridDBColumn [10]
              DataBinding.FieldName = 'INICIO_PERIODO_COLETA'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosFIM_PERIODO_COLETA: TcxGridDBColumn [11]
              DataBinding.FieldName = 'FIM_PERIODO_COLETA'
              Visible = False
              Options.Editing = False
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
        object Label3: TLabel
          Left = 5
          Top = 3
          Width = 66
          Height = 13
          Caption = 'Nome Popular'
          FocusControl = EditNome
        end
        object Label4: TLabel
          Left = 307
          Top = 3
          Width = 74
          Height = 13
          Caption = 'Nome Cient'#237'fico'
          FocusControl = EditNomeCientifico
        end
        object Label5: TLabel
          Left = 554
          Top = 3
          Width = 76
          Height = 13
          Caption = 'Fam'#237'lia Bot'#226'nica'
          FocusControl = EditFamiliaBotanica
        end
        object Label6: TLabel
          Left = 5
          Top = 83
          Width = 53
          Height = 13
          Caption = 'Oberva'#231#227'o'
          FocusControl = EditObsevacao
        end
        object Label7: TLabel
          Left = 169
          Top = 42
          Width = 131
          Height = 13
          Caption = 'Qtde. de Sementes por Kilo'
          FocusControl = EditQtdeSementeKilo
        end
        object Label8: TLabel
          Left = 4
          Top = 42
          Width = 150
          Height = 13
          Caption = 'Qtde. de Dias para Germina'#231#227'o'
        end
        object Label9: TLabel
          Left = 307
          Top = 42
          Width = 114
          Height = 13
          Caption = 'Valor do Kg da Semente'
          FocusControl = EditValorKg
        end
        object Label10: TLabel
          Left = 433
          Top = 42
          Width = 108
          Height = 13
          Caption = 'Valor Unit'#225'rio da Muda'
          FocusControl = EditValorUnidadeMuda
        end
        object Label11: TLabel
          Left = 555
          Top = 43
          Width = 128
          Height = 13
          Caption = 'In'#237'cio do Per'#237'odo de Coleta'
        end
        object lbl1: TLabel
          Left = 698
          Top = 43
          Width = 119
          Height = 13
          Caption = 'Fim do Per'#237'odo de Coleta'
        end
        object EditNome: TcxDBTextEdit
          Left = 4
          Top = 19
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 296
        end
        object EditNomeCientifico: TcxDBTextEdit
          Left = 305
          Top = 19
          DataBinding.DataField = 'NOME_CIENTIFICO'
          DataBinding.DataSource = dsMaster
          TabOrder = 1
          Width = 240
        end
        object EditFamiliaBotanica: TcxDBTextEdit
          Left = 552
          Top = 19
          DataBinding.DataField = 'FAMILIA_BOTANICA'
          DataBinding.DataSource = dsMaster
          TabOrder = 2
          Width = 275
        end
        object EditObsevacao: TcxDBMemo
          Left = 4
          Top = 99
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 9
          Height = 89
          Width = 823
        end
        object EditQtdeSementeKilo: TcxDBCalcEdit
          Left = 169
          Top = 58
          DataBinding.DataField = 'QTDE_SEMENTE_KILO'
          DataBinding.DataSource = dsMaster
          Properties.DisplayFormat = ',0'
          Properties.ImmediatePost = True
          TabOrder = 4
          Width = 131
        end
        object EditValorKg: TcxDBCurrencyEdit
          Left = 305
          Top = 58
          RepositoryItem = dmLookup.repCurPadrao
          DataBinding.DataField = 'VALOR_KG_SEMENTE'
          DataBinding.DataSource = dsMaster
          TabOrder = 5
          Width = 125
        end
        object EditValorUnidadeMuda: TcxDBCurrencyEdit
          Left = 434
          Top = 58
          RepositoryItem = dmLookup.repCurPadrao
          DataBinding.DataField = 'VALOR_MUDA'
          DataBinding.DataSource = dsMaster
          TabOrder = 6
          Width = 111
        end
        object EditTempoGerminacao: TcxDBSpinEdit
          Left = 4
          Top = 58
          DataBinding.DataField = 'TEMPO_GERMINACAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 3
          Width = 152
        end
        object EditInicioPeriodoColeta: TcxDBDateEdit
          Left = 552
          Top = 58
          DataBinding.DataField = 'INICIO_PERIODO_COLETA'
          DataBinding.DataSource = dsMaster
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 7
          Width = 139
        end
        object EditFimPeriodoColeta: TcxDBDateEdit
          Left = 697
          Top = 58
          DataBinding.DataField = 'FIM_PERIODO_COLETA'
          DataBinding.DataSource = dsMaster
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 8
          Width = 130
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmViveiro.cdsEspecie
  end
end
