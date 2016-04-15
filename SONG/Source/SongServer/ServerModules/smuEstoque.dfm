inherited smEstoque: TsmEstoque
  OldCreateOrder = True
  Height = 374
  Width = 628
  object qItem: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'Select item.id,'
      '       item.nome,'
      '       item.tipo,'
      '       item.unidade'
      'from item'
      '&where')
    Left = 48
    Top = 16
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qItemID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qItemNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qItemTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qItemUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
  end
  object qEntrada: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Entrada.Id,'
      '       Entrada.Id_Item,'
      '       Entrada.Id_Compra,'
      '       Entrada.Qtde,'
      '       Entrada.Data,'
      '       item.nome as nome_item'
      'from Entrada '
      'inner join item on (item.id = entrada.id_item)'
      '&where')
    Left = 128
    Top = 16
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qEntradaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qEntradaID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      Origin = 'ID_ITEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qEntradaID_COMPRA: TIntegerField
      FieldName = 'ID_COMPRA'
      Origin = 'ID_COMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object qEntradaQTDE: TBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qEntradaDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qEntradaNOME_ITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_ITEM'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object qSolicitacao_Compra: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select distinct Solicitacao_Compra.Id,'
      '       Solicitacao_Compra.Id_Pessoa_Solicitou,'
      '       Solicitacao_Compra.Id_Pessoa_Analisou,'
      '       Solicitacao_Compra.Id_Compra,'
      '       Solicitacao_Compra.Data,'
      '       Solicitacao_Compra.Data_Analise,'
      '       Solicitacao_Compra.Status,'
      '       Solicitacao_Compra.Observacao,'
      '       Solicitante.nome as solicitante,'
      '       Responsavel_Analise.nome as responsavel_analise'
      'from Solicitacao_Compra'
      
        'inner join Pessoa Solicitante on (Solicitante.Id = Solicitacao_C' +
        'ompra.Id_Pessoa_Solicitou)'
      
        'left join Pessoa Responsavel_Analise on (Responsavel_Analise.Id ' +
        '= Solicitacao_Compra.Id_Pessoa_Analisou)  '
      
        'left join solicitacao_compra_item on (solicitacao_compra_item.id' +
        '_solicitacao_compra = solicitacao_compra.id)'
      '&where')
    Left = 64
    Top = 88
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qSolicitacao_CompraID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qSolicitacao_CompraID_PESSOA_SOLICITOU: TIntegerField
      FieldName = 'ID_PESSOA_SOLICITOU'
      Origin = 'ID_PESSOA_SOLICITOU'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qSolicitacao_CompraID_PESSOA_ANALISOU: TIntegerField
      FieldName = 'ID_PESSOA_ANALISOU'
      Origin = 'ID_PESSOA_ANALISOU'
      ProviderFlags = [pfInUpdate]
    end
    object qSolicitacao_CompraID_COMPRA: TIntegerField
      FieldName = 'ID_COMPRA'
      Origin = 'ID_COMPRA'
      ProviderFlags = [pfInUpdate]
    end
    object qSolicitacao_CompraDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qSolicitacao_CompraDATA_ANALISE: TSQLTimeStampField
      FieldName = 'DATA_ANALISE'
      Origin = 'DATA_ANALISE'
      ProviderFlags = [pfInUpdate]
    end
    object qSolicitacao_CompraSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qSolicitacao_CompraSOLICITANTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SOLICITANTE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qSolicitacao_CompraRESPONSAVEL_ANALISE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RESPONSAVEL_ANALISE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qSolicitacao_CompraOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
  end
  object qSolicitacao_Compra_Item: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Solicitacao_Compra_Item.Id,'
      '       Solicitacao_Compra_Item.Id_Solicitacao_Compra,'
      '       Solicitacao_Compra_Item.Id_Item,'
      '       Solicitacao_Compra_Item.Id_Especie,'
      '       Solicitacao_Compra_Item.Qtde,'
      '       item.nome as Nome_Item,'
      '       especie.nome as especie'
      'from Solicitacao_Compra_Item  '
      'inner join Item on (Item.Id = Solicitacao_Compra_Item.Id_Item)'
      
        'left join especie on (especie.id = solicitacao_compra_item.id_es' +
        'pecie)'
      
        'where solicitacao_compra_item.id_solicitacao_compra = :id_solici' +
        'tacao_compra')
    Left = 64
    Top = 160
    ParamData = <
      item
        Name = 'ID_SOLICITACAO_COMPRA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qSolicitacao_Compra_ItemID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qSolicitacao_Compra_ItemID_SOLICITACAO_COMPRA: TIntegerField
      FieldName = 'ID_SOLICITACAO_COMPRA'
      Origin = 'ID_SOLICITACAO_COMPRA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qSolicitacao_Compra_ItemID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      Origin = 'ID_ITEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qSolicitacao_Compra_ItemID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
    end
    object qSolicitacao_Compra_ItemQTDE: TBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qSolicitacao_Compra_ItemNOME_ITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_ITEM'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qSolicitacao_Compra_ItemESPECIE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ESPECIE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
end
