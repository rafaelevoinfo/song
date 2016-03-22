inherited frmLoteMuda: TfrmLoteMuda
  Caption = 'Lotes de Mudas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Width = 33
            end
            object viewRegistrosID_ESPECIE: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ID_ESPECIE'
              Visible = False
            end
            object viewRegistrosNOME_ESPECIE: TcxGridDBColumn [2]
              DataBinding.FieldName = 'NOME_ESPECIE'
              Width = 204
            end
            object viewRegistrosID_PESSOA: TcxGridDBColumn [3]
              DataBinding.FieldName = 'ID_PESSOA'
              Visible = False
            end
            object viewRegistrosNOME: TcxGridDBColumn [4]
              DataBinding.FieldName = 'NOME'
              Width = 125
            end
            object viewRegistrosDATA: TcxGridDBColumn [5]
              DataBinding.FieldName = 'DATA'
              Width = 90
            end
            object viewRegistrosQTDE_INICIAL: TcxGridDBColumn [6]
              DataBinding.FieldName = 'QTDE_INICIAL'
              Width = 98
            end
            object viewRegistrosQTDE: TcxGridDBColumn [7]
              DataBinding.FieldName = 'QTDE'
              Width = 85
            end
            object viewRegistrosPESSOA_INCLUIU: TcxGridDBColumn [8]
              DataBinding.FieldName = 'PESSOA_INCLUIU'
              Width = 191
            end
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              Caption = 'Classifica'#231#245'es'
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
    end
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmViveiro.cdsLote_Muda
  end
end
