


CREATE TABLE MIX_MUDA (
    ID INTEGER NOT NULL,
    ID_CLIENTE INTEGER NOT NULL,
    ID_PESSOA_RESPONSAVEL INTEGER NOT NULL,
    DATA DATE NOT NULL,
    QTDE_MUDA INTEGER NOT NULL,
    QTDE_MUDA_ROCAMBOLE INTEGER NOT NULL,
    DESCRICAO D_DESCRICAO);

ALTER TABLE MIX_MUDA
ADD CONSTRAINT PK_MIX_MUDA
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_MIX_MUDA;



COMMENT ON TABLE MIX_MUDA IS 'Mix de mudas a serem despechadas para o campo para reflorestamento';



ALTER TABLE MIX_MUDA
ADD CONSTRAINT FK_MIX_MUDA_1
FOREIGN KEY (ID_CLIENTE)
REFERENCES FIN_FOR_CLI(ID)
ON UPDATE CASCADE;

ALTER TABLE MIX_MUDA
ADD CONSTRAINT FK_MIX_MUDA_2
FOREIGN KEY (ID_PESSOA_RESPONSAVEL)
REFERENCES PESSOA(ID)
ON UPDATE CASCADE;



COMMENT ON COLUMN MIX_MUDA.QTDE_MUDA IS
'Quantidade de mudas que serao despachadas';



COMMENT ON COLUMN MIX_MUDA.QTDE_MUDA_ROCAMBOLE IS
'Quantidade de mudas por rocambole (Normalmente sao 30)';



CREATE TABLE MIX_MUDA_ESPECIE (
    ID INTEGER NOT NULL,
    ID_MIX_MUDA INTEGER NOT NULL,
    ID_ESPECIE INTEGER NOT NULL);

ALTER TABLE MIX_MUDA_ESPECIE
ADD CONSTRAINT PK_MIX_MUDA_ESPECIE
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_MIX_MUDA_ESPECIE;



