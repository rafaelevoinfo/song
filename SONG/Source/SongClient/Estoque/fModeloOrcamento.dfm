inherited frmModeloOrcamento: TfrmModeloOrcamento
  ActiveControl = btnSalvar
  Caption = 'Modelos de Or'#231'amento'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabCadastro
    inherited tabCadastro: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnEditsCadastro: TPanel
        inline frameEditor1: TframeEditor
          Left = 1
          Top = 1
          Width = 974
          Height = 396
          Align = alClient
          TabOrder = 0
          ExplicitTop = -98
          inherited pnFormatacao: TPanel
            Width = 974
          end
          inherited pnRich: TPanel
            Width = 974
            Height = 323
            ExplicitLeft = 0
            ExplicitTop = 73
            ExplicitWidth = 722
            ExplicitHeight = 423
          end
        end
      end
    end
  end
end
