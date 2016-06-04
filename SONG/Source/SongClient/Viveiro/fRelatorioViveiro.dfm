inherited frmRelatorioViveiro: TfrmRelatorioViveiro
  Caption = 'Relat'#243'rios do Viveiro'
  ClientHeight = 480
  ExplicitHeight = 519
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBotoes: TPanel
    Height = 426
    ExplicitHeight = 426
  end
  inherited pnConfiguracoes: TPanel
    Height = 426
    ExplicitHeight = 426
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
      ClientRectBottom = 421
      ClientRectLeft = 2
      ClientRectRight = 850
      ClientRectTop = 25
      object tabSaldos: TcxTabSheet
        Caption = 'Saldos Por Esp'#233'cie'
        ImageIndex = 0
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
        OnShow = tabPrevisaoProducaoShow
        inline frameEspecies: TframeGrids
          Left = 0
          Top = 57
          Width = 848
          Height = 339
          Align = alClient
          TabOrder = 0
          ExplicitTop = 57
          ExplicitWidth = 848
          ExplicitHeight = 339
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
            ExplicitWidth = 848
            ExplicitHeight = 320
            inherited cxGrid1: TcxGrid
              Width = 397
              Height = 318
              ExplicitWidth = 397
              ExplicitHeight = 318
              inherited viewEsquerda: TcxGridDBTableView
                OptionsCustomize.ColumnsQuickCustomization = True
              end
            end
            inherited pnBotoes: TPanel
              Left = 398
              Width = 42
              Height = 318
              ExplicitLeft = 398
              ExplicitWidth = 42
              ExplicitHeight = 318
              inherited btnAdd: TButton
                ExplicitWidth = 42
              end
              inherited btnAddTodos: TButton
                ExplicitWidth = 42
              end
              inherited btnRemover: TButton
                ExplicitWidth = 42
              end
              inherited btnRemoverTodos: TButton
                ExplicitWidth = 42
              end
            end
            inherited cxGrid2: TcxGrid
              Left = 440
              Width = 407
              Height = 318
              ExplicitLeft = 440
              ExplicitWidth = 407
              ExplicitHeight = 318
              inherited viewDireita: TcxGridDBTableView
                OptionsCustomize.ColumnsQuickCustomization = True
                OptionsData.Editing = True
              end
            end
          end
          inherited pnLabels: TPanel
            Width = 848
            ExplicitWidth = 848
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
              ExplicitWidth = 846
              inherited lbInfoGridEsquerda: TLabel
                Width = 41
                Height = 15
                Caption = 'Esp'#233'cies'
                ExplicitWidth = 41
              end
              inherited lbInfoGridDireita: TLabel
                Left = 439
                Width = 105
                Height = 15
                Caption = 'Esp'#233'cies selecionadas'
                ExplicitLeft = 439
                ExplicitWidth = 105
              end
            end
          end
          inherited dsEsquerda: TDataSource
            DataSet = dmRelatorio.cdsTaxas_Especie
          end
          inherited dsDireita: TDataSource
            DataSet = cdsEspecieSelecionada
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
            Left = 160
            Top = 15
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
    Left = 448
    Top = 48
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
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label6'
        Caption = 'Sementes (Kg)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 89426
        mmTop = 22225
        mmWidth = 21696
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label7'
        Caption = 'Mudas Prontas (Und)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 164572
        mmTop = 22225
        mmWidth = 30427
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
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label5'
        Caption = 'Mudas em Desenvolvimento (Und)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 112981
        mmTop = 22225
        mmWidth = 50007
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
        DataField = 'CALC_QTDE_MUDA_PRONTA'
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
        mmLeft = 164569
        mmTop = 0
        mmWidth = 30385
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
        mmLeft = 89426
        mmTop = 0
        mmWidth = 21696
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
        mmWidth = 44979
        BandType = 4
        LayerName = BandLayer4
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText4'
        DataField = 'CALC_QTDE_MUDA_DESENVOLVIMENTO'
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
        mmLeft = 112977
        mmTop = 0
        mmWidth = 50006
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
    object DBPipeSaldoEspecieppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 100
      DisplayWidth = 100
      Position = 0
    end
    object DBPipeSaldoEspecieppField2: TppField
      FieldAlias = 'NOME_CIENTIFICO'
      FieldName = 'NOME_CIENTIFICO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 1
    end
    object DBPipeSaldoEspecieppField3: TppField
      FieldAlias = 'FAMILIA_BOTANICA'
      FieldName = 'FAMILIA_BOTANICA'
      FieldLength = 100
      DisplayWidth = 100
      Position = 2
    end
    object DBPipeSaldoEspecieppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE_SEMENTE_ESTOQUE'
      FieldName = 'QTDE_SEMENTE_ESTOQUE'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 3
    end
    object DBPipeSaldoEspecieppField5: TppField
      FieldAlias = 'CALC_QTDE_SEMENTE'
      FieldName = 'CALC_QTDE_SEMENTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object DBPipeSaldoEspecieppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE_MUDA_PRONTA'
      FieldName = 'QTDE_MUDA_PRONTA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object DBPipeSaldoEspecieppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE_MUDA_DESENVOLVIMENTO'
      FieldName = 'QTDE_MUDA_DESENVOLVIMENTO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object DBPipeSaldoEspecieppField8: TppField
      FieldAlias = 'CALC_QTDE_MUDA_PRONTA'
      FieldName = 'CALC_QTDE_MUDA_PRONTA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object DBPipeSaldoEspecieppField9: TppField
      FieldAlias = 'CALC_QTDE_MUDA_DESENVOLVIMENTO'
      FieldName = 'CALC_QTDE_MUDA_DESENVOLVIMENTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
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
  object cdsEspecieSelecionada: TRFClientDataSet
    Aggregates = <>
    Params = <>
    RFApplyAutomatico = False
    Left = 688
    Top = 200
    object cdsEspecieSelecionadaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
    end
    object cdsEspecieSelecionadaNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsEspecieSelecionadaNOME_CIENTIFICO: TStringField
      FieldName = 'NOME_CIENTIFICO'
      ProviderFlags = []
      Size = 100
    end
    object cdsEspecieSelecionadaFAMILIA_BOTANICA: TStringField
      FieldName = 'FAMILIA_BOTANICA'
      ProviderFlags = []
      Size = 100
    end
    object cdsEspecieSelecionadaTEMPO_GERMINACAO: TIntegerField
      FieldName = 'TEMPO_GERMINACAO'
      ProviderFlags = []
    end
    object cdsEspecieSelecionadaTEMPO_DESENVOLVIMENTO: TIntegerField
      FieldName = 'TEMPO_DESENVOLVIMENTO'
      ProviderFlags = []
    end
    object cdsEspecieSelecionadaTAXA_CLASSIFICACAO: TBCDField
      FieldName = 'TAXA_CLASSIFICACAO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object cdsEspecieSelecionadaTAXA_GERMINACAO: TBCDField
      FieldName = 'TAXA_GERMINACAO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object cdsEspecieSelecionadaQTDE_MUDA_PRONTA: TIntegerField
      FieldName = 'QTDE_MUDA_PRONTA'
      ProviderFlags = []
    end
    object cdsEspecieSelecionadaQTDE_MUDA_DESENVOLVIMENTO: TIntegerField
      FieldName = 'QTDE_MUDA_DESENVOLVIMENTO'
      ProviderFlags = []
    end
    object cdsEspecieSelecionadaQTDE_SEMENTE_ESTOQUE: TBCDField
      FieldName = 'QTDE_SEMENTE_ESTOQUE'
      Precision = 18
      Size = 2
    end
    object cdsEspecieSelecionadaQTDE_SEMENTE_KILO: TIntegerField
      FieldName = 'QTDE_SEMENTE_KILO'
    end
  end
  object ppPrevisaoProducao: TppReport
    AutoStop = False
    DataPipeline = DBPipePrevisaoProducao
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
    Left = 616
    Top = 328
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'DBPipePrevisaoProducao'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        Caption = 'Previs'#227'o de produ'#231#227'o de mudas para a data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5028
        mmLeft = 45508
        mmTop = 15610
        mmWidth = 88635
        BandType = 0
        LayerName = BandLayer2
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
        mmTop = 0
        mmWidth = 30692
        BandType = 0
        LayerName = BandLayer2
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
        mmTop = 13439
        mmWidth = 14287
        BandType = 0
        LayerName = BandLayer2
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
        mmTop = 16880
        mmWidth = 11113
        BandType = 0
        LayerName = BandLayer2
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer1
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
        LayerName = BandLayer2
      end
      object ppLabel8: TppLabel
        DesignLayer = ppDesignLayer1
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
        mmLeft = 56886
        mmTop = 22172
        mmWidth = 23019
        BandType = 0
        LayerName = BandLayer2
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label6'
        Caption = 'Mudas em Desenvolvimento (Und)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 113774
        mmTop = 22225
        mmWidth = 50006
        BandType = 0
        LayerName = BandLayer2
      end
      object ppLabel11: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label7'
        Caption = 'Mudas Prontas (Und)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 165894
        mmTop = 22225
        mmWidth = 30427
        BandType = 0
        LayerName = BandLayer2
      end
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1054
        mmLeft = 2115
        mmTop = 26404
        mmWidth = 193678
        BandType = 0
        LayerName = BandLayer2
      end
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText8'
        DataField = 'DATA_PREVISAO'
        DataPipeline = DBPipeParametros
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipeParametros'
        mmHeight = 5028
        mmLeft = 135466
        mmTop = 15610
        mmWidth = 35190
        BandType = 0
        LayerName = BandLayer2
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText9'
        DataField = 'QTDE_MUDA_PRONTA'
        DataPipeline = DBPipePrevisaoProducao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DBPipePrevisaoProducao'
        mmHeight = 4763
        mmLeft = 165894
        mmTop = 0
        mmWidth = 29633
        BandType = 4
        LayerName = BandLayer2
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText101'
        DataField = 'NOME'
        DataPipeline = DBPipePrevisaoProducao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipePrevisaoProducao'
        mmHeight = 4763
        mmLeft = 2115
        mmTop = 0
        mmWidth = 53181
        BandType = 4
        LayerName = BandLayer2
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        DataField = 'QTDE_MUDA_DESENVOLVIMENTO'
        DataPipeline = DBPipePrevisaoProducao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DBPipePrevisaoProducao'
        mmHeight = 4763
        mmLeft = 113774
        mmTop = 0
        mmWidth = 49477
        BandType = 4
        LayerName = BandLayer2
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        DataField = 'NOME_CIENTIFICO'
        DataPipeline = DBPipePrevisaoProducao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipePrevisaoProducao'
        mmHeight = 4763
        mmLeft = 56887
        mmTop = 0
        mmWidth = 55827
        BandType = 4
        LayerName = BandLayer2
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLabel12: TppLabel
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
        LayerName = BandLayer2
      end
      object ppDBText9: TppDBText
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
        LayerName = BandLayer2
      end
      object ppDBText10: TppDBText
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
        LayerName = BandLayer2
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 193939
        mmTop = 529
        mmWidth = 1587
        BandType = 8
        LayerName = BandLayer2
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {00}
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'BandLayer2'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object cdsParametros: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 656
    Top = 24
    object cdsParametrosDATA_PREVISAO: TDateField
      FieldName = 'DATA_PREVISAO'
    end
  end
  object DBPipePrevisaoProducao: TppDBPipeline
    DataSource = frameEspecies.dsDireita
    UserName = 'DBPipePrevisaoProducao'
    Left = 616
    Top = 264
    object DBPipePrevisaoProducaoppField1: TppField
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DBPipePrevisaoProducaoppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DBPipePrevisaoProducaoppField3: TppField
      FieldAlias = 'NOME_CIENTIFICO'
      FieldName = 'NOME_CIENTIFICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DBPipePrevisaoProducaoppField4: TppField
      FieldAlias = 'FAMILIA_BOTANICA'
      FieldName = 'FAMILIA_BOTANICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DBPipePrevisaoProducaoppField5: TppField
      FieldAlias = 'TEMPO_GERMINACAO'
      FieldName = 'TEMPO_GERMINACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DBPipePrevisaoProducaoppField6: TppField
      FieldAlias = 'TEMPO_DESENVOLVIMENTO'
      FieldName = 'TEMPO_DESENVOLVIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object DBPipePrevisaoProducaoppField7: TppField
      FieldAlias = 'TAXA_CLASSIFICACAO'
      FieldName = 'TAXA_CLASSIFICACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object DBPipePrevisaoProducaoppField8: TppField
      FieldAlias = 'TAXA_GERMINACAO'
      FieldName = 'TAXA_GERMINACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object DBPipePrevisaoProducaoppField9: TppField
      FieldAlias = 'QTDE_MUDA_PRONTA'
      FieldName = 'QTDE_MUDA_PRONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object DBPipePrevisaoProducaoppField10: TppField
      FieldAlias = 'QTDE_MUDA_DESENVOLVIMENTO'
      FieldName = 'QTDE_MUDA_DESENVOLVIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object DBPipeParametros: TppDBPipeline
    DataSource = dsParametros
    UserName = 'DBPipeParametros'
    Left = 760
    Top = 24
    object DBPipeParametrosppField1: TppField
      FieldAlias = 'DATA_PREVISAO'
      FieldName = 'DATA_PREVISAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
  end
  object dsParametros: TDataSource
    DataSet = cdsParametros
    Left = 584
    Top = 24
  end
end
