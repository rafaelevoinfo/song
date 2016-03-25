inherited dmLookup: TdmLookup
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 455
  Width = 1015
  object Repositorio: TcxEditRepository
    Left = 188
    Top = 16
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
    object repIcbStatusProjeto: TcxEditRepositoryImageComboBoxItem
      Properties.ImmediatePost = True
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
    object repLcbContaCorrente: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'CALC_BANCO_CONTA'
        end>
      Properties.ListSource = dslkConta_Corrente
    end
    object repCurPadrao: TcxEditRepositoryCurrencyItem
      Properties.ClearKey = 46
      Properties.UseThousandSeparator = True
    end
    object repIcbTipoPessoa: TcxEditRepositoryImageComboBoxItem
      Properties.ClearKey = 46
      Properties.ImmediatePost = True
      Properties.Items = <
        item
          Description = 'Funcion'#225'rio'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Membro da Diretoria'
          ImageIndex = 0
          Value = 1
        end
        item
          Description = 'Cliente'
          Value = 2
        end
        item
          Description = 'Fornecedor'
          Value = 3
        end
        item
          Description = 'Financiador'
          Value = 4
        end
        item
          Description = 'Parceiro'
          Value = 5
        end
        item
          Description = 'Estagi'#225'rio'
          Value = 6
        end
        item
          Description = 'Volunt'#225'rio'
          Value = 7
        end
        item
          Description = 'Outro'
          Value = 8
        end>
    end
    object repIcbStatusAtividade: TcxEditRepositoryImageComboBoxItem
      Properties.ImmediatePost = True
      Properties.Items = <
        item
          Description = 'Programada'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Atrasada para iniciar'
          Value = 1
        end
        item
          Description = 'Em execu'#231#227'o'
          Value = 2
        end
        item
          Description = 'Atrasada'
          Value = 3
        end
        item
          Description = 'Finalizada'
          Value = 4
        end
        item
          Description = 'Cancelada'
          Value = 5
        end>
    end
    object repIcbTipoVinculo: TcxEditRepositoryImageComboBoxItem
      Properties.ImmediatePost = True
      Properties.Items = <
        item
          Description = 'Relacionada'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Depend'#234'ncia'
          Value = 1
        end>
    end
    object repLcbProjeto: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkProjeto
    end
    object repLcbAtividade: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkAtividade
    end
    object repLcbEspecie: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkEspecie
    end
    object repLcbMatriz: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkMatriz
    end
    object repCalcPadrao: TcxEditRepositoryCalcItem
      Properties.DisplayFormat = ',0.00'
    end
    object repLcbCanteiro: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkCanteiro
    end
    object repLcbPlano_Contas: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkPlano_Contas
    end
    object repIcbTipoPlanoConta: TcxEditRepositoryImageComboBoxItem
      Properties.ClearKey = 46
      Properties.ImmediatePost = True
      Properties.Items = <
        item
          Description = 'Despesa'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Receita'
          Value = 1
        end>
    end
  end
  object dslkPerfil: TDataSource
    DataSet = cdslkPerfil
    Left = 780
    Top = 124
  end
  object cdslkPessoa: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkPessoa'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 336
    Top = 232
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
    Left = 484
    Top = 124
  end
  object cdslkOrganizacao: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkOrganizacao'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 484
    Top = 232
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
    RFApplyAutomatico = False
    Left = 40
    Top = 340
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
    Left = 336
    Top = 124
  end
  object dslkFinanciador: TDataSource
    DataSet = cdslkFinanciador
    Left = 632
    Top = 124
  end
  object cdslkBanco: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkBanco'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 928
    Top = 232
    object cdslkBancoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkBancoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object cdslkBanco_Conta_Corrente: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_BANCO'
    MasterFields = 'ID'
    MasterSource = dslkBanco
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqlkBanco_Conta_Corrente'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 780
    Top = 232
    object cdslkBanco_Conta_CorrenteID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkBanco_Conta_CorrenteID_BANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'ID_BANCO'
      ProviderFlags = []
      Required = True
    end
    object cdslkBanco_Conta_CorrenteAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      ProviderFlags = []
      Required = True
      Size = 10
    end
    object cdslkBanco_Conta_CorrenteCONTA: TStringField
      DisplayLabel = 'Conta Corrente'
      FieldName = 'CONTA'
      ProviderFlags = []
      Required = True
    end
  end
  object dslkBanco: TDataSource
    DataSet = cdslkBanco
    Left = 632
    Top = 16
  end
  object dslkConta_Corrente: TDataSource
    DataSet = cdslkConta_Corrente
    Left = 484
    Top = 16
  end
  object cdslkConta_Corrente: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkConta_Corrente'
    RemoteServer = dmPrincipal.ProviderLookup
    OnCalcFields = cdslkConta_CorrenteCalcFields
    RFApplyAutomatico = False
    Left = 632
    Top = 232
    object cdslkConta_CorrenteID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkConta_CorrenteID_BANCO: TIntegerField
      DisplayLabel = 'Id do Banco'
      FieldName = 'ID_BANCO'
      ProviderFlags = []
      Required = True
    end
    object cdslkConta_CorrenteNOME: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdslkConta_CorrenteAGENCIA: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'AGENCIA'
      ProviderFlags = []
      Required = True
      Size = 10
    end
    object cdslkConta_CorrenteCONTA: TStringField
      DisplayLabel = 'Conta'
      FieldName = 'CONTA'
      ProviderFlags = []
      Required = True
    end
    object cdslkConta_CorrenteCALC_BANCO_CONTA: TStringField
      DisplayLabel = 'Banco/Conta'
      FieldKind = fkCalculated
      FieldName = 'CALC_BANCO_CONTA'
      Size = 150
      Calculated = True
    end
  end
  object cdslkProjeto: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspqlkProjeto'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 336
    Top = 340
    object cdslkProjetoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkProjetoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object cdslkAtividade: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkAtividade'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 188
    Top = 340
    object cdslkAtividadeID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkAtividadeNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdslkAtividadeSTATUS: TSmallintField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = []
      Required = True
    end
  end
  object dslkAtividade: TDataSource
    DataSet = cdslkAtividade
    Left = 336
    Top = 16
  end
  object dslkProjeto: TDataSource
    DataSet = cdslkProjeto
    Left = 780
    Top = 16
  end
  object cdslkEspecie: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkEspecie'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 928
    Top = 124
    object cdslkEspecieID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkEspecieNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdslkEspecieVALOR_MUDA: TBCDField
      FieldName = 'VALOR_MUDA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdslkEspecieVALOR_KG_SEMENTE: TBCDField
      FieldName = 'VALOR_KG_SEMENTE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdslkEspecieTEMPO_GERMINACAO: TIntegerField
      FieldName = 'TEMPO_GERMINACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dslkEspecie: TDataSource
    DataSet = cdslkEspecie
    Left = 188
    Top = 124
  end
  object cdslkMatriz: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkMatriz'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 40
    Top = 232
    object cdslkMatrizID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkMatrizNOME: TStringField
      DisplayLabel = 'Nome da Matriz'
      FieldName = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdslkMatrizID_ESPECIE: TIntegerField
      DisplayLabel = 'Id da Esp'#233'cie'
      FieldName = 'ID_ESPECIE'
      Required = True
    end
  end
  object dslkMatriz: TDataSource
    DataSet = cdslkMatriz
    Left = 40
    Top = 124
  end
  object cdslkCanteiro: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkCanteiro'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 188
    Top = 232
    object cdslkCanteiroID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkCanteiroNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object dslkCanteiro: TDataSource
    DataSet = cdslkCanteiro
    Left = 928
    Top = 16
  end
  object cdslkPerfil: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkPerfil'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 480
    Top = 336
    object cdslkPerfilID: TIntegerField
      FieldName = 'ID'
    end
    object cdslkPerfilNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 100
    end
  end
  object cdslkPlano_Contas: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkPlano_Contas'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 584
    Top = 336
    object cdslkPlano_ContasID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
    end
    object cdslkPlano_ContasID_CONTA_PAI: TIntegerField
      FieldName = 'ID_CONTA_PAI'
      ProviderFlags = []
    end
    object cdslkPlano_ContasTIPO: TSmallintField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ProviderFlags = []
    end
    object cdslkPlano_ContasNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 123
    end
  end
  object dslkPlano_Contas: TDataSource
    DataSet = cdslkPlano_Contas
    Left = 488
    Top = 208
  end
end
