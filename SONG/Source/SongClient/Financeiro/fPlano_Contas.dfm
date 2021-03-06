inherited frmPlanoContas: TfrmPlanoContas
  Caption = 'Plano de Contas'
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
            Width = 105
            WordWrap = True
            ExplicitWidth = 105
          end
          inherited btnUtilizar: TButton
            Left = 310
            ExplicitLeft = 310
          end
          inherited btnExportarExcel: TButton
            Left = 106
            TabOrder = 3
            ExplicitLeft = 106
          end
          object btnIncluirSubItem: TButton
            AlignWithMargins = True
            Left = 208
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
            Visible = False
            WordWrap = True
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
            object viewRegistrosNOME: TcxGridDBColumn [1]
              DataBinding.FieldName = 'NOME'
              Options.Editing = False
              SortIndex = 0
              SortOrder = soAscending
              Width = 469
            end
            object viewRegistrosTIPO: TcxGridDBColumn [2]
              DataBinding.FieldName = 'TIPO'
              RepositoryItem = dmLookup.repIcbTipoPlanoConta
              Options.Editing = False
              Width = 160
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnEditsCadastro: TPanel
        object lblNome: TLabel
          Left = 4
          Top = 6
          Width = 27
          Height = 13
          Caption = 'Nome'
          FocusControl = EditNome
        end
        object Label3: TLabel
          Left = 309
          Top = 6
          Width = 20
          Height = 13
          Caption = 'Tipo'
          FocusControl = cbTipo
        end
        object Label4: TLabel
          Left = 434
          Top = 6
          Width = 46
          Height = 13
          Caption = 'Conta Pai'
          FocusControl = cbContaPai
          Visible = False
        end
        object EditNome: TcxDBTextEdit
          Left = 4
          Top = 22
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dsMaster
          TabOrder = 0
          Width = 296
        end
        object cbTipo: TcxDBImageComboBox
          Left = 306
          Top = 22
          RepositoryItem = dmLookup.repIcbTipoPlanoConta
          DataBinding.DataField = 'TIPO'
          DataBinding.DataSource = dsMaster
          Properties.Items = <>
          TabOrder = 1
          Width = 121
        end
        object cbContaPai: TcxDBLookupComboBox
          Left = 433
          Top = 22
          RepositoryItem = dmLookup.repLcbPlano_Contas
          DataBinding.DataField = 'ID_CONTA_PAI'
          DataBinding.DataSource = dsMaster
          Properties.ListColumns = <>
          TabOrder = 2
          Visible = False
          Width = 145
        end
      end
    end
  end
  inherited ActionList1: TActionList
    object Ac_Incluir_Item: TAction
      Category = 'Master'
      Caption = 'Incluir Item'
      ImageIndex = 3
      OnExecute = Ac_Incluir_ItemExecute
      OnUpdate = Ac_Incluir_ItemUpdate
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmFinanceiro.cdsPlano_Contas
  end
end
