unit smuFuncoesFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuFuncoesBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery,
  System.RegularExpressions, System.Math, uClientDataSet, uTypes, uUtils;

type
  TsmFuncoesFinanceiro = class(TsmFuncoesBasico)
  private
    function fpvGerarIdentificador(ipDataSet: TRFQuery; ipIdentificadorPai: String): string;
    function fpvVerificarDependenciasPorIdentificador(ipIdentificador, ipNomeTabela: string): Boolean;
    procedure ppvQuitarReabrirParcela(ipIdParcela: Integer; ipQuitar: Boolean);
    procedure ppvReceberReabrirParcela(ipIdParcela: Integer; ipReceber: Boolean);
    procedure ppvAtualizarSaldoFundo(ipIdParcela: Integer; ipDataSetVinculo, ipDataSetParcela: TRFQuery; ipIncrementar, ipContaReceber: Boolean);
    function fpvVerificarStatusParcela(ipIdParcela: Integer;
      ipContaReceber: Boolean; ipStatus: Integer): Boolean;
  public
    function fpuVerificarDependenciasPlanoConta(ipIdentificador: string): Boolean;
    function fpuVerificarDependenciasRubrica(ipIdentificador: string): Boolean;

    function fpuGerarIdentificadorPlanoContas(ipIdConta: Integer): string;
    function fpuGerarIdentificadorRubrica(ipIdRubrica: Integer): string;

    procedure ppuQuitarParcela(ipIdParcela: Integer);
    procedure ppuReabrirParcela(ipIdParcela: Integer);
    procedure ppuReabrirTodasParcelasContaPagar(ipIdContaPagar: Integer);

    procedure ppuReceberParcela(ipIdParcela: Integer);
    procedure ppuCancelarRecebimentoParcela(ipIdParcela: Integer);
    procedure ppuCancelarTodosRecebimentosContaReceber(ipIdContaReceber: Integer);

    function fpuSaldoRealRubrica(ipIdProjeto, ipIdRubrica: Integer): Double;

  end;

var
  smFuncoesFinanceiro: TsmFuncoesFinanceiro;

implementation

{$R *.dfm}

{ TsmFuncoesFinanceiro }

function TsmFuncoesFinanceiro.fpuVerificarDependenciasPlanoConta(
  ipIdentificador: string): Boolean;
begin
  Result := fpvVerificarDependenciasPorIdentificador(ipIdentificador, 'PLANO_CONTAS');
end;

function TsmFuncoesFinanceiro.fpuVerificarDependenciasRubrica(
  ipIdentificador: string): Boolean;
begin
  Result := fpvVerificarDependenciasPorIdentificador(ipIdentificador, 'RUBRICA');
end;

function TsmFuncoesFinanceiro.fpvVerificarDependenciasPorIdentificador(ipIdentificador, ipNomeTabela: string): Boolean;
var
  vaQtde: Integer;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'Select count(*) AS QTDE ' +
        '                       from ' + ipNomeTabela + ' ' +
        '                      where ' + ipNomeTabela + '.identificador like :IDENTIFICADOR';
      ipDataSet.ParamByName('IDENTIFICADOR').AsString := ipIdentificador + '%';
      ipDataSet.Open();
      vaQtde := ipDataSet.FieldByName('QTDE').AsInteger;
    end);

  Result := vaQtde > 1;
end;

function TsmFuncoesFinanceiro.fpvGerarIdentificador(ipDataSet: TRFQuery;
ipIdentificadorPai: String): string;
var
  vaMatch: TMatch;
  vaUltimoNumero: Integer;
begin
  if ipDataSet.Eof then
    begin
      Result := ipIdentificadorPai + '1';
    end
  else
    begin
      vaMatch := TRegex.Match(ipDataSet.FieldByName('IDENTIFICADOR').AsString, '\d+$');
      if vaMatch.Success then
        begin
          if TryStrToInt(vaMatch.Value, vaUltimoNumero) then
            begin
              Result := Result + ipIdentificadorPai + (vaUltimoNumero + 1).ToString();
            end
          else
            Result := ipIdentificadorPai + '1';
        end
      else
        Result := ipIdentificadorPai + '1';
    end;
