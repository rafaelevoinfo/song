inherited frmAparelhoRegistrado: TfrmAparelhoRegistrado
  ActiveControl = nil
  Caption = 'Aparelhos Registrados'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 564
          Width = 411
          ExplicitWidth = 411
          inherited Label1: TLabel
            Left = 4
            ExplicitLeft = 4
          end
          inherited pnData: TPanel
            Left = 183
            ExplicitLeft = 183
          end
          inherited EditPesquisa: TcxButtonEdit
            Left = 135
            ExplicitLeft = 135
          end
          inherited cbPesquisarPor: TcxImageComboBox
            Left = 2
            ExplicitLeft = 2
          end
          inherited btnPesquisar: TButton
            Left = 311
            ExplicitLeft = 311
          end
          inherited rgStatus: TcxRadioGroup
            Left = 3
            Top = 39
            ExplicitLeft = 3
            ExplicitTop = 39
          end
        end
        inherited pnBotoes: TPanel
          inherited btnIncluir: TButton
            Visible = False
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
              Width = 381
            end
            object viewRegistrosSERIAL: TcxGridDBColumn [2]
              DataBinding.FieldName = 'SERIAL'
              Options.Editing = False
              Width = 340
            end
            inherited ColumnExcluir: TcxGridDBColumn
              Visible = False
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      inherited pnEditsCadastro: TPanel
        object Label3: TLabel
          Left = 5
          Top = 2
          Width = 88
          Height = 13
          Caption = 'Nome do Aparelho'
          FocusControl = EditNome
        end
        object EditNome: TcxDBTextEdit
          Left = 4
          Top = 18
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 296
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmSistema.cdsAparelho_Externo
  end
  inherited fdExportDialog: TSaveTextFileDialog
    Top = 192
  end
end
