inherited frmTransferenciaFinanceira: TfrmTransferenciaFinanceira
  ActiveControl = nil
  Caption = 'Transfer'#234'ncia de Saldos'
  ExplicitWidth = 1000
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabCadastro
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 436
          Width = 539
          ExplicitLeft = 435
          ExplicitWidth = 539
          inherited Label1: TLabel
            Left = 132
            ExplicitLeft = 132
          end
          object Label6: TLabel [1]
            Left = 4
            Top = 4
            Width = 113
            Height = 13
            Caption = 'Tipos de Transfer'#234'ncia:'
          end
          object cbPesquisaFundo: TcxLookupComboBox [2]
            Left = 265
            Top = 20
            RepositoryItem = dmLookup.repLcbFundo
            Properties.ListColumns = <>
            TabOrder = 6
            Width = 175
          end
          inherited pnData: TPanel
            Left = 311
            ExplicitLeft = 311
          end
          inherited EditPesquisa: TcxButtonEdit
            Left = 263
            ExplicitLeft = 263
          end
          inherited cbPesquisarPor: TcxImageComboBox
            Left = 130
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
                Description = 'Conta'
                Value = 5
              end
              item
                Description = 'Projeto'
                Value = 6
              end
              item
                Description = 'Data'
                Value = 4
              end>
            ExplicitLeft = 130
          end
          inherited btnPesquisar: TButton
            Left = 439
            ExplicitLeft = 439
          end
          inherited rgStatus: TcxRadioGroup
            Left = 128
            Top = 33
            ExplicitLeft = 128
            ExplicitTop = 33
          end
          object cbPesquisaProjeto: TcxLookupComboBox
            Left = 264
            Top = 20
            RepositoryItem = dmLookup.repLcbProjeto
            Properties.ListColumns = <>
            TabOrder = 5
            Visible = False
            Width = 176
          end
          object cbTipoTransferenciaPesquisa: TcxCheckComboBox
            Left = 2
            Top = 20
            Properties.EmptySelectionText = 'Todos'
            Properties.DropDownSizeable = True
            Properties.EditValueFormat = cvfIndices
            Properties.Items = <
              item
              end>
            TabOrder = 7
            Width = 126
          end
        end
        inherited pnBotoes: TPanel
          Width = 435
          ExplicitWidth = 563
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            object viewRegistrosTIPO: TcxGridDBColumn [0]
              DataBinding.FieldName = 'TIPO'
              RepositoryItem = dmLookup.repIcbTipoTransferencia
              Options.Editing = False
              Width = 127
            end
            object viewRegistrosID: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ID'
              Visible = False
              Options.Editing = False
              Width = 36
            end
            object viewRegistrosRESPONSAVEL: TcxGridDBColumn [2]
              DataBinding.FieldName = 'RESPONSAVEL'
              Options.Editing = False
              Width = 141
            end
            object viewRegistrosORIGEM: TcxGridDBColumn [3]
              DataBinding.FieldName = 'ORIGEM'
              Options.Editing = False
              Width = 240
            end
            object viewRegistrosDESTINO: TcxGridDBColumn [4]
              DataBinding.FieldName = 'DESTINO'
              Options.Editing = False
              Width = 240
            end
            object viewRegistrosVALOR: TcxGridDBColumn [5]
              DataBinding.FieldName = 'VALOR'
              Options.Editing = False
              Width = 123
            end
            object viewRegistrosID_FUNDO_ORIGEM: TcxGridDBColumn [6]
              DataBinding.FieldName = 'ID_FUNDO_ORIGEM'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_FUNDO_DESTINO: TcxGridDBColumn [7]
              DataBinding.FieldName = 'ID_FUNDO_DESTINO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_PROJETO_RUBRICA_ORIGEM: TcxGridDBColumn [8]
              DataBinding.FieldName = 'ID_PROJETO_RUBRICA_ORIGEM'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_PROJETO_RUBRICA_DESTINO: TcxGridDBColumn [9]
              DataBinding.FieldName = 'ID_PROJETO_RUBRICA_DESTINO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosFUNDO_ORIGEM: TcxGridDBColumn [10]
              DataBinding.FieldName = 'FUNDO_ORIGEM'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosFUNDO_DESTINO: TcxGridDBColumn [11]
              DataBinding.FieldName = 'FUNDO_DESTINO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosRUBRICA_ORIGEM: TcxGridDBColumn [12]
              DataBinding.FieldName = 'RUBRICA_ORIGEM'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosRUBRICA_DESTINO: TcxGridDBColumn [13]
              DataBinding.FieldName = 'RUBRICA_DESTINO'
              Visible = False
              Options.Editing = False
            end
            inherited ColumnAlterar: TcxGridDBColumn
              Visible = False
            end
            inherited ColumnExcluir: TcxGridDBColumn
              Visible = False
            end
            object viewRegistrosID_PESSOA: TcxGridDBColumn
              DataBinding.FieldName = 'ID_PESSOA'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosDATA: TcxGridDBColumn
              DataBinding.FieldName = 'DATA'
              Options.Editing = False
              Width = 150
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
        object Label5: TLabel
          Left = 152
          Top = 71
          Width = 104
          Height = 13
          Caption = 'Tipo de Transfer'#234'ncia'
          FocusControl = cbTipoTransferencia
        end
        object Label8: TLabel
          Left = 357
          Top = 71
          Width = 24
          Height = 13
          Caption = 'Valor'
          FocusControl = EditValor
        end
        object gbOrigem: TcxGroupBox
          Left = 148
          Top = 6
          Caption = 'Origem'
          TabOrder = 1
          Height = 62
          Width = 410
          object pnOrigemProjeto: TPanel
            Left = 3
            Top = 15
            Width = 404
            Height = 37
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 0
            object Label4: TLabel
              Left = 3
              Top = 0
              Width = 35
              Height = 13
              Caption = 'Projeto'
              FocusControl = cbProjetoOrigem
            end
            object lb1: TLabel
              Left = 206
              Top = 0
              Width = 36
              Height = 13
              Caption = 'Rubrica'
              FocusControl = cbRubricaOrigem
            end
            object cbProjetoOrigem: TcxLookupComboBox
              Left = 1
              Top = 16
              RepositoryItem = dmLookup.repLcbProjeto
              Properties.ListColumns = <>
              Properties.OnEditValueChanged = cbProjetoOrigemPropertiesEditValueChanged
              TabOrder = 0
              Width = 199
            end
            object cbRubricaOrigem: TcxDBLookupComboBox
              Left = 204
              Top = 16
              DataBinding.DataField = 'ID_PROJETO_RUBRICA_ORIGEM'
              DataBinding.DataSource = dsMaster
              Properties.DropDownAutoSize = True
              Properties.DropDownListStyle = lsFixedList
              Properties.DropDownSizeable = True
              Properties.KeyFieldNames = 'ID'
              Properties.ListColumns = <
                item
                  Width = 300
                  FieldName = 'NOME_RUBRICA'
                end
                item
                  Width = 200
                  FieldName = 'SALDO_REAL'
                end>
              Properties.ListOptions.SyncMode = True
              Properties.ListSource = dsLocalRubricasOrigem
              TabOrder = 1
              Width = 200
            end
          end
          object pnOrigemFundo: TPanel
            Left = 3
            Top = 52
            Width = 404
            Height = 37
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
            Visible = False
            object lb2: TLabel
              Left = 3
              Top = 0
              Width = 29
              Height = 13
              Caption = 'Conta'
              FocusControl = cbFundoOrigem
            end
            object cbFundoOrigem: TcxDBLookupComboBox
              Left = 1
              Top = 16
              RepositoryItem = dmLookup.repLcbFundo
              DataBinding.DataField = 'ID_FUNDO_ORIGEM'
              DataBinding.DataSource = dsMaster
              Properties.ListColumns = <>
              TabOrder = 0
              Width = 199
            end
          end
        end
        object rgTipoTransferencia: TcxRadioGroup
          Left = 4
          Top = 6
          Caption = 'Tipo de Transfer'#234'ncia'
          Properties.Items = <
            item
              Caption = 'Projeto para Conta'
              Value = 0
            end
            item
              Caption = 'Projeto para Projeto'
              Value = 1
            end
            item
              Caption = 'Conta para Projeto'
              Value = 2
            end
            item
              Caption = 'Conta para Conta'
              Value = 3
            end>
          Properties.OnEditValueChanged = rgTipoTransferenciaPropertiesEditValueChanged
          ItemIndex = 0
          TabOrder = 0
          Height = 102
          Width = 142
        end
        object gbDestino: TcxGroupBox
          Left = 561
          Top = 6
          Caption = 'Destino'
          TabOrder = 2
          Height = 102
          Width = 410
          object pnDestinoProjeto: TPanel
            Left = 3
            Top = 15
            Width = 404
            Height = 37
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 0
            Visible = False
            object lb3: TLabel
              Left = 3
              Top = 0
              Width = 35
              Height = 13
              Caption = 'Projeto'
              FocusControl = cbProjetoDestino
            end
            object lb4: TLabel
              Left = 206
              Top = 0
              Width = 36
              Height = 13
              Caption = 'Rubrica'
              FocusControl = cbRubricaDestino
            end
            object cbProjetoDestino: TcxLookupComboBox
              Left = 1
              Top = 16
              RepositoryItem = dmLookup.repLcbProjeto
              Properties.ListColumns = <>
              Properties.OnEditValueChanged = cbProjetoDestinoPropertiesEditValueChanged
              TabOrder = 0
              Width = 199
            end
            object cbRubricaDestino: TcxDBLookupComboBox
              Left = 204
              Top = 16
              DataBinding.DataField = 'ID_PROJETO_RUBRICA_DESTINO'
              DataBinding.DataSource = dsMaster
              Properties.DropDownAutoSize = True
              Properties.DropDownListStyle = lsFixedList
              Properties.DropDownSizeable = True
              Properties.KeyFieldNames = 'ID'
              Properties.ListColumns = <
                item
                  Width = 300
                  FieldName = 'NOME_RUBRICA'
                end
                item
                  Width = 200
                  FieldName = 'SALDO_REAL'
                end>
              Properties.ListOptions.SyncMode = True
              Properties.ListSource = dsLocalRubricasDestino
              TabOrder = 1
              Width = 200
            end
          end
          object pnDestinoFundo: TPanel
            Left = 3
            Top = 52
            Width = 404
            Height = 37
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
            object Label3: TLabel
              Left = 3
              Top = 0
              Width = 29
              Height = 13
              Caption = 'Conta'
              FocusControl = cbFundoDestino
            end
            object cbFundoDestino: TcxDBLookupComboBox
              Left = 1
              Top = 16
              RepositoryItem = dmLookup.repLcbFundo
              DataBinding.DataField = 'ID_FUNDO_DESTINO'
              DataBinding.DataSource = dsMaster
              Properties.ListColumns = <>
              TabOrder = 0
              Width = 199
            end
          end
        end
        object cbTipoTransferencia: TcxDBImageComboBox
          Left = 152
          Top = 87
          RepositoryItem = dmLookup.repIcbTipoTransferencia
          DataBinding.DataField = 'TIPO'
          DataBinding.DataSource = dsMaster
          Properties.Items = <>
          TabOrder = 3
          Width = 199
        end
        object EditValor: TcxDBCurrencyEdit
          Left = 355
          Top = 87
          RepositoryItem = dmLookup.repCurPadrao
          DataBinding.DataField = 'VALOR'
          DataBinding.DataSource = dsMaster
          TabOrder = 4
          Width = 136
        end
      end
    end
  end
  inherited ActionList1: TActionList
    Left = 104
    Top = 288
  end
  inherited dsMaster: TDataSource
    DataSet = dmFinanceiro.cdsTransferencia_Financeira
    Left = 248
    Top = 312
  end
  object dsLocalRubricasOrigem: TDataSource
    DataSet = cdsLocalRubricasOrigem
    Left = 400
    Top = 352
  end
  object cdsLocalRubricasOrigem: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 400
    Top = 288
    object cdsLocalRubricasOrigemID: TIntegerField
      FieldName = 'ID'
    end
    object cdsLocalRubricasOrigemNOME_RUBRICA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME_RUBRICA'
      Size = 123
    end
    object cdsLocalRubricasOrigemSALDO_REAL: TFMTBCDField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO_REAL'
      currency = True
      Size = 0
    end
  end
  object dsLocalRubricasDestino: TDataSource
    DataSet = cdsLocalRubricasDestino
    Left = 600
    Top = 368
  end
  object cdsLocalRubricasDestino: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 600
    Top = 304
    object IntegerField1: TIntegerField
      FieldName = 'ID'
    end
    object cdsLocalRubricasDestinoNOME_RUBRICA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME_RUBRICA'
      Size = 123
    end
    object cdsLocalRubricasDestinoSALDO_REAL: TFMTBCDField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO_REAL'
      currency = True
      Size = 0
    end
  end
end
