inherited dmLookup: TdmLookup
  OldCreateOrder = True
  Height = 905
  Width = 1015
  object Repositorio: TcxEditRepository
    Left = 48
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
          Width = 150
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
          FieldName = 'RAZAO_SOCIAL'
        end
        item
          FieldName = 'NOME_FANTASIA'
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
      Properties.ListOptions.SyncMode = True
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
      Properties.ListOptions.SyncMode = True
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
      Properties.ListOptions.SyncMode = True
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
          Description = 'Boleto'
          Value = 7
        end
        item
          Description = 'Outro'
          Value = 8
        end>
    end
    object repLcbFornecedor: TcxEditRepositoryLookupComboBoxItem
      Properties.CaseSensitiveSearch = True
      Properties.ClearKey = 46
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          Width = 200
          FieldName = 'RAZAO_SOCIAL'
        end
        item
          Width = 200
          FieldName = 'NOME_FANTASIA'
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
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          Width = 150
          FieldName = 'RAZAO_SOCIAL'
        end
        item
          Width = 150
          FieldName = 'NOME_FANTASIA'
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
        end
        item
          FieldName = 'SALDO'
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
          Width = 250
          FieldName = 'NOME'
        end
        item
          Width = 150
          FieldName = 'SALDO_REAL'
        end>
      Properties.ListOptions.SyncMode = True
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
      Properties.ListOptions.SyncMode = True
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
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.DropDownWidth = 400
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          Width = 250
          FieldName = 'NOME'
        end
        item
          Width = 200
          FieldName = 'SALDO'
        end
        item
          Width = 200
          FieldName = 'ORGANIZACAO'
        end>
      Properties.ListSource = dslkFundo
    end
    object repLcbProjetoOrganizacao: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID_ORGANIZACAO'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dslkProjeto_Organizcao
    end
    object repIcbTipoSaida: TcxEditRepositoryImageComboBoxItem
      Properties.ClearKey = 46
      Properties.ImmediatePost = True
      Properties.Items = <
        item
          Description = 'Venda'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Consumo'
          Value = 1
        end
        item
          Description = 'Perda'
          Value = 2
        end
        item
          Description = 'Plantio'
          Value = 3
        end
        item
          Description = 'Outro'
          Value = 4
        end>
    end
    object repLcbLoteSemente: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end
        item
          FieldName = 'QTDE_ARMAZENADA'
        end>
      Properties.ListSource = dslkLote_Semente
    end
    object repLcbLoteMuda: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          Width = 150
          FieldName = 'NOME'
        end
        item
          Width = 100
          FieldName = 'SALDO'
        end
        item
          RepositoryItem = repIcbStatusMudas
          Width = 150
          FieldName = 'STATUS'
        end>
      Properties.ListSource = dslkLote_Muda
    end
    object repLcbLocalUso: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          Width = 150
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkLocal_Uso
    end
    object repIcbStatusMudas: TcxEditRepositoryImageComboBoxItem
      Properties.ImmediatePost = True
      Properties.Items = <
        item
          Description = 'Em Desenvolvimento'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Prontas para Plantio'
          Value = 1
        end>
    end
    object repCalcInteiro: TcxEditRepositoryCalcItem
      Properties.DisplayFormat = ',0'
      Properties.ImmediatePost = True
    end
    object repIcbMeses: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Janeiro'
          ImageIndex = 0
          Value = 1
        end
        item
          Description = 'Fevereiro'
          Value = 2
        end
        item
          Description = 'Mar'#231'o'
          Value = 3
        end
        item
          Description = 'Abril'
          Value = 4
        end
        item
          Description = 'Maio'
          Value = 5
        end
        item
          Description = 'Junho'
          Value = 6
        end
        item
          Description = 'Julho'
          Value = 7
        end
        item
          Description = 'Agosto'
          Value = 8
        end
        item
          Description = 'Setembro'
          Value = 9
        end
        item
          Description = 'Outubro'
          Value = 10
        end
        item
          Description = 'Novembro'
          Value = 11
        end
        item
          Description = 'Dezembro'
          Value = 12
        end>
    end
    object repLcbFamiliaBotanica: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          Width = 150
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkFamilia_Botanica
    end
    object repIcbTipoNotificacao: TcxEditRepositoryImageComboBoxItem
      Properties.ImmediatePost = True
      Properties.Items = <
        item
          Description = 'Conta a Pagar Vencendo/Vencida'
          ImageIndex = 0
          Value = 1
        end
        item
          Description = 'Conta a Receber N'#227'o Recebida'
          Value = 2
        end
        item
          Description = 'Rubrica atingindo limite de saldo'
          Value = 3
        end
        item
          Description = 'Fundo atingindo limite'
          Value = 4
        end
        item
          Description = 'Atividade cadastrada'
          Value = 5
        end
        item
          Description = 'Atividade vencendo prazo de execu'#231#227'o'
          Value = 6
        end>
    end
    object RepChkNaoSim: TcxEditRepositoryCheckBoxItem
      Properties.ImmediatePost = True
      Properties.NullStyle = nssUnchecked
      Properties.ValueChecked = 1
      Properties.ValueUnchecked = 0
    end
    object repLcbCamaraFria: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          Width = 200
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkCamara_Fria
    end
    object repLcbItemPatrimonio: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkItem_Patrimonio
    end
    object repLcbArea_Atuacao: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = dslkArea_Atuacao
    end
    object repLcbArea_Execucao: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkArea_Execucao
    end
    object repIcbClassificacaoEspecie: TcxEditRepositoryImageComboBoxItem
      Properties.ClearKey = 46
      Properties.Items = <
        item
          Description = 'Pioneira'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Secund'#225'ria'
          Value = 1
        end
        item
          Description = 'Cl'#237'max'
          Value = 2
        end>
    end
    object repCheckGroupBiomas: TcxEditRepositoryCheckGroupItem
      Properties.Columns = 7
      Properties.Items = <
        item
          Caption = 'Amaz'#244'nia'
        end
        item
          Caption = 'Cerrado'
          Tag = 1
        end
        item
          Caption = 'Mata Atl'#226'ntica'
          Tag = 2
        end
        item
          Caption = 'Caatinga'
          Tag = 3
        end
        item
          Caption = 'Pampa'
          Tag = 4
        end
        item
          Caption = 'Pantanal'
          Tag = 5
        end
        item
          Caption = 'Ex'#243'tico'
          Tag = 6
        end>
    end
    object repCcbBiomas: TcxEditRepositoryCheckComboBox
      Properties.EditValueFormat = cvfIndices
      Properties.Items = <
        item
          Description = 'Amaz'#244'nia'
        end
        item
          Description = 'Cerrado'
          Tag = 1
        end
        item
          Description = 'Mata Atl'#226'ntica'
          Tag = 2
        end
        item
          Description = 'Caatinga'
          Tag = 3
        end
        item
          Description = 'Pampa'
          Tag = 4
        end
        item
          Description = 'Pantanal'
          Tag = 5
        end
        item
          Description = 'Ex'#243'tica'
          Tag = 6
        end>
    end
    object repIcbCategoriaArmazenamento: TcxEditRepositoryImageComboBoxItem
      Properties.ClearKey = 46
      Properties.Items = <
        item
          Description = 'Ortodoxa'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Recalcitrante'
          Value = 1
        end
        item
          Description = 'Intermedi'#225'ria'
          Value = 2
        end>
    end
    object repLcbTipoEspecie: TcxEditRepositoryLookupComboBoxItem
      Properties.ClearKey = 46
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          Width = 200
          FieldName = 'NOME'
        end>
      Properties.ListSource = dslkTipo_Especie
    end
  end
  object dslkPerfil: TDataSource
    DataSet = cdslkPerfil
    Left = 48
    Top = 232
  end
  object cdslkPessoa: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkPessoa'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 352
    Top = 448
    object cdslkPessoaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
    end
    object cdslkPessoaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object dslkPessoa: TDataSource
    DataSet = cdslkPessoa
    Left = 936
    Top = 124
  end
  object cdslkOrganizacao: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkOrganizacao'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 548
    Top = 408
    object cdslkOrganizacaoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkOrganizacaoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdslkOrganizacaoCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      Size = 14
    end
    object cdslkOrganizacaoLOGO: TBlobField
      DisplayLabel = 'Logo'
      FieldName = 'LOGO'
      Origin = 'LOGO'
      ProviderFlags = []
    end
    object cdslkOrganizacaoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      ProviderFlags = []
      Size = 100
    end
    object cdslkOrganizacaoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      ProviderFlags = []
    end
    object cdslkOrganizacaoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      ProviderFlags = []
      Size = 100
    end
    object cdslkOrganizacaoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      ProviderFlags = []
    end
    object cdslkOrganizacaoSITE: TStringField
      FieldName = 'SITE'
      Origin = 'SITE'
      ProviderFlags = []
      Size = 100
    end
    object cdslkOrganizacaoEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      ProviderFlags = []
      Size = 100
    end
    object cdslkOrganizacaoCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 120
    end
    object cdslkOrganizacaoLOGO_SECUNDARIA: TBlobField
      FieldName = 'LOGO_SECUNDARIA'
      ProviderFlags = []
    end
  end
  object cdslkFinanciador: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkFinanciador'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 648
    Top = 448
    object cdslkFinanciadorID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdslkFinanciadorNOME_FANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'NOME_FANTASIA'
      Size = 100
    end
    object cdslkFinanciadorRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO_SOCIAL'
      Required = True
      Size = 100
    end
  end
  object dslkOrganizacao: TDataSource
    DataSet = cdslkOrganizacao
    Left = 640
    Top = 232
  end
  object dslkFinanciador: TDataSource
    DataSet = cdslkFinanciador
    Left = 788
    Top = 232
  end
  object cdslkBanco: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkBanco'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 944
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
    Left = 56
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
    Left = 492
    Top = 124
  end
  object dslkConta_Corrente: TDataSource
    DataSet = cdslkConta_Corrente
    Left = 492
    Top = 16
  end
  object cdslkConta_Corrente: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkConta_Corrente'
    RemoteServer = dmPrincipal.ProviderLookup
    OnCalcFields = cdslkConta_CorrenteCalcFields
    RFApplyAutomatico = False
    Left = 204
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
    Left = 796
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
    Left = 352
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
    Left = 344
    Top = 16
  end
  object dslkProjeto: TDataSource
    DataSet = cdslkProjeto
    Left = 788
    Top = 16
  end
  object cdslkEspecie: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkEspecie'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 484
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
    object cdslkEspecieQTDE_SEMENTE_ESTOQUE: TBCDField
      DisplayLabel = 'Qtde. de Semente em Estoque'
      FieldName = 'QTDE_SEMENTE_ESTOQUE'
      Precision = 18
      Size = 2
    end
    object cdslkEspecieQTDE_MUDA_PRONTA: TIntegerField
      DisplayLabel = 'Qtde. de Mudas Prontas'
      FieldName = 'QTDE_MUDA_PRONTA'
    end
    object cdslkEspecieQTDE_MUDA_DESENVOLVIMENTO: TIntegerField
      DisplayLabel = 'Qtde. de Mudas em Desenvolvimento'
      FieldName = 'QTDE_MUDA_DESENVOLVIMENTO'
    end
    object cdslkEspecieQTDE_SEMENTE_TUBETE: TIntegerField
      DisplayLabel = 'Qtde. de Semente por Tubete'
      FieldName = 'QTDE_SEMENTE_TUBETE'
      ProviderFlags = []
    end
    object cdslkEspeciePESO_MEDIO_SEMENTE: TBCDField
      FieldName = 'PESO_MEDIO_SEMENTE'
      ProviderFlags = []
      Precision = 18
    end
  end
  object dslkEspecie: TDataSource
    DataSet = cdslkEspecie
    Left = 344
    Top = 124
  end
  object cdslkMatriz: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkMatriz'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 648
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
    Left = 48
    Top = 124
  end
  object cdslkCanteiro: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkCanteiro'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 944
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
    Left = 196
    Top = 16
  end
  object cdslkPerfil: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkPerfil'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 64
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
    Left = 204
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
    Left = 344
    Top = 232
  end
  object cdslkRubrica: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkRubrica'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 796
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
    Left = 492
    Top = 232
  end
  object cdslkFornecedor: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkFornecedor'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 936
    Top = 232
    object cdslkFornecedorID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdslkFornecedorNOME_FANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'NOME_FANTASIA'
      ProviderFlags = []
      Size = 100
    end
    object cdslkFornecedorRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO_SOCIAL'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object dslkFornecedor: TDataSource
    DataSet = cdslkFornecedor
    Left = 936
    Top = 16
  end
  object cdslkFin_For_Cli: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkFin_For_Cli'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 500
    Top = 340
    object cdslkFin_For_CliID: TIntegerField
      FieldName = 'ID'
    end
    object cdslkFin_For_CliNOME_FANTASIA: TStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'NOME_FANTASIA'
      ProviderFlags = []
      Size = 100
    end
    object cdslkFin_For_CliRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'RAZAO_SOCIAL'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object dslkFin_For_Cli: TDataSource
    DataSet = cdslkFin_For_Cli
    Left = 196
    Top = 124
  end
  object cdslkItem: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkItem'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 648
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
    object cdslkItemSALDO: TBCDField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
      Precision = 18
      Size = 2
    end
  end
  object dslkItem: TDataSource
    DataSet = cdslkItem
    Left = 640
    Top = 16
  end
  object cdslkRubrica_Atividade: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkRubrica_Atividade'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 352
    Top = 340
    object cdslkRubrica_AtividadeID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkRubrica_AtividadeNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 123
    end
    object cdslkRubrica_AtividadeSALDO_REAL: TFMTBCDField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO_REAL'
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 6
    end
  end
  object cdslkProjeto_Area: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkProjeto_Area'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 56
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
    Left = 204
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
    Left = 788
    Top = 124
  end
  object dslkProjeto_Area: TDataSource
    DataSet = cdslkProjeto_Area
    Left = 640
    Top = 124
  end
  object dslkProjeto_Area_Atividade: TDataSource
    DataSet = cdslkProjeto_Area_Atividade
    Left = 196
    Top = 232
  end
  object cdslkCompra: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkCompra'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 792
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
    Left = 512
    Top = 648
  end
  object cdslkFundo: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkFundo'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 928
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
      currency = True
      Precision = 18
      Size = 2
    end
    object cdslkFundoORGANIZACAO: TStringField
      DisplayLabel = 'Organiza'#231#227'o'
      FieldName = 'ORGANIZACAO'
      ProviderFlags = []
      Size = 100
    end
    object cdslkFundoID_ORGANIZACAO: TIntegerField
      DisplayLabel = 'Id da Organiza'#231#227'o'
      FieldName = 'ID_ORGANIZACAO'
      Required = True
    end
  end
  object dslkFundo: TDataSource
    DataSet = cdslkFundo
    Left = 648
    Top = 656
  end
  object cdslkAtividade_Alocada: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkAtividade'
    RemoteServer = dmPrincipal.ProviderLookup
    RFApplyAutomatico = False
    Left = 232
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
    Left = 80
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
    Left = 364
    Top = 628
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
  object cdslkProjeto_Organizacao: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkProjeto_Organizacao'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 784
    Top = 640
    object cdslkProjeto_OrganizacaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
    end
    object cdslkProjeto_OrganizacaoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdslkProjeto_OrganizacaoID_ORGANIZACAO: TIntegerField
      FieldName = 'ID_ORGANIZACAO'
      ProviderFlags = []
      Required = True
    end
  end
  object dslkProjeto_Organizcao: TDataSource
    DataSet = cdslkProjeto_Organizacao
    Left = 928
    Top = 648
  end
  object cdslkLote_Semente: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkLote_Semente'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 392
    Top = 698
    object cdslkLote_SementeID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkLote_SementeNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 30
    end
    object cdslkLote_SementeQTDE_ARMAZENADA: TBCDField
      DisplayLabel = 'Qtde. Em Estoque'
      FieldName = 'QTDE_ARMAZENADA'
      ProviderFlags = []
      DisplayFormat = ',0.00 Kg'
      Precision = 18
      Size = 2
    end
    object cdslkLote_SementeID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      ProviderFlags = []
      Required = True
    end
  end
  object cdslkLote_Muda: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkLote_Muda'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 520
    Top = 706
    object cdslkLote_MudaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdslkLote_MudaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object cdslkLote_MudaSALDO: TIntegerField
      DisplayLabel = 'Qtde. Em Estoque'
      FieldName = 'SALDO'
    end
    object cdslkLote_MudaID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      ProviderFlags = []
      Required = True
    end
    object cdslkLote_MudaSTATUS: TSmallintField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = []
      Required = True
    end
  end
  object dslkLote_Semente: TDataSource
    DataSet = cdslkLote_Semente
    Left = 776
    Top = 704
  end
  object dslkLote_Muda: TDataSource
    DataSet = cdslkLote_Muda
    Left = 664
    Top = 704
  end
  object cdslkProjeto_Rubrica: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkProjeto_Rubrica'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 912
    Top = 704
    object cdslkProjeto_RubricaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkProjeto_RubricaORCAMENTO: TBCDField
      DisplayLabel = 'Or'#231'amento'
      FieldName = 'ORCAMENTO'
      ProviderFlags = []
      Required = True
      Precision = 18
      Size = 2
    end
    object cdslkProjeto_RubricaSALDO_REAL: TFMTBCDField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO_REAL'
      ProviderFlags = []
      Precision = 18
      Size = 6
    end
    object cdslkProjeto_RubricaNOME_RUBRICA: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME_RUBRICA'
      ProviderFlags = []
      Size = 123
    end
  end
  object cdslkLocal_Uso: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkLocal_Uso'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 88
    Top = 776
    object cdslkLocal_UsoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdslkLocal_UsoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object dslkLocal_Uso: TDataSource
    DataSet = cdslkLocal_Uso
    Left = 192
    Top = 784
  end
  object cdslkFamilia_Botanica: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkFamilia_Botanica'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 576
    Top = 504
    object cdslkFamilia_BotanicaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkFamilia_BotanicaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object dslkFamilia_Botanica: TDataSource
    DataSet = cdslkFamilia_Botanica
    Left = 568
    Top = 568
  end
  object cdslkCamara_Fria: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkCamara_Fria'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 312
    Top = 784
    object cdslkCamara_FriaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
    end
    object cdslkCamara_FriaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object dslkCamara_Fria: TDataSource
    DataSet = cdslkCamara_Fria
    Left = 440
    Top = 792
  end
  object cdslkAgenda: TRFClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_PESSOA'
        ParamType = ptInput
      end>
    ProviderName = 'dspqlkAgenda'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 536
    Top = 776
    object cdslkAgendaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkAgendaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdslkAgendaTIPO: TSmallintField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ProviderFlags = []
      Required = True
    end
  end
  object cdslkAgenda_Pessoa: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_AGENDA'
    MasterFields = 'ID'
    MasterSource = dslkAgenda
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqlkAgenda_Pessoa'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 640
    Top = 792
    object cdslkAgenda_PessoaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkAgenda_PessoaID_AGENDA: TIntegerField
      FieldName = 'ID_AGENDA'
      ProviderFlags = []
      Required = True
    end
    object cdslkAgenda_PessoaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      ProviderFlags = []
      Required = True
    end
    object cdslkAgenda_PessoaSOMENTE_VISUALIZACAO: TSmallintField
      FieldName = 'SOMENTE_VISUALIZACAO'
      ProviderFlags = []
      Required = True
    end
  end
  object dslkAgenda: TDataSource
    DataSet = cdslkAgenda
    Left = 536
    Top = 840
  end
  object cdslkItem_Patrimonio: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkItem_Patrimonio'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 784
    Top = 792
    object cdslkItem_PatrimonioID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkItem_PatrimonioNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdslkItem_PatrimonioATIVO: TSmallintField
      FieldName = 'ATIVO'
      ProviderFlags = []
      Required = True
    end
    object cdslkItem_PatrimonioTAXA_DEPRECIACAO_ANUAL: TIntegerField
      FieldName = 'TAXA_DEPRECIACAO_ANUAL'
      ProviderFlags = []
    end
  end
  object dslkItem_Patrimonio: TDataSource
    DataSet = cdslkItem_Patrimonio
    Left = 320
    Top = 400
  end
  object cdslkDoador: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkDoador'
    RemoteServer = dmPrincipal.ProviderLookup
    BeforeApplyUpdates = cdslkDoadorBeforeApplyUpdates
    RFApplyAutomatico = False
    Left = 864
    Top = 600
    object cdslkDoadorID_PESSOA_DOADORA: TIntegerField
      DisplayLabel = 'Id do Doador'
      FieldName = 'ID_PESSOA_DOADORA'
      Required = True
    end
    object cdslkDoadorNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 100
    end
    object cdslkDoadorTOTAL: TBCDField
      DisplayLabel = 'Total j'#225' doado'
      FieldName = 'TOTAL'
      Precision = 18
      Size = 2
    end
  end
  object cdslkArea_Atuacao_Projeto: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkArea_Atuacao_Projeto'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 568
    Top = 280
    object cdslkArea_Atuacao_ProjetoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkArea_Atuacao_ProjetoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdslkArea_Atuacao_ProjetoID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object cdslkArea_Execucao: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_AREA_ATUACAO'
    MasterFields = 'ID'
    MasterSource = dslkArea_Atuacao_Projeto
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_AREA_ATUACAO'
        ParamType = ptInput
      end>
    ProviderName = 'dspqlkArea_Execucao'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 360
    Top = 296
    object cdslkArea_ExecucaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkArea_ExecucaoID_AREA_ATUACAO: TIntegerField
      DisplayLabel = 'Id da '#193'rea de Atua'#231#227'o'
      FieldName = 'ID_AREA_ATUACAO'
      ProviderFlags = []
      Required = True
    end
    object cdslkArea_ExecucaoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object dslkArea_Atuacao: TDataSource
    DataSet = cdslkArea_Atuacao
    Left = 416
    Top = 504
  end
  object dslkArea_Execucao: TDataSource
    DataSet = cdslkArea_Execucao
    Left = 432
    Top = 400
  end
  object cdslkArea_Atuacao: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkArea_Atuacao'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 224
    Top = 736
    object cdslkArea_AtuacaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkArea_AtuacaoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object dslkArea_Atuacao_Projeto: TDataSource
    DataSet = cdslkArea_Atuacao_Projeto
    Left = 696
    Top = 288
  end
  object cdslkTipo_Especie: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqlkTipo_Especie'
    RemoteServer = dmPrincipal.ProviderLookup
    Left = 496
    Top = 496
    object cdslkTipo_EspecieID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
    end
    object cdslkTipo_EspecieNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object dslkTipo_Especie: TDataSource
    DataSet = cdslkTipo_Especie
    Left = 488
    Top = 440
  end
end
