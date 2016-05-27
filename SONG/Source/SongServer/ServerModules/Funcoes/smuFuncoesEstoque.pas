unit smuFuncoesEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuFuncoesBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery, uTypes;

type
  TsmFuncoesEstoque = class(TsmFuncoesBasico)
  private
    function fpuValidarTipoItem(ipId, ipTipo: Integer): Boolean;
    { Private declarations }
  public
    function fpuValidarNomeItem(ipIdItem: Integer; ipNome:String): Boolean;
    function fpuVerificarComprasJaGerada(ipIdSolicitacao: Integer): Boolean;
    function fpuVerificarContaPagarJaGerada(ipIdCompra: Integer): Boolean;

    function fpuBuscarItensEntrada(ipIdCompra: Integer): string;
    function fpuBuscarItemEntrada(ipIdCompraItem: Integer): Integer;
    function fpuBuscarItensSaida(ipIdVenda: Integer): string;
    function fpuBuscarItemSaida(ipIdVendaItem: Integer): Integer;

    procedure ppuAtualizarSaldoItem(ipIdItem:Integer; ipQtdeSubtrair, ipQtdeSomar:Double);

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
        ipDataSet.SQL.Text := 'select Venda_Item.id from Venda_Item ' +
          ' where Venda_Item.id_venda_item in (select venda_item.id from venda_item where venda_item.id_venda = :ID_VENDA)';
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
  Result := fprValidarCampoUnico('ITEM','NOME',ipIdItem,ipNome.trim);
end;

function TsmFuncoesEstoque.fpuValidarTipoItem(ipId, ipTipo: Integer): Boolean;
var
  vaResult: Boolean;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      vaResult := True;
      if TTipoItem(ipTipo) in [tiSemente, tiMuda] then
        begin
          ipDataSet.SQL.Text := 'Select count(*) as QTDE from ' +
            '                     item ' +
            '                    where item.tipo = :tipo and ' +
            '                          item.id <> :id';
          ipDataSet.ParamByName('ID').AsInteger := ipId;
          ipDataSet.ParamByName('TIPO').AsInteger := ipTipo;
          ipDataSet.Open();

          vaResult := ipDataSet.FieldByName('QTDE').AsInteger = 0;
        end;
    end);

  Result := vaResult;
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

procedure TsmFuncoesEstoque.ppuAtualizarSaldoItem(ipIdItem: Integer;
  ipQtdeSubtrair, ipQtdeSomar: Double);
begin
  Connection.ExecSQL('update item ' +
    ' set item.saldo = coalesce(item.saldo,0) - :qtde_substrair + :qtde_somar ' +
    ' where item.id = :id', [ipQtdeSubtrair, ipQtdeSomar, ipIdItem]);
end;

end.
