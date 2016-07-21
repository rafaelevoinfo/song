inherited frmPatrimonio: TfrmPatrimonio
  ActiveControl = cbItem
  Caption = 'Patrim'#244'nio'
  ExplicitWidth = 1000
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabCadastro
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          inherited cbPesquisarPor: TcxImageComboBox
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
                Description = 'Data de Aquisi'#231#227'o'
                Value = 4
              end
              item
                Description = 'Item'
                Value = 5
              end
              item
                Description = 'Localiza'#231#227'o'
                Value = 6
              end
              item
                Description = 'Nota Fiscal'
                Value = 7
              end
              item
                Description = 'N'#250'mero de Identifica'#231#227'o'
                Value = 8
              end>
          end
          inherited rgStatus: TcxRadioGroup
            Properties.Items = <
              item
                Caption = 'Em uso'
              end
              item
                Caption = 'Baixado'
              end>
            Visible = True
          end
          object cbPesquisaItem: TcxLookupComboBox
            Left = 268
            Top = 20
            RepositoryItem = dmLookup.repLcbItemPatrimonio
            Properties.ListColumns = <>
            TabOrder = 5
            Visible = False
            Width = 176
          end
        end
        inherited pnBotoes: TPanel
          inherited btnUtilizar: TButton
            Left = 188
            ExplicitLeft = 188
          end
          object btnBaixarReativar: TButton
            AlignWithMargins = True
            Left = 86
            Top = 1
            Width = 100
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 2
            Margins.Bottom = 1
            Action = Ac_Baixar
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 2
            WordWrap = True
          end
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            OnCustomDrawCell = viewRegistrosCustomDrawCell
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_ITEM_PATRIMONIO: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ID_ITEM_PATRIMONIO'
              Visible = False
              Options.Editing = False
              VisibleForEditForm = bTrue
            end
            object viewRegistrosNOME_ITEM: TcxGridDBColumn [2]
              DataBinding.FieldName = 'NOME_ITEM'
              Options.Editing = False
              Width = 222
            end
            object viewRegistrosDATA_AQUISICAO: TcxGridDBColumn [3]
              DataBinding.FieldName = 'DATA_AQUISICAO'
              Options.Editing = False
              Width = 92
            end
            object viewRegistrosIDENTIFICACAO: TcxGridDBColumn [4]
              DataBinding.FieldName = 'IDENTIFICACAO'
              Options.Editing = False
            end
            object viewRegistrosMARCA: TcxGridDBColumn [5]
              DataBinding.FieldName = 'MARCA'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosVALOR_INICIAL: TcxGridDBColumn [6]
              DataBinding.FieldName = 'VALOR_INICIAL'
              Options.Editing = False
            end
            object viewRegistrosTAXA_DEPRECIACAO_ANUAL: TcxGridDBColumn [7]
              DataBinding.FieldName = 'TAXA_DEPRECIACAO_ANUAL'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosLOCALIZACAO: TcxGridDBColumn [8]
              DataBinding.FieldName = 'LOCALIZACAO'
              Options.Editing = False
              Width = 132
            end
            object viewRegistrosNOTA_FISCAL: TcxGridDBColumn [9]
              DataBinding.FieldName = 'NOTA_FISCAL'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosSTATUS: TcxGridDBColumn [10]
              DataBinding.FieldName = 'STATUS'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosCALC_VALOR_ATUAL: TcxGridDBColumn [11]
              DataBinding.FieldName = 'CALC_VALOR_ATUAL'
              Options.Editing = False
            end
            inherited ColumnAlterar: TcxGridDBColumn
              MinWidth = 50
              Width = 50
            end
            inherited ColumnExcluir: TcxGridDBColumn
              MinWidth = 50
              Width = 50
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
        object Label3: TLabel
          Left = 6
          Top = 2
          Width = 45
          Height = 13
          Caption = 'Item (F2)'
          FocusControl = cbItem
        end
        object Label4: TLabel
          Left = 267
          Top = 47
          Width = 86
          Height = 13
          Caption = 'Data de Aquisi'#231#227'o'
          FocusControl = EditDataAquisicao
        end
        object Label5: TLabel
          Left = 267
          Top = 2
          Width = 29
          Height = 13
          Caption = 'Marca'
          FocusControl = EditMarca
        end
        object Label6: TLabel
          Left = 411
          Top = 47
          Width = 54
          Height = 13
          Caption = 'Valor Inicial'
          FocusControl = EditValorInicial
        end
        object Label7: TLabel
          Left = 553
          Top = 47
          Width = 131
          Height = 13
          Caption = 'Taxa de Deprecia'#231#227'o Anual'
          FocusControl = EditTaxaDepreciacao
        end
        object lb1: TLabel
          Left = 6
          Top = 93
          Width = 54
          Height = 13
          Caption = 'Localiza'#231#227'o'
          FocusControl = EditLocalizacao
        end
        object lb2: TLabel
          Left = 692
          Top = 47
          Width = 52
          Height = 13
          Caption = 'Nota Fiscal'
          FocusControl = EditNotaFiscal
        end
        object lb3: TLabel
          Left = 6
          Top = 47
          Width = 187
          Height = 13
          Caption = 'N'#250'mero de Identifica'#231#227'o (Nr'#186' da Placa)'
          FocusControl = EditIdentifiacao
        end
        object lb4: TLabel
          Left = 555
          Top = 2
          Width = 34
          Height = 13
          Caption = 'Modelo'
          FocusControl = EditModelo
        end
        object Label8: TLabel
          Left = 6
          Top = 136
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
          FocusControl = EditObservacao
        end
        object cbItem: TcxDBLookupComboBox
          Left = 4
          Top = 18
          RepositoryItem = dmLookup.repLcbItemPatrimonio
          DataBinding.DataField = 'ID_ITEM_PATRIMONIO'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          Properties.OnEditValueChanged = cbItemPropertiesEditValueChanged
          TabOrder = 0
          OnKeyDown = cbItemKeyDown
          Width = 231
        end
        object btnAdicionar_Financiador: TButton
          Left = 237
          Top = 18
          Width = 22
          Height = 21
          Action = Ac_Adicionar_Item
          Images = dmPrincipal.imgIcons_16
          TabOrder = 1
          TabStop = False
        end
        object EditDataAquisicao: TcxDBDateEdit
          Left = 265
          Top = 63
          DataBinding.DataField = 'DATA_AQUISICAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 5
          Width = 143
        end
        object EditMarca: TcxDBTextEdit
          Left = 265
          Top = 18
          DataBinding.DataField = 'MARCA'
          DataBinding.DataSource = dsMaster
          TabOrder = 2
          Width = 282
        end
        object EditValorInicial: TcxDBCurrencyEdit
          Left = 409
          Top = 63
          RepositoryItem = dmLookup.repCurPadrao
          DataBinding.DataField = 'VALOR_INICIAL'
          DataBinding.DataSource = dsMaster
          TabOrder = 6
          Width = 138
        end
        object EditTaxaDepreciacao: TcxDBSpinEdit
          Left = 553
          Top = 63
          DataBinding.DataField = 'TAXA_DEPRECIACAO_ANUAL'
          DataBinding.DataSource = dsMaster
          Properties.DisplayFormat = '0 %'
          Properties.MaxValue = 100.000000000000000000
          TabOrder = 7
          Width = 131
        end
        object EditLocalizacao: TcxDBTextEdit
          Left = 4
          Top = 109
          DataBinding.DataField = 'LOCALIZACAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 9
          Width = 255
        end
        object EditNotaFiscal: TcxDBTextEdit
          Left = 690
          Top = 63
          DataBinding.DataField = 'NOTA_FISCAL'
          DataBinding.DataSource = dsMaster
          TabOrder = 8
          Width = 145
        end
        object EditIdentifiacao: TcxDBTextEdit
          Left = 4
          Top = 63
          DataBinding.DataField = 'IDENTIFICACAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 4
          Width = 255
        end
        object EditModelo: TcxDBTextEdit
          Left = 553
          Top = 18
          DataBinding.DataField = 'MODELO'
          DataBinding.DataSource = dsMaster
          TabOrder = 3
          Width = 282
        end
        object EditObservacao: TcxDBMemo
          Left = 4
          Top = 152
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 10
          Height = 73
          Width = 831
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 104
    Top = 240
    object Ac_Adicionar_Item: TAction
      ImageIndex = 3
      OnExecute = Ac_Adicionar_ItemExecute
    end
    object Ac_Baixar: TAction
      Category = 'Master'
      Caption = 'Dar Baixa'
      ImageIndex = 8
      OnExecute = Ac_BaixarExecute
      OnUpdate = Ac_AlterarUpdate
    end
    object Ac_Reativar: TAction
      Category = 'Master'
      Caption = 'Reativar'
      ImageIndex = 6
      OnExecute = Ac_ReativarExecute
      OnUpdate = Ac_AlterarUpdate
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmEstoque.cdsPatrimonio
    Left = 224
    Top = 232
  end
end
