

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



CREATE OR ALTER VIEW VIEW_VALORES_RUBRICA_PROJETO(
    ID_RUBRICA,
    ID_PROJETO,
    VALOR_GASTO,
    VALOR_GASTO_TRANSFERIDO,
    VALOR_RECEBIDO,
    VALOR_RECEBIDO_TRANSFERIDO,
    VALOR_APROVISIONADO)
AS
select distinct Projeto_Rubrica.Id_Rubrica,
                Projeto_Rubrica.Id_Projeto,
--VALOR GASTO
                coalesce((select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                                           from Conta_Pagar_Parcela
                                                                           inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                                           where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                                                 Conta_Pagar_Parcela.Status = 1), 0))
                          from Conta_Pagar_Vinculo
                          where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                                Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto), 0) as Valor_Gasto,
--VALOR GASTO TRANSFERIDO
                coalesce((select sum(Transferencia_Financeira.Valor)
                          from Transferencia_Financeira
                          where Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica.Id), 0) as Valor_Gasto_Transferido,
--VALOR RECEBIDO
                coalesce((case
                            when projeto_rubrica.id = (select first 1 pr.id from projeto_rubrica pr
                                                        where pr.id_projeto = projeto_rubrica.id_projeto
                                                        order by pr.orcamento desc)
                            then
                                1
                            else
                                (select sum(Projeto_Financiador_Pagto.Percentual)/100*projeto_rubrica.orcamento
                                   from Projeto_Financiador
                          inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                          where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto)
                         end), 0) as Valor_Recebido,
--VALOR RECEBIDO TRANSFERIDO
                coalesce((select sum(Transferencia_Financeira.Valor)
                          from Transferencia_Financeira
                          where Transferencia_Financeira.id_projeto_rubrica_destino = Projeto_Rubrica.Id), 0) as Valor_Recebido_Transferido,
--VALOR APROVISIONADO
                coalesce((select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                                           from Conta_Pagar_Parcela
                                                                           inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                                           where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                                                 Conta_Pagar_Parcela.Status = 0), 0))
                          from Conta_Pagar_Vinculo
                          where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                                Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto), 0) as Valor_Aprovisionado
from Projeto_Rubrica
--inner join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)
;



create or alter view View_Valores_Rubrica_Projeto (
    Id_Rubrica,
    Id_Projeto,
    Valor_Gasto,
    Valor_Gasto_Transferido,
    Valor_Recebido,
    Valor_Recebido_Transferido,
    Valor_Aprovisionado)
as
select distinct Projeto_Rubrica.Id_Rubrica,
                Projeto_Rubrica.Id_Projeto,
--VALOR GASTO
                coalesce((select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                                           from Conta_Pagar_Parcela
                                                                           inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                                           where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                                                 Conta_Pagar_Parcela.Status = 1), 0))
                          from Conta_Pagar_Vinculo
                          where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                                Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto), 0) as Valor_Gasto,
--VALOR GASTO TRANSFERIDO
                coalesce((select sum(Transferencia_Financeira.Valor)
                          from Transferencia_Financeira
                          where Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica.Id), 0) as Valor_Gasto_Transferido,
--VALOR RECEBIDO
                coalesce((
                case
                  when Projeto_Rubrica.Id = (select first 1 Pr.Id
                                             from Projeto_Rubrica Pr
                                             where Pr.Id_Projeto = Projeto_Rubrica.Id_Projeto
                                             order by Pr.Orcamento desc) then
                       (select sum(Projeto_Financiador_Pagto.valor) - 10
                        from Projeto_Financiador
                        inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                        where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto)


                  else (select trunc(sum(Projeto_Financiador_Pagto.Percentual) / 100 * Projeto_Rubrica.Orcamento,2)
                        from Projeto_Financiador
                        inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                        where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto)
                end), 0) as Valor_Recebido,
--VALOR RECEBIDO TRANSFERIDO
                coalesce((select sum(Transferencia_Financeira.Valor)
                          from Transferencia_Financeira
                          where Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id), 0) as Valor_Recebido_Transferido,
--VALOR APROVISIONADO
                coalesce((select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                                           from Conta_Pagar_Parcela
                                                                           inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                                           where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                                                 Conta_Pagar_Parcela.Status = 0), 0))
                          from Conta_Pagar_Vinculo
                          where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                                Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto), 0) as Valor_Aprovisionado
from Projeto_Rubrica
--inner join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)
;



create or alter view View_Valores_Rubrica_Projeto (
    Id_Rubrica,
    Id_Projeto,
    Valor_Gasto,
    Valor_Gasto_Transferido,
    Valor_Recebido,
    Valor_Recebido_Transferido,
    Valor_Aprovisionado)
as
select distinct Projeto_Rubrica.Id_Rubrica,
                Projeto_Rubrica.Id_Projeto,
--VALOR GASTO
                coalesce((select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                                           from Conta_Pagar_Parcela
                                                                           inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                                           where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                                                 Conta_Pagar_Parcela.Status = 1), 0))
                          from Conta_Pagar_Vinculo
                          where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                                Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto), 0) as Valor_Gasto,
--VALOR GASTO TRANSFERIDO
                coalesce((select sum(Transferencia_Financeira.Valor)
                          from Transferencia_Financeira
                          where Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica.Id), 0) as Valor_Gasto_Transferido,
