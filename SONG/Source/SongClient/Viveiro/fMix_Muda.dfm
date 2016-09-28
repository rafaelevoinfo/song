inherited frmMixMuda: TfrmMixMuda
  ActiveControl = btnSalvar
  Caption = 'Mix de Mudas'
  ClientHeight = 611
  ExplicitHeight = 650
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Height = 611
    Properties.ActivePage = tabCadastro
    ExplicitHeight = 611
    ClientRectBottom = 607
    inherited tabPesquisa: TcxTabSheet
      ExplicitHeight = 583
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 564
          Width = 411
          ExplicitWidth = 411
          inherited Label1: TLabel
            Left = 4
            ExplicitLeft = 4
          end
          inherited pnData: TPanel
            Left = 183
            ExplicitLeft = 183
          end
          inherited EditPesquisa: TcxButtonEdit
            Left = 135
            ExplicitLeft = 135
          end
          inherited cbPesquisarPor: TcxImageComboBox
            Left = 2
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
                Description = 'Data'
                Value = 4
              end>
            ExplicitLeft = 2
          end
          inherited btnPesquisar: TButton
            Left = 311
            ExplicitLeft = 311
          end
          inherited rgStatus: TcxRadioGroup
            Left = 6
            Top = 41
            ExplicitLeft = 6
            ExplicitTop = 41
          end
        end
        inherited pnBotoes: TPanel
          Width = 563
          inherited btnUtilizar: TButton
            Left = 374
            ExplicitLeft = 274
          end
          inherited btnExportarExcel: TButton
            Left = 272
            ExplicitLeft = 172
          end
          object btnGerarVenda: TButton
            AlignWithMargins = True
            Left = 186
            Top = 1
            Width = 85
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Action = Ac_Gerar_Venda
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 3
            WordWrap = True
            ExplicitLeft = 86
          end
          object btnGerarSaida: TButton
            AlignWithMargins = True
            Left = 86
            Top = 1
            Width = 99
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 1
            Margins.Bottom = 1
            Action = Ac_Gerar_Saida
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 4
            WordWrap = True
          end
        end
      end
      inherited pnGrid: TPanel
        Height = 539
        ExplicitHeight = 539
        inherited cxGridRegistros: TcxGrid
          Height = 304
          ExplicitHeight = 304
          inherited viewRegistros: TcxGridDBTableView
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Options.Editing = False
              Width = 45
            end
            object viewRegistrosID_CLIENTE: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ID_CLIENTE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosCLIENTE: TcxGridDBColumn [2]
              DataBinding.FieldName = 'CLIENTE'
              Options.Editing = False
              Width = 215
            end
            object viewRegistrosID_PESSOA_RESPONSAVEL: TcxGridDBColumn [3]
              DataBinding.FieldName = 'ID_PESSOA_RESPONSAVEL'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosRESPONSAVEL: TcxGridDBColumn [4]
              DataBinding.FieldName = 'RESPONSAVEL'
              Options.Editing = False
              Width = 239
            end
            object viewRegistrosDATA: TcxGridDBColumn [5]
              DataBinding.FieldName = 'DATA'
              Options.Editing = False
              Width = 93
            end
            object viewRegistrosQTDE_MUDA: TcxGridDBColumn [6]
              DataBinding.FieldName = 'QTDE_MUDA'
              Options.Editing = False
              Width = 77
            end
            object viewRegistrosQTDE_MUDA_ROCAMBOLE: TcxGridDBColumn [7]
              DataBinding.FieldName = 'QTDE_MUDA_ROCAMBOLE'
              Options.Editing = False
              Width = 151
            end
            object ColumnSaidaVenda: TcxGridDBColumn [8]
              Caption = 'Gerou Sa'#237'da ou Venda'
              OnCustomDrawCell = ColumnSaidaVendaCustomDrawCell
              OnGetDisplayText = ColumnSaidaVendaGetDisplayText
              Options.Editing = False
            end
            object viewRegistrosID_VENDA: TcxGridDBColumn [9]
              DataBinding.FieldName = 'ID_VENDA'
              Visible = False
            end
            object viewRegistrosID_SAIDA: TcxGridDBColumn [10]
              DataBinding.FieldName = 'ID_SAIDA'
              Visible = False
            end
          end
        end
        inherited cxSplitter1: TcxSplitter
          Top = 305
          ExplicitTop = 305
        end
        inherited pnDetail: TPanel
          Top = 311
          ExplicitTop = 311
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              Caption = 'Esp'#233'cies'
              ExplicitLeft = 2
              ExplicitTop = 25
              ExplicitWidth = 965
              ExplicitHeight = 195
              inherited pnBotoesDetail: TPanel
                Visible = False
                object Label5: TLabel [0]
                  Left = 633
                  Top = 9
                  Width = 31
                  Height = 13
                  Caption = 'Lotes'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
              end
              inherited cxGridRegistrosDetail: TcxGrid
                Width = 633
                Align = alLeft
                ExplicitWidth = 633
                inherited viewRegistrosDetail: TcxGridDBTableView
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewRegistrosDetailID_ESPECIE: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'ID_ESPECIE'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewRegistrosDetailESPECIE: TcxGridDBColumn [2]
                    DataBinding.FieldName = 'ESPECIE'
                    Options.Editing = False
                    Width = 293
                  end
                  object viewRegistrosDetailNOME_CIENTIFICO: TcxGridDBColumn [3]
                    DataBinding.FieldName = 'NOME_CIENTIFICO'
                    Options.Editing = False
                    Width = 371
                  end
                  inherited ColumnAlterarDetail: TcxGridDBColumn
                    Visible = False
                    VisibleForCustomization = False
                  end
                  inherited ColumnExcluirDetail: TcxGridDBColumn
                    Visible = False
                    VisibleForCustomization = False
                  end
                end
              end
              object cxGrid1: TcxGrid
                Left = 633
                Top = 25
                Width = 332
                Height = 170
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 2
                LockedStateImageOptions.Effect = lsieDark
                LockedStateImageOptions.ShowText = True
                LockedStateImageOptions.Text = 'Pesquisando...'
                ExplicitLeft = 0
                ExplicitWidth = 457
                object viewLotes: TcxGridDBTableView
                  OnDblClick = viewRegistrosDetailDblClick
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
                  DataController.DataSource = dsMix_Muda_Especie_Lote
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  FilterRow.Visible = True
                  OptionsCustomize.ColumnsQuickCustomization = True
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsSelection.MultiSelect = True
                  OptionsView.NoDataToDisplayInfoText = '<Sem dados para mostrar>'
                  OptionsView.GroupByBox = False
                  object viewLotesID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewLotesID_LOTE_MUDA: TcxGridDBColumn
                    DataBinding.FieldName = 'ID_LOTE_MUDA'
                    Visible = False
                    Options.Editing = False
                  end
                  object viewLotesLOTE: TcxGridDBColumn
                    DataBinding.FieldName = 'LOTE'
                    Options.Editing = False
                    Width = 154
                  end
                  object viewLotesQTDE: TcxGridDBColumn
                    DataBinding.FieldName = 'QTDE'
                  end
                  object viewLotesCANTEIROS: TcxGridDBColumn
                    DataBinding.FieldName = 'CANTEIROS'
                    Options.Editing = False
                    Width = 272
                  end
                end
                object cxGridLevel2: TcxGridLevel
                  GridView = viewLotes
                end
              end
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      inherited pnEditsCadastro: TPanel
        Height = 533
        ExplicitHeight = 533
        object pnEditsCadastroSuperior: TPanel
          Left = 1
          Top = 1
          Width = 974
          Height = 168
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label3: TLabel
            Left = 3
            Top = 46
            Width = 77
            Height = 13
            Caption = 'Qtde. de Mudas'
            FocusControl = EditQtde
          end
          object Label4: TLabel
            Left = 91
            Top = 46
            Width = 102
            Height = 13
            Caption = 'Qtde. por Rocambole'
            FocusControl = EditQtdeRocambole
          end
          object lbl1: TLabel
            Left = 195
            Top = 3
            Width = 61
            Height = 13
            Caption = 'Respons'#225'vel'
            FocusControl = cbResponsavel
          end
          object lbl2: TLabel
            Left = 407
            Top = 3
            Width = 71
            Height = 13
            Caption = 'Data da Venda'
            FocusControl = EditData
          end
          object lbl4: TLabel
            Left = 3
            Top = 86
            Width = 46
            Height = 13
            Caption = 'Descri'#231#227'o'
            FocusControl = EditDescricao
          end
          object lbl5: TLabel
            Left = 3
            Top = 3
            Width = 56
            Height = 13
            Caption = 'Cliente (F2)'
            FocusControl = cbCliente
          end
          object btnAdicionarCliente: TButton
            Left = 166
            Top = 19
            Width = 22
            Height = 21
            Action = Ac_Adicionar_Cliente
            Images = dmPrincipal.imgIcons_16
            TabOrder = 1
            TabStop = False
          end
          object cbCliente: TcxDBLookupComboBox
            Left = 1
            Top = 19
            RepositoryItem = dmLookup.repLcbFinForCli
            DataBinding.DataField = 'ID_CLIENTE'
            DataBinding.DataSource = dsMaster
            Properties.ListColumns = <>
            TabOrder = 0
            Width = 165
          end
          object cbResponsavel: TcxDBLookupComboBox
            Left = 193
            Top = 19
            RepositoryItem = dmLookup.repLcbPessoa
            DataBinding.DataField = 'ID_PESSOA_RESPONSAVEL'
            DataBinding.DataSource = dsMaster
            Properties.ListColumns = <>
            TabOrder = 2
            Width = 208
          end
          object EditData: TcxDBDateEdit
            Left = 405
            Top = 19
            RepositoryItem = dmLookup.repDateDataPadrao
            DataBinding.DataField = 'DATA'
            DataBinding.DataSource = dsMaster
            TabOrder = 3
            Width = 121
          end
          object EditDescricao: TcxDBMemo
            Left = 1
            Top = 102
            DataBinding.DataField = 'DESCRICAO'
            DataBinding.DataSource = dsMaster
            TabOrder = 6
            Height = 62
            Width = 525
          end
          object EditQtde: TcxDBCalcEdit
            Left = 1
            Top = 63
            RepositoryItem = dmLookup.repCalcPadrao
            DataBinding.DataField = 'QTDE_MUDA'
            DataBinding.DataSource = dsMaster
            Properties.OnEditValueChanged = EditQtdePropertiesEditValueChanged
            TabOrder = 4
            Width = 82
          end
          object EditQtdeRocambole: TcxDBCalcEdit
            Left = 89
            Top = 63
            RepositoryItem = dmLookup.repCalcPadrao
            DataBinding.DataField = 'QTDE_MUDA_ROCAMBOLE'
            DataBinding.DataSource = dsMaster
            Properties.OnEditValueChanged = EditQtdePropertiesEditValueChanged
            TabOrder = 5
            Width = 104
          end
        end
        inline frameGrids: TframeGrids
          Left = 1
          Top = 169
          Width = 974
          Height = 363
          Align = alClient
          TabOrder = 1
          ExplicitLeft = 1
          ExplicitTop = 169
          ExplicitWidth = 974
          ExplicitHeight = 363
          inherited gpGrids: TGridPanel
            Width = 974
            Height = 344
            ControlCollection = <
              item
                Column = 0
                Control = frameGrids.cxGrid1
                Row = 0
              end
              item
                Column = 1
                Control = frameGrids.pnBotoes
                Row = 0
              end
              item
                Column = 2
                Control = frameGrids.cxGrid2
                Row = 0
              end>
            TabOrder = 1
            ExplicitWidth = 974
            ExplicitHeight = 344
            inherited cxGrid1: TcxGrid
              Width = 456
              Height = 342
              ExplicitWidth = 456
              ExplicitHeight = 342
            end
            inherited pnBotoes: TPanel
              Left = 457
              Width = 48
              Height = 342
              ExplicitLeft = 457
              ExplicitWidth = 48
              ExplicitHeight = 342
              inherited btnAdd: TButton
                ExplicitWidth = 48
              end
              inherited btnAddTodos: TButton
                ExplicitWidth = 48
              end
              inherited btnRemover: TButton
                ExplicitWidth = 48
              end
              inherited btnRemoverTodos: TButton
                ExplicitWidth = 48
              end
            end
            inherited cxGrid2: TcxGrid
              Left = 505
              Width = 468
              Height = 342
              ExplicitLeft = 505
              ExplicitWidth = 468
              ExplicitHeight = 342
              inherited viewDireita: TcxGridDBTableView
                DataController.DataSource = dsDetail
              end
            end
          end
          inherited pnLabels: TPanel
            Width = 974
            TabOrder = 0
            ExplicitWidth = 974
            inherited gpLabels: TGridPanel
              Width = 972
              ControlCollection = <
                item
                  Column = 0
                  Control = frameGrids.lbInfoGridEsquerda
                  Row = 0
                end
                item
                  Column = 2
                  Control = frameGrids.lbInfoGridDireita
                  Row = 0
                end>
              ExplicitWidth = 972
              inherited lbInfoGridEsquerda: TLabel
                Width = 229
                Caption = 'Esp'#233'cies com mudas prontas dispon'#237'veis'
                ExplicitWidth = 229
              end
              inherited lbInfoGridDireita: TLabel
                Left = 504
                Width = 124
                Caption = 'Esp'#233'cies selecionadas'
                ExplicitLeft = 504
                ExplicitWidth = 124
              end
            end
          end
          inherited dsEsquerda: TDataSource
            DataSet = cdsLocalEspecie
            Left = 288
            Top = 88
          end
          inherited dsDireita: TDataSource
            DataSet = dmViveiro.cdsMix_Muda_Especie
            Left = 664
            Top = 64
          end
          inherited ActionListFrame: TActionList
            Left = 144
            Top = 80
          end
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitHeight = 583
      inherited pnEditsCadastroDetail: TPanel
        Height = 533
        ExplicitHeight = 533
      end
    end
  end
  inherited ActionList1: TActionList
    object Ac_Adicionar_Cliente: TAction
      Category = 'Master'
      ImageIndex = 3
    end
    object Ac_Gerar_Venda: TAction
      Category = 'Master'
      Caption = 'Gerar Venda'
      ImageIndex = 27
      OnExecute = Ac_Gerar_VendaExecute
      OnUpdate = Ac_Gerar_SaidaUpdate
    end
    object Ac_Gerar_Saida: TAction
      Category = 'Master'
      Caption = 'Gerar Sa'#237'da do Estoque'
      ImageIndex = 26
      OnExecute = Ac_Gerar_SaidaExecute
      OnUpdate = Ac_Gerar_SaidaUpdate
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmViveiro.cdsMix_Muda
    Top = 128
  end
  inherited fdExportDialog: TSaveTextFileDialog
    Left = 568
    Top = 184
  end
  inherited dsDetail: TDataSource
    DataSet = dmViveiro.cdsMix_Muda_Especie
    Left = 352
    Top = 144
  end
  object cdsLocalEspecie: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 216
    object cdsLocalEspecieID: TIntegerField
      DisplayLabel = 'Id da Esp'#233'cie'
      FieldName = 'ID'
      ProviderFlags = []
    end
    object cdsLocalEspecieNOME: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsLocalEspecieQTDE_MUDA_PRONTA: TIntegerField
      DisplayLabel = 'Qtde. de Muda Pronta'
      FieldName = 'QTDE_MUDA_PRONTA'
      DisplayFormat = ',0'
    end
  end
  object dsMix_Muda_Especie_Lote: TDataSource
    DataSet = dmViveiro.cdsMix_Muda_Especie_Lote
    Left = 488
    Top = 312
  end
end
