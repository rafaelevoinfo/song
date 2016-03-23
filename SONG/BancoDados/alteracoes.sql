

ALTER TABLE ESPECIE
    ADD INICIO_PERIODO_COLETA DATE,
    ADD FIM_PERIODO_COLETA DATE;

COMMENT ON COLUMN ESPECIE.INICIO_PERIODO_COLETA IS
'Inicio do periodo ideal para realizar a coleta das sementes';

COMMENT ON COLUMN ESPECIE.FIM_PERIODO_COLETA IS
'Fim do periodo ideal para realizar a coleta das sementes';



CREATE TABLE LOTE_SEMENTE (
    ID                 INTEGER NOT NULL,
    ID_ESPECIE         INTEGER NOT NULL,
    ID_PESSOA_COLETOU  INTEGER NOT NULL,
    NOME               VARCHAR(30) NOT NULL,
    DATA               DATE NOT NULL,
    QTDE               NUMERIC(15,2) NOT NULL,
    QTDE_ARMAZENADA    NUMERIC(15,2),
    TAXA_GERMINACAO    NUMERIC(15,2),
    TAXA_DESCARTE      COMPUTED BY (100-TAXA_GERMINACAO),
    STATUS             SMALLINT
);


ALTER TABLE LOTE_SEMENTE ADD CONSTRAINT PK_LOTE_SEMENTE PRIMARY KEY (ID);


ALTER TABLE LOTE_SEMENTE ADD CONSTRAINT FK_LOTE_SEMENTE_1 FOREIGN KEY (ID_PESSOA_COLETOU) REFERENCES PESSOA (ID) ON UPDATE CASCADE;
ALTER TABLE LOTE_SEMENTE ADD CONSTRAINT FK_LOTE_SEMENTE_2 FOREIGN KEY (ID_ESPECIE) REFERENCES ESPECIE (ID) ON UPDATE CASCADE;


COMMENT ON COLUMN LOTE_SEMENTE.DATA IS
'Data de coleta ou da compra';

COMMENT ON COLUMN LOTE_SEMENTE.QTDE IS
'Qtde de sementes coletadas/compradas em kilos';

COMMENT ON COLUMN LOTE_SEMENTE.QTDE_ARMAZENADA IS
'Qtde em kilos de sementes em estoque';

COMMENT ON COLUMN LOTE_SEMENTE.TAXA_GERMINACAO IS
'Percentual de germinacao desse lote';

COMMENT ON COLUMN LOTE_SEMENTE.TAXA_DESCARTE IS
'Taxa de descarte desse lote (100 - Taxa de Germinacao)';

COMMENT ON COLUMN LOTE_SEMENTE.STATUS IS
'0|NULL - Aberto (Processo de semeadura e germinacao em andamento)
1 - Fechado (Semeadura e germinacao finalizados)';



CREATE TABLE LOTE_SEMENTE_MATRIZ (
    ID         INTEGER NOT NULL,
    ID_LOTE    INTEGER NOT NULL,
    ID_MATRIZ  INTEGER NOT NULL
);

ALTER TABLE LOTE_SEMENTE_MATRIZ ADD CONSTRAINT PK_LOTE_SEMENTE_MATRIZ PRIMARY KEY (ID);

ALTER TABLE LOTE_SEMENTE_MATRIZ ADD CONSTRAINT FK_LOTE_SEMENTE_MATRIZ_1 FOREIGN KEY (ID_LOTE) REFERENCES LOTE_SEMENTE (ID) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE LOTE_SEMENTE_MATRIZ ADD CONSTRAINT FK_LOTE_SEMENTE_MATRIZ_2 FOREIGN KEY (ID_MATRIZ) REFERENCES MATRIZ (ID) ON UPDATE CASCADE;


delete from lote;

delete from germinacao;

delete from semeadura;

DROP TABLE LOTE_MATRIZ;








ALTER TABLE GERMINACAO DROP CONSTRAINT FK_GERMINACAO_1;



ALTER TABLE GERMINACAO ALTER ID_LOTE TO ID_LOTE_SEMENTE;



