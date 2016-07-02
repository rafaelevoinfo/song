inherited frmNotificacao: TfrmNotificacao
  ActiveControl = nil
  Caption = 'Notifica'#231#245'es'
  ExplicitLeft = -35
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabCadastro
    inherited tabPesquisa: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Options.Editing = False
            end
            object viewRegistrosTIPO: TcxGridDBColumn [1]
              DataBinding.FieldName = 'TIPO'
              RepositoryItem = dmLookup.repIcbTipoNotificacao
              Options.Editing = False
              Width = 322
            end
            object viewRegistrosTEMPO_ANTECEDENCIA: TcxGridDBColumn [2]
              Caption = 'Tempo (dias)'
              DataBinding.FieldName = 'TEMPO_ANTECEDENCIA'
              Options.Editing = False
              Width = 120
            end
            object viewRegistrosVALOR_GATILHO: TcxGridDBColumn [3]
              DataBinding.FieldName = 'VALOR_GATILHO'
              RepositoryItem = dmLookup.repCurPadrao
              Width = 135
            end
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              Caption = 'Pessoas que receber'#227'o a notifica'#231#227'o'
              ExplicitLeft = 2
              ExplicitTop = 25
              ExplicitWidth = 965
              ExplicitHeight = 156
              inherited cxGridRegistrosDetail: TcxGrid
                inherited viewRegistrosDetail: TcxGridDBTableView
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewRegistrosDetailID_PESSOA: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'ID_PESSOA'
                    Visible = False
                    Options.Editing = False
                    Width = 79
                  end
                  object viewRegistrosDetailNOME_PESSOA: TcxGridDBColumn [2]
                    DataBinding.FieldName = 'NOME_PESSOA'
                    Options.Editing = False
                    Width = 346
                  end
                  object viewRegistrosDetailNOTIFICACAO_SISTEMA: TcxGridDBColumn [3]
                    DataBinding.FieldName = 'NOTIFICACAO_SISTEMA'
                    RepositoryItem = dmLookup.RepIcbNaoSim
                    Options.Editing = False
                    Width = 121
                  end
                  object viewRegistrosDetailNOTIFICACAO_EMAIL: TcxGridDBColumn [4]
                    DataBinding.FieldName = 'NOTIFICACAO_EMAIL'
                    RepositoryItem = dmLookup.RepIcbNaoSim
                    Options.Editing = False
                    Width = 108
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
        ExplicitLeft = 3
        ExplicitTop = 52
        object pnLeft: TPanel
          Left = 4
          Top = 6
          Width = 1500
          Height = 51
          BevelOuter = bvNone
          TabOrder = 0
          object pnTipo: TPanel
            Left = 0
            Top = 0
            Width = 205
            Height = 51
            Align = alLeft
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 0
            ExplicitLeft = 4
            ExplicitTop = 6
            ExplicitHeight = 36
            object Label3: TLabel
              Left = 1
              Top = 0
              Width = 91
              Height = 13
              Caption = 'Tipo de Notifica'#231#227'o'
            end
            object cbTipo: TcxDBImageComboBox
              Left = 0
              Top = 15
              RepositoryItem = dmLookup.repIcbTipoNotificacao
              DataBinding.DataField = 'TIPO'
              DataBinding.DataSource = dsMaster
              Properties.Items = <>
              Properties.OnEditValueChanged = cbTipoPropertiesEditValueChanged
              TabOrder = 0
              Width = 205
            end
          end
          object pnDiasProcedencia: TPanel
            Left = 1105
            Top = 0
            Width = 215
            Height = 51
            Margins.Top = 14
            Align = alLeft
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
            Visible = False
            ExplicitLeft = 442
            ExplicitTop = 14
            ExplicitHeight = 34
            object Label6: TLabel
              Left = 0
              Top = 17
              Width = 40
              Height = 13
              Caption = 'Notificar'
            end
            object Label7: TLabel
              Left = 125
              Top = 17
              Width = 90
              Height = 13
              Caption = 'ap'#243's o vencimento'
            end
            object EditTempoProcedencia: TcxDBSpinEdit
              Left = 41
              Top = 15
              DataBinding.DataField = 'TEMPO_ANTECEDENCIA'
              DataBinding.DataSource = dsMaster
              TabOrder = 0
              Width = 81
            end
          end
          object pnDiasAntecedencia: TPanel
            Left = 877
            Top = 0
            Width = 228
            Height = 51
            Margins.Top = 14
            Align = alLeft
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 2
            Visible = False
            ExplicitLeft = 208
            ExplicitTop = 14
            ExplicitHeight = 34
            object Label4: TLabel
              Left = 0
              Top = 17
              Width = 62
              Height = 13
              Caption = 'Notificar com'
            end
            object Label5: TLabel
              Left = 149
              Top = 17
              Width = 79
              Height = 13
              Caption = 'de anteced'#234'ncia'
            end
            object EditTempoAntecedencia: TcxDBSpinEdit
              Left = 63
              Top = 15
              DataBinding.DataField = 'TEMPO_ANTECEDENCIA'
              DataBinding.DataSource = dsMaster
              TabOrder = 0
              Width = 81
            end
          end
          object pnValorGatilho: TPanel
            Left = 1320
            Top = 0
            Width = 317
            Height = 51
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 3
            Visible = False
            ExplicitLeft = 660
            object Label9: TLabel
              Left = 8
              Top = 17
              Width = 186
              Height = 13
              Caption = 'Notificar quando o saldo ficar inferior a'
            end
            object EditValorGatilho: TcxDBCurrencyEdit
              Left = 198
              Top = 15
              RepositoryItem = dmLookup.repCurPadrao
              DataBinding.DataField = 'VALOR_GATILHO'
              DataBinding.DataSource = dsMaster
              TabOrder = 0
              Width = 115
            end
          end
          object pnDiasAtividades: TPanel
            Left = 529
            Top = 0
            Width = 348
            Height = 51
            Margins.Top = 14
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 4
            Visible = False
            ExplicitLeft = 205
            object lb1: TLabel
              Left = 0
              Top = 18
              Width = 257
              Height = 13
              Caption = 'Notificar atividades cadastradas/iniciadas nos '#250'ltimos '
            end
            object EditDiasAtividade: TcxDBSpinEdit
              Left = 256
              Top = 15
              DataBinding.DataField = 'TEMPO_ANTECEDENCIA'
              DataBinding.DataSource = dsMaster
              TabOrder = 0
              Width = 81
            end
          end
          object pnDiasAtividadeVencendo: TPanel
            Left = 205
            Top = 0
            Width = 324
            Height = 51
            Margins.Top = 14
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 5
            Visible = False
            object lb2: TLabel
              Left = 0
              Top = 18
              Width = 236
              Height = 13
              Caption = 'Notificar atividades que ir'#227'o vencer nos pr'#243'ximos'
            end
            object EditDiaAtividadeVencendo: TcxDBSpinEdit
              Left = 238
              Top = 15
              DataBinding.DataField = 'TEMPO_ANTECEDENCIA'
              DataBinding.DataSource = dsMaster
              TabOrder = 0
              Width = 81
            end
          end
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnEditsCadastroDetail: TPanel
        object lbAviso: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 970
          Height = 13
          Align = alTop
          Caption = 
            'Para notifica'#231#245'es sobre atividades somente as pessoas envolvidas' +
            ' na atividade e configuradas aqui receber'#227'o as notifica'#231#245'es.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 713
        end
        inline frameUsuarios: TframeGrids
          Left = 0
          Top = 16
          Width = 976
          Height = 382
          Align = alClient
          TabOrder = 0
          ExplicitTop = 16
          ExplicitWidth = 976
          ExplicitHeight = 382
          inherited gpGrids: TGridPanel
            Width = 976
            Height = 363
            ControlCollection = <
              item
                Column = 0
                Control = frameUsuarios.cxGrid1
                Row = 0
              end
              item
                Column = 1
                Control = frameUsuarios.pnBotoes
                Row = 0
              end
              item
                Column = 2
                Control = frameUsuarios.cxGrid2
                Row = 0
              end>
            ExplicitWidth = 976
            ExplicitHeight = 363
            inherited cxGrid1: TcxGrid
              Width = 457
              Height = 361
              ExplicitWidth = 457
              ExplicitHeight = 361
            end
            inherited pnBotoes: TPanel
              Left = 458
              Width = 48
              Height = 361
              ExplicitLeft = 458
              ExplicitWidth = 48
              ExplicitHeight = 361
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
              Left = 506
              Width = 469
              Height = 361
              ExplicitLeft = 506
              ExplicitWidth = 469
              ExplicitHeight = 361
              inherited viewDireita: TcxGridDBTableView
                OptionsData.Editing = True
              end
            end
          end
          inherited pnLabels: TPanel
            Width = 976
            ExplicitWidth = 976
            inherited gpLabels: TGridPanel
              Width = 974
              ControlCollection = <
                item
                  Column = 0
                  Control = frameUsuarios.lbInfoGridEsquerda
                  Row = 0
                end
                item
                  Column = 2
                  Control = frameUsuarios.lbInfoGridDireita
                  Row = 0
                end>
              ExplicitWidth = 974
              inherited lbInfoGridEsquerda: TLabel
                Width = 112
                Height = 15
                Caption = 'Pessoas dispon'#237'veis'
                ExplicitWidth = 112
              end
              inherited lbInfoGridDireita: TLabel
                Left = 505
                Width = 206
                Height = 15
                Caption = 'Pessoas que receber'#227'o a notifica'#231#227'o'
                ExplicitLeft = 505
                ExplicitWidth = 206
              end
            end
          end
          inherited dsEsquerda: TDataSource
            DataSet = cdsLocalPessoa
          end
          inherited dsDireita: TDataSource
            DataSet = dmSistema.cdsNotificacao_Pessoa
            Left = 608
            Top = 184
          end
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmSistema.cdsNotificacao
  end
  inherited dsDetail: TDataSource
    DataSet = dmSistema.cdsNotificacao_Pessoa
  end
  object cdsLocalPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 224
    object cdsLocalPessoaID: TIntegerField
      DisplayLabel = 'Pessoa'
      FieldName = 'ID'
    end
    object cdsLocalPessoaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 100
    end
  end
end
