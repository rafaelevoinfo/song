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
      '       ESPECIE.OBSERVACAO'
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
    object qEspecieOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      Size = 500
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
    object qMatrizDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
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
  end
  object qLote: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select LOTE.ID,'
      '       LOTE.ID_ESPECIE,'
      '       LOTE.ID_PESSOA_COLETOU,'
      '       LOTE.NOME,'
      '       LOTE.DATA,'
      '       LOTE.QTDE,'
      '       LOTE.QTDE_ARMAZENADA,'
      
        '       (Select sum(semeadura.qtde_semeada) from semeadura where ' +
        'semeadura.id_lote = lote.id) as QTDE_SEMEADA,'
      '       Lote.Taxa_Germinacao,'
      '       Lote.Taxa_Descarte,'
      '       Lote.Status, '
      '       ESPECIE.NOME AS NOME_ESPECIE'
      'from LOTE'
      'inner join especie on (especie.id = lote.id_especie)'
      '&WHERE')
    Left = 168
    Top = 16
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qLoteID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qLoteID_ESPECIE: TIntegerField
      FieldName = 'ID_ESPECIE'
      Origin = 'ID_ESPECIE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qLoteID_PESSOA_COLETOU: TIntegerField
      FieldName = 'ID_PESSOA_COLETOU'
      Origin = 'ID_PESSOA_COLETOU'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qLoteNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object qLoteDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qLoteNOME_ESPECIE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_ESPECIE'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qLoteQTDE: TBCDField
      FieldName = 'QTDE'
      Origin = 'QTDE'
      ProviderFlags = [pfInUpdate]
      Required = True
      Precision = 18
      Size = 2
    end
    object qLoteQTDE_ARMAZENADA: TBCDField
      FieldName = 'QTDE_ARMAZENADA'
      Origin = 'QTDE_ARMAZENADA'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qLoteTAXA_GERMINACAO: TBCDField
      FieldName = 'TAXA_GERMINACAO'
      Origin = 'TAXA_GERMINACAO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qLoteTAXA_DESCARTE: TBCDField
      FieldName = 'TAXA_DESCARTE'
      Origin = 'TAXA_DESCARTE'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
    end
    object qLoteSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = [pfInUpdate]
    end
    object qLoteQTDE_SEMEADA: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTDE_SEMEADA'
      Origin = 'QTDE_SEMEADA'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
  end
  object qLote_Matriz: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select LOTE_MATRIZ.ID,'
      '       LOTE_MATRIZ.ID_LOTE,'
      '       LOTE_MATRIZ.ID_MATRIZ'
      'from LOTE_MATRIZ  '
      'where LOTE_MATRIZ.ID_LOTE = :ID_LOTE')
    Left = 224
    Top = 16
    ParamData = <
      item
        Name = 'ID_LOTE'
        ParamType = ptInput
      end>
    object qLote_MatrizID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qLote_MatrizID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
      Origin = 'ID_LOTE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qLote_MatrizID_MATRIZ: TIntegerField
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
      '       Germinacao.Id_Lote,'
      '       Germinacao.Id_Pessoa_Verificou,'
      '       Germinacao.Data,'
      '       Germinacao.Qtde_Germinada,'
      '       Pessoa.nome as pessoa_verificou'
      'from Germinacao'
      
        'inner join pessoa on (pessoa.id = germinacao.id_pessoa_verificou' +
        ')'
      'where Germinacao.Id_Lote = :Id_Lote  ')
    Left = 112
    Top = 96
    ParamData = <
      item
        Name = 'ID_LOTE'
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
    object qGerminacaoID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
      Origin = 'ID_LOTE'
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
      '       Semeadura.Id_Lote,'
      '       Semeadura.Id_Pessoa_Semeou,'
      '       Semeadura.id_canteiro,'
      '       Semeadura.Qtde_Semeada,'
      '       Semeadura.Data,'
      '       Semeadura.DATA_PREVISTA_GERMINACAO,'
      '       Semeadura.Observacao,'
      '       Pessoa.nome as pessoa_semeou,'
      '       Canteiro.nome as nome_canteiro'
      'from Semeadura'
      'inner join pessoa on (pessoa.id = semeadura.id_pessoa_semeou)'
      'inner join Canteiro on (canteiro.id = semeadura.id_canteiro)'
      'where Semeadura.Id_Lote = :Id_Lote   ')
    Left = 200
    Top = 96
    ParamData = <
      item
        Name = 'ID_LOTE'
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
    object qSemeaduraID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
      Origin = 'ID_LOTE'
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
    object qSemeaduraOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      Size = 500
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
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
  end
end
