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
    qMovimentacaoID: TIntegerField;
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
    qMovimentacaoVALOR_TOTAL_PAGO_RECEBIDO: TBCDField;
    qMovimentacaoDATA: TDateField;
    qMovimentacaoDATA_PAGAMENTO_RECEBIMENTO: TDateField;
    qMovimentacaoFORMA_PAGAMENTO_RECEBIMENTO: TSmallintField;
    qMovimentacaoID_UNICO_ORIGEM_RECURSO: TStringField;
  private
    procedure ppvCalcularSaldoGeral(ipCds: TClientDataSet);
    { Private declarations }
  public
    function fpuMovimentacaoFinanceira(ipIdOrganizacao, ipIdProjeto, ipIdFundo: Integer;
      ipDataInicial, ipDataFinal: String; ipReceitas, ipDespesas, ipSomenteRegistroAberto: Boolean): OleVariant;
    function fpuSaldo(ipIdOrganizacao, ipIdProjeto, ipIdFundo: Integer): OleVariant;
  end;

var
  smFuncoesRelatorio: TsmFuncoesRelatorio;

const
  coProcessado = 'PROCESSADO';
  coValor = 'VALOR';
  coValorRestante = 'VALOR_RESTANTE';
  coSaldoGeral = 'SALDO_GERAL';
  coDescricaoFormaPagamento = 'DESCRICAO_FORMA_PAGAMENTO';

  coDespesa = 0;
  coReceita = 1;

implementation

{$R *.dfm}


function TsmFuncoesRelatorio.fpuMovimentacaoFinanceira(ipIdOrganizacao, ipIdProjeto, ipIdFundo: Integer;
  ipDataInicial, ipDataFinal: String; ipReceitas, ipDespesas, ipSomenteRegistroAberto: Boolean): OleVariant;
var
  vaCds: TRFClientDataSet;
  vaRecNo: Integer;
  vaValorPerc, vaSomaValorPerc: Currency;
  vaDataInicial, vaDataFinal: TDateTime;
  vaPerc: Double;

  procedure plProcessarRegistro(ipValorPagoRecebido: Currency);
  begin
    vaCds.Edit;
    vaCds.FieldByName(coProcessado).AsBoolean := True;
    vaCds.FieldByName(coValor).AsFloat := ipValorPagoRecebido;
    vaCds.FieldByName(coValorRestante).AsFloat := vaCds.FieldByName(qMovimentacaoVALOR_PARCIAL.FieldName).AsFloat - ipValorPagoRecebido;
    vaCds.Post;
  end;

