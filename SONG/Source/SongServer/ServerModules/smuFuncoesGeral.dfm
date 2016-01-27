inherited smFuncoesGeral: TsmFuncoesGeral
  OldCreateOrder = True
  object qId: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select next value for &GENERATOR as id from rdb$database')
    Left = 144
    Top = 104
    MacroData = <
      item
        Value = Null
        Name = 'GENERATOR'
      end>
    object qIdID: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
