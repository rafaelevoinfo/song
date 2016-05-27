

ALTER TABLE TRANSFERENCIA_FINANCEIRA
    ADD ID_PESSOA INTEGER NOT NULL,
    ADD DATA TIMESTAMP NOT NULL;

COMMENT ON COLUMN TRANSFERENCIA_FINANCEIRA.ID_PESSOA IS
'Usuario do sistema que realizou a transferencia';

COMMENT ON COLUMN TRANSFERENCIA_FINANCEIRA.DATA IS
'Data e Hora da transferencia';

alter table TRANSFERENCIA_FINANCEIRA
alter ID position 1;

alter table TRANSFERENCIA_FINANCEIRA
alter ID_PESSOA position 2;

alter table TRANSFERENCIA_FINANCEIRA
alter ID_FUNDO_ORIGEM position 3;

alter table TRANSFERENCIA_FINANCEIRA
alter ID_FUNDO_DESTINO position 4;

alter table TRANSFERENCIA_FINANCEIRA
alter ID_PROJETO_RUBRICA_ORIGEM position 5;

alter table TRANSFERENCIA_FINANCEIRA
alter ID_PROJETO_RUBRICA_DESTINO position 6;

alter table TRANSFERENCIA_FINANCEIRA
alter VALOR position 7;

alter table TRANSFERENCIA_FINANCEIRA
alter DATA position 8;



ALTER TABLE TRANSFERENCIA_FINANCEIRA
ADD CONSTRAINT FK_TRANSFERENCIA_FINANCEIRA_5
FOREIGN KEY (ID_PESSOA)
REFERENCES PESSOA(ID)
ON UPDATE CASCADE;



CREATE OR ALTER VIEW VIEW_VALORES_RUBRICA_PROJETO(
    ID_RUBRICA,
    ID_PROJETO,
    VALOR_GASTO,
    VALOR_RECEBIDO,
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
                                Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto), 0)+

                coalesce((select sum(transferencia_financeira.valor)
                            from transferencia_financeira
                          inner join projeto_rubrica pr on (pr.id = transferencia_financeira.id_projeto_rubrica_origem)
                         where pr.id_projeto = projeto_rubrica.id_projeto and
                               pr.id_rubrica = projeto_rubrica.id_rubrica),0) as Valor_Gasto,
               --VALOR RECEBIDO
                coalesce((select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                          from Projeto_Financiador
                          inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                          where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto), 0)+
                coalesce((select sum(transferencia_financeira.valor)
                            from transferencia_financeira
                          inner join projeto_rubrica pr on (pr.id = transferencia_financeira.id_projeto_rubrica_destino)
                         where pr.id_projeto = projeto_rubrica.id_projeto and
                               pr.id_rubrica = projeto_rubrica.id_rubrica),0) as Valor_Recebido,
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
inner join Conta_Pagar_Vinculo on (Conta_Pagar_Vinculo.Id_Rubrica_Origem = Projeto_Rubrica.Id_Rubrica and Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto)
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
                --Projeto.Nome as Nome_Projeto,
                '' as nome_projeto,
                Rubrica.Identificador || ' - ' || Rubrica.Nome as Nome_Rubrica,
                Projeto_Rubrica.Orcamento,
                View_Valores_Rubrica_Projeto.Valor_Gasto,
                View_Valores_Rubrica_Projeto.Valor_Recebido,
                View_Valores_Rubrica_Projeto.valor_aprovisionado,
                View_Valores_Rubrica_Projeto.Valor_Recebido-View_Valores_Rubrica_Projeto.Valor_Gasto as Saldo_Real,
                Projeto_Rubrica.Orcamento - (View_Valores_Rubrica_Projeto.Valor_Gasto + View_Valores_Rubrica_Projeto.valor_aprovisionado) as Saldo_Previsto

