inherited frmRelatorioFinanceiro: TfrmRelatorioFinanceiro
  Caption = 'Relat'#243'rios Financeiros'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnConfiguracoes: TPanel
    object pcPrincipal: TcxPageControl
      Left = 0
      Top = 0
      Width = 855
      Height = 627
      Align = alClient
      TabOrder = 0
      TabStop = False
      Properties.ActivePage = tabMovimentacao
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 622
      ClientRectLeft = 2
      ClientRectRight = 850
      ClientRectTop = 25
      object tabSaldos: TcxTabSheet
        Caption = 'Saldos'
        ImageIndex = 0
        object Label2: TLabel
          Left = 7
          Top = 3
          Width = 35
          Height = 13
          Caption = 'Projeto'
        end
        object Label4: TLabel
          Left = 7
          Top = 44
          Width = 30
          Height = 13
          Caption = 'Fundo'
        end
        object cbProjetoSaldo: TcxLookupComboBox
          Left = 4
          Top = 19
          RepositoryItem = dmLookup.repLcbProjeto
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 225
        end
        object chkTodosProjetosSaldo: TcxCheckBox
          Left = 229
          Top = 20
          Caption = 'Todos'
          Properties.OnEditValueChanged = chkSaldoTodosProjetoPropertiesEditValueChanged
          TabOrder = 1
          Transparent = True
          Width = 69
        end
        object chkTodosFundoSaldos: TcxCheckBox
          Left = 229
          Top = 60
          Caption = 'Todos'
          Properties.OnEditValueChanged = chkSaldoTodosFundoPropertiesEditValueChanged
          TabOrder = 2
          Transparent = True
          Width = 69
        end
        object cbFundoSaldo: TcxLookupComboBox
          Left = 4
          Top = 59
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
        object Label5: TLabel
          Left = 7
          Top = 46
          Width = 30
          Height = 13
          Caption = 'Fundo'
        end
        object cgbData: TdxCheckGroupBox
          Left = 4
          Top = 87
          Caption = 'Filtrar por Per'#237'odo'
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
          Top = 60
          RepositoryItem = dmLookup.repLcbFundo
          Properties.ListColumns = <>
          TabOrder = 3
          Width = 280
        end
        object chkTodosFundoMovimentacao: TcxCheckBox
          Left = 283
          Top = 61
          Caption = 'Todos'
          Properties.OnEditValueChanged = chkTodosFundoMovimentacaoPropertiesEditValueChanged
          TabOrder = 4
          Transparent = True
          Width = 69
        end
        object chkReceitas: TcxCheckBox
          Left = 4
          Top = 154
          Caption = 'Receitas'
          State = cbsChecked
          TabOrder = 5
          Transparent = True
          Width = 69
        end
        object chkDespesas: TcxCheckBox
          Left = 4
          Top = 179
          Caption = 'Despesas'
          State = cbsChecked
          TabOrder = 6
          Transparent = True
          Width = 69
        end
        object chkSomenteTotais: TcxCheckBox
          Left = 4
          Top = 204
          Caption = 'Somente Totais'
          TabOrder = 7
          Transparent = True
          Width = 130
        end
        object chkSomenteRegistrosAbertos: TcxCheckBox
          Left = 4
          Top = 229
          Caption = 'Somente Receitas/Despesas em Aberto'
          TabOrder = 8
          Transparent = True
          Width = 222
        end
      end
      object tabSaldoRubrica: TcxTabSheet
        Caption = 'Saldo de Rubricas'
        ImageIndex = 1
        object lb1: TLabel
          Left = 6
          Top = 3
          Width = 35
          Height = 13
          Caption = 'Projeto'
        end
        object cbProjetoRubrica: TcxLookupComboBox
          Left = 3
          Top = 19
          RepositoryItem = dmLookup.repLcbProjeto
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 225
        end
        object chkTodosProjetosRubricas: TcxCheckBox
          Left = 228
          Top = 20
          Caption = 'Todos'
          Properties.OnEditValueChanged = chkTodosProjetoRubricasPropertiesEditValueChanged
          TabOrder = 1
          Transparent = True
          Width = 69
        end
      end
    end
  end
  inherited pnOrganizacao: TPanel
    ExplicitLeft = 5
  end
  inherited ActionList: TActionList
    Left = 504
    Top = 192
  end
  inherited dsOrganizacao: TDataSource
    Left = 424
    Top = 0
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
    object cdsMovimentacaoVALOR_TOTAL_PAGO_RECEBIDO: TBCDField
      FieldName = 'VALOR_TOTAL_PAGO_RECEBIDO'
      ProviderFlags = []
      DisplayFormat = 'R$ ,0.00'
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
    object cdsMovimentacaoVALOR_RESTANTE: TBCDField
      FieldName = 'VALOR_RESTANTE'
      Size = 2
    end
    object cdsMovimentacaoDATA_PAGAMENTO_RECEBIMENTO: TDateField
      FieldName = 'DATA_PAGAMENTO_RECEBIMENTO'
    end
    object cdsMovimentacaoDESCRICAO_FORMA_PAGAMENTO: TStringField
      FieldName = 'DESCRICAO_FORMA_PAGAMENTO'
      Size = 60
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
      FieldAlias = 'VALOR_TOTAL_PAGO_RECEBIDO'
      FieldName = 'VALOR_TOTAL_PAGO_RECEBIDO'
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
    object DBPipeMovimentacaoppField15: TppField
      FieldAlias = 'VALOR_RESTANTE'
      FieldName = 'VALOR_RESTANTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object DBPipeMovimentacaoppField16: TppField
      FieldAlias = 'DESCRICAO_FORMA_PAGAMENTO'
      FieldName = 'DESCRICAO_FORMA_PAGAMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object DBPipeMovimentacaoppField17: TppField
      FieldAlias = 'DATA_PAGAMENTO_RECEBIMENTO'
      FieldName = 'DATA_PAGAMENTO_RECEBIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
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
      mmHeight = 23813
      mmPrintPosition = 0
      object ppLbTituloMovimentacaoFinanceira: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'TituloMovimentacaoFinanceira'
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
    object ppDetailBandMovimentacao: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 3704
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
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeMovimentacao'
        mmHeight = 3175
        mmLeft = 145516
        mmTop = 0
        mmWidth = 25000
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
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeMovimentacao'
        mmHeight = 3175
        mmLeft = 29368
        mmTop = 0
        mmWidth = 43391
        BandType = 4
        LayerName = BandLayer3
      end
      object ppDBText21: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText21'
        DataField = 'VALOR_PARCIAL'
        DataPipeline = DBPipeMovimentacao
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeMovimentacao'
        mmHeight = 3175
        mmLeft = 119589
        mmTop = 0
        mmWidth = 25000
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
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeMovimentacao'
        mmHeight = 3175
        mmLeft = 5024
        mmTop = 0
        mmWidth = 23019
        BandType = 4
        LayerName = BandLayer3
      end
      object ppDBText24: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText24'
        DataField = 'VALOR_RESTANTE'
        DataPipeline = DBPipeMovimentacao
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipeMovimentacao'
        mmHeight = 3175
        mmLeft = 171446
        mmTop = 0
        mmWidth = 25000
        BandType = 4
        LayerName = BandLayer3
      end
      object ppDBText10: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText10'
        DataField = 'DATA_PAGAMENTO_RECEBIMENTO'
        DataPipeline = DBPipeMovimentacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeMovimentacao'
        mmHeight = 3175
        mmLeft = 73820
        mmTop = 0
        mmWidth = 15875
        BandType = 4
        LayerName = BandLayer3
      end
      object ppDBText11: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText11'
        DataField = 'DESCRICAO_FORMA_PAGAMENTO'
        DataPipeline = DBPipeMovimentacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeMovimentacao'
        mmHeight = 3175
        mmLeft = 91812
        mmTop = 0
        mmWidth = 25665
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
          TextAlignment = taCentered
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
        mmHeight = 7938
        mmPrintPosition = 0
        object ppDBText20: TppDBText
          DesignLayer = ppDesignLayer3
          UserName = 'DBText20'
          DataField = 'SALDO_GERAL'
          DataPipeline = DBPipeMovimentacao
          DisplayFormat = '$ ,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'DBPipeMovimentacao'
          mmHeight = 4763
          mmLeft = 145512
          mmTop = 3175
          mmWidth = 25000
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer3
        end
        object ppLabel3: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label3'
          Caption = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 136250
          mmTop = 3440
          mmWidth = 7937
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
      StartOnOddPage = False
      UserName = 'GroupTipo'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'DBPipeMovimentacao'
      NewFile = False
      object ppGroupHeaderBand4: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 13229
        mmPrintPosition = 0
        object EditDescricaoTipo: TppDBText
          DesignLayer = ppDesignLayer3
          UserName = 'EditDescricaoTipo'
          DataField = 'DESCRICAO_TIPO'
          DataPipeline = DBPipeMovimentacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'DBPipeMovimentacao'
          mmHeight = 4763
          mmLeft = 5289
          mmTop = 1589
          mmWidth = 191559
          BandType = 3
          GroupNo = 2
          LayerName = BandLayer3
        end
        object ppLabelDescricao: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'LabelDescricao'
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2645
          mmLeft = 29369
          mmTop = 8468
          mmWidth = 9525
          BandType = 3
          GroupNo = 2
          LayerName = BandLayer3
        end
        object ppLabelValorPagoRecebido: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'LabelValorPagoRecebido'
          Caption = 'Valor Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2645
          mmLeft = 145517
          mmTop = 8468
          mmWidth = 10584
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
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2645
          mmLeft = 119588
          mmTop = 8468
          mmWidth = 5027
          BandType = 3
          GroupNo = 2
          LayerName = BandLayer3
        end
        object ppLabelProjetoFundo: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'LabelProjetoFundo'
          Caption = 'Projeto/Fundo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2645
          mmLeft = 5023
          mmTop = 8468
          mmWidth = 14552
          BandType = 3
          GroupNo = 2
          LayerName = BandLayer3
        end
        object ppLabel20: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'LabelValorPagoRecebido1'
          Caption = 'Restante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2645
          mmLeft = 171447
          mmTop = 8468
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
          LayerName = BandLayer3
        end
        object ppLine1: TppLine
          DesignLayer = ppDesignLayer3
          UserName = 'Line1'
          Weight = 0.750000000000000000
          mmHeight = 1058
          mmLeft = 2117
          mmTop = 7133
          mmWidth = 194734
          BandType = 3
          GroupNo = 1
          LayerName = BandLayer3
        end
        object ppLine2: TppLine
          DesignLayer = ppDesignLayer3
          UserName = 'Line2'
          Weight = 0.750000000000000000
          mmHeight = 1058
          mmLeft = 1852
          mmTop = 12170
          mmWidth = 194998
          BandType = 3
          GroupNo = 1
          LayerName = BandLayer3
        end
        object ppLabel10: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'LabelDescricao1'
          Caption = 'Data Pgto/Receb'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 2646
          mmLeft = 73819
          mmTop = 8467
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
          LayerName = BandLayer3
        end
        object ppLabel11: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label11'
          Caption = 'Forma de Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2645
          mmLeft = 91812
          mmTop = 8468
          mmWidth = 20902
          BandType = 3
          GroupNo = 1
          LayerName = BandLayer3
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBCalc2: TppDBCalc
          DesignLayer = ppDesignLayer3
          UserName = 'DBCalc2'
          DataField = 'VALOR'
          DataPipeline = DBPipeMovimentacao
          DisplayFormat = '$ ,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          ResetGroup = ppGroupTipo
          Transparent = True
          VerticalAlignment = avCenter
          DataPipelineName = 'DBPipeMovimentacao'
          mmHeight = 4498
          mmLeft = 145516
          mmTop = 264
          mmWidth = 25000
          BandType = 5
          GroupNo = 2
          LayerName = BandLayer3
        end
        object ppDBCalc3: TppDBCalc
          DesignLayer = ppDesignLayer3
          UserName = 'DBCalc3'
          DataField = 'VALOR_PARCIAL'
          DataPipeline = DBPipeMovimentacao
          DisplayFormat = '$ ,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          ResetGroup = ppGroupTipo
          Transparent = True
          VerticalAlignment = avCenter
          DataPipelineName = 'DBPipeMovimentacao'
          mmHeight = 4498
          mmLeft = 119593
          mmTop = 264
          mmWidth = 25000
          BandType = 5
          GroupNo = 2
          LayerName = BandLayer3
        end
        object ppDBCalc5: TppDBCalc
          DesignLayer = ppDesignLayer3
          UserName = 'DBCalc5'
          DataField = 'VALOR_RESTANTE'
          DataPipeline = DBPipeMovimentacao
          DisplayFormat = '$ ,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          ResetGroup = ppGroupTipo
          Transparent = True
          VerticalAlignment = avCenter
          DataPipelineName = 'DBPipeMovimentacao'
          mmHeight = 4498
          mmLeft = 171451
          mmTop = 264
          mmWidth = 25000
          BandType = 5
          GroupNo = 1
          LayerName = BandLayer3
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65061F
        4C6162656C56616C6F725061676F526563656269646F4F6E476574546578740B
        50726F6772616D54797065070B747450726F63656475726506536F7572636506
        BB70726F636564757265204C6162656C56616C6F725061676F52656365626964
        6F4F6E476574546578742876617220546578743A20537472696E67293B0D0A62
        6567696E0D0A0D0A20206966204442506970654D6F76696D656E746163616F5B
        275449504F275D203D2030207468656E0D0A2020202054657874203A3D202027
        56616C6F72205061676F270D0A2020656C73650D0A2020202054657874203A3D
        202756616C6F7220526563656269646F273B0D0A0D0A656E643B0D0A0D436F6D
        706F6E656E744E616D6506164C6162656C56616C6F725061676F526563656269
        646F094576656E744E616D6506094F6E47657454657874074576656E74494402
        35084361726574506F730102150207000000}
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
          TextAlignment = taCentered
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
          mmLeft = 148696
          mmTop = 0
          mmWidth = 46567
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
    object DBPipeSaldoppField7: TppField
      FieldAlias = 'TIPO_ORIGEM'
      FieldName = 'TIPO_ORIGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
  end
  object dsSaldo: TDataSource
    DataSet = cdsSaldo
    Left = 720
    Top = 248
  end
  object ppSaldoRubrica: TppReport
    AutoStop = False
    DataPipeline = DBPipeRubrica
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
    Left = 592
    Top = 368
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'DBPipeRubrica'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        Caption = 'Saldo de Rubricas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 78846
        mmTop = 17198
        mmWidth = 37042
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
        DataPipeline = DBPipeOrganizacao
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
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText9'
        DataField = 'APROVISIONADO'
        DataPipeline = DBPipeRubrica
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipeRubrica'
        mmHeight = 4763
        mmLeft = 135466
        mmTop = 0
        mmWidth = 30000
        BandType = 4
        LayerName = BandLayer5
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText101'
        DataField = 'ORCAMENTO'
        DataPipeline = DBPipeRubrica
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipeRubrica'
        mmHeight = 4763
        mmLeft = 42333
        mmTop = 0
        mmWidth = 30000
        BandType = 4
        LayerName = BandLayer5
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText21'
        DataField = 'GASTO'
        DataPipeline = DBPipeRubrica
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipeRubrica'
        mmHeight = 4763
        mmLeft = 104512
        mmTop = 0
        mmWidth = 30000
        BandType = 4
        LayerName = BandLayer5
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText27'
        DataField = 'NOME_RUBRICA'
        DataPipeline = DBPipeRubrica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipeRubrica'
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
        DataField = 'SALDO_REAL'
        DataPipeline = DBPipeRubrica
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipeRubrica'
        mmHeight = 4763
        mmLeft = 166950
        mmTop = 0
        mmWidth = 30000
        BandType = 4
        LayerName = BandLayer5
      end
      object ppDBText9: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        DataField = 'RECEBIDO'
        DataPipeline = DBPipeRubrica
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipeRubrica'
        mmHeight = 4763
        mmLeft = 73288
        mmTop = 0
        mmWidth = 30000
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
        LayerName = BandLayer5
      end
      object ppDBText7: TppDBText
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
      BreakName = 'ID_PROJETO'
      DataPipeline = DBPipeRubrica
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'GroupOrganizacao'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'DBPipeRubrica'
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
        object ppDBText8: TppDBText
          DesignLayer = ppDesignLayer1
          UserName = 'DBText18'
          DataField = 'NOME_PROJETO'
          DataPipeline = DBPipeRubrica
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'DBPipeRubrica'
          mmHeight = 4763
          mmLeft = 2117
          mmTop = 794
          mmWidth = 193146
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer5
        end
        object ppLabel4: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label4'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 5820
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer5
        end
        object ppLabel5: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label5'
          Caption = 'Or'#231'amento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 42333
          mmTop = 5821
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer5
        end
        object ppLabel6: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label6'
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 73288
          mmTop = 5821
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer5
        end
        object ppLabel7: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label7'
          Caption = 'Gasto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 104510
          mmTop = 5821
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer5
        end
        object ppLabel8: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label8'
          Caption = 'Aprovisionado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 135466
          mmTop = 5821
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer5
        end
        object ppLabel9: TppLabel
          DesignLayer = ppDesignLayer1
          UserName = 'Label9'
          Caption = 'Saldo Real'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 166950
          mmTop = 5821
          mmWidth = 14817
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
      ProgramStream = {00}
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
  object DBPipeRubrica: TppDBPipeline
    DataSource = dmRelatorio.dsSaldo_Rubrica
    UserName = 'DBPipeRubrica'
    Left = 592
    Top = 312
    object DBPipeRubricappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID_RUBRICA'
      FieldName = 'ID_RUBRICA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object DBPipeRubricappField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID_PROJETO'
      FieldName = 'ID_PROJETO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object DBPipeRubricappField3: TppField
      FieldAlias = 'NOME_PROJETO'
      FieldName = 'NOME_PROJETO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 2
    end
    object DBPipeRubricappField4: TppField
      FieldAlias = 'NOME_RUBRICA'
      FieldName = 'NOME_RUBRICA'
      FieldLength = 123
      DisplayWidth = 123
      Position = 3
    end
    object DBPipeRubricappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'RECEBIDO'
      FieldName = 'RECEBIDO'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 19
      Position = 4
    end
    object DBPipeRubricappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'GASTO'
      FieldName = 'GASTO'
      FieldLength = 6
      DataType = dtDouble
      DisplayWidth = 19
      Position = 5
    end
    object DBPipeRubricappField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'APROVISIONADO'
      FieldName = 'APROVISIONADO'
      FieldLength = 6
      DataType = dtDouble
      DisplayWidth = 19
      Position = 6
    end
    object DBPipeRubricappField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO_REAL'
      FieldName = 'SALDO_REAL'
      FieldLength = 6
      DataType = dtDouble
      DisplayWidth = 19
      Position = 7
    end
    object DBPipeRubricappField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORCAMENTO'
      FieldName = 'ORCAMENTO'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 8
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
end
