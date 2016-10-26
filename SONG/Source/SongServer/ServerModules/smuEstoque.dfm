inherited smEstoque: TsmEstoque
  OldCreateOrder = True
  OnDestroy = DSServerModuleDestroy
  Height = 462
  Width = 841
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
      '       Solicitacao_compra.Motivo_Negacao,'
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
        Value = 'where solicitacao_compra.id = 0'
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
    object qSolicitacao_CompraMOTIVO_NEGACAO: TStringField
      FieldName = 'MOTIVO_NEGACAO'
      Origin = 'MOTIVO_NEGACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
  end
  object qSolicitacao_Compra_Item: TRFQuery
    OnCalcFields = qEntrada_ItemCalcFields
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Solicitacao_Compra_Item.Id,'
      '       Solicitacao_Compra_Item.Id_Solicitacao_Compra,'
      '       Solicitacao_Compra_Item.Id_Item,'
      '       Solicitacao_Compra_Item.Id_Especie,'
      '       Solicitacao_Compra_Item.Qtde,'
      '       item.nome as Nome_Item,'
      '       item.unidade,'
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
    object qSolicitacao_Compra_ItemUNIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = []
      Size = 10
    end
    object qSolicitacao_Compra_ItemCALC_QTDE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_QTDE'
      ProviderFlags = []
      Size = 60
      Calculated = True
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
      '       fin_for_cli.razao_social as fornecedor,'
      '       pessoa.nome as pessoa_comprou,'
      
        '       (select Sum(coalesce(compra_item.valor_unitario*compra_it' +
        'em.qtde,0))'
      '          from compra_item '
      
        '        where compra_item.id_compra = compra.id)+ Coalesce(Compr' +
        'a.Valor_Frete,0) as Valor_Total,'
      '       case'
      
        '         when (Select count(*) from conta_pagar where conta_paga' +
        'r.id_compra = compra.id) > 0 then 1'
      '         else 0'
      '       end Gerou_Conta_Pagar'
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
    object qCompraGEROU_CONTA_PAGAR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'GEROU_CONTA_PAGAR'
      Origin = 'GEROU_CONTA_PAGAR'
      ProviderFlags = []
    end
  end
  object qCompra_Item: TRFQuery
    OnCalcFields = qEntrada_ItemCalcFields
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
      '       Item.tipo as tipo_item,'
      '       Item.Unidade'
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
    object qCompra_ItemUNIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qCompra_ItemCALC_QTDE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_QTDE'
      ProviderFlags = []
      Size = 60
      Calculated = True
    end
    object qCompra_ItemCALC_VALOR_TOTAL: TBCDField
      FieldKind = fkCalculated
      FieldName = 'CALC_VALOR_TOTAL'
      ProviderFlags = []
      currency = True
      Precision = 18
      Size = 2
      Calculated = True
    end
  end
  object qEntrada_Item: TRFQuery
    OnCalcFields = qEntrada_ItemCalcFields
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Entrada_Item.Id,'
      '       Entrada_Item.Id_Entrada,'
      '       Entrada_Item.Id_Item,'
      '       Entrada_Item.Id_Compra_Item,'
      '       Entrada_Item.Qtde,'
      '       Item.nome as nome_item,'
      '       Item.Unidade'
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
    object qEntrada_ItemUNIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 10
    end
    object qEntrada_ItemCALC_QTDE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_QTDE'
      ProviderFlags = []
      Size = 60
      Calculated = True
    end
  end
  object qSaida: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select distinct Saida.Id,'
      '       Saida.Data,'
      '       Saida.Tipo,'
      '       Saida.Id_Local_uso,'
      '       Local_Uso.Nome as Local_Uso'
      'from Saida'
      'left join local_uso on (local_uso.id = saida.id_local_uso)'
      'left join saida_Item on (saida_item.id_saida = saida.id)'
      
        'left join venda_item on (saida_item.id_venda_item = venda_item.i' +
        'd)'
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
    object qSaidaID_LOCAL_USO: TIntegerField
      FieldName = 'ID_LOCAL_USO'
      Origin = 'ID_LOCAL_USO'
      ProviderFlags = [pfInUpdate]
    end
    object qSaidaLOCAL_USO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LOCAL_USO'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object qSaida_Item: TRFQuery
    OnCalcFields = qEntrada_ItemCalcFields
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
      '       Saida_Item.Qtde,'
      '       Item.Unidade,'
      '       Saida_item.id_venda_item'
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
    object qSaida_ItemID_VENDA_ITEM: TIntegerField
      FieldName = 'ID_VENDA_ITEM'
      Origin = 'ID_VENDA_ITEM'
      ProviderFlags = [pfInUpdate]
    end
    object qSaida_ItemUNIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = []
      Size = 10
    end
    object qSaida_ItemCALC_QTDE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_QTDE'
      Size = 60
      Calculated = True
    end
  end
  object qVenda: TRFQuery
    OnCalcFields = qVendaCalcFields
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select distinct Venda.Id,'
      '       Venda.Id_Cliente,'
      '       Fin_For_Cli.razao_social as Cliente,'
      '       coalesce(Fin_For_Cli.CPF_CNPJ, cliente.cpf) as Cpf_Cnpj,'
      '       Venda.Id_Pessoa_Vendeu,'
      '       Pessoa.Nome as Vendedor,'
      '       Venda.Data,'
      '       Venda.Descricao,'
      
        '       (Select Trunc(Coalesce(Sum(venda_item.valor_unitario*vend' +
        'a_item.qtde),0),2) from'
      
        '       venda_item where venda_item.id_venda = venda.id) as Valor' +
        '_Total,'
      '       case'
      
        '         when (Select count(*) from saida_item where saida_item.' +
        'id_venda_item in (select venda_item.id from venda_item where ven' +
        'da_item.id_venda = venda.id)) > 0 then 1'
      '         else 0'
      '       end Saiu_Estoque,'
      '       case'
      
        '         when (Select count(*) from conta_receber where conta_re' +
        'ceber.id_venda = venda.id) > 0 then 1'
      '         else 0'
      '       end Gerou_Conta_Receber      '
      'from Venda '
      'inner join fin_for_cli on (fin_for_cli.id = Venda.id_cliente)'
      'left join venda_item on (venda.id = venda_item.id_venda)'
      
        'left join pessoa cliente on (fin_for_cli.id_contato = cliente.id' +
        ')'
      'inner join pessoa on (pessoa.id = venda.id_pessoa_vendeu)'
      '&WHERE')
    Left = 544
    Top = 168
    MacroData = <
      item
        Value = 'WHERE VENDA.ID = 0'
        Name = 'WHERE'
      end>
    object qVendaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qVendaID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qVendaID_PESSOA_VENDEU: TIntegerField
      FieldName = 'ID_PESSOA_VENDEU'
      Origin = 'ID_PESSOA_VENDEU'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qVendaDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qVendaCLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLIENTE'
      Origin = 'RAZAO_SOCIAL'
      ProviderFlags = []
      Size = 100
    end
    object qVendaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object qVendaVENDEDOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'VENDEDOR'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qVendaVALOR_TOTAL: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      ProviderFlags = []
      Precision = 18
    end
    object qVendaCPF_CNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      ProviderFlags = []
      ReadOnly = True
    end
    object qVendaCALC_VALOR_EXTENSO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_VALOR_EXTENSO'
      ProviderFlags = []
      Size = 120
      Calculated = True
    end
    object qVendaSAIU_ESTOQUE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SAIU_ESTOQUE'
      Origin = 'SAIU_ESTOQUE'
      ProviderFlags = []
    end
    object qVendaGEROU_CONTA_RECEBER: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'GEROU_CONTA_RECEBER'
      Origin = 'GEROU_CONTA_RECEBER'
      ProviderFlags = []
    end
  end
  object qVenda_Item: TRFQuery
    OnCalcFields = qEntrada_ItemCalcFields
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Venda_Item.Id,'
      '       Venda_Item.Id_Venda,'
      '       Venda_Item.Id_Item,'
      '       Item.nome as Item,'
      '       Venda_Item.Id_Especie,'
      '       Especie.nome as Especie,'
      '       Venda_Item.Qtde,'
      '       Venda_Item.Valor_Unitario,'
      '       Venda_item.Id_Lote_Semente,'
      '       Lote_Semente.Nome as Lote_Semente,'
      '       Venda_Item.Id_Lote_Muda,'
      '       Lote_Muda.nome as Lote_Muda,'
      '       Item.Unidade'
      'from Venda_Item'
      'inner join item on (item.id = venda_item.id_item)'
      'left join especie on (especie.id = venda_item.id_especie)'
      
        'left join lote_semente on (lote_semente.id = venda_item.id_lote_' +
        'semente)'
      'left join lote_muda on (lote_muda.id = Venda_Item.id_lote_muda)'
      'where Venda_Item.Id_Venda = :ID_VENDA')
    Left = 544
    Top = 232
    ParamData = <
      item
        Name = 'ID_VENDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qVenda_ItemID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qVenda_ItemID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Origin = 'ID_VENDA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qVenda_ItemID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      Origin = 'ID_ITEM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qVenda_ItemID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
    end
    object qVenda_ItemQTDE: TBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qVenda_ItemVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qVenda_ItemITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ITEM'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qVenda_ItemESPECIE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ESPECIE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qVenda_ItemID_LOTE_SEMENTE: TIntegerField
      FieldName = 'ID_LOTE_SEMENTE'
      Origin = 'ID_LOTE_SEMENTE'
      ProviderFlags = [pfInUpdate]
    end
    object qVenda_ItemLOTE_SEMENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LOTE_SEMENTE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 30
    end
    object qVenda_ItemID_LOTE_MUDA: TIntegerField
      FieldName = 'ID_LOTE_MUDA'
      Origin = 'ID_LOTE_MUDA'
      ProviderFlags = [pfInUpdate]
    end
    object qVenda_ItemLOTE_MUDA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LOTE_MUDA'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qVenda_ItemUNIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      ProviderFlags = []
      Size = 10
    end
    object qVenda_ItemCALC_QTDE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_QTDE'
      Size = 60
      Calculated = True
    end
    object qVenda_ItemCALC_VALOR_TOTAL: TBCDField
      FieldKind = fkCalculated
      FieldName = 'CALC_VALOR_TOTAL'
      ProviderFlags = []
      currency = True
      Precision = 18
      Size = 2
      Calculated = True
    end
  end
  object qLocal_Uso: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'Select Local_Uso.Id,'
      '       Local_Uso.Nome'
      'from Local_uso'
      '&WHERE')
    Left = 488
    Top = 32
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qLocal_UsoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qLocal_UsoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object dspqSaida: TDataSetProvider
    DataSet = qSaida
    Options = []
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dspqSaidaAfterUpdateRecord
    BeforeUpdateRecord = dspqSaidaBeforeUpdateRecord
    Left = 376
    Top = 168
  end
  object dspqSaida_Item: TDataSetProvider
    DataSet = qSaida_Item
    Options = []
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dspqSaida_ItemAfterUpdateRecord
    Left = 376
    Top = 232
  end
  object qItem_Patrimonio: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Item_Patrimonio.Id,'
      '       Item_Patrimonio.Nome,'
      '       Item_Patrimonio.Ativo,'
      '       Item_Patrimonio.Taxa_Depreciacao_Anual'
      'from Item_Patrimonio '
      '&WHERE')
    Left = 64
    Top = 288
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qItem_PatrimonioID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qItem_PatrimonioNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qItem_PatrimonioATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qItem_PatrimonioTAXA_DEPRECIACAO_ANUAL: TIntegerField
      FieldName = 'TAXA_DEPRECIACAO_ANUAL'
      Origin = 'TAXA_DEPRECIACAO_ANUAL'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qPatrimonio: TRFQuery
    OnCalcFields = qPatrimonioCalcFields
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Patrimonio.Id,'
      '       Patrimonio.Id_Item_Patrimonio,'
      '       Patrimonio.id_pessoa_responsavel,'
      '       Pessoa.nome as Responsavel,'
      '       Item_Patrimonio.Nome as Nome_Item,'
      '       Patrimonio.Data_Aquisicao,'
      '       Patrimonio.Identificacao,'
      '       Patrimonio.Marca,'
      '       Patrimonio.Modelo,'
      '       Patrimonio.Valor_Inicial,'
      '       Patrimonio.Taxa_Depreciacao_Anual,'
      '       Patrimonio.Localizacao,'
      '       Patrimonio.Nota_Fiscal,'
      '       Patrimonio.Status,'
      '       Patrimonio.Observacao'
      'from Patrimonio'
      
        'inner join Item_Patrimonio on (Item_Patrimonio.Id = Patrimonio.I' +
        'd_Item_Patrimonio)'
      
        'left join pessoa on (pessoa.id = patrimonio.id_pessoa_responsave' +
        'l)'
      '&WHERE')
    Left = 64
    Top = 368
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qPatrimonioID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qPatrimonioID_ITEM_PATRIMONIO: TIntegerField
      FieldName = 'ID_ITEM_PATRIMONIO'
      Origin = 'ID_ITEM_PATRIMONIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qPatrimonioNOME_ITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_ITEM'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
      Size = 100
    end
    object qPatrimonioDATA_AQUISICAO: TSQLTimeStampField
      FieldName = 'DATA_AQUISICAO'
      Origin = 'DATA_AQUISICAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qPatrimonioIDENTIFICACAO: TStringField
      FieldName = 'IDENTIFICACAO'
      Origin = 'IDENTIFICACAO'
      ProviderFlags = [pfInUpdate]
    end
    object qPatrimonioMARCA: TStringField
      FieldName = 'MARCA'
      Origin = 'MARCA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qPatrimonioVALOR_INICIAL: TBCDField
      FieldName = 'VALOR_INICIAL'
      Origin = 'VALOR_INICIAL'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qPatrimonioTAXA_DEPRECIACAO_ANUAL: TIntegerField
      FieldName = 'TAXA_DEPRECIACAO_ANUAL'
      Origin = 'TAXA_DEPRECIACAO_ANUAL'
      ProviderFlags = [pfInUpdate]
    end
    object qPatrimonioLOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      Origin = 'LOCALIZACAO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qPatrimonioNOTA_FISCAL: TStringField
      FieldName = 'NOTA_FISCAL'
      Origin = 'NOTA_FISCAL'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object qPatrimonioSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = [pfInUpdate]
    end
    object qPatrimonioCALC_VALOR_ATUAL: TBCDField
      FieldKind = fkCalculated
      FieldName = 'CALC_VALOR_ATUAL'
      ProviderFlags = []
      Precision = 18
      Size = 2
      Calculated = True
    end
    object qPatrimonioMODELO: TStringField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qPatrimonioOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object qPatrimonioID_PESSOA_RESPONSAVEL: TIntegerField
      FieldName = 'ID_PESSOA_RESPONSAVEL'
      Origin = 'ID_PESSOA_RESPONSAVEL'
      ProviderFlags = [pfInUpdate]
    end
    object qPatrimonioRESPONSAVEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RESPONSAVEL'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object qModelo_Orcamento: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Modelo_Orcamento.Id,'
      '       Modelo_Orcamento.Nome,'
      '       Modelo_Orcamento.Descricao,'
      '       Modelo_Orcamento.Modelo'
      'from Modelo_Orcamento  '
      '&WHERE')
    Left = 520
    Top = 312
    MacroData = <
      item
        Value = 'WHERE ID = 0'
        Name = 'WHERE'
      end>
    object qModelo_OrcamentoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qModelo_OrcamentoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qModelo_OrcamentoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object qModelo_OrcamentoMODELO: TBlobField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qOrcamento: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Orcamento.Id,'
      '       Orcamento.Id_Modelo_Orcamento,'
      '       Modelo_Orcamento.Nome,'
      '       Orcamento.Id_Responsavel,'
      '       Pessoa.Nome as Responsavel,'
      '       Orcamento.Id_Cliente,'
      '       Fin_For_Cli.Razao_Social as Cliente,'
      '       Orcamento.Data,'
      '       Orcamento.Id_Venda,'
      '       Orcamento.Id_Saida'
      'from Orcamento  '
      
        'inner join modelo_orcamento on (modelo_orcamento.id = orcamento.' +
        'id_modelo_orcamento)'
      'inner join pessoa on (pessoa.id = orcamento.id_responsavel)'
      
        'inner join fin_for_cli on (fin_for_cli.id = orcamento.id_cliente' +
        ')'
      '&WHERE')
    Left = 664
    Top = 232
    MacroData = <
      item
        Value = 'where orcamento.id = 0'
        Name = 'WHERE'
      end>
    object qOrcamentoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOrcamentoID_MODELO_ORCAMENTO: TIntegerField
      FieldName = 'ID_MODELO_ORCAMENTO'
      Origin = 'ID_MODELO_ORCAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qOrcamentoNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qOrcamentoID_RESPONSAVEL: TIntegerField
      FieldName = 'ID_RESPONSAVEL'
      Origin = 'ID_RESPONSAVEL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qOrcamentoRESPONSAVEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RESPONSAVEL'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qOrcamentoID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qOrcamentoCLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLIENTE'
      Origin = 'RAZAO_SOCIAL'
      ProviderFlags = []
      Size = 100
    end
    object qOrcamentoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qOrcamentoID_VENDA: TIntegerField
      FieldName = 'ID_VENDA'
      Origin = 'ID_VENDA'
      ProviderFlags = [pfInUpdate]
    end
    object qOrcamentoID_SAIDA: TIntegerField
      FieldName = 'ID_SAIDA'
      Origin = 'ID_SAIDA'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qOrcamento_Orcamento: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Orcamento.Id,'
      '       Orcamento.Orcamento'
      'from Orcamento  '
      'where orcamento.id = :ID')
    Left = 656
    Top = 304
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qOrcamento_OrcamentoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOrcamento_OrcamentoORCAMENTO: TBlobField
      FieldName = 'ORCAMENTO'
      Origin = 'ORCAMENTO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qOrcamento_Item: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select ORCAMENTO_ITEM.ID,'
      '       ORCAMENTO_ITEM.ID_ORCAMENTO,'
      '       ORCAMENTO_ITEM.ID_ITEM,'
      '       Item.nome as Item,'
      '       ORCAMENTO_ITEM.ID_ESPECIE,'
      '       Especie.nome as especie,'
      '       ORCAMENTO_ITEM.QTDE,'
      '       ORCAMENTO_ITEM.VALOR_UNITARIO,'
      '       ORCAMENTO_ITEM.TAMANHO,'
      '       Especie.nome_cientifico,'
      '       Familia_Botanica.nome as Familia_botanica'
      'from ORCAMENTO_ITEM '
      'INNER join item on (item.id = orcamento_item.id_item)'
      'inner join especie on (especie.id = orcamento_item.id_especie)'
      
        'inner join Familia_Botanica on (especie.id_Familia_Botanica = Fa' +
        'milia_Botanica.id)'
      'where ORCAMENTO_ITEM.id_orcamento = :ID_ORCAMENTO')
    Left = 776
    Top = 240
    ParamData = <
      item
        Name = 'ID_ORCAMENTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qOrcamento_ItemID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOrcamento_ItemID_ORCAMENTO: TIntegerField
      FieldName = 'ID_ORCAMENTO'
      Origin = 'ID_ORCAMENTO'
      Required = True
    end
    object qOrcamento_ItemID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      Origin = 'ID_ITEM'
      Required = True
    end
    object qOrcamento_ItemID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      Required = True
    end
    object qOrcamento_ItemQTDE: TBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      Required = True
      Precision = 18
    end
    object qOrcamento_ItemVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      Required = True
      Precision = 18
      Size = 2
    end
    object qOrcamento_ItemITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ITEM'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qOrcamento_ItemESPECIE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ESPECIE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qOrcamento_ItemTAMANHO: TBCDField
      FieldName = 'TAMANHO'
      Origin = 'TAMANHO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qOrcamento_ItemNOME_CIENTIFICO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_CIENTIFICO'
      Origin = 'NOME_CIENTIFICO'
      ProviderFlags = []
      Size = 100
    end
    object qOrcamento_ItemFAMILIA_BOTANICA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FAMILIA_BOTANICA'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object qOrcamento_Customizado: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Orcamento_Customizado.Id,'
      '       Orcamento_Customizado.Id_Orcamento,'
      '       Orcamento_Customizado.Campo,'
      '       Orcamento_Customizado.Conteudo'
      'from Orcamento_Customizado  '
      'where Orcamento_Customizado.id_orcamento = :ID_ORCAMENTO')
    Left = 664
    Top = 368
    ParamData = <
      item
        Name = 'ID_ORCAMENTO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qOrcamento_CustomizadoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qOrcamento_CustomizadoID_ORCAMENTO: TIntegerField
      FieldName = 'ID_ORCAMENTO'
      Origin = 'ID_ORCAMENTO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qOrcamento_CustomizadoCAMPO: TStringField
      FieldName = 'CAMPO'
      Origin = 'CAMPO'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qOrcamento_CustomizadoCONTEUDO: TStringField
      FieldName = 'CONTEUDO'
      Origin = 'CONTEUDO'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
  end
end
