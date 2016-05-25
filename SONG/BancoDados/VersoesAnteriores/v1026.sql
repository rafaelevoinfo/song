

ALTER TABLE FIN_FOR_CLI DROP CONSTRAINT UNQ1_FIN_FOR_CLI;



ALTER TABLE FIN_FOR_CLI DROP CONSTRAINT UNQ3_FIN_FOR_CLI;



ALTER TABLE FIN_FOR_CLI
ADD CONSTRAINT UNQ1_FIN_FOR_CLI
UNIQUE (RAZAO_SOCIAL,TIPO,CPF_CNPJ);



update RDB$RELATION_FIELDS set
RDB$NULL_FLAG = 1
where (RDB$FIELD_NAME = 'RAZAO_SOCIAL') and
(RDB$RELATION_NAME = 'FIN_FOR_CLI')
;


update fin_for_cli set fin_for_cli.razao_social = fin_for_cli.nome_fantasia where fin_for_cli.razao_social is null;


update RDB$RELATION_FIELDS set
RDB$NULL_FLAG = NULL
where (RDB$FIELD_NAME = 'NOME_FANTASIA') and
(RDB$RELATION_NAME = 'FIN_FOR_CLI')
;



CREATE TABLE TRANSFERENCIA (
    ID INTEGER NOT NULL,
    ID_FUNDO_ORIGEM INTEGER,
    ID_FUNDO_DESTINO INTEGER,
    ID_PROJETO_RUBRICA_ORIGEM INTEGER,
    ID_PROJETO_RUBRICA_DESTINO INTEGER,
    VALOR NUMERIC(15,2) NOT NULL);

ALTER TABLE TRANSFERENCIA
ADD CONSTRAINT PK_TRANSFERENCIA
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_TRANSFERENCIA;



DROP TABLE TRANSFERENCIA;



DROP TABLE TRANSFERENCIA_FINANCEIRA;



CREATE TABLE TRANSFERENCIA_FINANCEIRA (
    ID INTEGER NOT NULL,
    ID_FUNDO_ORIGEM INTEGER,
    ID_FUNDO_DESTINO INTEGER,
    ID_PROJETO_RUBRICA_ORIGEM INTEGER,
    ID_PROJETO_RUBRICA_DESTINO INTEGER,
    VALOR NUMERIC(15,2) NOT NULL);

ALTER TABLE TRANSFERENCIA_FINANCEIRA
ADD CONSTRAINT PK_TRANSFERENCIA_FINANCEIRA
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_TRANSFERENCIA_FINANCEIRA;



DROP SEQUENCE GEN_TRANSFERENCIA;



ALTER TABLE TRANSFERENCIA_FINANCEIRA
ADD CONSTRAINT FK_TRANSFERENCIA_FINANCEIRA_1
FOREIGN KEY (ID_FUNDO_ORIGEM)
REFERENCES FUNDO(ID)
ON UPDATE CASCADE;

ALTER TABLE TRANSFERENCIA_FINANCEIRA
ADD CONSTRAINT FK_TRANSFERENCIA_FINANCEIRA_2
FOREIGN KEY (ID_FUNDO_DESTINO)
REFERENCES FUNDO(ID)
ON UPDATE CASCADE;

ALTER TABLE TRANSFERENCIA_FINANCEIRA
ADD CONSTRAINT FK_TRANSFERENCIA_FINANCEIRA_3
FOREIGN KEY (ID_PROJETO_RUBRICA_ORIGEM)
REFERENCES PROJETO_RUBRICA(ID)
ON UPDATE CASCADE;

ALTER TABLE TRANSFERENCIA_FINANCEIRA
ADD CONSTRAINT FK_TRANSFERENCIA_FINANCEIRA_4
FOREIGN KEY (ID_PROJETO_RUBRICA_DESTINO)
REFERENCES PROJETO_RUBRICA(ID)
ON UPDATE CASCADE;



create view VIEW_VALORES_RUBRICA_PROJETO ( ID_RUBRICA,ID_PROJETO,  VALOR_GASTO,VALOR_RECEBIDO)
as
select distinct Projeto_Rubrica.Id_Rubrica,
                Projeto_Rubrica.Id_Projeto,

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
                 where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto),0) as Valor_Recebido
from Projeto_Rubrica
left join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)
;



CREATE OR ALTER VIEW View_Valores_Rubrica_Projeto (
    Id_Rubrica,
    Id_Projeto,
    Valor_Gasto,
    Valor_Recebido,
    Valor_Aprovisionado)
