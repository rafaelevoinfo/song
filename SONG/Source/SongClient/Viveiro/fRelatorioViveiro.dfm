inherited frmRelatorioViveiro: TfrmRelatorioViveiro
  Caption = 'Relat'#243'rios do Viveiro'
  ClientHeight = 480
  ExplicitHeight = 519
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBotoes: TPanel
    Height = 426
  end
  inherited pnConfiguracoes: TPanel
    Height = 426
    object pcPrincipal: TcxPageControl
      Left = 0
      Top = 0
      Width = 855
      Height = 426
      Align = alClient
      TabOrder = 0
      TabStop = False
      Properties.ActivePage = tabPrevisaoProducao
      Properties.CustomButtons.Buttons = <>
      ExplicitHeight = 627
      ClientRectBottom = 421
      ClientRectLeft = 2
      ClientRectRight = 850
      ClientRectTop = 25
      object tabSaldos: TcxTabSheet
        Caption = 'Saldos Por Esp'#233'cie'
        ImageIndex = 0
        ExplicitHeight = 597
        object Label2: TLabel
          Left = 7
          Top = 3
          Width = 36
          Height = 13
          Caption = 'Esp'#233'cie'
        end
        object cbSaldoEspecie: TcxLookupComboBox
          Left = 4
          Top = 19
          RepositoryItem = dmLookup.repLcbEspecie
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 225
        end
        object chkSaldoTodasEspecies: TcxCheckBox
          Left = 229
          Top = 20
          Caption = 'Todas'
          Properties.OnEditValueChanged = chkSaldoTodasEspeciesPropertiesEditValueChanged
          TabOrder = 1
          Transparent = True
          Width = 69
        end
      end
      object tabPrevisaoProducao: TcxTabSheet
        Caption = 'Previs'#227'o de Produ'#231#227'o'
        ImageIndex = 1
        ExplicitHeight = 597
        inline frameEspecies: TframeGrids
          Left = 0
          Top = 57
          Width = 848
          Height = 339
          Align = alClient
          TabOrder = 0
          ExplicitLeft = 8
          ExplicitTop = 8
          inherited gpGrids: TGridPanel
            Width = 848
            Height = 320
            ControlCollection = <
              item
                Column = 0
                Control = frameEspecies.cxGrid1
                Row = 0
              end
              item
                Column = 1
                Control = frameEspecies.pnBotoes
                Row = 0
              end
              item
                Column = 2
                Control = frameEspecies.cxGrid2
                Row = 0
              end>
            inherited cxGrid1: TcxGrid
              Width = 397
              Height = 318
              ExplicitLeft = -4
            end
            inherited pnBotoes: TPanel
              Left = 398
              Width = 42
              Height = 318
              inherited btnAdd: TButton
                Width = 42
              end
              inherited btnAddTodos: TButton
                Width = 42
              end
              inherited btnRemover: TButton
                Width = 42
              end
              inherited btnRemoverTodos: TButton
                Width = 42
              end
            end
            inherited cxGrid2: TcxGrid
              Left = 440
              Width = 407
              Height = 318
            end
          end
          inherited pnLabels: TPanel
            Width = 848
            inherited gpLabels: TGridPanel
              Width = 846
              ControlCollection = <
                item
                  Column = 0
                  Control = frameEspecies.lbInfoGridEsquerda
                  Row = 0
                end
                item
                  Column = 2
                  Control = frameEspecies.lbInfoGridDireita
                  Row = 0
                end>
              inherited lbInfoGridEsquerda: TLabel
                Width = 41
                Caption = 'Esp'#233'cies'
                ExplicitWidth = 41
              end
              inherited lbInfoGridDireita: TLabel
                Left = 439
                Width = 105
                Caption = 'Esp'#233'cies selecionadas'
                ExplicitWidth = 105
              end
            end
          end
          inherited dsEsquerda: TDataSource
            DataSet = dmLookup.cdslkEspecie
          end
          inherited dsDireita: TDataSource
            DataSet = cdsLocalEspecie
          end
        end
        object pnConfiguracoesPrevisao: TPanel
          Left = 0
          Top = 0
          Width = 848
          Height = 57
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object Label1: TLabel
            Left = 4
            Top = 3
            Width = 152
            Height = 13
            Caption = 'Visualizar Previs'#227'o para a Data:'
          end
          object Label3: TLabel
            Left = 4
            Top = 42
            Width = 578
            Height = 13
            Caption = 
              'Somente ser'#225' exibido na lista as esp'#233'cies que estiverem com os t' +
              'empos de germina'#231#227'o e desenvolvimento configurados.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object btnInformacao: TButton
            Left = 724
            Top = 0
            Width = 123
            Height = 25
            Action = Ac_Informacao_Previsao_Producao
            Images = dmPrincipal.imgIcons_16
            TabOrder = 0
            WordWrap = True
          end
          object EditDataPrevisao: TcxDateEdit
            Left = 4
            Top = 19
            TabOrder = 1
            Width = 152
          end
        end
      end
    end
  end
  inherited pnOrganizacao: TPanel
    inherited chkTodasOrganizacoes: TcxCheckBox
      ExplicitHeight = 19
    end
  end
  inherited ActionList: TActionList
    Left = 352
    Top = 80
    object Ac_Informacao_Previsao_Producao: TAction
      Caption = 'Sobre este Relat'#243'rio'
      ImageIndex = 16
      OnExecute = Ac_Informacao_Previsao_ProducaoExecute
    end
  end
  inherited dsOrganizacao: TDataSource
    Left = 376
    Top = 16
  end
  object ppSaldoEspecie: TppReport
    AutoStop = False
    DataPipeline = DBPipeSaldoEspecie
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
    Left = 512
    Top = 328
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'DBPipeSaldoEspecie'
    object ppHeaderBand4: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object ppLabel23: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label1'
        Caption = 'Saldos de Sementes e Mudas Por Esp'#233'cie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 56092
        mmTop = 15557
        mmWidth = 84667
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
        mmTop = 0
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
        mmTop = 13439
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
        mmTop = 16880
        mmWidth = 11113
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label3'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 22172
        mmWidth = 8466
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label4'
        Caption = 'Nome Cient'#237'fico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43656
        mmTop = 22172
        mmWidth = 23019
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label5'
        Caption = 'Fam'#237'lia Bot'#226'nica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 85461
        mmTop = 22172
        mmWidth = 23018
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label6'
        Caption = 'Saldo de Sementes (Kg)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 127529
        mmTop = 22225
        mmWidth = 34925
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label7'
        Caption = 'Saldo de Mudas (Und)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 164836
        mmTop = 22225
        mmWidth = 31485
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer4
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1054
        mmLeft = 2115
        mmTop = 26404
        mmWidth = 193678
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
        DataField = 'CALC_QTDE_MUDA'
        DataPipeline = DBPipeSaldoEspecie
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DBPipeSaldoEspecie'
        mmHeight = 4763
        mmLeft = 164039
        mmTop = 0
        mmWidth = 31445
        BandType = 4
        LayerName = BandLayer4
      end
      object ppDBText26: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText101'
        DataField = 'NOME'
        DataPipeline = DBPipeSaldoEspecie
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeSaldoEspecie'
        mmHeight = 4763
        mmLeft = 2115
        mmTop = 0
        mmWidth = 41000
        BandType = 4
        LayerName = BandLayer4
      end
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText2'
        DataField = 'CALC_QTDE_SEMENTE'
        DataPipeline = DBPipeSaldoEspecie
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DBPipeSaldoEspecie'
        mmHeight = 4763
        mmLeft = 127527
        mmTop = 0
        mmWidth = 34395
        BandType = 4
        LayerName = BandLayer4
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText3'
        DataField = 'NOME_CIENTIFICO'
        DataPipeline = DBPipeSaldoEspecie
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeSaldoEspecie'
        mmHeight = 4763
        mmLeft = 43657
        mmTop = 0
        mmWidth = 41000
        BandType = 4
        LayerName = BandLayer4
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText4'
        DataField = 'FAMILIA_BOTANICA'
        DataPipeline = DBPipeSaldoEspecie
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeSaldoEspecie'
        mmHeight = 4763
        mmLeft = 85462
        mmTop = 0
        mmWidth = 41000
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 193939
        mmTop = 529
        mmWidth = 1587
        BandType = 8
        LayerName = BandLayer4
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
  object DBPipeSaldoEspecie: TppDBPipeline
    DataSource = dmRelatorio.dsSaldo_Semente_Muda
    UserName = 'DBPipeSaldoEspecie'
    Left = 512
    Top = 256
    object DBPipeSaldoSementeMudappField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 100
      DisplayWidth = 100
      Position = 0
    end
    object DBPipeSaldoSementeMudappField2: TppField
      FieldAlias = 'NOME_CIENTIFICO'
      FieldName = 'NOME_CIENTIFICO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 1
    end
    object DBPipeSaldoSementeMudappField3: TppField
      FieldAlias = 'FAMILIA_BOTANICA'
      FieldName = 'FAMILIA_BOTANICA'
      FieldLength = 100
      DisplayWidth = 100
      Position = 2
    end
    object DBPipeSaldoSementeMudappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE_SEMENTE_ESTOQUE'
      FieldName = 'QTDE_SEMENTE_ESTOQUE'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 3
    end
    object DBPipeSaldoSementeMudappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE_MUDA_ESTOQUE'
      FieldName = 'QTDE_MUDA_ESTOQUE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object DBPipeSaldoSementeMudappField6: TppField
      FieldAlias = 'CALC_QTDE_SEMENTE'
      FieldName = 'CALC_QTDE_SEMENTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object DBPipeSaldoSementeMudappField7: TppField
      FieldAlias = 'CALC_QTDE_MUDA'
      FieldName = 'CALC_QTDE_MUDA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
  end
  object DBPipeOrganizacao: TppDBPipeline
    DataSource = dsOrganizacao
    UserName = 'DBPipeOrganizacao'
    Left = 488
    Top = 16
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
  object cdsLocalEspecie: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 216
    object cdsLocalEspecieID: TIntegerField
      FieldName = 'ID'
    end
  end
  object cdsEspecieSelecionada: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 720
    Top = 232
    object cdsEspecieSelecionadaID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
    end
    object cdsEspecieSelecionadaTAXA_GERMINACAO: TBCDField
      DisplayLabel = '% Germina'#231#227'o'
      FieldName = 'TAXA_GERMINACAO'
    end
    object cdsEspecieSelecionadaTAXA_CLASSIFICACAO: TBCDField
      DisplayLabel = '% Classifica'#231#227'o'
      FieldName = 'TAXA_CLASSIFICACAO'
    end
  end
end