end;

function TsmFuncoesFinanceiro.fpuGerarIdentificadorRubrica(ipIdRubrica: Integer): string;
var
  vaResult: string;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    var
      vaIdentificadorPai: string;
    begin
      vaIdentificadorPai := '';

      ipDataSet.Close;
      if ipIdRubrica <> 0 then
        begin
          ipDataSet.SQL.Text := 'select Rubrica.Id, ' +
            '                           Rubrica.Identificador' +
            '                      from Rubrica' +
            '                      where Rubrica.Id = :id';
          ipDataSet.ParamByName('ID').AsInteger := ipIdRubrica;
          ipDataSet.Open();
          if not ipDataSet.Eof then
            vaIdentificadorPai := ipDataSet.FieldByName('IDENTIFICADOR').AsString + '.';

          ipDataSet.Close;
          ipDataSet.SQL.Text := 'select first 1 Rubrica.Id, ' +
            '                                   Rubrica.Identificador ' +
            '                      from Rubrica ' +
            '                      where Rubrica.Id_Rubrica_Pai = :ID_RUBRICA_PAI ' +
            '                      Order by Rubrica.identificador desc';
          ipDataSet.ParamByName('ID_RUBRICA_PAI').AsInteger := ipIdRubrica;
        end
      else
        begin
          ipDataSet.SQL.Text := 'select first 1 Rubrica.Id, ' +
            '                             Rubrica.Identificador' +
            '                      from Rubrica ' +
            '                    where Rubrica.id_rubrica_pai is null ' +
            '                    Order by Rubrica.identificador desc';
        end;
      ipDataSet.Open;
      vaResult := fpvGerarIdentificador(ipDataSet, vaIdentificadorPai);
    end);

  Result := vaResult;
end;

function TsmFuncoesFinanceiro.fpuSaldoRealRubrica(ipIdProjeto, ipIdRubrica: Integer): Double;
var
  vaSaldo: Double;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select View_Rubrica_Projeto.Saldo_Real' +
        ' from View_Rubrica_Projeto' +
        ' where View_Rubrica_Projeto.Id_Projeto = :Id_Projeto and' +
        '       View_Rubrica_Projeto.Id_Rubrica = :Id_Rubrica';
      ipDataSet.ParamByName('ID_PROJETO').AsInteger := ipIdProjeto;
      ipDataSet.ParamByName('ID_RUBRICA').AsInteger := ipIdRubrica;
      ipDataSet.Open();

      vaSaldo := ipDataSet.FieldByName('SALDO_REAL').AsFloat;
    end);

  Result := vaSaldo;
end;

procedure TsmFuncoesFinanceiro.ppvQuitarReabrirParcela(ipIdParcela: Integer; ipQuitar: Boolean);
var
  vaUpdate: string;

  procedure plValidarSaldoRubricas;
  var
    vaRubricas: TStringList;
  begin
    pprEncapsularConsulta(
      procedure(ipDataSet: TRFQuery)
      begin
        ipDataSet.SQL.Text := 'select Rubrica.Identificador || '' - '' || Rubrica.Nome as Nome_Rubrica,' +
          '       View_Rubrica_Projeto.Saldo_Real' +
          ' from Conta_Pagar_Parcela' +
          '   inner join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar_Parcela.Id_Conta_Pagar)' +
          '   inner join View_Rubrica_Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = View_Rubrica_Projeto.Id_Projeto and Conta_Pagar_Vinculo.Id_Rubrica_Origem = View_Rubrica_Projeto.Id_Rubrica)'
          +
          '   inner join Rubrica on (Rubrica.Id = View_Rubrica_Projeto.Id_Rubrica)' +
          ' where Conta_Pagar_Parcela.Id = :ID_PARCELA';
        ipDataSet.ParamByName('ID_PARCELA').AsInteger := ipIdParcela;
        ipDataSet.Open();

        vaRubricas := TStringList.Create;
        try
          vaRubricas.Delimiter := ',';
          vaRubricas.StrictDelimiter := True;

          while not ipDataSet.Eof do
            begin
              if ipDataSet.FieldByName('SALDO_REAL').AsFloat < 0 then
                begin
                  vaRubricas.Add(' ' + ipDataSet.FieldByName('NOME_RUBRICA').AsString);
                end;

              ipDataSet.Next;
            end;

          if vaRubricas.Count > 0 then
            begin
              raise Exception.Create('Não é possível quitar essa parcela.' + slineBreak +
                'As seguintes rubricas não possuem saldo suficiente:' + vaRubricas.Text);
            end;
        finally
          vaRubricas.Free;
        end;
      end);
  end;

