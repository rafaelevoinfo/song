

ALTER TABLE TRANSFERENCIA_FINANCEIRA
    ADD TIPO SMALLINT NOT NULL;

COMMENT ON COLUMN TRANSFERENCIA_FINANCEIRA.TIPO IS
'0 - Overhead
1 - Emprestimo
2 - Devolucao de Emprestimo';



UPDATE TRANSFERENCIA_FINANCEIRA
SET TIPO = 0;



CREATE TABLE DOACAO (
    ID INTEGER NOT NULL,
    ID_PESSOA_DOADORA INTEGER NOT NULL,
    ID_PESSOA_RECEBEU INTEGER NOT NULL,
    ID_CONTA INTEGER NOT NULL,
    VALOR NUMERIC(15,2) NOT NULL,
    DATA TIMESTAMP NOT NULL,
    OBSERVACAO D_DESCRICAO);

ALTER TABLE DOACAO
ADD CONSTRAINT PK_DOACAO
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_DOACAO;



ALTER TABLE DOACAO
ADD CONSTRAINT FK_DOACAO_1
FOREIGN KEY (ID_PESSOA_DOADORA)
REFERENCES PESSOA(ID)
ON UPDATE CASCADE;

ALTER TABLE DOACAO
ADD CONSTRAINT FK_DOACAO_2
FOREIGN KEY (ID_PESSOA_RECEBEU)
REFERENCES PESSOA(ID)
ON UPDATE CASCADE;

ALTER TABLE DOACAO
ADD CONSTRAINT FK_DOACAO_3
FOREIGN KEY (ID_CONTA)
REFERENCES FUNDO(ID)
ON UPDATE CASCADE;



ALTER TABLE DOACAO DROP CONSTRAINT FK_DOACAO_3;



ALTER TABLE DOACAO
    ALTER ID_CONTA TO ID_FUNDO;



ALTER TABLE DOACAO
ADD CONSTRAINT FK_DOACAO_3
FOREIGN KEY (ID_FUNDO)
REFERENCES FUNDO(ID)
ON UPDATE CASCADE;



CREATE INDEX DOACAO_IDX1
ON DOACAO (VALOR);



ALTER TABLE DOACAO
    ADD FORMA_PAGAMENTO SMALLINT;

COMMENT ON COLUMN DOACAO.FORMA_PAGAMENTO IS
'Forma de pagamento, cartao, dinheiro, cheque, etc';

alter table DOACAO
alter ID position 1;

alter table DOACAO
alter ID_PESSOA_DOADORA position 2;

alter table DOACAO
alter ID_PESSOA_RECEBEU position 3;

alter table DOACAO
alter ID_FUNDO position 4;

alter table DOACAO
alter FORMA_PAGAMENTO position 5;

alter table DOACAO
alter VALOR position 6;

alter table DOACAO
alter DATA position 7;

alter table DOACAO
alter OBSERVACAO position 8;



ALTER TABLE DOACAO ALTER FORMA_PAGAMENTO TO FORMA_PAGTO;



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
    DATA_PAGAMENTO_RECEBIMENTO,
    FORMA_PAGAMENTO_RECEBIMENTO,
    VALOR_TOTAL,
    VALOR_PARCIAL,
    VALOR_TOTAL_PAGO_RECEBIDO)
