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
    procedure ppuCriarAgendaPessoal(ipIdPessoa: integer);
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
  vaTipoNotificacao: TTipoNotificacao;
  vaMsg: String;

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
                pprEnviarEmail(TiposNotificacao[ipTipo], ipMsg, vaDataSetNotificacaoPessoa.FieldByName('Email').AsString);
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
          FormatFloat('R$ ,0.00', vaDataSet.FieldByName('VALOR').AsFloat);
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
          FormatFloat('R$ ,0.00', vaDataSet.FieldByName('VALOR').AsFloat) + ' venceu na data ' + vaDataSet.FieldByName('VENCIMENTO').AsString +
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
      '       case' +
      '                    when view_rubrica_projeto.valor_gasto_transferido > view_rubrica_projeto.valor_recebido_transferido then' +
      '                        view_rubrica_projeto.valor_gasto + (view_rubrica_projeto.valor_gasto_transferido - view_rubrica_projeto.valor_recebido_transferido)'
      +
      '                       else' +
      '                        view_rubrica_projeto.valor_gasto' +
      '                end as VALOR_GASTO,' +
      '                 case' +
      '                    when view_rubrica_projeto.valor_gasto_transferido < view_rubrica_projeto.valor_recebido_transferido then' +
      '                        view_rubrica_projeto.valor_recebido + (view_rubrica_projeto.valor_recebido_transferido - view_rubrica_projeto.valor_gasto_transferido)'
      +
      '                       else' +
      '                        view_rubrica_projeto.valor_recebido' +
      '                end as VALOR_RECEBIDO,' +
      '       View_Rubrica_Projeto.Saldo_Real ' +
      ' from View_Rubrica_Projeto' +
      ' where (View_Rubrica_Projeto.Valor_Gasto > View_Rubrica_Projeto.Valor_Recebido) or' +
      '      (((View_Rubrica_Projeto.Valor_Gasto / View_Rubrica_Projeto.Valor_Recebido)*100) >= :PERCENTUAL_NOTIFICACAO)';
    vaDataSet.ParamByName('PERCENTUAL_NOTIFICACAO').AsFloat := vaDataSetNotificacao.FieldByName('VALOR_GATILHO').AsFloat;
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

  procedure plVerificarAtividade(ipTipoNotificacao: TTipoNotificacao);
  var
    vaAtividade: TAtividade;
    vaDataSetEnvolvidos: TRFQuery;
  begin
    vaDataSet.close;
    vaDataSet.SQL.Text := 'select Atividade.Id,' +
      '       Atividade.Nome,' +
      '       Atividade.status,' +
      '       Projeto.Nome as Nome_Projeto' +
      ' from Atividade' +
      ' inner join Projeto on (Atividade.Id_Projeto = Projeto.Id) ';
    if ipTipoNotificacao = tnAtividadeVencendo then
      begin
        vaDataSet.SQL.Text := vaDataSet.SQL.Text + ' where (dateadd(day, :DIAS, current_date) >= Atividade.Data_Final) and ' +
          ' (Atividade.status not in (' + Ord(saFinalizada).ToString + ',' + Ord(saCancelada).ToString + '))';

        vaDataSet.ParamByName('DIAS').AsInteger := vaDataSetNotificacao.FieldByName('TEMPO_ANTECEDENCIA').AsInteger
      end
    else
      begin
        if ipTipoNotificacao = tnAtividadeAlterada then
          vaDataSet.SQL.Text := vaDataSet.SQL.Text + ' where Atividade.Data_Alteracao >= (dateadd(day, :DIAS, current_date))'
        else
          vaDataSet.SQL.Text := vaDataSet.SQL.Text + ' where Atividade.Data_Cadastro >= (dateadd(day, :DIAS, current_date))';

        vaDataSet.ParamByName('DIAS').AsInteger := vaDataSetNotificacao.FieldByName('TEMPO_ANTECEDENCIA').AsInteger * -1;
      end;

    vaDataSet.Open;
    vaMsg := '';
    if not vaDataSet.Eof then
      begin
        pprCriarDataSet(vaDataSetEnvolvidos);
        try
          vaDataSetEnvolvidos.SQL.Text := ' select Atividade.Id_Solicitante,' +
            '       Atividade.Id_Responsavel,' +
            '       Atividade_pessoa.id_pessoa as ID_PESSOA_ENVOLVIDA' +
            ' from atividade' +
            ' left join atividade_pessoa on (atividade.id = atividade_pessoa.id_pessoa)' +
            ' where atividade.id = :ID';

          while not vaDataSet.Eof do
            begin
              vaDataSetEnvolvidos.close;
              vaDataSetEnvolvidos.ParamByName('ID').AsInteger := vaDataSet.FieldByName('ID').AsInteger;
              vaDataSetEnvolvidos.Open();

              if vaDataSetEnvolvidos.Locate('ID_SOLICITANTE', vaDataSetNotificacaoPessoa.FieldByName('ID_PESSOA').AsInteger, []) or
                vaDataSetEnvolvidos.Locate('ID_RESPONSAVEL', vaDataSetNotificacaoPessoa.FieldByName('ID_PESSOA').AsInteger, []) or
                vaDataSetEnvolvidos.Locate('ID_PESSOA_ENVOLVIDA', vaDataSetNotificacaoPessoa.FieldByName('ID_PESSOA').AsInteger, []) then
                begin

                  if vaDataSetNotificacaoPessoa.FieldByName('Notificacao_Sistema').AsInteger = 1 then
                    begin
                      vaNotificacao := TNotificacao.Create;

                      vaNotificacao.Id := vaDataSet.FieldByName('ID').AsInteger;
                      vaNotificacao.Tipo := Ord(ipTipoNotificacao);

                      vaAtividade := TAtividade.Create;
                      vaAtividade.Id := vaDataSet.FieldByName('ID').AsInteger;
                      vaAtividade.Nome := vaDataSet.FieldByName('NOME').AsString;
                      vaAtividade.NomeProjeto := vaDataSet.FieldByName('NOME_PROJETO').AsString;
                      vaAtividade.Status := vaDataSet.FieldByName('STATUS').AsInteger;

                      vaNotificacao.Info := vaAtividade;

                      Result.Add(vaNotificacao);
                    end;

                  if ipTipoNotificacao = tnAtividadeVencendo then
                    vaMsg := vaMsg + 'A atividade ' + vaDataSet.FieldByName('NOME').AsString + ' do projeto ' +
                      vaDataSet.FieldByName('NOME_PROJETO').AsString + ' está prestes a vencer seu prazo de execução. <br/><br/>'
                  else if ipTipoNotificacao = tnAtividadeAlterada then
                    vaMsg := vaMsg + 'Houve modificações na atividade ' + vaDataSet.FieldByName('NOME').AsString + ' do projeto ' +
                      vaDataSet.FieldByName('NOME_PROJETO').AsString + '. <br/><br/>'
                  else
                    vaMsg := vaMsg + 'Foi cadastrada a atividade ' + vaDataSet.FieldByName('NOME').AsString + ' para o projeto ' +
                      vaDataSet.FieldByName('NOME_PROJETO').AsString + '. <br/><br/>';
                end;
              vaDataSet.next;
            end;
        finally
          vaDataSetEnvolvidos.close;
          vaDataSetEnvolvidos.Free;
        end;
      end;

    if vaMsg <> '' then
      plEnviarEmails(ipTipoNotificacao, vaMsg);

  end;

  procedure plVerificarSolicitacaoCompra();
  var
    vaSolicitacao: TSolicitacaoCompra;
  begin
    vaDataSet.close;
    vaDataSet.SQL.Text := ' select Solicitacao_Compra.id, ' +
      '       Solicitacao_Compra.Data,' +
      '       Pessoa.nome as Solicitante, ' +
      '       Solicitacao_Compra.Status,' +
      '       Solicitacao_Compra.Data_Analise, ' +
      '       list(coalesce(Especie.Nome, Item.Nome), '', '') as Itens' +
      ' from Solicitacao_Compra' +
      ' inner join Solicitacao_Compra_Item on (Solicitacao_Compra.Id = Solicitacao_Compra_Item.Id_Solicitacao_Compra)' +
      ' inner join pessoa on (pessoa.id = Solicitacao_Compra.id_pessoa_solicitou) ' +
      ' inner join Item on (Item.Id = Solicitacao_Compra_Item.Id_Item)' +
      ' left join Especie on (Especie.Id = Solicitacao_Compra_Item.Id_Especie)' +
      ' where ((Solicitacao_Compra.Status = 0) and' +
      '         (dateadd(day, :Dias, Solicitacao_Compra.Data) >= current_date)) or ' +
      '       ((Solicitacao_Compra.Status <> 0) and' +
      '        (dateadd(day, :Dias, Solicitacao_Compra.Data_Analise) >= current_date))' +
      ' group by Solicitacao_Compra.id, Solicitacao_Compra.Data, Pessoa.nome, Solicitacao_Compra.Status, Solicitacao_Compra.Data_Analise ';

    vaDataSet.ParamByName('DIAS').AsInteger := vaDataSetNotificacao.FieldByName('TEMPO_ANTECEDENCIA').AsInteger;
    vaDataSet.Open;
    vaMsg := '';
    while not vaDataSet.Eof do
      begin
        if vaDataSetNotificacaoPessoa.FieldByName('Notificacao_Sistema').AsInteger = 1 then
          begin
            vaNotificacao := TNotificacao.Create;

            vaNotificacao.Id := vaDataSet.FieldByName('ID').AsInteger;
            vaNotificacao.Tipo := Ord(tnSolicitacaoCompra);
            vaSolicitacao := TSolicitacaoCompra.Create;

            vaSolicitacao.Id := vaDataSet.FieldByName('ID').AsInteger;
            vaSolicitacao.Itens := vaDataSet.FieldByName('ITENS').AsString;
            vaSolicitacao.DataSolicitacao := vaDataSet.FieldByName('DATA').AsDateTime;
            vaSolicitacao.DataAnalise := vaDataSet.FieldByName('DATA_ANALISE').AsDateTime;
            vaSolicitacao.Status := vaDataSet.FieldByName('STATUS').AsInteger;
            vaSolicitacao.Solicitante := vaDataSet.FieldByName('SOLICITANTE').AsString;

            vaNotificacao.Info := vaSolicitacao;

            Result.Add(vaNotificacao);
          end;

        if vaDataSet.FieldByName('STATUS').AsInteger = Ord(sscSolicitacada) then
          vaMsg := vaMsg + 'Houve uma solicitação de compra dos seguintes itens: ' + vaDataSet.FieldByName('ITENS').AsString + ' <br/><br/>'
        else if vaDataSet.FieldByName('STATUS').AsInteger = Ord(sscAprovada) then
          vaMsg := vaMsg + 'A solicitação dos itens ' + vaDataSet.FieldByName('ITENS').AsString + ' foi aprovada.' + ' <br/><br/>'
        else if vaDataSet.FieldByName('STATUS').AsInteger = Ord(sscNegada) then
          vaMsg := vaMsg + 'A solicitação dos itens ' + vaDataSet.FieldByName('ITENS').AsString + ' foi negada.' + ' <br/><br/>';

        vaDataSet.next;
      end;

    if vaMsg <> '' then
      plEnviarEmails(tnSolicitacaoCompra, vaMsg);

  end;

  procedure plVerificarAniversarios();
  var
    vaPessoa: TPessoa;
  begin
    vaDataSet.close;
    vaDataSet.SQL.Text := ' select Pessoa.Id,' +
      '       Pessoa.Nome,' +
      '       Pessoa.Data_Nascimento' +
      ' from Pessoa' +
      ' where Pessoa.Tipo in (' + Ord(trpFuncionario).ToString + ',' + Ord(trpMembroDiretoria).ToString + ','
      + Ord(trpParceiro).ToString + ',' + Ord(trpEstagiario).ToString + ',' + Ord(trpVoluntario).ToString + ') and' +
    // func, membro diretoria, estagiario
      '       extract(day from current_date) = extract(day from Pessoa.Data_Nascimento) and' +
      '       extract(month from current_date) = extract(month from Pessoa.Data_Nascimento)';
    vaDataSet.Open;
    vaMsg := '';
    while not vaDataSet.Eof do
      begin
        if vaDataSetNotificacaoPessoa.FieldByName('Notificacao_Sistema').AsInteger = 1 then
          begin
            vaNotificacao := TNotificacao.Create;

            vaNotificacao.Id := vaDataSet.FieldByName('ID').AsInteger;
            vaNotificacao.Tipo := Ord(tnAniversario);

            vaPessoa := TPessoa.Create;
            vaPessoa.Id := vaDataSet.FieldByName('ID').AsInteger;
            vaPessoa.Nome := vaDataSet.FieldByName('NOME').AsString;
            vaPessoa.DataNascimento := vaDataSet.FieldByName('DATA_NASCIMENTO').AsDateTime;

            vaNotificacao.Info := vaPessoa;

            Result.Add(vaNotificacao);
          end;

        vaMsg := vaMsg + 'Hoje é aniversário do ' + vaDataSet.FieldByName('NOME').AsString + '. <br/><br/>';
        vaDataSet.next;
      end;

    if vaMsg <> '' then
      plEnviarEmails(tnAniversario, vaMsg);

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
            vaDataSetNotificacaoPessoa.SQL.Text := 'Select Notificacao_Pessoa.id_pessoa, ' +
              '        Notificacao_Pessoa.Notificacao_Sistema,' +
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
                vaTipoNotificacao := TTipoNotificacao(vaDataSetNotificacao.FieldByName('TIPO').AsInteger);
                case vaTipoNotificacao of
                  tnContaPagarVencendo:
                    plVerificarContaPagarVencendo;
                  tnContaReceberVencida:
                    plVerificarContaReceberVencida;
                  tnRubricaAtigindoSaldo:
                    plVerificarRubricas;
                  tnFundoFicandoSemSaldo:
                    plVerificarFundo;
                  tnAtividadeCadastrada, tnAtividadeAlterada, tnAtividadeVencendo:
                    plVerificarAtividade(vaTipoNotificacao);
                  tnSolicitacaoCompra:
                    plVerificarSolicitacaoCompra;
                  tnAniversario:
                    plVerificarAniversarios;
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

