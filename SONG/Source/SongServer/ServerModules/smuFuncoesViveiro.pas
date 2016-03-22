unit smuFuncoesViveiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, uQuery;

type
  TsmFuncoesViveiro = class(TsmBasico)
  private
    { Private declarations }
  public
    function fpuCalcularQuantidadeSemente(ipIdEspecie: Integer; ipQtdeKg: Double): Integer;
    function fpuCalcularTaxaGerminacaoLote(ipIdLote: Integer): Double;
    procedure ppuAtualizarTaxaGerminacaoLote(ipIdLote: Integer);
    procedure ppuAtualizarEstoqueLoteSemente(ipIdLote: Integer);

    function fpuValidarNomeMatriz(ipId: Integer; ipNome: String): Boolean;
    function fpuValidarNomeCanteiro(ipId: Integer; ipNome: String): Boolean;
    procedure ppuValidarSemeadura(ipIdLote,ipIdSemeadura: Integer; ipQtdeSemeada: Double);

    procedure ppuFinalizarEtapaGerminacaoLote(ipIdLote: Integer);

    procedure ppuReiniciarEtapaGerminacaoLote(ipId: Integer);
  end;

var
  smFuncoesViveiro: TsmFuncoesViveiro;

implementation

{$R *.dfm}

{ TsmBasico1 }

function TsmFuncoesViveiro.fpuCalcularQuantidadeSemente(ipIdEspecie: Integer;
  ipQtdeKg: Double): Integer;
var
  vaQtde: Integer;
begin
  vaQtde := 0;
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select ESPECIE.QTDE_SEMENTE_KILO ' +
        ' from ESPECIE ' +
        ' where ID = :ID';

      ipDataSet.ParamByName('ID').AsInteger := ipIdEspecie;
      ipDataSet.Open();
      if (not ipDataSet.Eof) then
        begin
          vaQtde := Trunc(ipQtdeKg * ipDataSet.FieldByName('QTDE_SEMENTE_KILO').AsFloat);
        end;
    end);

  Result := vaQtde;
end;

function TsmFuncoesViveiro.fpuCalcularTaxaGerminacaoLote(
  ipIdLote: Integer): Double;
var
  vaQtdeTotalSementes, vaQtdeGerminada: Integer;
  vaTaxaGerminacao: Double;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select Especie.Qtde_Semente_Kilo,' +
        '                           Lote_Semente.Qtde as Qtde_Coletado,' +
        '                           (select first 1 Germinacao.Qtde_Germinada' +
        '                               from Germinacao' +
        '                            where Germinacao.Id_Lote_Semente = Lote_Semente.Id' +
        '                            order by Germinacao.Data desc) as Qtde_Germinada' +
        '                    from Lote_Semente' +
        '                    inner join Especie on (Especie.Id = Lote_Semente.Id_Especie)' +
        '                    where Lote_Semente.Id = :Id';

      ipDataSet.ParamByName('ID').AsInteger := ipIdLote;
      ipDataSet.Open();

      if not ipDataSet.Eof then
        begin
          vaQtdeTotalSementes := Trunc(ipDataSet.FieldByName('QTDE_COLETADO').AsFloat * ipDataSet.FieldByName('QTDE_SEMENTE_KILO').AsFloat);
          vaQtdeGerminada := ipDataSet.FieldByName('QTDE_GERMINADA').AsInteger;

          try
            vaTaxaGerminacao := (vaQtdeGerminada / vaQtdeTotalSementes) * 100;
          except
            vaTaxaGerminacao := 0;
          end;
          // a taxa de descarte é um campo calculado no banco, entao nao preciso calcula-la
        end
      else
        raise Exception.Create('Lote não encontrado.');
    end);

  Result := vaTaxaGerminacao;
end;

function TsmFuncoesViveiro.fpuValidarNomeCanteiro(ipId: Integer;
ipNome: String): Boolean;
begin
  Result := fprValidarCampoUnico('CANTEIRO', 'NOME', ipId, ipNome);
end;

function TsmFuncoesViveiro.fpuValidarNomeMatriz(ipId: Integer;
ipNome: String): Boolean;
begin
  Result := fprValidarCampoUnico('MATRIZ', 'NOME', ipId, ipNome);
end;

procedure TsmFuncoesViveiro.ppuAtualizarEstoqueLoteSemente(ipIdLote: Integer);
begin
  Connection.ExecSQL(
    ' update Lote_Semente' +
    '   set Lote_Semente.Qtde_Armazenada = case' +
    '                                 when Lote_Semente.Qtde - (select coalesce(sum(Semeadura.Qtde_Semeada),0)' +
    '                                                     from Semeadura' +
    '                                                   where Semeadura.Id_Lote_Semente = :Id) >= 0 then Lote_Semente.Qtde - (select coalesce(sum(Semeadura.Qtde_Semeada),0)' +
    '                                                                                                           from Semeadura' +
    '                                                                                                         where Semeadura.Id_Lote_Semente = :Id)' +
    '                                 else 0' +
    '                              end' +
    ' where Lote_Semente.Id = :Id', [ipIdLote]);
end;

procedure TsmFuncoesViveiro.ppuAtualizarTaxaGerminacaoLote(ipIdLote: Integer);
var
  vaTaxaGerminacao: Double;
begin
  vaTaxaGerminacao := fpuCalcularTaxaGerminacaoLote(ipIdLote);
  // a taxa de descarte é um campo calculado no banco, entao nao preciso calcula-la
  Connection.ExecSQL('update lote_Semente set lote_Semente.taxa_germinacao = :taxa where lote_Semente.id = :id', [vaTaxaGerminacao, ipIdLote]);
end;

procedure TsmFuncoesViveiro.ppuFinalizarEtapaGerminacaoLote(ipIdLote: Integer);
begin
  // a taxa de descarte é um campo calculado no banco, entao nao preciso calcula-la
  Connection.ExecSQL('update lote_Semente set lote_Semente.status = 1 where lote_Semente.id = :id', [ipIdLote]);
end;

procedure TsmFuncoesViveiro.ppuReiniciarEtapaGerminacaoLote(ipId: Integer);
begin
  Connection.ExecSQL('update lote_Semente set lote_Semente.status = 0 where lote_Semente.id = :id', [ipId]);
end;

procedure TsmFuncoesViveiro.ppuValidarSemeadura(ipIdLote, ipIdSemeadura: Integer;
ipQtdeSemeada: Double);
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select lote_Semente.qtde_armazenada, '+
      '                             semeadura.qtde_semeada '+
      '                       from lote_Semente '+
      '                      left join semeadura on (semeadura.id=:ID_SEMEADURA) '+
      '                      where lote_Semente.id =:id';
      ipDataSet.ParamByName('ID').AsInteger := ipIdLote;
      ipDataSet.ParamByName('ID_SEMEADURA').AsInteger := ipIdSemeadura;
      ipDataSet.Open();
      if ipDataSet.Eof then
        raise Exception.Create('Lote inválido.');

        //Faço a soma para os caso onde estiver alterando, pois nesse caso tenho que desconsiderar o valor já cadastrado para a semeadura que esta sendo alterada
      if (ipDataSet.FieldByName('QTDE_ARMAZENADA').AsFloat + ipDataSet.FieldByName('QTDE_SEMEADA').AsFloat) < ipQtdeSemeada then
        raise Exception.Create('Quantidade semeada não pode ser superior a quantidade em estoque para este lote.');

    end);
end;

end.
