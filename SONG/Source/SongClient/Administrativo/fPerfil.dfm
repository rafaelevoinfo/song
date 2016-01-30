inherited frmPerfil: TfrmPerfil
  Caption = 'Perfis de Usu'#225'rio'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
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
      object cxGrid2: TcxGrid
        Left = 0
        Top = 50
        Width = 854
        Height = 398
        Align = alClient
        TabOrder = 1
        ExplicitLeft = 4
        ExplicitTop = 52
        object viewPermissoes: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsLocalPermissao
          DataController.DetailKeyFieldNames = 'ID_MODULO'
          DataController.KeyFieldNames = 'ID_MODULO'
          DataController.MasterKeyFieldNames = 'ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object viewPermissoesPERMISSAO: TcxGridDBColumn
            DataBinding.FieldName = 'PERMISSAO'
            Options.Editing = False
            Width = 585
          end
          object viewPermissoesVISUALIZAR: TcxGridDBColumn
            DataBinding.FieldName = 'VISUALIZAR'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            Properties.OnEditValueChanged = viewPermissoesVISUALIZARPropertiesEditValueChanged
          end
          object viewPermissoesINCLUIR: TcxGridDBColumn
            DataBinding.FieldName = 'INCLUIR'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            Properties.OnEditValueChanged = viewPermissoesINCLUIRPropertiesEditValueChanged
          end
          object viewPermissoesALTERAR: TcxGridDBColumn
            DataBinding.FieldName = 'ALTERAR'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            Properties.OnEditValueChanged = viewPermissoesALTERARPropertiesEditValueChanged
          end
          object viewPermissoesEXCLUIR: TcxGridDBColumn
            DataBinding.FieldName = 'EXCLUIR'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            Properties.OnEditValueChanged = viewPermissoesEXCLUIRPropertiesEditValueChanged
          end
        end
        object viewModulos: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsLocalModulos
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object viewModulosMODULO: TcxGridDBColumn
            DataBinding.FieldName = 'MODULO'
            Width = 829
          end
          object viewModulosID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            VisibleForCustomization = False
          end
        end
        object levelGrid2Level1: TcxGridLevel
          GridView = viewModulos
          object cxGrid2Level1: TcxGridLevel
            GridView = viewPermissoes
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
    Params = <>
    Left = 312
    Top = 96
    object cdsLocalPermissoesPERMISSAO: TStringField
      DisplayLabel = 'Permiss'#227'o'
      FieldName = 'PERMISSAO'
      Size = 100
    end
    object cdsLocalPermissoesVISUALIZAR: TIntegerField
      DisplayLabel = 'Visualizar'
      FieldName = 'VISUALIZAR'
    end
    object cdsLocalPermissoesINCLUIR: TIntegerField
      DisplayLabel = 'Incluir'
      FieldName = 'INCLUIR'
    end
    object cdsLocalPermissoesALTERAR: TIntegerField
      DisplayLabel = 'Alterar'
      FieldName = 'ALTERAR'
    end
    object cdsLocalPermissoesEXCLUIR: TIntegerField
      DisplayLabel = 'Excluir'
      FieldName = 'EXCLUIR'
    end
    object cdsLocalPermissoesID_MODULO: TIntegerField
      FieldName = 'ID_MODULO'
    end
  end
  object dsLocalPermissao: TDataSource
    DataSet = cdsLocalPermissoes
    Left = 504
    Top = 184
  end
  object cdsLocalModulos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 240
    object cdsLocalModulosMODULO: TStringField
      DisplayLabel = 'M'#243'dulo'
      FieldName = 'MODULO'
      Size = 100
    end
    object cdsLocalModulosID: TIntegerField
      FieldName = 'ID'
    end
  end
  object dsLocalModulos: TDataSource
    DataSet = cdsLocalModulos
    Left = 552
    Top = 240
  end
end
