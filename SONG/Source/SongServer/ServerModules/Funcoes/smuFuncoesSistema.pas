unit smuFuncoesSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuFuncoesBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery, aduna_ds_list,
  uTypes, uEnviarEmail, uUtils, System.Generics.Collections, dmuPrincipal;

type
  TsmFuncoesSistema = class(TsmFuncoesBasico)
    qNotificacao_Pessoa: TRFQuery;
    qNotificacao_PessoaID_PESSOA: TIntegerField;
    qNotificacao_PessoaNOTIFICACAO_SISTEMA: TSmallintField;
    qNotificacao_PessoaNOTIFICACAO_EMAIL: TSmallintField;
    qNotificacao_PessoaEMAIL: TStringField;
  private
    function fpvVerificarNotificacoesAgendaPessoal(ipIdPessoa: integer; ipNotificacaoEmail, ipNotificacaoSistema: Boolean;
      ipDataSetNotificacao, ipDataSetNotificacaoPessoa: TRFQuery): TList<TNotificacao>;
    procedure ppvEnviarEmailTodosConfigurados(ipTipo: TTipoNotificacao;
      ipMsg: String; ipDataSetNoficiacaoPessoa: TRFQuery);
    { Private declarations }
  public
    function fpuValidarTipoNotificacao(ipIdNotificacao, ipTipo: integer): Boolean;
    /// Verifica toda as notificações cadastradas
    /// ipId - Se diferente de -1 significa que é para gerar a notificacação somente desse ID
    /// ipIdPessoa - Se diferente de -1 significa que é para verificar somente as notificaões configuradas para essa pessoa
    /// ipTipo - Tipo da Notificação a ser verificada. Informe -1 para verificar todas.
    function fpuVerificarNotificacoes(ipId, ipIdPessoa: integer; ipTipo: integer; ipNotificacaoEmail, ipNotificacaoSistema: Boolean)
      : TadsObjectlist<TNotificacao>;
    procedure ppuCriarAgendaPessoal(ipIdPessoa: integer);
  end;

var
  smFuncoesSistema: TsmFuncoesSistema;

implementation

uses
  smuFuncoesEstoque;

{$R *.dfm}

{ TsmFuncoesSistema }

procedure TsmFuncoesSistema.ppvEnviarEmailTodosConfigurados(ipTipo: TTipoNotificacao; ipMsg: String; ipDataSetNoficiacaoPessoa: TRFQuery);
begin
  ipDataSetNoficiacaoPessoa.First;
  while not ipDataSetNoficiacaoPessoa.Eof do
    begin
      if (ipDataSetNoficiacaoPessoa.FieldByName('Notificacao_Email').AsInteger = 1) and
        (ipDataSetNoficiacaoPessoa.FieldByName('Email').AsString <> '') then
        begin
          ppuEnviarEmail(TiposNotificacao[ipTipo], ipMsg, ipDataSetNoficiacaoPessoa.FieldByName('Email').AsString,'',nil);
        end;
      ipDataSetNoficiacaoPessoa.next;
    end;

end;

function TsmFuncoesSistema.fpuVerificarNotificacoes(ipId, ipIdPessoa: integer; ipTipo: integer; ipNotificacaoEmail, ipNotificacaoSistema: Boolean)
  : TadsObjectlist<TNotificacao>;