from Projeto_Rubrica
inner join Rubrica on (Rubrica.Id = Projeto_Rubrica.Id_Rubrica)
--inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)
left join View_Valores_Rubrica_Projeto on (View_Valores_Rubrica_Projeto.Id_Projeto = Projeto_Rubrica.Id_Projeto and View_Valores_Rubrica_Projeto.Id_Rubrica = Projeto_Rubrica.Id_Rubrica)
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
                --Projeto.Nome as Nome_Projeto,
                '' as nome_projeto,
                --Rubrica.Identificador || ' - ' || Rubrica.Nome as Nome_Rubrica,
                '' as nome_rubrica,
                Projeto_Rubrica.Orcamento,
                View_Valores_Rubrica_Projeto.Valor_Gasto,
                View_Valores_Rubrica_Projeto.Valor_Recebido,
                View_Valores_Rubrica_Projeto.valor_aprovisionado,
                View_Valores_Rubrica_Projeto.Valor_Recebido-View_Valores_Rubrica_Projeto.Valor_Gasto as Saldo_Real,
                Projeto_Rubrica.Orcamento - (View_Valores_Rubrica_Projeto.Valor_Gasto + View_Valores_Rubrica_Projeto.valor_aprovisionado) as Saldo_Previsto

from Projeto_Rubrica
--inner join Rubrica on (Rubrica.Id = Projeto_Rubrica.Id_Rubrica)
--inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)
left join View_Valores_Rubrica_Projeto on (View_Valores_Rubrica_Projeto.Id_Projeto = Projeto_Rubrica.Id_Projeto and View_Valores_Rubrica_Projeto.Id_Rubrica = Projeto_Rubrica.Id_Rubrica)
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



CREATE OR ALTER VIEW VIEW_VALORES_RUBRICA_PROJETO(
    ID_RUBRICA,
    ID_PROJETO,
    VALOR_GASTO,
    VALOR_RECEBIDO,
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
                                Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto_Rubrica.Id_Projeto), 0)+

                coalesce((select sum(transferencia_financeira.valor)
                            from transferencia_financeira
                          inner join projeto_rubrica pr on (pr.id = transferencia_financeira.id_projeto_rubrica_origem)
                         where pr.id_projeto = projeto_rubrica.id_projeto and
                               pr.id_rubrica = projeto_rubrica.id_rubrica),0) as Valor_Gasto,
               --VALOR RECEBIDO
                coalesce((select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                          from Projeto_Financiador
                          inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                          where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto), 0)+
                coalesce((select sum(transferencia_financeira.valor)
                            from transferencia_financeira
                          inner join projeto_rubrica pr on (pr.id = transferencia_financeira.id_projeto_rubrica_destino)
                         where pr.id_projeto = projeto_rubrica.id_projeto and
                               pr.id_rubrica = projeto_rubrica.id_rubrica),0) as Valor_Recebido,
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



CREATE OR ALTER VIEW VIEW_VALORES_RUBRICA_PROJETO(
    ID_RUBRICA,
    ID_PROJETO,
    VALOR_GASTO,
    VALOR_GASTO_TRANSFERIDO,
    VALOR_RECEBIDO,
    VALOR_RECEBIDO_TRANSFERENCIA,
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

                coalesce((select sum(transferencia_financeira.valor)
                            from transferencia_financeira
                            where transferencia_financeira.id_projeto_rubrica_origem = projeto_rubrica.id),0) as Valor_Gasto_Transferido,
               --VALOR RECEBIDO
                coalesce((select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                          from Projeto_Financiador
                          inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                          where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto), 0) as Valor_Recebido,

                coalesce((select sum(transferencia_financeira.valor)
                            from transferencia_financeira
                          where transferencia_financeira.id_projeto_rubrica_origem = projeto_rubrica.id),0) as Valor_Recebido,
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

                coalesce((select sum(transferencia_financeira.valor)
                            from transferencia_financeira
                            where transferencia_financeira.id_projeto_rubrica_origem = projeto_rubrica.id),0) as Valor_Gasto_Transferido,
               --VALOR RECEBIDO
                coalesce((select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                          from Projeto_Financiador
                          inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                          where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto), 0) as Valor_Recebido,

                coalesce((select sum(transferencia_financeira.valor)
                            from transferencia_financeira
                          where transferencia_financeira.id_projeto_rubrica_origem = projeto_rubrica.id),0) as Valor_Recebido,
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

                coalesce((select sum(transferencia_financeira.valor)
                            from transferencia_financeira
                            where transferencia_financeira.id_projeto_rubrica_origem = projeto_rubrica.id),0) as Valor_Gasto_Transferido,
               --VALOR RECEBIDO
                coalesce((select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                          from Projeto_Financiador
                          inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                          where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto), 0) as Valor_Recebido,

                coalesce((select sum(transferencia_financeira.valor)
                            from transferencia_financeira
                          where transferencia_financeira.id_projeto_rubrica_origem = projeto_rubrica.id),0) as Valor_Recebido_transferido,
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
    VALOR_RECEBIDO,
    VALOR_APROVISIONADO,
    SALDO_REAL,
    SALDO_PREVISTO)
