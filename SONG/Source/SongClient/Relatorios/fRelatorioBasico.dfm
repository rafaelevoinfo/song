inherited frmRelatorioBasico: TfrmRelatorioBasico
  Caption = 'frmRelatorioBasico'
  PixelsPerInch = 96
  TextHeight = 13
  object pnBotoes: TPanel
    Left = 0
    Top = 0
    Width = 129
    Height = 681
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object btnGerarRelatorio: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 123
      Height = 48
      Action = Ac_GerarRelatorio
      Align = alTop
      Images = dmPrincipal.imgIcons_32
      TabOrder = 0
      WordWrap = True
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 128
    end
  end
  object pnConfiguracoes: TPanel
    Left = 129
    Top = 0
    Width = 855
    Height = 681
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 169
    ExplicitWidth = 815
  end
  object ActionList: TActionList
    Images = dmPrincipal.imgIcons_32
    Left = 208
    Top = 40
    object Ac_GerarRelatorio: TAction
      Caption = 'Gerar Relat'#243'rio'
      ImageIndex = 15
    end
  end
end
