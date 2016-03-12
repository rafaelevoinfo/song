inherited frmEspecie: TfrmEspecie
  Caption = 'Esp'#233'cies Produzidas'
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
              Options.Editing = False
              Width = 47
            end
            object viewRegistrosNOME: TcxGridDBColumn [1]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
              Width = 307
            end
            object viewRegistrosNOME_CIENTIFICO: TcxGridDBColumn [2]
              DataBinding.FieldName = 'NOME_CIENTIFICO'
              Options.Editing = False
              Width = 174
            end
            object viewRegistrosFAMILIA_BOTANICA: TcxGridDBColumn [3]
              DataBinding.FieldName = 'FAMILIA_BOTANICA'
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
          Left = 553
          Top = 3
          Width = 76
          Height = 13
          Caption = 'Fam'#237'lia Bot'#226'nica'
          FocusControl = EditFamiliaBotanica
        end
        object Label6: TLabel
          Left = 5
          Top = 46
          Width = 53
          Height = 13
          Caption = 'Oberva'#231#227'o'
          FocusControl = EditObsevacao
        end
        object Label7: TLabel
          Left = 797
          Top = 3
          Width = 131
          Height = 13
          Caption = 'Qtde. de Sementes por Kilo'
          FocusControl = EditQtdeSementeKilo
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
          Left = 551
          Top = 19
          DataBinding.DataField = 'FAMILIA_BOTANICA'
          DataBinding.DataSource = dsMaster
          TabOrder = 2
          Width = 240
        end
        object EditObsevacao: TcxDBMemo
          Left = 4
          Top = 62
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 4
          Height = 89
          Width = 924
        end
        object EditQtdeSementeKilo: TcxDBCalcEdit
          Left = 797
          Top = 19
          DataBinding.DataField = 'QTDE_SEMENTE_KILO'
          DataBinding.DataSource = dsMaster
          Properties.DisplayFormat = ',0'
          Properties.ImmediatePost = True
          TabOrder = 3
          Width = 131
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmViveiro.cdsEspecie
  end
end
