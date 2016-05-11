unit smuFuncoesRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuFuncoesBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery, uClientDataSet,
  uUtils, Datasnap.DBClient, uTypes;

type
  TsmFuncoesRelatorio = class(TsmFuncoesBasico)
    qMovimentacao: TRFQuery;
    qMovimentacaoID_MOVIMENTACAO: TIntegerField;
    qMovimentacaoID_ORGANIZACAO: TIntegerField;
    qMovimentacaoNOME_ORGANIZACAO: TStringField;
    qMovimentacaoTIPO_ORIGEM_RECURSO: TIntegerField;
    qMovimentacaoID_ORIGEM_RECURSO: TIntegerField;
    qMovimentacaoORIGEM_RECURSO: TStringField;
    qMovimentacaoTIPO: TIntegerField;
    qMovimentacaoDESCRICAO_TIPO: TStringField;
    qMovimentacaoDESCRICAO_MOVIMENTACAO: TStringField;
    qMovimentacaoVALOR_TOTAL: TBCDField;
    qMovimentacaoVALOR_PARCIAL: TBCDField;
    qMovimentacaoVALOR_REAL: TBCDField;
    qMovimentacaoID: TIntegerField;
    qMovimentacaoDATA: TDateField;
    cdsSaldo: TClientDataSet;
    cdsSaldoID_ORGANIZACAO: TIntegerField;
    cdsSaldoNOME_ORGANIZACAO: TStringField;
    cdsSaldoID_PROJETO_FUNDO: TIntegerField;
    cdsSaldoNOME_PROJETO_FUNDO: TStringField;
    cdsSaldoSALDO: TBCDField;
    cdsSaldoSALDO_GERAL: TBCDField;
    qMovimentacaoID_IDENTIFICACAO_TABELA: TIntegerField;
    cdsSaldoTIPO_ORIGEM: TIntegerField;
    qMovimentacaoTIPO_ORIGEM: TIntegerField;
  private
    procedure ppvCalcularSaldoGeral(ipCds: TClientDataSet);
    { Private declarations }
  public
    function fpuMovimentacaoFinanceira(ipIdOrganizacao, ipIdProjeto, ipIdFundo: Integer; ipDataInicial, ipDataFinal: String): OleVariant;
    function fpuSaldo(ipIdOrganizacao, ipIdProjeto, ipIdFundo: Integer): OleVariant;
  end;

var
  smFuncoesRelatorio: TsmFuncoesRelatorio;

const
  coProcessado = 'PROCESSADO';
  coValor = 'VALOR';
  coSaldoGeral = 'SALDO_GERAL';

implementation

{$R *.dfm}


function TsmFuncoesRelatorio.fpuMovimentacaoFinanceira(ipIdOrganizacao, ipIdProjeto, ipIdFundo: Integer; ipDataInicial, ipDataFinal: String)
  : OleVariant;
var
  vaCds: TRFClientDataSet;
  vaRecNo, vaRecNoAux, vaIdOrganizacao, vaQtdeOrganizacoes: Integer;
  vaValor, vaSoma, vaSomaPagtoRec, vaSaldoOrganizacao, vaValorPerc, vaValorPagoRec: Currency;
  I, vaIdOrigem: Integer;
  vaFiltro: string;
  vaDataInicial, vaDataFinal: TDateTime;
  vaPerc: Double;

  procedure plProcessarRegistro(ipValorReal, ipValorPagoRecebido: Currency);
  begin
    vaCds.Edit;
    vaCds.FieldByName(coProcessado).AsBoolean := True;
    vaCds.FieldByName(qMovimentacaoVALOR_REAL.FieldName).AsFloat := ipValorReal;
    vaCds.FieldByName(coValor).AsFloat := ipValorPagoRecebido;
    vaCds.Post;
  end;

  procedure plCalcularValores;
  var
    j: Integer;
  begin
    // vamos voltar ao primeiro registro desse grupo
    vaCds.RecNo := vaRecNo;
    vaSoma := 0;
    // ja sei quantas organizacoes diferentes temos, entao vamos ratir o valor para cada orgnizacao
    vaValor := TUtils.fpuTruncTo(vaCds.FieldByName(qMovimentacaoVALOR_PARCIAL.FieldName).AsFloat / vaQtdeOrganizacoes, 2);
    for j := vaRecNo to I - 1 do
      begin
        vaCds.RecNo := j;

        if j = I - 1 then
          begin
            vaValor := vaCds.FieldByName(qMovimentacaoVALOR_PARCIAL.FieldName).AsFloat - vaSoma;

            if j = vaCds.RecordCount then
              vaValorPerc := vaValorPagoRec - vaSomaPagtoRec
            else
              begin
                vaValorPerc := TUtils.fpuTruncTo(vaValor * vaPerc, 2);
                vaSomaPagtoRec := vaSomaPagtoRec + vaValorPerc;
              end;

            plProcessarRegistro(vaValor, vaValorPerc);
          end
        else
          begin
            // ultimo registros dessa conta
            if j = vaCds.RecordCount then
              vaValorPerc := vaValorPagoRec - vaSomaPagtoRec
            else
              begin
                vaValorPerc := TUtils.fpuTruncTo(vaValor * vaPerc, 2);
                vaSomaPagtoRec := vaSomaPagtoRec + vaValorPerc;
              end;

            plProcessarRegistro(vaValor, vaValorPerc);
          end;

        vaSoma := vaSoma + vaValor;
      end;
    // voltando para a posicao correta
    if I <= vaCds.RecordCount then
      vaCds.RecNo := I;

    vaQtdeOrganizacoes := 1;
    vaIdOrigem := vaCds.FieldByName(qMovimentacaoID_ORIGEM_RECURSO.FieldName).AsInteger;
    vaIdOrganizacao := vaCds.FieldByName(qMovimentacaoID_ORGANIZACAO.FieldName).AsInteger;
    vaRecNo := I;
  end;

