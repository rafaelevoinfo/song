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
          Left = 553
          Width = 422
          AutoSize = False
          ExplicitLeft = 465
          ExplicitWidth = 422
          inherited Label1: TLabel
            Left = 7
            ExplicitLeft = 7
          end
          inherited rgStatus: TcxRadioGroup [1]
            Top = 20
            ExplicitTop = 20
          end
          inherited pnData: TPanel [2]
            Left = 186
            ExplicitLeft = 186
          end
          object cbEspeciePesquisa: TcxLookupComboBox [3]
            Left = 139
            Top = 20
            RepositoryItem = dmLookup.repLcbEspecie
            Properties.ListColumns = <>
            TabOrder = 5
            Visible = False
            Width = 177
          end
          inherited EditPesquisa: TcxButtonEdit [4]
            Left = 138
            ExplicitLeft = 138
          end
          inherited cbPesquisarPor: TcxImageComboBox [5]
            Left = 5
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
                Description = 'Esp'#233'cie'
                Value = 5
              end>
            ExplicitLeft = 5
          end
          inherited btnPesquisar: TButton [6]
            Left = 322
            ExplicitLeft = 322
          end
        end
        inherited pnBotoes: TPanel
          Width = 552
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Options.Editing = False
              Width = 41
            end
            object viewRegistrosNOME: TcxGridDBColumn [1]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
              Width = 168
            end
            object viewRegistrosESPECIE: TcxGridDBColumn [2]
              DataBinding.FieldName = 'ESPECIE'
              Options.Editing = False
              Width = 270
            end
            object viewRegistrosID_ESPECIE: TcxGridDBColumn [3]
              DataBinding.FieldName = 'ID_ESPECIE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosENDERECO: TcxGridDBColumn [4]
              DataBinding.FieldName = 'ENDERECO'
              Options.Editing = False
              Width = 329
            end
            object viewRegistrosLATITUDE: TcxGridDBColumn [5]
              DataBinding.FieldName = 'LATITUDE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosLONGITUDE: TcxGridDBColumn [6]
              DataBinding.FieldName = 'LONGITUDE'
              Visible = False
              Options.Editing = False
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      inherited pnEditsCadastro: TPanel
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
        object Label9: TLabel
          Left = 535
          Top = 43
          Width = 22
          Height = 13
          Caption = 'Foto'
        end
        object EditEndereco: TcxDBTextEdit
          Left = 5
          Top = 59
          DataBinding.DataField = 'ENDERECO'
          DataBinding.DataSource = dsMaster
          TabOrder = 4
          Width = 524
        end
        object EditDescricao: TcxDBMemo
          Left = 4
          Top = 98
          DataBinding.DataField = 'DESCRICAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 5
          Height = 127
          Width = 525
        end
        object cbEspecie: TcxDBLookupComboBox
          Left = 306
          Top = 19
          RepositoryItem = dmLookup.repLcbEspecie
          DataBinding.DataField = 'ID_ESPECIE'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 1
          Width = 223
        end
        object EditLatitude: TcxDBCalcEdit
          Left = 534
          Top = 19
          DataBinding.DataField = 'LATITUDE'
          DataBinding.DataSource = dsMaster
          TabOrder = 2
          Width = 121
        end
        object EditLongitude: TcxDBCalcEdit
          Left = 662
          Top = 19
          DataBinding.DataField = 'LONGITUDE'
          DataBinding.DataSource = dsMaster
          TabOrder = 3
          Width = 121
        end
        object EditNome: TcxDBTextEdit
          Left = 4
          Top = 19
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 297
        end
        object EditFoto: TcxDBImage
          Left = 534
          Top = 59
          DataBinding.DataField = 'FOTO'
          DataBinding.DataSource = dsMaster
          Properties.FitMode = ifmProportionalStretch
          Properties.GraphicClassName = 'TdxSmartImage'
          Properties.ImmediatePost = True
          TabOrder = 6
          Height = 131
          Width = 249
        end
        object btnCarregarFoto: TButton
          Left = 676
          Top = 197
          Width = 107
          Height = 28
          Action = Ac_CarregarFoto
          Images = dmPrincipal.imgIcons_16
          TabOrder = 7
        end
        object btnLimparFoto: TButton
          Left = 597
          Top = 197
          Width = 75
          Height = 28
          Action = Ac_LimparFoto
          Images = dmPrincipal.imgIcons_16
          TabOrder = 8
        end
      end
    end
  end
  inherited ActionList1: TActionList
    object Ac_LimparFoto: TAction
      Category = 'Master'
      Caption = 'Limpar'
      ImageIndex = 5
      OnExecute = Ac_LimparFotoExecute
    end
    object Ac_CarregarFoto: TAction
      Category = 'Master'
      Caption = 'Carregar Foto'
      ImageIndex = 9
      OnExecute = Ac_CarregarFotoExecute
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmViveiro.cdsMatriz
  end
  object foDialogFoto: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'JPEG'
        FileMask = '*.jpg'
      end
      item
        DisplayName = 'Bitmap'
        FileMask = '*.bmp'
      end
      item
        DisplayName = 'PNG'
        FileMask = '*.png'
      end>
    Options = []
    Left = 488
    Top = 240
  end
end
