inherited frmContaPagar: TfrmContaPagar
  Caption = 'Contas a Pagar'
  ExplicitWidth = 1000
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 567
          Width = 408
          ExplicitLeft = 565
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
          ExplicitWidth = 455
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
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              Caption = 'Parcelas'
              ExplicitLeft = 2
              ExplicitTop = 25
              ExplicitWidth = 965
              ExplicitHeight = 156
              inherited pnBotoesDetail: TPanel
                Visible = False
              end
              inherited cxGridRegistrosDetail: TcxGrid
                inherited viewRegistrosDetail: TcxGridDBTableView
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
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnEditsCadastro: TPanel
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
          Top = 259
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
        object lbl1: TLabel
          Left = 434
          Top = 2
          Width = 36
          Height = 13
          Caption = 'Rubrica'
          FocusControl = cbRubrica
        end
        object Label5: TLabel
          Left = 656
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
        object EditDescricao: TcxDBTextEdit
          Left = 4
          Top = 18
          DataBinding.DataField = 'DESCRICAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 205
        end
        object EditObservacao: TcxDBMemo
          Left = 4
          Top = 275
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 9
          Height = 89
          Width = 965
        end
        object cbContaCorrente: TcxDBLookupComboBox
          Left = 4
          Top = 58
          RepositoryItem = dmLookup.repLcbContaCorrente
          DataBinding.DataField = 'ID_CONTA_CORRENTE'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 4
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
        object cbRubrica: TcxDBLookupComboBox
          Left = 433
          Top = 18
          RepositoryItem = dmLookup.repLcbRubrica
          DataBinding.DataField = 'ID_RUBRICA'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 2
          Width = 220
        end
        object cbPlanoContas: TcxDBLookupComboBox
          Left = 655
          Top = 18
          RepositoryItem = dmLookup.repLcbPlano_Contas
          DataBinding.DataField = 'ID_PLANO_CONTAS'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 3
          Width = 314
        end
        object cbFormaPagamento: TcxDBImageComboBox
          Left = 211
          Top = 58
          RepositoryItem = dmLookup.repIcbFormaPagamento
          DataBinding.DataField = 'FORMA_PAGTO'
          DataBinding.DataSource = dsMaster
          Properties.Items = <>
          TabOrder = 5
          Width = 220
        end
        object EditValorTotal: TcxDBCurrencyEdit
          Left = 433
          Top = 58
          RepositoryItem = dmLookup.repCurPadrao
          DataBinding.DataField = 'VALOR_TOTAL'
          DataBinding.DataSource = dsMaster
          TabOrder = 6
          Width = 220
        end
        object rgParcelas: TcxGroupBox
          Left = 4
          Top = 85
          Caption = 'Parcelas'
          TabOrder = 7
          Height = 172
          Width = 427
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
            TabOrder = 1
            Value = 1
            Width = 76
          end
          object cxGrid1: TcxGrid
            Left = 3
            Top = 59
            Width = 421
            Height = 103
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
                Width = 147
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
            TabOrder = 0
          end
          object EditVencimentoParcela: TcxDateEdit
            Left = 82
            Top = 32
            Properties.SaveTime = False
            Properties.ShowTime = False
            TabOrder = 2
            Width = 122
          end
        end
        object rgVinculos: TcxGroupBox
          Left = 434
          Top = 85
          Caption = 'V'#237'nculos'
          TabOrder = 8
          Height = 172
          Width = 535
          object Label10: TLabel
            Left = 6
            Top = 18
            Width = 35
            Height = 13
            Caption = 'Projeto'
          end
          object Label12: TLabel
            Left = 246
            Top = 18
            Width = 45
            Height = 13
            Caption = 'Atividade'
          end
          object cxGrid2: TcxGrid
            Left = 3
            Top = 59
            Width = 529
            Height = 103
            Align = alBottom
            TabOrder = 4
            TabStop = False
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
                Width = 113
              end
              object viewVinculosNOME: TcxGridDBColumn
                DataBinding.FieldName = 'NOME'
                Width = 298
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
            Left = 173
            Top = 34
            Width = 69
            Height = 21
            Action = Ac_Incluir_Vinculo_Projeto
            Images = dmPrincipal.imgIcons_16
            TabOrder = 1
            TabStop = False
          end
          object btnAddAtividade: TButton
            Left = 458
            Top = 34
            Width = 71
            Height = 21
            Action = Ac_Incluir_Vinculo_Atividade
            Images = dmPrincipal.imgIcons_16
            TabOrder = 3
            TabStop = False
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
          object cbAtividade: TcxLookupComboBox
            Left = 245
            Top = 34
            RepositoryItem = dmLookup.repLcbAtividade
            Properties.ListColumns = <>
            TabOrder = 2
            Width = 207
          end
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnBotoesCadastroDetail: TPanel
        TabOrder = 0
      end
      inherited pnEditsCadastroDetail: TPanel
        TabOrder = 1
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 240
    Top = 344
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
  end
  inherited dsMaster: TDataSource
    DataSet = dmFinanceiro.cdsConta_Pagar
    Left = 248
    Top = 136
  end
  inherited dsDetail: TDataSource
    DataSet = dmFinanceiro.cdsConta_Pagar_Parcela
    Left = 320
    Top = 344
  end
  object cdsLocalVinculo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 448
    Top = 352
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
  end
  object dsVinculos: TDataSource
    DataSet = cdsLocalVinculo
    Left = 512
    Top = 352
  end
end
