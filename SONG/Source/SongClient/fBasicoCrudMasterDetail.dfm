inherited frmBasicoCrudMasterDetail: TfrmBasicoCrudMasterDetail
  Caption = 'frmBasicoCrudMasterDetail'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabPesquisa
    inherited tabPesquisa: TcxTabSheet
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          Height = 197
          ExplicitHeight = 197
        end
        object cxSplitter1: TcxSplitter
          Left = 1
          Top = 198
          Width = 853
          Height = 9
          AlignSplitter = salBottom
          Control = pnDetail
        end
        object pnDetail: TPanel
          Left = 1
          Top = 207
          Width = 853
          Height = 188
          Align = alBottom
          TabOrder = 2
          object pcDetails: TcxPageControl
            Left = 1
            Top = 1
            Width = 851
            Height = 186
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = tabDetail
            Properties.CustomButtons.Buttons = <>
            ClientRectBottom = 181
            ClientRectLeft = 2
            ClientRectRight = 846
            ClientRectTop = 25
            object tabDetail: TcxTabSheet
              Caption = 'tabDetail'
              ImageIndex = 0
              object pnBotoesDetail: TPanel
                Left = 0
                Top = 0
                Width = 844
                Height = 33
                Align = alTop
                TabOrder = 0
                object btnIncluirDetail: TButton
                  AlignWithMargins = True
                  Left = 4
                  Top = 4
                  Width = 81
                  Height = 25
                  Action = Ac_Incluir_Detail
                  Align = alLeft
                  Images = dmPrincipal.imgIcons_16
                  TabOrder = 0
                end
              end
              object cxGrid1: TcxGrid
                Left = 0
                Top = 33
                Width = 844
                Height = 123
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 1
                object viewRegistrosDetail: TcxGridDBTableView
                  Navigator.Buttons.CustomButtons = <>
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  OptionsCustomize.ColumnsQuickCustomization = True
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Editing = False
                  OptionsData.Inserting = False
                  OptionsSelection.MultiSelect = True
                  OptionsView.ShowEditButtons = gsebAlways
                  object ColumnAlterarDetail: TcxGridDBColumn
                    PropertiesClassName = 'TcxButtonEditProperties'
                    Properties.Buttons = <
                      item
                        Action = Ac_Alterar_Detail
                        Default = True
                        Kind = bkGlyph
                      end>
                    Properties.Images = dmPrincipal.imgIcons_16
                    Properties.ViewStyle = vsButtonsOnly
                    MinWidth = 64
                    Options.Filtering = False
                    Options.ShowEditButtons = isebAlways
                    Options.GroupFooters = False
                    Options.Grouping = False
                    Options.HorzSizing = False
                    Options.Moving = False
                  end
                  object ColumnExcluirDetail: TcxGridDBColumn
                    PropertiesClassName = 'TcxButtonEditProperties'
                    Properties.Buttons = <
                      item
                        Action = Ac_Excluir_Detail
                        Default = True
                        Kind = bkGlyph
                      end>
                    Properties.Images = dmPrincipal.imgIcons_16
                    Properties.ViewStyle = vsButtonsOnly
                    MinWidth = 64
                    Options.Filtering = False
                    Options.ShowEditButtons = isebAlways
                    Options.GroupFooters = False
                    Options.Grouping = False
                    Options.HorzSizing = False
                    Options.Moving = False
                  end
                end
                object cxGridLevel1: TcxGridLevel
                  GridView = viewRegistrosDetail
                end
              end
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      inherited pnBotoesCadastro: TPanel
        inherited btnCancelar: TButton
          OnClick = nil
        end
      end
    end
    object tabCadastroDetail: TcxTabSheet
      Caption = 'tabCadastroDetail'
      ImageIndex = 2
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 855
        Height = 50
        Align = alTop
        TabOrder = 0
        object btnSalvarDetail: TButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 85
          Height = 42
          Action = Ac_Salvar_Detail
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 0
        end
        object btnCancelarDetail: TButton
          AlignWithMargins = True
          Left = 95
          Top = 4
          Width = 85
          Height = 42
          Action = Ac_Cancelar_Detail
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 1
        end
      end
    end
  end
  inherited ActionList1: TActionList
    object Ac_Incluir_Detail: TAction
      Category = 'Detail'
      Caption = 'Incluir'
      ImageIndex = 3
      OnExecute = Ac_Incluir_DetailExecute
    end
    object Ac_Alterar_Detail: TAction
      Category = 'Detail'
      Caption = 'Alterar'
      ImageIndex = 1
      OnExecute = Ac_Alterar_DetailExecute
    end
    object Ac_Excluir_Detail: TAction
      Category = 'Detail'
      Caption = 'Excluir'
      ImageIndex = 2
      OnExecute = Ac_Excluir_DetailExecute
    end
    object Ac_Salvar_Detail: TAction
      Category = 'Detail'
      Caption = 'Salvar'
      ImageIndex = 4
      OnExecute = Ac_Salvar_DetailExecute
    end
    object Ac_Cancelar_Detail: TAction
      Category = 'Detail'
      Caption = 'Cancelar'
      ImageIndex = 5
      OnExecute = Ac_Cancelar_DetailExecute
    end
  end
  object dsDetail: TDataSource
    Left = 424
    Top = 240
  end
end
