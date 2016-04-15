inherited dmEstoque: TdmEstoque
  OldCreateOrder = True
  Height = 418
  Width = 753
  object cdsItem: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqItem'
    RemoteServer = dmPrincipal.ProviderEstoque
    Left = 48
    Top = 24
    object cdsItemID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItemNOME: TStringField
      DisplayLabel = 'Nome do Item'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsItemTIPO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsItemUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Required = True
      Size = 10
    end
  end
  object cdsEntrada: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqEntrada'
    RemoteServer = dmPrincipal.ProviderEstoque
    Left = 136
    Top = 24
    object cdsEntradaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEntradaID_ITEM: TIntegerField
      DisplayLabel = 'Id do Item'
      FieldName = 'ID_ITEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsEntradaID_COMPRA: TIntegerField
      DisplayLabel = 'Id da Compra'
      FieldName = 'ID_COMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsEntradaQTDE: TBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsEntradaDATA: TSQLTimeStampField
      DisplayLabel = 'Data da Entrada'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsEntradaNOME_ITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'NOME_ITEM'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object cdsSolicitacao_Compra: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqSolicitacao_Compra'
    RemoteServer = dmPrincipal.ProviderEstoque
    Left = 240
    Top = 32
    object cdsSolicitacao_CompraID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSolicitacao_CompraID_PESSOA_SOLICITOU: TIntegerField
      DisplayLabel = 'Id da Pessoa que Solicitou'
      FieldName = 'ID_PESSOA_SOLICITOU'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsSolicitacao_CompraID_PESSOA_ANALISOU: TIntegerField
      DisplayLabel = 'Id da Pessoa que Analisou'
      FieldName = 'ID_PESSOA_ANALISOU'
      ProviderFlags = [pfInUpdate]
    end
    object cdsSolicitacao_CompraID_COMPRA: TIntegerField
      DisplayLabel = 'Id da Compra'
      FieldName = 'ID_COMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsSolicitacao_CompraDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsSolicitacao_CompraDATA_ANALISE: TSQLTimeStampField
      DisplayLabel = 'Data da An'#225'lise'
      FieldName = 'DATA_ANALISE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsSolicitacao_CompraSTATUS: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsSolicitacao_CompraSOLICITANTE: TStringField
      DisplayLabel = 'Solicitante'
      FieldName = 'SOLICITANTE'
      ProviderFlags = []
      Size = 100
    end
    object cdsSolicitacao_CompraRESPONSAVEL_ANALISE: TStringField
      DisplayLabel = 'Respons'#225'vel pela An'#225'lise'
      FieldName = 'RESPONSAVEL_ANALISE'
      ProviderFlags = []
      Size = 100
    end
    object cdsSolicitacao_CompraOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      Size = 1000
    end
  end
  object cdsSolicitacao_Compra_Item: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_SOLICITACAO_COMPRA'
    MasterFields = 'ID'
    MasterSource = dsSolicitacao_Compra
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqSolicitacao_Compra_Item'
    RemoteServer = dmPrincipal.ProviderEstoque
    Left = 248
    Top = 104
    object cdsSolicitacao_Compra_ItemID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSolicitacao_Compra_ItemID_SOLICITACAO_COMPRA: TIntegerField
      DisplayLabel = 'Id da Solicita'#231#227'o de Compra'
      FieldName = 'ID_SOLICITACAO_COMPRA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsSolicitacao_Compra_ItemID_ITEM: TIntegerField
      DisplayLabel = 'Id do Item'
      FieldName = 'ID_ITEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsSolicitacao_Compra_ItemID_ESPECIE: TIntegerField
      DisplayLabel = 'Id da Esp'#233'cie'
      FieldName = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsSolicitacao_Compra_ItemQTDE: TBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsSolicitacao_Compra_ItemNOME_ITEM: TStringField
      DisplayLabel = 'Nome do Item'
      FieldName = 'NOME_ITEM'
      ProviderFlags = []
      Size = 100
    end
    object cdsSolicitacao_Compra_ItemESPECIE: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'ESPECIE'
      ProviderFlags = []
      Size = 100
    end
  end
  object dsSolicitacao_Compra: TDataSource
    DataSet = cdsSolicitacao_Compra
    Left = 360
    Top = 192
  end
end
