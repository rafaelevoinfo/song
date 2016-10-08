

CREATE TABLE MODELO_ORCAMENTO (
    ID INTEGER NOT NULL,
    NOME D_NOME NOT NULL,
    DESCRICAO D_DESCRICAO,
    MODELO BLOB SUB_TYPE 0 SEGMENT SIZE 80 NOT NULL);

ALTER TABLE MODELO_ORCAMENTO
ADD CONSTRAINT PK_MODELO_ORCAMENTO
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_MODELO_ORCAMENTO;



CREATE TABLE ORCAMENTO (
    ID INTEGER NOT NULL,
    ID_MODELO INTEGER NOT NULL,
    ID_RESPONSAVEL INTEGER NOT NULL,
    ID_CLIENTE INTEGER NOT NULL,
    DATA TIMESTAMP NOT NULL,
    ORCAMENTO BLOB SUB_TYPE 0 SEGMENT SIZE 80 NOT NULL);

ALTER TABLE ORCAMENTO
ADD CONSTRAINT PK_ORCAMENTO
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_ORCAMENTO;



ALTER TABLE ORCAMENTO
ADD CONSTRAINT FK_ORCAMENTO_1
FOREIGN KEY (ID_MODELO)
REFERENCES MODELO_ORCAMENTO(ID);

ALTER TABLE ORCAMENTO
ADD CONSTRAINT FK_ORCAMENTO_2
FOREIGN KEY (ID_RESPONSAVEL)
REFERENCES PESSOA(ID);

ALTER TABLE ORCAMENTO
ADD CONSTRAINT FK_ORCAMENTO_3
FOREIGN KEY (ID_CLIENTE)
REFERENCES FIN_FOR_CLI(ID);



CREATE TABLE ORCAMENTO_VALOR (
    ID INTEGER NOT NULL,
    ID_ORCAMENTO INTEGER NOT NULL,
    CAMPO VARCHAR(60) NOT NULL,
    VALOR VARCHAR(250) NOT NULL);

ALTER TABLE ORCAMENTO_VALOR
ADD CONSTRAINT PK_ORCAMENTO_VALOR
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_ORCAMENTO_VALOR;



ALTER TABLE ORCAMENTO DROP CONSTRAINT FK_ORCAMENTO_1;



ALTER TABLE ORCAMENTO
    ALTER ID_MODELO TO ID_MODELO_ORCAMENTO;



ALTER TABLE ORCAMENTO
ADD CONSTRAINT FK_ORCAMENTO_1
FOREIGN KEY (ID_MODELO_ORCAMENTO)
REFERENCES MODELO_ORCAMENTO(ID);

