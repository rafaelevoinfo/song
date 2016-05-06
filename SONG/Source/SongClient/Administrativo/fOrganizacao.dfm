inherited frmOrganizacao: TfrmOrganizacao
  Caption = 'Organiza'#231#245'es'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
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
                Description = 'C'#243'digo'
                ImageIndex = 0
                Value = 2
              end
              item
                Description = 'Nome'
                Value = 3
              end>
          end
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
              Width = 544
            end
            object viewRegistrosCNPJ: TcxGridDBColumn [2]
              DataBinding.FieldName = 'CNPJ'
              Options.Editing = False
            end
            object viewRegistrosINSCRICAO_ESTADUAL: TcxGridDBColumn [3]
              DataBinding.FieldName = 'INSCRICAO_ESTADUAL'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosENDERECO: TcxGridDBColumn [4]
              DataBinding.FieldName = 'ENDERECO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosBAIRRO: TcxGridDBColumn [5]
              DataBinding.FieldName = 'BAIRRO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosCOMPLEMENTO: TcxGridDBColumn [6]
              DataBinding.FieldName = 'COMPLEMENTO'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosCIDADE: TcxGridDBColumn [7]
              DataBinding.FieldName = 'CIDADE'
              Visible = False
              Options.Editing = False
            end
            object viewRegistrosTELEFONE: TcxGridDBColumn [8]
              DataBinding.FieldName = 'TELEFONE'
              Visible = False
              Options.Editing = False
            end
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            Properties.ActivePage = tabDetailFundo
            OnChange = pcDetailsChange
            object tabDetailFundo: TcxTabSheet [0]
              Caption = 'Fundos'
              ImageIndex = 1
              object pnBotoesDetailFundo: TPanel
                Left = 0
                Top = 0
                Width = 965
                Height = 25
                Align = alTop
                TabOrder = 0
                object Button1: TButton
                  Left = 1
                  Top = 1
                  Width = 81
                  Height = 23
                  Action = Ac_Incluir_Detail
                  Align = alLeft
                  Images = dmPrincipal.imgIcons_16
                  TabOrder = 0
                end
              end
              object cxGridFundo: TcxGrid
                Left = 0
                Top = 25
                Width = 965
                Height = 131
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 1
                LockedStateImageOptions.Effect = lsieDark
                LockedStateImageOptions.ShowText = True
                LockedStateImageOptions.Text = 'Pesquisando...'
                ExplicitLeft = 1
                ExplicitTop = 30
                object viewFundo: TcxGridDBTableView
                  OnDblClick = viewRegistrosDetailDblClick
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
                  DataController.DataSource = dsDetailFundo
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  FilterRow.Visible = True
                  OptionsCustomize.ColumnsQuickCustomization = True
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Inserting = False
                  OptionsSelection.MultiSelect = True
                  OptionsView.NoDataToDisplayInfoText = '<Sem dados para mostrar>'
                  OptionsView.GroupByBox = False
                  object viewFundoID: TcxGridDBColumn
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewFundoNOME: TcxGridDBColumn
                    DataBinding.FieldName = 'NOME'
                    Options.Editing = False
                    Width = 525
                  end
                  object viewFundoSALDO: TcxGridDBColumn
                    DataBinding.FieldName = 'SALDO'
                    RepositoryItem = dmLookup.repCurPadrao
                    Options.Editing = False
                  end
                  object ColumnAlterarFundo: TcxGridDBColumn
                    Caption = 'Alterar'
                    PropertiesClassName = 'TcxButtonEditProperties'
                    Properties.Buttons = <
                      item
                        Action = Ac_Alterar_Detail
                        Default = True
                        Kind = bkGlyph
                      end>
                    Properties.Images = dmPrincipal.imgIcons_16
                    Properties.ViewStyle = vsButtonsOnly
                    MinWidth = 64
                    Options.Filtering = False
                    Options.ShowEditButtons = isebAlways
                    Options.GroupFooters = False
                    Options.Grouping = False
                    Options.HorzSizing = False
                    Options.Moving = False
                  end
                  object ColumnExcluirFundo: TcxGridDBColumn
                    Caption = 'Excluir'
                    PropertiesClassName = 'TcxButtonEditProperties'
                    Properties.Buttons = <
                      item
                        Action = Ac_Excluir_Detail
                        Default = True
                        Kind = bkGlyph
                      end>
                    Properties.Images = dmPrincipal.imgIcons_16
                    Properties.ViewStyle = vsButtonsOnly
                    MinWidth = 64
                    Options.Filtering = False
                    Options.ShowEditButtons = isebAlways
                    Options.GroupFooters = False
                    Options.Grouping = False
                    Options.HorzSizing = False
                    Options.Moving = False
                  end
                end
                object level1: TcxGridLevel
                  GridView = viewFundo
                end
              end
            end
            inherited tabDetail: TcxTabSheet
              Caption = 'Contatos da Organiza'#231#227'o'
              inherited cxGridRegistrosDetail: TcxGrid
                inherited viewRegistrosDetail: TcxGridDBTableView
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                    Options.Editing = False
                  end
                  object viewRegistrosDetailID_PESSOA: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'ID_PESSOA'
                    RepositoryItem = dmLookup.repLcbPessoa
                    Options.Editing = False
                    Options.ShowEditButtons = isebNever
                    Width = 210
                  end
                  object viewRegistrosDetailFUNCAO: TcxGridDBColumn [2]
                    DataBinding.FieldName = 'FUNCAO'
                    Options.Editing = False
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
          Left = 8
          Top = 6
          Width = 27
          Height = 13
          Caption = 'Nome'
          FocusControl = EditNome
        end
        object Label4: TLabel
          Left = 249
          Top = 6
          Width = 25
          Height = 13
          Caption = 'CNPJ'
          FocusControl = EditCnpj
        end
        object Label5: TLabel
          Left = 410
          Top = 6
          Width = 87
          Height = 13
          Caption = 'Inscri'#231#227'o Estadual'
          FocusControl = EditInscricaoEstadual
        end
        object Label10: TLabel
          Left = 7
          Top = 45
          Width = 42
          Height = 13
          Caption = 'Telefone'
        end
        object lb1: TLabel
          Left = 653
          Top = 6
          Width = 23
          Height = 13
          Caption = 'Logo'
        end
        object EditNome: TcxDBTextEdit
          Left = 6
          Top = 22
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 237
        end
        object EditCnpj: TcxDBMaskEdit
          Left = 248
          Top = 22
          DataBinding.DataField = 'CNPJ'
          DataBinding.DataSource = dsMaster
          Properties.EditMask = '99.999.999/9999-99;0;_'
          TabOrder = 1
          Width = 155
        end
        object EditInscricaoEstadual: TcxDBTextEdit
          Left = 409
          Top = 22
          DataBinding.DataField = 'INSCRICAO_ESTADUAL'
          DataBinding.DataSource = dsMaster
          TabOrder = 2
          Width = 237
        end
        object rgEndereco: TcxGroupBox
          Left = 6
          Top = 86
          Caption = 'Endere'#231'o'
          TabOrder = 4
          Height = 96
          Width = 640
          object Label6: TLabel
            Left = 5
            Top = 16
            Width = 45
            Height = 13
            Caption = 'Endere'#231'o'
            FocusControl = EditEndereco
          end
          object Label7: TLabel
            Left = 503
            Top = 16
            Width = 28
            Height = 13
            Caption = 'Bairro'
            FocusControl = EditBairro
          end
          object Label8: TLabel
            Left = 149
            Top = 52
            Width = 65
            Height = 13
            Caption = 'Complemento'
            FocusControl = EditComplemento
          end
          object Label9: TLabel
            Left = 5
            Top = 52
            Width = 33
            Height = 13
            Caption = 'Cidade'
            FocusControl = cbCidade
          end
          object EditEndereco: TcxDBTextEdit
            Left = 3
            Top = 30
            DataBinding.DataField = 'ENDERECO'
            DataBinding.DataSource = dsMaster
            TabOrder = 0
            Width = 496
          end
          object EditBairro: TcxDBTextEdit
            Left = 501
            Top = 30
            DataBinding.DataField = 'BAIRRO'
            DataBinding.DataSource = dsMaster
            TabOrder = 1
            Width = 136
          end
          object EditComplemento: TcxDBTextEdit
            Left = 147
            Top = 66
            DataBinding.DataField = 'COMPLEMENTO'
            DataBinding.DataSource = dsMaster
            TabOrder = 2
            Width = 490
          end
          object cbCidade: TcxDBLookupComboBox
            Left = 3
            Top = 66
            DataBinding.DataField = 'ID_CIDADE'
            DataBinding.DataSource = dsMaster
            Properties.ClearKey = 46
            Properties.DropDownListStyle = lsFixedList
            Properties.DropDownSizeable = True
            Properties.DropDownWidth = 250
            Properties.KeyFieldNames = 'ID'
            Properties.ListColumns = <
              item
                FieldName = 'NOME'
              end>
            Properties.ListSource = dslkCidade
            TabOrder = 3
            Width = 140
          end
        end
        object EditTelefone: TcxDBMaskEdit
          Left = 6
          Top = 59
          DataBinding.DataField = 'TELEFONE'
          DataBinding.DataSource = dsMaster
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\(\d\d\)\d{4}-\d{4,5}'
          TabOrder = 3
          Width = 135
        end
        object EditFoto: TcxDBImage
          Left = 652
          Top = 22
          DataBinding.DataField = 'LOGO'
          DataBinding.DataSource = dsMaster
          Properties.FitMode = ifmProportionalStretch
          Properties.GraphicClassName = 'TdxSmartImage'
          Properties.ImmediatePost = True
          TabOrder = 5
          Height = 122
          Width = 188
        end
        object btnLimparFoto: TButton
          Left = 654
          Top = 154
          Width = 75
          Height = 28
          Action = Ac_Limpar
          Images = dmPrincipal.imgIcons_16
          TabOrder = 6
        end
        object btnCarregarFoto: TButton
          Left = 733
          Top = 154
          Width = 107
          Height = 28
          Action = Ac_CarregarImagem
          Images = dmPrincipal.imgIcons_16
          TabOrder = 7
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      inherited pnEditsCadastroDetail: TPanel
        object Label11: TLabel
          Left = 258
          Top = 6
          Width = 35
          Height = 13
          Caption = 'Fun'#231#227'o'
          FocusControl = EditFuncao
        end
        object Label12: TLabel
          Left = 5
          Top = 6
          Width = 34
          Height = 13
          Caption = 'Pessoa'
          FocusControl = cbPessoa
        end
        object Label13: TLabel
          Left = 5
          Top = 46
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
          FocusControl = EditObs
        end
        object EditFuncao: TcxDBTextEdit
          Left = 257
          Top = 22
          DataBinding.DataField = 'FUNCAO'
          DataBinding.DataSource = dsDetail
          TabOrder = 1
          Width = 247
        end
        object cbPessoa: TcxDBLookupComboBox
          Left = 4
          Top = 22
          RepositoryItem = dmLookup.repLcbPessoa
          DataBinding.DataField = 'ID_PESSOA'
          DataBinding.DataSource = dsDetail
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 247
        end
        object EditObs: TcxDBMemo
          Left = 4
          Top = 62
          DataBinding.DataField = 'OBSERVACAO'
          DataBinding.DataSource = dsDetail
          TabOrder = 2
          Height = 89
          Width = 500
        end
      end
    end
    object tabCadastroFundo: TcxTabSheet
      Caption = 'tabCadastroFundo'
      ImageIndex = 3
      object pnBotoesCadastroFundo: TPanel
        Left = 0
        Top = 0
        Width = 976
        Height = 50
        Align = alTop
        TabOrder = 0
        object btnSalvarFundo: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 85
          Height = 42
          Action = Ac_Salvar_Detail
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 0
        end
        object btnCancelarFundo: TButton
          AlignWithMargins = True
          Left = 215
          Top = 4
          Width = 85
          Height = 42
          Action = Ac_Cancelar_Detail
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 2
        end
        object btnSalvarIncluirFundo: TButton
          AlignWithMargins = True
          Left = 95
          Top = 4
          Width = 114
          Height = 42
          Action = Ac_Salvar_Incluir_Detail
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 1
        end
      end
      object pnEditsCadastroFundo: TPanel
        Left = 0
        Top = 50
        Width = 976
        Height = 398
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label14: TLabel
          Left = 5
          Top = 3
          Width = 27
          Height = 13
          Caption = 'Nome'
          FocusControl = EditNomeFundo
        end
        object Label15: TLabel
          Left = 5
          Top = 44
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = EditDescricaoFundo
        end
        object EditNomeFundo: TcxDBTextEdit
          Left = 4
          Top = 17
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsDetailFundo
          TabOrder = 0
          Width = 296
        end
        object EditDescricaoFundo: TcxDBMemo
          Left = 4
          Top = 60
          DataBinding.DataField = 'DESCRICAO'
          DataBinding.DataSource = dsDetailFundo
          TabOrder = 1
          Height = 89
          Width = 964
        end
      end
    end
  end
  inherited ActionList1: TActionList
    object Ac_CarregarImagem: TAction
      Category = 'Master'
      Caption = 'Carregar Imagem'
      ImageIndex = 9
      OnExecute = Ac_CarregarImagemExecute
    end
    object Ac_Limpar: TAction
      Category = 'Master'
      Caption = 'Limpar'
      ImageIndex = 5
      OnExecute = Ac_LimparExecute
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmAdministrativo.cdsOrganizacao
  end
  inherited dsDetail: TDataSource
    DataSet = dmAdministrativo.cdsOrganizacao_Pessoa
    Left = 464
    Top = 200
  end
  object dslkCidade: TDataSource
    DataSet = dmPrincipal.cdslkCidade
    Left = 400
    Top = 184
  end
  object dsDetailFundo: TDataSource
    DataSet = dmAdministrativo.cdsFundo
    Left = 560
    Top = 232
  end
end
