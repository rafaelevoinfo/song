inherited frmEspecie: TfrmEspecie
  ActiveControl = EditNome
  Caption = 'Esp'#233'cies Produzidas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabCadastro
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
              Width = 209
            end
            object viewRegistrosFAMILIA_BOTANICA: TcxGridDBColumn [3]
              DataBinding.FieldName = 'FAMILIA_BOTANICA'
              Options.Editing = False
              Width = 234
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
          Left = 609
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
          Width = 296
        end
        object EditFamiliaBotanica: TcxDBTextEdit
          Left = 607
          Top = 19
          DataBinding.DataField = 'FAMILIA_BOTANICA'
          DataBinding.DataSource = dsMaster
          TabOrder = 2
          Width = 296
        end
        object EditObsevacao: TcxDBMemo
          Left = 4
          Top = 62
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 3
          Height = 89
          Width = 898
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmViveiro.cdsEspecie
  end
end
