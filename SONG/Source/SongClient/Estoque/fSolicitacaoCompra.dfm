inherited frmSolicitacaoCompra: TfrmSolicitacaoCompra
  ActiveControl = nil
  Caption = 'Solicita'#231#227'o de Compras'
  ExplicitWidth = 1000
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
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
            ExplicitLeft = 413
          end
          inherited rgStatus: TcxRadioGroup
            Left = 12
            Top = 33
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
            TabOrder = 5
            Width = 130
          end
          object cbPessoa: TcxLookupComboBox
            Left = 266
            Top = 20
            RepositoryItem = dmLookup.repLcbPessoa
            Properties.ListColumns = <>
            TabOrder = 6
            Visible = False
            Width = 148
          end
          object cbItemPesquisa: TcxLookupComboBox
            Left = 266
            Top = 20
            RepositoryItem = dmLookup.repLcbItem
            Properties.ListColumns = <>
            TabOrder = 7
            Visible = False
            Width = 148
          end
        end
        inherited pnBotoes: TPanel
          Width = 461
          ExplicitWidth = 461
          inherited btnUtilizar: TButton
            Left = 455
            ExplicitLeft = 455
          end
          inherited btnExportarExcel: TButton
            TabOrder = 5
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
              ExplicitLeft = 2
              ExplicitTop = 25
              ExplicitWidth = 965
              ExplicitHeight = 195
              inherited pnBotoesDetail: TPanel
                inherited btnUtilizarDetailSelecionado: TButton
                  ExplicitLeft = 82
                  ExplicitTop = 2
                end
              end
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
                    DataBinding.FieldName = 'QTDE'
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
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnEditsCadastro: TPanel
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
        object Label8: TLabel
          Left = 346
          Top = 8
          Width = 31
          Height = 13
          Caption = 'Status'
          FocusControl = cbStatus
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
          TabOrder = 3
          Height = 62
          Width = 572
        end
        object cbStatus: TcxDBImageComboBox
          Left = 344
          Top = 24
          RepositoryItem = dmLookup.repIcbStatusSolicitacaoCompra
          DataBinding.DataField = 'STATUS'
          DataBinding.DataSource = dsMaster
          Properties.Items = <>
          TabOrder = 2
          Width = 233
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
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
          TabOrder = 1
          Width = 209
        end
        object EditQtde: TcxDBCalcEdit
          Left = 451
          Top = 24
          RepositoryItem = dmLookup.repCalcPadrao
          DataBinding.DataField = 'QTDE'
          DataBinding.DataSource = dsDetail
          TabOrder = 2
          Width = 121
        end
        object btnAdicionarItem: TButton
          Left = 213
          Top = 24
          Width = 22
          Height = 21
          Action = Ac_Incluir_Item
          Images = dmPrincipal.imgIcons_16
          TabOrder = 3
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
      mmHeight = 29898
      mmPrintPosition = 0
      object ppLabel12: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label1'
        Caption = 'Autoriza'#231#227'o de Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        FormField = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 74877
        mmTop = 17198
        mmWidth = 47625
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
        DataPipeline = frmRelatorioFinanceiro.DBPipeOrganizacao
        GraphicType = 'AutoDetect'
        ParentDataPipeline = False
        DataPipelineName = 'DBPipeOrganizacao'
        mmHeight = 21431
        mmLeft = 1588
        mmTop = 794
        mmWidth = 30692
        BandType = 0
        LayerName = BandLayer6
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
        LayerName = BandLayer6
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
        LayerName = BandLayer6
      end
      object ppLabel15: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label15'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 176477
        mmTop = 25135
        mmWidth = 19579
        BandType = 0
        LayerName = BandLayer6
      end
      object ppLabel18: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label18'
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4234
        mmLeft = 2381
        mmTop = 25135
        mmWidth = 13229
        BandType = 0
        LayerName = BandLayer6
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Color = clTeal
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText14: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText14'
        DataField = 'QTDE'
        DataPipeline = DBPipeItensSolicitacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DBPipeItensSolicitacao'
        mmHeight = 4763
        mmLeft = 176477
        mmTop = 529
        mmWidth = 19579
        BandType = 4
        LayerName = BandLayer6
      end
      object ppDBText17: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'EditProduto'
        DataField = 'NOME_ITEM'
        DataPipeline = DBPipeItensSolicitacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipeItensSolicitacao'
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 529
        mmWidth = 170657
        BandType = 4
        LayerName = BandLayer6
      end
    end
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
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
        mmLeft = 81227
        mmTop = 794
        mmWidth = 7409
        BandType = 8
        LayerName = BandLayer6
      end
      object ppDBText15: TppDBText
        DesignLayer = ppDesignLayer2
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
        LayerName = BandLayer6
      end
      object ppDBText16: TppDBText
        DesignLayer = ppDesignLayer2
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
        LayerName = BandLayer6
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
        LayerName = BandLayer6
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 33602
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer2
        UserName = 'DBText2'
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
        VerticalAlignment = avCenter
        DataPipelineName = 'DBPipeSolicitacao'
        mmHeight = 4763
        mmLeft = 65353
        mmTop = 28833
        mmWidth = 61648
        BandType = 7
        LayerName = BandLayer6
      end
      object ppLine1: TppLine
        DesignLayer = ppDesignLayer2
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 63767
        mmTop = 28049
        mmWidth = 65352
        BandType = 7
        LayerName = BandLayer6
      end
      object ppDBMemo1: TppDBMemo
        DesignLayer = ppDesignLayer2
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'OBSERVACAO'
        DataPipeline = DBPipeSolicitacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        RemoveEmptyLines = False
        Transparent = True
        DataPipelineName = 'DBPipeSolicitacao'
        mmHeight = 14817
        mmLeft = 2381
        mmTop = 7403
        mmWidth = 193675
        BandType = 7
        LayerName = BandLayer6
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer2
        UserName = 'Label3'
        Caption = 'Observa'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        FormField = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 2640
        mmWidth = 21432
        BandType = 7
        LayerName = BandLayer6
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650614
        4564697450726F6475746F4F6E476574546578740B50726F6772616D54797065
        070B747450726F63656475726506536F75726365069D70726F63656475726520
        4564697450726F6475746F4F6E476574546578742876617220546578743A2053
        7472696E67293B0D0A626567696E0D0A0D0A202054657874203A3D2044425069
        70654974656E73536F6C696369746163616F5B274E4F4D455F4954454D275D20
        2B202720272B4442506970654974656E73536F6C696369746163616F5B274553
        5045434945275D3B200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
        65060B4564697450726F6475746F094576656E744E616D6506094F6E47657454
        657874074576656E7449440235084361726574506F730102540204000000}
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
      FieldAlias = 'ID'
      FieldName = 'ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DBPipeSolicitacaoppField2: TppField
      FieldAlias = 'ID_PESSOA_SOLICITOU'
      FieldName = 'ID_PESSOA_SOLICITOU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DBPipeSolicitacaoppField3: TppField
      FieldAlias = 'ID_PESSOA_ANALISOU'
      FieldName = 'ID_PESSOA_ANALISOU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DBPipeSolicitacaoppField4: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DBPipeSolicitacaoppField5: TppField
      FieldAlias = 'DATA_ANALISE'
      FieldName = 'DATA_ANALISE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DBPipeSolicitacaoppField6: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object DBPipeSolicitacaoppField7: TppField
      FieldAlias = 'SOLICITANTE'
      FieldName = 'SOLICITANTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object DBPipeSolicitacaoppField8: TppField
      FieldAlias = 'RESPONSAVEL_ANALISE'
      FieldName = 'RESPONSAVEL_ANALISE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object DBPipeSolicitacaoppField9: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
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
      DisplayWidth = 0
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
