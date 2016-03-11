inherited frmMatriz: TfrmMatriz
  ActiveControl = nil
  Caption = 'Matrizes'
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
                Description = 'Nome'
                Value = '3'
              end
              item
                Description = 'Esp'#233'cie'
                Value = '5'
              end>
          end
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Width = 41
            end
            object viewRegistrosNOME: TcxGridDBColumn [1]
              DataBinding.FieldName = 'NOME'
              Width = 168
            end
            object viewRegistrosESPECIE: TcxGridDBColumn [2]
              DataBinding.FieldName = 'ESPECIE'
              Width = 270
            end
            object viewRegistrosID_ESPECIE: TcxGridDBColumn [3]
              DataBinding.FieldName = 'ID_ESPECIE'
              Visible = False
            end
            object viewRegistrosENDERECO: TcxGridDBColumn [4]
              DataBinding.FieldName = 'ENDERECO'
              Width = 329
            end
            object viewRegistrosLATITUDE: TcxGridDBColumn [5]
              DataBinding.FieldName = 'LATITUDE'
              Visible = False
            end
            object viewRegistrosLONGITUDE: TcxGridDBColumn [6]
              DataBinding.FieldName = 'LONGITUDE'
              Visible = False
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
        ExplicitLeft = 4
        ExplicitTop = 52
        object Label3: TLabel
          Left = 5
          Top = 3
          Width = 27
          Height = 13
          Caption = 'Nome'
          FocusControl = EditNome
        end
        object Label4: TLabel
          Left = 307
          Top = 3
          Width = 36
          Height = 13
          Caption = 'Esp'#233'cie'
          FocusControl = cbEspecie
        end
        object Label5: TLabel
          Left = 7
          Top = 43
          Width = 54
          Height = 13
          Caption = 'Localiza'#231#227'o'
          FocusControl = EditEndereco
        end
        object Label6: TLabel
          Left = 5
          Top = 82
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = EditDescricao
        end
        object Label7: TLabel
          Left = 535
          Top = 3
          Width = 39
          Height = 13
          Caption = 'Latitude'
          FocusControl = EditLatitude
        end
        object Label8: TLabel
          Left = 662
          Top = 3
          Width = 47
          Height = 13
          Caption = 'Longitude'
          FocusControl = EditLongitude
        end
        object EditEndereco: TcxDBTextEdit
          Left = 5
          Top = 59
          DataBinding.DataField = 'ENDERECO'
          DataBinding.DataSource = dsMaster
          TabOrder = 3
          Width = 524
        end
        object EditDescricao: TcxDBMemo
          Left = 4
          Top = 98
          DataBinding.DataField = 'DESCRICAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 4
          Height = 89
          Width = 957
        end
        object cbEspecie: TcxDBLookupComboBox
          Left = 306
          Top = 19
          RepositoryItem = dmLookup.repLcbEspecie
          DataBinding.DataField = 'ID_ESPECIE'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 223
        end
        object EditLatitude: TcxDBCalcEdit
          Left = 534
          Top = 19
          DataBinding.DataField = 'LATITUDE'
          DataBinding.DataSource = dsMaster
          TabOrder = 1
          Width = 121
        end
        object EditLongitude: TcxDBCalcEdit
          Left = 662
          Top = 19
          DataBinding.DataField = 'LONGITUDE'
          DataBinding.DataSource = dsMaster
          TabOrder = 2
          Width = 121
        end
        object EditNome: TcxDBTextEdit
          Left = 4
          Top = 19
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 5
          Width = 297
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmViveiro.cdsMatriz
  end
end
