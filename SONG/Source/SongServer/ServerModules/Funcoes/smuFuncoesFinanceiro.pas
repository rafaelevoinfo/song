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
  public
    function fpuVerificarDependenciasPlanoConta(ipIdentificador: string): Boolean;
    function fpuVerificarDependenciasRubrica(ipIdentificador: string): Boolean;

    function fpuGerarIdentificadorPlanoContas(ipIdConta: Integer): string;
    function fpuGerarIdentificadorRubrica(ipIdRubrica: Integer): string;

    procedure ppuQuitarParcela(ipIdParcela: Integer);
    procedure ppuReabrirParcela(ipIdParcela: Integer);
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
  vaValorGastoRubrica: Double;
  vaDataSet: TRFQuery;
  vaStatus: Integer;
begin;
  if ipQuitar then
    vaStatus := 1
  else
    vaStatus := 0;

  if Connection.ExecSQL('update conta_pagar_parcela ' +
    '  set conta_pagar_parcela.data_pagamento = current_timestamp,  ' +
    '      conta_pagar_parcela.status = :STATUS ' +
    '  where conta_pagar_parcela.id = :ID_PARCELA', [vaStatus, ipIdParcela]) > 0 then
    begin
      pprEncapsularConsulta(
        procedure(ipDataSet: TRFQuery)
        begin
          ipDataSet.SQL.Text := ' with Rubricas' +
            ' as (select Conta_Pagar_Parcela.Valor,' +
            '            Conta_Pagar_Projeto.Id_Rubrica,' +
            '            Conta_Pagar_Projeto.Id_Projeto' +
            '     from Conta_Pagar_Parcela' +
            '    inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)' +
            '    left join Conta_Pagar_Projeto on (Conta_Pagar_Projeto.Id_Conta_Pagar = Conta_Pagar.Id)' +
            '    where Conta_Pagar_Parcela.Id = :Id' +
            '' +
            '    union all' +
            '' +
            '    select Conta_Pagar_Parcela.Valor,' +
            '           Conta_Pagar_Atividade.Id_Rubrica,' +
            '           Atividade_Projeto.Id_Projeto' +
            '    from Conta_Pagar_Parcela' +
            '    inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)' +
            '    left join Conta_Pagar_Atividade on (Conta_Pagar_Atividade.Id_Conta_Pagar = Conta_Pagar.Id)' +
            '    left join Atividade_Projeto on (Atividade_Projeto.Id_Atividade = Conta_Pagar_Atividade.Id_Atividade)' +
            '    inner join Projeto_Rubrica on (Projeto_Rubrica.Id_Projeto = Atividade_Projeto.Id_Projeto and Projeto_Rubrica.Id_Rubrica = Conta_Pagar_Atividade.Id_Rubrica) '
            +
            '    where Conta_Pagar_Parcela.Id = :Id' +
            '' +
            '    union all' +
            '' +
            '    select Conta_Pagar_Parcela.Valor,' +
            '           Conta_Pagar_Atividade.Id_Rubrica,' +
            '           Atividade.Id_Projeto' +
            '    from Conta_Pagar_Parcela' +
            '    inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)' +
            '    left join Conta_Pagar_Atividade on (Conta_Pagar_Atividade.Id_Conta_Pagar = Conta_Pagar.Id)' +
            '    left join Atividade_Projeto on (Atividade_Projeto.Id_Atividade = Conta_Pagar_Atividade.Id_Atividade)' +
            '    left join Atividade on (Atividade.Id = Conta_Pagar_Atividade.Id_Atividade)' +
            '    inner join Projeto_Rubrica on (Projeto_Rubrica.Id_Projeto = Atividade.Id_Projeto and Projeto_Rubrica.Id_Rubrica = Conta_Pagar_Atividade.Id_Rubrica) '
            +
            '    where Conta_Pagar_Parcela.Id = :Id)' +
            '' +
            ' select distinct *' +
            '  from Rubricas' +
            ' where Rubricas.Id_Rubrica is not null';

          ipDataSet.ParamByName('ID').AsInteger := ipIdParcela;
          ipDataSet.Open();
          if not ipDataSet.Eof then
            begin
              pprCriarDataSet(vaDataSet);
              try
                vaValorGastoRubrica := RoundTo(ipDataSet.FieldByName('VALOR').AsFloat / ipDataSet.RecordCount, -2);
                while not ipDataSet.Eof do
                  begin
                    vaDataSet.Close;
                    vaDataSet.SQL.Text := ' select Projeto_Rubrica.Id,' +
                      '        Projeto_Rubrica.Orcamento,' +
                      '        Projeto_Rubrica.Gasto' +
                      '  from Projeto_Rubrica' +
                      ' where Projeto_Rubrica.Id_Projeto = :Id_Projeto and' +
                      '       Projeto_Rubrica.Id_Rubrica = :Id_Rubrica ';
                    vaDataSet.ParamByName('ID_PROJETO').AsInteger := ipDataSet.FieldByName('ID_PROJETO').AsInteger;
                    vaDataSet.ParamByName('ID_RUBRICA').AsInteger := ipDataSet.FieldByName('ID_RUBRICA').AsInteger;
                    vaDataSet.Open;
                    if not vaDataSet.Eof then
                      begin
                        vaDataSet.Edit;
                        if ipQuitar then
                          begin
                            vaDataSet.FieldByName('GASTO').AsFloat := vaDataSet.FieldByName('GASTO').AsFloat + vaValorGastoRubrica;
                            if Abs(vaDataSet.FieldByName('GASTO').AsFloat - vaDataSet.FieldByName('ORCAMENTO').AsFloat) <= 0.01 then
                              vaDataSet.FieldByName('GASTO').AsFloat := vaDataSet.FieldByName('ORCAMENTO').AsFloat;
                          end
                        else
                          begin
                            vaDataSet.FieldByName('GASTO').AsFloat := vaDataSet.FieldByName('GASTO').AsFloat - vaValorGastoRubrica;
                            if vaDataSet.FieldByName('GASTO').AsFloat < 0 then
                              vaDataSet.FieldByName('GASTO').AsFloat := 0;
                          end;
                        vaDataSet.Post;
                      end;

                    ipDataSet.Next;
                  end;
              finally
                vaDataSet.Free;
              end;
            end;
        end);
    end
  else
    raise Exception.Create('Parcela não encontrada.');

end;

procedure TsmFuncoesFinanceiro.ppuQuitarParcela(ipIdParcela: Integer);
begin
  ppvQuitarReabrirParcela(ipIdParcela, true);
end;

procedure TsmFuncoesFinanceiro.ppuReabrirParcela(ipIdParcela: Integer);
begin
  ppvQuitarReabrirParcela(ipIdParcela, false);
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
