inherited frmAreaAtuacao: TfrmAreaAtuacao
  ActiveControl = btnIncluir
  Caption = #193'rea de Atua'#231#227'o'
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
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              Caption = #193'reas de Execu'#231#227'o'
              inherited cxGridRegistrosDetail: TcxGrid
                inherited viewRegistrosDetail: TcxGridDBTableView
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewRegistrosDetailNOME: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'NOME'
                    Options.Editing = False
                  end
                end
              end
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      inherited pnEditsCadastro: TPanel
        object Label3: TLabel
          Left = 4
          Top = 6
          Width = 126
          Height = 13
          Caption = 'Nome da '#193'rea de Atua'#231'ao'
          FocusControl = EditAreaAtuacao
        end
        object EditAreaAtuacao: TcxDBTextEdit
          Left = 4
          Top = 22
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 296
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      inherited pnEditsCadastroDetail: TPanel
        object lb1: TLabel
          Left = 4
          Top = 6
          Width = 132
          Height = 13
          Caption = 'Nome da '#193'rea de Execu'#231#227'o'
          FocusControl = EditAreaExecucao
        end
        object EditAreaExecucao: TcxDBTextEdit
          Left = 4
          Top = 22
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsDetail
          TabOrder = 0
          Width = 296
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmAdministrativo.cdsArea_Atuacao
  end
  inherited fdExportDialog: TSaveTextFileDialog
    Left = 504
    Top = 208
  end
  inherited dsDetail: TDataSource
    DataSet = dmAdministrativo.cdsArea_Execucao
  end
end
