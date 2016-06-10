

ALTER TABLE ESPECIE
    ADD PESO_MEDIO_SEMENTE NUMERIC(15,2);

COMMENT ON COLUMN ESPECIE.PESO_MEDIO_SEMENTE IS
'Peso medio em gramas da semente';



CREATE TABLE FAMILIA_BOTANICA (
    ID INTEGER NOT NULL,
    NOME D_NOME NOT NULL);

ALTER TABLE FAMILIA_BOTANICA
ADD CONSTRAINT PK_FAMILIA_BOTANICA
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_FAMILIA_BOTANICA;

SET TERM ^ ;
execute block
as
declare variable Nome varchar(100);
begin
  for select distinct trim(Especie.Familia_Botanica) as Familia_Botanica
      from Especie
      into :Nome
  do
  begin
    insert into Familia_Botanica
    values (next value for Gen_Familia_Botanica, :Nome);
  end
end^

SET TERM ; ^



ALTER TABLE ESPECIE
    ADD ID_FAMILIA_BOTANICA INTEGER;

alter table ESPECIE
alter ID position 1;

alter table ESPECIE
alter NOME position 2;

alter table ESPECIE
alter NOME_CIENTIFICO position 3;

alter table ESPECIE
alter FAMILIA_BOTANICA position 4;

alter table ESPECIE
alter ID_FAMILIA_BOTANICA position 5;

alter table ESPECIE
alter VALOR_MUDA position 6;

alter table ESPECIE
alter VALOR_KG_SEMENTE position 7;

alter table ESPECIE
alter TEMPO_GERMINACAO position 8;

alter table ESPECIE
alter QTDE_SEMENTE_KILO position 9;

alter table ESPECIE
alter QTDE_SEMENTE_ESTOQUE position 10;

alter table ESPECIE
alter QTDE_MUDA_PRONTA position 11;

alter table ESPECIE
alter QTDE_MUDA_DESENVOLVIMENTO position 12;

alter table ESPECIE
alter TEMPO_DESENVOLVIMENTO position 13;

alter table ESPECIE
alter OBSERVACAO position 14;

alter table ESPECIE
alter MES_INICIO_COLETA position 15;

alter table ESPECIE
alter MES_FIM_COLETA position 16;

alter table ESPECIE
alter PESO_MEDIO_SEMENTE position 17;



ALTER TABLE ESPECIE
ADD CONSTRAINT FK_ESPECIE_1
FOREIGN KEY (ID_FAMILIA_BOTANICA)
REFERENCES FAMILIA_BOTANICA(ID)
ON UPDATE CASCADE;


update Especie
set Especie.Id_Familia_Botanica = (select first 1 Familia_Botanica.Id
                                  from Familia_Botanica
                                  where Familia_Botanica.Nome = trim(Especie.Familia_Botanica));


ALTER TABLE ESPECIE DROP FAMILIA_BOTANICA;



ALTER TABLE ESPECIE DROP PESO_MEDIO_SEMENTE;



ALTER TABLE ESPECIE
    ADD PESO_MEDIO_SEMENTE NUMERIC(15,4);

COMMENT ON COLUMN ESPECIE.PESO_MEDIO_SEMENTE IS
'Peso medio da semente em gramas';

