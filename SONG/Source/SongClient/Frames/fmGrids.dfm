object frameGrids: TframeGrids
  Left = 0
  Top = 0
  Width = 832
  Height = 450
  TabOrder = 0
  object gpGrids: TGridPanel
    Left = 0
    Top = 19
    Width = 832
    Height = 431
    Align = alClient
    ColumnCollection = <
      item
        Value = 47.000000000000000000
      end
      item
        Value = 5.000000000000000000
      end
      item
        Value = 48.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = cxGrid1
        Row = 0
      end
      item
        Column = 1
        Control = pnBotoes
        Row = 0
      end
      item
        Column = 2
        Control = cxGrid2
        Row = 0
      end>
    RowCollection = <
      item
        Value = 100.000000000000000000
      end>
    TabOrder = 0
    object cxGrid1: TcxGrid
      Left = 1
      Top = 1
      Width = 390
      Height = 429
      Align = alClient
      TabOrder = 0
      object viewEsquerda: TcxGridDBTableView
        OnDblClick = viewEsquerdaDblClick
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsEsquerda
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
      end
      object levelGrid1Level1: TcxGridLevel
        GridView = viewEsquerda
      end
    end
    object pnBotoes: TPanel
      Left = 391
      Top = 1
      Width = 41
      Height = 429
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object btnAdd: TButton
        Left = 0
        Top = 0
        Width = 41
        Height = 33
        Action = Ac_Add
        Align = alTop
        TabOrder = 0
      end
      object btnAddTodos: TButton
        Left = 0
        Top = 33
        Width = 41
        Height = 33
        Action = Ac_AddTodos
        Align = alTop
        TabOrder = 1
      end
      object btnRemover: TButton
        Left = 0
        Top = 66
        Width = 41
        Height = 33
        Action = Ac_Remover
        Align = alTop
        TabOrder = 2
      end
      object btnRemoverTodos: TButton
        Left = 0
        Top = 99
        Width = 41
        Height = 33
        Action = Ac_RemoverTodos
        Align = alTop
        TabOrder = 3
      end
    end
    object cxGrid2: TcxGrid
      Left = 432
      Top = 1
      Width = 399
      Height = 429
      Align = alClient
      TabOrder = 2
      object viewDireita: TcxGridDBTableView
        OnDblClick = viewDireitaDblClick
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsDireita
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
      end
      object level1: TcxGridLevel
        GridView = viewDireita
      end
    end
  end
  object pnLabels: TPanel
    Left = 0
    Top = 0
    Width = 832
    Height = 19
    Align = alTop
    TabOrder = 1
    object gpLabels: TGridPanel
      Left = 1
      Top = 1
      Width = 830
      Height = 17
      Align = alClient
      ColumnCollection = <
        item
          Value = 47.000000000000000000
        end
        item
          Value = 5.000000000000000000
        end
        item
          Value = 48.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = lbInfoGridEsquerda
          Row = 0
        end
        item
          Column = 2
          Control = lbInfoGridDireita
          Row = 0
        end>
      RowCollection = <
        item
          Value = 100.000000000000000000
        end>
      TabOrder = 0
      object lbInfoGridEsquerda: TLabel
        Left = 1
        Top = 1
        Width = 83
        Height = 15
        Align = alLeft
        Caption = 'Info da Esquerda'
        ExplicitHeight = 13
      end
      object lbInfoGridDireita: TLabel
        Left = 431
        Top = 1
        Width = 69
        Height = 15
        Align = alLeft
        Caption = 'Info da Direita'
        ExplicitHeight = 13
      end
    end
  end
  object dsEsquerda: TDataSource
    Left = 232
    Top = 208
  end
  object dsDireita: TDataSource
    Left = 560
    Top = 264
  end
  object ActionList1: TActionList
    Left = 216
    Top = 72
    object Ac_Add: TAction
      Caption = '>'
      OnExecute = Ac_AddExecute
      OnUpdate = Ac_AddUpdate
    end
    object Ac_AddTodos: TAction
      Caption = '>>'
      OnExecute = Ac_AddTodosExecute
      OnUpdate = Ac_AddUpdate
    end
    object Ac_Remover: TAction
      Caption = '<'
      OnExecute = Ac_RemoverExecute
      OnUpdate = Ac_RemoverUpdate
    end
    object Ac_RemoverTodos: TAction
      Caption = '<<'
      OnExecute = Ac_RemoverTodosExecute
      OnUpdate = Ac_RemoverUpdate
    end
  end
end
