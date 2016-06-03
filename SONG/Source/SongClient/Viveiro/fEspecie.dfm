inherited frmEspecie: TfrmEspecie
  Caption = 'Esp'#233'cies Produzidas'
  ExplicitWidth = 1000
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
              Width = 199
            end
            object viewRegistrosNOME_CIENTIFICO: TcxGridDBColumn [2]
              DataBinding.FieldName = 'NOME_CIENTIFICO'
              Visible = False
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
              Visible = False
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
            object viewRegistrosQTDE_MUDA_PRONTA: TcxGridDBColumn [6]
              DataBinding.FieldName = 'QTDE_MUDA_PRONTA'
              Options.Editing = False
              Width = 112
            end
            object viewRegistrosQTDE_MUDA_DESENVOLVIMENTO: TcxGridDBColumn [7]
              DataBinding.FieldName = 'QTDE_MUDA_DESENVOLVIMENTO'
              Options.Editing = False
              Width = 184
            end
            object viewRegistrosVALOR_KG_SEMENTE: TcxGridDBColumn [8]
              DataBinding.FieldName = 'VALOR_KG_SEMENTE'
              RepositoryItem = dmLookup.repCurPadrao
              Options.Editing = False
            end
            object viewRegistrosVALOR_MUDA: TcxGridDBColumn [9]
              DataBinding.FieldName = 'VALOR_MUDA'
              RepositoryItem = dmLookup.repCurPadrao
              Options.Editing = False
            end
            object viewRegistrosTEMPO_GERMINACAO: TcxGridDBColumn [10]
              DataBinding.FieldName = 'TEMPO_GERMINACAO'
              Visible = False
              Options.Editing = False
              Width = 183
            end
            object viewRegistrosTEMPO_DESENVOLVIMENTO: TcxGridDBColumn [11]
              DataBinding.FieldName = 'TEMPO_DESENVOLVIMENTO'
              Visible = False
              Options.Editing = False
              Width = 265
            end
            object viewRegistrosINICIO_PERIODO_COLETA: TcxGridDBColumn [12]
              DataBinding.FieldName = 'INICIO_PERIODO_COLETA'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosFIM_PERIODO_COLETA: TcxGridDBColumn [13]
              DataBinding.FieldName = 'FIM_PERIODO_COLETA'
              Visible = False
              Options.Editing = False
            end
            inherited ColumnAlterar: TcxGridDBColumn
              MinWidth = 40
              Width = 40
            end
            inherited ColumnExcluir: TcxGridDBColumn
              MinWidth = 40
              Width = 40
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
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
          Top = 131
          Width = 53
          Height = 13
          Caption = 'Oberva'#231#227'o'
          FocusControl = EditObsevacao
        end
        object Label7: TLabel
          Left = 385
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
          Left = 523
          Top = 42
          Width = 114
          Height = 13
          Caption = 'Valor do Kg da Semente'
          FocusControl = EditValorKg
        end
        object Label10: TLabel
          Left = 676
          Top = 42
          Width = 108
          Height = 13
          Caption = 'Valor Unit'#225'rio da Muda'
          FocusControl = EditValorUnidadeMuda
        end
        object Label11: TLabel
          Left = 7
          Top = 89
          Width = 128
          Height = 13
          Caption = 'In'#237'cio do Per'#237'odo de Coleta'
        end
        object lbl1: TLabel
          Left = 151
          Top = 89
          Width = 119
          Height = 13
          Caption = 'Fim do Per'#237'odo de Coleta'
        end
        object Label12: TLabel
          Left = 160
          Top = 42
          Width = 220
          Height = 13
          Caption = 'Qtde. de Dias para Desenvolvimento da Muda'
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
          Top = 147
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 10
          Height = 89
          Width = 823
        end
        object EditQtdeSementeKilo: TcxDBCalcEdit
          Left = 385
          Top = 58
          DataBinding.DataField = 'QTDE_SEMENTE_KILO'
          DataBinding.DataSource = dsMaster
          Properties.DisplayFormat = ',0'
          Properties.ImmediatePost = True
          TabOrder = 5
          Width = 131
        end
        object EditValorKg: TcxDBCurrencyEdit
          Left = 521
          Top = 58
          RepositoryItem = dmLookup.repCurPadrao
          DataBinding.DataField = 'VALOR_KG_SEMENTE'
          DataBinding.DataSource = dsMaster
          TabOrder = 6
          Width = 152
        end
        object EditValorUnidadeMuda: TcxDBCurrencyEdit
          Left = 676
          Top = 58
          RepositoryItem = dmLookup.repCurPadrao
          DataBinding.DataField = 'VALOR_MUDA'
          DataBinding.DataSource = dsMaster
          TabOrder = 7
          Width = 151
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
          Left = 5
          Top = 104
          DataBinding.DataField = 'INICIO_PERIODO_COLETA'
          DataBinding.DataSource = dsMaster
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 8
          Width = 139
        end
        object EditFimPeriodoColeta: TcxDBDateEdit
          Left = 150
          Top = 104
          DataBinding.DataField = 'FIM_PERIODO_COLETA'
          DataBinding.DataSource = dsMaster
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 9
          Width = 130
        end
        object EditTempoDesenvolvimento: TcxDBSpinEdit
          Left = 160
          Top = 58
          DataBinding.DataField = 'TEMPO_DESENVOLVIMENTO'
          DataBinding.DataSource = dsMaster
          TabOrder = 4
          Width = 221
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmViveiro.cdsEspecie
  end
end
