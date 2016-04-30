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

