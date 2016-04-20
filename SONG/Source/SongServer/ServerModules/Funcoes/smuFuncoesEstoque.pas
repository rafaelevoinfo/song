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
    { Private declarations }
  public
    function fpuValidarTipoItem(ipId, ipTipo: Integer): Boolean;
    function fpuVerificarComprasJaGerada(ipIdSolicitacao: Integer): Boolean;
    function fpuVerificarEntradaJaGerada(ipIdCompra: Integer): Boolean;
    function fpuVerificarContaPagarJaGerada(ipIdCompra: Integer): Boolean;

  end;

var
  smFuncoesEstoque: TsmFuncoesEstoque;

implementation

{$R *.dfm}

{ TsmFuncoesEstoque }

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

function TsmFuncoesEstoque.fpuVerificarEntradaJaGerada(
  ipIdCompra: Integer): Boolean;
var
  vaResult: Boolean;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      vaResult := False;
      ipDataSet.SQL.Text := 'select count(*) as Qtde ' +
        '   from Entrada ' +
        ' where Entrada.Id_Compra = :Id_Compra ' +
        '' +
        ' union all ' +
        ' ' +
        ' select count(*) as Qtde ' +
        '   from Lote_Semente' +
        ' where Lote_Semente.Id_Compra = :Id_Compra' +
        '' +
        ' union all' +
        '' +
        ' select count(*) as Qtde' +
        '   from Lote_Muda' +
        ' where Lote_Muda.Id_Compra = :Id_Compra ';
      ipDataSet.ParamByName('ID_COMPRA').AsInteger := ipIdCompra;
      ipDataSet.Open();
      while not ipDataSet.Eof do
        begin
          vaResult := vaResult or (ipDataSet.FieldByName('QTDE').AsInteger > 0);
          ipDataSet.Next;
        end;

    end);

  Result := vaResult;

end;

end.
