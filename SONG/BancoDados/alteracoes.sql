

SET TERM ^ ;

CREATE OR ALTER procedure Sp_Ajusta_Saldo_Especie (
    Id_Especie integer)
as
declare variable Va_Id_Especie integer;
declare variable Va_Qtde_Total_Sementes numeric(15,2);
declare variable Va_Qtde_Total_Mudas numeric(15,2);
declare variable Va_Qtde numeric(15,2);
declare variable Va_Todos smallint;
declare variable Va_Id integer;
begin
  Va_Todos = 1;
  if (Id_Especie <> 0) then
  begin
    Va_Todos = 0;
  end

  for select Especie.Id
      from Especie
      where Especie.Id = :Id_Especie or (:Va_Todos = 1)
      into :Va_Id_Especie
  do
  begin
--LOTES DE SEMENTE
    for select Lote_Semente.Id
        from Lote_Semente
        where Lote_Semente.Id_Especie = :va_id_especie
        into :Va_Id
    do
    begin
      Va_Qtde_Total_Sementes = 0;
      Va_Qtde_Total_Mudas = 0;

      select Lote_Semente.Qtde - (coalesce((select sum(Saida_Item.Qtde)
                                            from Saida_Item
                                            where Saida_Item.Id_Lote_Semente = :Va_Id), 0) + coalesce((select first 1 Germinacao.Qtde_Germinada
                                                                                                       from Germinacao
                                                                                                       where Germinacao.Id_Lote_Semente = :Va_Id
                                                                                                       order by Germinacao.Data desc), 0))
      from Lote_Semente
      where Lote_Semente.Id = :Va_Id
      into :Va_Qtde;
--Somando para ser utilizado no final
      Va_Qtde_Total_Sementes = Va_Qtde_Total_Sementes + Va_Qtde;

      update Lote_Semente
      set Lote_Semente.Qtde_Armazenada = :Va_Qtde
      where Lote_Semente.Id = :Va_Id;

    end

--LOTES DE MUDAS
    for select Lote_Muda.Id
        from Lote_Muda
        where Lote_Muda.Id_Especie = :va_id_especie
        into :Va_Id
    do
    begin

      select coalesce(Lote_Muda.Qtde_Classificada, 0) - (coalesce((select sum(Saida_Item.Qtde)
                                                                   from Saida_Item
                                                                   where Saida_Item.Id_Lote_Muda = :Va_Id), 0))
      from Lote_Muda
      where Lote_Muda.Id = :Va_Id
      into :Va_Qtde;
--Somando para ser utilizado no final
      Va_Qtde_Total_Mudas = Va_Qtde_Total_Mudas + Va_Qtde;

      update Lote_Muda
      set Lote_Muda.Saldo = :Va_Qtde
      where Lote_Muda.Id = :Va_Id;

    end

    update Especie
    set Especie.Qtde_Muda_Estoque = :Va_Qtde_Total_Mudas,
        Especie.Qtde_Semente_Estoque = :Va_Qtde_Total_Sementes
    where Especie.Id = :Va_Id_Especie;

  end
  suspend;
end^

SET TERM ; ^



SET TERM ^ ;

CREATE OR ALTER procedure Sp_Ajusta_Saldo_Especie (
    Id_Especie integer)
as
declare variable Va_Id_Especie integer;
declare variable Va_Qtde_Total_Sementes numeric(15,2);
declare variable Va_Qtde_Total_Mudas numeric(15,2);
declare variable Va_Qtde numeric(15,2);
declare variable Va_Todos smallint;
declare variable Va_Id integer;
begin
  Va_Todos = 1;
  if (Id_Especie <> 0) then
  begin
    Va_Todos = 0;
  end

  for select Especie.Id
      from Especie
      where Especie.Id = :Id_Especie or (:Va_Todos = 1)
      into :Va_Id_Especie
  do
  begin
    Va_Qtde_Total_Sementes = 0;
    Va_Qtde_Total_Mudas = 0;

--LOTES DE SEMENTE
    for select Lote_Semente.Id
        from Lote_Semente
        where Lote_Semente.Id_Especie = :Va_Id_Especie
        into :Va_Id
    do
    begin

      select Lote_Semente.Qtde - (coalesce((select sum(Saida_Item.Qtde)
                                            from Saida_Item
                                            where Saida_Item.Id_Lote_Semente = :Va_Id), 0) + coalesce((select first 1 Germinacao.Qtde_Germinada
                                                                                                       from Germinacao
                                                                                                       where Germinacao.Id_Lote_Semente = :Va_Id
                                                                                                       order by Germinacao.Data desc), 0))
      from Lote_Semente
      where Lote_Semente.Id = :Va_Id
      into :Va_Qtde;
--Somando para ser utilizado no final
      Va_Qtde_Total_Sementes = Va_Qtde_Total_Sementes + Va_Qtde;

      update Lote_Semente
      set Lote_Semente.Qtde_Armazenada = :Va_Qtde
      where Lote_Semente.Id = :Va_Id;

    end

--LOTES DE MUDAS
    for select Lote_Muda.Id
        from Lote_Muda
        where Lote_Muda.Id_Especie = :Va_Id_Especie
        into :Va_Id
    do
    begin

      select coalesce(Lote_Muda.Qtde_Classificada, 0) - (coalesce((select sum(Saida_Item.Qtde)
                                                                   from Saida_Item
                                                                   where Saida_Item.Id_Lote_Muda = :Va_Id), 0))
      from Lote_Muda
      where Lote_Muda.Id = :Va_Id
      into :Va_Qtde;
