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
    function fpuVerificarNotificacoes(ipIdPessoa: integer; ipTipo: integer; ipEnviarEmail: Boolean): TadsObjectlist<TNotificacao>;
  end;

var
  smFuncoesSistema: TsmFuncoesSistema;

implementation

{$R *.dfm}

{ TsmFuncoesSistema }

function TsmFuncoesSistema.fpuVerificarNotificacoes(ipIdPessoa: integer; ipTipo: integer; ipEnviarEmail: Boolean): TadsObjectlist<TNotificacao>;
var
  vaDataSetNotificacao, vaDataSetNotificacaoPessoa, vaDataSet: TRFQuery;
  vaNotificacao: TNotificacao;
  vaMsg: String;

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

  procedure plEnviarEmails(ipTipo: TTipoNotificacao; ipMsg: String);
  begin
    if ipEnviarEmail then
      begin
        vaDataSetNotificacaoPessoa.First;
        while not vaDataSetNotificacaoPessoa.Eof do
          begin
            if (vaDataSetNotificacaoPessoa.FieldByName('Notificacao_Email').AsInteger = 1) and
              (vaDataSetNotificacaoPessoa.FieldByName('Email').AsString <> '') then
              begin

                plEnviarEmail(TiposNotificacao[ipTipo], ipMsg, vaDataSetNotificacaoPessoa.FieldByName('Email').AsString);
              end;
            vaDataSetNotificacaoPessoa.next;
          end;
      end;
  end;

  procedure plVerificarContaPagarVencendo;
  var
    vaConta: TConta;
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

    vaMsg := '';
    while not vaDataSet.Eof do
      begin
        if vaDataSetNotificacaoPessoa.FieldByName('Notificacao_Sistema').AsInteger = 1 then
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

        vaMsg := vaMsg + 'A conta ' + vaDataSet.FieldByName('DESCRICAO').AsString + ' no valor de ' +
          FormatFloat('R$ ,0.00', vaConta.Valor);
        if Date > vaDataSet.FieldByName('VENCIMENTO').AsDateTime then
          vaMsg := vaMsg + ' venceu na data ' + vaDataSet.FieldByName('VENCIMENTO').AsString + ' e não foi paga.'
        else
          vaMsg := vaMsg + ' irá vencer em ' + vaDataSet.FieldByName('VENCIMENTO').AsString + ' e ainda não foi paga.';

        vaMsg := vaMsg + '<br/><br/>';

        vaDataSet.next;
      end;

    if vaMsg <> '' then
      plEnviarEmails(tnContaPagarVencendo, vaMsg);
  end;

  procedure plVerificarContaReceberVencida;
  var
    vaConta: TConta;
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

    vaMsg := '';
    while not vaDataSet.Eof do
      begin
        if vaDataSetNotificacaoPessoa.FieldByName('Notificacao_Sistema').AsInteger = 1 then
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

        vaMsg := vaMsg + 'A conta ' + vaDataSet.FieldByName('DESCRICAO').AsString + ' no valor de ' +
          FormatFloat('R$ ,0.00', vaConta.Valor) + ' venceu na data ' + vaDataSet.FieldByName('VENCIMENTO').AsString +
          ' e não foi recebida.' + '<br/><br/>';

        vaDataSet.next;
      end;

    if vaMsg <> '' then
      plEnviarEmails(tnContaReceberVencida, vaMsg);
  end;

  procedure plVerificarRubricas;
  var
    vaRubrica: TRubrica;
  begin
    vaDataSet.close;
    vaDataSet.SQL.Text := 'select View_Rubrica_Projeto.Id_Rubrica, ' +
      '       View_Rubrica_Projeto.Id_Projeto, ' +
      '       View_Rubrica_Projeto.Nome_Projeto,' +
      '       View_Rubrica_Projeto.Nome_Rubrica,' +
      '       View_Rubrica_Projeto.Valor_Gasto,' +
      '       View_Rubrica_Projeto.Valor_Recebido,' +
      '       View_Rubrica_Projeto.Saldo_Real ' +
      ' from View_Rubrica_Projeto' +
      ' where (View_Rubrica_Projeto.Valor_Gasto > View_Rubrica_Projeto.Valor_Recebido) or' +
      '      ((View_Rubrica_Projeto.Valor_Gasto / View_Rubrica_Projeto.Valor_Recebido) >= 0.9)';
    vaDataSet.Open;
    vaMsg := '';
    while not vaDataSet.Eof do
      begin
        if vaDataSetNotificacaoPessoa.FieldByName('Notificacao_Sistema').AsInteger = 1 then
          begin
            vaNotificacao := TNotificacao.Create;

            vaNotificacao.Id := vaDataSet.FieldByName('ID_PROJETO').AsInteger;
            vaNotificacao.Tipo := Ord(tnRubricaAtigindoSaldo);
            vaRubrica := TRubrica.Create;

            vaRubrica.Id := vaDataSet.FieldByName('ID_RUBRICA').AsInteger;
            vaRubrica.IdProjeto := vaDataSet.FieldByName('ID_PROJETO').AsInteger;
            vaRubrica.NomeRubrica := vaDataSet.FieldByName('NOME_RUBRICA').AsString;
            vaRubrica.NomeProjeto := vaDataSet.FieldByName('NOME_PROJETO').AsString;
            vaRubrica.PercentualGasto := (vaDataSet.FieldByName('VALOR_GASTO').AsFloat / vaDataSet.FieldByName('VALOR_RECEBIDO').AsFloat) * 100;
            vaRubrica.SaldoReal := vaDataSet.FieldByName('SALDO_REAL').AsFloat;

            vaNotificacao.Info := vaRubrica;

            Result.Add(vaNotificacao);
          end;

        vaMsg := vaMsg + 'A rubrica ' + vaDataSet.FieldByName('NOME_RUBRICA').AsString + ' do projeto ' +
          vaDataSet.FieldByName('NOME_PROJETO').AsString + ' está prestes a atingir o seu limite. <br/><br/>';

        vaDataSet.next;
      end;

    if vaMsg <> '' then
      plEnviarEmails(tnRubricaAtigindoSaldo, vaMsg);
  end;

  procedure plVerificarFundo;
  var
    vaFundo: TFundo;
  begin
    vaDataSet.close;
    vaDataSet.SQL.Text := ' select Fundo.Id,' +
      '       Fundo.Id_Organizacao, ' +
      '       Organizacao.nome as nome_organizacao, ' +
      '       Fundo.Nome,' +
      '       Fundo.Saldo' +
      ' from Fundo' +
      ' inner join organizacao on (organizacao.id = fundo.id_organizacao)' +
      ' where Fundo.Saldo < :GATILHO';
    vaDataSet.ParamByName('GATILHO').AsFloat := vaDataSetNotificacao.FieldByName('VALOR_GATILHO').AsFloat;
    vaDataSet.Open;
    vaMsg := '';
    while not vaDataSet.Eof do
      begin
        if vaDataSetNotificacaoPessoa.FieldByName('Notificacao_Sistema').AsInteger = 1 then
          begin
            vaNotificacao := TNotificacao.Create;

            vaNotificacao.Id := vaDataSet.FieldByName('ID_ORGANIZACAO').AsInteger;
            vaNotificacao.Tipo := Ord(tnFundoFicandoSemSaldo);
            vaFundo := TFundo.Create;

            vaFundo.Id := vaDataSet.FieldByName('ID').AsInteger;
            vaFundo.Nome := vaDataSet.FieldByName('NOME').AsString;
            vaFundo.NomeOrganizacao := vaDataSet.FieldByName('NOME_ORGANIZACAO').AsString;
            vaFundo.Saldo := vaDataSet.FieldByName('SALDO').AsFloat;

            vaNotificacao.Info := vaFundo;

            Result.Add(vaNotificacao);
          end;

        vaMsg := vaMsg + 'O fundo ' + vaDataSet.FieldByName('NOME').AsString + ' da organização ' +
          vaDataSet.FieldByName('NOME_ORGANIZACAO').AsString + ' está ficando sem saldo. <br/><br/>';

        vaDataSet.next;
      end;

    if vaMsg <> '' then
      plEnviarEmails(tnFundoFicandoSemSaldo, vaMsg);
  end;

  procedure plVerificarAtividadeIniciada;
  var
    vaAtividade: TAtividade;
  begin
    vaDataSet.close;
    //TODO: Levar em consideracao aqui se a pessoa esta envolvida com a atividade informada pq se nao tiver nao pode mesmo q esteja configurado na tabela de notificacoes
    vaDataSet.SQL.Text := 'select Atividade.Id,' +
                          '       Atividade.Nome,' +
                          '       Atividade.status,' +
                          '       Projeto.Nome as Nome_Projeto' +
                          ' from Atividade' +
                          ' inner join Projeto on (Atividade.Id_Projeto = Projeto.Id) '+
                          ' where Atividade.Data_Cadastro >= (dateadd(day, :DIAS, current_date))';
    vaDataSet.ParamByName('DIAS').AsInteger := vaDataSetNotificacao.FieldByName('TEMPO_ANTECEDENCIA').AsInteger*-1;
    vaDataSet.Open;
    vaMsg := '';
    while not vaDataSet.Eof do
      begin
        if vaDataSetNotificacaoPessoa.FieldByName('Notificacao_Sistema').AsInteger = 1 then
          begin
            vaNotificacao := TNotificacao.Create;

            vaNotificacao.Id := vaDataSet.FieldByName('ID').AsInteger;
            vaNotificacao.Tipo := Ord(tnAtividadeCadastrada);

            vaAtividade := TAtividade.Create;
            vaAtividade.Id := vaDataSet.FieldByName('ID').AsInteger;
            vaAtividade.Nome := vaDataSet.FieldByName('NOME').AsString;
            vaAtividade.NomeProjeto := vaDataSet.FieldByName('NOME_PROJETO').AsString;
            vaAtividade.Status := vaDataSet.FieldByName('STATUS').AsInteger;

            vaNotificacao.Info := vaAtividade;

            Result.Add(vaNotificacao);
          end;

        vaMsg := vaMsg + 'Foi cadastrada a atividade ' + vaDataSet.FieldByName('NOME').AsString + ' para o projeto ' +
          vaDataSet.FieldByName('NOME_PROJETO').AsString + '. <br/><br/>';

        vaDataSet.next;
      end;

    if vaMsg <> '' then
      plEnviarEmails(tnAtividadeCadastrada, vaMsg);

  end;

