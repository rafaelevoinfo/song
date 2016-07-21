

ALTER TABLE PATRIMONIO
    ALTER STATUS TO ATIVO;



ALTER TABLE PATRIMONIO
    ALTER ATIVO TO STATUS;



ALTER TABLE PATRIMONIO
    ADD MODELO VARCHAR(100),
    ADD OBSERVACAO D_DESCRICAO;

alter table PATRIMONIO
alter ID position 1;

alter table PATRIMONIO
alter ID_ITEM_PATRIMONIO position 2;

alter table PATRIMONIO
alter DATA_AQUISICAO position 3;

alter table PATRIMONIO
alter IDENTIFICACAO position 4;

alter table PATRIMONIO
alter MARCA position 5;

alter table PATRIMONIO
alter MODELO position 6;

alter table PATRIMONIO
alter VALOR_INICIAL position 7;

alter table PATRIMONIO
alter TAXA_DEPRECIACAO_ANUAL position 8;

alter table PATRIMONIO
alter LOCALIZACAO position 9;

alter table PATRIMONIO
alter NOTA_FISCAL position 10;

alter table PATRIMONIO
alter STATUS position 11;

alter table PATRIMONIO
alter OBSERVACAO position 12;

