inherited frmRelatorioFinanceiro: TfrmRelatorioFinanceiro
  Caption = 'Relat'#243'rios Financeiros'
  ExplicitTop = -191
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBotoes: TPanel
    ExplicitTop = 54
    ExplicitHeight = 627
  end
  inherited pnConfiguracoes: TPanel
    ExplicitTop = 54
    ExplicitHeight = 627
    object pcPrincipal: TcxPageControl
      Left = 0
      Top = 0
      Width = 855
      Height = 627
      Align = alClient
      TabOrder = 0
      TabStop = False
      Properties.ActivePage = tabSaldos
      Properties.CustomButtons.Buttons = <>
      ExplicitLeft = 32
      ExplicitTop = 1
      ClientRectBottom = 622
      ClientRectLeft = 2
      ClientRectRight = 850
      ClientRectTop = 25
      object tabSaldos: TcxTabSheet
        Caption = 'Saldos'
        ImageIndex = 0
        ExplicitLeft = 3
        ExplicitTop = 27
        object cbProjetoSaldo: TcxLookupComboBox
          Left = 4
          Top = 9
          RepositoryItem = dmLookup.repLcbProjeto
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 225
        end
        object chkTodosProjetosSaldo: TcxCheckBox
          Left = 229
          Top = 10
          Caption = 'Todos'
          Properties.OnEditValueChanged = chkSaldoTodosProjetoPropertiesEditValueChanged
          TabOrder = 1
          Transparent = True
          Width = 69
        end
        object chkTodosFundoSaldos: TcxCheckBox
          Left = 229
          Top = 36
          Caption = 'Todos'
          Properties.OnEditValueChanged = chkSaldoTodosFundoPropertiesEditValueChanged
          TabOrder = 2
          Transparent = True
          Width = 69
        end
        object cbFundoSaldo: TcxLookupComboBox
          Left = 4
          Top = 35
          RepositoryItem = dmLookup.repLcbFundo
          Properties.ListColumns = <>
          TabOrder = 3
          Width = 225
        end
      end
      object tabMovimentacao: TcxTabSheet
        Caption = 'Movimenta'#231#227'o Financeira'
        ImageIndex = 2
        object Label3: TLabel
          Left = 7
          Top = 5
          Width = 35
          Height = 13
          Caption = 'Projeto'
        end
        object cgbData: TdxCheckGroupBox
          Left = 4
          Top = 68
          Caption = 'Filtrar por Data'
          TabOrder = 0
          Height = 61
          Width = 280
          object lbDataInicial: TLabel
            Left = 6
            Top = 17
            Width = 53
            Height = 13
            Caption = 'Data Inicial'
          end
          object Label1: TLabel
            Left = 143
            Top = 17
            Width = 48
            Height = 13
            Caption = 'Data Final'
          end
          object EditDataFinal: TcxDateEdit
            Left = 140
            Top = 30
            TabOrder = 0
            Width = 135
          end
          object EditDataInicial: TcxDateEdit
            Left = 3
            Top = 30
            TabOrder = 1
            Width = 135
          end
        end
        object cbProjetoMovimentacao: TcxLookupComboBox
          Left = 4
          Top = 21
          RepositoryItem = dmLookup.repLcbProjeto
          Properties.ListColumns = <>
          TabOrder = 1
          Width = 280
        end
        object chkTodosProjetosMovimentacao: TcxCheckBox
          Left = 283
          Top = 23
          Caption = 'Todos'
          Properties.OnEditValueChanged = chkTodosSaldosProjetosPropertiesEditValueChanged
          TabOrder = 2
          Transparent = True
          Width = 69
        end
        object cbFundoMovimentacao: TcxLookupComboBox
          Left = 4
          Top = 44
          RepositoryItem = dmLookup.repLcbFundo
          Properties.ListColumns = <>
          TabOrder = 3
          Width = 280
        end
        object chkTodosFundoMovimentacao: TcxCheckBox
          Left = 283
          Top = 45
          Caption = 'Todos'
          Properties.OnEditValueChanged = chkTodosFundoMovimentacaoPropertiesEditValueChanged
          TabOrder = 4
          Transparent = True
          Width = 69
        end
      end
      object tabSaldoDetalhado: TcxTabSheet
        Caption = 'Saldo Detalhado'
        ImageIndex = 1
        object lb3: TLabel
          Left = 6
          Top = 3
          Width = 69
          Height = 13
          Caption = 'Projeto/Fundo'
        end
        object cbProjetoSaldoDetalhado: TcxLookupComboBox
          Left = 4
          Top = 20
          RepositoryItem = dmLookup.repLcbProjeto
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 280
        end
      end
    end
  end
  inherited pnOrganizacao: TPanel
    ExplicitWidth = 981
    inherited chkTodasOrganizacoes: TcxCheckBox
      ExplicitHeight = 19
    end
  end
  inherited ActionList: TActionList
    Left = 416
    Top = 208
  end
  object ppSaldoProjeto: TppReport [4]
    AutoStop = False
    DataPipeline = DBPipeSaldoProjeto
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
    Units = utMillimeters
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
    Left = 408
    Top = 312
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'DBPipeSaldoProjeto'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 32015
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        Caption = 'Saldo Geral Por Projeto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 71173
        mmTop = 17198
        mmWidth = 47096
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Or'#231'amento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4763
        mmLeft = 49746
        mmTop = 26194
        mmWidth = 28046
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Valor Recebido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4763
        mmLeft = 79114
        mmTop = 26194
        mmWidth = 28046
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Valor Gasto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4763
        mmLeft = 109012
        mmTop = 26194
        mmWidth = 28046
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Saldo Previsto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4763
        mmLeft = 139175
        mmTop = 26194
        mmWidth = 28046
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Saldo Real'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4763
        mmLeft = 168279
        mmTop = 26194
        mmWidth = 28046
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
        mmHeight = 21431
        mmLeft = 1588
        mmTop = 794
        mmWidth = 30692
        BandType = 0
        LayerName = Foreground
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 1852
        mmTop = 23813
        mmWidth = 195527
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable1: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 182562
        mmTop = 14552
        mmWidth = 14287
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Projeto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4763
        mmLeft = 1852
        mmTop = 26194
        mmWidth = 28046
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable3: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable3'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 185209
        mmTop = 18521
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        DataField = 'ORCAMENTO'
        DataPipeline = DBPipeSaldoProjeto
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeSaldoProjeto'
        mmHeight = 4763
        mmLeft = 49746
        mmTop = 0
        mmWidth = 28046
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        DataField = 'VALOR_RECEBIDO'
        DataPipeline = DBPipeSaldoProjeto
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeSaldoProjeto'
        mmHeight = 4763
        mmLeft = 79114
        mmTop = 0
        mmWidth = 28046
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText4'
        DataField = 'VALOR_GASTO'
        DataPipeline = DBPipeSaldoProjeto
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeSaldoProjeto'
        mmHeight = 4763
        mmLeft = 109012
        mmTop = 0
        mmWidth = 28046
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        DataField = 'SALDO_PREVISTO'
        DataPipeline = DBPipeSaldoProjeto
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeSaldoProjeto'
        mmHeight = 4763
        mmLeft = 139175
        mmTop = 0
        mmWidth = 28046
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText6'
        DataField = 'SALDO_REAL'
        DataPipeline = DBPipeSaldoProjeto
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeSaldoProjeto'
        mmHeight = 4763
        mmLeft = 168279
        mmTop = 0
        mmWidth = 28046
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText8'
        DataField = 'NOME'
        DataPipeline = DBPipeSaldoProjeto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeSaldoProjeto'
        mmHeight = 4763
        mmLeft = 2117
        mmTop = 0
        mmWidth = 44450
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLabel2: TppLabel
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
        mmLeft = 81227
        mmTop = 794
        mmWidth = 7409
        BandType = 8
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText7'
        DataField = 'CNPJ'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 89435
        mmTop = 265
        mmWidth = 41275
        BandType = 8
        LayerName = Foreground
      end
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        DataField = 'NOME'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 2111
        mmTop = 0
        mmWidth = 76994
        BandType = 8
        LayerName = Foreground
      end
      object ppSystemVariable2: TppSystemVariable
        DesignLayer = ppDesignLayer1
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 193146
        mmTop = 529
        mmWidth = 1588
        BandType = 8
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
  object dsSaldoProjeto: TDataSource [5]
    DataSet = dmRelatorio.cdsSaldoProjeto
    Left = 488
    Top = 344
  end
  object DBPipeSaldoProjeto: TppDBPipeline [6]
    DataSource = dsSaldoProjeto
    UserName = 'DBPipeSaldoProjeto'
    Left = 184
    Top = 248
    object DBPipeSaldoProjetoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object DBPipeSaldoProjetoppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 100
      DisplayWidth = 100
      Position = 1
    end
    object DBPipeSaldoProjetoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORCAMENTO'
      FieldName = 'ORCAMENTO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 2
    end
    object DBPipeSaldoProjetoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_RECEBIDO'
      FieldName = 'VALOR_RECEBIDO'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 19
      Position = 3
    end
    object DBPipeSaldoProjetoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_GASTO'
      FieldName = 'VALOR_GASTO'
      FieldLength = 6
      DataType = dtDouble
      DisplayWidth = 19
      Position = 4
    end
    object DBPipeSaldoProjetoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO_REAL'
      FieldName = 'SALDO_REAL'
      FieldLength = 6
      DataType = dtDouble
      DisplayWidth = 19
      Position = 5
    end
    object DBPipeSaldoProjetoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO_PREVISTO'
      FieldName = 'SALDO_PREVISTO'
      FieldLength = 6
      DataType = dtDouble
      DisplayWidth = 19
      Position = 6
    end
  end
  inherited dsOrganizacao: TDataSource
    Left = 576
    Top = 216
  end
  object DBPipeOrganizacao: TppDBPipeline
    DataSource = dmLookup.dslkOrganizacao
    UserName = 'DBPipeOrganizacao'
    Left = 288
    Top = 240
    object DBPipeOrganizacaoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
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
  end
  object ppSaldoDetalhado: TppReport
    AutoStop = False
    DataPipeline = DBPipeSaldoDetalhado
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
    Units = utMillimeters
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
    Left = 496
    Top = 144
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'DBPipeSaldoDetalhado'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 26458
      mmPrintPosition = 0
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label1'
        Caption = 'Saldo Detalhado: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 43392
        mmTop = 17198
        mmWidth = 35983
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBImage2: TppDBImage
        DesignLayer = ppDesignLayer2
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
        mmTop = 794
        mmWidth = 30692
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 1852
        mmTop = 23813
        mmWidth = 195527
        BandType = 0
        LayerName = Foreground1
      end
      object ppSystemVariable4: TppSystemVariable
        DesignLayer = ppDesignLayer2
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 182562
        mmTop = 14552
        mmWidth = 14287
        BandType = 0
        LayerName = Foreground1
      end
      object ppSystemVariable5: TppSystemVariable
        DesignLayer = ppDesignLayer2
        UserName = 'SystemVariable3'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 185209
        mmTop = 18521
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground1
      end
      object ppDBText14: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText14'
        DataField = 'PROJETO_FUNDO'
        DataPipeline = DBPipeSaldoDetalhado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeSaldoDetalhado'
        mmHeight = 4763
        mmLeft = 81227
        mmTop = 17198
        mmWidth = 89165
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText13: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText6'
        DataField = 'VALOR'
        DataPipeline = DBPipeSaldoDetalhado
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeSaldoDetalhado'
        mmHeight = 4763
        mmLeft = 168279
        mmTop = 0
        mmWidth = 28046
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText9: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText9'
        DataField = 'DATA'
        DataPipeline = DBPipeSaldoDetalhado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeSaldoDetalhado'
        mmHeight = 4763
        mmLeft = 139171
        mmTop = 0
        mmWidth = 28046
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText10: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText10'
        DataField = 'ORIGEM'
        DataPipeline = DBPipeSaldoDetalhado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeSaldoDetalhado'
        mmHeight = 4763
        mmLeft = 70910
        mmTop = 0
        mmWidth = 66411
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText11: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText11'
        DataField = 'DESCRICAO'
        DataPipeline = DBPipeSaldoDetalhado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeSaldoDetalhado'
        mmHeight = 4763
        mmLeft = 1588
        mmTop = 0
        mmWidth = 68263
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLabel16: TppLabel
        DesignLayer = ppDesignLayer2
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
        mmLeft = 81227
        mmTop = 794
        mmWidth = 7409
        BandType = 8
        LayerName = Foreground1
      end
      object ppDBText15: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText7'
        DataField = 'CNPJ'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 89435
        mmTop = 265
        mmWidth = 41275
        BandType = 8
        LayerName = Foreground1
      end
      object ppDBText16: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText1'
        DataField = 'NOME'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 2111
        mmTop = 0
        mmWidth = 76994
        BandType = 8
        LayerName = Foreground1
      end
      object ppSystemVariable6: TppSystemVariable
        DesignLayer = ppDesignLayer2
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 193146
        mmTop = 529
        mmWidth = 1588
        BandType = 8
        LayerName = Foreground1
      end
    end
    object GrupoTipo: TppGroup
      BreakName = 'TIPO'
      DataPipeline = DBPipeSaldoDetalhado
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'GrupoTipo'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'DBPipeSaldoDetalhado'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 11113
        mmPrintPosition = 0
        object ppDBText17: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText17'
          DataField = 'TIPO'
          DataPipeline = DBPipeSaldoDetalhado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'DBPipeSaldoDetalhado'
          mmHeight = 4763
          mmLeft = 1588
          mmTop = 794
          mmWidth = 46038
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel10: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 4763
          mmLeft = 1852
          mmTop = 6348
          mmWidth = 45773
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel11: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Financiador/Fornecedor/Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 4763
          mmLeft = 70910
          mmTop = 6348
          mmWidth = 66411
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel12: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 4763
          mmLeft = 168275
          mmTop = 6348
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel13: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 4763
          mmLeft = 139171
          mmTop = 6348
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLabel14: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label14'
          AutoSize = False
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 4763
          mmLeft = 139171
          mmTop = 1325
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBCalc1: TppDBCalc
          DesignLayer = ppDesignLayer2
          UserName = 'DBCalc1'
          DataField = 'VALOR'
          DataPipeline = DBPipeSaldoDetalhado
          DisplayFormat = '$ ,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = GrupoTipo
          Transparent = True
          DataPipelineName = 'DBPipeSaldoDetalhado'
          mmHeight = 4498
          mmLeft = 168275
          mmTop = 1325
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLine3: TppLine
          DesignLayer = ppDesignLayer2
          UserName = 'Line2'
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 1853
          mmTop = 524
          mmWidth = 194469
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
      end
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object DBPipeSaldoDetalhado: TppDBPipeline
    DataSource = dsSaldoDetalhado
    UserName = 'DBPipeSaldoDetalhado'
    Left = 416
    Top = 240
    object DBPipeSaldoDetalhadoppField1: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 7
      DisplayWidth = 7
      Position = 0
    end
    object DBPipeSaldoDetalhadoppField2: TppField
      FieldAlias = 'ORIGEM'
      FieldName = 'ORIGEM'
      FieldLength = 100
      DisplayWidth = 100
      Position = 1
    end
    object DBPipeSaldoDetalhadoppField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 2
    end
    object DBPipeSaldoDetalhadoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 3
    end
    object DBPipeSaldoDetalhadoppField5: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 4
    end
    object DBPipeSaldoDetalhadoppField6: TppField
      FieldAlias = 'PROJETO_FUNDO'
      FieldName = 'PROJETO_FUNDO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 5
    end
  end
  object dsSaldoDetalhado: TDataSource
    DataSet = dmRelatorio.cdsSaldoDetalhado
    Left = 536
    Top = 280
  end
  object cdsMovimentacao: TRFClientDataSet
    Aggregates = <>
    Params = <>
    RFApplyAutomatico = False
    Left = 848
    Top = 168
    object cdsMovimentacaoID_MOVIMENTACAO: TIntegerField
      FieldName = 'ID_MOVIMENTACAO'
      ProviderFlags = []
    end
    object cdsMovimentacaoID_ORGANIZACAO: TIntegerField
      FieldName = 'ID_ORGANIZACAO'
      ProviderFlags = []
    end
    object cdsMovimentacaoNOME_ORGANIZACAO: TStringField
      FieldName = 'NOME_ORGANIZACAO'
      ProviderFlags = []
      Size = 100
    end
    object cdsMovimentacaoTIPO_ORIGEM_RECURSO: TIntegerField
      FieldName = 'TIPO_ORIGEM_RECURSO'
      ProviderFlags = []
    end
    object cdsMovimentacaoID_ORIGEM_RECURSO: TIntegerField
      FieldName = 'ID_ORIGEM_RECURSO'
      ProviderFlags = []
    end
    object cdsMovimentacaoORIGEM_RECURSO: TStringField
      FieldName = 'ORIGEM_RECURSO'
      ProviderFlags = []
      Size = 100
    end
    object cdsMovimentacaoTIPO: TIntegerField
      FieldName = 'TIPO'
      ProviderFlags = []
    end
    object cdsMovimentacaoDESCRICAO_TIPO: TStringField
      FieldName = 'DESCRICAO_TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 7
    end
    object cdsMovimentacaoDESCRICAO_MOVIMENTACAO: TStringField
      FieldName = 'DESCRICAO_MOVIMENTACAO'
      ProviderFlags = []
      Size = 100
    end
    object cdsMovimentacaoVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      ProviderFlags = []
      DisplayFormat = 'R$ ,0.00'
      Precision = 18
      Size = 2
    end
    object cdsMovimentacaoVALOR_PARCIAL: TBCDField
      FieldName = 'VALOR_PARCIAL'
      ProviderFlags = []
      DisplayFormat = 'R$ ,0.00'
      Precision = 18
      Size = 2
    end
    object cdsMovimentacaoVALOR_REAL: TBCDField
      FieldName = 'VALOR_REAL'
      ProviderFlags = []
      DisplayFormat = 'R$ ,0.00'
      Precision = 18
      Size = 2
    end
    object cdsMovimentacaoVALOR: TBCDField
      FieldName = 'VALOR'
      ProviderFlags = []
      DisplayFormat = 'R$ ,0.00'
      Size = 2
    end
    object cdsMovimentacaoSALDO_GERAL: TBCDField
      FieldName = 'SALDO_GERAL'
      ProviderFlags = []
      Size = 2
    end
  end
  object DBPipeMovimentacao: TppDBPipeline
    DataSource = dsMovimentacao
    UserName = 'DBPipeMovimentacao'
    Left = 848
    Top = 296
    object DBPipeMovimentacaoppField1: TppField
      FieldAlias = 'ID_MOVIMENTACAO'
      FieldName = 'ID_MOVIMENTACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DBPipeMovimentacaoppField2: TppField
      FieldAlias = 'ID_ORGANIZACAO'
      FieldName = 'ID_ORGANIZACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DBPipeMovimentacaoppField3: TppField
      FieldAlias = 'NOME_ORGANIZACAO'
      FieldName = 'NOME_ORGANIZACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DBPipeMovimentacaoppField4: TppField
      FieldAlias = 'TIPO_ORIGEM_RECURSO'
      FieldName = 'TIPO_ORIGEM_RECURSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DBPipeMovimentacaoppField5: TppField
      FieldAlias = 'ID_ORIGEM_RECURSO'
      FieldName = 'ID_ORIGEM_RECURSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DBPipeMovimentacaoppField6: TppField
      FieldAlias = 'ORIGEM_RECURSO'
      FieldName = 'ORIGEM_RECURSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object DBPipeMovimentacaoppField7: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object DBPipeMovimentacaoppField8: TppField
      FieldAlias = 'DESCRICAO_TIPO'
      FieldName = 'DESCRICAO_TIPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object DBPipeMovimentacaoppField9: TppField
      FieldAlias = 'DESCRICAO_MOVIMENTACAO'
      FieldName = 'DESCRICAO_MOVIMENTACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object DBPipeMovimentacaoppField10: TppField
      FieldAlias = 'VALOR_TOTAL'
      FieldName = 'VALOR_TOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object DBPipeMovimentacaoppField11: TppField
      FieldAlias = 'VALOR_PARCIAL'
      FieldName = 'VALOR_PARCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object DBPipeMovimentacaoppField12: TppField
      FieldAlias = 'VALOR_REAL'
      FieldName = 'VALOR_REAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object DBPipeMovimentacaoppField13: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object DBPipeMovimentacaoppField14: TppField
      FieldAlias = 'SALDO_GERAL'
      FieldName = 'SALDO_GERAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
  end
  object dsMovimentacao: TDataSource
    DataSet = cdsMovimentacao
    Left = 856
    Top = 232
  end
  object ppMovimentacao: TppReport
    AutoStop = False
    DataPipeline = DBPipeMovimentacao
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
    Units = utMillimeters
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
    Left = 856
    Top = 360
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'DBPipeMovimentacao'
    object ppHeaderBand3: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 30956
      mmPrintPosition = 0
      object ppLabel15: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label1'
        Caption = 'Movimenta'#231#227'o Financeira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 70908
        mmTop = 17198
        mmWidth = 51594
        BandType = 0
        LayerName = BandLayer3
      end
      object ppDBImage3: TppDBImage
        DesignLayer = ppDesignLayer3
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
        mmTop = 794
        mmWidth = 30692
        BandType = 0
        LayerName = BandLayer3
      end
      object ppLine4: TppLine
        DesignLayer = ppDesignLayer3
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 1852
        mmTop = 23813
        mmWidth = 195527
        BandType = 0
        LayerName = BandLayer3
      end
      object ppSystemVariable7: TppSystemVariable
        DesignLayer = ppDesignLayer3
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 182562
        mmTop = 14552
        mmWidth = 14287
        BandType = 0
        LayerName = BandLayer3
      end
      object ppSystemVariable8: TppSystemVariable
        DesignLayer = ppDesignLayer3
        UserName = 'SystemVariable3'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 185209
        mmTop = 18521
        mmWidth = 11113
        BandType = 0
        LayerName = BandLayer3
      end
    end
    object ppDetailBand3: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText19: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText9'
        DataField = 'VALOR'
        DataPipeline = DBPipeMovimentacao
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DBPipeMovimentacao'
        mmHeight = 4763
        mmLeft = 148696
        mmTop = 0
        mmWidth = 46038
        BandType = 4
        LayerName = BandLayer3
      end
      object ppDBText12: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText101'
        DataField = 'DESCRICAO_MOVIMENTACAO'
        DataPipeline = DBPipeMovimentacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeMovimentacao'
        mmHeight = 4763
        mmLeft = 42333
        mmTop = 0
        mmWidth = 67469
        BandType = 4
        LayerName = BandLayer3
      end
      object ppDBText21: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText21'
        DataField = 'VALOR_REAL'
        DataPipeline = DBPipeMovimentacao
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeMovimentacao'
        mmHeight = 4763
        mmLeft = 111390
        mmTop = 0
        mmWidth = 35454
        BandType = 4
        LayerName = BandLayer3
      end
      object ppDBText27: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText27'
        DataField = 'ORIGEM_RECURSO'
        DataPipeline = DBPipeMovimentacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeMovimentacao'
        mmHeight = 4763
        mmLeft = 5024
        mmTop = 0
        mmWidth = 35986
        BandType = 4
        LayerName = BandLayer3
      end
    end
    object ppFooterBand3: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLabel17: TppLabel
        DesignLayer = ppDesignLayer3
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
        mmLeft = 81227
        mmTop = 794
        mmWidth = 7409
        BandType = 8
        LayerName = BandLayer3
      end
      object ppDBText22: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText7'
        DataField = 'CNPJ'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 89435
        mmTop = 265
        mmWidth = 41275
        BandType = 8
        LayerName = BandLayer3
      end
      object ppDBText23: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText1'
        DataField = 'NOME'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 2111
        mmTop = 0
        mmWidth = 76994
        BandType = 8
        LayerName = BandLayer3
      end
      object ppSystemVariable9: TppSystemVariable
        DesignLayer = ppDesignLayer3
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 193146
        mmTop = 529
        mmWidth = 1588
        BandType = 8
        LayerName = BandLayer3
      end
    end
    object ppGroupOrganizacao: TppGroup
      BreakName = 'ID_ORGANIZACAO'
      DataPipeline = DBPipeMovimentacao
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      StartOnOddPage = False
      UserName = 'GroupOrganizacao'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'DBPipeMovimentacao'
      NewFile = False
      object ppGroupHeaderBand2: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppShape1: TppShape
          DesignLayer = ppDesignLayer3
          UserName = 'Shape1'
          Brush.Color = clGray
          mmHeight = 4763
          mmLeft = 1852
          mmTop = 529
          mmWidth = 194998
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer3
        end
        object ppDBText18: TppDBText
          DesignLayer = ppDesignLayer3
          UserName = 'DBText18'
          DataField = 'NOME_ORGANIZACAO'
          DataPipeline = DBPipeMovimentacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'DBPipeMovimentacao'
          mmHeight = 4763
          mmLeft = 2118
          mmTop = 529
          mmWidth = 193146
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer3
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppShape2: TppShape
          DesignLayer = ppDesignLayer3
          UserName = 'Shape2'
          Brush.Color = clGray
          mmHeight = 4763
          mmLeft = 139700
          mmTop = 0
          mmWidth = 57150
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer3
        end
        object ppLabel19: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label19'
          Caption = 'Saldo Geral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 141552
          mmTop = 0
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer3
        end
        object ppDBText20: TppDBText
          DesignLayer = ppDesignLayer3
          UserName = 'DBText20'
          DataField = 'SALDO_GERAL'
          DataPipeline = DBPipeMovimentacao
          DisplayFormat = '$ ,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'DBPipeMovimentacao'
          mmHeight = 4763
          mmLeft = 166688
          mmTop = 530
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer3
        end
      end
    end
    object ppGroupTipo: TppGroup
      BreakName = 'TIPO'
      DataPipeline = DBPipeMovimentacao
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      StartOnOddPage = False
      UserName = 'GroupTipo'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'DBPipeMovimentacao'
      NewFile = False
      object ppGroupHeaderBand4: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 9525
        mmPrintPosition = 0
        object ShapeRecDesp: TppShape
          DesignLayer = ppDesignLayer3
          UserName = 'ShapeRecDesp'
          Brush.Color = clMaroon
          mmHeight = 9525
          mmLeft = 4233
          mmTop = 0
          mmWidth = 192618
          BandType = 3
          GroupNo = 2
          LayerName = BandLayer3
        end
        object EditDescricaoTipo: TppDBText
          DesignLayer = ppDesignLayer3
          UserName = 'EditDescricaoTipo'
          DataField = 'DESCRICAO_TIPO'
          DataPipeline = DBPipeMovimentacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'DBPipeMovimentacao'
          mmHeight = 4763
          mmLeft = 5289
          mmTop = 794
          mmWidth = 69056
          BandType = 3
          GroupNo = 2
          LayerName = BandLayer3
        end
        object ppLabel21: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label21'
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 42333
          mmTop = 5821
          mmWidth = 14288
          BandType = 3
          GroupNo = 2
          LayerName = BandLayer3
        end
        object ppLabel20: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label20'
          Caption = 'Valor Pago/Recebido/Financiado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 148696
          mmTop = 5821
          mmWidth = 46038
          BandType = 3
          GroupNo = 2
          LayerName = BandLayer3
        end
        object ppLabel22: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label201'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 111388
          mmTop = 5821
          mmWidth = 7673
          BandType = 3
          GroupNo = 2
          LayerName = BandLayer3
        end
        object ppLabel26: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label26'
          Caption = 'Projeto/Fundo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 5556
          mmTop = 5821
          mmWidth = 20373
          BandType = 3
          GroupNo = 2
          LayerName = BandLayer3
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLabel18: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label18'
          Caption = 'Totais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 88371
          mmTop = 794
          mmWidth = 8996
          BandType = 5
          GroupNo = 2
          LayerName = BandLayer3
        end
        object ppDBCalc2: TppDBCalc
          DesignLayer = ppDesignLayer3
          UserName = 'DBCalc2'
          DataField = 'VALOR'
          DataPipeline = DBPipeMovimentacao
          DisplayFormat = '$ ,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroupTipo
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'DBPipeMovimentacao'
          mmHeight = 4498
          mmLeft = 148696
          mmTop = 794
          mmWidth = 46038
          BandType = 5
          GroupNo = 2
          LayerName = BandLayer3
        end
        object ppDBCalc3: TppDBCalc
          DesignLayer = ppDesignLayer3
          UserName = 'DBCalc3'
          DataField = 'VALOR_REAL'
          DataPipeline = DBPipeMovimentacao
          DisplayFormat = '$ ,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroupTipo
          Transparent = True
          DataPipelineName = 'DBPipeMovimentacao'
          mmHeight = 4498
          mmLeft = 111390
          mmTop = 794
          mmWidth = 35454
          BandType = 5
          GroupNo = 2
          LayerName = BandLayer3
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650613
        5368617065526563446573704F6E5072696E740B50726F6772616D5479706507
        0B747450726F63656475726506536F7572636506B770726F6365647572652053
        68617065526563446573704F6E5072696E743B0D0A626567696E0D0A20202020
        6966204442506970654D6F76696D656E746163616F5B275449504F275D203D20
        30207468656E0D0A202020205368617065526563446573702E42727573682E43
        6F6C6F72203A3D20636C4D61726F6F6E0D0A2020656C73650D0A202020205368
        617065526563446573702E42727573682E436F6C6F72203A3D20636C47726565
        6E3B20200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060C53686170
        6552656344657370094576656E744E616D6506074F6E5072696E74074576656E
        7449440220084361726574506F730102290204000000}
    end
    object ppDesignLayers3: TppDesignLayers
      object ppDesignLayer3: TppDesignLayer
        UserName = 'BandLayer3'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList3: TppParameterList
    end
  end
  object ppSaldo: TppReport
    AutoStop = False
    DataPipeline = DBPipeSaldo
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
    Units = utMillimeters
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
    Left = 736
    Top = 368
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'DBPipeSaldo'
    object ppHeaderBand4: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 23283
      mmPrintPosition = 0
      object ppLabel23: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label1'
        Caption = 'Saldos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 89959
        mmTop = 17198
        mmWidth = 14022
        BandType = 0
        LayerName = BandLayer4
      end
      object ppDBImage4: TppDBImage
        DesignLayer = ppDesignLayer4
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
        mmTop = 794
        mmWidth = 30692
        BandType = 0
        LayerName = BandLayer4
      end
      object ppSystemVariable10: TppSystemVariable
        DesignLayer = ppDesignLayer4
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 182562
        mmTop = 14552
        mmWidth = 14287
        BandType = 0
        LayerName = BandLayer4
      end
      object ppSystemVariable11: TppSystemVariable
        DesignLayer = ppDesignLayer4
        UserName = 'SystemVariable3'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 185209
        mmTop = 18521
        mmWidth = 11113
        BandType = 0
        LayerName = BandLayer4
      end
    end
    object ppDetailBand4: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText25: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText9'
        DataField = 'SALDO'
        DataPipeline = DBPipeSaldo
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DBPipeSaldo'
        mmHeight = 4763
        mmLeft = 148696
        mmTop = 0
        mmWidth = 46038
        BandType = 4
        LayerName = BandLayer4
      end
      object ppDBText26: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText101'
        DataField = 'NOME_PROJETO_FUNDO'
        DataPipeline = DBPipeSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeSaldo'
        mmHeight = 4763
        mmLeft = 3175
        mmTop = 0
        mmWidth = 142346
        BandType = 4
        LayerName = BandLayer4
      end
    end
    object ppFooterBand4: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLabel24: TppLabel
        DesignLayer = ppDesignLayer4
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
        mmLeft = 81227
        mmTop = 794
        mmWidth = 7409
        BandType = 8
        LayerName = BandLayer4
      end
      object ppDBText28: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText7'
        DataField = 'CNPJ'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 89435
        mmTop = 265
        mmWidth = 41275
        BandType = 8
        LayerName = BandLayer4
      end
      object ppDBText29: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText1'
        DataField = 'NOME'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4498
        mmLeft = 2111
        mmTop = 0
        mmWidth = 76994
        BandType = 8
        LayerName = BandLayer4
      end
      object ppSystemVariable12: TppSystemVariable
        DesignLayer = ppDesignLayer4
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 193146
        mmTop = 529
        mmWidth = 1588
        BandType = 8
        LayerName = BandLayer4
      end
    end
    object GrupoOrganizacao: TppGroup
      BreakName = 'ID_ORGANIZACAO'
      DataPipeline = DBPipeSaldo
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      StartOnOddPage = False
      UserName = 'GroupOrganizacao'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'DBPipeSaldo'
      NewFile = False
      object ppGroupHeaderBand5: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppShape3: TppShape
          DesignLayer = ppDesignLayer4
          UserName = 'Shape1'
          Brush.Color = clGray
          mmHeight = 4763
          mmLeft = 1852
          mmTop = 529
          mmWidth = 194998
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer4
        end
        object ppDBText30: TppDBText
          DesignLayer = ppDesignLayer4
          UserName = 'DBText18'
          DataField = 'NOME_ORGANIZACAO'
          DataPipeline = DBPipeSaldo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'DBPipeSaldo'
          mmHeight = 4763
          mmLeft = 2118
          mmTop = 529
          mmWidth = 193146
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer4
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppShape4: TppShape
          DesignLayer = ppDesignLayer4
          UserName = 'Shape2'
          Brush.Color = clGray
          mmHeight = 4763
          mmLeft = 139700
          mmTop = 0
          mmWidth = 57150
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer4
        end
        object ppLabel25: TppLabel
          DesignLayer = ppDesignLayer4
          UserName = 'Label19'
          Caption = 'Saldo Geral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 141552
          mmTop = 0
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer4
        end
        object ppDBCalc4: TppDBCalc
          DesignLayer = ppDesignLayer4
          UserName = 'DBCalc4'
          DataField = 'SALDO'
          DataPipeline = DBPipeSaldo
          DisplayFormat = '$ ,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = GrupoOrganizacao
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'DBPipeSaldo'
          mmHeight = 4498
          mmLeft = 165894
          mmTop = 0
          mmWidth = 29369
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer4
        end
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {00}
    end
    object ppDesignLayers4: TppDesignLayers
      object ppDesignLayer4: TppDesignLayer
        UserName = 'BandLayer4'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList4: TppParameterList
    end
  end
  object cdsSaldo: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_ORGANIZACAO'
    Params = <>
    Left = 712
    Top = 168
    object cdsSaldoID_ORGANIZACAO: TIntegerField
      FieldName = 'ID_ORGANIZACAO'
      ProviderFlags = []
    end
    object cdsSaldoNOME_ORGANIZACAO: TStringField
      FieldName = 'NOME_ORGANIZACAO'
      ProviderFlags = []
      Size = 100
    end
    object cdsSaldoID_PROJETO_FUNDO: TIntegerField
      FieldName = 'ID_PROJETO_FUNDO'
      ProviderFlags = []
    end
    object cdsSaldoNOME_PROJETO_FUNDO: TStringField
      FieldName = 'NOME_PROJETO_FUNDO'
      ProviderFlags = []
      Size = 100
    end
    object cdsSaldoSALDO: TBCDField
      FieldName = 'SALDO'
      ProviderFlags = []
    end
    object cdsSaldoSALDO_GERAL: TBCDField
      FieldName = 'SALDO_GERAL'
      ProviderFlags = []
    end
    object cdsSaldoTIPO_ORIGEM: TIntegerField
      FieldName = 'TIPO_ORIGEM'
    end
  end
  object DBPipeSaldo: TppDBPipeline
    DataSource = dsSaldo
    UserName = 'DBPipeSaldo'
    Left = 728
    Top = 304
    object DBPipeSaldoppField1: TppField
      FieldAlias = 'ID_ORGANIZACAO'
      FieldName = 'ID_ORGANIZACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DBPipeSaldoppField2: TppField
      FieldAlias = 'NOME_ORGANIZACAO'
      FieldName = 'NOME_ORGANIZACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DBPipeSaldoppField3: TppField
      FieldAlias = 'ID_PROJETO_FUNDO'
      FieldName = 'ID_PROJETO_FUNDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DBPipeSaldoppField4: TppField
      FieldAlias = 'NOME_PROJETO_FUNDO'
      FieldName = 'NOME_PROJETO_FUNDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DBPipeSaldoppField5: TppField
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DBPipeSaldoppField6: TppField
      FieldAlias = 'SALDO_GERAL'
      FieldName = 'SALDO_GERAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object dsSaldo: TDataSource
    DataSet = cdsSaldo
    Left = 720
    Top = 248
  end
end