--VALOR RECEBIDO
                coalesce((
                case
                  when Projeto_Rubrica.Id = (select first 1 Pr.Id
                                             from Projeto_Rubrica Pr
                                             where Pr.Id_Projeto = Projeto_Rubrica.Id_Projeto
                                             order by Pr.Orcamento desc) then (select sum(Projeto_Financiador_Pagto.Valor) - (select sum((select trunc(sum(Projeto_Financiador_Pagto.Percentual) / 100 * Pr.Orcamento, 2)
                                                                                                                                          from Projeto_Financiador
                                                                                                                                          inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                                                                                                                                          where Projeto_Financiador.Id_Projeto = Pr.Id_Projeto))
                                                                                                                              from Projeto_Rubrica Pr
                                                                                                                              where Pr.Id_Projeto = Projeto_Rubrica.Id_Projeto and
                                                                                                                                    Pr.Id <> Projeto_Rubrica.Id)
                                                                               from Projeto_Financiador
                                                                               inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                                                                               where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto)

                  else (select trunc(sum(Projeto_Financiador_Pagto.Percentual) / 100 * Projeto_Rubrica.Orcamento, 2)
                        from Projeto_Financiador
                        inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                        where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto)
                end), 0) as Valor_Recebido,
--VALOR RECEBIDO TRANSFERIDO
                coalesce((select sum(Transferencia_Financeira.Valor)
                          from Transferencia_Financeira
                          where Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id), 0) as Valor_Recebido_Transferido,
--VALOR APROVISIONADO
                coalesce((select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                                           from Conta_Pagar_Parcela
                                                                           inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                                           where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                                                 Conta_Pagar_Parcela.Status = 0), 0))
                          from Conta_Pagar_Vinculo
                          where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                                Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto), 0) as Valor_Aprovisionado
from Projeto_Rubrica
--inner join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)
;



CREATE OR ALTER VIEW VIEW_RUBRICA_PROJETO(
    ID_RUBRICA,
    ID_PROJETO,
    NOME_PROJETO,
    NOME_RUBRICA,
    ORCAMENTO,
    VALOR_GASTO,
    VALOR_GASTO_TRANSFERIDO,
    VALOR_RECEBIDO,
    VALOR_RECEBIDO_TRANSFERIDO,
    VALOR_APROVISIONADO,
    SALDO_REAL,
    SALDO_PREVISTO)
AS
select distinct Projeto_Rubrica.Id_Rubrica,
                Projeto_Rubrica.Id_Projeto,
                Projeto.Nome as Nome_Projeto,
                Rubrica.Nome as Nome_Rubrica,
                Projeto_Rubrica.Orcamento,
                View_Valores_Rubrica_Projeto.Valor_Gasto,
                View_Valores_Rubrica_Projeto.valor_gasto_transferido,
                View_Valores_Rubrica_Projeto.Valor_Recebido,
                View_Valores_Rubrica_Projeto.valor_recebido_transferido,
                View_Valores_Rubrica_Projeto.valor_aprovisionado,
                (View_Valores_Rubrica_Projeto.Valor_Recebido+ View_Valores_Rubrica_Projeto.valor_recebido_transferido)-
                 (View_Valores_Rubrica_Projeto.Valor_Gasto+View_Valores_Rubrica_Projeto.valor_gasto_transferido) as Saldo_Real,
                (Projeto_Rubrica.Orcamento+View_Valores_Rubrica_Projeto.valor_recebido_transferido) -
                 (View_Valores_Rubrica_Projeto.Valor_Gasto + View_Valores_Rubrica_Projeto.valor_gasto_transferido +
                  View_Valores_Rubrica_Projeto.valor_aprovisionado) as Saldo_Previsto

from Projeto_Rubrica
inner join Rubrica on (Rubrica.Id = Projeto_Rubrica.Id_Rubrica)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)
left join View_Valores_Rubrica_Projeto on (View_Valores_Rubrica_Projeto.Id_Projeto = Projeto_Rubrica.Id_Projeto and View_Valores_Rubrica_Projeto.Id_Rubrica = Projeto_Rubrica.Id_Rubrica)
;



create or alter view View_Valores_Rubrica_Projeto (
    Id_Rubrica,
    Id_Projeto,
    Valor_Gasto,
    Valor_Gasto_Transferido,
    Valor_Recebido,
    Valor_Recebido_Transferido,
    Valor_Aprovisionado)
as
select distinct Projeto_Rubrica.Id_Rubrica,
                Projeto_Rubrica.Id_Projeto,
--VALOR GASTO
                0 as Valor_Gasto,
--VALOR GASTO TRANSFERIDO
                coalesce((select sum(Transferencia_Financeira.Valor)
                          from Transferencia_Financeira
                          where Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica.Id), 0) as Valor_Gasto_Transferido,
