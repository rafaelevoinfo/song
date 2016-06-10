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
  uSQLGenerator, Datasnap.Provider, Datasnap.DBClient;

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
    qGerminacaoID_LOTE_SEMENTE: TIntegerField;
    qLote_Semente_MatrizID_LOTE_SEMENTE: TIntegerField;
    qSemeaduraID_LOTE_SEMENTE: TIntegerField;
    qSemeaduraQTDE_TUBETE: TIntegerField;
    qLote_Muda: TRFQuery;
    qLote_SementePESSOA_COLETOU: TStringField;
    qCanteiroDESCRICAO: TStringField;
    qEspecieOBSERVACAO: TStringField;
    qMatrizDESCRICAO: TStringField;
    qSemeaduraOBSERVACAO: TStringField;
    qGerminacaoDATA: TDateField;
    qEspecieQTDE_SEMENTE_ESTOQUE: TBCDField;
    qLote_SementeID_COMPRA_ITEM: TIntegerField;
    qLote_MudaID: TIntegerField;
    qLote_MudaID_ESPECIE: TIntegerField;
    qLote_MudaID_LOTE_SEMENTE: TIntegerField;
    qLote_MudaID_COMPRA_ITEM: TIntegerField;
    qLote_MudaNOME: TStringField;
    qLote_MudaQTDE_INICIAL: TIntegerField;
    qLote_MudaDATA: TDateField;
    qLote_MudaOBSERVACAO: TStringField;
    qLote_MudaSALDO: TIntegerField;
    qLote_MudaTAXA_CLASSIFICACAO: TBCDField;
    qLote_MudaNOME_ESPECIE: TStringField;
    qLote_MudaSTATUS: TSmallintField;
    qEspecieTEMPO_DESENVOLVIMENTO: TIntegerField;
    qEspecieQTDE_MUDA_PRONTA: TIntegerField;
    qEspecieQTDE_MUDA_DESENVOLVIMENTO: TIntegerField;
    dspqLote_Muda: TDataSetProvider;
    dspqLote_Semente: TDataSetProvider;
    dspqSemeadura: TDataSetProvider;
    dspqGerminacao: TDataSetProvider;
    qClassificacao: TRFQuery;
    qLote_Muda_Canteiro: TRFQuery;
    qLote_Muda_CanteiroID: TIntegerField;
    qLote_Muda_CanteiroID_LOTE_MUDA: TIntegerField;
    qLote_Muda_CanteiroID_CANTEIRO: TIntegerField;
    qLote_Muda_CanteiroNOME_CANTEIRO: TStringField;
    qClassificacaoID: TIntegerField;
    qClassificacaoID_LOTE_MUDA: TIntegerField;
    qClassificacaoID_PESSOA_CLASSIFICOU: TIntegerField;
    qClassificacaoDATA: TDateField;
    qClassificacaoQTDE: TIntegerField;
    qClassificacaoOBSERVACAO: TStringField;
    qClassificacaoPESSOA_CLASSIFICOU: TStringField;
    dspqClassificacao: TDataSetProvider;
    qEspecieMES_INICIO_COLETA: TIntegerField;
    qEspecieMES_FIM_COLETA: TIntegerField;
    qEspecieID_FAMILIA_BOTANICA: TIntegerField;
    qFamilia_Botanica: TRFQuery;
    qEspeciePESO_MEDIO_SEMENTE: TBCDField;
    procedure dspqLote_MudaAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
    procedure dspqLote_SementeAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
    procedure dspqSemeaduraAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
    procedure dspqGerminacaoAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
    procedure dspqClassificacaoAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
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

procedure TsmViveiro.dspqClassificacaoAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
  inherited;
  qAux.Close;
  qAux.SQL.Text := 'select Lote_Muda.Id_Especie ' +
    ' from Classificacao ' +
    ' inner join Lote_Muda on (Lote_Muda.Id = Classificacao.Id_Lote_Muda)' +
    ' where Classificacao.Id = :Id';
  qAux.ParamByName('ID').AsInteger := DeltaDS.FieldByName('ID').OldValue;
  qAux.Open;

  dmPrincipal.Connection.ExecSQL('execute procedure sp_ajusta_saldo_especie(' +
    VarToStr(qAux.FieldByName('ID_ESPECIE').AsInteger) + ',1,0)');

  dmPrincipal.Connection.Commit;
end;

