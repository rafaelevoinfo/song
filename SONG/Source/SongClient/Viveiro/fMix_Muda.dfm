inherited frmMixMuda: TfrmMixMuda
  ActiveControl = btnIncluir
  Caption = 'Mix de Mudas'
  ClientHeight = 611
  ExplicitWidth = 1000
  ExplicitHeight = 650
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Height = 611
    Properties.ActivePage = tabPesquisa
    ExplicitHeight = 611
    ClientRectBottom = 607
    inherited tabPesquisa: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 583
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
                Description = 'Data'
                Value = 4
              end>
            ExplicitLeft = 2
          end
          inherited btnPesquisar: TButton
            Left = 311
            ExplicitLeft = 311
          end
          inherited rgStatus: TcxRadioGroup
            Left = 6
            Top = 41
            ExplicitLeft = 6
            ExplicitTop = 41
          end
        end
        inherited pnBotoes: TPanel
          Width = 563
          ExplicitWidth = 563
          inherited btnUtilizar: TButton
            Left = 460
            ExplicitLeft = 460
          end
          inherited btnExportarExcel: TButton
            Left = 358
            ExplicitLeft = 358
          end
          object btnGerarVenda: TButton
            AlignWithMargins = True
            Left = 186
            Top = 1
            Width = 85
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Action = Ac_Gerar_Venda
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 3
            WordWrap = True
          end
          object btnGerarSaida: TButton
            AlignWithMargins = True
            Left = 86
            Top = 1
            Width = 99
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Action = Ac_Gerar_Saida
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 4
            WordWrap = True
          end
          object btnImprimir: TButton
            AlignWithMargins = True
            Left = 272
            Top = 1
            Width = 85
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Action = Ac_Imprimir
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 5
            WordWrap = True
          end
        end
        inherited pnFiltros: TPanel
          ExplicitLeft = 1
          ExplicitTop = 43
          ExplicitWidth = 974
        end
      end
      inherited pnGrid: TPanel
        Height = 522
        ExplicitHeight = 522
        inherited cxGridRegistros: TcxGrid
          Height = 287
          ExplicitHeight = 287
          inherited viewRegistros: TcxGridDBTableView
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Options.Editing = False
              Width = 45
            end
            object viewRegistrosID_CLIENTE: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ID_CLIENTE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosCLIENTE: TcxGridDBColumn [2]
              DataBinding.FieldName = 'CLIENTE'
              Options.Editing = False
              Width = 215
            end
            object viewRegistrosID_PESSOA_RESPONSAVEL: TcxGridDBColumn [3]
              DataBinding.FieldName = 'ID_PESSOA_RESPONSAVEL'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosRESPONSAVEL: TcxGridDBColumn [4]
              DataBinding.FieldName = 'RESPONSAVEL'
              Options.Editing = False
              Width = 239
            end
            object viewRegistrosDATA: TcxGridDBColumn [5]
              DataBinding.FieldName = 'DATA'
              Options.Editing = False
              Width = 93
            end
            object viewRegistrosQTDE_MUDA: TcxGridDBColumn [6]
              DataBinding.FieldName = 'QTDE_MUDA'
              Options.Editing = False
              Width = 77
            end
            object viewRegistrosQTDE_MUDA_ROCAMBOLE: TcxGridDBColumn [7]
              DataBinding.FieldName = 'QTDE_MUDA_ROCAMBOLE'
              Options.Editing = False
              Width = 151
            end
            object ColumnSaidaVenda: TcxGridDBColumn [8]
              Caption = 'Gerou Sa'#237'da ou Venda'
              OnCustomDrawCell = ColumnSaidaVendaCustomDrawCell
              OnGetDisplayText = ColumnSaidaVendaGetDisplayText
              Options.Editing = False
              Width = 111
            end
            object viewRegistrosID_VENDA: TcxGridDBColumn [9]
              DataBinding.FieldName = 'ID_VENDA'
              Visible = False
            end
            object viewRegistrosID_SAIDA: TcxGridDBColumn [10]
              DataBinding.FieldName = 'ID_SAIDA'
              Visible = False
            end
          end
        end
        inherited cxSplitter1: TcxSplitter
          Top = 288
          ExplicitTop = 288
        end
        inherited pnDetail: TPanel
          Top = 294
          ExplicitTop = 294
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              Caption = 'Esp'#233'cies'
              ExplicitLeft = 2
              ExplicitTop = 25
              ExplicitWidth = 965
              ExplicitHeight = 195
              inherited pnBotoesDetail: TPanel
                object Label5: TLabel [0]
                  Left = 633
                  Top = 9
                  Width = 31
                  Height = 13
                  Caption = 'Lotes'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                inherited btnIncluirDetail: TButton
                  Visible = False
                end
              end
              inherited cxGridRegistrosDetail: TcxGrid
                Width = 633
                Align = alLeft
                ExplicitWidth = 633
                inherited viewRegistrosDetail: TcxGridDBTableView
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewRegistrosDetailID_ESPECIE: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'ID_ESPECIE'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailESPECIE: TcxGridDBColumn [2]
                    DataBinding.FieldName = 'ESPECIE'
                    Options.Editing = False
                    Width = 293
                  end
                  object viewRegistrosDetailNOME_CIENTIFICO: TcxGridDBColumn [3]
                    DataBinding.FieldName = 'NOME_CIENTIFICO'
                    Options.Editing = False
                    Width = 371
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
              object cxGrid1: TcxGrid
                Left = 633
                Top = 25
                Width = 332
                Height = 170
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 2
                LockedStateImageOptions.Effect = lsieDark
                LockedStateImageOptions.ShowText = True
                LockedStateImageOptions.Text = 'Pesquisando...'
                object viewLotes: TcxGridDBTableView
                  OnDblClick = viewRegistrosDetailDblClick
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
                  DataController.DataSource = dsMix_Muda_Especie_Lote
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  FilterRow.Visible = True
                  OptionsCustomize.ColumnsQuickCustomization = True
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsSelection.MultiSelect = True
                  OptionsView.NoDataToDisplayInfoText = '<Sem dados para mostrar>'
                  OptionsView.GroupByBox = False
                  object viewLotesID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewLotesID_LOTE_MUDA: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_LOTE_MUDA'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewLotesLOTE: TcxGridDBColumn
                    DataBinding.FieldName = 'LOTE'
                    Options.Editing = False
                    Width = 154
                  end
                  object viewLotesQTDE: TcxGridDBColumn
                    DataBinding.FieldName = 'QTDE'
                  end
                  object viewLotesCANTEIROS: TcxGridDBColumn
                    DataBinding.FieldName = 'CANTEIROS'
                    Options.Editing = False
                    Width = 272
                  end
                end
                object cxGridLevel2: TcxGridLevel
                  GridView = viewLotes
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
      ExplicitHeight = 583
      inherited pnEditsCadastro: TPanel
        Height = 533
        ExplicitHeight = 533
        object pnEditsCadastroSuperior: TPanel
          Left = 1
          Top = 1
          Width = 974
          Height = 168
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label3: TLabel
            Left = 3
            Top = 46
            Width = 77
            Height = 13
            Caption = 'Qtde. de Mudas'
            FocusControl = EditQtde
          end
          object Label4: TLabel
            Left = 91
            Top = 46
            Width = 102
            Height = 13
            Caption = 'Qtde. por Rocambole'
            FocusControl = EditQtdeRocambole
          end
          object lbl1: TLabel
            Left = 195
            Top = 3
            Width = 61
            Height = 13
            Caption = 'Respons'#225'vel'
            FocusControl = cbResponsavel
          end
          object lbl2: TLabel
            Left = 407
            Top = 3
            Width = 71
            Height = 13
            Caption = 'Data da Venda'
            FocusControl = EditData
          end
          object lbl4: TLabel
            Left = 3
            Top = 86
            Width = 46
            Height = 13
            Caption = 'Descri'#231#227'o'
            FocusControl = EditDescricao
          end
          object lbl5: TLabel
            Left = 3
            Top = 3
            Width = 56
            Height = 13
            Caption = 'Cliente (F2)'
            FocusControl = cbCliente
          end
          object btnAdicionarCliente: TButton
            Left = 166
            Top = 19
            Width = 22
            Height = 21
            Action = Ac_Adicionar_Cliente
            Images = dmPrincipal.imgIcons_16
            TabOrder = 1
            TabStop = False
          end
          object cbCliente: TcxDBLookupComboBox
            Left = 1
            Top = 19
            RepositoryItem = dmLookup.repLcbFinForCli
            DataBinding.DataField = 'ID_CLIENTE'
            DataBinding.DataSource = dsMaster
            Properties.ListColumns = <>
            TabOrder = 0
            Width = 165
          end
          object cbResponsavel: TcxDBLookupComboBox
            Left = 193
            Top = 19
            RepositoryItem = dmLookup.repLcbPessoa
            DataBinding.DataField = 'ID_PESSOA_RESPONSAVEL'
            DataBinding.DataSource = dsMaster
            Properties.ListColumns = <>
            TabOrder = 2
            Width = 208
          end
          object EditData: TcxDBDateEdit
            Left = 405
            Top = 19
            RepositoryItem = dmLookup.repDateDataPadrao
            DataBinding.DataField = 'DATA'
            DataBinding.DataSource = dsMaster
            TabOrder = 3
            Width = 121
          end
          object EditDescricao: TcxDBMemo
            Left = 1
            Top = 102
            DataBinding.DataField = 'DESCRICAO'
            DataBinding.DataSource = dsMaster
            TabOrder = 6
            Height = 62
            Width = 525
          end
          object EditQtde: TcxDBCalcEdit
            Left = 1
            Top = 63
            RepositoryItem = dmLookup.repCalcPadrao
            DataBinding.DataField = 'QTDE_MUDA'
            DataBinding.DataSource = dsMaster
            Properties.OnEditValueChanged = EditQtdePropertiesEditValueChanged
            TabOrder = 4
            Width = 82
          end
          object EditQtdeRocambole: TcxDBCalcEdit
            Left = 89
            Top = 63
            RepositoryItem = dmLookup.repCalcPadrao
            DataBinding.DataField = 'QTDE_MUDA_ROCAMBOLE'
            DataBinding.DataSource = dsMaster
            Properties.OnEditValueChanged = EditQtdePropertiesEditValueChanged
            TabOrder = 5
            Width = 104
          end
        end
        inline frameGrids: TframeGrids
          Left = 1
          Top = 169
          Width = 974
          Height = 363
          Align = alClient
          TabOrder = 1
          ExplicitLeft = 1
          ExplicitTop = 169
          ExplicitWidth = 974
          ExplicitHeight = 363
          inherited gpGrids: TGridPanel
            Width = 974
            Height = 344
            ControlCollection = <
              item
                Column = 0
                Control = frameGrids.cxGrid1
                Row = 0
              end
              item
                Column = 1
                Control = frameGrids.pnBotoes
                Row = 0
              end
              item
                Column = 2
                Control = frameGrids.cxGrid2
                Row = 0
              end>
            TabOrder = 1
            ExplicitWidth = 974
            ExplicitHeight = 344
            inherited cxGrid1: TcxGrid
              ExplicitWidth = 456
              ExplicitHeight = 342
            end
            inherited pnBotoes: TPanel
              ExplicitLeft = 457
              ExplicitWidth = 48
              ExplicitHeight = 342
              inherited btnAdd: TButton
                ExplicitWidth = 48
              end
              inherited btnAddTodos: TButton
                ExplicitWidth = 48
              end
              inherited btnRemover: TButton
                ExplicitWidth = 48
              end
              inherited btnRemoverTodos: TButton
                ExplicitWidth = 48
              end
            end
            inherited cxGrid2: TcxGrid
              ExplicitLeft = 505
              ExplicitWidth = 468
              ExplicitHeight = 342
              inherited viewDireita: TcxGridDBTableView
                DataController.DataSource = dsDetail
              end
            end
          end
          inherited pnLabels: TPanel
            Width = 974
            TabOrder = 0
            ExplicitWidth = 974
            inherited gpLabels: TGridPanel
              Width = 972
              ControlCollection = <
                item
                  Column = 0
                  Control = frameGrids.lbInfoGridEsquerda
                  Row = 0
                end
                item
                  Column = 2
                  Control = frameGrids.lbInfoGridDireita
                  Row = 0
                end>
              ExplicitWidth = 972
              inherited lbInfoGridEsquerda: TLabel
                Width = 229
                Caption = 'Esp'#233'cies com mudas prontas dispon'#237'veis'
                ExplicitWidth = 229
              end
              inherited lbInfoGridDireita: TLabel
                Width = 124
                Caption = 'Esp'#233'cies selecionadas'
                ExplicitLeft = 504
                ExplicitWidth = 124
              end
            end
          end
          inherited dsEsquerda: TDataSource
            DataSet = cdsLocalEspecie
            Left = 288
            Top = 88
          end
          inherited dsDireita: TDataSource
            DataSet = dmViveiro.cdsMix_Muda_Especie
            Left = 664
            Top = 64
          end
          inherited ActionListFrame: TActionList
            Left = 144
            Top = 80
          end
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 583
      inherited pnEditsCadastroDetail: TPanel
        Height = 533
        ExplicitHeight = 533
      end
    end
  end
  inherited ActionList1: TActionList
    object Ac_Adicionar_Cliente: TAction [17]
      Category = 'Master'
      ImageIndex = 3
    end
    object Ac_Gerar_Venda: TAction [18]
      Category = 'Master'
      Caption = 'Gerar Venda'
      ImageIndex = 27
      OnExecute = Ac_Gerar_VendaExecute
      OnUpdate = Ac_Gerar_SaidaUpdate
    end
    object Ac_Gerar_Saida: TAction [19]
      Category = 'Master'
      Caption = 'Gerar Sa'#237'da do Estoque'
      ImageIndex = 26
      OnExecute = Ac_Gerar_SaidaExecute
      OnUpdate = Ac_Gerar_SaidaUpdate
    end
    object Ac_Imprimir: TAction [20]
      Category = 'Master'
      Caption = 'Imprimir'
      ImageIndex = 19
      OnExecute = Ac_ImprimirExecute
      OnUpdate = Ac_ImprimirUpdate
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmViveiro.cdsMix_Muda
    Top = 128
  end
  inherited fdExportDialog: TSaveTextFileDialog
    Left = 568
    Top = 184
  end
  inherited dsDetail: TDataSource
    DataSet = dmViveiro.cdsMix_Muda_Especie
    Left = 352
    Top = 144
  end
  object cdsLocalEspecie: TClientDataSet [5]
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 216
    object cdsLocalEspecieID: TIntegerField
      DisplayLabel = 'Id da Esp'#233'cie'
      FieldName = 'ID'
      ProviderFlags = []
    end
    object cdsLocalEspecieNOME: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsLocalEspecieQTDE_MUDA_PRONTA: TIntegerField
      DisplayLabel = 'Qtde. de Muda Pronta'
      FieldName = 'QTDE_MUDA_PRONTA'
      DisplayFormat = ',0'
    end
  end
  object dsMix_Muda_Especie_Lote: TDataSource [6]
    DataSet = dmViveiro.cdsMix_Muda_Especie_Lote
    Left = 488
    Top = 312
  end
  object DBPipeOrganizacao: TppDBPipeline [7]
    DataSource = dmLookup.dslkOrganizacao
    UserName = 'DBPipeOrganizacao'
    Left = 200
    Top = 248
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
  object ppMudas: TppReport [8]
    AutoStop = False
    DataPipeline = DBPipeLotesCanteiro
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
    Left = 80
    Top = 240
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'DBPipeLotesCanteiro'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 23548
      mmPrintPosition = 0
      object ppDBImage7: TppDBImage
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
        mmHeight = 21431
        mmLeft = 1588
        mmTop = 0
        mmWidth = 30692
        BandType = 0
        LayerName = Foreground
      end
      object ppLbTituloLoteMudaVendida: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        Caption = 'Mix de Mudas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 83608
        mmTop = 16404
        mmWidth = 27517
        BandType = 0
        LayerName = Foreground
      end
      object ppDBImage1: TppDBImage
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
        mmHeight = 21431
        mmLeft = 166159
        mmTop = 0
        mmWidth = 30692
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        DataField = 'NOME'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4763
        mmLeft = 34149
        mmTop = 1368
        mmWidth = 130127
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel13: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        Caption = 'CNPJ:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 34396
        mmTop = 7144
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText15: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'CNPJ'
        DataPipeline = DBPipeOrganizacao
        DisplayFormat = '00\.000\.000\/0000\-00;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 3704
        mmLeft = 42333
        mmTop = 7144
        mmWidth = 25665
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Color = clSilver
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        DataField = 'ESPECIE'
        DataPipeline = DBPipeLotesCanteiro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLotesCanteiro'
        mmHeight = 4763
        mmLeft = 8845
        mmTop = 332
        mmWidth = 64703
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        DataField = 'QTDE_MUDA_RETIRAR'
        DataPipeline = DBPipeLotesCanteiro
        DisplayFormat = ',0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DBPipeLotesCanteiro'
        mmHeight = 4763
        mmLeft = 136524
        mmTop = 242
        mmWidth = 16597
        BandType = 4
        LayerName = Foreground
      end
      object ppShape1: TppShape
        DesignLayer = ppDesignLayer1
        UserName = 'Shape1'
        mmHeight = 4498
        mmLeft = 2072
        mmTop = 529
        mmWidth = 5556
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText4'
        DataField = 'LOTE'
        DataPipeline = DBPipeLotesCanteiro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLotesCanteiro'
        mmHeight = 4763
        mmLeft = 75655
        mmTop = 265
        mmWidth = 59652
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 1058
        mmWidth = 34660
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      NewPage = True
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppSubReportRocambole: TppSubReport
        DesignLayer = ppDesignLayer1
        UserName = 'SubReportRocambole'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'DBPipeRocamboles'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 7
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          Columns = 3
          ColumnPositions.Strings = (
            '6350'
            '72116'
            '137882')
          DataPipeline = DBPipeRocamboles
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
          Version = '16.02'
          mmColumnWidth = 65766
          DataPipelineName = 'DBPipeRocamboles'
          object ppTitleBand1: TppTitleBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 10583
            mmPrintPosition = 0
            object ppLabel4: TppLabel
              DesignLayer = ppDesignLayer2
              UserName = 'Label1'
              AutoSize = False
              Caption = 'Distribui'#231#227'o de Mudas por Rocambole'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              FormField = False
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 5532
              mmLeft = 794
              mmTop = 3296
              mmWidth = 196321
              BandType = 1
              LayerName = Foreground1
            end
          end
          object ppColumnHeaderBand1: TppColumnHeaderBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand2: TppDetailBand
            Background1.Brush.Style = bsClear
            Background2.Brush.Color = clSilver
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object ppDBText7: TppDBText
              DesignLayer = ppDesignLayer2
              UserName = 'DBText1'
              DataField = 'ESPECIE'
              DataPipeline = DBPipeRocamboles
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              VerticalAlignment = avCenter
              DataPipelineName = 'DBPipeRocamboles'
              mmHeight = 4763
              mmLeft = 2646
              mmTop = 0
              mmWidth = 42574
              BandType = 4
              LayerName = Foreground1
            end
            object ppDBText8: TppDBText
              DesignLayer = ppDesignLayer2
              UserName = 'DBText8'
              DataField = 'QTDE'
              DataPipeline = DBPipeRocamboles
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              VerticalAlignment = avCenter
              DataPipelineName = 'DBPipeRocamboles'
              mmHeight = 4763
              mmLeft = 48039
              mmTop = 0
              mmWidth = 16837
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppColumnFooterBand1: TppColumnFooterBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppSummaryBand2: TppSummaryBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppGroup2: TppGroup
            BreakName = 'ID'
            DataPipeline = DBPipeRocamboles
            GroupFileSettings.NewFile = False
            GroupFileSettings.EmailFile = False
            KeepTogether = True
            OutlineSettings.CreateNode = True
            StartOnOddPage = False
            UserName = 'Group2'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'DBPipeRocamboles'
            NewFile = False
            object ppGroupHeaderBand2: TppGroupHeaderBand
              Background.Brush.Style = bsClear
              mmBottomOffset = 0
              mmHeight = 5821
              mmPrintPosition = 0
              object ppDBText6: TppDBText
                DesignLayer = ppDesignLayer2
                UserName = 'DBText6'
                DataField = 'NOME'
                DataPipeline = DBPipeRocamboles
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                DataPipelineName = 'DBPipeRocamboles'
                mmHeight = 4763
                mmLeft = 2381
                mmTop = 1058
                mmWidth = 62538
                BandType = 3
                GroupNo = 0
                LayerName = Foreground1
              end
            end
            object ppGroupFooterBand2: TppGroupFooterBand
              Background.Brush.Style = bsClear
              HideWhenOneDetail = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
          object ppDesignLayers2: TppDesignLayers
            object ppDesignLayer2: TppDesignLayer
              UserName = 'Foreground1'
              LayerType = ltBanded
              Index = 0
            end
          end
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'ID_CANTEIRO'
      DataPipeline = DBPipeLotesCanteiro
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      PreventOrphans = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'DBPipeLotesCanteiro'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'DBText1'
          DataField = 'CANTEIRO'
          DataPipeline = DBPipeLotesCanteiro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'DBPipeLotesCanteiro'
          mmHeight = 5027
          mmLeft = 1588
          mmTop = 1058
          mmWidth = 89237
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLabel1: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label3'
          Caption = 'Esp'#233'cie'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 8776
          mmTop = 7938
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLabel2: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label4'
          Caption = 'Lote'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 75648
          mmTop = 7938
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLabel3: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label5'
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 136790
          mmTop = 7938
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
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
  object DBPipeLotesCanteiro: TppDBPipeline [9]
    DataSource = dsMix_Muda_Especie_Lote_Canteiro
    UserName = 'DBPipeLotesCanteiro'
    Left = 88
    Top = 304
    object DBPipeLotesCanteiroppField1: TppField
      FieldAlias = 'ID_CANTEIRO'
      FieldName = 'ID_CANTEIRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DBPipeLotesCanteiroppField2: TppField
      FieldAlias = 'CANTEIRO'
      FieldName = 'CANTEIRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DBPipeLotesCanteiroppField3: TppField
      FieldAlias = 'ID_ESPECIE'
      FieldName = 'ID_ESPECIE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DBPipeLotesCanteiroppField4: TppField
      FieldAlias = 'ESPECIE'
      FieldName = 'ESPECIE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DBPipeLotesCanteiroppField5: TppField
      FieldAlias = 'LOTE'
      FieldName = 'LOTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DBPipeLotesCanteiroppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE_MUDA_RETIRAR'
      FieldName = 'QTDE_MUDA_RETIRAR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 5
    end
    object DBPipeLotesCanteiroppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID_CLIENTE'
      FieldName = 'ID_CLIENTE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object DBPipeLotesCanteiroppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID_PESSOA_RESPONSAVEL'
      FieldName = 'ID_PESSOA_RESPONSAVEL'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object DBPipeLotesCanteiroppField9: TppField
      FieldAlias = 'RESPONSAVEL'
      FieldName = 'RESPONSAVEL'
      FieldLength = 100
      DisplayWidth = 100
      Position = 8
    end
    object DBPipeLotesCanteiroppField10: TppField
      FieldAlias = 'CLIENTE'
      FieldName = 'CLIENTE'
      FieldLength = 100
      DisplayWidth = 100
      Position = 9
    end
    object DBPipeLotesCanteiroppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE_MUDA'
      FieldName = 'QTDE_MUDA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object DBPipeLotesCanteiroppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE_MUDA_ROCAMBOLE'
      FieldName = 'QTDE_MUDA_ROCAMBOLE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 11
    end
  end
  object dsMix_Muda_Especie_Lote_Canteiro: TDataSource [10]
    DataSet = dmViveiro.cdsMix_Muda_Especie_Lote_Canteiro
    Left = 296
    Top = 288
  end
  object DBPipeRocamboles: TppDBPipeline
    DataSource = dsQtdeMudaRocambole
    UserName = 'DBPipeRocamboles'
    Left = 392
    Top = 224
    object DBPipeRocambolesppField1: TppField
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DBPipeRocambolesppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DBPipeRocambolesppField3: TppField
      FieldAlias = 'ID_ESPECIE'
      FieldName = 'ID_ESPECIE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DBPipeRocambolesppField4: TppField
      FieldAlias = 'ESPECIE'
      FieldName = 'ESPECIE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DBPipeRocambolesppField5: TppField
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
  object dsQtdeMudaRocambole: TDataSource
    DataSet = cdsQtdeMudaRocambole
    Left = 592
    Top = 272
  end
  object cdsQtdeMudaRocambole: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    Left = 664
    Top = 232
    object cdsQtdeMudaRocamboleID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
    end
    object cdsQtdeMudaRocamboleNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsQtdeMudaRocamboleID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      ProviderFlags = []
    end
    object cdsQtdeMudaRocamboleESPECIE: TStringField
      FieldName = 'ESPECIE'
      ProviderFlags = []
      Size = 100
    end
    object cdsQtdeMudaRocamboleQTDE: TIntegerField
      FieldName = 'QTDE'
      ProviderFlags = []
    end
  end
end
