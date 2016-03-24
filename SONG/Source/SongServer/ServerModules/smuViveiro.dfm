inherited smViveiro: TsmViveiro
  OldCreateOrder = True
  Height = 289
  Width = 787
  object qEspecie: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select ESPECIE.ID,'
      '       ESPECIE.NOME,'
      '       ESPECIE.NOME_CIENTIFICO,'
      '       ESPECIE.FAMILIA_BOTANICA,'
      '       ESPECIE.QTDE_SEMENTE_KILO,'
      '       Especie.Valor_Muda,'
      '       Especie.Valor_Kg_Semente,'
      '       Especie.Tempo_Germinacao,'
      '       ESPECIE.OBSERVACAO,'
      '       Especie.Inicio_Periodo_Coleta,'
      '       Especie.Fim_Periodo_Coleta'
      'from ESPECIE  '
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
      Required = True
      Size = 100
    end
    object qEspecieNOME_CIENTIFICO: TStringField
      FieldName = 'NOME_CIENTIFICO'
      Origin = 'NOME_CIENTIFICO'
      Size = 100
    end
    object qEspecieFAMILIA_BOTANICA: TStringField
      FieldName = 'FAMILIA_BOTANICA'
      Origin = 'FAMILIA_BOTANICA'
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
    object qEspecieINICIO_PERIODO_COLETA: TDateField
      FieldName = 'INICIO_PERIODO_COLETA'
      Origin = 'INICIO_PERIODO_COLETA'
      ProviderFlags = [pfInUpdate]
    end
    object qEspecieFIM_PERIODO_COLETA: TDateField
      FieldName = 'FIM_PERIODO_COLETA'
      Origin = 'FIM_PERIODO_COLETA'
      ProviderFlags = [pfInUpdate]
    end
    object qEspecieOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
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
      '       pessoa.nome as pessoa_coletou'
      'from Lote_Semente'
      'inner join Especie on (Especie.Id = Lote_Semente.Id_Especie)'
      
        'inner join pessoa on (pessoa.id = lote_semente.id_pessoa_coletou' +
        ')'
      '&WHERE')
    Left = 168
    Top = 16
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
  end
  object qLote_Semente_Matriz: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select LOTE_SEMENTE_MATRIZ.ID,'
      '       LOTE_SEMENTE_MATRIZ.ID_LOTE_SEMENTE,'
      '       LOTE_SEMENTE_MATRIZ.ID_MATRIZ'
      'from LOTE_SEMENTE_MATRIZ  '
      'where LOTE_SEMENTE_MATRIZ.ID_LOTE_SEMENTE = :ID_LOTE_SEMENTE')
    Left = 320
    Top = 16
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
    Left = 112
    Top = 96
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
    object qGerminacaoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Origin = '"DATA"'
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
    Left = 200
    Top = 96
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
      '       Lote_Muda.Nome,'
      '       Lote_Muda.Qtde_Inicial,'
      '       Lote_Muda.Data,'
      '       Lote_Muda.Observacao,'
      '       especie.nome as nome_especie'
      'from Lote_Muda'
      'inner join Especie on (Especie.Id = Lote_Muda.Id_Especie)'
      '&where')
    Left = 320
    Top = 96
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
    object qLote_MudaDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qLote_MudaNOME_ESPECIE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_ESPECIE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qLote_MudaOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
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
      
        'inner join pessoa on (pessoa.id = classificacao.id_pessoa_classi' +
        'ficou)'
      'where Classificacao.id_lote_Muda = :id_lote_muda')
    Left = 408
    Top = 104
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
    object qClassificacaoPESSOA_CLASSIFICOU: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PESSOA_CLASSIFICOU'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qClassificacaoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
  end
end
