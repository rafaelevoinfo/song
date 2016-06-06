inherited smFuncoesViveiro: TsmFuncoesViveiro
  Height = 333
  Width = 472
  inherited qAux: TRFQuery
    Left = 112
    Top = 24
  end
  inherited qId: TRFQuery
    Left = 24
    Top = 24
  end
  object qAjusta_Saldo_Especie: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'execute procedure sp_ajusta_saldo_especie(:ID_ESPECIE,1,1);')
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
  object cdsPrevisaoProducao: TRFClientDataSet
    Aggregates = <>
    Params = <>
    RFApplyAutomatico = False
    Left = 344
    Top = 104
    object cdsPrevisaoProducaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
    end
    object cdsPrevisaoProducaoNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsPrevisaoProducaoNOME_CIENTIFICO: TStringField
      FieldName = 'NOME_CIENTIFICO'
      ProviderFlags = []
      Size = 100
    end
    object cdsPrevisaoProducaoFAMILIA_BOTANICA: TStringField
      FieldName = 'FAMILIA_BOTANICA'
      ProviderFlags = []
      Size = 100
    end
    object cdsPrevisaoProducaoQTDE_MUDA_PRONTA: TIntegerField
      FieldName = 'QTDE_MUDA_PRONTA'
      ProviderFlags = []
    end
    object cdsPrevisaoProducaoQTDE_MUDA_DESENVOLVIMENTO: TIntegerField
      FieldName = 'QTDE_MUDA_DESENVOLVIMENTO'
      ProviderFlags = []
    end
    object cdsPrevisaoProducaoQTDE_SEMENTE_ESTOQUE: TBCDField
      FieldName = 'QTDE_SEMENTE_ESTOQUE'
      Precision = 18
      Size = 2
    end
    object cdsPrevisaoProducaoQTDE_SEMENTE_KILO: TIntegerField
      FieldName = 'QTDE_SEMENTE_KILO'
    end
  end
end
