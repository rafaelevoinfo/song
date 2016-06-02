inherited dmViveiro: TdmViveiro
  OldCreateOrder = True
  Height = 355
  Width = 539
  object cdsEspecie: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqEspecie'
    RemoteServer = dmPrincipal.ProviderViveiro
    Left = 256
    Top = 132
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
    object cdsEspecieQTDE_SEMENTE_KILO: TIntegerField
      DisplayLabel = 'Qtde. Sementes por Kilo'
      FieldName = 'QTDE_SEMENTE_KILO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsEspecieVALOR_MUDA: TBCDField
      DisplayLabel = 'Valor Unit'#225'rio da Muda'
      FieldName = 'VALOR_MUDA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsEspecieVALOR_KG_SEMENTE: TBCDField
      DisplayLabel = 'Valor do Kg da Semente'
      FieldName = 'VALOR_KG_SEMENTE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsEspecieTEMPO_GERMINACAO: TIntegerField
      DisplayLabel = 'Tempo M'#233'dio para Germina'#231#227'o (Dias)'
      FieldName = 'TEMPO_GERMINACAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEspecieINICIO_PERIODO_COLETA: TDateField
      DisplayLabel = 'In'#237'cio do per'#237'odo de coleta'
      FieldName = 'INICIO_PERIODO_COLETA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEspecieFIM_PERIODO_COLETA: TDateField
      DisplayLabel = 'Fim do per'#237'odo de coleta'
      FieldName = 'FIM_PERIODO_COLETA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEspecieOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object cdsEspecieQTDE_SEMENTE_ESTOQUE: TBCDField
      DisplayLabel = 'Qtde. de Semente em Estoque'
      FieldName = 'QTDE_SEMENTE_ESTOQUE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsEspecieQTDE_MUDA_ESTOQUE: TIntegerField
      DisplayLabel = 'Qtde. de Muda em Estoque'
      FieldName = 'QTDE_MUDA_ESTOQUE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEspecieTEMPO_DESENVOLVIMENTO: TIntegerField
      DisplayLabel = 'Tempo M'#233'dio para Desenvolvimento da Muda (Dias)'
      FieldName = 'TEMPO_DESENVOLVIMENTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cdsMatriz: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqMatriz'
    RemoteServer = dmPrincipal.ProviderViveiro
    Left = 172
    Top = 132
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
    object cdsMatrizDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
  end
  object cdsLote_Semente: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqLote_Semente'
    RemoteServer = dmPrincipal.ProviderViveiro
    Left = 340
    Top = 132
    object cdsLote_SementeID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLote_SementeID_ESPECIE: TIntegerField
      DisplayLabel = 'Id da Esp'#233'cie'
      FieldName = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsLote_SementeID_PESSOA_COLETOU: TIntegerField
      DisplayLabel = 'Id da Pessoa que coletou'
      FieldName = 'ID_PESSOA_COLETOU'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsLote_SementeNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object cdsLote_SementeDATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsLote_SementeNOME_ESPECIE: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'NOME_ESPECIE'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsLote_SementeQTDE: TBCDField
      DisplayLabel = 'Qtde. Coletada/Comprada (kg)'
      FieldName = 'QTDE'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsLote_SementeQTDE_ARMAZENADA: TBCDField
      DisplayLabel = 'Qtde. Armazenada (Kg)'
      FieldName = 'QTDE_ARMAZENADA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsLote_SementeTAXA_GERMINACAO: TBCDField
      DisplayLabel = '% de Germina'#231#227'o'
      FieldName = 'TAXA_GERMINACAO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsLote_SementeTAXA_DESCARTE: TBCDField
      DisplayLabel = '% de Descarte'
      FieldName = 'TAXA_DESCARTE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsLote_SementeSTATUS: TSmallintField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsLote_SementeQTDE_SEMEADA: TBCDField
      DisplayLabel = 'Qtde. Semeada (kg)'
      FieldName = 'QTDE_SEMEADA'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsLote_SementePESSOA_COLETOU: TStringField
      DisplayLabel = 'Pessoa que Coletou'
      FieldName = 'PESSOA_COLETOU'
      Size = 100
    end
    object cdsLote_SementeID_COMPRA_ITEM: TIntegerField
      DisplayLabel = 'Id do Item da Compra'
      FieldName = 'ID_COMPRA_ITEM'
    end
  end
  object cdsLote_Semente_Matriz: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_LOTE_SEMENTE'
    MasterFields = 'ID'
    MasterSource = dsLote_Semente
    PacketRecords = 0
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_LOTE'
        ParamType = ptInput
      end>
    ProviderName = 'dspqLote_Semente_Matriz'
    RemoteServer = dmPrincipal.ProviderViveiro
    RFApplyAutomatico = False
    Left = 88
    Top = 240
    object cdsLote_Semente_MatrizID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLote_Semente_MatrizID_LOTE_SEMENTE: TIntegerField
      DisplayLabel = 'Id do Lote'
      FieldName = 'ID_LOTE_SEMENTE'
      Required = True
    end
    object cdsLote_Semente_MatrizID_MATRIZ: TIntegerField
      DisplayLabel = 'Matriz'
      FieldName = 'ID_MATRIZ'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dsLote_Semente: TDataSource
    DataSet = cdsLote_Semente
    Left = 88
    Top = 24
  end
  object cdsGerminacao: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_LOTE_SEMENTE;ID'
    MasterFields = 'ID'
    MasterSource = dsLote_Semente
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_LOTE'
        ParamType = ptInput
      end>
    ProviderName = 'dspqGerminacao'
    RemoteServer = dmPrincipal.ProviderViveiro
    Left = 448
    Top = 132
    object cdsGerminacaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsGerminacaoID_LOTE_SEMENTE: TIntegerField
      DisplayLabel = 'Id do Lote'
      FieldName = 'ID_LOTE_SEMENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsGerminacaoID_PESSOA_VERIFICOU: TIntegerField
      DisplayLabel = 'Pessoa que Verificou'
      FieldName = 'ID_PESSOA_VERIFICOU'
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
    object cdsGerminacaoDATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
  end
  object cdsSemeadura: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_LOTE_SEMENTE'
    MasterFields = 'ID'
    MasterSource = dsLote_Semente
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_LOTE'
        ParamType = ptInput
      end>
    ProviderName = 'dspqSemeadura'
    RemoteServer = dmPrincipal.ProviderViveiro
    Left = 256
    Top = 24
    object cdsSemeaduraID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSemeaduraID_LOTE_SEMENTE: TIntegerField
      DisplayLabel = 'Id do Lote'
      FieldName = 'ID_LOTE_SEMENTE'
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
    object cdsSemeaduraDATA_PREVISTA_GERMINACAO: TSQLTimeStampField
      DisplayLabel = 'Data Prevista da Germina'#231#227'o'
      FieldName = 'DATA_PREVISTA_GERMINACAO'
    end
    object cdsSemeaduraQTDE_TUBETE: TIntegerField
      DisplayLabel = 'Qtde. de Tubetes Semeados'
      FieldName = 'QTDE_TUBETE'
      Required = True
    end
    object cdsSemeaduraOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
  end
  object cdsCanteiro: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqCanteiro'
    RemoteServer = dmPrincipal.ProviderViveiro
    Left = 340
    Top = 24
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
      Size = 1000
    end
  end
  object cdsLote_Muda: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqLote_Muda'
    RemoteServer = dmPrincipal.ProviderViveiro
    Left = 88
    Top = 132
    object cdsLote_MudaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLote_MudaID_ESPECIE: TIntegerField
      DisplayLabel = 'Id da Esp'#233'cie'
      FieldName = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsLote_MudaNOME: TStringField
      DisplayLabel = 'Nome do Lote'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsLote_MudaQTDE_INICIAL: TIntegerField
      DisplayLabel = 'Qtde. Inicial (Und)'
      FieldName = 'QTDE_INICIAL'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = ',0'
    end
    object cdsLote_MudaNOME_ESPECIE: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'NOME_ESPECIE'
      ProviderFlags = []
      Size = 100
    end
    object cdsLote_MudaOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object cdsLote_MudaDATA: TDateField
      DisplayLabel = 'Data da Inclus'#227'o'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsLote_MudaTAXA_CLASSIFICACAO: TBCDField
      DisplayLabel = '% Classifica'#231#227'o'
      FieldName = 'TAXA_CLASSIFICACAO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsLote_MudaID_COMPRA_ITEM: TIntegerField
      DisplayLabel = 'Id do Item da Compra'
      FieldName = 'ID_COMPRA_ITEM'
      ProviderFlags = [pfInUpdate]
    end
    object cdsLote_MudaID_LOTE_SEMENTE: TIntegerField
      DisplayLabel = 'Id do Lote de Semente'
      FieldName = 'ID_LOTE_SEMENTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsLote_MudaDATA_CLASSIFICACAO: TDateField
      DisplayLabel = 'Data da Classifica'#231#227'o'
      FieldName = 'DATA_CLASSIFICACAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsLote_MudaQTDE_CLASSIFICADA: TIntegerField
      DisplayLabel = 'Qtde. Classificada (Und)'
      FieldName = 'QTDE_CLASSIFICADA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0'
    end
    object cdsLote_MudaID_PESSOA_CLASSIFICOU: TIntegerField
      DisplayLabel = 'Id da Pessoa que Classificou'
      FieldName = 'ID_PESSOA_CLASSIFICOU'
      ProviderFlags = [pfInUpdate]
    end
    object cdsLote_MudaOBSERVACAO_CLASSIFICACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o da Classifica'#231#227'o'
      FieldName = 'OBSERVACAO_CLASSIFICACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object cdsLote_MudaSALDO: TIntegerField
      DisplayLabel = 'Saldo (Und)'
      FieldName = 'SALDO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0'
    end
    object cdsLote_MudaPESSOA_CLASSIFICOU: TStringField
      DisplayLabel = 'Pessoa que Classificou'
      FieldName = 'PESSOA_CLASSIFICOU'
      ProviderFlags = []
      Size = 100
    end
    object cdsLote_MudaSTATUS: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Required = True
    end
  end
  object dsLote_Muda: TDataSource
    DataSet = cdsLote_Muda
    Left = 172
    Top = 24
  end
end
