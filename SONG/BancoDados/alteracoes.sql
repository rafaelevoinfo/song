update PROJETO SET PROJETO.ORCAMENTO = 0 WHERE PROJETO.ORCAMENTO IS NULL;

update RDB$RELATION_FIELDS set
RDB$NULL_FLAG = 1
where (RDB$FIELD_NAME = 'ORCAMENTO') and
(RDB$RELATION_NAME = 'PROJETO')
;
	
ALTER TABLE FIN_FOR_CLI DROP CONSTRAINT UNQ2_FIN_FOR_CLI;



ALTER TABLE FIN_FOR_CLI
    ALTER CPF_CNPJ TYPE VARCHAR(18) CHARACTER SET WIN1252;



ALTER TABLE FIN_FOR_CLI
ADD CONSTRAINT UNQ1_FIN_FOR_CLI
UNIQUE (TIPO,CPF_CNPJ);




CREATE TABLE FUNDO (
    ID INTEGER NOT NULL,
    NOME D_NOME NOT NULL,
    SALDO NUMERIC(15,2) NOT NULL,
    DESCRICAO D_DESCRICAO);

ALTER TABLE FUNDO
ADD CONSTRAINT PK_FUNDO
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_FUNDO;



CREATE TABLE CONTA_PAGAR_VINCULO (
    ID INTEGER NOT NULL,
    ID_CONTA_PAGAR INTEGER NOT NULL,
    ID_FUNDO INTEGER,
    ID_PROJETO_ORIGEM INTEGER,
    ID_ATIVIDADE_ORIGEM INTEGER,
    ID_RUBRICA_ORIGEM INTEGER,
    ID_AREA_ATUACAO_ORIGEM INTEGER,
    ID_PROJETO_ALOCADO INTEGER,
    ID_ATIVIDADE_ALOCADO INTEGER,
    ID_RUBRICA_ALOCADO INTEGER,
    ID_ARE_ATUACAO_ALOCADO INTEGER,
    VALOR NUMERIC(15,2) NOT NULL);

ALTER TABLE CONTA_PAGAR_VINCULO
ADD CONSTRAINT PK_CONTA_PAGAR_VINCULO
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_CONTA_PAGAR_VINCULO;



COMMENT ON COLUMN CONTA_PAGAR_VINCULO.ID_PROJETO_ORIGEM IS
'Projeto do qual o dinheiro relamente vai sair';



COMMENT ON COLUMN CONTA_PAGAR_VINCULO.ID_PROJETO_ALOCADO IS
'Id do projeto para o qual o dinheiro foi necessario.';



ALTER TABLE CONTA_PAGAR_VINCULO
    ALTER ID_ARE_ATUACAO_ALOCADO TO ID_AREA_ATUACAO_ALOCADO;



ALTER TABLE CONTA_PAGAR_VINCULO
ADD CONSTRAINT FK_CONTA_PAGAR_VINCULO_1
FOREIGN KEY (ID_CONTA_PAGAR)
REFERENCES CONTA_PAGAR(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE CONTA_PAGAR_VINCULO
ADD CONSTRAINT FK_CONTA_PAGAR_VINCULO_2
FOREIGN KEY (ID_FUNDO)
REFERENCES FUNDO(ID)
ON UPDATE CASCADE;

ALTER TABLE CONTA_PAGAR_VINCULO
ADD CONSTRAINT FK_CONTA_PAGAR_VINCULO_3
FOREIGN KEY (ID_PROJETO_ORIGEM)
REFERENCES PROJETO(ID)
ON UPDATE CASCADE;

ALTER TABLE CONTA_PAGAR_VINCULO
ADD CONSTRAINT FK_CONTA_PAGAR_VINCULO_4
FOREIGN KEY (ID_ATIVIDADE_ORIGEM)
REFERENCES ATIVIDADE(ID)
ON UPDATE CASCADE;

ALTER TABLE CONTA_PAGAR_VINCULO
ADD CONSTRAINT FK_CONTA_PAGAR_VINCULO_5
FOREIGN KEY (ID_RUBRICA_ORIGEM)
REFERENCES RUBRICA(ID)
ON UPDATE CASCADE;

ALTER TABLE CONTA_PAGAR_VINCULO
ADD CONSTRAINT FK_CONTA_PAGAR_VINCULO_6
FOREIGN KEY (ID_AREA_ATUACAO_ORIGEM)
REFERENCES PROJETO_AREA(ID)
ON UPDATE CASCADE;

ALTER TABLE CONTA_PAGAR_VINCULO
ADD CONSTRAINT FK_CONTA_PAGAR_VINCULO_7
FOREIGN KEY (ID_PROJETO_ALOCADO)
REFERENCES PROJETO(ID)
ON UPDATE CASCADE;

ALTER TABLE CONTA_PAGAR_VINCULO
ADD CONSTRAINT FK_CONTA_PAGAR_VINCULO_8
FOREIGN KEY (ID_ATIVIDADE_ALOCADO)
REFERENCES ATIVIDADE(ID)
ON UPDATE CASCADE;

ALTER TABLE CONTA_PAGAR_VINCULO
ADD CONSTRAINT FK_CONTA_PAGAR_VINCULO_9
FOREIGN KEY (ID_RUBRICA_ALOCADO)
REFERENCES RUBRICA(ID)
ON UPDATE CASCADE;

ALTER TABLE CONTA_PAGAR_VINCULO
ADD CONSTRAINT FK_CONTA_PAGAR_VINCULO_10
FOREIGN KEY (ID_AREA_ATUACAO_ALOCADO)
REFERENCES PROJETO_AREA(ID)
ON UPDATE CASCADE;



DROP TABLE CONTA_PAGAR_ATIVIDADE;



DROP TABLE CONTA_PAGAR_PROJETO;



ALTER TABLE PROJETO_RUBRICA DROP GASTO;



ALTER TABLE PROJETO_RUBRICA DROP RECEBIDO;



DROP SEQUENCE GEN_CONTA_PAGAR_ATIVIDADE;



DROP SEQUENCE GEN_CONTA_PAGAR_PROJETO;



CREATE TABLE CONTA_RECEBER_VINCULO (
    ID INTEGER NOT NULL,
    ID_CONTA_RECEBER INTEGER NOT NULL,
    ID_FUNDO INTEGER NOT NULL,
    VALOR NUMERIC(15,2) NOT NULL);

ALTER TABLE CONTA_RECEBER_VINCULO
ADD CONSTRAINT PK_CONTA_RECEBER_VINCULO
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_CONTA_RECEBER_VINCULO;



ALTER TABLE CONTA_RECEBER_VINCULO
ADD CONSTRAINT FK_CONTA_RECEBER_VINCULO_1
FOREIGN KEY (ID_CONTA_RECEBER)
REFERENCES CONTA_RECEBER(ID)
ON UPDATE CASCADE;

ALTER TABLE CONTA_RECEBER_VINCULO
ADD CONSTRAINT FK_CONTA_RECEBER_VINCULO_2
FOREIGN KEY (ID_FUNDO)
REFERENCES FUNDO(ID)
ON UPDATE CASCADE;



ALTER TABLE CONTA_RECEBER_VINCULO DROP CONSTRAINT FK_CONTA_RECEBER_VINCULO_1;

ALTER TABLE CONTA_RECEBER_VINCULO
ADD CONSTRAINT FK_CONTA_RECEBER_VINCULO_1
FOREIGN KEY (ID_CONTA_RECEBER)
REFERENCES CONTA_RECEBER(ID)
ON DELETE CASCADE
ON UPDATE CASCADE
USING INDEX FK_CONTA_RECEBER_VINCULO_1;



create view view_rubrica_projeto (id_rubrica, id_projeto, nome_rubrica, orcamento, valor_gasto, valor_recebido, valor_aprovisionado, saldo_real, saldo_previsto)
as
select distinct Projeto_Rubrica.Id_Rubrica,
                Projeto_Rubrica.Id_Projeto,
                Rubrica.Identificador || ' - ' || Rubrica.Nome as Nome_Rubrica,
                Projeto_Rubrica.Orcamento,
                (select sum(Conta_Pagar_Vinculo.Valor * (select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 1))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto) as valor_gasto,

                (select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                 from Projeto_Financiador
                 inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                 where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto) as valor_recebido,

                (select sum(Conta_Pagar_Vinculo.Valor * (select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 0))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto) as valor_aprovisionado,
                 0 as saldo_real,
                 0 as saldo_previsto


from Projeto_Rubrica
inner join Rubrica on (Rubrica.Id = Projeto_Rubrica.Id_Rubrica)
left join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)