AS
--DESPESA DE PROJETO
select 0 AS ID_IDENTIFICACAO_TABELA,
       Conta_pagar_vinculo.id,
       Conta_Pagar.Id as Id_Movimentacao,
       Conta_Pagar_Vinculo.id_organizacao_origem as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipo_origem_recurso, --Projeto
       Projeto.Id as Id_origem_recurso,
       Projeto.Nome as Origem_Recurso,
       0 as tipo_origem,--Projeto
       0 as Tipo,
       'Despesa' as Descricao_tipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.vencimento) as Data,
       (select first 1 Conta_Pagar_Parcela.data_pagamento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Data_Pagamento) as Data_Pagamento_Recebimento,
       Conta_pagar.forma_pagto as Forma_Pagamento_Recebimento,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as VALOR_TOTAL_PAGO_RECEBIDO
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto.Id)
inner join Organizacao on (Conta_Pagar_Vinculo.id_organizacao_origem = Organizacao.Id)
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
       'Despesa' as Descricao_tipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.vencimento) as Data,
       (select first 1 Conta_Pagar_Parcela.data_pagamento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Data_Pagamento) as Data_Pagamento_Recebimento,
       Conta_pagar.forma_pagto as Forma_Pagamento_Recebimento,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as VALOR_TOTAL_PAGO_RECEBIDO
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
       'Receita' as Descricao_tipo,
       Conta_Receber.Descricao,
       (select first 1 conta_receber_parcela.vencimento
        from conta_receber_parcela
        where conta_receber_parcela.id_conta_receber = conta_receber.Id
        order by conta_receber_parcela.vencimento) as Data,
       (select first 1 Conta_Receber_Parcela.data_recebimento
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.id_conta_receber = Conta_Receber.Id
        order by Conta_Receber_Parcela.data_recebimento) as Data_Pagamento_Recebimento,
       Conta_Receber.forma_pagto as Forma_Pagamento_Recebimento,
       Conta_Receber.Valor_Total,
       Conta_Receber_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Receber_Parcela.Valor)
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Status = 1 and
              Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id) as VALOR_TOTAL_PAGO_RECEBIDO
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
       'Receita' as Descricao_tipo,
       'Pagamento Financiador - '||fin_for_cli.nome_fantasia as Descricao,
       Projeto_Financiador_Pagto.data as Data,
       Projeto_Financiador_Pagto.data as Data_Pagamento_Recebimento,
       Projeto_Financiador_Pagto.forma_pagto as Forma_Pagamento_Recebimento,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador_Pagto.Valor as Valor_Parcial,
       Projeto_Financiador_Pagto.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from Projeto_Financiador_Pagto
inner join Projeto_Financiador on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join fin_for_cli on (projeto_financiador.id_financiador = fin_for_cli.id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id = projeto_financiador_pagto.id_projeto_organizacao)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)

union all

select 4 AS ID_IDENTIFICACAO_TABELA,
       doacao.id,
       doacao.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       3 as Tipo_Origem_recurso, --Doacao
       Doacao.Id as Id_origem_recurso,
       Pessoa.Nome as Origem_recurso,
       1 as tipo_origem,--Fundo
       1 as Tipo,--Receita
       'Receita' as Descricao_tipo,
       'Doação de '||pessoa.nome as Descricao,
       cast(doacao.data as Date) as Data,
       cast(doacao.data as Date) as Data_Pagamento_Recebimento,
       doacao.forma_pagto as Forma_Pagamento_Recebimento,
       doacao.valor as Valor_Total,
       doacao.Valor as Valor_Parcial,
       doacao.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from doacao
inner join Fundo on (Fundo.id = doacao.id_fundo)
inner join Organizacao on (Organizacao.Id = Fundo.id_organizacao)
inner join pessoa on (pessoa.id = doacao.id_pessoa_doadora)
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
    DATA_PAGAMENTO_RECEBIMENTO,
    FORMA_PAGAMENTO_RECEBIMENTO,
    VALOR_TOTAL,
    VALOR_PARCIAL,
    VALOR_TOTAL_PAGO_RECEBIDO)
