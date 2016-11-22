inherited frmTipoEspecie: TfrmTipoEspecie
  Caption = 'Tipo de Esp'#233'cie'
  ExplicitWidth = 320
  ExplicitHeight = 240
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
                Description = 'Nome'
                Value = 3
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
            end
            object viewRegistrosNOME: TcxGridDBColumn [1]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
            end
            object viewRegistrosNATIVA: TcxGridDBColumn [2]
              DataBinding.FieldName = 'NATIVA'
              RepositoryItem = dmLookup.RepIcbNaoSim
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
          Left = 6
          Top = 8
          Width = 27
          Height = 13
          Caption = 'Nome'
          FocusControl = EditNome
        end
        object Label4: TLabel
          Left = 6
          Top = 51
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object EditNome: TcxDBTextEdit
          Left = 4
          Top = 24
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 296
        end
        object EditDescricao: TcxDBMemo
          Left = 4
          Top = 67
          DataBinding.DataField = 'DESCRICAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 1
          Height = 89
          Width = 581
        end
        object chkNativa: TcxDBCheckBox
          Left = 306
          Top = 26
          RepositoryItem = dmLookup.RepChkNaoSim
          Caption = 'Nativa do Cerrado'
          DataBinding.DataField = 'NATIVA'
          DataBinding.DataSource = dsMaster
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          TabOrder = 2
          Width = 121
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmViveiro.cdsTipo_Especie
  end
  inherited fdExportDialog: TSaveTextFileDialog
    Left = 496
    Top = 200
  end
end
