

SET TERM ^ ;

CREATE OR ALTER procedure Sp_ajusta_saldo_especie (
    Id_especie integer,
    Ip_ajustar_mudas integer,
    Ip_ajustar_sementes integer)
as
declare variable Va_id_especie integer;
declare variable Va_qtde_total_sementes numeric(15,2);
declare variable Va_total_mudas_desenvolvimento integer;
declare variable Va_qtde_total_mudas_prontas integer;
declare variable Va_qtde_total_sementes_atual numeric(15,2);
declare variable Va_mudas_desenvolvimento_atual integer;
declare variable Va_mudas_prontas_atual integer;
declare variable Va_qtde_semente_kilo integer;
declare variable Va_qtde_semente_germinou integer;
declare variable Va_qtde_semente_coletada numeric(15,2);
declare variable Va_qtde_inicial integer;
declare variable Va_qtde_classificada integer;
declare variable Va_taxa_classificacao numeric(15,2);
declare variable Va_taxa_germinacao numeric(15,2);
declare variable Va_taxa_descarte numeric(15,2);
declare variable Va_qtde numeric(15,2);
declare variable Va_qtde_saida integer;
declare variable Va_saldo integer;
declare variable Va_todos smallint;
declare variable Va_id integer;
declare variable Va_status integer;
begin
  Va_todos = 1;
  if (Id_especie <> 0) then
  begin
    Va_todos = 0;
  end

  for select Especie.Id,
             Especie.Qtde_semente_estoque,
             Especie.Qtde_muda_pronta,
             Especie.Qtde_muda_desenvolvimento
      from Especie
      where Especie.Id = :Id_especie or (:Va_todos = 1)
      into :Va_id_especie, :Va_qtde_total_sementes_atual, :Va_mudas_prontas_atual,
           :Va_mudas_desenvolvimento_atual
  do
  begin
    Va_qtde_total_sementes = null;
    Va_total_mudas_desenvolvimento = null;
    Va_qtde_total_mudas_prontas = null;

    --*******************************************LOTES DE SEMENTE*****************************************
    if ((Ip_ajustar_sementes is null) or (Ip_ajustar_sementes = 1)) then
    begin
      for select Lote_semente.Id,
                 Especie.Qtde_semente_kilo,
                 Lote_semente.Qtde as Qtde_coletado,
                 (select first 1 Germinacao.Qtde_germinada
                  from Germinacao
                  where Germinacao.Id_lote_semente = Lote_semente.Id
                  order by Germinacao.Data desc) as Qtde_germinada,

                 (Lote_semente.Qtde - (coalesce((select sum(Saida_item.Qtde)
                                                 from Saida_item
                                                 where Saida_item.Id_lote_semente = Lote_semente.Id), 0) + coalesce((select sum(Semeadura.Qtde_semeada)
                                                                                                                     from Semeadura
                                                                                                                     where Semeadura.Id_lote_semente = Lote_semente.Id), 0))) as Saldo

          from Lote_semente
          inner join Especie on (Especie.Id = Lote_semente.Id_especie)
          where Lote_semente.Id_especie = :Va_id_especie
          into :Va_id, :Va_qtde_semente_kilo, :Va_qtde_semente_coletada, :Va_qtde_semente_germinou, :Va_qtde
      do
      begin
        --Somando para ser utilizado no final
        Va_qtde_total_sementes = coalesce(Va_qtde_total_sementes, 0) + Va_qtde;

        Va_taxa_germinacao = coalesce(trunc(:Va_qtde_semente_coletada * :Va_qtde_semente_kilo), 0);
        if (:Va_taxa_germinacao <> 0) then
          Va_taxa_germinacao = coalesce(:Va_qtde_semente_germinou / :Va_taxa_germinacao * 100, 0);

        Va_taxa_descarte = 100 - :Va_taxa_germinacao;
        if (Va_taxa_descarte < 0) then
          Va_taxa_descarte = 0;

        update Lote_semente
        set Lote_semente.Qtde_armazenada = :Va_qtde,
            Lote_semente.Taxa_germinacao = :Va_taxa_germinacao,
            Lote_semente.Taxa_descarte = :Va_taxa_descarte
        where Lote_semente.Id = :Va_id;

      end
    end

    --*************************************************LOTES DE MUDAS*******************************************************
    if ((Ip_ajustar_mudas is null) or (Ip_ajustar_mudas = 1)) then
    begin

      for select Lote_muda.Id,
                 Lote_muda.Qtde_inicial,
                 coalesce((select cast(sum(Classificacao.Qtde) as integer)
                           from Classificacao
                           where Classificacao.Id_lote_muda = Lote_muda.Id), 0) as Qtde_classificada,
                 Lote_muda.Status,
                 (coalesce((select sum(Saida_item.Qtde)
                            from Saida_item
                            where Saida_item.Id_lote_muda = Lote_muda.Id), 0)) as Qtde_saida
          from Lote_muda
          where Lote_muda.Id_especie = :Va_id_especie
          into :Va_id, :Va_qtde_inicial, :Va_qtde_classificada, :Va_status, :Va_qtde_saida
      do
      begin
        if (Va_total_mudas_desenvolvimento is null) then
          Va_total_mudas_desenvolvimento = 0;

        if (Va_qtde_total_mudas_prontas is null) then
          Va_qtde_total_mudas_prontas = 0;

        Va_saldo = Va_qtde_inicial - (Va_qtde_classificada + Va_qtde_saida);
        --Somando para ser utilizado no final
        if (Va_status = 0) then
          Va_total_mudas_desenvolvimento = coalesce(Va_total_mudas_desenvolvimento, 0) + Va_saldo;
        else
          Va_qtde_total_mudas_prontas = coalesce(Va_qtde_total_mudas_prontas, 0) + Va_saldo;

        Va_taxa_classificacao = ((Va_qtde_inicial - Va_qtde_classificada) / coalesce(Va_qtde_inicial, 1)) * 100;
        update Lote_muda
        set Lote_muda.Saldo = :Va_saldo,
            Lote_muda.Taxa_classificacao = coalesce(:Va_taxa_classificacao, 0)
        where Lote_muda.Id = :Va_id;

      end
    end

    if ((Va_total_mudas_desenvolvimento is null) and
        (Ip_ajustar_mudas = 0)) then
      Va_total_mudas_desenvolvimento = coalesce(Va_mudas_desenvolvimento_atual, 0);

    if ((Va_qtde_total_mudas_prontas is null) and
        (Ip_ajustar_mudas = 0)) then
      Va_qtde_total_mudas_prontas = coalesce(Va_mudas_prontas_atual, 0);

    if ((Va_qtde_total_sementes is null) and
        (Ip_ajustar_sementes = 0)) then
      Va_qtde_total_sementes = coalesce(Va_qtde_total_sementes_atual, 0);

    update Especie
    set Especie.Qtde_muda_desenvolvimento = coalesce(:Va_total_mudas_desenvolvimento, 0),
        Especie.Qtde_muda_pronta = coalesce(:Va_qtde_total_mudas_prontas, 0),
        Especie.Qtde_semente_estoque = coalesce(:Va_qtde_total_sementes, 0)
    where Especie.Id = :Va_id_especie;

    insert into log(log.Id, log.Id_tabela, log.Tabela, log.Operacao, log.Usuario, log.Data_hora)
    values (next value for Gen_log, :Va_id_especie, 'ESPECIE', 0, -1, current_timestamp);

  end
  suspend;
