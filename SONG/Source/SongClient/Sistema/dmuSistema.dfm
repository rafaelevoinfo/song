inherited dmSistema: TdmSistema
  OldCreateOrder = True
  Height = 263
  Width = 426
  object cdsNotificacao: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqNotificacao'
    RemoteServer = dmPrincipal.ProviderSistema
    Left = 296
    Top = 48
    object cdsNotificacaoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsNotificacaoTIPO: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
    end
    object cdsNotificacaoTEMPO_ANTECEDENCIA: TIntegerField
      DisplayLabel = 'Tempo de Anteced'#234'ncia'
      FieldName = 'TEMPO_ANTECEDENCIA'
      DisplayFormat = '0 dias'
    end
    object cdsNotificacaoVALOR_GATILHO: TBCDField
      DisplayLabel = 'Valor de Gatilho'
      FieldName = 'VALOR_GATILHO'
      Precision = 18
      Size = 2
    end
  end
  object cdsNotificacao_Pessoa: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_NOTIFICACAO'
    MasterFields = 'ID'
    MasterSource = dsNotificacao
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_NOTIFICACAO'
        ParamType = ptInput
      end>
    ProviderName = 'dspqNotificacao_Pessoa'
    RemoteServer = dmPrincipal.ProviderSistema
    RFApplyAutomatico = False
    Left = 288
    Top = 192
    object cdsNotificacao_PessoaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsNotificacao_PessoaID_NOTIFICACAO: TIntegerField
      DisplayLabel = 'Id da Notifica'#231#227'o'
      FieldName = 'ID_NOTIFICACAO'
      Required = True
    end
    object cdsNotificacao_PessoaID_PESSOA: TIntegerField
      DisplayLabel = 'Id da Pessoa'
      FieldName = 'ID_PESSOA'
      Required = True
    end
    object cdsNotificacao_PessoaNOME_PESSOA: TStringField
      DisplayLabel = 'Nome da Pessoa'
      FieldName = 'NOME_PESSOA'
      Size = 100
    end
    object cdsNotificacao_PessoaNOTIFICACAO_SISTEMA: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Notifica'#231#227'o pelo Sistema'
      FieldName = 'NOTIFICACAO_SISTEMA'
      Required = True
    end
    object cdsNotificacao_PessoaNOTIFICACAO_EMAIL: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Notifica'#231#227'o por E-Mail'
      FieldName = 'NOTIFICACAO_EMAIL'
      Required = True
    end
  end
  object dsNotificacao: TDataSource
    DataSet = cdsNotificacao
    Left = 288
    Top = 112
  end
  object cdsAgenda: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqAgenda'
    RemoteServer = dmPrincipal.ProviderSistema
    Left = 72
    Top = 64
    object cdsAgendaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsAgendaNOME: TStringField
      DisplayLabel = 'Nome da Agenda'
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object cdsAgendaTIPO: TSmallintField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Required = True
    end
    object cdsAgendaID_PROJETO: TIntegerField
      DisplayLabel = 'Id do Projeto'
      FieldName = 'ID_PROJETO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAgendaPROJETO: TStringField
      DisplayLabel = 'Projeto'
      FieldName = 'PROJETO'
      ProviderFlags = []
      Size = 100
    end
    object cdsAgendaATIVO: TSmallintField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object cdsAgenda_Pessoa: TRFClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_AGENDA'
    MasterFields = 'ID'
    MasterSource = dsAgenda
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspqAgenda_Pessoa'
    RemoteServer = dmPrincipal.ProviderSistema
    Left = 72
    Top = 192
    object cdsAgenda_PessoaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsAgenda_PessoaID_AGENDA: TIntegerField
      DisplayLabel = 'Id da Agenda'
      FieldName = 'ID_AGENDA'
      Required = True
    end
    object cdsAgenda_PessoaID_PESSOA: TIntegerField
      DisplayLabel = 'Id da Pessoa'
      FieldName = 'ID_PESSOA'
      Required = True
    end
    object cdsAgenda_PessoaSOMENTE_VISUALIZACAO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Apenas Visualiza'#231#227'o'
      FieldName = 'SOMENTE_VISUALIZACAO'
      Required = True
    end
    object cdsAgenda_PessoaNOME_PESSOA: TStringField
      DisplayLabel = 'Nome da Pessoa'
      FieldName = 'NOME_PESSOA'
      Size = 100
    end
  end
  object dsAgenda: TDataSource
    DataSet = cdsAgenda
    Left = 72
    Top = 128
  end
  object cdsAgenda_Registro: TRFClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_AGENDA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATA_INICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATA_FINAL'
        ParamType = ptInput
      end>
    ProviderName = 'dspqAgenda_Registro'
    RemoteServer = dmPrincipal.ProviderSistema
    BeforePost = cdsAgenda_RegistroBeforePost
    Left = 168
    Top = 208
    object cdsAgenda_RegistroID: TIntegerField
      FieldName = 'ID'
    end
    object cdsAgenda_RegistroID_AGENDA: TIntegerField
      FieldName = 'ID_AGENDA'
      Required = True
    end
    object cdsAgenda_RegistroTITULO: TStringField
      FieldName = 'TITULO'
      Size = 150
    end
    object cdsAgenda_RegistroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 1000
    end
    object cdsAgenda_RegistroRECURRENCE_INDEX: TIntegerField
      FieldName = 'RECURRENCE_INDEX'
    end
    object cdsAgenda_RegistroRECURRENCE_INFO: TBlobField
      FieldName = 'RECURRENCE_INFO'
    end
    object cdsAgenda_RegistroPARENT_ID: TIntegerField
      FieldName = 'PARENT_ID'
    end
    object cdsAgenda_RegistroEVENT_TYPE: TIntegerField
      FieldName = 'EVENT_TYPE'
    end
    object cdsAgenda_RegistroLABEL_COLOR: TIntegerField
      FieldName = 'LABEL_COLOR'
    end
    object cdsAgenda_RegistroDATA_INICIO: TSQLTimeStampField
      FieldName = 'DATA_INICIO'
      Required = True
    end
    object cdsAgenda_RegistroDATA_FIM: TSQLTimeStampField
      FieldName = 'DATA_FIM'
      Required = True
    end
    object cdsAgenda_RegistroACTUAL_START: TIntegerField
      FieldName = 'ACTUAL_START'
    end
    object cdsAgenda_RegistroACTUAL_FINISH: TIntegerField
      FieldName = 'ACTUAL_FINISH'
    end
    object cdsAgenda_RegistroOPTIONS: TIntegerField
      FieldName = 'OPTIONS'
      ProviderFlags = [pfInUpdate]
    end
    object cdsAgenda_RegistroTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ProviderFlags = []
    end
    object cdsAgenda_RegistroLOCAL: TStringField
      DisplayLabel = 'Local'
      FieldName = 'LOCAL'
      ProviderFlags = [pfInUpdate]
      Size = 150
    end
  end
  object cdsAparelho_Externo: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqAparelho_Externo'
    RemoteServer = dmPrincipal.ProviderSistema
    Left = 168
    Top = 32
    object cdsAparelho_ExternoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAparelho_ExternoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsAparelho_ExternoSERIAL: TStringField
      DisplayLabel = 'Serial'
      FieldName = 'SERIAL'
      Origin = 'SERIAL'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
end