ALTER TABLE MIX_MUDA_ESPECIE
ADD CONSTRAINT FK_MIX_MUDA_ESPECIE_1
FOREIGN KEY (ID_MIX_MUDA)
REFERENCES MIX_MUDA(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE MIX_MUDA_ESPECIE
ADD CONSTRAINT FK_MIX_MUDA_ESPECIE_2
FOREIGN KEY (ID_ESPECIE)
REFERENCES ESPECIE(ID)
ON UPDATE CASCADE;



CREATE TABLE MIX_MUDA_ESPECIE_CANTEIRO (
    ID INTEGER NOT NULL,
    ID_MIX_MUDA_ESPECIE INTEGER NOT NULL,
    ID_CANTEIRO INTEGER NOT NULL,
    ID_LOTE_MUDA INTEGER NOT NULL,
    QTDE INTEGER NOT NULL);

ALTER TABLE MIX_MUDA_ESPECIE_CANTEIRO
ADD CONSTRAINT PK_MIX_MUDA_ESPECIE_CANTEIRO
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_MIX_MUDA_ESPECIE_CANTEIRO;



ALTER TABLE MIX_MUDA_ESPECIE_CANTEIRO
ADD CONSTRAINT FK_MIX_MUDA_ESPECIE_CANTEIRO_1
FOREIGN KEY (ID_MIX_MUDA_ESPECIE)
REFERENCES MIX_MUDA_ESPECIE(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE MIX_MUDA_ESPECIE_CANTEIRO
ADD CONSTRAINT FK_MIX_MUDA_ESPECIE_CANTEIRO_2
FOREIGN KEY (ID_CANTEIRO)
REFERENCES CANTEIRO(ID)
ON UPDATE CASCADE;

ALTER TABLE MIX_MUDA_ESPECIE_CANTEIRO
ADD CONSTRAINT FK_MIX_MUDA_ESPECIE_CANTEIRO_3
FOREIGN KEY (ID_LOTE_MUDA)
REFERENCES LOTE_MUDA(ID)
ON UPDATE CASCADE;



CREATE TABLE MIX_MUDA_ESPECIE_LOTE (
    ID INTEGER NOT NULL,
    ID_MIX_MUDA_ESPCECIE INTEGER NOT NULL,
    ID_LOTE_MUDA INTEGER NOT NULL,
    QTDE INTEGER NOT NULL);

ALTER TABLE MIX_MUDA_ESPECIE_LOTE
ADD CONSTRAINT PK_MIX_MUDA_ESPECIE_LOTE
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_MIX_MUDA_ESPECIE_LOTE;



ALTER TABLE MIX_MUDA_ESPECIE_LOTE
ADD CONSTRAINT FK_MIX_MUDA_ESPECIE_LOTE_1
FOREIGN KEY (ID_MIX_MUDA_ESPCECIE)
REFERENCES MIX_MUDA_ESPECIE(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE MIX_MUDA_ESPECIE_LOTE
ADD CONSTRAINT FK_MIX_MUDA_ESPECIE_LOTE_2
FOREIGN KEY (ID_LOTE_MUDA)
REFERENCES LOTE_MUDA(ID)
ON UPDATE CASCADE;



DROP TABLE MIX_MUDA_ESPECIE_CANTEIRO;



DROP SEQUENCE GEN_MIX_MUDA_ESPECIE_CANTEIRO;



ALTER TABLE MIX_MUDA
    ADD ID_VENDA INTEGER;

alter table MIX_MUDA
alter ID position 1;

alter table MIX_MUDA
alter ID_CLIENTE position 2;

alter table MIX_MUDA
alter ID_PESSOA_RESPONSAVEL position 3;

alter table MIX_MUDA
alter ID_VENDA position 4;

alter table MIX_MUDA
alter DATA position 5;

alter table MIX_MUDA
alter QTDE_MUDA position 6;

alter table MIX_MUDA
alter QTDE_MUDA_ROCAMBOLE position 7;

alter table MIX_MUDA
alter DESCRICAO position 8;



ALTER TABLE MIX_MUDA
ADD CONSTRAINT FK_MIX_MUDA_3
FOREIGN KEY (ID_VENDA)
REFERENCES VENDA(ID)
ON UPDATE CASCADE;



COMMENT ON COLUMN MIX_MUDA.ID_VENDA IS
'Id da venda gerada para esse mix de muda';



ALTER TABLE MIX_MUDA_ESPECIE_LOTE DROP CONSTRAINT FK_MIX_MUDA_ESPECIE_LOTE_1;



ALTER TABLE MIX_MUDA_ESPECIE_LOTE ALTER ID_MIX_MUDA_ESPCECIE TO ID_MIX_MUDA_ESPECIE;



ALTER TABLE MIX_MUDA_ESPECIE_LOTE
ADD CONSTRAINT FK_MIX_MUDA_ESPECIE_LOTE_1
FOREIGN KEY (ID_MIX_MUDA_ESPECIE)
REFERENCES MIX_MUDA_ESPECIE(ID)
ON UPDATE CASCADE;



COMMENT ON COLUMN "LOG".USUARIO IS
'Usuario que realizou a acao
-1 significa que foi feito pelo sistema';



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

        Va_Taxa_Germinacao = coalesce(trunc(:Va_Qtde_Semente_Coletada * :Va_Qtde_Semente_Kilo), 0);
        if (:Va_Taxa_Germinacao <> 0) then
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
                 coalesce((select first 1 Classificacao.Qtde
                           from Classificacao
                           where Classificacao.Id_Lote_Muda = Lote_Muda.Id
                           order by Classificacao.Data desc), Lote_Muda.Qtde_Inicial) as Qtde_Classificada,
                 Lote_Muda.Status,
                 (coalesce((select first 1 Classificacao.Qtde
                            from Classificacao
                            where Classificacao.Id_Lote_Muda = Lote_Muda.Id
                            order by Classificacao.Data desc), Lote_Muda.Qtde_Inicial) - (coalesce((select sum(Saida_Item.Qtde)
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

    if ((Va_Qtde_Total_Mudas_Desenvolvimento is null) and
        (Ip_Ajustar_Mudas = 0)) then
      Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento_Atual, 0);

    if ((Va_Qtde_Total_Mudas_Prontas is null) and
        (Ip_Ajustar_Mudas = 0)) then
      Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas_Atual, 0);

    if ((Va_Qtde_Total_Sementes is null) and
        (Ip_Ajustar_Sementes = 0)) then
      Va_Qtde_Total_Sementes = coalesce(Va_Qtde_Total_Sementes_Atual, 0);

    update Especie
    set Especie.Qtde_Muda_Desenvolvimento = coalesce(:Va_Qtde_Total_Mudas_Desenvolvimento, 0),
        Especie.Qtde_Muda_Pronta = coalesce(:Va_Qtde_Total_Mudas_Prontas, 0),
        Especie.Qtde_Semente_Estoque = coalesce(:Va_Qtde_Total_Sementes, 0)
    where Especie.Id = :Va_Id_Especie;

    insert into log(log.id, log.id_tabela, log.tabela, log.operacao, log.usuario, log.data_hora) values
    (next value for gen_log, :va_id_especie,'ESPECIE',0,-1,current_timestamp);

  end
  suspend;
end^

SET TERM ; ^



ALTER TABLE MIX_MUDA
    ADD ID_SAIDA INTEGER;

COMMENT ON COLUMN MIX_MUDA.ID_SAIDA IS
'Id da saida gerada por esse mix de mudas (deve ser preenchido somente quando o id_venda for null)';

alter table MIX_MUDA
alter ID position 1;

alter table MIX_MUDA
alter ID_CLIENTE position 2;

alter table MIX_MUDA
alter ID_PESSOA_RESPONSAVEL position 3;

alter table MIX_MUDA
alter ID_VENDA position 4;

alter table MIX_MUDA
alter ID_SAIDA position 5;

alter table MIX_MUDA
alter DATA position 6;

alter table MIX_MUDA
alter QTDE_MUDA position 7;

alter table MIX_MUDA
alter QTDE_MUDA_ROCAMBOLE position 8;

alter table MIX_MUDA
alter DESCRICAO position 9;



ALTER TABLE MIX_MUDA
ADD CONSTRAINT FK_MIX_MUDA_4
FOREIGN KEY (ID_SAIDA)
REFERENCES SAIDA(ID)
ON UPDATE CASCADE;



COMMENT ON COLUMN "LOG".OPERACAO IS
'Operacao realizada.
Valores do enum TUpdateKind
TUpdateKind = (ukModify, ukInsert, ukDelete);';



ALTER TABLE MIX_MUDA_ESPECIE_LOTE DROP CONSTRAINT FK_MIX_MUDA_ESPECIE_LOTE_1;

ALTER TABLE MIX_MUDA_ESPECIE_LOTE
ADD CONSTRAINT FK_MIX_MUDA_ESPECIE_LOTE_1
FOREIGN KEY (ID_MIX_MUDA_ESPECIE)
REFERENCES MIX_MUDA_ESPECIE(ID)
ON DELETE CASCADE
ON UPDATE CASCADE
USING INDEX FK_MIX_MUDA_ESPECIE_LOTE_1;



ALTER TABLE MIX_MUDA DROP CONSTRAINT FK_MIX_MUDA_3;

ALTER TABLE MIX_MUDA
ADD CONSTRAINT FK_MIX_MUDA_3
FOREIGN KEY (ID_VENDA)
REFERENCES VENDA(ID)
ON DELETE SET NULL
ON UPDATE CASCADE
USING INDEX FK_MIX_MUDA_3;

ALTER TABLE MIX_MUDA DROP CONSTRAINT FK_MIX_MUDA_4;

ALTER TABLE MIX_MUDA
ADD CONSTRAINT FK_MIX_MUDA_4
FOREIGN KEY (ID_SAIDA)
REFERENCES SAIDA(ID)
ON DELETE SET NULL
ON UPDATE CASCADE
USING INDEX FK_MIX_MUDA_4;

