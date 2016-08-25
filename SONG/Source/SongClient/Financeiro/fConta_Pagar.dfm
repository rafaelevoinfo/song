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
          Left = 367
          Width = 618
          ExplicitLeft = 367
          ExplicitWidth = 618
          inherited Label1: TLabel
            Left = 203
            ExplicitLeft = 203
          end
          object cbPesquisaFundo: TcxLookupComboBox [1]
            Left = 358
            Top = 20
            RepositoryItem = dmLookup.repLcbFundo
            Properties.ListColumns = <>
            TabOrder = 7
            Visible = False
            Width = 161
          end
          object cbPesquisaFornecedor: TcxLookupComboBox [2]
            Left = 358
            Top = 20
            RepositoryItem = dmLookup.repLcbFornecedor
            Properties.ListColumns = <>
            TabOrder = 6
            Width = 161
          end
          object cbPesquisaPlanoConta: TcxLookupComboBox [3]
            Left = 358
            Top = 20
            RepositoryItem = dmLookup.repLcbPlano_Contas
            Properties.ListColumns = <>
            TabOrder = 8
            Width = 161
          end
          object cbPesquisaProjeto: TcxLookupComboBox [4]
            Left = 358
            Top = 20
            RepositoryItem = dmLookup.repLcbProjeto
            Properties.ListColumns = <>
            TabOrder = 10
            Visible = False
            Width = 161
          end
          object cbPesquisaRubricas: TcxLookupComboBox [5]
            Left = 358
            Top = 20
            Properties.DropDownListStyle = lsFixedList
            Properties.DropDownSizeable = True
            Properties.KeyFieldNames = 'ID'
            Properties.ListColumns = <
              item
                FieldName = 'NOME'
              end>
            Properties.ListSource = dsLocalRubricas
            TabOrder = 9
            Visible = False
            Width = 159
          end
          object cbPesquisaResponsavel: TcxLookupComboBox [6]
            Left = 358
            Top = 20
            RepositoryItem = dmLookup.repLcbPessoa
            Properties.ListColumns = <>
            TabOrder = 5
            Width = 161
          end
          inherited rgStatus: TcxRadioGroup [7]
            Caption = 'Status da Parcela'
            Properties.Columns = 3
            Properties.Items = <
              item
                Caption = 'Aberto'
                Value = 0
              end
              item
                Caption = 'Quitada'
                Value = 1
              end
              item
                Caption = 'Ambos'
                Value = 2
              end>
            Visible = True
            ExplicitWidth = 197
            Width = 197
          end
          inherited pnData: TPanel [8]
            Left = 390
            ExplicitLeft = 390
          end
          inherited EditPesquisa: TcxButtonEdit [9]
            Left = 355
            ExplicitLeft = 355
            ExplicitWidth = 164
            Width = 164
          end
          inherited cbPesquisarPor: TcxImageComboBox [10]
            Left = 201
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
                Description = 'Rubrica de Origem do Recurso'
                Value = 10
              end
              item
                Description = 'Respons'#225'vel pela Despesa'
                Value = 11
              end
              item
                Description = 'Conta de Origem do Recurso'
                Value = 12
              end>
            ExplicitLeft = 201
            ExplicitWidth = 153
            Width = 153
          end
          inherited btnPesquisar: TButton [11]
            Left = 518
            ExplicitLeft = 518
          end
        end
        inherited pnBotoes: TPanel
          Width = 366
          ExplicitWidth = 366
        end
      end
      inherited pnGrid: TPanel
        Width = 986
        Height = 419
        ExplicitWidth = 986
        ExplicitHeight = 419
        inherited cxGridRegistros: TcxGrid
          Width = 984
          Height = 184
          ExplicitWidth = 984
          ExplicitHeight = 184
          inherited viewRegistros: TcxGridDBTableView
            DataController.Summary.FooterSummaryItems = <
              item
                Format = 'R$ ,0.00'
                Kind = skSum
                FieldName = 'VALOR_TOTAL'
                Column = viewRegistrosVALOR_TOTAL
              end>
            OptionsView.Footer = True
            OptionsView.FooterAutoHeight = True
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
            object viewRegistrosID_PLANO_CONTAS: TcxGridDBColumn [2]
              DataBinding.FieldName = 'ID_PLANO_CONTAS'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_CONTA_CORRENTE: TcxGridDBColumn [3]
              DataBinding.FieldName = 'ID_CONTA_CORRENTE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosDESCRICAO: TcxGridDBColumn [4]
              DataBinding.FieldName = 'DESCRICAO'
              Options.Editing = False
              Width = 218
            end
            object viewRegistrosVALOR_TOTAL: TcxGridDBColumn [5]
              DataBinding.FieldName = 'VALOR_TOTAL'
              RepositoryItem = dmLookup.repCurPadrao
              Options.Editing = False
              Width = 164
            end
            object viewRegistrosNOME_RESPONSAVEL: TcxGridDBColumn [6]
              DataBinding.FieldName = 'NOME_RESPONSAVEL'
              Options.Editing = False
              Width = 168
            end
            object viewRegistrosFORMA_PAGTO: TcxGridDBColumn [7]
              DataBinding.FieldName = 'FORMA_PAGTO'
              RepositoryItem = dmLookup.repIcbFormaPagamento
              Visible = False
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
            object viewRegistrosID_COMPRA: TcxGridDBColumn [12]
              DataBinding.FieldName = 'ID_COMPRA'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_RESPONSAVEL: TcxGridDBColumn [13]
              DataBinding.FieldName = 'ID_RESPONSAVEL'
              Visible = False
              Options.Editing = False
            end
          end
        end
        inherited cxSplitter1: TcxSplitter
          Top = 185
          Width = 984
          ExplicitTop = 185
          ExplicitWidth = 984
        end
        inherited pnDetail: TPanel
          Top = 191
          Width = 984
          ExplicitTop = 191
          ExplicitWidth = 984
          inherited pcDetails: TcxPageControl
            Width = 982
            ExplicitWidth = 982
            ClientRectRight = 977
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
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = 'R$ ,0.00'
                      Kind = skSum
                      FieldName = 'VALOR'
                      Column = viewRegistrosDetailVALOR
                    end>
                  OptionsView.Footer = True
                  OptionsView.FooterAutoHeight = True
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
                    Width = 177
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
              object cxGrid3: TcxGrid
                Left = 0
                Top = 0
                Width = 975
                Height = 195
                Align = alClient
                TabOrder = 0
                TabStop = False
                object cxGridDBTableView1: TcxGridDBTableView
                  Navigator.Buttons.CustomButtons = <>
                  DataController.DataSource = dsVinculo
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <
                    item
                      Format = 'R$ ,0.00'
                      Kind = skSum
                      FieldName = 'VALOR'
                      Column = cxGridDBTableView1VALOR
                    end>
                  DataController.Summary.SummaryGroups = <>
                  OptionsCustomize.ColumnsQuickCustomization = True
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsView.Footer = True
                  OptionsView.FooterAutoHeight = True
                  OptionsView.GroupByBox = False
                  object cxGridDBTableView1ID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Visible = False
                  end
                  object cxGridDBTableView1ID_CONTA_PAGAR: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_CONTA_PAGAR'
                    Visible = False
                  end
                  object cxGridDBTableView1ID_ORGANIZACAO_ORIGEM: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_ORGANIZACAO_ORIGEM'
                    Visible = False
                  end
                  object cxGridDBTableView1NOME_ORGANIZACAO: TcxGridDBColumn
                    DataBinding.FieldName = 'NOME_ORGANIZACAO'
                    Visible = False
                    Width = 174
                  end
                  object cxGridDBTableView1ID_FUNDO: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_FUNDO'
                    Visible = False
                  end
                  object cxGridDBTableView1NOME_FUNDO: TcxGridDBColumn
                    DataBinding.FieldName = 'NOME_FUNDO'
                    Width = 116
                  end
                  object cxGridDBTableView1ID_PROJETO_ORIGEM: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_PROJETO_ORIGEM'
                    Visible = False
                  end
                  object cxGridDBTableView1PROJETO_ORIGEM: TcxGridDBColumn
                    DataBinding.FieldName = 'PROJETO_ORIGEM'
                    Width = 178
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
                  object cxGridDBTableView1VALOR: TcxGridDBColumn
                    DataBinding.FieldName = 'VALOR'
                    RepositoryItem = dmLookup.repCurPadrao
                    Width = 143
                  end
                  object cxGridDBTableView1AREA_ATUACAO_ALOCADA: TcxGridDBColumn
                    DataBinding.FieldName = 'AREA_ATUACAO_ALOCADA'
                    Visible = False
                    Width = 139
                  end
                end
                object cxGridLevel2: TcxGridLevel
                  GridView = cxGridDBTableView1
                end
              end
            end
            object tabAutorizacoes: TcxTabSheet
              Caption = 'Autoriza'#231#245'es'
              ImageIndex = 2
              object pnBotoesAutorizacoes: TPanel
                Left = 0
                Top = 0
                Width = 975
                Height = 25
                Align = alTop
                TabOrder = 0
                object btnAutorizar: TButton
                  Left = 1
                  Top = 1
                  Width = 101
                  Height = 23
                  Action = Ac_Autorizar
                  Align = alLeft
                  Images = dmPrincipal.imgIcons_16
                  TabOrder = 0
                end
              end
              object cxGrid4: TcxGrid
                Left = 0
                Top = 25
                Width = 975
                Height = 170
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 1
                LockedStateImageOptions.Effect = lsieDark
                LockedStateImageOptions.ShowText = True
                LockedStateImageOptions.Text = 'Pesquisando...'
                object viewAutorizacao: TcxGridDBTableView
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
                  DataController.DataSource = dsConta_Pagar_Autorizacao
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  FilterRow.Visible = True
                  OptionsCustomize.ColumnsQuickCustomization = True
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Inserting = False
                  OptionsSelection.MultiSelect = True
                  OptionsView.NoDataToDisplayInfoText = '<Sem dados para mostrar>'
                  OptionsView.GroupByBox = False
                  object viewAutorizacaoID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewAutorizacaoID_PESSOA: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_PESSOA'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewAutorizacaoPESSOA_AUTORIZOU: TcxGridDBColumn
                    DataBinding.FieldName = 'PESSOA_AUTORIZOU'
                    Options.Editing = False
                  end
                  object ColumnExcluirAutorizacao: TcxGridDBColumn
                    Caption = 'Excluir'
                    PropertiesClassName = 'TcxButtonEditProperties'
                    Properties.Buttons = <
                      item
                        Action = Ac_Excluir_Autorizacao
                        Default = True
                        Kind = bkGlyph
                      end>
                    Properties.Images = dmPrincipal.imgIcons_16
                    Properties.ViewStyle = vsButtonsOnly
                    MinWidth = 64
                    Options.Filtering = False
                    Options.ShowEditButtons = isebAlways
                    Options.GroupFooters = False
                    Options.Grouping = False
                    Options.HorzSizing = False
                    Options.Moving = False
                    VisibleForCustomization = False
                  end
                end
                object level2: TcxGridLevel
                  GridView = viewAutorizacao
                end
              end
            end
          end
          inherited btnExportar_Excel_Detail: TButton
            Left = 779
            ExplicitLeft = 779
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
          Properties.ActivePage = tabInfoGeral
          Properties.CustomButtons.Buttons = <>
          ClientRectBottom = 406
          ClientRectLeft = 2
          ClientRectRight = 979
          ClientRectTop = 25
          object tabInfoGeral: TcxTabSheet
            Caption = 'Informa'#231#245'es Gerais'
            ImageIndex = 0
            object Label3: TLabel
              Left = 5
              Top = 2
              Width = 46
              Height = 13
              Caption = 'Descri'#231#227'o'
              FocusControl = EditDescricao
            end
            object Label8: TLabel
              Left = 656
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
              Width = 78
              Height = 13
              Caption = 'Fornecedor (F2)'
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
              Width = 101
              Height = 13
              Caption = 'Plano de Contas (F2)'
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
            object lbl1: TLabel
              Left = 6
              Top = 42
              Width = 127
              Height = 13
              Caption = 'Respons'#225'vel pela despesa'
              FocusControl = cbResponsavel
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
              Left = 655
              Top = 58
              RepositoryItem = dmLookup.repCurPadrao
              DataBinding.DataField = 'VALOR_TOTAL'
              DataBinding.DataSource = dsMaster
              TabOrder = 9
              Width = 205
            end
            object cbFormaPagamento: TcxDBImageComboBox
              Left = 211
              Top = 58
              RepositoryItem = dmLookup.repIcbFormaPagamento
              DataBinding.DataField = 'FORMA_PAGTO'
              DataBinding.DataSource = dsMaster
              Properties.Items = <>
              TabOrder = 7
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
              OnKeyDown = cbFornecedorKeyDown
              Width = 198
            end
            object cbContaCorrente: TcxDBLookupComboBox
              Left = 655
              Top = 18
              RepositoryItem = dmLookup.repLcbContaCorrente
              DataBinding.DataField = 'ID_CONTA_CORRENTE'
              DataBinding.DataSource = dsMaster
              Properties.ListColumns = <>
              TabOrder = 5
              Width = 205
            end
            object cbPlanoContas: TcxDBLookupComboBox
              Left = 433
              Top = 18
              RepositoryItem = dmLookup.repLcbPlano_Contas
              DataBinding.DataField = 'ID_PLANO_CONTAS'
              DataBinding.DataSource = dsMaster
              Properties.ListColumns = <>
              TabOrder = 3
              OnKeyDown = cbPlanoContasKeyDown
              Width = 197
            end
            object EditNroDocumento: TcxDBTextEdit
              Left = 433
              Top = 58
              DataBinding.DataField = 'NUMERO_DOCUMENTO'
              DataBinding.DataSource = dsMaster
              TabOrder = 8
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
              TabOrder = 10
              Height = 220
              Width = 857
              object cxGrid1: TcxGrid
                Left = 3
                Top = 56
                Width = 851
                Height = 154
                Align = alClient
                TabOrder = 1
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
              object pnParcelas: TPanel
                Left = 3
                Top = 15
                Width = 851
                Height = 41
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
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
                  TabOrder = 1
                  Value = 1
                  Width = 76
                end
                object EditVencimentoParcela: TcxDateEdit
                  Left = 82
                  Top = 17
                  Properties.SaveTime = False
                  Properties.ShowTime = False
                  TabOrder = 2
                  Width = 125
                end
                object btnIncluirParcelas: TButton
                  Left = 210
                  Top = 0
                  Width = 119
                  Height = 37
                  Action = Ac_Gerar_Parcelas
                  Images = dmPrincipal.imgIcons_32
                  TabOrder = 0
                end
              end
            end
            object EditObservacao: TcxDBMemo
              Left = 3
              Top = 324
              DataBinding.DataField = 'OBSERVACAO'
              DataBinding.DataSource = dsMaster
              TabOrder = 11
              Height = 54
              Width = 857
            end
            object cbResponsavel: TcxDBLookupComboBox
              Left = 5
              Top = 58
              RepositoryItem = dmLookup.repLcbPessoa
              DataBinding.DataField = 'ID_RESPONSAVEL'
              DataBinding.DataSource = dsMaster
              Properties.ListColumns = <>
              TabOrder = 6
              Width = 204
            end
            object btnAdicionarFornecedor: TButton
              Left = 409
              Top = 18
              Width = 22
              Height = 21
              Action = Ac_Adicionar_Fornecedor
              Images = dmPrincipal.imgIcons_16
              TabOrder = 2
              TabStop = False
            end
            object btnAdicionar_Plano_Contas: TButton
              Left = 631
              Top = 18
              Width = 22
              Height = 21
              Action = Ac_Adicionar_Plano_Contas
              Images = dmPrincipal.imgIcons_16
              TabOrder = 4
              TabStop = False
            end
          end
          object tabVinculo: TcxTabSheet
            Caption = 'V'#237'nculos'
            ImageIndex = 1
            object pnVinculoTop: TPanel
              Left = 0
              Top = 0
              Width = 977
              Height = 73
              Align = alTop
              AutoSize = True
              BevelOuter = bvNone
              TabOrder = 0
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
                    Caption = 'Conta'
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
                Width = 407
                Height = 73
                TabOrder = 1
                Properties.ActivePage = tabProjeto
                Properties.CustomButtons.Buttons = <>
                ClientRectBottom = 68
                ClientRectLeft = 2
                ClientRectRight = 402
                ClientRectTop = 25
                object tabProjeto: TcxTabSheet
                  Caption = 'tabProjeto'
                  ImageIndex = 0
                  object Label10: TLabel
                    Left = 4
                    Top = 3
                    Width = 35
                    Height = 13
                    Caption = 'Projeto'
                  end
                  object lb2: TLabel
                    Left = 228
                    Top = 3
                    Width = 60
                    Height = 13
                    Caption = 'Organiza'#231#227'o'
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
                  object cbOrganizacaoOrigem: TcxLookupComboBox
                    Left = 227
                    Top = 19
                    RepositoryItem = dmLookup.repLcbProjetoOrganizacao
                    Enabled = False
                    Properties.ListColumns = <>
                    TabOrder = 1
                    Width = 170
                  end
                end
                object tabFundo: TcxTabSheet
                  Caption = 'tabFundo'
                  ImageIndex = 1
                  object Label15: TLabel
                    Left = 4
                    Top = 3
                    Width = 29
                    Height = 13
                    Caption = 'Conta'
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
                  object chkSemVinculo: TcxCheckBox
                    Left = 223
                    Top = 21
                    Caption = 'Sem V'#237'nculo com Projeto'
                    Properties.OnEditValueChanged = chkSemVinculoPropertiesEditValueChanged
                    TabOrder = 1
                    Visible = False
                    Width = 143
                  end
                end
              end
              object rgRecursoAlocado: TcxRadioGroup
                Left = 602
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
                Visible = False
                Height = 41
                Width = 111
              end
              object rgAlocadoPara: TcxRadioGroup
                Left = 719
                Top = 0
                Caption = 'Recurso Alocado Para'
                Properties.Columns = 2
                Properties.Items = <
                  item
                    Caption = 'Projeto'
                    Value = 0
                  end
                  item
                    Caption = 'Conta'
                    Value = 1
                  end>
                Properties.OnEditValueChanged = rgRecursoAlocadoPropertiesEditValueChanged
                ItemIndex = 0
                TabOrder = 3
                Visible = False
                Height = 41
                Width = 144
              end
            end
            object gbOrigem: TcxGroupBox
              Left = 0
              Top = 73
              Align = alTop
              Caption = 'Origem do Recurso'
              TabOrder = 1
              Height = 88
              Width = 977
              object pcRecursoAlocado: TcxPageControl
                Left = 3
                Top = 15
                Width = 971
                Height = 68
                Align = alTop
                TabOrder = 0
                Properties.ActivePage = tabRecursoNaoAlocado
                Properties.CustomButtons.Buttons = <>
                ClientRectBottom = 63
                ClientRectLeft = 2
                ClientRectRight = 966
                ClientRectTop = 25
                object tabRecursoNaoAlocado: TcxTabSheet
                  Caption = 'tabRecursoNaoAlocado'
                  ImageIndex = 0
                  object Label14: TLabel
                    Left = 206
                    Top = 0
                    Width = 36
                    Height = 13
                    Caption = 'Rubrica'
                  end
                  object Label12: TLabel
                    Left = 0
                    Top = 0
                    Width = 45
                    Height = 13
                    Caption = 'Atividade'
                  end
                  object lbl3: TLabel
                    Left = 377
                    Top = 0
                    Width = 81
                    Height = 13
                    Caption = #193'rea de Atua'#231#227'o'
                  end
                  object cbRubricaAtividadeOrigem: TcxLookupComboBox
                    Left = 203
                    Top = 15
                    RepositoryItem = dmLookup.repLcbRubricaAtividade
                    Properties.ListColumns = <>
                    TabOrder = 0
                    Width = 170
                  end
                  object cbAtividadeOrigem: TcxLookupComboBox
                    Left = 0
                    Top = 16
                    RepositoryItem = dmLookup.repLcbAtividade
                    Properties.ListColumns = <>
                    Properties.OnEditValueChanged = cbAtividadePropertiesEditValueChanged
                    TabOrder = 2
                    Width = 200
                  end
                  object cbAreaAtuacaoOrigem: TcxLookupComboBox
                    Left = 375
                    Top = 15
                    RepositoryItem = dmLookup.repLcbProjeto_Area_Atividade
                    Properties.ListColumns = <>
                    TabOrder = 1
                    Width = 170
                  end
                end
                object tabRecursoAlocado: TcxTabSheet
                  Caption = 'tabRecursoAlocado'
                  ImageIndex = 1
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
              Height = 94
              Width = 977
              object pcAlocadoPara: TcxPageControl
                Left = 3
                Top = 15
                Width = 971
                Height = 69
                Align = alClient
                TabOrder = 0
                Properties.ActivePage = tabAlocadoProjeto
                Properties.CustomButtons.Buttons = <>
                ClientRectBottom = 64
                ClientRectLeft = 2
                ClientRectRight = 966
                ClientRectTop = 25
                object tabAlocadoProjeto: TcxTabSheet
                  Caption = 'tabAlocadoProjeto'
                  ImageIndex = 0
                  object Label19: TLabel
                    Left = 817
                    Top = 0
                    Width = 81
                    Height = 13
                    Caption = #193'rea de Atua'#231#227'o'
                  end
                  object Label18: TLabel
                    Left = 485
                    Top = 0
                    Width = 36
                    Height = 13
                    Caption = 'Rubrica'
                  end
                  object Label16: TLabel
                    Left = 211
                    Top = 0
                    Width = 45
                    Height = 13
                    Caption = 'Atividade'
                  end
                  object Label20: TLabel
                    Left = 4
                    Top = 0
                    Width = 35
                    Height = 13
                    Caption = 'Projeto'
                  end
                  object cbAreaAtuacaoAlocada: TcxLookupComboBox
                    Left = 812
                    Top = 16
                    Properties.DropDownAutoSize = True
                    Properties.DropDownListStyle = lsFixedList
                    Properties.DropDownSizeable = True
                    Properties.KeyFieldNames = 'ID'
                    Properties.ListColumns = <
                      item
                        FieldName = 'NOME'
                      end>
                    Properties.ListOptions.SyncMode = True
                    Properties.ListSource = dsAreaAlocada
                    TabOrder = 3
                    Width = 151
                  end
                  object cbRubricaAtividadeAlocada: TcxLookupComboBox
                    Left = 483
                    Top = 16
                    Properties.DropDownAutoSize = True
                    Properties.DropDownListStyle = lsFixedList
                    Properties.DropDownSizeable = True
                    Properties.KeyFieldNames = 'ID'
                    Properties.ListColumns = <
                      item
                        FieldName = 'NOME'
                      end>
                    Properties.ListOptions.SyncMode = True
                    Properties.ListSource = dsRubricaAlocada
                    TabOrder = 2
                    Width = 327
                  end
                  object cbAtividadeAlocada: TcxLookupComboBox
                    Left = 208
                    Top = 16
                    Properties.DropDownAutoSize = True
                    Properties.DropDownListStyle = lsFixedList
                    Properties.DropDownSizeable = True
                    Properties.KeyFieldNames = 'ID'
                    Properties.ListColumns = <
                      item
                        FieldName = 'NOME'
                      end>
                    Properties.ListOptions.SyncMode = True
                    Properties.ListSource = dsAtividadeAlocada
                    Properties.OnEditValueChanged = cbAtividadeAlocadaPropertiesEditValueChanged
                    TabOrder = 1
                    Width = 272
                  end
                  object cbProjetoAlocado: TcxLookupComboBox
                    Left = 2
                    Top = 16
                    RepositoryItem = dmLookup.repLcbProjeto
                    Properties.ListColumns = <>
                    Properties.OnEditValueChanged = cbProjetoAlocadoPropertiesEditValueChanged
                    TabOrder = 0
                    Width = 203
                  end
                end
                object tabAlocadoFundo: TcxTabSheet
                  Caption = 'tabAlocadoFundo'
                  ImageIndex = 1
                  object lb3: TLabel
                    Left = 4
                    Top = 1
                    Width = 29
                    Height = 13
                    Caption = 'Conta'
                  end
                  object cbFundoAlocado: TcxLookupComboBox
                    Left = 3
                    Top = 16
                    RepositoryItem = dmLookup.repLcbFundo
                    Properties.ListColumns = <>
                    Properties.OnEditValueChanged = cbAtividadePropertiesEditValueChanged
                    TabOrder = 0
                    Width = 218
                  end
                end
              end
            end
            object pnValor: TPanel
              Left = 0
              Top = 255
              Width = 977
              Height = 43
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 3
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
                TabOrder = 0
              end
              object EditValorVinculo: TcxCurrencyEdit
                Left = 3
                Top = 20
                RepositoryItem = dmLookup.repCurPadrao
                TabOrder = 1
                Width = 121
              end
            end
            object cxGrid2: TcxGrid
              Left = 0
              Top = 298
              Width = 977
              Height = 83
              Align = alClient
              TabOrder = 4
              TabStop = False
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
                object viewVinculosNOME_ORGANIZACAO: TcxGridDBColumn
                  DataBinding.FieldName = 'NOME_ORGANIZACAO'
                  Visible = False
                  Options.Editing = False
                  Width = 178
                end
                object viewVinculosNOME_FUNDO: TcxGridDBColumn
                  DataBinding.FieldName = 'NOME_FUNDO'
                  Options.Editing = False
                  Width = 118
                end
                object viewVinculosPROJETO_ORIGEM: TcxGridDBColumn
                  DataBinding.FieldName = 'PROJETO_ORIGEM'
                  Options.Editing = False
                  Width = 157
                end
                object viewVinculosATIVIDADE_ORIGEM: TcxGridDBColumn
                  DataBinding.FieldName = 'ATIVIDADE_ORIGEM'
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
                  Options.Editing = False
                  Width = 207
                end
                object viewVinculosPROJETO_ALOCADO: TcxGridDBColumn
                  DataBinding.FieldName = 'PROJETO_ALOCADO'
                  Visible = False
                  Options.Editing = False
                  VisibleForCustomization = False
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
                  Visible = False
                  Options.Editing = False
                  VisibleForCustomization = False
                  Width = 91
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
                  Width = 95
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
                object viewVinculosNOME_FUNDO_ALOCADO: TcxGridDBColumn
                  DataBinding.FieldName = 'NOME_FUNDO_ALOCADO'
                  Visible = False
                  VisibleForCustomization = False
                  Width = 200
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
        ExplicitWidth = 986
      end
      inherited pnEditsCadastroDetail: TPanel
        Width = 986
        Height = 413
        ExplicitWidth = 986
        ExplicitHeight = 413
      end
    end
  end
  object pnDataPagamento: TPanel [1]
    Left = 666
    Top = 176
    Width = 206
    Height = 71
    TabOrder = 1
    Visible = False
    object EditDataPagamento: TcxDateEdit
      Left = 1
      Top = 4
      TabOrder = 0
      Width = 203
    end
    object btnCancelarQuitacao: TButton
      Left = 2
      Top = 29
      Width = 100
      Height = 40
      Margins.Left = 0
      Margins.Top = 1
      Margins.Right = 2
      Margins.Bottom = 1
      Caption = 'Cancelar'
      ImageIndex = 5
      Images = dmPrincipal.imgIcons_32
      ModalResult = 2
      TabOrder = 1
      WordWrap = True
    end
    object btnQuitar: TButton
      Left = 104
      Top = 29
      Width = 100
      Height = 40
      Margins.Left = 0
      Margins.Top = 1
      Margins.Right = 2
      Margins.Bottom = 1
      Caption = 'Quitar'
      ImageIndex = 6
      Images = dmPrincipal.imgIcons_32
      ModalResult = 1
      TabOrder = 2
      WordWrap = True
    end
  end
  inherited ActionList1: TActionList
    Left = 280
    Top = 224
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
    object Ac_Autorizar: TAction
      Category = 'Autorizacao'
      Caption = 'Autorizar'
      ImageIndex = 6
      OnExecute = Ac_AutorizarExecute
    end
    object Ac_Excluir_Autorizacao: TAction
      Category = 'Autorizacao'
      Caption = 'Excluir'
      ImageIndex = 2
      OnExecute = Ac_Excluir_AutorizacaoExecute
    end
    object Ac_Adicionar_Fornecedor: TAction
      Category = 'Master'
      ImageIndex = 3
      OnExecute = Ac_Adicionar_FornecedorExecute
    end
    object Ac_Adicionar_Plano_Contas: TAction
      ImageIndex = 3
      OnExecute = Ac_Adicionar_Plano_ContasExecute
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmFinanceiro.cdsConta_Pagar
    Left = 248
    Top = 136
  end
  inherited dsDetail: TDataSource
    DataSet = dmFinanceiro.cdsConta_Pagar_Parcela
    Left = 384
    Top = 216
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
    Left = 504
    Top = 136
  end
  object cdsLocalRubricas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 40
    object cdsLocalRubricasID: TIntegerField
      FieldName = 'ID'
    end
    object cdsLocalRubricasNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 123
    end
  end
  object dsLocalRubricas: TDataSource
    DataSet = cdsLocalRubricas
    Left = 504
    Top = 184
  end
  object dsConta_Pagar_Autorizacao: TDataSource
    DataSet = dmFinanceiro.cdsConta_Pagar_Autorizacao
    Left = 408
    Top = 160
  end
end
