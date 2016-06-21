


ALTER TABLE CONTA_PAGAR_VINCULO
    ADD ID_FUNDO_ALOCADO INTEGER;

alter table CONTA_PAGAR_VINCULO
alter ID position 1;

alter table CONTA_PAGAR_VINCULO
alter ID_CONTA_PAGAR position 2;

alter table CONTA_PAGAR_VINCULO
alter ID_ORGANIZACAO_ORIGEM position 3;

alter table CONTA_PAGAR_VINCULO
alter ID_FUNDO position 4;

alter table CONTA_PAGAR_VINCULO
alter ID_PROJETO_ORIGEM position 5;

alter table CONTA_PAGAR_VINCULO
alter ID_ATIVIDADE_ORIGEM position 6;

alter table CONTA_PAGAR_VINCULO
alter ID_RUBRICA_ORIGEM position 7;

alter table CONTA_PAGAR_VINCULO
alter ID_AREA_ATUACAO_ORIGEM position 8;

alter table CONTA_PAGAR_VINCULO
alter ID_PROJETO_ALOCADO position 9;

alter table CONTA_PAGAR_VINCULO
alter ID_ATIVIDADE_ALOCADO position 10;

alter table CONTA_PAGAR_VINCULO
alter ID_RUBRICA_ALOCADO position 11;

alter table CONTA_PAGAR_VINCULO
alter ID_AREA_ATUACAO_ALOCADO position 12;

alter table CONTA_PAGAR_VINCULO
alter ID_FUNDO_ALOCADO position 13;

alter table CONTA_PAGAR_VINCULO
alter VALOR position 14;



ALTER TABLE CONTA_PAGAR_VINCULO
ADD CONSTRAINT FK_CONTA_PAGAR_VINCULO_12
FOREIGN KEY (ID_FUNDO_ALOCADO)
REFERENCES FUNDO(ID)
ON UPDATE CASCADE;



SET TERM ^ ;

CREATE OR ALTER procedure Sp_Ajusta_Saldo_Especie (
    Id_Especie integer,
    Ip_Ajustar_Mudas integer,
    Ip_Ajustar_Sementes integer)
as
declare variable Va_Id_Especie integer;
declare variable Va_Qtde_Total_Sementes numeric(15,2);
declare variable Va_Qtde_Total_Mudas_Desenvolvimento integer;
declare variable Va_Qtde_Total_Mudas_Prontas integer;
declare variable Va_Qtde_Total_Sementes_Atual numeric(15,2);
declare variable Va_Qtde_Total_Mudas_Desenvolvimento_Atual integer;
declare variable Va_Qtde_Total_Mudas_Prontas_Atual integer;
declare variable Va_Qtde_Semente_Kilo integer;
declare variable Va_Qtde_Semente_Germinou integer;
declare variable Va_Qtde_Semente_Coletada numeric(15,2);
declare variable Va_Qtde_Inicial integer;
declare variable Va_Qtde_Classificada integer;
declare variable Va_Taxa_Classificacao numeric(15,2);
declare variable Va_Taxa_Germinacao numeric(15,2);
declare variable Va_Taxa_Descarte numeric(15,2);
declare variable Va_Qtde numeric(15,2);
declare variable Va_Todos smallint;
declare variable Va_Id integer;
declare variable Va_Status integer;
begin
  Va_Todos = 1;
  if (Id_Especie <> 0) then
  begin
    Va_Todos = 0;
  end

  for select Especie.Id,
             Especie.Qtde_Semente_Estoque,
             Especie.Qtde_Muda_Pronta,
             Especie.Qtde_Muda_Desenvolvimento
      from Especie
      where Especie.Id = :Id_Especie or (:Va_Todos = 1)
      into :Va_Id_Especie, :Va_Qtde_Total_Sementes_Atual, :Va_Qtde_Total_Mudas_Prontas_Atual,
           :Va_Qtde_Total_Mudas_Desenvolvimento_Atual
  do
  begin
    Va_Qtde_Total_Sementes = null;
    Va_Qtde_Total_Mudas_Desenvolvimento = null;
    Va_Qtde_Total_Mudas_Prontas = null;

--*******************************************LOTES DE SEMENTE*****************************************
    if ((Ip_Ajustar_Sementes is null) or (Ip_Ajustar_Sementes = 1)) then
    begin
      for select Lote_Semente.Id,
                 Especie.Qtde_Semente_Kilo,
                 Lote_Semente.Qtde as Qtde_Coletado,
                 (select first 1 Germinacao.Qtde_Germinada
                  from Germinacao
                  where Germinacao.Id_Lote_Semente = Lote_Semente.Id
                  order by Germinacao.Data desc) as Qtde_Germinada,

                 (Lote_Semente.Qtde - (coalesce((select sum(Saida_Item.Qtde)
                                                 from Saida_Item
                                                 where Saida_Item.Id_Lote_Semente = Lote_Semente.Id), 0) + coalesce((select sum(Semeadura.Qtde_Semeada)
                                                                                                                     from Semeadura
                                                                                                                     where Semeadura.Id_Lote_Semente = Lote_Semente.Id), 0))) as Saldo

          from Lote_Semente
          inner join Especie on (Especie.Id = Lote_Semente.Id_Especie)
          where Lote_Semente.Id_Especie = :Va_Id_Especie
          into :Va_Id, :Va_Qtde_Semente_Kilo, :Va_Qtde_Semente_Coletada, :Va_Qtde_Semente_Germinou, :Va_Qtde
      do
      begin
