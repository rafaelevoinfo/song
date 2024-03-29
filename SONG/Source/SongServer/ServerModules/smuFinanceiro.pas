unit smuFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery, dmuPrincipal,
  Datasnap.Provider, uUtils, uClientDataSet, uSQLGenerator, uTypes,
  Datasnap.DBClient, System.Math, System.Types;

type
  TsmFinanceiro = class(TsmBasico)
    qBanco: TRFQuery;
    qBanco_Conta_Corrente: TRFQuery;
    qBancoID: TIntegerField;
    qBancoNOME: TStringField;
    qBanco_Conta_CorrenteID: TIntegerField;
    qBanco_Conta_CorrenteID_BANCO: TIntegerField;
    qBanco_Conta_CorrenteAGENCIA: TStringField;
    qBanco_Conta_CorrenteCONTA: TStringField;
    qFin_For_Cli: TRFQuery;
    qFin_For_CliID: TIntegerField;
    qFin_For_CliID_CONTATO: TIntegerField;
    qFin_For_CliID_CIDADE: TIntegerField;
    qFin_For_CliNOME_FANTASIA: TStringField;
    qFin_For_CliRAZAO_SOCIAL: TStringField;
    qFin_For_CliENDERECO: TStringField;
    qFin_For_CliBAIRRO: TStringField;
    qFin_For_CliCOMPLEMENTO: TStringField;
    qFin_For_CliTIPO: TIntegerField;
    qFin_For_CliTELEFONE: TStringField;
    qFin_For_CliCELULAR: TStringField;
    qFin_For_CliEMAIL: TStringField;
    qFin_For_CliSITE: TStringField;
    qFin_For_CliCPF_CNPJ: TStringField;
    qFin_For_CliINSCRICAO_ESTADUAL: TStringField;
    qFin_For_CliINSCRICAO_MUNICIPAL: TStringField;
    qFin_For_CliRAMO_ATIVIDADE: TStringField;
    qFin_For_CliOBSERVACAO: TStringField;
    qFin_For_CliCARGO_CONTATO: TStringField;
    qPlano_Contas: TRFQuery;
    qPlano_ContasID: TIntegerField;
    qPlano_ContasNOME: TStringField;
    qPlano_ContasIDENTIFICADOR: TStringField;
    qPlano_ContasTIPO: TSmallintField;
    qPlano_ContasID_CONTA_PAI: TIntegerField;
    qRubrica: TRFQuery;
    qRubricaID: TIntegerField;
    qRubricaNOME: TStringField;
    qRubricaID_RUBRICA_PAI: TIntegerField;
    qRubricaIDENTIFICADOR: TStringField;
    qConta_Pagar: TRFQuery;
    qConta_PagarID: TIntegerField;
    qConta_PagarID_FORNECEDOR: TIntegerField;
    qConta_PagarID_PLANO_CONTAS: TIntegerField;
    qConta_PagarID_CONTA_CORRENTE: TIntegerField;
    qConta_PagarDESCRICAO: TStringField;
    qConta_PagarVALOR_TOTAL: TBCDField;
    qConta_PagarFORMA_PAGTO: TSmallintField;
    qConta_PagarOBSERVACAO: TStringField;
    qConta_Pagar_Parcela: TRFQuery;
    qConta_Pagar_ParcelaID: TIntegerField;
    qConta_Pagar_ParcelaID_CONTA_PAGAR: TIntegerField;
    qConta_Pagar_ParcelaVENCIMENTO: TDateField;
    qConta_Pagar_ParcelaVALOR: TBCDField;
    qConta_Pagar_ParcelaPARCELA: TSmallintField;
    qConta_PagarFORNECEDOR: TStringField;
    qConta_PagarPLANO_CONTAS: TStringField;
    qConta_PagarCONTA_CORRENTE: TStringField;
    qConta_Pagar_ParcelaSTATUS: TSmallintField;
    qConta_Pagar_ParcelaDATA_PAGAMENTO: TDateField;
    qConta_Receber: TRFQuery;
    qConta_ReceberID: TIntegerField;
    qConta_ReceberID_CLIENTE_FINANCIADOR: TIntegerField;
    qConta_ReceberID_PLANO_CONTAS: TIntegerField;
    qConta_ReceberID_CONTA_CORRENTE: TIntegerField;
    qConta_ReceberDESCRICAO: TStringField;
    qConta_ReceberVALOR_TOTAL: TBCDField;
    qConta_ReceberFORMA_PAGTO: TSmallintField;
    qConta_ReceberOBSERVACAO: TStringField;
    qConta_Receber_Parcela: TRFQuery;
    qConta_Receber_ParcelaID: TIntegerField;
    qConta_Receber_ParcelaID_CONTA_RECEBER: TIntegerField;
    qConta_Receber_ParcelaVENCIMENTO: TDateField;
    qConta_Receber_ParcelaVALOR: TBCDField;
    qConta_Receber_ParcelaPARCELA: TSmallintField;
    qConta_Receber_ParcelaSTATUS: TSmallintField;
    qConta_Receber_ParcelaDATA_RECEBIMENTO: TDateField;
    qConta_ReceberTIPO: TIntegerField;
    qConta_ReceberNOME_FANTASIA: TStringField;
    qConta_ReceberPLANO_CONTAS: TStringField;
    qConta_ReceberCONTA_CORRENTE: TStringField;
    qConta_PagarNUMERO_DOCUMENTO: TStringField;
    qConta_ReceberNUMERO_DOCUMENTO: TStringField;
    qConta_PagarID_COMPRA: TIntegerField;
    qConta_Pagar_Vinculo: TRFQuery;
    qConta_Pagar_VinculoID: TIntegerField;
    qConta_Pagar_VinculoID_CONTA_PAGAR: TIntegerField;
    qConta_Pagar_VinculoID_FUNDO: TIntegerField;
    qConta_Pagar_VinculoNOME_FUNDO: TStringField;
    qConta_Pagar_VinculoID_PROJETO_ORIGEM: TIntegerField;
    qConta_Pagar_VinculoPROJETO_ORIGEM: TStringField;
    qConta_Pagar_VinculoID_ATIVIDADE_ORIGEM: TIntegerField;
    qConta_Pagar_VinculoATIVIDADE_ORIGEM: TStringField;
    qConta_Pagar_VinculoID_RUBRICA_ORIGEM: TIntegerField;
    qConta_Pagar_VinculoRUBRICA_ORIGEM: TStringField;
    qConta_Pagar_VinculoID_AREA_ATUACAO_ORIGEM: TIntegerField;
    qConta_Pagar_VinculoAREA_ATUACAO_ORIGEM: TStringField;
    qConta_Pagar_VinculoID_PROJETO_ALOCADO: TIntegerField;
    qConta_Pagar_VinculoPROJETO_ALOCADO: TStringField;
    qConta_Pagar_VinculoID_ATIVIDADE_ALOCADO: TIntegerField;
    qConta_Pagar_VinculoATIVIDADE_ALOCADA: TStringField;
    qConta_Pagar_VinculoID_RUBRICA_ALOCADO: TIntegerField;
    qConta_Pagar_VinculoRUBRICA_ALOCADA: TStringField;
    qConta_Pagar_VinculoID_AREA_ATUACAO_ALOCADO: TIntegerField;
    qConta_Pagar_VinculoAREA_ATUACAO_ALOCADA: TStringField;
    qConta_Pagar_VinculoVALOR: TBCDField;
    qConta_Receber_Vinculo: TRFQuery;
    qConta_Receber_VinculoID: TIntegerField;
    qConta_Receber_VinculoID_CONTA_RECEBER: TIntegerField;
    qConta_Receber_VinculoID_FUNDO: TIntegerField;
    qConta_Receber_VinculoVALOR: TBCDField;
    qConta_Receber_VinculoFUNDO: TStringField;
    qConta_Pagar_VinculoID_ORGANIZACAO_ORIGEM: TIntegerField;
    qConta_Pagar_VinculoNOME_ORGANIZACAO: TStringField;
    qConta_PagarID_RESPONSAVEL: TIntegerField;
    qConta_PagarNOME_RESPONSAVEL: TStringField;
    qFin_For_CliCEP: TStringField;
    qTransferencia_Financeira: TRFQuery;
    qTransferencia_FinanceiraID: TIntegerField;
    qTransferencia_FinanceiraID_FUNDO_ORIGEM: TIntegerField;
    qTransferencia_FinanceiraID_FUNDO_DESTINO: TIntegerField;
    qTransferencia_FinanceiraID_PROJETO_RUBRICA_ORIGEM: TIntegerField;
    qTransferencia_FinanceiraID_PROJETO_RUBRICA_DESTINO: TIntegerField;
    qTransferencia_FinanceiraVALOR: TBCDField;
    qTransferencia_FinanceiraFUNDO_ORIGEM: TStringField;
    qTransferencia_FinanceiraFUNDO_DESTINO: TStringField;
    qTransferencia_FinanceiraRUBRICA_ORIGEM: TStringField;
    qTransferencia_FinanceiraRUBRICA_DESTINO: TStringField;
    qTransferencia_FinanceiraORIGEM: TStringField;
    qTransferencia_FinanceiraDESTINO: TStringField;
    qTransferencia_FinanceiraID_PESSOA: TIntegerField;
    qTransferencia_FinanceiraRESPONSAVEL: TStringField;
    qTransferencia_FinanceiraDATA: TSQLTimeStampField;
    dspqTransferencia_Financeira: TDataSetProvider;
    qConta_ReceberID_VENDA: TIntegerField;
    qConta_Pagar_Autorizacao: TRFQuery;
    qConta_Pagar_AutorizacaoID: TIntegerField;
    qConta_Pagar_AutorizacaoID_CONTA_PAGAR: TIntegerField;
    qConta_Pagar_AutorizacaoID_PESSOA: TIntegerField;
    qConta_Pagar_AutorizacaoPESSOA_AUTORIZOU: TStringField;
    qConta_Pagar_VinculoID_FUNDO_ALOCADO: TIntegerField;
    qConta_Pagar_VinculoNOME_FUNDO_ALOCADO: TStringField;
    qTransferencia_FinanceiraTIPO: TSmallintField;
    qDoacao: TRFQuery;
    qDoacaoID: TIntegerField;
    qDoacaoID_PESSOA_DOADORA: TIntegerField;
    qDoacaoNOME_DOADOR: TStringField;
    qDoacaoID_PESSOA_RECEBEU: TIntegerField;
    qDoacaoNOME_FUNCIONARIO: TStringField;
    qDoacaoID_FUNDO: TIntegerField;
    qDoacaoFUNDO_DESTINO: TStringField;
    qDoacaoVALOR: TBCDField;
    qDoacaoDATA: TSQLTimeStampField;
    qDoacaoOBSERVACAO: TStringField;
    dspqDoacao: TDataSetProvider;
    qDoacaoFORMA_PAGTO: TSmallintField;
    qConta_ReceberDATA_CADASTRO: TSQLTimeStampField;
    qConta_PagarDATA_CADASTRO: TSQLTimeStampField;
    procedure dspqDoacaoBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure dspqTransferencia_FinanceiraBeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
  private
    { Private declarations }
  protected
    function fprMontarWhere(ipTabela, ipWhere: string; ipParam: TParam): string; override;
  public
    { Public declarations }
  end;