begin
  qMovimentacao.Close;
  if TryStrToDateTime(ipDataInicial, vaDataInicial) and TryStrToDateTime(ipDataFinal, vaDataFinal) then
    begin
      qMovimentacao.ParamByName('DATA_INICIAL').AsDateTime := vaDataInicial;
      qMovimentacao.ParamByName('DATA_FINAL').AsDateTime := vaDataFinal;
    end
  else
    qMovimentacao.ParamByName('TODAS_DATAS').AsInteger := 1;

  qMovimentacao.Open;

  vaCds := TRFClientDataSet.Create(nil);
  try
    vaCds.RFApplyAutomatico := False;
    vaCds.FieldDefs.Assign(qMovimentacao.FieldDefs);
    vaCds.FieldDefs.Add(coProcessado, ftBoolean);
    vaCds.FieldDefs.Add(coValor, ftBCD, 2);
    vaCds.FieldDefs.Add(coSaldoGeral, ftBCD, 2);
    vaCds.CreateDataSet;

    while not qMovimentacao.Eof do
      begin
        vaCds.ppuCopiarRegistro(qMovimentacao);
        vaCds.FieldByName(coProcessado).AsBoolean := False;
        vaCds.Post;

        qMovimentacao.Next;
      end;

    //Nao remover esse IndeFieldNames pq senao ao fazer e desfazer o filter os registros irao mudar de posicao fazendo tudo ficar errado
    vaCds.IndexFieldNames := qMovimentacaoID_IDENTIFICACAO_TABELA.FieldName+';'+ qMovimentacaoID_MOVIMENTACAO.FieldName + ';' + qMovimentacaoID_ORIGEM_RECURSO.FieldName + ';' +
      qMovimentacaoID.FieldName + ';' + qMovimentacaoID_ORGANIZACAO.FieldName;
    // vamos percorrer todos os registros agora para entao calcular o valor de cada organizacao
    vaCds.First;
    while not vaCds.Eof do
      begin
        if not vaCds.FieldByName(coProcessado).AsBoolean then
          begin
            vaRecNoAux := vaCds.RecNo;
            vaCds.Filter := qMovimentacaoID_IDENTIFICACAO_TABELA.FieldName+' = ' +vaCds.FieldByName(qMovimentacaoID_IDENTIFICACAO_TABELA.FieldName).AsString+ ' and  '+
             qMovimentacaoID_MOVIMENTACAO.FieldName + ' = ' + vaCds.FieldByName(qMovimentacaoID_MOVIMENTACAO.FieldName).AsString;
            vaCds.Filtered := True;

            // possui mais de um vinculo ou o vinculo esta ligado a mais de uma organizacao
            if vaCds.RecordCount > 1 then
              begin
                vaCds.First;
                vaQtdeOrganizacoes := 1;
                if vaCds.FieldByName(qMovimentacaoTIPO_ORIGEM_RECURSO.FieldName).AsInteger = Ord(orFinanciamento) then
                  vaPerc := 1 // 100%
                else
                  vaPerc := vaCds.FieldByName(qMovimentacaoVALOR_REAL.FieldName).AsFloat /
                    vaCds.FieldByName(qMovimentacaoVALOR_TOTAL.FieldName).AsFloat;
                vaValorPagoRec := vaCds.FieldByName(qMovimentacaoVALOR_REAL.FieldName).AsFloat;
                vaIdOrganizacao := vaCds.FieldByName(qMovimentacaoID_ORGANIZACAO.FieldName).AsInteger;
                vaIdOrigem := vaCds.FieldByName(qMovimentacaoID_ORIGEM_RECURSO.FieldName).AsInteger;
                vaSomaPagtoRec := 0;
                vaRecNo := 1;
                I := 2;
                while I <= vaCds.RecordCount do
                  begin
                    vaCds.RecNo := I;
                    if (vaCds.FieldByName(qMovimentacaoID_ORIGEM_RECURSO.FieldName).AsInteger = vaIdOrigem) and
                      (vaCds.FieldByName(qMovimentacaoID_ORGANIZACAO.FieldName).AsInteger <> vaIdOrganizacao) then
                      begin
                        Inc(vaQtdeOrganizacoes);
                      end
                    else
                      begin
                        plCalcularValores;
                      end;

                    Inc(I);
                  end;

                plCalcularValores;
              end
            else
              begin
                plProcessarRegistro(vaCds.FieldByName(qMovimentacaoVALOR_PARCIAL.FieldName).AsFloat,
                  vaCds.FieldByName(qMovimentacaoVALOR_REAL.FieldName).AsFloat);
              end;

            vaCds.Filtered := False;
            vaCds.RecNo := vaRecNoAux;
          end;

        if ((ipIdOrganizacao <> 0) and (ipIdOrganizacao <> vaCds.FieldByName(qMovimentacaoID_ORGANIZACAO.FieldName).AsInteger)) or

          ((ipIdProjeto <> 0) and (vaCds.FieldByName(qMovimentacaoTIPO_ORIGEM.FieldName).AsInteger = Ord(oriProjeto)) and
          (ipIdProjeto <> vaCds.FieldByName(qMovimentacaoID_ORIGEM_RECURSO.FieldName).AsInteger)) or

          ((ipIdFundo <> 0) and (vaCds.FieldByName(qMovimentacaoTIPO_ORIGEM.FieldName).AsInteger = Ord(oriFundo)) and
          (ipIdFundo <> vaCds.FieldByName(qMovimentacaoID_ORIGEM_RECURSO.FieldName).AsInteger)) then
          begin
            vaCds.Delete;
          end
        else
          vaCds.Next;
      end;

    vaCds.Filtered := False;
    // agora vamos calcular o saldo geral
    vaCds.IndexFieldNames := qMovimentacaoID_ORGANIZACAO.FieldName + ';' + qMovimentacaoID_ORIGEM_RECURSO.FieldName + ';' +
      qMovimentacaoTIPO.FieldName;

    ppvCalcularSaldoGeral(vaCds);

    Result := vaCds.Data;
  finally
    vaCds.Free;
    qMovimentacao.Close;
  end;