--Somando para ser utilizado no final
      Va_Qtde_Total_Mudas = Va_Qtde_Total_Mudas + Va_Qtde;

      update Lote_Muda
      set Lote_Muda.Saldo = :Va_Qtde
      where Lote_Muda.Id = :Va_Id;

    end

    update Especie
    set Especie.Qtde_Muda_Estoque = :Va_Qtde_Total_Mudas,
        Especie.Qtde_Semente_Estoque = :Va_Qtde_Total_Sementes
    where Especie.Id = :Va_Id_Especie;

  end
  suspend;
end^

SET TERM ; ^



CREATE TABLE LOCAL_USO (
    ID INTEGER NOT NULL,
    NOME D_NOME NOT NULL);

ALTER TABLE LOCAL_USO
ADD CONSTRAINT PK_LOCAL_USO
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_LOCAL_USO;



ALTER TABLE SAIDA
    ADD ID_LOCAL_USO INTEGER;

alter table SAIDA
alter ID position 1;

alter table SAIDA
alter ID_LOCAL_USO position 2;

alter table SAIDA
alter DATA position 3;

alter table SAIDA
alter TIPO position 4;



ALTER TABLE SAIDA
ADD CONSTRAINT FK_SAIDA_1
FOREIGN KEY (ID_LOCAL_USO)
REFERENCES LOCAL_USO(ID)
ON UPDATE CASCADE;


update saida set saida.tipo = 4 where saida.tipo = 3;

ALTER TABLE LOTE_MUDA
    ADD STATUS SMALLINT NOT NULL;

COMMENT ON COLUMN LOTE_MUDA.STATUS IS
'0 - Em desenvolvimento
1 - Prontas para plantio';



UPDATE LOTE_MUDA
SET STATUS = 0;



ALTER TABLE ESPECIE
    ADD TEMPO_DESENVOLVIMENTO INTEGER;

COMMENT ON COLUMN ESPECIE.TEMPO_DESENVOLVIMENTO IS
'Tempo medio em dias que as mudas desta especie levam desde a germinacao ate estarem prontas para plantio.';



SET TERM ^ ;

CREATE OR ALTER procedure Sp_Ajusta_Saldo_Especie (
    Id_Especie integer)
as
declare variable Va_Id_Especie integer;
declare variable Va_Qtde_Total_Sementes numeric(15,2);
declare variable Va_Qtde_Total_Mudas numeric(15,2);
declare variable Va_Qtde numeric(15,2);
declare variable Va_Todos smallint;
declare variable Va_Id integer;
begin
  Va_Todos = 1;
  if (Id_Especie <> 0) then
  begin
    Va_Todos = 0;
  end

  for select Especie.Id
      from Especie
      where Especie.Id = :Id_Especie or (:Va_Todos = 1)
      into :Va_Id_Especie
  do
  begin
    Va_Qtde_Total_Sementes = 0;
    Va_Qtde_Total_Mudas = 0;

--LOTES DE SEMENTE
    for select Lote_Semente.Id
        from Lote_Semente
        where Lote_Semente.Id_Especie = :Va_Id_Especie
        into :Va_Id
    do
    begin

      select Lote_Semente.Qtde - (coalesce((select sum(Saida_Item.Qtde)
                                            from Saida_Item
                                            where Saida_Item.Id_Lote_Semente = :Va_Id), 0) + coalesce((select sum(semeadura.qtde_semeada)
                                                                                                       from semeadura
                                                                                                       where semeadura.id_lote_semente = :Va_Id), 0))
      from Lote_Semente
      where Lote_Semente.Id = :Va_Id
      into :Va_Qtde;
--Somando para ser utilizado no final
      Va_Qtde_Total_Sementes = Va_Qtde_Total_Sementes + Va_Qtde;

      update Lote_Semente
      set Lote_Semente.Qtde_Armazenada = :Va_Qtde
      where Lote_Semente.Id = :Va_Id;

    end

--LOTES DE MUDAS
    for select Lote_Muda.Id
        from Lote_Muda
        where Lote_Muda.Id_Especie = :Va_Id_Especie
        into :Va_Id
    do
    begin

      select coalesce(Lote_Muda.Qtde_Classificada, 0) - (coalesce((select sum(Saida_Item.Qtde)
                                                                   from Saida_Item
                                                                   where Saida_Item.Id_Lote_Muda = :Va_Id), 0))
      from Lote_Muda
      where Lote_Muda.Id = :Va_Id
      into :Va_Qtde;
--Somando para ser utilizado no final
      Va_Qtde_Total_Mudas = Va_Qtde_Total_Mudas + Va_Qtde;

      update Lote_Muda
      set Lote_Muda.Saldo = :Va_Qtde
      where Lote_Muda.Id = :Va_Id;

    end

    update Especie
    set Especie.Qtde_Muda_Estoque = :Va_Qtde_Total_Mudas,
        Especie.Qtde_Semente_Estoque = :Va_Qtde_Total_Sementes
    where Especie.Id = :Va_Id_Especie;

  end
  suspend;
end^

SET TERM ; ^



ALTER TABLE ESPECIE
    ADD QTDE_MUDA_DESENVOLVIMENTO INTEGER;



SET TERM ^ ;

CREATE OR ALTER procedure Sp_Ajusta_Saldo_Especie (
    Id_Especie integer)
