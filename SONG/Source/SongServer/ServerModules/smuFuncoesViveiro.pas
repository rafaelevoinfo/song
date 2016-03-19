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
    procedure ppuAtualizarEstoqueSementeLote(ipIdLote: Integer);

    function fpuValidarNomeMatriz(ipId: Integer; ipNome: String): Boolean;
    function fpuValidarNomeCanteiro(ipId: Integer; ipNome: String): Boolean;
    procedure ppuValidarSemeadura(ipIdLote,ipIdSemeadura: Integer; ipQtdeSemeada: Double);

    procedure ppuFecharLoteSemente(ipIdLote: Integer);

    procedure ppuReabrirLoteSemente(ipId: Integer);
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
        '                           Lote.Qtde as Qtde_Coletado,' +
        '                           (select first 1 Germinacao.Qtde_Germinada' +
        '                               from Germinacao' +
        '                            where Germinacao.Id_Lote = Lote.Id' +
        '                            order by Germinacao.Data desc) as Qtde_Germinada' +
        '                    from Lote' +
        '                    inner join Especie on (Especie.Id = Lote.Id_Especie)' +
        '                    where Lote.Id = :Id';

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

procedure TsmFuncoesViveiro.ppuAtualizarEstoqueSementeLote(ipIdLote: Integer);
begin
  Connection.ExecSQL(
    ' update Lote' +
    '   set Lote.Qtde_Armazenada = case' +
    '                                 when Lote.Qtde - (select coalesce(sum(Semeadura.Qtde_Semeada),0)' +
    '                                                     from Semeadura' +
    '                                                   where Semeadura.Id_Lote = :Id) >= 0 then Lote.Qtde - (select coalesce(sum(Semeadura.Qtde_Semeada),0)' +
    '                                                                                                           from Semeadura' +
    '                                                                                                         where Semeadura.Id_Lote = :Id)' +
    '                                 else 0' +
    '                              end' +
    ' where Lote.Id = :Id', [ipIdLote]);
end;

procedure TsmFuncoesViveiro.ppuAtualizarTaxaGerminacaoLote(ipIdLote: Integer);
var
  vaTaxaGerminacao: Double;
begin
  vaTaxaGerminacao := fpuCalcularTaxaGerminacaoLote(ipIdLote);
  // a taxa de descarte é um campo calculado no banco, entao nao preciso calcula-la
  Connection.ExecSQL('update lote set lote.taxa_germinacao = :taxa where lote.id = :id', [vaTaxaGerminacao, ipIdLote]);
end;

procedure TsmFuncoesViveiro.ppuFecharLoteSemente(ipIdLote: Integer);
begin
  // a taxa de descarte é um campo calculado no banco, entao nao preciso calcula-la
  Connection.ExecSQL('update lote set lote.status = 1 where lote.id = :id', [ipIdLote]);
end;

procedure TsmFuncoesViveiro.ppuReabrirLoteSemente(ipId: Integer);
begin
  Connection.ExecSQL('update lote set lote.status = 0 where lote.id = :id', [ipId]);
end;

procedure TsmFuncoesViveiro.ppuValidarSemeadura(ipIdLote, ipIdSemeadura: Integer;
ipQtdeSemeada: Double);
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select lote.qtde_armazenada, '+
      '                             semeadura.qtde_semeada '+
      '                       from lote '+
      '                      left join semeadura on (semeadura.id=:ID_SEMEADURA) '+
      '                      where lote.id =:id';
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