begin;
  Connection.StartTransaction;
  try
    if ipQuitar then
      begin
        if fpvVerificarStatusParcela(ipIdParcela, False, 1) then
          Exit; //ja quitou

        vaUpdate := 'update conta_pagar_parcela ' +
          '  set conta_pagar_parcela.data_pagamento = current_timestamp,  ' +
          '      conta_pagar_parcela.status = 1 ' +
          '  where conta_pagar_parcela.id = :ID_PARCELA';
      end
    else
      begin
        if fpvVerificarStatusParcela(ipIdParcela, False, 0) then
          Exit;
        vaUpdate := 'update conta_pagar_parcela ' +
          '  set conta_pagar_parcela.data_pagamento = null,  ' +
          '      conta_pagar_parcela.status = 0 ' +
          '  where conta_pagar_parcela.id = :ID_PARCELA';
      end;

    if Connection.ExecSQL(vaUpdate, [ipIdParcela]) < 1 then
      raise Exception.Create('Parcela não encontrada.');

    if ipQuitar then
      begin
        // para facilitar, vou realizar o pagamento primeiro e depois vou verificar o saldo, caso seja negativo faço um rollback
        plValidarSaldoRubricas;
      end;

    pprEncapsularConsulta(
      procedure(ipDataSet: TRFQuery)
      begin
        ipDataSet.SQL.Text := 'select Conta_Pagar_Parcela.id, ' +
          '                           Conta_Pagar_Parcela.id_Conta_Pagar, ' +
          '                           Conta_Pagar_Parcela.Valor as VALOR_PARCELA, ' +
          '                           Conta_Pagar.Valor_Total, ' +
          '                          (select count(*)  ' +
          '                            from Conta_Pagar_Parcela ' +
          '                           where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Qtde_Parcelas, ' +
          '                          (select count(*)  ' +
          '                            from Conta_Pagar_Parcela ' +
          '                           where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id and ' +
          '                                 Conta_Pagar_Parcela.status = 1) as Qtde_Parcelas_Paga ' +
          ' from Conta_Pagar ' +
          ' inner join Conta_Pagar_Parcela on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar) ' +
          ' where Conta_Pagar.Id = (Select Conta_Pagar_parcela.id_Conta_Pagar ' +
          '                              from Conta_Pagar_parcela ' +
          '                           where Conta_Pagar_parcela.id = :Id_Parcela)';
        ipDataSet.ParamByName('ID_PARCELA').AsInteger := ipIdParcela;
        ipDataSet.Open();

        pprEncapsularConsulta(
          procedure(ipDataSetVinculo: TRFQuery)
          begin
            ipDataSetVinculo.SQL.Text := 'Select Conta_Pagar_vinculo.ID_FUNDO, ' +
              '                                  Fundo.Nome as nome_fundo, ' +
              '                                  Conta_Pagar_vinculo.valor ' +
              ' from Conta_Pagar_vinculo ' +
              ' left join fundo on (fundo.id = conta_pagar_vinculo.id_fundo) ' +
              ' where Conta_Pagar_vinculo.id_Conta_Pagar = :ID_Conta_Pagar and ' +
              '       Conta_Pagar_Vinculo.id_fundo is not null';
            ipDataSetVinculo.ParamByName('ID_Conta_Pagar').AsInteger := ipDataSet.FieldByName('ID_Conta_Pagar').AsInteger;
            ipDataSetVinculo.Open();

            if not ipDataSetVinculo.Eof then
              ppvAtualizarSaldoFundo(ipIdParcela, ipDataSetVinculo, ipDataSet, not ipQuitar, False);
          end);
      end);

    Connection.Commit;
  except
    Connection.Rollback;
    raise;

  end;
