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
      '       Notificacao.Tempo_Antecedencia,'
      '       Notificacao.valor_gatilho'
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
    object qNotificacaoVALOR_GATILHO: TBCDField
      FieldName = 'VALOR_GATILHO'
      Origin = 'VALOR_GATILHO'
      ProviderFlags = [pfInUpdate]
      Precision = 18
      Size = 2
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
  object qAgenda: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Agenda.Id,'
      '       Agenda.Nome,'
      '       Agenda.Tipo,'
      '       Agenda.Id_Projeto,'
      '       Agenda.Ativo,'
      '       Projeto.nome as Projeto'
      'from Agenda'
      'left join projeto on (projeto.id = agenda.id_projeto)'
      '&WHERE')
    Left = 48
    Top = 128
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qAgendaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qAgendaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qAgendaTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAgendaID_PROJETO: TIntegerField
      FieldName = 'ID_PROJETO'
      Origin = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate]
    end
    object qAgendaPROJETO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PROJETO'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
    object qAgendaATIVO: TSmallintField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object qAgenda_Pessoa: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Agenda_Pessoa.Id,'
      '       Agenda_Pessoa.Id_Agenda,'
      '       Agenda_Pessoa.Id_Pessoa,'
      '       Agenda_Pessoa.Somente_Visualizacao,'
      '       Pessoa.nome as nome_pessoa'
      'from Agenda_Pessoa  '
      'inner join pessoa on (pessoa.id = agenda_pessoa.id_pessoa)'
      'where agenda_pessoa.id_agenda = :ID_AGENDA'
      '&AND')
    Left = 248
    Top = 144
    ParamData = <
      item
        Name = 'ID_AGENDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    MacroData = <
      item
        Value = Null
        Name = 'AND'
      end>
    object qAgenda_PessoaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qAgenda_PessoaID_AGENDA: TIntegerField
      FieldName = 'ID_AGENDA'
      Origin = 'ID_AGENDA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAgenda_PessoaID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Origin = 'ID_PESSOA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAgenda_PessoaSOMENTE_VISUALIZACAO: TSmallintField
      FieldName = 'SOMENTE_VISUALIZACAO'
      Origin = 'SOMENTE_VISUALIZACAO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAgenda_PessoaNOME_PESSOA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_PESSOA'
      Origin = 'NOME'
      ProviderFlags = []
      Size = 100
    end
  end
  object qAgenda_Registro: TRFQuery
    Connection = dmPrincipal.conSong
    UpdateOptions.UpdateTableName = 'AGENDA_REGISTRO'
    SQL.Strings = (
      'select Agenda_Registro.Id,'
      '       Agenda_Registro.Id_Agenda,'
      '       Agenda_Registro.Titulo,'
      '       Agenda_Registro.Descricao,'
      '       Agenda_Registro.Data_Inicio,'
      '       Agenda_Registro.Data_Fim,'
      '       Agenda_Registro.Recurrence_Index,'
      '       Agenda_Registro.Recurrence_Info,'
      '       Agenda_Registro.Parent_Id,'
      '       Agenda_Registro.Event_Type,'
      '       Agenda_Registro.Label_Color,'
      '       Agenda_Registro.Actual_Start,'
      '       Agenda_Registro.Actual_Finish,'
      '       Agenda_Registro.Options,'
      '       Agenda_Registro.Local,'
      '       0 as Tipo'
      'from Agenda_Registro'
      'where Agenda_Registro.Id_Agenda = :Id_AGENDA and'
      
        '      ((Agenda_Registro.Data_Inicio between :Data_Inicial and :D' +
        'ata_Final) or '
      
        '       (Agenda_Registro.Data_Fim between :Data_Inicial and :Data' +
        '_Final) or '
      '       (Agenda_Registro.Event_Type = 1))'
      ''
      'union all'
      ''
      'select cast(Atividade.Id*-1 as integer) as ID,'
      '       Agenda.Id,'
      '       Atividade.Nome,'
      '       Atividade.Descricao,'
      '       Atividade.Data_Inicial,'
      '       Atividade.Data_Final,'
      '       -1 as recurrence_index,'
      '       null as Recurrence_Info,'
      '       null as Parent_id,'
      '       0 as Event_Type,'
      '       null as Label_Color,'
      '       null as Actual_Start,'
      '       null as Actual_Finish,'
      '       3 as Options,'
      '       '#39#39' as Local,'
      '       1 as Tipo'
      'from Agenda'
      
        'inner join Atividade on (Atividade.Id_Projeto = Agenda.Id_Projet' +
        'o)'
      'where Agenda.Id = :ID_AGENDA and'
      
        '      ((Atividade.Data_Inicial between :Data_Inicial and :Data_F' +
        'inal) or '
      
        '      (Atividade.Data_Final between :Data_Inicial and :Data_Fina' +
        'l))    ')
    Left = 392
    Top = 152
    ParamData = <
      item
        Name = 'ID_AGENDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA_INICIAL'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA_FINAL'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end>
    object qAgenda_RegistroID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qAgenda_RegistroID_AGENDA: TIntegerField
      FieldName = 'ID_AGENDA'
      Origin = 'ID_AGENDA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAgenda_RegistroTITULO: TStringField
      FieldName = 'TITULO'
      Origin = 'TITULO'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
    object qAgenda_RegistroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object qAgenda_RegistroRECURRENCE_INDEX: TIntegerField
      FieldName = 'RECURRENCE_INDEX'
      Origin = 'RECURRENCE_INDEX'
      ProviderFlags = [pfInUpdate]
    end
    object qAgenda_RegistroRECURRENCE_INFO: TBlobField
      FieldName = 'RECURRENCE_INFO'
      Origin = 'RECURRENCE_INFO'
      ProviderFlags = [pfInUpdate]
    end
    object qAgenda_RegistroPARENT_ID: TIntegerField
      FieldName = 'PARENT_ID'
      Origin = 'PARENT_ID'
      ProviderFlags = [pfInUpdate]
    end
    object qAgenda_RegistroEVENT_TYPE: TIntegerField
      FieldName = 'EVENT_TYPE'
      Origin = 'EVENT_TYPE'
      ProviderFlags = [pfInUpdate]
    end
    object qAgenda_RegistroLABEL_COLOR: TIntegerField
      FieldName = 'LABEL_COLOR'
      Origin = 'LABEL_COLOR'
      ProviderFlags = [pfInUpdate]
    end
    object qAgenda_RegistroDATA_INICIO: TSQLTimeStampField
      FieldName = 'DATA_INICIO'
      Origin = 'DATA_INICIO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAgenda_RegistroDATA_FIM: TSQLTimeStampField
      FieldName = 'DATA_FIM'
      Origin = 'DATA_FIM'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qAgenda_RegistroACTUAL_START: TIntegerField
      FieldName = 'ACTUAL_START'
      Origin = 'ACTUAL_START'
      ProviderFlags = [pfInUpdate]
    end
    object qAgenda_RegistroACTUAL_FINISH: TIntegerField
      FieldName = 'ACTUAL_FINISH'
      Origin = 'ACTUAL_FINISH'
      ProviderFlags = [pfInUpdate]
    end
    object qAgenda_RegistroOPTIONS: TIntegerField
      FieldName = 'OPTIONS'
      Origin = 'OPTIONS'
      ProviderFlags = [pfInUpdate]
    end
    object qAgenda_RegistroTIPO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
    end
    object qAgenda_RegistroLOCAL: TStringField
      FieldName = 'LOCAL'
      Origin = 'LOCAL'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
  end
  object qAparelho_Externo: TRFQuery
    Connection = dmPrincipal.conSong
    SQL.Strings = (
      'select Aparelho_externo.Id,'
      '       Aparelho_externo.Nome,'
      '       Aparelho_externo.Serial'
      'from Aparelho_externo'
      '&WHERE')
    Left = 88
    Top = 208
    MacroData = <
      item
        Value = Null
        Name = 'WHERE'
      end>
    object qAparelho_ExternoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qAparelho_ExternoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object qAparelho_ExternoSERIAL: TStringField
      FieldName = 'SERIAL'
      Origin = 'SERIAL'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
end