--Somando para ser utilizado no final
        Va_Qtde_Total_Sementes = coalesce(Va_Qtde_Total_Sementes, 0) + Va_Qtde;

        Va_Taxa_Germinacao = coalesce(trunc(:Va_Qtde_Semente_Coletada * :Va_Qtde_Semente_Kilo), 1);--1 para nao dar divisao por zero
        Va_Taxa_Germinacao = coalesce(:Va_Qtde_Semente_Germinou / :Va_Taxa_Germinacao * 100, 0);

        Va_Taxa_Descarte = 100 - :Va_Taxa_Germinacao;
        if (Va_Taxa_Descarte < 0) then
          Va_Taxa_Descarte = 0;

        update Lote_Semente
        set Lote_Semente.Qtde_Armazenada = :Va_Qtde,
            Lote_Semente.Taxa_Germinacao = :Va_Taxa_Germinacao,
            Lote_Semente.Taxa_Descarte = :Va_Taxa_Descarte
        where Lote_Semente.Id = :Va_Id;

      end
    end

--*************************************************LOTES DE MUDAS*******************************************************
    if ((Ip_Ajustar_Mudas is null) or (Ip_Ajustar_Mudas = 1)) then
    begin
      for select Lote_Muda.Id,
                 Lote_Muda.Qtde_Inicial,
                 coalesce((select first 1 classificacao.qtde
                  from classificacao
                  where classificacao.id_lote_muda = lote_muda.Id
                  order by classificacao.Data desc),Lote_Muda.qtde_inicial) as Qtde_Classificada,
                 Lote_Muda.Status,
                 (coalesce((select first 1 classificacao.qtde
                  from classificacao
                  where classificacao.id_lote_muda = lote_muda.Id
                  order by classificacao.Data desc), Lote_Muda.qtde_inicial) - (coalesce((select sum(Saida_Item.Qtde)
                                                                        from Saida_Item
                                                                        where Saida_Item.Id_Lote_Muda = :Va_Id), 0))) as Saldo
          from Lote_Muda
          where Lote_Muda.Id_Especie = :Va_Id_Especie
          into :Va_Id, :Va_Qtde_Inicial, :Va_Qtde_Classificada, :Va_Status, :Va_Qtde
      do
      begin
        if (Va_Qtde_Total_Mudas_Desenvolvimento is null) then
          Va_Qtde_Total_Mudas_Desenvolvimento = 0;

        if (Va_Qtde_Total_Mudas_Prontas is null) then
          Va_Qtde_Total_Mudas_Prontas = 0;

--Somando para ser utilizado no final
        if (Va_Status = 0) then
          Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento, 0) + Va_Qtde;
        else
          Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas, 0) + Va_Qtde;

        Va_Taxa_Classificacao = (:Va_Qtde_Classificada * 100) / coalesce(:Va_Qtde_Inicial, 1);
        update Lote_Muda
        set Lote_Muda.Saldo = :Va_Qtde,
            Lote_Muda.Taxa_Classificacao = coalesce(:Va_Taxa_Classificacao, 0)
        where Lote_Muda.Id = :Va_Id;

      end
    end

    if ((Va_Qtde_Total_Mudas_Desenvolvimento is null) and (ip_ajustar_mudas = 0)) then
      Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento_Atual, 0);

    if ((Va_Qtde_Total_Mudas_Prontas is null) and (ip_ajustar_mudas = 0)) then
      Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas_Atual, 0);

    if ((Va_Qtde_Total_Sementes is null) and (ip_ajustar_sementes = 0)) then
      Va_Qtde_Total_Sementes = coalesce(Va_Qtde_Total_Sementes_Atual, 0);

    update Especie
    set Especie.Qtde_Muda_Desenvolvimento = coalesce(:Va_Qtde_Total_Mudas_Desenvolvimento,0),
        Especie.Qtde_Muda_Pronta = coalesce(:Va_Qtde_Total_Mudas_Prontas,0),
        Especie.Qtde_Semente_Estoque = coalesce(:Va_Qtde_Total_Sementes,0)
    where Especie.Id = :Va_Id_Especie;

  end
  suspend;
end^

SET TERM ; ^



ALTER TABLE ESPECIE
    ADD QTDE_SEMENTE_TUBETE INTEGER;

COMMENT ON COLUMN ESPECIE.QTDE_SEMENTE_TUBETE IS
'Qtde de semente por tubete';


update especie set especie.qtde_semente_tubete = 1;