as
select distinct Projeto_Rubrica.Id_Rubrica,
                Projeto_Rubrica.Id_Projeto,

                coalesce((select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                                           from Conta_Pagar_Parcela
                                                                           inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                                           where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                                                 Conta_Pagar_Parcela.Status = 1), 0))
                          from Conta_Pagar_Vinculo
                          where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                                Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto), 0) as Valor_Gasto,

                coalesce((select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                          from Projeto_Financiador
                          inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                          where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto), 0) as Valor_Recebido,

                coalesce((select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                                           from Conta_Pagar_Parcela
                                                                           inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                                           where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                                                 Conta_Pagar_Parcela.Status = 0), 0))
                          from Conta_Pagar_Vinculo
                          where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                                Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto), 0) as Valor_Aprovisionado
from Projeto_Rubrica
left join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto);



create or alter view View_Rubrica_Projeto (
    Id_Rubrica,
    Id_Projeto,
    Nome_Projeto,
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
                Projeto.Nome as Nome_Projeto,
                Rubrica.Identificador || ' - ' || Rubrica.Nome as Nome_Rubrica,
                Projeto_Rubrica.Orcamento,
                View_Valores_Rubrica_Projeto.Valor_Gasto,
                View_Valores_Rubrica_Projeto.Valor_Recebido,
                View_Valores_Rubrica_Projeto.valor_aprovisionado,
                View_Valores_Rubrica_Projeto.Valor_Recebido-View_Valores_Rubrica_Projeto.Valor_Gasto as Saldo_Real,
                Projeto_Rubrica.Orcamento - (View_Valores_Rubrica_Projeto.Valor_Gasto + View_Valores_Rubrica_Projeto.valor_aprovisionado) as Saldo_Previsto

from Projeto_Rubrica
inner join Rubrica on (Rubrica.Id = Projeto_Rubrica.Id_Rubrica)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)
left join View_Valores_Rubrica_Projeto on (View_Valores_Rubrica_Projeto.Id_Projeto = Projeto_Rubrica.Id_Projeto and View_Valores_Rubrica_Projeto.Id_Rubrica = Projeto_Rubrica.Id_Rubrica)
;



CREATE OR ALTER VIEW View_Valores_Rubrica_Projeto (
    Id_Rubrica,
    Id_Projeto,
    Valor_Gasto,
    Valor_Recebido,
    Valor_Aprovisionado)
as
select distinct Projeto_Rubrica.Id_Rubrica,
                Projeto_Rubrica.Id_Projeto,

                coalesce((select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                                           from Conta_Pagar_Parcela
                                                                           inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                                           where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                                                 Conta_Pagar_Parcela.Status = 1), 0))
                          from Conta_Pagar_Vinculo
                          where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                                Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto), 0) as Valor_Gasto,

                coalesce((select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                          from Projeto_Financiador
                          inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                          where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto), 0) as Valor_Recebido,

                coalesce((select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                                           from Conta_Pagar_Parcela
                                                                           inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                                           where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                                                 Conta_Pagar_Parcela.Status = 0), 0))
                          from Conta_Pagar_Vinculo
                          where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                                Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto), 0) as Valor_Aprovisionado
from Projeto_Rubrica
inner join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto);



create or alter view View_Rubrica_Projeto (
    Id_Rubrica,
    Id_Projeto,
    Nome_Projeto,
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
                Projeto.Nome as Nome_Projeto,
                Rubrica.Identificador || ' - ' || Rubrica.Nome as Nome_Rubrica,
                Projeto_Rubrica.Orcamento,
                View_Valores_Rubrica_Projeto.Valor_Gasto,
                View_Valores_Rubrica_Projeto.Valor_Recebido,
                View_Valores_Rubrica_Projeto.valor_aprovisionado,
                View_Valores_Rubrica_Projeto.Valor_Recebido-View_Valores_Rubrica_Projeto.Valor_Gasto as Saldo_Real,
                Projeto_Rubrica.Orcamento - (View_Valores_Rubrica_Projeto.Valor_Gasto + View_Valores_Rubrica_Projeto.valor_aprovisionado) as Saldo_Previsto

from Projeto_Rubrica
inner join Rubrica on (Rubrica.Id = Projeto_Rubrica.Id_Rubrica)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)
left join View_Valores_Rubrica_Projeto on (View_Valores_Rubrica_Projeto.Id_Projeto = Projeto_Rubrica.Id_Projeto and View_Valores_Rubrica_Projeto.Id_Rubrica = Projeto_Rubrica.Id_Rubrica)
;

