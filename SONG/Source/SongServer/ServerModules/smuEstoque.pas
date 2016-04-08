unit smuEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, dmuPrincipal,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uQuery, uUtils, uClientDataSet, uSQLGenerator;

type
  TsmEstoque = class(TsmBasico)
    qItem: TRFQuery;
    qItemID: TIntegerField;
    qItemNOME: TStringField;
    qItemTIPO: TSmallintField;
    qEntrada: TRFQuery;
    qEntradaID: TIntegerField;
    qEntradaID_ITEM: TIntegerField;
    qEntradaID_ESPECIE: TIntegerField;
    qEntradaID_COMPRA: TIntegerField;
    qEntradaQTDE: TBCDField;
    qEntradaDATA: TSQLTimeStampField;
    qEntradaNOME_ITEM: TStringField;
    qEntradaNOME_ESPECIE: TStringField;
  private
  protected
    function fprMontarWhere(ipTabela, ipWhere: string; ipParam: TParam): string; override;
    { Public declarations }
  end;

var
  smEstoque: TsmEstoque;

implementation

{$R *.dfm}

{ TsmEstoque }

function TsmEstoque.fprMontarWhere(ipTabela, ipWhere: string; ipParam: TParam): string;
var
  vaValor, vaOperador: string;
begin
  Result := inherited;
  TUtils.ppuExtrairValorOperadorParametro(ipParam.Text, vaValor, vaOperador, TParametros.coDelimitador);
  if ipTabela = 'ITEM' then
    begin
      if ipParam.Name = TParametros.coTipo then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'TIPO', vaValor.ToInteger, vaOperador);
    end
  else if ipTabela = 'ENTRADA' then
    begin
      if ipParam.Name = TParametros.coItem then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_ITEM', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coCompra then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_COMPRA', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coTipoItem then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'ITEM', 'TIPO', vaValor.ToInteger, vaOperador)
    end;
end;

end.