;



create or alter view View_Rubrica_Projeto (
    Id_Rubrica,
    Id_Projeto,
    Nome_Rubrica,
    Orcamento,
    Valor_Gasto,
    Valor_Recebido,
    Valor_Aprovisionado,
    Saldo_Real,
    Saldo_Previsto)
as
select distinct Projeto_Rubrica.Id_Rubrica,
                Projeto_Rubrica.Id_Projeto,
                Rubrica.Identificador || ' - ' || Rubrica.Nome as Nome_Rubrica,
                Projeto_Rubrica.Orcamento,
                (select sum(Conta_Pagar_Vinculo.Valor * (select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 1))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto) as Valor_Gasto,

                (select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                 from Projeto_Financiador
                 inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                 where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto) as Valor_Recebido,

                (select sum(Conta_Pagar_Vinculo.Valor * (select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 0))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto) as Valor_Aprovisionado,

                ((select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                  from Projeto_Financiador
                  inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                  where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto) -

                (select sum(Conta_Pagar_Vinculo.Valor * (select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 1))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)) as Saldo_Real,

                Projeto_Rubrica.Orcamento - (select sum(Conta_Pagar_Vinculo.Valor * (select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                                                     from Conta_Pagar_Parcela
                                                                                     inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                                                     where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                                                           Conta_Pagar_Parcela.Status = 1))
                                             from Conta_Pagar_Vinculo
                                             where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                                                   Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)

from Projeto_Rubrica
inner join Rubrica on (Rubrica.Id = Projeto_Rubrica.Id_Rubrica)
left join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto);



create or alter view View_Rubrica_Projeto (
    Id_Rubrica,
    Id_Projeto,
    Nome_Rubrica,
    Orcamento,
    Valor_Gasto,
    Valor_Recebido,
    Valor_Aprovisionado,
    Saldo_Real,
    Saldo_Previsto)
as
select distinct Projeto_Rubrica.Id_Rubrica,
                Projeto_Rubrica.Id_Projeto,
                Rubrica.Identificador || ' - ' || Rubrica.Nome as Nome_Rubrica,
                Projeto_Rubrica.Orcamento,
                (select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 1),0))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto) as Valor_Gasto,

                (select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                 from Projeto_Financiador
                 inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                 where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto) as Valor_Recebido,

                (select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 0),0))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto) as Valor_Aprovisionado,

                ((select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                  from Projeto_Financiador
                  inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                  where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto) -

                (select sum(Conta_Pagar_Vinculo.Valor * (select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 1))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)) as Saldo_Real,

                Projeto_Rubrica.Orcamento - (select sum(Conta_Pagar_Vinculo.Valor * (select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                                                     from Conta_Pagar_Parcela
                                                                                     inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                                                     where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                                                           Conta_Pagar_Parcela.Status = 1))
                                             from Conta_Pagar_Vinculo
                                             where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                                                   Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)

from Projeto_Rubrica
inner join Rubrica on (Rubrica.Id = Projeto_Rubrica.Id_Rubrica)
left join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto);



create or alter view View_Rubrica_Projeto (
    Id_Rubrica,
    Id_Projeto,
    Nome_Rubrica,
    Orcamento,
    Valor_Gasto,
    Valor_Recebido,
    Valor_Aprovisionado,
    Saldo_Real,
    Saldo_Previsto)
as
select distinct Projeto_Rubrica.Id_Rubrica,
                Projeto_Rubrica.Id_Projeto,
                Rubrica.Identificador || ' - ' || Rubrica.Nome as Nome_Rubrica,
                Projeto_Rubrica.Orcamento,
                (select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 1),0))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto) as Valor_Gasto,

                (select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                 from Projeto_Financiador
                 inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                 where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto) as Valor_Recebido,

                (select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 0),0))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto) as Valor_Aprovisionado,

                ((select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                  from Projeto_Financiador
                  inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                  where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto) -

                (select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 1),0))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)) as Saldo_Real,

                Projeto_Rubrica.Orcamento - (select sum(Conta_Pagar_Vinculo.Valor * (select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                                                     from Conta_Pagar_Parcela
                                                                                     inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                                                     where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                                                           Conta_Pagar_Parcela.Status = 1))
                                             from Conta_Pagar_Vinculo
                                             where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                                                   Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)

from Projeto_Rubrica
inner join Rubrica on (Rubrica.Id = Projeto_Rubrica.Id_Rubrica)
left join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto);