end;

procedure TsmFuncoesFinanceiro.ppvAtualizarSaldoFundo(ipIdParcela: Integer; ipDataSetVinculo, ipDataSetParcela: TRFQuery;
ipIncrementar, ipContaReceber: Boolean);
var
  vaValorPercentual, vaPercentual, vaSomaPercentuais, vaSomaParcelas: Double;
  vaUpdate: string;
  I, j: Integer;
  vaDataSet: TRFQuery;

  procedure plAtualizarSaldoFundo(ipValor: Double);
  begin
    vaDataSet.Close;
    vaDataSet.ParamByName('ID_FUNDO').AsInteger := ipDataSetVinculo.FieldByName('ID_FUNDO').AsInteger;
    vaDataSet.Open();

    if (not vaDataSet.Eof) and (vaDataSet.FieldByName('SALDO').AsFloat < ipValor) and (not ipIncrementar) then
      begin
        if (not ipContaReceber) then
          raise Exception.Create('O fundo ' + ipDataSetVinculo.FieldByName('NOME_FUNDO').AsString +
            ' não possui saldo suficiente para quitar essa parcela.')
        else if ipContaReceber then // cancelando um pagamento
          raise Exception.Create('Não é possível reabrir esta parcela pois o fundo ' + ipDataSetVinculo.FieldByName('NOME_FUNDO').AsString +
            ' não possui saldo suficiente.');
      end;

    Connection.ExecSQL(vaUpdate, [ipValor, ipDataSetVinculo.FieldByName('ID_FUNDO').AsInteger]);
  end;

  function flCalcularValorPercentual: Double;
  var
    vaPerc: Double;
  begin
    vaPerc := ipDataSetParcela.FieldByName('VALOR_PARCELA').AsFloat / ipDataSetParcela.FieldByName('VALOR_TOTAL').AsFloat;
    Result := TUtils.fpuTruncTo(ipDataSetVinculo.FieldByName('VALOR').AsFloat * vaPerc, 2); // arredonda para 2 casas decimais
  end;

