inherited frmRelatorioFinanceiro: TfrmRelatorioFinanceiro
  Caption = 'Relat'#243'rios Financeiros'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnConfiguracoes: TPanel
    object pcPrincipal: TcxPageControl [0]
      Left = 0
      Top = 54
      Width = 855
      Height = 627
      Align = alClient
      TabOrder = 1
      TabStop = False
      Properties.ActivePage = tabSaldoDetalhado
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 622
      ClientRectLeft = 2
      ClientRectRight = 850
      ClientRectTop = 25
      object tabSaldoProjeto: TcxTabSheet
        Caption = 'Saldo Por Projeto'
        ImageIndex = 0
        object lb1: TLabel
          Left = 3
          Top = 3
          Width = 35
          Height = 13
          Caption = 'Projeto'
        end
        object cbProjetoSaldoProjeto: TcxLookupComboBox
          Left = 1
          Top = 20
          RepositoryItem = dmLookup.repLcbProjeto
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 280
        end
        object chkTodosSaldosProjetos: TcxCheckBox
          Left = 280
          Top = 22
          Caption = 'Todos'
          Properties.OnEditValueChanged = chkTodosSaldosProjetosPropertiesEditValueChanged
          TabOrder = 1
          Transparent = True
          Width = 121
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
    inherited pnOrganizacao: TPanel
      inherited lb2: TLabel
        Height = 13
        ExplicitHeight = 13
      end
    end
  end
  inherited ActionList: TActionList
    Left = 288
    Top = 152
  end
  object ppSaldoProjeto: TppReport [3]
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
    Left = 184
    Top = 112
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
  object dsSaldoProjeto: TDataSource [4]
    DataSet = dmRelatorio.cdsSaldoProjeto
    Left = 488
    Top = 344
  end
  object DBPipeSaldoProjeto: TppDBPipeline [5]
    DataSource = dsSaldoProjeto
    UserName = 'DBPipeSaldoProjeto'
    Left = 184
    Top = 232
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
    Left = 424
    Top = 112
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
end