--VALOR RECEBIDO
                coalesce((
                case
                  when Projeto_Rubrica.Id = (select first 1 Pr.Id
                                             from Projeto_Rubrica Pr
                                             where Pr.Id_Projeto = Projeto_Rubrica.Id_Projeto
                                             order by Pr.Orcamento desc) then (select sum(Projeto_Financiador_Pagto.Valor) - (select sum((select trunc(sum(Projeto_Financiador_Pagto.Percentual) / 100 * Pr.Orcamento, 2)
                                                                                                                                          from Projeto_Financiador
                                                                                                                                          inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                                                                                                                                          where Projeto_Financiador.Id_Projeto = Pr.Id_Projeto))
                                                                                                                              from Projeto_Rubrica Pr
                                                                                                                              where Pr.Id_Projeto = Projeto_Rubrica.Id_Projeto and
                                                                                                                                    Pr.Id <> Projeto_Rubrica.Id)
                                                                               from Projeto_Financiador
                                                                               inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                                                                               where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto)

                  else (select trunc(sum(Projeto_Financiador_Pagto.Percentual) / 100 * Projeto_Rubrica.Orcamento, 2)
                        from Projeto_Financiador
                        inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                        where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto)
                end), 0) as Valor_Recebido,
--VALOR RECEBIDO TRANSFERIDO
                coalesce((select sum(Transferencia_Financeira.Valor)
                          from Transferencia_Financeira
                          where Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id), 0) as Valor_Recebido_Transferido,
--VALOR APROVISIONADO
                coalesce((select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                                           from Conta_Pagar_Parcela
                                                                           inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                                           where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                                                 Conta_Pagar_Parcela.Status = 0), 0))
                          from Conta_Pagar_Vinculo
                          where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                                Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto), 0) as Valor_Aprovisionado
from Projeto_Rubrica
--inner join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)
;



CREATE OR ALTER VIEW VIEW_RUBRICA_PROJETO(
    ID_RUBRICA,
    ID_PROJETO,
    NOME_PROJETO,
    NOME_RUBRICA,
    ORCAMENTO,
    VALOR_GASTO,
    VALOR_GASTO_TRANSFERIDO,
    VALOR_RECEBIDO,
    VALOR_RECEBIDO_TRANSFERIDO,
    VALOR_APROVISIONADO,
    SALDO_REAL,
    SALDO_PREVISTO)
AS
select distinct Projeto_Rubrica.Id_Rubrica,
                Projeto_Rubrica.Id_Projeto,
                Projeto.Nome as Nome_Projeto,
                Rubrica.Nome as Nome_Rubrica,
                Projeto_Rubrica.Orcamento,
                View_Valores_Rubrica_Projeto.Valor_Gasto,
                View_Valores_Rubrica_Projeto.valor_gasto_transferido,
                View_Valores_Rubrica_Projeto.Valor_Recebido,
                View_Valores_Rubrica_Projeto.valor_recebido_transferido,
                View_Valores_Rubrica_Projeto.valor_aprovisionado,
                (View_Valores_Rubrica_Projeto.Valor_Recebido+ View_Valores_Rubrica_Projeto.valor_recebido_transferido)-
                 (View_Valores_Rubrica_Projeto.Valor_Gasto+View_Valores_Rubrica_Projeto.valor_gasto_transferido) as Saldo_Real,
                (Projeto_Rubrica.Orcamento+View_Valores_Rubrica_Projeto.valor_recebido_transferido) -
                 (View_Valores_Rubrica_Projeto.Valor_Gasto + View_Valores_Rubrica_Projeto.valor_gasto_transferido +
                  View_Valores_Rubrica_Projeto.valor_aprovisionado) as Saldo_Previsto

from Projeto_Rubrica
inner join Rubrica on (Rubrica.Id = Projeto_Rubrica.Id_Rubrica)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)
left join View_Valores_Rubrica_Projeto on (View_Valores_Rubrica_Projeto.Id_Projeto = Projeto_Rubrica.Id_Projeto and View_Valores_Rubrica_Projeto.Id_Rubrica = Projeto_Rubrica.Id_Rubrica)
;



create or alter view View_Valores_Rubrica_Projeto (
    Id_Rubrica,
    Id_Projeto,
    Valor_Gasto,
    Valor_Gasto_Transferido,
    Valor_Recebido,
    Valor_Recebido_Transferido,
    Valor_Aprovisionado)
as
select distinct Projeto_Rubrica.Id_Rubrica,
                Projeto_Rubrica.Id_Projeto,
--VALOR GASTO
                coalesce((select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                                           from Conta_Pagar_Parcela
                                                                           inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                                           where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                                                 Conta_Pagar_Parcela.Status = 1), 0))
                          from Conta_Pagar_Vinculo
                          where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                                Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto), 0) as Valor_Gasto,
--VALOR GASTO TRANSFERIDO
                coalesce((select sum(Transferencia_Financeira.Valor)
                          from Transferencia_Financeira
                          where Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica.Id), 0) as Valor_Gasto_Transferido,
--VALOR RECEBIDO
                coalesce((
                case
                  when Projeto_Rubrica.Id = (select first 1 Pr.Id
                                             from Projeto_Rubrica Pr
                                             where Pr.Id_Projeto = Projeto_Rubrica.Id_Projeto
                                             order by Pr.Orcamento desc) then (select sum(Projeto_Financiador_Pagto.Valor) - (select sum((select trunc(sum(Projeto_Financiador_Pagto.Percentual) / 100 * Pr.Orcamento, 2)
                                                                                                                                          from Projeto_Financiador
                                                                                                                                          inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                                                                                                                                          where Projeto_Financiador.Id_Projeto = Pr.Id_Projeto))
                                                                                                                              from Projeto_Rubrica Pr
                                                                                                                              where Pr.Id_Projeto = Projeto_Rubrica.Id_Projeto and
                                                                                                                                    Pr.Id <> Projeto_Rubrica.Id)
                                                                               from Projeto_Financiador
                                                                               inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                                                                               where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto)

                  else (select trunc(sum(Projeto_Financiador_Pagto.Percentual) / 100 * Projeto_Rubrica.Orcamento, 2)
                        from Projeto_Financiador
                        inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                        where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto)
                end), 0) as Valor_Recebido,
