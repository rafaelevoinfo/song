inherited frmPerfil: TfrmPerfil
  Caption = 'Perfis de Usu'#225'rio'
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
                Value = 0
              end
              item
                Description = 'C'#243'digo'
                ImageIndex = 0
                Value = 1
              end
              item
                Description = 'Nome'
                Value = 2
              end>
          end
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            OptionsView.GroupByBox = False
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Options.Editing = False
            end
            object viewRegistrosNOME: TcxGridDBColumn [1]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
              Width = 397
            end
            object viewRegistrosDESCRICAO: TcxGridDBColumn [2]
              DataBinding.FieldName = 'DESCRICAO'
              Options.Editing = False
              Width = 215
            end
          end
        end
        inherited pnDetail: TPanel
          inherited pcDetails: TcxPageControl
            inherited tabDetail: TcxTabSheet
              Caption = 'Permiss'#245'es'
              inherited cxGrid1: TcxGrid
                inherited viewRegistrosDetail: TcxGridDBTableView
                  OptionsView.GroupByBox = False
                  object viewRegistrosDetailID: TcxGridDBColumn [0]
                    DataBinding.FieldName = 'ID'
                    Visible = False
                  end
                  object viewRegistrosDetailPERMISSAO: TcxGridDBColumn [1]
                    DataBinding.FieldName = 'PERMISSAO'
                    Options.Editing = False
                    Width = 229
                  end
                  object viewRegistrosDetailVISUALIZAR: TcxGridDBColumn [2]
                    DataBinding.FieldName = 'VISUALIZAR'
                    PropertiesClassName = 'TcxImageComboBoxProperties'
                    Properties.Items = <
                      item
                        Description = 'N'#227'o'
                        ImageIndex = 0
                        Value = 0
                      end
                      item
                        Description = 'Sim'
                        Value = 1
                      end>
                    Options.Editing = False
                    Options.ShowEditButtons = isebNever
                  end
                  object viewRegistrosDetailINCLUIR: TcxGridDBColumn [3]
                    DataBinding.FieldName = 'INCLUIR'
                    RepositoryItem = dmLookup.RepIcbNaoSim
                    Options.Editing = False
                    Options.ShowEditButtons = isebNever
                  end
                  object viewRegistrosDetailALTERAR: TcxGridDBColumn [4]
                    DataBinding.FieldName = 'ALTERAR'
                    RepositoryItem = dmLookup.RepIcbNaoSim
                    Options.Editing = False
                    Options.ShowEditButtons = isebNever
                  end
                  object viewRegistrosDetailEXCLUIR: TcxGridDBColumn [5]
                    DataBinding.FieldName = 'EXCLUIR'
                    RepositoryItem = dmLookup.RepIcbNaoSim
                    Options.Editing = False
                    Options.ShowEditButtons = isebNever
                  end
                end
              end
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      inherited pnEditsCadastro: TPanel
        object lbl1: TLabel
          Left = 6
          Top = 6
          Width = 27
          Height = 13
          Caption = 'Nome'
          FocusControl = EditNome
        end
        object Label3: TLabel
          Left = 6
          Top = 46
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          FocusControl = EditDescricao
        end
        object EditDescricao: TcxDBTextEdit
          Left = 4
          Top = 62
          DataBinding.DataField = 'DESCRICAO'
          DataBinding.DataSource = dsMaster
          TabOrder = 1
          Width = 333
        end
        object EditNome: TcxDBTextEdit
          Left = 4
          Top = 22
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 333
        end
      end
    end
    inherited tabCadastroDetail: TcxTabSheet
      inherited pnEditsCadastroDetail: TPanel
        ExplicitLeft = 0
        ExplicitTop = 50
        ExplicitWidth = 854
        ExplicitHeight = 398
        object tlPermissoes: TcxDBTreeList
          Left = 0
          Top = 0
          Width = 854
          Height = 398
          Align = alClient
          Bands = <
            item
            end>
          DataController.DataSource = dsLocalPermissao
          DataController.ParentField = 'ID_MODULO'
          DataController.KeyField = 'ID'
          Navigator.Buttons.CustomButtons = <>
          OptionsBehavior.IncSearch = True
          OptionsData.Deleting = False
          RootValue = -1
          TabOrder = 0
          OnEditValueChanged = tlPermissoesEditValueChanged
          ExplicitTop = 50
          object cxDBTreeList1PERMISSAO: TcxDBTreeListColumn
            DataBinding.FieldName = 'PERMISSAO'
            Options.Editing = False
            Width = 403
            Position.ColIndex = 0
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeList1VISUALIZAR: TcxDBTreeListColumn
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ImmediatePost = True
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            DataBinding.FieldName = 'VISUALIZAR'
            Width = 100
            Position.ColIndex = 1
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeList1INCLUIR: TcxDBTreeListColumn
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ImmediatePost = True
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            DataBinding.FieldName = 'INCLUIR'
            Width = 100
            Position.ColIndex = 2
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeList1ALTERAR: TcxDBTreeListColumn
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ImmediatePost = True
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            DataBinding.FieldName = 'ALTERAR'
            Width = 100
            Position.ColIndex = 3
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeList1EXCLUIR: TcxDBTreeListColumn
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ImmediatePost = True
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            DataBinding.FieldName = 'EXCLUIR'
            Width = 100
            Position.ColIndex = 4
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeList1ID_MODULO: TcxDBTreeListColumn
            Visible = False
            DataBinding.FieldName = 'ID_MODULO'
            Position.ColIndex = 5
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
          object cxDBTreeList1ID: TcxDBTreeListColumn
            Visible = False
            DataBinding.FieldName = 'ID'
            Position.ColIndex = 6
            Position.RowIndex = 0
            Position.BandIndex = 0
            Summary.FooterSummaryItems = <>
            Summary.GroupFooterSummaryItems = <>
          end
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmAdministrativo.cdsPerfil
  end
  inherited dsDetail: TDataSource
    DataSet = dmAdministrativo.cdsPerfil_Permissao
    Left = 416
    Top = 176
  end
  object cdsLocalPermissoes: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsLocalPermissoesIndex1'
      end>
    IndexFieldNames = 'ID'
    Params = <>
    StoreDefs = True
    Left = 312
    Top = 96
    object cdsLocalPermissoesPERMISSAO: TStringField
      DisplayLabel = 'Permiss'#227'o'
      FieldName = 'PERMISSAO'
      ProviderFlags = []
      Size = 100
    end
    object cdsLocalPermissoesVISUALIZAR: TIntegerField
      DisplayLabel = 'Visualizar'
      FieldName = 'VISUALIZAR'
      ProviderFlags = []
    end
    object cdsLocalPermissoesINCLUIR: TIntegerField
      DisplayLabel = 'Incluir'
      FieldName = 'INCLUIR'
      ProviderFlags = []
    end
    object cdsLocalPermissoesALTERAR: TIntegerField
      DisplayLabel = 'Alterar'
      FieldName = 'ALTERAR'
      ProviderFlags = []
    end
    object cdsLocalPermissoesEXCLUIR: TIntegerField
      DisplayLabel = 'Excluir'
      FieldName = 'EXCLUIR'
      ProviderFlags = []
    end
    object cdsLocalPermissoesID_MODULO: TIntegerField
      FieldName = 'ID_MODULO'
      ProviderFlags = []
    end
    object cdsLocalPermissoesID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
    end
  end
  object dsLocalPermissao: TDataSource
    DataSet = cdsLocalPermissoes
    Left = 504
    Top = 184
  end
end
