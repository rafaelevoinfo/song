

ALTER TABLE ORCAMENTO_ITEM
    ADD TAMANHO NUMERIC(15,2);

COMMENT ON COLUMN ORCAMENTO_ITEM.TAMANHO IS
'Tamanho da muda';

alter table ORCAMENTO_ITEM
alter ID position 1;

alter table ORCAMENTO_ITEM
alter ID_ORCAMENTO position 2;

alter table ORCAMENTO_ITEM
alter ID_ITEM position 3;

alter table ORCAMENTO_ITEM
alter ID_ESPECIE position 4;

alter table ORCAMENTO_ITEM
alter QTDE position 5;

alter table ORCAMENTO_ITEM
alter TAMANHO position 6;

alter table ORCAMENTO_ITEM
alter VALOR_UNITARIO position 7;



ALTER TABLE ORCAMENTO
    ADD ID_VENDA INTEGER,
    ADD ID_SAIDA INTEGER;



ALTER TABLE ORCAMENTO DROP CONSTRAINT FK_ORCAMENTO_1;

ALTER TABLE ORCAMENTO
ADD CONSTRAINT FK_ORCAMENTO_1
FOREIGN KEY (ID_MODELO_ORCAMENTO)
REFERENCES MODELO_ORCAMENTO(ID)
ON UPDATE CASCADE
USING INDEX FK_ORCAMENTO_1;

ALTER TABLE ORCAMENTO DROP CONSTRAINT FK_ORCAMENTO_2;

ALTER TABLE ORCAMENTO
ADD CONSTRAINT FK_ORCAMENTO_2
FOREIGN KEY (ID_RESPONSAVEL)
REFERENCES PESSOA(ID)
ON UPDATE CASCADE
USING INDEX FK_ORCAMENTO_2;

ALTER TABLE ORCAMENTO DROP CONSTRAINT FK_ORCAMENTO_3;

ALTER TABLE ORCAMENTO
ADD CONSTRAINT FK_ORCAMENTO_3
FOREIGN KEY (ID_CLIENTE)
REFERENCES FIN_FOR_CLI(ID)
ON UPDATE CASCADE
USING INDEX FK_ORCAMENTO_3;

ALTER TABLE ORCAMENTO
ADD CONSTRAINT FK_ORCAMENTO_4
FOREIGN KEY (ID_VENDA)
REFERENCES VENDA(ID)
ON UPDATE CASCADE;

ALTER TABLE ORCAMENTO
ADD CONSTRAINT FK_ORCAMENTO_5
FOREIGN KEY (ID_SAIDA)
REFERENCES SAIDA(ID)
ON UPDATE CASCADE;



ALTER TABLE ORCAMENTO DROP CONSTRAINT FK_ORCAMENTO_4;

ALTER TABLE ORCAMENTO
ADD CONSTRAINT FK_ORCAMENTO_4
FOREIGN KEY (ID_VENDA)
REFERENCES VENDA(ID)
ON DELETE SET NULL
ON UPDATE CASCADE
USING INDEX FK_ORCAMENTO_4;

ALTER TABLE ORCAMENTO DROP CONSTRAINT FK_ORCAMENTO_5;

ALTER TABLE ORCAMENTO
ADD CONSTRAINT FK_ORCAMENTO_5
FOREIGN KEY (ID_SAIDA)
REFERENCES SAIDA(ID)
ON DELETE SET NULL
ON UPDATE CASCADE
USING INDEX FK_ORCAMENTO_5;



CREATE TABLE PROJETO_RUBRICA_PAGTO (
    ID INTEGER NOT NULL,
    ID_PROJETO_RUBRICA INTEGER NOT NULL,
    ID_PROJETO_FINANCIADOR_PAGTO INTEGER NOT NULL,
    VALOR NUMERIC(15,2) NOT NULL);

ALTER TABLE PROJETO_RUBRICA_PAGTO
ADD CONSTRAINT PK_PROJETO_RUBRICA_PAGTO
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_PROJETO_RUBRICA_PAGTO;



ALTER TABLE PROJETO_RUBRICA_PAGTO
ADD CONSTRAINT FK_PROJETO_RUBRICA_PAGTO_1
FOREIGN KEY (ID_PROJETO_RUBRICA)
REFERENCES PROJETO_RUBRICA(ID)
ON UPDATE CASCADE;

