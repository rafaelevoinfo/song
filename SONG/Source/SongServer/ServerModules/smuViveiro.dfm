inherited smViveiro: TsmViveiro
  OldCreateOrder = True
  Height = 289
  Width = 787
  object qEspecie: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select ESPECIE.ID,'
      '       ESPECIE.NOME,'
      '       ESPECIE.NOME_CIENTIFICO,'
      '       ESPECIE.FAMILIA_BOTANICA,'
      '       ESPECIE.OBSERVACAO'
      'from ESPECIE  '
      '&WHERE')
    Left = 32
    Top = 16
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qEspecieID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qEspecieNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qEspecieNOME_CIENTIFICO: TStringField
      FieldName = 'NOME_CIENTIFICO'
      Origin = 'NOME_CIENTIFICO'
      Size = 100
    end
    object qEspecieFAMILIA_BOTANICA: TStringField
      FieldName = 'FAMILIA_BOTANICA'
      Origin = 'FAMILIA_BOTANICA'
      Size = 100
    end
    object qEspecieOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 500
    end
  end
end
