inherited frmAgenda: TfrmAgenda
  ActiveControl = btnIncluir
  Caption = 'Agendas'
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabPesquisa
    inherited tabPesquisa: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 431
          Width = 544
          ExplicitLeft = 431
          ExplicitWidth = 544
          inherited Label1: TLabel
            Left = 137
            ExplicitLeft = 137
          end
          inherited pnData: TPanel
            Left = 316
            ExplicitLeft = 316
          end
          inherited EditPesquisa: TcxButtonEdit
            Left = 268
            ExplicitLeft = 268
          end
          inherited cbPesquisarPor: TcxImageComboBox
            Left = 135
            ExplicitLeft = 135
          end
          inherited btnPesquisar: TButton
            Left = 444
            ExplicitLeft = 444
          end
          inherited rgStatus: TcxRadioGroup
            Visible = True
          end
        end
        inherited pnBotoes: TPanel
          Width = 430
          ExplicitWidth = 430
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Options.Editing = False
            end
            object viewRegistrosNOME: TcxGridDBColumn [1]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
              Width = 468
            end
            object viewRegistrosID_PROJETO: TcxGridDBColumn [2]
              DataBinding.FieldName = 'ID_PROJETO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosPROJETO: TcxGridDBColumn [3]
              DataBinding.FieldName = 'PROJETO'
              Options.Editing = False
              Width = 292
            end
            inherited ColumnExcluir: TcxGridDBColumn
              Caption = 'Ativar/Inativar'
              OnCustomDrawHeader = ColumnExcluirCustomDrawHeader
            end
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              Caption = 'Pessoas com acesso a esta agenda'
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
                  end
                  object viewRegistrosDetailNOME_PESSOA: TcxGridDBColumn [2]
                    DataBinding.FieldName = 'NOME_PESSOA'
                    Options.Editing = False
                    Width = 355
                  end
                  object viewRegistrosDetailSOMENTE_VISUALIZACAO: TcxGridDBColumn [3]
                    DataBinding.FieldName = 'SOMENTE_VISUALIZACAO'
                    RepositoryItem = dmLookup.RepIcbNaoSim
                    Options.Editing = False
                    Width = 101
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
        object Label3: TLabel
          Left = 5
          Top = 2
          Width = 82
          Height = 13
          Caption = 'Nome da Agenda'
          FocusControl = EditNomeAgenda
        end
        object Label4: TLabel
          Left = 217
          Top = 2
          Width = 510
          Height = 13
          Caption = 
            'Projeto da Agenda (Preencha somente se desejar que as atividades' +
            ' do projeto sejam exibidas na agenda)'
          FocusControl = cbProjeto
        end
        object EditNomeAgenda: TcxDBTextEdit
          Left = 4
          Top = 18
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 205
        end
        object cbProjeto: TcxDBLookupComboBox
          Left = 215
          Top = 18
          RepositoryItem = dmLookup.repLcbProjeto
          DataBinding.DataField = 'ID_PROJETO'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 1
          Width = 274
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnEditsCadastroDetail: TPanel
        object Label5: TLabel
          Left = 6
          Top = 2
          Width = 34
          Height = 13
          Caption = 'Pessoa'
        end
        object chkSomenteVisualizacao: TcxDBCheckBox
          Left = 306
          Top = 21
          RepositoryItem = dmLookup.RepChkNaoSim
          Caption = 'Apenas Visualiza'#231#227'o'
          DataBinding.DataField = 'SOMENTE_VISUALIZACAO'
          DataBinding.DataSource = dsDetail
          Properties.NullStyle = nssUnchecked
          TabOrder = 1
          Width = 207
        end
        object cbPessoa: TcxDBLookupComboBox
          Left = 4
          Top = 19
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_PESSOA'
          DataBinding.DataSource = dsDetail
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 296
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmSistema.cdsAgenda
  end
  inherited dsDetail: TDataSource
    DataSet = dmSistema.cdsAgenda_Pessoa
  end
end
