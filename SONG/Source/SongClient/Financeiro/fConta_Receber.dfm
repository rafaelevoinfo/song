inherited frmContaReceber: TfrmContaReceber
  ActiveControl = EditDescricao
  Caption = 'Contas a Receber'
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
          ExplicitLeft = 567
          ExplicitWidth = 408
          inherited Label1: TLabel
            Left = 4
            ExplicitLeft = 4
          end
          inherited rgStatus: TcxRadioGroup [1]
            Left = 267
            Top = 27
            TabOrder = 6
            ExplicitLeft = 267
            ExplicitTop = 27
          end
          inherited pnData: TPanel [2]
            Left = 180
            ExplicitLeft = 180
          end
          inherited EditPesquisa: TcxButtonEdit [3]
            Left = 132
            TabOrder = 3
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
                Description = 'Cliente/Financiador'
                Value = 6
              end
              item
                Description = 'Plano de Contas'
                Value = 7
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
          object cbPesquisaClienteFinanciador: TcxLookupComboBox
            Left = 133
            Top = 20
            RepositoryItem = dmLookup.repLcbFinForCli
            Properties.ListColumns = <>
            TabOrder = 4
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
              Width = 43
            end
            object viewRegistrosDESCRICAO: TcxGridDBColumn [1]
              DataBinding.FieldName = 'DESCRICAO'
              Options.Editing = False
              Width = 180
            end
            object viewRegistrosVALOR_TOTAL: TcxGridDBColumn [2]
              DataBinding.FieldName = 'VALOR_TOTAL'
              RepositoryItem = dmLookup.repCurPadrao
              Options.Editing = False
            end
            object viewRegistrosFORMA_PAGTO: TcxGridDBColumn [3]
              DataBinding.FieldName = 'FORMA_PAGTO'
              RepositoryItem = dmLookup.repIcbFormaPagamento
              Options.Editing = False
              Width = 107
            end
            object viewRegistrosNOME_FANTASIA: TcxGridDBColumn [4]
              DataBinding.FieldName = 'NOME_FANTASIA'
              Options.Editing = False
              Width = 150
            end
            object viewRegistrosPLANO_CONTAS: TcxGridDBColumn [5]
              DataBinding.FieldName = 'PLANO_CONTAS'
              Options.Editing = False
              Width = 150
            end
            object viewRegistrosID_PLANO_CONTAS: TcxGridDBColumn [6]
              DataBinding.FieldName = 'ID_PLANO_CONTAS'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_CONTA_CORRENTE: TcxGridDBColumn [7]
              DataBinding.FieldName = 'ID_CONTA_CORRENTE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_CLIENTE_FINANCIADOR: TcxGridDBColumn [8]
              DataBinding.FieldName = 'ID_CLIENTE_FINANCIADOR'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosCONTA_CORRENTE: TcxGridDBColumn [9]
              DataBinding.FieldName = 'CONTA_CORRENTE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosNUMERO_DOCUMENTO: TcxGridDBColumn [10]
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
              ExplicitLeft = 2
              ExplicitTop = 25
              ExplicitWidth = 965
              ExplicitHeight = 156
              inherited pnBotoesDetail: TPanel
                inherited btnIncluirDetail: TButton
                  Visible = False
                end
                inherited btnUtilizarDetailSelecionado: TButton
                  Left = 183
                  TabOrder = 2
                  ExplicitLeft = 183
                end
                object btnBaixarReabrir: TButton
                  Left = 82
                  Top = 1
                  Width = 101
                  Height = 23
                  Action = Ac_Baixar_Reabrir
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
                    RepositoryItem = dmLookup.repIcbStatusContaReceber
                    Options.Editing = False
                    Width = 92
                  end
                  object viewRegistrosDetailDATA_RECEBIMENTO: TcxGridDBColumn [5]
                    DataBinding.FieldName = 'DATA_RECEBIMENTO'
                    RepositoryItem = dmLookup.repDateDataPadrao
                    Options.Editing = False
                    Width = 108
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
          Width = 92
          Height = 13
          Caption = 'Cliente/Financiador'
          FocusControl = cbClienteFinanciador
        end
        object Label5: TLabel
          Left = 433
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
          FocusControl = cbClienteFinanciador
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
          TabOrder = 3
          Width = 205
        end
        object cbClienteFinanciador: TcxDBLookupComboBox
          Left = 211
          Top = 18
          RepositoryItem = dmLookup.repLcbFinForCli
          DataBinding.DataField = 'ID_CLIENTE_FINANCIADOR'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 1
          Width = 220
        end
        object cbPlanoContas: TcxDBLookupComboBox
          Left = 432
          Top = 18
          RepositoryItem = dmLookup.repLcbPlano_Contas
          DataBinding.DataField = 'ID_PLANO_CONTAS'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 2
          Width = 221
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
            TabOrder = 0
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
                Options.Editing = False
                Width = 113
              end
              object viewVinculosNOME: TcxGridDBColumn
                DataBinding.FieldName = 'NOME'
                Options.Editing = False
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
    object Ac_Baixar_Reabrir: TAction
      Category = 'Detail'
      Caption = 'Baixar Parcela'
      ImageIndex = 8
      OnExecute = Ac_Baixar_ReabrirExecute
      OnUpdate = Ac_Baixar_ReabrirUpdate
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmFinanceiro.cdsConta_Receber
    Left = 248
    Top = 136
  end
  inherited dsDetail: TDataSource
    DataSet = dmFinanceiro.cdsConta_Receber_Parcela
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
  end
  object dsVinculos: TDataSource
    DataSet = cdsLocalVinculo
    Left = 496
    Top = 408
  end
end