begin
  pprCriarDataSet(vaDataSet);
  try
    vaDataSet.SQL.Text := 'Select fundo.saldo from fundo where fundo.id = :ID_FUNDO';
    if ipIncrementar then
      vaUpdate := 'update fundo set fundo.saldo = fundo.saldo + :VALOR Where fundo.id = :ID_FUNDO'
    else
      vaUpdate := 'update fundo set fundo.saldo = fundo.saldo - :VALOR Where fundo.id = :ID_FUNDO';

    if ipDataSetParcela.RecordCount = 1 then
      begin
        ipDataSetVinculo.First;
        while not ipDataSetVinculo.Eof do
          begin
            plAtualizarSaldoFundo(ipDataSetVinculo.FieldByName('VALOR').AsFloat);
            ipDataSetVinculo.Next;
          end;
      end
    else
      begin
        if ((ipDataSetParcela.FieldByName('QTDE_PARCELAS_PAGA').AsInteger = ipDataSetParcela.FieldByName('QTDE_PARCELAS').AsInteger) and
          ipIncrementar and ipContaReceber) or // recebeu a ultima parcela
          ((ipDataSetParcela.FieldByName('QTDE_PARCELAS_PAGA').AsInteger = ipDataSetParcela.FieldByName('QTDE_PARCELAS').AsInteger) and
          (not ipIncrementar) and (not ipContaReceber)) or // pagou ultima parcela
          ((ipDataSetParcela.FieldByName('QTDE_PARCELAS_PAGA').AsInteger = ipDataSetParcela.FieldByName('QTDE_PARCELAS').AsInteger - 1) and
          (not ipIncrementar) and ipContaReceber) or
        // cancelou a primeira parcela apos ter recebido todas
          ((ipDataSetParcela.FieldByName('QTDE_PARCELAS_PAGA').AsInteger = ipDataSetParcela.FieldByName('QTDE_PARCELAS').AsInteger - 1) and
          (ipIncrementar) and (not ipContaReceber)) then
          // Reabriu a primeira parcela apos ter pago todas
          begin
            ipDataSetVinculo.First;
            for I := 1 to ipDataSetVinculo.RecordCount do
              begin
                vaSomaParcelas := 0;
                ipDataSetParcela.First;
                while not ipDataSetParcela.Eof do
                  begin
                    if ipDataSetParcela.FieldByName('ID').AsInteger <> ipIdParcela then
                      begin
                        if I = ipDataSetVinculo.RecordCount then
                          begin
                            vaSomaPercentuais := 0;
                            ipDataSetVinculo.First;
                            for j := 1 to ipDataSetVinculo.RecordCount do
                              begin
                                vaValorPercentual := flCalcularValorPercentual;
                                if j = ipDataSetVinculo.RecordCount then
                                  vaSomaParcelas :=
                                    TUtils.fpuTruncTo(vaSomaParcelas + (ipDataSetParcela.FieldByName('VALOR_PARCELA').AsFloat - vaSomaPercentuais), 2)
                                else
                                  vaSomaPercentuais := TUtils.fpuTruncTo(vaSomaPercentuais + vaValorPercentual, 2);

                                ipDataSetVinculo.Next;
                              end;

                            ipDataSetVinculo.RecNo := I;
                          end
                        else
                          vaSomaParcelas := TUtils.fpuTruncTo(vaSomaParcelas + flCalcularValorPercentual, 2);
                      end;

                    ipDataSetParcela.Next;
                  end;

                plAtualizarSaldoFundo(ipDataSetVinculo.FieldByName('VALOR').AsFloat - vaSomaParcelas);

                ipDataSetVinculo.Next;
              end;
          end
        else
          begin

            if not ipDataSetParcela.Locate(TBancoDados.coId, ipIdParcela, []) then
              raise Exception.Create('Erro ao atualizar o saldo do Fundo. Detalhes: Parcela de id ' + ipIdParcela.ToString + ' não encontrada.');

            ipDataSetVinculo.First;
            for I := 1 to ipDataSetVinculo.RecordCount do
              begin
                vaValorPercentual := flCalcularValorPercentual;

                if I = ipDataSetVinculo.RecordCount then
                  vaValorPercentual := ipDataSetParcela.FieldByName('VALOR_PARCELA').AsFloat - vaSomaPercentuais
                else
                  vaSomaPercentuais := TUtils.fpuTruncTo(vaSomaPercentuais + vaValorPercentual, 2);

                plAtualizarSaldoFundo(vaValorPercentual);

                ipDataSetVinculo.Next;
              end;
          end;
      end;
  finally
    vaDataSet.Close;
    vaDataSet.Free;
  end;
end;

