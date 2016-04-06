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
    qMatriz: TRFQuery;
    qMatrizID: TIntegerField;
    qMatrizID_ESPECIE: TIntegerField;
    qMatrizENDERECO: TStringField;
    qMatrizLATITUDE: TFMTBCDField;
    qMatrizLONGITUDE: TFMTBCDField;
    qMatrizESPECIE: TStringField;
    qMatrizNOME: TStringField;
    qMatrizFOTO: TBlobField;
    qEspecieQTDE_SEMENTE_KILO: TIntegerField;
    qLote_Semente: TRFQuery;
    qLote_Semente_Matriz: TRFQuery;
    qLote_SementeID: TIntegerField;
    qLote_SementeID_ESPECIE: TIntegerField;
    qLote_SementeID_PESSOA_COLETOU: TIntegerField;
    qLote_SementeNOME: TStringField;
    qLote_SementeDATA: TDateField;
    qLote_SementeNOME_ESPECIE: TStringField;
    qLote_Semente_MatrizID: TIntegerField;
    qLote_Semente_MatrizID_MATRIZ: TIntegerField;
    qLote_SementeQTDE: TBCDField;
    qLote_SementeQTDE_ARMAZENADA: TBCDField;
    qLote_SementeTAXA_GERMINACAO: TBCDField;
    qLote_SementeTAXA_DESCARTE: TBCDField;
    qLote_SementeSTATUS: TSmallintField;
    qGerminacao: TRFQuery;
    qSemeadura: TRFQuery;
    qGerminacaoID: TIntegerField;
    qGerminacaoID_PESSOA_VERIFICOU: TIntegerField;
    qGerminacaoQTDE_GERMINADA: TIntegerField;
    qSemeaduraID: TIntegerField;
    qSemeaduraID_PESSOA_SEMEOU: TIntegerField;
    qSemeaduraQTDE_SEMEADA: TBCDField;
    qSemeaduraDATA: TSQLTimeStampField;
    qSemeaduraID_CANTEIRO: TIntegerField;
    qCanteiro: TRFQuery;
    qCanteiroID: TIntegerField;
    qCanteiroNOME: TStringField;
    qSemeaduraPESSOA_SEMEOU: TStringField;
    qSemeaduraNOME_CANTEIRO: TStringField;
    qGerminacaoPESSOA_VERIFICOU: TStringField;
    qLote_SementeQTDE_SEMEADA: TBCDField;
    qSemeaduraDATA_PREVISTA_GERMINACAO: TSQLTimeStampField;
    qEspecieVALOR_MUDA: TBCDField;
    qEspecieVALOR_KG_SEMENTE: TBCDField;
    qEspecieTEMPO_GERMINACAO: TIntegerField;
    qEspecieINICIO_PERIODO_COLETA: TDateField;
    qEspecieFIM_PERIODO_COLETA: TDateField;
    qGerminacaoID_LOTE_SEMENTE: TIntegerField;
    qLote_Semente_MatrizID_LOTE_SEMENTE: TIntegerField;
    qSemeaduraID_LOTE_SEMENTE: TIntegerField;
    qSemeaduraQTDE_TUBETE: TIntegerField;
    qLote_Muda: TRFQuery;
    qLote_MudaID: TIntegerField;
    qLote_MudaID_ESPECIE: TIntegerField;
    qLote_MudaNOME: TStringField;
    qLote_MudaQTDE_INICIAL: TIntegerField;
    qLote_MudaNOME_ESPECIE: TStringField;
    qLote_SementePESSOA_COLETOU: TStringField;
    qClassificacao: TRFQuery;
    qClassificacaoID: TIntegerField;
    qClassificacaoID_LOTE_MUDA: TIntegerField;
    qClassificacaoID_PESSOA_CLASSIFICOU: TIntegerField;
    qClassificacaoDATA: TDateField;
    qClassificacaoQTDE: TIntegerField;
    qClassificacaoPESSOA_CLASSIFICOU: TStringField;
    qLote_MudaOBSERVACAO: TStringField;
    qCanteiroDESCRICAO: TStringField;
    qClassificacaoOBSERVACAO: TStringField;
    qEspecieOBSERVACAO: TStringField;
    qMatrizDESCRICAO: TStringField;
    qSemeaduraOBSERVACAO: TStringField;
    qLote_MudaQTDE_ATUAL: TIntegerField;
    qGerminacaoDATA: TDateField;
    qLote_MudaDATA: TDateField;
    qLote_MudaTAXA_CLASSIFICACAO: TBCDField;
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
  else if ipTabela = 'LOTE_SEMENTE' then
    begin
      if ipParam.Name = TParametros.coEspecie then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_ESPECIE', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coStatus then
        begin
          if vaValor.ToInteger = 0 then
            Result := Result + ' ((lote_Semente.status is null) or (lote_Semente.status=0))' + vaOperador
          else
            Result := Result + ' (lote_Semente.status=1)' + vaOperador
        end
      else if ipParam.Name = TParametros.coData then
        Result := Result + ' (lote_Semente.DATA between ' + QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 0))) + ' AND ' +
          QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 1))) + ') ' + vaOperador;
    end
  else if ipTabela = 'LOTE_MUDA' then
    begin
      if ipParam.Name = TParametros.coEspecie then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_ESPECIE', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coData then
        Result := Result + ' (lote_Muda.DATA between ' + QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 0))) + ' AND ' +
          QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 1))) + ') ' + vaOperador;
    end;
end;

end.
