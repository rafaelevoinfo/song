

CREATE TABLE LOTE_SEMENTE_LOCALIZACAO (
    ID INTEGER NOT NULL,
    NOME D_NOME NOT NULL);

ALTER TABLE LOTE_SEMENTE_LOCALIZACAO
ADD CONSTRAINT PK_LOTE_SEMENTE_LOCALIZACAO
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_LOTE_SEMENTE_LOCALIZACAO;



ALTER TABLE LOTE_SEMENTE
    ADD ID_CAMARA_FRIA INTEGER;



DROP TABLE LOTE_SEMENTE_LOCALIZACAO;



CREATE TABLE CAMARA_FRIA (
    ID INTEGER NOT NULL,
    NOME D_NOME NOT NULL);

ALTER TABLE CAMARA_FRIA
ADD CONSTRAINT PK_CAMARA_FRIA
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_CAMARA_FRIA;



DROP SEQUENCE GEN_LOTE_SEMENTE_LOCALIZACAO;



alter table LOTE_SEMENTE
alter ID position 1;

alter table LOTE_SEMENTE
alter ID_ESPECIE position 2;

alter table LOTE_SEMENTE
alter ID_PESSOA_COLETOU position 3;

alter table LOTE_SEMENTE
alter ID_COMPRA_ITEM position 4;

alter table LOTE_SEMENTE
alter ID_CAMARA_FRIA position 5;

alter table LOTE_SEMENTE
alter NOME position 6;

alter table LOTE_SEMENTE
alter DATA position 7;

alter table LOTE_SEMENTE
alter QTDE position 8;

alter table LOTE_SEMENTE
alter QTDE_ARMAZENADA position 9;

alter table LOTE_SEMENTE
alter TAXA_GERMINACAO position 10;

alter table LOTE_SEMENTE
alter TAXA_DESCARTE position 11;

alter table LOTE_SEMENTE
alter STATUS position 12;



ALTER TABLE LOTE_SEMENTE
ADD CONSTRAINT FK_LOTE_SEMENTE_4
FOREIGN KEY (ID_CAMARA_FRIA)
REFERENCES CAMARA_FRIA(ID)
ON UPDATE CASCADE;



ALTER TABLE CONTA_PAGAR_AUTORIZACAO DROP CONSTRAINT FK_CONTA_PAGAR_AUTORIZACAO_1;

ALTER TABLE CONTA_PAGAR_AUTORIZACAO
ADD CONSTRAINT FK_CONTA_PAGAR_AUTORIZACAO_1
FOREIGN KEY (ID_CONTA_PAGAR)
REFERENCES CONTA_PAGAR(ID)
ON DELETE CASCADE
ON UPDATE CASCADE
USING INDEX FK_CONTA_PAGAR_AUTORIZACAO_1;

