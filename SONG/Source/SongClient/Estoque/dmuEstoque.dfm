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
end