end;

function TsmFuncoesRelatorio.fpuSaldo(ipIdOrganizacao, ipIdProjeto,
  ipIdFundo: Integer): OleVariant;
var
  vaCdsMovimentacao: TClientDataSet;
begin
  if cdsSaldo.Active then
    cdsSaldo.EmptyDataSet
  else
    cdsSaldo.CreateDataSet;

  vaCdsMovimentacao := TClientDataSet.Create(nil);
  try
    vaCdsMovimentacao.Data := fpuMovimentacaoFinanceira(ipIdOrganizacao, ipIdProjeto, ipIdFundo, '', '');
    // vamos ordenar por Organizacao, projeto/Fundo
    vaCdsMovimentacao.IndexFieldNames := qMovimentacaoID_ORGANIZACAO.FieldName + ';' + qMovimentacaoID_ORIGEM_RECURSO.FieldName;

    vaCdsMovimentacao.First;
    while not vaCdsMovimentacao.Eof do
      begin
        if not cdsSaldo.Locate(cdsSaldoTIPO_ORIGEM.FieldName+';'+cdsSaldoID_ORGANIZACAO.FieldName+';'+cdsSaldoID_PROJETO_FUNDO.FieldName,
          VarArrayOf([vaCdsMovimentacao.FieldByName(qMovimentacaoTIPO_ORIGEM.FieldName).AsInteger, vaCdsMovimentacao.FieldByName(qMovimentacaoID_ORGANIZACAO.FieldName).AsInteger,
          vaCdsMovimentacao.FieldByName(qMovimentacaoID_ORIGEM_RECURSO.FieldName).AsInteger]), []) then
          begin
            cdsSaldo.Append;
            cdsSaldoTIPO_ORIGEM.AsInteger := vaCdsMovimentacao.FieldByName(qMovimentacaoTIPO_ORIGEM.FieldName).AsInteger;
            cdsSaldoID_ORGANIZACAO.AsInteger := vaCdsMovimentacao.FieldByName(qMovimentacaoID_ORGANIZACAO.FieldName).AsInteger;
            cdsSaldoNOME_ORGANIZACAO.AsString := vaCdsMovimentacao.FieldByName(qMovimentacaoNOME_ORGANIZACAO.FieldName).AsString;
            cdsSaldoID_PROJETO_FUNDO.AsInteger := vaCdsMovimentacao.FieldByName(qMovimentacaoID_ORIGEM_RECURSO.FieldName).AsInteger;
            cdsSaldoNOME_PROJETO_FUNDO.AsString := vaCdsMovimentacao.FieldByName(qMovimentacaoORIGEM_RECURSO.FieldName).AsString;

            if vaCdsMovimentacao.FieldByName(qMovimentacaoTIPO.FieldName).AsInteger = Ord(tmDespesa) then
              cdsSaldoSALDO.AsFloat := -vaCdsMovimentacao.FieldByName(coValor).AsFloat
            else
              cdsSaldoSALDO.AsFloat := vaCdsMovimentacao.FieldByName(coValor).AsFloat;
          end
        else
          begin
            cdsSaldo.Edit;
            if vaCdsMovimentacao.FieldByName(qMovimentacaoTIPO.FieldName).AsInteger = Ord(tmDespesa) then
              cdsSaldoSALDO.AsFloat := cdsSaldoSALDO.AsFloat - vaCdsMovimentacao.FieldByName(coValor).AsFloat
            else
              cdsSaldoSALDO.AsFloat := cdsSaldoSALDO.AsFloat + vaCdsMovimentacao.FieldByName(coValor).AsFloat;
          end;

        cdsSaldo.Post;

        vaCdsMovimentacao.Next;
      end;

    Result := cdsSaldo.Data;
  finally
    vaCdsMovimentacao.Free;
  end;
