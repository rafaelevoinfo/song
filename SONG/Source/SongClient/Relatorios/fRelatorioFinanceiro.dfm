inherited frmRelatorioFinanceiro: TfrmRelatorioFinanceiro
  Caption = 'Relat'#243'rios Financeiros'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnConfiguracoes: TPanel
    object pcPrincipal: TcxPageControl
      Left = 0
      Top = 0
      Width = 855
      Height = 681
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = tabSaldoProjeto
      Properties.CustomButtons.Buttons = <>
      ExplicitLeft = 280
      ExplicitTop = 248
      ExplicitWidth = 289
      ExplicitHeight = 193
      ClientRectBottom = 676
      ClientRectLeft = 2
      ClientRectRight = 850
      ClientRectTop = 25
      object tabSaldoProjeto: TcxTabSheet
        Caption = 'Saldo Por Projeto'
        ImageIndex = 0
        ExplicitLeft = 6
        ExplicitWidth = 847
        ExplicitHeight = 653
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
      end
    end
  end
  inherited ActionList: TActionList
    inherited Ac_GerarRelatorio: TAction
      OnExecute = Ac_GerarRelatorioExecute
    end
  end
  object ppSaldoProjeto: TppReport
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
      mmHeight = 19050
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        Caption = 'SONG - Sistema de Gest'#227'o de Organiza'#231#227'o N'#227'o Governamental'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 1588
        mmTop = 794
        mmWidth = 196586
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        DataField = 'NOME'
        DataPipeline = DBPipeSaldoProjeto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DBPipeSaldoProjeto'
        mmHeight = 4763
        mmLeft = 1588
        mmTop = 7408
        mmWidth = 196586
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
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4763
        mmLeft = 1588
        mmTop = 13758
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
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4763
        mmLeft = 37580
        mmTop = 13758
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
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4763
        mmLeft = 74368
        mmTop = 13758
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
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4763
        mmLeft = 111417
        mmTop = 13758
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
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4763
        mmLeft = 150576
        mmTop = 13758
        mmWidth = 28046
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6085
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
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeSaldoProjeto'
        mmHeight = 4763
        mmLeft = 1588
        mmTop = 0
        mmWidth = 33602
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
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeSaldoProjeto'
        mmHeight = 4763
        mmLeft = 37307
        mmTop = 0
        mmWidth = 34925
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
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeSaldoProjeto'
        mmHeight = 4763
        mmLeft = 74348
        mmTop = 0
        mmWidth = 34925
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
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeSaldoProjeto'
        mmHeight = 4763
        mmLeft = 111390
        mmTop = 0
        mmWidth = 36513
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
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeSaldoProjeto'
        mmHeight = 4763
        mmLeft = 150548
        mmTop = 0
        mmWidth = 40217
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
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
  object dsSaldoProjeto: TDataSource
    DataSet = dmRelatorio.cdsSaldoProjeto
    Left = 488
    Top = 344
  end
  object DBPipeSaldoProjeto: TppDBPipeline
    DataSource = dsSaldoProjeto
    UserName = 'DBPipeSaldoProjeto'
    Left = 208
    Top = 208
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
      DisplayFormat = 'R$ ,0.00'
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
end
