

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



ALTER TABLE ESPECIE
    ADD ID_TIPO_ESPECIE INTEGER;

alter table ESPECIE
alter ID position 1;

alter table ESPECIE
alter NOME position 2;

alter table ESPECIE
alter NOME_CIENTIFICO position 3;

alter table ESPECIE
alter ID_FAMILIA_BOTANICA position 4;

alter table ESPECIE
alter ID_TIPO_ESPECIE position 5;

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

alter table ESPECIE
alter QTDE_SEMENTE_TUBETE position 18;

alter table ESPECIE
alter CLASSIFICACAO position 19;



CREATE TABLE TIPO_ESPECIE (
    ID INTEGER NOT NULL,
    NOME D_NOME NOT NULL,
    DESCRICAO D_DESCRICAO);

ALTER TABLE TIPO_ESPECIE
ADD CONSTRAINT PK_TIPO_ESPECIE
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_TIPO_ESPECIE;



ALTER TABLE ESPECIE
    ADD CATEGORIA_ARMAZENAMENTO SMALLINT;

COMMENT ON COLUMN ESPECIE.CATEGORIA_ARMAZENAMENTO IS
'0 - Ortodoxas
1 - Recalcitrantes
2 - Intermediaria';



ALTER TABLE ESPECIE
ADD CONSTRAINT FK_ESPECIE_2
FOREIGN KEY (ID_TIPO_ESPECIE)
REFERENCES TIPO_ESPECIE(ID)
ON UPDATE CASCADE;

