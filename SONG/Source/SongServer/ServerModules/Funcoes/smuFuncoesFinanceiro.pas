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
    procedure ppvAtualizarSaldoFundo(ipIdParcela: Integer; ipDataSetVinculo, ipDataSetParcela: TRFQuery; ipIncrementar,ipContaReceber: Boolean);
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

procedure TsmFuncoesFinanceiro.ppvQuitarReabrirParcela(ipIdParcela: Integer; ipQuitar: Boolean);
var
  vaUpdate: string;
begin;
  Connection.StartTransaction;
  try
    if ipQuitar then
      begin
        vaUpdate := 'update conta_pagar_parcela ' +
          '  set conta_pagar_parcela.data_pagamento = current_timestamp,  ' +
          '      conta_pagar_parcela.status = 1 ' +
          '  where conta_pagar_parcela.id = :ID_PARCELA';
      end
    else
      vaUpdate := 'update conta_pagar_parcela ' +
        '  set conta_pagar_parcela.data_pagamento = null,  ' +
        '      conta_pagar_parcela.status = 0 ' +
        '  where conta_pagar_parcela.id = :ID_PARCELA';

    if Connection.ExecSQL(vaUpdate, [ipIdParcela]) < 1 then
      raise Exception.Create('Parcela não encontrada.');

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
              '                                  Conta_Pagar_vinculo.valor ' +
              ' from Conta_Pagar_vinculo ' +
              ' where Conta_Pagar_vinculo.id_Conta_Pagar = :ID_Conta_Pagar';
            ipDataSetVinculo.ParamByName('ID_Conta_Pagar').AsInteger := ipDataSet.FieldByName('ID_Conta_Pagar').AsInteger;
            ipDataSetVinculo.Open();

            ppvAtualizarSaldoFundo(ipIdParcela, ipDataSetVinculo, ipDataSet, not ipQuitar, false);
          end);
      end);

    Connection.Commit;
  except
    Connection.Rollback;
    raise;

  end;
end;

procedure TsmFuncoesFinanceiro.ppvAtualizarSaldoFundo(ipIdParcela: Integer; ipDataSetVinculo, ipDataSetParcela: TRFQuery; ipIncrementar,ipContaReceber: Boolean);
var
  vaValorPercentual, vaDiferencaArredondamento, vaPercentual, vaSomaPercentuais: Double;
  vaUpdate: string;

  function flCalcularValorPercentual: Double;
  var
    vaPerc: Double;
  begin
    vaPerc := ipDataSetParcela.FieldByName('VALOR_PARCELA').AsFloat / ipDataSetParcela.FieldByName('VALOR_TOTAL').AsFloat;
    Result := TUtils.fpuTruncTo(ipDataSetVinculo.FieldByName('VALOR').AsFloat * vaPerc, 2); // arredonda para 2 casas decimais
  end;

begin
  if ipIncrementar then
    vaUpdate := 'update fundo set fundo.saldo = fundo.saldo + :VALOR Where fundo.id = :ID_FUNDO'
  else
    vaUpdate := 'update fundo set fundo.saldo = fundo.saldo - :VALOR Where fundo.id = :ID_FUNDO';

  if ipDataSetParcela.RecordCount = 1 then
    begin
      ipDataSetVinculo.First;
      while not ipDataSetVinculo.Eof do
        begin
          Connection.ExecSQL(vaUpdate, [ipDataSetVinculo.FieldByName('VALOR').AsFloat, ipDataSetVinculo.FieldByName('ID_FUNDO').AsInteger]);
          ipDataSetVinculo.Next;
        end;
    end
  else
    begin
      if ((ipDataSetParcela.FieldByName('QTDE_PARCELAS_PAGA').AsInteger = 1) and ipIncrementar and ipContaReceber) or//recebeu primeira parcela
         ((ipDataSetParcela.FieldByName('QTDE_PARCELAS_PAGA').AsInteger = 1) and (not ipIncrementar) and (not ipContaReceber)) or//pagou primeira parcela          
         ((ipDataSetParcela.FieldByName('QTDE_PARCELAS_PAGA').AsInteger = 0) and (not ipIncrementar) and ipContaReceber) or//cancelou todos as parcelas
         ((ipDataSetParcela.FieldByName('QTDE_PARCELAS_PAGA').AsInteger = 0) and (ipIncrementar) and (not ipContaReceber)) then //Reabriu todos as parcelas
        begin
          ipDataSetVinculo.First;
          while not ipDataSetVinculo.Eof do
            begin

              if not ipDataSetParcela.Locate(TBancoDados.coId, ipIdParcela, []) then
                raise Exception.Create('Erro ao atualizar o saldo do Fundo. Detalhes: Parcela de id ' + ipIdParcela.ToString + ' não encontrada.');

              vaValorPercentual := flCalcularValorPercentual;
              vaSomaPercentuais := vaValorPercentual;

              ipDataSetParcela.First;
              while not ipDataSetParcela.Eof do
                begin
                  if ipDataSetParcela.FieldByName('ID').AsInteger <> ipIdParcela then
                    begin
                      vaSomaPercentuais := vaSomaPercentuais + flCalcularValorPercentual;
                    end;

                  ipDataSetParcela.Next;
                end;

              vaDiferencaArredondamento := ipDataSetVinculo.FieldByName('VALOR').AsFloat - vaSomaPercentuais;

              vaValorPercentual := vaValorPercentual + vaDiferencaArredondamento;
              Connection.ExecSQL(vaUpdate, [vaValorPercentual, ipDataSetVinculo.FieldByName('ID_FUNDO').AsInteger]);

              ipDataSetVinculo.Next;
            end;
        end
      else
        begin
          if not ipDataSetParcela.Locate(TBancoDados.coId, ipIdParcela, []) then
            raise Exception.Create('Erro ao atualizar o saldo do Fundo. Detalhes: Parcela de id ' + ipIdParcela.ToString + ' não encontrada.');

          ipDataSetVinculo.First;
          while not ipDataSetVinculo.Eof do
            begin
              Connection.ExecSQL(vaUpdate, [flCalcularValorPercentual, ipDataSetVinculo.FieldByName('ID_FUNDO').AsInteger]);

              ipDataSetVinculo.Next;
            end;
        end;
    end;
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
        vaUpdate := 'update conta_receber_parcela ' +
          '  set conta_receber_parcela.data_recebimento = current_timestamp,  ' +
          '      conta_receber_parcela.status = 1 ' +
          '  where conta_receber_parcela.id = :ID_PARCELA';
      end
    else
      vaUpdate := 'update conta_receber_parcela ' +
        '  set conta_receber_parcela.data_recebimento = null,  ' +
        '      conta_receber_parcela.status = 0 ' +
        '  where conta_receber_parcela.id = :ID_PARCELA';

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
              '                                  conta_receber_vinculo.valor ' +
              ' from conta_receber_vinculo ' +
              ' where conta_receber_vinculo.id_conta_receber = :ID_CONTA_RECEBER';
            ipDataSetVinculo.ParamByName('ID_CONTA_RECEBER').AsInteger := ipDataSet.FieldByName('ID_CONTA_RECEBER').AsInteger;
            ipDataSetVinculo.Open();

            ppvAtualizarSaldoFundo(ipIdParcela, ipDataSetVinculo, ipDataSet, ipReceber, true);
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
  ppvQuitarReabrirParcela(ipIdParcela, true);
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
  ppvReceberReabrirParcela(ipIdParcela, true);
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
