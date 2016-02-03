inherited dmLookup: TdmLookup
  OldCreateOrder = True
  Height = 325
  Width = 523
  object Repositorio: TcxEditRepository
    Left = 256
    Top = 32
    object RepIcbNaoSim: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'N'#227'o'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Sim'
          Value = 1
        end>
    end
    object repLcbPerfil: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkPerfil
    end
  end
  object cdslkPerfil: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkPerfil'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 248
    Top = 144
    object cdslkPerfilID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      ProviderFlags = []
    end
    object cdslkPerfilNOME: TStringField
      DisplayLabel = 'Perfil'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object dslkPerfil: TDataSource
    DataSet = cdslkPerfil
    Left = 352
    Top = 144
  end
end
