

ALTER TABLE ATIVIDADE
    ADD DATA_FINALIZACAO TIMESTAMP;

COMMENT ON COLUMN ATIVIDADE.DATA_FINALIZACAO IS
'Data em que a atividade teve seu status alterado para finalizada ou cancelada';



CREATE TABLE AREA_ATUACAO (
    ID INTEGER NOT NULL,
    NOME D_NOME NOT NULL);

ALTER TABLE AREA_ATUACAO
ADD CONSTRAINT PK_AREA_ATUACAO
PRIMARY KEY (ID);

ALTER TABLE AREA_ATUACAO
ADD CONSTRAINT UNQ1_AREA_ATUACAO
UNIQUE (NOME);

CREATE SEQUENCE GEN_AREA_ATUACAO;



CREATE TABLE AREA_EXECUCAO (
    ID INTEGER NOT NULL,
    ID_AREA_ATUACAO INTEGER NOT NULL,
    NOME D_NOME NOT NULL);

ALTER TABLE AREA_EXECUCAO
ADD CONSTRAINT PK_AREA_EXECUCAO
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_AREA_EXECUCAO;



ALTER TABLE AREA_EXECUCAO
ADD CONSTRAINT FK_AREA_EXECUCAO_1
FOREIGN KEY (ID_AREA_ATUACAO)
REFERENCES AREA_ATUACAO(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;


ALTER TABLE PROJETO_AREA
    ADD ID_AREA_ATUACAO INTEGER;



ALTER TABLE PROJETO_AREA DROP CONSTRAINT UNQ1_PROJETO_AREA;


insert into Area_Atuacao
select distinct(next value for Gen_Area_Atuacao),
               Projeto_Area.Nome
from Projeto_Area;


update Projeto_Area
set Projeto_Area.Id_Area_Atuacao = (select first 1 Area_Atuacao.Id
                                   from Area_Atuacao
                                   where Area_Atuacao.Nome = Projeto_Area.Nome);
								   
								   



ALTER TABLE PROJETO_AREA
ADD CONSTRAINT UNQ1_PROJETO_AREA
UNIQUE (ID_PROJETO,ID_AREA_ATUACAO);



ALTER TABLE PROJETO_AREA DROP NOME;



update RDB$RELATION_FIELDS set
RDB$NULL_FLAG = 1
where (RDB$FIELD_NAME = 'ID_AREA_ATUACAO') and
(RDB$RELATION_NAME = 'PROJETO_AREA')
;





update RDB$RELATION_FIELDS set
RDB$NULL_FLAG = NULL
where (RDB$FIELD_NAME = 'ID_PROJETO') and
(RDB$RELATION_NAME = 'ATIVIDADE')
;



ALTER TABLE ATIVIDADE
    ADD ID_AREA_ATUACAO INTEGER,
    ADD ID_AREA_EXECUCAO INTEGER;

alter table ATIVIDADE
alter ID position 1;

alter table ATIVIDADE
alter ID_SOLICITANTE position 2;

alter table ATIVIDADE
alter ID_RESPONSAVEL position 3;

alter table ATIVIDADE
alter ID_PROJETO position 4;

alter table ATIVIDADE
alter ID_AREA_ATUACAO position 5;

alter table ATIVIDADE
alter ID_AREA_EXECUCAO position 6;

alter table ATIVIDADE
alter NOME position 7;

alter table ATIVIDADE
alter DESCRICAO position 8;

alter table ATIVIDADE
alter STATUS position 9;

alter table ATIVIDADE
alter DATA_INICIAL position 10;

alter table ATIVIDADE
alter DATA_FINAL position 11;

alter table ATIVIDADE
alter DATA_CADASTRO position 12;

alter table ATIVIDADE
alter DATA_ALTERACAO position 13;

alter table ATIVIDADE
alter DATA_FINALIZACAO position 14;



ALTER TABLE ATIVIDADE
ADD CONSTRAINT FK_ATIVIDADE_4
FOREIGN KEY (ID_AREA_ATUACAO)
REFERENCES AREA_ATUACAO(ID)
ON UPDATE CASCADE;

ALTER TABLE ATIVIDADE
ADD CONSTRAINT FK_ATIVIDADE_5
FOREIGN KEY (ID_AREA_EXECUCAO)
REFERENCES AREA_EXECUCAO(ID)
ON UPDATE CASCADE;



COMMENT ON COLUMN ATIVIDADE.ID_AREA_ATUACAO IS
'Area de atuacao desta atividade';



COMMENT ON COLUMN ATIVIDADE.ID_AREA_EXECUCAO IS
'Area de execucao desta atividade';



ALTER TABLE ESPECIE
    ADD EXOTICA D_BOOLEAN;

COMMENT ON COLUMN ESPECIE.EXOTICA IS
'Informa se a especie e exotica, ou seja, nao e nativa do Cerrado
0|NULL - Nao
1 - sim';