procedure TsmViveiro.dspqGerminacaoAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
  inherited;
  qAux.Close;
  qAux.SQL.Text := 'select Lote_Semente.Id_Especie ' +
    ' from Germinacao ' +
    ' inner join Lote_Semente on (Lote_Semente.Id = Germinacao.Id_Lote_Semente)' +
    ' where Germinacao.Id = :Id';
  qAux.ParamByName('ID').AsInteger := DeltaDS.FieldByName('ID').OldValue;
  qAux.Open;

  dmPrincipal.Connection.ExecSQL('execute procedure sp_ajusta_saldo_especie(' +
    VarToStr(qAux.FieldByName('ID_ESPECIE').AsInteger) + ',0,1)');

  dmPrincipal.Connection.Commit;
end;

procedure TsmViveiro.dspqLote_MudaAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
  inherited;
  { OBSERVACOES SOBRE O DeltaDS
    * Ao incluir tanto o OldValue quanto o NewValue possuem o mesmo valor
    * Ao Alterar se houver modificacoes OldValue contera o valor antigo e NewValue o novo, caso nao haja modificacoes
    OldValue conterá o valor antigo e newValue contera Unassigned
    * Ao excluir ambos possuem o mesmo valor
  }
  if (UpdateKind = ukModify) and (Not VarIsNull(DeltaDS.FieldByName('ID_ESPECIE').NewValue)) and
    (DeltaDS.FieldByName('ID_ESPECIE').NewValue <> Unassigned) then
    begin
      dmPrincipal.Connection.ExecSQL('execute procedure sp_ajusta_saldo_especie(' +
        VarToStr(DeltaDS.FieldByName('ID_ESPECIE').OldValue) + ',1,0)');
      dmPrincipal.Connection.ExecSQL('execute procedure sp_ajusta_saldo_especie(' +
        VarToStr(DeltaDS.FieldByName('ID_ESPECIE').NewValue) + ',1,0)');
    end
  else
    dmPrincipal.Connection.ExecSQL('execute procedure sp_ajusta_saldo_especie(' +
      VarToStr(DeltaDS.FieldByName('ID_ESPECIE').OldValue) + ',1,0)');

  dmPrincipal.Connection.Commit;
end;

procedure TsmViveiro.dspqLote_SementeAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
  inherited;
  { OBSERVACOES SOBRE O DeltaDS
    * Ao incluir tanto o OldValue quanto o NewValue possuem o mesmo valor
    * Ao Alterar se houver modificacoes OldValue contera o valor antigo e NewValue o novo, caso nao haja modificacoes
    OldValue conterá o valor antigo e newValue contera Unassigned
    * Ao excluir ambos possuem o mesmo valor
  }
  if (UpdateKind = ukModify) and (Not VarIsNull(DeltaDS.FieldByName('ID_ESPECIE').NewValue)) and
    (DeltaDS.FieldByName('ID_ESPECIE').NewValue <> Unassigned) then
    begin
      dmPrincipal.Connection.ExecSQL('execute procedure sp_ajusta_saldo_especie(' +
        VarToStr(DeltaDS.FieldByName('ID_ESPECIE').OldValue) + ',0,1)');
      dmPrincipal.Connection.ExecSQL('execute procedure sp_ajusta_saldo_especie(' +
        VarToStr(DeltaDS.FieldByName('ID_ESPECIE').NewValue) + ',0,1)');
    end
  else
    dmPrincipal.Connection.ExecSQL('execute procedure sp_ajusta_saldo_especie(' +
      VarToStr(DeltaDS.FieldByName('ID_ESPECIE').OldValue) + ',0,1)');

  dmPrincipal.Connection.Commit;
end;

procedure TsmViveiro.dspqSemeaduraAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
  inherited;
  qAux.Close;
  qAux.SQL.Text := 'select Lote_Semente.Id_Especie ' +
    ' from Semeadura ' +
    ' inner join Lote_Semente on (Lote_Semente.Id = Semeadura.Id_Lote_Semente)' +
    ' where Semeadura.Id = :Id';
  qAux.ParamByName('ID').AsInteger := DeltaDS.FieldByName('ID').OldValue;
  qAux.Open;

  dmPrincipal.Connection.ExecSQL('execute procedure sp_ajusta_saldo_especie(' +
    VarToStr(qAux.FieldByName('ID_ESPECIE').AsInteger) + ',0,1)');

  dmPrincipal.Connection.Commit;
end;

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
      else if ipParam.Name = TParametros.coLoteSemente then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_LOTE_SEMENTE', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coStatus then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'STATUS', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coData then
        Result := Result + ' (lote_Muda.DATA between ' + QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 0))) + ' AND ' +
          QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 1))) + ') ' + vaOperador;
    end;
end;

end.
