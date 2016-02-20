inherited smAdministrativo: TsmAdministrativo
  OldCreateOrder = True
  Height = 364
  Width = 593
  object qPessoa: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select PESSOA.ID,'
      '       PESSOA.NOME,'
      '       PESSOA.EMAIL,'
      '       PESSOA.CELULAR,'
      '       PESSOA.TELEFONE,'
      '       PESSOA.RG,'
      '       PESSOA.CPF,'
      '       PESSOA.ENDERECO,'
      '       PESSOA.BAIRRO,'
      '       PESSOA.COMPLEMENTO,'
      '       PESSOA.CIDADE,'
      '       PESSOA.LOGIN,'
      '       PESSOA.SENHA,'
      '       PESSOA.ATIVO'
      'from PESSOA'
      '&WHERE')
    Left = 40
    Top = 32
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qPessoaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qPessoaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qPessoaRG: TStringField
      FieldName = 'RG'
      Origin = 'RG'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qPessoaCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      ProviderFlags = [pfInUpdate]
    end
    object qPessoaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qPessoaLOGIN: TStringField
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qPessoaSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qPessoaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 30
    end
    object qPessoaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 100
    end
    object qPessoaEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qPessoaCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      ProviderFlags = [pfInUpdate]
    end
    object qPessoaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
    end
    object qPessoaATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      ProviderFlags = [pfInUpdate]
    end
    object qPessoaCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qPerfil: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select PERFIL.ID,'
      '       PERFIL.NOME,'
      '       PERFIL.DESCRICAO,'
      '       PERFIL.TIPO'
      'from PERFIL'
      '&WHERE')
    Left = 40
    Top = 96
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qPerfilID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qPerfilNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qPerfilDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object qPerfilTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qPerfil_Permissao: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select PERFIL_PERMISSAO.ID,'
      '       PERFIL_PERMISSAO.ID_PERFIL,'
      '       PERFIL_PERMISSAO.PERMISSAO,'
      '       PERFIL_PERMISSAO.VISUALIZAR,'
      '       PERFIL_PERMISSAO.INCLUIR,'
      '       PERFIL_PERMISSAO.ALTERAR,'
      '       PERFIL_PERMISSAO.EXCLUIR'
      'from PERFIL_PERMISSAO'
      'where PERFIL_PERMISSAO.ID_PERFIL = :ID_PERFIL')
    Left = 40
    Top = 160
    ParamData = <
      item
        Name = 'ID_PERFIL'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qPerfil_PermissaoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qPerfil_PermissaoID_PERFIL: TIntegerField
      FieldName = 'ID_PERFIL'
      Origin = 'ID_PERFIL'
      Required = True
    end
    object qPerfil_PermissaoPERMISSAO: TStringField
      FieldName = 'PERMISSAO'
      Origin = 'PERMISSAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qPerfil_PermissaoVISUALIZAR: TSmallintField
      FieldName = 'VISUALIZAR'
      Origin = 'VISUALIZAR'
      ProviderFlags = [pfInUpdate]
    end
    object qPerfil_PermissaoINCLUIR: TSmallintField
      FieldName = 'INCLUIR'
      Origin = 'INCLUIR'
      ProviderFlags = [pfInUpdate]
    end
    object qPerfil_PermissaoALTERAR: TSmallintField
      FieldName = 'ALTERAR'
      Origin = 'ALTERAR'
      ProviderFlags = [pfInUpdate]
    end
    object qPerfil_PermissaoEXCLUIR: TSmallintField
      FieldName = 'EXCLUIR'
      Origin = 'EXCLUIR'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qPessoa_Perfil: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select PESSOA_PERFIL.ID,'
      '       PESSOA_PERFIL.ID_PESSOA,'
      '       PESSOA_PERFIL.ID_PERFIL'
      'from PESSOA_PERFIL'
      'where PESSOA_PERFIL.ID_PESSOA = :ID_PESSOA')
    Left = 48
    Top = 232
    ParamData = <
      item
        Name = 'ID_PESSOA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qPessoa_PerfilID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qPessoa_PerfilID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Origin = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qPessoa_PerfilID_PERFIL: TIntegerField
      FieldName = 'ID_PERFIL'
      Origin = 'ID_PERFIL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qOrganizacao: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select ORGANIZACAO.ID,'
      '       ORGANIZACAO.NOME,'
      '       ORGANIZACAO.CNPJ,'
      '       ORGANIZACAO.INSCRICAO_ESTADUAL,'
      '       ORGANIZACAO.ENDERECO,'
      '       ORGANIZACAO.BAIRRO,'
      '       ORGANIZACAO.COMPLEMENTO,'
      '       ORGANIZACAO.CIDADE,'
      '       ORGANIZACAO.TELEFONE'
      'from ORGANIZACAO  '
      '&WHERE')
    Left = 128
    Top = 40
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qOrganizacaoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOrganizacaoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qOrganizacaoCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object qOrganizacaoINSCRICAO_ESTADUAL: TStringField
      FieldName = 'INSCRICAO_ESTADUAL'
      Origin = 'INSCRICAO_ESTADUAL'
      ProviderFlags = [pfInUpdate]
    end
    object qOrganizacaoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qOrganizacaoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object qOrganizacaoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qOrganizacaoCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object qOrganizacaoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qOrganizacao_Pessoa: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select ORGANIZACAO_PESSOA.ID,'
      '       ORGANIZACAO_PESSOA.ID_PESSOA,'
      '       ORGANIZACAO_PESSOA.ID_ORGANIZACAO,'
      '       ORGANIZACAO_PESSOA.FUNCAO,'
      '       ORGANIZACAO_PESSOA.OBSERVACAO'
      'from ORGANIZACAO_PESSOA  '
      'Where ORGANIZACAO_PESSOA.ID_ORGANIZACAO = :ID_ORGANIZACAO')
    Left = 120
    Top = 104
    ParamData = <
      item
        Name = 'ID_ORGANIZACAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qOrganizacao_PessoaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOrganizacao_PessoaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Origin = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qOrganizacao_PessoaID_ORGANIZACAO: TIntegerField
      FieldName = 'ID_ORGANIZACAO'
      Origin = 'ID_ORGANIZACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qOrganizacao_PessoaFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Origin = 'FUNCAO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qOrganizacao_PessoaOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
  end
  object qProjeto: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select PROJETO.ID,'
      '       PROJETO.NOME,'
      '       PROJETO.DATA_INICIO,'
      '       PROJETO.DATA_TERMINO,'
      '       PROJETO.SITUACAO,'
      '       PROJETO.DESCRICAO,'
      '       PROJETO.ORCAMENTO,'
      '       PROJETO.ID_BANCO_CONTA_CORRENTE'
      'from PROJETO  '
      '&WHERE')
    Left = 128
    Top = 240
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qProjetoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qProjetoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qProjetoDATA_INICIO: TDateField
      FieldName = 'DATA_INICIO'
      Origin = 'DATA_INICIO'
      ProviderFlags = [pfInUpdate]
    end
    object qProjetoDATA_TERMINO: TDateField
      FieldName = 'DATA_TERMINO'
      Origin = 'DATA_TERMINO'
      ProviderFlags = [pfInUpdate]
    end
    object qProjetoSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qProjetoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object qProjetoORCAMENTO: TBCDField
      FieldName = 'ORCAMENTO'
      Origin = 'ORCAMENTO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qProjetoID_BANCO_CONTA_CORRENTE: TIntegerField
      FieldName = 'ID_BANCO_CONTA_CORRENTE'
      Origin = 'ID_BANCO_CONTA_CORRENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qProjeto_Organizacao: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select PROJETO_ORGANIZACAO.ID,'
      '       PROJETO_ORGANIZACAO.ID_PROJETO,'
      '       PROJETO_ORGANIZACAO.ID_ORGANIZACAO'
      'from PROJETO_ORGANIZACAO  '
      'where PROJETO_ORGANIZACAO.ID_PROJETO = :ID_PROJETO')
    Left = 232
    Top = 48
    ParamData = <
      item
        Name = 'ID_PROJETO'
        ParamType = ptInput
      end>
    object qProjeto_OrganizacaoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qProjeto_OrganizacaoID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      Origin = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qProjeto_OrganizacaoID_ORGANIZACAO: TIntegerField
      FieldName = 'ID_ORGANIZACAO'
      Origin = 'ID_ORGANIZACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qProjeto_Financiador: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select PROJETO_FINANCIADOR.ID,'
      '       PROJETO_FINANCIADOR.ID_PROJETO,'
      '       PROJETO_FINANCIADOR.ID_FINANCIADOR,'
      '       PROJETO_FINANCIADOR.OBSERVACAO'
      'from PROJETO_FINANCIADOR  '
      'where PROJETO_FINANCIADOR.ID_PROJETO = :ID_PROJETO')
    Left = 232
    Top = 112
    ParamData = <
      item
        Name = 'ID_PROJETO'
        ParamType = ptInput
      end>
    object qProjeto_FinanciadorID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qProjeto_FinanciadorID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      Origin = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qProjeto_FinanciadorID_FINANCIADOR: TIntegerField
      FieldName = 'ID_FINANCIADOR'
      Origin = 'ID_FINANCIADOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qProjeto_FinanciadorOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
  end
  object qProjeto_Documento: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select PROJETO_DOCUMENTO.ID,'
      '       PROJETO_DOCUMENTO.ID_PROJETO,'
      '       PROJETO_DOCUMENTO.NOME,'
      '       PROJETO_DOCUMENTO.DATA_UPLOAD,'
      '       PROJETO_DOCUMENTO.DOCUMENTO'
      'from PROJETO_DOCUMENTO  '
      'where PROJETO_DOCUMENTO.ID_PROJETO = :ID_PROJETO')
    Left = 232
    Top = 176
    ParamData = <
      item
        Name = 'ID_PROJETO'
        ParamType = ptInput
      end>
    object qProjeto_DocumentoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qProjeto_DocumentoID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      Origin = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qProjeto_DocumentoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qProjeto_DocumentoDATA_UPLOAD: TSQLTimeStampField
      FieldName = 'DATA_UPLOAD'
      Origin = 'DATA_UPLOAD'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qProjeto_DocumentoDOCUMENTO: TBlobField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qProjeto_Pessoa: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select PROJETO_PESSOA.ID,'
      '       PROJETO_PESSOA.ID_PROJETO,'
      '       PROJETO_PESSOA.ID_PESSOA,'
      '       PROJETO_PESSOA.FUNCAO'
      'from PROJETO_PESSOA  '
      'where PROJETO_PESSOA.ID_PROJETO = :ID_PROJETO')
    Left = 232
    Top = 240
    ParamData = <
      item
        Name = 'ID_PROJETO'
        ParamType = ptInput
      end>
    object qProjeto_PessoaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qProjeto_PessoaID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      Origin = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qProjeto_PessoaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Origin = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qProjeto_PessoaFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Origin = 'FUNCAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 150
    end
  end
  object qProjeto_Financiador_Pagto: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select PROJETO_FINANCIADOR_PAGTO.ID,'
      '       PROJETO_FINANCIADOR_PAGTO.ID_PROJETO_FINANCIADOR,'
      '       PROJETO_FINANCIADOR_PAGTO.VALOR,'
      '       PROJETO_FINANCIADOR_PAGTO.DATA'
      'from PROJETO_FINANCIADOR_PAGTO'
      
        'where PROJETO_FINANCIADOR_PAGTO.ID_PROJETO_FINANCIADOR = :ID_PRO' +
        'JETO_FINANCIADOR  ')
    Left = 400
    Top = 48
    ParamData = <
      item
        Name = 'ID_PROJETO_FINANCIADOR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qProjeto_Financiador_PagtoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qProjeto_Financiador_PagtoID_PROJETO_FINANCIADOR: TIntegerField
      FieldName = 'ID_PROJETO_FINANCIADOR'
      Origin = 'ID_PROJETO_FINANCIADOR'
      ProviderFlags = [pfInUpdate]
    end
    object qProjeto_Financiador_PagtoVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qProjeto_Financiador_PagtoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
end