var
  vaDataSetNotificacao, vaDataSet: TRFQuery;
  vaNotificacao: TNotificacao;
  vaNotificacoes: TList<TNotificacao>;
  vaTipoNotificacao: TTipoNotificacao;
  vaMsg: String;

  procedure plEnviarEmails(ipTipo: TTipoNotificacao; ipMsg: String);
  begin
    if ipNotificacaoEmail then
      begin
        qNotificacao_Pessoa.First;
        while not qNotificacao_Pessoa.Eof do
          begin
            if (qNotificacao_Pessoa.FieldByName('Notificacao_Email').AsInteger = 1) and
              (qNotificacao_Pessoa.FieldByName('Email').AsString <> '') then
              begin
                ppuEnviarEmail(TiposNotificacao[ipTipo], ipMsg, qNotificacao_Pessoa.FieldByName('Email').AsString,'',nil);
              end;
            qNotificacao_Pessoa.next;
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
        if qNotificacao_Pessoa.FieldByName('Notificacao_Sistema').AsInteger = 1 then
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
        if qNotificacao_Pessoa.FieldByName('Notificacao_Sistema').AsInteger = 1 then
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
        if qNotificacao_Pessoa.FieldByName('Notificacao_Sistema').AsInteger = 1 then
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
        if qNotificacao_Pessoa.FieldByName('Notificacao_Sistema').AsInteger = 1 then
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
      '       Coalesce(Projeto.Nome,''SEM PROJETO'') as Nome_Projeto' +
      ' from Atividade' +
      ' left join Projeto on (Atividade.Id_Projeto = Projeto.Id) ';
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
        else // atividade cadastrada
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
            '       Solicitante.email as email_solicitante, ' +
            '       Atividade.Id_Responsavel,' +
            '       Responsavel.email as email_responsavel, ' +
            '       Atividade_pessoa.id_pessoa as ID_PESSOA_ENVOLVIDA, ' +
            '       Envolvido.email as email_envolvido ' +
            ' from atividade' +
            ' left join atividade_pessoa on (atividade.id = atividade_pessoa.id_pessoa)' +
            ' left join pessoa solicitante on (solicitante.id = atividade.id_solicitante) ' +
            ' left join pessoa responsavel on (responsavel.id = atividade.id_responsavel) ' +
            ' left join pessoa envolvido on (envolvido.id = Atividade_pessoa.id_pessoa) ' +
            ' where atividade.id = :ID';

          while not vaDataSet.Eof do
            begin
              vaDataSetEnvolvidos.close;
              vaDataSetEnvolvidos.ParamByName('ID').AsInteger := vaDataSet.FieldByName('ID').AsInteger;
              vaDataSetEnvolvidos.Open();

              if (vaDataSetEnvolvidos.Locate('ID_SOLICITANTE', ipIdPessoa, []) or
                vaDataSetEnvolvidos.Locate('ID_RESPONSAVEL', ipIdPessoa, []) or
                vaDataSetEnvolvidos.Locate('ID_PESSOA_ENVOLVIDA', ipIdPessoa, [])) or

                ((ipIdPessoa = qNotificacao_Pessoa.FieldByName('ID_PESSOA').AsInteger) and
                (qNotificacao_Pessoa.FieldByName('Notificacao_Sistema').AsInteger = 1)) then
                begin
                  // Notificacao de alteracao de atividade sempre serao enviadas aos responsaveis e envolvidos
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

              if ipTipoNotificacao = tnAtividadeAlterada then
                begin
                  if not vaDataSetEnvolvidos.FieldByName('ID_SOLICITANTE').IsNull then
                    begin
                      if not qNotificacao_Pessoa.Locate('ID_PESSOA', vaDataSetEnvolvidos.FieldByName('ID_SOLICITANTE').AsInteger, []) then
                        begin
                          qNotificacao_Pessoa.Append;
                          qNotificacao_Pessoa.FieldByName('ID_PESSOA').AsInteger := vaDataSetEnvolvidos.FieldByName('ID_SOLICITANTE').AsInteger;
                          qNotificacao_Pessoa.FieldByName('Notificacao_Email').AsInteger := 1;
                          qNotificacao_Pessoa.FieldByName('Notificacao_Sistema').AsInteger := 1;
                          qNotificacao_Pessoa.FieldByName('EMAIL').AsString := vaDataSetEnvolvidos.FieldByName('EMAIL_SOLICITANTE').AsString;
                          qNotificacao_Pessoa.Post;
                        end;
                    end;
                  if not vaDataSetEnvolvidos.FieldByName('ID_RESPONSAVEL').IsNull then
                    begin
                      if not qNotificacao_Pessoa.Locate('ID_PESSOA', vaDataSetEnvolvidos.FieldByName('ID_RESPONSAVEL').AsInteger, []) then
                        begin
                          qNotificacao_Pessoa.Append;
                          qNotificacao_Pessoa.FieldByName('ID_PESSOA').AsInteger := vaDataSetEnvolvidos.FieldByName('ID_SOLICITANTE').AsInteger;
                          qNotificacao_Pessoa.FieldByName('Notificacao_Email').AsInteger := 1;
                          qNotificacao_Pessoa.FieldByName('Notificacao_Sistema').AsInteger := 1;
                          qNotificacao_Pessoa.FieldByName('EMAIL').AsString := vaDataSetEnvolvidos.FieldByName('EMAIL_RESPONSAVEL').AsString;
                          qNotificacao_Pessoa.Post;
                        end;
                    end;

                  vaDataSetEnvolvidos.First;
                  while not vaDataSetEnvolvidos.Eof do
                    begin
                      if not vaDataSetEnvolvidos.FieldByName('ID_PESSOA_ENVOLVIDA').IsNull then
                        begin
                          if not qNotificacao_Pessoa.Locate('ID_PESSOA', vaDataSetEnvolvidos.FieldByName('ID_PESSOA_ENVOLVIDA').AsInteger, []) then
                            begin
                              qNotificacao_Pessoa.Append;
                              qNotificacao_Pessoa.FieldByName('ID_PESSOA').AsInteger := vaDataSetEnvolvidos.FieldByName('ID_PESSOA_ENVOLVIDA').AsInteger;
                              qNotificacao_Pessoa.FieldByName('Notificacao_Email').AsInteger := 1;
                              qNotificacao_Pessoa.FieldByName('Notificacao_Sistema').AsInteger := 1;
                              qNotificacao_Pessoa.FieldByName('EMAIL').AsString := vaDataSetEnvolvidos.FieldByName('EMAIL_ENVOLVIDO').AsString;
                              qNotificacao_Pessoa.Post;
                            end;
                        end;
                      vaDataSetEnvolvidos.next;
                    end;
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
      '       Solicitacao_Compra.Motivo_Negacao, ' +
      '       list(coalesce(Especie.Nome, Item.Nome), '', '') as Itens' +
      ' from Solicitacao_Compra' +
      ' inner join Solicitacao_Compra_Item on (Solicitacao_Compra.Id = Solicitacao_Compra_Item.Id_Solicitacao_Compra)' +
      ' inner join pessoa on (pessoa.id = Solicitacao_Compra.id_pessoa_solicitou) ' +
      ' inner join Item on (Item.Id = Solicitacao_Compra_Item.Id_Item)' +
      ' left join Especie on (Especie.Id = Solicitacao_Compra_Item.Id_Especie)' +
      ' where (((Solicitacao_Compra.Status = 0) and' +
      '         (dateadd(day, :Dias, Solicitacao_Compra.Data) >= current_date)) or ' +
      '       ((Solicitacao_Compra.Status <> 0) and' +
      '        (dateadd(day, :Dias, Solicitacao_Compra.Data_Analise) >= current_date)))';

    if ipId <> -1 then
      vaDataSet.SQL.Text := vaDataSet.SQL.Text + ' and (solicitacao_compra.id = :ID) ';

    vaDataSet.SQL.Text := vaDataSet.SQL.Text +
      ' group by Solicitacao_Compra.id, Solicitacao_Compra.Data, Pessoa.nome, ' +
      '          Solicitacao_Compra.Status, Solicitacao_Compra.Data_Analise, Solicitacao_Compra.Motivo_Negacao ';
    vaDataSet.ParamByName('DIAS').AsInteger := vaDataSetNotificacao.FieldByName('TEMPO_ANTECEDENCIA').AsInteger;
    if ipId <> -1 then
      vaDataSet.ParamByName('ID').AsInteger := ipId;
    vaDataSet.Open;
    vaMsg := '';
    while not vaDataSet.Eof do
      begin
        if ipNotificacaoSistema and (qNotificacao_Pessoa.FieldByName('Notificacao_Sistema').AsInteger = 1) then
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
          vaMsg := vaMsg + 'A solicitação dos itens ' + vaDataSet.FieldByName('ITENS').AsString + ' foi negada pelo seguinte motivo: <br/>' +
            vaDataSet.FieldByName('MOTIVO_NEGACAO').AsString + ' <br/><br/>';

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
        if qNotificacao_Pessoa.FieldByName('Notificacao_Sistema').AsInteger = 1 then
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
  vaDataSetNotificacao.CachedUpdates := true;

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
            qNotificacao_Pessoa.close;
            qNotificacao_Pessoa.SQL.Text := 'Select Notificacao_Pessoa.id_pessoa, ' +
              '        Notificacao_Pessoa.Notificacao_Sistema,' +
              '        Notificacao_Pessoa.Notificacao_Email,' +
              '        Pessoa.Email ' +
              ' from notificacao_pessoa ' +
              ' inner join Pessoa on (Pessoa.Id = Notificacao_Pessoa.Id_Pessoa) ' +
              ' where ((notificacao_pessoa.id_pessoa = :ID_PESSOA) or (:ID_PESSOA IS NULL)) and' +
              '       notificacao_pessoa.id_notificacao = :ID_NOTIFICACAO';
            qNotificacao_Pessoa.ParamByName('ID_NOTIFICACAO').AsInteger := vaDataSetNotificacao.FieldByName('ID').AsInteger;
            if ipIdPessoa <> -1 then
              qNotificacao_Pessoa.ParamByName('ID_PESSOA').AsInteger := ipIdPessoa
            else
              qNotificacao_Pessoa.ParamByName('ID_PESSOA').Clear;

            qNotificacao_Pessoa.Open;

            vaTipoNotificacao := TTipoNotificacao(vaDataSetNotificacao.FieldByName('TIPO').AsInteger);
            if ((not qNotificacao_Pessoa.Eof) and
              ((qNotificacao_Pessoa.FieldByName('Notificacao_Email').AsInteger = 1) or
              (qNotificacao_Pessoa.FieldByName('Notificacao_Sistema').AsInteger = 1))) or
              (vaTipoNotificacao = tnAtividadeAlterada) then // atividade alterada sempre vai avisar os envolvidos mesmo q nao tenha nenhum usuario configurado
              begin

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
                  tnEventoAgenda:
                    begin
                      vaNotificacoes := fpvVerificarNotificacoesAgendaPessoal(ipIdPessoa, ipNotificacaoEmail, ipNotificacaoSistema,
                        vaDataSetNotificacao, qNotificacao_Pessoa);

                      if Assigned(vaNotificacoes) then
                        begin
                          Result.AddRange(vaNotificacoes);
                          vaNotificacoes.Free;
                        end;
                    end;
                end;
              end;
          end;
        vaDataSetNotificacao.next;
      end;
  finally
    if qNotificacao_Pessoa.ChangeCount > 0 then
      qNotificacao_Pessoa.CancelUpdates;

    qNotificacao_Pessoa.close;

    vaDataSetNotificacao.close;
    vaDataSetNotificacao.Free;

    vaDataSet.close;
    vaDataSet.Free;
  end;

  if not ipNotificacaoSistema then
    FreeAndNil(Result);