ALTER TABLE PROJETO_RUBRICA_PAGTO
ADD CONSTRAINT FK_PROJETO_RUBRICA_PAGTO_2
FOREIGN KEY (ID_PROJETO_FINANCIADOR_PAGTO)
REFERENCES PROJETO_FINANCIADOR_PAGTO(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;



CREATE TABLE PROJETO_FINAN_PAGTO_RUBRICA (
    ID INTEGER NOT NULL,
    ID_PROJETO_RUBRICA INTEGER NOT NULL,
    ID_PROJETO_FINANCIADOR_PAGTO INTEGER NOT NULL,
    VALOR NUMERIC(15,2) NOT NULL);

ALTER TABLE PROJETO_FINAN_PAGTO_RUBRICA
ADD CONSTRAINT PK_PROJETO_FINAN_PAGTO_RUBRICA
PRIMARY KEY (ID);

CREATE SEQUENCE GEN_PROJETO_FINAN_PAGTO_RUBRICA;



ALTER TABLE PROJETO_RUBRICA_PAGTO DROP CONSTRAINT FK_PROJETO_RUBRICA_PAGTO_2;



ALTER TABLE PROJETO_RUBRICA_PAGTO DROP CONSTRAINT FK_PROJETO_RUBRICA_PAGTO_1;



DROP TABLE PROJETO_RUBRICA_PAGTO;



DROP SEQUENCE GEN_PROJETO_RUBRICA_PAGTO;



ALTER TABLE PROJETO_FINAN_PAGTO_RUBRICA
ADD CONSTRAINT FK_PROJETO_FINANCIADOR_PAGTO
FOREIGN KEY (ID_PROJETO_FINANCIADOR_PAGTO)
REFERENCES PROJETO_FINANCIADOR_PAGTO(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;



create or alter view View_valores_rubrica_projeto (
    Id_rubrica,
    Id_projeto,
    Nome_projeto,
    Nome_rubrica,
    Orcamento,
    Valor_gasto,
    Valor_gasto_transferido,
    Valor_recebido,
    Valor_recebido_transferido,
    Valor_aprovisionado)
as
select distinct Projeto_rubrica.Id_rubrica,
                Projeto_rubrica.Id_projeto,
                Projeto.Nome as Nome_projeto,
                Rubrica.Nome as Nome_rubrica,
                Projeto_rubrica.Orcamento,
                --VALOR GASTO
                coalesce(sum(View_conta_pagar.Valor_pago) over(partition by Projeto_rubrica.Id_projeto, Projeto_rubrica.Id_rubrica), 0) as Valor_gasto,
                --VALOR GASTO TRANSFERIDO
                coalesce((select sum(Transferencia_financeira.Valor)
                          from Transferencia_financeira
                          where Transferencia_financeira.Id_projeto_rubrica_origem = Projeto_rubrica.Id), 0) as Valor_gasto_transferido,
                --VALOR RECEBIDO
                coalesce((select sum(Projeto_finan_pagto_rubrica.Valor)
                          from Projeto_finan_pagto_rubrica
                          where Projeto_finan_pagto_rubrica.Id_projeto_rubrica = projeto_rubrica.id), 0) as Valor_recebido,
                --VALOR RECEBIDO TRANSFERIDO
                coalesce((select sum(Transferencia_financeira.Valor)
                          from Transferencia_financeira
                          where Transferencia_financeira.Id_projeto_rubrica_destino = Projeto_rubrica.Id), 0) as Valor_recebido_transferido,
                --VALOR APROVISIONADO

                coalesce((sum(View_conta_pagar.Valor) over(partition by Projeto_rubrica.Id_projeto, Projeto_rubrica.Id_rubrica)) - (sum(View_conta_pagar.Valor_pago) over(partition by Projeto_rubrica.Id_projeto, Projeto_rubrica.Id_rubrica)), 0) as Valor_aprovisionado
from Projeto_rubrica
inner join Projeto on (Projeto.Id = Projeto_rubrica.Id_projeto)
inner join Rubrica on (Rubrica.Id = Projeto_rubrica.Id_rubrica)
left join View_conta_pagar on (View_conta_pagar.Id_origem_recurso = Projeto_rubrica.Id_projeto and
      View_conta_pagar.Id_rubrica_origem = Projeto_rubrica.Id_rubrica and
      View_conta_pagar.Tipo_origem = 0)

order by Projeto_rubrica.Id_projeto, Projeto_rubrica.Id_rubrica;



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



create or alter view View_valores_rubrica_projeto (
    Id_rubrica,
    Id_projeto,
    Nome_projeto,
    Nome_rubrica,
    Orcamento,
    Valor_gasto,
    Valor_gasto_transferido,
    Valor_recebido,
    Valor_recebido_transferido,
    Valor_aprovisionado)
as
select distinct Projeto_rubrica.Id_rubrica,
                Projeto_rubrica.Id_projeto,
                Projeto.Nome as Nome_projeto,
                Rubrica.Nome as Nome_rubrica,
                Projeto_rubrica.Orcamento,
                --VALOR GASTO
                coalesce(sum(View_conta_pagar.Valor_pago) over(partition by Projeto_rubrica.Id_projeto, Projeto_rubrica.Id_rubrica), 0) as Valor_gasto,
                --VALOR GASTO TRANSFERIDO
                coalesce((select sum(Transferencia_financeira.Valor)
                          from Transferencia_financeira
                          where Transferencia_financeira.Id_projeto_rubrica_origem = Projeto_rubrica.Id), 0) as Valor_gasto_transferido,
                --VALOR RECEBIDO
                coalesce(0, 0) as Valor_recebido,
                --VALOR RECEBIDO TRANSFERIDO
                coalesce((select sum(Transferencia_financeira.Valor)
                          from Transferencia_financeira
                          where Transferencia_financeira.Id_projeto_rubrica_destino = Projeto_rubrica.Id), 0) as Valor_recebido_transferido,
                --VALOR APROVISIONADO

                coalesce((sum(View_conta_pagar.Valor) over(partition by Projeto_rubrica.Id_projeto, Projeto_rubrica.Id_rubrica)) - (sum(View_conta_pagar.Valor_pago) over(partition by Projeto_rubrica.Id_projeto, Projeto_rubrica.Id_rubrica)), 0) as Valor_aprovisionado
from Projeto_rubrica
inner join Projeto on (Projeto.Id = Projeto_rubrica.Id_projeto)
inner join Rubrica on (Rubrica.Id = Projeto_rubrica.Id_rubrica)
left join View_conta_pagar on (View_conta_pagar.Id_origem_recurso = Projeto_rubrica.Id_projeto and
      View_conta_pagar.Id_rubrica_origem = Projeto_rubrica.Id_rubrica and
      View_conta_pagar.Tipo_origem = 0)

order by Projeto_rubrica.Id_projeto, Projeto_rubrica.Id_rubrica;



create or alter view View_valores_rubrica_projeto (
    Id_rubrica,
    Id_projeto,
    Nome_projeto,
    Nome_rubrica,
    Orcamento,
    Valor_gasto,
    Valor_gasto_transferido,
    Valor_recebido,
    Valor_recebido_transferido,
    Valor_aprovisionado)
as
select distinct Projeto_rubrica.Id_rubrica,
                Projeto_rubrica.Id_projeto,
                Projeto.Nome as Nome_projeto,
                Rubrica.Nome as Nome_rubrica,
                Projeto_rubrica.Orcamento,
                --VALOR GASTO
                coalesce(sum(View_conta_pagar.Valor_pago) over(partition by Projeto_rubrica.Id_projeto, Projeto_rubrica.Id_rubrica), 0) as Valor_gasto,
                --VALOR GASTO TRANSFERIDO
                coalesce((select sum(Transferencia_financeira.Valor)
                          from Transferencia_financeira
                          where Transferencia_financeira.Id_projeto_rubrica_origem = Projeto_rubrica.Id), 0) as Valor_gasto_transferido,
                --VALOR RECEBIDO
                coalesce(0, 0) as Valor_recebido,
                --VALOR RECEBIDO TRANSFERIDO
                coalesce((select sum(Transferencia_financeira.Valor)
                          from Transferencia_financeira
                          where Transferencia_financeira.Id_projeto_rubrica_destino = Projeto_rubrica.Id), 0) as Valor_recebido_transferido,
                --VALOR APROVISIONADO

                coalesce((sum(View_conta_pagar.Valor) over(partition by Projeto_rubrica.Id_projeto, Projeto_rubrica.Id_rubrica)) - (sum(View_conta_pagar.Valor_pago) over(partition by Projeto_rubrica.Id_projeto, Projeto_rubrica.Id_rubrica)), 0) as Valor_aprovisionado
from Projeto_rubrica
inner join Projeto on (Projeto.Id = Projeto_rubrica.Id_projeto)
inner join Rubrica on (Rubrica.Id = Projeto_rubrica.Id_rubrica)
left join View_conta_pagar on (View_conta_pagar.Id_origem_recurso = Projeto_rubrica.Id_projeto and
      View_conta_pagar.Id_rubrica_origem = Projeto_rubrica.Id_rubrica and
      View_conta_pagar.Tipo_origem = 0)

order by Projeto_rubrica.Id_projeto, Projeto_rubrica.Id_rubrica;



create or alter view View_valores_rubrica_projeto (
    Id_rubrica,
    Id_projeto,
    Nome_projeto,
    Nome_rubrica,
    Orcamento,
    Valor_gasto,
    Valor_gasto_transferido,
    Valor_recebido,
    Valor_recebido_transferido,
    Valor_aprovisionado)
as
select distinct Projeto_rubrica.Id_rubrica,
                Projeto_rubrica.Id_projeto,
                Projeto.Nome as Nome_projeto,
                Rubrica.Nome as Nome_rubrica,
                Projeto_rubrica.Orcamento,
                --VALOR GASTO
                coalesce(sum(View_conta_pagar.Valor_pago) over(partition by Projeto_rubrica.Id_projeto, Projeto_rubrica.Id_rubrica), 0) as Valor_gasto,
                --VALOR GASTO TRANSFERIDO
                coalesce((select sum(Transferencia_financeira.Valor)
                          from Transferencia_financeira
                          where Transferencia_financeira.Id_projeto_rubrica_origem = Projeto_rubrica.Id), 0) as Valor_gasto_transferido,
                --VALOR RECEBIDO
                coalesce((select sum(Projeto_finan_pagto_rubrica.Valor)
                          from Projeto_finan_pagto_rubrica
                          where Projeto_finan_pagto_rubrica.Id_projeto_rubrica = projeto_rubrica.id), 0) as Valor_recebido,
                --VALOR RECEBIDO TRANSFERIDO
                coalesce((select sum(Transferencia_financeira.Valor)
                          from Transferencia_financeira
                          where Transferencia_financeira.Id_projeto_rubrica_destino = Projeto_rubrica.Id), 0) as Valor_recebido_transferido,
                --VALOR APROVISIONADO

                coalesce((sum(View_conta_pagar.Valor) over(partition by Projeto_rubrica.Id_projeto, Projeto_rubrica.Id_rubrica)) - (sum(View_conta_pagar.Valor_pago) over(partition by Projeto_rubrica.Id_projeto, Projeto_rubrica.Id_rubrica)), 0) as Valor_aprovisionado
from Projeto_rubrica
inner join Projeto on (Projeto.Id = Projeto_rubrica.Id_projeto)
inner join Rubrica on (Rubrica.Id = Projeto_rubrica.Id_rubrica)
left join View_conta_pagar on (View_conta_pagar.Id_origem_recurso = Projeto_rubrica.Id_projeto and
      View_conta_pagar.Id_rubrica_origem = Projeto_rubrica.Id_rubrica and
      View_conta_pagar.Tipo_origem = 0)

order by Projeto_rubrica.Id_projeto, Projeto_rubrica.Id_rubrica;



DROP SEQUENCE GEN_ORCAMENTO_VALOR;



CREATE SEQUENCE GEN_LOTE_SEMENTE_MUDA;

execute block
as
declare variable Va_max_lote_semente int;
declare variable Va_max_lote_muda int;
declare variable Va_max int;
begin

  select max(Lote_semente.Id)
  from Lote_semente
  into :Va_max_lote_semente;

  select max(Lote_muda.Id)
  from Lote_muda
  into :Va_max_lote_muda;

  if (Va_max_lote_muda > Va_max_lote_semente) then
  begin
    Va_max = Va_max_lote_muda;
  end
  else
  begin
    Va_max = Va_max_lote_semente;
  end

  execute statement 'alter sequence gen_lote_semente_muda restart with '||(:va_max+1);

end



DROP SEQUENCE GEN_LOTE_SEMENTE;



DROP SEQUENCE GEN_LOTE_MUDA;

