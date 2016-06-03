unit smuFuncoesViveiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, uQuery, smuFuncoesBasico,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uTypes, Datasnap.DBClient;

type
  TsmFuncoesViveiro = class(TsmFuncoesBasico)
    qAjusta_Saldo_Especie: TRFQuery;
  private
    function fpvCalcularTaxaClassificaoMuda(ipIdLote: Integer): Double;
    { Private declarations }
  public
    function fpuCalcularQuantidadeSemente(ipIdEspecie: Integer; ipQtdeKg: Double): Integer;
    function fpuCalcularTaxaGerminacaoLote(ipIdLote: Integer): Double;
    procedure ppuAtualizarTaxaGerminacaoLote(ipIdLote: Integer);

    procedure ppuAtualizarTaxaClassificacaoMuda(ipIdLote: Integer);

    function fpuValidarNomeMatriz(ipId: Integer; ipNome: String): Boolean;
    function fpuValidarNomeCanteiro(ipId: Integer; ipNome: String): Boolean;
    procedure ppuValidarSemeadura(ipIdLote, ipIdSemeadura: Integer; ipQtdeSemeada: Double);

    procedure ppuAtualizarQtdeSementeEstoque(ipIdEspecie, ipIdLote: Integer; ipQtdeSubtrair, ipQtdeSomar: Double);
    procedure ppuAtualizarQtdeMudaEstoque(ipIdEspecie, ipIdLote: Integer; ipQtdeSubtrair, ipQtdeSomar: Integer);

    function fpuBuscarLotesMudas(ipIdCompra: Integer): string;
    function fpuBuscarLoteMuda(ipIdCompraItem: Integer): Integer;

    function fpuBuscarLotesSementes(ipIdCompra: Integer): string;
    function fpuBuscarLoteSemente(ipIdCompraItem: Integer): Integer;

    procedure ppuAjustarSaldoEspecie(ipIdEspecie: Integer);

    function fpuCalcularMediaTaxaGerminacaoClassificao(): OleVariant;
  end;

var
  smFuncoesViveiro: TsmFuncoesViveiro;

implementation

{$R *.dfm}

{ TsmBasico1 }

function TsmFuncoesViveiro.fpuBuscarLoteMuda(ipIdCompraItem: Integer): Integer;
var
  vaId: Integer;
begin
  vaId := 0;
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select lote_Muda.id from lote_muda ' +
        ' where lote_muda.id_compra_item = :ID_COMPRA_ITEM';
      ipDataSet.ParamByName('ID_COMPRA_ITEM').AsInteger := ipIdCompraItem;
      ipDataSet.Open();
      if (not ipDataSet.Eof) then
        vaId := ipDataSet.FieldByName('ID').AsInteger;
    end);

  Result := vaId;

end;

function TsmFuncoesViveiro.fpuBuscarLoteSemente(
  ipIdCompraItem: Integer): Integer;
var
  vaId: Integer;
begin
  vaId := 0;
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select Lote_Semente.id from Lote_Semente ' +
        ' where Lote_Semente.id_compra_item = :ID_COMPRA_ITEM';
      ipDataSet.ParamByName('ID_COMPRA_ITEM').AsInteger := ipIdCompraItem;
      ipDataSet.Open();
      if (not ipDataSet.Eof) then
        vaId := ipDataSet.FieldByName('ID').AsInteger;
    end);

  Result := vaId;

end;

function TsmFuncoesViveiro.fpuBuscarLotesMudas(ipIdCompra: Integer): string;
var
  vaIds: TStringList;
begin
  vaIds := TStringList.Create();
  try
    vaIds.Delimiter := coDelimitadorPadrao;
    vaIds.StrictDelimiter := True;

    pprEncapsularConsulta(
      procedure(ipDataSet: TRFQuery)
      begin
        ipDataSet.SQL.Text := 'select lote_Muda.id from lote_muda ' +
          ' where lote_muda.id_compra_item in (select compra_item.id from compra_item where compra_item.id_compra = :ID_COMPRA)';
        ipDataSet.ParamByName('ID_COMPRA').AsInteger := ipIdCompra;
        ipDataSet.Open();
        while (not ipDataSet.Eof) do
          begin
            vaIds.Add(ipDataSet.FieldByName(TBancoDados.coId).AsString);
            ipDataSet.Next;
          end;
      end);

    Result := vaIds.DelimitedText;
  finally
    vaIds.Free;
  end;
