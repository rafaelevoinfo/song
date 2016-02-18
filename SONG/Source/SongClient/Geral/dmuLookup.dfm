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
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkPerfil
    end
    object repLcbPessoa: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkPessoa
    end
    object repIcbTipoPerfil: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Normal'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Administrador'
          Value = 1
        end>
    end
    object repIcbSituacaoProjeto: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Em elabora'#231#227'o'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Aguardando financiador'
          Value = 1
        end
        item
          Description = 'Recusado'
          Value = 2
        end
        item
          Description = 'Em execu'#231#227'o'
          Value = 3
        end
        item
          Description = 'Executado'
          Value = 4
        end
        item
          Description = 'Cancelado'
          Value = 5
        end>
    end
    object repLcbOrganizacao: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkOrganizacao
    end
    object repLcbFinanciador: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkFinanciador
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
  object cdslkPessoa: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkPessoa'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 248
    Top = 216
    object cdslkPessoaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdslkPessoaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
  end
  object dslkPessoa: TDataSource
    DataSet = cdslkPessoa
    Left = 344
    Top = 224
  end
  object cdslkOrganizacao: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkOrganizacao'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 112
    Top = 104
    object cdslkOrganizacaoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdslkOrganizacaoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
  end
  object cdslkFinanciador: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkFinanciador'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 112
    Top = 184
    object cdslkFinanciadorID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdslkFinanciadorNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
  end
  object dslkOrganizacao: TDataSource
    DataSet = cdslkOrganizacao
    Left = 112
    Top = 56
  end
  object dslkFinanciador: TDataSource
    DataSet = cdslkFinanciador
    Left = 40
    Top = 192
  end
end
