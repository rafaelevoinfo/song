unit smuFuncoesEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuFuncoesBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery, uTypes,
  dmuPrincipal;

type
  TsmFuncoesEstoque = class(TsmFuncoesBasico)
  private
    { Private declarations }
  public
    function fpuValidarNomeItem(ipIdItem: Integer; ipNome: String): Boolean;
    function fpuValidarNomeLocalUso(ipIdLocalUso:Integer; ipNome: String): Boolean;
    function fpuVerificarComprasJaGerada(ipIdSolicitacao: Integer): Boolean;
    function fpuVerificarContaPagarJaGerada(ipIdCompra: Integer): Boolean;
    function fpuVerificarContaReceberJaGerada(ipIdVenda: Integer): Boolean;

    function fpuBuscarItensEntrada(ipIdCompra: Integer): string;
    function fpuBuscarItemEntrada(ipIdCompraItem: Integer): Integer;
    function fpuBuscarItensSaida(ipIdVenda: Integer): string;
    function fpuBuscarItemSaida(ipIdVendaItem: Integer): Integer;

    procedure ppuAtualizarSaldoItem(ipIdItem: Integer; ipQtdeSubtrair, ipQtdeSomar: Double);

    procedure ppuValidarClassificacao(ipIdLoteMuda,ipQtde:Integer);
  end;

var
  smFuncoesEstoque: TsmFuncoesEstoque;

implementation

{$R *.dfm}

{ TsmFuncoesEstoque }

function TsmFuncoesEstoque.fpuBuscarItemEntrada(
  ipIdCompraItem: Integer): Integer;
var
  vaId: Integer;
begin
  vaId := 0;
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select Entrada_Item.id from Entrada_Item ' +
        ' where Entrada_Item.id_compra_item = :ID_COMPRA_ITEM';
      ipDataSet.ParamByName('ID_COMPRA_ITEM').AsInteger := ipIdCompraItem;
      ipDataSet.Open();
      if (not ipDataSet.Eof) then
        vaId := ipDataSet.FieldByName('ID').AsInteger;
    end);

  Result := vaId;

end;

function TsmFuncoesEstoque.fpuBuscarItemSaida(ipIdVendaItem: Integer): Integer;
var
  vaId: Integer;
begin
  vaId := 0;
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select Saida_Item.id from Saida_Item ' +
        ' where Saida_Item.id_venda_item = :ID_VENDA_ITEM';
      ipDataSet.ParamByName('ID_VENDA_ITEM').AsInteger := ipIdVendaItem;
      ipDataSet.Open();
      if (not ipDataSet.Eof) then
        vaId := ipDataSet.FieldByName('ID').AsInteger;
    end);

  Result := vaId;

end;

function TsmFuncoesEstoque.fpuBuscarItensEntrada(ipIdCompra: Integer): string;
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
        ipDataSet.SQL.Text := 'select Entrada_Item.id from Entrada_Item ' +
          ' where Entrada_Item.id_compra_item in (select compra_item.id from compra_item where compra_item.id_compra = :ID_COMPRA)';
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

function TsmFuncoesEstoque.fpuBuscarItensSaida(ipIdVenda: Integer): string;
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
        ipDataSet.SQL.Text := 'select Saida_Item.id from Saida_Item ' +
          ' where Saida_Item.id_venda_item in (select venda_item.id from venda_item where venda_item.id_venda = :ID_VENDA)';
        ipDataSet.ParamByName('ID_VENDA').AsInteger := ipIdVenda;
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

function TsmFuncoesEstoque.fpuValidarNomeItem(ipIdItem: Integer;
ipNome: String): Boolean;
begin
  Result := fprValidarCampoUnico('ITEM', 'NOME', ipIdItem, ipNome.trim);
end;

function TsmFuncoesEstoque.fpuValidarNomeLocalUso(ipIdLocalUso:Integer;ipNome: String): Boolean;
begin
  Result := fprValidarCampoUnico('LOCAL_USO','NOME',ipIdLocalUso,ipNome);
end;

function TsmFuncoesEstoque.fpuVerificarComprasJaGerada(
  ipIdSolicitacao: Integer): Boolean;
var
  vaResult: Boolean;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select count(*) as Qtde ' +
        ' from Compra ' +
        ' where Compra.Id_Solicitacao_Compra = :Id_Solicitacao_Compra';
      ipDataSet.ParamByName('ID_SOLICITACAO_COMPRA').AsInteger := ipIdSolicitacao;
      ipDataSet.Open();

      vaResult := ipDataSet.FieldByName('QTDE').AsInteger > 0;
    end);

  Result := vaResult;
end;

function TsmFuncoesEstoque.fpuVerificarContaPagarJaGerada(
  ipIdCompra: Integer): Boolean;
var
  vaResult: Boolean;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select count(*) as Qtde ' +
        '   from conta_pagar ' +
        ' where conta_pagar.Id_Compra = :Id_Compra ';

      ipDataSet.ParamByName('ID_COMPRA').AsInteger := ipIdCompra;
      ipDataSet.Open();

      vaResult := (ipDataSet.FieldByName('QTDE').AsInteger > 0);

    end);

  Result := vaResult;

end;

function TsmFuncoesEstoque.fpuVerificarContaReceberJaGerada(ipIdVenda: Integer): Boolean;
var
  vaResult: Boolean;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select count(*) as Qtde ' +
        '   from conta_receber ' +
        ' where conta_receber.Id_Venda = :ID_VENDA ';

      ipDataSet.ParamByName('ID_VENDA').AsInteger := ipIdVenda;
      ipDataSet.Open();

      vaResult := (ipDataSet.FieldByName('QTDE').AsInteger > 0);

    end);

  Result := vaResult;

end;

procedure TsmFuncoesEstoque.ppuAtualizarSaldoItem(ipIdItem: Integer;
ipQtdeSubtrair, ipQtdeSomar: Double);
begin
  Connection.ExecSQL('update item ' +
    ' set item.saldo = coalesce(item.saldo,0) - :qtde_substrair + :qtde_somar ' +
    ' where item.id = :id', [ipQtdeSubtrair, ipQtdeSomar, ipIdItem]);

  if Connection.InTransaction then
    Connection.Commit;
end;

procedure TsmFuncoesEstoque.ppuValidarClassificacao(ipIdLoteMuda,
  ipQtde: Integer);
begin
  pprEncapsularConsulta(procedure (ipDataSet:TRFQuery)
  begin
    ipDataSet.SQL.Text := 'select Lote_muda.Saldo' +
                          ' from Lote_muda' +
                          ' where Lote_muda.Id = :Id ';
    ipDataSet.ParamByName('ID').AsInteger := ipIdLoteMuda;
    ipDataSet.Open();
    if ipDataSet.Eof then
      raise Exception.Create('Nenhum lote foi encontrado.');

    if ipQtde > ipDataSet.FieldByName('SALDO').AsInteger then
      raise Exception.Create('A quantidade perdida não pode ser superior ao saldo do lote.');

    if ipQtde < 1 then
      raise Exception.Create('A quantidade perdida deve ser superior a uma unidade.');

  end);
end;

end.
