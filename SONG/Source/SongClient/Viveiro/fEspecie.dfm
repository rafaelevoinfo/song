inherited frmEspecie: TfrmEspecie
  Caption = 'Esp'#233'cies Produzidas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 376
          Width = 599
          ExplicitLeft = 384
          ExplicitWidth = 599
          inherited pnData: TPanel
            Left = 371
            ExplicitLeft = 371
          end
          inherited EditPesquisa: TcxButtonEdit
            Left = 264
            ExplicitLeft = 264
            ExplicitWidth = 236
            Width = 236
          end
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
          inherited btnPesquisar: TButton
            Left = 499
            ExplicitLeft = 499
          end
          inherited rgStatus: TcxRadioGroup
            ExplicitWidth = 126
            Width = 126
          end
          object chkSomenteExotica: TcxCheckBox
            Left = 211
            Top = 2
            Caption = 'Apenas esp'#233'cies ex'#243'ticas'
            TabOrder = 5
            Width = 155
          end
        end
        inherited pnBotoes: TPanel
          Width = 375
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
            object viewRegistrosID_FAMILIA_BOTANICA: TcxGridDBColumn [3]
              DataBinding.FieldName = 'ID_FAMILIA_BOTANICA'
              Visible = False
            end
            object viewRegistrosFAMILIA_BOTANICA: TcxGridDBColumn [4]
              DataBinding.FieldName = 'FAMILIA_BOTANICA'
              Visible = False
              Options.Editing = False
              Width = 178
            end
            object viewRegistrosQTDE_POR_KILO: TcxGridDBColumn [5]
              DataBinding.FieldName = 'QTDE_SEMENTE_KILO'
              PropertiesClassName = 'TcxCalcEditProperties'
              Properties.AssignedValues.DisplayFormat = True
              Visible = False
              Options.Editing = False
              Width = 121
            end
            object viewRegistrosQTDE_SEMENTE_TUBETE: TcxGridDBColumn [6]
              DataBinding.FieldName = 'QTDE_SEMENTE_TUBETE'
              Visible = False
              Options.Editing = False
              Width = 152
            end
            object viewRegistrosPESO_MEDIO_SEMENTE: TcxGridDBColumn [7]
              DataBinding.FieldName = 'PESO_MEDIO_SEMENTE'
              Visible = False
            end
            object viewRegistrosQTDE_SEMENTE_ESTOQUE: TcxGridDBColumn [8]
              DataBinding.FieldName = 'QTDE_SEMENTE_ESTOQUE'
              PropertiesClassName = 'TcxCalcEditProperties'
              Properties.DisplayFormat = ',0.00 Kg'
              Options.Editing = False
              Width = 152
            end
            object viewRegistrosQTDE_MUDA_PRONTA: TcxGridDBColumn [9]
              DataBinding.FieldName = 'QTDE_MUDA_PRONTA'
              Options.Editing = False
              Width = 112
            end
            object viewRegistrosQTDE_MUDA_DESENVOLVIMENTO: TcxGridDBColumn [10]
              DataBinding.FieldName = 'QTDE_MUDA_DESENVOLVIMENTO'
              Options.Editing = False
              Width = 184
            end
            object viewRegistrosCALC_TOTAL_MUDAS: TcxGridDBColumn [11]
              DataBinding.FieldName = 'CALC_TOTAL_MUDAS'
              Options.Editing = False
              Width = 78
            end
            object viewRegistrosVALOR_KG_SEMENTE: TcxGridDBColumn [12]
              DataBinding.FieldName = 'VALOR_KG_SEMENTE'
              RepositoryItem = dmLookup.repCurPadrao
              Options.Editing = False
            end
            object viewRegistrosVALOR_MUDA: TcxGridDBColumn [13]
              DataBinding.FieldName = 'VALOR_MUDA'
              RepositoryItem = dmLookup.repCurPadrao
              Options.Editing = False
            end
            object viewRegistrosTEMPO_GERMINACAO: TcxGridDBColumn [14]
              DataBinding.FieldName = 'TEMPO_GERMINACAO'
              Visible = False
              Options.Editing = False
              Width = 183
            end
            object viewRegistrosTEMPO_DESENVOLVIMENTO: TcxGridDBColumn [15]
              DataBinding.FieldName = 'TEMPO_DESENVOLVIMENTO'
              Visible = False
              Options.Editing = False
              Width = 265
            end
            object viewRegistrosEXOTICA: TcxGridDBColumn [16]
              DataBinding.FieldName = 'EXOTICA'
              RepositoryItem = dmLookup.RepIcbNaoSim
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
          Left = 553
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
          Left = 161
          Top = 88
          Width = 114
          Height = 13
          Caption = 'Valor do Kg da Semente'
          FocusControl = EditValorKg
        end
        object Label10: TLabel
          Left = 314
          Top = 88
          Width = 108
          Height = 13
          Caption = 'Valor Unit'#225'rio da Muda'
          FocusControl = EditValorUnidadeMuda
        end
        object Label11: TLabel
          Left = 471
          Top = 89
          Width = 111
          Height = 13
          Caption = 'M'#234's de In'#237'cio da Coleta'
        end
        object lbl1: TLabel
          Left = 615
          Top = 89
          Width = 102
          Height = 13
          Caption = 'M'#234's de Fim da Coleta'
        end
        object Label12: TLabel
          Left = 160
          Top = 42
          Width = 220
          Height = 13
          Caption = 'Qtde. de Dias para Desenvolvimento da Muda'
        end
        object Label13: TLabel
          Left = 386
          Top = 42
          Width = 130
          Height = 13
          Caption = 'Peso m'#233'dio da semente (g)'
        end
        object Label14: TLabel
          Left = 5
          Top = 88
          Width = 146
          Height = 13
          Caption = 'Qtde. de sementes por tubete'
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
        object EditObsevacao: TcxDBMemo
          Left = 4
          Top = 147
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 13
          Height = 89
          Width = 823
        end
        object EditQtdeSementeKilo: TcxDBCalcEdit
          Left = 552
          Top = 58
          RepositoryItem = dmLookup.repCalcInteiro
          DataBinding.DataField = 'QTDE_SEMENTE_KILO'
          DataBinding.DataSource = dsMaster
          Properties.AssignedValues.DisplayFormat = True
          TabOrder = 6
          Width = 275
        end
        object EditValorKg: TcxDBCurrencyEdit
          Left = 159
          Top = 104
          RepositoryItem = dmLookup.repCurPadrao
          DataBinding.DataField = 'VALOR_KG_SEMENTE'
          DataBinding.DataSource = dsMaster
          TabOrder = 8
          Width = 152
        end
        object EditValorUnidadeMuda: TcxDBCurrencyEdit
          Left = 314
          Top = 104
          RepositoryItem = dmLookup.repCurPadrao
          DataBinding.DataField = 'VALOR_MUDA'
          DataBinding.DataSource = dsMaster
          TabOrder = 9
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
        object EditTempoDesenvolvimento: TcxDBSpinEdit
          Left = 160
          Top = 58
          DataBinding.DataField = 'TEMPO_DESENVOLVIMENTO'
          DataBinding.DataSource = dsMaster
          TabOrder = 4
          Width = 221
        end
        object cbMesInicioColeta: TcxDBImageComboBox
          Left = 469
          Top = 104
          RepositoryItem = dmLookup.repIcbMeses
          DataBinding.DataField = 'MES_INICIO_COLETA'
          DataBinding.DataSource = dsMaster
          Properties.Items = <>
          TabOrder = 10
          Width = 141
        end
        object cbMesFimColeta: TcxDBImageComboBox
          Left = 613
          Top = 104
          RepositoryItem = dmLookup.repIcbMeses
          DataBinding.DataField = 'MES_FIM_COLETA'
          DataBinding.DataSource = dsMaster
          Properties.Items = <>
          TabOrder = 11
          Width = 127
        end
        object EditPesoMedio: TcxDBCalcEdit
          Left = 383
          Top = 58
          DataBinding.DataField = 'PESO_MEDIO_SEMENTE'
          DataBinding.DataSource = dsMaster
          Properties.AssignedValues.DisplayFormat = True
          Properties.OnEditValueChanged = EditPesoMedioPropertiesEditValueChanged
          TabOrder = 5
          Width = 162
        end
        object cbFamiliaBotanica: TcxDBLookupComboBox
          Left = 552
          Top = 19
          RepositoryItem = dmLookup.repLcbFamiliaBotanica
          DataBinding.DataField = 'ID_FAMILIA_BOTANICA'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 2
          Width = 275
        end
        object EditQtdeSementeTubete: TcxDBSpinEdit
          Left = 5
          Top = 104
          DataBinding.DataField = 'QTDE_SEMENTE_TUBETE'
          DataBinding.DataSource = dsMaster
          TabOrder = 7
          Width = 150
        end
        object chkExotica: TcxDBCheckBox
          Left = 743
          Top = 106
          RepositoryItem = dmLookup.RepChkNaoSim
          Caption = 'Esp'#233'cie Ex'#243'tica'
          DataBinding.DataField = 'EXOTICA'
          DataBinding.DataSource = dsMaster
          Style.BorderColor = clNone
          TabOrder = 12
          Width = 121
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Top = 248
  end
  inherited dsMaster: TDataSource
    DataSet = dmViveiro.cdsEspecie
    Left = 240
    Top = 224
  end
end