AS
select distinct Projeto_Rubrica.Id_Rubrica,
                Projeto_Rubrica.Id_Projeto,
                Projeto.Nome as Nome_Projeto,
                Rubrica.Identificador || ' - ' || Rubrica.Nome as Nome_Rubrica,
                Projeto_Rubrica.Orcamento,
                (View_Valores_Rubrica_Projeto.Valor_Gasto+View_Valores_Rubrica_Projeto.valor_gasto_transferido) as valor_gasto,
                (View_Valores_Rubrica_Projeto.Valor_Recebido+View_Valores_Rubrica_Projeto.valor_recebido_transferido) as valor_recebido,
                View_Valores_Rubrica_Projeto.valor_aprovisionado,
                View_Valores_Rubrica_Projeto.Valor_Recebido-View_Valores_Rubrica_Projeto.Valor_Gasto as Saldo_Real,
                Projeto_Rubrica.Orcamento - (View_Valores_Rubrica_Projeto.Valor_Gasto + View_Valores_Rubrica_Projeto.valor_aprovisionado) as Saldo_Previsto

from Projeto_Rubrica
inner join Rubrica on (Rubrica.Id = Projeto_Rubrica.Id_Rubrica)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)
left join View_Valores_Rubrica_Projeto on (View_Valores_Rubrica_Projeto.Id_Projeto = Projeto_Rubrica.Id_Projeto and View_Valores_Rubrica_Projeto.Id_Rubrica = Projeto_Rubrica.Id_Rubrica)
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
                Projeto.Nome as Nome_Projeto,
                Rubrica.Identificador || ' - ' || Rubrica.Nome as Nome_Rubrica,
                Projeto_Rubrica.Orcamento,
                (View_Valores_Rubrica_Projeto.Valor_Gasto+View_Valores_Rubrica_Projeto.valor_gasto_transferido) as valor_gasto,
                (View_Valores_Rubrica_Projeto.Valor_Recebido+View_Valores_Rubrica_Projeto.valor_recebido_transferido) as valor_recebido,
                View_Valores_Rubrica_Projeto.valor_aprovisionado,
                View_Valores_Rubrica_Projeto.Valor_Recebido-View_Valores_Rubrica_Projeto.Valor_Gasto as Saldo_Real,
                Projeto_Rubrica.Orcamento - (View_Valores_Rubrica_Projeto.Valor_Gasto + View_Valores_Rubrica_Projeto.valor_aprovisionado) as Saldo_Previsto

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
                coalesce((select sum(Projeto_Financiador_Pagto.Percentual / 100 * Projeto_Rubrica.Orcamento)
                          from Projeto_Financiador
                          inner join Projeto_Financiador_Pagto on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
                          where Projeto_Financiador.Id_Projeto = Projeto_Rubrica.Id_Projeto), 0) as Valor_Recebido,
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
                Projeto.Nome as Nome_Projeto,
                Rubrica.Identificador || ' - ' || Rubrica.Nome as Nome_Rubrica,
                Projeto_Rubrica.Orcamento,
                (View_Valores_Rubrica_Projeto.Valor_Gasto+View_Valores_Rubrica_Projeto.valor_gasto_transferido) as valor_gasto,
                (View_Valores_Rubrica_Projeto.Valor_Recebido+View_Valores_Rubrica_Projeto.valor_recebido_transferido) as valor_recebido,
                View_Valores_Rubrica_Projeto.valor_aprovisionado,
                View_Valores_Rubrica_Projeto.Valor_Recebido-View_Valores_Rubrica_Projeto.Valor_Gasto-View_Valores_Rubrica_Projeto.valor_gasto_transferido as Saldo_Real,
                Projeto_Rubrica.Orcamento - (View_Valores_Rubrica_Projeto.Valor_Gasto +View_Valores_Rubrica_Projeto.valor_gasto_transferido+ View_Valores_Rubrica_Projeto.valor_aprovisionado) as Saldo_Previsto