create or alter view View_Rubrica_Projeto (
    Id_Rubrica,
    Id_Projeto,
    Nome_Rubrica,
    Orcamento,
    Valor_Gasto,
    Valor_Recebido,
    Valor_Aprovisionado,
    Saldo_Real,
    Saldo_Previsto)
as
select distinct Projeto_Rubrica.Id_Rubrica,
                Projeto_Rubrica.Id_Projeto,
                Rubrica.Identificador || ' - ' || Rubrica.Nome as Nome_Rubrica,
                Projeto_Rubrica.Orcamento,
                coalesce((select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 1),0))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto),0) as Valor_Gasto,

                coalesce((select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                 from Projeto_Financiador
                 inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                 where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto),0) as Valor_Recebido,

                (select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 0),0))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto) as Valor_Aprovisionado,

                ((select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                  from Projeto_Financiador
                  inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                  where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto) -

                (select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 1),0))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)) as Saldo_Real,

                Projeto_Rubrica.Orcamento - (select sum(Conta_Pagar_Vinculo.Valor * (select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                                                     from Conta_Pagar_Parcela
                                                                                     inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                                                     where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                                                           Conta_Pagar_Parcela.Status = 1))
                                             from Conta_Pagar_Vinculo
                                             where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                                                   Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)

from Projeto_Rubrica
inner join Rubrica on (Rubrica.Id = Projeto_Rubrica.Id_Rubrica)
left join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto);



create or alter view View_Rubrica_Projeto (
    Id_Rubrica,
    Id_Projeto,
    Nome_Rubrica,
    Orcamento,
    Valor_Gasto,
    Valor_Recebido,
    Valor_Aprovisionado,
    Saldo_Real,
    Saldo_Previsto)
as
select distinct Projeto_Rubrica.Id_Rubrica,
                Projeto_Rubrica.Id_Projeto,
                Rubrica.Identificador || ' - ' || Rubrica.Nome as Nome_Rubrica,
                Projeto_Rubrica.Orcamento,
                coalesce((select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 1),0))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto),0) as Valor_Gasto,

                coalesce((select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                 from Projeto_Financiador
                 inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                 where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto),0) as Valor_Recebido,

                coalesce((select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 0),0))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto),0) as Valor_Aprovisionado,

                (coalesce((select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                 from Projeto_Financiador
                 inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                 where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto),0) -

                (select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 1),0))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)) as Saldo_Real,

                Projeto_Rubrica.Orcamento - (select sum(Conta_Pagar_Vinculo.Valor * (select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                                                     from Conta_Pagar_Parcela
                                                                                     inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                                                     where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                                                           Conta_Pagar_Parcela.Status = 1))
                                             from Conta_Pagar_Vinculo
                                             where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                                                   Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)

from Projeto_Rubrica
inner join Rubrica on (Rubrica.Id = Projeto_Rubrica.Id_Rubrica)
left join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto);



create or alter view View_Rubrica_Projeto (
    Id_Rubrica,
    Id_Projeto,
    Nome_Rubrica,
    Orcamento,
    Valor_Gasto,
    Valor_Recebido,
    Valor_Aprovisionado,
    Saldo_Real,
    Saldo_Previsto)
as
select distinct Projeto_Rubrica.Id_Rubrica,
                Projeto_Rubrica.Id_Projeto,
                Rubrica.Identificador || ' - ' || Rubrica.Nome as Nome_Rubrica,
                Projeto_Rubrica.Orcamento,
                coalesce((select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 1),0))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto),0) as Valor_Gasto,

                coalesce((select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                 from Projeto_Financiador
                 inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                 where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto),0) as Valor_Recebido,

                coalesce((select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 0),0))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto),0) as Valor_Aprovisionado,

                coalesce((coalesce((select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                 from Projeto_Financiador
                 inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                 where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto),0) -

                (select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 1),0))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)),0) as Saldo_Real,

                Projeto_Rubrica.Orcamento - coalesce((select sum(Conta_Pagar_Vinculo.Valor * (select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                                                     from Conta_Pagar_Parcela
                                                                                     inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                                                     where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                                                           Conta_Pagar_Parcela.Status = 1))
                                             from Conta_Pagar_Vinculo
                                             where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                                                   Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto),0)

from Projeto_Rubrica
inner join Rubrica on (Rubrica.Id = Projeto_Rubrica.Id_Rubrica)
left join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto);



ALTER TABLE ORGANIZACAO
    ADD LOGO BLOB SUB_TYPE 0 SEGMENT SIZE 80;



ALTER TABLE FUNDO
    ADD ID_ORGANIZACAO INTEGER NOT NULL;

alter table FUNDO
alter ID position 1;

alter table FUNDO
alter ID_ORGANIZACAO position 2;

alter table FUNDO
alter NOME position 3;

alter table FUNDO
alter SALDO position 4;

alter table FUNDO
alter DESCRICAO position 5;




ALTER TABLE PROJETO_FINANCIADOR
    ADD VALOR NUMERIC(15,2) NOT NULL;

alter table PROJETO_FINANCIADOR
alter ID position 1;

alter table PROJETO_FINANCIADOR
alter ID_PROJETO position 2;

alter table PROJETO_FINANCIADOR
alter ID_FINANCIADOR position 3;

alter table PROJETO_FINANCIADOR
alter VALOR position 4;

alter table PROJETO_FINANCIADOR
alter OBSERVACAO position 5;



ALTER TABLE PROJETO_FINANCIADOR
    ALTER VALOR TO VALOR_FINANCIADO;
	
	
update Projeto_Financiador
set Valor_Financiado = (select sum(Projeto_Financiador_Pagto.Valor)
            from Projeto_Financiador_Pagto
            where Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id);	



create or alter view View_Movimentacao_Financeira (
    Id_Movimentacao,
    Id_Organizacao,
    Nome_Organizacao,
    Tipo_Origem_Recurso,
--0 - Projeto;1 - Fundo; 2 - Financiador
    Id_Origem_Recurso,
    Origem_Recurso,
    Tipo,
    Descricao_Tipo,
    Descricao_Movimentacao,
    Valor_Previsto,
    Valor_Real)
as

