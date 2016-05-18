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
      '       item.unidade,'
      '       item.Saldo'
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
    object qItemSALDO: TBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
  end
  object qEntrada: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select distinct Entrada.Id,      '
      '       Entrada.Data,'
      '       Entrada.Id_Pessoa,'
      '       Pessoa.nome as pessoa'
      'from Entrada '
      'inner join pessoa on (pessoa.id = entrada.id_pessoa)'
      'left join entrada_item on (entrada_item.id_entrada = entrada.id)'
      
        'left join compra_item on (entrada_item.id_compra_item = compra_i' +
        'tem.id)'
      'left join item on (item.id = entrada_item.id_item)'
      '&WHERE')
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
    object qEntradaDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qEntradaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Origin = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qEntradaPESSOA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PESSOA'
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
  object qCompra: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select distinct Compra.Id,'
      '       Compra.Id_Fornecedor,'
      '       Compra.Id_Pessoa_Comprou,'
      '       Compra.Id_Solicitacao_Compra,'
      '       Compra.Data,'
      '       Compra.Status_Entrega,'
      '       Compra.Valor_Frete,'
      '       Compra.Codigo_Rastreio,'
      '       Compra.Descricao,'
      '       fin_for_cli.nome_fantasia as fornecedor,'
      '       pessoa.nome as pessoa_comprou,'
      
        '       (select Sum(coalesce(compra_item.valor_unitario*compra_it' +
        'em.qtde,0))'
      '          from compra_item '
      
        '        where compra_item.id_compra = compra.id)+ Coalesce(Compr' +
        'a.Valor_Frete,0) as Valor_Total'
      'from Compra '
      'left join compra_item on (compra_item.id_compra = compra.id)'
      
        'inner join fin_for_cli on (fin_for_cli.id = compra.id_fornecedor' +
        ')'
      'inner join pessoa on (pessoa.id = Compra.Id_Pessoa_Comprou)'
      '&where')
    Left = 216
    Top = 16
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qCompraID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qCompraID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
      Origin = 'ID_FORNECEDOR'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qCompraID_PESSOA_COMPROU: TIntegerField
      FieldName = 'ID_PESSOA_COMPROU'
      Origin = 'ID_PESSOA_COMPROU'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qCompraDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qCompraSTATUS_ENTREGA: TSmallintField
      FieldName = 'STATUS_ENTREGA'
      Origin = 'STATUS_ENTREGA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qCompraVALOR_FRETE: TBCDField
      FieldName = 'VALOR_FRETE'
      Origin = 'VALOR_FRETE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qCompraCODIGO_RASTREIO: TStringField
      FieldName = 'CODIGO_RASTREIO'
      Origin = 'CODIGO_RASTREIO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qCompraDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object qCompraFORNECEDOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FORNECEDOR'
      Origin = 'NOME_FANTASIA'
      ProviderFlags = []
      Size = 100
    end
    object qCompraPESSOA_COMPROU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PESSOA_COMPROU'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qCompraVALOR_TOTAL: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      ProviderFlags = []
      Precision = 18
    end
    object qCompraID_SOLICITACAO_COMPRA: TIntegerField
      FieldName = 'ID_SOLICITACAO_COMPRA'
      Origin = 'ID_SOLICITACAO_COMPRA'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qCompra_Item: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Compra_Item.Id,'
      '       Compra_Item.Id_Compra,'
      '       Compra_Item.Id_Item,'
      '       Compra_Item.Id_Especie,'
      '       Compra_Item.Qtde,'
      '       Compra_Item.Valor_Unitario,'
      '       Item.nome as Item,'
      '       Especie.nome as Especie,'
      '       Item.tipo as tipo_item'
      'from Compra_Item'
      'inner join Item on (Item.Id = Compra_Item.Id_Item)'
      'left join Especie on (Especie.Id = Compra_Item.Id_Especie)'
      'where Compra_Item.Id_Compra = :Id_Compra   ')
    Left = 208
    Top = 88
    ParamData = <
      item
        Name = 'ID_COMPRA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qCompra_ItemID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qCompra_ItemID_COMPRA: TIntegerField
      FieldName = 'ID_COMPRA'
      Origin = 'ID_COMPRA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qCompra_ItemID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      Origin = 'ID_ITEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qCompra_ItemID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
    end
    object qCompra_ItemQTDE: TBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qCompra_ItemVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qCompra_ItemITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ITEM'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qCompra_ItemESPECIE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ESPECIE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qCompra_ItemTIPO_ITEM: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_ITEM'
      Origin = 'TIPO'
      ProviderFlags = []
    end
  end
  object qEntrada_Item: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Entrada_Item.Id,'
      '       Entrada_Item.Id_Entrada,'
      '       Entrada_Item.Id_Item,'
      '       Entrada_Item.Id_Compra_Item,'
      '       Entrada_Item.Qtde,'
      '       Item.nome as nome_item'
      'from Entrada_Item'
      'inner join item on (item.id = entrada_item.id_item)'
      'where Entrada_Item.Id_Entrada = :Id_Entrada   ')
    Left = 336
    Top = 32
    ParamData = <
      item
        Name = 'ID_ENTRADA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qEntrada_ItemID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qEntrada_ItemID_ENTRADA: TIntegerField
      FieldName = 'ID_ENTRADA'
      Origin = 'ID_ENTRADA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qEntrada_ItemID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      Origin = 'ID_ITEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qEntrada_ItemQTDE: TBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qEntrada_ItemNOME_ITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_ITEM'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qEntrada_ItemID_COMPRA_ITEM: TIntegerField
      FieldName = 'ID_COMPRA_ITEM'
      Origin = 'ID_COMPRA_ITEM'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qSaida: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Saida.Id,'
      '       Saida.Id_Venda,'
      '       Saida.Data,'
      '       Saida.Tipo'
      'from Saida'
      '&where')
    Left = 296
    Top = 168
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qSaidaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qSaidaID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Origin = 'ID_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object qSaidaDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qSaidaTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qSaida_Item: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Saida_Item.Id,'
      '       Saida_Item.Id_Saida,'
      '       Saida_Item.Id_Item,'
      '       Item.nome as nome_item,'
      '       Saida_item.id_especie,'
      '       especie.nome as nome_especie,'
      '       Saida_Item.Id_Lote_Semente,'
      '       lote_semente.nome as lote_semente,'
      '       Saida_Item.Id_Lote_Muda,'
      '       lote_muda.nome as lote_muda, '
      '       Saida_Item.Qtde'
      'from Saida_Item'
      'INNER join item on (item.id = saida_item.id_item)'
      'left join especie on (especie.id = saida_item.id_especie)'
      
        'left join lote_semente on (lote_semente.id = saida_item.id_lote_' +
        'semente)'
      'left join lote_muda on (lote_muda.id = saida_item.id_lote_muda)'
      'where Saida_Item.Id_Saida = :Id_Saida  ')
    Left = 296
    Top = 232
    ParamData = <
      item
        Name = 'ID_SAIDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qSaida_ItemID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qSaida_ItemID_SAIDA: TIntegerField
      FieldName = 'ID_SAIDA'
      Origin = 'ID_SAIDA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qSaida_ItemID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      Origin = 'ID_ITEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qSaida_ItemID_LOTE_SEMENTE: TIntegerField
      FieldName = 'ID_LOTE_SEMENTE'
      Origin = 'ID_LOTE_SEMENTE'
      ProviderFlags = [pfInUpdate]
    end
    object qSaida_ItemID_LOTE_MUDA: TIntegerField
      FieldName = 'ID_LOTE_MUDA'
      Origin = 'ID_LOTE_MUDA'
      ProviderFlags = [pfInUpdate]
    end
    object qSaida_ItemQTDE: TBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qSaida_ItemNOME_ITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_ITEM'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qSaida_ItemLOTE_SEMENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LOTE_SEMENTE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 30
    end
    object qSaida_ItemLOTE_MUDA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LOTE_MUDA'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qSaida_ItemID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
    end
    object qSaida_ItemNOME_ESPECIE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_ESPECIE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
end
