inherited frmDoacao: TfrmDoacao
  Caption = 'Doa'#231#227'o'
  ExplicitWidth = 1000
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 564
          Width = 411
          ExplicitLeft = 564
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
            Top = 33
            ExplicitLeft = 6
            ExplicitTop = 33
          end
        end
        inherited pnBotoes: TPanel
          Width = 563
          ExplicitWidth = 563
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            DataController.Summary.FooterSummaryItems = <
              item
                Format = 'R$ ,0.00'
                Kind = skSum
                FieldName = 'VALOR'
                Column = viewRegistrosVALOR
              end>
            OptionsView.Footer = True
            OptionsView.FooterAutoHeight = True
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosID_PESSOA_DOADORA: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ID_PESSOA_DOADORA'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosNOME_DOADOR: TcxGridDBColumn [2]
              DataBinding.FieldName = 'NOME_DOADOR'
              Options.Editing = False
              Width = 189
            end
            object viewRegistrosID_PESSOA_RECEBEU: TcxGridDBColumn [3]
              DataBinding.FieldName = 'ID_PESSOA_RECEBEU'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosNOME_FUNCIONARIO: TcxGridDBColumn [4]
              DataBinding.FieldName = 'NOME_FUNCIONARIO'
              Options.Editing = False
              Width = 168
            end
            object viewRegistrosID_FUNDO: TcxGridDBColumn [5]
              DataBinding.FieldName = 'ID_FUNDO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosVALOR: TcxGridDBColumn [6]
              DataBinding.FieldName = 'VALOR'
              Options.Editing = False
              Width = 148
            end
            object viewRegistrosFUNDO_DESTINO: TcxGridDBColumn [7]
              DataBinding.FieldName = 'FUNDO_DESTINO'
              Options.Editing = False
              Width = 174
            end
            object viewRegistrosDATA: TcxGridDBColumn [8]
              DataBinding.FieldName = 'DATA'
              Options.Editing = False
              Width = 100
            end
            object viewRegistrosFORMA_PAGTO: TcxGridDBColumn [9]
              DataBinding.FieldName = 'FORMA_PAGTO'
              Visible = False
              Width = 107
            end
            inherited ColumnAlterar: TcxGridDBColumn
              Visible = False
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
          Top = 6
          Width = 148
          Height = 13
          Caption = 'Pessoa que Recebeu a Doa'#231#227'o'
          FocusControl = cbPessoaRecebeu
        end
        object Label4: TLabel
          Left = 226
          Top = 6
          Width = 58
          Height = 13
          Caption = 'Doador (F2)'
          FocusControl = cbPessoaDoadora
        end
        object lb1: TLabel
          Left = 582
          Top = 6
          Width = 83
          Height = 13
          Caption = 'Conta de Destino'
          FocusControl = cbFundo
        end
        object Label5: TLabel
          Left = 225
          Top = 46
          Width = 24
          Height = 13
          Caption = 'Valor'
          FocusControl = EditValor
        end
        object Label6: TLabel
          Left = 458
          Top = 6
          Width = 77
          Height = 13
          Caption = 'Data da Doa'#231#227'o'
          FocusControl = EditDataDoacao
        end
        object Label7: TLabel
          Left = 6
          Top = 88
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
          FocusControl = EditObservacao
        end
        object Label8: TLabel
          Left = 6
          Top = 45
          Width = 156
          Height = 13
          Caption = 'Forma de Pagamento da Doa'#231#227'o'
        end
        object cbPessoaRecebeu: TcxDBLookupComboBox
          Left = 4
          Top = 21
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_PESSOA_RECEBEU'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 214
        end
        object cbPessoaDoadora: TcxDBLookupComboBox
          Left = 224
          Top = 21
          DataBinding.DataField = 'ID_PESSOA_DOADORA'
          DataBinding.DataSource = dsMaster
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'ID_PESSOA_DOADORA'
          Properties.ListColumns = <
            item
              FieldName = 'NOME'
            end>
          Properties.ListOptions.FocusRowOnMouseMove = False
          Properties.ListOptions.SyncMode = True
          Properties.ListSource = dslkDoador
          TabOrder = 1
          OnKeyDown = cbPessoaDoadoraKeyDown
          Width = 202
        end
        object btnPesquisarProjeto: TButton
          Left = 428
          Top = 21
          Width = 21
          Height = 21
          Action = Ac_Pesquisar_Doador
          Images = dmPrincipal.imgIcons_16
          TabOrder = 2
          TabStop = False
        end
        object cbFundo: TcxDBLookupComboBox
          Left = 580
          Top = 21
          RepositoryItem = dmLookup.repLcbFundo
          DataBinding.DataField = 'ID_FUNDO'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 4
          Width = 189
        end
        object EditValor: TcxDBCurrencyEdit
          Left = 224
          Top = 61
          RepositoryItem = dmLookup.repCurPadrao
          DataBinding.DataField = 'VALOR'
          DataBinding.DataSource = dsMaster
          TabOrder = 6
          Width = 121
        end
        object EditDataDoacao: TcxDBDateEdit
          Left = 456
          Top = 21
          DataBinding.DataField = 'DATA'
          DataBinding.DataSource = dsMaster
          TabOrder = 3
          Width = 121
        end
        object EditObservacao: TcxDBMemo
          Left = 4
          Top = 104
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 7
          Height = 89
          Width = 849
        end
        object cbFormaPagamento: TcxDBImageComboBox
          Left = 4
          Top = 61
          RepositoryItem = dmLookup.repIcbFormaPagamento
          DataBinding.DataField = 'FORMA_PAGTO'
          DataBinding.DataSource = dsMaster
          Properties.Items = <>
          TabOrder = 5
          Width = 214
        end
      end
    end
  end
  inherited ActionList1: TActionList
    object Ac_Pesquisar_Doador: TAction
      Category = 'Master'
      ImageIndex = 0
      OnExecute = Ac_Pesquisar_DoadorExecute
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmFinanceiro.cdsDoacao
  end
  object dslkDoador: TDataSource
    DataSet = dmLookup.cdslkDoador
    Left = 488
    Top = 240
  end
end