end^

SET TERM ; ^



SET TERM ^ ;

CREATE OR ALTER procedure Sp_ajusta_saldo_especie (
    Id_especie integer,
    Ip_ajustar_mudas integer,
    Ip_ajustar_sementes integer)
as
declare variable Va_id_especie integer;
declare variable Va_qtde_total_sementes numeric(15,2);
declare variable Va_total_mudas_desenvolvimento integer;
declare variable Va_qtde_total_mudas_prontas integer;
declare variable Va_total_sementes_atual numeric(15,2);
declare variable Va_mudas_desenvolvimento_atual integer;
declare variable Va_mudas_prontas_atual integer;
declare variable Va_qtde_semente_kilo integer;
declare variable Va_qtde_semente_germinou integer;
declare variable Va_qtde_semente_coletada numeric(15,2);
declare variable Va_qtde_inicial integer;
declare variable Va_qtde_classificada integer;
declare variable Va_taxa_classificacao numeric(15,2);
declare variable Va_taxa_germinacao numeric(15,2);
declare variable Va_taxa_descarte numeric(15,2);
declare variable Va_qtde numeric(15,2);
declare variable Va_qtde_saida integer;
declare variable Va_saldo integer;
declare variable Va_todos smallint;
declare variable Va_id integer;
declare variable Va_status integer;
begin
  Va_todos = 1;
  if (Id_especie <> 0) then
  begin
    Va_todos = 0;
  end

  for select Especie.Id,
             Especie.Qtde_semente_estoque,
             Especie.Qtde_muda_pronta,
             Especie.Qtde_muda_desenvolvimento
      from Especie
      where Especie.Id = :Id_especie or (:Va_todos = 1)
      into :Va_id_especie, :Va_total_sementes_atual, :Va_mudas_prontas_atual,
           :Va_mudas_desenvolvimento_atual
  do
  begin
    Va_qtde_total_sementes = null;
    Va_total_mudas_desenvolvimento = null;
    Va_qtde_total_mudas_prontas = null;

    --*******************************************LOTES DE SEMENTE*****************************************
    if ((Ip_ajustar_sementes is null) or (Ip_ajustar_sementes = 1)) then
    begin
      for select Lote_semente.Id,
                 Especie.Qtde_semente_kilo,
                 Lote_semente.Qtde as Qtde_coletado,
                 (select first 1 Germinacao.Qtde_germinada
                  from Germinacao
                  where Germinacao.Id_lote_semente = Lote_semente.Id
                  order by Germinacao.Data desc) as Qtde_germinada,

                 (Lote_semente.Qtde - (coalesce((select sum(Saida_item.Qtde)
                                                 from Saida_item
                                                 where Saida_item.Id_lote_semente = Lote_semente.Id), 0) + coalesce((select sum(Semeadura.Qtde_semeada)
                                                                                                                     from Semeadura
                                                                                                                     where Semeadura.Id_lote_semente = Lote_semente.Id), 0))) as Saldo

          from Lote_semente
          inner join Especie on (Especie.Id = Lote_semente.Id_especie)
          where Lote_semente.Id_especie = :Va_id_especie
          into :Va_id, :Va_qtde_semente_kilo, :Va_qtde_semente_coletada, :Va_qtde_semente_germinou, :Va_qtde
      do
      begin
        --Somando para ser utilizado no final
        Va_qtde_total_sementes = coalesce(Va_qtde_total_sementes, 0) + Va_qtde;

        Va_taxa_germinacao = coalesce(trunc(:Va_qtde_semente_coletada * :Va_qtde_semente_kilo), 0);
        if (:Va_taxa_germinacao <> 0) then
          Va_taxa_germinacao = coalesce(:Va_qtde_semente_germinou / :Va_taxa_germinacao * 100, 0);

        Va_taxa_descarte = 100 - :Va_taxa_germinacao;
        if (Va_taxa_descarte < 0) then
          Va_taxa_descarte = 0;

        update Lote_semente
        set Lote_semente.Qtde_armazenada = :Va_qtde,
            Lote_semente.Taxa_germinacao = :Va_taxa_germinacao,
            Lote_semente.Taxa_descarte = :Va_taxa_descarte
        where Lote_semente.Id = :Va_id;

      end
    end

    --*************************************************LOTES DE MUDAS*******************************************************
    if ((Ip_ajustar_mudas is null) or (Ip_ajustar_mudas = 1)) then
    begin

      for select Lote_muda.Id,
                 Lote_muda.Qtde_inicial,
                 coalesce((select cast(sum(Classificacao.Qtde) as integer)
                           from Classificacao
                           where Classificacao.Id_lote_muda = Lote_muda.Id), 0) as Qtde_classificada,
                 Lote_muda.Status,
                 (coalesce((select sum(Saida_item.Qtde)
                            from Saida_item
                            where Saida_item.Id_lote_muda = Lote_muda.Id), 0)) as Qtde_saida
          from Lote_muda
          where Lote_muda.Id_especie = :Va_id_especie
          into :Va_id, :Va_qtde_inicial, :Va_qtde_classificada, :Va_status, :Va_qtde_saida
      do
      begin
        if (Va_total_mudas_desenvolvimento is null) then
          Va_total_mudas_desenvolvimento = 0;

        if (Va_qtde_total_mudas_prontas is null) then
          Va_qtde_total_mudas_prontas = 0;

        Va_saldo = Va_qtde_inicial - (Va_qtde_classificada + Va_qtde_saida);
        --Somando para ser utilizado no final
        if (Va_status = 0) then
          Va_total_mudas_desenvolvimento = coalesce(Va_total_mudas_desenvolvimento, 0) + Va_saldo;
        else
          Va_qtde_total_mudas_prontas = coalesce(Va_qtde_total_mudas_prontas, 0) + Va_saldo;

        Va_taxa_classificacao = ((Va_qtde_inicial - Va_qtde_classificada)*100) / coalesce(Va_qtde_inicial, 1);
        update Lote_muda
        set Lote_muda.Saldo = :Va_saldo,
            Lote_muda.Taxa_classificacao = coalesce(:Va_taxa_classificacao, 0)
        where Lote_muda.Id = :Va_id;

      end
    end

    if ((Va_total_mudas_desenvolvimento is null) and
        (Ip_ajustar_mudas = 0)) then
      Va_total_mudas_desenvolvimento = coalesce(Va_mudas_desenvolvimento_atual, 0);

    if ((Va_qtde_total_mudas_prontas is null) and
        (Ip_ajustar_mudas = 0)) then
      Va_qtde_total_mudas_prontas = coalesce(Va_mudas_prontas_atual, 0);

    if ((Va_qtde_total_sementes is null) and
        (Ip_ajustar_sementes = 0)) then
      Va_qtde_total_sementes = coalesce(Va_total_sementes_atual, 0);

    update Especie
    set Especie.Qtde_muda_desenvolvimento = coalesce(:Va_total_mudas_desenvolvimento, 0),
        Especie.Qtde_muda_pronta = coalesce(:Va_qtde_total_mudas_prontas, 0),
        Especie.Qtde_semente_estoque = coalesce(:Va_qtde_total_sementes, 0)
    where Especie.Id = :Va_id_especie;

    insert into log(log.Id, log.Id_tabela, log.Tabela, log.Operacao, log.Usuario, log.Data_hora)
    values (next value for Gen_log, :Va_id_especie, 'ESPECIE', 0, -1, current_timestamp);

  end
  suspend;
end^

SET TERM ; ^





COMMENT ON COLUMN MIX_MUDA.ID_CLIENTE IS
'Se for um mix de saida para um projeto, entao tem que cadastrar o projeto como sendo um cliente.';



ALTER TABLE TIPO_ESPECIE
    ADD NATIVA D_BOOLEAN;

COMMENT ON COLUMN TIPO_ESPECIE.NATIVA IS
'Informa se esse tipo e nativo do cerrado.
0|null - Nao
1 - Sim';

UPDATE tipo_especie SET tipo_especie.nativa = 1 where tipo_especie.id in (1,4)

