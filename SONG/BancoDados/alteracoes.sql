

ALTER TABLE LOTE_SEMENTE
    ADD ID_LOTE_SEMENTE_ORIGEM INTEGER;

COMMENT ON COLUMN LOTE_SEMENTE.ID_LOTE_SEMENTE_ORIGEM IS
'Alguns lotes de sementes sao gerados a partir do resto nao semeado de outro, entao nesse caso esse campo sera preenchido.';

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
alter ID_LOTE_SEMENTE_ORIGEM position 6;

alter table LOTE_SEMENTE
alter NOME position 7;

alter table LOTE_SEMENTE
alter DATA position 8;

alter table LOTE_SEMENTE
alter QTDE position 9;

alter table LOTE_SEMENTE
alter QTDE_ARMAZENADA position 10;

alter table LOTE_SEMENTE
alter TAXA_GERMINACAO position 11;

alter table LOTE_SEMENTE
alter TAXA_DESCARTE position 12;

alter table LOTE_SEMENTE
alter STATUS position 13;



ALTER TABLE LOTE_SEMENTE
ADD CONSTRAINT FK_LOTE_SEMENTE_5
FOREIGN KEY (ID_LOTE_SEMENTE_ORIGEM)
REFERENCES LOTE_SEMENTE(ID)
ON DELETE SET NULL
ON UPDATE CASCADE;

