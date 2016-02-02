inherited smAdministrativo: TsmAdministrativo
  OldCreateOrder = True
  Height = 364
  Width = 593
  object qPessoa: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select PESSOA.ID,'
      '       PESSOA.NOME,'
      '       PESSOA.CELULAR,'
      '       PESSOA.RG,'
      '       PESSOA.CPF,'
      '       PESSOA.ENDERECO,'
      '       PESSOA.BAIRRO,'
      '       PESSOA.COMPLEMENTO,'
      '       PESSOA.LOGIN,'
      '       PESSOA.SENHA'
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
    object qPessoaCELULAR: TIntegerField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      ProviderFlags = [pfInUpdate]
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
  end
  object qPerfil: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select PERFIL.ID,'
      '       PERFIL.NOME,'
      '       PERFIL.DESCRICAO'
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
end