var
  smFinanceiro: TsmFinanceiro;

implementation

{$R *.dfm}

{ TsmFinanceiro }

procedure TsmFinanceiro.dspqDoacaoBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  vaDataSet: TRFQuery;
  vaCommit: Boolean;
begin
  inherited;
  vaCommit := false;
  try
    if UpdateKind = ukInsert then
      begin
        Connection.ExecSQL('update fundo set fundo.saldo = fundo.saldo + :VALOR Where fundo.id = :ID_FUNDO',
          [DeltaDS.FieldByName('VALOR').NewValue, DeltaDS.FieldByName('ID_FUNDO').NewValue]);

        vaCommit := true;
      end
    else if UpdateKind = ukDelete then
      begin
        pprCriarDataSet(vaDataSet);
        try
          vaDataSet.SQL.Text := 'select Fundo.Saldo from Fundo where Fundo.Id = :Id';
          vaDataSet.ParamByName('ID').AsInteger := DeltaDS.FieldByName('ID_FUNDO').OldValue;
          vaDataSet.open;

          if CompareValue(vaDataSet.FieldByName('SALDO').AsFloat, DeltaDS.FieldByName('VALOR').OldValue) = LessThanValue then
            begin
              Applied := false;
              raise Exception.Create('A doa��o n�o pode ser excluida pois a conta n�o possui saldo suficiente para realizar a devolu��o.');
            end;

          Connection.ExecSQL('update fundo set fundo.saldo = fundo.saldo - :VALOR Where fundo.id = :ID_FUNDO',
            [DeltaDS.FieldByName('VALOR').OldValue, DeltaDS.FieldByName('ID_FUNDO').OldValue]);

          vaCommit := true;
        finally
          vaDataSet.Close;
          vaDataSet.Free;
        end;
      end;

    if vaCommit and Connection.InTransaction then
      Connection.Commit;
  except
    if vaCommit and Connection.InTransaction then
      Connection.Rollback;

    raise;
  end;
