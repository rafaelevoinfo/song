inherited frmAgendamento: TfrmAgendamento
  Caption = 'Agendamentos'
  ClientHeight = 437
  ClientWidth = 884
  OnCreate = FormCreate
  ExplicitWidth = 900
  ExplicitHeight = 476
  PixelsPerInch = 96
  TextHeight = 13
  object Calendario: TcxScheduler
    Left = 0
    Top = 45
    Width = 884
    Height = 392
    DateNavigator.ColCount = 6
    DateNavigator.OnPeriodChanged = CalendarioDateNavigatorPeriodChanged
    ViewDay.Active = True
    ViewDay.EventShadows = False
    ViewDay.TimeRulerMinutes = True
    ViewDay.TimeRulerPopupMenu.Items = [rpmi60min, rpmi30min, rpmi15min, rpmi10min, rpmi6min, rpmi5min]
    Align = alClient
    ContentPopupMenu.Items = []
    ControlBox.Visible = False
    EventOperations.InplaceEditing = False
    EventOperations.MovingBetweenResources = False
    EventOperations.Moving = False
    EventPopupMenu.PopupMenu = PopupMenu1
    EventPopupMenu.UseBuiltInPopupMenu = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    OptionsBehavior.ModalDialogs = True
    OptionsView.ViewPosition = vpBottom
    OptionsView.WorkFinish = 0.750000000000000000
    Storage = StorageAgendamento
    TabOrder = 0
    OnBeforeDeleting = CalendarioBeforeDeleting
    OnBeforeEditing = CalendarioBeforeEditing
    OnBeforeSizingEvent = CalendarioBeforeSizingEvent
    ExplicitTop = 26
    ExplicitHeight = 411
    Splitters = {
      010000007E0000007303000083000000DF02000001000000E40200007E000000}
    StoredClientBounds = {01000000010000007303000087010000}
  end
  object pnControlBox: TPanel
    Left = 0
    Top = 0
    Width = 884
    Height = 45
    Align = alTop
    TabOrder = 1
    object btnIncluir: TButton
      Left = 7
      Top = 1
      Width = 98
      Height = 40
      Action = Ac_Incluir
      Images = dmPrincipal.imgIcons_32
      TabOrder = 0
    end
    object btnAlterar: TButton
      Left = 106
      Top = 1
      Width = 98
      Height = 40
      Action = Ac_Alterar
      Images = dmPrincipal.imgIcons_32
      TabOrder = 1
    end
    object btnExcluir: TButton
      Left = 205
      Top = 1
      Width = 90
      Height = 40
      Action = Ac_Excluir
      Images = dmPrincipal.imgIcons_32
      TabOrder = 2
    end
    object pnPesquisa: TPanel
      Left = 522
      Top = 1
      Width = 361
      Height = 43
      Align = alRight
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 3
      ExplicitLeft = 520
      object Label1: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 2
        Width = 43
        Height = 13
        Margins.Top = 5
        Caption = 'Agenda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cbAgenda: TcxLookupComboBox
        Left = 3
        Top = 19
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NOME'
          end>
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = dmLookup.dslkAgenda
        Properties.OnEditValueChanged = cbAgendaPropertiesEditValueChanged
        TabOrder = 0
        Width = 237
      end
      object btnAtualizar: TButton
        Left = 246
        Top = 0
        Width = 115
        Height = 40
        Action = Ac_Pesquisar
        Images = dmPrincipal.imgIcons_32
        TabOrder = 1
      end
    end
  end
  object StorageAgendamento: TcxSchedulerDBStorage
    Resources.Items = <>
    CustomFields = <
      item
        FieldName = 'ID_AGENDA'
      end
      item
        FieldName = 'TIPO'
      end>
    DataSource = dsAgenda_Registro
    FieldNames.ActualFinish = 'ACTUAL_FINISH'
    FieldNames.ActualStart = 'ACTUAL_START'
    FieldNames.Caption = 'TITULO'
    FieldNames.EventType = 'EVENT_TYPE'
    FieldNames.Finish = 'DATA_FIM'
    FieldNames.ID = 'ID'
    FieldNames.LabelColor = 'LABEL_COLOR'
    FieldNames.Location = 'LOCAL'
    FieldNames.Message = 'DESCRICAO'
    FieldNames.Options = 'OPTIONS'
    FieldNames.ParentID = 'PARENT_ID'
    FieldNames.RecurrenceIndex = 'RECURRENCE_INDEX'
    FieldNames.RecurrenceInfo = 'RECURRENCE_INFO'
    FieldNames.Start = 'DATA_INICIO'
    OnEventInserted = StorageAgendamentoEventInserted
    Left = 488
    Top = 344
  end
  object dsAgenda_Registro: TDataSource
    DataSet = dmSistema.cdsAgenda_Registro
    Left = 320
    Top = 232
  end
  object ActionList1: TActionList
    Images = dmPrincipal.imgIcons_32
    Left = 536
    Top = 232
    object Ac_Incluir: TAction
      Caption = 'Incluir'
      ImageIndex = 3
      OnExecute = Ac_IncluirExecute
      OnUpdate = Ac_IncluirUpdate
    end
    object Ac_Alterar: TAction
      Caption = 'Alterar'
      ImageIndex = 1
      OnExecute = Ac_AlterarExecute
      OnUpdate = Ac_AlterarUpdate
    end
    object Ac_Excluir: TAction
      Caption = 'Excluir'
      ImageIndex = 2
      OnExecute = Ac_ExcluirExecute
      OnUpdate = Ac_AlterarUpdate
    end
    object Ac_Pesquisar: TAction
      Caption = 'Pesquisar'
      ImageIndex = 0
      OnExecute = Ac_PesquisarExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 312
    Top = 312
  end
end
