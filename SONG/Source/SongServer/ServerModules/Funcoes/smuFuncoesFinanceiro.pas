unit smuFuncoesFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuFuncoesBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery,
  System.RegularExpressions;

type
  TsmFuncoesFinanceiro = class(TsmFuncoesBasico)
  private
    function fpvGerarIdentificador(ipDataSet: TRFQuery; ipIdentificadorPai: String): string;
    function fpvVerificarDependenciasPorIdentificador(ipIdentificador, ipNomeTabela: string): Boolean;
  public
    function fpuVerificarDependenciasPlanoConta(ipIdentificador: string): Boolean;
    function fpuVerificarDependenciasRubrica(ipIdentificador: string): Boolean;

    function fpuGerarIdentificadorPlanoContas(ipIdConta: Integer): string;
    function fpuGerarIdentificadorRubrica(ipIdRubrica: Integer): string;
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
        '                       from '+ipNomeTabela+' ' +
        '                      where '+ipNomeTabela+'.identificador like :IDENTIFICADOR';
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