procedure TsmFuncoesSistema.ppuCriarAgendaPessoal(ipIdPessoa: integer);
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    var
      vaId: integer;
    begin
      ipDataSet.SQL.Text := 'select Pessoa.Nome, ' +
        '                           Agenda.Nome as Nome_Agenda, ' +
        '                           Agenda.Tipo ' +
        ' from Pessoa ' +
        ' left join Agenda_Pessoa on (Agenda_Pessoa.Id_Pessoa = Pessoa.Id) ' +
        ' left join Agenda on (Agenda.Id = Agenda_Pessoa.Id_Agenda) ' +
        ' where Pessoa.Id = :Id_Pessoa';
      ipDataSet.ParamByName('ID_PESSOA').AsInteger := ipIdPessoa;
      ipDataSet.Open;

      if not ipDataSet.Locate('TIPO', Ord(taPessoal), []) then
        begin
          vaId := fpuGetId('AGENDA');

          Connection.ExecSQL('insert into Agenda (Agenda.Id, Agenda.Nome, Agenda.Tipo, Agenda.ativo) ' +
            'values (:ID, :NOME, :TIPO,0)', [vaId, 'Agenda Pessoal - ' + ipDataSet.FieldByName('NOME').AsString, Ord(taPessoal)]);

          Connection.ExecSQL('insert into Agenda_Pessoa (Agenda_Pessoa.Id, Agenda_Pessoa.Id_Agenda, Agenda_Pessoa.Id_Pessoa) '+
            'values (next value for Gen_Agenda_Pessoa, :Id_Agenda, :Id_Pessoa)', [vaId, ipIdPessoa]);
        end;

    end);
end;

function TsmFuncoesSistema.fpuValidarTipoNotificacao(ipIdNotificacao,
  ipTipo: integer): Boolean;
begin
  Result := fprValidarCampoUnico('NOTIFICACAO', 'TIPO', ipIdNotificacao, ipTipo.ToString());
end;

end.
