inherited dmAdministrativo: TdmAdministrativo
  OldCreateOrder = True
  Height = 463
  Width = 1026
  object cdsPerfil: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqPerfil'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 484
    Top = 240
    object cdsPerfilID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPerfilNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsPerfilDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object cdsPerfilTIPO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cdsPerfil_Permissao: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_PERFIL'
    MasterFields = 'ID'
    MasterSource = dsPerfil
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PERFIL'
        ParamType = ptInput
      end>
    ProviderName = 'dspqPerfil_Permissao'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    RFApplyAutomatico = False
    Left = 632
    Top = 240
    object cdsPerfil_PermissaoID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPerfil_PermissaoID_PERFIL: TIntegerField
      DisplayLabel = 'Perfil'
      FieldName = 'ID_PERFIL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsPerfil_PermissaoPERMISSAO: TStringField
      DisplayLabel = 'Permiss'#227'o'
      FieldName = 'PERMISSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsPerfil_PermissaoVISUALIZAR: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Visualizar'
      FieldName = 'VISUALIZAR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPerfil_PermissaoINCLUIR: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Incluir'
      FieldName = 'INCLUIR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPerfil_PermissaoALTERAR: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Alterar'
      FieldName = 'ALTERAR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPerfil_PermissaoEXCLUIR: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Excluir'
      FieldName = 'EXCLUIR'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsPerfil: TDataSource
    DataSet = cdsPerfil
    Left = 780
    Top = 24
  end
  object cdsPessoa: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqPessoa'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 336
    Top = 240
    object cdsPessoaID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Required = True
    end
    object cdsPessoaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsPessoaRG: TStringField
      FieldName = 'RG'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsPessoaCPF: TStringField
      FieldName = 'CPF'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPessoaENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsPessoaLOGIN: TStringField
      DisplayLabel = 'Login'
      FieldName = 'LOGIN'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsPessoaSENHA: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'SENHA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsPessoaBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsPessoaCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsPessoaEMAIL: TStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsPessoaCELULAR: TStringField
      DisplayLabel = 'Celular'
      FieldName = 'CELULAR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPessoaTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPessoaATIVO: TSmallintField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPessoaTIPO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo de V'#237'nculo'
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPessoaID_CIDADE: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Cidade'
      FieldName = 'ID_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPessoaCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      ProviderFlags = []
      Size = 120
    end
    object cdsPessoaDATA_NASCIMENTO: TDateField
      DisplayLabel = 'Data de Nascimento'
      FieldName = 'DATA_NASCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPessoaOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object cdsPessoaCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
  end
  object cdsPessoa_Perfil: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_PESSOA'
    MasterFields = 'ID'
    MasterSource = dsPessoa
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqPessoa_Perfil'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    RFApplyAutomatico = False
    Left = 40
    Top = 240
    object cdsPessoa_PerfilID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Required = True
    end
    object cdsPessoa_PerfilID_PESSOA: TIntegerField
      DisplayLabel = 'Pessoa'
      FieldName = 'ID_PESSOA'
      Required = True
    end
    object cdsPessoa_PerfilID_PERFIL: TIntegerField
      DisplayLabel = 'Perfil'
      FieldName = 'ID_PERFIL'
      Required = True
    end
  end
  object dsPessoa: TDataSource
    DataSet = cdsPessoa
    Left = 336
    Top = 24
  end
  object cdsOrganizacao: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqOrganizacao'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 188
    Top = 240
    object cdsOrganizacaoID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOrganizacaoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsOrganizacaoCNPJ: TStringField
      FieldName = 'CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object cdsOrganizacaoINSCRICAO_ESTADUAL: TStringField
      DisplayLabel = 'Inscri'#231#227'o estadual'
      FieldName = 'INSCRICAO_ESTADUAL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrganizacaoENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsOrganizacaoBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrganizacaoCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsOrganizacaoTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrganizacaoID_CIDADE: TIntegerField
      DisplayLabel = 'Cidade'
      FieldName = 'ID_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrganizacaoCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      ProviderFlags = []
      Size = 120
    end
    object cdsOrganizacaoLOGO: TBlobField
      FieldName = 'LOGO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrganizacaoSITE: TStringField
      DisplayLabel = 'Site'
      FieldName = 'SITE'
      Size = 100
    end
    object cdsOrganizacaoEMAIL: TStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'EMAIL'
      Size = 100
    end
  end
  object cdsOrganizacao_Pessoa: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_ORGANIZACAO'
    MasterFields = 'ID'
    MasterSource = dsOrganizacao
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqOrganizacao_Pessoa'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 332
    Top = 348
    object cdsOrganizacao_PessoaID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Required = True
    end
    object cdsOrganizacao_PessoaID_PESSOA: TIntegerField
      DisplayLabel = 'Pessoa'
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsOrganizacao_PessoaID_ORGANIZACAO: TIntegerField
      DisplayLabel = 'Organiza'#231#227'o'
      FieldName = 'ID_ORGANIZACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsOrganizacao_PessoaFUNCAO: TStringField
      DisplayLabel = 'Fun'#231#227'o'
      FieldName = 'FUNCAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsOrganizacao_PessoaOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
  end
  object dsOrganizacao: TDataSource
    DataSet = cdsOrganizacao
    Left = 40
    Top = 24
  end
  object cdsProjeto: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqProjeto'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 192
    Top = 348
    object cdsProjetoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProjetoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsProjetoDATA_INICIO: TDateField
      DisplayLabel = 'Data do In'#237'cio'
      FieldName = 'DATA_INICIO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProjetoDATA_TERMINO: TDateField
      DisplayLabel = 'Data do T'#233'rmino'
      FieldName = 'DATA_TERMINO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProjetoORCAMENTO: TBCDField
      Alignment = taLeftJustify
      DisplayLabel = 'Or'#231'amento'
      FieldName = 'ORCAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsProjetoID_BANCO_CONTA_CORRENTE: TIntegerField
      DisplayLabel = 'Conta Corrente'
      FieldName = 'ID_BANCO_CONTA_CORRENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsProjetoSTATUS: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsProjetoDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
  end
  object cdsProjeto_Pessoa: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_PROJETO'
    MasterFields = 'ID'
    MasterSource = dsProjeto
    PacketRecords = 0
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_PROJETO'
        ParamType = ptInput
      end>
    ProviderName = 'dspqProjeto_Pessoa'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 40
    Top = 348
    object cdsProjeto_PessoaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsProjeto_PessoaID_PROJETO: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Projeto'
      FieldName = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsProjeto_PessoaID_PESSOA: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Pessoa'
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsProjeto_PessoaFUNCAO: TStringField
      DisplayLabel = 'Fun'#231#227'o'
      FieldName = 'FUNCAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
  end
  object cdsProjeto_Organizacao: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_PROJETO'
    MasterFields = 'ID'
    MasterSource = dsProjeto
    PacketRecords = 0
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_PROJETO'
        ParamType = ptInput
      end>
    ProviderName = 'dspqProjeto_Organizacao'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 780
    Top = 240
    object cdsProjeto_OrganizacaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProjeto_OrganizacaoID_PROJETO: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Projeto'
      FieldName = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsProjeto_OrganizacaoID_ORGANIZACAO: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Organiza'#231#227'o'
      FieldName = 'ID_ORGANIZACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object cdsProjeto_Financiador: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_PROJETO'
    MasterFields = 'ID'
    MasterSource = dsProjeto
    PacketRecords = 0
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_PROJETO'
        ParamType = ptInput
      end>
    ProviderName = 'dspqProjeto_Financiador'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 928
    Top = 240
    object cdsProjeto_FinanciadorID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProjeto_FinanciadorID_PROJETO: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Projeto'
      FieldName = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsProjeto_FinanciadorID_FINANCIADOR: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Financiador'
      FieldName = 'ID_FINANCIADOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsProjeto_FinanciadorOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object cdsProjeto_FinanciadorVALOR_FINANCIADO: TBCDField
      DisplayLabel = 'Valor a Financiar'
      FieldName = 'VALOR_FINANCIADO'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object cdsProjeto_Documento: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_PROJETO'
    MasterFields = 'ID'
    MasterSource = dsProjeto
    PacketRecords = 0
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_PROJETO'
        ParamType = ptInput
      end>
    ProviderName = 'dspqProjeto_Documento'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 928
    Top = 132
    object cdsProjeto_DocumentoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProjeto_DocumentoID_PROJETO: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Projeto'
      FieldName = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsProjeto_DocumentoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsProjeto_DocumentoDATA_UPLOAD: TSQLTimeStampField
      DisplayLabel = 'Data de Upload'
      FieldName = 'DATA_UPLOAD'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsProjeto_DocumentoDOCUMENTO: TBlobField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsProjeto_DocumentoNOME_ORIGINAL: TStringField
      DisplayLabel = 'Nome do Arquivo'
      FieldName = 'NOME_ORIGINAL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object dsProjeto: TDataSource
    DataSet = cdsProjeto
    Left = 632
    Top = 24
  end
  object cdsProjeto_Financiador_Pagto: TRFClientDataSet
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_PROJETO_FINANCIADOR'
        DataType = ftInteger
      end
      item
        Name = 'ID_PROJETO_ORGANIZACAO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'VALOR'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'DATA'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'PERCENTUAL'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'NOME_ORGANIZACAO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'FORMA_PAGTO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'ORDER_BY_ID_PROJETO_FINANCIADOR'
        Fields = 'ID_PROJETO_FINANCIADOR'
        GroupingLevel = 1
      end>
    IndexName = 'ORDER_BY_ID_PROJETO_FINANCIADOR'
    MasterFields = 'ID'
    MasterSource = dsProjeto_Financiador
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PROJETO_FINANCIADOR'
        ParamType = ptInput
      end>
    ProviderName = 'dspqProjeto_Financiador_Pagto'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    StoreDefs = True
    RFApplyAutomatico = False
    Left = 840
    Top = 372
    object cdsProjeto_Financiador_PagtoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProjeto_Financiador_PagtoID_PROJETO_FINANCIADOR: TIntegerField
      FieldName = 'ID_PROJETO_FINANCIADOR'
      ProviderFlags = [pfInUpdate]
    end
    object cdsProjeto_Financiador_PagtoVALOR: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsProjeto_Financiador_PagtoDATA: TDateField
      DisplayLabel = 'Data do Pagamento'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsProjeto_Financiador_PagtoPERCENTUAL: TBCDField
      DisplayLabel = 'Percentual'
      FieldName = 'PERCENTUAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsProjeto_Financiador_PagtoID_PROJETO_ORGANIZACAO: TIntegerField
      FieldName = 'ID_PROJETO_ORGANIZACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsProjeto_Financiador_PagtoNOME_ORGANIZACAO: TStringField
      DisplayLabel = 'Organiza'#231#227'o'
      FieldName = 'NOME_ORGANIZACAO'
      ProviderFlags = []
      Size = 100
    end
    object cdsProjeto_Financiador_PagtoFORMA_PAGTO: TSmallintField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMA_PAGTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsProjeto_Financiador_PagtoTOTAL: TAggregateField
      DisplayLabel = 'Total Financiado'
      FieldName = 'TOTAL'
      Active = True
      DisplayName = ''
      Expression = 'SUM(VALOR)'
      GroupingLevel = 1
      IndexName = 'ORDER_BY_ID_PROJETO_FINANCIADOR'
    end
  end
  object dsProjeto_Financiador: TDataSource
    DataSet = cdsProjeto_Financiador
    Left = 188
    Top = 24
  end
  object cdsAtividade: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqAtividade'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 928
    Top = 24
    object cdsAtividadeID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAtividadeNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsAtividadeID_SOLICITANTE: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Solicitante'
      FieldName = 'ID_SOLICITANTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAtividadeID_RESPONSAVEL: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Respons'#225'vel'
      FieldName = 'ID_RESPONSAVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAtividadeSTATUS: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAtividadeDATA_INICIAL: TSQLTimeStampField
      DisplayLabel = 'Data Inicial'
      FieldName = 'DATA_INICIAL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAtividadeDATA_FINAL: TSQLTimeStampField
      DisplayLabel = 'Data Final'
      FieldName = 'DATA_FINAL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAtividadeID_PROJETO: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Id do Projeto'
      FieldName = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAtividadeNOME_PROJETO: TStringField
      DisplayLabel = 'Projeto'
      FieldName = 'NOME_PROJETO'
      Size = 100
    end
    object cdsAtividadeDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object cdsAtividadeDATA_CADASTRO: TSQLTimeStampField
      DisplayLabel = 'Data de Cadastro'
      FieldName = 'DATA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAtividadeDATA_ALTERACAO: TSQLTimeStampField
      DisplayLabel = 'Data da '#218'ltima Altera'#231#227'o'
      FieldName = 'DATA_ALTERACAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAtividadeDATA_FINALIZACAO: TSQLTimeStampField
      FieldName = 'DATA_FINALIZACAO'
    end
  end
  object cdsAtividade_Projeto: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_ATIVIDADE'
    MasterFields = 'ID'
    MasterSource = dsAtividade
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqAtividade_Projeto'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 632
    Top = 132
    object cdsAtividade_ProjetoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAtividade_ProjetoID_ATIVIDADE: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Atividade'
      FieldName = 'ID_ATIVIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAtividade_ProjetoID_PROJETO: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Id do Projeto'
      FieldName = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAtividade_ProjetoNOME_PROJETO: TStringField
      DisplayLabel = 'Nome do Projeto'
      FieldName = 'NOME_PROJETO'
      ProviderFlags = []
      Size = 100
    end
    object cdsAtividade_ProjetoOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
  end
  object cdsAtividade_Pessoa: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_ATIVIDADE'
    MasterFields = 'ID'
    MasterSource = dsAtividade
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqAtividade_Pessoa'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 780
    Top = 132
    object cdsAtividade_PessoaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAtividade_PessoaID_ATIVIDADE: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Atividade'
      FieldName = 'ID_ATIVIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAtividade_PessoaID_PESSOA: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Id da Pessoa'
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAtividade_PessoaFUNCAO: TStringField
      DisplayLabel = 'Fun'#231#227'o'
      FieldName = 'FUNCAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object cdsAtividade_PessoaNOME_PESSOA: TStringField
      DisplayLabel = 'Pessoa Envolvida'
      FieldName = 'NOME_PESSOA'
      ProviderFlags = []
      Size = 100
    end
    object cdsAtividade_PessoaNOME_ATIVIDADE: TStringField
      DisplayLabel = 'Atividade'
      FieldName = 'NOME_ATIVIDADE'
      ProviderFlags = []
      Size = 100
    end
  end
  object cdsAtividade_Arquivo: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_ATIVIDADE'
    MasterFields = 'ID'
    MasterSource = dsAtividade
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqAtividade_Arquivo'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 484
    Top = 132
    object cdsAtividade_ArquivoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAtividade_ArquivoID_ATIVIDADE: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Atividade'
      FieldName = 'ID_ATIVIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAtividade_ArquivoARQUIVO: TBlobField
      DisplayLabel = 'Arquivo'
      FieldName = 'ARQUIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAtividade_ArquivoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsAtividade_ArquivoNOME_ORIGINAL: TStringField
      DisplayLabel = 'Nome do Arquivo Original'
      FieldName = 'NOME_ORIGINAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsAtividade_ArquivoDATA_UPLOAD: TSQLTimeStampField
      DisplayLabel = 'Data de Upload'
      FieldName = 'DATA_UPLOAD'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAtividade_ArquivoDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
  end
  object cdsAtividade_Vinculo: TRFClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_ATIVIDADE_ORIGEM'
        ParamType = ptInput
      end>
    ProviderName = 'dspqAtividade_Vinculo'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 188
    Top = 132
    object cdsAtividade_VinculoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsAtividade_VinculoTIPO_VINCULO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo de v'#237'nculo'
      FieldName = 'TIPO_VINCULO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAtividade_VinculoID_ATIVIDADE_ORIGEM: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Id da Atividade de Origem'
      FieldName = 'ID_ATIVIDADE_ORIGEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAtividade_VinculoID_ATIVIDADE_VINCULO: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Id da Atividade Vinculada'
      FieldName = 'ID_ATIVIDADE_VINCULO'
      Required = True
    end
    object cdsAtividade_VinculoNOME_ATIVIDADE_ORIGEM: TStringField
      DisplayLabel = 'Atividade'
      FieldName = 'NOME_ATIVIDADE_ORIGEM'
      Size = 100
    end
    object cdsAtividade_VinculoNOME_ATIVIDADE_VINCULO: TStringField
      DisplayLabel = 'Atividade Vinculada'
      FieldName = 'NOME_ATIVIDADE_VINCULO'
      Size = 100
    end
    object cdsAtividade_VinculoOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
  end
  object cdsAtividade_Comentario: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_ATIVIDADE'
    MasterFields = 'ID'
    MasterSource = dsAtividade
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_ATIVIDADE'
        ParamType = ptInput
      end>
    ProviderName = 'dspqAtividade_Comentario'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 336
    Top = 132
    object cdsAtividade_ComentarioID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAtividade_ComentarioID_ATIVIDADE: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Atividade'
      FieldName = 'ID_ATIVIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAtividade_ComentarioID_PESSOA: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Pessoa'
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAtividade_ComentarioDATA_HORA: TSQLTimeStampField
      DisplayLabel = 'Data e Hora do Coment'#225'rio'
      FieldName = 'DATA_HORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsAtividade_ComentarioCOMENTARIO: TStringField
      DisplayLabel = 'Coment'#225'rio'
      FieldName = 'COMENTARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1000
    end
  end
  object dsAtividade: TDataSource
    DataSet = cdsAtividade
    Left = 484
    Top = 24
  end
  object cdsProjeto_Rubrica: TRFClientDataSet
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_PROJETO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_RUBRICA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ORCAMENTO'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'NOME_RUBRICA'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'GASTO'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'RECEBIDO'
        DataType = ftBCD
        Precision = 18
        Size = 4
      end
      item
        Name = 'APROVISIONADO'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'SALDO_REAL'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'SALDO_PREVISTO'
        DataType = ftFMTBcd
        Precision = 18
        Size = 6
      end
      item
        Name = 'GASTO_TRANSFERENCIA'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'RECEBIDO_TRANSFERENCIA'
        Attributes = [faReadonly]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'CALC_VALOR_GASTO'
        Attributes = [faReadonly]
        DataType = ftBCD
        Precision = 18
        Size = 6
      end
      item
        Name = 'CALC_VALOR_RECEBIDO'
        Attributes = [faReadonly]
        DataType = ftBCD
        Precision = 18
        Size = 6
      end>
    IndexDefs = <
      item
        Name = 'ORDER_BY_ID_PROJETO'
        Fields = 'ID_PROJETO'
        GroupingLevel = 1
      end>
    IndexName = 'ORDER_BY_ID_PROJETO'
    MasterFields = 'ID'
    MasterSource = dsProjeto
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqProjeto_Rubrica'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    StoreDefs = True
    RFApplyAutomatico = False
    Left = 480
    Top = 344
    object cdsProjeto_RubricaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProjeto_RubricaID_PROJETO: TIntegerField
      DisplayLabel = 'Id do Projeto'
      FieldName = 'ID_PROJETO'
      Origin = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsProjeto_RubricaID_RUBRICA: TIntegerField
      DisplayLabel = 'Id da Rubrica'
      FieldName = 'ID_RUBRICA'
      Origin = 'ID_RUBRICA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsProjeto_RubricaORCAMENTO: TBCDField
      DisplayLabel = 'Or'#231'amento'
      FieldName = 'ORCAMENTO'
      Origin = 'ORCAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsProjeto_RubricaNOME_RUBRICA: TStringField
      DisplayLabel = 'Rubrica'
      FieldName = 'NOME_RUBRICA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object cdsProjeto_RubricaGASTO: TFMTBCDField
      DisplayLabel = 'Valor Gasto'
      FieldName = 'GASTO'
      Origin = 'GASTO'
      ProviderFlags = []
      currency = True
      Precision = 18
      Size = 6
    end
    object cdsProjeto_RubricaRECEBIDO: TBCDField
      DisplayLabel = 'Valor Recebido'
      FieldName = 'RECEBIDO'
      Origin = 'RECEBIDO'
      ProviderFlags = []
      currency = True
      Precision = 18
    end
    object cdsProjeto_RubricaAPROVISIONADO: TFMTBCDField
      DisplayLabel = 'Valor Aprovisionado'
      FieldName = 'APROVISIONADO'
      Origin = 'APROVISIONADO'
      ProviderFlags = []
      currency = True
      Precision = 18
      Size = 6
    end
    object cdsProjeto_RubricaSALDO_REAL: TFMTBCDField
      DisplayLabel = 'Saldo Real'
      FieldName = 'SALDO_REAL'
      ProviderFlags = []
      currency = True
      Precision = 18
      Size = 6
    end
    object cdsProjeto_RubricaSALDO_PREVISTO: TFMTBCDField
      DisplayLabel = 'Saldo Previsto'
      FieldName = 'SALDO_PREVISTO'
      ProviderFlags = []
      currency = True
      Precision = 18
      Size = 6
    end
    object cdsProjeto_RubricaGASTO_TRANSFERENCIA: TBCDField
      DisplayLabel = 'Valor Transferido'
      FieldName = 'GASTO_TRANSFERENCIA'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object cdsProjeto_RubricaRECEBIDO_TRANSFERENCIA: TBCDField
      DisplayLabel = 'Recebido por Transfer'#234'ncia'
      FieldName = 'RECEBIDO_TRANSFERENCIA'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object cdsProjeto_RubricaCALC_VALOR_GASTO: TBCDField
      DisplayLabel = 'Valor Gasto'
      FieldName = 'CALC_VALOR_GASTO'
      ProviderFlags = []
      Precision = 18
      Size = 6
    end
    object cdsProjeto_RubricaCALC_VALOR_RECEBIDO: TBCDField
      DisplayLabel = 'Valor Recebido'
      FieldName = 'CALC_VALOR_RECEBIDO'
      ProviderFlags = []
      Precision = 18
      Size = 6
    end
    object cdsProjeto_RubricaAGG_SOMA_ORCAMENTO: TAggregateField
      DisplayLabel = 'Soma dos or'#231'amentos'
      FieldName = 'AGG_SOMA_ORCAMENTO'
      Active = True
      DisplayName = ''
      Expression = 'SUM(ORCAMENTO)'
      GroupingLevel = 1
      IndexName = 'ORDER_BY_ID_PROJETO'
    end
  end
  object cdsProjeto_Area: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_PROJETO'
    MasterFields = 'ID'
    MasterSource = dsProjeto
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqProjeto_Area'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 608
    Top = 352
    object cdsProjeto_AreaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProjeto_AreaID_PROJETO: TIntegerField
      DisplayLabel = 'Id do Projeto'
      FieldName = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsProjeto_AreaID_AREA_ATUACAO: TIntegerField
      DisplayLabel = 'Id da '#193'rea de Atua'#231#227'o'
      FieldName = 'ID_AREA_ATUACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsProjeto_AreaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object cdsFundo: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_ORGANIZACAO'
    MasterFields = 'ID'
    MasterSource = dsOrganizacao
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqFundo'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 688
    Top = 400
    object cdsFundoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFundoID_ORGANIZACAO: TIntegerField
      DisplayLabel = 'Id da Organiza'#231#227'o'
      FieldName = 'ID_ORGANIZACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsFundoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsFundoSALDO: TBCDField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsFundoDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object cdsFundoREQUER_AUTORIZACAO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Autoriza'#231#227'o Especial para Uso'
      FieldName = 'REQUER_AUTORIZACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cdsArea_Atuacao: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqArea_Atuacao'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 168
    Top = 408
    object cdsArea_AtuacaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsArea_AtuacaoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object cdsArea_Execucao: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_AREA_ATUACAO'
    MasterFields = 'ID'
    MasterSource = dsArea_Atuacao
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_AREA_ATUACAO'
        ParamType = ptInput
      end>
    ProviderName = 'dspqArea_Execucao'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 40
    Top = 407
    object cdsArea_ExecucaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsArea_ExecucaoID_AREA_ATUACAO: TIntegerField
      DisplayLabel = 'Id da '#193'rea de Atua'#231#227'o'
      FieldName = 'ID_AREA_ATUACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsArea_ExecucaoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object dsArea_Atuacao: TDataSource
    DataSet = cdsArea_Atuacao
    Left = 48
    Top = 112
  end
end
