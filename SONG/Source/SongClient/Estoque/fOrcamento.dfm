inherited frmOrcamento: TfrmOrcamento
  Caption = 'Or'#231'amento'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pcPrincipal: TcxPageControl
    inherited tabPesquisa: TcxTabSheet
      inherited pnPesquisa: TPanel
        inherited pnEditsPesquisa: TPanel
          Left = 564
          Width = 411
          ExplicitWidth = 411
          inherited Label1: TLabel
            Left = 4
            ExplicitLeft = 4
          end
          inherited pnData: TPanel
            Left = 183
            ExplicitLeft = 183
          end
          inherited EditPesquisa: TcxButtonEdit
            Left = 135
            ExplicitLeft = 135
          end
          inherited cbPesquisarPor: TcxImageComboBox
            Left = 2
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
                Description = 'Data do Or'#231'amento'
                Value = 4
              end
              item
                Description = 'Cliente'
                Value = 5
              end
              item
                Description = 'Respons'#225'vel'
                Value = 6
              end>
            ExplicitLeft = 2
          end
          inherited btnPesquisar: TButton
            Left = 311
            ExplicitLeft = 311
          end
          inherited rgStatus: TcxRadioGroup
            Left = 6
            Top = 39
            ExplicitLeft = 6
            ExplicitTop = 39
          end
          object cbPesquisaCliente: TcxLookupComboBox
            Left = 136
            Top = 20
            RepositoryItem = dmLookup.repLcbFinForCli
            Properties.ListColumns = <>
            TabOrder = 5
            Visible = False
            Width = 176
          end
          object cbPesquisaVendedor: TcxLookupComboBox
            Left = 136
            Top = 21
            RepositoryItem = dmLookup.repLcbPessoa
            Properties.ListColumns = <>
            TabOrder = 6
            Visible = False
            Width = 176
          end
        end
      end
      inherited pnGrid: TPanel
        inherited cxGridRegistros: TcxGrid
          inherited viewRegistros: TcxGridDBTableView
            object viewRegistrosID: TcxGridDBColumn [0]
              DataBinding.FieldName = 'ID'
              Width = 43
            end
            object viewRegistrosID_MODELO_ORCAMENTO: TcxGridDBColumn [1]
              DataBinding.FieldName = 'ID_MODELO_ORCAMENTO'
              Visible = False
              Width = 79
            end
            object viewRegistrosDATA: TcxGridDBColumn [2]
              DataBinding.FieldName = 'DATA'
              Width = 86
            end
            object viewRegistrosNOME: TcxGridDBColumn [3]
              DataBinding.FieldName = 'NOME'
              Width = 201
            end
            object viewRegistrosID_RESPONSAVEL: TcxGridDBColumn [4]
              DataBinding.FieldName = 'ID_RESPONSAVEL'
              Visible = False
              Width = 94
            end
            object viewRegistrosRESPONSAVEL: TcxGridDBColumn [5]
              DataBinding.FieldName = 'RESPONSAVEL'
              Width = 200
            end
            object viewRegistrosID_CLIENTE: TcxGridDBColumn [6]
              DataBinding.FieldName = 'ID_CLIENTE'
              Visible = False
              Width = 78
            end
            object viewRegistrosCLIENTE: TcxGridDBColumn [7]
              DataBinding.FieldName = 'CLIENTE'
              Width = 198
            end
          end
        end
      end
    end
    inherited tabCadastro: TcxTabSheet
      OnShow = tabCadastroShow
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 976
      ExplicitHeight = 448
      inherited pnEditsCadastro: TPanel
        object pnEditsCadastroTop: TPanel
          Left = 1
          Top = 1
          Width = 974
          Height = 41
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitLeft = 302
          ExplicitTop = 20
          ExplicitWidth = 185
          object Label3: TLabel
            Left = 528
            Top = 2
            Width = 34
            Height = 13
            Caption = 'Modelo'
            FocusControl = cbModelo
          end
          object lbl1: TLabel
            Left = 318
            Top = 2
            Width = 46
            Height = 13
            Caption = 'Vendedor'
            FocusControl = cbVendedor
          end
          object lbl2: TLabel
            Left = 193
            Top = 2
            Width = 71
            Height = 13
            Caption = 'Data da Venda'
            FocusControl = EditDataVenda
          end
          object lbl5: TLabel
            Left = 4
            Top = 2
            Width = 56
            Height = 13
            Caption = 'Cliente (F2)'
            FocusControl = cbCliente
          end
          object btnAdicionarCliente: TButton
            Left = 166
            Top = 16
            Width = 22
            Height = 21
            Action = Ac_Adicionar_Cliente
            Images = dmPrincipal.imgIcons_16
            TabOrder = 1
            TabStop = False
          end
          object cbCliente: TcxDBLookupComboBox
            Left = 2
            Top = 16
            RepositoryItem = dmLookup.repLcbFinForCli
            DataBinding.DataField = 'ID_CLIENTE'
            DataBinding.DataSource = dsMaster
            Properties.ListColumns = <>
            TabOrder = 0
            OnKeyDown = cbClienteKeyDown
            Width = 165
          end
          object cbModelo: TcxDBLookupComboBox
            Left = 526
            Top = 16
            DataBinding.DataField = 'ID_MODELO_ORCAMENTO'
            DataBinding.DataSource = dsMaster
            Properties.ListColumns = <>
            TabOrder = 4
            Width = 199
          end
          object cbVendedor: TcxDBLookupComboBox
            Left = 315
            Top = 16
            RepositoryItem = dmLookup.repLcbPessoa
            DataBinding.DataField = 'ID_RESPONSAVEL'
            DataBinding.DataSource = dsMaster
            Properties.ListColumns = <>
            TabOrder = 3
            Width = 209
          end
          object EditDataVenda: TcxDBDateEdit
            Left = 191
            Top = 16
            RepositoryItem = dmLookup.repDateDataPadrao
            DataBinding.DataField = 'DATA'
            DataBinding.DataSource = dsMaster
            TabOrder = 2
            Width = 121
          end
        end
        inline frameEditor: TframeEditor
          Left = 1
          Top = 145
          Width = 974
          Height = 252
          Align = alClient
          TabOrder = 1
          ExplicitLeft = 1
          ExplicitTop = 83
          ExplicitWidth = 974
          ExplicitHeight = 314
          inherited pnRich: TPanel
            Width = 974
            Height = 230
            ExplicitWidth = 974
            ExplicitHeight = 190
            inherited Rich: TcxDBRichEdit
              DataBinding.DataField = 'ORCAMENTO'
              DataBinding.DataSource = dsOrcamento_Orcamento
            end
          end
          inherited ToolBar1: TToolBar
            Width = 974
            ExplicitWidth = 974
          end
        end
        object ScrollCampos: TcxScrollBox
          Left = 1
          Top = 42
          Width = 974
          Height = 103
          Align = alTop
          TabOrder = 2
        end
      end
    end
  end
  inherited ActionList1: TActionList
    object Ac_Adicionar_Cliente: TAction
      ImageIndex = 3
      OnExecute = Ac_Adicionar_ClienteExecute
    end
  end
  inherited dsMaster: TDataSource
    DataSet = dmEstoque.cdsOrcamento
  end
  object dsOrcamento_Orcamento: TDataSource
    DataSet = dmEstoque.cdsOrcamento_Orcamento
    Left = 360
    Top = 192
  end
end