ALTER TABLE GERMINACAO
ADD CONSTRAINT FK_GERMINACAO_1
FOREIGN KEY (ID_LOTE_SEMENTE)
REFERENCES LOTE_SEMENTE(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;



ALTER TABLE SEMEADURA DROP CONSTRAINT FK_SEMEADURA_1;



ALTER TABLE SEMEADURA ALTER ID_LOTE TO ID_LOTE_SEMEADURA;



ALTER TABLE SEMEADURA ALTER ID_LOTE_SEMEADURA TO ID_LOTE_SEMENTE;



ALTER TABLE SEMEADURA
ADD CONSTRAINT FK_SEMEADURA_1
FOREIGN KEY (ID_LOTE_SEMENTE)
REFERENCES LOTE_SEMENTE(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;



DROP TABLE LOTE;



ALTER TABLE LOTE_SEMENTE_MATRIZ DROP CONSTRAINT FK_LOTE_SEMENTE_MATRIZ_1;



ALTER TABLE LOTE_SEMENTE_MATRIZ ALTER ID_LOTE TO ID_LOTE_SEMENTE;



ALTER TABLE LOTE_SEMENTE_MATRIZ
ADD CONSTRAINT FK_LOTE_SEMENTE_MATRIZ_1
FOREIGN KEY (ID_LOTE_SEMENTE)
REFERENCES LOTE_SEMENTE(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;



DROP SEQUENCE GEN_LOTE;

CREATE SEQUENCE GEN_LOTE_SEMENTE;



DROP SEQUENCE GEN_LOTE_MATRIZ;

CREATE SEQUENCE GEN_LOTE_SEMENTE_MATRIZ;

ALTER SEQUENCE GEN_LOTE_SEMENTE_MATRIZ RESTART WITH 15;



ALTER TABLE SEMEADURA
    ADD QTDE_TUBETE INTEGER;

COMMENT ON COLUMN SEMEADURA.QTDE_TUBETE IS
'Qtde. tubetes semeados';



update RDB$RELATION_FIELDS set
RDB$NULL_FLAG = 1
where (RDB$FIELD_NAME = 'QTDE_TUBETE') and
(RDB$RELATION_NAME = 'SEMEADURA')
;



alter table SEMEADURA
alter ID position 1;

alter table SEMEADURA
alter ID_LOTE_SEMENTE position 2;

alter table SEMEADURA
alter ID_PESSOA_SEMEOU position 3;

alter table SEMEADURA
alter ID_CANTEIRO position 4;

alter table SEMEADURA
alter QTDE_SEMEADA position 5;

alter table SEMEADURA
alter QTDE_TUBETE position 6;

alter table SEMEADURA
alter DATA position 7;

alter table SEMEADURA
alter DATA_PREVISTA_GERMINACAO position 8;

alter table SEMEADURA
alter OBSERVACAO position 9;



CREATE TABLE LOTE_MUDA (
    ID INTEGER NOT NULL,
    ID_ESPECIE INTEGER NOT NULL,
    NOME D_NOME NOT NULL,
    QTDE INTEGER NOT NULL,
    QTDE_INICIAL INTEGER NOT NULL,
    DATA TIMESTAMP NOT NULL);

ALTER TABLE LOTE_MUDA
ADD CONSTRAINT PK_LOTE_MUDA
PRIMARY KEY (ID);

COMMENT ON COLUMN LOTE_MUDA.QTDE IS
'Qtde atual de mudas no lote';

COMMENT ON COLUMN LOTE_MUDA.QTDE_INICIAL IS
'Qtde. inicial de mudas do lote';

COMMENT ON COLUMN LOTE_MUDA.DATA IS
'Data e Hora da inclus�o do lote';

CREATE SEQUENCE GEN_LOTE_MUDA;



ALTER TABLE LOTE_MUDA
    ADD ID_PESSOA INTEGER;

COMMENT ON COLUMN LOTE_MUDA.ID_PESSOA IS
'Pessoa que incluiu o lote';

alter table LOTE_MUDA
alter ID position 1;

alter table LOTE_MUDA
alter ID_ESPECIE position 2;

alter table LOTE_MUDA
alter ID_PESSOA position 3;

alter table LOTE_MUDA
alter NOME position 4;

alter table LOTE_MUDA
alter QTDE position 5;

alter table LOTE_MUDA
alter QTDE_INICIAL position 6;

alter table LOTE_MUDA
alter DATA position 7;



ALTER TABLE LOTE_MUDA
ADD CONSTRAINT FK_LOTE_MUDA_2
FOREIGN KEY (ID_PESSOA)
REFERENCES PESSOA(ID)
ON UPDATE caSCADE;



ALTER TABLE LOTE_MUDA
    ADD OBSERVACAO D_DESCRICAO;



CREATE TABLE CLASSIFICACAO (
    ID INTEGER NOT NULL,
    ID_PESSOA_CLASSIFICOU INTEGER NOT NULL,
    DATA DATE NOT NULL,
    QTDE INTEGER NOT NULL,
    OBSERVACAO D_DESCRICAO);

ALTER TABLE CLASSIFICACAO
ADD CONSTRAINT PK_CLASSIFICACAO
PRIMARY KEY (ID);

COMMENT ON COLUMN CLASSIFICACAO.QTDE IS
'Qtde. de mudas ainda existentes';

CREATE SEQUENCE GEN_CLASSIFICACAO;



ALTER TABLE CLASSIFICACAO
    ADD ID_LOTE_MUDA INTEGER;

alter table CLASSIFICACAO
alter ID position 1;

alter table CLASSIFICACAO
alter ID_LOTE_MUDA position 2;

alter table CLASSIFICACAO
alter ID_PESSOA_CLASSIFICOU position 3;

alter table CLASSIFICACAO
alter DATA position 4;

alter table CLASSIFICACAO
alter QTDE position 5;

alter table CLASSIFICACAO
alter OBSERVACAO position 6;



ALTER TABLE CLASSIFICACAO
ADD CONSTRAINT FK_CLASSIFICACAO_1
FOREIGN KEY (ID_LOTE_MUDA)
REFERENCES LOTE_MUDA(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE CLASSIFICACAO
ADD CONSTRAINT FK_CLASSIFICACAO_2
FOREIGN KEY (ID_PESSOA_CLASSIFICOU)
REFERENCES PESSOA(ID)
ON UPDATE CASCADE;



update RDB$RELATION_FIELDS set
RDB$NULL_FLAG = 1
where (RDB$FIELD_NAME = 'ID_LOTE_MUDA') and
(RDB$RELATION_NAME = 'CLASSIFICACAO')
;



ALTER TABLE LOTE_MUDA DROP ID_PESSOA;