end;

procedure TsmFuncoesRelatorio.ppvCalcularSaldoGeral(ipCds: TClientDataSet);
var
  vaCdsClone: TClientDataSet;
  vaSoma: Double;
const
  coDespesa = 0;
  coReceita = 1;
begin

  vaCdsClone := TClientDataSet.Create(nil);
  try
    vaCdsClone.CloneCursor(ipCds, True);
    vaCdsClone.First;
    ipCds.First;

    if vaCdsClone.FieldByName(qMovimentacaoTIPO.FieldName).AsInteger = coReceita then
      vaSoma := ipCds.FieldByName(coValor).AsFloat
    else
      vaSoma := -ipCds.FieldByName(coValor).AsFloat;
    vaCdsClone.Next;
    while not vaCdsClone.Eof do
      begin
        if vaCdsClone.FieldByName(qMovimentacaoID_ORGANIZACAO.FieldName).AsInteger <> ipCds.FieldByName(qMovimentacaoID_ORGANIZACAO.FieldName).AsInteger
        then
          begin
            while (ipCds.RecNo <= vaCdsClone.RecNo) and (not ipCds.Eof) do
              begin
                ipCds.Edit;
                ipCds.FieldByName(coSaldoGeral).AsFloat := vaSoma;
                ipCds.Post;

                ipCds.Next;
              end;

            if vaCdsClone.FieldByName(qMovimentacaoTIPO.FieldName).AsInteger = coReceita then
              vaSoma := vaCdsClone.FieldByName(coValor).AsFloat
            else
              vaSoma := -vaCdsClone.FieldByName(coValor).AsFloat;
          end
        else
          begin
            if vaCdsClone.FieldByName(qMovimentacaoTIPO.FieldName).AsInteger = coReceita then
              vaSoma := vaSoma + vaCdsClone.FieldByName(coValor).AsFloat
            else
              vaSoma := vaSoma - vaCdsClone.FieldByName(coValor).AsFloat;
          end;

        vaCdsClone.Next;

      end;

    while (ipCds.RecNo <= vaCdsClone.RecNo) and (not ipCds.Eof) do
      begin
        ipCds.Edit;
        ipCds.FieldByName(coSaldoGeral).AsFloat := vaSoma;
        ipCds.Post;

        ipCds.Next;
      end;

  finally
    vaCdsClone.Free;
  end;

end;

end.
