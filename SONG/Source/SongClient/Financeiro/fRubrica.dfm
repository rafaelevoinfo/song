inherited frmRubrica: TfrmRubrica
  Caption = 'Rubricas'
  ExplicitWidth = 320
  ExplicitHeight = 240
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
                Value = 1
              end
              item
                Description = 'ID'
                ImageIndex = 0
                Value = 2
              end
              item
                Description = 'Nome'
                Value = 3
              end
              item
                Description = 'Identificador'
                Value = 5
              end>
          end
        end
        inherited pnBotoes: TPanel
          inherited btnIncluir: TButton
            WordWrap = True
          end
          inherited btnUtilizar: TButton
            Left = 188
            ExplicitLeft = 188
          end
          object btnIncluirSubItem: TButton
            AlignWithMargins = True
            Left = 86
            Top = 1
            Width = 100
            Height = 40
            Margins.Left = 0
            Margins.Top = 1
            Margins.Right = 2
            Margins.Bottom = 1
            Action = Ac_Incluir_Item
            Align = alLeft
            Images = dmPrincipal.imgIcons_32
            TabOrder = 2
            WordWrap = True
            ExplicitLeft = 76
            ExplicitTop = 0
          end
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Options.Editing = False
            end
            object viewRegistrosIDENTIFICADOR: TcxGridDBColumn [1]
              DataBinding.FieldName = 'IDENTIFICADOR'
              Options.Editing = False
              SortIndex = 0
              SortOrder = soAscending
            end
            object viewRegistrosNOME: TcxGridDBColumn [2]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
            end
            object viewRegistrosID_RUBRICA_PAI: TcxGridDBColumn [3]
              DataBinding.FieldName = 'ID_RUBRICA_PAI'
              Visible = False
              Options.Editing = False
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      inherited pnEditsCadastro: TPanel
        ExplicitLeft = 4
        ExplicitTop = 52
        object Label3: TLabel
          Left = 4
          Top = 0
          Width = 27
          Height = 13
          Caption = 'Nome'
          FocusControl = EditNome
        end
        object Label4: TLabel
          Left = 303
          Top = 0
          Width = 53
          Height = 13
          Caption = 'Rubrica Pai'
          FocusControl = cbRubricaPai
        end
        object EditNome: TcxDBTextEdit
          Left = 4
          Top = 16
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 296
        end
        object cbRubricaPai: TcxDBLookupComboBox
          Left = 302
          Top = 16
          RepositoryItem = dmLookup.repLcbRubrica
          DataBinding.DataField = 'ID_RUBRICA_PAI'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 1
          Width = 247
        end
      end
    end
  end
  inherited ActionList1: TActionList
    inherited Ac_Incluir: TAction
      Caption = 'Incluir Rubrica'
    end
    object Ac_Incluir_Item: TAction
      Category = 'Master'
      Caption = 'Incluir Item'
      ImageIndex = 3
      OnExecute = Ac_Incluir_ItemExecute
      OnUpdate = Ac_Incluir_ItemUpdate
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmFinanceiro.cdsRubrica
  end
end
