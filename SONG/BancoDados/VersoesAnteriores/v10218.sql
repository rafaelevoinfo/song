



CREATE TABLE AGENDA (
    ID INTEGER NOT NULL,
    NOME D_NOME NOT NULL,
    TIPO SMALLINT NOT NULL);

ALTER TABLE AGENDA
ADD CONSTRAINT PK_AGENDA
PRIMARY KEY (ID);

COMMENT ON COLUMN AGENDA.TIPO IS
'Tipo desta agenda
0 - Pessoal
1 - Outro';

CREATE SEQUENCE GEN_AGENDA;



CREATE TABLE AGENDA_PESSOA (
    ID INTEGER NOT NULL,
    ID_AGENDA INTEGER NOT NULL,
    ID_PESSOA INTEGER NOT NULL,
    SOMENTE_VISUALIZACAO SMALLINT NOT NULL);

ALTER TABLE AGENDA_PESSOA
ADD CONSTRAINT PK_AGENDA_PESSOA
PRIMARY KEY (ID);

COMMENT ON COLUMN AGENDA_PESSOA.SOMENTE_VISUALIZACAO IS
'0 - Nao
1 - Sim';

CREATE SEQUENCE GEN_AGENDA_PESSOA;



CREATE TABLE AGENDA_REGISTRO (
    ID INTEGER NOT NULL,
    TITULO VARCHAR(150) CHARACTER SET WIN1252 NOT NULL,
    DESCRICAO D_DESCRICAO,
    DATA_INICIO DATE NOT NULL,
    DATA_FIM DATE NOT NULL,
    HORA_INICIO TIME,
    HORA_FIM INTEGER);

ALTER TABLE AGENDA_REGISTRO
ADD CONSTRAINT PK_AGENDA_REGISTRO
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_AGENDA_REGISTRO;



