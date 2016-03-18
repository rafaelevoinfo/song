unit smuViveiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uQuery, dmuPrincipal, uUtils, uClientDataSet,
  uSQLGenerator;

type
  TsmViveiro = class(TsmBasico)
    qEspecie: TRFQuery;
    qEspecieID: TIntegerField;
    qEspecieNOME: TStringField;
    qEspecieNOME_CIENTIFICO: TStringField;
    qEspecieFAMILIA_BOTANICA: TStringField;
    qEspecieOBSERVACAO: TStringField;
    qMatriz: TRFQuery;
    qMatrizID: TIntegerField;
    qMatrizID_ESPECIE: TIntegerField;
    qMatrizENDERECO: TStringField;
    qMatrizLATITUDE: TFMTBCDField;
    qMatrizLONGITUDE: TFMTBCDField;
    qMatrizDESCRICAO: TStringField;
    qMatrizESPECIE: TStringField;
    qMatrizNOME: TStringField;
    qMatrizFOTO: TBlobField;
    qEspecieQTDE_SEMENTE_KILO: TIntegerField;
    qLote: TRFQuery;
    qLote_Matriz: TRFQuery;
    qLoteID: TIntegerField;
    qLoteID_ESPECIE: TIntegerField;
    qLoteID_PESSOA_COLETOU: TIntegerField;
    qLoteNOME: TStringField;
    qLoteDATA: TDateField;
    qLoteNOME_ESPECIE: TStringField;
    qLote_MatrizID: TIntegerField;
    qLote_MatrizID_LOTE: TIntegerField;
    qLote_MatrizID_MATRIZ: TIntegerField;
    qLoteQTDE: TBCDField;
    qLoteQTDE_ARMAZENADA: TBCDField;
    qLoteTAXA_GERMINACAO: TBCDField;
    qLoteTAXA_DESCARTE: TBCDField;
    qLoteSTATUS: TSmallintField;
    qGerminacao: TRFQuery;
    qSemeadura: TRFQuery;
    qGerminacaoID: TIntegerField;
    qGerminacaoID_LOTE: TIntegerField;
    qGerminacaoID_PESSOA_VERIFICOU: TIntegerField;
    qGerminacaoDATA: TSQLTimeStampField;
    qGerminacaoQTDE_GERMINADA: TIntegerField;
    qSemeaduraID: TIntegerField;
    qSemeaduraID_LOTE: TIntegerField;
    qSemeaduraID_PESSOA_SEMEOU: TIntegerField;
    qSemeaduraQTDE_SEMEADA: TBCDField;
    qSemeaduraDATA: TSQLTimeStampField;
    qSemeaduraOBSERVACAO: TStringField;
    qSemeaduraID_CANTEIRO: TIntegerField;
    qCanteiro: TRFQuery;
    qCanteiroID: TIntegerField;
    qCanteiroNOME: TStringField;
    qCanteiroDESCRICAO: TStringField;
    qSemeaduraPESSOA_SEMEOU: TStringField;
    qSemeaduraNOME_CANTEIRO: TStringField;
    qGerminacaoPESSOA_VERIFICOU: TStringField;
    qLoteQTDE_SEMEADA: TBCDField;
  private
    { Private declarations }
  protected
    function fprMontarWhere(ipTabela, ipWhere: string; ipParam: TParam)
      : string; override;
  public
    { Public declarations }
  end;

var
  smViveiro: TsmViveiro;

implementation

{$R *.dfm}
{ TsmViveiro }

function TsmViveiro.fprMontarWhere(ipTabela, ipWhere: string;
  ipParam: TParam): string;
var
  vaValor, vaOperador: string;
begin
  Result := inherited;

  TUtils.ppuExtrairValorOperadorParametro(ipParam.Text, vaValor, vaOperador,
    TParametros.coDelimitador);
  if ipTabela = 'ESPECIE' then
    begin
      if ipParam.Name = TParametros.coNome then
        Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'NOME', vaValor, vaOperador)
      else if ipParam.Name = TParametros.coNomeCientifico then
        Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'NOME_CIENTIFICO', vaValor, vaOperador)
      else if ipParam.Name = TParametros.coFamiliaBotanica then
        Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'FAMILIA_BOTANICA', vaValor, vaOperador)
    end
  else if ipTabela = 'MATRIZ' then
    begin
      if ipParam.Name = TParametros.coEspecie then
        Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'ID_ESPECIE', vaValor, vaOperador)
    end
  else if ipTabela = 'LOTE' then
    begin
      if ipParam.Name = TParametros.coEspecie then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_ESPECIE', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coStatus then
        begin
          if vaValor.ToInteger = 0 then
            Result := Result + ' ((lote.status is null) or (lote.status=0))' + vaOperador
          else
            Result := Result + ' (lote.status=1)' + vaOperador
        end
      else if ipParam.Name = TParametros.coData then
        Result := Result + ' (LOTE.DATA between ' + QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 0))) + ' AND ' +
          QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 1))) + ') ' + vaOperador;
    end;
end;

end.
