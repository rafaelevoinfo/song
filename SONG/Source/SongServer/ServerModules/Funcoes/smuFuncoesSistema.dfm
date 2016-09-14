inherited smFuncoesSistema: TsmFuncoesSistema
  inherited qAux: TRFQuery
    Left = 88
    Top = 64
  end
  inherited qId: TRFQuery
    Left = 32
    Top = 64
  end
  object qNotificacao_Pessoa: TRFQuery
    CachedUpdates = True
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'Select Notificacao_Pessoa.id_pessoa, '
      '       Notificacao_Pessoa.Notificacao_Sistema,'
      '       Notificacao_Pessoa.Notificacao_Email,'
      '       Pessoa.Email'
      'from notificacao_pessoa'
      'inner join Pessoa on (Pessoa.Id = Notificacao_Pessoa.Id_Pessoa)'
      
        'where ((notificacao_pessoa.id_pessoa = :ID_PESSOA) or (:ID_PESSO' +
        'A IS NULL)) and'
      '      notificacao_pessoa.id_notificacao = :ID_NOTIFICACAO')
    Left = 152
    Top = 80
    ParamData = <
      item
        Name = 'ID_PESSOA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ID_NOTIFICACAO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qNotificacao_PessoaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Origin = 'ID_PESSOA'
      ProviderFlags = []
      Required = True
    end
    object qNotificacao_PessoaNOTIFICACAO_SISTEMA: TSmallintField
      FieldName = 'NOTIFICACAO_SISTEMA'
      Origin = 'NOTIFICACAO_SISTEMA'
      ProviderFlags = []
      Required = True
    end
    object qNotificacao_PessoaNOTIFICACAO_EMAIL: TSmallintField
      FieldName = 'NOTIFICACAO_EMAIL'
      Origin = 'NOTIFICACAO_EMAIL'
      ProviderFlags = []
      Required = True
    end
    object qNotificacao_PessoaEMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      ProviderFlags = []
      Size = 100
    end
  end
end