--VALOR RECEBIDO TRANSFERIDO
                coalesce((select sum(Transferencia_Financeira.Valor)
                          from Transferencia_Financeira
                          where Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id), 0) as Valor_Recebido_Transferido,
--VALOR APROVISIONADO
                coalesce((select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                                           from Conta_Pagar_Parcela
                                                                           inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                                           where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                                                 Conta_Pagar_Parcela.Status = 0), 0))
                          from Conta_Pagar_Vinculo
                          where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                                Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto), 0) as Valor_Aprovisionado
from Projeto_Rubrica
--inner join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)
;



CREATE OR ALTER VIEW VIEW_CONTA_PAGAR(
    ID,
    ID_VINCULO,
    ID_ORGANIZACAO_ORIGEM,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM,
    ID_ORIGEM_RECURSO,
    ID_UNICO_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
    ID_RUBRICA_ORIGEM,
    DATA,
    DATA_PAGAMENTO,
    FORMA_PAGAMENTO,
    DESCRICAO,
    VALOR,
    VALOR_PAGO)
AS
with Parcelas
as (select (sum(case
                  when Conta_Pagar_Parcela.Status = 1 then Conta_Pagar_Parcela.Valor
                end) / Conta_Pagar.Valor_Total) as Percentual_Pago,
                                                sum(
                                                case
                                                  when Conta_Pagar_Parcela.Status = 1 then Conta_Pagar_Parcela.Valor
                                                end) as Valor_Pago,
                                                count(*) as Qtde_Parcelas,
                                                count(
                                                case
                                                  when Conta_Pagar_Parcela.Status = 1 then 1
                                                end) as Qtde_Parcela_Paga,
                                                count(
                                                case
                                                  when Conta_Pagar_Parcela.Status = 0 then 1
                                                end) as Qtde_Parcela_Aberto,
                                                Conta_Pagar_Parcela.Id_Conta_Pagar
    from Conta_Pagar_Parcela
    inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
    group by Conta_Pagar_Parcela.Id_Conta_Pagar, Conta_Pagar.Valor_Total

)

select Conta_Pagar.Id,
       Conta_Pagar_Vinculo.Id as Id_Vinculo,
       Conta_Pagar_Vinculo.Id_Organizacao_Origem,
       Organizacao.Nome as Nome_Organizacao,
       case
         when Conta_Pagar_Vinculo.Id_Fundo is null then 0 --Projeto
         else 1 --Fundo
       end as Tipo_Origem,
       coalesce(Conta_Pagar_Vinculo.Id_Fundo, Conta_Pagar_Vinculo.Id_Projeto_Origem) as Id_Origem_Recurso,
       coalesce('Conta_' || Conta_Pagar_Vinculo.Id_Fundo, 'Projeto_' || Conta_Pagar_Vinculo.Id_Projeto_Origem) as Id_Unico_Origem_Recurso,
       coalesce(Fundo.Nome, Projeto.Nome) as Origem_Recurso,
       Conta_Pagar_Vinculo.id_rubrica_origem,
       Conta_Pagar_Parcela.Vencimento as Data,
       Conta_Pagar_Parcela.Data_Pagamento,
       Conta_Pagar.Forma_Pagto as Forma_Pagamento,
       case
         when Parcelas.Qtde_Parcelas = 1 then Conta_Pagar.Descricao
         else Conta_Pagar.Descricao || ' (' || Conta_Pagar_Parcela.Parcela || '/' || Parcelas.Qtde_Parcelas || ')'
       end as Descricao,
