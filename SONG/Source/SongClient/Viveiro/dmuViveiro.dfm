inherited dmViveiro: TdmViveiro
  OldCreateOrder = True
  Height = 355
  Width = 539
  object cdsEspecie: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqEspecie'
    RemoteServer = dmPrincipal.ProviderViveiro
    Left = 32
    Top = 16
    object cdsEspecieID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEspecieNOME: TStringField
      DisplayLabel = 'Nome Popular'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsEspecieNOME_CIENTIFICO: TStringField
      DisplayLabel = 'Nome Cient'#237'fico'
      FieldName = 'NOME_CIENTIFICO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsEspecieFAMILIA_BOTANICA: TStringField
      DisplayLabel = 'Fam'#237'lia Bot'#226'nica'
      FieldName = 'FAMILIA_BOTANICA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsEspecieOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object cdsEspecieQTDE_SEMENTE_KILO: TIntegerField
      DisplayLabel = 'Qtde. Sementes por Kilo'
      FieldName = 'QTDE_SEMENTE_KILO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object cdsMatriz: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqMatriz'
    RemoteServer = dmPrincipal.ProviderViveiro
    Left = 104
    Top = 16
    object cdsMatrizID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsMatrizID_ESPECIE: TIntegerField
      DisplayLabel = 'Id da Esp'#233'cie'
      FieldName = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsMatrizNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsMatrizENDERECO: TStringField
      DisplayLabel = 'Localiza'#231#227'o da Matriz'
      FieldName = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object cdsMatrizLATITUDE: TFMTBCDField
      DisplayLabel = 'Latitude'
      FieldName = 'LATITUDE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 6
    end
    object cdsMatrizLONGITUDE: TFMTBCDField
      DisplayLabel = 'Longitude'
      FieldName = 'LONGITUDE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 6
    end
    object cdsMatrizDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object cdsMatrizESPECIE: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'ESPECIE'
      ProviderFlags = []
      Size = 100
    end
    object cdsMatrizFOTO: TBlobField
      DisplayLabel = 'Foto'
      FieldName = 'FOTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cdsLote: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqLote'
    RemoteServer = dmPrincipal.ProviderViveiro
    Left = 32
    Top = 88
    object cdsLoteID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLoteID_ESPECIE: TIntegerField
      DisplayLabel = 'Id da Esp'#233'cie'
      FieldName = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsLoteID_PESSOA_COLETOU: TIntegerField
      DisplayLabel = 'Pessoa que coletou'
      FieldName = 'ID_PESSOA_COLETOU'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsLoteNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object cdsLoteDATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsLoteNOME_ESPECIE: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'NOME_ESPECIE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsLoteQTDE: TBCDField
      DisplayLabel = 'Quantidade (kg)'
      FieldName = 'QTDE'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object cdsLote_Matriz: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_LOTE'
    MasterFields = 'ID'
    MasterSource = dsLote
    PacketRecords = 0
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_LOTE'
        ParamType = ptInput
      end>
    ProviderName = 'dspqLote_Matriz'
    RemoteServer = dmPrincipal.ProviderViveiro
    RFApplyAutomatico = False
    Left = 104
    Top = 88
    object cdsLote_MatrizID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLote_MatrizID_LOTE: TIntegerField
      DisplayLabel = 'Id do Lote'
      FieldName = 'ID_LOTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsLote_MatrizID_MATRIZ: TIntegerField
      DisplayLabel = 'Matriz'
      FieldName = 'ID_MATRIZ'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dsLote: TDataSource
    DataSet = cdsLote
    Left = 24
    Top = 160
  end
end
