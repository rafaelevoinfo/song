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
    qEntradaID_COMPRA: TIntegerField;
    qEntradaQTDE: TBCDField;
    qEntradaDATA: TSQLTimeStampField;
    qEntradaNOME_ITEM: TStringField;
    qItemUNIDADE: TStringField;
    qSolicitacao_Compra: TRFQuery;
    qSolicitacao_CompraID: TIntegerField;
    qSolicitacao_CompraID_PESSOA_SOLICITOU: TIntegerField;
    qSolicitacao_CompraID_PESSOA_ANALISOU: TIntegerField;
    qSolicitacao_CompraID_COMPRA: TIntegerField;
    qSolicitacao_CompraDATA: TSQLTimeStampField;
    qSolicitacao_CompraDATA_ANALISE: TSQLTimeStampField;
    qSolicitacao_CompraSTATUS: TSmallintField;
    qSolicitacao_CompraSOLICITANTE: TStringField;
    qSolicitacao_CompraRESPONSAVEL_ANALISE: TStringField;
    qSolicitacao_Compra_Item: TRFQuery;
    qSolicitacao_Compra_ItemID: TIntegerField;
    qSolicitacao_Compra_ItemID_SOLICITACAO_COMPRA: TIntegerField;
    qSolicitacao_Compra_ItemID_ITEM: TIntegerField;
    qSolicitacao_Compra_ItemID_ESPECIE: TIntegerField;
    qSolicitacao_Compra_ItemQTDE: TBCDField;
    qSolicitacao_Compra_ItemNOME_ITEM: TStringField;
    qSolicitacao_Compra_ItemESPECIE: TStringField;
    qSolicitacao_CompraOBSERVACAO: TStringField;
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
      else if ipParam.Name = TParametros.coData then
        Result := Result + ' (ENTRADA.DATA between ' + QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 0))) +
          ' AND ' + QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 1))) + ')' + vaOperador;

    end
  else if (ipTabela = 'SOLICITACAO_COMPRA') then
    begin
      if ipParam.Name = TParametros.coData then
        Result := TSQLGenerator.fpuFilterData(Result, ipTabela, 'DATA', TUtils.fpuExtrairData(vaValor, 0), TUtils.fpuExtrairData(vaValor, 1),
          vaOperador)
      else if ipParam.Name = TParametros.coSolicitante then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_PESSOA_SOLICITOU', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coResponsavelAnalise then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_PESSOA_ANALISOU', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coStatus then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'STATUS', TUtils.fpuConverterStringToArrayInteger(vaValor), vaOperador)
       else if ipParam.Name = TParametros.coItem then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'SOLICITACAO_COMPRA_ITEM', 'ID_ITEM', vaValor.ToInteger, vaOperador)
    end;
end;

end.