as
declare variable Va_Id_Especie integer;
declare variable Va_Qtde_Total_Sementes numeric(15,2);
declare variable Va_Qtde_Total_Mudas numeric(15,2);
declare variable Va_Qtde numeric(15,2);
declare variable Va_Todos smallint;
declare variable Va_Id integer;
begin
  /*Va_Todos = 1;
  if (Id_Especie <> 0) then
  begin
    Va_Todos = 0;
  end

  for select Especie.Id
      from Especie
      where Especie.Id = :Id_Especie or (:Va_Todos = 1)
      into :Va_Id_Especie
  do
  begin
    Va_Qtde_Total_Sementes = 0;
    Va_Qtde_Total_Mudas = 0;

--LOTES DE SEMENTE
    for select Lote_Semente.Id
        from Lote_Semente
        where Lote_Semente.Id_Especie = :Va_Id_Especie
        into :Va_Id
    do
    begin

      select Lote_Semente.Qtde - (coalesce((select sum(Saida_Item.Qtde)
                                            from Saida_Item
                                            where Saida_Item.Id_Lote_Semente = :Va_Id), 0) + coalesce((select sum(semeadura.qtde_semeada)
                                                                                                       from semeadura
                                                                                                       where semeadura.id_lote_semente = :Va_Id), 0))
      from Lote_Semente
      where Lote_Semente.Id = :Va_Id
      into :Va_Qtde;
--Somando para ser utilizado no final
      Va_Qtde_Total_Sementes = Va_Qtde_Total_Sementes + Va_Qtde;

      update Lote_Semente
      set Lote_Semente.Qtde_Armazenada = :Va_Qtde
      where Lote_Semente.Id = :Va_Id;

    end

--LOTES DE MUDAS
    for select Lote_Muda.Id
        from Lote_Muda
        where Lote_Muda.Id_Especie = :Va_Id_Especie
        into :Va_Id
    do
    begin

      select coalesce(Lote_Muda.Qtde_Classificada, 0) - (coalesce((select sum(Saida_Item.Qtde)
                                                                   from Saida_Item
                                                                   where Saida_Item.Id_Lote_Muda = :Va_Id), 0))
      from Lote_Muda
      where Lote_Muda.Id = :Va_Id
      into :Va_Qtde;
--Somando para ser utilizado no final
      Va_Qtde_Total_Mudas = Va_Qtde_Total_Mudas + Va_Qtde;

      update Lote_Muda
      set Lote_Muda.Saldo = :Va_Qtde
      where Lote_Muda.Id = :Va_Id;

    end

    update Especie
    set Especie.Qtde_Muda_Estoque = :Va_Qtde_Total_Mudas,
        Especie.Qtde_Semente_Estoque = :Va_Qtde_Total_Sementes
    where Especie.Id = :Va_Id_Especie;

  end   */
  suspend;
end^

SET TERM ; ^



ALTER TABLE ESPECIE
    ALTER QTDE_MUDA_ESTOQUE TO QTDE_MUDA_PRONTA;



alter table ESPECIE
alter ID position 1;

alter table ESPECIE
alter NOME position 2;

alter table ESPECIE
alter NOME_CIENTIFICO position 3;

alter table ESPECIE
alter FAMILIA_BOTANICA position 4;

alter table ESPECIE
alter VALOR_MUDA position 5;

alter table ESPECIE
alter VALOR_KG_SEMENTE position 6;

alter table ESPECIE
alter TEMPO_GERMINACAO position 7;

alter table ESPECIE
alter QTDE_SEMENTE_KILO position 8;

alter table ESPECIE
alter QTDE_SEMENTE_ESTOQUE position 9;

alter table ESPECIE
alter QTDE_MUDA_PRONTA position 10;

alter table ESPECIE
alter QTDE_MUDA_DESENVOLVIMENTO position 11;

alter table ESPECIE
alter TEMPO_DESENVOLVIMENTO position 12;

alter table ESPECIE
alter INICIO_PERIODO_COLETA position 13;

alter table ESPECIE
alter FIM_PERIODO_COLETA position 14;

alter table ESPECIE
alter OBSERVACAO position 15;



SET TERM ^ ;

CREATE OR ALTER procedure Sp_Ajusta_Saldo_Especie (
    Id_Especie integer)
as
declare variable Va_Id_Especie integer;
declare variable Va_Qtde_Total_Sementes numeric(15,2);
declare variable Va_Qtde_Total_Mudas_Desenvolvimento integer;
declare variable Va_Qtde_Total_Mudas_Prontas integer;
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

  for select Especie.Id
      from Especie
      where Especie.Id = :Id_Especie or (:Va_Todos = 1)
      into :Va_Id_Especie
  do
  begin
    Va_Qtde_Total_Sementes = 0;
    Va_Qtde_Total_Mudas_Desenvolvimento = 0;
    Va_Qtde_Total_Mudas_Prontas = 0;

--*******************************************LOTES DE SEMENTE*****************************************
    for select Lote_Semente.Id
        from Lote_Semente
        where Lote_Semente.Id_Especie = :Va_Id_Especie
        into :Va_Id
    do
    begin

      select Lote_Semente.Qtde - (coalesce((select sum(Saida_Item.Qtde)
                                            from Saida_Item
                                            where Saida_Item.Id_Lote_Semente = :Va_Id), 0) + coalesce((select sum(Semeadura.Qtde_Semeada)
                                                                                                       from Semeadura
                                                                                                       where Semeadura.Id_Lote_Semente = :Va_Id), 0))
      from Lote_Semente
      where Lote_Semente.Id = :Va_Id
      into :Va_Qtde;
--Somando para ser utilizado no final
      Va_Qtde_Total_Sementes = Va_Qtde_Total_Sementes + Va_Qtde;

      update Lote_Semente
      set Lote_Semente.Qtde_Armazenada = :Va_Qtde
      where Lote_Semente.Id = :Va_Id;

    end

--*************************************************LOTES DE MUDAS*******************************************************
    for select Lote_Muda.Id,
               Lote_Muda.Status
        from Lote_Muda
        where Lote_Muda.Id_Especie = :Va_Id_Especie
        into :Va_Id, :Va_Status
    do
    begin

      select coalesce(Lote_Muda.Qtde_Classificada, 0) - (coalesce((select sum(Saida_Item.Qtde)
                                                                   from Saida_Item
                                                                   where Saida_Item.Id_Lote_Muda = :Va_Id), 0))
      from Lote_Muda
      where Lote_Muda.Id = :Va_Id
      into :Va_Qtde;
