

CREATE TABLE ORCAMENTO_ITEM (
    ID INTEGER NOT NULL,
    ID_ORCAMENTO INTEGER NOT NULL,
    ID_ITEM INTEGER NOT NULL,
    ID_ESPECIE INTEGER NOT NULL,
    QTDE NUMERIC(15,4) NOT NULL,
    VALOR_UNITARIO NUMERIC(15,2) NOT NULL);

ALTER TABLE ORCAMENTO_ITEM
ADD CONSTRAINT PK_ORCAMENTO_ITEM
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_ORCAMENTO_ITEM;



ALTER TABLE ORCAMENTO_ITEM
ADD CONSTRAINT FK_ORCAMENTO_ITEM_1
FOREIGN KEY (ID_ORCAMENTO)
REFERENCES ORCAMENTO(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE ORCAMENTO_ITEM
ADD CONSTRAINT FK_ORCAMENTO_ITEM_2
FOREIGN KEY (ID_ITEM)
REFERENCES ITEM(ID)
ON UPDATE CASCADE;

ALTER TABLE ORCAMENTO_ITEM
ADD CONSTRAINT FK_ORCAMENTO_ITEM_3
FOREIGN KEY (ID_ESPECIE)
REFERENCES ESPECIE(ID)
ON UPDATE CASCADE;



DROP TABLE ORCAMENTO_VALOR;



CREATE TABLE ORCAMENTO_CUSTOMIZADO (
    ID INTEGER NOT NULL,
    ID_ORCAMENTO INTEGER NOT NULL,
    CAMPO VARCHAR(100) NOT NULL,
    CONTEUDO VARCHAR(250) NOT NULL);

ALTER TABLE ORCAMENTO_CUSTOMIZADO
ADD CONSTRAINT PK_ORCAMENTO_CUSTOMIZADO
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_ORCAMENTO_CUSTOMIZADO;



ALTER TABLE ORCAMENTO_CUSTOMIZADO
ADD CONSTRAINT FK_ORCAMENTO_CUSTOMIZADO_1
FOREIGN KEY (ID_ORCAMENTO)
REFERENCES ORCAMENTO(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;



ALTER TABLE ORCAMENTO ALTER ORCAMENTO DROP NOT NULL;

