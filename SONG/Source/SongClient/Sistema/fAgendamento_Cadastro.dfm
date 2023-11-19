inherited frmAgendamentoCadastro: TfrmAgendamentoCadastro
  Left = 0
  Top = 0
  Caption = 'Evento da Agenda'
  ClientHeight = 371
  ClientWidth = 447
  ExplicitWidth = 463
  ExplicitHeight = 410
  PixelsPerInch = 96
  TextHeight = 13
  inherited lcMain: TdxLayoutControl
    Width = 447
    Height = 371
    ExplicitWidth = 447
    ExplicitHeight = 371
    inherited cbAllDayEvent: TcxCheckBox
      Caption = 'Dia todo'
      ExplicitWidth = 61
    end
    inherited meMessage: TcxMemo
      ExplicitHeight = 24
      Height = 24
    end
    inherited btnOk: TcxButton
      Left = 119
      ExplicitLeft = 119
    end
    inherited btnCancel: TcxButton
      Left = 200
      ExplicitLeft = 200
    end
    inherited btnDelete: TcxButton
      Left = 281
      ExplicitLeft = 281
    end
    inherited lbSubject: TdxLayoutItem
      CaptionOptions.Text = 'T'#237'tulo'
    end
    inherited lbLocation: TdxLayoutItem
      CaptionOptions.Text = 'Local:'
    end
    inherited lbLabel: TdxLayoutItem
      CaptionOptions.Text = 'Label:'
    end
    inherited lbStartTime: TdxLayoutItem
      CaptionOptions.Text = 'In'#237'cio'
    end
    inherited dxLayoutItem4: TdxLayoutItem
      ControlOptions.OriginalWidth = 61
    end
    inherited lbEndTime: TdxLayoutItem
      CaptionOptions.Text = 'Fim:'
    end
    inherited pnlPlaceHolder: TdxLayoutGroup
      Visible = False
    end
    inherited pnlRecurrence: TdxLayoutItem
      Left = 337
    end
    inherited pnlButtons: TdxLayoutGroup
      Top = 333
    end
  end
  inherited dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    inherited dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel
      PixelsPerInch = 96
    end
  end
end
