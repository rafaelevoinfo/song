unit smuFuncoesRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuFuncoesBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery, uClientDataSet,
  uUtils;

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
  private
    { Private declarations }
  public
    function fpuMovimentacaoFinanceira(ipIdOrganizacao: Integer; ipDataInicial, ipDataFinal: String): OleVariant;
  end;

var
  smFuncoesRelatorio: TsmFuncoesRelatorio;

const
  coProcessado = 'PROCESSADO';
  coValor = 'VALOR';

implementation

{$R *.dfm}


function TsmFuncoesRelatorio.fpuMovimentacaoFinanceira(ipIdOrganizacao: Integer; ipDataInicial, ipDataFinal: String): OleVariant;
var
  vaCds: TRFClientDataSet;
  vaRecNo, vaRecNoAux, vaIdOrganizacao, vaQtdeOrganizacoes: Integer;
  vaValor, vaSoma: Double;
  I: Integer;
  vaFiltro: string;
  vaDataInicial, vaDataFinal: TDateTime;

  procedure plProcessarRegistro(ipValor: Double);
  begin
    vaCds.Edit;
    vaCds.FieldByName(coProcessado).AsBoolean := True;
    vaCds.FieldByName(coValor).AsFloat := ipValor;
    vaCds.Post;
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
    vaCds.CreateDataSet;

    while not qMovimentacao.Eof do
      begin
        vaCds.ppuCopiarRegistro(qMovimentacao);
        vaCds.FieldByName(coProcessado).AsBoolean := False;
        vaCds.Post;

        qMovimentacao.Next;
      end;

    vaCds.IndexFieldNames := qMovimentacaoID_MOVIMENTACAO.FieldName + ';' + qMovimentacaoID_ORIGEM_RECURSO.FieldName + ';' +
      qMovimentacaoID_ORGANIZACAO.FieldName;
    // vamos percorrer todos os registros agora para entao calcular o valor de cada organizacao
    vaCds.First;
    while not vaCds.Eof do
      begin
        if not vaCds.FieldByName(coProcessado).AsBoolean then
          begin
            vaRecNo := vaCds.RecNo;
            vaCds.Filter := qMovimentacaoID_MOVIMENTACAO.FieldName + ' = ' + vaCds.FieldByName(qMovimentacaoID_MOVIMENTACAO.FieldName).AsString;
            vaCds.Filtered := True;
            // possui mais de um vinculo ou o vinculo esta ligado a mais de uma organizacao
            if vaCds.RecordCount > 1 then
              begin
                vaCds.First;
                while not vaCds.Eof do
                  begin
                    if not vaCds.FieldByName(coProcessado).AsBoolean then
                      begin
                        vaRecNoAux := vaCds.RecNo;
                        vaFiltro := vaCds.Filter;

                        vaCds.Filter := vaCds.Filter + ' and ' + qMovimentacaoID_ORIGEM_RECURSO.FieldName + ' = ' +
                          vaCds.FieldByName(qMovimentacaoID_ORIGEM_RECURSO.FieldName).AsString;
                        // se true, signfica que temos uma mesma movimentacao para uma mesma origem mais de uma vez. Isso geralmente representa que o registro esta vinculo a organizacoes diferentes
                        if vaCds.RecordCount > 1 then
                          begin
                            vaCds.First;
                            vaQtdeOrganizacoes := 1;
                            vaIdOrganizacao := vaCds.FieldByName(qMovimentacaoID_ORGANIZACAO.FieldName).AsInteger;
                            while not vaCds.Eof do
                              begin
                                if vaCds.FieldByName(qMovimentacaoID_ORGANIZACAO.FieldName).AsInteger <> vaIdOrganizacao then
                                  begin
                                    Inc(vaQtdeOrganizacoes);
                                    vaIdOrganizacao := vaCds.FieldByName(qMovimentacaoID_ORGANIZACAO.FieldName).AsInteger;
                                  end;

                                vaCds.Next;
                              end;
                            vaValor := TUtils.fpuTruncTo(vaCds.FieldByName(qMovimentacaoVALOR_PARCIAL.FieldName).AsFloat / vaQtdeOrganizacoes, 2);
                            // vamos calcular o valor que de fato percentece a cada registro
                            vaSoma := 0;
                            vaCds.First;
                            for I := 0 to vaCds.RecordCount - 1 do
                              begin
                                if I = vaCds.RecordCount - 1 then
                                  plProcessarRegistro(vaCds.FieldByName(qMovimentacaoVALOR_PARCIAL.FieldName).AsFloat - vaSoma)
                                else
                                  plProcessarRegistro(vaValor);

                                vaSoma := vaSoma + vaValor;

                                vaCds.Next;
                              end;
                          end
                        else
                          plProcessarRegistro(vaCds.FieldByName(qMovimentacaoVALOR_PARCIAL.FieldName).AsFloat);

                        vaCds.Filter := vaFiltro;
                        vaCds.RecNo := vaRecNoAux;
                      end;
                    vaCds.Next;
                  end;
              end
            else
              plProcessarRegistro(vaCds.FieldByName(qMovimentacaoVALOR_PARCIAL.FieldName).AsFloat);

            vaCds.Filtered := False;
            vaCds.RecNo := vaRecNo;
          end;

        if (ipIdOrganizacao <> 0) and (ipIdOrganizacao <> vaCds.FieldByName(qMovimentacaoID_ORGANIZACAO.FieldName).AsInteger) then
          vaCds.Delete
        else
          vaCds.Next;
      end;

    Result := vaCds.Data;
  finally
    vaCds.Free;
    qMovimentacao.Close;
  end;

end;

end.
