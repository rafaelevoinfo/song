inherited dmAdministrativo: TdmAdministrativo
  OldCreateOrder = True
  Height = 463
  Width = 816
  object cdsPerfil: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqPerfil'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 448
    Top = 84
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
    Left = 64
    Top = 152
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
    Left = 576
    Top = 16
  end
  object cdsPessoa: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqPessoa'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 320
    Top = 152
    object cdsPessoaID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Required = True
    end
    object cdsPessoaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object cdsPessoaRG: TStringField
      FieldName = 'RG'
      Size = 30
    end
    object cdsPessoaCPF: TStringField
      FieldName = 'CPF'
    end
    object cdsPessoaENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Size = 100
    end
    object cdsPessoaLOGIN: TStringField
      DisplayLabel = 'Login'
      FieldName = 'LOGIN'
      Size = 100
    end
    object cdsPessoaSENHA: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'SENHA'
      Size = 100
    end
    object cdsPessoaBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsPessoaCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Size = 100
    end
    object cdsPessoaEMAIL: TStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Required = True
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
    object cdsPessoaCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPessoaTIPO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo de V'#237'nculo'
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
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
    Left = 448
    Top = 152
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
    Left = 192
    Top = 16
  end
  object cdsOrganizacao: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqOrganizacao'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 192
    Top = 152
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
    object cdsOrganizacaoCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOrganizacaoTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
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
    Left = 192
    Top = 220
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
      Size = 500
    end
  end
  object dsOrganizacao: TDataSource
    DataSet = cdsOrganizacao
    Left = 64
    Top = 16
  end
  object cdsProjeto: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqProjeto'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 64
    Top = 220
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
    object cdsProjetoDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object cdsProjetoORCAMENTO: TBCDField
      Alignment = taLeftJustify
      DisplayLabel = 'Or'#231'amento'
      FieldName = 'ORCAMENTO'
      ProviderFlags = [pfInUpdate]
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
    Left = 576
    Top = 152
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
    Left = 192
    Top = 84
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
    Left = 64
    Top = 84
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
      Size = 500
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
    Left = 320
    Top = 84
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
    Left = 448
    Top = 16
  end
  object cdsProjeto_Financiador_Pagto: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_PROJETO_FINANCIADOR'
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
    RFApplyAutomatico = False
    Left = 576
    Top = 84
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
  end
  object dsProjeto_Financiador: TDataSource
    DataSet = cdsProjeto_Financiador
    Left = 320
    Top = 16
  end
  object cdsAtividade: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqAtividade'
    RemoteServer = dmPrincipal.ProviderAdministrativo
    Left = 320
    Top = 216
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
    object cdsAtividadeNOTIFICAR_ENVOLVIDOS: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Notificar pessoas envolvidas'
      FieldName = 'NOTIFICAR_ENVOLVIDOS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAtividadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
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
    Left = 424
    Top = 216
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
    object cdsAtividade_ProjetoOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object cdsAtividade_ProjetoNOME_PROJETO: TStringField
      DisplayLabel = 'Nome do Projeto'
      FieldName = 'NOME_PROJETO'
      ProviderFlags = []
      Size = 100
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
    Left = 544
    Top = 232
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
      DisplayLabel = 'Pessoa'
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
    Left = 664
    Top = 232
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
    object cdsAtividade_ArquivoDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object cdsAtividade_ArquivoDATA_UPLOAD: TSQLTimeStampField
      DisplayLabel = 'Data de Upload'
      FieldName = 'DATA_UPLOAD'
      ProviderFlags = [pfInUpdate]
      Required = True
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
    Left = 64
    Top = 288
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
    object cdsAtividade_VinculoOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
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
    Left = 192
    Top = 296
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
    object cdsAtividade_ComentarioCOMENTARIO: TStringField
      DisplayLabel = 'Coment'#225'rio'
      FieldName = 'COMENTARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 500
    end
    object cdsAtividade_ComentarioDATA_HORA: TSQLTimeStampField
      DisplayLabel = 'Data e Hora do Coment'#225'rio'
      FieldName = 'DATA_HORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dsAtividade: TDataSource
    DataSet = cdsAtividade
    Left = 312
    Top = 280
  end
end