function TsmFuncoesFinanceiro.fpvVerificarStatusParcela(ipIdParcela: Integer; ipContaReceber: Boolean; ipStatus: Integer): Boolean;
var
  vaResult: Boolean;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      if ipContaReceber then
        ipDataSet.SQL.Text := 'Select conta_receber_parcela.status ' +
          '   from conta_receber_parcela ' +
          'where conta_receber_parcela.id = :ID'
      else
        ipDataSet.SQL.Text := 'Select conta_pagar_parcela.status ' +
          '   from conta_pagar_parcela ' +
          'where conta_pagar_parcela.id = :ID';

      ipDataSet.ParamByName('ID').AsInteger := ipIdParcela;
      ipDataSet.Open();

      vaResult := ipDataSet.FieldByName('STATUS').AsInteger = ipStatus;
    end);

  Result := vaResult;
end;

procedure TsmFuncoesFinanceiro.ppvReceberReabrirParcela(ipIdParcela: Integer;
ipReceber: Boolean);
var
  vaUpdate: string;
begin;
  Connection.StartTransaction;
  try
    if ipReceber then
      begin
        if fpvVerificarStatusParcela(ipIdParcela, True, 1) then
          Exit; // ja recebeu

        vaUpdate := 'update conta_receber_parcela ' +
          '  set conta_receber_parcela.data_recebimento = current_timestamp,  ' +
          '      conta_receber_parcela.status = 1 ' +
          '  where conta_receber_parcela.id = :ID_PARCELA';
      end
    else
      begin
        if fpvVerificarStatusParcela(ipIdParcela, True, 0) then
          Exit; // ja reabriu
        vaUpdate := 'update conta_receber_parcela ' +
          '  set conta_receber_parcela.data_recebimento = null,  ' +
          '      conta_receber_parcela.status = 0 ' +
          '  where conta_receber_parcela.id = :ID_PARCELA';
      end;

    if Connection.ExecSQL(vaUpdate, [ipIdParcela]) < 1 then
      raise Exception.Create('Parcela não encontrada.');

    pprEncapsularConsulta(
      procedure(ipDataSet: TRFQuery)
      begin
        ipDataSet.SQL.Text := 'select Conta_Receber_Parcela.id, ' +
          '                           Conta_Receber_Parcela.id_conta_receber, ' +
          '                           Conta_Receber_Parcela.Valor as VALOR_PARCELA, ' +
          '                           Conta_Receber.Valor_Total, ' +
          '                          (select count(*)  ' +
          '                            from Conta_Receber_Parcela ' +
          '                           where Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id) as Qtde_Parcelas, ' +
          '                          (select count(*)  ' +
          '                            from Conta_Receber_Parcela ' +
          '                           where Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id and ' +
          '                                 Conta_Receber_Parcela.status = 1) as Qtde_Parcelas_Paga ' +
          ' from Conta_Receber ' +
          ' inner join Conta_Receber_Parcela on (Conta_Receber.Id = Conta_Receber_Parcela.Id_Conta_Receber) ' +
          ' where Conta_Receber.Id = (Select conta_receber_parcela.id_conta_receber ' +
          '                              from conta_receber_parcela ' +
          '                           where conta_receber_parcela.id = :Id_Parcela)';
        ipDataSet.ParamByName('ID_PARCELA').AsInteger := ipIdParcela;
        ipDataSet.Open();

        pprEncapsularConsulta(
          procedure(ipDataSetVinculo: TRFQuery)
          begin
            ipDataSetVinculo.SQL.Text := 'Select conta_receber_vinculo.ID_FUNDO, ' +
              '                                  Fundo.Nome as nome_fundo, ' +
              '                                  conta_receber_vinculo.valor ' +
              ' from conta_receber_vinculo ' +
              ' inner join fundo on (fundo.id = conta_receber_vinculo.id_fundo) ' +
              ' where conta_receber_vinculo.id_conta_receber = :ID_CONTA_RECEBER';
            ipDataSetVinculo.ParamByName('ID_CONTA_RECEBER').AsInteger := ipDataSet.FieldByName('ID_CONTA_RECEBER').AsInteger;
            ipDataSetVinculo.Open();

            ppvAtualizarSaldoFundo(ipIdParcela, ipDataSetVinculo, ipDataSet, ipReceber, True);
          end);

      end);

    Connection.Commit;
  except
    Connection.Rollback;
    raise;
  end;

