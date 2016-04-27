inherited frmPlanoContas: TfrmPlanoContas
  ActiveControl = EditNome
  Caption = 'Plano de Contas'
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
            Width = 105
            WordWrap = True
            ExplicitWidth = 105
          end
          inherited btnUtilizar: TButton
            Left = 208
            ExplicitLeft = 208
          end
          object btnIncluirSubItem: TButton
            AlignWithMargins = True
            Left = 106
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
              Width = 469
            end
            object viewRegistrosTIPO: TcxGridDBColumn [3]
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
          Width = 145
        end
      end
    end
  end
  inherited ActionList1: TActionList
    inherited Ac_Incluir: TAction
      Caption = 'Incluir Plano de Contas'
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
    DataSet = dmFinanceiro.cdsPlano_Contas
  end
end