begin
  qMovimentacao.Close;
  qMovimentacao.ParamByName('TODAS_DATAS').Clear;
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
    vaCds.FieldDefs.Add(coValorRestante, ftBCD, 2);
    vaCds.FieldDefs.Add(coSaldoGeral, ftBCD, 2);
    vaCds.FieldDefs.Add(coDescricaoFormaPagamento, ftString, 60);
    vaCds.CreateDataSet;

    while not qMovimentacao.Eof do
      begin
        vaCds.ppuCopiarRegistro(qMovimentacao);
        vaCds.FieldByName(coProcessado).AsBoolean := False;
        vaCds.FieldByName(coDescricaoFormaPagamento).AsString := FormaPagamennto[TFormaPagamento(qMovimentacaoFORMA_PAGAMENTO_RECEBIMENTO.AsInteger)];
        vaCds.Post;

        qMovimentacao.Next;
      end;

    // Nao remover esse IndeFieldNames pq senao ao fazer e desfazer o filter os registros irao mudar de posicao fazendo tudo ficar errado
    vaCds.IndexFieldNames := qMovimentacaoID_IDENTIFICACAO_TABELA.FieldName + ';' +
      qMovimentacaoID_MOVIMENTACAO.FieldName + ';' +
      qMovimentacaoID_ORIGEM_RECURSO.FieldName + ';' +
      qMovimentacaoID.FieldName + ';' +
      qMovimentacaoID_ORGANIZACAO.FieldName;
    // vamos calcular o valor pago para cada vinculo
    vaCds.First;
    while not vaCds.Eof do
      begin
        if not vaCds.FieldByName(coProcessado).AsBoolean then
          begin
            // 0 e 1 são despesas vindas do contas a pagar. nesse caso nao posso adicionar o ID_IDENTIFICACAO_TABELA no filtro pq senao podera
            // separar os vinculos de uma mesma conta a pagar. Entretanto tive que colocar o TIPO no filter para evitar que o ID_MOVIMENTACAO
            //coincida com outro de outra tabela
            if vaCds.FieldByName(qMovimentacaoID_IDENTIFICACAO_TABELA.FieldName).AsInteger in [0, 1] then
              begin
                vaCds.Filter := qMovimentacaoTIPO.FieldName +' = '+coDespesa.ToString+ ' and '+ qMovimentacaoID_MOVIMENTACAO.FieldName + ' = ' + vaCds.FieldByName(qMovimentacaoID_MOVIMENTACAO.FieldName).AsString
              end
            else
              begin
                // Nesse caso tenho que considerar o ID_IDENTIFICACAO_TABELA para evitar problema de ID de tabelas diferentes se coincidirem e entao
                // achar que fazem parte de um mesma conta e entao fazer os calculos dos percentuais errados.
                vaCds.Filter := qMovimentacaoID_IDENTIFICACAO_TABELA.FieldName + ' = ' +
                  vaCds.FieldByName(qMovimentacaoID_IDENTIFICACAO_TABELA.FieldName).AsString + ' and  ' +
                  qMovimentacaoID_MOVIMENTACAO.FieldName + ' = ' + vaCds.FieldByName(qMovimentacaoID_MOVIMENTACAO.FieldName).AsString;
              end;
            vaCds.Filtered := True;

            // possui mais de um vinculo
            if vaCds.RecordCount > 1 then
              begin
                vaCds.First;
                if vaCds.FieldByName(qMovimentacaoTIPO_ORIGEM_RECURSO.FieldName).AsInteger = Ord(orFinanciamento) then
                  vaPerc := 1 // 100%
                else
                  vaPerc := vaCds.FieldByName(qMovimentacaoVALOR_TOTAL_PAGO_RECEBIDO.FieldName).AsFloat /
                    vaCds.FieldByName(qMovimentacaoVALOR_TOTAL.FieldName).AsFloat;

                vaSomaValorPerc := 0;
                vaRecNo := vaCds.RecNo;
                while vaRecNo <= vaCds.RecordCount do
                  begin
                    vaValorPerc := TUtils.fpuTruncTo(vaCds.FieldByName(qMovimentacaoVALOR_PARCIAL.FieldName).AsFloat * vaPerc, 2);
                    if vaRecNo = vaCds.RecordCount then // ultimo registro, entao vamos jogar os quebrados pra ele
                      vaValorPerc := vaCds.FieldByName(qMovimentacaoVALOR_TOTAL_PAGO_RECEBIDO.FieldName).AsFloat - vaSomaValorPerc
                    else
                      vaSomaValorPerc := vaSomaValorPerc + vaValorPerc;

                    plProcessarRegistro(vaValorPerc);

                    Inc(vaRecNo);
                    vaCds.Next;
                  end;
              end
            else
              begin
                plProcessarRegistro(vaCds.FieldByName(qMovimentacaoVALOR_TOTAL_PAGO_RECEBIDO.FieldName).AsFloat);
              end;

            vaCds.Filtered := False;
          end;

        if ((ipIdOrganizacao <> 0) and (ipIdOrganizacao <> vaCds.FieldByName(qMovimentacaoID_ORGANIZACAO.FieldName).AsInteger)) or

          ((ipIdProjeto <> 0) and (vaCds.FieldByName(qMovimentacaoTIPO_ORIGEM.FieldName).AsInteger = Ord(oriProjeto)) and
          (ipIdProjeto <> vaCds.FieldByName(qMovimentacaoID_ORIGEM_RECURSO.FieldName).AsInteger)) or

          ((ipIdFundo <> 0) and (vaCds.FieldByName(qMovimentacaoTIPO_ORIGEM.FieldName).AsInteger = Ord(oriFundo)) and
          (ipIdFundo <> vaCds.FieldByName(qMovimentacaoID_ORIGEM_RECURSO.FieldName).AsInteger)) or

          ((not ipReceitas) and (vaCds.FieldByName(qMovimentacaoTIPO.FieldName).AsInteger = coReceita)) or

          ((not ipDespesas) and (vaCds.FieldByName(qMovimentacaoTIPO.FieldName).AsInteger = coDespesa)) or

          (ipSomenteRegistroAberto and (vaCds.FieldByName(coValorRestante).AsFloat = 0)) then
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
    vaCdsMovimentacao.Data := fpuMovimentacaoFinanceira(ipIdOrganizacao, ipIdProjeto, ipIdFundo, '', '', True, True, False);
    // vamos ordenar por Organizacao, projeto/Fundo
    vaCdsMovimentacao.IndexFieldNames := qMovimentacaoID_ORGANIZACAO.FieldName + ';' + qMovimentacaoID_ORIGEM_RECURSO.FieldName;

    vaCdsMovimentacao.First;
    while not vaCdsMovimentacao.Eof do
      begin
        if not cdsSaldo.Locate(cdsSaldoTIPO_ORIGEM.FieldName + ';' + cdsSaldoID_ORGANIZACAO.FieldName + ';' + cdsSaldoID_PROJETO_FUNDO.FieldName,
          VarArrayOf([vaCdsMovimentacao.FieldByName(qMovimentacaoTIPO_ORIGEM.FieldName).AsInteger,
          vaCdsMovimentacao.FieldByName(qMovimentacaoID_ORGANIZACAO.FieldName).AsInteger,
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
        if vaCdsClone.FieldByName(qMovimentacaoID_ORGANIZACAO.FieldName).AsInteger <> ipCds.FieldByName(qMovimentacaoID_ORGANIZACAO.FieldName).AsInteger then
          begin
            while (ipCds.RecNo < vaCdsClone.RecNo) and (not ipCds.Eof) do
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
