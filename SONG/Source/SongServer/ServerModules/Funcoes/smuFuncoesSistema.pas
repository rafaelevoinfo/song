unit smuFuncoesSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuFuncoesBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery, aduna_ds_list,
  uTypes, uEnviarEmail;

type
  TsmFuncoesSistema = class(TsmFuncoesBasico)
  private
    { Private declarations }
  public
    function fpuValidarTipoNotificacao(ipIdNotificacao, ipTipo: integer): Boolean;
    function fpuVerificarNotificacoes(ipTipo: integer; ipEnviarEmail: Boolean): TadsObjectlist<TNotificacao>;
  end;

var
  smFuncoesSistema: TsmFuncoesSistema;

implementation

{$R *.dfm}

{ TsmFuncoesSistema }

function TsmFuncoesSistema.fpuVerificarNotificacoes(ipTipo: integer; ipEnviarEmail: Boolean): TadsObjectlist<TNotificacao>;
var
  vaDataSetNotificacao, vaDataSet: TRFQuery;
  vaNotificacao: TNotificacao;

  procedure plEnviarEmail(ipAssunto, ipMsg, ipDestinatario: String);
  var
    vaEnviarEmail: TEnviarEmail;
  begin
    vaEnviarEmail := TEnviarEmail.Create(true);
    vaEnviarEmail.ExibirMensagens := false;
    vaEnviarEmail.EMail.Remetente.Nome := 'SONG';
    vaEnviarEmail.EMail.Remetente.EMail := 'song@oreades.org.br';

    vaEnviarEmail.EMail.Destinatario.Para.Add.EnderecoEMail.EMail := ipDestinatario;

    vaEnviarEmail.EMail.Configuracao.Usuario := 'song@oreades.org.br';
    vaEnviarEmail.EMail.Configuracao.Senha := 'ipeAmarelo';
    vaEnviarEmail.EMail.Configuracao.Host := 'smtp.oreades.org.br';
    vaEnviarEmail.EMail.Configuracao.Porta := 587;

    vaEnviarEmail.EMail.Assunto := ipAssunto;
    vaEnviarEmail.EMail.Mensagem := ipMsg;
    vaEnviarEmail.Start;

  end;

  procedure plVerificarContaPagarVencendo;
  var
    vaConta: TConta;
    vaMsg: String;
  begin
    vaDataSet.close;
    vaDataSet.SQL.Text := 'select Conta_Pagar.Id,' +
      '       Conta_Pagar.Descricao || '' ('' || Conta_Pagar_Parcela.Parcela || ''/'' ||(select count(*)' +
      '                                                                                 from Conta_Pagar_Parcela' +
      '                                                                                 where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id)||'')'' as Descricao, '
      +
      '       Conta_Pagar_Parcela.Valor, ' +
      '       Conta_Pagar_Parcela.Vencimento ' +
      ' from Conta_Pagar_Parcela' +
      ' inner join Conta_Pagar on (Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id)' +
      ' where ((Conta_Pagar_Parcela.Status is null) or (Conta_Pagar_Parcela.Status = 0)) and' +
      '       dateadd(day, :DIAS, CURRENT_DATE) >= Conta_Pagar_Parcela.Vencimento ';
    vaDataSet.ParamByName('DIAS').AsInteger := vaDataSetNotificacao.FieldByName('Tempo_Antecedencia').AsInteger;
    vaDataSet.Open;

    while not vaDataSet.Eof do
      begin
        if vaDataSetNotificacao.FieldByName('Notificacao_Sistema').AsInteger = 1 then
          begin
            vaNotificacao := TNotificacao.Create;

            vaNotificacao.Id := vaDataSet.FieldByName('ID').AsInteger;
            vaNotificacao.Tipo := Ord(tnContaPagarVencendo);
            vaConta := TConta.Create;
            vaConta.Descricao := vaDataSet.FieldByName('DESCRICAO').AsString;
            vaConta.Valor := vaDataSet.FieldByName('VALOR').AsFloat;
            vaConta.Vencimento := vaDataSet.FieldByName('VENCIMENTO').AsDateTime;
            vaNotificacao.Info := vaConta;

            Result.Add(vaNotificacao);
          end;

        if (vaDataSetNotificacao.FieldByName('Notificacao_Email').AsInteger = 1) and ipEnviarEmail and
          (vaDataSetNotificacao.FieldByName('Email').AsString <> '') then
          begin
            vaMsg := 'A conta ' + vaDataSet.FieldByName('DESCRICAO').AsString + ' no valor de ' +
              FormatFloat('R$ ,0.00', vaConta.Valor);
            if Date > vaDataSet.FieldByName('VENCIMENTO').AsDateTime then
              vaMsg := vaMsg + ' venceu na data ' + vaDataSet.FieldByName('VENCIMENTO').AsString + ' e não foi paga.'
            else
              vaMsg := vaMsg + ' irá vencer em ' + vaDataSet.FieldByName('VENCIMENTO').AsString + ' e ainda não foi paga.';

            plEnviarEmail(TiposNotificacao[tnContaReceberVencida], vaMsg, vaDataSetNotificacao.FieldByName('Email').AsString);
          end;

        vaDataSet.Next;
      end;
  end;

  procedure plVerificarContaReceberVencida;
  var
    vaConta: TConta;
    vaMsg: String;
  begin
    vaDataSet.close;
    vaDataSet.SQL.Text := 'select Conta_Receber.Id,' +
      '       Conta_Receber.Descricao || '' ('' || Conta_Receber_Parcela.Parcela || ''/'' ||(select count(*)' +
      '                                                                                 from Conta_Receber_Parcela' +
      '                                                                                 where Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id)||'')'' as Descricao, '
      +
      '       Conta_Receber_Parcela.Valor, ' +
      '       Conta_Receber_Parcela.Vencimento ' +
      ' from Conta_Receber_Parcela' +
      ' inner join Conta_Receber on (Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id)' +
      ' where ((Conta_Receber_Parcela.Status is null) or (Conta_Receber_Parcela.Status = 0)) and' +
      '       CURRENT_DATE >= dateadd(day, :DIAS, Conta_Receber_Parcela.Vencimento) ';
    vaDataSet.ParamByName('DIAS').AsInteger := vaDataSetNotificacao.FieldByName('Tempo_Antecedencia').AsInteger;
    vaDataSet.Open;

    while not vaDataSet.Eof do
      begin
        if vaDataSetNotificacao.FieldByName('Notificacao_Sistema').AsInteger = 1 then
          begin
            vaNotificacao := TNotificacao.Create;

            vaNotificacao.Id := vaDataSet.FieldByName('ID').AsInteger;
            vaNotificacao.Tipo := Ord(tnContaReceberVencida);
            vaConta := TConta.Create;
            vaConta.Descricao := vaDataSet.FieldByName('DESCRICAO').AsString;
            vaConta.Valor := vaDataSet.FieldByName('VALOR').AsFloat;
            vaConta.Vencimento := vaDataSet.FieldByName('VENCIMENTO').AsDateTime;
            vaNotificacao.Info := vaConta;

            Result.Add(vaNotificacao);
          end;

        if (vaDataSetNotificacao.FieldByName('Notificacao_Email').AsInteger = 1) and ipEnviarEmail and
          (vaDataSetNotificacao.FieldByName('Email').AsString <> '') then
          begin
            vaMsg := 'A conta ' + vaDataSet.FieldByName('DESCRICAO').AsString + ' no valor de ' +
              FormatFloat('R$ ,0.00', vaConta.Valor) + ' venceu na data ' + vaDataSet.FieldByName('VENCIMENTO').AsString + ' e não foi recebida.';

            plEnviarEmail(TiposNotificacao[tnContaReceberVencida], vaMsg, vaDataSetNotificacao.FieldByName('Email').AsString);
          end;

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
    while not vaDataSetNotificacao.Eof do
      begin
        if (ipTipo = -1) or (vaDataSetNotificacao.FieldByName('TIPO').AsInteger = ipTipo) then
          begin
            case TTipoNotificacao(vaDataSetNotificacao.FieldByName('TIPO').AsInteger) of
              tnContaPagarVencendo:
                plVerificarContaPagarVencendo;
              tnContaReceberVencida:
                plVerificarContaReceberVencida;
              //tnRubricaAtigindoSaldo:
              // tnFundoFicandoSemSaldo:
              // tnAtividadeCadastrada:
              // tnAtividadeIniciada:
              // tnAtividadeVencendo:
            end;
          end;
        vaDataSetNotificacao.Next;
      end;
  finally
    vaDataSetNotificacao.close;
    vaDataSetNotificacao.Free;

    vaDataSet.close;
    vaDataSet.Free;
  end;
end;

function TsmFuncoesSistema.fpuValidarTipoNotificacao(ipIdNotificacao,
  ipTipo: integer): Boolean;
begin
  Result := fprValidarCampoUnico('NOTIFICACAO', 'TIPO', ipIdNotificacao, ipTipo.ToString());
end;

end.
