

ALTER TABLE LOTE_SEMENTE
    ADD ID_COLETA INTEGER;

COMMENT ON COLUMN LOTE_SEMENTE.ID_COLETA IS
'Id do lote do song mobile. Utilizado para busca na tela de lote. Alguns saquinhos de sementes terao somente esse numero
anotado.';

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
alter ID_COLETA position 7;

alter table LOTE_SEMENTE
alter NOME position 8;

alter table LOTE_SEMENTE
alter DATA position 9;

alter table LOTE_SEMENTE
alter QTDE position 10;

alter table LOTE_SEMENTE
alter QTDE_ARMAZENADA position 11;

alter table LOTE_SEMENTE
alter TAXA_GERMINACAO position 12;

alter table LOTE_SEMENTE
alter TAXA_DESCARTE position 13;

alter table LOTE_SEMENTE
alter STATUS position 14;



ALTER TABLE VENDA_ITEM
    ADD ID_CANTEIRO INTEGER;

alter table VENDA_ITEM
alter ID position 1;

alter table VENDA_ITEM
alter ID_VENDA position 2;

alter table VENDA_ITEM
alter ID_ITEM position 3;

alter table VENDA_ITEM
alter ID_ESPECIE position 4;

alter table VENDA_ITEM
alter ID_LOTE_SEMENTE position 5;

alter table VENDA_ITEM
alter ID_LOTE_MUDA position 6;

alter table VENDA_ITEM
alter ID_CANTEIRO position 7;

alter table VENDA_ITEM
alter QTDE position 8;

alter table VENDA_ITEM
alter VALOR_UNITARIO position 9;



ALTER TABLE VENDA_ITEM
ADD CONSTRAINT FK_VENDA_ITEM_6
FOREIGN KEY (ID_CANTEIRO)
REFERENCES CANTEIRO(ID)
ON UPDATE CASCADE;

