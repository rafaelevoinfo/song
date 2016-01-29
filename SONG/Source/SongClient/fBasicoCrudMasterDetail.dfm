inherited frmBasicoCrudMasterDetail: TfrmBasicoCrudMasterDetail
  Caption = 'frmBasicoCrudMasterDetail'
  ExplicitTop = 8
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          ExplicitHeight = 42
        end
        inherited pnBotoes: TPanel
          ExplicitLeft = 1
          ExplicitTop = 1
          ExplicitHeight = 42
        end
      end
      inherited pnGrid: TPanel
        ExplicitTop = 44
        ExplicitHeight = 402
        inherited cxGridRegistros: TcxGrid
          Height = 208
          ExplicitHeight = 206
        end
        object cxSplitter1: TcxSplitter
          Left = 1
          Top = 209
          Width = 852
          Height = 6
          AlignSplitter = salBottom
          Control = pnDetail
          ExplicitTop = 207
          ExplicitWidth = 853
        end
        object pnDetail: TPanel
          Left = 1
          Top = 215
          Width = 852
          Height = 188
          Align = alBottom
          TabOrder = 2
          ExplicitTop = 213
          ExplicitWidth = 853
          object pcDetails: TcxPageControl
            Left = 1
            Top = 1
            Width = 850
            Height = 186
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = tabDetail
            Properties.CustomButtons.Buttons = <>
            ExplicitWidth = 851
            ClientRectBottom = 181
            ClientRectLeft = 2
            ClientRectRight = 845
            ClientRectTop = 25
            object tabDetail: TcxTabSheet
              Caption = 'tabDetail'
              ImageIndex = 0
              ExplicitWidth = 844
              object pnBotoesDetail: TPanel
                Left = 0
                Top = 0
                Width = 843
                Height = 33
                Align = alTop
                TabOrder = 0
                ExplicitWidth = 844
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
                Width = 843
                Height = 123
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 1
                ExplicitWidth = 844
                object viewRegistrosDetail: TcxGridDBTableView
                  Navigator.Buttons.CustomButtons = <>
                  DataController.DataSource = dsDetail
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
                    Caption = 'Alterar'
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
                    Caption = 'Excluir'
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object tabCadastroDetail: TcxTabSheet
      Caption = 'tabCadastroDetail'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
