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
      DisplayLabel = 'Qtde. Coletada/Comprada (kg)'
      FieldName = 'QTDE'
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsLoteQTDE_ARMAZENADA: TBCDField
      DisplayLabel = 'Qtde. Armazenada (Kg)'
      FieldName = 'QTDE_ARMAZENADA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsLoteTAXA_GERMINACAO: TBCDField
      DisplayLabel = '% de Germina'#231#227'o'
      FieldName = 'TAXA_GERMINACAO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsLoteTAXA_DESCARTE: TBCDField
      DisplayLabel = '% de Descarte'
      FieldName = 'TAXA_DESCARTE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsLoteSTATUS: TSmallintField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsLoteQTDE_SEMEADA: TBCDField
      DisplayLabel = 'Qtde. Semeada (kg)'
      FieldName = 'QTDE_SEMEADA'
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
  object cdsGerminacao: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_LOTE'
    MasterFields = 'ID'
    MasterSource = dsLote
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_LOTE'
        ParamType = ptInput
      end>
    ProviderName = 'dspqGerminacao'
    RemoteServer = dmPrincipal.ProviderViveiro
    Left = 256
    Top = 160
    object cdsGerminacaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGerminacaoID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsGerminacaoID_PESSOA_VERIFICOU: TIntegerField
      DisplayLabel = 'Pessoa que Verificou'
      FieldName = 'ID_PESSOA_VERIFICOU'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsGerminacaoDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsGerminacaoQTDE_GERMINADA: TIntegerField
      DisplayLabel = 'Qtde. Germinada'
      FieldName = 'QTDE_GERMINADA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsGerminacaoPESSOA_VERIFICOU: TStringField
      DisplayLabel = 'Pessoa que Verificou'
      FieldName = 'PESSOA_VERIFICOU'
      ProviderFlags = []
      Size = 100
    end
  end
  object cdsSemeadura: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_LOTE'
    MasterFields = 'ID'
    MasterSource = dsLote
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_LOTE'
        ParamType = ptInput
      end>
    ProviderName = 'dspqSemeadura'
    RemoteServer = dmPrincipal.ProviderViveiro
    Left = 184
    Top = 192
    object cdsSemeaduraID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSemeaduraID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsSemeaduraID_PESSOA_SEMEOU: TIntegerField
      DisplayLabel = 'Pessoa que Semeou'
      FieldName = 'ID_PESSOA_SEMEOU'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsSemeaduraQTDE_SEMEADA: TBCDField
      DisplayLabel = 'Qtde. Semeada (kg)'
      FieldName = 'QTDE_SEMEADA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsSemeaduraDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsSemeaduraOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object cdsSemeaduraID_CANTEIRO: TIntegerField
      DisplayLabel = 'Canteiro'
      FieldName = 'ID_CANTEIRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsSemeaduraPESSOA_SEMEOU: TStringField
      DisplayLabel = 'Semeador'
      FieldName = 'PESSOA_SEMEOU'
      ProviderFlags = []
      Size = 100
    end
    object cdsSemeaduraNOME_CANTEIRO: TStringField
      DisplayLabel = 'Canteiro'
      FieldName = 'NOME_CANTEIRO'
      ProviderFlags = []
      Size = 100
    end
  end
  object cdsCanteiro: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqCanteiro'
    RemoteServer = dmPrincipal.ProviderViveiro
    Left = 256
    Top = 240
    object cdsCanteiroID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCanteiroNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsCanteiroDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
  end
end
