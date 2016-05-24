


ALTER TABLE PROJETO_FINANCIADOR_PAGTO
    ADD FORMA_PAGTO SMALLINT NOT NULL;

COMMENT ON COLUMN PROJETO_FINANCIADOR_PAGTO.FORMA_PAGTO IS
'Mesma coisa do conta_pagar e conta_receber';


update projeto_financiador_pagto set projeto_financiador_pagto.forma_pagto = 1;



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
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
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
       'Despesa' as Descricaotipo,
       Conta_Pagar.Descricao,
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
       'Receita' as Descricaotipo,
       Conta_Receber.Descricao,
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
       'Receita' as Descricaotipo,
       'Pagamento Financiador - '||fin_for_cli.nome_fantasia as Descricao,
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
       'Despesa' as Descricaotipo,
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
       'Despesa' as Descricaotipo,
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
       'Receita' as Descricaotipo,
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
       'Receita' as Descricaotipo,
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
;



ALTER TABLE PESSOA
    ADD CEP VARCHAR(60);



ALTER TABLE FIN_FOR_CLI
    ADD CEP VARCHAR(60);



update RDB$RELATION_FIELDS set
RDB$NULL_FLAG = NULL
where (RDB$FIELD_NAME = 'ID_CONTATO') and
(RDB$RELATION_NAME = 'FIN_FOR_CLI')
;



update RDB$RELATION_FIELDS set
RDB$NULL_FLAG = NULL
where (RDB$FIELD_NAME = 'EMAIL') and
(RDB$RELATION_NAME = 'PESSOA')
;



COMMENT ON TABLE FUNDO IS 'Chamado no sistem de Conta.
Contem dinheiro que veio de qualquer lugar que não seja projeto.';



ALTER TABLE FUNDO
    ADD REQUER_AUTORIZACAO SMALLINT;

COMMENT ON COLUMN FUNDO.REQUER_AUTORIZACAO IS
'0|null - Nao requer autorizacao para uso de seu saldo
1 - Requer uma autorizacao para utilizacao de seu saldo';

