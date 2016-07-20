inherited frmNotificacao: TfrmNotificacao
  ActiveControl = nil
  Caption = 'Notifica'#231#245'es'
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
              PropertiesClassName = 'TcxCalcEditProperties'
              Properties.DisplayFormat = ',0.00'
              Options.Editing = False
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
        object pnEditsVariaveis: TPanel
          Left = 216
          Top = 21
          Width = 500
          Height = 239
          BevelOuter = bvNone
          TabOrder = 0
          object pnDiasProcedencia: TPanel
            Left = 0
            Top = 63
            Width = 500
            Height = 21
            Margins.Top = 14
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 0
            Visible = False
            object Label6: TLabel
              Left = 0
              Top = 2
              Width = 40
              Height = 13
              Caption = 'Notificar'
            end
            object Label7: TLabel
              Left = 125
              Top = 2
              Width = 90
              Height = 13
              Caption = 'ap'#243's o vencimento'
            end
            object EditTempoProcedencia: TcxDBSpinEdit
              Left = 41
              Top = 0
              DataBinding.DataField = 'TEMPO_ANTECEDENCIA'
              DataBinding.DataSource = dsMaster
              TabOrder = 0
              Width = 81
            end
          end
          object pnDiasAntecedencia: TPanel
            Left = 0
            Top = 0
            Width = 500
            Height = 21
            Margins.Top = 14
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
            Visible = False
            object Label4: TLabel
              Left = 0
              Top = 2
              Width = 62
              Height = 13
              Caption = 'Notificar com'
            end
            object Label5: TLabel
              Left = 149
              Top = 2
              Width = 79
              Height = 13
              Caption = 'de anteced'#234'ncia'
            end
            object EditTempoAntecedencia: TcxDBSpinEdit
              Left = 63
              Top = 0
              DataBinding.DataField = 'TEMPO_ANTECEDENCIA'
              DataBinding.DataSource = dsMaster
              TabOrder = 0
              Width = 81
            end
          end
          object pnValorGatilho: TPanel
            Left = 0
            Top = 84
            Width = 500
            Height = 21
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 2
            Visible = False
            object Label9: TLabel
              Left = 0
              Top = 2
              Width = 186
              Height = 13
              Caption = 'Notificar quando o saldo ficar inferior a'
            end
            object EditValorGatilho: TcxDBCurrencyEdit
              Left = 190
              Top = 0
              RepositoryItem = dmLookup.repCurPadrao
              DataBinding.DataField = 'VALOR_GATILHO'
              DataBinding.DataSource = dsMaster
              TabOrder = 0
              Width = 115
            end
          end
          object pnDiasAtividades: TPanel
            Left = 0
            Top = 42
            Width = 500
            Height = 21
            Margins.Top = 14
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 3
            Visible = False
            object lb1: TLabel
              Left = 0
              Top = 3
              Width = 262
              Height = 13
              Caption = 'Notificar atividades cadastradas/alteradas nos '#250'ltimos '
            end
            object EditDiasAtividade: TcxDBSpinEdit
              Left = 262
              Top = 0
              DataBinding.DataField = 'TEMPO_ANTECEDENCIA'
              DataBinding.DataSource = dsMaster
              TabOrder = 0
              Width = 81
            end
          end
          object pnPercentualGatilho: TPanel
            Left = 0
            Top = 105
            Width = 500
            Height = 21
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 4
            Visible = False
            object Label8: TLabel
              Left = 0
              Top = 4
              Width = 261
              Height = 13
              Caption = 'Notificar quando o percentual de uso atingir o valor de'
            end
            object EditPercentualGatilho: TcxDBCalcEdit
              Left = 262
              Top = 0
              DataBinding.DataField = 'VALOR_GATILHO'
              DataBinding.DataSource = dsMaster
              Properties.DisplayFormat = '0%'
              TabOrder = 0
              Width = 67
            end
          end
          object pnDiasSolicitacao: TPanel
            Left = 0
            Top = 21
            Width = 500
            Height = 21
            Margins.Top = 14
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 5
            Visible = False
            object lb2: TLabel
              Left = 0
              Top = 4
              Width = 345
              Height = 13
              Caption = 
                'Notificar solicita'#231#245'es feitas cadastradas/aprovadas/negadas nos ' +
                #250'ltimos'
            end
            object EditDiasAposSolicitacao: TcxDBSpinEdit
              Left = 346
              Top = 0
              DataBinding.DataField = 'TEMPO_ANTECEDENCIA'
              DataBinding.DataSource = dsMaster
              TabOrder = 0
              Width = 81
            end
          end
        end
        object pnTipo: TPanel
          Left = 0
          Top = 6
          Width = 210
          Height = 36
          BevelOuter = bvNone
          TabOrder = 1
          object Label3: TLabel
            Left = 5
            Top = 0
            Width = 91
            Height = 13
            Caption = 'Tipo de Notifica'#231#227'o'
          end
          object cbTipo: TcxDBImageComboBox
            Left = 4
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
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnEditsCadastroDetail: TPanel
        object Label10: TLabel
          Left = 0
          Top = 0
          Width = 976
          Height = 13
          Align = alTop
          Caption = 
            'Notifica'#231#245'es de atividades somente ser'#227'o enviadas as pessoas env' +
            'olvidas e configuradas aqui.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 534
        end
        inline frameUsuarios: TframeGrids
          Left = 0
          Top = 13
          Width = 976
          Height = 385
          Align = alClient
          TabOrder = 0
          ExplicitTop = 13
          ExplicitWidth = 976
          ExplicitHeight = 385
          inherited gpGrids: TGridPanel
            Width = 976
            Height = 366
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
            ExplicitHeight = 366
            inherited cxGrid1: TcxGrid
              Width = 457
              Height = 364
              ExplicitWidth = 457
              ExplicitHeight = 364
            end
            inherited pnBotoes: TPanel
              Left = 458
              Width = 48
              Height = 364
              ExplicitLeft = 458
              ExplicitWidth = 48
              ExplicitHeight = 364
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
              Height = 364
              ExplicitLeft = 506
              ExplicitWidth = 469
              ExplicitHeight = 364
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
    Left = 128
    Top = 256
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
