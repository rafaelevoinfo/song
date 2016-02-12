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
end