begin
  Result := TadsObjectlist<TNotificacao>.Create;

  pprCriarDataSet(vaDataSetNotificacao);
  pprCriarDataSet(vaDataSetNotificacaoPessoa);
  pprCriarDataSet(vaDataSet);
  try
    // vamos ver os tipos de notificacoes configurados
    vaDataSetNotificacao.SQL.Text := ' select Notificacao.ID, ' +
      '       Notificacao.Tipo,' +
      '       Notificacao.Tempo_Antecedencia, ' +
      '       Notificacao.VALOR_GATILHO ' +
      ' from Notificacao ';
    vaDataSetNotificacao.Open;
    while not vaDataSetNotificacao.Eof do
      begin
        if (ipTipo = -1) or (vaDataSetNotificacao.FieldByName('TIPO').AsInteger = ipTipo) then
          begin
            vaDataSetNotificacaoPessoa.close;
            vaDataSetNotificacaoPessoa.SQL.Text := 'Select  Notificacao_Pessoa.Notificacao_Sistema,' +
              '        Notificacao_Pessoa.Notificacao_Email,' +
              '        Pessoa.Email ' +
              ' from notificacao_pessoa ' +
              ' inner join Pessoa on (Pessoa.Id = Notificacao_Pessoa.Id_Pessoa) ' +
              ' where ((notificacao_pessoa.id_pessoa = :ID_PESSOA) or (:ID_PESSOA IS NULL)) and' +
              '       notificacao_pessoa.id_notificacao = :ID_NOTIFICACAO';
            vaDataSetNotificacaoPessoa.ParamByName('ID_NOTIFICACAO').AsInteger := vaDataSetNotificacao.FieldByName('ID').AsInteger;
            if ipIdPessoa <> -1 then
              vaDataSetNotificacaoPessoa.ParamByName('ID_PESSOA').AsInteger := ipIdPessoa
            else
              vaDataSetNotificacaoPessoa.ParamByName('ID_PESSOA').Clear;

            vaDataSetNotificacaoPessoa.Open;

            if (not vaDataSetNotificacaoPessoa.Eof) and
              ((vaDataSetNotificacaoPessoa.FieldByName('Notificacao_Email').AsInteger = 1) or
              (vaDataSetNotificacaoPessoa.FieldByName('Notificacao_Sistema').AsInteger = 1)) then
              begin
                case TTipoNotificacao(vaDataSetNotificacao.FieldByName('TIPO').AsInteger) of
                  tnContaPagarVencendo:
                    plVerificarContaPagarVencendo;
                  tnContaReceberVencida:
                    plVerificarContaReceberVencida;
                  tnRubricaAtigindoSaldo:
                    plVerificarRubricas;
                  tnFundoFicandoSemSaldo:
                    plVerificarFundo;
                  tnAtividadeCadastrada:
                    plVerificarAtividadeIniciada;
                  // tnAtividadeIniciada:
                  // tnAtividadeVencendo:
                end;
              end;
          end;
        vaDataSetNotificacao.next;
      end;
  finally
    vaDataSetNotificacao.close;
    vaDataSetNotificacao.Free;

    vaDataSetNotificacaoPessoa.close;
    vaDataSetNotificacaoPessoa.Free;

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
