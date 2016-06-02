

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

