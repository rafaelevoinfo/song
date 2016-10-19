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
    Left = 756
    Top = 124
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
    Left = 608
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
    Left = 460
    Top = 124
    object cdsSolicitacao_CompraID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSolicitacao_CompraID_PESSOA_SOLICITOU: TIntegerField
      DisplayLabel = 'Id da Pessoa que Solicitou'
      FieldName = 'ID_PESSOA_SOLICITOU'
      Origin = 'ID_PESSOA_SOLICITOU'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsSolicitacao_CompraID_PESSOA_ANALISOU: TIntegerField
      DisplayLabel = 'Id da Pessoa que Analisou'
      FieldName = 'ID_PESSOA_ANALISOU'
      Origin = 'ID_PESSOA_ANALISOU'
      ProviderFlags = [pfInUpdate]
    end
    object cdsSolicitacao_CompraDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsSolicitacao_CompraDATA_ANALISE: TSQLTimeStampField
      DisplayLabel = 'Data da An'#225'lise'
      FieldName = 'DATA_ANALISE'
      Origin = 'DATA_ANALISE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsSolicitacao_CompraSTATUS: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsSolicitacao_CompraSOLICITANTE: TStringField
      DisplayLabel = 'Solicitante'
      FieldName = 'SOLICITANTE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsSolicitacao_CompraRESPONSAVEL_ANALISE: TStringField
      DisplayLabel = 'Respons'#225'vel pela An'#225'lise'
      FieldName = 'RESPONSAVEL_ANALISE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsSolicitacao_CompraOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object cdsSolicitacao_CompraMOTIVO_NEGACAO: TStringField
      DisplayLabel = 'Motivo da Nega'#231#227'o'
      FieldName = 'MOTIVO_NEGACAO'
      Origin = 'MOTIVO_NEGACAO'
      ProviderFlags = [pfInUpdate]
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
    Left = 904
    Top = 124
    object cdsSolicitacao_Compra_ItemID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsSolicitacao_Compra_ItemID_SOLICITACAO_COMPRA: TIntegerField
      DisplayLabel = 'Id da Solicita'#231#227'o de Compra'
      FieldName = 'ID_SOLICITACAO_COMPRA'
      Origin = 'ID_SOLICITACAO_COMPRA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsSolicitacao_Compra_ItemID_ITEM: TIntegerField
      DisplayLabel = 'Id do Item'
      FieldName = 'ID_ITEM'
      Origin = 'ID_ITEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsSolicitacao_Compra_ItemID_ESPECIE: TIntegerField
      DisplayLabel = 'Id da Esp'#233'cie'
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsSolicitacao_Compra_ItemQTDE: TBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'QTDE'
      Origin = 'QTDE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsSolicitacao_Compra_ItemNOME_ITEM: TStringField
      DisplayLabel = 'Nome do Item'
      FieldName = 'NOME_ITEM'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsSolicitacao_Compra_ItemESPECIE: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'ESPECIE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsSolicitacao_Compra_ItemUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      ProviderFlags = []
      Size = 10
    end
    object cdsSolicitacao_Compra_ItemCALC_QTDE: TStringField
      DisplayLabel = 'Qtde'
      FieldName = 'CALC_QTDE'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
  end
  object dsSolicitacao_Compra: TDataSource
    DataSet = cdsSolicitacao_Compra
    Left = 164
    Top = 16
  end
  object cdsCompra: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqCompra'
    RemoteServer = dmPrincipal.ProviderEstoque
    Left = 312
    Top = 232
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
    object cdsCompraGEROU_CONTA_PAGAR: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Gerou Conta a Pagar'
      FieldName = 'GEROU_CONTA_PAGAR'
      ProviderFlags = []
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
    Left = 164
    Top = 232
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
    object cdsCompra_ItemUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsCompra_ItemCALC_QTDE: TStringField
      DisplayLabel = 'Qtde'
      FieldName = 'CALC_QTDE'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object cdsCompra_ItemCALC_VALOR_TOTAL: TBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'CALC_VALOR_TOTAL'
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object dsCompra: TDataSource
    DataSet = cdsCompra
    Left = 460
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
    Left = 32
    Top = 232
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
    object cdsEntrada_ItemUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object cdsEntrada_ItemCALC_QTDE: TStringField
      DisplayLabel = 'Qtde'
      FieldName = 'CALC_QTDE'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
  end
  object dsEntrada: TDataSource
    DataSet = cdsEntrada
    Left = 312
    Top = 16
  end
  object cdsSaida: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqSaida'
    RemoteServer = dmPrincipal.ProviderEstoque
    Left = 756
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
    object cdsSaidaID_LOCAL_USO: TIntegerField
      DisplayLabel = 'Id do Local de Uso'
      FieldName = 'ID_LOCAL_USO'
    end
    object cdsSaidaLOCAL_USO: TStringField
      DisplayLabel = 'Local de Uso'
      FieldName = 'LOCAL_USO'
      Size = 100
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
    Left = 312
    Top = 124
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
    object cdsSaida_ItemUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      ProviderFlags = []
      Size = 10
    end
    object cdsSaida_ItemCALC_QTDE: TStringField
      DisplayLabel = 'Qtde'
      FieldName = 'CALC_QTDE'
      ReadOnly = True
      Size = 60
    end
  end
  object dsSaida: TDataSource
    DataSet = cdsSaida
    Left = 16
    Top = 16
  end
  object cdsVenda: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqVenda'
    RemoteServer = dmPrincipal.ProviderEstoque
    OnCalcFields = cdsVendaCalcFields
    Left = 32
    Top = 132
    object cdsVendaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVendaID_CLIENTE: TIntegerField
      DisplayLabel = 'Id do Cliente'
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsVendaID_PESSOA_VENDEU: TIntegerField
      DisplayLabel = 'Id da Pessoa que Vendeu'
      FieldName = 'ID_PESSOA_VENDEU'
      Origin = 'ID_PESSOA_VENDEU'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsVendaDATA: TSQLTimeStampField
      DisplayLabel = 'Data da Venda'
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsVendaCLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Origin = 'RAZAO_SOCIAL'
      ProviderFlags = []
      Size = 100
    end
    object cdsVendaVENDEDOR: TStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsVendaVALOR_TOTAL: TBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      ProviderFlags = []
      currency = True
      Precision = 18
    end
    object cdsVendaCPF_CNPJ: TStringField
      DisplayLabel = 'CPF/CNPJ'
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsVendaCALC_VALOR_EXTENSO: TStringField
      DisplayLabel = 'Valor por extenso'
      FieldName = 'CALC_VALOR_EXTENSO'
      ProviderFlags = []
      ReadOnly = True
      Size = 120
    end
    object cdsVendaDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object cdsVendaSAIU_ESTOQUE: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Saiu do Estoque'
      FieldName = 'SAIU_ESTOQUE'
      Origin = 'SAIU_ESTOQUE'
      ProviderFlags = []
    end
    object cdsVendaGEROU_CONTA_RECEBER: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Gerou Conta a Receber'
      FieldName = 'GEROU_CONTA_RECEBER'
      Origin = 'GEROU_CONTA_RECEBER'
      ProviderFlags = []
    end
    object cdsVendaCALC_CLIENTE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_CLIENTE'
      ProviderFlags = []
      Size = 300
      Calculated = True
    end
  end
  object cdsVenda_Item: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_VENDA'
    MasterFields = 'ID'
    MasterSource = dsVenda
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_VENDA'
        ParamType = ptInput
      end>
    ProviderName = 'dspqVenda_Item'
    RemoteServer = dmPrincipal.ProviderEstoque
    Left = 164
    Top = 124
    object cdsVenda_ItemID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsVenda_ItemID_VENDA: TIntegerField
      DisplayLabel = 'Id da Venda'
      FieldName = 'ID_VENDA'
      Origin = 'ID_VENDA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsVenda_ItemID_ITEM: TIntegerField
      DisplayLabel = 'Id do Item'
      FieldName = 'ID_ITEM'
      Origin = 'ID_ITEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsVenda_ItemID_ESPECIE: TIntegerField
      DisplayLabel = 'Id da Esp'#233'cie'
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVenda_ItemQTDE: TBCDField
      DisplayLabel = 'Qtde'
      FieldName = 'QTDE'
      Origin = 'QTDE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object cdsVenda_ItemVALOR_UNITARIO: TBCDField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object cdsVenda_ItemITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'ITEM'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsVenda_ItemESPECIE: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'ESPECIE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsVenda_ItemID_LOTE_SEMENTE: TIntegerField
      DisplayLabel = 'Id do Lote de Semente'
      FieldName = 'ID_LOTE_SEMENTE'
      Origin = 'ID_LOTE_SEMENTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVenda_ItemLOTE_SEMENTE: TStringField
      DisplayLabel = 'Lote de Semente'
      FieldName = 'LOTE_SEMENTE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 30
    end
    object cdsVenda_ItemID_LOTE_MUDA: TIntegerField
      DisplayLabel = 'Id do Lote de Muda'
      FieldName = 'ID_LOTE_MUDA'
      Origin = 'ID_LOTE_MUDA'
      ProviderFlags = [pfInUpdate]
    end
    object cdsVenda_ItemLOTE_MUDA: TStringField
      DisplayLabel = 'Lote de Muda'
      FieldName = 'LOTE_MUDA'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsVenda_ItemUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = []
      Size = 10
    end
    object cdsVenda_ItemCALC_QTDE: TStringField
      DisplayLabel = 'Qtde'
      FieldName = 'CALC_QTDE'
      ReadOnly = True
      Size = 60
    end
    object cdsVenda_ItemCALC_VALOR_TOTAL: TBCDField
      DisplayLabel = 'Valor Total'
      FieldName = 'CALC_VALOR_TOTAL'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object dsVenda: TDataSource
    DataSet = cdsVenda
    Left = 608
    Top = 16
  end
  object cdsLocal_Uso: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqLocal_Uso'
    RemoteServer = dmPrincipal.ProviderEstoque
    Left = 904
    Top = 16
    object cdsLocal_UsoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLocal_UsoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object cdsItem_Patrimonio: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqItem_Patrimonio'
    RemoteServer = dmPrincipal.ProviderEstoque
    Left = 432
    Top = 232
    object cdsItem_PatrimonioID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsItem_PatrimonioNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsItem_PatrimonioATIVO: TSmallintField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsItem_PatrimonioTAXA_DEPRECIACAO_ANUAL: TIntegerField
      DisplayLabel = 'Taxa Padr'#227'o de Deprecia'#231#227'o Anual'
      FieldName = 'TAXA_DEPRECIACAO_ANUAL'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '0 %'
    end
  end
  object cdsPatrimonio: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqPatrimonio'
    RemoteServer = dmPrincipal.ProviderEstoque
    Left = 560
    Top = 240
    object cdsPatrimonioID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPatrimonioID_ITEM_PATRIMONIO: TIntegerField
      DisplayLabel = 'Id do Item do Patrim'#244'nio'
      FieldName = 'ID_ITEM_PATRIMONIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsPatrimonioNOME_ITEM: TStringField
      DisplayLabel = 'Nome do Item'
      FieldName = 'NOME_ITEM'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
      Size = 100
    end
    object cdsPatrimonioDATA_AQUISICAO: TSQLTimeStampField
      DisplayLabel = 'Data da Aquisi'#231#227'o'
      FieldName = 'DATA_AQUISICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsPatrimonioIDENTIFICACAO: TStringField
      DisplayLabel = 'N'#250'mero de Identifica'#231#227'o'
      FieldName = 'IDENTIFICACAO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPatrimonioMARCA: TStringField
      DisplayLabel = 'Marca do Item'
      FieldName = 'MARCA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsPatrimonioVALOR_INICIAL: TBCDField
      DisplayLabel = 'Valor Inicial'
      FieldName = 'VALOR_INICIAL'
      ProviderFlags = [pfInUpdate]
      currency = True
      Precision = 18
      Size = 2
    end
    object cdsPatrimonioTAXA_DEPRECIACAO_ANUAL: TIntegerField
      DisplayLabel = 'Taxa de Deprecia'#231#227'o Anual'
      FieldName = 'TAXA_DEPRECIACAO_ANUAL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPatrimonioLOCALIZACAO: TStringField
      DisplayLabel = 'Localiza'#231#227'o'
      FieldName = 'LOCALIZACAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsPatrimonioNOTA_FISCAL: TStringField
      DisplayLabel = 'Nr'#186' da Nota Fiscal'
      FieldName = 'NOTA_FISCAL'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsPatrimonioSTATUS: TSmallintField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPatrimonioCALC_VALOR_ATUAL: TBCDField
      DisplayLabel = 'Valor Atual'
      FieldName = 'CALC_VALOR_ATUAL'
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 2
    end
    object cdsPatrimonioMODELO: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 100
    end
    object cdsPatrimonioOBSERVACAO: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      Size = 1000
    end
    object cdsPatrimonioID_PESSOA_RESPONSAVEL: TIntegerField
      DisplayLabel = 'Id do Respons'#225'vel'
      FieldName = 'ID_PESSOA_RESPONSAVEL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsPatrimonioRESPONSAVEL: TStringField
      DisplayLabel = 'Respons'#225'vel'
      FieldName = 'RESPONSAVEL'
      ProviderFlags = []
      Size = 100
    end
  end
  object cdsModelo_Orcamento: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqModelo_Orcamento'
    RemoteServer = dmPrincipal.ProviderEstoque
    Left = 688
    Top = 240
    object cdsModelo_OrcamentoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsModelo_OrcamentoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsModelo_OrcamentoDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object cdsModelo_OrcamentoMODELO: TBlobField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object cdsOrcamento: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqOrcamento'
    RemoteServer = dmPrincipal.ProviderEstoque
    Left = 32
    Top = 312
    object cdsOrcamentoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOrcamentoID_MODELO_ORCAMENTO: TIntegerField
      DisplayLabel = 'Id do Modelo'
      FieldName = 'ID_MODELO_ORCAMENTO'
      Origin = 'ID_MODELO_ORCAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsOrcamentoNOME: TStringField
      DisplayLabel = 'Nome do Modelo'
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsOrcamentoID_RESPONSAVEL: TIntegerField
      DisplayLabel = 'Id do Respons'#225'vel'
      FieldName = 'ID_RESPONSAVEL'
      Origin = 'ID_RESPONSAVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsOrcamentoRESPONSAVEL: TStringField
      DisplayLabel = 'Respons'#225'vel'
      FieldName = 'RESPONSAVEL'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object cdsOrcamentoID_CLIENTE: TIntegerField
      DisplayLabel = 'Id do Cliente'
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsOrcamentoCLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Origin = 'RAZAO_SOCIAL'
      ProviderFlags = []
      Size = 100
    end
    object cdsOrcamentoDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object cdsOrcamento_Orcamento: TRFClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    ProviderName = 'dspqOrcamento_Orcamento'
    RemoteServer = dmPrincipal.ProviderEstoque
    RFApplyAutomatico = False
    Left = 232
    Top = 312
    object cdsOrcamento_OrcamentoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOrcamento_OrcamentoORCAMENTO: TBlobField
      DisplayLabel = 'Or'#231'amento'
      FieldName = 'ORCAMENTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsOrcamento: TDataSource
    DataSet = cdsOrcamento
    Left = 112
    Top = 312
  end
  object cdsOrcamento_Item: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_ORCAMENTO'
    MasterFields = 'ID'
    MasterSource = dsOrcamento
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_ORCAMENTO'
        ParamType = ptInput
      end>
    ProviderName = 'dspqOrcamento_Item'
    RemoteServer = dmPrincipal.ProviderEstoque
    RFApplyAutomatico = False
    Left = 496
    Top = 320
    object cdsOrcamento_ItemID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOrcamento_ItemID_ORCAMENTO: TIntegerField
      DisplayLabel = 'Id do Or'#231'amento'
      FieldName = 'ID_ORCAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsOrcamento_ItemID_ITEM: TIntegerField
      DisplayLabel = 'Id do Item'
      FieldName = 'ID_ITEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsOrcamento_ItemID_ESPECIE: TIntegerField
      DisplayLabel = 'Id da Esp'#233'cie'
      FieldName = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsOrcamento_ItemQTDE: TBCDField
      DisplayLabel = 'Qtde'
      FieldName = 'QTDE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
    end
    object cdsOrcamento_ItemVALOR_UNITARIO: TBCDField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'VALOR_UNITARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object cdsOrcamento_ItemITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'ITEM'
      ProviderFlags = []
      Size = 100
    end
    object cdsOrcamento_ItemESPECIE: TStringField
      DisplayLabel = 'Esp'#233'cie'
      FieldName = 'ESPECIE'
      ProviderFlags = []
      Size = 100
    end
  end
  object cdsOrcamento_Customizado: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_ORCAMENTO'
    MasterFields = 'ID'
    MasterSource = dsOrcamento
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_ORCAMENTO'
        ParamType = ptInput
      end>
    ProviderName = 'dspqOrcamento_Customizado'
    RemoteServer = dmPrincipal.ProviderEstoque
    RFApplyAutomatico = False
    Left = 352
    Top = 328
    object cdsOrcamento_CustomizadoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsOrcamento_CustomizadoID_ORCAMENTO: TIntegerField
      DisplayLabel = 'Id do Or'#231'amento'
      FieldName = 'ID_ORCAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsOrcamento_CustomizadoCAMPO: TStringField
      DisplayLabel = 'Campo'
      FieldName = 'CAMPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsOrcamento_CustomizadoCONTEUDO: TStringField
      DisplayLabel = 'Conte'#250'do'
      FieldName = 'CONTEUDO'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
  end
end
