inherited frmBasicoCrudMasterDetail: TfrmBasicoCrudMasterDetail
  Caption = 'frmBasicoCrudMasterDetail'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          inherited cbPesquisarPor: TcxImageComboBox
            Properties.Items = <
              item
                Description = 'Todos'
                ImageIndex = 0
                Value = 0
              end
              item
                Description = 'C'#243'digo'
                ImageIndex = 0
                Value = 1
              end>
          end
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          Height = 208
          ExplicitHeight = 208
        end
        object cxSplitter1: TcxSplitter
          Left = 1
          Top = 209
          Width = 852
          Height = 6
          AlignSplitter = salBottom
          Control = pnDetail
        end
        object pnDetail: TPanel
          Left = 1
          Top = 215
          Width = 852
          Height = 188
          Align = alBottom
          TabOrder = 2
          object pcDetails: TcxPageControl
            Left = 1
            Top = 1
            Width = 850
            Height = 186
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = tabDetail
            Properties.CustomButtons.Buttons = <>
            ClientRectBottom = 182
            ClientRectLeft = 4
            ClientRectRight = 846
            ClientRectTop = 24
            object tabDetail: TcxTabSheet
              Caption = 'tabDetail'
              ImageIndex = 0
              object pnBotoesDetail: TPanel
                Left = 0
                Top = 0
                Width = 842
                Height = 25
                Align = alTop
                TabOrder = 0
                object btnIncluirDetail: TButton
                  Left = 0
                  Top = 1
                  Width = 81
                  Height = 23
                  Action = Ac_Incluir_Detail
                  Images = dmPrincipal.imgIcons_16
                  TabOrder = 0
                end
              end
              object cxGridRegistrosDetail: TcxGrid
                Left = 0
                Top = 25
                Width = 842
                Height = 133
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 1
                LockedStateImageOptions.Effect = lsieDark
                LockedStateImageOptions.ShowText = True
                LockedStateImageOptions.Text = 'Pesquisando...'
                object viewRegistrosDetail: TcxGridDBTableView
                  OnDblClick = viewRegistrosDetailDblClick
                  Navigator.Buttons.CustomButtons = <>
                  DataController.DataSource = dsDetail
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  FilterRow.InfoText = 'Clique aqui para definir um filtro'
                  FilterRow.Visible = True
                  OptionsCustomize.ColumnsQuickCustomization = True
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Inserting = False
                  OptionsSelection.MultiSelect = True
                  OptionsView.NoDataToDisplayInfoText = '<Sem dados para mostrar>'
                  OptionsView.ShowEditButtons = gsebAlways
                  OptionsView.GroupByBox = False
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
      object pnBotoesCadastroDetail: TPanel
        Left = 0
        Top = 0
        Width = 854
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
      object pnEditsCadastroDetail: TPanel
        Left = 0
        Top = 50
        Width = 854
        Height = 398
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
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
      OnUpdate = Ac_Salvar_DetailUpdate
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