--Somando para ser utilizado no final
      if (Va_Status = 0) then
        Va_Qtde_Total_Mudas_Desenvolvimento = Va_Qtde_Total_Mudas_Desenvolvimento + Va_Qtde;
      else
        Va_Qtde_Total_Mudas_Prontas = Va_Qtde_Total_Mudas_Prontas + Va_Qtde;

      update Lote_Muda
      set Lote_Muda.Saldo = :Va_Qtde
      where Lote_Muda.Id = :Va_Id;

    end

    update Especie
    set Especie.Qtde_Muda_Desenvolvimento = :Va_Qtde_Total_Mudas_Desenvolvimento,
        Especie.Qtde_Muda_Pronta = :Va_Qtde_Total_Mudas_Prontas,
        Especie.Qtde_Semente_Estoque = :Va_Qtde_Total_Sementes
    where Especie.Id = :Va_Id_Especie;

  end
  suspend;
end^

SET TERM ; ^



SET TERM ^ ;

CREATE OR ALTER procedure Sp_Ajusta_Saldo_Especie (
    Ip_Ajustar_Mudas integer,
    Ip_Ajustar_Sementes integer,
    Id_Especie integer)
as
declare variable Va_Id_Especie integer;
declare variable Va_Qtde_Total_Sementes numeric(15,2);
declare variable Va_Qtde_Total_Mudas_Desenvolvimento integer;
declare variable Va_Qtde_Total_Mudas_Prontas integer;

declare variable Va_Qtde_Total_Sementes_Atual numeric(15,2);
declare variable Va_Qtde_Total_Mudas_Desenvolvimento_Atual integer;
declare variable Va_Qtde_Total_Mudas_Prontas_Atual integer;

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
      for select Lote_Semente.Id
          from Lote_Semente
          where Lote_Semente.Id_Especie = :Va_Id_Especie
          into :Va_Id
      do
      begin

        select Lote_Semente.Qtde - (coalesce((select sum(Saida_Item.Qtde)
                                              from Saida_Item
                                              where Saida_Item.Id_Lote_Semente = :Va_Id), 0) + coalesce((select sum(Semeadura.Qtde_Semeada)
                                                                                                         from Semeadura
                                                                                                         where Semeadura.Id_Lote_Semente = :Va_Id), 0))
        from Lote_Semente
        where Lote_Semente.Id = :Va_Id
        into :Va_Qtde;
--Somando para ser utilizado no final
        Va_Qtde_Total_Sementes = coalesce(Va_Qtde_Total_Sementes, 0) + Va_Qtde;

        update Lote_Semente
        set Lote_Semente.Qtde_Armazenada = :Va_Qtde
        where Lote_Semente.Id = :Va_Id;

      end
    end

--*************************************************LOTES DE MUDAS*******************************************************
    if ((Ip_Ajustar_Mudas is null) or (Ip_Ajustar_Mudas = 1)) then
    begin
      for select Lote_Muda.Id,
                 Lote_Muda.Status
          from Lote_Muda
          where Lote_Muda.Id_Especie = :Va_Id_Especie
          into :Va_Id, :Va_Status
      do
      begin

        select coalesce(Lote_Muda.Qtde_Classificada, 0) - (coalesce((select sum(Saida_Item.Qtde)
                                                                     from Saida_Item
                                                                     where Saida_Item.Id_Lote_Muda = :Va_Id), 0))
        from Lote_Muda
        where Lote_Muda.Id = :Va_Id
        into :Va_Qtde;
--Somando para ser utilizado no final
        if (Va_Status = 0) then
          Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento, 0) + Va_Qtde;
        else
          Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas, 0) + Va_Qtde;

        update Lote_Muda
        set Lote_Muda.Saldo = :Va_Qtde
        where Lote_Muda.Id = :Va_Id;

      end
    end

    if (Va_Qtde_Total_Mudas_Desenvolvimento is null) then
        Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento_Atual,0);

    if (Va_Qtde_Total_Mudas_Prontas is null) then
        Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas_Atual,0);

    if (Va_Qtde_Total_Sementes is null) then
        Va_Qtde_Total_Sementes = coalesce(Va_Qtde_Total_Sementes_Atual,0);

    update Especie
    set Especie.Qtde_Muda_Desenvolvimento = :Va_Qtde_Total_Mudas_Desenvolvimento,
        Especie.Qtde_Muda_Pronta = :Va_Qtde_Total_Mudas_Prontas,
        Especie.Qtde_Semente_Estoque = :Va_Qtde_Total_Sementes
    where Especie.Id = :Va_Id_Especie;

  end
  suspend;
end^

SET TERM ; ^



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
      for select Lote_Semente.Id
          from Lote_Semente
          where Lote_Semente.Id_Especie = :Va_Id_Especie
          into :Va_Id
      do
      begin

        select Lote_Semente.Qtde - (coalesce((select sum(Saida_Item.Qtde)
                                              from Saida_Item
                                              where Saida_Item.Id_Lote_Semente = :Va_Id), 0) + coalesce((select sum(Semeadura.Qtde_Semeada)
                                                                                                         from Semeadura
                                                                                                         where Semeadura.Id_Lote_Semente = :Va_Id), 0))
        from Lote_Semente
        where Lote_Semente.Id = :Va_Id
        into :Va_Qtde;
--Somando para ser utilizado no final
        Va_Qtde_Total_Sementes = coalesce(Va_Qtde_Total_Sementes, 0) + Va_Qtde;

        update Lote_Semente
        set Lote_Semente.Qtde_Armazenada = :Va_Qtde
        where Lote_Semente.Id = :Va_Id;

      end
    end

