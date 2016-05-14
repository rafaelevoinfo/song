inherited frmContaPagar: TfrmContaPagar
  ActiveControl = nil
  Caption = 'Contas a Pagar'
  ClientHeight = 491
  ClientWidth = 994
  OnDestroy = FormDestroy
  ExplicitWidth = 1010
  ExplicitHeight = 530
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Width = 994
    Height = 491
    Properties.ActivePage = tabCadastro
    ExplicitWidth = 994
    ExplicitHeight = 491
    ClientRectBottom = 487
    ClientRectRight = 990
    inherited tabPesquisa: TcxTabSheet
      ExplicitWidth = 986
      ExplicitHeight = 463
      inherited pnPesquisa: TPanel
        Width = 986
        ExplicitWidth = 986
        inherited pnEditsPesquisa: TPanel
          Left = 577
          Width = 408
          ExplicitLeft = 577
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
            ExplicitHeight = 21
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
                Description = 'Plano de Contas'
                Value = 7
              end
              item
                Description = 'Data de Vencimento'
                Value = 4
              end
              item
                Description = 'Projeto de Origem do Recurso'
                Value = 8
              end
              item
                Description = 'Projeto Alocado'
                Value = 9
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
            TabOrder = 5
            Width = 176
          end
          object cbPesquisaPlanoConta: TcxLookupComboBox
            Left = 133
            Top = 20
            RepositoryItem = dmLookup.repLcbPlano_Contas
            Properties.ListColumns = <>
            TabOrder = 4
            Width = 176
          end
          object cbPesquisaProjeto: TcxLookupComboBox
            Left = 133
            Top = 20
            RepositoryItem = dmLookup.repLcbProjeto
            Properties.ListColumns = <>
            Properties.OnEditValueChanged = cbProjetoOrigemPropertiesEditValueChanged
            TabOrder = 7
            Visible = False
            Width = 176
          end
        end
        inherited pnBotoes: TPanel
          Width = 576
          ExplicitWidth = 576
        end
      end
      inherited pnGrid: TPanel
        Width = 986
        Height = 419
        ExplicitWidth = 986
        ExplicitHeight = 419
        inherited cxGridRegistros: TcxGrid
          Width = 984
          Height = 223
          ExplicitWidth = 984
          ExplicitHeight = 223
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
            object viewRegistrosPLANO_CONTAS: TcxGridDBColumn [9]
              DataBinding.FieldName = 'PLANO_CONTAS'
              Options.Editing = False
              Width = 100
            end
            object viewRegistrosCONTA_CORRENTE: TcxGridDBColumn [10]
              DataBinding.FieldName = 'CONTA_CORRENTE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosNUMERO_DOCUMENTO: TcxGridDBColumn [11]
              DataBinding.FieldName = 'NUMERO_DOCUMENTO'
              Visible = False
              Options.Editing = False
            end
          end
        end
        inherited cxSplitter1: TcxSplitter
          Top = 224
          Width = 984
          ExplicitTop = 224
          ExplicitWidth = 984
        end
        inherited pnDetail: TPanel
          Top = 230
          Width = 984
          ExplicitTop = 230
          ExplicitWidth = 984
          inherited pcDetails: TcxPageControl
            Width = 982
            Properties.ActivePage = tabVinculoPesquisa
            ExplicitWidth = 982
            ClientRectRight = 978
            inherited tabDetail: TcxTabSheet
              Caption = 'Parcelas'
              ExplicitWidth = 975
              inherited pnBotoesDetail: TPanel
                Width = 975
                ExplicitWidth = 975
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
                Width = 975
                ExplicitWidth = 975
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
            object tabVinculoPesquisa: TcxTabSheet
              Caption = 'V'#237'nculos'
              ImageIndex = 1
              ExplicitLeft = 0
              ExplicitTop = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object cxGrid3: TcxGrid
                Left = 0
                Top = 0
                Width = 975
                Height = 156
                Align = alClient
                TabOrder = 0
                TabStop = False
                object cxGridDBTableView1: TcxGridDBTableView
                  Navigator.Buttons.CustomButtons = <>
                  DataController.DataSource = dsVinculo
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsCustomize.ColumnsQuickCustomization = True
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsView.GroupByBox = False
                  object cxGridDBTableView1ID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Visible = False
                  end
                  object cxGridDBTableView1ID_CONTA_PAGAR: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_CONTA_PAGAR'
                    Visible = False
                  end
                  object cxGridDBTableView1ID_FUNDO: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_FUNDO'
                    Visible = False
                  end
                  object cxGridDBTableView1NOME_FUNDO: TcxGridDBColumn
                    DataBinding.FieldName = 'NOME_FUNDO'
                    Width = 81
                  end
                  object cxGridDBTableView1ID_PROJETO_ORIGEM: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_PROJETO_ORIGEM'
                    Visible = False
                  end
                  object cxGridDBTableView1PROJETO_ORIGEM: TcxGridDBColumn
                    DataBinding.FieldName = 'PROJETO_ORIGEM'
                    Width = 149
                  end
                  object cxGridDBTableView1ID_ATIVIDADE_ORIGEM: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_ATIVIDADE_ORIGEM'
                    Visible = False
                  end
                  object cxGridDBTableView1ATIVIDADE_ORIGEM: TcxGridDBColumn
                    DataBinding.FieldName = 'ATIVIDADE_ORIGEM'
                    Width = 171
                  end
                  object cxGridDBTableView1ID_RUBRICA_ORIGEM: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_RUBRICA_ORIGEM'
                    Visible = False
                  end
                  object cxGridDBTableView1RUBRICA_ORIGEM: TcxGridDBColumn
                    DataBinding.FieldName = 'RUBRICA_ORIGEM'
                    Width = 150
                  end
                  object cxGridDBTableView1ID_AREA_ATUACAO_ORIGEM: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_AREA_ATUACAO_ORIGEM'
                    Visible = False
                  end
                  object cxGridDBTableView1AREA_ATUACAO_ORIGEM: TcxGridDBColumn
                    DataBinding.FieldName = 'AREA_ATUACAO_ORIGEM'
                    Width = 195
                  end
                  object cxGridDBTableView1ID_PROJETO_ALOCADO: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_PROJETO_ALOCADO'
                    Visible = False
                  end
                  object cxGridDBTableView1PROJETO_ALOCADO: TcxGridDBColumn
                    DataBinding.FieldName = 'PROJETO_ALOCADO'
                    Width = 81
                  end
                  object cxGridDBTableView1ID_ATIVIDADE_ALOCADO: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_ATIVIDADE_ALOCADO'
                    Visible = False
                  end
                  object cxGridDBTableView1ATIVIDADE_ALOCADA: TcxGridDBColumn
                    DataBinding.FieldName = 'ATIVIDADE_ALOCADA'
                    Width = 103
                  end
                  object cxGridDBTableView1ID_RUBRICA_ALOCADO: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_RUBRICA_ALOCADO'
                    Visible = False
                  end
                  object cxGridDBTableView1RUBRICA_ALOCADA: TcxGridDBColumn
                    DataBinding.FieldName = 'RUBRICA_ALOCADA'
                    Width = 82
                  end
                  object cxGridDBTableView1ID_AREA_ATUACAO_ALOCADO: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_AREA_ATUACAO_ALOCADO'
                    Visible = False
                  end
                  object cxGridDBTableView1AREA_ATUACAO_ALOCADA: TcxGridDBColumn
                    DataBinding.FieldName = 'AREA_ATUACAO_ALOCADA'
                    Width = 139
                  end
                  object cxGridDBTableView1VALOR: TcxGridDBColumn
                    DataBinding.FieldName = 'VALOR'
                    RepositoryItem = dmLookup.repCurPadrao
                  end
                end
                object cxGridLevel2: TcxGridLevel
                  GridView = cxGridDBTableView1
                end
              end
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      ExplicitWidth = 986
      ExplicitHeight = 463
      inherited pnBotoesCadastro: TPanel
        Width = 986
        ExplicitWidth = 986
      end
      inherited pnEditsCadastro: TPanel
        Width = 986
        Height = 413
        ExplicitWidth = 986
        ExplicitHeight = 413
        object pcEditsCadastro: TcxPageControl
          Left = 1
          Top = 1
          Width = 984
          Height = 411
          Align = alClient
          TabOrder = 0
          TabStop = False
          Properties.ActivePage = tabVinculo
          Properties.CustomButtons.Buttons = <>
          ClientRectBottom = 407
          ClientRectLeft = 4
          ClientRectRight = 980
          ClientRectTop = 24
          object tabInfoGeral: TcxTabSheet
            Caption = 'Informa'#231#245'es Gerais'
            ImageIndex = 0
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Label3: TLabel
              Left = 5
              Top = 2
              Width = 46
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = EditDescricao
            end
            object Label8: TLabel
              Left = 7
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
            object Label4: TLabel
              Left = 213
              Top = 2
              Width = 55
              Height = 13
              Caption = 'Fornecedor'
              FocusControl = cbFornecedor
            end
            object Label17: TLabel
              Left = 657
              Top = 2
              Width = 75
              Height = 13
              Caption = 'Conta Corrente'
              FocusControl = cbContaCorrente
            end
            object Label5: TLabel
              Left = 435
              Top = 2
              Width = 78
              Height = 13
              Caption = 'Plano de Contas'
              FocusControl = cbPlanoContas
            end
            object Label13: TLabel
              Left = 435
              Top = 42
              Width = 93
              Height = 13
              Caption = 'Nro. do Documento'
              FocusControl = EditNroDocumento
            end
            object Label7: TLabel
              Left = 6
              Top = 308
              Width = 58
              Height = 13
              Caption = 'Observa'#231#227'o'
              FocusControl = EditObservacao
            end
            object EditDescricao: TcxDBTextEdit
              Left = 4
              Top = 18
              DataBinding.DataField = 'DESCRICAO'
              DataBinding.DataSource = dsMaster
              TabOrder = 0
              Width = 205
            end
            object EditValorTotal: TcxDBCurrencyEdit
              Left = 5
              Top = 58
              RepositoryItem = dmLookup.repCurPadrao
              DataBinding.DataField = 'VALOR_TOTAL'
              DataBinding.DataSource = dsMaster
              TabOrder = 4
              Width = 204
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
            object cbContaCorrente: TcxDBLookupComboBox
              Left = 655
              Top = 18
              RepositoryItem = dmLookup.repLcbContaCorrente
              DataBinding.DataField = 'ID_CONTA_CORRENTE'
              DataBinding.DataSource = dsMaster
              Properties.ListColumns = <>
              TabOrder = 3
              Width = 205
            end
            object cbPlanoContas: TcxDBLookupComboBox
              Left = 433
              Top = 18
              RepositoryItem = dmLookup.repLcbPlano_Contas
              DataBinding.DataField = 'ID_PLANO_CONTAS'
              DataBinding.DataSource = dsMaster
              Properties.ListColumns = <>
              TabOrder = 2
              Width = 220
            end
            object EditNroDocumento: TcxDBTextEdit
              Left = 433
              Top = 58
              DataBinding.DataField = 'NUMERO_DOCUMENTO'
              DataBinding.DataSource = dsMaster
              TabOrder = 6
              Width = 220
            end
            object rgParcelas: TcxGroupBox
              Left = 3
              Top = 85
              Caption = 'Parcelas'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.TextColor = clRed
              Style.TextStyle = []
              Style.IsFontAssigned = True
              TabOrder = 7
              Height = 220
              Width = 857
              object cxGrid1: TcxGrid
                Left = 2
                Top = 59
                Width = 853
                Height = 159
                Align = alClient
                TabOrder = 0
                TabStop = False
                ExplicitLeft = 3
                ExplicitTop = 56
                ExplicitWidth = 851
                ExplicitHeight = 154
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
              object pnParcelas: TPanel
                Left = 2
                Top = 18
                Width = 853
                Height = 41
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                ExplicitLeft = 3
                ExplicitTop = 15
                ExplicitWidth = 851
                object Label9: TLabel
                  Left = 4
                  Top = 0
                  Width = 71
                  Height = 13
                  Caption = 'Qtde. Parcelas'
                end
                object Label11: TLabel
                  Left = 82
                  Top = 0
                  Width = 122
                  Height = 13
                  Caption = 'Vencimento da 1'#170' Parcela'
                end
                object EditQtdeParcelas: TcxSpinEdit
                  Left = 3
                  Top = 17
                  Properties.MinValue = 1.000000000000000000
                  TabOrder = 0
                  Value = 1
                  Width = 76
                end
                object EditVencimentoParcela: TcxDateEdit
                  Left = 82
                  Top = 17
                  Properties.SaveTime = False
                  Properties.ShowTime = False
                  TabOrder = 1
                  Width = 125
                end
                object btnIncluirParcelas: TButton
                  Left = 210
                  Top = 0
                  Width = 119
                  Height = 37
                  Action = Ac_Gerar_Parcelas
                  Images = dmPrincipal.imgIcons_32
                  TabOrder = 2
                end
              end
            end
            object EditObservacao: TcxDBMemo
              Left = 3
              Top = 324
              DataBinding.DataField = 'OBSERVACAO'
              DataBinding.DataSource = dsMaster
              TabOrder = 8
              Height = 54
              Width = 857
            end
          end
          object tabVinculo: TcxTabSheet
            Caption = 'V'#237'nculos'
            ImageIndex = 1
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object pnVinculoTop: TPanel
              Left = 0
              Top = 0
              Width = 976
              Height = 73
              Align = alTop
              AutoSize = True
              BevelOuter = bvNone
              TabOrder = 0
              ExplicitWidth = 977
              object rgTipoOrigemRecurso: TcxRadioGroup
                Left = 3
                Top = 0
                Caption = 'Tipo da Origem do Recurso'
                Properties.Columns = 2
                Properties.Items = <
                  item
                    Caption = 'Projeto'
                    Value = 0
                  end
                  item
                    Caption = 'Fundo'
                    Value = 1
                  end>
                Properties.OnEditValueChanged = rgTipoOrigemRecursoPropertiesEditValueChanged
                ItemIndex = 0
                TabOrder = 0
                Height = 41
                Width = 185
              end
              object pcOrigemRecurso: TcxPageControl
                Left = 194
                Top = 0
                Width = 231
                Height = 73
                TabOrder = 1
                Properties.ActivePage = tabProjeto
                Properties.CustomButtons.Buttons = <>
                ClientRectBottom = 69
                ClientRectLeft = 4
                ClientRectRight = 227
                ClientRectTop = 24
                object tabProjeto: TcxTabSheet
                  Caption = 'tabProjeto'
                  ImageIndex = 0
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object Label10: TLabel
                    Left = 4
                    Top = 3
                    Width = 35
                    Height = 13
                    Caption = 'Projeto'
                  end
                  object cbProjetoOrigem: TcxLookupComboBox
                    Left = 3
                    Top = 19
                    RepositoryItem = dmLookup.repLcbProjeto
                    Properties.ListColumns = <>
                    Properties.OnEditValueChanged = cbProjetoOrigemPropertiesEditValueChanged
                    TabOrder = 0
                    Width = 218
                  end
                end
                object tabFundo: TcxTabSheet
                  Caption = 'tabFundo'
                  ImageIndex = 1
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object Label15: TLabel
                    Left = 4
                    Top = 3
                    Width = 30
                    Height = 13
                    Caption = 'Fundo'
                  end
                  object cbFundoOrigem: TcxLookupComboBox
                    Left = 3
                    Top = 19
                    RepositoryItem = dmLookup.repLcbFundo
                    Properties.ListColumns = <>
                    Properties.OnEditValueChanged = cbAtividadePropertiesEditValueChanged
                    TabOrder = 0
                    Width = 218
                  end
                end
              end
              object rgRecursoAlocado: TcxRadioGroup
                Left = 426
                Top = 0
                Caption = 'Recurso Alocado'
                Properties.Columns = 2
                Properties.Items = <
                  item
                    Caption = 'N'#227'o'
                    Value = 0
                  end
                  item
                    Caption = 'Sim'
                    Value = 1
                  end>
                Properties.OnEditValueChanged = rgRecursoAlocadoPropertiesEditValueChanged
                ItemIndex = 0
                TabOrder = 2
                Height = 41
                Width = 111
              end
            end
            object gbOrigem: TcxGroupBox
              Left = 0
              Top = 73
              Align = alTop
              Caption = 'Origem do Recurso'
              TabOrder = 1
              ExplicitWidth = 977
              Height = 88
              Width = 976
              object pcRecursoAlocado: TcxPageControl
                Left = 2
                Top = 18
                Width = 972
                Height = 68
                Align = alTop
                TabOrder = 0
                Properties.ActivePage = tabNao
                Properties.CustomButtons.Buttons = <>
                ExplicitLeft = 3
                ExplicitTop = 15
                ExplicitWidth = 971
                ClientRectBottom = 64
                ClientRectLeft = 4
                ClientRectRight = 968
                ClientRectTop = 24
                object tabNao: TcxTabSheet
                  Caption = 'tabNao'
                  ImageIndex = 0
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object Label14: TLabel
                    Left = 206
                    Top = 2
                    Width = 36
                    Height = 13
                    Caption = 'Rubrica'
                  end
                  object Label12: TLabel
                    Left = 0
                    Top = 2
                    Width = 45
                    Height = 13
                    Caption = 'Atividade'
                  end
                  object lbl3: TLabel
                    Left = 377
                    Top = 2
                    Width = 81
                    Height = 13
                    Caption = #193'rea de Atua'#231#227'o'
                  end
                  object cbRubricaAtividadeOrigem: TcxLookupComboBox
                    Left = 203
                    Top = 17
                    RepositoryItem = dmLookup.repLcbRubricaAtividade
                    Properties.ListColumns = <>
                    TabOrder = 1
                    Width = 170
                  end
                  object cbAtividadeOrigem: TcxLookupComboBox
                    Left = 0
                    Top = 17
                    RepositoryItem = dmLookup.repLcbAtividade
                    Properties.ListColumns = <>
                    Properties.OnEditValueChanged = cbAtividadePropertiesEditValueChanged
                    TabOrder = 0
                    Width = 200
                  end
                  object cbAreaAtuacaoOrigem: TcxLookupComboBox
                    Left = 375
                    Top = 17
                    RepositoryItem = dmLookup.repLcbProjeto_Area_Atividade
                    Properties.ListColumns = <>
                    TabOrder = 2
                    Width = 170
                  end
                end
                object tabSim: TcxTabSheet
                  Caption = 'tabSim'
                  ImageIndex = 1
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object lb1: TLabel
                    Left = 2
                    Top = 1
                    Width = 36
                    Height = 13
                    Caption = 'Rubrica'
                  end
                  object cbRubricaProjetoOrigem: TcxLookupComboBox
                    Left = 0
                    Top = 17
                    RepositoryItem = dmLookup.repLcbRubrica
                    Properties.ListColumns = <>
                    TabOrder = 0
                    Width = 200
                  end
                end
              end
            end
            object gbAlocado: TcxGroupBox
              Left = 0
              Top = 161
              Align = alTop
              Caption = 'Recurso Alocado Para'
              TabOrder = 2
              Visible = False
              ExplicitWidth = 977
              Height = 63
              Width = 976
              object Label16: TLabel
                Left = 212
                Top = 15
                Width = 45
                Height = 13
                Caption = 'Atividade'
              end
              object Label18: TLabel
                Left = 486
                Top = 15
                Width = 36
                Height = 13
                Caption = 'Rubrica'
              end
              object Label19: TLabel
                Left = 818
                Top = 15
                Width = 81
                Height = 13
                Caption = #193'rea de Atua'#231#227'o'
              end
              object Label20: TLabel
                Left = 5
                Top = 15
                Width = 35
                Height = 13
                Caption = 'Projeto'
              end
              object cbAtividadeAlocada: TcxLookupComboBox
                Left = 209
                Top = 31
                Properties.DropDownAutoSize = True
                Properties.DropDownListStyle = lsFixedList
                Properties.DropDownSizeable = True
                Properties.KeyFieldNames = 'ID'
                Properties.ListColumns = <
                  item
                    FieldName = 'NOME'
                  end>
                Properties.ListSource = dsAtividadeAlocada
                Properties.OnEditValueChanged = cbAtividadeAlocadaPropertiesEditValueChanged
                TabOrder = 1
                Width = 272
              end
              object cbRubricaAtividadeAlocada: TcxLookupComboBox
                Left = 484
                Top = 31
                Properties.DropDownAutoSize = True
                Properties.DropDownListStyle = lsFixedList
                Properties.DropDownSizeable = True
                Properties.KeyFieldNames = 'ID'
                Properties.ListColumns = <
                  item
                    FieldName = 'NOME'
                  end>
                Properties.ListSource = dsRubricaAlocada
                TabOrder = 2
                Width = 333
              end
              object cbAreaAtuacaoAlocada: TcxLookupComboBox
                Left = 818
                Top = 31
                Properties.DropDownAutoSize = True
                Properties.DropDownListStyle = lsFixedList
                Properties.DropDownSizeable = True
                Properties.KeyFieldNames = 'ID'
                Properties.ListColumns = <
                  item
                    FieldName = 'NOME'
                  end>
                Properties.ListSource = dsAreaAlocada
                TabOrder = 3
                Width = 151
              end
              object cbProjetoAlocado: TcxLookupComboBox
                Left = 3
                Top = 31
                RepositoryItem = dmLookup.repLcbProjeto
                Properties.ListColumns = <>
                Properties.OnEditValueChanged = cbProjetoAlocadoPropertiesEditValueChanged
                TabOrder = 0
                Width = 203
              end
            end
            object pnValor: TPanel
              Left = 0
              Top = 224
              Width = 976
              Height = 43
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 3
              ExplicitWidth = 977
              object Label21: TLabel
                Left = 5
                Top = 6
                Width = 24
                Height = 13
                Caption = 'Valor'
              end
              object btnAdicionarVinculo: TButton
                Left = 126
                Top = 2
                Width = 91
                Height = 39
                Action = Ac_Incluir_Vinculo
                Images = dmPrincipal.imgIcons_32
                TabOrder = 1
              end
              object EditValorVinculo: TcxCurrencyEdit
                Left = 3
                Top = 20
                RepositoryItem = dmLookup.repCurPadrao
                TabOrder = 0
                Width = 121
              end
            end
            object cxGrid2: TcxGrid
              Left = 0
              Top = 267
              Width = 976
              Height = 116
              Align = alClient
              TabOrder = 4
              TabStop = False
              ExplicitWidth = 977
              ExplicitHeight = 114
              object viewVinculos: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                DataController.DataSource = dsVinculo
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsCustomize.ColumnsQuickCustomization = True
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Inserting = False
                OptionsView.GroupByBox = False
                object viewVinculosID: TcxGridDBColumn
                  DataBinding.FieldName = 'ID'
                  Visible = False
                  Width = 36
                end
                object viewVinculosNOME_FUNDO: TcxGridDBColumn
                  DataBinding.FieldName = 'NOME_FUNDO'
                  Options.Editing = False
                  Width = 158
                end
                object viewVinculosPROJETO_ORIGEM: TcxGridDBColumn
                  DataBinding.FieldName = 'PROJETO_ORIGEM'
                  Options.Editing = False
                  Width = 170
                end
                object viewVinculosATIVIDADE_ORIGEM: TcxGridDBColumn
                  DataBinding.FieldName = 'ATIVIDADE_ORIGEM'
                  Visible = False
                  Options.Editing = False
                  Width = 164
                end
                object viewVinculosRUBRICA_ORIGEM: TcxGridDBColumn
                  DataBinding.FieldName = 'RUBRICA_ORIGEM'
                  Options.Editing = False
                  Width = 154
                end
                object viewVinculosAREA_ATUACAO_ORIGEM: TcxGridDBColumn
                  DataBinding.FieldName = 'AREA_ATUACAO_ORIGEM'
                  Visible = False
                  Options.Editing = False
                  Width = 207
                end
                object viewVinculosPROJETO_ALOCADO: TcxGridDBColumn
                  DataBinding.FieldName = 'PROJETO_ALOCADO'
                  Options.Editing = False
                  Width = 126
                end
                object viewVinculosATIVIDADE_ALOCADA: TcxGridDBColumn
                  DataBinding.FieldName = 'ATIVIDADE_ALOCADA'
                  Visible = False
                  Options.Editing = False
                  Width = 91
                end
                object viewVinculosRUBRICA_ALOCADA: TcxGridDBColumn
                  DataBinding.FieldName = 'RUBRICA_ALOCADA'
                  Options.Editing = False
                  Width = 154
                end
                object viewVinculosAREA_ATUACAO_ALOCADA: TcxGridDBColumn
                  DataBinding.FieldName = 'AREA_ATUACAO_ALOCADA'
                  Visible = False
                  Options.Editing = False
                  Width = 127
                end
                object viewVinculosVALOR: TcxGridDBColumn
                  DataBinding.FieldName = 'VALOR'
                  RepositoryItem = dmLookup.repCurPadrao
                  Width = 119
                end
                object viewVinculosID_CONTA_PAGAR: TcxGridDBColumn
                  DataBinding.FieldName = 'ID_CONTA_PAGAR'
                  Visible = False
                  Options.Editing = False
                end
                object viewVinculosID_FUNDO: TcxGridDBColumn
                  DataBinding.FieldName = 'ID_FUNDO'
                  Visible = False
                  Options.Editing = False
                end
                object viewVinculosID_PROJETO_ORIGEM: TcxGridDBColumn
                  DataBinding.FieldName = 'ID_PROJETO_ORIGEM'
                  Visible = False
                  Options.Editing = False
                end
                object viewVinculosID_ATIVIDADE_ORIGEM: TcxGridDBColumn
                  DataBinding.FieldName = 'ID_ATIVIDADE_ORIGEM'
                  Visible = False
                  Options.Editing = False
                end
                object viewVinculosID_RUBRICA_ORIGEM: TcxGridDBColumn
                  DataBinding.FieldName = 'ID_RUBRICA_ORIGEM'
                  Visible = False
                  Options.Editing = False
                end
                object viewVinculosID_AREA_ATUACAO_ORIGEM: TcxGridDBColumn
                  DataBinding.FieldName = 'ID_AREA_ATUACAO_ORIGEM'
                  Visible = False
                  Options.Editing = False
                end
                object viewVinculosID_PROJETO_ALOCADO: TcxGridDBColumn
                  DataBinding.FieldName = 'ID_PROJETO_ALOCADO'
                  Visible = False
                  Options.Editing = False
                end
                object viewVinculosID_ATIVIDADE_ALOCADO: TcxGridDBColumn
                  DataBinding.FieldName = 'ID_ATIVIDADE_ALOCADO'
                  Visible = False
                  Options.Editing = False
                end
                object viewVinculosID_RUBRICA_ALOCADO: TcxGridDBColumn
                  DataBinding.FieldName = 'ID_RUBRICA_ALOCADO'
                  Visible = False
                  Options.Editing = False
                end
                object viewVinculosID_AREA_ATUACAO_ALOCADO: TcxGridDBColumn
                  DataBinding.FieldName = 'ID_AREA_ATUACAO_ALOCADO'
                  Visible = False
                  Options.Editing = False
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
                  Width = 36
                end
              end
              object level1: TcxGridLevel
                GridView = viewVinculos
              end
            end
          end
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitWidth = 986
      ExplicitHeight = 463
      inherited pnBotoesCadastroDetail: TPanel
        Width = 986
        TabOrder = 0
        ExplicitWidth = 986
      end
      inherited pnEditsCadastroDetail: TPanel
        Width = 986
        Height = 413
        TabOrder = 1
        ExplicitWidth = 986
        ExplicitHeight = 413
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
    object Ac_Incluir_Vinculo: TAction
      Category = 'Detail'
      Caption = 'Adicionar'
      ImageIndex = 3
      OnExecute = Ac_Incluir_VinculoExecute
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
  object dsVinculos: TDataSource
    Left = 600
    Top = 240
  end
  object dsAtividadeAlocada: TDataSource
    DataSet = dmLookup.cdslkAtividade_Alocada
    Left = 720
    Top = 184
  end
  object dsRubricaAlocada: TDataSource
    DataSet = dmLookup.cdslkRubrica_Atividade_Alocada
    Left = 840
    Top = 192
  end
  object dsAreaAlocada: TDataSource
    DataSet = dmLookup.cdslkProjeto_Area_Atividade_Alocada
    Left = 584
    Top = 177
  end
  object dsVinculo: TDataSource
    DataSet = dmFinanceiro.cdsConta_Pagar_Vinculo
    Left = 488
    Top = 256
  end
end