ALTER TABLE AGENDA_PESSOA
ADD CONSTRAINT FK_AGENDA_PESSOA_1
FOREIGN KEY (ID_AGENDA)
REFERENCES AGENDA(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE AGENDA_PESSOA
ADD CONSTRAINT FK_AGENDA_PESSOA_2
FOREIGN KEY (ID_PESSOA)
REFERENCES PESSOA(ID)
ON UPDATE CASCADE;



ALTER TABLE AGENDA_REGISTRO
    ADD RECURRENCE_INDEX INTEGER,
    ADD RECURRENCE_INFO BLOB SUB_TYPE 0 SEGMENT SIZE 80;



ALTER TABLE AGENDA
    ADD ID_PROJETO INTEGER;

COMMENT ON COLUMN AGENDA.ID_PROJETO IS
'Projeto vinculado a esta agenda';



ALTER TABLE AGENDA_REGISTRO
    ADD ID_AGENDA INTEGER NOT NULL,
    ADD PARENT_ID INTEGER;

alter table AGENDA_REGISTRO
alter ID position 1;

alter table AGENDA_REGISTRO
alter ID_AGENDA position 2;

alter table AGENDA_REGISTRO
alter TITULO position 3;

alter table AGENDA_REGISTRO
alter DESCRICAO position 4;

alter table AGENDA_REGISTRO
alter DATA_INICIO position 5;

alter table AGENDA_REGISTRO
alter DATA_FIM position 6;

alter table AGENDA_REGISTRO
alter HORA_INICIO position 7;

alter table AGENDA_REGISTRO
alter HORA_FIM position 8;

alter table AGENDA_REGISTRO
alter RECURRENCE_INDEX position 9;

alter table AGENDA_REGISTRO
alter RECURRENCE_INFO position 10;

alter table AGENDA_REGISTRO
alter PARENT_ID position 11;



ALTER TABLE AGENDA_REGISTRO
ADD CONSTRAINT FK_AGENDA_REGISTRO_1
FOREIGN KEY (ID_AGENDA)
REFERENCES AGENDA(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;



ALTER TABLE AGENDA_REGISTRO
    ADD EVENT_TYPE INTEGER,
    ADD LABEL_COLOR INTEGER;



ALTER TABLE AGENDA
    ADD ATIVO SMALLINT NOT NULL;

alter table AGENDA
alter ID position 1;

alter table AGENDA
alter ID_PROJETO position 2;

alter table AGENDA
alter NOME position 3;

alter table AGENDA
alter TIPO position 4;

alter table AGENDA
alter ATIVO position 5;



ALTER TABLE AGENDA
ADD CONSTRAINT FK_AGENDA_1
FOREIGN KEY (ID_PROJETO)
REFERENCES PROJETO(ID)
ON UPDATE CASCADE;



ALTER TABLE AGENDA_REGISTRO DROP HORA_INICIO;



ALTER TABLE AGENDA_REGISTRO DROP HORA_FIM;



ALTER TABLE AGENDA_REGISTRO
    ALTER DATA_INICIO TYPE TIMESTAMP,
    ALTER DATA_FIM TYPE TIMESTAMP;



ALTER TABLE AGENDA_REGISTRO
    ADD ACTUAL_START INTEGER,
    ADD ACTUAL_FINISH INTEGER;



ALTER TABLE AGENDA_REGISTRO
    ADD OPTIONS INTEGER;



update RDB$RELATION_FIELDS set
RDB$NULL_FLAG = NULL
where (RDB$FIELD_NAME = 'TITULO') and
(RDB$RELATION_NAME = 'AGENDA_REGISTRO')
;



ALTER TABLE AGENDA_REGISTRO
    ADD LOCAL VARCHAR(150);



CREATE TABLE ITEM_PATRIMONIO (
    ID INTEGER NOT NULL,
    NOME D_NOME NOT NULL,
    ATIVO D_BOOLEAN NOT NULL,
    TAXA_DEPRECIACAO_ANUAL INTEGER);

ALTER TABLE ITEM_PATRIMONIO
ADD CONSTRAINT PK_ITEM_PATRIMONIO
PRIMARY KEY (ID);

COMMENT ON COLUMN ITEM_PATRIMONIO.ATIVO IS
'0 - Ativo
1 - Inativo';

COMMENT ON COLUMN ITEM_PATRIMONIO.TAXA_DEPRECIACAO_ANUAL IS
'Taxa de depreciacao anual padrao do item.';

CREATE SEQUENCE GEN_ITEM_PATRIMONIO;



CREATE TABLE PATRIMONIO (
    ID INTEGER NOT NULL,
    ID_ITEM_PATRIMONIO INTEGER NOT NULL,
    DATA_AQUISICAO TIMESTAMP NOT NULL,
    IDENTIFICACAO VARCHAR(20) CHARACTER SET WIN1252 COLLATE WIN_PTBR,
    MARCA D_NOME,
    VALOR_INICIAL NUMERIC(15,2),
    TAXA_DEPRECIACAO_ANUAL INTEGER,
    LOCALIZACAO D_NOME,
    NOTA_FISCAL VARCHAR(50),
    STATUS SMALLINT);

ALTER TABLE PATRIMONIO
ADD CONSTRAINT PK_PATRIMONIO
PRIMARY KEY (ID);

COMMENT ON COLUMN PATRIMONIO.IDENTIFICACAO IS
'Numero da placa de identificacao (numero unico que identifica o bem)';

COMMENT ON COLUMN PATRIMONIO.LOCALIZACAO IS
'Local onde se encontra o item';

COMMENT ON COLUMN PATRIMONIO.NOTA_FISCAL IS
'Numero da nota fiscal';

COMMENT ON COLUMN PATRIMONIO.STATUS IS
'Status do item
0 - Ativo
1 - Baixado (Inativo)';

CREATE SEQUENCE GEN_PATRIMONIO;



ALTER TABLE PATRIMONIO
ADD CONSTRAINT FK_PATRIMONIO_1
FOREIGN KEY (ID_ITEM_PATRIMONIO)
REFERENCES ITEM_PATRIMONIO(ID)
ON UPDATE CASCADE;
