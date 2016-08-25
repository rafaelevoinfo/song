inherited frmSolicitacaoCompra: TfrmSolicitacaoCompra
  ActiveControl = nil
  Caption = 'Solicita'#231#227'o de Compras'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 462
          Width = 513
          ExplicitLeft = 462
          ExplicitWidth = 513
          inherited Label1: TLabel
            Left = 133
            ExplicitLeft = 133
          end
          object Label3: TLabel [1]
            Left = 2
            Top = 4
            Width = 35
            Height = 13
            Caption = 'Status:'
          end
          inherited pnData: TPanel
            Left = 285
            ExplicitLeft = 285
          end
          inherited EditPesquisa: TcxButtonEdit
            Left = 264
            ExplicitLeft = 264
            ExplicitWidth = 150
            Width = 150
          end
          inherited cbPesquisarPor: TcxImageComboBox
            Left = 133
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
                Description = 'Data da Solicita'#231#227'o'
                Value = 4
              end
              item
                Description = 'Item'
                Value = 5
              end
              item
                Description = 'Solicitante'
                Value = 6
              end
              item
                Description = 'Respons'#225'vel Pela An'#225'lise'
                Value = 7
              end>
            ExplicitLeft = 133
          end
          inherited btnPesquisar: TButton
            Left = 413
            TabOrder = 1
            ExplicitLeft = 413
          end
          inherited rgStatus: TcxRadioGroup
            Left = 12
            Top = 33
            TabOrder = 7
            ExplicitLeft = 12
            ExplicitTop = 33
          end
          object cbStatusPesquisa: TcxCheckComboBox
            Left = 2
            Top = 20
            Properties.EmptySelectionText = 'Todos'
            Properties.DropDownSizeable = True
            Properties.EditValueFormat = cvfIndices
            Properties.Items = <
              item
                Description = 'Solicitada'
              end
              item
                Description = 'Aprovada'
                Tag = 1
              end
              item
                Description = 'Negada'
                Tag = 2
              end>
            TabOrder = 2
            Width = 130
          end
          object cbPessoa: TcxLookupComboBox
            Left = 266
            Top = 20
            RepositoryItem = dmLookup.repLcbPessoa
            Properties.ListColumns = <>
            TabOrder = 5
            Visible = False
            Width = 148
          end
          object cbItemPesquisa: TcxLookupComboBox
            Left = 266
            Top = 20
            RepositoryItem = dmLookup.repLcbItem
            Properties.ListColumns = <>
            TabOrder = 6
            Visible = False
            Width = 148
          end
        end
        inherited pnBotoes: TPanel
          Width = 461
          ExplicitWidth = 461
          inherited btnUtilizar: TButton
            Left = 455
            TabOrder = 5
            ExplicitLeft = 455
          end
          object btnAprovar: TButton
            AlignWithMargins = True
            Left = 188
            Top = 1
            Width = 83
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 2
            Margins.Bottom = 1
            Action = Ac_Aprovar
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 2
            WordWrap = True
          end
          object btnNegar: TButton
            AlignWithMargins = True
            Left = 273
            Top = 1
            Width = 78
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 2
            Margins.Bottom = 1
            Action = Ac_Negar
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 3
            WordWrap = True
          end
          object btnGerarCompras: TButton
            AlignWithMargins = True
            Left = 353
            Top = 1
            Width = 100
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 2
            Margins.Bottom = 1
            Action = Ac_Gerar_Compras
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 4
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
              Width = 39
            end
            object viewRegistrosID_PESSOA_SOLICITOU: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ID_PESSOA_SOLICITOU'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_PESSOA_ANALISOU: TcxGridDBColumn [2]
              DataBinding.FieldName = 'ID_PESSOA_ANALISOU'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosDATA: TcxGridDBColumn [3]
              DataBinding.FieldName = 'DATA'
              Options.Editing = False
              Width = 102
            end
            object viewRegistrosSOLICITANTE: TcxGridDBColumn [4]
              DataBinding.FieldName = 'SOLICITANTE'
              Options.Editing = False
              Width = 154
            end
            object viewRegistrosSTATUS: TcxGridDBColumn [5]
              DataBinding.FieldName = 'STATUS'
              RepositoryItem = dmLookup.repIcbStatusSolicitacaoCompra
              OnCustomDrawCell = viewRegistrosSTATUSCustomDrawCell
              Options.Editing = False
              Width = 119
            end
            object viewRegistrosRESPONSAVEL_ANALISE: TcxGridDBColumn [6]
              DataBinding.FieldName = 'RESPONSAVEL_ANALISE'
              Options.Editing = False
              Width = 154
            end
            object viewRegistrosDATA_ANALISE: TcxGridDBColumn [7]
              DataBinding.FieldName = 'DATA_ANALISE'
              Visible = False
              Options.Editing = False
              Width = 80
            end
            object ColumnImprimir: TcxGridDBColumn
              Caption = 'Imprimir Autoriza'#231#227'o de Compra'
              PropertiesClassName = 'TcxButtonEditProperties'
              Properties.Buttons = <
                item
                  Action = Ac_Imprimir_Autorizacao
                  Default = True
                  Kind = bkGlyph
                end>
              Properties.Images = dmPrincipal.imgIcons_16
              Properties.ViewStyle = vsButtonsOnly
              MinWidth = 158
              Options.Filtering = False
              Options.ShowEditButtons = isebAlways
              Options.GroupFooters = False
              Options.Grouping = False
              Options.HorzSizing = False
              Options.Moving = False
              Width = 158
            end
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              Caption = 'Itens'
              inherited cxGridRegistrosDetail: TcxGrid
                inherited viewRegistrosDetail: TcxGridDBTableView
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                    Width = 35
                  end
                  object viewRegistrosDetailID_ITEM: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'ID_ITEM'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailID_ESPECIE: TcxGridDBColumn [2]
                    DataBinding.FieldName = 'ID_ESPECIE'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailNOME_ITEM: TcxGridDBColumn [3]
                    DataBinding.FieldName = 'NOME_ITEM'
                    Options.Editing = False
                    Width = 477
                  end
                  object viewRegistrosDetailESPECIE: TcxGridDBColumn [4]
                    DataBinding.FieldName = 'ESPECIE'
                    Visible = False
                    Options.Editing = False
                    Width = 185
                  end
                  object viewRegistrosDetailQTDE: TcxGridDBColumn [5]
                    DataBinding.FieldName = 'CALC_QTDE'
                    RepositoryItem = dmLookup.repCalcPadrao
                    Options.Editing = False
                    Width = 81
                  end
                end
              end
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      inherited pnBotoesCadastro: TPanel
        TabOrder = 1
        ExplicitTop = 2
      end
      inherited pnEditsCadastro: TPanel
        TabOrder = 0
        object Label4: TLabel
          Left = 7
          Top = 8
          Width = 49
          Height = 13
          Caption = 'Solicitante'
          FocusControl = cbSolicitante
        end
        object Label5: TLabel
          Left = 219
          Top = 8
          Width = 91
          Height = 13
          Caption = 'Data da Solicita'#231#227'o'
          FocusControl = EditDataSolicitacao
        end
        object Label6: TLabel
          Left = 7
          Top = 51
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
          FocusControl = EditObservacao
        end
        object cbSolicitante: TcxDBLookupComboBox
          Left = 4
          Top = 24
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_PESSOA_SOLICITOU'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 209
        end
        object EditDataSolicitacao: TcxDBDateEdit
          Left = 217
          Top = 24
          DataBinding.DataField = 'DATA'
          DataBinding.DataSource = dsMaster
          TabOrder = 1
          Width = 121
        end
        object EditObservacao: TcxDBMemo
          Left = 5
          Top = 67
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 2
          Height = 62
          Width = 572
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      inherited pnEditsCadastroDetail: TPanel
        object lbl1: TLabel
          Left = 7
          Top = 8
          Width = 45
          Height = 13
          Caption = 'Item (F2)'
          FocusControl = cbItem
        end
        object lbl2: TLabel
          Left = 241
          Top = 8
          Width = 36
          Height = 13
          Caption = 'Esp'#233'cie'
          FocusControl = cbEspecie
        end
        object Label7: TLabel
          Left = 453
          Top = 8
          Width = 56
          Height = 13
          Caption = 'Quantidade'
          FocusControl = EditQtde
        end
        object lbUnidade: TLabel
          Left = 574
          Top = 31
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
          OnKeyDown = cbItemKeyDown
          Width = 209
        end
        object cbEspecie: TcxDBLookupComboBox
          Left = 238
          Top = 24
          RepositoryItem = dmLookup.repLcbEspecie
          DataBinding.DataField = 'ID_ESPECIE'
          DataBinding.DataSource = dsDetail
          Enabled = False
          Properties.ListColumns = <>
          TabOrder = 2
          Width = 209
        end
        object EditQtde: TcxDBCalcEdit
          Left = 451
          Top = 24
          RepositoryItem = dmLookup.repCalcPadrao
          DataBinding.DataField = 'QTDE'
          DataBinding.DataSource = dsDetail
          TabOrder = 3
          Width = 121
        end
        object btnAdicionarItem: TButton
          Left = 213
          Top = 24
          Width = 22
          Height = 21
          Action = Ac_Incluir_Item
          Images = dmPrincipal.imgIcons_16
          TabOrder = 1
          TabStop = False
        end
      end
    end
  end
  inherited ActionList1: TActionList
    object Ac_Aprovar: TAction
      Category = 'Master'
      Caption = 'Aprovar'
      ImageIndex = 6
      OnExecute = Ac_AprovarExecute
      OnUpdate = Ac_AprovarUpdate
    end
    object Ac_Negar: TAction
      Category = 'Master'
      Caption = 'Negar'
      ImageIndex = 5
      OnExecute = Ac_NegarExecute
      OnUpdate = Ac_NegarUpdate
    end
    object Ac_Gerar_Compras: TAction
      Category = 'Master'
      Caption = 'Gerar Compra'
      ImageIndex = 12
      OnExecute = Ac_Gerar_ComprasExecute
      OnUpdate = Ac_Gerar_ComprasUpdate
    end
    object Ac_Incluir_Item: TAction
      Category = 'Detail'
      ImageIndex = 3
      OnExecute = Ac_Incluir_ItemExecute
    end
    object Ac_Imprimir_Autorizacao: TAction
      Category = 'Master'
      Caption = 'Imprimir Autoriza'#231#227'o de Compra'
      ImageIndex = 19
      OnExecute = Ac_Imprimir_AutorizacaoExecute
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmEstoque.cdsSolicitacao_Compra
  end
  inherited dsDetail: TDataSource
    DataSet = dmEstoque.cdsSolicitacao_Compra_Item
  end
  object ppAutorizacao: TppReport
    AutoStop = False
    DataPipeline = DBPipeItensSolicitacao
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
    Left = 584
    Top = 168
    Version = '16.02'
    mmColumnWidth = 0
    DataPipelineName = 'DBPipeItensSolicitacao'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 58473
      mmPrintPosition = 0
      object ppShape1: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape1'
        Shape = stRoundRect
        mmHeight = 29633
        mmLeft = 794
        mmTop = 1323
        mmWidth = 127795
        BandType = 0
        LayerName = BandLayer6
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
        mmHeight = 27252
        mmLeft = 2381
        mmTop = 2379
        mmWidth = 30692
        BandType = 0
        LayerName = BandLayer6
      end
      object ppDBText16: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 4234
        mmLeft = 34660
        mmTop = 2381
        mmWidth = 78053
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel13: TppLabel
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
        mmLeft = 51332
        mmTop = 6085
        mmWidth = 7408
        BandType = 0
        LayerName = BandLayer6
      end
      object ppDBText15: TppDBText
        DesignLayer = ppDesignLayer2
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
        mmHeight = 3705
        mmLeft = 59267
        mmTop = 6085
        mmWidth = 25664
        BandType = 0
        LayerName = BandLayer6
      end
      object ppShape2: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape2'
        Shape = stRoundRect
        mmHeight = 29633
        mmLeft = 128329
        mmTop = 1323
        mmWidth = 40746
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label4'
        Caption = 'REQUISI'#199#195'O PARA COMPRAS SERVI'#199'OS E ABASTECIMENTOS (USO EXTERNO)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 16404
        mmLeft = 129386
        mmTop = 7144
        mmWidth = 38629
        BandType = 0
        LayerName = BandLayer6
      end
      object ppShape3: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape3'
        Shape = stRoundRect
        mmHeight = 29633
        mmLeft = 168809
        mmTop = 1323
        mmWidth = 27781
        BandType = 0
        LayerName = BandLayer6
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText3'
        DataField = 'ID'
        DataPipeline = DBPipeSolicitacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DBPipeSolicitacao'
        mmHeight = 4763
        mmLeft = 170132
        mmTop = 12435
        mmWidth = 25135
        BandType = 0
        LayerName = BandLayer6
      end
      object ppShape4: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape4'
        Shape = stRoundRect
        mmHeight = 9525
        mmLeft = 794
        mmTop = 30427
        mmWidth = 144463
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label1'
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3705
        mmLeft = 2645
        mmTop = 30690
        mmWidth = 14816
        BandType = 0
        LayerName = BandLayer6
      end
      object ppShape5: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape5'
        Shape = stRoundRect
        mmHeight = 9525
        mmLeft = 144993
        mmTop = 30427
        mmWidth = 51594
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label5'
        Caption = 'Data de Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 146316
        mmTop = 30692
        mmWidth = 25665
        BandType = 0
        LayerName = BandLayer6
      end
      object ppShape6: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape6'
        Shape = stRoundRect
        mmHeight = 9525
        mmLeft = 794
        mmTop = 39688
        mmWidth = 144463
        BandType = 0
        LayerName = BandLayer6
      end
      object ppShape7: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape7'
        Shape = stRoundRect
        mmHeight = 9525
        mmLeft = 144993
        mmTop = 39688
        mmWidth = 51594
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label6'
        Caption = 'Projeto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3705
        mmLeft = 2645
        mmTop = 39952
        mmWidth = 8732
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel6: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label7'
        Caption = 'Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 146316
        mmTop = 39952
        mmWidth = 9790
        BandType = 0
        LayerName = BandLayer6
      end
      object ppShape8: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape8'
        Brush.Color = clSilver
        Shape = stRoundRect
        mmHeight = 9525
        mmLeft = 794
        mmTop = 48948
        mmWidth = 195792
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel7: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label8'
        Caption = 'UNID.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 6085
        mmTop = 51859
        mmWidth = 7938
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel8: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label9'
        Caption = 'QUANT.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 24342
        mmTop = 51859
        mmWidth = 11377
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLine3: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line3'
        Position = lpRight
        Weight = 1.000000000000000000
        mmHeight = 9525
        mmLeft = 19313
        mmTop = 48948
        mmWidth = 1058
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLine2: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line2'
        Position = lpRight
        Weight = 1.000000000000000000
        mmHeight = 9525
        mmLeft = 41540
        mmTop = 48948
        mmWidth = 1058
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel9: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label10'
        Caption = 'ESPECIFICA'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 75936
        mmTop = 51859
        mmWidth = 24077
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel10: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label101'
        Caption = 'VALOR UNIT.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 149758
        mmTop = 51859
        mmWidth = 19050
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel11: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label11'
        Caption = 'VALOR TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 173566
        mmTop = 51859
        mmWidth = 21432
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLine4: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line4'
        Position = lpRight
        Weight = 1.000000000000000000
        mmHeight = 9525
        mmLeft = 144462
        mmTop = 48948
        mmWidth = 1058
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLine5: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line5'
        Position = lpRight
        Weight = 1.000000000000000000
        mmHeight = 9525
        mmLeft = 170921
        mmTop = 48948
        mmWidth = 1058
        BandType = 0
        LayerName = BandLayer6
      end
      object ppDBText7: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 3704
        mmLeft = 34660
        mmTop = 9790
        mmWidth = 33867
        BandType = 0
        LayerName = BandLayer6
      end
      object ppDBText8: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText10'
        DataField = 'BAIRRO'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 3000
        mmLeft = 69849
        mmTop = 9789
        mmWidth = 41275
        BandType = 0
        LayerName = BandLayer6
      end
      object ppDBText9: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'COMPLEMENTO'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 3704
        mmLeft = 45244
        mmTop = 12700
        mmWidth = 32808
        BandType = 0
        LayerName = BandLayer6
      end
      object ppDBText10: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'CIDADE'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 3704
        mmLeft = 80433
        mmTop = 12700
        mmWidth = 17463
        BandType = 0
        LayerName = BandLayer6
      end
      object ppDBText11: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'TELEFONE'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 3704
        mmLeft = 64558
        mmTop = 15346
        mmWidth = 19050
        BandType = 0
        LayerName = BandLayer6
      end
      object ppDBText12: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText14'
        HyperlinkEnabled = False
        AutoSize = True
        DataField = 'SITE'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 3704
        mmLeft = 59002
        mmTop = 22490
        mmWidth = 27782
        BandType = 0
        LayerName = BandLayer6
      end
      object ppDBText13: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText15'
        HyperlinkEnabled = False
        AutoSize = True
        DataField = 'EMAIL'
        DataPipeline = DBPipeOrganizacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 3705
        mmLeft = 56886
        mmTop = 26458
        mmWidth = 32543
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel22: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label22'
        Caption = 'Fonefax:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 51594
        mmTop = 15344
        mmWidth = 11378
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel23: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label23'
        Caption = '(64) 3661-9316'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 64559
        mmTop = 18784
        mmWidth = 19844
        BandType = 0
        LayerName = BandLayer6
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppShape14: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape14'
        Shape = stRoundRect
        mmHeight = 6350
        mmLeft = 794
        mmTop = 0
        mmWidth = 195792
        BandType = 4
        LayerName = BandLayer6
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText5'
        Anchors = [atLeft, atRight]
        DataField = 'UNIDADE'
        DataPipeline = DBPipeItensSolicitacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DBPipeItensSolicitacao'
        mmHeight = 4763
        mmLeft = 1059
        mmTop = 529
        mmWidth = 17727
        BandType = 4
        LayerName = BandLayer6
      end
      object ppDBText6: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText8'
        Anchors = [atLeft, atRight]
        DataField = 'QTDE'
        DataPipeline = DBPipeItensSolicitacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DBPipeItensSolicitacao'
        mmHeight = 4763
        mmLeft = 20903
        mmTop = 529
        mmWidth = 20108
        BandType = 4
        LayerName = BandLayer6
      end
      object ppDBText5: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText6'
        Anchors = [atLeft, atRight]
        DataField = 'NOME_ITEM'
        DataPipeline = DBPipeItensSolicitacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipeItensSolicitacao'
        mmHeight = 4763
        mmLeft = 43128
        mmTop = 529
        mmWidth = 101336
        BandType = 4
        LayerName = BandLayer6
      end
      object ppLine11: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line11'
        Position = lpRight
        Weight = 1.000000000000000000
        mmHeight = 6350
        mmLeft = 41540
        mmTop = 0
        mmWidth = 1058
        BandType = 4
        LayerName = BandLayer6
      end
      object ppLine12: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line12'
        Position = lpRight
        Weight = 1.000000000000000000
        mmHeight = 6350
        mmLeft = 19315
        mmTop = 0
        mmWidth = 1058
        BandType = 4
        LayerName = BandLayer6
      end
      object ppLine13: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line13'
        Position = lpRight
        Weight = 1.000000000000000000
        mmHeight = 6350
        mmLeft = 144463
        mmTop = 0
        mmWidth = 1058
        BandType = 4
        LayerName = BandLayer6
      end
      object ppLine14: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line14'
        Position = lpRight
        Weight = 1.000000000000000000
        mmHeight = 6350
        mmLeft = 170922
        mmTop = 0
        mmWidth = 1058
        BandType = 4
        LayerName = BandLayer6
      end
    end
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 38629
      mmPrintPosition = 0
      object ppShape9: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape9'
        Shape = stRoundRect
        mmHeight = 9525
        mmLeft = 794
        mmTop = 265
        mmWidth = 196321
        BandType = 7
        LayerName = BandLayer6
      end
      object ppLine6: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line6'
        Position = lpRight
        Weight = 1.000000000000000000
        mmHeight = 9525
        mmLeft = 37571
        mmTop = 265
        mmWidth = 1058
        BandType = 7
        LayerName = BandLayer6
      end
      object ppLabel12: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label12'
        Caption = 'Ve'#237'culo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 529
        mmWidth = 9525
        BandType = 7
        LayerName = BandLayer6
      end
      object ppLabel14: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label14'
        Caption = 'Placa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 40217
        mmTop = 529
        mmWidth = 6879
        BandType = 7
        LayerName = BandLayer6
      end
      object ppLine7: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line7'
        Position = lpRight
        Weight = 1.000000000000000000
        mmHeight = 9525
        mmLeft = 69321
        mmTop = 265
        mmWidth = 1058
        BandType = 7
        LayerName = BandLayer6
      end
      object ppLine8: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line8'
        Position = lpRight
        Weight = 1.000000000000000000
        mmHeight = 9525
        mmLeft = 113506
        mmTop = 265
        mmWidth = 1058
        BandType = 7
        LayerName = BandLayer6
      end
      object ppLabel15: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label15'
        Caption = 'KM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 71702
        mmTop = 529
        mmWidth = 3969
        BandType = 7
        LayerName = BandLayer6
      end
      object ppLabel16: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label16'
        Caption = 'N'#186' N.F.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 115888
        mmTop = 529
        mmWidth = 8996
        BandType = 7
        LayerName = BandLayer6
      end
      object ppLine9: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line9'
        Position = lpRight
        Weight = 1.000000000000000000
        mmHeight = 9525
        mmLeft = 144461
        mmTop = 265
        mmWidth = 1058
        BandType = 7
        LayerName = BandLayer6
      end
      object ppLine10: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line10'
        Position = lpRight
        Weight = 1.000000000000000000
        mmHeight = 9525
        mmLeft = 170920
        mmTop = 265
        mmWidth = 1058
        BandType = 7
        LayerName = BandLayer6
      end
      object ppLabel17: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label17'
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 152400
        mmTop = 2910
        mmWidth = 11377
        BandType = 7
        LayerName = BandLayer6
      end
      object ppShape10: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape10'
        Shape = stRoundRect
        mmHeight = 19844
        mmLeft = 794
        mmTop = 9525
        mmWidth = 52652
        BandType = 7
        LayerName = BandLayer6
      end
      object ppLabel18: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label18'
        Caption = 'ATEN'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 4233
        mmLeft = 8467
        mmTop = 11377
        mmWidth = 38629
        BandType = 7
        LayerName = BandLayer6
      end
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label3'
        Caption = 
          'N'#227'o nos responsabilizamos pelo pagamento de compras ou servi'#231'os ' +
          'que n'#227'o estejam nesta requisi'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 11113
        mmLeft = 2117
        mmTop = 17198
        mmWidth = 49742
        BandType = 7
        LayerName = BandLayer6
      end
      object ppShape11: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape101'
        Shape = stRoundRect
        mmHeight = 19844
        mmLeft = 53181
        mmTop = 9525
        mmWidth = 79375
        BandType = 7
        LayerName = BandLayer6
      end
      object ppLabel19: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label19'
        Caption = 'Autorizado por'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 54769
        mmTop = 10583
        mmWidth = 19050
        BandType = 7
        LayerName = BandLayer6
      end
      object ppShape12: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape12'
        Shape = stRoundRect
        mmHeight = 19844
        mmLeft = 132027
        mmTop = 9525
        mmWidth = 65088
        BandType = 7
        LayerName = BandLayer6
      end
      object ppLabel20: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label20'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 133615
        mmTop = 10583
        mmWidth = 5821
        BandType = 7
        LayerName = BandLayer6
      end
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText2'
        DataField = 'DATA_ANALISE'
        DataPipeline = DBPipeSolicitacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeSolicitacao'
        mmHeight = 4763
        mmLeft = 133615
        mmTop = 15875
        mmWidth = 62442
        BandType = 7
        LayerName = BandLayer6
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText4'
        DataField = 'RESPONSAVEL_ANALISE'
        DataPipeline = DBPipeSolicitacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DBPipeSolicitacao'
        mmHeight = 4763
        mmLeft = 53181
        mmTop = 23548
        mmWidth = 75936
        BandType = 7
        LayerName = BandLayer6
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 54769
        mmTop = 22490
        mmWidth = 76465
        BandType = 7
        LayerName = BandLayer6
      end
      object ppShape13: TppShape
        DesignLayer = ppDesignLayer2
        UserName = 'Shape13'
        Shape = stRoundRect
        mmHeight = 9525
        mmLeft = 794
        mmTop = 29104
        mmWidth = 196321
        BandType = 7
        LayerName = BandLayer6
      end
      object ppLabel21: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label102'
        Caption = 'SOLICITAMOS ANEXAR ESTA REQUISI'#199#195'O A NOTA FISCAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 7673
        mmLeft = 6085
        mmTop = 30427
        mmWidth = 183621
        BandType = 7
        LayerName = BandLayer6
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {00}
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'BandLayer6'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object DBPipeSolicitacao: TppDBPipeline
    DataSource = dsMaster
    UserName = 'DBPipeSolicitacao'
    Left = 376
    Top = 152
    object DBPipeSolicitacaoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object DBPipeSolicitacaoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID_PESSOA_SOLICITOU'
      FieldName = 'ID_PESSOA_SOLICITOU'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object DBPipeSolicitacaoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID_PESSOA_ANALISOU'
      FieldName = 'ID_PESSOA_ANALISOU'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object DBPipeSolicitacaoppField4: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 3
    end
    object DBPipeSolicitacaoppField5: TppField
      FieldAlias = 'DATA_ANALISE'
      FieldName = 'DATA_ANALISE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 34
      Position = 4
    end
    object DBPipeSolicitacaoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object DBPipeSolicitacaoppField7: TppField
      FieldAlias = 'SOLICITANTE'
      FieldName = 'SOLICITANTE'
      FieldLength = 100
      DisplayWidth = 100
      Position = 6
    end
    object DBPipeSolicitacaoppField8: TppField
      FieldAlias = 'RESPONSAVEL_ANALISE'
      FieldName = 'RESPONSAVEL_ANALISE'
      FieldLength = 100
      DisplayWidth = 100
      Position = 7
    end
    object DBPipeSolicitacaoppField9: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 1000
      DisplayWidth = 1000
      Position = 8
    end
  end
  object DBPipeItensSolicitacao: TppDBPipeline
    DataSource = dsDetail
    UserName = 'DBPipeItensSolicitacao'
    Left = 376
    Top = 216
    object DBPipeItensSolicitacaoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object DBPipeItensSolicitacaoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID_SOLICITACAO_COMPRA'
      FieldName = 'ID_SOLICITACAO_COMPRA'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object DBPipeItensSolicitacaoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID_ITEM'
      FieldName = 'ID_ITEM'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object DBPipeItensSolicitacaoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'ID_ESPECIE'
      FieldName = 'ID_ESPECIE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object DBPipeItensSolicitacaoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 4
    end
    object DBPipeItensSolicitacaoppField6: TppField
      FieldAlias = 'NOME_ITEM'
      FieldName = 'NOME_ITEM'
      FieldLength = 100
      DisplayWidth = 100
      Position = 5
    end
    object DBPipeItensSolicitacaoppField7: TppField
      FieldAlias = 'ESPECIE'
      FieldName = 'ESPECIE'
      FieldLength = 100
      DisplayWidth = 100
      Position = 6
    end
    object DBPipeItensSolicitacaoppField8: TppField
      FieldAlias = 'UNIDADE'
      FieldName = 'UNIDADE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
  end
  object DBPipeOrganizacao: TppDBPipeline
    DataSource = dmLookup.dslkOrganizacao
    UserName = 'DBPipeOrganizacao'
    Left = 376
    Top = 296
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
  end
end
