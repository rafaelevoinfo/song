inherited dmSistema: TdmSistema
  Height = 263
  Width = 426
  object cdsNotificacao: TRFClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspqNotificacao'
    RemoteServer = dmPrincipal.ProviderSistema
    Left = 200
    Top = 112
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
    Left = 216
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
end
