inherited dmLookup: TdmLookup
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 755
  Width = 1015
  object Repositorio: TcxEditRepository
    Left = 16
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
    object repLcbRubrica: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkRubrica
    end
    object repIcbFormaPagamento: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Transfer'#234'ncia Banc'#225'ria'
          ImageIndex = 0
          Value = 1
        end
        item
          Description = 'D'#233'bito em Conta'
          Value = 2
        end
        item
          Description = 'Cart'#227'o de Cr'#233'dito'
          Value = 3
        end
        item
          Description = 'Cart'#227'o de D'#233'bito'
          Value = 4
        end
        item
          Description = 'Cheque'
          Value = 5
        end
        item
          Description = 'Dinheiro'
          Value = 6
        end
        item
          Description = 'Outro'
          Value = 7
        end>
    end
    object repLcbFornecedor: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkFornecedor
    end
    object repIcbStatusContaPagar: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Em Aberto'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Quitada'
          Value = 1
        end>
    end
    object repIcbStatusContaReceber: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Em Aberto'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Recebida'
          Value = 1
        end>
    end
    object repDateDataPadrao: TcxEditRepositoryDateItem
      Properties.ClearKey = 46
      Properties.DateButtons = [btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
    end
    object repLcbFinForCli: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkFin_For_Cli
    end
    object repIcbTipoItem: TcxEditRepositoryImageComboBoxItem
      Properties.ClearKey = 46
      Properties.Items = <
        item
          Description = 'Outro'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Semente'
          Value = 1
        end
        item
          Description = 'Muda'
          Value = 2
        end>
    end
    object repLcbItem: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dslkItem
    end
    object repLcbRubricaAtividade: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkRubrica_Atividade
    end
    object repLcbProjetoArea: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkProjeto_Area
    end
    object repLcbProjeto_Area_Atividade: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkProjeto_Area_Atividade
    end
    object repIcbStatusSolicitacaoCompra: TcxEditRepositoryImageComboBoxItem
      Properties.ClearKey = 46
      Properties.Items = <
        item
          Description = 'Solicitada'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Aprovada'
          Value = 1
        end
        item
          Description = 'Negada'
          Value = 2
        end>
    end
    object repIcbStatusEntrega: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'A caminho'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Entregue'
          Value = 1
        end>
    end
    object repLcbCompra: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME_FANTASIA'
        end
        item
          FieldName = 'DATA'
        end>
      Properties.ListSource = dslkCompra
    end
    object repLcbFundo: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkFundo
    end
  end
  object dslkPerfil: TDataSource
    DataSet = cdslkPerfil
    Left = 16
    Top = 232
  end
  object cdslkPessoa: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkPessoa'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 312
    Top = 448
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
    Left = 904
    Top = 124
  end
  object cdslkOrganizacao: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkOrganizacao'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 460
    Top = 448
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
    Left = 608
    Top = 448
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
    Left = 608
    Top = 232
  end
  object dslkFinanciador: TDataSource
    DataSet = cdslkFinanciador
    Left = 756
    Top = 232
  end
  object cdslkBanco: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkBanco'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 904
    Top = 340
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
    Left = 16
    Top = 448
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
    Left = 460
    Top = 124
  end
  object dslkConta_Corrente: TDataSource
    DataSet = cdslkConta_Corrente
    Left = 460
    Top = 16
  end
  object cdslkConta_Corrente: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkConta_Corrente'
    RemoteServer = dmPrincipal.ProviderLookup
    OnCalcFields = cdslkConta_CorrenteCalcFields
    RFApplyAutomatico = False
    Left = 164
    Top = 448
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
    Left = 756
    Top = 448
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
    Left = 312
    Top = 556
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
    Left = 312
    Top = 16
  end
  object dslkProjeto: TDataSource
    DataSet = cdslkProjeto
    Left = 756
    Top = 16
  end
  object cdslkEspecie: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkEspecie'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 460
    Top = 556
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
    Left = 312
    Top = 124
  end
  object cdslkMatriz: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkMatriz'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 608
    Top = 556
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
    Left = 16
    Top = 124
  end
  object cdslkCanteiro: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkCanteiro'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 904
    Top = 448
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
    Left = 164
    Top = 16
  end
  object cdslkPerfil: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkPerfil'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 24
    Top = 564
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
    Left = 164
    Top = 556
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
    Left = 312
    Top = 232
  end
  object cdslkRubrica: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkRubrica'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 756
    Top = 340
    object cdslkRubricaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
    end
    object cdslkRubricaID_RUBRICA_PAI: TIntegerField
      FieldName = 'ID_RUBRICA_PAI'
      ProviderFlags = []
    end
    object cdslkRubricaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 123
    end
  end
  object dslkRubrica: TDataSource
    DataSet = cdslkRubrica
    Left = 460
    Top = 232
  end
  object cdslkFornecedor: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkFornecedor'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 904
    Top = 232
    object cdslkFornecedorID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdslkFornecedorNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
  end
  object dslkFornecedor: TDataSource
    DataSet = cdslkFornecedor
    Left = 904
    Top = 16
  end
  object cdslkFin_For_Cli: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkFin_For_Cli'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 460
    Top = 340
    object cdslkFin_For_CliID: TIntegerField
      FieldName = 'ID'
    end
    object cdslkFin_For_CliNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 100
    end
  end
  object dslkFin_For_Cli: TDataSource
    DataSet = cdslkFin_For_Cli
    Left = 164
    Top = 124
  end
  object cdslkItem: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkItem'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 608
    Top = 340
    object cdslkItemID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
    end
    object cdslkItemNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdslkItemTIPO: TSmallintField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
    end
    object cdslkItemUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Required = True
      Size = 10
    end
  end
  object dslkItem: TDataSource
    DataSet = cdslkItem
    Left = 608
    Top = 16
  end
  object cdslkRubrica_Atividade: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkRubrica_Atividade'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 312
    Top = 340
    object cdslkRubrica_AtividadeID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkRubrica_AtividadeID_RUBRICA_PAI: TIntegerField
      FieldName = 'ID_RUBRICA_PAI'
      ProviderFlags = []
    end
    object cdslkRubrica_AtividadeNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 123
    end
  end
  object cdslkProjeto_Area: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkProjeto_Area'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 16
    Top = 340
    object cdslkProjeto_AreaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
    end
    object cdslkProjeto_AreaID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      ProviderFlags = []
    end
    object cdslkProjeto_AreaNOME: TStringField
      DisplayLabel = #193'rea'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object cdslkProjeto_Area_Atividade: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkProjeto_Area_Atividade'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 164
    Top = 340
    object cdslkProjeto_Area_AtividadeID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
    end
    object cdslkProjeto_Area_AtividadeID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      ProviderFlags = []
    end
    object cdslkProjeto_Area_AtividadeNOME: TStringField
      DisplayLabel = #193'rea'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object dslkRubrica_Atividade: TDataSource
    DataSet = cdslkRubrica_Atividade
    Left = 756
    Top = 124
  end
  object dslkProjeto_Area: TDataSource
    DataSet = cdslkProjeto_Area
    Left = 608
    Top = 124
  end
  object dslkProjeto_Area_Atividade: TDataSource
    DataSet = cdslkProjeto_Area_Atividade
    Left = 164
    Top = 232
  end
  object cdslkCompra: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkCompra'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 752
    Top = 544
    object cdslkCompraID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkCompraID_FORNECEDOR: TIntegerField
      DisplayLabel = 'Id do Fornecedor'
      FieldName = 'ID_FORNECEDOR'
      ProviderFlags = []
      Required = True
    end
    object cdslkCompraDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      ProviderFlags = []
      Required = True
    end
    object cdslkCompraNOME_FANTASIA: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOME_FANTASIA'
      ProviderFlags = []
      Size = 100
    end
  end
  object dslkCompra: TDataSource
    DataSet = cdslkCompra
    Left = 472
    Top = 648
  end
  object cdslkFundo: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkFundo'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 888
    Top = 544
    object cdslkFundoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkFundoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdslkFundoSALDO: TBCDField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
      ProviderFlags = []
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object dslkFundo: TDataSource
    DataSet = cdslkFundo
    Left = 608
    Top = 656
  end
  object cdslkAtividade_Alocada: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkAtividade'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 192
    Top = 660
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object StringField1: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object SmallintField1: TSmallintField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = []
      Required = True
    end
  end
  object cdslkRubrica_Atividade_Alocada: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkRubrica_Atividade'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 40
    Top = 652
    object IntegerField2: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'ID_RUBRICA_PAI'
      ProviderFlags = []
    end
    object StringField2: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 123
    end
  end
  object cdslkProjeto_Area_Atividade_Alocada: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkProjeto_Area_Atividade'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 316
    Top = 652
    object IntegerField4: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
    end
    object IntegerField5: TIntegerField
      FieldName = 'ID_PROJETO'
      ProviderFlags = []
    end
    object StringField3: TStringField
      DisplayLabel = #193'rea'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
end
