inherited frmBasicoCrudMasterDetail: TfrmBasicoCrudMasterDetail
  ActiveControl = btnSalvarDetail
  Caption = 'frmBasicoCrudMasterDetail'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    Properties.ActivePage = tabCadastroDetail
    inherited tabPesquisa: TcxTabSheet
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          Height = 169
          ExplicitHeight = 169
          inherited viewRegistros: TcxGridDBTableView
            Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
          end
        end
        object cxSplitter1: TcxSplitter
          Left = 1
          Top = 170
          Width = 974
          Height = 6
          AlignSplitter = salBottom
          Control = pnDetail
        end
        object pnDetail: TPanel
          Left = 1
          Top = 176
          Width = 974
          Height = 227
          Align = alBottom
          TabOrder = 2
          DesignSize = (
            974
            227)
          object pcDetails: TcxPageControl
            Left = 1
            Top = 1
            Width = 972
            Height = 225
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = tabDetail
            Properties.CustomButtons.Buttons = <>
            ClientRectBottom = 220
            ClientRectLeft = 2
            ClientRectRight = 967
            ClientRectTop = 25
            object tabDetail: TcxTabSheet
              Caption = 'tabDetail'
              ImageIndex = 0
              object pnBotoesDetail: TPanel
                Left = 0
                Top = 0
                Width = 965
                Height = 25
                Align = alTop
                TabOrder = 0
                object btnIncluirDetail: TButton
                  Left = 1
                  Top = 1
                  Width = 81
                  Height = 23
                  Action = Ac_Incluir_Detail
                  Align = alLeft
                  Images = dmPrincipal.imgIcons_16
                  TabOrder = 0
                end
                object btnUtilizarDetailSelecionado: TButton
                  AlignWithMargins = True
                  Left = 82
                  Top = 2
                  Width = 127
                  Height = 21
                  Margins.Left = 0
                  Margins.Top = 1
                  Margins.Right = 2
                  Margins.Bottom = 1
                  Action = Ac_Utilizar_Detail_Selecionado
                  Align = alLeft
                  Images = dmPrincipal.imgIcons_16
                  TabOrder = 1
                  Visible = False
                  WordWrap = True
                end
              end
              object cxGridRegistrosDetail: TcxGrid
                Left = 0
                Top = 25
                Width = 965
                Height = 170
                Align = alClient
                Images = dmPrincipal.imgIcons_16
                TabOrder = 1
                LockedStateImageOptions.Effect = lsieDark
                LockedStateImageOptions.ShowText = True
                LockedStateImageOptions.Text = 'Pesquisando...'
                object viewRegistrosDetail: TcxGridDBTableView
                  OnDblClick = viewRegistrosDetailDblClick
                  Navigator.Buttons.CustomButtons = <>
                  Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
                  DataController.DataSource = dsDetail
                  DataController.Summary.DefaultGroupSummaryItems = <>
                  DataController.Summary.FooterSummaryItems = <>
                  DataController.Summary.SummaryGroups = <>
                  FilterRow.Visible = True
                  OptionsCustomize.ColumnsQuickCustomization = True
                  OptionsData.CancelOnExit = False
                  OptionsData.Deleting = False
                  OptionsData.DeletingConfirmation = False
                  OptionsData.Inserting = False
                  OptionsSelection.MultiSelect = True
                  OptionsView.NoDataToDisplayInfoText = '<Sem dados para mostrar>'
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
          object btnExportar_Excel_Detail: TButton
            Left = 834
            Top = 1
            Width = 134
            Height = 21
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 2
            Margins.Bottom = 1
            Action = Ac_Exportar_Excel_Detail
            Anchors = [akTop, akRight]
            Images = dmPrincipal.imgIcons_16
            TabOrder = 1
            WordWrap = True
          end
        end
      end
    end
    object tabCadastroDetail: TcxTabSheet
      Caption = 'tabCadastroDetail'
      ImageIndex = 2
      object pnBotoesCadastroDetail: TPanel
        Left = 0
        Top = 0
        Width = 976
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
          Left = 215
          Top = 4
          Width = 85
          Height = 42
          Action = Ac_Cancelar_Detail
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 2
        end
        object btnSalvarIncluirDetail: TButton
          AlignWithMargins = True
          Left = 95
          Top = 4
          Width = 114
          Height = 42
          Action = Ac_Salvar_Incluir_Detail
          Align = alLeft
          Images = dmPrincipal.imgIcons_32
          TabOrder = 1
        end
      end
      object pnEditsCadastroDetail: TPanel
        Left = 0
        Top = 50
        Width = 976
        Height = 398
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
      end
    end
  end
  inherited ActionList1: TActionList
    object Ac_Incluir_Detail: TAction [6]
      Category = 'Detail'
      Caption = 'Incluir'
      ImageIndex = 3
      OnExecute = Ac_Incluir_DetailExecute
      OnUpdate = Ac_Incluir_DetailUpdate
    end
    object Ac_Alterar_Detail: TAction [7]
      Category = 'Detail'
      Caption = 'Alterar'
      ImageIndex = 1
      OnExecute = Ac_Alterar_DetailExecute
      OnUpdate = Ac_Alterar_DetailUpdate
    end
    object Ac_Excluir_Detail: TAction [8]
      Category = 'Detail'
      Caption = 'Excluir'
      ImageIndex = 2
      OnExecute = Ac_Excluir_DetailExecute
      OnUpdate = Ac_Excluir_DetailUpdate
    end
    object Ac_Salvar_Detail: TAction [9]
      Category = 'Detail'
      Caption = 'Salvar'
      ImageIndex = 4
      OnExecute = Ac_Salvar_DetailExecute
      OnUpdate = Ac_Salvar_DetailUpdate
    end
    object Ac_Cancelar_Detail: TAction [10]
      Category = 'Detail'
      Caption = 'Cancelar'
      ImageIndex = 5
      OnExecute = Ac_Cancelar_DetailExecute
    end
    object Ac_Salvar_Incluir_Detail: TAction
      Category = 'Detail'
      Caption = 'Salvar/Incluir'
      ImageIndex = 4
      OnExecute = Ac_Salvar_Incluir_DetailExecute
      OnUpdate = Ac_Salvar_DetailUpdate
    end
    object Ac_Utilizar_Detail_Selecionado: TAction
      Caption = 'Utilizar Selecionado'
      ImageIndex = 6
      OnExecute = Ac_Utilizar_Detail_SelecionadoExecute
    end
    object Ac_Exportar_Excel_Detail: TAction
      Category = 'Detail'
      Caption = 'Exportar para Excel'
      ImageIndex = 18
      OnExecute = Ac_Exportar_Excel_DetailExecute
      OnUpdate = Ac_Alterar_DetailUpdate
    end
  end
  object dsDetail: TDataSource
    Left = 424
    Top = 240
  end
end
