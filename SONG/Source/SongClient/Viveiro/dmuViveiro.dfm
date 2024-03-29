inherited dmViveiro: TdmViveiro
  OldCreateOrder = True
  Height = 371
  Width = 796
  object cdsEspecie: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqEspecie'
    RemoteServer = dmPrincipal.ProviderViveiro
    OnCalcFields = cdsEspecieCalcFields
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
      ProviderFlags = []
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
    object cdsEspecieTEMPO_DESENVOLVIMENTO: TIntegerField
      DisplayLabel = 'Tempo M'#233'dio para Desenvolvimento da Muda (Dias)'
      FieldName = 'TEMPO_DESENVOLVIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEspecieQTDE_MUDA_PRONTA: TIntegerField
      DisplayLabel = 'Qtde. de Muda Pronta'
      FieldName = 'QTDE_MUDA_PRONTA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0 Und'
    end
    object cdsEspecieQTDE_MUDA_DESENVOLVIMENTO: TIntegerField
      DisplayLabel = 'Qtde. de Mudas em Desenvolvimento'
      FieldName = 'QTDE_MUDA_DESENVOLVIMENTO'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
      DisplayFormat = ',0 Und'
    end
    object cdsEspecieMES_INICIO_COLETA: TIntegerField
      DisplayLabel = 'M'#234's de In'#237'cio da Coleta'
      FieldName = 'MES_INICIO_COLETA'
    end
    object cdsEspecieMES_FIM_COLETA: TIntegerField
      DisplayLabel = 'M'#234's do Fim da Coleta'
      FieldName = 'MES_FIM_COLETA'
    end
    object cdsEspecieID_FAMILIA_BOTANICA: TIntegerField
      DisplayLabel = 'Id da Fam'#237'lia Bot'#226'nica'
      FieldName = 'ID_FAMILIA_BOTANICA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEspeciePESO_MEDIO_SEMENTE: TBCDField
      DisplayLabel = 'Peso M'#233'dio da Semente (g)'
      FieldName = 'PESO_MEDIO_SEMENTE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
    end
    object cdsEspecieCALC_TOTAL_MUDAS: TIntegerField
      DisplayLabel = 'Total de Mudas'
      FieldKind = fkCalculated
      FieldName = 'CALC_TOTAL_MUDAS'
      DisplayFormat = ',0 Und'
      Calculated = True
    end
    object cdsEspecieQTDE_SEMENTE_TUBETE: TIntegerField
      DisplayLabel = 'Qtde. de Semente por Tubete'
      FieldName = 'QTDE_SEMENTE_TUBETE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEspecieCLASSIFICACAO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Classifica'#231#227'o'
      FieldName = 'CLASSIFICACAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEspecieID_TIPO_ESPECIE: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'ID do Tipo da Esp'#233'cie'
      FieldName = 'ID_TIPO_ESPECIE'
    end
    object cdsEspecieTIPO_ESPECIE: TStringField
      DisplayLabel = 'Tipo da Esp'#233'cie'
      FieldName = 'TIPO_ESPECIE'
      Size = 100
    end
    object cdsEspecieCATEGORIA_ARMAZENAMENTO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Categoria de Armazenamento'
      FieldName = 'CATEGORIA_ARMAZENAMENTO'
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
    object cdsMatrizLATITUDE: TBCDField
      DisplayLabel = 'Latitude'
      FieldName = 'LATITUDE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 6
    end
    object cdsMatrizLONGITUDE: TBCDField
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
    object cdsLote_SementeID_CAMARA_FRIA: TIntegerField
      DisplayLabel = 'Id da C'#226'mara Fria'
      FieldName = 'ID_CAMARA_FRIA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsLote_SementeCAMARA_FRIA: TStringField
      DisplayLabel = 'C'#226'mara Fria'
      FieldName = 'CAMARA_FRIA'
      ProviderFlags = []
      Size = 100
    end
    object cdsLote_SementeID_LOTE_SEMENTE_ORIGEM: TIntegerField
      DisplayLabel = 'Id do Lote de Semente de Origem'
      FieldName = 'ID_LOTE_SEMENTE_ORIGEM'
      ProviderFlags = [pfInUpdate]
    end
    object cdsLote_SementeRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'RAZAO_SOCIAL'
      ProviderFlags = []
      Size = 100
    end
    object cdsLote_SementeID_COLETA: TStringField
      DisplayLabel = 'Id da Coleta'
      FieldName = 'ID_COLETA'
      ProviderFlags = []
      Size = 30
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
    object cdsLote_MudaSALDO: TIntegerField
      DisplayLabel = 'Saldo (Und)'
      FieldName = 'SALDO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0'
    end
    object cdsLote_MudaSTATUS: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Required = True
    end
    object cdsLote_MudaRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'RAZAO_SOCIAL'
      ProviderFlags = []
      Size = 100
    end
  end
  object dsLote_Muda: TDataSource
    DataSet = cdsLote_Muda
    Left = 172
    Top = 24
  end
  object cdsLote_Muda_Canteiro: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_LOTE_MUDA'
    MasterFields = 'ID'
    MasterSource = dsLote_Muda
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqLote_Muda_Canteiro'
    RemoteServer = dmPrincipal.ProviderViveiro
    Left = 232
    Top = 232
    object cdsLote_Muda_CanteiroID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLote_Muda_CanteiroID_LOTE_MUDA: TIntegerField
      DisplayLabel = 'Id do Lote de Muda'
      FieldName = 'ID_LOTE_MUDA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsLote_Muda_CanteiroID_CANTEIRO: TIntegerField
      DisplayLabel = 'Id do Canteiro'
      FieldName = 'ID_CANTEIRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsLote_Muda_CanteiroNOME_CANTEIRO: TStringField
      DisplayLabel = 'Canteiro'
      FieldName = 'NOME_CANTEIRO'
      ProviderFlags = []
      Size = 100
    end
  end
  object cdsClassificacao: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_LOTE_MUDA'
    MasterFields = 'ID'
    MasterSource = dsLote_Muda
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_LOTE_MUDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspqClassificacao'
    RemoteServer = dmPrincipal.ProviderViveiro
    Left = 344
    Top = 240
    object cdsClassificacaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsClassificacaoID_LOTE_MUDA: TIntegerField
      DisplayLabel = 'Id do Lote de Muda'
      FieldName = 'ID_LOTE_MUDA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsClassificacaoID_PESSOA_CLASSIFICOU: TIntegerField
      DisplayLabel = 'Id da Pessoa que Classificou'
      FieldName = 'ID_PESSOA_CLASSIFICOU'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsClassificacaoDATA: TDateField
      DisplayLabel = 'Data da Classifica'#231#227'o'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsClassificacaoQTDE: TIntegerField
      DisplayLabel = 'Qtde. Perdida'
      FieldName = 'QTDE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsClassificacaoOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object cdsClassificacaoPESSOA_CLASSIFICOU: TStringField
      DisplayLabel = 'Pessoa Classificou'
      FieldName = 'PESSOA_CLASSIFICOU'
      ProviderFlags = []
      Size = 100
    end
  end
  object cdsFamilia_Botanica: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqFamilia_Botanica'
    RemoteServer = dmPrincipal.ProviderViveiro
    Left = 472
    Top = 232
    object cdsFamilia_BotanicaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFamilia_BotanicaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object cdsCamara_Fria: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqCamara_Fria'
    RemoteServer = dmPrincipal.ProviderViveiro
    Left = 448
    Top = 48
    object cdsCamara_FriaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCamara_FriaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object dsEspecie: TDataSource
    DataSet = cdsEspecie
    Left = 384
    Top = 168
  end
  object cdsEspecie_Bioma: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_ESPECIE'
    MasterFields = 'ID'
    MasterSource = dsEspecie
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqEspecie_Bioma'
    RemoteServer = dmPrincipal.ProviderViveiro
    RFApplyAutomatico = False
    Left = 560
    Top = 200
    object cdsEspecie_BiomaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEspecie_BiomaID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsEspecie_BiomaBIOMA: TSmallintField
      FieldName = 'BIOMA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object cdsTipo_Especie: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqTipo_Especie'
    RemoteServer = dmPrincipal.ProviderViveiro
    Left = 528
    Top = 40
    object cdsTipo_EspecieID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsTipo_EspecieNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsTipo_EspecieDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object cdsTipo_EspecieNATIVA: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Nativa'
      FieldName = 'NATIVA'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cdsMix_Muda: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqMix_Muda'
    RemoteServer = dmPrincipal.ProviderViveiro
    Left = 672
    Top = 40
    object cdsMix_MudaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsMix_MudaID_CLIENTE: TIntegerField
      DisplayLabel = 'Id do Cliente'
      FieldName = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsMix_MudaCLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      ProviderFlags = []
      Size = 100
    end
    object cdsMix_MudaID_PESSOA_RESPONSAVEL: TIntegerField
      DisplayLabel = 'Id do Respons'#225'vel'
      FieldName = 'ID_PESSOA_RESPONSAVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsMix_MudaRESPONSAVEL: TStringField
      DisplayLabel = 'Respons'#225'vel'
      FieldName = 'RESPONSAVEL'
      ProviderFlags = []
      Size = 100
    end
    object cdsMix_MudaDATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsMix_MudaQTDE_MUDA: TIntegerField
      DisplayLabel = 'Qtde. de Muda'
      FieldName = 'QTDE_MUDA'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = ',0'
    end
    object cdsMix_MudaQTDE_MUDA_ROCAMBOLE: TIntegerField
      DisplayLabel = 'Qtde. de Muda por Rocambole'
      FieldName = 'QTDE_MUDA_ROCAMBOLE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsMix_MudaDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object cdsMix_MudaID_VENDA: TIntegerField
      DisplayLabel = 'Id da Venda'
      FieldName = 'ID_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsMix_MudaID_SAIDA: TIntegerField
      DisplayLabel = 'Id da Sa'#237'da'
      FieldName = 'ID_SAIDA'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cdsMix_Muda_Especie: TRFClientDataSet
    Aggregates = <>
    AggregatesActive = True
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'ID_MIX_MUDA'
    MasterFields = 'ID'
    MasterSource = dsMix_Muda
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_MIX_MUDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspqMix_Muda_Especie'
    RemoteServer = dmPrincipal.ProviderViveiro
    StoreDefs = True
    RFApplyAutomatico = False
    Left = 672
    Top = 104
    object cdsMix_Muda_EspecieID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsMix_Muda_EspecieID_MIX_MUDA: TIntegerField
      DisplayLabel = 'Id do Mix de Muda'
      FieldName = 'ID_MIX_MUDA'
      Origin = 'ID_MIX_MUDA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsMix_Muda_EspecieID_ESPECIE: TIntegerField
      DisplayLabel = 'Id da Esp'#233'cie'
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsMix_Muda_EspecieESPECIE: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'ESPECIE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsMix_Muda_EspecieNOME_CIENTIFICO: TStringField
      DisplayLabel = 'Nome Cient'#237'fico'
      FieldName = 'NOME_CIENTIFICO'
      Origin = 'NOME_CIENTIFICO'
      ProviderFlags = []
      Size = 100
    end
    object cdsMix_Muda_EspecieQTDE_MUDA_PRONTA: TIntegerField
      DisplayLabel = 'Qtde. de Muda Pronta'
      FieldName = 'QTDE_MUDA_PRONTA'
      Origin = 'QTDE_MUDA_PRONTA'
      ProviderFlags = []
      DisplayFormat = ',0'
    end
  end
  object cdsMix_Muda_Especie_Lote: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_MIX_MUDA_ESPECIE'
    MasterFields = 'ID'
    MasterSource = dsMix_Muda_Especie
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_MIX_MUDA_ESPECIE'
        ParamType = ptInput
      end>
    ProviderName = 'dspqMix_Muda_Especie_Lote'
    RemoteServer = dmPrincipal.ProviderViveiro
    RFApplyAutomatico = False
    Left = 672
    Top = 176
    object cdsMix_Muda_Especie_LoteID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsMix_Muda_Especie_LoteID_MIX_MUDA_ESPECIE: TIntegerField
      FieldName = 'ID_MIX_MUDA_ESPECIE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsMix_Muda_Especie_LoteID_LOTE_MUDA: TIntegerField
      DisplayLabel = 'Id do Lote de Muda'
      FieldName = 'ID_LOTE_MUDA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsMix_Muda_Especie_LoteLOTE: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      ProviderFlags = []
      Size = 100
    end
    object cdsMix_Muda_Especie_LoteCANTEIROS: TMemoField
      DisplayLabel = 'Canteiros'
      FieldName = 'CANTEIROS'
      ProviderFlags = []
      BlobType = ftMemo
    end
    object cdsMix_Muda_Especie_LoteQTDE: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      Required = True
      DisplayFormat = ',0'
    end
  end
  object dsMix_Muda: TDataSource
    DataSet = cdsMix_Muda
    Left = 600
    Top = 40
  end
  object dsMix_Muda_Especie: TDataSource
    DataSet = cdsMix_Muda_Especie
    Left = 576
    Top = 112
  end
  object cdsMix_Muda_Especie_Lote_Canteiro: TRFClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_CANTEIRO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CANTEIRO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ID_ESPECIE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ESPECIE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'LOTE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'QTDE_MUDA_RETIRAR'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_CLIENTE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_PESSOA_RESPONSAVEL'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'RESPONSAVEL'
        Attributes = [faRequired]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CLIENTE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 100
      end
      item
        Name = 'QTDE_MUDA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'QTDE_MUDA_ROCAMBOLE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CALC_QTDE_CARRINHO'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'ID_LOTE'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'ORDER'
        DescFields = 'QTDE_MUDA_RETIRAR'
        Fields = 'CANTEIRO;ESPECIE;ID_LOTE;QTDE_MUDA_RETIRAR'
        Options = [ixDescending]
      end>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_MIX_MUDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspqMix_Muda_Especie_Lote_Canteiro'
    RemoteServer = dmPrincipal.ProviderViveiro
    StoreDefs = True
    Left = 664
    Top = 248
    object cdsMix_Muda_Especie_Lote_CanteiroID_CANTEIRO: TIntegerField
      FieldName = 'ID_CANTEIRO'
      Origin = 'ID_CANTEIRO'
      ProviderFlags = []
      Required = True
    end
    object cdsMix_Muda_Especie_Lote_CanteiroCANTEIRO: TStringField
      FieldName = 'CANTEIRO'
      Origin = 'CANTEIRO'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdsMix_Muda_Especie_Lote_CanteiroID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      ProviderFlags = []
      Required = True
    end
    object cdsMix_Muda_Especie_Lote_CanteiroESPECIE: TStringField
      FieldName = 'ESPECIE'
      Origin = 'ESPECIE'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdsMix_Muda_Especie_Lote_CanteiroLOTE: TStringField
      FieldName = 'LOTE'
      Origin = 'LOTE'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdsMix_Muda_Especie_Lote_CanteiroQTDE_MUDA_RETIRAR: TIntegerField
      FieldName = 'QTDE_MUDA_RETIRAR'
      Origin = 'QTDE_MUDA_RETIRAR'
      ProviderFlags = []
      Required = True
    end
    object cdsMix_Muda_Especie_Lote_CanteiroID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = []
      Required = True
    end
    object cdsMix_Muda_Especie_Lote_CanteiroID_PESSOA_RESPONSAVEL: TIntegerField
      FieldName = 'ID_PESSOA_RESPONSAVEL'
      Origin = 'ID_PESSOA_RESPONSAVEL'
      ProviderFlags = []
      Required = True
    end
    object cdsMix_Muda_Especie_Lote_CanteiroRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Origin = 'RESPONSAVEL'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdsMix_Muda_Especie_Lote_CanteiroCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object cdsMix_Muda_Especie_Lote_CanteiroQTDE_MUDA: TIntegerField
      FieldName = 'QTDE_MUDA'
      Origin = 'QTDE_MUDA'
      ProviderFlags = []
      Required = True
    end
    object cdsMix_Muda_Especie_Lote_CanteiroQTDE_MUDA_ROCAMBOLE: TIntegerField
      FieldName = 'QTDE_MUDA_ROCAMBOLE'
      Origin = 'QTDE_MUDA_ROCAMBOLE'
      ProviderFlags = []
      Required = True
    end
    object cdsMix_Muda_Especie_Lote_CanteiroID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
      Origin = 'ID_LOTE'
      ProviderFlags = []
    end
  end
end