--DESPESA DE PROJETO
select Conta_Pagar.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipoorigem, --Projeto
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       Conta_Pagar.Valor_Total as Valor_Previsto,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join organizacao on (organizacao.id = Projeto_Organizacao.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Fundo is null

union all

--DESPESA DE PROJETO
select Conta_Pagar.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipoorigem, --Fundo
       Fundo.Id as Idorigem,
       Fundo.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       Conta_Pagar.Valor_Total as Valor_Previsto,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Fundo on (Fundo.Id = Conta_Pagar_Vinculo.Id_Fundo)
inner join organizacao on (organizacao.id = Fundo.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Projeto_Origem is null

union all

select Conta_Receber.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipoorigem, --Fundo
       Fundo.Id as Idorigem,
       Fundo.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       Conta_Receber.Descricao,
       Conta_Receber_Vinculo.Valor as Valor_Previsto,
       (select sum(Conta_Receber_Parcela.Valor)
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Status = 1 and
              Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id) as Valor_Real
from Conta_Receber_Vinculo
inner join Conta_Receber on (Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id)
inner join Fundo on (Fundo.Id = Conta_Receber_Vinculo.Id_Fundo)
inner join organizacao on (organizacao.id = Fundo.Id_Organizacao)

union all

select Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipoorigem, --Projeto
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       'Pagamento Financiador' as Descricao,
       Projeto_Financiador.Valor_Financiado as Valor_Previsto,
       (select sum(Projeto_Financiador_Pagto.Valor)
        from Projeto_Financiador_Pagto
        where Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id) as Valor_Real
from Projeto_Financiador
inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join organizacao on (organizacao.id = Projeto_Organizacao.Id_Organizacao);



create or alter view View_Movimentacao_Financeira (
    Id_Movimentacao,
    Id_Organizacao,
    Nome_Organizacao,
    Tipo_Origem_Recurso,--0 - Projeto;1 - Fundo;
    Id_Origem_Recurso,
    Origem_Recurso,
    Tipo,
    Descricao_Tipo,
    Descricao_Movimentacao,
    Valor_Previsto,
    Valor_Real)
as

--DESPESA DE PROJETO
select Conta_Pagar.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipoorigem, --Projeto
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       Conta_Pagar.Valor_Total as Valor_Previsto,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Fundo is null

union all

--DESPESA DE PROJETO
select Conta_Pagar.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipoorigem, --Fundo
       Fundo.Id as Idorigem,
       Fundo.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       Conta_Pagar.Valor_Total as Valor_Previsto,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Fundo on (Fundo.Id = Conta_Pagar_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Projeto_Origem is null

union all

select Conta_Receber.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipoorigem, --Fundo
       Fundo.Id as Idorigem,
       Fundo.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       Conta_Receber.Descricao,
       Conta_Receber_Vinculo.Valor as Valor_Previsto,
       (select sum(Conta_Receber_Parcela.Valor)
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Status = 1 and
              Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id) as Valor_Real
from Conta_Receber_Vinculo
inner join Conta_Receber on (Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id)
inner join Fundo on (Fundo.Id = Conta_Receber_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipoorigem, --Projeto
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       'Pagamento Financiador' as Descricao,
       Projeto_Financiador.Valor_Financiado as Valor_Previsto,
       (select sum(Projeto_Financiador_Pagto.Valor)
        from Projeto_Financiador_Pagto
        where Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id) as Valor_Real
from Projeto_Financiador
inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)     ;



CREATE OR ALTER VIEW VIEW_MOVIMENTACAO_FINANCEIRA(
    ID_MOVIMENTACAO,
    ID_ORGANIZACAO,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM_RECURSO,
    ID_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
    TIPO,
    DESCRICAO_TIPO,
    DESCRICAO_MOVIMENTACAO,
    VALOR_TOTAL,
    VALOR_PARCIAL,
    VALOR_REAL)
AS
--DESPESA DE PROJETO
select Conta_Pagar.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipoorigem, --Projeto
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       Conta_Pagar.Valor_Total ,
       conta_pagar_vinculo.valor as valor_parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Fundo is null

union all


select Conta_Pagar.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipoorigem, --Fundo
       Fundo.Id as Idorigem,
       Fundo.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       conta_pagar.valor_total,
       conta_pagar_vinculo.valor as valor_parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Fundo on (Fundo.Id = Conta_Pagar_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Projeto_Origem is null

union all

--RECEITA VINDA DE CONTAS A RECEBER

select Conta_Receber.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipoorigem, --Fundo
       Fundo.Id as Idorigem,
       Fundo.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       Conta_Receber.Descricao,
       Conta_Receber.valor_total,
       Conta_Receber_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Receber_Parcela.Valor)
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Status = 1 and
              Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id) as Valor_Real
from Conta_Receber_Vinculo
inner join Conta_Receber on (Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id)
inner join Fundo on (Fundo.Id = Conta_Receber_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipoorigem,
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       'Pagamento Financiador' as Descricao,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador.Valor_Financiado as Valor_Parcial,
       (select sum(Projeto_Financiador_Pagto.Valor)
        from Projeto_Financiador_Pagto
        where Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id) as Valor_Real
from Projeto_Financiador
inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
;



CREATE OR ALTER VIEW VIEW_MOVIMENTACAO_FINANCEIRA(
    ID_MOVIMENTACAO,
    ID_ORGANIZACAO,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM_RECURSO,
    ID_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
    TIPO,
    DESCRICAO_TIPO,
    DESCRICAO_MOVIMENTACAO,
    VALOR_TOTAL,  -- Total da movimentacao (total da conta a pagar, receber ou financiamento)
    VALOR_PARCIAL,-- Valor sem levar em conta a divisao por organizacao
    VALOR_REAL) -- Valor pago/recebido ou financiado de fato, ou seja, somente contabiliza o que ja recebeu ou pagou
AS
--DESPESA DE PROJETO
select Conta_Pagar.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipoorigem, --Projeto
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       Conta_Pagar.Valor_Total ,
       conta_pagar_vinculo.valor as valor_parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Fundo is null

union all


select Conta_Pagar.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipoorigem, --Fundo
       Fundo.Id as Idorigem,
       Fundo.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       conta_pagar.valor_total,
       conta_pagar_vinculo.valor as valor_parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Fundo on (Fundo.Id = Conta_Pagar_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Projeto_Origem is null

union all

--RECEITA VINDA DE CONTAS A RECEBER

select Conta_Receber.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipoorigem, --Fundo
       Fundo.Id as Idorigem,
       Fundo.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       Conta_Receber.Descricao,
       Conta_Receber.valor_total,
       Conta_Receber_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Receber_Parcela.Valor)
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Status = 1 and
              Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id) as Valor_Real
from Conta_Receber_Vinculo
inner join Conta_Receber on (Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id)
inner join Fundo on (Fundo.Id = Conta_Receber_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipoorigem,
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       'Pagamento Financiador' as Descricao,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador.Valor_Financiado as Valor_Parcial,
       (select sum(Projeto_Financiador_Pagto.Valor)
        from Projeto_Financiador_Pagto
        where Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id) as Valor_Real
from Projeto_Financiador
inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
;



create or alter view View_Movimentacao_Financeira (
    Id_Movimentacao,
    Id_Organizacao,
    Nome_Organizacao,
    Tipo_Origem_Recurso,
    Id_Origem_Recurso,
    Origem_Recurso,
    Tipo,
    Descricao_Tipo,
    Descricao_Movimentacao,
    Data,
    Valor_Total,
-- Total da movimentacao (total da conta a pagar, receber ou financiamento)
    Valor_Parcial,
-- Valor sem levar em conta a divisao por organizacao
    Valor_Real)
as

--DESPESA DE PROJETO
select Conta_Pagar.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipoorigem, --Projeto
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Fundo is null

union all

select Conta_Pagar.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipoorigem, --Fundo
       Fundo.Id as Idorigem,
       Fundo.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Fundo on (Fundo.Id = Conta_Pagar_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Projeto_Origem is null

union all

--RECEITA VINDA DE CONTAS A RECEBER

select Conta_Receber.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipoorigem, --Fundo
       Fundo.Id as Idorigem,
       Fundo.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       Conta_Receber.Descricao,
       (select first 1 Conta_Receber_Parcela.Vencimento
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.id_conta_receber = Conta_Receber.Id
        order by Conta_Receber_Parcela.Vencimento) as Data,
       Conta_Receber.Valor_Total,
       Conta_Receber_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Receber_Parcela.Valor)
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Status = 1 and
              Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id) as Valor_Real
from Conta_Receber_Vinculo
inner join Conta_Receber on (Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id)
inner join Fundo on (Fundo.Id = Conta_Receber_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipoorigem,
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       'Pagamento Financiador' as Descricao,
       Projeto_Financiador_Pagto.data,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador.Valor_Financiado as Valor_Parcial,
       (select sum(Projeto_Financiador_Pagto.Valor)
        from Projeto_Financiador_Pagto
        where Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id) as Valor_Real
from Projeto_Financiador
inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao);



CREATE OR ALTER VIEW VIEW_MOVIMENTACAO_FINANCEIRA(
    ID_MOVIMENTACAO,
    ID_ORGANIZACAO,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM_RECURSO,
    ID_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
    TIPO,
    DESCRICAO_TIPO,
    DESCRICAO_MOVIMENTACAO,
    DATA,
    VALOR_TOTAL, --Total da movimentacao (ex. total da conta a pagar)
    VALOR_PARCIAL,
    VALOR_REAL)
AS
--DESPESA DE PROJETO
select Conta_Pagar.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipoorigem, --Projeto
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Fundo is null

union all

select Conta_Pagar.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipoorigem, --Fundo
       Fundo.Id as Idorigem,
       Fundo.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Fundo on (Fundo.Id = Conta_Pagar_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Projeto_Origem is null

union all

--RECEITA VINDA DE CONTAS A RECEBER

select Conta_Receber.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipoorigem, --Fundo
       Fundo.Id as Idorigem,
       Fundo.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       Conta_Receber.Descricao,
       (select first 1 Conta_Receber_Parcela.Vencimento
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.id_conta_receber = Conta_Receber.Id
        order by Conta_Receber_Parcela.Vencimento) as Data,
       Conta_Receber.Valor_Total,
       Conta_Receber_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Receber_Parcela.Valor)
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Status = 1 and
              Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id) as Valor_Real
from Conta_Receber_Vinculo
inner join Conta_Receber on (Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id)
inner join Fundo on (Fundo.Id = Conta_Receber_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipoorigem,
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       'Pagamento Financiador' as Descricao,
       Projeto_Financiador_Pagto.data,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador_Pagto.Valor as Valor_Parcial,
       (select sum(Projeto_Financiador_Pagto.Valor)
        from Projeto_Financiador_Pagto
        where Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id) as Valor_Real
from Projeto_Financiador_Pagto
inner join Projeto_Financiador on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
;



CREATE OR ALTER VIEW VIEW_MOVIMENTACAO_FINANCEIRA(
    ID_MOVIMENTACAO,
    ID_ORGANIZACAO,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM_RECURSO, --0 = Projeto; 1 = Fundo; 2 = Financiamento
    ID_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
    TIPO,
    DESCRICAO_TIPO,
    DESCRICAO_MOVIMENTACAO,
    DATA,
    VALOR_TOTAL,
    VALOR_PARCIAL,
    VALOR_REAL)
AS
--DESPESA DE PROJETO
select Conta_Pagar.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipoorigem, --Projeto
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Fundo is null

union all

select Conta_Pagar.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipo_Origem, --Fundo
       Fundo.Id as Idorigem,
       Fundo.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Fundo on (Fundo.Id = Conta_Pagar_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Projeto_Origem is null

union all

--RECEITA VINDA DE CONTAS A RECEBER

select Conta_Receber.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipo_Origem, --Fundo
       Fundo.Id as Id_Origem,
       Fundo.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       Conta_Receber.Descricao,
       (select first 1 Conta_Receber_Parcela.Vencimento
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.id_conta_receber = Conta_Receber.Id
        order by Conta_Receber_Parcela.Vencimento) as Data,
       Conta_Receber.Valor_Total,
       Conta_Receber_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Receber_Parcela.Valor)
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Status = 1 and
              Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id) as Valor_Real
from Conta_Receber_Vinculo
inner join Conta_Receber on (Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id)
inner join Fundo on (Fundo.Id = Conta_Receber_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       3 as Tipo_Origem,
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       'Pagamento Financiador' as Descricao,
       Projeto_Financiador_Pagto.data,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador_Pagto.Valor as Valor_Parcial,
       Projeto_Financiador_Pagto.Valor as Valor_Real
from Projeto_Financiador_Pagto
inner join Projeto_Financiador on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
;



CREATE OR ALTER VIEW VIEW_MOVIMENTACAO_FINANCEIRA(
    ID_MOVIMENTACAO,
    ID_ORGANIZACAO,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM_RECURSO, --0 = Projeto; 1 = Fundo; 2 = Financiamento
    ID_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
    TIPO,
    DESCRICAO_TIPO,
    DESCRICAO_MOVIMENTACAO,
    DATA,
    VALOR_TOTAL,
    VALOR_PARCIAL,
    VALOR_REAL)
AS
--DESPESA DE PROJETO
select Conta_Pagar.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipoorigem, --Projeto
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Fundo is null

union all

select Conta_Pagar.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipo_Origem, --Fundo
       Fundo.Id as Idorigem,
       Fundo.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Fundo on (Fundo.Id = Conta_Pagar_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Projeto_Origem is null

union all

--RECEITA VINDA DE CONTAS A RECEBER

select Conta_Receber.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipo_Origem, --Fundo
       Fundo.Id as Id_Origem,
       Fundo.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       Conta_Receber.Descricao,
       (select first 1 Conta_Receber_Parcela.Vencimento
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.id_conta_receber = Conta_Receber.Id
        order by Conta_Receber_Parcela.Vencimento) as Data,
       Conta_Receber.Valor_Total,
       Conta_Receber_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Receber_Parcela.Valor)
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Status = 1 and
              Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id) as Valor_Real
from Conta_Receber_Vinculo
inner join Conta_Receber on (Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id)
inner join Fundo on (Fundo.Id = Conta_Receber_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       2 as Tipo_Origem,
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       'Pagamento Financiador' as Descricao,
       Projeto_Financiador_Pagto.data,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador_Pagto.Valor as Valor_Parcial,
       Projeto_Financiador_Pagto.Valor as Valor_Real
from Projeto_Financiador_Pagto
inner join Projeto_Financiador on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
;



CREATE OR ALTER VIEW VIEW_MOVIMENTACAO_FINANCEIRA(
    ID_MOVIMENTACAO,
    ID_ORGANIZACAO,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM_RECURSO, --0 = Projeto; 1 = Fundo; 2 = Financiamento
    ID_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
    TIPO,
    DESCRICAO_TIPO,
    DESCRICAO_MOVIMENTACAO,
    DATA,
    VALOR_TOTAL,
    VALOR_PARCIAL,
    VALOR_REAL)
AS
--DESPESA DE PROJETO
select Conta_Pagar.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipoorigem, --Projeto
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Fundo is null

union all

select Conta_Pagar.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipo_Origem, --Fundo
       Fundo.Id as Idorigem,
       Fundo.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Fundo on (Fundo.Id = Conta_Pagar_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Projeto_Origem is null

union all

--RECEITA VINDA DE CONTAS A RECEBER

select Conta_Receber.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipo_Origem, --Fundo
       Fundo.Id as Id_Origem,
       Fundo.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       Conta_Receber.Descricao,
       (select first 1 Conta_Receber_Parcela.Vencimento
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.id_conta_receber = Conta_Receber.Id
        order by Conta_Receber_Parcela.Vencimento) as Data,
       Conta_Receber.Valor_Total,
       Conta_Receber_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Receber_Parcela.Valor)
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Status = 1 and
              Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id) as Valor_Real
from Conta_Receber_Vinculo
inner join Conta_Receber on (Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id)
inner join Fundo on (Fundo.Id = Conta_Receber_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       2 as Tipo_Origem,
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       'Pagamento Financiador - '||fin_for_cli.nome_fantasia as Descricao,
       Projeto_Financiador_Pagto.data,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador_Pagto.Valor as Valor_Parcial,
       Projeto_Financiador_Pagto.Valor as Valor_Real
from Projeto_Financiador_Pagto
inner join Projeto_Financiador on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join fin_for_cli on (projeto_financiador.id_financiador = fin_for_cli.id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
;



ALTER SEQUENCE GEN_PESSOA RESTART WITH 100;



CREATE OR ALTER VIEW VIEW_MOVIMENTACAO_FINANCEIRA(
    ID,
    ID_MOVIMENTACAO,
    ID_ORGANIZACAO,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM_RECURSO,
    ID_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
    TIPO,
    DESCRICAO_TIPO,
    DESCRICAO_MOVIMENTACAO,
    DATA,
    VALOR_TOTAL,
    VALOR_PARCIAL,
    VALOR_REAL)
AS
--DESPESA DE PROJETO
select Conta_pagar_vinculo.id,
       Conta_Pagar.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipoorigem, --Projeto
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Fundo is null

union all

select Conta_pagar_vinculo.id,
       Conta_Pagar.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipo_Origem, --Fundo
       Fundo.Id as Idorigem,
       Fundo.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Fundo on (Fundo.Id = Conta_Pagar_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Projeto_Origem is null

union all

--RECEITA VINDA DE CONTAS A RECEBER

select Conta_receber_vinculo.id,
       Conta_Receber.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipo_Origem, --Fundo
       Fundo.Id as Id_Origem,
       Fundo.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       Conta_Receber.Descricao,
       (select first 1 Conta_Receber_Parcela.Vencimento
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.id_conta_receber = Conta_Receber.Id
        order by Conta_Receber_Parcela.Vencimento) as Data,
       Conta_Receber.Valor_Total,
       Conta_Receber_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Receber_Parcela.Valor)
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Status = 1 and
              Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id) as Valor_Real
from Conta_Receber_Vinculo
inner join Conta_Receber on (Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id)
inner join Fundo on (Fundo.Id = Conta_Receber_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select Projeto_Financiador_Pagto.id,
       Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       2 as Tipo_Origem,
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       'Pagamento Financiador - '||fin_for_cli.nome_fantasia as Descricao,
       Projeto_Financiador_Pagto.data,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador_Pagto.Valor as Valor_Parcial,
       Projeto_Financiador_Pagto.Valor as Valor_Real
from Projeto_Financiador_Pagto
inner join Projeto_Financiador on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join fin_for_cli on (projeto_financiador.id_financiador = fin_for_cli.id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
;



    CREATE OR ALTER VIEW VIEW_MOVIMENTACAO_FINANCEIRA(
    ID,
    ID_MOVIMENTACAO,
    ID_ORGANIZACAO,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM_RECURSO,
    ID_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
    TIPO,
    DESCRICAO_TIPO,
    DESCRICAO_MOVIMENTACAO,
    DATA,
    VALOR_TOTAL,
    VALOR_PARCIAL,
    VALOR_REAL)
AS
--DESPESA DE PROJETO
select Conta_pagar_vinculo.id,
       Conta_Pagar.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipoorigem, --Projeto
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Fundo is null

union all

select Conta_pagar_vinculo.id,
       Conta_Pagar.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipo_Origem, --Fundo
       Fundo.Id as Idorigem,
       Fundo.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Fundo on (Fundo.Id = Conta_Pagar_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Projeto_Origem is null

union all

--RECEITA VINDA DE CONTAS A RECEBER

select Conta_receber_vinculo.id,
       Conta_Receber.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipo_Origem, --Fundo
       Fundo.Id as Id_Origem,
       Fundo.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       Conta_Receber.Descricao,
       (select first 1 Conta_Receber_Parcela.Vencimento
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.id_conta_receber = Conta_Receber.Id
        order by Conta_Receber_Parcela.Vencimento) as Data,
       Conta_Receber.Valor_Total,
       Conta_Receber_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Receber_Parcela.Valor)
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Status = 1 and
              Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id) as Valor_Real
from Conta_Receber_Vinculo
inner join Conta_Receber on (Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id)
inner join Fundo on (Fundo.Id = Conta_Receber_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select Projeto_Financiador_Pagto.id,
       Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipo_Origem,
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       'Pagamento Financiador - '||fin_for_cli.nome_fantasia as Descricao,
       Projeto_Financiador_Pagto.data,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador_Pagto.Valor as Valor_Parcial,
       Projeto_Financiador_Pagto.Valor as Valor_Real
from Projeto_Financiador_Pagto
inner join Projeto_Financiador on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join fin_for_cli on (projeto_financiador.id_financiador = fin_for_cli.id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
;



    CREATE OR ALTER VIEW VIEW_MOVIMENTACAO_FINANCEIRA(
    ID,
    ID_MOVIMENTACAO,
    ID_ORGANIZACAO,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM_RECURSO,
    ID_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
    TIPO,
    DESCRICAO_TIPO,
    DESCRICAO_MOVIMENTACAO,
    DATA,
    VALOR_TOTAL,
    VALOR_PARCIAL,
    VALOR_REAL)
AS
--DESPESA DE PROJETO
select Conta_pagar_vinculo.id,
       Conta_Pagar.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipoorigem, --Projeto
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Fundo is null

union all

select Conta_pagar_vinculo.id,
       Conta_Pagar.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipo_Origem, --Fundo
       Fundo.Id as Idorigem,
       Fundo.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Fundo on (Fundo.Id = Conta_Pagar_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Projeto_Origem is null

union all

--RECEITA VINDA DE CONTAS A RECEBER

select Conta_receber_vinculo.id,
       Conta_Receber.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipo_Origem, --Fundo
       Fundo.Id as Id_Origem,
       Fundo.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       Conta_Receber.Descricao,
       (select first 1 Conta_Receber_Parcela.Vencimento
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.id_conta_receber = Conta_Receber.Id
        order by Conta_Receber_Parcela.Vencimento) as Data,
       Conta_Receber.Valor_Total,
       Conta_Receber_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Receber_Parcela.Valor)
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Status = 1 and
              Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id) as Valor_Real
from Conta_Receber_Vinculo
inner join Conta_Receber on (Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id)
inner join Fundo on (Fundo.Id = Conta_Receber_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select Projeto_Financiador_Pagto.id,
       Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       2 as Tipo_Origem,
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       'Pagamento Financiador - '||fin_for_cli.nome_fantasia as Descricao,
       Projeto_Financiador_Pagto.data,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador_Pagto.Valor as Valor_Parcial,
       Projeto_Financiador_Pagto.Valor as Valor_Real
from Projeto_Financiador_Pagto
inner join Projeto_Financiador on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join fin_for_cli on (projeto_financiador.id_financiador = fin_for_cli.id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
;



    CREATE OR ALTER VIEW VIEW_MOVIMENTACAO_FINANCEIRA(
    ID_IDENTIFICACAO_TABELA,
    ID,
    ID_MOVIMENTACAO,
    ID_ORGANIZACAO,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM_RECURSO,
    ID_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
    TIPO,
    DESCRICAO_TIPO,
    DESCRICAO_MOVIMENTACAO,
    DATA,
    VALOR_TOTAL,
    VALOR_PARCIAL,
    VALOR_REAL)
AS
--DESPESA DE PROJETO
select 0 AS ID_IDENTIFICACAO_TABELA,
       Conta_pagar_vinculo.id,
       Conta_Pagar.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipoorigem, --Projeto
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Fundo is null

union all

select 1 AS ID_IDENTIFICACAO_TABELA,
       Conta_pagar_vinculo.id,
       Conta_Pagar.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipo_Origem, --Fundo
       Fundo.Id as Idorigem,
       Fundo.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Fundo on (Fundo.Id = Conta_Pagar_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Projeto_Origem is null

union all

--RECEITA VINDA DE CONTAS A RECEBER

select 2 AS ID_IDENTIFICACAO_TABELA,
       Conta_receber_vinculo.id,
       Conta_Receber.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipo_Origem, --Fundo
       Fundo.Id as Id_Origem,
       Fundo.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       Conta_Receber.Descricao,
       (select first 1 Conta_Receber_Parcela.Vencimento
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.id_conta_receber = Conta_Receber.Id
        order by Conta_Receber_Parcela.Vencimento) as Data,
       Conta_Receber.Valor_Total,
       Conta_Receber_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Receber_Parcela.Valor)
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Status = 1 and
              Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id) as Valor_Real
from Conta_Receber_Vinculo
inner join Conta_Receber on (Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id)
inner join Fundo on (Fundo.Id = Conta_Receber_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select 3 AS ID_IDENTIFICACAO_TABELA,
       Projeto_Financiador_Pagto.id,
       Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       2 as Tipo_Origem,
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       'Pagamento Financiador - '||fin_for_cli.nome_fantasia as Descricao,
       Projeto_Financiador_Pagto.data,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador_Pagto.Valor as Valor_Parcial,
       Projeto_Financiador_Pagto.Valor as Valor_Real
from Projeto_Financiador_Pagto
inner join Projeto_Financiador on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join fin_for_cli on (projeto_financiador.id_financiador = fin_for_cli.id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
;



    CREATE OR ALTER VIEW VIEW_MOVIMENTACAO_FINANCEIRA(
    ID_IDENTIFICACAO_TABELA,
    ID,
    ID_MOVIMENTACAO,
    ID_ORGANIZACAO,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM_RECURSO,
    ID_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
    TIPO,
    DESCRICAO_TIPO,
    DESCRICAO_MOVIMENTACAO,
    DATA,
    VALOR_TOTAL,
    VALOR_PARCIAL,
    VALOR_REAL)
AS
--DESPESA DE PROJETO
select 0 AS ID_IDENTIFICACAO_TABELA,
       Conta_pagar_vinculo.id,
       Conta_Pagar.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipoorigem, --Projeto
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Fundo is null

union all

select 1 AS ID_IDENTIFICACAO_TABELA,
       Conta_pagar_vinculo.id,
       Conta_Pagar.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipo_Origem, --Fundo
       Fundo.Id as Idorigem,
       Fundo.Nome as Origem,
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Fundo on (Fundo.Id = Conta_Pagar_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Projeto_Origem is null

union all

--RECEITA VINDA DE CONTAS A RECEBER

select 2 AS ID_IDENTIFICACAO_TABELA,
       Conta_receber_vinculo.id,
       Conta_Receber.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipo_Origem, --Fundo
       Fundo.Id as Id_Origem,
       Fundo.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       Conta_Receber.Descricao,
       (select first 1 Conta_Receber_Parcela.Vencimento
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.id_conta_receber = Conta_Receber.Id
        order by Conta_Receber_Parcela.Vencimento) as Data,
       Conta_Receber.Valor_Total,
       Conta_Receber_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Receber_Parcela.Valor)
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Status = 1 and
              Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id) as Valor_Real
from Conta_Receber_Vinculo
inner join Conta_Receber on (Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id)
inner join Fundo on (Fundo.Id = Conta_Receber_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select 3 AS ID_IDENTIFICACAO_TABELA,
       Projeto_Financiador_Pagto.id,
       Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       2 as Tipo_Origem,
       Projeto.Id as Idorigem,
       Projeto.Nome as Origem,
       1 as Tipo,
       'Receita' as Descricaotipo,
       'Pagamento Financiador - '||fin_for_cli.nome_fantasia as Descricao,
       Projeto_Financiador_Pagto.data,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador_Pagto.Valor as Valor_Parcial,
       Projeto_Financiador_Pagto.Valor as Valor_Real
from Projeto_Financiador_Pagto
inner join Projeto_Financiador on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join fin_for_cli on (projeto_financiador.id_financiador = fin_for_cli.id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
;



CREATE OR ALTER VIEW VIEW_MOVIMENTACAO_FINANCEIRA(
    ID_IDENTIFICACAO_TABELA,
    ID,
    ID_MOVIMENTACAO,
    ID_ORGANIZACAO,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM_RECURSO,
    ID_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
    TIPO_ORIGEM,
    TIPO,
    DESCRICAO_TIPO,
    DESCRICAO_MOVIMENTACAO,
    DATA,
    VALOR_TOTAL,
    VALOR_PARCIAL,
    VALOR_REAL)
AS
--DESPESA DE PROJETO
select 0 AS ID_IDENTIFICACAO_TABELA,
       Conta_pagar_vinculo.id,
       Conta_Pagar.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipo_origem_recurso, --Projeto
       Projeto.Id as Id_origem_recurso,
       Projeto.Nome as Origem_Recurso,
       0 as tipo_origem,--Projeto
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Fundo is null

union all

select 1 AS ID_IDENTIFICACAO_TABELA,
       Conta_pagar_vinculo.id,
       Conta_Pagar.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipo_Origem_Recurso, --Fundo
       Fundo.Id as Id_origem_recurso,
       Fundo.Nome as Origem_recurso,
       1 as tipo_origem,--Fundo
       0 as Tipo,
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Vencimento) as Data,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as Valor_Real
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Fundo on (Fundo.Id = Conta_Pagar_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
where Conta_Pagar_Vinculo.Id_Projeto_Origem is null

union all

--RECEITA VINDA DE CONTAS A RECEBER

select 2 AS ID_IDENTIFICACAO_TABELA,
       Conta_receber_vinculo.id,
       Conta_Receber.Id as Id_Movimentacao,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipo_Origem_recurso, --Fundo
       Fundo.Id as Id_Origem_recurso,
       Fundo.Nome as Origem_recurso,
       1 as tipo_origem,--Fundo
       1 as Tipo,
       'Receita' as Descricaotipo,
       Conta_Receber.Descricao,
       (select first 1 Conta_Receber_Parcela.Vencimento
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.id_conta_receber = Conta_Receber.Id
        order by Conta_Receber_Parcela.Vencimento) as Data,
       Conta_Receber.Valor_Total,
       Conta_Receber_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Receber_Parcela.Valor)
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Status = 1 and
              Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id) as Valor_Real
from Conta_Receber_Vinculo
inner join Conta_Receber on (Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id)
inner join Fundo on (Fundo.Id = Conta_Receber_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select 3 AS ID_IDENTIFICACAO_TABELA,
       Projeto_Financiador_Pagto.id,
       Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       2 as Tipo_Origem_recurso,
       Projeto.Id as Id_origem_recurso,
       Projeto.Nome as Origem_recurso,
       0 as tipo_origem,--Projeto
       1 as Tipo,
       'Receita' as Descricaotipo,
       'Pagamento Financiador - '||fin_for_cli.nome_fantasia as Descricao,
       Projeto_Financiador_Pagto.data,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador_Pagto.Valor as Valor_Parcial,
       Projeto_Financiador_Pagto.Valor as Valor_Real
from Projeto_Financiador_Pagto
inner join Projeto_Financiador on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join fin_for_cli on (projeto_financiador.id_financiador = fin_for_cli.id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
;



CREATE OR ALTER VIEW VIEW_RUBRICA_PROJETO(
    ID_RUBRICA,
    ID_PROJETO,
    NOME_PROJETO,
    NOME_RUBRICA,
    ORCAMENTO,
    VALOR_GASTO,
    VALOR_RECEBIDO,
    VALOR_APROVISIONADO,
    SALDO_REAL,
    SALDO_PREVISTO)
AS
select distinct Projeto_Rubrica.Id_Rubrica,
                Projeto_Rubrica.Id_Projeto,
                Projeto.nome as Nome_Projeto,
                Rubrica.Identificador || ' - ' || Rubrica.Nome as Nome_Rubrica,
                Projeto_Rubrica.Orcamento,
                coalesce((select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 1),0))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto),0) as Valor_Gasto,

                coalesce((select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                 from Projeto_Financiador
                 inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                 where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto),0) as Valor_Recebido,

                coalesce((select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 0),0))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto),0) as Valor_Aprovisionado,

                coalesce((coalesce((select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                 from Projeto_Financiador
                 inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                 where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto),0) -

                (select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                         from Conta_Pagar_Parcela
                                                         inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                         where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                               Conta_Pagar_Parcela.Status = 1),0))
                 from Conta_Pagar_Vinculo
                 where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                       Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)),0) as Saldo_Real,

                Projeto_Rubrica.Orcamento - coalesce((select sum(Conta_Pagar_Vinculo.Valor * (select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                                                     from Conta_Pagar_Parcela
                                                                                     inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                                                     where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                                                           Conta_Pagar_Parcela.Status = 1))
                                             from Conta_Pagar_Vinculo
                                             where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                                                   Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto),0)

from Projeto_Rubrica
inner join Rubrica on (Rubrica.Id = Projeto_Rubrica.Id_Rubrica)
inner join projeto on (Projeto.id = projeto_rubrica.id_projeto)
left join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)
;

