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
    ViewDay.Active = True
    Align = alClient
    ControlBox.Visible = False
    EventOperations.InplaceEditing = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    OptionsBehavior.ModalDialogs = True
    OptionsView.ViewPosition = vpBottom
    Storage = StorageAgendamento
    TabOrder = 0
    ExplicitTop = 47
    ExplicitHeight = 640
    Selection = 1
    Splitters = {
      010000007E0000007303000083000000DF02000001000000E40200008B010000}
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
      Left = 5
      Top = 4
      Width = 43
      Height = 13
      Caption = 'Agenda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbAgenda: TcxLookupComboBox
      Left = 49
      Top = 1
      Properties.ListColumns = <>
      TabOrder = 0
      Width = 237
    end
  end
  object StorageAgendamento: TcxSchedulerDBStorage
    Resources.Items = <>
    CustomFields = <>
    Left = 488
    Top = 344
  end
end
