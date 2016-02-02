inherited frmPessoa: TfrmPessoa
  Caption = 'Pessoas'
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
                Value = 0
              end
              item
                Description = 'C'#243'digo'
                ImageIndex = 0
                Value = 1
              end
              item
                Description = 'Nome'
                Value = 2
              end
              item
                Description = 'Login'
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
              Width = 53
            end
            object viewRegistrosNOME: TcxGridDBColumn [1]
              DataBinding.FieldName = 'NOME'
              Width = 285
            end
            object viewRegistrosLOGIN: TcxGridDBColumn [2]
              DataBinding.FieldName = 'LOGIN'
              Width = 176
            end
            object viewRegistrosCELULAR: TcxGridDBColumn [3]
              DataBinding.FieldName = 'CELULAR'
            end
            object viewRegistrosRG: TcxGridDBColumn [4]
              DataBinding.FieldName = 'RG'
              Visible = False
            end
            object viewRegistrosCPF: TcxGridDBColumn [5]
              DataBinding.FieldName = 'CPF'
              Visible = False
            end
            object viewRegistrosENDERECO: TcxGridDBColumn [6]
              DataBinding.FieldName = 'ENDERECO'
              Visible = False
            end
            object viewRegistrosBAIRRO: TcxGridDBColumn [7]
              DataBinding.FieldName = 'BAIRRO'
              Visible = False
            end
            object viewRegistrosCOMPLEMENTO: TcxGridDBColumn [8]
              DataBinding.FieldName = 'COMPLEMENTO'
              Visible = False
            end
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              inherited cxGrid1: TcxGrid
                inherited viewRegistrosDetail: TcxGridDBTableView
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                  end
                  object viewRegistrosDetailID_PERFIL: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'ID_PERFIL'
                    Width = 216
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmAdministrativo.cdsPessoa
  end
  inherited dsDetail: TDataSource
    DataSet = dmAdministrativo.cdsPessoa_Perfil
  end
end
