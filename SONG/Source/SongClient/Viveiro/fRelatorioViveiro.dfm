inherited frmRelatorioViveiro: TfrmRelatorioViveiro
  Caption = 'Relat'#243'rios do Viveiro'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnConfiguracoes: TPanel
    object pcPrincipal: TcxPageControl
      Left = 0
      Top = 0
      Width = 855
      Height = 627
      Align = alClient
      TabOrder = 0
      TabStop = False
      Properties.ActivePage = tabSaldos
      Properties.CustomButtons.Buttons = <>
      ClientRectBottom = 623
      ClientRectLeft = 4
      ClientRectRight = 851
      ClientRectTop = 24
      object tabSaldos: TcxTabSheet
        Caption = 'Saldos'
        ImageIndex = 0
        object Label2: TLabel
          Left = 7
          Top = 3
          Width = 36
          Height = 13
          Caption = 'Especie'
        end
        object cbProjetoSaldo: TcxLookupComboBox
          Left = 4
          Top = 19
          RepositoryItem = dmLookup.repLcbEspecie
          Properties.ListColumns = <>
          TabOrder = 0
          Width = 225
        end
        object chkTodosProjetosSaldo: TcxCheckBox
          Left = 229
          Top = 20
          Caption = 'Todas'
          TabOrder = 1
          Transparent = True
          Width = 69
        end
      end
    end
  end
  inherited pnOrganizacao: TPanel
    inherited chkTodasOrganizacoes: TcxCheckBox
      ExplicitHeight = 21
    end
  end
end