AS
--DESPESA DE PROJETO
select 0 AS ID_IDENTIFICACAO_TABELA,
       Conta_pagar_vinculo.id,
       Conta_Pagar.Id as Id_Movimentacao,
       Conta_Pagar_Vinculo.id_organizacao_origem as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipo_origem_recurso, --Projeto
       Projeto.Id as Id_origem_recurso,
       Projeto.Nome as Origem_Recurso,
       0 as tipo_origem,--Projeto
       0 as Tipo,
       'Despesa' as Descricao_tipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.vencimento) as Data,
       (select first 1 Conta_Pagar_Parcela.data_pagamento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Data_Pagamento) as Data_Pagamento_Recebimento,
       Conta_pagar.forma_pagto as Forma_Pagamento_Recebimento,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as VALOR_TOTAL_PAGO_RECEBIDO
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto.Id)
inner join Organizacao on (Conta_Pagar_Vinculo.id_organizacao_origem = Organizacao.Id)
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
       'Despesa' as Descricao_tipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.vencimento) as Data,
       (select first 1 Conta_Pagar_Parcela.data_pagamento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Data_Pagamento) as Data_Pagamento_Recebimento,
       Conta_pagar.forma_pagto as Forma_Pagamento_Recebimento,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as VALOR_TOTAL_PAGO_RECEBIDO
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
       'Receita' as Descricao_tipo,
       Conta_Receber.Descricao,
       (select first 1 conta_receber_parcela.vencimento
        from conta_receber_parcela
        where conta_receber_parcela.id_conta_receber = conta_receber.Id
        order by conta_receber_parcela.vencimento) as Data,
       (select first 1 Conta_Receber_Parcela.data_recebimento
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.id_conta_receber = Conta_Receber.Id
        order by Conta_Receber_Parcela.data_recebimento) as Data_Pagamento_Recebimento,
       Conta_Receber.forma_pagto as Forma_Pagamento_Recebimento,
       Conta_Receber.Valor_Total,
       Conta_Receber_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Receber_Parcela.Valor)
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Status = 1 and
              Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id) as VALOR_TOTAL_PAGO_RECEBIDO
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
       'Receita' as Descricao_tipo,
       'Pagamento Financiador - '||fin_for_cli.nome_fantasia as Descricao,
       Projeto_Financiador_Pagto.data as Data,
       Projeto_Financiador_Pagto.data as Data_Pagamento_Recebimento,
       Projeto_Financiador_Pagto.forma_pagto as Forma_Pagamento_Recebimento,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador_Pagto.Valor as Valor_Parcial,
       Projeto_Financiador_Pagto.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from Projeto_Financiador_Pagto
inner join Projeto_Financiador on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join fin_for_cli on (projeto_financiador.id_financiador = fin_for_cli.id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id = projeto_financiador_pagto.id_projeto_organizacao)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)

union all

select 4 AS ID_IDENTIFICACAO_TABELA,
       doacao.id,
       doacao.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       3 as Tipo_Origem_recurso, --Doacao
       Fundo.Id as Id_origem_recurso,
       Fundo.nome as Origem_recurso,
       1 as tipo_origem,--Fundo
       1 as Tipo,--Receita
       'Receita' as Descricao_tipo,
       'Doação de '||pessoa.nome as Descricao,
       cast(doacao.data as Date) as Data,
       cast(doacao.data as Date) as Data_Pagamento_Recebimento,
       doacao.forma_pagto as Forma_Pagamento_Recebimento,
       doacao.valor as Valor_Total,
       doacao.Valor as Valor_Parcial,
       doacao.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from doacao
inner join Fundo on (Fundo.id = doacao.id_fundo)
inner join Organizacao on (Organizacao.Id = Fundo.id_organizacao)
inner join pessoa on (pessoa.id = doacao.id_pessoa_doadora)
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
    DATA_PAGAMENTO_RECEBIMENTO,
    FORMA_PAGAMENTO_RECEBIMENTO,
    VALOR_TOTAL,
    VALOR_PARCIAL,
    VALOR_TOTAL_PAGO_RECEBIDO)
