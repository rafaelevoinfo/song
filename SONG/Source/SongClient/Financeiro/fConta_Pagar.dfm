inherited frmContaPagar: TfrmContaPagar
  ActiveControl = EditDescricao
  Caption = 'Contas a Pagar'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 567
          Width = 408
          ExplicitLeft = 567
          ExplicitWidth = 408
          inherited Label1: TLabel
            Left = 4
            ExplicitLeft = 4
          end
          inherited rgStatus: TcxRadioGroup [1]
            Left = 267
            Top = 27
            TabOrder = 7
            ExplicitLeft = 267
            ExplicitTop = 27
          end
          inherited pnData: TPanel [2]
            Left = 180
            ExplicitLeft = 180
          end
          inherited EditPesquisa: TcxButtonEdit [3]
            Left = 132
            ExplicitLeft = 132
          end
          inherited cbPesquisarPor: TcxImageComboBox [4]
            Left = 2
            Properties.Items = <
              item
                Description = 'Todos'
                ImageIndex = 0
                Value = 1
              end
              item
                Description = 'C'#243'digo'
                ImageIndex = 0
                Value = 2
              end
              item
                Description = 'Descri'#231#227'o'
                Value = 5
              end
              item
                Description = 'Fornecedor'
                Value = 6
              end
              item
                Description = 'Rubrica'
                Value = 7
              end
              item
                Description = 'Plano de Contas'
                Value = 8
              end
              item
                Description = 'Data de Vencimento'
                Value = 4
              end>
            TabOrder = 2
            ExplicitLeft = 2
          end
          inherited btnPesquisar: TButton [5]
            Left = 308
            TabOrder = 1
            ExplicitLeft = 308
          end
          object cbPesquisaFornecedor: TcxLookupComboBox
            Left = 133
            Top = 20
            RepositoryItem = dmLookup.repLcbFornecedor
            Properties.ListColumns = <>
            TabOrder = 6
            Width = 176
          end
          object cbPesquisaRubrica: TcxLookupComboBox
            Left = 132
            Top = 20
            RepositoryItem = dmLookup.repLcbRubrica
            Properties.ListColumns = <>
            TabOrder = 3
            Width = 176
          end
          object cbPesquisaPlanoConta: TcxLookupComboBox
            Left = 133
            Top = 20
            RepositoryItem = dmLookup.repLcbPlano_Contas
            Properties.ListColumns = <>
            TabOrder = 5
            Width = 176
          end
        end
        inherited pnBotoes: TPanel
          Width = 566
          ExplicitWidth = 566
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Options.Editing = False
              Width = 40
            end
            object viewRegistrosID_FORNECEDOR: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ID_FORNECEDOR'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_RUBRICA: TcxGridDBColumn [2]
              DataBinding.FieldName = 'ID_RUBRICA'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_PLANO_CONTAS: TcxGridDBColumn [3]
              DataBinding.FieldName = 'ID_PLANO_CONTAS'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_CONTA_CORRENTE: TcxGridDBColumn [4]
              DataBinding.FieldName = 'ID_CONTA_CORRENTE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosDESCRICAO: TcxGridDBColumn [5]
              DataBinding.FieldName = 'DESCRICAO'
              Options.Editing = False
              Width = 218
            end
            object viewRegistrosVALOR_TOTAL: TcxGridDBColumn [6]
              DataBinding.FieldName = 'VALOR_TOTAL'
              RepositoryItem = dmLookup.repCurPadrao
              Options.Editing = False
            end
            object viewRegistrosFORMA_PAGTO: TcxGridDBColumn [7]
              DataBinding.FieldName = 'FORMA_PAGTO'
              RepositoryItem = dmLookup.repIcbFormaPagamento
              Options.Editing = False
              Width = 107
            end
            object viewRegistrosFORNECEDOR: TcxGridDBColumn [8]
              DataBinding.FieldName = 'FORNECEDOR'
              Options.Editing = False
              Width = 140
            end
            object viewRegistrosRUBRICA: TcxGridDBColumn [9]
              DataBinding.FieldName = 'RUBRICA'
              Options.Editing = False
              Width = 100
            end
            object viewRegistrosPLANO_CONTAS: TcxGridDBColumn [10]
              DataBinding.FieldName = 'PLANO_CONTAS'
              Options.Editing = False
              Width = 100
            end
            object viewRegistrosCONTA_CORRENTE: TcxGridDBColumn [11]
              DataBinding.FieldName = 'CONTA_CORRENTE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosNUMERO_DOCUMENTO: TcxGridDBColumn [12]
              DataBinding.FieldName = 'NUMERO_DOCUMENTO'
              Visible = False
              Options.Editing = False
            end
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              Caption = 'Parcelas'
              inherited pnBotoesDetail: TPanel
                inherited btnIncluirDetail: TButton
                  Visible = False
                end
                inherited btnUtilizarDetailSelecionado: TButton
                  Left = 183
                  TabOrder = 2
                  ExplicitLeft = 183
                end
                object btnQuitarReabrir: TButton
                  Left = 82
                  Top = 1
                  Width = 101
                  Height = 23
                  Action = Ac_Quitar_Reabrir
                  Align = alLeft
                  Images = dmPrincipal.imgIcons_16
                  TabOrder = 1
                end
              end
              inherited cxGridRegistrosDetail: TcxGrid
                inherited viewRegistrosDetail: TcxGridDBTableView
                  OnCustomDrawCell = viewRegistrosDetailCustomDrawCell
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewRegistrosDetailPARCELA: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'PARCELA'
                    Options.Editing = False
                  end
                  object viewRegistrosDetailVENCIMENTO: TcxGridDBColumn [2]
                    DataBinding.FieldName = 'VENCIMENTO'
                    Options.Editing = False
                    Width = 90
                  end
                  object viewRegistrosDetailVALOR: TcxGridDBColumn [3]
                    DataBinding.FieldName = 'VALOR'
                    RepositoryItem = dmLookup.repCurPadrao
                    Options.Editing = False
                  end
                  object viewRegistrosDetailSTATUS: TcxGridDBColumn [4]
                    DataBinding.FieldName = 'STATUS'
                    RepositoryItem = dmLookup.repIcbStatusContaPagar
                    Options.Editing = False
                    Width = 92
                  end
                  object viewRegistrosDetailDATA_PAGAMENTO: TcxGridDBColumn [5]
                    DataBinding.FieldName = 'DATA_PAGAMENTO'
                    RepositoryItem = dmLookup.repDateDataPadrao
                    Options.Editing = False
                    Width = 110
                  end
                  inherited ColumnAlterarDetail: TcxGridDBColumn
                    Visible = False
                    VisibleForCustomization = False
                  end
                  inherited ColumnExcluirDetail: TcxGridDBColumn
                    Visible = False
                    VisibleForCustomization = False
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
        ExplicitTop = 47
        object Label3: TLabel
          Left = 5
          Top = 2
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = EditDescricao
        end
        object Label7: TLabel
          Left = 5
          Top = 323
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
          FocusControl = EditObservacao
        end
        object Label17: TLabel
          Left = 6
          Top = 42
          Width = 75
          Height = 13
          Caption = 'Conta Corrente'
          FocusControl = cbContaCorrente
        end
        object Label4: TLabel
          Left = 213
          Top = 2
          Width = 55
          Height = 13
          Caption = 'Fornecedor'
          FocusControl = cbFornecedor
        end
        object Label5: TLabel
          Left = 657
          Top = 2
          Width = 78
          Height = 13
          Caption = 'Plano de Contas'
          FocusControl = cbPlanoContas
        end
        object Label8: TLabel
          Left = 435
          Top = 42
          Width = 51
          Height = 13
          Caption = 'Valor Total'
          FocusControl = EditValorTotal
        end
        object Label6: TLabel
          Left = 213
          Top = 42
          Width = 102
          Height = 13
          Caption = 'Forma de Pagamento'
          FocusControl = cbFornecedor
        end
        object Label13: TLabel
          Left = 657
          Top = 42
          Width = 93
          Height = 13
          Caption = 'Nro. do Documento'
          FocusControl = EditNroDocumento
        end
        object EditDescricao: TcxDBTextEdit
          Left = 4
          Top = 18
          DataBinding.DataField = 'DESCRICAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 205
        end
        object EditObservacao: TcxDBMemo
          Left = 5
          Top = 339
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 9
          Height = 54
          Width = 965
        end
        object cbContaCorrente: TcxDBLookupComboBox
          Left = 4
          Top = 58
          RepositoryItem = dmLookup.repLcbContaCorrente
          DataBinding.DataField = 'ID_CONTA_CORRENTE'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 3
          Width = 205
        end
        object cbFornecedor: TcxDBLookupComboBox
          Left = 211
          Top = 18
          RepositoryItem = dmLookup.repLcbFornecedor
          DataBinding.DataField = 'ID_FORNECEDOR'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 1
          Width = 220
        end
        object cbPlanoContas: TcxDBLookupComboBox
          Left = 655
          Top = 18
          RepositoryItem = dmLookup.repLcbPlano_Contas
          DataBinding.DataField = 'ID_PLANO_CONTAS'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 2
          Width = 314
        end
        object cbFormaPagamento: TcxDBImageComboBox
          Left = 211
          Top = 58
          RepositoryItem = dmLookup.repIcbFormaPagamento
          DataBinding.DataField = 'FORMA_PAGTO'
          DataBinding.DataSource = dsMaster
          Properties.Items = <>
          TabOrder = 4
          Width = 220
        end
        object EditValorTotal: TcxDBCurrencyEdit
          Left = 433
          Top = 58
          RepositoryItem = dmLookup.repCurPadrao
          DataBinding.DataField = 'VALOR_TOTAL'
          DataBinding.DataSource = dsMaster
          TabOrder = 5
          Width = 220
        end
        object rgParcelas: TcxGroupBox
          Left = 4
          Top = 85
          Caption = 'Parcelas'
          TabOrder = 7
          Height = 232
          Width = 341
          object Label9: TLabel
            Left = 4
            Top = 16
            Width = 71
            Height = 13
            Caption = 'Qtde. Parcelas'
          end
          object Label11: TLabel
            Left = 82
            Top = 16
            Width = 122
            Height = 13
            Caption = 'Vencimento da 1'#170' Parcela'
          end
          object EditQtdeParcelas: TcxSpinEdit
            Left = 3
            Top = 32
            Properties.MinValue = 1.000000000000000000
            TabOrder = 0
            Value = 1
            Width = 76
          end
          object cxGrid1: TcxGrid
            Left = 3
            Top = 59
            Width = 335
            Height = 163
            Align = alBottom
            TabOrder = 3
            TabStop = False
            object viewParcelas: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.DataSource = dsDetail
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Inserting = False
              OptionsView.GroupByBox = False
              object viewParcelasID: TcxGridDBColumn
                DataBinding.FieldName = 'ID'
                Visible = False
                VisibleForCustomization = False
              end
              object viewParcelasID_CONTA_PAGAR: TcxGridDBColumn
                DataBinding.FieldName = 'ID_CONTA_PAGAR'
                Visible = False
                VisibleForCustomization = False
              end
              object viewParcelasPARCELA: TcxGridDBColumn
                DataBinding.FieldName = 'PARCELA'
                Options.Editing = False
                Width = 56
              end
              object viewParcelasVENCIMENTO: TcxGridDBColumn
                DataBinding.FieldName = 'VENCIMENTO'
                Width = 147
              end
              object viewParcelasVALOR: TcxGridDBColumn
                DataBinding.FieldName = 'VALOR'
                RepositoryItem = dmLookup.repCurPadrao
                Width = 126
              end
            end
            object levelGrid1Level1: TcxGridLevel
              GridView = viewParcelas
            end
          end
          object btnIncluirParcelas: TButton
            Left = 210
            Top = 16
            Width = 119
            Height = 37
            Action = Ac_Gerar_Parcelas
            Images = dmPrincipal.imgIcons_32
            TabOrder = 2
          end
          object EditVencimentoParcela: TcxDateEdit
            Left = 82
            Top = 32
            Properties.SaveTime = False
            Properties.ShowTime = False
            TabOrder = 1
            Width = 122
          end
        end
        object rgVinculos: TcxGroupBox
          Left = 351
          Top = 85
          Caption = 'V'#237'nculos'
          TabOrder = 8
          Height = 232
          Width = 618
          object Label10: TLabel
            Left = 6
            Top = 18
            Width = 35
            Height = 13
            Caption = 'Projeto'
          end
          object Label12: TLabel
            Left = 6
            Top = 60
            Width = 45
            Height = 13
            Caption = 'Atividade'
          end
          object lbl1: TLabel
            Left = 182
            Top = 18
            Width = 89
            Height = 13
            Caption = 'Rubrica do Projeto'
            FocusControl = cbRubricaProjeto
          end
          object Label14: TLabel
            Left = 182
            Top = 60
            Width = 99
            Height = 13
            Caption = 'Rubrica da Atividade'
            FocusControl = cbRubricaAtividade
          end
          object cbProjeto: TcxLookupComboBox
            Left = 3
            Top = 34
            RepositoryItem = dmLookup.repLcbProjeto
            Properties.ListColumns = <>
            Properties.OnEditValueChanged = cbProjetoPropertiesEditValueChanged
            TabOrder = 0
            Width = 170
          end
          object cxGrid2: TcxGrid
            Left = 3
            Top = 106
            Width = 612
            Height = 116
            Align = alBottom
            TabOrder = 4
            TabStop = False
            ExplicitTop = 103
            object viewVinculos: TcxGridDBTableView
              Navigator.Buttons.CustomButtons = <>
              DataController.DataSource = dsVinculos
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Inserting = False
              OptionsView.GroupByBox = False
              object viewVinculosID: TcxGridDBColumn
                DataBinding.FieldName = 'ID'
                Visible = False
                VisibleForCustomization = False
              end
              object viewVinculosTIPO: TcxGridDBColumn
                DataBinding.FieldName = 'TIPO'
                PropertiesClassName = 'TcxImageComboBoxProperties'
                Properties.Items = <
                  item
                    Description = 'Projeto'
                    ImageIndex = 0
                    Value = 1
                  end
                  item
                    Description = 'Atividade'
                    Value = 2
                  end>
                Options.Editing = False
                Width = 113
              end
              object viewVinculosNOME: TcxGridDBColumn
                DataBinding.FieldName = 'NOME'
                Options.Editing = False
                Width = 184
              end
              object viewVinculosRUBRICA: TcxGridDBColumn
                DataBinding.FieldName = 'RUBRICA'
                Width = 235
              end
              object ColumnDeletarVinculo: TcxGridDBColumn
                Caption = 'Excluir'
                PropertiesClassName = 'TcxButtonEditProperties'
                Properties.Buttons = <
                  item
                    Action = Ac_Excluir_Vinculo
                    Default = True
                    Kind = bkGlyph
                  end>
                Properties.Images = dmPrincipal.imgIcons_16
                Properties.ViewStyle = vsButtonsOnly
                Options.ShowEditButtons = isebAlways
              end
            end
            object level1: TcxGridLevel
              GridView = viewVinculos
            end
          end
          object btnAddProjeto: TButton
            Left = 349
            Top = 34
            Width = 69
            Height = 21
            Action = Ac_Incluir_Vinculo_Projeto
            Images = dmPrincipal.imgIcons_16
            TabOrder = 1
            TabStop = False
          end
          object btnAddAtividade: TButton
            Left = 349
            Top = 76
            Width = 69
            Height = 21
            Action = Ac_Incluir_Vinculo_Atividade
            Images = dmPrincipal.imgIcons_16
            TabOrder = 3
            TabStop = False
          end
          object cbAtividade: TcxLookupComboBox
            Left = 3
            Top = 76
            RepositoryItem = dmLookup.repLcbAtividade
            Properties.ListColumns = <>
            TabOrder = 2
            Width = 170
          end
          object cbRubricaProjeto: TcxDBLookupComboBox
            Left = 179
            Top = 34
            RepositoryItem = dmLookup.repLcbRubrica
            DataBinding.DataField = 'ID_RUBRICA'
            DataBinding.DataSource = dsMaster
            Properties.ListColumns = <>
            TabOrder = 5
            Width = 170
          end
          object cbRubricaAtividade: TcxDBLookupComboBox
            Left = 179
            Top = 76
            RepositoryItem = dmLookup.repLcbRubrica
            DataBinding.DataField = 'ID_RUBRICA'
            DataBinding.DataSource = dsMaster
            Properties.ListColumns = <>
            TabOrder = 6
            Width = 170
          end
        end
        object EditNroDocumento: TcxDBTextEdit
          Left = 655
          Top = 58
          DataBinding.DataField = 'NUMERO_DOCUMENTO'
          DataBinding.DataSource = dsMaster
          TabOrder = 6
          Width = 170
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      inherited pnBotoesCadastroDetail: TPanel
        TabOrder = 0
      end
      inherited pnEditsCadastroDetail: TPanel
        TabOrder = 1
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 216
    Top = 392
    object Ac_Gerar_Parcelas: TAction
      Category = 'Detail'
      Caption = 'Gerar Parcelas'
      ImageIndex = 3
      OnExecute = Ac_Gerar_ParcelasExecute
    end
    object Ac_Incluir_Vinculo_Projeto: TAction
      Category = 'Detail'
      Caption = 'Adicionar'
      ImageIndex = 3
      OnExecute = Ac_Incluir_Vinculo_ProjetoExecute
    end
    object Ac_Incluir_Vinculo_Atividade: TAction
      Category = 'Detail'
      Caption = 'Adicionar'
      ImageIndex = 3
      OnExecute = Ac_Incluir_Vinculo_AtividadeExecute
    end
    object Ac_Excluir_Vinculo: TAction
      Category = 'Detail'
      ImageIndex = 2
      OnExecute = Ac_Excluir_VinculoExecute
    end
    object Ac_Quitar_Reabrir: TAction
      Category = 'Detail'
      Caption = 'Quitar Parcela'
      ImageIndex = 8
      OnExecute = Ac_Quitar_ReabrirExecute
      OnUpdate = Ac_Quitar_ReabrirUpdate
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmFinanceiro.cdsConta_Pagar
    Left = 248
    Top = 136
  end
  inherited dsDetail: TDataSource
    DataSet = dmFinanceiro.cdsConta_Pagar_Parcela
    Left = 288
    Top = 408
  end
  object cdsLocalVinculo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 400
    Top = 400
    object cdsLocalVinculoID: TIntegerField
      FieldName = 'ID'
    end
    object cdsLocalVinculoTIPO: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo de V'#237'nculo'
      FieldName = 'TIPO'
    end
    object cdsLocalVinculoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 100
    end
    object cdsLocalVinculoID_RUBRICA: TIntegerField
      FieldName = 'ID_RUBRICA'
    end
    object cdsLocalVinculoRUBRICA: TStringField
      DisplayLabel = 'Rubrica'
      FieldName = 'RUBRICA'
      Size = 100
    end
  end
  object dsVinculos: TDataSource
    DataSet = cdsLocalVinculo
    Left = 496
    Top = 408
  end
end
