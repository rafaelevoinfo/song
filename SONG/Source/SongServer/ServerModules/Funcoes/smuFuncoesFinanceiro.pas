unit smuFuncoesFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuFuncoesBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery,
  System.RegularExpressions, System.Math;

type
  TsmFuncoesFinanceiro = class(TsmFuncoesBasico)
  private
    function fpvGerarIdentificador(ipDataSet: TRFQuery; ipIdentificadorPai: String): string;
    function fpvVerificarDependenciasPorIdentificador(ipIdentificador, ipNomeTabela: string): Boolean;
    procedure ppvQuitarReabrirParcela(ipIdParcela: Integer; ipQuitar: Boolean);
    procedure ppvReceberReabrirParcela(ipIdParcela: Integer; ipReceber: Boolean);
    procedure ppvAtualizarSaldoFundo(ipDataSetVinculo, ipDataSetParcela: TRFQuery; ipIncrementar: Boolean);
  public
    function fpuVerificarDependenciasPlanoConta(ipIdentificador: string): Boolean;
    function fpuVerificarDependenciasRubrica(ipIdentificador: string): Boolean;

    function fpuGerarIdentificadorPlanoContas(ipIdConta: Integer): string;
    function fpuGerarIdentificadorRubrica(ipIdRubrica: Integer): string;

    procedure ppuQuitarParcela(ipIdParcela: Integer);
    procedure ppuReabrirParcela(ipIdParcela: Integer);

    procedure ppuReceberParcela(ipIdParcela: Integer);
    procedure ppuCancelarRecebimentoParcela(ipIdParcela: Integer);
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
  vaValorPercentual: Double;
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
        ipDataSet.SQL.Text := 'select Conta_Pagar_Parcela.id_conta_pagar, ' +
          '                          (Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total) as Percentual, ' +
          '                           Conta_Pagar.Valor_Total, ' +
          '                           (select sum(Conta_Pagar_Parcela.Valor)  ' +
          '                             from Conta_Pagar_Parcela  ' +
          '                           where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id and ' +
          '                                 Conta_Pagar_Parcela.status = 1) as Valor_Total_Pago ' +
          ' from Conta_Pagar_Parcela ' +
          ' inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar) ' +
          ' where Conta_Pagar_Parcela.Id = :Id_Parcela';
        ipDataSet.ParamByName('ID_PARCELA').AsInteger := ipIdParcela;
        ipDataSet.Open();

        pprEncapsularConsulta(
          procedure(ipDataSetVinculo: TRFQuery)
          begin
            ipDataSetVinculo.SQL.Text := 'Select conta_pagar_vinculo.ID_FUNDO, ' +
              '                                  conta_pagar_vinculo.valor ' +
              ' from conta_pagar_vinculo ' +
              ' where conta_pagar_vinculo.id_conta_pagar = :ID_CONTA_PAGAR and  ' +
              '       conta_pagar_vinculo.id_fundo is not null';
            ipDataSetVinculo.ParamByName('ID_CONTA_PAGAR').AsInteger := ipDataSet.FieldByName('ID_CONTA_PAGAR').AsInteger;
            ipDataSetVinculo.Open();

//            ppvAtualizarSaldoFundo(ipDataSetVinculo, ipDataSet.FieldByName('VALOR_TOTAL').AsFloat,
//              ipDataSet.FieldByName('VALOR_TOTAL_PAGO').AsFloat, ipDataSet.FieldByName('PERCENTUAL').AsFloat, not ipQuitar);
          end);

      end);

    Connection.Commit;
  except
    Connection.Rollback;
    raise;

  end;
end;

procedure TsmFuncoesFinanceiro.ppvAtualizarSaldoFundo(ipDataSetVinculo, ipDataSetParcela: TRFQuery; ipIncrementar: Boolean);
var
  vaValorPercentual, vaPercentual, vaSomaPercentuais: Double;
begin
  vaPercentual := ipDataSetParcela.FieldByName('VALOR_PARCELA').AsFloat / ipDataSetParcela.FieldByName('VALOR_TOTAL').AsFloat;
  vaSomaPercentuais := 0;

  while not ipDataSetVinculo.Eof do
    begin
      vaValorPercentual := ipDataSetVinculo.FieldByName('VALOR_PARCELA').AsFloat * vaPercentual;
      ipDataSetVinculo.Next;
      if ipDataSetVinculo.Eof then//vamos jogar os quebrados tudo para o ultimo fundo
        vaValorPercentual := ipDataSetParcela.FieldByName('VALOR_PARCELA').AsFloat - vaSomaPercentuais;

      if ipIncrementar then
        Connection.ExecSQL('update fundo set fundo.saldo = fundo.saldo + :VALOR Where fundo.id = :ID_FUNDO',
          [vaValorPercentual, ipDataSetVinculo.FieldByName('ID_FUNDO').AsInteger])
      else
        Connection.ExecSQL('update Fundo ' +
          ' set Fundo.Saldo = case ' +
          '                    when Fundo.Saldo - :Valor < 0 then 0' +
          '                    else Fundo.Saldo - :Valor' +
          '                  end' +
          ' where Fundo.Id = :Id   ',
          [vaValorPercentual, ipDataSetVinculo.FieldByName('ID_FUNDO').AsInteger]);

      ipDataSetVinculo.Next;
    end;

end;

procedure TsmFuncoesFinanceiro.ppvReceberReabrirParcela(ipIdParcela: Integer;
ipReceber: Boolean);
var
  vaUpdate: string;
  vaValorPercentual: Double;
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
        ipDataSet.SQL.Text := 'select Conta_Receber_Parcela.id_conta_receber, ' +
          '                           Conta_Receber_Parcela.Valor as VALOR_PARCELA, ' +
          '                           Conta_Receber.Valor_Total, ' +
          '                          (select sum(Conta_Receber_Parcela.Valor)  ' +
          '                            from Conta_Receber_Parcela ' +
          '                           where Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id and ' +
          '                                 Conta_Receber_Parcela.status = 1) as Valor_Total_Pago ' +
          ' from Conta_Receber_Parcela ' +
          ' inner join Conta_Receber on (Conta_Receber.Id = Conta_Receber_Parcela.Id_Conta_Receber) ' +
          ' where Conta_Receber_Parcela.Id = :Id_Parcela';
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

//            ppvAtualizarSaldoFundo(ipDataSetVinculo, ipDataSet.FieldByName('VALOR_TOTAL').AsFloat,
//              ipDataSet.FieldByName('VALOR_TOTAL_PAGO').AsFloat, ipDataSet.FieldByName('PERCENTUAL').AsFloat, ipReceber);
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

procedure TsmFuncoesFinanceiro.ppuQuitarParcela(ipIdParcela: Integer);
begin
  ppvQuitarReabrirParcela(ipIdParcela, true);
end;

procedure TsmFuncoesFinanceiro.ppuReabrirParcela(ipIdParcela: Integer);
begin
  ppvQuitarReabrirParcela(ipIdParcela, False);
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
