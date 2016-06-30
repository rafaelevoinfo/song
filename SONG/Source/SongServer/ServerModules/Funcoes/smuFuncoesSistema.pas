unit smuFuncoesSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuFuncoesBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery, aduna_ds_list,
  uTypes;

type
  TsmFuncoesSistema = class(TsmFuncoesBasico)
  private
    { Private declarations }
  public
    function fpuValidarTipoNotificacao(ipIdNotificacao, ipTipo: integer): Boolean;
    function fpuBuscarNotificacoes(ipTipo: integer): TadsObjectlist<TNotificacao>;
  end;

var
  smFuncoesSistema: TsmFuncoesSistema;

implementation

{$R *.dfm}

{ TsmFuncoesSistema }

function TsmFuncoesSistema.fpuBuscarNotificacoes(
  ipTipo: integer): TadsObjectlist<TNotificacao>;
var
  vaDataSetNotificacao,vaDataSet: TRFQuery;
  vaNotificacao:TNotificacao;

  procedure plVerificarContaPagarVencendo;
  begin
    vaDataSet.close;
    vaDataSet.SQL.Text := 'select Conta_Pagar.Id,' +
                          '       Conta_Pagar.Descricao || '' ('' || Conta_Pagar_Parcela.Parcela || ''/'' ||(select count(*)' +
                          '                                                                                 from Conta_Pagar_Parcela' +
                          '                                                                                 where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id)||'')'' as Descricao,' +
                          '       Conta_Pagar_Parcela.Valor '+
                          ' from Conta_Pagar_Parcela' +
                          ' inner join Conta_Pagar on (Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id)' +
                          ' where ((Conta_Pagar_Parcela.Status is null) or (Conta_Pagar_Parcela.Status = 0)) and' +
                          '       dateadd(day, :DIAS, CURRENT_DATE) >= Conta_Pagar_Parcela.Vencimento ';
    vaDataSet.ParamByName('DIAS').AsInteger := vaDataSetNotificacao.FieldByName('Tempo_Antecedencia').AsInteger;
    vaDataSet.Open;

    while not vaDataSet.Eof do
      begin
        vaNotificacao := TNotificacao.Create;

        vaNotificacao.Id := vaDataSet.FieldByName('ID').AsInteger;
        vaNotificacao.Tipo := Ord(tnContaPagarVencendo);
        vaNotificacao.Descricao := vaDataSet.FieldByName('DESCRICAO').AsString;

        Result.Add(vaNotificacao);

        vaDataSet.Next;
      end;
  end;

begin
  Result := TadsObjectlist<TNotificacao>.Create;

  pprCriarDataSet(vaDataSetNotificacao);
  pprCriarDataSet(vaDataSet);
  try
    // vamos ver os tipos de notificacoes configurados
    vaDataSetNotificacao.SQL.Text := ' select Notificacao.Tipo,' +
      '       Notificacao.Tempo_Antecedencia,' +
      '       Notificacao_Pessoa.Notificacao_Sistema,' +
      '       Notificacao_Pessoa.Notificacao_Email,' +
      '       Pessoa.Email' +
      ' from Notificacao' +
      ' inner join Notificacao_Pessoa on (Notificacao.Id = Notificacao_Pessoa.Id_Notificacao)' +
      ' left join Pessoa on (Pessoa.Id = Notificacao_Pessoa.Id_Pessoa) ';
    vaDataSetNotificacao.Open;
    while not vaDataSetNotificacao.eof do
      begin
        if (ipTipo = -1) or (vaDataSetNotificacao.FieldByName('TIPO').AsInteger = ipTipo) then
          begin
            case TTipoNotificacao(vaDataSetNotificacao.FieldByName('TIPO').AsInteger) of
              tnContaPagarVencendo:
                plVerificarContaPagarVencendo;
//              tnContaReceberVencida:
//              tnRubricaAtigindoSaldo:
//              tnFundoFicandoSemSaldo:
//              tnAtividadeCadastrada:
//              tnAtividadeIniciada:
//              tnAtividadeVencendo:
            end;
          end;
        vaDataSetNotificacao.Next;
      end;
  finally
    vaDataSetNotificacao.close;
    vaDataSetNotificacao.Free;

    vaDataSet.Close;
    vaDataSet.Free;
  end;
end;

function TsmFuncoesSistema.fpuValidarTipoNotificacao(ipIdNotificacao,
  ipTipo: integer): Boolean;
begin
  Result := fprValidarCampoUnico('NOTIFICACAO', 'TIPO', ipIdNotificacao, ipTipo.ToString());
end;

end.
