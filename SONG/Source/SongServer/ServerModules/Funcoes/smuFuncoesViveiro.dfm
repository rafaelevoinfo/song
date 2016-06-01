inherited smFuncoesViveiro: TsmFuncoesViveiro
  Height = 333
  Width = 472
  object qAjusta_Saldo_Especie: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'execute procedure sp_ajusta_saldo_especie(:ID_ESPECIE);')
    Left = 248
    Top = 168
    ParamData = <
      item
        Name = 'ID_ESPECIE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
