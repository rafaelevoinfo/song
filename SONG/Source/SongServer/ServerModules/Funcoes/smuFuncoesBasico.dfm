inherited smFuncoesBasico: TsmFuncoesBasico
  OldCreateOrder = True
  object qId: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      
        'select cast(next value for &GENERATOR as integer) as ID from rdb' +
        '$database')
    Left = 144
    Top = 104
    MacroData = <
      item
        Value = Null
        Name = 'GENERATOR'
        DataType = mdIdentifier
      end>
    object qIdID: TIntegerField
      FieldName = 'ID'
    end
  end
end
