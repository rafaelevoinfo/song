inherited frmSolicitacaoCompra: TfrmSolicitacaoCompra
  ActiveControl = nil
  Caption = 'Solicita'#231#227'o de Compras'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabPesquisa
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 462
          Width = 513
          ExplicitLeft = 462
          ExplicitWidth = 513
          inherited Label1: TLabel
            Left = 133
            ExplicitLeft = 133
          end
          object Label3: TLabel [1]
            Left = 2
            Top = 4
            Width = 35
            Height = 13
            Caption = 'Status:'
          end
          inherited pnData: TPanel
            Left = 285
            ExplicitLeft = 285
          end
          inherited EditPesquisa: TcxButtonEdit
            Left = 264
            ExplicitLeft = 264
            ExplicitWidth = 150
            Width = 150
          end
          inherited cbPesquisarPor: TcxImageComboBox
            Left = 133
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
                Description = 'Data da Solicita'#231#227'o'
                Value = 4
              end
              item
                Description = 'Item'
                Value = 5
              end
              item
                Description = 'Solicitante'
                Value = 6
              end
              item
                Description = 'Respons'#225'vel Pela An'#225'lise'
                Value = 7
              end>
            ExplicitLeft = 133
          end
          inherited btnPesquisar: TButton
            Left = 413
            ExplicitLeft = 413
          end
          inherited rgStatus: TcxRadioGroup
            Left = 12
            Top = 33
            ExplicitLeft = 12
            ExplicitTop = 33
          end
          object cbStatusPesquisa: TcxCheckComboBox
            Left = 2
            Top = 20
            Properties.EmptySelectionText = 'Todos'
            Properties.DropDownSizeable = True
            Properties.EditValueFormat = cvfIndices
            Properties.Items = <
              item
                Description = 'Solicitada'
              end
              item
                Description = 'Aprovada'
                Tag = 1
              end
              item
                Description = 'Negada'
                Tag = 2
              end>
            TabOrder = 5
            Width = 130
          end
          object cbPessoa: TcxLookupComboBox
            Left = 266
            Top = 20
            RepositoryItem = dmLookup.repLcbPessoa
            Properties.ListColumns = <>
            TabOrder = 6
            Visible = False
            Width = 148
          end
          object cbItemPesquisa: TcxLookupComboBox
            Left = 266
            Top = 20
            RepositoryItem = dmLookup.repLcbItem
            Properties.ListColumns = <>
            TabOrder = 7
            Visible = False
            Width = 148
          end
        end
        inherited pnBotoes: TPanel
          Width = 461
          ExplicitWidth = 461
          inherited btnUtilizar: TButton
            Left = 353
            ExplicitLeft = 353
          end
          object btnAprovar: TButton
            AlignWithMargins = True
            Left = 86
            Top = 1
            Width = 83
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 2
            Margins.Bottom = 1
            Action = Ac_Aprovar
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 2
            WordWrap = True
          end
          object btnNegar: TButton
            AlignWithMargins = True
            Left = 171
            Top = 1
            Width = 78
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 2
            Margins.Bottom = 1
            Action = Ac_Negar
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 3
            WordWrap = True
          end
          object btnGerarCompras: TButton
            AlignWithMargins = True
            Left = 251
            Top = 1
            Width = 100
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 2
            Margins.Bottom = 1
            Action = Ac_Gerar_Compras
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 4
            WordWrap = True
          end
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            OnCustomDrawCell = viewRegistrosCustomDrawCell
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Options.Editing = False
              Width = 39
            end
            object viewRegistrosID_PESSOA_SOLICITOU: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ID_PESSOA_SOLICITOU'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_PESSOA_ANALISOU: TcxGridDBColumn [2]
              DataBinding.FieldName = 'ID_PESSOA_ANALISOU'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_COMPRA: TcxGridDBColumn [3]
              DataBinding.FieldName = 'ID_COMPRA'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosDATA: TcxGridDBColumn [4]
              DataBinding.FieldName = 'DATA'
              Options.Editing = False
              Width = 102
            end
            object viewRegistrosSOLICITANTE: TcxGridDBColumn [5]
              DataBinding.FieldName = 'SOLICITANTE'
              Options.Editing = False
              Width = 154
            end
            object viewRegistrosSTATUS: TcxGridDBColumn [6]
              DataBinding.FieldName = 'STATUS'
              RepositoryItem = dmLookup.repIcbStatusSolicitacaoCompra
              Options.Editing = False
              Width = 119
            end
            object viewRegistrosRESPONSAVEL_ANALISE: TcxGridDBColumn [7]
              DataBinding.FieldName = 'RESPONSAVEL_ANALISE'
              Options.Editing = False
              Width = 154
            end
            object viewRegistrosDATA_ANALISE: TcxGridDBColumn [8]
              DataBinding.FieldName = 'DATA_ANALISE'
              Visible = False
              Options.Editing = False
              Width = 80
            end
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              Caption = 'Itens'
              inherited cxGridRegistrosDetail: TcxGrid
                inherited viewRegistrosDetail: TcxGridDBTableView
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                    Width = 35
                  end
                  object viewRegistrosDetailID_ITEM: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'ID_ITEM'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailID_ESPECIE: TcxGridDBColumn [2]
                    DataBinding.FieldName = 'ID_ESPECIE'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailNOME_ITEM: TcxGridDBColumn [3]
                    DataBinding.FieldName = 'NOME_ITEM'
                    Options.Editing = False
                    Width = 477
                  end
                  object viewRegistrosDetailESPECIE: TcxGridDBColumn [4]
                    DataBinding.FieldName = 'ESPECIE'
                    Visible = False
                    Options.Editing = False
                    Width = 185
                  end
                  object viewRegistrosDetailQTDE: TcxGridDBColumn [5]
                    DataBinding.FieldName = 'QTDE'
                    RepositoryItem = dmLookup.repCalcPadrao
                    Options.Editing = False
                    Width = 81
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
        object Label4: TLabel
          Left = 7
          Top = 8
          Width = 49
          Height = 13
          Caption = 'Solicitante'
          FocusControl = cbSolicitante
        end
        object Label5: TLabel
          Left = 219
          Top = 8
          Width = 91
          Height = 13
          Caption = 'Data da Solicita'#231#227'o'
          FocusControl = EditDataSolicitacao
        end
        object Label6: TLabel
          Left = 7
          Top = 51
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
          FocusControl = EditObservacao
        end
        object Label8: TLabel
          Left = 346
          Top = 8
          Width = 31
          Height = 13
          Caption = 'Status'
          FocusControl = cbStatus
        end
        object cbSolicitante: TcxDBLookupComboBox
          Left = 4
          Top = 24
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_PESSOA_SOLICITOU'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 209
        end
        object EditDataSolicitacao: TcxDBDateEdit
          Left = 217
          Top = 24
          DataBinding.DataField = 'DATA'
          DataBinding.DataSource = dsMaster
          TabOrder = 1
          Width = 121
        end
        object EditObservacao: TcxDBMemo
          Left = 5
          Top = 67
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 3
          Height = 62
          Width = 572
        end
        object cbStatus: TcxDBImageComboBox
          Left = 344
          Top = 24
          RepositoryItem = dmLookup.repIcbStatusSolicitacaoCompra
          DataBinding.DataField = 'STATUS'
          DataBinding.DataSource = dsMaster
          Properties.Items = <>
          TabOrder = 2
          Width = 233
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      inherited pnEditsCadastroDetail: TPanel
        object lbl1: TLabel
          Left = 7
          Top = 8
          Width = 22
          Height = 13
          Caption = 'Item'
          FocusControl = cbItem
        end
        object lbl2: TLabel
          Left = 222
          Top = 8
          Width = 36
          Height = 13
          Caption = 'Esp'#233'cie'
          FocusControl = cbEspecie
        end
        object Label7: TLabel
          Left = 434
          Top = 8
          Width = 56
          Height = 13
          Caption = 'Quantidade'
          FocusControl = EditQtde
        end
        object lbUnidade: TLabel
          Left = 555
          Top = 31
          Width = 19
          Height = 13
          Caption = 'Und'
        end
        object cbItem: TcxDBLookupComboBox
          Left = 4
          Top = 24
          RepositoryItem = dmLookup.repLcbItem
          DataBinding.DataField = 'ID_ITEM'
          DataBinding.DataSource = dsDetail
          Properties.ListColumns = <>
          Properties.OnEditValueChanged = cbItemPropertiesEditValueChanged
          TabOrder = 0
          Width = 209
        end
        object cbEspecie: TcxDBLookupComboBox
          Left = 219
          Top = 24
          RepositoryItem = dmLookup.repLcbEspecie
          DataBinding.DataField = 'ID_ESPECIE'
          DataBinding.DataSource = dsDetail
          Enabled = False
          Properties.ListColumns = <>
          TabOrder = 1
          Width = 209
        end
        object EditQtde: TcxDBCalcEdit
          Left = 432
          Top = 24
          RepositoryItem = dmLookup.repCalcPadrao
          DataBinding.DataField = 'QTDE'
          DataBinding.DataSource = dsDetail
          TabOrder = 2
          Width = 121
        end
      end
    end
  end
  inherited ActionList1: TActionList
    object Ac_Aprovar: TAction
      Category = 'Master'
      Caption = 'Aprovar'
      ImageIndex = 6
      OnExecute = Ac_AprovarExecute
      OnUpdate = Ac_AprovarUpdate
    end
    object Ac_Negar: TAction
      Category = 'Master'
      Caption = 'Negar'
      ImageIndex = 5
      OnExecute = Ac_NegarExecute
      OnUpdate = Ac_NegarUpdate
    end
    object Ac_Gerar_Compras: TAction
      Category = 'Master'
      Caption = 'Gerar Compra'
      ImageIndex = 12
      OnExecute = Ac_Gerar_ComprasExecute
      OnUpdate = Ac_Gerar_ComprasUpdate
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmEstoque.cdsSolicitacao_Compra
  end
  inherited dsDetail: TDataSource
    DataSet = dmEstoque.cdsSolicitacao_Compra_Item
  end
end