end;

procedure TsmFinanceiro.dspqTransferencia_FinanceiraBeforeUpdateRecord(
  Sender: TObject; SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
var
  vaValor: Double;
  vaDataSet: TRFQuery;
  vaCommit: Boolean;
begin
  inherited;
  vaCommit := false;
  pprCriarDataSet(vaDataSet);
  try
    try
      vaDataSet.SQL.Text := 'select Fundo.Saldo from Fundo where Fundo.Id = :Id';

      if (UpdateKind = ukInsert) then
        begin
          vaValor := DeltaDS.FieldByName('VALOR').NewValue;
          if (Not VarIsNull(DeltaDS.FieldByName('ID_FUNDO_ORIGEM').NewValue)) and
            (DeltaDS.FieldByName('ID_FUNDO_ORIGEM').NewValue <> Unassigned) then
            begin
              vaDataSet.ParamByName('ID').AsInteger := DeltaDS.FieldByName('ID_FUNDO_ORIGEM').NewValue;
              vaDataSet.open;

              if CompareValue(vaDataSet.FieldByName('SALDO').AsFloat, vaValor) = LessThanValue then
                raise Exception.Create('N�o � poss�vel fazer a inclus�o pois a conta de origem n�o possui saldo suficiente.');

              Connection.ExecSQL('update fundo set fundo.saldo = fundo.saldo - :VALOR Where fundo.id = :ID_FUNDO',
                [vaValor, DeltaDS.FieldByName('ID_FUNDO_ORIGEM').NewValue]);

              vaCommit := true;
            end;

          if (Not VarIsNull(DeltaDS.FieldByName('ID_FUNDO_DESTINO').NewValue)) and
            (DeltaDS.FieldByName('ID_FUNDO_DESTINO').NewValue <> Unassigned) then
            begin
              Connection.ExecSQL('update fundo set fundo.saldo = fundo.saldo + :VALOR Where fundo.id = :ID_FUNDO',
                [vaValor, DeltaDS.FieldByName('ID_FUNDO_DESTINO').NewValue]);

              vaCommit := true;
            end;
        end
      else if (UpdateKind = ukDelete) then
        begin
          vaValor := DeltaDS.FieldByName('VALOR').OldValue;

          if (Not VarIsNull(DeltaDS.FieldByName('ID_FUNDO_DESTINO').OldValue)) and
            (DeltaDS.FieldByName('ID_FUNDO_DESTINO').OldValue <> Unassigned) then
            begin
              vaDataSet.ParamByName('ID').AsInteger := DeltaDS.FieldByName('ID_FUNDO_DESTINO').OldValue;
              vaDataSet.open;
              if CompareValue(vaDataSet.FieldByName('SALDO').AsFloat, vaValor) = LessThanValue then
                raise Exception.Create('N�o � poss�vel fazer a exclus�o pois a conta de destino n�o possui saldo suficiente para realizar a devolu��o.');

              Connection.ExecSQL('update fundo set fundo.saldo = fundo.saldo - :VALOR Where fundo.id = :ID_FUNDO',
                [vaValor, DeltaDS.FieldByName('ID_FUNDO_DESTINO').OldValue]);

              vaCommit := true;
            end;

          if (Not VarIsNull(DeltaDS.FieldByName('ID_FUNDO_ORIGEM').OldValue)) and
            (DeltaDS.FieldByName('ID_FUNDO_ORIGEM').OldValue <> Unassigned) then
            begin
              Connection.ExecSQL('update fundo set fundo.saldo = fundo.saldo + :VALOR Where fundo.id = :ID_FUNDO',
                [vaValor, DeltaDS.FieldByName('ID_FUNDO_ORIGEM').OldValue]);

              vaCommit := true;
            end;
        end;

      if vaCommit and Connection.InTransaction then
        Connection.Commit;

    except
      Applied := false;
      if vaCommit and Connection.InTransaction then
        Connection.Rollback;

      raise;
    end;
  finally
    vaDataSet.Close;
    vaDataSet.Free;
  end;
end;

function TsmFinanceiro.fprMontarWhere(ipTabela, ipWhere: string; ipParam: TParam): string;
var
  vaValor, vaOperador: string;
  vaCodigos: TArray<Integer>;
begin
  Result := inherited;
  TUtils.ppuExtrairValorOperadorParametro(ipParam.Text, vaValor, vaOperador, TParametros.coDelimitador);
  if ipTabela = 'FIN_FOR_CLI' then
    begin
      if ipParam.Name = TParametros.coTipo then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'TIPO', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coNomeFantasia then
        Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'NOME_FANTASIA', vaValor, vaOperador)
      else if ipParam.Name = TParametros.coRazaoSocial then
        Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'RAZAO_SOCIAL', vaValor, vaOperador)
      else if ipParam.Name = TParametros.coCpfCnpj then
        Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'CPF_CNPJ', vaValor, vaOperador)
    end
  else if ipTabela = 'PLANO_CONTAS' then
    begin
      if ipParam.Name = TParametros.coTipo then
        begin
          if vaValor.ToInteger <> 0 then
            Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'TIPO', vaValor.ToInteger(), vaOperador)
          else
            Result := Result + '((PLANO_CONTAS.Tipo = 0) OR (PLANO_CONTAS.Tipo is null)) ' + vaOperador;
        end
      else if ipParam.Name = TParametros.coIdentificadorPlanoContasRubrica then
        begin
          Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'IDENTIFICADOR', vaValor, true, false, vaOperador)
        end;
    end
  else if ipTabela = 'RUBRICA' then
    begin
      if ipParam.Name = TParametros.coIdentificadorPlanoContasRubrica then
        begin
          Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'IDENTIFICADOR', vaValor, true, false, vaOperador)
        end;
    end
  else if (ipTabela = 'CONTA_PAGAR') OR (ipTabela = 'CONTA_RECEBER') then
    begin
      if ipParam.Name = TParametros.coData then
        begin
          Result := Result + ' (LOG.DATA_HORA between ' +
            QuotedStr(FormatDateTime('dd.mm.yyyy 00:00:00', TUtils.fpuExtrairData(vaValor, 0))) +
            ' AND ' + QuotedStr(FormatDateTime('dd.mm.yyyy 23:59:59', TUtils.fpuExtrairData(vaValor, 1))) + ')' + vaOperador;
        end
      else if ipParam.Name = TParametros.coDataVencimento then
        begin
          Result := Result + ' (' + ipTabela + '_PARCELA.VENCIMENTO between ' +
            QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 0))) +
            ' AND ' + QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 1))) + ')' + vaOperador;
        end
      else if ipParam.Name = TParametros.coDescricao then
        begin
          Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'DESCRICAO', vaValor, true, false, vaOperador)
        end
      else if ipParam.Name = TParametros.coFornecedor then
        begin
          Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_FORNECEDOR', vaValor.ToInteger, vaOperador)
        end
      else if ipParam.Name = TParametros.coClienteFinanciador then
        begin
          Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_CLIENTE_FINANCIADOR', vaValor.ToInteger, vaOperador)
        end
      else if ipParam.Name = TParametros.coPlanoConta then
        begin
          Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_PLANO_CONTAS', vaValor.ToInteger, vaOperador)
        end
      else if ipParam.Name = TParametros.coStatus then
        begin
          if vaValor = '0' then
            Result := Result + ' ((' + ipTabela + '_PARCELA.status is null) or (' + ipTabela + '_PARCELA.status = 0)) ' + vaOperador
          else
            Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela + '_PARCELA', 'STATUS', vaValor.ToInteger, vaOperador)
        end
      else
        begin
          if ipTabela = 'CONTA_PAGAR' then
            begin
              if ipParam.Name = TParametros.coProjeto then
                Result := TSQLGenerator.fpuFilterInteger(Result, 'CONTA_PAGAR_VINCULO', 'ID_PROJETO_ORIGEM', vaValor.ToInteger, vaOperador)
              else if ipParam.Name = TParametros.coProjetoAlocado then
                Result := TSQLGenerator.fpuFilterInteger(Result, 'CONTA_PAGAR_VINCULO', 'ID_PROJETO_ALOCADO', vaValor.ToInteger, vaOperador)
              else if ipParam.Name = TParametros.coRubricaOrigemRecurso then
                Result := TSQLGenerator.fpuFilterInteger(Result, 'CONTA_PAGAR_VINCULO', 'ID_RUBRICA_ORIGEM', vaValor.ToInteger, vaOperador)
              else if ipParam.Name = TParametros.coResponsavelDespesa then
                Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_RESPONSAVEL', vaValor.ToInteger, vaOperador)
              else if ipParam.Name = TParametros.coFundo then
                Result := TSQLGenerator.fpuFilterInteger(Result, 'CONTA_PAGAR_VINCULO', 'ID_FUNDO', vaValor.ToInteger, vaOperador)
              else if ipParam.Name = TParametros.coDataPagamentoRecebimento then
                begin
                  Result := Result + ' (' + ipTabela + '_PARCELA.DATA_PAGAMENTO between ' +
                    QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 0))) +
                    ' AND ' + QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 1))) + ')' + vaOperador;
                end
              else if ipParam.Name = TParametros.coDataCompra then
                begin
                  Result := Result + ' (COMPRA.DATA between ' +
                    QuotedStr(FormatDateTime('dd.mm.yyyy 00:00:00', TUtils.fpuExtrairData(vaValor, 0))) +
                    ' AND ' + QuotedStr(FormatDateTime('dd.mm.yyyy 23:59:59', TUtils.fpuExtrairData(vaValor, 1))) + ')' + vaOperador;
                end
            end
          else if ipTabela = 'CONTA_RECEBER' then
            begin
              if ipParam.Name = TParametros.coFundo then
                Result := TSQLGenerator.fpuFilterInteger(Result, 'CONTA_RECEBER_VINCULO', 'ID_FUNDO', vaValor.ToInteger, vaOperador)
              else if ipParam.Name = TParametros.coDataPagamentoRecebimento then
                begin
                  Result := Result + ' (' + ipTabela + '_PARCELA.DATA_RECEBIMENTO between ' +
                    QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 0))) +
                    ' AND ' + QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 1))) + ')' + vaOperador;
                end
            end;
        end;
    end
  else if ipTabela = 'TRANSFERENCIA_FINANCEIRA' then
    begin
      if ipParam.Name = TParametros.coProjeto then
        begin
          Result := TSQLGenerator.fpuFilterInteger(Result, 'PROJETO_ORIGEM', 'ID', vaValor.ToInteger, TOperadores.coOR);
          Result := TSQLGenerator.fpuFilterInteger(Result, 'PROJETO_DESTINO', 'ID', vaValor.ToInteger, vaOperador);
        end
      else if ipParam.Name = TParametros.coFundo then
        begin
          Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_FUNDO_ORIGEM', vaValor.ToInteger, TOperadores.coOR);
          Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_FUNDO_DESTINO', vaValor.ToInteger, vaOperador);
        end
      else if ipParam.Name = TParametros.coData then
        begin
          Result := TSQLGenerator.fpuFilterData(Result, ipTabela, 'DATA', TUtils.fpuExtrairData(vaValor, 0),
            TUtils.fpuExtrairData(vaValor, 1), vaOperador);
        end
      else if ipParam.Name = TParametros.coTipo then
        begin
          vaCodigos := TUtils.fpuConverterStringToArrayInteger(vaValor);
          Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'TIPO', vaCodigos, vaOperador);
        end
    end

end;

end.