--*************************************************LOTES DE MUDAS*******************************************************
    if ((Ip_Ajustar_Mudas is null) or (Ip_Ajustar_Mudas = 1)) then
    begin
      for select Lote_Muda.Id,
                 Lote_Muda.Status
          from Lote_Muda
          where Lote_Muda.Id_Especie = :Va_Id_Especie
          into :Va_Id, :Va_Status
      do
      begin

        select coalesce(Lote_Muda.Qtde_Classificada, 0) - (coalesce((select sum(Saida_Item.Qtde)
                                                                     from Saida_Item
                                                                     where Saida_Item.Id_Lote_Muda = :Va_Id), 0))
        from Lote_Muda
        where Lote_Muda.Id = :Va_Id
        into :Va_Qtde;
--Somando para ser utilizado no final
        if (Va_Status = 0) then
          Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento, 0) + Va_Qtde;
        else
          Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas, 0) + Va_Qtde;

        update Lote_Muda
        set Lote_Muda.Saldo = :Va_Qtde
        where Lote_Muda.Id = :Va_Id;

      end
    end

    if (Va_Qtde_Total_Mudas_Desenvolvimento is null) then
        Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento_Atual,0);

    if (Va_Qtde_Total_Mudas_Prontas is null) then
        Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas_Atual,0);

    if (Va_Qtde_Total_Sementes is null) then
        Va_Qtde_Total_Sementes = coalesce(Va_Qtde_Total_Sementes_Atual,0);

    update Especie
    set Especie.Qtde_Muda_Desenvolvimento = :Va_Qtde_Total_Mudas_Desenvolvimento,
        Especie.Qtde_Muda_Pronta = :Va_Qtde_Total_Mudas_Prontas,
        Especie.Qtde_Semente_Estoque = :Va_Qtde_Total_Sementes
    where Especie.Id = :Va_Id_Especie;

  end
  suspend;
end^

SET TERM ; ^



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
                                                                                                                    where Semeadura.Id_Lote_Semente = Lote_Semente.Id), 0))) as Qtde

          from Lote_Semente
          inner join Especie on (Especie.Id = Lote_Semente.Id_Especie)
          where Lote_Semente.Id_Especie = :Va_Id_Especie
          into :Va_Id, :Va_Qtde_Semente_Kilo, :Va_Qtde_Semente_Coletada, :Va_Qtde_Semente_Germinou, :Va_Qtde
      do
      begin
--Somando para ser utilizado no final
        Va_Qtde_Total_Sementes = coalesce(Va_Qtde_Total_Sementes, 0) + Va_Qtde;

        update Lote_Semente
        set Lote_Semente.Qtde_Armazenada = :Va_Qtde,
            Lote_Semente.Taxa_Germinacao = (:va_qtde_semente_germinou/trunc(:va_qtde_semente_coletada*:va_qtde_semente_kilo))*100
        where Lote_Semente.Id = :Va_Id;

      end
    end

--*************************************************LOTES DE MUDAS*******************************************************
    if ((Ip_Ajustar_Mudas is null) or (Ip_Ajustar_Mudas = 1)) then
    begin
      for select Lote_Muda.Id,
                 Lote_Muda.Status
          from Lote_Muda
          where Lote_Muda.Id_Especie = :Va_Id_Especie
          into :Va_Id, :Va_Status
      do
      begin

        select coalesce(Lote_Muda.Qtde_Classificada, 0) - (coalesce((select sum(Saida_Item.Qtde)
                                                                     from Saida_Item
                                                                     where Saida_Item.Id_Lote_Muda = :Va_Id), 0))
        from Lote_Muda
        where Lote_Muda.Id = :Va_Id
        into :Va_Qtde;
--Somando para ser utilizado no final
        if (Va_Status = 0) then
          Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento, 0) + Va_Qtde;
        else
          Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas, 0) + Va_Qtde;

        update Lote_Muda
        set Lote_Muda.Saldo = :Va_Qtde
        where Lote_Muda.Id = :Va_Id;

      end
    end

    if (Va_Qtde_Total_Mudas_Desenvolvimento is null) then
      Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento_Atual, 0);

    if (Va_Qtde_Total_Mudas_Prontas is null) then
      Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas_Atual, 0);

    if (Va_Qtde_Total_Sementes is null) then
      Va_Qtde_Total_Sementes = coalesce(Va_Qtde_Total_Sementes_Atual, 0);

    update Especie
    set Especie.Qtde_Muda_Desenvolvimento = :Va_Qtde_Total_Mudas_Desenvolvimento,
        Especie.Qtde_Muda_Pronta = :Va_Qtde_Total_Mudas_Prontas,
        Especie.Qtde_Semente_Estoque = :Va_Qtde_Total_Sementes
    where Especie.Id = :Va_Id_Especie;

  end
  suspend;
end^

SET TERM ; ^



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
                                                                                                                    where Semeadura.Id_Lote_Semente = Lote_Semente.Id), 0))) as Qtde

          from Lote_Semente
          inner join Especie on (Especie.Id = Lote_Semente.Id_Especie)
          where Lote_Semente.Id_Especie = :Va_Id_Especie
          into :Va_Id, :Va_Qtde_Semente_Kilo, :Va_Qtde_Semente_Coletada, :Va_Qtde_Semente_Germinou, :Va_Qtde
      do
      begin
--Somando para ser utilizado no final
        Va_Qtde_Total_Sementes = coalesce(Va_Qtde_Total_Sementes, 0) + Va_Qtde;

        update Lote_Semente
        set Lote_Semente.Qtde_Armazenada = :Va_Qtde,
            Lote_Semente.Taxa_Germinacao = coalesce((:va_qtde_semente_germinou/trunc(:va_qtde_semente_coletada*:va_qtde_semente_kilo))*100,0)
        where Lote_Semente.Id = :Va_Id;

      end
    end

