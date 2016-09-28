inherited frmVenda: TfrmVenda
  Caption = 'Vendas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 564
          Width = 411
          ExplicitLeft = 564
          ExplicitWidth = 411
          inherited Label1: TLabel
            Left = 4
            ExplicitLeft = 4
          end
          inherited pnData: TPanel
            Left = 183
            ExplicitLeft = 183
          end
          inherited EditPesquisa: TcxButtonEdit
            Left = 135
            TabOrder = 5
            ExplicitLeft = 135
          end
          inherited cbPesquisarPor: TcxImageComboBox
            Left = 2
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
                Description = 'Data da Venda'
                Value = 4
              end
              item
                Description = 'Vendedor'
                Value = 5
              end
              item
                Description = 'Cliente'
                Value = 6
              end
              item
                Description = 'Item'
                Value = 7
              end>
            TabOrder = 2
            ExplicitLeft = 2
          end
          inherited btnPesquisar: TButton
            Left = 311
            TabOrder = 1
            ExplicitLeft = 311
          end
          inherited rgStatus: TcxRadioGroup
            Left = 6
            Top = 33
            TabOrder = 7
            ExplicitLeft = 6
            ExplicitTop = 33
          end
          object cbPesquisaCliente: TcxLookupComboBox
            Left = 134
            Top = 20
            RepositoryItem = dmLookup.repLcbFornecedor
            Properties.ListColumns = <>
            TabOrder = 3
            Visible = False
            Width = 176
          end
          object cbItemPesquisa: TcxLookupComboBox
            Left = 135
            Top = 20
            RepositoryItem = dmLookup.repLcbItem
            Properties.ListColumns = <>
            TabOrder = 4
            Visible = False
            Width = 177
          end
          object cbPesquisaPessoa: TcxLookupComboBox
            Left = 136
            Top = 20
            RepositoryItem = dmLookup.repLcbPessoa
            Properties.ListColumns = <>
            TabOrder = 6
            Visible = False
            Width = 174
          end
        end
        inherited pnBotoes: TPanel
          Width = 563
          ExplicitWidth = 563
          inherited btnUtilizar: TButton
            Left = 409
            TabOrder = 4
            ExplicitLeft = 409
          end
          object btnGerarContaReceber: TButton
            AlignWithMargins = True
            Left = 290
            Top = 1
            Width = 117
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 2
            Margins.Bottom = 1
            Action = Ac_Gerar_Conta_Receber
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 3
            WordWrap = True
          end
          object btnGerarSaida: TButton
            AlignWithMargins = True
            Left = 188
            Top = 1
            Width = 100
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 2
            Margins.Bottom = 1
            Action = Ac_Gerar_Saida
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 2
            WordWrap = True
          end
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Options.Editing = False
              Width = 37
            end
            object viewRegistrosID_CLIENTE: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ID_CLIENTE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_PESSOA_VENDEU: TcxGridDBColumn [2]
              DataBinding.FieldName = 'ID_PESSOA_VENDEU'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosCLIENTE: TcxGridDBColumn [3]
              DataBinding.FieldName = 'CLIENTE'
              Options.Editing = False
              Width = 351
            end
            object viewRegistrosDATA: TcxGridDBColumn [4]
              DataBinding.FieldName = 'DATA'
              Options.Editing = False
              Width = 88
            end
            object viewRegistrosVALOR_TOTAL: TcxGridDBColumn [5]
              DataBinding.FieldName = 'VALOR_TOTAL'
              Options.Editing = False
              Width = 150
            end
            object viewRegistrosDESCRICAO: TcxGridDBColumn [6]
              DataBinding.FieldName = 'DESCRICAO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosVENDEDOR: TcxGridDBColumn [7]
              DataBinding.FieldName = 'VENDEDOR'
              Options.Editing = False
              Width = 167
            end
            object viewRegistrosSAIU_ESTOQUE: TcxGridDBColumn [8]
              DataBinding.FieldName = 'SAIU_ESTOQUE'
              RepositoryItem = dmLookup.RepIcbNaoSim
              OnCustomDrawCell = viewRegistrosGEROU_CONTA_RECEBERCustomDrawCell
              Options.Editing = False
              Width = 94
            end
            object viewRegistrosGEROU_CONTA_RECEBER: TcxGridDBColumn [9]
              DataBinding.FieldName = 'GEROU_CONTA_RECEBER'
              RepositoryItem = dmLookup.RepIcbNaoSim
              OnCustomDrawCell = viewRegistrosGEROU_CONTA_RECEBERCustomDrawCell
              Options.Editing = False
              Width = 118
            end
            object ColumnImprimirRecibo: TcxGridDBColumn [10]
              Caption = 'Recibo'
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Buttons = <
                item
                  Action = Ac_Imprimir_Recibo
                  Default = True
                  Kind = bkGlyph
                end>
              Properties.Images = dmPrincipal.imgIcons_16
              Properties.ViewStyle = vsButtonsOnly
              Options.ShowEditButtons = isebAlways
            end
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              Caption = 'Itens'
              ExplicitLeft = 4
              ExplicitTop = 24
              ExplicitWidth = 964
              ExplicitHeight = 197
              inherited cxGridRegistrosDetail: TcxGrid
                inherited viewRegistrosDetail: TcxGridDBTableView
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                    Visible = False
                    Options.Editing = False
                    Width = 46
                  end
                  object viewRegistrosDetailID_VENDA: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'ID_VENDA'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailID_ITEM: TcxGridDBColumn [2]
                    DataBinding.FieldName = 'ID_ITEM'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailID_ESPECIE: TcxGridDBColumn [3]
                    DataBinding.FieldName = 'ID_ESPECIE'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailITEM: TcxGridDBColumn [4]
                    DataBinding.FieldName = 'ITEM'
                    Options.Editing = False
                    Width = 370
                  end
                  object viewRegistrosDetailESPECIE: TcxGridDBColumn [5]
                    DataBinding.FieldName = 'ESPECIE'
                    Options.Editing = False
                    Width = 150
                  end
                  object viewRegistrosDetailCALC_QTDE: TcxGridDBColumn [6]
                    DataBinding.FieldName = 'CALC_QTDE'
                    Options.Editing = False
                    Width = 116
                  end
                  object viewRegistrosDetailVALOR_UNITARIO: TcxGridDBColumn [7]
                    DataBinding.FieldName = 'VALOR_UNITARIO'
                    Options.Editing = False
                    Width = 141
                  end
                  object viewRegistrosDetailCALC_VALOR_TOTAL: TcxGridDBColumn [8]
                    DataBinding.FieldName = 'CALC_VALOR_TOTAL'
                    Width = 113
                  end
                  object viewRegistrosDetailID_LOTE_SEMENTE: TcxGridDBColumn [9]
                    DataBinding.FieldName = 'ID_LOTE_SEMENTE'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailLOTE_SEMENTE: TcxGridDBColumn [10]
                    DataBinding.FieldName = 'LOTE_SEMENTE'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailID_LOTE_MUDA: TcxGridDBColumn [11]
                    DataBinding.FieldName = 'ID_LOTE_MUDA'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailLOTE_MUDA: TcxGridDBColumn [12]
                    DataBinding.FieldName = 'LOTE_MUDA'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailUNIDADE: TcxGridDBColumn [13]
                    DataBinding.FieldName = 'UNIDADE'
                    Visible = False
                    Options.Editing = False
                  end
                  inherited ColumnExcluirDetail: TcxGridDBColumn
                    MinWidth = 40
                    Width = 40
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
        object lbl5: TLabel
          Left = 9
          Top = 8
          Width = 56
          Height = 13
          Caption = 'Cliente (F2)'
          FocusControl = cbCliente
        end
        object lbl1: TLabel
          Left = 200
          Top = 8
          Width = 46
          Height = 13
          Caption = 'Vendedor'
          FocusControl = cbVendedor
        end
        object lbl2: TLabel
          Left = 413
          Top = 8
          Width = 71
          Height = 13
          Caption = 'Data da Venda'
          FocusControl = EditDataVenda
        end
        object lbl4: TLabel
          Left = 7
          Top = 51
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = EditDescricao
        end
        object cbCliente: TcxDBLookupComboBox
          Left = 7
          Top = 24
          RepositoryItem = dmLookup.repLcbFinForCli
          DataBinding.DataField = 'ID_CLIENTE'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 0
          OnKeyDown = cbClienteKeyDown
          Width = 165
        end
        object cbVendedor: TcxDBLookupComboBox
          Left = 199
          Top = 24
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_PESSOA_VENDEU'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 2
          Width = 209
        end
        object EditDataVenda: TcxDBDateEdit
          Left = 411
          Top = 24
          RepositoryItem = dmLookup.repDateDataPadrao
          DataBinding.DataField = 'DATA'
          DataBinding.DataSource = dsMaster
          TabOrder = 3
          Width = 121
        end
        object EditDescricao: TcxDBMemo
          Left = 5
          Top = 67
          DataBinding.DataField = 'DESCRICAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 4
          Height = 62
          Width = 964
        end
        object btnAdicionarCliente: TButton
          Left = 172
          Top = 24
          Width = 22
          Height = 21
          Action = Ac_Adicionar_Cliente
          Images = dmPrincipal.imgIcons_16
          TabOrder = 1
          TabStop = False
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      inherited pnEditsCadastroDetail: TPanel
        object Label4: TLabel
          Left = 7
          Top = 8
          Width = 22
          Height = 13
          Caption = 'Item'
          FocusControl = cbItem
        end
        object lbl6: TLabel
          Left = 5
          Top = 51
          Width = 64
          Height = 13
          Caption = 'Valor Unit'#225'rio'
          FocusControl = EditValorUnitario
        end
        object Label7: TLabel
          Left = 129
          Top = 51
          Width = 56
          Height = 13
          Caption = 'Quantidade'
          FocusControl = EditQtde
        end
        object lbUnidade: TLabel
          Left = 250
          Top = 74
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
          Width = 244
        end
        object EditValorUnitario: TcxDBCurrencyEdit
          Left = 4
          Top = 67
          RepositoryItem = dmLookup.repCurPadrao
          DataBinding.DataField = 'VALOR_UNITARIO'
          DataBinding.DataSource = dsDetail
          TabOrder = 2
          Width = 121
        end
        object EditQtde: TcxDBCalcEdit
          Left = 127
          Top = 67
          RepositoryItem = dmLookup.repCalcPadrao
          DataBinding.DataField = 'QTDE'
          DataBinding.DataSource = dsDetail
          TabOrder = 3
          Width = 121
        end
        object pnEspecieLotes: TPanel
          Left = 248
          Top = 9
          Width = 572
          Height = 36
          BevelOuter = bvNone
          TabOrder = 1
          Visible = False
          object pnLoteSemente: TPanel
            Left = 185
            Top = 0
            Width = 185
            Height = 36
            Align = alLeft
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
            object lb1: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 0
              Width = 182
              Height = 13
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 2
              Align = alTop
              Caption = 'Lote de Semente'
              FocusControl = cbLoteSemente
              ExplicitWidth = 81
            end
            object cbLoteSemente: TcxDBLookupComboBox
              Left = 0
              Top = 15
              Align = alTop
              RepositoryItem = dmLookup.repLcbLoteSemente
              DataBinding.DataField = 'ID_LOTE_SEMENTE'
              DataBinding.DataSource = dsDetail
              Properties.ListColumns = <>
              Properties.ListOptions.SyncMode = True
              TabOrder = 0
              Width = 185
            end
          end
          object pnLoteMuda: TPanel
            Left = 370
            Top = 0
            Width = 185
            Height = 36
            Align = alLeft
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 2
            object Label3: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 0
              Width = 182
              Height = 13
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 2
              Align = alTop
              Caption = 'Lote de Muda'
              FocusControl = cbLoteMuda
              ExplicitWidth = 65
            end
            object cbLoteMuda: TcxDBLookupComboBox
              Left = 0
              Top = 15
              Align = alTop
              RepositoryItem = dmLookup.repLcbLoteMuda
              DataBinding.DataField = 'ID_LOTE_MUDA'
              DataBinding.DataSource = dsDetail
              Properties.ListColumns = <>
              Properties.ListOptions.SyncMode = True
              TabOrder = 0
              Width = 185
            end
          end
          object pnEspecie: TPanel
            Left = 0
            Top = 0
            Width = 185
            Height = 36
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object lb2: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 0
              Width = 182
              Height = 13
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 2
              Align = alTop
              Caption = 'Esp'#233'cie'
              FocusControl = cbEspecie
              ExplicitWidth = 36
            end
            object cbEspecie: TcxDBLookupComboBox
              Left = 0
              Top = 15
              Align = alTop
              RepositoryItem = dmLookup.repLcbEspecie
              DataBinding.DataField = 'ID_ESPECIE'
              DataBinding.DataSource = dsDetail
              Properties.ListColumns = <>
              Properties.ListOptions.SyncMode = True
              Properties.OnEditValueChanged = cbEspeciePropertiesEditValueChanged
              TabOrder = 0
              Width = 185
            end
          end
        end
      end
    end
  end
  inherited ActionList1: TActionList
    object Ac_Gerar_Conta_Receber: TAction
      Category = 'Master'
      Caption = 'Gerar Conta a Receber'
      ImageIndex = 31
      OnExecute = Ac_Gerar_Conta_ReceberExecute
      OnUpdate = Ac_Gerar_Conta_ReceberUpdate
    end
    object Ac_Gerar_Saida: TAction
      Category = 'Master'
      Caption = 'Sair do Estoque'
      ImageIndex = 26
      OnExecute = Ac_Gerar_SaidaExecute
      OnUpdate = Ac_Gerar_SaidaUpdate
    end
    object Ac_Adicionar_Cliente: TAction
      Category = 'Master'
      ImageIndex = 3
      OnExecute = Ac_Adicionar_ClienteExecute
    end
    object Ac_Imprimir_Recibo: TAction
      ImageIndex = 19
      OnExecute = Ac_Imprimir_ReciboExecute
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmEstoque.cdsVenda
    Left = 272
    Top = 232
  end
  inherited dsDetail: TDataSource
    DataSet = dmEstoque.cdsVenda_Item
  end
  object DBPipeVenda: TppDBPipeline
    DataSource = dsMaster
    UserName = 'DBPipeVenda'
    Left = 392
    Top = 192
    object DBPipeVendappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object DBPipeVendappField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID_CLIENTE'
      FieldName = 'ID_CLIENTE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object DBPipeVendappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID_PESSOA_VENDEU'
      FieldName = 'ID_PESSOA_VENDEU'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object DBPipeVendappField4: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 3
    end
    object DBPipeVendappField5: TppField
      FieldAlias = 'CLIENTE'
      FieldName = 'CLIENTE'
      FieldLength = 100
      DisplayWidth = 100
      Position = 4
    end
    object DBPipeVendappField6: TppField
      FieldAlias = 'VENDEDOR'
      FieldName = 'VENDEDOR'
      FieldLength = 100
      DisplayWidth = 100
      Position = 5
    end
    object DBPipeVendappField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_TOTAL'
      FieldName = 'VALOR_TOTAL'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 19
      Position = 6
    end
    object DBPipeVendappField8: TppField
      FieldAlias = 'CPF_CNPJ'
      FieldName = 'CPF_CNPJ'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object DBPipeVendappField9: TppField
      FieldAlias = 'CALC_VALOR_EXTENSO'
      FieldName = 'CALC_VALOR_EXTENSO'
      FieldLength = 120
      DisplayWidth = 120
      Position = 8
    end
    object DBPipeVendappField10: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 1000
      DisplayWidth = 1000
      Position = 9
    end
    object DBPipeVendappField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIU_ESTOQUE'
      FieldName = 'SAIU_ESTOQUE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object DBPipeVendappField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'GEROU_CONTA_RECEBER'
      FieldName = 'GEROU_CONTA_RECEBER'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 11
    end
    object DBPipeVendappField13: TppField
      FieldAlias = 'CALC_CLIENTE'
      FieldName = 'CALC_CLIENTE'
      FieldLength = 300
      DisplayWidth = 300
      Position = 12
    end
  end
  object DBPipeVenda_Item: TppDBPipeline
    DataSource = dsDetail
    UserName = 'DBPipeVenda_Item'
    Left = 184
    Top = 192
    object DBPipeVenda_ItemppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object DBPipeVenda_ItemppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID_VENDA'
      FieldName = 'ID_VENDA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object DBPipeVenda_ItemppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID_ITEM'
      FieldName = 'ID_ITEM'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object DBPipeVenda_ItemppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID_ESPECIE'
      FieldName = 'ID_ESPECIE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object DBPipeVenda_ItemppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 4
    end
    object DBPipeVenda_ItemppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_UNITARIO'
      FieldName = 'VALOR_UNITARIO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 5
    end
    object DBPipeVenda_ItemppField7: TppField
      FieldAlias = 'ITEM'
      FieldName = 'ITEM'
      FieldLength = 100
      DisplayWidth = 100
      Position = 6
    end
    object DBPipeVenda_ItemppField8: TppField
      FieldAlias = 'ESPECIE'
      FieldName = 'ESPECIE'
      FieldLength = 100
      DisplayWidth = 100
      Position = 7
    end
    object DBPipeVenda_ItemppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID_LOTE_SEMENTE'
      FieldName = 'ID_LOTE_SEMENTE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object DBPipeVenda_ItemppField10: TppField
      FieldAlias = 'LOTE_SEMENTE'
      FieldName = 'LOTE_SEMENTE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 9
    end
    object DBPipeVenda_ItemppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID_LOTE_MUDA'
      FieldName = 'ID_LOTE_MUDA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object DBPipeVenda_ItemppField12: TppField
      FieldAlias = 'LOTE_MUDA'
      FieldName = 'LOTE_MUDA'
      FieldLength = 100
      DisplayWidth = 100
      Position = 11
    end
    object DBPipeVenda_ItemppField13: TppField
      FieldAlias = 'UNIDADE'
      FieldName = 'UNIDADE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object DBPipeVenda_ItemppField14: TppField
      FieldAlias = 'CALC_QTDE'
      FieldName = 'CALC_QTDE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 13
    end
    object DBPipeVenda_ItemppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'CALC_VALOR_TOTAL'
      FieldName = 'CALC_VALOR_TOTAL'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 14
    end
  end
  object ppRecibo: TppReport
    AutoStop = False
    DataPipeline = DBPipeVenda_Item
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utScreenPixels
    AfterPrint = ppReciboAfterPrint
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPageWidth
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 152
    Top = 272
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'DBPipeVenda_Item'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 62442
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 13
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 5027
        mmLeft = 45508
        mmTop = 4763
        mmWidth = 99749
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'CNPJ'
        DataPipeline = DBPipeOrganizacao
        DisplayFormat = '000\.000\.0000\/00-00;0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 3969
        mmLeft = 66940
        mmTop = 13758
        mmWidth = 29369
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        Caption = 'CNPJ:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 56092
        mmTop = 13493
        mmWidth = 10054
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        Caption = 'Insc. Est.: Isento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 105040
        mmTop = 13758
        mmWidth = 24342
        BandType = 0
        LayerName = Foreground
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Border.Color = clBlue
        Pen.Color = 10485760
        Pen.Width = 3
        Weight = 2.000000000000000000
        mmHeight = 1323
        mmLeft = 13229
        mmTop = 23283
        mmWidth = 163513
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        Caption = 'Recebi de,'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 13434
        mmTop = 39926
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'ppEditCliente'
        DataField = 'CALC_CLIENTE'
        DataPipeline = DBPipeVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeVenda'
        mmHeight = 4319
        mmLeft = 30118
        mmTop = 39926
        mmWidth = 156104
        BandType = 0
        LayerName = Foreground
      end
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line2'
        Weight = 1.000000000000000000
        mmHeight = 1588
        mmLeft = 7673
        mmTop = 27517
        mmWidth = 180843
        BandType = 0
        LayerName = Foreground
      end
      object ppLine3: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line3'
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 34925
        mmLeft = 7673
        mmTop = 27517
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground
      end
      object ppLine4: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line4'
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 34925
        mmLeft = 187980
        mmTop = 27516
        mmWidth = 2381
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label8'
        Caption = 'Recibo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        FormField = False
        Transparent = True
        mmHeight = 5028
        mmLeft = 87577
        mmTop = 29367
        mmWidth = 14288
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label9'
        Caption = 'Qtd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 13889
        mmTop = 57416
        mmWidth = 5821
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label10'
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 38761
        mmTop = 57416
        mmWidth = 16404
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel11: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label101'
        Caption = 'Valor Unit'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 122633
        mmTop = 57416
        mmWidth = 23283
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel12: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label12'
        Caption = 'Valor Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 149223
        mmTop = 57416
        mmWidth = 18521
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel13: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label13'
        AutoSize = False
        Caption = 'a import'#226'ncia de '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 3705
        mmLeft = 13434
        mmTop = 45196
        mmWidth = 25242
        BandType = 0
        LayerName = Foreground
      end
      object ppEditValorDescricao: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'EditValorDescricao'
        AutoSize = True
        DataField = 'CALC_VALOR_EXTENSO'
        DataPipeline = DBPipeVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeVenda'
        mmHeight = 3618
        mmLeft = 72172
        mmTop = 45013
        mmWidth = 794
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel14: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label14'
        Caption = 'referente a venda dos itens a seguir:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4234
        mmLeft = 13434
        mmTop = 50509
        mmWidth = 55298
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel15: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label102'
        Caption = 'Esp'#233'cie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 90685
        mmTop = 57173
        mmWidth = 12964
        BandType = 0
        LayerName = Foreground
      end
      object ppLine13: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line13'
        Weight = 1.000000000000000000
        mmHeight = 529
        mmLeft = 13229
        mmTop = 55827
        mmWidth = 169863
        BandType = 0
        LayerName = Foreground
      end
      object ppLine14: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line14'
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 6615
        mmLeft = 13229
        mmTop = 55827
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground
      end
      object ppLine16: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line16'
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 6615
        mmLeft = 183092
        mmTop = 55827
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground
      end
      object ppDBImage2: TppDBImage
        DesignLayer = ppDesignLayer1
        UserName = 'DBImage2'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'LOGO_SECUNDARIA'
        DataPipeline = DBPipeOrganizacao
        GraphicType = 'AutoDetect'
        ParentDataPipeline = False
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 19579
        mmLeft = 151342
        mmTop = 2646
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground
      end
      object ppDBImage1: TppDBImage
        DesignLayer = ppDesignLayer1
        UserName = 'DBImage1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'LOGO'
        DataPipeline = DBPipeOrganizacao
        GraphicType = 'AutoDetect'
        ParentDataPipeline = False
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 19579
        mmLeft = 13179
        mmTop = 2556
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground
      end
      object ppLine29: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line29'
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 8085
        mmLeft = 37306
        mmTop = 55764
        mmWidth = 529
        BandType = 0
        LayerName = Foreground
      end
      object ppLine30: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line30'
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 8202
        mmLeft = 89523
        mmTop = 55827
        mmWidth = 529
        BandType = 0
        LayerName = Foreground
      end
      object ppLine31: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line301'
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 8202
        mmLeft = 121560
        mmTop = 55827
        mmWidth = 529
        BandType = 0
        LayerName = Foreground
      end
      object ppLine32: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line32'
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 8202
        mmLeft = 147093
        mmTop = 55827
        mmWidth = 529
        BandType = 0
        LayerName = Foreground
      end
      object ppEditValorTotal: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'EditValorTotal'
        AutoSize = True
        DataField = 'VALOR_TOTAL'
        DataPipeline = DBPipeVenda
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeVenda'
        mmHeight = 3618
        mmLeft = 39259
        mmTop = 45013
        mmWidth = 1059
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppDBText12: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText11'
        DataField = 'ITEM'
        DataPipeline = DBPipeVenda_Item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeVenda_Item'
        mmHeight = 4763
        mmLeft = 38365
        mmTop = 795
        mmWidth = 50800
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText13: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText12'
        DataField = 'CALC_QTDE'
        DataPipeline = DBPipeVenda_Item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeVenda_Item'
        mmHeight = 4763
        mmLeft = 13889
        mmTop = 795
        mmWidth = 23019
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText15: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText15'
        DataField = 'ESPECIE'
        DataPipeline = DBPipeVenda_Item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeVenda_Item'
        mmHeight = 4763
        mmLeft = 90354
        mmTop = 795
        mmWidth = 30692
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText16: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText16'
        DataField = 'VALOR_UNITARIO'
        DataPipeline = DBPipeVenda_Item
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeVenda_Item'
        mmHeight = 4763
        mmLeft = 122501
        mmTop = 795
        mmWidth = 23283
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText17: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText17'
        DataField = 'CALC_VALOR_TOTAL'
        DataPipeline = DBPipeVenda_Item
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeVenda_Item'
        mmHeight = 4763
        mmLeft = 149223
        mmTop = 795
        mmWidth = 32544
        BandType = 4
        LayerName = Foreground
      end
      object ppLine7: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line7'
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 6350
        mmLeft = 187980
        mmTop = 0
        mmWidth = 2381
        BandType = 4
        LayerName = Foreground
      end
      object ppLine8: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line8'
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 6350
        mmLeft = 7673
        mmTop = 0
        mmWidth = 2381
        BandType = 4
        LayerName = Foreground
      end
      object ppLine15: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line15'
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 5689
        mmLeft = 13229
        mmTop = 530
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground
      end
      object ppLine17: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line17'
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 6085
        mmLeft = 183078
        mmTop = 2
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground
      end
      object ppLine5: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line5'
        Weight = 1.000000000000000000
        mmHeight = 397
        mmLeft = 13229
        mmTop = 0
        mmWidth = 169863
        BandType = 4
        LayerName = Foreground
      end
      object ppLine21: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line21'
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 6085
        mmLeft = 147109
        mmTop = 0
        mmWidth = 529
        BandType = 4
        LayerName = Foreground
      end
      object ppLine22: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line22'
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 6085
        mmLeft = 121444
        mmTop = 0
        mmWidth = 529
        BandType = 4
        LayerName = Foreground
      end
      object ppLine23: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line23'
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 6085
        mmLeft = 89431
        mmTop = 0
        mmWidth = 661
        BandType = 4
        LayerName = Foreground
      end
      object ppLine24: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line24'
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 6085
        mmLeft = 37306
        mmTop = 0
        mmWidth = 529
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13228
      mmPrintPosition = 0
      object ppShape1: TppShape
        DesignLayer = ppDesignLayer1
        UserName = 'Shape1'
        mmHeight = 12700
        mmLeft = 13229
        mmTop = 265
        mmWidth = 163513
        BandType = 8
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        DataField = 'ENDERECO'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 21960
        mmTop = 1583
        mmWidth = 42069
        BandType = 8
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText6'
        DataField = 'BAIRRO'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 64822
        mmTop = 1583
        mmWidth = 29369
        BandType = 8
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText7'
        DataField = 'COMPLEMENTO'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 94456
        mmTop = 1584
        mmWidth = 46831
        BandType = 8
        LayerName = Foreground
      end
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText8'
        DataField = 'CIDADE'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 142350
        mmTop = 1583
        mmWidth = 24077
        BandType = 8
        LayerName = Foreground
      end
      object ppDBText9: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText9'
        HyperlinkEnabled = False
        DataField = 'SITE'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 29898
        mmTop = 6611
        mmWidth = 32015
        BandType = 8
        LayerName = Foreground
      end
      object ppDBText10: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText10'
        HyperlinkEnabled = False
        DataField = 'EMAIL'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 63500
        mmTop = 6615
        mmWidth = 42069
        BandType = 8
        LayerName = Foreground
      end
      object ppDBText11: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText101'
        HyperlinkEnabled = False
        DataField = 'TELEFONE'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 124617
        mmTop = 6615
        mmWidth = 23548
        BandType = 8
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label6'
        Caption = 'Fone (Fax):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10040115
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 106363
        mmTop = 6615
        mmWidth = 17727
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 38365
      mmPrintPosition = 0
      object ppLine9: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line9'
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 35190
        mmLeft = 7673
        mmTop = 0
        mmWidth = 2381
        BandType = 7
        LayerName = Foreground
      end
      object ppLine10: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line10'
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 35190
        mmLeft = 188066
        mmTop = 0
        mmWidth = 2381
        BandType = 7
        LayerName = Foreground
      end
      object ppLine11: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line11'
        Weight = 1.000000000000000000
        mmHeight = 1588
        mmLeft = 7673
        mmTop = 34931
        mmWidth = 180843
        BandType = 7
        LayerName = Foreground
      end
      object ppLine12: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line12'
        Weight = 1.000000000000000000
        mmHeight = 1588
        mmLeft = 58208
        mmTop = 27255
        mmWidth = 73290
        BandType = 7
        LayerName = Foreground
      end
      object ppDBText14: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText13'
        DataField = 'VENDEDOR'
        DataPipeline = DBPipeVenda
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipeVenda'
        mmHeight = 4498
        mmLeft = 61648
        mmTop = 29104
        mmWidth = 65617
        BandType = 7
        LayerName = Foreground
      end
      object ppLine6: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line6'
        Weight = 1.000000000000000000
        mmHeight = 1588
        mmLeft = 13229
        mmTop = 5819
        mmWidth = 169863
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc1: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc1'
        DataField = 'CALC_VALOR_TOTAL'
        DataPipeline = DBPipeVenda_Item
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeVenda_Item'
        mmHeight = 4498
        mmLeft = 149225
        mmTop = 1058
        mmWidth = 31750
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4234
        mmLeft = 135732
        mmTop = 1058
        mmWidth = 8466
        BandType = 7
        LayerName = Foreground
      end
      object ppLine18: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line18'
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 6217
        mmLeft = 183048
        mmTop = 0
        mmWidth = 2117
        BandType = 7
        LayerName = Foreground
      end
      object ppLine19: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line19'
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 6085
        mmLeft = 13229
        mmTop = 0
        mmWidth = 2117
        BandType = 7
        LayerName = Foreground
      end
      object ppLine20: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line20'
        Weight = 1.000000000000000000
        mmHeight = 529
        mmLeft = 13229
        mmTop = 5821
        mmWidth = 169863
        BandType = 7
        LayerName = Foreground
      end
      object ppLine28: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line28'
        Position = lpLeft
        Weight = 1.000000000000000000
        mmHeight = 6085
        mmLeft = 147109
        mmTop = 0
        mmWidth = 529
        BandType = 7
        LayerName = Foreground
      end
      object ppLine33: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line201'
        Weight = 1.000000000000000000
        mmHeight = 529
        mmLeft = 13170
        mmTop = 0
        mmWidth = 169863
        BandType = 7
        LayerName = Foreground
      end
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable1'
        DisplayFormat = '"Mineiros," dd "de" MMMM "de" YYYY.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 133086
        mmTop = 15081
        mmWidth = 43921
        BandType = 7
        LayerName = Foreground
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object DBPipeOrganizacao: TppDBPipeline
    DataSource = dmLookup.dslkOrganizacao
    UserName = 'DBPipeOrganizacao'
    Left = 288
    Top = 136
    object DBPipeOrganizacaoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object DBPipeOrganizacaoppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 100
      DisplayWidth = 100
      Position = 1
    end
    object DBPipeOrganizacaoppField3: TppField
      FieldAlias = 'CNPJ'
      FieldName = 'CNPJ'
      FieldLength = 14
      DisplayWidth = 14
      Position = 2
    end
    object DBPipeOrganizacaoppField4: TppField
      FieldAlias = 'LOGO'
      FieldName = 'LOGO'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DBPipeOrganizacaoppField5: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 4
    end
    object DBPipeOrganizacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object DBPipeOrganizacaoppField7: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 6
    end
    object DBPipeOrganizacaoppField8: TppField
      FieldAlias = 'TELEFONE'
      FieldName = 'TELEFONE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object DBPipeOrganizacaoppField9: TppField
      FieldAlias = 'SITE'
      FieldName = 'SITE'
      FieldLength = 100
      DisplayWidth = 100
      Position = 8
    end
    object DBPipeOrganizacaoppField10: TppField
      FieldAlias = 'EMAIL'
      FieldName = 'EMAIL'
      FieldLength = 100
      DisplayWidth = 100
      Position = 9
    end
    object DBPipeOrganizacaoppField11: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 120
      DisplayWidth = 120
      Position = 10
    end
    object DBPipeOrganizacaoppField12: TppField
      FieldAlias = 'LOGO_SECUNDARIA'
      FieldName = 'LOGO_SECUNDARIA'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 11
      Searchable = False
      Sortable = False
    end
  end
end
