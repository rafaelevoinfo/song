inherited frmRelatorioBasico: TfrmRelatorioBasico
  Caption = 'frmRelatorioBasico'
  OnCreate = FormCreate
  ExplicitWidth = 1000
  ExplicitHeight = 720
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
    object pnOrganizacao: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 3
      Width = 852
      Height = 48
      Margins.Left = 0
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lb2: TLabel
        Left = 1
        Top = 11
        Width = 60
        Height = 13
        Caption = 'Organiza'#231#227'o'
      end
      object cbOrganizacao: TcxLookupComboBox
        Left = 0
        Top = 27
        RepositoryItem = dmLookup.repLcbOrganizacao
        Properties.ListColumns = <>
        TabOrder = 0
        Width = 281
      end
      object chkTodasOrganizacoes: TcxCheckBox
        Left = 287
        Top = 27
        Caption = 'Todas'
        Properties.OnEditValueChanged = chkTodasOrganizacoesPropertiesEditValueChanged
        TabOrder = 1
        Transparent = True
        Width = 67
      end
    end
  end
  object ActionList: TActionList
    Images = dmPrincipal.imgIcons_32
    Left = 208
    Top = 40
    object Ac_GerarRelatorio: TAction
      Caption = 'Gerar Relat'#243'rio'
      ImageIndex = 15
      OnExecute = Ac_GerarRelatorioExecute
    end
  end
  object dsOrganizacao: TDataSource
    DataSet = dmLookup.cdslkOrganizacao
    Left = 296
    Top = 112
  end
end
