

CREATE OR ALTER VIEW VIEW_MOVIMENTACAO_FINANCEIRA(
    ID_IDENTIFICACAO_TABELA,
    ID,
    ID_MOVIMENTACAO,
    ID_ORGANIZACAO,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM_RECURSO,
    ID_ORIGEM_RECURSO,
    ID_UNICO_ORIGEM_RECURSO,
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
       'Projeto_'||Projeto.Id as Id_Unico_Origem_Recurso,
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
       'Conta_'||Fundo.Id as Id_Unico_Origem_Recurso,
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
       'Conta_'||Fundo.Id as Id_Unico_Origem_Recurso,
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
       'Projeto_'||Projeto.Id as Id_Unico_Origem_Recurso,
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
       'Conta_'||Fundo.Id as Id_Unico_Origem_Recurso,
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


union all

select 5 AS ID_IDENTIFICACAO_TABELA,
       transferencia_financeira.id,
       transferencia_financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       4 as Tipo_Origem_recurso, --Transferencia
       Fundo.Id as Id_origem_recurso,
       'Conta_'||Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.nome as Origem_recurso,
       1 as tipo_origem,--Fundo
       1 as Tipo,--Receita
       'Receita' as Descricao_tipo,
       'Transferência de '||projeto.nome as Descricao,
       cast(transferencia_financeira.data as Date) as Data,
       cast(transferencia_financeira.data as Date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento,--Transf. Bancaria
       transferencia_financeira.valor as Valor_Total,
       transferencia_financeira.Valor as Valor_Parcial,
       transferencia_financeira.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from transferencia_financeira
inner join Fundo on (Fundo.id = transferencia_financeira.id_fundo_destino)
inner join Organizacao on (Organizacao.Id = Fundo.id_organizacao)
inner join projeto_rubrica on (transferencia_financeira.id_projeto_rubrica_origem = projeto_rubrica.id)
inner join projeto on (projeto.id= projeto_rubrica.id_projeto)

union all

select 5 AS ID_IDENTIFICACAO_TABELA,
       transferencia_financeira.id,
       transferencia_financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       4 as Tipo_Origem_recurso, --Transferencia
       Fundo.Id as Id_origem_recurso,
       'Conta_'||Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.nome as Origem_recurso,
       1 as tipo_origem,--Fundo
       1 as Tipo,--Receita
       'Receita' as Descricao_tipo,
       'Transferência de '||fundo_origem.nome as Descricao,
       cast(transferencia_financeira.data as Date) as Data,
       cast(transferencia_financeira.data as Date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento,--Transf. Bancaria
       transferencia_financeira.valor as Valor_Total,
       transferencia_financeira.Valor as Valor_Parcial,
       transferencia_financeira.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from transferencia_financeira
inner join Fundo on (Fundo.id = transferencia_financeira.id_fundo_destino)
inner join Fundo Fundo_Origem on (Fundo_Origem.id = transferencia_financeira.id_fundo_origem)
inner join Organizacao on (Organizacao.Id = Fundo.id_organizacao)
;



CREATE OR ALTER VIEW VIEW_MOVIMENTACAO_FINANCEIRA(
    ID_IDENTIFICACAO_TABELA,
    ID,
    ID_MOVIMENTACAO,
    ID_ORGANIZACAO,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM_RECURSO,
    ID_ORIGEM_RECURSO,
    ID_UNICO_ORIGEM_RECURSO,
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
       'Projeto_'||Projeto.Id as Id_Unico_Origem_Recurso,
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
       'Conta_'||Fundo.Id as Id_Unico_Origem_Recurso,
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
       'Conta_'||Fundo.Id as Id_Unico_Origem_Recurso,
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
       'Projeto_'||Projeto.Id as Id_Unico_Origem_Recurso,
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
       'Conta_'||Fundo.Id as Id_Unico_Origem_Recurso,
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

--Receita de transferencia
union all

select 5 AS ID_IDENTIFICACAO_TABELA,
       transferencia_financeira.id,
       transferencia_financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       4 as Tipo_Origem_recurso, --Transferencia
       Fundo.Id as Id_origem_recurso,
       'Conta_'||Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.nome as Origem_recurso,
       0 as tipo_origem,--Projeto
       1 as Tipo,--Receita
       'Receita' as Descricao_tipo,
       'Transferência de '||projeto.nome as Descricao,
       cast(transferencia_financeira.data as Date) as Data,
       cast(transferencia_financeira.data as Date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento,--Transf. Bancaria
       transferencia_financeira.valor as Valor_Total,
       transferencia_financeira.Valor as Valor_Parcial,
       transferencia_financeira.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from transferencia_financeira
inner join Fundo on (Fundo.id = transferencia_financeira.id_fundo_destino)
inner join Organizacao on (Organizacao.Id = Fundo.id_organizacao)
inner join projeto_rubrica on (transferencia_financeira.id_projeto_rubrica_origem = projeto_rubrica.id)
inner join projeto on (projeto.id= projeto_rubrica.id_projeto)

union all

select 5 AS ID_IDENTIFICACAO_TABELA,
       transferencia_financeira.id,
       transferencia_financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       4 as Tipo_Origem_recurso, --Transferencia
       Fundo.Id as Id_origem_recurso,
       'Conta_'||Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.nome as Origem_recurso,
       1 as tipo_origem,--Fundo
       1 as Tipo,--Receita
       'Receita' as Descricao_tipo,
       'Transferência de '||Fundo_origem.nome as Descricao,
       cast(transferencia_financeira.data as Date) as Data,
       cast(transferencia_financeira.data as Date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento,--Transf. Bancaria
       transferencia_financeira.valor as Valor_Total,
       transferencia_financeira.Valor as Valor_Parcial,
       transferencia_financeira.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from transferencia_financeira
inner join Fundo on (Fundo.id = transferencia_financeira.id_fundo_destino)
inner join Fundo Fundo_Origem on (Fundo_Origem.id = transferencia_financeira.id_fundo_origem)
inner join Organizacao on (Organizacao.Id = Fundo.id_organizacao)

union all

select 5 AS ID_IDENTIFICACAO_TABELA,
       transferencia_financeira.id,
       transferencia_financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       4 as Tipo_Origem_recurso, --Transferencia
       Projeto.Id as Id_origem_recurso,
       'Projeto_'||Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.nome as Origem_recurso,
       1 as tipo_origem,--Projeto
       1 as Tipo,--Receita
       'Receita' as Descricao_tipo,
       'Transferência de '||fundo.nome as Descricao,
       cast(transferencia_financeira.data as Date) as Data,
       cast(transferencia_financeira.data as Date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento,--Transf. Bancaria
       transferencia_financeira.valor as Valor_Total,
       transferencia_financeira.Valor as Valor_Parcial,
       transferencia_financeira.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from transferencia_financeira
inner join Fundo on (Fundo.id = transferencia_financeira.id_fundo_origem)
inner join projeto_rubrica on (transferencia_financeira.id_projeto_rubrica_destino= projeto_rubrica.id)
inner join projeto on (projeto.id = projeto_rubrica.id)
inner join Organizacao on (Organizacao.Id = Fundo.id_organizacao)
   
union all

select 5 AS ID_IDENTIFICACAO_TABELA,
       transferencia_financeira.id,
       transferencia_financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       4 as Tipo_Origem_recurso, --Transferencia
       Projeto.Id as Id_origem_recurso,
       'Projeto_'||projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.nome as Origem_recurso,
       1 as tipo_origem,--Projeto
       1 as Tipo,--Receita
       'Receita' as Descricao_tipo,
       'Transferência de '||projeto_origem.nome as Descricao,
       cast(transferencia_financeira.data as Date) as Data,
       cast(transferencia_financeira.data as Date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento,--Transf. Bancaria
       transferencia_financeira.valor as Valor_Total,
       transferencia_financeira.Valor as Valor_Parcial,
       transferencia_financeira.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from transferencia_financeira
inner join projeto_rubrica projeto_rubrica_origem on (transferencia_financeira.id_projeto_rubrica_destino= projeto_rubrica_origem.id)
inner join projeto projeto_origem on (projeto_origem.id = projeto_rubrica_origem.id)

inner join projeto_rubrica on (transferencia_financeira.id_projeto_rubrica_destino= projeto_rubrica.id)
inner join projeto on (projeto.id = projeto_rubrica.id)
inner join projeto_organizacao on (projeto_organizacao.id_projeto = projeto.id)
inner join Organizacao on (Organizacao.Id = projeto_organizacao.id_organizacao)
--Despesa de transferencia;



CREATE OR ALTER VIEW VIEW_MOVIMENTACAO_FINANCEIRA(
    ID_IDENTIFICACAO_TABELA,
    ID,
    ID_MOVIMENTACAO,
    ID_ORGANIZACAO,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM_RECURSO,
    ID_ORIGEM_RECURSO,
    ID_UNICO_ORIGEM_RECURSO,
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
       'Projeto_'||Projeto.Id as Id_Unico_Origem_Recurso,
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
       'Conta_'||Fundo.Id as Id_Unico_Origem_Recurso,
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
       'Conta_'||Fundo.Id as Id_Unico_Origem_Recurso,
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
       'Projeto_'||Projeto.Id as Id_Unico_Origem_Recurso,
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
       'Conta_'||Fundo.Id as Id_Unico_Origem_Recurso,
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

--Receita de transferencia
union all

select 5 AS ID_IDENTIFICACAO_TABELA,
       transferencia_financeira.id,
       transferencia_financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       4 as Tipo_Origem_recurso, --Transferencia
       Fundo.Id as Id_origem_recurso,
       'Conta_'||Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.nome as Origem_recurso,
       0 as tipo_origem,--Projeto
       1 as Tipo,--Receita
       'Receita' as Descricao_tipo,
       'Transferência de '||projeto.nome as Descricao,
       cast(transferencia_financeira.data as Date) as Data,
       cast(transferencia_financeira.data as Date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento,--Transf. Bancaria
       transferencia_financeira.valor as Valor_Total,
       transferencia_financeira.Valor as Valor_Parcial,
       transferencia_financeira.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from transferencia_financeira
inner join Fundo on (Fundo.id = transferencia_financeira.id_fundo_destino)
inner join Organizacao on (Organizacao.Id = Fundo.id_organizacao)
inner join projeto_rubrica on (transferencia_financeira.id_projeto_rubrica_origem = projeto_rubrica.id)
inner join projeto on (projeto.id= projeto_rubrica.id_projeto)

union all

select 5 AS ID_IDENTIFICACAO_TABELA,
       transferencia_financeira.id,
       transferencia_financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       4 as Tipo_Origem_recurso, --Transferencia
       Fundo.Id as Id_origem_recurso,
       'Conta_'||Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.nome as Origem_recurso,
       1 as tipo_origem,--Fundo
       1 as Tipo,--Receita
       'Receita' as Descricao_tipo,
       'Transferência de '||Fundo_origem.nome as Descricao,
       cast(transferencia_financeira.data as Date) as Data,
       cast(transferencia_financeira.data as Date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento,--Transf. Bancaria
       transferencia_financeira.valor as Valor_Total,
       transferencia_financeira.Valor as Valor_Parcial,
       transferencia_financeira.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from transferencia_financeira
inner join Fundo on (Fundo.id = transferencia_financeira.id_fundo_destino)
inner join Fundo Fundo_Origem on (Fundo_Origem.id = transferencia_financeira.id_fundo_origem)
inner join Organizacao on (Organizacao.Id = Fundo.id_organizacao)

union all

select 5 AS ID_IDENTIFICACAO_TABELA,
       transferencia_financeira.id,
       transferencia_financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       4 as Tipo_Origem_recurso, --Transferencia
       Projeto.Id as Id_origem_recurso,
       'Projeto_'||Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.nome as Origem_recurso,
       1 as tipo_origem,--Projeto
       1 as Tipo,--Receita
       'Receita' as Descricao_tipo,
       'Transferência de '||fundo.nome as Descricao,
       cast(transferencia_financeira.data as Date) as Data,
       cast(transferencia_financeira.data as Date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento,--Transf. Bancaria
       transferencia_financeira.valor as Valor_Total,
       transferencia_financeira.Valor as Valor_Parcial,
       transferencia_financeira.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from transferencia_financeira
inner join Fundo on (Fundo.id = transferencia_financeira.id_fundo_origem)
inner join projeto_rubrica on (transferencia_financeira.id_projeto_rubrica_destino= projeto_rubrica.id)
inner join projeto on (projeto.id = projeto_rubrica.id)
inner join Organizacao on (Organizacao.Id = Fundo.id_organizacao)
   
union all

select 5 AS ID_IDENTIFICACAO_TABELA,
       transferencia_financeira.id,
       transferencia_financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       4 as Tipo_Origem_recurso, --Transferencia
       Projeto.Id as Id_origem_recurso,
       'Projeto_'||projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.nome as Origem_recurso,
       1 as tipo_origem,--Projeto
       1 as Tipo,--Receita
       'Receita' as Descricao_tipo,
       'Transferência de '||projeto_origem.nome as Descricao,
       cast(transferencia_financeira.data as Date) as Data,
       cast(transferencia_financeira.data as Date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento,--Transf. Bancaria
       transferencia_financeira.valor as Valor_Total,
       transferencia_financeira.Valor as Valor_Parcial,
       transferencia_financeira.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from transferencia_financeira
inner join projeto_rubrica projeto_rubrica_origem on (transferencia_financeira.id_projeto_rubrica_origem= projeto_rubrica_origem.id)
inner join projeto projeto_origem on (projeto_origem.id = projeto_rubrica_origem.id)

inner join projeto_rubrica on (transferencia_financeira.id_projeto_rubrica_destino= projeto_rubrica.id)
inner join projeto on (projeto.id = projeto_rubrica.id)
inner join projeto_organizacao on (projeto_organizacao.id_projeto = projeto.id)
inner join Organizacao on (Organizacao.Id = projeto_organizacao.id_organizacao)
--Despesa de transferencia
union all

select 5 AS ID_IDENTIFICACAO_TABELA,
       transferencia_financeira.id,
       transferencia_financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       4 as Tipo_Origem_recurso, --Transferencia
       Projeto.Id as Id_origem_recurso,
       'Projeto_'||Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.nome as Origem_recurso,
       0 as tipo_origem,--Projeto
       0 as Tipo,--Despesa
       'Despesa' as Descricao_tipo,
       'Transferência para '||Fundo.nome as Descricao,
       cast(transferencia_financeira.data as Date) as Data,
       cast(transferencia_financeira.data as Date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento,--Transf. Bancaria
       transferencia_financeira.valor as Valor_Total,
       transferencia_financeira.Valor as Valor_Parcial,
       transferencia_financeira.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from transferencia_financeira
inner join Fundo on (Fundo.id = transferencia_financeira.id_fundo_destino)
inner join Organizacao on (Organizacao.Id = Fundo.id_organizacao)
inner join projeto_rubrica on (transferencia_financeira.id_projeto_rubrica_origem = projeto_rubrica.id)
inner join projeto on (projeto.id= projeto_rubrica.id_projeto)

union all

select 5 AS ID_IDENTIFICACAO_TABELA,
       transferencia_financeira.id,
       transferencia_financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       4 as Tipo_Origem_recurso, --Transferencia
       Projeto.Id as Id_origem_recurso,
       'Projeto_'||Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.nome as Origem_recurso,
       0 as tipo_origem,--Projeto
       0 as Tipo,--Despesa
       'Despesa' as Descricao_tipo,
       'Transferência para '||Projeto_Destino.nome as Descricao,
       cast(transferencia_financeira.data as Date) as Data,
       cast(transferencia_financeira.data as Date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento,--Transf. Bancaria
       transferencia_financeira.valor as Valor_Total,
       transferencia_financeira.Valor as Valor_Parcial,
       transferencia_financeira.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from transferencia_financeira
inner join projeto_rubrica projeto_rubrica_origem on (transferencia_financeira.id_projeto_rubrica_origem= projeto_rubrica_origem.id)
inner join projeto on (projeto.id = projeto_rubrica_origem.id)

inner join projeto_rubrica on (transferencia_financeira.id_projeto_rubrica_destino= projeto_rubrica.id)
inner join projeto projeto_destino on (projeto.id = projeto_rubrica.id)
inner join projeto_organizacao on (projeto_organizacao.id_projeto = projeto.id)
inner join Organizacao on (Organizacao.Id = projeto_organizacao.id_organizacao)

union all

select 5 AS ID_IDENTIFICACAO_TABELA,
       transferencia_financeira.id,
       transferencia_financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       4 as Tipo_Origem_recurso, --Transferencia
       Fundo.Id as Id_origem_recurso,
       'Conta_'||Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.nome as Origem_recurso,
       0 as tipo_origem,--Fundo
       0 as Tipo,--Despesa
       'Despesa' as Descricao_tipo,
       'Transferência para '||projeto.nome as Descricao,
       cast(transferencia_financeira.data as Date) as Data,
       cast(transferencia_financeira.data as Date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento,--Transf. Bancaria
       transferencia_financeira.valor as Valor_Total,
       transferencia_financeira.Valor as Valor_Parcial,
       transferencia_financeira.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from transferencia_financeira
inner join Fundo on (Fundo.id = transferencia_financeira.id_fundo_origem)
inner join projeto_rubrica on (transferencia_financeira.id_projeto_rubrica_destino= projeto_rubrica.id)
inner join projeto on (projeto.id = projeto_rubrica.id)
inner join Organizacao on (Organizacao.Id = Fundo.id_organizacao)
   
union all

select 5 AS ID_IDENTIFICACAO_TABELA,
       transferencia_financeira.id,
       transferencia_financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       4 as Tipo_Origem_recurso, --Transferencia
       Fundo.Id as Id_origem_recurso,
       'Conta_'||Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.nome as Origem_recurso,
       0 as tipo_origem,--Fundo
       0 as Tipo,--Despesa
       'Despesa' as Descricao_tipo,
       'Transferência para '||fundo_destino.nome as Descricao,
       cast(transferencia_financeira.data as Date) as Data,
       cast(transferencia_financeira.data as Date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento,--Transf. Bancaria
       transferencia_financeira.valor as Valor_Total,
       transferencia_financeira.Valor as Valor_Parcial,
       transferencia_financeira.Valor as VALOR_TOTAL_PAGO_RECEBIDO
from transferencia_financeira
inner join Fundo Fundo_Destino on (Fundo_Destino.id = transferencia_financeira.id_fundo_destino)
inner join Fundo on (Fundo.id = transferencia_financeira.id_fundo_origem)
inner join Organizacao on (Organizacao.Id = Fundo.id_organizacao);



create or alter view View_Conta_Pagar (
    Id,
    Id_Vinculo,
    Id_Organizacao_Origem,
    Nome_Organizacao,
    Id_Origem_Recurso,
    Id_Unico_Origem_Recurso,
    Origem_Recurso,
    Data,
    Data_Pagamento,
    Forma_Pagamento,
    Descricao,
    Valor,
    Valor_Pago)
as
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
       coalesce(Conta_Pagar_Vinculo.Id_Fundo, Conta_Pagar_Vinculo.Id_Projeto_Origem) as Id_Origem_Recurso,
       coalesce('Conta_' || Conta_Pagar_Vinculo.Id_Fundo, 'Projeto_' || Conta_Pagar_Vinculo.Id_Projeto_Origem) as Id_Unico_Origem_Recurso,
       coalesce(Fundo.Nome, Projeto.Nome) as Origem_Recurso,
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
                when Conta_Pagar_Vinculo.Id = (select first 1 Conta_Pagar_Vinculo.Id
                                               from Conta_Pagar_Vinculo
                                               where Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id
                                               order by Conta_Pagar_Vinculo.Id desc) then Conta_Pagar_Parcela.Valor - (select sum(
                                                                                                                              case
                                                                                                                                when Parcelas.Qtde_Parcelas = Cpp.Parcela then Cpv.Valor - (trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                                                                                else trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                                                                              end)
                                                                                                                       from Conta_Pagar_Parcela Cpp
                                                                                                                       inner join Conta_Pagar Cp on (Cp.Id = Cpp.Id_Conta_Pagar)
                                                                                                                       inner join Conta_Pagar_Vinculo Cpv on (Cpp.Id_Conta_Pagar = Cp.Id)
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
                                                           when Conta_Pagar_Vinculo.Id = (select first 1 Conta_Pagar_Vinculo.Id
                                                                                          from Conta_Pagar_Vinculo
                                                                                          where Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id
                                                                                          order by Conta_Pagar_Vinculo.Id desc) then Conta_Pagar_Parcela.Valor - (select sum(
                                                                                                                                                                         case
                                                                                                                                                                           when Parcelas.Qtde_Parcelas = Cpp.Parcela then Cpv.Valor - (trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                                                                                                                           else trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                                                                                                                         end)
                                                                                                                                                                  from Conta_Pagar_Parcela Cpp
                                                                                                                                                                  inner join Conta_Pagar Cp on (Cp.Id = Cpp.Id_Conta_Pagar)
                                                                                                                                                                  inner join Conta_Pagar_Vinculo Cpv on (Cpp.Id_Conta_Pagar = Cp.Id)
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
inner join Organizacao on (Conta_Pagar_Vinculo.Id_Organizacao_Origem = Organizacao.Id);



create or alter view View_Movimentacao_Financeira (
    Id_Movimentacao,
    Id_Organizacao,
    Nome_Organizacao,
    Id_Origem_Recurso,
    Id_Unico_Origem_Recurso,
    Origem_Recurso,
    Tipo,
    Descricao_Tipo,
    Descricao_Movimentacao,
    Data,
    Data_Pagamento_Recebimento,
    Forma_Pagamento_Recebimento,
    Valor_Total,
    Valor_Total_Pago_Recebido)
as

--DESPESAS DE PROJETO E CONTAS
select View_Conta_Pagar.Id_Vinculo as Id_Movimentacao,
       View_Conta_Pagar.Id_Organizacao_Origem as Id_Organizacao,
       View_Conta_Pagar.Nome_Organizacao,
       View_Conta_Pagar.Id_Origem_Recurso,
       View_Conta_Pagar.Id_Unico_Origem_Recurso,
       View_Conta_Pagar.Origem_Recurso,
       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       View_Conta_Pagar.Descricao,
       View_Conta_Pagar.Data,
       View_Conta_Pagar.Data_Pagamento,
       View_Conta_Pagar.Forma_Pagamento,
       View_Conta_Pagar.Valor,
       View_Conta_Pagar.Valor_Pago
from View_Conta_Pagar

union all
--RECEITA VINDA DE CONTAS A RECEBER

select Conta_Receber_Vinculo.Id,
       Fundo.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,
       1 as Tipo,
       'Receitas' as Descricao_Tipo,
       Conta_Receber.Descricao,
       (select first 1 Conta_Receber_Parcela.Vencimento
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id
        order by Conta_Receber_Parcela.Vencimento) as Data,
       (select first 1 Conta_Receber_Parcela.Data_Recebimento
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id and
              Conta_Receber_Parcela.Data_Recebimento is not null
        order by Conta_Receber_Parcela.Data_Recebimento) as Data_Pagamento_Recebimento,
       Conta_Receber.Forma_Pagto as Forma_Pagamento_Recebimento,
       Conta_Receber.Valor_Total,
       (select sum(Conta_Receber_Parcela.Valor)
        from Conta_Receber_Parcela
        where Conta_Receber_Parcela.Status = 1 and
              Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id) as Valor_Total_Pago_Recebido
from Conta_Receber_Vinculo
inner join Conta_Receber on (Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id)
inner join Fundo on (Fundo.Id = Conta_Receber_Vinculo.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,
       1 as Tipo,
       'Receitas' as Descricao_Tipo,
       'Pagamento Financiador - ' || Fin_For_Cli.Nome_Fantasia as Descricao,
       Projeto_Financiador_Pagto.Data as Data,
       Projeto_Financiador_Pagto.Data as Data_Pagamento_Recebimento,
       Projeto_Financiador_Pagto.Forma_Pagto as Forma_Pagamento_Recebimento,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador_Pagto.Valor as Valor_Total_Pago_Recebido
from Projeto_Financiador_Pagto
inner join Projeto_Financiador on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join Fin_For_Cli on (Projeto_Financiador.Id_Financiador = Fin_For_Cli.Id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id = Projeto_Financiador_Pagto.Id_Projeto_Organizacao)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)

union all

select Doacao.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,

       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Doação de ' || Pessoa.Nome as Descricao,
       cast(Doacao.Data as date) as Data,
       cast(Doacao.Data as date) as Data_Pagamento_Recebimento,
       Doacao.Forma_Pagto as Forma_Pagamento_Recebimento,
       Doacao.Valor as Valor_Total,
       Doacao.Valor as Valor_Total_Pago_Recebido
from Doacao
inner join Fundo on (Fundo.Id = Doacao.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
inner join Pessoa on (Pessoa.Id = Doacao.Id_Pessoa_Doadora)

--Receita de transferencia
union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Projeto.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)

union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,

       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,

       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Fundo_Origem.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Fundo Fundo_Origem on (Fundo_Origem.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,

       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Fundo.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,

       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,

       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Projeto_Origem.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Projeto_Rubrica Projeto_Rubrica_Origem on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica_Origem.Id)
inner join Projeto Projeto_Origem on (Projeto_Origem.Id = Projeto_Rubrica_Origem.Id)

inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
--Despesa de transferencia
union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,

       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Fundo.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)

union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,

       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Projeto_Destino.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Projeto_Rubrica Projeto_Rubrica_Origem on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica_Origem.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica_Origem.Id)

inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto Projeto_Destino on (Projeto.Id = Projeto_Rubrica.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)

union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,

       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Projeto.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,

       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Fundo_Destino.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo Fundo_Destino on (Fundo_Destino.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao);



create or alter view View_Conta_Receber (
    Id,
    Id_Vinculo,
    Id_Organizacao_Origem,
    Nome_Organizacao,
    Id_Origem_Recurso,
    Id_Unico_Origem_Recurso,
    Origem_Recurso,
    Data,
    Data_Recebimento,
    Forma_Recebimento,
    Descricao,
    Valor,
    Valor_Recebido)
as
with Parcelas
as (select (sum(case
                  when Conta_Receber_Parcela.Status = 1 then Conta_Receber_Parcela.Valor
                end) / Conta_Receber.Valor_Total) as Percentual_Pago,
                                                  sum(
                                                  case
                                                    when Conta_Receber_Parcela.Status = 1 then Conta_Receber_Parcela.Valor
                                                  end) as Valor_Pago,
                                                  count(*) as Qtde_Parcelas,
                                                  count(
                                                  case
                                                    when Conta_Receber_Parcela.Status = 1 then 1
                                                  end) as Qtde_Parcela_Paga,
                                                  count(
                                                  case
                                                    when Conta_Receber_Parcela.Status = 0 then 1
                                                  end) as Qtde_Parcela_Aberto,
                                                  Conta_Receber_Parcela.Id_Conta_Receber
    from Conta_Receber_Parcela
    inner join Conta_Receber on (Conta_Receber.Id = Conta_Receber_Parcela.Id_Conta_Receber)
    group by Conta_Receber_Parcela.Id_Conta_Receber, Conta_Receber.Valor_Total

)

select Conta_Receber.Id,
       Conta_Receber_Vinculo.Id as Id_Vinculo,
       Fundo.id_organizacao as ID_ORGANIZACAO_ORIGEM,
       Organizacao.Nome as Nome_Organizacao,
       Conta_Receber_Vinculo.Id_Fundo as Id_Origem_Recurso,
       'Conta_' || Conta_Receber_Vinculo.Id_Fundo as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,
       Conta_Receber_Parcela.Vencimento as Data,
       Conta_Receber_Parcela.data_recebimento,
       Conta_Receber.Forma_Pagto as Forma_Recebimento,
       case
         when Parcelas.Qtde_Parcelas = 1 then Conta_Receber.Descricao
         else Conta_Receber.Descricao || ' (' || Conta_Receber_Parcela.Parcela || '/' || Parcelas.Qtde_Parcelas || ')'
       end as Descricao,
--Valor
       case
         when Parcelas.Qtde_Parcelas = 1 then Conta_Receber_Vinculo.Valor
         else case
                when Conta_Receber_Vinculo.Id = (select first 1 Conta_Receber_Vinculo.Id
                                                 from Conta_Receber_Vinculo
                                                 where Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id
                                                 order by Conta_Receber_Vinculo.Id desc) then Conta_Receber_Parcela.Valor - (select sum(
                                                                                                                                    case
                                                                                                                                      when Parcelas.Qtde_Parcelas = CRP.Parcela then Crv.Valor - (trunc(Crv.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                                                                                      else trunc(Crv.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                                                                                    end)
                                                                                                                             from Conta_Receber_Parcela CRP
                                                                                                                             inner join Conta_Receber Cp on (Cp.Id = CRP.Id_Conta_Receber)
                                                                                                                             inner join Conta_Receber_Vinculo Crv on (CRP.Id_Conta_Receber = Cp.Id)
                                                                                                                             where CRP.Id_Conta_Receber = Conta_Receber.Id and
                                                                                                                                   CRP.Parcela = Conta_Receber_Parcela.Parcela and
                                                                                                                                   Crv.Id <> Conta_Receber_Vinculo.Id)
                else case
                       when Parcelas.Qtde_Parcelas = Conta_Receber_Parcela.Parcela then Conta_Receber_Vinculo.Valor - (trunc(Conta_Receber_Vinculo.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                       else trunc(Conta_Receber_Vinculo.Valor / Parcelas.Qtde_Parcelas, 2)
                     end
              end
       end as Valor,
--Valor Recebido
       case
         when Conta_Receber_Parcela.Status = 1 then case
                                                      when Parcelas.Qtde_Parcelas = 1 then Conta_Receber_Vinculo.Valor
                                                      else case
                                                             when Conta_Receber_Vinculo.Id = (select first 1 Conta_Receber_Vinculo.Id
                                                                                              from Conta_Receber_Vinculo
                                                                                              where Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id
                                                                                              order by Conta_Receber_Vinculo.Id desc) then Conta_Receber_Parcela.Valor - (select sum(
                                                                                                                                                                                 case
                                                                                                                                                                                   when Parcelas.Qtde_Parcelas = CRP.Parcela then Crv.Valor - (trunc(Crv.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                                                                                                                                   else trunc(Crv.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                                                                                                                                 end)
                                                                                                                                                                          from Conta_Receber_Parcela CRP
                                                                                                                                                                          inner join Conta_Receber Cp on (Cp.Id = CRP.Id_Conta_Receber)
                                                                                                                                                                          inner join Conta_Receber_Vinculo Crv on (CRP.Id_Conta_Receber = Cp.Id)
                                                                                                                                                                          where CRP.Id_Conta_Receber = Conta_Receber.Id and
                                                                                                                                                                                CRP.Parcela = Conta_Receber_Parcela.Parcela and
                                                                                                                                                                                Crv.Id <> Conta_Receber_Vinculo.Id)
                                                             else case
                                                                    when Parcelas.Qtde_Parcelas = Conta_Receber_Parcela.Parcela then Conta_Receber_Vinculo.Valor - (trunc(Conta_Receber_Vinculo.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                    else trunc(Conta_Receber_Vinculo.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                  end
                                                           end
                                                    end
         else 0
       end as Valor_Recebido

from Conta_Receber_Parcela
inner join Conta_Receber on (Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id)
inner join Conta_Receber_Vinculo on (Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id)
inner join Parcelas on (Conta_Receber.Id = Parcelas.Id_Conta_Receber)
inner join Fundo on (Conta_Receber_Vinculo.Id_Fundo = Fundo.Id)
inner join Organizacao on (Fundo.id_organizacao = Organizacao.Id);



CREATE OR ALTER VIEW VIEW_MOVIMENTACAO_FINANCEIRA(
    ID_MOVIMENTACAO,
    ID_ORGANIZACAO,
    NOME_ORGANIZACAO,
    ID_ORIGEM_RECURSO,
    ID_UNICO_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
    TIPO,
    DESCRICAO_TIPO,
    DESCRICAO_MOVIMENTACAO,
    DATA,
    DATA_PAGAMENTO_RECEBIMENTO,
    FORMA_PAGAMENTO_RECEBIMENTO,
    VALOR_TOTAL,
    VALOR_TOTAL_PAGO_RECEBIDO)
AS
--DESPESAS DE PROJETO E CONTAS
select View_Conta_Pagar.Id_Vinculo as Id_Movimentacao,
       View_Conta_Pagar.Id_Organizacao_Origem as Id_Organizacao,
       View_Conta_Pagar.Nome_Organizacao,
       View_Conta_Pagar.Id_Origem_Recurso,
       View_Conta_Pagar.Id_Unico_Origem_Recurso,
       View_Conta_Pagar.Origem_Recurso,
       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       View_Conta_Pagar.Descricao,
       View_Conta_Pagar.Data,
       View_Conta_Pagar.Data_Pagamento,
       View_Conta_Pagar.Forma_Pagamento,
       View_Conta_Pagar.Valor,
       View_Conta_Pagar.Valor_Pago
from View_Conta_Pagar

union all
--RECEITA VINDA DE CONTAS A RECEBER

select View_Conta_Receber.Id_Vinculo as Id_Movimentacao,
       View_Conta_Receber.Id_Organizacao_Origem as Id_Organizacao,
       View_Conta_Receber.Nome_Organizacao,
       View_Conta_Receber.Id_Origem_Recurso,
       View_Conta_Receber.Id_Unico_Origem_Recurso,
       View_Conta_Receber.Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       View_Conta_Receber.Descricao,
       View_Conta_Receber.Data,
       View_Conta_Receber.data_recebimento,
       View_Conta_Receber.forma_recebimento,
       View_Conta_Receber.Valor,
       View_Conta_Receber.valor_recebido
from View_Conta_Receber

union all

select Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,
       1 as Tipo,
       'Receitas' as Descricao_Tipo,
       'Pagamento Financiador - ' || Fin_For_Cli.Nome_Fantasia as Descricao,
       Projeto_Financiador_Pagto.Data as Data,
       Projeto_Financiador_Pagto.Data as Data_Pagamento_Recebimento,
       Projeto_Financiador_Pagto.Forma_Pagto as Forma_Pagamento_Recebimento,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador_Pagto.Valor as Valor_Total_Pago_Recebido
from Projeto_Financiador_Pagto
inner join Projeto_Financiador on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join Fin_For_Cli on (Projeto_Financiador.Id_Financiador = Fin_For_Cli.Id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id = Projeto_Financiador_Pagto.Id_Projeto_Organizacao)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)

union all

select Doacao.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,

       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Doação de ' || Pessoa.Nome as Descricao,
       cast(Doacao.Data as date) as Data,
       cast(Doacao.Data as date) as Data_Pagamento_Recebimento,
       Doacao.Forma_Pagto as Forma_Pagamento_Recebimento,
       Doacao.Valor as Valor_Total,
       Doacao.Valor as Valor_Total_Pago_Recebido
from Doacao
inner join Fundo on (Fundo.Id = Doacao.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
inner join Pessoa on (Pessoa.Id = Doacao.Id_Pessoa_Doadora)

--TRANSFERENCIAS
union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Projeto.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)

union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,

       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,

       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Fundo_Origem.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Fundo Fundo_Origem on (Fundo_Origem.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,

       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Fundo.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,

       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,

       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Projeto_Origem.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Projeto_Rubrica Projeto_Rubrica_Origem on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica_Origem.Id)
inner join Projeto Projeto_Origem on (Projeto_Origem.Id = Projeto_Rubrica_Origem.Id)

inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
--Despesa de transferencia
union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,

       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Fundo.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)

union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,

       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Projeto_Destino.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Projeto_Rubrica Projeto_Rubrica_Origem on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica_Origem.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica_Origem.Id)

inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto Projeto_Destino on (Projeto.Id = Projeto_Rubrica.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)

union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,

       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Projeto.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,

       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Fundo_Destino.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo Fundo_Destino on (Fundo_Destino.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
;



CREATE OR ALTER VIEW VIEW_CONTA_PAGAR(
    ID,
    ID_VINCULO,
    ID_ORGANIZACAO_ORIGEM,
    NOME_ORGANIZACAO,
    ID_ORIGEM_RECURSO,
    ID_UNICO_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
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
       coalesce(Conta_Pagar_Vinculo.Id_Fundo, Conta_Pagar_Vinculo.Id_Projeto_Origem) as Id_Origem_Recurso,
       coalesce('Conta_' || Conta_Pagar_Vinculo.Id_Fundo, 'Projeto_' || Conta_Pagar_Vinculo.Id_Projeto_Origem) as Id_Unico_Origem_Recurso,
       coalesce(Fundo.Nome, Projeto.Nome) as Origem_Recurso,
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
                when Conta_Pagar_Vinculo.Id = (select first 1 Conta_Pagar_Vinculo.Id
                                               from Conta_Pagar_Vinculo
                                               where Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id
                                               order by Conta_Pagar_Vinculo.Id desc) then Conta_Pagar_Parcela.Valor - (select sum(
                                                                                                                              case
                                                                                                                                when Parcelas.Qtde_Parcelas = Cpp.Parcela then Cpv.Valor - (trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                                                                                else trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                                                                              end)
                                                                                                                       from Conta_Pagar_Parcela Cpp
                                                                                                                       inner join Conta_Pagar Cp on (Cp.Id = Cpp.Id_Conta_Pagar)
                                                                                                                       inner join Conta_Pagar_Vinculo Cpv on (Cpv.id_conta_pagar = Cp.Id)
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
                                                           when Conta_Pagar_Vinculo.Id = (select first 1 Conta_Pagar_Vinculo.Id
                                                                                          from Conta_Pagar_Vinculo
                                                                                          where Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id
                                                                                          order by Conta_Pagar_Vinculo.Id desc) then Conta_Pagar_Parcela.Valor - (select sum(
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



create or alter view View_Conta_Receber (
    Id,
    Id_Vinculo,
    Id_Organizacao_Origem,
    Nome_Organizacao,
    Id_Origem_Recurso,
    Id_Unico_Origem_Recurso,
    Origem_Recurso,
    Data,
    Data_Recebimento,
    Forma_Recebimento,
    Descricao,
    Valor,
    Valor_Recebido)
as
with Parcelas
as (select (sum(case
                  when Conta_Receber_Parcela.Status = 1 then Conta_Receber_Parcela.Valor
                end) / Conta_Receber.Valor_Total) as Percentual_Pago,
                                                  sum(
                                                  case
                                                    when Conta_Receber_Parcela.Status = 1 then Conta_Receber_Parcela.Valor
                                                  end) as Valor_Pago,
                                                  count(*) as Qtde_Parcelas,
                                                  count(
                                                  case
                                                    when Conta_Receber_Parcela.Status = 1 then 1
                                                  end) as Qtde_Parcela_Paga,
                                                  count(
                                                  case
                                                    when Conta_Receber_Parcela.Status = 0 then 1
                                                  end) as Qtde_Parcela_Aberto,
                                                  Conta_Receber_Parcela.Id_Conta_Receber
    from Conta_Receber_Parcela
    inner join Conta_Receber on (Conta_Receber.Id = Conta_Receber_Parcela.Id_Conta_Receber)
    group by Conta_Receber_Parcela.Id_Conta_Receber, Conta_Receber.Valor_Total

)

select Conta_Receber.Id,
       Conta_Receber_Vinculo.Id as Id_Vinculo,
       Fundo.id_organizacao as ID_ORGANIZACAO_ORIGEM,
       Organizacao.Nome as Nome_Organizacao,
       Conta_Receber_Vinculo.Id_Fundo as Id_Origem_Recurso,
       'Conta_' || Conta_Receber_Vinculo.Id_Fundo as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,
       Conta_Receber_Parcela.Vencimento as Data,
       Conta_Receber_Parcela.data_recebimento,
       Conta_Receber.Forma_Pagto as Forma_Recebimento,
       case
         when Parcelas.Qtde_Parcelas = 1 then Conta_Receber.Descricao
         else Conta_Receber.Descricao || ' (' || Conta_Receber_Parcela.Parcela || '/' || Parcelas.Qtde_Parcelas || ')'
       end as Descricao,
--Valor
       case
         when Parcelas.Qtde_Parcelas = 1 then Conta_Receber_Vinculo.Valor
         else case
                when Conta_Receber_Vinculo.Id = (select first 1 Conta_Receber_Vinculo.Id
                                                 from Conta_Receber_Vinculo
                                                 where Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id
                                                 order by Conta_Receber_Vinculo.Id desc) then Conta_Receber_Parcela.Valor - (select sum(
                                                                                                                                    case
                                                                                                                                      when Parcelas.Qtde_Parcelas = CRP.Parcela then Crv.Valor - (trunc(Crv.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                                                                                      else trunc(Crv.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                                                                                    end)
                                                                                                                             from Conta_Receber_Parcela CRP
                                                                                                                             inner join Conta_Receber Cp on (Cp.Id = CRP.Id_Conta_Receber)
                                                                                                                             inner join Conta_Receber_Vinculo Crv on (CRV.Id_Conta_Receber = Cp.Id)
                                                                                                                             where CRP.Id_Conta_Receber = Conta_Receber.Id and
                                                                                                                                   CRP.Parcela = Conta_Receber_Parcela.Parcela and
                                                                                                                                   Crv.Id <> Conta_Receber_Vinculo.Id)
                else case
                       when Parcelas.Qtde_Parcelas = Conta_Receber_Parcela.Parcela then Conta_Receber_Vinculo.Valor - (trunc(Conta_Receber_Vinculo.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                       else trunc(Conta_Receber_Vinculo.Valor / Parcelas.Qtde_Parcelas, 2)
                     end
              end
       end as Valor,
--Valor Recebido
       case
         when Conta_Receber_Parcela.Status = 1 then case
                                                      when Parcelas.Qtde_Parcelas = 1 then Conta_Receber_Vinculo.Valor
                                                      else case
                                                             when Conta_Receber_Vinculo.Id = (select first 1 Conta_Receber_Vinculo.Id
                                                                                              from Conta_Receber_Vinculo
                                                                                              where Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id
                                                                                              order by Conta_Receber_Vinculo.Id desc) then Conta_Receber_Parcela.Valor - (select sum(
                                                                                                                                                                                 case
                                                                                                                                                                                   when Parcelas.Qtde_Parcelas = CRP.Parcela then Crv.Valor - (trunc(Crv.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                                                                                                                                   else trunc(Crv.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                                                                                                                                 end)
                                                                                                                                                                          from Conta_Receber_Parcela CRP
                                                                                                                                                                          inner join Conta_Receber Cp on (Cp.Id = CRP.Id_Conta_Receber)
                                                                                                                                                                          inner join Conta_Receber_Vinculo Crv on (CRV.Id_Conta_Receber = Cp.Id)
                                                                                                                                                                          where CRP.Id_Conta_Receber = Conta_Receber.Id and
                                                                                                                                                                                CRP.Parcela = Conta_Receber_Parcela.Parcela and
                                                                                                                                                                                Crv.Id <> Conta_Receber_Vinculo.Id)
                                                             else case
                                                                    when Parcelas.Qtde_Parcelas = Conta_Receber_Parcela.Parcela then Conta_Receber_Vinculo.Valor - (trunc(Conta_Receber_Vinculo.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                    else trunc(Conta_Receber_Vinculo.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                  end
                                                           end
                                                    end
         else 0
       end as Valor_Recebido

from Conta_Receber_Parcela
inner join Conta_Receber on (Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id)
inner join Conta_Receber_Vinculo on (Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id)
inner join Parcelas on (Conta_Receber.Id = Parcelas.Id_Conta_Receber)
inner join Fundo on (Conta_Receber_Vinculo.Id_Fundo = Fundo.Id)
inner join Organizacao on (Fundo.id_organizacao = Organizacao.Id);



CREATE OR ALTER VIEW VIEW_CONTA_PAGAR(
    ID,
    ID_VINCULO,
    ID_ORGANIZACAO_ORIGEM,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM,
    ID_ORIGEM_RECURSO,
    ID_UNICO_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
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
                when Conta_Pagar_Vinculo.Id = (select first 1 Conta_Pagar_Vinculo.Id
                                               from Conta_Pagar_Vinculo
                                               where Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id
                                               order by Conta_Pagar_Vinculo.Id desc) then Conta_Pagar_Parcela.Valor - (select sum(
                                                                                                                              case
                                                                                                                                when Parcelas.Qtde_Parcelas = Cpp.Parcela then Cpv.Valor - (trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                                                                                else trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                                                                              end)
                                                                                                                       from Conta_Pagar_Parcela Cpp
                                                                                                                       inner join Conta_Pagar Cp on (Cp.Id = Cpp.Id_Conta_Pagar)
                                                                                                                       inner join Conta_Pagar_Vinculo Cpv on (Cpv.id_conta_pagar = Cp.Id)
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
                                                           when Conta_Pagar_Vinculo.Id = (select first 1 Conta_Pagar_Vinculo.Id
                                                                                          from Conta_Pagar_Vinculo
                                                                                          where Conta_Pagar_Vinculo.Id_Conta_Pagar = Conta_Pagar.Id
                                                                                          order by Conta_Pagar_Vinculo.Id desc) then Conta_Pagar_Parcela.Valor - (select sum(
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



CREATE OR ALTER VIEW VIEW_CONTA_RECEBER(
    ID,
    ID_VINCULO,
    ID_ORGANIZACAO_ORIGEM,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM,
    ID_ORIGEM_RECURSO,
    ID_UNICO_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
    DATA,
    DATA_RECEBIMENTO,
    FORMA_RECEBIMENTO,
    DESCRICAO,
    VALOR,
    VALOR_RECEBIDO)
AS
with Parcelas
as (select (sum(case
                  when Conta_Receber_Parcela.Status = 1 then Conta_Receber_Parcela.Valor
                end) / Conta_Receber.Valor_Total) as Percentual_Pago,
                                                  sum(
                                                  case
                                                    when Conta_Receber_Parcela.Status = 1 then Conta_Receber_Parcela.Valor
                                                  end) as Valor_Pago,
                                                  count(*) as Qtde_Parcelas,
                                                  count(
                                                  case
                                                    when Conta_Receber_Parcela.Status = 1 then 1
                                                  end) as Qtde_Parcela_Paga,
                                                  count(
                                                  case
                                                    when Conta_Receber_Parcela.Status = 0 then 1
                                                  end) as Qtde_Parcela_Aberto,
                                                  Conta_Receber_Parcela.Id_Conta_Receber
    from Conta_Receber_Parcela
    inner join Conta_Receber on (Conta_Receber.Id = Conta_Receber_Parcela.Id_Conta_Receber)
    group by Conta_Receber_Parcela.Id_Conta_Receber, Conta_Receber.Valor_Total

)

select Conta_Receber.Id,
       Conta_Receber_Vinculo.Id as Id_Vinculo,
       Fundo.id_organizacao as ID_ORGANIZACAO_ORIGEM,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipo_Origem,
       Conta_Receber_Vinculo.Id_Fundo as Id_Origem_Recurso,
       'Conta_' || Conta_Receber_Vinculo.Id_Fundo as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,
       Conta_Receber_Parcela.Vencimento as Data,
       Conta_Receber_Parcela.data_recebimento,
       Conta_Receber.Forma_Pagto as Forma_Recebimento,
       case
         when Parcelas.Qtde_Parcelas = 1 then Conta_Receber.Descricao
         else Conta_Receber.Descricao || ' (' || Conta_Receber_Parcela.Parcela || '/' || Parcelas.Qtde_Parcelas || ')'
       end as Descricao,
--Valor
       case
         when Parcelas.Qtde_Parcelas = 1 then Conta_Receber_Vinculo.Valor
         else case
                when Conta_Receber_Vinculo.Id = (select first 1 Conta_Receber_Vinculo.Id
                                                 from Conta_Receber_Vinculo
                                                 where Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id
                                                 order by Conta_Receber_Vinculo.Id desc) then Conta_Receber_Parcela.Valor - (select sum(
                                                                                                                                    case
                                                                                                                                      when Parcelas.Qtde_Parcelas = CRP.Parcela then Crv.Valor - (trunc(Crv.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                                                                                      else trunc(Crv.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                                                                                    end)
                                                                                                                             from Conta_Receber_Parcela CRP
                                                                                                                             inner join Conta_Receber Cp on (Cp.Id = CRP.Id_Conta_Receber)
                                                                                                                             inner join Conta_Receber_Vinculo Crv on (CRV.Id_Conta_Receber = Cp.Id)
                                                                                                                             where CRP.Id_Conta_Receber = Conta_Receber.Id and
                                                                                                                                   CRP.Parcela = Conta_Receber_Parcela.Parcela and
                                                                                                                                   Crv.Id <> Conta_Receber_Vinculo.Id)
                else case
                       when Parcelas.Qtde_Parcelas = Conta_Receber_Parcela.Parcela then Conta_Receber_Vinculo.Valor - (trunc(Conta_Receber_Vinculo.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                       else trunc(Conta_Receber_Vinculo.Valor / Parcelas.Qtde_Parcelas, 2)
                     end
              end
       end as Valor,
--Valor Recebido
       case
         when Conta_Receber_Parcela.Status = 1 then case
                                                      when Parcelas.Qtde_Parcelas = 1 then Conta_Receber_Vinculo.Valor
                                                      else case
                                                             when Conta_Receber_Vinculo.Id = (select first 1 Conta_Receber_Vinculo.Id
                                                                                              from Conta_Receber_Vinculo
                                                                                              where Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id
                                                                                              order by Conta_Receber_Vinculo.Id desc) then Conta_Receber_Parcela.Valor - (select sum(
                                                                                                                                                                                 case
                                                                                                                                                                                   when Parcelas.Qtde_Parcelas = CRP.Parcela then Crv.Valor - (trunc(Crv.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                                                                                                                                   else trunc(Crv.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                                                                                                                                 end)
                                                                                                                                                                          from Conta_Receber_Parcela CRP
                                                                                                                                                                          inner join Conta_Receber Cp on (Cp.Id = CRP.Id_Conta_Receber)
                                                                                                                                                                          inner join Conta_Receber_Vinculo Crv on (CRV.Id_Conta_Receber = Cp.Id)
                                                                                                                                                                          where CRP.Id_Conta_Receber = Conta_Receber.Id and
                                                                                                                                                                                CRP.Parcela = Conta_Receber_Parcela.Parcela and
                                                                                                                                                                                Crv.Id <> Conta_Receber_Vinculo.Id)
                                                             else case
                                                                    when Parcelas.Qtde_Parcelas = Conta_Receber_Parcela.Parcela then Conta_Receber_Vinculo.Valor - (trunc(Conta_Receber_Vinculo.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                    else trunc(Conta_Receber_Vinculo.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                  end
                                                           end
                                                    end
         else 0
       end as Valor_Recebido

from Conta_Receber_Parcela
inner join Conta_Receber on (Conta_Receber_Parcela.Id_Conta_Receber = Conta_Receber.Id)
inner join Conta_Receber_Vinculo on (Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id)
inner join Parcelas on (Conta_Receber.Id = Parcelas.Id_Conta_Receber)
inner join Fundo on (Conta_Receber_Vinculo.Id_Fundo = Fundo.Id)
inner join Organizacao on (Fundo.id_organizacao = Organizacao.Id)
;



CREATE OR ALTER VIEW VIEW_MOVIMENTACAO_FINANCEIRA(
    ID_MOVIMENTACAO,
    ID_ORGANIZACAO,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM,
    ID_ORIGEM_RECURSO,
    ID_UNICO_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
    TIPO,
    DESCRICAO_TIPO,
    DESCRICAO_MOVIMENTACAO,
    DATA,
    DATA_PAGAMENTO_RECEBIMENTO,
    FORMA_PAGAMENTO_RECEBIMENTO,
    VALOR_TOTAL,
    VALOR_TOTAL_PAGO_RECEBIDO)
AS
--DESPESAS DE PROJETO E CONTAS
select View_Conta_Pagar.Id_Vinculo as Id_Movimentacao,
       View_Conta_Pagar.Id_Organizacao_Origem as Id_Organizacao,
       View_Conta_Pagar.Nome_Organizacao,
       View_Conta_Pagar.tipo_origem,
       View_Conta_Pagar.Id_Origem_Recurso,
       View_Conta_Pagar.Id_Unico_Origem_Recurso,
       View_Conta_Pagar.Origem_Recurso,
       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       View_Conta_Pagar.Descricao,
       View_Conta_Pagar.Data,
       View_Conta_Pagar.Data_Pagamento,
       View_Conta_Pagar.Forma_Pagamento,
       View_Conta_Pagar.Valor,
       View_Conta_Pagar.Valor_Pago
from View_Conta_Pagar

union all
--RECEITA VINDA DE CONTAS A RECEBER

select View_Conta_Receber.Id_Vinculo as Id_Movimentacao,
       View_Conta_Receber.Id_Organizacao_Origem as Id_Organizacao,
       View_Conta_Receber.Nome_Organizacao,
       view_conta_receber.tipo_origem,
       View_Conta_Receber.Id_Origem_Recurso,
       View_Conta_Receber.Id_Unico_Origem_Recurso,
       View_Conta_Receber.Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       View_Conta_Receber.Descricao,
       View_Conta_Receber.Data,
       View_Conta_Receber.data_recebimento,
       View_Conta_Receber.forma_recebimento,
       View_Conta_Receber.Valor,
       View_Conta_Receber.valor_recebido
from View_Conta_Receber

union all

select Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 AS TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,
       1 as Tipo,
       'Receitas' as Descricao_Tipo,
       'Pagamento Financiador - ' || Fin_For_Cli.Nome_Fantasia as Descricao,
       Projeto_Financiador_Pagto.Data as Data,
       Projeto_Financiador_Pagto.Data as Data_Pagamento_Recebimento,
       Projeto_Financiador_Pagto.Forma_Pagto as Forma_Pagamento_Recebimento,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador_Pagto.Valor as Valor_Total_Pago_Recebido
from Projeto_Financiador_Pagto
inner join Projeto_Financiador on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join Fin_For_Cli on (Projeto_Financiador.Id_Financiador = Fin_For_Cli.Id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id = Projeto_Financiador_Pagto.Id_Projeto_Organizacao)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)

union all

select Doacao.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 AS TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Doação de ' || Pessoa.Nome as Descricao,
       cast(Doacao.Data as date) as Data,
       cast(Doacao.Data as date) as Data_Pagamento_Recebimento,
       Doacao.Forma_Pagto as Forma_Pagamento_Recebimento,
       Doacao.Valor as Valor_Total,
       Doacao.Valor as Valor_Total_Pago_Recebido
from Doacao
inner join Fundo on (Fundo.Id = Doacao.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
inner join Pessoa on (Pessoa.Id = Doacao.Id_Pessoa_Doadora)

--TRANSFERENCIAS
union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Projeto.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)

union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,

       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Fundo_Origem.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Fundo Fundo_Origem on (Fundo_Origem.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Fundo.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,

       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Projeto_Origem.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Projeto_Rubrica Projeto_Rubrica_Origem on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica_Origem.Id)
inner join Projeto Projeto_Origem on (Projeto_Origem.Id = Projeto_Rubrica_Origem.Id)

inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
--Despesa de transferencia
union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Fundo.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)

union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Projeto_Destino.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Projeto_Rubrica Projeto_Rubrica_Origem on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica_Origem.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica_Origem.Id)

inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto Projeto_Destino on (Projeto.Id = Projeto_Rubrica.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)

union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Projeto.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all

select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Fundo_Destino.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo Fundo_Destino on (Fundo_Destino.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
;



CREATE OR ALTER VIEW VIEW_MOVIMENTACAO_FINANCEIRA(
    ID_MOVIMENTACAO,
    ID_ORGANIZACAO,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM,
    ID_ORIGEM_RECURSO,
    ID_UNICO_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
    TIPO,
    DESCRICAO_TIPO,
    DESCRICAO_MOVIMENTACAO,
    DATA,
    DATA_PAGAMENTO_RECEBIMENTO,
    FORMA_PAGAMENTO_RECEBIMENTO,
    VALOR_TOTAL,
    VALOR_TOTAL_PAGO_RECEBIDO)
AS
--DESPESAS DE PROJETO E CONTAS
select View_Conta_Pagar.Id_Vinculo as Id_Movimentacao,
       View_Conta_Pagar.Id_Organizacao_Origem as Id_Organizacao,
       View_Conta_Pagar.Nome_Organizacao,
       View_Conta_Pagar.tipo_origem,
       View_Conta_Pagar.Id_Origem_Recurso,
       View_Conta_Pagar.Id_Unico_Origem_Recurso,
       View_Conta_Pagar.Origem_Recurso,
       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       View_Conta_Pagar.Descricao,
       View_Conta_Pagar.Data,
       View_Conta_Pagar.Data_Pagamento,
       View_Conta_Pagar.Forma_Pagamento,
       View_Conta_Pagar.Valor,
       View_Conta_Pagar.Valor_Pago
from View_Conta_Pagar

union all
--RECEITA VINDA DE CONTAS A RECEBER

select View_Conta_Receber.Id_Vinculo as Id_Movimentacao,
       View_Conta_Receber.Id_Organizacao_Origem as Id_Organizacao,
       View_Conta_Receber.Nome_Organizacao,
       view_conta_receber.tipo_origem,
       View_Conta_Receber.Id_Origem_Recurso,
       View_Conta_Receber.Id_Unico_Origem_Recurso,
       View_Conta_Receber.Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       View_Conta_Receber.Descricao,
       View_Conta_Receber.Data,
       View_Conta_Receber.data_recebimento,
       View_Conta_Receber.forma_recebimento,
       View_Conta_Receber.Valor,
       View_Conta_Receber.valor_recebido
from View_Conta_Receber

union all

select Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 AS TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,
       1 as Tipo,
       'Receitas' as Descricao_Tipo,
       'Pagamento Financiador - ' || Fin_For_Cli.Nome_Fantasia as Descricao,
       Projeto_Financiador_Pagto.Data as Data,
       Projeto_Financiador_Pagto.Data as Data_Pagamento_Recebimento,
       Projeto_Financiador_Pagto.Forma_Pagto as Forma_Pagamento_Recebimento,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador_Pagto.Valor as Valor_Total_Pago_Recebido
from Projeto_Financiador_Pagto
inner join Projeto_Financiador on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join Fin_For_Cli on (Projeto_Financiador.Id_Financiador = Fin_For_Cli.Id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id = Projeto_Financiador_Pagto.Id_Projeto_Organizacao)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)

union all

select Doacao.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 AS TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Doação de ' || Pessoa.Nome as Descricao,
       cast(Doacao.Data as date) as Data,
       cast(Doacao.Data as date) as Data_Pagamento_Recebimento,
       Doacao.Forma_Pagto as Forma_Pagamento_Recebimento,
       Doacao.Valor as Valor_Total,
       Doacao.Valor as Valor_Total_Pago_Recebido
from Doacao
inner join Fundo on (Fundo.Id = Doacao.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
inner join Pessoa on (Pessoa.Id = Doacao.Id_Pessoa_Doadora)


union all
--TRANSFERENCIAS -> Projeto para Conta
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Projeto.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)

union all
--TRANSFERENCIAS -> Conta para Conta
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,

       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Fundo_Origem.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Fundo Fundo_Origem on (Fundo_Origem.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all
--TRANSFERENCIAS -> Conta para Projeto
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Fundo.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.id_projeto)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all
--TRANSFERENCIAS -> Projeto para Projeto
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,

       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Projeto_Origem.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Projeto_Rubrica Projeto_Rubrica_Origem on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica_Origem.Id)
inner join Projeto Projeto_Origem on (Projeto_Origem.Id = Projeto_Rubrica_Origem.id_projeto)

inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.id_projeto)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
--Despesa de transferencia
union all
--TRANSFERENCIAS -> Projeto para Conta
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Fundo.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)

union all
--TRANSFERENCIAS -> Projeto para Projeto
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Projeto_Destino.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Projeto_Rubrica Projeto_Rubrica_Origem on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica_Origem.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica_Origem.id_projeto)

inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto Projeto_Destino on (Projeto.Id = Projeto_Rubrica.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)

union all
--TRANSFERENCIAS -> Conta para Projeto
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Projeto.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all
--TRANSFERENCIAS -> Conta para Conta
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Fundo_Destino.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo Fundo_Destino on (Fundo_Destino.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
;



CREATE OR ALTER VIEW VIEW_MOVIMENTACAO_FINANCEIRA(
    ID_MOVIMENTACAO,
    ID_ORGANIZACAO,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM,
    ID_ORIGEM_RECURSO,
    ID_UNICO_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
    TIPO,
    DESCRICAO_TIPO,
    DESCRICAO_MOVIMENTACAO,
    DATA,
    DATA_PAGAMENTO_RECEBIMENTO,
    FORMA_PAGAMENTO_RECEBIMENTO,
    VALOR_TOTAL,
    VALOR_TOTAL_PAGO_RECEBIDO)
AS
--DESPESAS DE PROJETO E CONTAS
select View_Conta_Pagar.Id_Vinculo as Id_Movimentacao,
       View_Conta_Pagar.Id_Organizacao_Origem as Id_Organizacao,
       View_Conta_Pagar.Nome_Organizacao,
       View_Conta_Pagar.tipo_origem,
       View_Conta_Pagar.Id_Origem_Recurso,
       View_Conta_Pagar.Id_Unico_Origem_Recurso,
       View_Conta_Pagar.Origem_Recurso,
       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       View_Conta_Pagar.Descricao,
       View_Conta_Pagar.Data,
       View_Conta_Pagar.Data_Pagamento,
       View_Conta_Pagar.Forma_Pagamento,
       View_Conta_Pagar.Valor,
       View_Conta_Pagar.Valor_Pago
from View_Conta_Pagar

union all
--RECEITA VINDA DE CONTAS A RECEBER

select View_Conta_Receber.Id_Vinculo as Id_Movimentacao,
       View_Conta_Receber.Id_Organizacao_Origem as Id_Organizacao,
       View_Conta_Receber.Nome_Organizacao,
       view_conta_receber.tipo_origem,
       View_Conta_Receber.Id_Origem_Recurso,
       View_Conta_Receber.Id_Unico_Origem_Recurso,
       View_Conta_Receber.Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       View_Conta_Receber.Descricao,
       View_Conta_Receber.Data,
       View_Conta_Receber.data_recebimento,
       View_Conta_Receber.forma_recebimento,
       View_Conta_Receber.Valor,
       View_Conta_Receber.valor_recebido
from View_Conta_Receber

union all

select Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 AS TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,
       1 as Tipo,
       'Receitas' as Descricao_Tipo,
       'Pagamento Financiador - ' || Fin_For_Cli.Nome_Fantasia as Descricao,
       Projeto_Financiador_Pagto.Data as Data,
       Projeto_Financiador_Pagto.Data as Data_Pagamento_Recebimento,
       Projeto_Financiador_Pagto.Forma_Pagto as Forma_Pagamento_Recebimento,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador_Pagto.Valor as Valor_Total_Pago_Recebido
from Projeto_Financiador_Pagto
inner join Projeto_Financiador on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join Fin_For_Cli on (Projeto_Financiador.Id_Financiador = Fin_For_Cli.Id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id = Projeto_Financiador_Pagto.Id_Projeto_Organizacao)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)

union all

select Doacao.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 AS TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Doação de ' || Pessoa.Nome as Descricao,
       cast(Doacao.Data as date) as Data,
       cast(Doacao.Data as date) as Data_Pagamento_Recebimento,
       Doacao.Forma_Pagto as Forma_Pagamento_Recebimento,
       Doacao.Valor as Valor_Total,
       Doacao.Valor as Valor_Total_Pago_Recebido
from Doacao
inner join Fundo on (Fundo.Id = Doacao.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
inner join Pessoa on (Pessoa.Id = Doacao.Id_Pessoa_Doadora)


union all
--TRANSFERENCIAS -> Projeto para Conta
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Projeto.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)

union all
--TRANSFERENCIAS -> Conta para Conta
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,

       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Fundo_Origem.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Fundo Fundo_Origem on (Fundo_Origem.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all
--TRANSFERENCIAS -> Conta para Projeto
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Fundo.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.id_projeto)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all
--TRANSFERENCIAS -> Projeto para Projeto
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,

       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Projeto_Origem.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Projeto_Rubrica Projeto_Rubrica_Origem on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica_Origem.Id)
inner join Projeto Projeto_Origem on (Projeto_Origem.Id = Projeto_Rubrica_Origem.id_projeto)

inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.id_projeto)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
--Despesa de transferencia
union all
--TRANSFERENCIAS -> Projeto para Conta
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Fundo.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)

union all
--TRANSFERENCIAS -> Projeto para Projeto
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Projeto_Destino.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Projeto_Rubrica Projeto_Rubrica_Origem on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica_Origem.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica_Origem.id_projeto)

inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto Projeto_Destino on (Projeto.Id = Projeto_Rubrica.id_projeto)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)

union all
--TRANSFERENCIAS -> Conta para Projeto
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Projeto.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all
--TRANSFERENCIAS -> Conta para Conta
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Fundo_Destino.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo Fundo_Destino on (Fundo_Destino.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
;



CREATE OR ALTER VIEW VIEW_MOVIMENTACAO_FINANCEIRA(
    ID_MOVIMENTACAO,
    ID_ORGANIZACAO,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM,
    ID_ORIGEM_RECURSO,
    ID_UNICO_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
    TIPO,
    DESCRICAO_TIPO,
    DESCRICAO_MOVIMENTACAO,
    DATA,
    DATA_PAGAMENTO_RECEBIMENTO,
    FORMA_PAGAMENTO_RECEBIMENTO,
    VALOR_TOTAL,
    VALOR_TOTAL_PAGO_RECEBIDO)
AS
--DESPESAS DE PROJETO E CONTAS
select View_Conta_Pagar.Id_Vinculo as Id_Movimentacao,
       View_Conta_Pagar.Id_Organizacao_Origem as Id_Organizacao,
       View_Conta_Pagar.Nome_Organizacao,
       View_Conta_Pagar.tipo_origem,
       View_Conta_Pagar.Id_Origem_Recurso,
       View_Conta_Pagar.Id_Unico_Origem_Recurso,
       View_Conta_Pagar.Origem_Recurso,
       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       View_Conta_Pagar.Descricao,
       View_Conta_Pagar.Data,
       View_Conta_Pagar.Data_Pagamento,
       View_Conta_Pagar.Forma_Pagamento,
       View_Conta_Pagar.Valor,
       View_Conta_Pagar.Valor_Pago
from View_Conta_Pagar

union all
--RECEITA VINDA DE CONTAS A RECEBER

select View_Conta_Receber.Id_Vinculo as Id_Movimentacao,
       View_Conta_Receber.Id_Organizacao_Origem as Id_Organizacao,
       View_Conta_Receber.Nome_Organizacao,
       view_conta_receber.tipo_origem,
       View_Conta_Receber.Id_Origem_Recurso,
       View_Conta_Receber.Id_Unico_Origem_Recurso,
       View_Conta_Receber.Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       View_Conta_Receber.Descricao,
       View_Conta_Receber.Data,
       View_Conta_Receber.data_recebimento,
       View_Conta_Receber.forma_recebimento,
       View_Conta_Receber.Valor,
       View_Conta_Receber.valor_recebido
from View_Conta_Receber

union all

select Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 AS TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,
       1 as Tipo,
       'Receitas' as Descricao_Tipo,
       'Pagamento Financiador - ' || Fin_For_Cli.Nome_Fantasia as Descricao,
       Projeto_Financiador_Pagto.Data as Data,
       Projeto_Financiador_Pagto.Data as Data_Pagamento_Recebimento,
       Projeto_Financiador_Pagto.Forma_Pagto as Forma_Pagamento_Recebimento,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador_Pagto.Valor as Valor_Total_Pago_Recebido
from Projeto_Financiador_Pagto
inner join Projeto_Financiador on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join Fin_For_Cli on (Projeto_Financiador.Id_Financiador = Fin_For_Cli.Id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id = Projeto_Financiador_Pagto.Id_Projeto_Organizacao)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)

union all

select Doacao.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 AS TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Doação de ' || Pessoa.Nome as Descricao,
       cast(Doacao.Data as date) as Data,
       cast(Doacao.Data as date) as Data_Pagamento_Recebimento,
       Doacao.Forma_Pagto as Forma_Pagamento_Recebimento,
       Doacao.Valor as Valor_Total,
       Doacao.Valor as Valor_Total_Pago_Recebido
from Doacao
inner join Fundo on (Fundo.Id = Doacao.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
inner join Pessoa on (Pessoa.Id = Doacao.Id_Pessoa_Doadora)


union all
--TRANSFERENCIAS -> Projeto para Conta
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Projeto.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)

union all
--TRANSFERENCIAS -> Conta para Conta
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,

       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Fundo_Origem.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Fundo Fundo_Origem on (Fundo_Origem.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all
--TRANSFERENCIAS -> Conta para Projeto
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Fundo.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.id_projeto)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all
--TRANSFERENCIAS -> Projeto para Projeto
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,

       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Projeto_Origem.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Projeto_Rubrica Projeto_Rubrica_Origem on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica_Origem.Id)
inner join Projeto Projeto_Origem on (Projeto_Origem.Id = Projeto_Rubrica_Origem.id_projeto)

inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.id_projeto)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
--Despesa de transferencia
union all
--TRANSFERENCIAS -> Projeto para Conta
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Fundo.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)

union all
--TRANSFERENCIAS -> Projeto para Projeto
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Projeto_Destino.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Projeto_Rubrica Projeto_Rubrica_Origem on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica_Origem.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica_Origem.id_projeto)

inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto Projeto_Destino on (Projeto_Destino.Id = Projeto_Rubrica.id_projeto)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)

union all
--TRANSFERENCIAS -> Conta para Projeto
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Projeto.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all
--TRANSFERENCIAS -> Conta para Conta
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Fundo_Destino.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo Fundo_Destino on (Fundo_Destino.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
;



CREATE OR ALTER VIEW VIEW_MOVIMENTACAO_FINANCEIRA(
    ID_MOVIMENTACAO,
    ID_ORGANIZACAO,
    NOME_ORGANIZACAO,
    TIPO_ORIGEM,
    ID_ORIGEM_RECURSO,
    ID_UNICO_ORIGEM_RECURSO,
    ORIGEM_RECURSO,
    TIPO,
    DESCRICAO_TIPO,
    DESCRICAO_MOVIMENTACAO,
    DATA,
    DATA_PAGAMENTO_RECEBIMENTO,
    FORMA_PAGAMENTO_RECEBIMENTO,
    VALOR_TOTAL,
    VALOR_TOTAL_PAGO_RECEBIDO)
AS
--DESPESAS DE PROJETO E CONTAS
select View_Conta_Pagar.Id_Vinculo as Id_Movimentacao,
       View_Conta_Pagar.Id_Organizacao_Origem as Id_Organizacao,
       View_Conta_Pagar.Nome_Organizacao,
       View_Conta_Pagar.tipo_origem,
       View_Conta_Pagar.Id_Origem_Recurso,
       View_Conta_Pagar.Id_Unico_Origem_Recurso,
       View_Conta_Pagar.Origem_Recurso,
       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       View_Conta_Pagar.Descricao,
       View_Conta_Pagar.Data,
       View_Conta_Pagar.Data_Pagamento,
       View_Conta_Pagar.Forma_Pagamento,
       View_Conta_Pagar.Valor,
       View_Conta_Pagar.Valor_Pago
from View_Conta_Pagar

union all
--RECEITA VINDA DE CONTAS A RECEBER

select View_Conta_Receber.Id_Vinculo as Id_Movimentacao,
       View_Conta_Receber.Id_Organizacao_Origem as Id_Organizacao,
       View_Conta_Receber.Nome_Organizacao,
       view_conta_receber.tipo_origem,
       View_Conta_Receber.Id_Origem_Recurso,
       View_Conta_Receber.Id_Unico_Origem_Recurso,
       View_Conta_Receber.Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       View_Conta_Receber.Descricao,
       View_Conta_Receber.Data,
       View_Conta_Receber.data_recebimento,
       View_Conta_Receber.forma_recebimento,
       View_Conta_Receber.Valor,
       View_Conta_Receber.valor_recebido
from View_Conta_Receber

union all

select Projeto_Financiador_Pagto.Id as Id_Movimentacao,
       Projeto_Organizacao.Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 AS TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,
       1 as Tipo,
       'Receitas' as Descricao_Tipo,
       'Pagamento Financiador - ' || Fin_For_Cli.Nome_Fantasia as Descricao,
       Projeto_Financiador_Pagto.Data as Data,
       Projeto_Financiador_Pagto.Data as Data_Pagamento_Recebimento,
       Projeto_Financiador_Pagto.Forma_Pagto as Forma_Pagamento_Recebimento,
       Projeto_Financiador.Valor_Financiado as Valor_Total,
       Projeto_Financiador_Pagto.Valor as Valor_Total_Pago_Recebido
from Projeto_Financiador_Pagto
inner join Projeto_Financiador on (Projeto_Financiador_Pagto.Id_Projeto_Financiador = Projeto_Financiador.Id)
inner join Fin_For_Cli on (Projeto_Financiador.Id_Financiador = Fin_For_Cli.Id)
inner join Projeto on (Projeto_Financiador.Id_Projeto = Projeto.Id)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id = Projeto_Financiador_Pagto.Id_Projeto_Organizacao)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)

union all

select Doacao.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 AS TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Doação de ' || Pessoa.Nome as Descricao,
       cast(Doacao.Data as date) as Data,
       cast(Doacao.Data as date) as Data_Pagamento_Recebimento,
       Doacao.Forma_Pagto as Forma_Pagamento_Recebimento,
       Doacao.Valor as Valor_Total,
       Doacao.Valor as Valor_Total_Pago_Recebido
from Doacao
inner join Fundo on (Fundo.Id = Doacao.Id_Fundo)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
inner join Pessoa on (Pessoa.Id = Doacao.Id_Pessoa_Doadora)


union all
--TRANSFERENCIAS -> Projeto para Conta
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Projeto.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)

union all
--TRANSFERENCIAS -> Conta para Conta
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,

       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Fundo_Origem.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Fundo Fundo_Origem on (Fundo_Origem.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all
--TRANSFERENCIAS -> Conta para Projeto
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,
       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Fundo.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.id_projeto)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all
--TRANSFERENCIAS -> Projeto para Projeto
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,

       1 as Tipo, --Receita
       'Receitas' as Descricao_Tipo,
       'Transferência de ' || Projeto_Origem.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,
       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Projeto_Rubrica Projeto_Rubrica_Origem on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica_Origem.Id)
inner join Projeto Projeto_Origem on (Projeto_Origem.Id = Projeto_Rubrica_Origem.id_projeto)

inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.id_projeto)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)
--Despesa de transferencia
union all
--TRANSFERENCIAS -> Projeto para Conta
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Fundo.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.Id_Projeto)

union all
--TRANSFERENCIAS -> Projeto para Projeto
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       0 as TIPO_ORIGEM,
       Projeto.Id as Id_Origem_Recurso,
       'Projeto_' || Projeto.Id as Id_Unico_Origem_Recurso,
       Projeto.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Projeto_Destino.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Projeto_Rubrica Projeto_Rubrica_Origem on (Transferencia_Financeira.Id_Projeto_Rubrica_Origem = Projeto_Rubrica_Origem.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica_Origem.id_projeto)

inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto Projeto_Destino on (Projeto_Destino.Id = Projeto_Rubrica.id_projeto)
inner join Projeto_Organizacao on (Projeto_Organizacao.Id_Projeto = Projeto.Id)
inner join Organizacao on (Organizacao.Id = Projeto_Organizacao.Id_Organizacao)

union all
--TRANSFERENCIAS -> Conta para Projeto
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Projeto.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Projeto_Rubrica on (Transferencia_Financeira.Id_Projeto_Rubrica_Destino = Projeto_Rubrica.Id)
inner join Projeto on (Projeto.Id = Projeto_Rubrica.id_projeto)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)

union all
--TRANSFERENCIAS -> Conta para Conta
select Transferencia_Financeira.Id as Id_Movimentacao,
       Organizacao.Id as Id_Organizacao,
       Organizacao.Nome as Nome_Organizacao,
       1 as TIPO_ORIGEM,
       Fundo.Id as Id_Origem_Recurso,
       'Conta_' || Fundo.Id as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,

       0 as Tipo, --Despesa
       'Despesas' as Descricao_Tipo,
       'Transferência para ' || Fundo_Destino.Nome as Descricao,
       cast(Transferencia_Financeira.Data as date) as Data,
       cast(Transferencia_Financeira.Data as date) as Data_Pagamento_Recebimento,
       1 as Forma_Pagamento_Recebimento, --Transf. Bancaria
       Transferencia_Financeira.Valor as Valor_Total,

       Transferencia_Financeira.Valor as Valor_Total_Pago_Recebido
from Transferencia_Financeira
inner join Fundo Fundo_Destino on (Fundo_Destino.Id = Transferencia_Financeira.Id_Fundo_Destino)
inner join Fundo on (Fundo.Id = Transferencia_Financeira.Id_Fundo_Origem)
inner join Organizacao on (Organizacao.Id = Fundo.Id_Organizacao)
;

