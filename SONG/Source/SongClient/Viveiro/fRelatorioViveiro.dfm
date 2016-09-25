inherited frmRelatorioViveiro: TfrmRelatorioViveiro
  Caption = 'Relat'#243'rios do Viveiro'
  ClientHeight = 480
  ExplicitHeight = 519
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBotoes: TPanel
    Height = 426
    TabOrder = 1
    ExplicitHeight = 426
  end
  inherited pnConfiguracoes: TPanel
    Height = 426
    TabOrder = 2
    ExplicitHeight = 426
    object pcPrincipal: TcxPageControl
      Left = 0
      Top = 0
      Width = 855
      Height = 426
      Align = alClient
      TabOrder = 0
      TabStop = False
      Properties.ActivePage = tabSaldos
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
        object Label12: TLabel
          Left = 7
          Top = 42
          Width = 115
          Height = 13
          Caption = 'Classifica'#231#227'o da Esp'#233'cie'
        end
        object Label13: TLabel
          Left = 7
          Top = 82
          Width = 143
          Height = 13
          Caption = 'Categoria de Armazenamento'
        end
        object lb4: TLabel
          Left = 7
          Top = 122
          Width = 74
          Height = 13
          Caption = 'Tipo da Esp'#233'cie'
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
        object cbClassificacaoEspecie: TcxImageComboBox
          Left = 4
          Top = 56
          RepositoryItem = dmLookup.repIcbClassificacaoEspecie
          Enabled = False
          Properties.Items = <>
          TabOrder = 2
          Width = 225
        end
        object chkTodasClassificacao: TcxCheckBox
          Left = 229
          Top = 58
          Caption = 'Todas'
          Properties.OnEditValueChanged = chkTodasClassificacaoPropertiesEditValueChanged
          State = cbsChecked
          TabOrder = 3
          Transparent = True
          Width = 69
        end
        object cbCategoriaArmazenagem: TcxImageComboBox
          Left = 4
          Top = 96
          RepositoryItem = dmLookup.repIcbCategoriaArmazenamento
          Enabled = False
          Properties.Items = <>
          TabOrder = 4
          Width = 225
        end
        object chkTodasCategoriaArmazenamento: TcxCheckBox
          Left = 229
          Top = 98
          Caption = 'Todas'
          Properties.OnEditValueChanged = chkTodasCategoriaArmazenamentoPropertiesEditValueChanged
          State = cbsChecked
          TabOrder = 5
          Transparent = True
          Width = 69
        end
        object chkTodosTipoEspecie: TcxCheckBox
          Left = 229
          Top = 138
          Caption = 'Todas'
          Properties.OnEditValueChanged = chkTodosTipoEspeciePropertiesEditValueChanged
          State = cbsChecked
          TabOrder = 6
          Transparent = True
          Width = 69
        end
        object chkApenasEspecieComSaldo: TcxCheckBox
          Left = 4
          Top = 219
          Caption = 'Apenas esp'#233'cies com saldo de semente ou muda'
          TabOrder = 7
          Width = 277
        end
        object cbTipo_Especie: TcxLookupComboBox
          Left = 4
          Top = 136
          RepositoryItem = dmLookup.repLcbTipoEspecie
          Enabled = False
          Properties.ListColumns = <>
          TabOrder = 8
          Width = 225
        end
        object cgBioma: TcxCheckGroup
          Left = 4
          Top = 164
          RepositoryItem = dmLookup.repCheckGroupBiomas
          Caption = 'Biomas'
          Properties.Items = <>
          TabOrder = 9
          Height = 50
          Width = 685
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
          TabOrder = 1
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
            TabOrder = 1
            ExplicitWidth = 848
            ExplicitHeight = 320
            inherited cxGrid1: TcxGrid
              ExplicitWidth = 397
              ExplicitHeight = 318
              inherited viewEsquerda: TcxGridDBTableView
                OptionsCustomize.ColumnsQuickCustomization = True
              end
            end
            inherited pnBotoes: TPanel
              ExplicitLeft = 398
              ExplicitWidth = 42
              ExplicitHeight = 318
              inherited btnAdd: TButton
                Width = 42
                ExplicitWidth = 42
              end
              inherited btnAddTodos: TButton
                Width = 42
                ExplicitWidth = 42
              end
              inherited btnRemover: TButton
                Width = 42
                ExplicitWidth = 42
              end
              inherited btnRemoverTodos: TButton
                Width = 42
                ExplicitWidth = 42
              end
            end
            inherited cxGrid2: TcxGrid
              ExplicitLeft = 440
              ExplicitWidth = 407
              ExplicitHeight = 318
              inherited viewDireita: TcxGridDBTableView
                OptionsCustomize.ColumnsQuickCustomization = True
                OptionsData.Editing = True
                OptionsView.ColumnAutoWidth = True
              end
            end
          end
          inherited pnLabels: TPanel
            Width = 848
            TabOrder = 0
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
                Width = 114
                Caption = 'Esp'#233'cies dispon'#237'veis'
                ExplicitWidth = 114
              end
              inherited lbInfoGridDireita: TLabel
                Width = 124
                Caption = 'Esp'#233'cies selecionadas'
                ExplicitLeft = 439
                ExplicitWidth = 124
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
          TabOrder = 0
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
      object tabProducaoMatriz: TcxTabSheet
        Caption = 'Matrizes mais Produtivas'
        ImageIndex = 2
        object lb1: TLabel
          Left = 5
          Top = 3
          Width = 36
          Height = 13
          Caption = 'Esp'#233'cie'
        end
        object cbEspecieMatrizProdutiva: TcxLookupComboBox
          Left = 2
          Top = 19
          RepositoryItem = dmLookup.repLcbEspecie
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 225
        end
        object chkTodasEspecieMatrizProdutiva: TcxCheckBox
          Left = 227
          Top = 20
          Caption = 'Todas'
          Properties.OnEditValueChanged = chkTodasEspecieProducaoMatrizPropertiesEditValueChanged
          TabOrder = 1
          Transparent = True
          Width = 69
        end
        object cgbDataMatrizProdutiva: TdxCheckGroupBox
          Left = 3
          Top = 43
          Caption = 'Filtrar por Per'#237'odo'
          CheckBox.Checked = False
          TabOrder = 2
          Height = 61
          Width = 280
          object Label6: TLabel
            Left = 6
            Top = 17
            Width = 53
            Height = 13
            Caption = 'Data Inicial'
          end
          object Label7: TLabel
            Left = 143
            Top = 17
            Width = 48
            Height = 13
            Caption = 'Data Final'
          end
          object EditDataInicialMatrizProdutiva: TcxDateEdit
            Left = 4
            Top = 30
            Enabled = False
            Properties.ShowTime = False
            TabOrder = 0
            Width = 135
          end
          object EditDataFinalMatrizProdutiva: TcxDateEdit
            Left = 141
            Top = 30
            Enabled = False
            Properties.ShowTime = False
            TabOrder = 1
            Width = 135
          end
        end
      end
      object tabLoteMudaComprado: TcxTabSheet
        Caption = 'Compra/Venda de Mudas'
        ImageIndex = 3
        object Label4: TLabel
          Left = 7
          Top = 61
          Width = 36
          Height = 13
          Caption = 'Esp'#233'cie'
        end
        object cbEspecieLoteMudaComprada: TcxLookupComboBox
          Left = 4
          Top = 77
          RepositoryItem = dmLookup.repLcbEspecie
          Properties.ListColumns = <>
          TabOrder = 1
          Width = 225
        end
        object cgbLoteMudaComprada: TdxCheckGroupBox
          Left = 5
          Top = 101
          Caption = 'Filtrar por Per'#237'odo'
          CheckBox.Checked = False
          TabOrder = 3
          Height = 61
          Width = 280
          object Label5: TLabel
            Left = 6
            Top = 17
            Width = 53
            Height = 13
            Caption = 'Data Inicial'
          end
          object Label8: TLabel
            Left = 143
            Top = 17
            Width = 48
            Height = 13
            Caption = 'Data Final'
          end
          object EditDataInicialLoteMudaComprada: TcxDateEdit
            Left = 4
            Top = 30
            Enabled = False
            Properties.ShowTime = False
            TabOrder = 0
            Width = 135
          end
          object EditDataFinalLoteMudaComprada: TcxDateEdit
            Left = 141
            Top = 30
            Enabled = False
            Properties.ShowTime = False
            TabOrder = 1
            Width = 135
          end
        end
        object chkTodosEspecieLoteMudaComprada: TcxCheckBox
          Left = 229
          Top = 78
          Caption = 'Todas'
          Properties.OnEditValueChanged = chkTodosEspecieLoteMudaCompradaPropertiesEditValueChanged
          TabOrder = 2
          Transparent = True
          Width = 69
        end
        object rgCompraVendaMuda: TcxRadioGroup
          Left = 4
          Top = 3
          Caption = 'Tipo de Relat'#243'rio'
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = 'Compra'
            end
            item
              Caption = 'Venda'
            end>
          ItemIndex = 0
          TabOrder = 0
          Height = 52
          Width = 281
        end
      end
      object tabLoteSementeComprado: TcxTabSheet
        Caption = 'Compra/Venda de Sementes'
        ImageIndex = 4
        object Label9: TLabel
          Left = 7
          Top = 60
          Width = 36
          Height = 13
          Caption = 'Esp'#233'cie'
        end
        object cbEspecieLoteSementeComprado: TcxLookupComboBox
          Left = 4
          Top = 76
          RepositoryItem = dmLookup.repLcbEspecie
          Properties.ListColumns = <>
          TabOrder = 1
          Width = 225
        end
        object cgbLoteSementeComprado: TdxCheckGroupBox
          Left = 5
          Top = 100
          Caption = 'Filtrar por Per'#237'odo'
          CheckBox.Checked = False
          TabOrder = 3
          Height = 61
          Width = 280
          object Label10: TLabel
            Left = 6
            Top = 17
            Width = 53
            Height = 13
            Caption = 'Data Inicial'
          end
          object Label11: TLabel
            Left = 143
            Top = 17
            Width = 48
            Height = 13
            Caption = 'Data Final'
          end
          object EditDataInicialLoteSementeComprado: TcxDateEdit
            Left = 4
            Top = 30
            Enabled = False
            Properties.ShowTime = False
            TabOrder = 0
            Width = 135
          end
          object EditDataFinalLoteSementeComprado: TcxDateEdit
            Left = 142
            Top = 30
            Enabled = False
            Properties.ShowTime = False
            TabOrder = 1
            Width = 135
          end
        end
        object chkTodosEspecieLoteSementeComprado: TcxCheckBox
          Left = 229
          Top = 77
          Caption = 'Todas'
          Properties.OnEditValueChanged = chkTodosEspecieLoteSementeCompradoPropertiesEditValueChanged
          TabOrder = 2
          Transparent = True
          Width = 69
        end
        object rgCompraVendaSemente: TcxRadioGroup
          Left = 4
          Top = 3
          Caption = 'Tipo de Relat'#243'rio'
          Properties.Columns = 2
          Properties.Items = <
            item
              Caption = 'Compra'
            end
            item
              Caption = 'Venda'
            end>
          ItemIndex = 0
          TabOrder = 0
          Height = 52
          Width = 281
        end
      end
      object tabTubetesSemeados: TcxTabSheet
        Caption = 'Tubetes Semeados'
        ImageIndex = 5
        object lb3: TLabel
          Left = 6
          Top = 3
          Width = 36
          Height = 13
          Caption = 'Esp'#233'cie'
        end
        object cbEspecieTubete: TcxLookupComboBox
          Left = 3
          Top = 19
          RepositoryItem = dmLookup.repLcbEspecie
          Enabled = False
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 225
        end
        object chkTodasEspecieTubete: TcxCheckBox
          Left = 228
          Top = 20
          Caption = 'Todas'
          Properties.OnEditValueChanged = chkTodasEspecieTubetePropertiesEditValueChanged
          State = cbsChecked
          TabOrder = 1
          Transparent = True
          Width = 69
        end
      end
    end
  end
  inherited pnOrganizacao: TPanel
    TabOrder = 0
    inherited chkTodasOrganizacoes: TcxCheckBox
      ExplicitHeight = 19
    end
  end
  inherited ActionList: TActionList
    Left = 416
    Top = 0
    object Ac_Informacao_Previsao_Producao: TAction
      Caption = 'Sobre este Relat'#243'rio'
      ImageIndex = 16
      OnExecute = Ac_Informacao_Previsao_ProducaoExecute
    end
  end
  inherited dsOrganizacao: TDataSource
    Left = 344
    Top = 0
  end
  object ppSaldo_Especie: TppReport
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
        Caption = 'Saldos de Sementes e Mudas por Esp'#233'cie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5028
        mmLeft = 56356
        mmTop = 15610
        mmWidth = 84403
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
        Font.Size = 7
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 22225
        mmWidth = 6879
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
        Font.Size = 7
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 2910
        mmLeft = 38818
        mmTop = 22225
        mmWidth = 19315
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
        Font.Size = 7
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 2910
        mmLeft = 104109
        mmTop = 21983
        mmWidth = 17198
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label7'
        Caption = 'Mudas Prontas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 2910
        mmLeft = 157769
        mmTop = 22225
        mmWidth = 17728
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
        Caption = 'Mudas em Desenvolvimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 122512
        mmTop = 22225
        mmWidth = 33338
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label9'
        Caption = 'Total de Mudas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 2910
        mmLeft = 177536
        mmTop = 22225
        mmWidth = 17991
        BandType = 0
        LayerName = BandLayer4
      end
      object ppLabel56: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label56'
        Caption = 'Fam'#237'lia Bot'#226'nica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 2910
        mmLeft = 72118
        mmTop = 22225
        mmWidth = 20109
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
        UserName = 'DBQtdeMudaPronta'
        DataField = 'QTDE_MUDA_PRONTA'
        DataPipeline = DBPipeSaldoEspecie
        DisplayFormat = ',0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeSaldoEspecie'
        mmHeight = 4763
        mmLeft = 158278
        mmTop = 0
        mmWidth = 17799
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
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeSaldoEspecie'
        mmHeight = 4763
        mmLeft = 2115
        mmTop = 0
        mmWidth = 35358
        BandType = 4
        LayerName = BandLayer4
      end
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText2'
        DataField = 'QTDE_SEMENTE_ESTOQUE'
        DataPipeline = DBPipeSaldoEspecie
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeSaldoEspecie'
        mmHeight = 4763
        mmLeft = 104523
        mmTop = 0
        mmWidth = 17318
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
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeSaldoEspecie'
        mmHeight = 4763
        mmLeft = 38819
        mmTop = 0
        mmWidth = 32712
        BandType = 4
        LayerName = BandLayer4
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBQtdeMudaDesenvolvimento'
        DataField = 'QTDE_MUDA_DESENVOLVIMENTO'
        DataPipeline = DBPipeSaldoEspecie
        DisplayFormat = ',0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeSaldoEspecie'
        mmHeight = 4763
        mmLeft = 125076
        mmTop = 0
        mmWidth = 31269
        BandType = 4
        LayerName = BandLayer4
      end
      object ppDBText11: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText11'
        DataField = 'CALC_TOTAL_MUDA'
        DataPipeline = DBPipeSaldoEspecie
        DisplayFormat = ',0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeSaldoEspecie'
        mmHeight = 4763
        mmLeft = 177498
        mmTop = 0
        mmWidth = 17559
        BandType = 4
        LayerName = BandLayer4
      end
      object ppDBText57: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText57'
        DataField = 'FAMILIA_BOTANICA'
        DataPipeline = DBPipeSaldoEspecie
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeSaldoEspecie'
        mmHeight = 4763
        mmLeft = 72035
        mmTop = 0
        mmWidth = 30956
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
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 24606
      mmPrintPosition = 0
      object ppLabel13: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label8'
        Caption = 'Total de Sementes:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 109273
        mmTop = 11967
        mmWidth = 32544
        BandType = 7
        LayerName = BandLayer4
      end
      object ppLabel14: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label14'
        Caption = 'Total de Mudas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4234
        mmLeft = 109290
        mmTop = 17282
        mmWidth = 26723
        BandType = 7
        LayerName = BandLayer4
      end
      object ppDBCalc1: TppDBCalc
        DesignLayer = ppDesignLayer4
        UserName = 'DBCalc1'
        DataField = 'QTDE_SEMENTE_ESTOQUE'
        DataPipeline = DBPipeSaldoEspecie
        DisplayFormat = ',0.00 Kg'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'DBPipeSaldoEspecie'
        mmHeight = 4498
        mmLeft = 143820
        mmTop = 11966
        mmWidth = 51858
        BandType = 7
        LayerName = BandLayer4
      end
      object ppDBCalc2: TppDBCalc
        DesignLayer = ppDesignLayer4
        UserName = 'DBCalc2'
        DataField = 'CALC_TOTAL_MUDA'
        DataPipeline = DBPipeSaldoEspecie
        DisplayFormat = ',0 Und'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'DBPipeSaldoEspecie'
        mmHeight = 4498
        mmLeft = 143819
        mmTop = 17062
        mmWidth = 51858
        BandType = 7
        LayerName = BandLayer4
      end
      object ppLabel54: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label54'
        Caption = 'Total de Esp'#233'cies:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4234
        mmLeft = 109318
        mmTop = 1058
        mmWidth = 30427
        BandType = 7
        LayerName = BandLayer4
      end
      object ppLabel55: TppLabel
        DesignLayer = ppDesignLayer4
        UserName = 'Label55'
        Caption = 'Total de Fam'#237'lias:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 109212
        mmTop = 6350
        mmWidth = 30162
        BandType = 7
        LayerName = BandLayer4
      end
      object ppDBCalc16: TppDBCalc
        DesignLayer = ppDesignLayer4
        UserName = 'DBCalc16'
        DataField = 'ID'
        DataPipeline = DBPipeSaldoEspecie
        DisplayFormat = ',0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'DBPipeSaldoEspecie'
        mmHeight = 4498
        mmLeft = 143714
        mmTop = 665
        mmWidth = 35117
        BandType = 7
        LayerName = BandLayer4
      end
      object ppDBText53: TppDBText
        DesignLayer = ppDesignLayer4
        UserName = 'DBText53'
        DataField = 'QTDE_FAMILIA'
        DataPipeline = DBPipeSaldoEspecie
        DisplayFormat = ',0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'DBPipeSaldoEspecie'
        mmHeight = 4763
        mmLeft = 143759
        mmTop = 5821
        mmWidth = 21696
        BandType = 7
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
    Left = 504
    Top = 264
    object DBPipeSaldoEspecieppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
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
      Alignment = taRightJustify
      FieldAlias = 'QTDE_MUDA_PRONTA'
      FieldName = 'QTDE_MUDA_PRONTA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object DBPipeSaldoEspecieppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE_MUDA_DESENVOLVIMENTO'
      FieldName = 'QTDE_MUDA_DESENVOLVIMENTO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object DBPipeSaldoEspecieppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CALC_TOTAL_MUDA'
      FieldName = 'CALC_TOTAL_MUDA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object DBPipeSaldoEspecieppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID_FAMILIA_BOTANICA'
      FieldName = 'ID_FAMILIA_BOTANICA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object DBPipeSaldoEspecieppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object DBPipeSaldoEspecieppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE_FAMILIA'
      FieldName = 'QTDE_FAMILIA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 9
    end
  end
  object DBPipeOrganizacao: TppDBPipeline
    DataSource = dsOrganizacao
    UserName = 'DBPipeOrganizacao'
    Left = 504
    Top = 65528
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
  object cdsEspecieSelecionada: TRFClientDataSet
    Aggregates = <>
    Params = <>
    RFApplyAutomatico = False
    Left = 544
    Top = 96
    object cdsEspecieSelecionadaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
    end
    object cdsEspecieSelecionadaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsEspecieSelecionadaNOME_CIENTIFICO: TStringField
      DisplayLabel = 'Nome cient'#237'fico'
      FieldName = 'NOME_CIENTIFICO'
      ProviderFlags = []
      Size = 100
    end
    object cdsEspecieSelecionadaFAMILIA_BOTANICA: TStringField
      DisplayLabel = 'Fam'#237'lia Bot'#226'nica'
      FieldName = 'FAMILIA_BOTANICA'
      ProviderFlags = []
      Size = 100
    end
    object cdsEspecieSelecionadaTEMPO_GERMINACAO: TIntegerField
      DisplayLabel = 'Tempo de Germina'#231#227'o'
      FieldName = 'TEMPO_GERMINACAO'
      ProviderFlags = []
    end
    object cdsEspecieSelecionadaTEMPO_DESENVOLVIMENTO: TIntegerField
      DisplayLabel = 'Tempo de Desenvolvimento'
      FieldName = 'TEMPO_DESENVOLVIMENTO'
      ProviderFlags = []
    end
    object cdsEspecieSelecionadaTAXA_CLASSIFICACAO: TBCDField
      DisplayLabel = 'Taxa de Classifica'#231#227'o'
      FieldName = 'TAXA_CLASSIFICACAO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object cdsEspecieSelecionadaTAXA_GERMINACAO: TBCDField
      DisplayLabel = 'Taxa de Germina'#231#227'o'
      FieldName = 'TAXA_GERMINACAO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object cdsEspecieSelecionadaQTDE_MUDA_PRONTA: TIntegerField
      DisplayLabel = 'Qtde. de Muda Pronta'
      FieldName = 'QTDE_MUDA_PRONTA'
      ProviderFlags = []
    end
    object cdsEspecieSelecionadaQTDE_MUDA_DESENVOLVIMENTO: TIntegerField
      DisplayLabel = 'Qtde. de Muda em Desenvolvimento'
      FieldName = 'QTDE_MUDA_DESENVOLVIMENTO'
      ProviderFlags = []
    end
    object cdsEspecieSelecionadaQTDE_SEMENTE_ESTOQUE: TBCDField
      DisplayLabel = 'Qtde. de Semente em Estoque'
      FieldName = 'QTDE_SEMENTE_ESTOQUE'
      Precision = 18
      Size = 2
    end
    object cdsEspecieSelecionadaQTDE_SEMENTE_KILO: TIntegerField
      DisplayLabel = 'Qtde. de Sementes Por Kilo'
      FieldName = 'QTDE_SEMENTE_KILO'
    end
  end
  object ppPrevisao_Producao: TppReport
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
    Top = 65528
    object cdsParametrosDATA_PREVISAO: TDateField
      FieldName = 'DATA_PREVISAO'
    end
  end
  object DBPipePrevisaoProducao: TppDBPipeline
    DataSource = dsPrevisaoProducao
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
      FieldAlias = 'QTDE_MUDA_PRONTA'
      FieldName = 'QTDE_MUDA_PRONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DBPipePrevisaoProducaoppField6: TppField
      FieldAlias = 'QTDE_MUDA_DESENVOLVIMENTO'
      FieldName = 'QTDE_MUDA_DESENVOLVIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object DBPipePrevisaoProducaoppField7: TppField
      FieldAlias = 'QTDE_SEMENTE_ESTOQUE'
      FieldName = 'QTDE_SEMENTE_ESTOQUE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object DBPipePrevisaoProducaoppField8: TppField
      FieldAlias = 'QTDE_SEMENTE_KILO'
      FieldName = 'QTDE_SEMENTE_KILO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
  end
  object DBPipeParametros: TppDBPipeline
    DataSource = dsParametros
    UserName = 'DBPipeParametros'
    Left = 752
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
  end
  object cdsPrevisaoProducao: TRFClientDataSet
    Aggregates = <>
    Params = <>
    RFApplyAutomatico = False
    Left = 616
    Top = 192
    object cdsPrevisaoProducaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
    end
    object cdsPrevisaoProducaoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsPrevisaoProducaoNOME_CIENTIFICO: TStringField
      FieldName = 'NOME_CIENTIFICO'
      ProviderFlags = []
      Size = 100
    end
    object cdsPrevisaoProducaoFAMILIA_BOTANICA: TStringField
      FieldName = 'FAMILIA_BOTANICA'
      ProviderFlags = []
      Size = 100
    end
    object cdsPrevisaoProducaoQTDE_MUDA_PRONTA: TIntegerField
      FieldName = 'QTDE_MUDA_PRONTA'
      ProviderFlags = []
    end
    object cdsPrevisaoProducaoQTDE_MUDA_DESENVOLVIMENTO: TIntegerField
      FieldName = 'QTDE_MUDA_DESENVOLVIMENTO'
      ProviderFlags = []
    end
    object cdsPrevisaoProducaoQTDE_SEMENTE_ESTOQUE: TBCDField
      FieldName = 'QTDE_SEMENTE_ESTOQUE'
      Precision = 18
      Size = 2
    end
    object cdsPrevisaoProducaoQTDE_SEMENTE_KILO: TIntegerField
      FieldName = 'QTDE_SEMENTE_KILO'
    end
  end
  object dsPrevisaoProducao: TDataSource
    DataSet = cdsPrevisaoProducao
    Left = 512
    Top = 192
  end
  object DBPipeMatrizProdutiva: TppDBPipeline
    DataSource = dsMatriz_Produtiva
    UserName = 'DBPipeMatrizProdutiva'
    Left = 376
    Top = 256
    object DBPipeMatrizProdutivappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID_ESPECIE'
      FieldName = 'ID_ESPECIE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object DBPipeMatrizProdutivappField2: TppField
      FieldAlias = 'ESPECIE'
      FieldName = 'ESPECIE'
      FieldLength = 100
      DisplayWidth = 100
      Position = 1
    end
    object DBPipeMatrizProdutivappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID_MATRIZ'
      FieldName = 'ID_MATRIZ'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object DBPipeMatrizProdutivappField4: TppField
      FieldAlias = 'MATRIZ'
      FieldName = 'MATRIZ'
      FieldLength = 100
      DisplayWidth = 100
      Position = 3
    end
    object DBPipeMatrizProdutivappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'TAXA'
      FieldName = 'TAXA'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 4
    end
  end
  object ppMatriz_Produtiva: TppReport
    AutoStop = False
    DataPipeline = DBPipeMatrizProdutiva
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
    Left = 376
    Top = 328
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'DBPipeMatrizProdutiva'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 21696
      mmPrintPosition = 0
      object pplbTituloMatrizProdutiva: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label1'
        Caption = 'Matrizes mais Produtivas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5028
        mmLeft = 74613
        mmTop = 15610
        mmWidth = 50535
        BandType = 0
        LayerName = BandLayer3
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
        mmTop = 0
        mmWidth = 30692
        BandType = 0
        LayerName = BandLayer3
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
        mmTop = 13439
        mmWidth = 14287
        BandType = 0
        LayerName = BandLayer3
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
        mmTop = 16880
        mmWidth = 11113
        BandType = 0
        LayerName = BandLayer3
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText13: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText101'
        DataField = 'MATRIZ'
        DataPipeline = DBPipeMatrizProdutiva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeMatrizProdutiva'
        mmHeight = 4763
        mmLeft = 2115
        mmTop = 0
        mmWidth = 165894
        BandType = 4
        LayerName = BandLayer3
      end
      object ppDBText17: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText11'
        DataField = 'TAXA'
        DataPipeline = DBPipeMatrizProdutiva
        DisplayFormat = ',0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DBPipeMatrizProdutiva'
        mmHeight = 4763
        mmLeft = 169862
        mmTop = 0
        mmWidth = 25665
        BandType = 4
        LayerName = BandLayer3
      end
    end
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLabel22: TppLabel
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
        LayerName = BandLayer3
      end
      object ppDBText18: TppDBText
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
        LayerName = BandLayer3
      end
      object ppDBText19: TppDBText
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
        LayerName = BandLayer3
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 193939
        mmTop = 529
        mmWidth = 1587
        BandType = 8
        LayerName = BandLayer3
      end
    end
    object ppSummaryBand2: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'ID_ESPECIE'
      DataPipeline = DBPipeMatrizProdutiva
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'DBPipeMatrizProdutiva'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppShape2: TppShape
          DesignLayer = ppDesignLayer2
          UserName = 'Shape2'
          Brush.Color = clGray
          mmHeight = 4763
          mmLeft = 1852
          mmTop = 529
          mmWidth = 194998
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer3
        end
        object ppDBText20: TppDBText
          DesignLayer = ppDesignLayer2
          UserName = 'DBText5'
          DataField = 'ESPECIE'
          DataPipeline = DBPipeMatrizProdutiva
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'DBPipeMatrizProdutiva'
          mmHeight = 4763
          mmLeft = 2383
          mmTop = 529
          mmWidth = 193940
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer3
        end
        object ppLabel16: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label3'
          Caption = 'Nome da Matriz'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 5556
          mmWidth = 22489
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer3
        end
        object ppLabel21: TppLabel
          DesignLayer = ppDesignLayer2
          UserName = 'Label9'
          Caption = 'Taxa de Produ'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 169863
          mmTop = 5556
          mmWidth = 25664
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer3
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
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'BandLayer3'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object dsMatriz_Produtiva: TDataSource
    DataSet = dmRelatorio.cdsMatriz_Produtiva
    Left = 456
    Top = 152
  end
  object ppLote_Muda_Comprado: TppReport
    AutoStop = False
    DataPipeline = DBPipeLote_Muda_Comprado
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
    Left = 768
    Top = 320
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'DBPipeLote_Muda_Comprado'
    object ppHeaderBand3: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 21431
      mmPrintPosition = 0
      object pplbTituloLoteMudaComprado: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label1'
        Caption = 'Mudas Compradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5028
        mmLeft = 80963
        mmTop = 15610
        mmWidth = 38100
        BandType = 0
        LayerName = BandLayer5
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
        mmTop = 0
        mmWidth = 30692
        BandType = 0
        LayerName = BandLayer5
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
        mmTop = 13439
        mmWidth = 14287
        BandType = 0
        LayerName = BandLayer5
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
        mmTop = 16880
        mmWidth = 11113
        BandType = 0
        LayerName = BandLayer5
      end
    end
    object ppDetailBand3: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText12: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText9'
        DataField = 'VALOR_UNITARIO'
        DataPipeline = DBPipeLote_Muda_Comprado
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLote_Muda_Comprado'
        mmHeight = 4763
        mmLeft = 133347
        mmTop = 0
        mmWidth = 25665
        BandType = 4
        LayerName = BandLayer5
      end
      object ppDBText14: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText101'
        DataField = 'DATA'
        DataPipeline = DBPipeLote_Muda_Comprado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLote_Muda_Comprado'
        mmHeight = 4763
        mmLeft = 2115
        mmTop = 0
        mmWidth = 22754
        BandType = 4
        LayerName = BandLayer5
      end
      object ppDBText15: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText2'
        DataField = 'QTDE'
        DataPipeline = DBPipeLote_Muda_Comprado
        DisplayFormat = ',0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLote_Muda_Comprado'
        mmHeight = 4763
        mmLeft = 117741
        mmTop = 0
        mmWidth = 15081
        BandType = 4
        LayerName = BandLayer5
      end
      object ppDBText16: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText3'
        DataField = 'FORNECEDOR'
        DataPipeline = DBPipeLote_Muda_Comprado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLote_Muda_Comprado'
        mmHeight = 4763
        mmLeft = 26988
        mmTop = 0
        mmWidth = 89429
        BandType = 4
        LayerName = BandLayer5
      end
      object ppDBText21: TppDBText
        DesignLayer = ppDesignLayer3
        UserName = 'DBText21'
        DataField = 'VALOR'
        DataPipeline = DBPipeLote_Muda_Comprado
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLote_Muda_Comprado'
        mmHeight = 4763
        mmLeft = 160602
        mmTop = 0
        mmWidth = 34925
        BandType = 4
        LayerName = BandLayer5
      end
    end
    object ppFooterBand3: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLabel27: TppLabel
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
        LayerName = BandLayer5
      end
      object ppDBText23: TppDBText
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
        LayerName = BandLayer5
      end
      object ppDBText24: TppDBText
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
        LayerName = BandLayer5
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 193939
        mmTop = 529
        mmWidth = 1587
        BandType = 8
        LayerName = BandLayer5
      end
    end
    object ppSummaryBand3: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppDBCalc3: TppDBCalc
        DesignLayer = ppDesignLayer3
        UserName = 'DBCalc3'
        DataField = 'VALOR'
        DataPipeline = DBPipeLote_Muda_Comprado
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'DBPipeLote_Muda_Comprado'
        mmHeight = 4498
        mmLeft = 160602
        mmTop = 5292
        mmWidth = 34925
        BandType = 7
        LayerName = BandLayer5
      end
      object ppLabel15: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label15'
        Caption = 'Valor Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 139965
        mmTop = 5292
        mmWidth = 19579
        BandType = 7
        LayerName = BandLayer5
      end
      object ppLabel42: TppLabel
        DesignLayer = ppDesignLayer3
        UserName = 'Label42'
        Caption = 'Total de Mudas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 132822
        mmTop = 0
        mmWidth = 26723
        BandType = 7
        LayerName = BandLayer5
      end
      object ppDBCalc13: TppDBCalc
        DesignLayer = ppDesignLayer3
        UserName = 'DBCalc13'
        DataField = 'QTDE'
        DataPipeline = DBPipeLote_Muda_Comprado
        DisplayFormat = ',0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'DBPipeLote_Muda_Comprado'
        mmHeight = 4498
        mmLeft = 160602
        mmTop = 0
        mmWidth = 34925
        BandType = 7
        LayerName = BandLayer5
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'ID_ESPECIE'
      DataPipeline = DBPipeLote_Muda_Comprado
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'DBPipeLote_Muda_Comprado'
      NewFile = False
      object ppGroupHeaderBand2: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 9790
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
          LayerName = BandLayer5
        end
        object ppLabel17: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label3'
          Caption = 'Data da Compra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 5295
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer5
        end
        object ppLabel18: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label4'
          Caption = 'Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 26988
          mmTop = 5295
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer5
        end
        object ppLabel19: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label6'
          Caption = 'Qtde.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 117739
          mmTop = 5295
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer5
        end
        object ppLabel20: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label7'
          Caption = 'Valor Unit'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 133350
          mmTop = 5295
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer5
        end
        object ppLabel26: TppLabel
          DesignLayer = ppDesignLayer3
          UserName = 'Label9'
          Caption = 'Valor Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 160868
          mmTop = 5295
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer5
        end
        object ppDBText22: TppDBText
          DesignLayer = ppDesignLayer3
          UserName = 'DBText22'
          DataField = 'ESPECIE'
          DataPipeline = DBPipeLote_Muda_Comprado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'DBPipeLote_Muda_Comprado'
          mmHeight = 4763
          mmLeft = 2381
          mmTop = 529
          mmWidth = 193940
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer5
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBCalc4: TppDBCalc
          DesignLayer = ppDesignLayer3
          UserName = 'DBCalc4'
          DataField = 'VALOR'
          DataPipeline = DBPipeLote_Muda_Comprado
          DisplayFormat = '$ ,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          Transparent = True
          DataPipelineName = 'DBPipeLote_Muda_Comprado'
          mmHeight = 4498
          mmLeft = 160602
          mmTop = 0
          mmWidth = 34925
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer5
        end
        object ppDBCalc14: TppDBCalc
          DesignLayer = ppDesignLayer3
          UserName = 'DBCalc14'
          DataField = 'QTDE'
          DataPipeline = DBPipeLote_Muda_Comprado
          DisplayFormat = ',0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          Transparent = True
          DataPipelineName = 'DBPipeLote_Muda_Comprado'
          mmHeight = 4498
          mmLeft = 117740
          mmTop = 0
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer5
        end
      end
    end
    object raCodeModule4: TraCodeModule
      ProgramStream = {00}
    end
    object ppDesignLayers3: TppDesignLayers
      object ppDesignLayer3: TppDesignLayer
        UserName = 'BandLayer5'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList3: TppParameterList
    end
  end
  object DBPipeLote_Muda_Comprado: TppDBPipeline
    DataSource = dsLote_Muda_Comprado
    UserName = 'DBPipeLote_Muda_Comprado'
    Left = 768
    Top = 256
    object DBPipeLote_Muda_CompradoppField1: TppField
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Muda_CompradoppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Muda_CompradoppField3: TppField
      FieldAlias = 'ID_ESPECIE'
      FieldName = 'ID_ESPECIE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Muda_CompradoppField4: TppField
      FieldAlias = 'ESPECIE'
      FieldName = 'ESPECIE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Muda_CompradoppField5: TppField
      FieldAlias = 'ID_FORNECEDOR'
      FieldName = 'ID_FORNECEDOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Muda_CompradoppField6: TppField
      FieldAlias = 'FORNECEDOR'
      FieldName = 'FORNECEDOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Muda_CompradoppField7: TppField
      FieldAlias = 'VALOR_UNITARIO'
      FieldName = 'VALOR_UNITARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Muda_CompradoppField8: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Muda_CompradoppField9: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Muda_CompradoppField10: TppField
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object dsLote_Muda_Comprado: TDataSource
    DataSet = dmRelatorio.cdsLote_Muda_Comprado
    Left = 768
    Top = 176
  end
  object ppLote_Semente_Comprado: TppReport
    AutoStop = False
    DataPipeline = DBPipeLote_Semente_Comprado
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
    Left = 904
    Top = 328
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'DBPipeLote_Semente_Comprado'
    object ppHeaderBand5: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 21431
      mmPrintPosition = 0
      object ppLbTituloLoteSementeComprado: TppLabel
        DesignLayer = ppDesignLayer5
        UserName = 'Label1'
        Caption = 'Sementes Compradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5028
        mmLeft = 77788
        mmTop = 15610
        mmWidth = 44714
        BandType = 0
        LayerName = BandLayer6
      end
      object ppDBImage5: TppDBImage
        DesignLayer = ppDesignLayer5
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
        LayerName = BandLayer6
      end
      object ppSystemVariable13: TppSystemVariable
        DesignLayer = ppDesignLayer5
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
        LayerName = BandLayer6
      end
      object ppSystemVariable14: TppSystemVariable
        DesignLayer = ppDesignLayer5
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
        LayerName = BandLayer6
      end
    end
    object ppDetailBand5: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText27: TppDBText
        DesignLayer = ppDesignLayer5
        UserName = 'DBText9'
        DataField = 'VALOR_UNITARIO'
        DataPipeline = DBPipeLote_Semente_Comprado
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLote_Semente_Comprado'
        mmHeight = 4763
        mmLeft = 133347
        mmTop = 0
        mmWidth = 25665
        BandType = 4
        LayerName = BandLayer6
      end
      object ppDBText30: TppDBText
        DesignLayer = ppDesignLayer5
        UserName = 'DBText101'
        DataField = 'DATA'
        DataPipeline = DBPipeLote_Semente_Comprado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLote_Semente_Comprado'
        mmHeight = 4763
        mmLeft = 2115
        mmTop = 0
        mmWidth = 22754
        BandType = 4
        LayerName = BandLayer6
      end
      object ppDBText31: TppDBText
        DesignLayer = ppDesignLayer5
        UserName = 'DBText2'
        DataField = 'QTDE'
        DataPipeline = DBPipeLote_Semente_Comprado
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLote_Semente_Comprado'
        mmHeight = 4763
        mmLeft = 117741
        mmTop = 0
        mmWidth = 15081
        BandType = 4
        LayerName = BandLayer6
      end
      object ppDBText32: TppDBText
        DesignLayer = ppDesignLayer5
        UserName = 'DBText3'
        DataField = 'FORNECEDOR'
        DataPipeline = DBPipeLote_Semente_Comprado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLote_Semente_Comprado'
        mmHeight = 4763
        mmLeft = 26988
        mmTop = 0
        mmWidth = 89429
        BandType = 4
        LayerName = BandLayer6
      end
      object ppDBText33: TppDBText
        DesignLayer = ppDesignLayer5
        UserName = 'DBText21'
        DataField = 'VALOR'
        DataPipeline = DBPipeLote_Semente_Comprado
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLote_Semente_Comprado'
        mmHeight = 4763
        mmLeft = 160602
        mmTop = 0
        mmWidth = 34925
        BandType = 4
        LayerName = BandLayer6
      end
    end
    object ppFooterBand5: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLabel28: TppLabel
        DesignLayer = ppDesignLayer5
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
        LayerName = BandLayer6
      end
      object ppDBText34: TppDBText
        DesignLayer = ppDesignLayer5
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
        LayerName = BandLayer6
      end
      object ppDBText35: TppDBText
        DesignLayer = ppDesignLayer5
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
        LayerName = BandLayer6
      end
      object ppSystemVariable15: TppSystemVariable
        DesignLayer = ppDesignLayer5
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
        LayerName = BandLayer6
      end
    end
    object ppSummaryBand4: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 12171
      mmPrintPosition = 0
      object ppDBCalc5: TppDBCalc
        DesignLayer = ppDesignLayer5
        UserName = 'DBCalc3'
        DataField = 'VALOR'
        DataPipeline = DBPipeLote_Semente_Comprado
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'DBPipeLote_Semente_Comprado'
        mmHeight = 4498
        mmLeft = 160602
        mmTop = 5292
        mmWidth = 34925
        BandType = 7
        LayerName = BandLayer6
      end
      object ppLabel29: TppLabel
        DesignLayer = ppDesignLayer5
        UserName = 'Label15'
        Caption = 'Valor Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 137849
        mmTop = 5292
        mmWidth = 19579
        BandType = 7
        LayerName = BandLayer6
      end
      object ppLabel25: TppLabel
        DesignLayer = ppDesignLayer5
        UserName = 'Label25'
        Caption = 'Total Sementes:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 129911
        mmTop = 0
        mmWidth = 27252
        BandType = 7
        LayerName = BandLayer6
      end
      object ppDBCalc12: TppDBCalc
        DesignLayer = ppDesignLayer5
        UserName = 'DBCalc12'
        DataField = 'QTDE'
        DataPipeline = DBPipeLote_Semente_Comprado
        DisplayFormat = ',0.00 Kg'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'DBPipeLote_Semente_Comprado'
        mmHeight = 4498
        mmLeft = 160602
        mmTop = 0
        mmWidth = 34925
        BandType = 7
        LayerName = BandLayer6
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'ID_ESPECIE'
      DataPipeline = DBPipeLote_Semente_Comprado
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'DBPipeLote_Semente_Comprado'
      NewFile = False
      object ppGroupHeaderBand3: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppShape3: TppShape
          DesignLayer = ppDesignLayer5
          UserName = 'Shape1'
          Brush.Color = clGray
          mmHeight = 4763
          mmLeft = 1852
          mmTop = 529
          mmWidth = 194998
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer6
        end
        object ppLabel30: TppLabel
          DesignLayer = ppDesignLayer5
          UserName = 'Label3'
          Caption = 'Data da Compra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 5295
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer6
        end
        object ppLabel31: TppLabel
          DesignLayer = ppDesignLayer5
          UserName = 'Label4'
          Caption = 'Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 26988
          mmTop = 5295
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer6
        end
        object ppLabel32: TppLabel
          DesignLayer = ppDesignLayer5
          UserName = 'Label6'
          Caption = 'Qtde (Kg)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 117740
          mmTop = 5292
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer6
        end
        object ppLabel33: TppLabel
          DesignLayer = ppDesignLayer5
          UserName = 'Label7'
          Caption = 'Valor Unit'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 133350
          mmTop = 5295
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer6
        end
        object ppLabel34: TppLabel
          DesignLayer = ppDesignLayer5
          UserName = 'Label9'
          Caption = 'Valor Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 160868
          mmTop = 5295
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer6
        end
        object ppDBText36: TppDBText
          DesignLayer = ppDesignLayer5
          UserName = 'DBText22'
          DataField = 'ESPECIE'
          DataPipeline = DBPipeLote_Semente_Comprado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'DBPipeLote_Semente_Comprado'
          mmHeight = 4763
          mmLeft = 2381
          mmTop = 529
          mmWidth = 193940
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer6
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBCalc6: TppDBCalc
          DesignLayer = ppDesignLayer5
          UserName = 'DBCalc4'
          DataField = 'VALOR'
          DataPipeline = DBPipeLote_Semente_Comprado
          DisplayFormat = '$ ,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          Transparent = True
          DataPipelineName = 'DBPipeLote_Semente_Comprado'
          mmHeight = 4498
          mmLeft = 159279
          mmTop = 264
          mmWidth = 34925
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer6
        end
        object ppDBCalc11: TppDBCalc
          DesignLayer = ppDesignLayer5
          UserName = 'DBCalc11'
          DataField = 'QTDE'
          DataPipeline = DBPipeLote_Semente_Comprado
          DisplayFormat = ',0.00 Kg'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          Transparent = True
          DataPipelineName = 'DBPipeLote_Semente_Comprado'
          mmHeight = 4498
          mmLeft = 117740
          mmTop = 265
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer6
        end
      end
    end
    object raCodeModule5: TraCodeModule
      ProgramStream = {00}
    end
    object ppDesignLayers5: TppDesignLayers
      object ppDesignLayer5: TppDesignLayer
        UserName = 'BandLayer6'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList5: TppParameterList
    end
  end
  object DBPipeLote_Semente_Comprado: TppDBPipeline
    DataSource = dsLote_Semente_Comprado
    UserName = 'DBPipeLote_Semente_Comprado'
    Left = 904
    Top = 264
    object DBPipeLote_Semente_CompradoppField1: TppField
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Semente_CompradoppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Semente_CompradoppField3: TppField
      FieldAlias = 'ID_ESPECIE'
      FieldName = 'ID_ESPECIE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Semente_CompradoppField4: TppField
      FieldAlias = 'ESPECIE'
      FieldName = 'ESPECIE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Semente_CompradoppField5: TppField
      FieldAlias = 'ID_FORNECEDOR'
      FieldName = 'ID_FORNECEDOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Semente_CompradoppField6: TppField
      FieldAlias = 'FORNECEDOR'
      FieldName = 'FORNECEDOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Semente_CompradoppField7: TppField
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Semente_CompradoppField8: TppField
      FieldAlias = 'VALOR_UNITARIO'
      FieldName = 'VALOR_UNITARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Semente_CompradoppField9: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Semente_CompradoppField10: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object dsLote_Semente_Comprado: TDataSource
    DataSet = dmRelatorio.cdsLote_Semente_Comprado
    Left = 904
    Top = 184
  end
  object dsLote_Semente_Vendido: TDataSource
    DataSet = dmRelatorio.cdsLote_Semente_Vendido
    Left = 136
    Top = 216
  end
  object ppLote_Semente_Vendido: TppReport
    AutoStop = False
    DataPipeline = DBPipeLote_Semente_Vendido
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
    Left = 136
    Top = 360
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'DBPipeLote_Semente_Vendido'
    object ppHeaderBand6: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 21431
      mmPrintPosition = 0
      object ppLbTituloLoteSementeVendia: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label1'
        Caption = 'Sementes Vendidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5028
        mmLeft = 80169
        mmTop = 15610
        mmWidth = 40217
        BandType = 0
        LayerName = BandLayer7
      end
      object ppDBImage6: TppDBImage
        DesignLayer = ppDesignLayer6
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
        LayerName = BandLayer7
      end
      object ppSystemVariable16: TppSystemVariable
        DesignLayer = ppDesignLayer6
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
        LayerName = BandLayer7
      end
      object ppSystemVariable17: TppSystemVariable
        DesignLayer = ppDesignLayer6
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
        LayerName = BandLayer7
      end
    end
    object ppDetailBand6: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText37: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText9'
        DataField = 'VALOR_UNITARIO'
        DataPipeline = DBPipeLote_Semente_Vendido
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLote_Semente_Vendido'
        mmHeight = 4763
        mmLeft = 133347
        mmTop = 0
        mmWidth = 25665
        BandType = 4
        LayerName = BandLayer7
      end
      object ppDBText38: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText101'
        DataField = 'DATA'
        DataPipeline = DBPipeLote_Semente_Vendido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLote_Semente_Vendido'
        mmHeight = 4763
        mmLeft = 2115
        mmTop = 0
        mmWidth = 22754
        BandType = 4
        LayerName = BandLayer7
      end
      object ppDBText39: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText2'
        DataField = 'QTDE'
        DataPipeline = DBPipeLote_Semente_Vendido
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLote_Semente_Vendido'
        mmHeight = 4763
        mmLeft = 117741
        mmTop = 0
        mmWidth = 15081
        BandType = 4
        LayerName = BandLayer7
      end
      object ppDBText40: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText3'
        DataField = 'CLIENTE'
        DataPipeline = DBPipeLote_Semente_Vendido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLote_Semente_Vendido'
        mmHeight = 4763
        mmLeft = 26988
        mmTop = 0
        mmWidth = 89429
        BandType = 4
        LayerName = BandLayer7
      end
      object ppDBText41: TppDBText
        DesignLayer = ppDesignLayer6
        UserName = 'DBText21'
        DataField = 'VALOR'
        DataPipeline = DBPipeLote_Semente_Vendido
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLote_Semente_Vendido'
        mmHeight = 4763
        mmLeft = 160602
        mmTop = 0
        mmWidth = 34925
        BandType = 4
        LayerName = BandLayer7
      end
    end
    object ppFooterBand6: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLabel35: TppLabel
        DesignLayer = ppDesignLayer6
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
        LayerName = BandLayer7
      end
      object ppDBText42: TppDBText
        DesignLayer = ppDesignLayer6
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
        LayerName = BandLayer7
      end
      object ppDBText43: TppDBText
        DesignLayer = ppDesignLayer6
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
        LayerName = BandLayer7
      end
      object ppSystemVariable18: TppSystemVariable
        DesignLayer = ppDesignLayer6
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
        LayerName = BandLayer7
      end
    end
    object ppSummaryBand5: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBCalc7: TppDBCalc
        DesignLayer = ppDesignLayer6
        UserName = 'DBCalc3'
        DataField = 'VALOR'
        DataPipeline = DBPipeLote_Semente_Vendido
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'DBPipeLote_Semente_Vendido'
        mmHeight = 4498
        mmLeft = 160602
        mmTop = 0
        mmWidth = 34925
        BandType = 7
        LayerName = BandLayer7
      end
      object ppLabel36: TppLabel
        DesignLayer = ppDesignLayer6
        UserName = 'Label15'
        Caption = 'Total de Vendas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 127265
        mmTop = 0
        mmWidth = 28310
        BandType = 7
        LayerName = BandLayer7
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'ID_ESPECIE'
      DataPipeline = DBPipeLote_Semente_Vendido
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'DBPipeLote_Semente_Vendido'
      NewFile = False
      object ppGroupHeaderBand4: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppShape4: TppShape
          DesignLayer = ppDesignLayer6
          UserName = 'Shape1'
          Brush.Color = clGray
          mmHeight = 4763
          mmLeft = 1852
          mmTop = 529
          mmWidth = 194998
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer7
        end
        object ppLabel37: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'Label3'
          Caption = 'Data da Venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 5292
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer7
        end
        object ppLabel38: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'Label4'
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 26988
          mmTop = 5292
          mmWidth = 10318
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer7
        end
        object ppLabel39: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'Label6'
          Caption = 'Qtde (Kg)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 117740
          mmTop = 5292
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer7
        end
        object ppLabel40: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'Label7'
          Caption = 'Valor Unit'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 133350
          mmTop = 5295
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer7
        end
        object ppLabel41: TppLabel
          DesignLayer = ppDesignLayer6
          UserName = 'Label9'
          Caption = 'Valor Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 160868
          mmTop = 5295
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer7
        end
        object ppDBText44: TppDBText
          DesignLayer = ppDesignLayer6
          UserName = 'DBText22'
          DataField = 'ESPECIE'
          DataPipeline = DBPipeLote_Semente_Vendido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'DBPipeLote_Semente_Vendido'
          mmHeight = 4763
          mmLeft = 2381
          mmTop = 529
          mmWidth = 193940
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer7
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBCalc8: TppDBCalc
          DesignLayer = ppDesignLayer6
          UserName = 'DBCalc4'
          DataField = 'VALOR'
          DataPipeline = DBPipeLote_Semente_Vendido
          DisplayFormat = '$ ,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          Transparent = True
          DataPipelineName = 'DBPipeLote_Semente_Vendido'
          mmHeight = 4498
          mmLeft = 160602
          mmTop = 0
          mmWidth = 34925
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer7
        end
      end
    end
    object raCodeModule6: TraCodeModule
      ProgramStream = {00}
    end
    object ppDesignLayers6: TppDesignLayers
      object ppDesignLayer6: TppDesignLayer
        UserName = 'BandLayer7'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList6: TppParameterList
    end
  end
  object DBPipeLote_Semente_Vendido: TppDBPipeline
    DataSource = dsLote_Semente_Vendido
    UserName = 'DBPipeLote_Semente_Vendido'
    Left = 128
    Top = 288
    object DBPipeLote_Semente_VendidoppField1: TppField
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Semente_VendidoppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Semente_VendidoppField3: TppField
      FieldAlias = 'ID_ESPECIE'
      FieldName = 'ID_ESPECIE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Semente_VendidoppField4: TppField
      FieldAlias = 'ESPECIE'
      FieldName = 'ESPECIE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Semente_VendidoppField5: TppField
      FieldAlias = 'ID_CLIENTE'
      FieldName = 'ID_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Semente_VendidoppField6: TppField
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Semente_VendidoppField7: TppField
      FieldAlias = 'VALOR_UNITARIO'
      FieldName = 'VALOR_UNITARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Semente_VendidoppField8: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Semente_VendidoppField9: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Semente_VendidoppField10: TppField
      FieldAlias = 'CLIENTE'
      FieldName = 'CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object dsLote_Muda_Vendido: TDataSource
    DataSet = dmRelatorio.cdsLote_Muda_Vendido
    Left = 232
    Top = 208
  end
  object DBPipeLote_Muda_Vendido: TppDBPipeline
    DataSource = dsLote_Muda_Vendido
    UserName = 'DBPipeLote_Muda_Vendido'
    Left = 224
    Top = 280
    object DBPipeLote_Muda_VendidoppField1: TppField
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Muda_VendidoppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Muda_VendidoppField3: TppField
      FieldAlias = 'ID_ESPECIE'
      FieldName = 'ID_ESPECIE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Muda_VendidoppField4: TppField
      FieldAlias = 'ESPECIE'
      FieldName = 'ESPECIE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Muda_VendidoppField5: TppField
      FieldAlias = 'ID_CLIENTE'
      FieldName = 'ID_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Muda_VendidoppField6: TppField
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Muda_VendidoppField7: TppField
      FieldAlias = 'VALOR_UNITARIO'
      FieldName = 'VALOR_UNITARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Muda_VendidoppField8: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Muda_VendidoppField9: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object DBPipeLote_Muda_VendidoppField10: TppField
      FieldAlias = 'CLIENTE'
      FieldName = 'CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object ppLote_Muda_Vendido: TppReport
    AutoStop = False
    DataPipeline = DBPipeLote_Muda_Vendido
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
    Left = 232
    Top = 352
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'DBPipeLote_Muda_Vendido'
    object ppHeaderBand7: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 21431
      mmPrintPosition = 0
      object ppLbTituloLoteMudaVendida: TppLabel
        DesignLayer = ppDesignLayer7
        UserName = 'Label1'
        Caption = 'Mudas Vendidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5028
        mmLeft = 84138
        mmTop = 15610
        mmWidth = 33602
        BandType = 0
        LayerName = BandLayer8
      end
      object ppDBImage7: TppDBImage
        DesignLayer = ppDesignLayer7
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
        LayerName = BandLayer8
      end
      object ppSystemVariable19: TppSystemVariable
        DesignLayer = ppDesignLayer7
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
        LayerName = BandLayer8
      end
      object ppSystemVariable20: TppSystemVariable
        DesignLayer = ppDesignLayer7
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
        LayerName = BandLayer8
      end
    end
    object ppDetailBand7: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText45: TppDBText
        DesignLayer = ppDesignLayer7
        UserName = 'DBText9'
        DataField = 'VALOR_UNITARIO'
        DataPipeline = DBPipeLote_Muda_Vendido
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLote_Muda_Vendido'
        mmHeight = 4763
        mmLeft = 133347
        mmTop = 0
        mmWidth = 25665
        BandType = 4
        LayerName = BandLayer8
      end
      object ppDBText46: TppDBText
        DesignLayer = ppDesignLayer7
        UserName = 'DBText101'
        DataField = 'DATA'
        DataPipeline = DBPipeLote_Muda_Vendido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLote_Muda_Vendido'
        mmHeight = 4763
        mmLeft = 2115
        mmTop = 0
        mmWidth = 22754
        BandType = 4
        LayerName = BandLayer8
      end
      object ppDBText47: TppDBText
        DesignLayer = ppDesignLayer7
        UserName = 'DBText2'
        DataField = 'QTDE'
        DataPipeline = DBPipeLote_Muda_Vendido
        DisplayFormat = ',0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLote_Muda_Vendido'
        mmHeight = 4763
        mmLeft = 117741
        mmTop = 0
        mmWidth = 15081
        BandType = 4
        LayerName = BandLayer8
      end
      object ppDBText48: TppDBText
        DesignLayer = ppDesignLayer7
        UserName = 'DBText3'
        DataField = 'CLIENTE'
        DataPipeline = DBPipeLote_Muda_Vendido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLote_Muda_Vendido'
        mmHeight = 4763
        mmLeft = 26988
        mmTop = 0
        mmWidth = 89429
        BandType = 4
        LayerName = BandLayer8
      end
      object ppDBText49: TppDBText
        DesignLayer = ppDesignLayer7
        UserName = 'DBText21'
        DataField = 'VALOR'
        DataPipeline = DBPipeLote_Muda_Vendido
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeLote_Muda_Vendido'
        mmHeight = 4763
        mmLeft = 160602
        mmTop = 0
        mmWidth = 34925
        BandType = 4
        LayerName = BandLayer8
      end
    end
    object ppFooterBand7: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLabel43: TppLabel
        DesignLayer = ppDesignLayer7
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
        LayerName = BandLayer8
      end
      object ppDBText50: TppDBText
        DesignLayer = ppDesignLayer7
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
        LayerName = BandLayer8
      end
      object ppDBText51: TppDBText
        DesignLayer = ppDesignLayer7
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
        LayerName = BandLayer8
      end
      object ppSystemVariable21: TppSystemVariable
        DesignLayer = ppDesignLayer7
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
        LayerName = BandLayer8
      end
    end
    object ppSummaryBand6: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBCalc9: TppDBCalc
        DesignLayer = ppDesignLayer7
        UserName = 'DBCalc3'
        DataField = 'VALOR'
        DataPipeline = DBPipeLote_Muda_Vendido
        DisplayFormat = '$ ,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'DBPipeLote_Muda_Vendido'
        mmHeight = 4498
        mmLeft = 160602
        mmTop = 0
        mmWidth = 34925
        BandType = 7
        LayerName = BandLayer8
      end
      object ppLabel44: TppLabel
        DesignLayer = ppDesignLayer7
        UserName = 'Label15'
        Caption = 'Total de Vendas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 127265
        mmTop = 0
        mmWidth = 28310
        BandType = 7
        LayerName = BandLayer8
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'ID_ESPECIE'
      DataPipeline = DBPipeLote_Muda_Vendido
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'DBPipeLote_Muda_Vendido'
      NewFile = False
      object ppGroupHeaderBand5: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppShape5: TppShape
          DesignLayer = ppDesignLayer7
          UserName = 'Shape1'
          Brush.Color = clGray
          mmHeight = 4763
          mmLeft = 1852
          mmTop = 529
          mmWidth = 194998
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer8
        end
        object ppLabel45: TppLabel
          DesignLayer = ppDesignLayer7
          UserName = 'Label3'
          Caption = 'Data da Venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 5292
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer8
        end
        object ppLabel46: TppLabel
          DesignLayer = ppDesignLayer7
          UserName = 'Label4'
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 26988
          mmTop = 5292
          mmWidth = 10318
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer8
        end
        object ppLabel47: TppLabel
          DesignLayer = ppDesignLayer7
          UserName = 'Label6'
          Caption = 'Qtde.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 117739
          mmTop = 5295
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer8
        end
        object ppLabel48: TppLabel
          DesignLayer = ppDesignLayer7
          UserName = 'Label7'
          Caption = 'Valor Unit'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 133350
          mmTop = 5295
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer8
        end
        object ppLabel49: TppLabel
          DesignLayer = ppDesignLayer7
          UserName = 'Label9'
          Caption = 'Valor Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          FormField = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 160868
          mmTop = 5295
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer8
        end
        object ppDBText52: TppDBText
          DesignLayer = ppDesignLayer7
          UserName = 'DBText22'
          DataField = 'ESPECIE'
          DataPipeline = DBPipeLote_Muda_Vendido
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'DBPipeLote_Muda_Vendido'
          mmHeight = 4763
          mmLeft = 2381
          mmTop = 529
          mmWidth = 193940
          BandType = 3
          GroupNo = 0
          LayerName = BandLayer8
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBCalc10: TppDBCalc
          DesignLayer = ppDesignLayer7
          UserName = 'DBCalc4'
          DataField = 'VALOR'
          DataPipeline = DBPipeLote_Muda_Vendido
          DisplayFormat = '$ ,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          Transparent = True
          DataPipelineName = 'DBPipeLote_Muda_Vendido'
          mmHeight = 4498
          mmLeft = 160602
          mmTop = 0
          mmWidth = 34925
          BandType = 5
          GroupNo = 0
          LayerName = BandLayer8
        end
      end
    end
    object raCodeModule7: TraCodeModule
      ProgramStream = {00}
    end
    object ppDesignLayers7: TppDesignLayers
      object ppDesignLayer7: TppDesignLayer
        UserName = 'BandLayer8'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList7: TppParameterList
    end
  end
  object dsTubete_Semeado: TDataSource
    DataSet = dmRelatorio.cdsTubete_Semeado
    Left = 48
    Top = 200
  end
  object DBPipeTubete_Semeado: TppDBPipeline
    DataSource = dsTubete_Semeado
    UserName = 'DBPipeTubete_Semeado'
    Left = 32
    Top = 272
    object DBPipeTubete_SemeadoppField1: TppField
      FieldAlias = 'QTDE_TUBETE'
      FieldName = 'QTDE_TUBETE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DBPipeTubete_SemeadoppField2: TppField
      FieldAlias = 'ID_ESPECIE'
      FieldName = 'ID_ESPECIE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DBPipeTubete_SemeadoppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DBPipeTubete_SemeadoppField4: TppField
      FieldAlias = 'NOME_CIENTIFICO'
      FieldName = 'NOME_CIENTIFICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object ppTubete_Semeado: TppReport
    AutoStop = False
    DataPipeline = DBPipeTubete_Semeado
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
    Left = 24
    Top = 368
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'DBPipeTubete_Semeado'
    object ppHeaderBand8: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object ppLabel50: TppLabel
        DesignLayer = ppDesignLayer8
        UserName = 'Label1'
        Caption = 'Quantidade de Tubetes Semeados por Esp'#233'cie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5028
        mmLeft = 52917
        mmTop = 15610
        mmWidth = 94456
        BandType = 0
        LayerName = BandLayer9
      end
      object ppDBImage8: TppDBImage
        DesignLayer = ppDesignLayer8
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
        LayerName = BandLayer9
      end
      object ppSystemVariable22: TppSystemVariable
        DesignLayer = ppDesignLayer8
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
        LayerName = BandLayer9
      end
      object ppSystemVariable23: TppSystemVariable
        DesignLayer = ppDesignLayer8
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
        LayerName = BandLayer9
      end
      object ppLabel51: TppLabel
        DesignLayer = ppDesignLayer8
        UserName = 'Label3'
        Caption = 'Nome da Esp'#233'cie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 22225
        mmWidth = 24871
        BandType = 0
        LayerName = BandLayer9
      end
      object ppLabel52: TppLabel
        DesignLayer = ppDesignLayer8
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
        LayerName = BandLayer9
      end
      object ppLabel53: TppLabel
        DesignLayer = ppDesignLayer8
        UserName = 'Label6'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 179123
        mmTop = 22225
        mmWidth = 16404
        BandType = 0
        LayerName = BandLayer9
      end
      object ppLine3: TppLine
        DesignLayer = ppDesignLayer8
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1054
        mmLeft = 2115
        mmTop = 26404
        mmWidth = 193678
        BandType = 0
        LayerName = BandLayer9
      end
    end
    object ppDetailBand8: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppDBText54: TppDBText
        DesignLayer = ppDesignLayer8
        UserName = 'DBText101'
        DataField = 'NOME'
        DataPipeline = DBPipeTubete_Semeado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeTubete_Semeado'
        mmHeight = 4763
        mmLeft = 2115
        mmTop = 0
        mmWidth = 52917
        BandType = 4
        LayerName = BandLayer9
      end
      object ppDBText55: TppDBText
        DesignLayer = ppDesignLayer8
        UserName = 'DBText2'
        DataField = 'QTDE_TUBETE'
        DataPipeline = DBPipeTubete_Semeado
        DisplayFormat = ',0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DBPipeTubete_Semeado'
        mmHeight = 4763
        mmLeft = 168540
        mmTop = 0
        mmWidth = 27252
        BandType = 4
        LayerName = BandLayer9
      end
      object ppDBText56: TppDBText
        DesignLayer = ppDesignLayer8
        UserName = 'DBText3'
        DataField = 'NOME_CIENTIFICO'
        DataPipeline = DBPipeTubete_Semeado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeTubete_Semeado'
        mmHeight = 4763
        mmLeft = 56887
        mmTop = 0
        mmWidth = 109802
        BandType = 4
        LayerName = BandLayer9
      end
    end
    object ppFooterBand8: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLabel57: TppLabel
        DesignLayer = ppDesignLayer8
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
        LayerName = BandLayer9
      end
      object ppDBText59: TppDBText
        DesignLayer = ppDesignLayer8
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
        LayerName = BandLayer9
      end
      object ppDBText60: TppDBText
        DesignLayer = ppDesignLayer8
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
        LayerName = BandLayer9
      end
      object ppSystemVariable24: TppSystemVariable
        DesignLayer = ppDesignLayer8
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
        LayerName = BandLayer9
      end
    end
    object ppSummaryBand7: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLabel58: TppLabel
        DesignLayer = ppDesignLayer8
        UserName = 'Label8'
        Caption = 'Total de Tubetes Semeados:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 105834
        mmTop = 1323
        mmWidth = 47890
        BandType = 7
        LayerName = BandLayer9
      end
      object ppDBCalc15: TppDBCalc
        DesignLayer = ppDesignLayer8
        UserName = 'DBCalc1'
        DataField = 'QTDE_TUBETE'
        DataPipeline = DBPipeTubete_Semeado
        DisplayFormat = ',0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'DBPipeTubete_Semeado'
        mmHeight = 4498
        mmLeft = 155575
        mmTop = 1322
        mmWidth = 38894
        BandType = 7
        LayerName = BandLayer9
      end
    end
    object raCodeModule8: TraCodeModule
      ProgramStream = {00}
    end
    object ppDesignLayers8: TppDesignLayers
      object ppDesignLayer8: TppDesignLayer
        UserName = 'BandLayer9'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList8: TppParameterList
    end
  end
end