--*************************************************LOTES DE MUDAS*******************************************************
    if ((Ip_Ajustar_Mudas is null) or (Ip_Ajustar_Mudas = 1)) then
    begin
      for select Lote_Muda.Id,
                 Lote_Muda.Status
          from Lote_Muda
          where Lote_Muda.Id_Especie = :Va_Id_Especie
          into :Va_Id, :Va_Status
      do
      begin

        select coalesce(Lote_Muda.Qtde_Classificada, 0) - (coalesce((select sum(Saida_Item.Qtde)
                                                                     from Saida_Item
                                                                     where Saida_Item.Id_Lote_Muda = :Va_Id), 0))
        from Lote_Muda
        where Lote_Muda.Id = :Va_Id
        into :Va_Qtde;
--Somando para ser utilizado no final
        if (Va_Status = 0) then
          Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento, 0) + Va_Qtde;
        else
          Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas, 0) + Va_Qtde;

        update Lote_Muda
        set Lote_Muda.Saldo = :Va_Qtde
        where Lote_Muda.Id = :Va_Id;

      end
    end

    if (Va_Qtde_Total_Mudas_Desenvolvimento is null) then
      Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento_Atual, 0);

    if (Va_Qtde_Total_Mudas_Prontas is null) then
      Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas_Atual, 0);

    if (Va_Qtde_Total_Sementes is null) then
      Va_Qtde_Total_Sementes = coalesce(Va_Qtde_Total_Sementes_Atual, 0);

    update Especie
    set Especie.Qtde_Muda_Desenvolvimento = :Va_Qtde_Total_Mudas_Desenvolvimento,
        Especie.Qtde_Muda_Pronta = :Va_Qtde_Total_Mudas_Prontas,
        Especie.Qtde_Semente_Estoque = :Va_Qtde_Total_Sementes
    where Especie.Id = :Va_Id_Especie;

  end
  suspend;
end^

SET TERM ; ^



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
                                                                                                                    where Semeadura.Id_Lote_Semente = Lote_Semente.Id), 0))) as Qtde

          from Lote_Semente
          inner join Especie on (Especie.Id = Lote_Semente.Id_Especie)
          where Lote_Semente.Id_Especie = :Va_Id_Especie
          into :Va_Id, :Va_Qtde_Semente_Kilo, :Va_Qtde_Semente_Coletada, :Va_Qtde_Semente_Germinou, :Va_Qtde
      do
      begin
--Somando para ser utilizado no final
        Va_Qtde_Total_Sementes = coalesce(Va_Qtde_Total_Sementes, 0) + Va_Qtde;

        update Lote_Semente
        set Lote_Semente.Qtde_Armazenada = :Va_Qtde,
            Lote_Semente.Taxa_Germinacao = coalesce((:va_qtde_semente_germinou/trunc(:va_qtde_semente_coletada*:va_qtde_semente_kilo))*100,0)
        where Lote_Semente.Id = :Va_Id;

      end
    end

--*************************************************LOTES DE MUDAS*******************************************************
    if ((Ip_Ajustar_Mudas is null) or (Ip_Ajustar_Mudas = 1)) then
    begin
      for select Lote_Muda.Id,
                 Lote_Muda.Status
          from Lote_Muda
          where Lote_Muda.Id_Especie = :Va_Id_Especie
          into :Va_Id, :Va_Status
      do
      begin

        select coalesce(Lote_Muda.Qtde_Classificada, 0) - (coalesce((select sum(Saida_Item.Qtde)
                                                                     from Saida_Item
                                                                     where Saida_Item.Id_Lote_Muda = :Va_Id), 0))
        from Lote_Muda
        where Lote_Muda.Id = :Va_Id
        into :Va_Qtde;
--Somando para ser utilizado no final
        if (Va_Status = 0) then
          Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento, 0) + Va_Qtde;
        else
          Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas, 0) + Va_Qtde;

        update Lote_Muda
        set Lote_Muda.Saldo = :Va_Qtde
        where Lote_Muda.Id = :Va_Id;

      end
    end

    if (Va_Qtde_Total_Mudas_Desenvolvimento is null) then
      Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento_Atual, 0);

    if (Va_Qtde_Total_Mudas_Prontas is null) then
      Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas_Atual, 0);

    if (Va_Qtde_Total_Sementes is null) then
      Va_Qtde_Total_Sementes = coalesce(Va_Qtde_Total_Sementes_Atual, 0);

    update Especie
    set Especie.Qtde_Muda_Desenvolvimento = :Va_Qtde_Total_Mudas_Desenvolvimento,
        Especie.Qtde_Muda_Pronta = :Va_Qtde_Total_Mudas_Prontas,
        Especie.Qtde_Semente_Estoque = :Va_Qtde_Total_Sementes
    where Especie.Id = :Va_Id_Especie;

  end
  suspend;
end^

SET TERM ; ^



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

declare variable va_taxa numeric(15,2);

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
                                                                                                                    where Semeadura.Id_Lote_Semente = Lote_Semente.Id), 0))) as Qtde

          from Lote_Semente
          inner join Especie on (Especie.Id = Lote_Semente.Id_Especie)
          where Lote_Semente.Id_Especie = :Va_Id_Especie
          into :Va_Id, :Va_Qtde_Semente_Kilo, :Va_Qtde_Semente_Coletada, :Va_Qtde_Semente_Germinou, :Va_Qtde
      do
      begin
