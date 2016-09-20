

ALTER TABLE ESPECIE
    ADD BIOMA VARCHAR(20);

ALTER TABLE ESPECIE
    ALTER EXOTICA TO CLASSIFICACAO;

ALTER TABLE ESPECIE
    ALTER CLASSIFICACAO TYPE SMALLINT;

COMMENT ON COLUMN ESPECIE.CLASSIFICACAO IS
'Classificacao da especie
0 - Pioneiras
1 - Secundarias
2 - Climax';

COMMENT ON COLUMN ESPECIE.BIOMA IS
'Bioma da especie (campo conterar o Editvalue de um cxCheckComboBox)
0 - Amazonia
1 - Cerrado
2 - Mata Atlantica
3 - Caatinga
4 - Pampa
5 - Pantanal';



ALTER TABLE PATRIMONIO
    ADD RESPONSAVEL INTEGER;

alter table PATRIMONIO
alter ID position 1;

alter table PATRIMONIO
alter ID_ITEM_PATRIMONIO position 2;

alter table PATRIMONIO
alter RESPONSAVEL position 3;

alter table PATRIMONIO
alter DATA_AQUISICAO position 4;

alter table PATRIMONIO
alter IDENTIFICACAO position 5;

alter table PATRIMONIO
alter MARCA position 6;

alter table PATRIMONIO
alter MODELO position 7;

alter table PATRIMONIO
alter VALOR_INICIAL position 8;

alter table PATRIMONIO
alter TAXA_DEPRECIACAO_ANUAL position 9;

alter table PATRIMONIO
alter LOCALIZACAO position 10;

alter table PATRIMONIO
alter NOTA_FISCAL position 11;

alter table PATRIMONIO
alter STATUS position 12;

alter table PATRIMONIO
alter OBSERVACAO position 13;



ALTER TABLE PATRIMONIO
    ALTER RESPONSAVEL TO ID_PESSOA_RESPONSAVEL;

COMMENT ON COLUMN PATRIMONIO.ID_PESSOA_RESPONSAVEL IS
'Pessoa responsavel por este patrimonio';



alter table PATRIMONIO
alter ID position 1;

alter table PATRIMONIO
alter ID_ITEM_PATRIMONIO position 2;

alter table PATRIMONIO
alter DATA_AQUISICAO position 3;

alter table PATRIMONIO
alter ID_PESSOA_RESPONSAVEL position 4;

alter table PATRIMONIO
alter IDENTIFICACAO position 5;

alter table PATRIMONIO
alter MARCA position 6;

alter table PATRIMONIO
alter MODELO position 7;

alter table PATRIMONIO
alter VALOR_INICIAL position 8;

alter table PATRIMONIO
alter TAXA_DEPRECIACAO_ANUAL position 9;

alter table PATRIMONIO
alter LOCALIZACAO position 10;

alter table PATRIMONIO
alter NOTA_FISCAL position 11;

alter table PATRIMONIO
alter STATUS position 12;

alter table PATRIMONIO
alter OBSERVACAO position 13;



ALTER TABLE PATRIMONIO
ADD CONSTRAINT FK_PATRIMONIO_2
FOREIGN KEY (ID_PESSOA_RESPONSAVEL)
REFERENCES PESSOA(ID)
ON UPDATE CASCADE;



DROP TABLE CONTA_RECEBER_ATIVIDADE;



DROP TABLE CONTA_RECEBER_PROJETO;



COMMENT ON COLUMN ESPECIE.BIOMA IS
'';



ALTER TABLE ESPECIE DROP BIOMA;



CREATE TABLE ESPECIE_BIOMA (
    ID INTEGER NOT NULL,
    ID_ESPECIE INTEGER NOT NULL,
    BIOMA SMALLINT NOT NULL);

ALTER TABLE ESPECIE_BIOMA
ADD CONSTRAINT PK_ESPECIE_BIOMA
PRIMARY KEY (ID);

COMMENT ON COLUMN ESPECIE_BIOMA.BIOMA IS
'Bioma da especie (campo conterar o Editvalue de um cxCheckComboBox)
0 - Amazonia
1 - Cerrado
2 - Mata Atlantica
3 - Caatinga
4 - Pampa
5 - Pantanal';

CREATE SEQUENCE GEN_ESPECIE_BIOMA;



ALTER TABLE ESPECIE_BIOMA
ADD CONSTRAINT FK_ESPECIE_BIOMA_1
FOREIGN KEY (ID_ESPECIE)
REFERENCES ESPECIE(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;



COMMENT ON COLUMN ESPECIE_BIOMA.BIOMA IS
'Bioma da especie (campo conterar o Editvalue de um cxCheckComboBox)
0 - Amazonia
1 - Cerrado
2 - Mata Atlantica
3 - Caatinga
4 - Pampa
5 - Pantanal
6 - Exotico (Bioma que nao e brasileiro)';