AS
--DESPESA DE PROJETO
select 0 AS ID_IDENTIFICACAO_TABELA,
       Conta_pagar_vinculo.id,
       Conta_Pagar.Id as Id_Movimentacao,
       Conta_Pagar_Vinculo.id_organizacao_origem as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipo_origem_recurso, --Projeto
       Projeto.Id as Id_origem_recurso,
       Projeto.Nome as Origem_Recurso,
       0 as tipo_origem,--Projeto
       0 as Tipo,
       'Despesa' as Descricao_tipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.vencimento) as Data,
       (select first 1 Conta_Pagar_Parcela.data_pagamento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Data_Pagamento) as Data_Pagamento_Recebimento,
       Conta_pagar.forma_pagto as Forma_Pagamento_Recebimento,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as VALOR_TOTAL_PAGO_RECEBIDO
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto.Id)
inner join Organizacao on (Conta_Pagar_Vinculo.id_organizacao_origem = Organizacao.Id)
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
       'Despesa' as Descricao_tipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.vencimento) as Data,
       (select first 1 Conta_Pagar_Parcela.data_pagamento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.Data_Pagamento) as Data_Pagamento_Recebimento,
       Conta_pagar.forma_pagto as Forma_Pagamento_Recebimento,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as VALOR_TOTAL_PAGO_RECEBIDO
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
       'Receita' as Descricao_tipo,
       Conta_Receber.Descricao,
       (select first 1 conta_receber_parcela.vencimento
        from conta_receber_parcela
        where conta_receber_parcela.id_conta_receber = conta_receber.Id
        order by conta_receber_parcela.vencimento) as Data,
       (select first 1 Conta_Receber_Parcela.data_recebimento
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.id_conta_receber = Conta_Receber.Id
        order by Conta_Receber_Parcela.data_recebimento) as Data_Pagamento_Recebimento,
       Conta_Receber.forma_pagto as Forma_Pagamento_Recebimento,
       Conta_Receber.Valor_Total,
       Conta_Receber_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Receber_Parcela.Valor)
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Status = 1 and
              Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id) as VALOR_TOTAL_PAGO_RECEBIDO
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
       'Receita' as Descricao_tipo,
       'Pagamento Financiador - '||fin_for_cli.nome_fantasia as Descricao,
       Projeto_Financiador_Pagto.data as Data,
       Projeto_Financiador_Pagto.data as Data_Pagamento_Recebimento,
       Projeto_Financiador_Pagto.forma_pagto as Forma_Pagamento_Recebimento,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador_Pagto.Valor as Valor_Parcial,
       Projeto_Financiador_Pagto.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from Projeto_Financiador_Pagto
inner join Projeto_Financiador on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join fin_for_cli on (projeto_financiador.id_financiador = fin_for_cli.id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id = projeto_financiador_pagto.id_projeto_organizacao)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)

union all

select 4 AS ID_IDENTIFICACAO_TABELA,
       doacao.id,
       doacao.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       3 as Tipo_Origem_recurso, --Doacao
       Fundo.Id as Id_origem_recurso,
       Fundo.nome as Origem_recurso,
       1 as tipo_origem,--Fundo
       1 as Tipo,--Receita
       'Receita' as Descricao_tipo,
       'Doação de '||pessoa.nome as Descricao,
       cast(doacao.data as Date) as Data,
       cast(doacao.data as Date) as Data_Pagamento_Recebimento,
       doacao.forma_pagto as Forma_Pagamento_Recebimento,
       doacao.valor as Valor_Total,
       doacao.Valor as Valor_Parcial,
       doacao.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from doacao
inner join Fundo on (Fundo.id = doacao.id_fundo)
inner join Organizacao on (Organizacao.Id = Fundo.id_organizacao)
inner join pessoa on (pessoa.id = doacao.id_pessoa_doadora)
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
    DATA_PAGAMENTO_RECEBIMENTO,
    FORMA_PAGAMENTO_RECEBIMENTO,
    VALOR_TOTAL,
    VALOR_PARCIAL,
    VALOR_TOTAL_PAGO_RECEBIDO)
AS
--DESPESA DE PROJETO
select 0 AS ID_IDENTIFICACAO_TABELA,
       Conta_pagar_vinculo.id,
       Conta_Pagar.Id as Id_Movimentacao,
       Conta_Pagar_Vinculo.id_organizacao_origem as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as Tipo_origem_recurso, --Projeto
       Projeto.Id as Id_origem_recurso,
       Projeto.Nome as Origem_Recurso,
       0 as tipo_origem,--Projeto
       0 as Tipo,
       'Despesa' as Descricao_tipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.vencimento) as Data,
       (select first 1 Conta_Pagar_Parcela.data_pagamento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id and
              Conta_Pagar_Parcela.data_pagamento is not null
        order by Conta_Pagar_Parcela.Data_Pagamento ) as Data_Pagamento_Recebimento,
       Conta_pagar.forma_pagto as Forma_Pagamento_Recebimento,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as VALOR_TOTAL_PAGO_RECEBIDO
