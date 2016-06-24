inherited frmCamaraFria: TfrmCamaraFria
  Caption = 'C'#226'mara Fria'
  ExplicitWidth = 1000
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
          inherited rgStatus: TcxRadioGroup [1]
            Left = 6
            Top = 33
            ExplicitLeft = 6
            ExplicitTop = 33
          end
          inherited pnData: TPanel [2]
            Left = 183
            ExplicitLeft = 183
          end
          inherited EditPesquisa: TcxButtonEdit [3]
            Left = 135
            ExplicitLeft = 135
          end
          inherited cbPesquisarPor: TcxImageComboBox [4]
            Left = 2
            ExplicitLeft = 2
          end
          inherited btnPesquisar: TButton [5]
            Left = 311
            ExplicitLeft = 311
          end
        end
        inherited pnBotoes: TPanel
          Width = 563
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
          Top = 6
          Width = 27
          Height = 13
          Caption = 'Nome'
          FocusControl = EditNome
        end
        object EditNome: TcxDBTextEdit
          Left = 4
          Top = 22
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 296
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmViveiro.cdsCamara_Fria
  end
end