--Valor
       case
         when Parcelas.Qtde_Parcelas = 1 then Conta_Pagar_Vinculo.Valor
         else case
                when ((select count(*)
                       from Conta_Pagar_Vinculo
                       where Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id) > 1) and (Conta_Pagar_Vinculo.Id = (select first 1 Conta_Pagar_Vinculo.Id
                                                                                                                      from Conta_Pagar_Vinculo
                                                                                                                      where Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id
                                                                                                                      order by Conta_Pagar_Vinculo.Id desc)) then Conta_Pagar_Parcela.Valor - (select sum(
                                                                                                                                                                                                      case
                                                                                                                                                                                                        when Parcelas.Qtde_Parcelas = Cpp.Parcela then Cpv.Valor - (trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                                                                                                                                                        else trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                                                                                                                                                      end)
                                                                                                                                                                                               from Conta_Pagar_Parcela Cpp
                                                                                                                                                                                               inner join Conta_Pagar Cp on (Cp.Id = Cpp.Id_Conta_Pagar)
                                                                                                                                                                                               inner join Conta_Pagar_Vinculo Cpv on (Cpv.Id_Conta_Pagar = Cp.Id)
                                                                                                                                                                                               where Cpp.Id_Conta_Pagar = Conta_Pagar.Id and
                                                                                                                                                                                                     Cpp.Parcela = Conta_Pagar_Parcela.Parcela and
                                                                                                                                                                                                     Cpv.Id <> Conta_Pagar_Vinculo.Id)
                else case
                       when Parcelas.Qtde_Parcelas = Conta_Pagar_Parcela.Parcela then Conta_Pagar_Vinculo.Valor - (trunc(Conta_Pagar_Vinculo.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                       else trunc(Conta_Pagar_Vinculo.Valor / Parcelas.Qtde_Parcelas, 2)
                     end
              end
       end as Valor,
--Valor Pago
       case
         when Conta_Pagar_Parcela.Status = 1 then case
                                                    when Parcelas.Qtde_Parcelas = 1 then Conta_Pagar_Vinculo.Valor
                                                    else case
                                                           when ((select count(*)
                                                                  from Conta_Pagar_Vinculo
                                                                  where Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id) > 1) and (Conta_Pagar_Vinculo.Id = (select first 1 Conta_Pagar_Vinculo.Id
                                                                                                                                                                 from Conta_Pagar_Vinculo
                                                                                                                                                                 where Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id
                                                                                                                                                                 order by Conta_Pagar_Vinculo.Id desc)) then Conta_Pagar_Parcela.Valor - (select sum(
                                                                                                                                                                                                                                                 case
                                                                                                                                                                                                                                                   when Parcelas.Qtde_Parcelas = Cpp.Parcela then Cpv.Valor - (trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                                                                                                                                                                                                   else trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                                                                                                                                                                                                 end)
                                                                                                                                                                                                                                          from Conta_Pagar_Parcela Cpp
                                                                                                                                                                                                                                          inner join Conta_Pagar Cp on (Cp.Id = Cpp.Id_Conta_Pagar)
                                                                                                                                                                                                                                          inner join Conta_Pagar_Vinculo Cpv on (Cpv.Id_Conta_Pagar = Cp.Id)
                                                                                                                                                                                                                                          where Cpp.Id_Conta_Pagar = Conta_Pagar.Id and
                                                                                                                                                                                                                                                Cpp.Parcela = Conta_Pagar_Parcela.Parcela and
                                                                                                                                                                                                                                                Cpv.Id <> Conta_Pagar_Vinculo.Id)
                                                           else case
                                                                  when Parcelas.Qtde_Parcelas = Conta_Pagar_Parcela.Parcela then Conta_Pagar_Vinculo.Valor - (trunc(Conta_Pagar_Vinculo.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                  else trunc(Conta_Pagar_Vinculo.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                end
                                                         end
                                                  end
         else 0
       end as Valor_Pago

from Conta_Pagar_Parcela
inner join Conta_Pagar on (Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Parcelas on (Conta_Pagar.Id = Parcelas.Id_Conta_Pagar)
left join Fundo on (Conta_Pagar_Vinculo.Id_Fundo = Fundo.Id)
left join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto.Id)
inner join Organizacao on (Conta_Pagar_Vinculo.Id_Organizacao_Origem = Organizacao.Id)
;



CREATE OR ALTER VIEW VIEW_VALORES_RUBRICA_PROJETO(
    ID_RUBRICA,
    ID_PROJETO,
    VALOR_GASTO,
    VALOR_GASTO_TRANSFERIDO,
    VALOR_RECEBIDO,
    VALOR_RECEBIDO_TRANSFERIDO,
    VALOR_APROVISIONADO)
AS
select distinct Projeto_Rubrica.Id_Rubrica,
                Projeto_Rubrica.Id_Projeto,
--VALOR GASTO
    0 as valor_gasto,
                --coalesce(sum(view_conta_pagar.valor_pago) ,0) as Valor_Gasto,
--VALOR GASTO TRANSFERIDO
                coalesce((select sum(Transferencia_Financeira.Valor)
                          from Transferencia_Financeira
                          where Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica.Id), 0) as Valor_Gasto_Transferido,
--VALOR RECEBIDO
                coalesce((
                case
                  when Projeto_Rubrica.Id = (select first 1 Pr.Id
                                             from Projeto_Rubrica Pr
                                             where Pr.Id_Projeto = Projeto_Rubrica.Id_Projeto
                                             order by Pr.Orcamento desc) then (select sum(Projeto_Financiador_Pagto.Valor) - (select sum((select trunc(sum(Projeto_Financiador_Pagto.Percentual) / 100 * Pr.Orcamento, 2)
                                                                                                                                          from Projeto_Financiador
                                                                                                                                          inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                                                                                                                                          where Projeto_Financiador.Id_Projeto = Pr.Id_Projeto))
                                                                                                                              from Projeto_Rubrica Pr
                                                                                                                              where Pr.Id_Projeto = Projeto_Rubrica.Id_Projeto and
                                                                                                                                    Pr.Id <> Projeto_Rubrica.Id)
                                                                               from Projeto_Financiador
                                                                               inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                                                                               where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto)

                  else (select trunc(sum(Projeto_Financiador_Pagto.Percentual) / 100 * Projeto_Rubrica.Orcamento, 2)
                        from Projeto_Financiador
                        inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                        where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto)
                end), 0) as Valor_Recebido,
--VALOR RECEBIDO TRANSFERIDO
                coalesce((select sum(Transferencia_Financeira.Valor)
                          from Transferencia_Financeira
                          where Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id), 0) as Valor_Recebido_Transferido,
--VALOR APROVISIONADO
                coalesce((select sum(Conta_Pagar_Vinculo.Valor * coalesce((select sum(Conta_Pagar_Parcela.Valor / Conta_Pagar.Valor_Total)
                                                                           from Conta_Pagar_Parcela
                                                                           inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
                                                                           where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar_Vinculo.Id_Conta_Pagar and
                                                                                 Conta_Pagar_Parcela.Status = 0), 0))
                          from Conta_Pagar_Vinculo
                          where Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and
                                Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto), 0) as Valor_Aprovisionado
from Projeto_Rubrica
left join view_conta_pagar on (view_conta_pagar.id_origem_recurso=projeto_rubrica.id_projeto and view_conta_pagar.id_rubrica_origem = projeto_rubrica.id_rubrica and view_conta_pagar.tipo_origem = 0)
order by Projeto_Rubrica.Id_Projeto, Projeto_Rubrica.Id_Rubrica

--inner join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)
;



CREATE OR ALTER VIEW VIEW_CONTA_PAGAR(
    ID,
    ID_VINCULO,
    ID_ORGANIZACAO_ORIGEM,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM,
    ID_ORIGEM_RECURSO,
    ID_UNICO_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
    ID_RUBRICA_ORIGEM,
    DATA,
    DATA_PAGAMENTO,
    FORMA_PAGAMENTO,
    DESCRICAO,
    VALOR,
    VALOR_PAGO)
AS
with Parcelas
as (select (sum(case
                  when Conta_Pagar_Parcela.Status = 1 then Conta_Pagar_Parcela.Valor
                end) / Conta_Pagar.Valor_Total) as Percentual_Pago,
                                                sum(
                                                case
                                                  when Conta_Pagar_Parcela.Status = 1 then Conta_Pagar_Parcela.Valor
                                                end) as Valor_Pago,
                                                count(*) as Qtde_Parcelas,
                                                count(
                                                case
                                                  when Conta_Pagar_Parcela.Status = 1 then 1
                                                end) as Qtde_Parcela_Paga,
                                                count(
                                                case
                                                  when Conta_Pagar_Parcela.Status = 0 then 1
                                                end) as Qtde_Parcela_Aberto,
                                                Conta_Pagar_Parcela.Id_Conta_Pagar
    from Conta_Pagar_Parcela
    inner join Conta_Pagar on (Conta_Pagar.Id = Conta_Pagar_Parcela.Id_Conta_Pagar)
    group by Conta_Pagar_Parcela.Id_Conta_Pagar, Conta_Pagar.Valor_Total

)

select Conta_Pagar.Id,
       Conta_Pagar_Vinculo.Id as Id_Vinculo,
       Conta_Pagar_Vinculo.Id_Organizacao_Origem,
       Organizacao.Nome as Nome_Organizacao,
       case
         when Conta_Pagar_Vinculo.Id_Fundo is null then 0 --Projeto
         else 1 --Fundo
       end as Tipo_Origem,
       coalesce(Conta_Pagar_Vinculo.Id_Fundo, Conta_Pagar_Vinculo.Id_Projeto_Origem) as Id_Origem_Recurso,
       coalesce('Conta_' || Conta_Pagar_Vinculo.Id_Fundo, 'Projeto_' || Conta_Pagar_Vinculo.Id_Projeto_Origem) as Id_Unico_Origem_Recurso,
       coalesce(Fundo.Nome, Projeto.Nome) as Origem_Recurso,
       Conta_Pagar_Vinculo.id_rubrica_origem,
       Conta_Pagar_Parcela.Vencimento as Data,
       Conta_Pagar_Parcela.Data_Pagamento,
       Conta_Pagar.Forma_Pagto as Forma_Pagamento,
       case
         when Parcelas.Qtde_Parcelas = 1 then Conta_Pagar.Descricao
         else Conta_Pagar.Descricao || ' (' || Conta_Pagar_Parcela.Parcela || '/' || Parcelas.Qtde_Parcelas || ')'
       end as Descricao,
--Valor
       case
         when Parcelas.Qtde_Parcelas = 1 then Conta_Pagar_Vinculo.Valor
         else case
                when ((select count(*)
                       from Conta_Pagar_Vinculo
                       where Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id) > 1) and (Conta_Pagar_Vinculo.Id = (select first 1 Conta_Pagar_Vinculo.Id
                                                                                                                      from Conta_Pagar_Vinculo
                                                                                                                      where Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id
                                                                                                                      order by Conta_Pagar_Vinculo.Id desc)) then Conta_Pagar_Parcela.Valor - (select sum(
                                                                                                                                                                                                      case
                                                                                                                                                                                                        when Parcelas.Qtde_Parcelas = Cpp.Parcela then Cpv.Valor - (trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                                                                                                                                                        else trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                                                                                                                                                      end)
                                                                                                                                                                                               from Conta_Pagar_Parcela Cpp
                                                                                                                                                                                               inner join Conta_Pagar Cp on (Cp.Id = Cpp.Id_Conta_Pagar)
                                                                                                                                                                                               inner join Conta_Pagar_Vinculo Cpv on (Cpv.Id_Conta_Pagar = Cp.Id)
                                                                                                                                                                                               where Cpp.Id_Conta_Pagar = Conta_Pagar.Id and
                                                                                                                                                                                                     Cpp.Parcela = Conta_Pagar_Parcela.Parcela and
                                                                                                                                                                                                     Cpv.Id <> Conta_Pagar_Vinculo.Id)
                else case
                       when Parcelas.Qtde_Parcelas = Conta_Pagar_Parcela.Parcela then Conta_Pagar_Vinculo.Valor - (trunc(Conta_Pagar_Vinculo.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                       else trunc(Conta_Pagar_Vinculo.Valor / Parcelas.Qtde_Parcelas, 2)
                     end
              end
       end as Valor,
--Valor Pago
       case
         when Conta_Pagar_Parcela.Status = 1 then case
                                                    when Parcelas.Qtde_Parcelas = 1 then Conta_Pagar_Vinculo.Valor
                                                    else case
                                                           when ((select count(*)
                                                                  from Conta_Pagar_Vinculo
                                                                  where Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id) > 1) and (Conta_Pagar_Vinculo.Id = (select first 1 Conta_Pagar_Vinculo.Id
                                                                                                                                                                 from Conta_Pagar_Vinculo
                                                                                                                                                                 where Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id
                                                                                                                                                                 order by Conta_Pagar_Vinculo.Id desc)) then Conta_Pagar_Parcela.Valor - (select sum(
                                                                                                                                                                                                                                                 case
                                                                                                                                                                                                                                                   when Parcelas.Qtde_Parcelas = Cpp.Parcela then Cpv.Valor - (trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                                                                                                                                                                                                   else trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                                                                                                                                                                                                 end)
                                                                                                                                                                                                                                          from Conta_Pagar_Parcela Cpp
                                                                                                                                                                                                                                          inner join Conta_Pagar Cp on (Cp.Id = Cpp.Id_Conta_Pagar)
                                                                                                                                                                                                                                          inner join Conta_Pagar_Vinculo Cpv on (Cpv.Id_Conta_Pagar = Cp.Id)
                                                                                                                                                                                                                                          where Cpp.Id_Conta_Pagar = Conta_Pagar.Id and
                                                                                                                                                                                                                                                Cpp.Parcela = Conta_Pagar_Parcela.Parcela and
                                                                                                                                                                                                                                                Cpv.Id <> Conta_Pagar_Vinculo.Id)
                                                           else case
                                                                  when Parcelas.Qtde_Parcelas = Conta_Pagar_Parcela.Parcela then Conta_Pagar_Vinculo.Valor - (trunc(Conta_Pagar_Vinculo.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                  else trunc(Conta_Pagar_Vinculo.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                end
                                                         end
                                                  end
         else 0
       end as Valor_Pago

from Conta_Pagar_Parcela
inner join Conta_Pagar on (Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Parcelas on (Conta_Pagar.Id = Parcelas.Id_Conta_Pagar)
left join Fundo on (Conta_Pagar_Vinculo.Id_Fundo = Fundo.Id)
left join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto.Id)
inner join Organizacao on (Conta_Pagar_Vinculo.Id_Organizacao_Origem = Organizacao.Id)
;



CREATE OR ALTER VIEW VIEW_VALORES_RUBRICA_PROJETO(
    ID_RUBRICA,
    ID_PROJETO,
    NOME_PROJETO,
    NOME_RUBRICA,
    ORCAMENTO,
    VALOR_GASTO,
    VALOR_GASTO_TRANSFERIDO,
    VALOR_RECEBIDO,
    VALOR_RECEBIDO_TRANSFERIDO,
    VALOR_APROVISIONADO)
AS
select distinct PROJETO_RUBRICA.ID_RUBRICA,
                PROJETO_RUBRICA.ID_PROJETO,
                Projeto.Nome as Nome_Projeto,
                Rubrica.Nome as Nome_Rubrica,
                Projeto_Rubrica.Orcamento,
                --VALOR GASTO
                coalesce(sum(VIEW_CONTA_PAGAR.VALOR_PAGO) over(partition by PROJETO_RUBRICA.ID_PROJETO, PROJETO_RUBRICA.ID_RUBRICA), 0) as VALOR_GASTO,
                --VALOR GASTO TRANSFERIDO
                coalesce((select sum(TRANSFERENCIA_FINANCEIRA.VALOR)
                          from TRANSFERENCIA_FINANCEIRA
                          where TRANSFERENCIA_FINANCEIRA.ID_PROJETO_RUBRICA_ORIGEM = PROJETO_RUBRICA.ID), 0) as VALOR_GASTO_TRANSFERIDO,
                --VALOR RECEBIDO
                coalesce((
                case
                  when PROJETO_RUBRICA.ID = (select first 1 PR.ID
                                             from PROJETO_RUBRICA PR
                                             where PR.ID_PROJETO = PROJETO_RUBRICA.ID_PROJETO
                                             order by PR.ORCAMENTO desc) then (select sum(PROJETO_FINANCIADOR_PAGTO.VALOR) - (select sum((select trunc(sum(PROJETO_FINANCIADOR_PAGTO.PERCENTUAL) / 100 * PR.ORCAMENTO, 2)
                                                                                                                                          from PROJETO_FINANCIADOR
                                                                                                                                          inner join PROJETO_FINANCIADOR_PAGTO on (PROJETO_FINANCIADOR_PAGTO.ID_PROJETO_FINANCIADOR = PROJETO_FINANCIADOR.ID)
                                                                                                                                          where PROJETO_FINANCIADOR.ID_PROJETO = PR.ID_PROJETO))
                                                                                                                              from PROJETO_RUBRICA PR
                                                                                                                              where PR.ID_PROJETO = PROJETO_RUBRICA.ID_PROJETO and
                                                                                                                                    PR.ID <> PROJETO_RUBRICA.ID)
                                                                               from PROJETO_FINANCIADOR
                                                                               inner join PROJETO_FINANCIADOR_PAGTO on (PROJETO_FINANCIADOR_PAGTO.ID_PROJETO_FINANCIADOR = PROJETO_FINANCIADOR.ID)
                                                                               where PROJETO_FINANCIADOR.ID_PROJETO = PROJETO_RUBRICA.ID_PROJETO)

                  else (select trunc(sum(PROJETO_FINANCIADOR_PAGTO.PERCENTUAL) / 100 * PROJETO_RUBRICA.ORCAMENTO, 2)
                        from PROJETO_FINANCIADOR
                        inner join PROJETO_FINANCIADOR_PAGTO on (PROJETO_FINANCIADOR_PAGTO.ID_PROJETO_FINANCIADOR = PROJETO_FINANCIADOR.ID)
                        where PROJETO_FINANCIADOR.ID_PROJETO = PROJETO_RUBRICA.ID_PROJETO)
                end), 0) as VALOR_RECEBIDO,
                --VALOR RECEBIDO TRANSFERIDO
                coalesce((select sum(TRANSFERENCIA_FINANCEIRA.VALOR)
                          from TRANSFERENCIA_FINANCEIRA
                          where TRANSFERENCIA_FINANCEIRA.ID_PROJETO_RUBRICA_DESTINO = PROJETO_RUBRICA.ID), 0) as VALOR_RECEBIDO_TRANSFERIDO,
                --VALOR APROVISIONADO

                coalesce((sum(VIEW_CONTA_PAGAR.VALOR) over(partition by PROJETO_RUBRICA.ID_PROJETO, PROJETO_RUBRICA.ID_RUBRICA)) - (sum(VIEW_CONTA_PAGAR.VALOR_PAGO) over(partition by PROJETO_RUBRICA.ID_PROJETO, PROJETO_RUBRICA.ID_RUBRICA)), 0) as VALOR_APROVISIONADO
from PROJETO_RUBRICA
inner join projeto on (projeto.id = projeto_rubrica.id_projeto)
inner join rubrica on (rubrica.id = projeto_rubrica.id_rubrica)
left join VIEW_CONTA_PAGAR on (VIEW_CONTA_PAGAR.ID_ORIGEM_RECURSO = PROJETO_RUBRICA.ID_PROJETO and
      VIEW_CONTA_PAGAR.ID_RUBRICA_ORIGEM = PROJETO_RUBRICA.ID_RUBRICA and
      VIEW_CONTA_PAGAR.TIPO_ORIGEM = 0)

order by PROJETO_RUBRICA.ID_PROJETO, PROJETO_RUBRICA.ID_RUBRICA
;



CREATE OR ALTER VIEW VIEW_RUBRICA_PROJETO(
    ID_RUBRICA,
    ID_PROJETO,
    NOME_PROJETO,
    NOME_RUBRICA,
    ORCAMENTO,
    VALOR_GASTO,
    VALOR_GASTO_TRANSFERIDO,
    VALOR_RECEBIDO,
    VALOR_RECEBIDO_TRANSFERIDO,
    VALOR_APROVISIONADO,
    SALDO_REAL,
    SALDO_PREVISTO)
AS
select distinct View_Valores_Rubrica_Projeto.Id_Rubrica,
                View_Valores_Rubrica_Projeto.Id_Projeto,
                View_Valores_Rubrica_Projeto.Nome_Projeto,
                View_Valores_Rubrica_Projeto.Nome_Rubrica,
                View_Valores_Rubrica_Projeto.orcamento,
                View_Valores_Rubrica_Projeto.Valor_Gasto,
                View_Valores_Rubrica_Projeto.valor_gasto_transferido,
                View_Valores_Rubrica_Projeto.Valor_Recebido,
                View_Valores_Rubrica_Projeto.valor_recebido_transferido,
                View_Valores_Rubrica_Projeto.valor_aprovisionado,
                (View_Valores_Rubrica_Projeto.Valor_Recebido+ View_Valores_Rubrica_Projeto.valor_recebido_transferido)-
                 (View_Valores_Rubrica_Projeto.Valor_Gasto+View_Valores_Rubrica_Projeto.valor_gasto_transferido) as Saldo_Real,
                (View_Valores_Rubrica_Projeto.Orcamento+View_Valores_Rubrica_Projeto.valor_recebido_transferido) -
                 (View_Valores_Rubrica_Projeto.Valor_Gasto + View_Valores_Rubrica_Projeto.valor_gasto_transferido +
                  View_Valores_Rubrica_Projeto.valor_aprovisionado) as Saldo_Previsto

from View_Valores_Rubrica_Projeto
;