from Conta_Pagar_Vinculo
inner join Conta_Pagar on (Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id)
inner join Projeto on (Conta_Pagar_Vinculo.Id_Projeto_Origem = Projeto.Id)
inner join Organizacao on (Conta_Pagar_Vinculo.id_organizacao_origem = Organizacao.Id)
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
       'Despesa' as Descricao_tipo,
       Conta_Pagar.Descricao,
       (select first 1 Conta_Pagar_Parcela.vencimento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id
        order by Conta_Pagar_Parcela.vencimento) as Data,
       (select first 1 Conta_Pagar_Parcela.data_pagamento
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id and
              Conta_Pagar_Parcela.data_pagamento is not null
        order by Conta_Pagar_Parcela.Data_Pagamento) as Data_Pagamento_Recebimento,
       Conta_pagar.forma_pagto as Forma_Pagamento_Recebimento,
       Conta_Pagar.Valor_Total,
       Conta_Pagar_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Pagar_Parcela.Valor)
        from Conta_Pagar_Parcela
        where Conta_Pagar_Parcela.Status = 1 and
              Conta_Pagar_Parcela.Id_Conta_Pagar = Conta_Pagar.Id) as VALOR_TOTAL_PAGO_RECEBIDO
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
       'Receita' as Descricao_tipo,
       Conta_Receber.Descricao,
       (select first 1 conta_receber_parcela.vencimento
        from conta_receber_parcela
        where conta_receber_parcela.id_conta_receber = conta_receber.Id
        order by conta_receber_parcela.vencimento) as Data,
       (select first 1 Conta_Receber_Parcela.data_recebimento
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.id_conta_receber = Conta_Receber.Id and
              Conta_Receber_Parcela.data_recebimento is not null
        order by Conta_Receber_Parcela.data_recebimento) as Data_Pagamento_Recebimento,
       Conta_Receber.forma_pagto as Forma_Pagamento_Recebimento,
       Conta_Receber.Valor_Total,
       Conta_Receber_Vinculo.Valor as Valor_Parcial,
       (select sum(Conta_Receber_Parcela.Valor)
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Status = 1 and
              Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id) as VALOR_TOTAL_PAGO_RECEBIDO
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
       'Receita' as Descricao_tipo,
       'Pagamento Financiador - '||fin_for_cli.nome_fantasia as Descricao,
       Projeto_Financiador_Pagto.data as Data,
       Projeto_Financiador_Pagto.data as Data_Pagamento_Recebimento,
       Projeto_Financiador_Pagto.forma_pagto as Forma_Pagamento_Recebimento,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador_Pagto.Valor as Valor_Parcial,
       Projeto_Financiador_Pagto.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from Projeto_Financiador_Pagto
inner join Projeto_Financiador on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join fin_for_cli on (projeto_financiador.id_financiador = fin_for_cli.id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id = projeto_financiador_pagto.id_projeto_organizacao)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)

union all

select 4 AS ID_IDENTIFICACAO_TABELA,
       doacao.id,
       doacao.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       3 as Tipo_Origem_recurso, --Doacao
       Fundo.Id as Id_origem_recurso,
       Fundo.nome as Origem_recurso,
       1 as tipo_origem,--Fundo
       1 as Tipo,--Receita
       'Receita' as Descricao_tipo,
       'Doação de '||pessoa.nome as Descricao,
       cast(doacao.data as Date) as Data,
       cast(doacao.data as Date) as Data_Pagamento_Recebimento,
       doacao.forma_pagto as Forma_Pagamento_Recebimento,
       doacao.valor as Valor_Total,
       doacao.Valor as Valor_Parcial,
       doacao.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from doacao
inner join Fundo on (Fundo.id = doacao.id_fundo)
inner join Organizacao on (Organizacao.Id = Fundo.id_organizacao)
inner join pessoa on (pessoa.id = doacao.id_pessoa_doadora)
;