end;

function TsmFuncoesViveiro.fpuBuscarLotesSementes(ipIdCompra: Integer): string;
var
  vaIds: TStringList;
begin
  vaIds := TStringList.Create();
  try
    vaIds.Delimiter := coDelimitadorPadrao;
    vaIds.StrictDelimiter := True;

    pprEncapsularConsulta(
      procedure(ipDataSet: TRFQuery)
      begin
        ipDataSet.SQL.Text := 'select lote_semente.id from lote_semente ' +
          ' where lote_semente.id_compra_item in (select compra_item.id from compra_item where compra_item.id_compra = :ID_COMPRA)';
        ipDataSet.ParamByName('ID_COMPRA').AsInteger := ipIdCompra;
        ipDataSet.Open();
        while (not ipDataSet.Eof) do
          begin
            vaIds.Add(ipDataSet.FieldByName(TBancoDados.coId).AsString);
            ipDataSet.Next;
          end;
      end);

    Result := vaIds.DelimitedText;
  finally
    vaIds.Free;
  end;

end;

function TsmFuncoesViveiro.fpuCalcularMediaTaxaGerminacaoClassificao: OleVariant;
var
  vaCds: TClientDataSet;
begin
  vaCds := TClientDataSet.Create(nil);
  try
    pprEncapsularConsulta(
      procedure(ipDataSet: TRFQuery)
      begin
        ipDataSet.SQL.Text := '';
      end);

    Result := vaCds.Data;
  finally
    vaCds.Free;
  end;

end;

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

function TsmFuncoesViveiro.fpvCalcularTaxaClassificaoMuda(
  ipIdLote: Integer): Double;
var
  vaTaxaClassificacao: Double;
begin
  vaTaxaClassificacao := 0;
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := ' select Lote_Muda.Qtde_Inicial,' +
        '                            Lote_Muda.Qtde_Classificada' +
        ' from Lote_Muda' +
        ' where Lote_Muda.Id = :Id';

      ipDataSet.ParamByName('ID').AsInteger := ipIdLote;
      ipDataSet.Open();

      if not ipDataSet.Eof then
        begin
          try
            vaTaxaClassificacao := (ipDataSet.FieldByName('QTDE_CLASSIFICADA').AsFloat * 100) / ipDataSet.FieldByName('QTDE_INICIAL').AsFloat;
          except
            vaTaxaClassificacao := 0;
          end;
        end
      else
        raise Exception.Create('Lote não encontrado.');
    end);

  Result := vaTaxaClassificacao;
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

procedure TsmFuncoesViveiro.ppuAjustarSaldoEspecie(ipIdEspecie: Integer);
begin
  if ipIdEspecie <> 0 then
    qAjusta_Saldo_Especie.ParamByName('ID_ESPECIE').AsInteger := ipIdEspecie
  else
    qAjusta_Saldo_Especie.ParamByName('ID_ESPECIE').Clear();

  qAjusta_Saldo_Especie.ExecSQL;
  qAjusta_Saldo_Especie.Connection.Commit;
end;

procedure TsmFuncoesViveiro.ppuAtualizarQtdeMudaEstoque(ipIdEspecie, ipIdLote,
  ipQtdeSubtrair, ipQtdeSomar: Integer);
