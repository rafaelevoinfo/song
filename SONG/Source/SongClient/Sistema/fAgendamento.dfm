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
    Top = 26
    Width = 884
    Height = 411
    DateNavigator.ColCount = 6
    DateNavigator.OnPeriodChanged = CalendarioDateNavigatorPeriodChanged
    ViewDay.Active = True
    Align = alClient
    ContentPopupMenu.Items = []
    ControlBox.Visible = False
    EventOperations.InplaceEditing = False
    EventOperations.Intersection = False
    EventOperations.MovingBetweenResources = False
    EventOperations.Moving = False
    EventOperations.Sizing = False
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
    Selection = 1
    Splitters = {
      010000007E0000007303000083000000DF02000001000000E40200007E000000}
    StoredClientBounds = {0100000001000000730300009A010000}
  end
  object pnControlBox: TPanel
    Left = 0
    Top = 0
    Width = 884
    Height = 26
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 6
      Width = 43
      Height = 19
      Margins.Top = 5
      Align = alLeft
      Caption = 'Agenda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitHeight = 13
    end
    object cbAgenda: TcxLookupComboBox
      Left = 50
      Top = 1
      Align = alLeft
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dslkAgenda
      Properties.OnEditValueChanged = cbAgendaPropertiesEditValueChanged
      TabOrder = 0
      Width = 237
    end
    object btnIncluir: TButton
      Left = 287
      Top = 1
      Width = 75
      Height = 24
      Action = Ac_Incluir
      Align = alLeft
      Images = dmPrincipal.imgIcons_16
      TabOrder = 1
      ExplicitLeft = 250
    end
    object btnAlterar: TButton
      Left = 362
      Top = 1
      Width = 75
      Height = 24
      Action = Ac_Alterar
      Align = alLeft
      Images = dmPrincipal.imgIcons_16
      TabOrder = 2
      ExplicitLeft = 287
    end
    object btnExcluir: TButton
      Left = 437
      Top = 1
      Width = 75
      Height = 24
      Action = Ac_Excluir
      Align = alLeft
      Images = dmPrincipal.imgIcons_16
      TabOrder = 3
      ExplicitLeft = 495
      ExplicitTop = -4
    end
    object btnAtualizar: TButton
      Left = 512
      Top = 1
      Width = 75
      Height = 24
      Action = Ac_Atualizar
      Align = alLeft
      Images = dmPrincipal.imgIcons_16
      TabOrder = 4
      ExplicitLeft = 557
      ExplicitTop = -4
    end
  end
  object StorageAgendamento: TcxSchedulerDBStorage
    Resources.Items = <>
    CustomFields = <
      item
        FieldName = 'ID_AGENDA'
      end
      item
        FieldName = 'ID'
      end>
    DataSource = dsAgenda_Registro
    FieldNames.ActualFinish = 'ACTUAL_FINISH'
    FieldNames.ActualStart = 'ACTUAL_START'
    FieldNames.Caption = 'TITULO'
    FieldNames.EventType = 'EVENT_TYPE'
    FieldNames.Finish = 'DATA_FIM'
    FieldNames.ID = 'ID'
    FieldNames.LabelColor = 'LABEL_COLOR'
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
  object dslkAgenda: TDataSource
    DataSet = dmLookup.cdslkAgenda
    Left = 440
    Top = 224
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
    object Ac_Atualizar: TAction
      Caption = 'Atualizar'
      ImageIndex = 17
      OnExecute = Ac_AtualizarExecute
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 312
    Top = 312
  end
end
