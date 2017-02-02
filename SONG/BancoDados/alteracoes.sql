

ALTER TABLE MATRIZ
    ADD ID_MOBILE INTEGER;

COMMENT ON COLUMN MATRIZ.ID_MOBILE IS
'ID da matriz no mobile';

alter table MATRIZ
alter ID position 1;

alter table MATRIZ
alter ID_ESPECIE position 2;

alter table MATRIZ
alter ID_MOBILE position 3;

alter table MATRIZ
alter NOME position 4;

alter table MATRIZ
alter ENDERECO position 5;

alter table MATRIZ
alter LATITUDE position 6;

alter table MATRIZ
alter LONGITUDE position 7;

alter table MATRIZ
alter DESCRICAO position 8;

alter table MATRIZ
alter FOTO position 9;



CREATE TABLE APARELHO_EXTERNO (
    ID INTEGER NOT NULL,
    NOME D_NOME NOT NULL,
    SERIAL VARCHAR(100) NOT NULL);

ALTER TABLE APARELHO_EXTERNO
ADD CONSTRAINT PK_APARELHO_EXTERNO
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_APARELHO_EXTERNO;



COMMENT ON TABLE APARELHO_EXTERNO IS 'Tabela de registro de dispositivos aptos a realizarem transferencias de dados para o song server.';



ALTER TABLE MATRIZ DROP ID_MOBILE;



ALTER TABLE LOTE_SEMENTE
    ALTER ID_COLETA TYPE VARCHAR(30);



COMMENT ON COLUMN LOTE_SEMENTE.ID_COLETA IS
'Id do lote do song mobile. Utilizado para busca na tela de lote. Alguns saquinhos de sementes terao somente esse numero
anotado.
Esse ID sera composto do ID_APARELHO+_+ID_LOTE_MOBILE
Ex.:
10_50
2_241';