--Somando para ser utilizado no final
        Va_Qtde_Total_Sementes = coalesce(Va_Qtde_Total_Sementes, 0) + Va_Qtde;

        va_taxa = coalesce(trunc(:va_qtde_semente_coletada*:va_qtde_semente_kilo),1);--1 para nao dar divisao por zero
        va_taxa = coalesce(:va_qtde_semente_germinou/va_taxa*100,0);

        update Lote_Semente
        set Lote_Semente.Qtde_Armazenada = :Va_Qtde,
            Lote_Semente.Taxa_Germinacao = :va_taxa
        where Lote_Semente.Id = :Va_Id;

      end
    end

--*************************************************LOTES DE MUDAS*******************************************************
    if ((Ip_Ajustar_Mudas is null) or (Ip_Ajustar_Mudas = 1)) then
    begin
      for select Lote_Muda.Id,
                 Lote_Muda.Status
          from Lote_Muda
          where Lote_Muda.Id_Especie = :Va_Id_Especie
          into :Va_Id, :Va_Status
      do
      begin

        select coalesce(Lote_Muda.Qtde_Classificada, 0) - (coalesce((select sum(Saida_Item.Qtde)
                                                                     from Saida_Item
                                                                     where Saida_Item.Id_Lote_Muda = :Va_Id), 0))
        from Lote_Muda
        where Lote_Muda.Id = :Va_Id
        into :Va_Qtde;
--Somando para ser utilizado no final
        if (Va_Status = 0) then
          Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento, 0) + Va_Qtde;
        else
          Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas, 0) + Va_Qtde;

        update Lote_Muda
        set Lote_Muda.Saldo = :Va_Qtde
        where Lote_Muda.Id = :Va_Id;

      end
    end

    if (Va_Qtde_Total_Mudas_Desenvolvimento is null) then
      Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento_Atual, 0);

    if (Va_Qtde_Total_Mudas_Prontas is null) then
      Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas_Atual, 0);

    if (Va_Qtde_Total_Sementes is null) then
      Va_Qtde_Total_Sementes = coalesce(Va_Qtde_Total_Sementes_Atual, 0);

    update Especie
    set Especie.Qtde_Muda_Desenvolvimento = :Va_Qtde_Total_Mudas_Desenvolvimento,
        Especie.Qtde_Muda_Pronta = :Va_Qtde_Total_Mudas_Prontas,
        Especie.Qtde_Semente_Estoque = :Va_Qtde_Total_Sementes
    where Especie.Id = :Va_Id_Especie;

  end
  suspend;
end^

SET TERM ; ^



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
                 Lote_Muda.Qtde_Classificada,
                 Lote_Muda.Status,
                 (coalesce(Lote_Muda.Qtde_Classificada, 0) - (coalesce((select sum(Saida_Item.Qtde)
                                                                     from Saida_Item
                                                                     where Saida_Item.Id_Lote_Muda = :Va_Id), 0))) as Saldo
          from Lote_Muda
          where Lote_Muda.Id_Especie = :Va_Id_Especie
          into :Va_Id, :va_qtde_inicial,:va_qtde_classificada, :Va_Status, :va_qtde
      do
      begin

--Somando para ser utilizado no final
        if (Va_Status = 0) then
          Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento, 0) + Va_Qtde;
        else
          Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas, 0) + Va_Qtde;

        update Lote_Muda
        set Lote_Muda.Saldo = :Va_Qtde,
            Lote_Muda.taxa_classificacao = (:va_qtde_classificada/coalesce(:va_qtde_inicial,1))*100
        where Lote_Muda.Id = :Va_Id;

      end
    end

    if (Va_Qtde_Total_Mudas_Desenvolvimento is null) then
      Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento_Atual, 0);

    if (Va_Qtde_Total_Mudas_Prontas is null) then
      Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas_Atual, 0);

    if (Va_Qtde_Total_Sementes is null) then
      Va_Qtde_Total_Sementes = coalesce(Va_Qtde_Total_Sementes_Atual, 0);

    update Especie
    set Especie.Qtde_Muda_Desenvolvimento = :Va_Qtde_Total_Mudas_Desenvolvimento,
        Especie.Qtde_Muda_Pronta = :Va_Qtde_Total_Mudas_Prontas,
        Especie.Qtde_Semente_Estoque = :Va_Qtde_Total_Sementes
    where Especie.Id = :Va_Id_Especie;

  end
  suspend;
end^

SET TERM ; ^



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
                 Lote_Muda.Qtde_Classificada,
                 Lote_Muda.Status,
                 (coalesce(Lote_Muda.Qtde_Classificada, 0) - (coalesce((select sum(Saida_Item.Qtde)
                                                                     from Saida_Item
                                                                     where Saida_Item.Id_Lote_Muda = :Va_Id), 0))) as Saldo
          from Lote_Muda
          where Lote_Muda.Id_Especie = :Va_Id_Especie
          into :Va_Id, :va_qtde_inicial,:va_qtde_classificada, :Va_Status, :va_qtde
      do
      begin

--Somando para ser utilizado no final
        if (Va_Status = 0) then
          Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento, 0) + Va_Qtde;
        else
          Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas, 0) + Va_Qtde;

         va_taxa_classificacao = (:va_qtde_classificada/coalesce(:va_qtde_inicial,1))*100;
        update Lote_Muda
        set Lote_Muda.Saldo = :Va_Qtde,
            Lote_Muda.taxa_classificacao = coalesce(:va_taxa_classificacao,0)
        where Lote_Muda.Id = :Va_Id;

      end
    end

    if (Va_Qtde_Total_Mudas_Desenvolvimento is null) then
      Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento_Atual, 0);

    if (Va_Qtde_Total_Mudas_Prontas is null) then
      Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas_Atual, 0);

    if (Va_Qtde_Total_Sementes is null) then
      Va_Qtde_Total_Sementes = coalesce(Va_Qtde_Total_Sementes_Atual, 0);

    update Especie
    set Especie.Qtde_Muda_Desenvolvimento = :Va_Qtde_Total_Mudas_Desenvolvimento,
        Especie.Qtde_Muda_Pronta = :Va_Qtde_Total_Mudas_Prontas,
        Especie.Qtde_Semente_Estoque = :Va_Qtde_Total_Sementes
    where Especie.Id = :Va_Id_Especie;

  end
  suspend;
