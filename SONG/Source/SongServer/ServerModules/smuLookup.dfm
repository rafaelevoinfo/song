inherited smLookup: TsmLookup
  OldCreateOrder = True
  object qlkPerfil: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select PERFIL.ID,'
      '       PERFIL.NOME'
      'from PERFIL  ')
    Left = 144
    Top = 104
    object qlkPerfilID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
    end
    object qlkPerfilNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object qlkPessoa: TRFQuery
    SQL.Strings = (
      'select PESSOA.ID,'
      '       PESSOA.NOME'
      'from PESSOA'
      '&WHERE')
    Left = 40
    Top = 40
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
  end
  object qlkOrganizacao: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select ORGANIZACAO.ID,'
      '       ORGANIZACAO.NOME'
      'from ORGANIZACAO  '
      '&WHERE')
    Left = 112
    Top = 48
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkOrganizacaoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkOrganizacaoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object qlkFinanciador: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select FINANCIADOR.ID,'
      '       FINANCIADOR.NOME'
      'from FINANCIADOR  '
      '&WHERE')
    Left = 208
    Top = 48
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qlkFinanciadorID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      Required = True
    end
    object qlkFinanciadorNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
end
