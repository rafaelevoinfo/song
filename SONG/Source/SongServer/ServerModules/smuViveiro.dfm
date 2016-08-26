inherited smViveiro: TsmViveiro
  OldCreateOrder = True
  Height = 289
  Width = 787
  inherited qAux: TRFQuery
    Left = 104
    Top = 80
  end
  object qEspecie: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select ESPECIE.ID,'
      '       ESPECIE.NOME,'
      '       ESPECIE.NOME_CIENTIFICO,'
      '       ESPECIE.ID_FAMILIA_BOTANICA,'
      '       familia_botanica.nome as FAMILIA_BOTANICA,'
      '       ESPECIE.QTDE_SEMENTE_KILO,'
      '       Especie.Valor_Muda,'
      '       Especie.Valor_Kg_Semente,'
      '       Especie.Tempo_Germinacao,'
      '       Especie.Tempo_Desenvolvimento,'
      '       ESPECIE.OBSERVACAO,'
      '       Especie.Mes_Inicio_Coleta,'
      '       Especie.Mes_Fim_Coleta,'
      '       ESPECIE.PESO_MEDIO_SEMENTE,'
      '       ESPECIE.Qtde_Semente_Tubete,'
      
        '       Coalesce(Especie.qtde_semente_estoque,0) as qtde_semente_' +
        'estoque,'
      '       Coalesce(Especie.qtde_muda_pronta,0) as qtde_muda_pronta,'
      
        '       Coalesce(Especie.qtde_muda_desenvolvimento,0) as qtde_mud' +
        'a_desenvolvimento'
      'from ESPECIE  '
      
        'left join familia_botanica on (especie.id_familia_botanica = fam' +
        'ilia_botanica.id)'
      '&WHERE')
    Left = 32
    Top = 16
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qEspecieID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qEspecieNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qEspecieNOME_CIENTIFICO: TStringField
      FieldName = 'NOME_CIENTIFICO'
      Origin = 'NOME_CIENTIFICO'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qEspecieFAMILIA_BOTANICA: TStringField
      FieldName = 'FAMILIA_BOTANICA'
      Origin = 'FAMILIA_BOTANICA'
      ProviderFlags = []
      Size = 100
    end
    object qEspecieQTDE_SEMENTE_KILO: TIntegerField
      FieldName = 'QTDE_SEMENTE_KILO'
      Origin = 'QTDE_SEMENTE_KILO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qEspecieVALOR_MUDA: TBCDField
      FieldName = 'VALOR_MUDA'
      Origin = 'VALOR_MUDA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qEspecieVALOR_KG_SEMENTE: TBCDField
      FieldName = 'VALOR_KG_SEMENTE'
      Origin = 'VALOR_KG_SEMENTE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qEspecieTEMPO_GERMINACAO: TIntegerField
      FieldName = 'TEMPO_GERMINACAO'
      Origin = 'TEMPO_GERMINACAO'
      ProviderFlags = [pfInUpdate]
    end
    object qEspecieOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object qEspecieQTDE_SEMENTE_ESTOQUE: TBCDField
      FieldName = 'QTDE_SEMENTE_ESTOQUE'
      Origin = 'QTDE_SEMENTE_ESTOQUE'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qEspecieTEMPO_DESENVOLVIMENTO: TIntegerField
      FieldName = 'TEMPO_DESENVOLVIMENTO'
      Origin = 'TEMPO_DESENVOLVIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object qEspecieQTDE_MUDA_PRONTA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTDE_MUDA_PRONTA'
      Origin = 'QTDE_MUDA_PRONTA'
      ProviderFlags = []
    end
    object qEspecieQTDE_MUDA_DESENVOLVIMENTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QTDE_MUDA_DESENVOLVIMENTO'
      Origin = 'QTDE_MUDA_DESENVOLVIMENTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qEspecieMES_INICIO_COLETA: TIntegerField
      FieldName = 'MES_INICIO_COLETA'
      Origin = 'MES_INICIO_COLETA'
      ProviderFlags = [pfInUpdate]
    end
    object qEspecieMES_FIM_COLETA: TIntegerField
      FieldName = 'MES_FIM_COLETA'
      Origin = 'MES_FIM_COLETA'
      ProviderFlags = [pfInUpdate]
    end
    object qEspecieID_FAMILIA_BOTANICA: TIntegerField
      FieldName = 'ID_FAMILIA_BOTANICA'
      Origin = 'ID_FAMILIA_BOTANICA'
      ProviderFlags = [pfInUpdate]
    end
    object qEspeciePESO_MEDIO_SEMENTE: TBCDField
      FieldName = 'PESO_MEDIO_SEMENTE'
      Origin = 'PESO_MEDIO_SEMENTE'
      ProviderFlags = [pfInUpdate]
      Precision = 15
    end
    object qEspecieQTDE_SEMENTE_TUBETE: TIntegerField
      FieldName = 'QTDE_SEMENTE_TUBETE'
      Origin = 'QTDE_SEMENTE_TUBETE'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qMatriz: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select MATRIZ.ID,'
      '       MATRIZ.ID_ESPECIE,'
      '       MATRIZ.NOME,'
      '       MATRIZ.ENDERECO,'
      '       MATRIZ.LATITUDE,'
      '       MATRIZ.LONGITUDE,'
      '       MATRIZ.DESCRICAO,'
      '       MATRIZ.FOTO,'
      '       ESPECIE.NOME as ESPECIE'
      'from MATRIZ'
      'INNER JOIN ESPECIE ON (ESPECIE.ID = MATRIZ.ID_ESPECIE)'
      '&WHERE')
    Left = 96
    Top = 16
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qMatrizID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qMatrizID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qMatrizENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object qMatrizLATITUDE: TFMTBCDField
      FieldName = 'LATITUDE'
      Origin = 'LATITUDE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 6
    end
    object qMatrizLONGITUDE: TFMTBCDField
      FieldName = 'LONGITUDE'
      Origin = 'LONGITUDE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 6
    end
    object qMatrizESPECIE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ESPECIE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qMatrizNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qMatrizFOTO: TBlobField
      FieldName = 'FOTO'
      Origin = 'FOTO'
      ProviderFlags = [pfInUpdate]
    end
    object qMatrizDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
  end
  object qLote_Semente: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Lote_Semente.Id,'
      '       Lote_Semente.Id_Especie,'
      '       Lote_Semente.Id_Compra_Item,'
      '       Lote_Semente.Id_Pessoa_Coletou,'
      '       Lote_Semente.Nome,'
      '       Lote_Semente.Data,'
      '       Lote_Semente.Qtde,'
      '       Lote_Semente.Qtde_Armazenada,'
      '       (select sum(Semeadura.Qtde_Semeada)'
      '        from Semeadura'
      
        '        where Semeadura.Id_Lote_Semente = Lote_Semente.Id) as Qt' +
        'de_Semeada,'
      '       Lote_Semente.Taxa_Germinacao,'
      '       Lote_Semente.Taxa_Descarte,'
      '       Lote_Semente.Status,'
      '       Especie.Nome as Nome_Especie,'
      '       pessoa.nome as pessoa_coletou,'
      '       Lote_Semente.id_camara_fria,'
      '       Camara_Fria.nome as Camara_Fria,'
      '       Lote_Semente.id_lote_semente_origem,'
      '       fin_for_cli.razao_social'
      'from Lote_Semente'
      'inner join Especie on (Especie.Id = Lote_Semente.Id_Especie)'
      
        'inner join pessoa on (pessoa.id = lote_semente.id_pessoa_coletou' +
        ')'
      
        'left join camara_fria on (camara_fria.id = lote_semente.id_camar' +
        'a_fria)'
      
        'left join compra_item on (compra_item.id = lote_semente.id_compr' +
        'a_item)'
      'left join compra on (compra_item.id_compra = compra.id)'
      'left join fin_for_cli on (compra.id_fornecedor = fin_for_cli.id)'
      '&WHERE')
    Left = 376
    Top = 144
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qLote_SementeID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qLote_SementeID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qLote_SementeID_PESSOA_COLETOU: TIntegerField
      FieldName = 'ID_PESSOA_COLETOU'
      Origin = 'ID_PESSOA_COLETOU'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qLote_SementeNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object qLote_SementeDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qLote_SementeNOME_ESPECIE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_ESPECIE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qLote_SementeQTDE: TBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qLote_SementeQTDE_ARMAZENADA: TBCDField
      FieldName = 'QTDE_ARMAZENADA'
      Origin = 'QTDE_ARMAZENADA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qLote_SementeTAXA_GERMINACAO: TBCDField
      FieldName = 'TAXA_GERMINACAO'
      Origin = 'TAXA_GERMINACAO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qLote_SementeTAXA_DESCARTE: TBCDField
      FieldName = 'TAXA_DESCARTE'
      Origin = 'TAXA_DESCARTE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qLote_SementeSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = [pfInUpdate]
    end
    object qLote_SementeQTDE_SEMEADA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTDE_SEMEADA'
      Origin = 'QTDE_SEMEADA'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qLote_SementePESSOA_COLETOU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PESSOA_COLETOU'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qLote_SementeID_COMPRA_ITEM: TIntegerField
      FieldName = 'ID_COMPRA_ITEM'
      Origin = 'ID_COMPRA_ITEM'
      ProviderFlags = [pfInUpdate]
    end
    object qLote_SementeID_CAMARA_FRIA: TIntegerField
      FieldName = 'ID_CAMARA_FRIA'
      Origin = 'ID_CAMARA_FRIA'
      ProviderFlags = [pfInUpdate]
    end
    object qLote_SementeCAMARA_FRIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CAMARA_FRIA'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qLote_SementeID_LOTE_SEMENTE_ORIGEM: TIntegerField
      FieldName = 'ID_LOTE_SEMENTE_ORIGEM'
      Origin = 'ID_LOTE_SEMENTE_ORIGEM'
      ProviderFlags = [pfInUpdate]
    end
    object qLote_SementeRAZAO_SOCIAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      ProviderFlags = []
      Size = 100
    end
  end
  object qLote_Semente_Matriz: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select LOTE_SEMENTE_MATRIZ.ID,'
      '       LOTE_SEMENTE_MATRIZ.ID_LOTE_SEMENTE,'
      '       LOTE_SEMENTE_MATRIZ.ID_MATRIZ'
      'from LOTE_SEMENTE_MATRIZ  '
      'where LOTE_SEMENTE_MATRIZ.ID_LOTE_SEMENTE = :ID_LOTE_SEMENTE')
    Left = 440
    Top = 32
    ParamData = <
      item
        Name = 'ID_LOTE_SEMENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qLote_Semente_MatrizID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qLote_Semente_MatrizID_LOTE_SEMENTE: TIntegerField
      FieldName = 'ID_LOTE_SEMENTE'
      Origin = 'ID_LOTE_SEMENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qLote_Semente_MatrizID_MATRIZ: TIntegerField
      FieldName = 'ID_MATRIZ'
      Origin = 'ID_MATRIZ'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qGerminacao: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Germinacao.Id,'
      '       Germinacao.Id_Lote_Semente,'
      '       Germinacao.Id_Pessoa_Verificou,'
      '       Germinacao.Data,'
      '       Germinacao.Qtde_Germinada,'
      '       Pessoa.nome as pessoa_verificou'
      'from Germinacao'
      
        'inner join pessoa on (pessoa.id = germinacao.id_pessoa_verificou' +
        ')'
      'where Germinacao.Id_Lote_Semente = :Id_Lote_Semente  ')
    Left = 248
    Top = 144
    ParamData = <
      item
        Name = 'ID_LOTE_SEMENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qGerminacaoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qGerminacaoID_LOTE_SEMENTE: TIntegerField
      FieldName = 'ID_LOTE_SEMENTE'
      Origin = 'ID_LOTE_SEMENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qGerminacaoID_PESSOA_VERIFICOU: TIntegerField
      FieldName = 'ID_PESSOA_VERIFICOU'
      Origin = 'ID_PESSOA_VERIFICOU'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qGerminacaoQTDE_GERMINADA: TIntegerField
      FieldName = 'QTDE_GERMINADA'
      Origin = 'QTDE_GERMINADA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qGerminacaoPESSOA_VERIFICOU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PESSOA_VERIFICOU'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qGerminacaoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qSemeadura: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Semeadura.Id,'
      '       Semeadura.Id_Lote_Semente,'
      '       Semeadura.Id_Pessoa_Semeou,'
      '       Semeadura.id_canteiro,'
      '       Semeadura.Qtde_Semeada,'
      '       Semeadura.Qtde_Tubete,'
      '       Semeadura.Data,'
      '       Semeadura.DATA_PREVISTA_GERMINACAO,'
      '       Semeadura.Observacao,'
      '       Pessoa.nome as pessoa_semeou,'
      '       Canteiro.nome as nome_canteiro'
      'from Semeadura'
      'inner join pessoa on (pessoa.id = semeadura.id_pessoa_semeou)'
      'inner join Canteiro on (canteiro.id = semeadura.id_canteiro)'
      'where Semeadura.Id_Lote_Semente = :Id_Lote_Semente   ')
    Left = 600
    Top = 152
    ParamData = <
      item
        Name = 'ID_LOTE_SEMENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qSemeaduraID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qSemeaduraID_LOTE_SEMENTE: TIntegerField
      FieldName = 'ID_LOTE_SEMENTE'
      Origin = 'ID_LOTE_SEMENTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qSemeaduraID_PESSOA_SEMEOU: TIntegerField
      FieldName = 'ID_PESSOA_SEMEOU'
      Origin = 'ID_PESSOA_SEMEOU'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qSemeaduraQTDE_SEMEADA: TBCDField
      FieldName = 'QTDE_SEMEADA'
      Origin = 'QTDE_SEMEADA'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qSemeaduraDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qSemeaduraID_CANTEIRO: TIntegerField
      FieldName = 'ID_CANTEIRO'
      Origin = 'ID_CANTEIRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qSemeaduraPESSOA_SEMEOU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PESSOA_SEMEOU'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qSemeaduraNOME_CANTEIRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_CANTEIRO'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qSemeaduraDATA_PREVISTA_GERMINACAO: TSQLTimeStampField
      FieldName = 'DATA_PREVISTA_GERMINACAO'
      Origin = 'DATA_PREVISTA_GERMINACAO'
      ProviderFlags = [pfInUpdate]
    end
    object qSemeaduraQTDE_TUBETE: TIntegerField
      FieldName = 'QTDE_TUBETE'
      Origin = 'QTDE_TUBETE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qSemeaduraOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
  end
  object qCanteiro: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Canteiro.Id,'
      '       Canteiro.Nome,'
      '       Canteiro.Descricao'
      'from Canteiro  '
      '&WHERE')
    Left = 112
    Top = 152
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qCanteiroID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qCanteiroNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qCanteiroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 1000
    end
  end
  object qLote_Muda: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Lote_Muda.Id,'
      '       Lote_Muda.Id_Especie,'
      '       Especie.nome as nome_especie,'
      '       Lote_Muda.Id_Lote_Semente,'
      '       Lote_Muda.Id_Compra_Item,'
      '       Lote_Muda.Nome,'
      '       Lote_Muda.Qtde_Inicial,'
      '       Lote_Muda.Data,'
      '       Lote_Muda.Observacao,'
      '       Lote_Muda.Taxa_Classificacao,'
      '       Lote_Muda.Saldo,'
      '       Lote_Muda.Status,'
      '       fin_for_cli.razao_social'
      'from Lote_Muda  '
      'inner join Especie on (Especie.Id = Lote_Muda.Id_Especie)'
      
        'left join compra_item on (compra_item.id = lote_muda.id_compra_i' +
        'tem)'
      'left join compra on (compra_item.id_compra = compra.id)'
      'left join fin_for_cli on (compra.id_fornecedor = fin_for_cli.id)'
      '&where')
    Left = 488
    Top = 144
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qLote_MudaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qLote_MudaID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qLote_MudaID_LOTE_SEMENTE: TIntegerField
      FieldName = 'ID_LOTE_SEMENTE'
      Origin = 'ID_LOTE_SEMENTE'
      ProviderFlags = [pfInUpdate]
    end
    object qLote_MudaID_COMPRA_ITEM: TIntegerField
      FieldName = 'ID_COMPRA_ITEM'
      Origin = 'ID_COMPRA_ITEM'
      ProviderFlags = [pfInUpdate]
    end
    object qLote_MudaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qLote_MudaQTDE_INICIAL: TIntegerField
      FieldName = 'QTDE_INICIAL'
      Origin = 'QTDE_INICIAL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qLote_MudaDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qLote_MudaOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object qLote_MudaSALDO: TIntegerField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      ProviderFlags = [pfInUpdate]
    end
    object qLote_MudaTAXA_CLASSIFICACAO: TBCDField
      FieldName = 'TAXA_CLASSIFICACAO'
      Origin = 'TAXA_CLASSIFICACAO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qLote_MudaNOME_ESPECIE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_ESPECIE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qLote_MudaSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qLote_MudaRAZAO_SOCIAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      ProviderFlags = []
      Size = 100
    end
  end
  object dspqLote_Muda: TDataSetProvider
    DataSet = qLote_Muda
    Options = []
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dspqLote_MudaAfterUpdateRecord
    Left = 488
    Top = 208
  end
  object dspqLote_Semente: TDataSetProvider
    DataSet = qLote_Semente
    Options = []
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dspqLote_SementeAfterUpdateRecord
    Left = 376
    Top = 200
  end
  object dspqSemeadura: TDataSetProvider
    DataSet = qSemeadura
    Options = []
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dspqSemeaduraAfterUpdateRecord
    Left = 600
    Top = 208
  end
  object dspqGerminacao: TDataSetProvider
    DataSet = qGerminacao
    Options = []
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dspqGerminacaoAfterUpdateRecord
    Left = 248
    Top = 216
  end
  object qClassificacao: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Classificacao.Id,'
      '       Classificacao.Id_Lote_Muda,'
      '       Classificacao.Id_Pessoa_Classificou,'
      '       Classificacao.Data,'
      '       Classificacao.Qtde,'
      '       Classificacao.Observacao,'
      '       Pessoa.nome as Pessoa_Classificou'
      'from Classificacao'
      
        'inner join Pessoa on (Pessoa.Id = Classificacao.Id_Pessoa_Classi' +
        'ficou)  '
      'where Classificacao.Id_Lote_Muda = :ID_LOTE_MUDA')
    Left = 576
    Top = 32
    ParamData = <
      item
        Name = 'ID_LOTE_MUDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qClassificacaoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qClassificacaoID_LOTE_MUDA: TIntegerField
      FieldName = 'ID_LOTE_MUDA'
      Origin = 'ID_LOTE_MUDA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qClassificacaoID_PESSOA_CLASSIFICOU: TIntegerField
      FieldName = 'ID_PESSOA_CLASSIFICOU'
      Origin = 'ID_PESSOA_CLASSIFICOU'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qClassificacaoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qClassificacaoQTDE: TIntegerField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qClassificacaoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object qClassificacaoPESSOA_CLASSIFICOU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PESSOA_CLASSIFICOU'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object qLote_Muda_Canteiro: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Lote_Muda_Canteiro.Id,'
      '       Lote_Muda_Canteiro.Id_Lote_Muda,'
      '       Lote_Muda_Canteiro.Id_Canteiro,'
      '       Canteiro.Nome as Nome_Canteiro'
      'from lote_muda_canteiro'
      
        'inner join Canteiro on (Canteiro.Id = Lote_Muda_Canteiro.Id_Cant' +
        'eiro)'
      'where Lote_Muda_Canteiro.Id_Lote_Muda = :Id_Lote_Muda ')
    Left = 712
    Top = 152
    ParamData = <
      item
        Name = 'ID_LOTE_MUDA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qLote_Muda_CanteiroID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qLote_Muda_CanteiroID_LOTE_MUDA: TIntegerField
      FieldName = 'ID_LOTE_MUDA'
      Origin = 'ID_LOTE_MUDA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qLote_Muda_CanteiroID_CANTEIRO: TIntegerField
      FieldName = 'ID_CANTEIRO'
      Origin = 'ID_CANTEIRO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qLote_Muda_CanteiroNOME_CANTEIRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_CANTEIRO'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object dspqClassificacao: TDataSetProvider
    DataSet = qClassificacao
    Options = []
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dspqClassificacaoAfterUpdateRecord
    Left = 576
    Top = 96
  end
  object qFamilia_Botanica: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Familia_Botanica.Id,'
      '       Familia_Botanica.Nome'
      'from Familia_Botanica'
      '&WHERE')
    Left = 192
    Top = 24
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
  end
  object qCamara_Fria: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Camara_Fria.Id,'
      '       Camara_Fria.Nome'
      'from Camara_Fria  ')
    Left = 312
    Top = 56
    object qCamara_FriaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qCamara_FriaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
end
