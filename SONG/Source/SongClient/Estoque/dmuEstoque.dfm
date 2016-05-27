inherited dmEstoque: TdmEstoque
  OldCreateOrder = True
  Height = 392
  Width = 996
  object cdsItem: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqItem'
    RemoteServer = dmPrincipal.ProviderEstoque
    OnCalcFields = cdsItemCalcFields
    Left = 928
    Top = 16
    object cdsItemID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItemNOME: TStringField
      DisplayLabel = 'Nome do Item'
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsItemTIPO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsItemUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object cdsItemSALDO: TBCDField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsItemCALC_SALDO: TStringField
      DisplayLabel = 'Saldo'
      FieldKind = fkCalculated
      FieldName = 'CALC_SALDO'
      Size = 60
      Calculated = True
    end
  end
  object cdsEntrada: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqEntrada'
    RemoteServer = dmPrincipal.ProviderEstoque
    Left = 336
    Top = 124
    object cdsEntradaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEntradaDATA: TSQLTimeStampField
      DisplayLabel = 'Data da Entrada'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsEntradaID_PESSOA: TIntegerField
      DisplayLabel = 'Id da Pessoa'
      FieldName = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsEntradaPESSOA: TStringField
      DisplayLabel = 'Pessoa que Realizou a Entrada'
      FieldName = 'PESSOA'
      ProviderFlags = []
      Size = 100
    end
  end
  object cdsSolicitacao_Compra: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqSolicitacao_Compra'
    RemoteServer = dmPrincipal.ProviderEstoque
    Left = 40
    Top = 232
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
    Left = 632
    Top = 124
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
    Left = 188
    Top = 16
  end
  object cdsCompra: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqCompra'
    RemoteServer = dmPrincipal.ProviderEstoque
    Left = 484
    Top = 124
    object cdsCompraID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsCompraID_FORNECEDOR: TIntegerField
      DisplayLabel = 'Id do Fornecedor'
      FieldName = 'ID_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCompraID_PESSOA_COMPROU: TIntegerField
      DisplayLabel = 'Id da Pessoa que Comprou'
      FieldName = 'ID_PESSOA_COMPROU'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCompraDATA: TSQLTimeStampField
      DisplayLabel = 'Data da Compra'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCompraSTATUS_ENTREGA: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Status da Entrega'
      FieldName = 'STATUS_ENTREGA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCompraVALOR_FRETE: TBCDField
      DisplayLabel = 'Valor do Frete'
      FieldName = 'VALOR_FRETE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object cdsCompraCODIGO_RASTREIO: TStringField
      DisplayLabel = 'C'#243'digo de Rastreio'
      FieldName = 'CODIGO_RASTREIO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cdsCompraDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object cdsCompraFORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORNECEDOR'
      ProviderFlags = []
      Size = 100
    end
    object cdsCompraPESSOA_COMPROU: TStringField
      DisplayLabel = 'Comprador'
      FieldName = 'PESSOA_COMPROU'
      ProviderFlags = []
      Size = 100
    end
    object cdsCompraVALOR_TOTAL: TBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      Precision = 18
    end
    object cdsCompraID_SOLICITACAO_COMPRA: TIntegerField
      DisplayLabel = 'Id da Solicita'#231#227'o da Compra'
      FieldName = 'ID_SOLICITACAO_COMPRA'
      ProviderFlags = [pfInUpdate]
    end
  end
  object cdsCompra_Item: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_COMPRA'
    MasterFields = 'ID'
    MasterSource = dsCompra
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_COMPRA'
        ParamType = ptInput
      end>
    ProviderName = 'dspqCompra_Item'
    RemoteServer = dmPrincipal.ProviderEstoque
    Left = 780
    Top = 124
    object cdsCompra_ItemID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsCompra_ItemID_COMPRA: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Id da Compra'
      FieldName = 'ID_COMPRA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCompra_ItemID_ITEM: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Id do Item'
      FieldName = 'ID_ITEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCompra_ItemID_ESPECIE: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Id da Esp'#233'cie'
      FieldName = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCompra_ItemQTDE: TBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsCompra_ItemVALOR_UNITARIO: TBCDField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VALOR_UNITARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsCompra_ItemITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'ITEM'
      ProviderFlags = []
      Size = 100
    end
    object cdsCompra_ItemESPECIE: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'ESPECIE'
      ProviderFlags = []
      Size = 100
    end
    object cdsCompra_ItemTIPO_ITEM: TSmallintField
      FieldName = 'TIPO_ITEM'
      ProviderFlags = []
    end
  end
  object dsCompra: TDataSource
    DataSet = cdsCompra
    Left = 40
    Top = 16
  end
  object cdsEntrada_Item: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_ENTRADA'
    MasterFields = 'ID'
    MasterSource = dsEntrada
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_ENTRADA'
        ParamType = ptInput
      end>
    ProviderName = 'dspqEntrada_Item'
    RemoteServer = dmPrincipal.ProviderEstoque
    Left = 928
    Top = 124
    object cdsEntrada_ItemID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEntrada_ItemID_ENTRADA: TIntegerField
      DisplayLabel = 'Id da Entrada'
      FieldName = 'ID_ENTRADA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsEntrada_ItemID_ITEM: TIntegerField
      DisplayLabel = 'Id do Item'
      FieldName = 'ID_ITEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsEntrada_ItemQTDE: TBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsEntrada_ItemNOME_ITEM: TStringField
      DisplayLabel = 'Nome do Item'
      FieldName = 'NOME_ITEM'
      ProviderFlags = []
      Size = 100
    end
    object cdsEntrada_ItemID_COMPRA_ITEM: TIntegerField
      FieldName = 'ID_COMPRA_ITEM'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsEntrada: TDataSource
    DataSet = cdsEntrada
    Left = 484
    Top = 16
  end
  object cdsSaida: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqSaida'
    RemoteServer = dmPrincipal.ProviderEstoque
    Left = 780
    Top = 16
    object cdsSaidaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSaidaDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsSaidaTIPO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo de Sa'#237'da'
      FieldName = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object cdsSaida_Item: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_SAIDA'
    MasterFields = 'ID'
    MasterSource = dsSaida
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_SAIDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspqSaida_Item'
    RemoteServer = dmPrincipal.ProviderEstoque
    Left = 632
    Top = 16
    object cdsSaida_ItemID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsSaida_ItemID_SAIDA: TIntegerField
      DisplayLabel = 'Id da Sa'#237'da'
      FieldName = 'ID_SAIDA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsSaida_ItemID_ITEM: TIntegerField
      DisplayLabel = 'Id do Item'
      FieldName = 'ID_ITEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsSaida_ItemID_LOTE_SEMENTE: TIntegerField
      DisplayLabel = 'Id do Lote de Semente'
      FieldName = 'ID_LOTE_SEMENTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsSaida_ItemID_LOTE_MUDA: TIntegerField
      DisplayLabel = 'Id do Lote de Muda'
      FieldName = 'ID_LOTE_MUDA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsSaida_ItemQTDE: TBCDField
      DisplayLabel = 'Qtde'
      FieldName = 'QTDE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsSaida_ItemNOME_ITEM: TStringField
      DisplayLabel = 'Nome do Item'
      FieldName = 'NOME_ITEM'
      ProviderFlags = []
      Size = 100
    end
    object cdsSaida_ItemLOTE_SEMENTE: TStringField
      DisplayLabel = 'Nome do Lote de Semente'
      FieldName = 'LOTE_SEMENTE'
      ProviderFlags = []
      Size = 30
    end
    object cdsSaida_ItemLOTE_MUDA: TStringField
      DisplayLabel = 'Nome do Lote de Muda'
      FieldName = 'LOTE_MUDA'
      ProviderFlags = []
      Size = 100
    end
    object cdsSaida_ItemID_ESPECIE: TIntegerField
      DisplayLabel = 'Id da Esp'#233'cie'
      FieldName = 'ID_ESPECIE'
    end
    object cdsSaida_ItemNOME_ESPECIE: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'NOME_ESPECIE'
      Size = 100
    end
    object cdsSaida_ItemID_VENDA_ITEM: TIntegerField
      DisplayLabel = 'Id do Item da Venda'
      FieldName = 'ID_VENDA_ITEM'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsSaida: TDataSource
    DataSet = cdsSaida
    Left = 336
    Top = 16
  end
  object cdsVenda: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqVenda'
    RemoteServer = dmPrincipal.ProviderEstoque
    Left = 188
    Top = 124
    object cdsVendaID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVendaID_CLIENTE: TIntegerField
      DisplayLabel = 'Id do Cliente'
      FieldName = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsVendaID_PESSOA_VENDEU: TIntegerField
      DisplayLabel = 'Id da Pessoa que Vendeu'
      FieldName = 'ID_PESSOA_VENDEU'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsVendaDATA: TSQLTimeStampField
      DisplayLabel = 'Data da Venda'
      FieldName = 'DATA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsVendaDESCRICAO: TIntegerField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVendaCLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      ProviderFlags = []
      Size = 100
    end
    object cdsVendaVENDEDOR: TStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR'
      ProviderFlags = []
      Size = 100
    end
    object cdsVendaVALOR_TOTAL: TBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      currency = True
      Precision = 18
    end
  end
  object cdsVenda_Item: TRFClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_VENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspqVenda_Item'
    RemoteServer = dmPrincipal.ProviderEstoque
    Left = 40
    Top = 124
    object cdsVenda_ItemID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVenda_ItemID_VENDA: TIntegerField
      DisplayLabel = 'Id da Venda'
      FieldName = 'ID_VENDA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsVenda_ItemID_ITEM: TIntegerField
      DisplayLabel = 'Id do Item'
      FieldName = 'ID_ITEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsVenda_ItemID_ESPECIE: TIntegerField
      DisplayLabel = 'Id da Esp'#233'cie'
      FieldName = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVenda_ItemQTDE: TBCDField
      DisplayLabel = 'Qtde'
      FieldName = 'QTDE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsVenda_ItemVALOR_UNITARIO: TBCDField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VALOR_UNITARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object cdsVenda_ItemITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'ITEM'
      ProviderFlags = []
      Size = 100
    end
    object cdsVenda_ItemESPECIE: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'ESPECIE'
      ProviderFlags = []
      Size = 100
    end
    object cdsVenda_ItemID_LOTE_SEMENTE: TIntegerField
      DisplayLabel = 'Id do Lote de Semente'
      FieldName = 'ID_LOTE_SEMENTE'
    end
    object cdsVenda_ItemLOTE_SEMENTE: TStringField
      DisplayLabel = 'Lote de Semente'
      FieldName = 'LOTE_SEMENTE'
      Size = 30
    end
    object cdsVenda_ItemID_LOTE_MUDA: TIntegerField
      DisplayLabel = 'Id do Lote de Muda'
      FieldName = 'ID_LOTE_MUDA'
    end
    object cdsVenda_ItemLOTE_MUDA: TStringField
      DisplayLabel = 'Lote de Muda'
      FieldName = 'LOTE_MUDA'
      Size = 100
    end
  end
end