end;

procedure TsmFuncoesFinanceiro.ppuCancelarRecebimentoParcela(
  ipIdParcela: Integer);
begin
  ppvReceberReabrirParcela(ipIdParcela, False);
end;

procedure TsmFuncoesFinanceiro.ppuCancelarTodosRecebimentosContaReceber(
  ipIdContaReceber: Integer);
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text :=
        'Select conta_receber_parcela.id from conta_receber_parcela where conta_receber_parcela.id_conta_receber = :id_conta_receber';
      ipDataSet.ParamByName('ID_CONTA_RECEBER').AsInteger := ipIdContaReceber;
      ipDataSet.Open();

      while not ipDataSet.Eof do
        begin
          ppuCancelarRecebimentoParcela(ipDataSet.FieldByName('ID').AsInteger);
          ipDataSet.Next;
        end;

    end);
end;

procedure TsmFuncoesFinanceiro.ppuQuitarParcela(ipIdParcela: Integer);
begin
  ppvQuitarReabrirParcela(ipIdParcela, True);
end;

procedure TsmFuncoesFinanceiro.ppuReabrirParcela(ipIdParcela: Integer);
begin
  ppvQuitarReabrirParcela(ipIdParcela, False);
end;

procedure TsmFuncoesFinanceiro.ppuReabrirTodasParcelasContaPagar(
  ipIdContaPagar: Integer);
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text :=
        'Select conta_pagar_parcela.id from conta_pagar_parcela where conta_pagar_parcela.id_conta_pagar = :id_conta_pagar';
      ipDataSet.ParamByName('ID_CONTA_PAGAR').AsInteger := ipIdContaPagar;
      ipDataSet.Open();

      while not ipDataSet.Eof do
        begin
          ppuReabrirParcela(ipDataSet.FieldByName('ID').AsInteger);
          ipDataSet.Next;
        end;

    end);
end;

procedure TsmFuncoesFinanceiro.ppuReceberParcela(ipIdParcela: Integer);
begin
  ppvReceberReabrirParcela(ipIdParcela, True);
end;

function TsmFuncoesFinanceiro.fpuGerarIdentificadorPlanoContas(ipIdConta: Integer): string;
var
  vaResult: string;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    var
      vaIdentificadorPai: string;
    begin
      vaIdentificadorPai := '';

      ipDataSet.Close;
      if ipIdConta <> 0 then
        begin
          ipDataSet.SQL.Text := 'select   Plano_Contas.Id, ' +
            '                             Plano_Contas.Identificador' +
            '                      from Plano_Contas' +
            '                      where Plano_Contas.Id = :id';
          ipDataSet.ParamByName('ID').AsInteger := ipIdConta;
          ipDataSet.Open();
          if not ipDataSet.Eof then
            vaIdentificadorPai := ipDataSet.FieldByName('IDENTIFICADOR').AsString + '.';

          ipDataSet.Close;
          ipDataSet.SQL.Text := 'select first 1 Plano_Contas.Id, ' +
            '                                   Plano_Contas.Identificador ' +
            '                      from Plano_Contas ' +
            '                      where Plano_Contas.Id_Conta_Pai = :Id_Conta_Pai ' +
            '                      Order by Plano_Contas.identificador desc';
          ipDataSet.ParamByName('ID_CONTA_PAI').AsInteger := ipIdConta;
        end
      else
        begin
          ipDataSet.SQL.Text := 'select first 1 Plano_Contas.Id, ' +
            '                             Plano_Contas.Identificador' +
            '                      from Plano_Contas ' +
            '                    where plano_contas.id_conta_pai is null ' +
            '                    Order by Plano_Contas.identificador desc';
        end;
      ipDataSet.Open;
      vaResult := fpvGerarIdentificador(ipDataSet, vaIdentificadorPai);
    end);

  Result := vaResult;
end;

end.
