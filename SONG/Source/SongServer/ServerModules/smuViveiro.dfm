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
      '       ESPECIE.QTDE_SEMENTE_KILO,'
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
    object qEspecieQTDE_SEMENTE_KILO: TIntegerField
      FieldName = 'QTDE_SEMENTE_KILO'
      Origin = 'QTDE_SEMENTE_KILO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qMatriz: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select MATRIZ.ID,'
      '       MATRIZ.ID_ESPECIE,'
      '       MATRIZ.NOME,'
      '       MATRIZ.ENDERECO,'
      '       MATRIZ.LATITUDE,'
      '       MATRIZ.LONGITUDE,'
      '       MATRIZ.DESCRICAO,'
      '       MATRIZ.FOTO,'
      '       ESPECIE.NOME as ESPECIE'
      'from MATRIZ'
      'INNER JOIN ESPECIE ON (ESPECIE.ID = MATRIZ.ID_ESPECIE)'
      '&WHERE')
    Left = 96
    Top = 16
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qMatrizID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qMatrizID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qMatrizENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object qMatrizLATITUDE: TFMTBCDField
      FieldName = 'LATITUDE'
      Origin = 'LATITUDE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 6
    end
    object qMatrizLONGITUDE: TFMTBCDField
      FieldName = 'LONGITUDE'
      Origin = 'LONGITUDE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 6
    end
    object qMatrizDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object qMatrizESPECIE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ESPECIE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qMatrizNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qMatrizFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qLote: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select LOTE.ID,'
      '       LOTE.ID_ESPECIE,'
      '       LOTE.ID_PESSOA_COLETOU,'
      '       LOTE.NOME,'
      '       LOTE.DATA,'
      '       LOTE.QTDE,'
      '       ESPECIE.NOME AS NOME_ESPECIE'
      'from LOTE'
      'inner join especie on (especie.id = lote.id_especie)'
      '&WHERE')
    Left = 168
    Top = 16
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qLoteID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qLoteID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qLoteID_PESSOA_COLETOU: TIntegerField
      FieldName = 'ID_PESSOA_COLETOU'
      Origin = 'ID_PESSOA_COLETOU'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qLoteNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object qLoteDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qLoteNOME_ESPECIE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_ESPECIE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qLoteQTDE: TBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object qLote_Matriz: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select LOTE_MATRIZ.ID,'
      '       LOTE_MATRIZ.ID_LOTE,'
      '       LOTE_MATRIZ.ID_MATRIZ'
      'from LOTE_MATRIZ  '
      'where LOTE_MATRIZ.ID_LOTE = :ID_LOTE')
    Left = 224
    Top = 16
    ParamData = <
      item
        Name = 'ID_LOTE'
        ParamType = ptInput
      end>
    object qLote_MatrizID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qLote_MatrizID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
      Origin = 'ID_LOTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qLote_MatrizID_MATRIZ: TIntegerField
      FieldName = 'ID_MATRIZ'
      Origin = 'ID_MATRIZ'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
end
