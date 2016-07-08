

ALTER TABLE LOTE_SEMENTE
    ADD ID_LOTE_SEMENTE_ORIGEM INTEGER;

COMMENT ON COLUMN LOTE_SEMENTE.ID_LOTE_SEMENTE_ORIGEM IS
'Alguns lotes de sementes sao gerados a partir do resto nao semeado de outro, entao nesse caso esse campo sera preenchido.';

alter table LOTE_SEMENTE
alter ID position 1;

alter table LOTE_SEMENTE
alter ID_ESPECIE position 2;

alter table LOTE_SEMENTE
alter ID_PESSOA_COLETOU position 3;

alter table LOTE_SEMENTE
alter ID_COMPRA_ITEM position 4;

alter table LOTE_SEMENTE
alter ID_CAMARA_FRIA position 5;

alter table LOTE_SEMENTE
alter ID_LOTE_SEMENTE_ORIGEM position 6;

alter table LOTE_SEMENTE
alter NOME position 7;

alter table LOTE_SEMENTE
alter DATA position 8;

alter table LOTE_SEMENTE
alter QTDE position 9;

alter table LOTE_SEMENTE
alter QTDE_ARMAZENADA position 10;

alter table LOTE_SEMENTE
alter TAXA_GERMINACAO position 11;

alter table LOTE_SEMENTE
alter TAXA_DESCARTE position 12;

alter table LOTE_SEMENTE
alter STATUS position 13;



ALTER TABLE LOTE_SEMENTE
ADD CONSTRAINT FK_LOTE_SEMENTE_5
FOREIGN KEY (ID_LOTE_SEMENTE_ORIGEM)
REFERENCES LOTE_SEMENTE(ID)
ON DELETE SET NULL
ON UPDATE CASCADE;



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
                Rubrica.Nome as Nome_Rubrica,
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



ALTER TABLE NOTIFICACAO
    ADD VALOR_GATILHO NUMERIC(15,2);

COMMENT ON COLUMN NOTIFICACAO.VALOR_GATILHO IS
'Usado por algumas notificoes (Fundo sem saldo) para se saber o ponto no qual deve-se iniciar os envios das notificacoes';



ALTER TABLE ATIVIDADE
    ADD DATA_CADASTRO TIMESTAMP;



ALTER TABLE ATIVIDADE
    ADD DATA_ALTERACAO TIMESTAMP;



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
                Rubrica.Nome as Nome_Rubrica,
                Projeto_Rubrica.Orcamento,
                case
                    when View_Valores_Rubrica_Projeto.valor_gasto_transferido > View_Valores_Rubrica_Projeto.valor_recebido_transferido then
                        (View_Valores_Rubrica_Projeto.Valor_Gasto+(View_Valores_Rubrica_Projeto.valor_gasto_transferido-View_Valores_Rubrica_Projeto.valor_recebido_transferido))
                   else
                     View_Valores_Rubrica_Projeto.Valor_Gasto
                end as Valor_gasto,
                case
                    when View_Valores_Rubrica_Projeto.valor_gasto_transferido < View_Valores_Rubrica_Projeto.valor_recebido_transferido then
                        (View_Valores_Rubrica_Projeto.Valor_Recebido+(View_Valores_Rubrica_Projeto.valor_recebido_transferido - View_Valores_Rubrica_Projeto.valor_gasto_transferido))
                   else
                    View_Valores_Rubrica_Projeto.Valor_Recebido
                end as Valor_Recebido,
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



ALTER TABLE SOLICITACAO_COMPRA
ADD CONSTRAINT FK_SOLICITACAO_COMPRA_1
FOREIGN KEY (ID_PESSOA_SOLICITOU)
REFERENCES PESSOA(ID)
ON UPDATE CASCADE;

ALTER TABLE SOLICITACAO_COMPRA
ADD CONSTRAINT FK_SOLICITACAO_COMPRA_2
FOREIGN KEY (ID_PESSOA_ANALISOU)
REFERENCES PESSOA(ID)
ON UPDATE CASCADE;
