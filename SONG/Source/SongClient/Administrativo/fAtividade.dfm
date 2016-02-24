inherited frmAtividade: TfrmAtividade
  Caption = 'Atividades'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 453
          Width = 522
          ExplicitLeft = 400
          ExplicitWidth = 522
          inherited Label1: TLabel
            Left = 131
            ExplicitLeft = 131
          end
          object Label3: TLabel [1]
            Left = 4
            Top = 4
            Width = 44
            Height = 13
            Caption = 'Projetos:'
          end
          inherited rgStatus: TcxRadioGroup [2]
            Left = 389
            Top = 4
            ExplicitLeft = 389
            ExplicitTop = 4
          end
          inherited pnData: TPanel [3]
            Left = 265
            Width = 153
            ExplicitLeft = 265
            ExplicitWidth = 153
            inherited EditDataInicial: TcxDateEdit
              ExplicitWidth = 130
              Width = 130
            end
            inherited EditDataFinal: TcxDateEdit
              ExplicitWidth = 130
              Width = 130
            end
          end
          inherited EditPesquisa: TcxButtonEdit [4]
            Left = 262
            ExplicitLeft = 262
            ExplicitWidth = 156
            Width = 156
          end
          inherited cbPesquisarPor: TcxImageComboBox [5]
            Left = 129
            Properties.Items = <
              item
                Description = 'Todos'
                ImageIndex = 0
                Value = 1
              end
              item
                Description = 'C'#243'digo'
                ImageIndex = 0
                Value = 2
              end
              item
                Description = 'Nome'
                Value = 3
              end
              item
                Description = 'Data'
                Value = 4
              end>
            ExplicitLeft = 129
          end
          inherited btnPesquisar: TButton [6]
            Left = 422
            ExplicitLeft = 422
          end
          object cbProjetos: TcxCheckComboBox
            Left = 2
            Top = 20
            Properties.EmptySelectionText = 'Todos'
            Properties.DropDownSizeable = True
            Properties.EditValueFormat = cvfIndices
            Properties.Items = <
              item
              end>
            TabOrder = 5
            Width = 126
          end
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Options.Editing = False
              Width = 33
            end
            object viewRegistrosNOME: TcxGridDBColumn [1]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
              Width = 383
            end
            object viewRegistrosID_SOLICITANTE: TcxGridDBColumn [2]
              DataBinding.FieldName = 'ID_SOLICITANTE'
              RepositoryItem = dmLookup.repLcbPessoa
              Options.Editing = False
              Options.ShowEditButtons = isebNever
              Width = 131
            end
            object viewRegistrosID_RESPONSAVEL: TcxGridDBColumn [3]
              DataBinding.FieldName = 'ID_RESPONSAVEL'
              RepositoryItem = dmLookup.repLcbPessoa
              Options.Editing = False
              Options.ShowEditButtons = isebNever
              Width = 157
            end
            object viewRegistrosSTATUS: TcxGridDBColumn [4]
              DataBinding.FieldName = 'STATUS'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <>
              Properties.OnEditValueChanged = viewRegistrosSTATUSPropertiesEditValueChanged
              RepositoryItem = dmLookup.repIcbStatusAtividade
              Width = 129
            end
            object viewRegistrosDATA_INICIAL: TcxGridDBColumn [5]
              DataBinding.FieldName = 'DATA_INICIAL'
              Options.Editing = False
              Options.ShowEditButtons = isebNever
              Width = 63
            end
            object viewRegistrosDATA_FINAL: TcxGridDBColumn [6]
              DataBinding.FieldName = 'DATA_FINAL'
              Options.Editing = False
              Options.ShowEditButtons = isebNever
              Width = 55
            end
            object viewRegistrosNOTIFICAR_ENVOLVIDOS: TcxGridDBColumn [7]
              DataBinding.FieldName = 'NOTIFICAR_ENVOLVIDOS'
              Visible = False
              Options.Editing = False
            end
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              Caption = 'Pessoas envolvidas'
              inherited pnBotoesDetail: TPanel
                Width = 965
              end
              inherited cxGridRegistrosDetail: TcxGrid
                Width = 965
              end
            end
            object tabDetailProjeto: TcxTabSheet
              Caption = 'tabDetailProjeto'
              ImageIndex = 1
            end
            object tabDetailVinculo: TcxTabSheet
              Caption = 'tabDetailVinculo'
              ImageIndex = 2
            end
            object tabDetailArquivo: TcxTabSheet
              Caption = 'tabDetailArquivo'
              ImageIndex = 3
            end
            object tabDetailComentario: TcxTabSheet
              Caption = 'tabDetailComentario'
              ImageIndex = 4
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      ExplicitWidth = 976
      inherited pnEditsCadastro: TPanel
        ExplicitTop = 52
        object Label4: TLabel
          Left = 5
          Top = 2
          Width = 27
          Height = 13
          Caption = 'Nome'
          FocusControl = EditNome
        end
        object Label5: TLabel
          Left = 430
          Top = 2
          Width = 66
          Height = 13
          Caption = 'Data de In'#237'cio'
          FocusControl = EditDataInicio
        end
        object Label6: TLabel
          Left = 519
          Top = 2
          Width = 79
          Height = 13
          Caption = 'Data de T'#233'rmino'
          FocusControl = EditDataTermino
        end
        object Label7: TLabel
          Left = 5
          Top = 45
          Width = 49
          Height = 13
          Caption = 'Solicitante'
          FocusControl = cbSolicitante
        end
        object Label8: TLabel
          Left = 218
          Top = 45
          Width = 61
          Height = 13
          Caption = 'Respons'#225'vel'
          FocusControl = cbResponsavel
        end
        object Label9: TLabel
          Left = 430
          Top = 45
          Width = 31
          Height = 13
          Caption = 'Status'
          FocusControl = cbStatus
        end
        object EditNome: TcxDBTextEdit
          Left = 4
          Top = 18
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 421
        end
        object EditDataInicio: TcxDBDateEdit
          Left = 428
          Top = 18
          DataBinding.DataField = 'DATA_INICIAL'
          DataBinding.DataSource = dsMaster
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 1
          Width = 84
        end
        object EditDataTermino: TcxDBDateEdit
          Left = 517
          Top = 18
          DataBinding.DataField = 'DATA_FINAL'
          DataBinding.DataSource = dsMaster
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 2
          Width = 84
        end
        object cbSolicitante: TcxDBLookupComboBox
          Left = 4
          Top = 61
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_SOLICITANTE'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 3
          Width = 209
        end
        object cbResponsavel: TcxDBLookupComboBox
          Left = 216
          Top = 61
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_RESPONSAVEL'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 4
          Width = 209
        end
        object cbStatus: TcxDBImageComboBox
          Left = 428
          Top = 61
          RepositoryItem = dmLookup.repIcbStatusAtividade
          DataBinding.DataField = 'STATUS'
          DataBinding.DataSource = dsMaster
          Properties.Items = <>
          TabOrder = 5
          Width = 173
        end
        object chkNotificarEnvolvidos: TcxDBCheckBox
          Left = 4
          Top = 88
          Caption = 
            'Notificar pessoas envolvidas quando houver altera'#231#245'es na ativida' +
            'de'
          DataBinding.DataField = 'NOTIFICAR_ENVOLVIDOS'
          DataBinding.DataSource = dsMaster
          Properties.NullStyle = nssUnchecked
          Properties.ValueChecked = 1
          Properties.ValueUnchecked = 0
          TabOrder = 6
          Width = 594
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnBotoesCadastroDetail: TPanel
        Width = 976
        ExplicitWidth = 976
      end
      inherited pnEditsCadastroDetail: TPanel
        Width = 976
        ExplicitWidth = 976
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmAdministrativo.cdsAtividade
    Left = 264
    Top = 200
  end
  inherited dsDetail: TDataSource
    DataSet = dmAdministrativo.cdsAtividade_Pessoa
  end
end