begin
  Connection.ExecSQL('update especie ' +
    ' set especie.qtde_muda_estoque = coalesce(especie.qtde_muda_estoque,0) - :qtde_anterior + :qtde_nova ' +
    ' where especie.id = :id', [ipQtdeSubtrair, ipQtdeSomar, ipIdEspecie]);

  if ipIdLote <> 0 then
    begin
      Connection.ExecSQL('update lote_muda ' +
        ' set lote_muda.saldo = coalesce(lote_muda.saldo,0) - :qtde_anterior + :qtde_nova ' +
        ' where lote_muda.id = :id', [ipQtdeSubtrair, ipQtdeSomar, ipIdLote]);

      ppuAtualizarTaxaClassificacaoMuda(ipIdLote);
    end;
end;

procedure TsmFuncoesViveiro.ppuAtualizarQtdeSementeEstoque(ipIdEspecie, ipIdLote: Integer;
ipQtdeSubtrair, ipQtdeSomar: Double);
begin
  Connection.ExecSQL('update especie ' +
    ' set especie.qtde_semente_estoque = coalesce(especie.qtde_semente_estoque,0) - :qtde_anterior + :qtde_nova ' +
    ' where especie.id = :id', [ipQtdeSubtrair, ipQtdeSomar, ipIdEspecie]);

  if ipIdLote <> 0 then
    begin
      Connection.ExecSQL(
        ' update Lote_Semente' +
        '   set Lote_Semente.Qtde_Armazenada = Lote_Semente.Qtde_Armazenada - :qtde_subtrair + :qtde_somar ' +
        ' where Lote_Semente.Id = :Id', [ipQtdeSubtrair, ipQtdeSomar, ipIdLote]);
    end;
end;

procedure TsmFuncoesViveiro.ppuAtualizarTaxaClassificacaoMuda(
  ipIdLote: Integer);
var
  vaTaxaClassificacao: Double;
begin
  vaTaxaClassificacao := fpvCalcularTaxaClassificaoMuda(ipIdLote);

  Connection.ExecSQL('update lote_muda set lote_muda.taxa_classificacao = :taxa where lote_muda.id = :id', [vaTaxaClassificacao, ipIdLote]);
end;

procedure TsmFuncoesViveiro.ppuAtualizarTaxaGerminacaoLote(ipIdLote: Integer);
var
  vaTaxaGerminacao, vaTaxaDescarte: Double;
begin
  vaTaxaGerminacao := fpuCalcularTaxaGerminacaoLote(ipIdLote);
  vaTaxaDescarte := 100 - vaTaxaGerminacao;
  if vaTaxaDescarte < 0 then
    vaTaxaDescarte := 0;
  // a taxa de descarte é um campo calculado no banco, entao nao preciso calcula-la
  Connection.ExecSQL('update lote_Semente set lote_Semente.taxa_germinacao = :taxa, ' +
    ' lote_semente.taxa_descarte = :taxa_descarte where lote_Semente.id = :id', [vaTaxaGerminacao, vaTaxaDescarte, ipIdLote]);
end;

procedure TsmFuncoesViveiro.ppuValidarSemeadura(ipIdLote, ipIdSemeadura: Integer;
ipQtdeSemeada: Double);
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select lote_Semente.qtde_armazenada, ' +
        '                             semeadura.qtde_semeada ' +
        '                       from lote_Semente ' +
        '                      left join semeadura on (semeadura.id=:ID_SEMEADURA) ' +
        '                      where lote_Semente.id =:id';
      ipDataSet.ParamByName('ID').AsInteger := ipIdLote;
      ipDataSet.ParamByName('ID_SEMEADURA').AsInteger := ipIdSemeadura;
      ipDataSet.Open();
      if ipDataSet.Eof then
        raise Exception.Create('Lote inválido.');

      // Faço a soma para os caso onde estiver alterando, pois nesse caso tenho que desconsiderar o valor já cadastrado para a semeadura que esta sendo alterada
      if (ipDataSet.FieldByName('QTDE_ARMAZENADA').AsFloat + ipDataSet.FieldByName('QTDE_SEMEADA').AsFloat) < ipQtdeSemeada then
        raise Exception.Create('Quantidade semeada não pode ser superior a quantidade em estoque para este lote.');

    end);
end;

end.