end;

function TsmFuncoesSistema.fpvVerificarNotificacoesAgendaPessoal(ipIdPessoa: integer; ipNotificacaoEmail, ipNotificacaoSistema: Boolean;
  ipDataSetNotificacao, ipDataSetNotificacaoPessoa: TRFQuery)
  : TList<TNotificacao>;
var
  vaDataSetAgenda, vaDataSetAgendaRegistro, vaDataSetAgendaPessoa: TRFQuery;
  vaNotificacao: TNotificacao;
  vaAgenda: TAgenda;
  vaEvento: TEventoAgenda;
  vaMsg: String;
begin
  Result := nil;
  if ipNotificacaoSistema then
    Result := TList<TNotificacao>.Create;

  pprCriarDataSet(vaDataSetAgenda);
  pprCriarDataSet(vaDataSetAgendaRegistro);
  pprCriarDataSet(vaDataSetAgendaPessoa);
  try
    vaDataSetAgendaPessoa.SQL.Text := 'Select agenda_pessoa.id ' +
      '                                   from agenda_pessoa' +
      '                                where agenda_pessoa.id_agenda = :ID_AGENDA and' +
      '                                      agenda_pessoa.id_pessoa = :ID_PESSOA';

    vaDataSetAgendaRegistro.SQL.Text := ' select Agenda_Registro.Id, ' +
      '       Agenda_Registro.Titulo,' +
      '       Agenda_Registro.Data_Inicio,' +
      '       Agenda_Registro.Data_Fim' +
      ' from Agenda_Registro' +
      ' where Agenda_Registro.id_agenda = :ID_AGENDA and ' +
      '       ((Agenda_Registro.Event_Type = 1) or ' +
      '        (current_date between dateadd(day, :Dias, Agenda_Registro.Data_Inicio) and Agenda_Registro.Data_fim)) ' +
      ' UNION ALL ' +
      ' select cast(Atividade.Id*-1 as integer) as ID,' +
      '        Atividade.Nome as titulo,' +
      '        Atividade.Data_Inicial as data_inicio,' +
      '        Atividade.Data_Final as data_fim' +
      ' from Agenda' +
      ' inner join Atividade on (Atividade.Id_Projeto = Agenda.Id_Projeto)' +
      ' where Agenda.Id = :ID_AGENDA and' +
      '       (current_date between dateadd(day, :Dias, Atividade.Data_Inicial) and Atividade.Data_Final) ';

    vaDataSetAgenda.SQL.Text := 'select Agenda.Id,' +
      '       Agenda.Nome, ' +
      '       Agenda.tipo ' +
      ' from Agenda' +
      ' where ((:Id_Pessoa is null) or ((select count(*)' +
      '                                 from Agenda_Pessoa' +
      '                                 where Agenda_Pessoa.Id_Agenda = Agenda.Id and' +
      '                                       Agenda_Pessoa.Id_Pessoa = :Id_Pessoa) > 0))';
    if ipIdPessoa <> -1 then
      vaDataSetAgenda.ParamByName('ID_PESSOA').AsInteger := ipIdPessoa
    else
      vaDataSetAgenda.ParamByName('ID_PESSOA').Clear;
    vaDataSetAgenda.Open;
    while not vaDataSetAgenda.Eof do
      begin
        vaDataSetAgendaRegistro.close;
        vaDataSetAgendaRegistro.ParamByName('ID_AGENDA').AsInteger := vaDataSetAgenda.FieldByName('ID').AsInteger;
        vaDataSetAgendaRegistro.ParamByName('DIAS').AsInteger := ipDataSetNotificacao.FieldByName('Tempo_Antecedencia').AsInteger * -1;
        vaDataSetAgendaRegistro.Open();

        if not vaDataSetAgendaRegistro.Eof then
          begin
            if ipNotificacaoSistema and (ipDataSetNotificacaoPessoa.FieldByName('NOTIFICACAO_SISTEMA').AsInteger = 1) then
              begin
                vaNotificacao := TNotificacao.Create;
                vaNotificacao.Id := vaDataSetAgenda.FieldByName('ID').AsInteger;
                vaNotificacao.Tipo := Ord(tnEventoAgenda);

                vaAgenda := TAgenda.Create;
                vaAgenda.Id := vaDataSetAgenda.FieldByName('ID').AsInteger;
                vaAgenda.Nome := vaDataSetAgenda.FieldByName('NOME').AsString;

                while not vaDataSetAgendaRegistro.Eof do
                  begin
                    vaEvento := TEventoAgenda.Create;
                    vaEvento.Id := vaDataSetAgendaRegistro.FieldByName('ID').AsInteger;
                    vaEvento.Titulo := vaDataSetAgendaRegistro.FieldByName('TITULO').AsString;
                    vaEvento.DataHoraInicio := vaDataSetAgendaRegistro.FieldByName('DATA_INICIO').AsDateTime;
                    vaEvento.DataHoraFim := vaDataSetAgendaRegistro.FieldByName('DATA_FIM').AsDateTime;
                    vaAgenda.Eventos.Add(vaEvento);

                    vaDataSetAgendaRegistro.next;
                  end;

                vaNotificacao.Info := vaAgenda;
                Result.Add(vaNotificacao);
              end;

            if ipNotificacaoEmail then
              begin
                vaMsg := 'Os seguintes eventos da agenda <b>' + vaDataSetAgenda.FieldByName('NOME').AsString + '</b> estão próximos: ' +
                  coQuebraLinhaHtml;
                vaDataSetAgendaRegistro.First;
                while not vaDataSetAgendaRegistro.Eof do
                  begin
                    vaMsg := vaMsg + vaDataSetAgendaRegistro.FieldByName('TITULO').AsString + coQuebraLinhaHtml;
                    vaMsg := vaMsg + 'De ' + vaDataSetAgendaRegistro.FieldByName('DATA_INICIO').AsString + ' até ' +
                      vaDataSetAgendaRegistro.FieldByName('DATA_FIM').AsString + coQuebraLinhaHtml + coQuebraLinhaHtml;

                    vaDataSetAgendaRegistro.next;
                  end;

                ipDataSetNotificacaoPessoa.First;
                while not ipDataSetNotificacaoPessoa.Eof do
                  begin
                    if (ipDataSetNotificacaoPessoa.FieldByName('Notificacao_Email').AsInteger = 1) and
                      (ipDataSetNotificacaoPessoa.FieldByName('Email').AsString <> '') then
                      begin
                        // se diferente de -1 significa que no proprio select da agenda ja foi feito o filtro para garantir
                        // que somente pessoas autorizadas vejam o agendamento
                        if ipIdPessoa = -1 then
                          begin
                            vaDataSetAgendaPessoa.close;
                            vaDataSetAgendaPessoa.ParamByName('ID_AGENDA').AsInteger := vaDataSetAgenda.FieldByName('ID').AsInteger;
                            vaDataSetAgendaPessoa.ParamByName('ID_PESSOA').AsInteger := ipDataSetNotificacaoPessoa.FieldByName('ID_PESSOA').AsInteger;
                            vaDataSetAgendaPessoa.Open;
                          end;

                        // se for o server q estiver solicitanto o envio de email eu irei enviar somente os eventos das agendas
                        // publicas e da propria agenda pessoal
                        if (ipIdPessoa <> -1) or (not vaDataSetAgendaPessoa.Eof) then
                          ppuEnviarEmail(TiposNotificacao[tnEventoAgenda], vaMsg, ipDataSetNotificacaoPessoa.FieldByName('Email').AsString,'',nil);
                      end;
                    ipDataSetNotificacaoPessoa.next;
                  end;

              end;

          end;

        vaDataSetAgenda.next;
      end;

  finally
    vaDataSetAgenda.close;
    vaDataSetAgenda.Free;

    vaDataSetAgendaRegistro.close;
    vaDataSetAgendaRegistro.Free;

    vaDataSetAgendaPessoa.close;
    vaDataSetAgendaPessoa.Free;
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
            'values (:ID, :NOME, :TIPO,0)', [vaId, 'Agenda Pessoal', Ord(taPessoal)]);

          Connection.ExecSQL
            ('insert into Agenda_Pessoa (Agenda_Pessoa.Id, Agenda_Pessoa.Id_Agenda, Agenda_Pessoa.Id_Pessoa, Agenda_Pessoa.Somente_Visualizacao) ' +
            'values (next value for Gen_Agenda_Pessoa, :Id_Agenda, :Id_Pessoa, 0)', [vaId, ipIdPessoa]);

          if Connection.InTransaction then
            Connection.Commit;
        end;

    end);
end;

function TsmFuncoesSistema.fpuValidarTipoNotificacao(ipIdNotificacao,
  ipTipo: integer): Boolean;
begin
  Result := fprValidarCampoUnico('NOTIFICACAO', 'TIPO', ipIdNotificacao, ipTipo.ToString());
end;

end.
