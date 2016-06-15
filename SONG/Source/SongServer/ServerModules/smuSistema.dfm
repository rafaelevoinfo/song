inherited smSistema: TsmSistema
  OldCreateOrder = True
  Height = 314
  Width = 535
  inherited qAux: TRFQuery
    Left = 56
    Top = 40
  end
  object qNotificacao: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Notificacao.Id,'
      '       Notificacao.Tipo,'
      '       Notificacao.Tempo_Antecedencia'
      'from Notificacao'
      '&WHERE')
    Left = 160
    Top = 40
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qNotificacaoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qNotificacaoTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qNotificacaoTEMPO_ANTECEDENCIA: TIntegerField
      FieldName = 'TEMPO_ANTECEDENCIA'
      Origin = 'TEMPO_ANTECEDENCIA'
      ProviderFlags = [pfInUpdate]
    end
  end
  object qNotificacao_Pessoa: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Notificacao_Pessoa.Id,'
      '       Notificacao_Pessoa.Id_Notificacao,'
      '       Notificacao_Pessoa.Id_Pessoa,'
      '       Pessoa.Nome as Nome_Pessoa,'
      '       Notificacao_Pessoa.Notificacao_Sistema,'
      '       Notificacao_Pessoa.Notificacao_Email'
      'from Notificacao_Pessoa'
      'inner join Pessoa on (Notificacao_Pessoa.Id_Pessoa = Pessoa.Id)'
      'where Notificacao_Pessoa.Id_Notificacao = :Id_Notificacao ')
    Left = 272
    Top = 48
    ParamData = <
      item
        Name = 'ID_NOTIFICACAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qNotificacao_PessoaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qNotificacao_PessoaID_NOTIFICACAO: TIntegerField
      FieldName = 'ID_NOTIFICACAO'
      Origin = 'ID_NOTIFICACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qNotificacao_PessoaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Origin = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qNotificacao_PessoaNOME_PESSOA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PESSOA'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qNotificacao_PessoaNOTIFICACAO_SISTEMA: TSmallintField
      FieldName = 'NOTIFICACAO_SISTEMA'
      Origin = 'NOTIFICACAO_SISTEMA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qNotificacao_PessoaNOTIFICACAO_EMAIL: TSmallintField
      FieldName = 'NOTIFICACAO_EMAIL'
      Origin = 'NOTIFICACAO_EMAIL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
end
