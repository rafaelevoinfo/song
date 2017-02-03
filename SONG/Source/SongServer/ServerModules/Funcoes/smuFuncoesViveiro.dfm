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
    Left = 104
    Top = 120
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
  object cdsQtdeMudaRocambole: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsQtdeMudaRocamboleIndex1'
        Fields = 'ID'
        GroupingLevel = 1
      end>
    IndexName = 'cdsQtdeMudaRocamboleIndex1'
    Params = <>
    StoreDefs = True
    Left = 288
    Top = 232
    object cdsQtdeMudaRocamboleID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = []
    end
    object cdsQtdeMudaRocamboleNOME: TStringField
      FieldName = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsQtdeMudaRocamboleID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      ProviderFlags = []
    end
    object cdsQtdeMudaRocamboleESPECIE: TStringField
      FieldName = 'ESPECIE'
      ProviderFlags = []
      Size = 100
    end
    object cdsQtdeMudaRocamboleQTDE: TIntegerField
      FieldName = 'QTDE'
      ProviderFlags = []
    end
    object cdsQtdeMudaRocamboleQTDE_TOTAL: TAggregateField
      FieldName = 'QTDE_TOTAL'
      Active = True
      DisplayName = ''
      Expression = 'SUM(QTDE)'
      GroupingLevel = 1
      IndexName = 'cdsQtdeMudaRocamboleIndex1'
    end
  end
  object DecoderBase64: TIdDecoderMIME
    FillChar = '='
    Left = 224
    Top = 152
  end
  object qMatrizUpdate: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      
        'update or insert into Matriz (Id, ID_ESPECIE, NOME, ENDERECO, LA' +
        'TITUDE, LONGITUDE, FOTO)'
      
        '  values (:ID, :ID_ESPECIE, :NOME, :ENDERECO, :LATITUDE, :LONGIT' +
        'UDE, :FOTO)'
      '  matching (ID);')
    Left = 80
    Top = 216
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_ESPECIE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LATITUDE'
        DataType = ftBCD
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LONGITUDE'
        DataType = ftBCD
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'FOTO'
        DataType = ftBlob
        ParamType = ptInput
        Value = Null
      end>
  end
end
