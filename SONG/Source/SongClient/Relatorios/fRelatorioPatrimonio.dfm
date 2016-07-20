inherited frmRelatorioPatrimonio: TfrmRelatorioPatrimonio
  Caption = 'Relat'#243'rio de Patrim'#244'nio'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnConfiguracoes: TPanel
    object rgStatus: TcxRadioGroup
      Left = 3
      Top = 3
      Caption = 'Status'
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = 'Em uso'
        end
        item
          Caption = 'Baixado'
        end>
      ItemIndex = 0
      TabOrder = 0
      Height = 40
      Width = 131
    end
  end
  inherited ActionList: TActionList
    Left = 440
    Top = 96
  end
  object DBPipePatrimonio: TppDBPipeline
    DataSource = dsPatrimonio
    UserName = 'DBPipePatrimonio'
    Left = 328
    Top = 184
    object DBPipePatrimonioppField1: TppField
      FieldAlias = 'IDENTIFICACAO'
      FieldName = 'IDENTIFICACAO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object DBPipePatrimonioppField2: TppField
      FieldAlias = 'NOME_ITEM'
      FieldName = 'NOME_ITEM'
      FieldLength = 100
      DisplayWidth = 100
      Position = 1
    end
    object DBPipePatrimonioppField3: TppField
      FieldAlias = 'DATA_AQUISICAO'
      FieldName = 'DATA_AQUISICAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 2
    end
    object DBPipePatrimonioppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_INICIAL'
      FieldName = 'VALOR_INICIAL'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 3
    end
    object DBPipePatrimonioppField5: TppField
      FieldAlias = 'LOCALIZACAO'
      FieldName = 'LOCALIZACAO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 4
    end
    object DBPipePatrimonioppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object DBPipePatrimonioppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CALC_VALOR_ATUAL'
      FieldName = 'CALC_VALOR_ATUAL'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 6
    end
    object DBPipePatrimonioppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TAXA_DEPRECIACAO_ANUAL'
      FieldName = 'TAXA_DEPRECIACAO_ANUAL'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object DBPipePatrimonioppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID_ITEM_PATRIMONIO'
      FieldName = 'ID_ITEM_PATRIMONIO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
  end
  object dsPatrimonio: TDataSource
    DataSet = dmRelatorio.cdsPatrimonio
    Left = 416
    Top = 184
  end
  object ppPatrimonio: TppReport
    AutoStop = False
    DataPipeline = DBPipePatrimonio
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
    Left = 328
    Top = 248
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'DBPipePatrimonio'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        Caption = 'Patrim'#244'nio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 86519
        mmTop = 17198
        mmWidth = 21960
        BandType = 0
        LayerName = BandLayer5
      end
      object ppDBImage1: TppDBImage
        DesignLayer = ppDesignLayer1
        UserName = 'DBImage1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'LOGO'
        DataPipeline = frmRelatorioFinanceiro.DBPipeOrganizacao
        GraphicType = 'AutoDetect'
        ParentDataPipeline = False
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 21431
        mmLeft = 1588
        mmTop = 794
        mmWidth = 30692
        BandType = 0
        LayerName = BandLayer5
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
        LayerName = BandLayer5
      end
      object ppSystemVariable2: TppSystemVariable
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
        LayerName = BandLayer5
      end
      object ppLabel8: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'lbStatus'
        Caption = '(Em Uso)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 5027
        mmLeft = 109535
        mmTop = 17198
        mmWidth = 18521
        BandType = 0
        LayerName = BandLayer5
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
        UserName = 'DBText101'
        DataField = 'LOCALIZACAO'
        DataPipeline = DBPipePatrimonio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipePatrimonio'
        mmHeight = 4763
        mmLeft = 43654
        mmTop = 0
        mmWidth = 48948
        BandType = 4
        LayerName = BandLayer5
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText27'
        DataField = 'IDENTIFICACAO'
        DataPipeline = DBPipePatrimonio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipePatrimonio'
        mmHeight = 4763
        mmLeft = 2378
        mmTop = 0
        mmWidth = 38894
        BandType = 4
        LayerName = BandLayer5
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText24'
        DataField = 'CALC_VALOR_ATUAL'
        DataPipeline = DBPipePatrimonio
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipePatrimonio'
        mmHeight = 4763
        mmLeft = 166950
        mmTop = 0
        mmWidth = 30000
        BandType = 4
        LayerName = BandLayer5
      end
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        DataField = 'VALOR_INICIAL'
        DataPipeline = DBPipePatrimonio
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipePatrimonio'
        mmHeight = 4763
        mmLeft = 95515
        mmTop = 0
        mmWidth = 35190
        BandType = 4
        LayerName = BandLayer5
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        DataField = 'TAXA_DEPRECIACAO_ANUAL'
        DataPipeline = DBPipePatrimonio
        DisplayFormat = '0 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipePatrimonio'
        mmHeight = 4763
        mmLeft = 136261
        mmTop = 0
        mmWidth = 29898
        BandType = 4
        LayerName = BandLayer5
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
        LayerName = BandLayer5
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText7'
        DataField = 'CNPJ'
        DataPipeline = frmRelatorioFinanceiro.DBPipeOrganizacao
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
        LayerName = BandLayer5
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        DataField = 'NOME'
        DataPipeline = frmRelatorioFinanceiro.DBPipeOrganizacao
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
        LayerName = BandLayer5
      end
      object ppSystemVariable3: TppSystemVariable
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
        LayerName = BandLayer5
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'ID_ITEM_PATRIMONIO'
      DataPipeline = DBPipePatrimonio
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'DBPipePatrimonio'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object ppShape2: TppShape
          DesignLayer = ppDesignLayer1
          UserName = 'Shape2'
          Brush.Color = clGray
          mmHeight = 4763
          mmLeft = 1852
          mmTop = 529
          mmWidth = 194998
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer5
        end
        object ppLabel4: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label4'
          Caption = 'Nro. de Identifica'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 2381
          mmTop = 6347
          mmWidth = 29369
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer5
        end
        object ppLabel3: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label3'
          Caption = 'Localiza'#231#227'o do Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 43656
          mmTop = 6347
          mmWidth = 28575
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer5
        end
        object ppLabel5: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label5'
          Caption = 'Deprecia'#231#227'o Anual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 136261
          mmTop = 6347
          mmWidth = 26723
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer5
        end
        object ppLabel6: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label6'
          Caption = 'Valor Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 95515
          mmTop = 6347
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer5
        end
        object ppLabel7: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label7'
          Caption = 'Valor Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 166952
          mmTop = 6347
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer5
        end
        object ppDBText8: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'DBText18'
          DataField = 'NOME_ITEM'
          DataPipeline = DBPipePatrimonio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'DBPipePatrimonio'
          mmHeight = 4763
          mmLeft = 2117
          mmTop = 794
          mmWidth = 193146
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer5
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
    object raCodeModule3: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650611
        6C625374617475734F6E476574546578740B50726F6772616D54797065070B74
        7450726F63656475726506536F7572636506A770726F636564757265206C6253
        74617475734F6E476574546578742876617220546578743A20537472696E6729
        3B0D0A626567696E0D0A0D0A202069662044425069706550617472696D6F6E69
        6F5B27535441545553275D203D2030207468656E0D0A2020202054657874203A
        3D202728456D2075736F29270D0A2020656C73650D0A2020202054657874203A
        3D2027284261697861646F29273B20200D0A0D0A656E643B0D0A0D436F6D706F
        6E656E744E616D6506086C62537461747573094576656E744E616D6506094F6E
        47657454657874074576656E7449440235084361726574506F73010216020500
        0000}
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'BandLayer5'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object DBPipeOrganizacao: TppDBPipeline
    DataSource = dsOrganizacao
    UserName = 'DBPipeOrganizacao'
    Left = 520
    Top = 8
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
  end
end