end^

SET TERM ; ^



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
                 Lote_Muda.Qtde_Classificada,
                 Lote_Muda.Status,
                 (coalesce(Lote_Muda.Qtde_Classificada, 0) - (coalesce((select sum(Saida_Item.Qtde)
                                                                     from Saida_Item
                                                                     where Saida_Item.Id_Lote_Muda = :Va_Id), 0))) as Saldo
          from Lote_Muda
          where Lote_Muda.Id_Especie = :Va_Id_Especie
          into :Va_Id, :va_qtde_inicial,:va_qtde_classificada, :Va_Status, :va_qtde
      do
      begin

--Somando para ser utilizado no final
        if (Va_Status = 0) then
          Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento, 0) + Va_Qtde;
        else
          Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas, 0) + Va_Qtde;

         va_taxa_classificacao = ((:va_qtde_classificada/coalesce(:va_qtde_inicial,1))*100);
        update Lote_Muda
        set Lote_Muda.Saldo = :Va_Qtde,
            Lote_Muda.taxa_classificacao = coalesce(:va_taxa_classificacao,0)
        where Lote_Muda.Id = :Va_Id;

      end
    end

    if (Va_Qtde_Total_Mudas_Desenvolvimento is null) then
      Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento_Atual, 0);

    if (Va_Qtde_Total_Mudas_Prontas is null) then
      Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas_Atual, 0);

    if (Va_Qtde_Total_Sementes is null) then
      Va_Qtde_Total_Sementes = coalesce(Va_Qtde_Total_Sementes_Atual, 0);

    update Especie
    set Especie.Qtde_Muda_Desenvolvimento = :Va_Qtde_Total_Mudas_Desenvolvimento,
        Especie.Qtde_Muda_Pronta = :Va_Qtde_Total_Mudas_Prontas,
        Especie.Qtde_Semente_Estoque = :Va_Qtde_Total_Sementes
    where Especie.Id = :Va_Id_Especie;

  end
  suspend;
end^

SET TERM ; ^



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
                 Lote_Muda.Qtde_Classificada,
                 Lote_Muda.Status,
                 (coalesce(Lote_Muda.Qtde_Classificada, 0) - (coalesce((select sum(Saida_Item.Qtde)
                                                                     from Saida_Item
                                                                     where Saida_Item.Id_Lote_Muda = :Va_Id), 0))) as Saldo
          from Lote_Muda
          where Lote_Muda.Id_Especie = :Va_Id_Especie
          into :Va_Id, :va_qtde_inicial,:va_qtde_classificada, :Va_Status, :va_qtde
      do
      begin

--Somando para ser utilizado no final
        if (Va_Status = 0) then
          Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento, 0) + Va_Qtde;
        else
          Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas, 0) + Va_Qtde;

         va_taxa_classificacao = (:va_qtde_classificada*100)/coalesce(:va_qtde_inicial,1);
        update Lote_Muda
        set Lote_Muda.Saldo = :Va_Qtde,
            Lote_Muda.taxa_classificacao = coalesce(:va_taxa_classificacao,0)
        where Lote_Muda.Id = :Va_Id;

      end
    end

    if (Va_Qtde_Total_Mudas_Desenvolvimento is null) then
      Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento_Atual, 0);

    if (Va_Qtde_Total_Mudas_Prontas is null) then
      Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas_Atual, 0);

    if (Va_Qtde_Total_Sementes is null) then
      Va_Qtde_Total_Sementes = coalesce(Va_Qtde_Total_Sementes_Atual, 0);

    update Especie
    set Especie.Qtde_Muda_Desenvolvimento = :Va_Qtde_Total_Mudas_Desenvolvimento,
        Especie.Qtde_Muda_Pronta = :Va_Qtde_Total_Mudas_Prontas,
        Especie.Qtde_Semente_Estoque = :Va_Qtde_Total_Sementes
    where Especie.Id = :Va_Id_Especie;

  end
  suspend;
end^

SET TERM ; ^



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
                 Lote_Muda.Qtde_Classificada,
                 Lote_Muda.Status,
                 (coalesce(Lote_Muda.Qtde_Classificada, 0) - (coalesce((select sum(Saida_Item.Qtde)
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

    if (Va_Qtde_Total_Mudas_Desenvolvimento is null) then
      Va_Qtde_Total_Mudas_Desenvolvimento = coalesce(Va_Qtde_Total_Mudas_Desenvolvimento_Atual, 0);

    if (Va_Qtde_Total_Mudas_Prontas is null) then
      Va_Qtde_Total_Mudas_Prontas = coalesce(Va_Qtde_Total_Mudas_Prontas_Atual, 0);

    if (Va_Qtde_Total_Sementes is null) then
      Va_Qtde_Total_Sementes = coalesce(Va_Qtde_Total_Sementes_Atual, 0);

    update Especie
    set Especie.Qtde_Muda_Desenvolvimento = :Va_Qtde_Total_Mudas_Desenvolvimento,
        Especie.Qtde_Muda_Pronta = :Va_Qtde_Total_Mudas_Prontas,
        Especie.Qtde_Semente_Estoque = :Va_Qtde_Total_Sementes
    where Especie.Id = :Va_Id_Especie;

  end
  suspend;
end^

SET TERM ; ^