from Projeto_Rubrica
inner join Rubrica on (Rubrica.Id = Projeto_Rubrica.Id_Rubrica)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)
left join View_Valores_Rubrica_Projeto on (View_Valores_Rubrica_Projeto.Id_Projeto = Projeto_Rubrica.Id_Projeto and View_Valores_Rubrica_Projeto.Id_Rubrica = Projeto_Rubrica.Id_Rubrica)
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
                Projeto.Nome as Nome_Projeto,
                Rubrica.Identificador || ' - ' || Rubrica.Nome as Nome_Rubrica,
                Projeto_Rubrica.Orcamento,
                (View_Valores_Rubrica_Projeto.Valor_Gasto+View_Valores_Rubrica_Projeto.valor_gasto_transferido) as valor_gasto,
                (View_Valores_Rubrica_Projeto.Valor_Recebido+View_Valores_Rubrica_Projeto.valor_recebido_transferido) as valor_recebido,
                View_Valores_Rubrica_Projeto.valor_aprovisionado,
                View_Valores_Rubrica_Projeto.Valor_Recebido-(View_Valores_Rubrica_Projeto.Valor_Gasto+View_Valores_Rubrica_Projeto.valor_gasto_transferido) as Saldo_Real,
                Projeto_Rubrica.Orcamento - (View_Valores_Rubrica_Projeto.Valor_Gasto +View_Valores_Rubrica_Projeto.valor_gasto_transferido+ View_Valores_Rubrica_Projeto.valor_aprovisionado) as Saldo_Previsto

from Projeto_Rubrica
inner join Rubrica on (Rubrica.Id = Projeto_Rubrica.Id_Rubrica)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)
left join View_Valores_Rubrica_Projeto on (View_Valores_Rubrica_Projeto.Id_Projeto = Projeto_Rubrica.Id_Projeto and View_Valores_Rubrica_Projeto.Id_Rubrica = Projeto_Rubrica.Id_Rubrica)
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
                Projeto.Nome as Nome_Projeto,
                Rubrica.Identificador || ' - ' || Rubrica.Nome as Nome_Rubrica,
                Projeto_Rubrica.Orcamento,
                (View_Valores_Rubrica_Projeto.Valor_Gasto+View_Valores_Rubrica_Projeto.valor_gasto_transferido) as valor_gasto,
                (View_Valores_Rubrica_Projeto.Valor_Recebido+View_Valores_Rubrica_Projeto.valor_recebido_transferido) as valor_recebido,
                View_Valores_Rubrica_Projeto.valor_aprovisionado,
                (View_Valores_Rubrica_Projeto.Valor_Recebido+ View_Valores_Rubrica_Projeto.valor_recebido_transferido)-(View_Valores_Rubrica_Projeto.Valor_Gasto+View_Valores_Rubrica_Projeto.valor_gasto_transferido) as Saldo_Real,
                (Projeto_Rubrica.Orcamento+View_Valores_Rubrica_Projeto.valor_recebido_transferido) - (View_Valores_Rubrica_Projeto.Valor_Gasto +View_Valores_Rubrica_Projeto.valor_gasto_transferido+ View_Valores_Rubrica_Projeto.valor_aprovisionado) as Saldo_Previsto

from Projeto_Rubrica
inner join Rubrica on (Rubrica.Id = Projeto_Rubrica.Id_Rubrica)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)
left join View_Valores_Rubrica_Projeto on (View_Valores_Rubrica_Projeto.Id_Projeto = Projeto_Rubrica.Id_Projeto and View_Valores_Rubrica_Projeto.Id_Rubrica = Projeto_Rubrica.Id_Rubrica)
;



ALTER TABLE VENDA_ITEM
    ADD VALOR_UNITARIO NUMERIC(15,2) NOT NULL;

