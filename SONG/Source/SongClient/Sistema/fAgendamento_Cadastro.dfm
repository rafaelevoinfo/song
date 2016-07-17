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
  inherited pnlButtons: TPanel
    Top = 333
    Width = 447
    ExplicitTop = 333
    ExplicitWidth = 447
    inherited pnlThreeButtons: TPanel
      Width = 337
      ExplicitWidth = 337
      inherited btnOk: TcxButton
        Left = 12
        ExplicitLeft = 12
      end
      inherited btnCancel: TcxButton
        Left = 122
        ExplicitLeft = 122
      end
      inherited btnDelete: TcxButton
        Left = 232
        ExplicitLeft = 232
      end
    end
    inherited pnlRecurrence: TPanel
      Left = 337
      ExplicitLeft = 337
    end
  end
  inherited pnlInformation: TPanel
    Width = 447
    ExplicitWidth = 447
  end
  inherited pnlCaption: TPanel
    Width = 447
    ExplicitWidth = 447
    inherited lbSubject: TcxLabel
      Caption = 'T'#237'tulo'
      ExplicitWidth = 26
    end
    inherited lbLocation: TcxLabel
      Caption = 'Local:'
      ExplicitWidth = 28
    end
    inherited lbLabel: TcxLabel
      Caption = 'Label:'
    end
  end
  inherited pnlTime: TPanel
    Width = 447
    ExplicitWidth = 447
    inherited lbStartTime: TcxLabel
      Caption = 'In'#237'cio'
      ExplicitWidth = 25
    end
    inherited lbEndTime: TcxLabel
      Caption = 'Fim:'
      ExplicitWidth = 20
    end
    inherited cbAllDayEvent: TcxCheckBox
      Caption = 'Dia todo'
    end
  end
  inherited pnlRecurrenceInfo: TPanel
    Width = 447
    ExplicitWidth = 447
  end
  inherited pnlPlaceHolder: TPanel
    Width = 447
    Visible = False
    ExplicitWidth = 447
    inherited Panel1: TPanel
      Width = 447
      ExplicitWidth = 447
      inherited Bevel3: TdxBevel
        Width = 436
      end
    end
  end
  inherited pnlMessage: TPanel
    Width = 447
    Height = 6
    ExplicitWidth = 447
    ExplicitHeight = 6
    inherited Bevel1: TdxBevel
      Top = -2
    end
    inherited meMessage: TcxMemo
      ExplicitHeight = 0
      Height = 0
    end
  end
  inherited pnlResource: TPanel
    Width = 447
    ExplicitWidth = 447
  end
  inherited pnlTaskComplete: TPanel
    Width = 447
    ExplicitWidth = 447
  end
end
