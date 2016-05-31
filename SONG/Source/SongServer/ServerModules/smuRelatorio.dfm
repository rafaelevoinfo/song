inherited smRelatorio: TsmRelatorio
  OldCreateOrder = True
  Height = 390
  Width = 551
  object qSaldo_Rubrica: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select distinct view_rubrica_projeto.id_rubrica,'
      '                view_rubrica_projeto.id_projeto,'
      '                view_rubrica_projeto.nome_projeto,'
      
        '                Rubrica.Identificador || '#39' - '#39' || Rubrica.Nome a' +
        's Nome_Rubrica,'
      '                view_rubrica_projeto.orcamento,'
      '                view_rubrica_projeto.valor_recebido as Recebido,'
      '                view_rubrica_projeto.valor_gasto as Gasto,'
      
        '                view_rubrica_projeto.valor_aprovisionado as Apro' +
        'visionado,'
      '                view_rubrica_projeto.saldo_real'
      ''
      'from view_rubrica_projeto'
      
        'inner join rubrica on (rubrica.id = view_rubrica_projeto.id_rubr' +
        'ica)'
      
        'where (view_rubrica_projeto.id_projeto = :Id_Projeto) or (:ID_PR' +
        'OJETO IS null)'
      
        'order by view_rubrica_projeto.id_projeto,view_rubrica_projeto.id' +
        '_rubrica'
      '         ')
    Left = 40
    Top = 24
    ParamData = <
      item
        Name = 'ID_PROJETO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qSaldo_RubricaID_RUBRICA: TIntegerField
      FieldName = 'ID_RUBRICA'
      Origin = 'ID_RUBRICA'
      ProviderFlags = []
    end
    object qSaldo_RubricaID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      Origin = 'ID_PROJETO'
      ProviderFlags = []
    end
    object qSaldo_RubricaNOME_PROJETO: TStringField
      FieldName = 'NOME_PROJETO'
      Origin = 'NOME_PROJETO'
      ProviderFlags = []
      Size = 100
    end
    object qSaldo_RubricaNOME_RUBRICA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_RUBRICA'
      Origin = 'NOME_RUBRICA'
      ProviderFlags = []
      ReadOnly = True
      Size = 123
    end
    object qSaldo_RubricaRECEBIDO: TBCDField
      FieldName = 'RECEBIDO'
      Origin = 'VALOR_RECEBIDO'
      ProviderFlags = []
      Precision = 18
    end
    object qSaldo_RubricaGASTO: TFMTBCDField
      FieldName = 'GASTO'
      Origin = 'VALOR_GASTO'
      ProviderFlags = []
      Precision = 18
      Size = 6
    end
    object qSaldo_RubricaAPROVISIONADO: TFMTBCDField
      FieldName = 'APROVISIONADO'
      Origin = 'VALOR_APROVISIONADO'
      ProviderFlags = []
      Precision = 18
      Size = 6
    end
    object qSaldo_RubricaSALDO_REAL: TFMTBCDField
      FieldName = 'SALDO_REAL'
      Origin = 'SALDO_REAL'
      ProviderFlags = []
      Precision = 18
      Size = 6
    end
    object qSaldo_RubricaORCAMENTO: TBCDField
      FieldName = 'ORCAMENTO'
      Origin = 'ORCAMENTO'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
  end
  object qSaldo_Semente_Muda: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Especie.Nome,'
      '       Especie.Nome_Cientifico,'
      '       Especie.Familia_Botanica,'
      '       Especie.Qtde_Semente_Estoque,'
      '       Especie.Qtde_Muda_Estoque'
      'from Especie'
      'where Especie.id = :ID_ESPECIE OR :ID_ESPECIE IS NULL')
    Left = 200
    Top = 48
    ParamData = <
      item
        Name = 'ID_ESPECIE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qSaldo_Semente_MudaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qSaldo_Semente_MudaNOME_CIENTIFICO: TStringField
      FieldName = 'NOME_CIENTIFICO'
      Origin = 'NOME_CIENTIFICO'
      ProviderFlags = []
      Size = 100
    end
    object qSaldo_Semente_MudaFAMILIA_BOTANICA: TStringField
      FieldName = 'FAMILIA_BOTANICA'
      Origin = 'FAMILIA_BOTANICA'
      ProviderFlags = []
      Size = 100
    end
    object qSaldo_Semente_MudaQTDE_SEMENTE_ESTOQUE: TBCDField
      FieldName = 'QTDE_SEMENTE_ESTOQUE'
      Origin = 'QTDE_SEMENTE_ESTOQUE'
      ProviderFlags = []
      Precision = 18
      Size = 2
    end
    object qSaldo_Semente_MudaQTDE_MUDA_ESTOQUE: TIntegerField
      FieldName = 'QTDE_MUDA_ESTOQUE'
      Origin = 'QTDE_MUDA_ESTOQUE'
      ProviderFlags = []
    end
  end
end
