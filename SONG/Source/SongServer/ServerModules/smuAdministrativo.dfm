inherited smAdministrativo: TsmAdministrativo
  OldCreateOrder = True
  Height = 416
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
      '       PESSOA.CEP,'
      '       PESSOA.COMPLEMENTO,'
      '       PESSOA.ID_CIDADE,'
      '       PESSOA.LOGIN,'
      '       PESSOA.SENHA,'
      '       PESSOA.ATIVO,'
      '       PESSOA.TIPO,'
      '       CIDADE.NOME AS CIDADE,'
      '       PESSOA.DATA_NASCIMENTO,'
      '       PESSOA.OBSERVACAO'
      'from PESSOA'
      'left join cidade on (cidade.id = pessoa.id_cidade)'
      '&WHERE')
    Left = 32
    Top = 16
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
    object qPessoaTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = [pfInUpdate]
    end
    object qPessoaID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Origin = 'ID_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object qPessoaCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 120
    end
    object qPessoaDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'DATA_NASCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object qPessoaOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object qPessoaCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      ProviderFlags = [pfInUpdate]
      Size = 60
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
    Left = 32
    Top = 80
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
    object qPerfilTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = [pfInUpdate]
    end
    object qPerfilDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
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
    Left = 32
    Top = 144
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
    Left = 32
    Top = 208
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
      '       cidade.nome as CIDADE,'
      '       ORGANIZACAO.TELEFONE,'
      '       ORGANIZACAO.ID_CIDADE,'
      '       ORGANIZACAO.LOGO,'
      '       organizacao.site,'
      '       organizacao.email,'
      '       organizacao.logo_secundaria'
      'from ORGANIZACAO  '
      'left join cidade on (cidade.id = organizacao.id_cidade)'
      '&WHERE')
    Left = 120
    Top = 16
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
    object qOrganizacaoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      ProviderFlags = [pfInUpdate]
    end
    object qOrganizacaoID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Origin = 'ID_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object qOrganizacaoCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 120
    end
    object qOrganizacaoLOGO: TBlobField
      FieldName = 'LOGO'
      Origin = 'LOGO'
      ProviderFlags = [pfInUpdate]
    end
    object qOrganizacaoSITE: TStringField
      FieldName = 'SITE'
      Origin = 'SITE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qOrganizacaoEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qOrganizacaoLOGO_SECUNDARIA: TBlobField
      FieldName = 'LOGO_SECUNDARIA'
      Origin = 'LOGO_SECUNDARIA'
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
    Top = 80
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
      Size = 1000
    end
  end
  object qProjeto: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select PROJETO.ID,'
      '       PROJETO.NOME,'
      '       PROJETO.DATA_INICIO,'
      '       PROJETO.DATA_TERMINO,'
      '       PROJETO.STATUS,'
      '       PROJETO.DESCRICAO,'
      '       PROJETO.ORCAMENTO,'
      '       PROJETO.ID_BANCO_CONTA_CORRENTE'
      'from PROJETO  '
      '&WHERE')
    Left = 120
    Top = 224
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
    object qProjetoORCAMENTO: TBCDField
      FieldName = 'ORCAMENTO'
      Origin = 'ORCAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qProjetoID_BANCO_CONTA_CORRENTE: TIntegerField
      FieldName = 'ID_BANCO_CONTA_CORRENTE'
      Origin = 'ID_BANCO_CONTA_CORRENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qProjetoSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qProjetoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
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
    Top = 16
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
      '       PROJETO_FINANCIADOR.VALOR_FINANCIADO,'
      '       PROJETO_FINANCIADOR.OBSERVACAO'
      'from PROJETO_FINANCIADOR  '
      'where PROJETO_FINANCIADOR.ID_PROJETO = :ID_PROJETO')
    Left = 232
    Top = 80
    ParamData = <
      item
        Name = 'ID_PROJETO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
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
      Size = 1000
    end
    object qProjeto_FinanciadorVALOR_FINANCIADO: TBCDField
      FieldName = 'VALOR_FINANCIADO'
      Origin = 'VALOR_FINANCIADO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object qProjeto_Documento: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select PROJETO_DOCUMENTO.ID,'
      '       PROJETO_DOCUMENTO.ID_PROJETO,'
      '       PROJETO_DOCUMENTO.NOME,'
      '       PROJETO_DOCUMENTO.DATA_UPLOAD,'
      '       PROJETO_DOCUMENTO.DOCUMENTO,'
      '       PROJETO_DOCUMENTO.NOME_ORIGINAL'
      'from PROJETO_DOCUMENTO  '
      'where PROJETO_DOCUMENTO.ID_PROJETO = :ID_PROJETO')
    Left = 224
    Top = 160
    ParamData = <
      item
        Name = 'ID_PROJETO'
        DataType = ftInteger
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
    object qProjeto_DocumentoNOME_ORIGINAL: TStringField
      FieldName = 'NOME_ORIGINAL'
      Origin = 'NOME_ORIGINAL'
      ProviderFlags = [pfInUpdate]
      Size = 100
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
    Left = 224
    Top = 224
    ParamData = <
      item
        Name = 'ID_PROJETO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
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
      Size = 50
    end
  end
  object qProjeto_Financiador_Pagto: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select PROJETO_FINANCIADOR_PAGTO.ID,'
      '       PROJETO_FINANCIADOR_PAGTO.ID_PROJETO_FINANCIADOR,'
      '       PROJETO_FINANCIADOR_PAGTO.ID_PROJETO_ORGANIZACAO,'
      '       Organizacao.nome as nome_organizacao,'
      '       PROJETO_FINANCIADOR_PAGTO.VALOR,'
      '       PROJETO_FINANCIADOR_PAGTO.DATA,'
      '       PROJETO_FINANCIADOR_PAGTO.FORMA_PAGTO,'
      '       PROJETO_FINANCIADOR_PAGTO.PERCENTUAL       '
      'from PROJETO_FINANCIADOR_PAGTO'
      
        'inner join projeto_organizacao on (projeto_organizacao.id = proj' +
        'eto_financiador_pagto.id_projeto_organizacao)'
      
        'inner join organizacao on (organizacao.id = projeto_organizacao.' +
        'id_organizacao)'
      
        'where PROJETO_FINANCIADOR_PAGTO.ID_PROJETO_FINANCIADOR = :ID_PRO' +
        'JETO_FINANCIADOR  ')
    Left = 360
    Top = 16
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
    object qProjeto_Financiador_PagtoID_PROJETO_ORGANIZACAO: TIntegerField
      FieldName = 'ID_PROJETO_ORGANIZACAO'
      Origin = 'ID_PROJETO_ORGANIZACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
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
    object qProjeto_Financiador_PagtoPERCENTUAL: TBCDField
      FieldName = 'PERCENTUAL'
      Origin = 'PERCENTUAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qProjeto_Financiador_PagtoNOME_ORGANIZACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_ORGANIZACAO'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qProjeto_Financiador_PagtoFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = 'FORMA_PAGTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qAtividade: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select DISTINCT ATIVIDADE.ID,'
      '       ATIVIDADE.NOME,'
      '       ATIVIDADE.ID_SOLICITANTE,'
      '       ATIVIDADE.ID_RESPONSAVEL,'
      '       ATIVIDADE.ID_PROJETO,'
      '       ATIVIDADE.STATUS,'
      '       ATIVIDADE.DATA_INICIAL,'
      '       ATIVIDADE.DATA_FINAL,'
      '       ATIVIDADE.DESCRICAO,'
      '       PROJETO.NOME AS NOME_PROJETO,'
      '       ATIVIDADE.DATA_CADASTRO,'
      '       ATIVIDADE.DATA_ALTERACAO,'
      '       ATIVIDADE.DATA_FINALIZACAO,'
      '       ATIVIDADE.ID_AREA_ATUACAO,'
      '       ATIVIDADE.ID_AREA_EXECUCAO,'
      '       AREA_ATUACAO.NOME AS AREA_ATUACAO,'
      '       AREA_EXECUCAO.NOME AS AREA_EXECUCAO,'
      '       Solicitante.nome as Nome_Solicitante,'
      '       Responsavel.nome as Nome_Responsavel'
      'from ATIVIDADE  '
      
        'left join atividade_projeto on (ATIVIDADE_PROJETO.ID_ATIVIDADE =' +
        ' ATIVIDADE.ID)'
      'left join projeto on (projeto.id = atividade.id_projeto)'
      
        'left join area_atuacao on (area_atuacao.id = atividade.id_area_a' +
        'tuacao)'
      
        'left join area_execucao on (area_execucao.id = atividade.id_area' +
        '_execucao)'
      
        'inner join pessoa solicitante on (solicitante.id = atividade.id_' +
        'solicitante)'
      
        'inner join pessoa Responsavel on (Responsavel.id = atividade.id_' +
        'Responsavel)'
      '&WHERE')
    Left = 360
    Top = 80
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qAtividadeID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qAtividadeNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qAtividadeID_SOLICITANTE: TIntegerField
      FieldName = 'ID_SOLICITANTE'
      Origin = 'ID_SOLICITANTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAtividadeID_RESPONSAVEL: TIntegerField
      FieldName = 'ID_RESPONSAVEL'
      Origin = 'ID_RESPONSAVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAtividadeSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAtividadeDATA_INICIAL: TSQLTimeStampField
      FieldName = 'DATA_INICIAL'
      Origin = 'DATA_INICIAL'
      ProviderFlags = [pfInUpdate]
    end
    object qAtividadeDATA_FINAL: TSQLTimeStampField
      FieldName = 'DATA_FINAL'
      Origin = 'DATA_FINAL'
      ProviderFlags = [pfInUpdate]
    end
    object qAtividadeID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      Origin = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object qAtividadeNOME_PROJETO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PROJETO'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qAtividadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object qAtividadeDATA_CADASTRO: TSQLTimeStampField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
      ProviderFlags = [pfInUpdate]
    end
    object qAtividadeDATA_ALTERACAO: TSQLTimeStampField
      FieldName = 'DATA_ALTERACAO'
      Origin = 'DATA_ALTERACAO'
      ProviderFlags = [pfInUpdate]
    end
    object qAtividadeDATA_FINALIZACAO: TSQLTimeStampField
      FieldName = 'DATA_FINALIZACAO'
      Origin = 'DATA_FINALIZACAO'
      ProviderFlags = [pfInUpdate]
    end
    object qAtividadeID_AREA_ATUACAO: TIntegerField
      FieldName = 'ID_AREA_ATUACAO'
      Origin = 'ID_AREA_ATUACAO'
      ProviderFlags = [pfInUpdate]
    end
    object qAtividadeID_AREA_EXECUCAO: TIntegerField
      FieldName = 'ID_AREA_EXECUCAO'
      Origin = 'ID_AREA_EXECUCAO'
      ProviderFlags = [pfInUpdate]
    end
    object qAtividadeAREA_ATUACAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AREA_ATUACAO'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qAtividadeAREA_EXECUCAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'AREA_EXECUCAO'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qAtividadeNOME_SOLICITANTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_SOLICITANTE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qAtividadeNOME_RESPONSAVEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_RESPONSAVEL'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object qAtividade_Pessoa: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select ATIVIDADE_PESSOA.ID,'
      '       ATIVIDADE_PESSOA.ID_ATIVIDADE,'
      '       ATIVIDADE_PESSOA.ID_PESSOA,'
      '       PESSOA.NOME AS NOME_PESSOA,'
      '       ATIVIDADE_PESSOA.FUNCAO,'
      '       ATIVIDADE.NOME as NOME_ATIVIDADE'
      'from ATIVIDADE_PESSOA'
      
        'inner join ATIVIDADE on (ATIVIDADE_PESSOA.ID_ATIVIDADE = ATIVIDA' +
        'DE.ID)'
      'inner join Pessoa on (PESSOA.ID = ATIVIDADE_PESSOA.ID_PESSOA)'
      'where ATIVIDADE_PESSOA.ID_ATIVIDADE = :ID_ATIVIDADE   ')
    Left = 360
    Top = 144
    ParamData = <
      item
        Name = 'ID_ATIVIDADE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qAtividade_PessoaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qAtividade_PessoaID_ATIVIDADE: TIntegerField
      FieldName = 'ID_ATIVIDADE'
      Origin = 'ID_ATIVIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAtividade_PessoaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Origin = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAtividade_PessoaFUNCAO: TStringField
      FieldName = 'FUNCAO'
      Origin = 'FUNCAO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object qAtividade_PessoaNOME_PESSOA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PESSOA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qAtividade_PessoaNOME_ATIVIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_ATIVIDADE'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object qAtividade_Projeto: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select ATIVIDADE_PROJETO.ID,'
      '       ATIVIDADE_PROJETO.ID_ATIVIDADE,'
      '       ATIVIDADE_PROJETO.ID_PROJETO,'
      '       PROJETO.NOME as NOME_PROJETO,'
      '       ATIVIDADE_PROJETO.OBSERVACAO'
      'from ATIVIDADE_PROJETO'
      
        'inner join PROJETO on (PROJETO.ID = ATIVIDADE_PROJETO.ID_PROJETO' +
        ')'
      'where ATIVIDADE_PROJETO.ID_ATIVIDADE = :ID_ATIVIDADE   ')
    Left = 360
    Top = 208
    ParamData = <
      item
        Name = 'ID_ATIVIDADE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qAtividade_ProjetoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qAtividade_ProjetoID_ATIVIDADE: TIntegerField
      FieldName = 'ID_ATIVIDADE'
      Origin = 'ID_ATIVIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAtividade_ProjetoID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      Origin = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAtividade_ProjetoNOME_PROJETO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PROJETO'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qAtividade_ProjetoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
  end
  object qAtividade_Arquivo: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select ATIVIDADE_ARQUIVO.ID,'
      '       ATIVIDADE_ARQUIVO.ID_ATIVIDADE,'
      '       ATIVIDADE_ARQUIVO.NOME,'
      '       ATIVIDADE_ARQUIVO.NOME_ORIGINAL,'
      '       ATIVIDADE_ARQUIVO.DATA_UPLOAD,'
      '       ATIVIDADE_ARQUIVO.ARQUIVO,'
      '       ATIVIDADE_ARQUIVO.DESCRICAO'
      'from ATIVIDADE_ARQUIVO'
      'where ATIVIDADE_ARQUIVO.ID_ATIVIDADE = :ID_ATIVIDADE')
    Left = 360
    Top = 280
    ParamData = <
      item
        Name = 'ID_ATIVIDADE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qAtividade_ArquivoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qAtividade_ArquivoID_ATIVIDADE: TIntegerField
      FieldName = 'ID_ATIVIDADE'
      Origin = 'ID_ATIVIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAtividade_ArquivoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qAtividade_ArquivoNOME_ORIGINAL: TStringField
      FieldName = 'NOME_ORIGINAL'
      Origin = 'NOME_ORIGINAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qAtividade_ArquivoARQUIVO: TBlobField
      FieldName = 'ARQUIVO'
      Origin = 'ARQUIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAtividade_ArquivoDATA_UPLOAD: TSQLTimeStampField
      FieldName = 'DATA_UPLOAD'
      Origin = 'DATA_UPLOAD'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAtividade_ArquivoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
  end
  object qAtividade_Vinculo: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select ATIVIDADE_VINCULO.ID,'
      '       ATIVIDADE_VINCULO.ID_ATIVIDADE_ORIGEM,'
      '       ATIVIDADE.NOME as NOME_ATIVIDADE_ORIGEM,'
      '       ATIVIDADE_VINCULO.ID_ATIVIDADE_VINCULO,'
      '       VINCULO.NOME as NOME_ATIVIDADE_VINCULO,'
      '       ATIVIDADE_VINCULO.TIPO_VINCULO,'
      '       ATIVIDADE_VINCULO.OBSERVACAO'
      'from ATIVIDADE_VINCULO'
      
        'inner join ATIVIDADE on (ATIVIDADE.ID = ATIVIDADE_VINCULO.ID_ATI' +
        'VIDADE_ORIGEM)'
      
        'inner join ATIVIDADE VINCULO on (VINCULO.ID = ATIVIDADE_VINCULO.' +
        'ID_ATIVIDADE_VINCULO)'
      
        'where ATIVIDADE_VINCULO.ID_ATIVIDADE_ORIGEM = :ID_ATIVIDADE_ORIG' +
        'EM or'
      
        '      ATIVIDADE_VINCULO.ID_ATIVIDADE_VINCULO = :ID_ATIVIDADE_ORI' +
        'GEM')
    Left = 480
    Top = 80
    ParamData = <
      item
        Name = 'ID_ATIVIDADE_ORIGEM'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qAtividade_VinculoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qAtividade_VinculoTIPO_VINCULO: TSmallintField
      FieldName = 'TIPO_VINCULO'
      Origin = 'TIPO_VINCULO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAtividade_VinculoID_ATIVIDADE_ORIGEM: TIntegerField
      FieldName = 'ID_ATIVIDADE_ORIGEM'
      Origin = 'ID_ATIVIDADE_ORIGEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAtividade_VinculoID_ATIVIDADE_VINCULO: TIntegerField
      FieldName = 'ID_ATIVIDADE_VINCULO'
      Origin = 'ID_ATIVIDADE_VINCULO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAtividade_VinculoNOME_ATIVIDADE_ORIGEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_ATIVIDADE_ORIGEM'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qAtividade_VinculoNOME_ATIVIDADE_VINCULO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_ATIVIDADE_VINCULO'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qAtividade_VinculoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
  end
  object qAtividade_Comentario: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select ATIVIDADE_COMENTARIO.ID,'
      '       ATIVIDADE_COMENTARIO.ID_ATIVIDADE,'
      '       ATIVIDADE_COMENTARIO.ID_PESSOA,'
      '       ATIVIDADE_COMENTARIO.COMENTARIO,'
      '       ATIVIDADE_COMENTARIO.DATA_HORA'
      'from ATIVIDADE_COMENTARIO'
      'where ATIVIDADE_COMENTARIO.ID_ATIVIDADE = :ID_ATIVIDADE   ')
    Left = 480
    Top = 152
    ParamData = <
      item
        Name = 'ID_ATIVIDADE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qAtividade_ComentarioID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qAtividade_ComentarioID_ATIVIDADE: TIntegerField
      FieldName = 'ID_ATIVIDADE'
      Origin = 'ID_ATIVIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAtividade_ComentarioID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Origin = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAtividade_ComentarioDATA_HORA: TSQLTimeStampField
      FieldName = 'DATA_HORA'
      Origin = 'DATA_HORA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAtividade_ComentarioCOMENTARIO: TStringField
      FieldName = 'COMENTARIO'
      Origin = 'COMENTARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1000
    end
  end
  object qProjeto_Rubrica: TRFQuery
    OnCalcFields = qProjeto_RubricaCalcFields
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select distinct Projeto_Rubrica.Id,'
      '                Projeto_Rubrica.Id_Projeto,'
      '                Projeto_Rubrica.Id_Rubrica,'
      '                Projeto_Rubrica.Orcamento,'
      
        '                coalesce(view_rubrica_projeto.valor_gasto,0) as ' +
        'Gasto,'
      
        '                coalesce(view_rubrica_projeto.valor_gasto_transf' +
        'erido,0) as Gasto_Transferencia,'
      
        '                coalesce(view_rubrica_projeto.valor_recebido,0) ' +
        'as Recebido,'
      
        '                coalesce(view_rubrica_projeto.valor_recebido_tra' +
        'nsferido,0) as Recebido_Transferencia,'
      
        '                coalesce(view_rubrica_projeto.valor_aprovisionad' +
        'o,0) as Aprovisionado,'
      
        '                coalesce(view_rubrica_projeto.saldo_real,0) as S' +
        'aldo_Real,'
      
        '                coalesce(view_rubrica_projeto.saldo_previsto,0) ' +
        'as Saldo_Previsto,'
      '                Rubrica.Nome as Nome_Rubrica'
      'from Projeto_Rubrica'
      'inner join Rubrica on (Rubrica.Id = Projeto_Rubrica.Id_Rubrica)'
      
        'inner join View_Rubrica_Projeto on (View_Rubrica_Projeto.Id_Proj' +
        'eto = Projeto_Rubrica.Id_Projeto and View_Rubrica_Projeto.Id_Rub' +
        'rica = Projeto_Rubrica.Id_Rubrica)'
      'where Projeto_Rubrica.Id_Projeto = :Id_Projeto   ')
    Left = 224
    Top = 288
    ParamData = <
      item
        Name = 'ID_PROJETO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qProjeto_RubricaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qProjeto_RubricaID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      Origin = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qProjeto_RubricaID_RUBRICA: TIntegerField
      FieldName = 'ID_RUBRICA'
      Origin = 'ID_RUBRICA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qProjeto_RubricaORCAMENTO: TBCDField
      FieldName = 'ORCAMENTO'
      Origin = 'ORCAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qProjeto_RubricaGASTO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'GASTO'
      Origin = 'GASTO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qProjeto_RubricaGASTO_TRANSFERENCIA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'GASTO_TRANSFERENCIA'
      Origin = 'GASTO_TRANSFERENCIA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qProjeto_RubricaRECEBIDO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'RECEBIDO'
      Origin = 'RECEBIDO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qProjeto_RubricaRECEBIDO_TRANSFERENCIA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'RECEBIDO_TRANSFERENCIA'
      Origin = 'RECEBIDO_TRANSFERENCIA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qProjeto_RubricaAPROVISIONADO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'APROVISIONADO'
      Origin = 'APROVISIONADO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qProjeto_RubricaSALDO_REAL: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SALDO_REAL'
      Origin = 'SALDO_REAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qProjeto_RubricaSALDO_PREVISTO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SALDO_PREVISTO'
      Origin = 'SALDO_PREVISTO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qProjeto_RubricaNOME_RUBRICA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_RUBRICA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qProjeto_RubricaCALC_VALOR_RECEBIDO: TBCDField
      FieldKind = fkCalculated
      FieldName = 'CALC_VALOR_RECEBIDO'
      ProviderFlags = []
      Precision = 18
      Size = 6
      Calculated = True
    end
    object qProjeto_RubricaCALC_VALOR_GASTO: TBCDField
      FieldKind = fkCalculated
      FieldName = 'CALC_VALOR_GASTO'
      ProviderFlags = []
      Precision = 18
      Size = 6
      Calculated = True
    end
  end
  object qProjeto_Area: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'Select Projeto_Area.Id,'
      '       Projeto_Area.Id_Projeto,'
      '       Projeto_Area.id_area_atuacao,'
      '       Area_Atuacao.Nome'
      'from Projeto_Area'
      
        'inner join area_atuacao on (area_atuacao.id = projeto_area.id_ar' +
        'ea_atuacao)'
      'where Projeto_Area.Id_Projeto = :ID_PROJETO')
    Left = 488
    Top = 216
    ParamData = <
      item
        Name = 'ID_PROJETO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qProjeto_AreaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qProjeto_AreaID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      Origin = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qProjeto_AreaID_AREA_ATUACAO: TIntegerField
      FieldName = 'ID_AREA_ATUACAO'
      Origin = 'ID_AREA_ATUACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qProjeto_AreaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object qFundo: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Fundo.Id,'
      '       Fundo.id_organizacao,'
      '       Fundo.Nome,'
      '       Fundo.Saldo,'
      '       Fundo.Descricao,'
      
        '       Coalesce(Fundo.Requer_Autorizacao,0) as Requer_Autorizaca' +
        'o'
      'from Fundo  '
      'where Fundo.id_organizacao = :id_organizacao')
    Left = 488
    Top = 288
    ParamData = <
      item
        Name = 'ID_ORGANIZACAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qFundoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qFundoID_ORGANIZACAO: TIntegerField
      FieldName = 'ID_ORGANIZACAO'
      Origin = 'ID_ORGANIZACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qFundoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qFundoSALDO: TBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qFundoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object qFundoREQUER_AUTORIZACAO: TSmallintField
      FieldName = 'REQUER_AUTORIZACAO'
      Origin = 'REQUER_AUTORIZACAO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dspqAtividade: TDataSetProvider
    DataSet = qAtividade
    Options = []
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dspqAtividadeAfterUpdateRecord
    Left = 504
    Top = 16
  end
  object qArea_Atuacao: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Area_Atuacao.Id,'
      '       Area_Atuacao.Nome'
      'from Area_Atuacao  '
      '&WHERE')
    Left = 32
    Top = 288
    MacroData = <
      item
        Value = 'WHERE AREA_ATUACAO.ID = 0'
        Name = 'WHERE'
      end>
  end
  object qArea_Execucao: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Area_Execucao.Id,'
      '       Area_Execucao.Id_Area_Atuacao,'
      '       Area_Execucao.Nome'
      'from Area_Execucao '
      'where area_execucao.id_area_atuacao = :ID_AREA_ATUACAO')
    Left = 120
    Top = 288
    ParamData = <
      item
        Name = 'ID_AREA_ATUACAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qArea_ExecucaoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qArea_ExecucaoID_AREA_ATUACAO: TIntegerField
      FieldName = 'ID_AREA_ATUACAO'
      Origin = 'ID_AREA_ATUACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qArea_ExecucaoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object qProjeto_Finan_Pagto_Rubrica: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Projeto_finan_pagto_rubrica.Id,'
      '       Projeto_finan_pagto_rubrica.Id_projeto_rubrica,'
      '       Rubrica.Nome as Rubrica,'
      '       Projeto_finan_pagto_rubrica.Id_projeto_financiador_pagto,'
      '       Projeto_finan_pagto_rubrica.Valor'
      'from Projeto_finan_pagto_rubrica'
      
        'inner join Projeto_rubrica on (Projeto_rubrica.Id = Projeto_fina' +
        'n_pagto_rubrica.Id_projeto_rubrica)'
      'inner join Rubrica on (Rubrica.Id = Projeto_rubrica.Id_rubrica)'
      
        'where Projeto_finan_pagto_rubrica.Id_projeto_financiador_pagto =' +
        ' :Id_projeto_financiador_pagto   ')
    Left = 72
    Top = 352
    ParamData = <
      item
        Name = 'ID_PROJETO_FINANCIADOR_PAGTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qProjeto_Finan_Pagto_RubricaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qProjeto_Finan_Pagto_RubricaID_PROJETO_RUBRICA: TIntegerField
      FieldName = 'ID_PROJETO_RUBRICA'
      Origin = 'ID_PROJETO_RUBRICA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qProjeto_Finan_Pagto_RubricaRUBRICA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RUBRICA'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qProjeto_Finan_Pagto_RubricaID_PROJETO_FINANCIADOR_PAGTO: TIntegerField
      FieldName = 'ID_PROJETO_FINANCIADOR_PAGTO'
      Origin = 'ID_PROJETO_FINANCIADOR_PAGTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qProjeto_Finan_Pagto_RubricaVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
  end
end
