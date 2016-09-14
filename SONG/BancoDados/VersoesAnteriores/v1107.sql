

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
                when Conta_Pagar_Vinculo.Id = (select first 1 cpv.Id
                                               from conta_pagar_vinculo cpv
                                               where cpv.Id_Conta_Pagar = Conta_Pagar.Id
                                               order by cpv.Id desc) then Conta_Pagar_Parcela.Valor - (select sum(
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
                when Conta_Pagar_Vinculo.Id = (select first 1 conta_pagar_vinculo.Id
                                               from conta_pagar_vinculo
                                               where conta_pagar_vinculo.Id_Conta_Pagar = Conta_Pagar.Id
                                               order by conta_pagar_vinculo.Id desc) then Conta_Pagar_Parcela.Valor - (select sum(
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
                when Conta_Pagar_Vinculo.Id = (select first 1 conta_pagar_vinculo.Id
                                               from conta_pagar_vinculo
                                               where conta_pagar_vinculo.Id_Conta_Pagar = Conta_Pagar.Id
                                               order by conta_pagar_vinculo.Id desc) then Conta_Pagar_Parcela.Valor
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
                when Conta_Pagar_Vinculo.Id = (select first 1 conta_pagar_vinculo.Id
                                               from conta_pagar_vinculo
                                               where conta_pagar_vinculo.Id_Conta_Pagar = Conta_Pagar.Id
                                               order by conta_pagar_vinculo.Id desc) then Conta_Pagar_Parcela.Valor - (select sum(
                                                                                                                              case
                                                                                                                                when Parcelas.Qtde_Parcelas = Cpp.Parcela then Cpv.Valor - (trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                                                                                else trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                                                                              end)
                                                                                                                       from Conta_Pagar_Parcela Cpp
                                                                                                                       inner join Conta_Pagar Cp on (Cp.Id = Cpp.Id_Conta_Pagar)
                                                                                                                       inner join Conta_Pagar_Vinculo Cpv on (Cpv.id_conta_pagar = Cp.Id)
                                                                                                                       where Cpp.Id_Conta_Pagar = Conta_Pagar.Id and
                                                                                                                           --  Cpp.Parcela = Conta_Pagar_Parcela.Parcela and
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
                when Conta_Pagar_Vinculo.Id = (select first 1 conta_pagar_vinculo.Id
                                               from conta_pagar_vinculo
                                               where conta_pagar_vinculo.Id_Conta_Pagar = Conta_Pagar.Id
                                               order by conta_pagar_vinculo.Id desc) then Conta_Pagar_Parcela.Valor - (select sum(
                                                                                                                              case
                                                                                                                                when Parcelas.Qtde_Parcelas = Cpp.Parcela then Cpv.Valor - (trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                                                                                else trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                                                                              end)
                                                                                                                       from Conta_Pagar_Parcela Cpp
                                                                                                                       inner join Conta_Pagar Cp on (Cp.Id = Cpp.Id_Conta_Pagar)
                                                                                                                       inner join Conta_Pagar_Vinculo Cpv on (Cpv.id_conta_pagar = Cp.Id)
                                                                                                                       where Cpp.Id_Conta_Pagar = Conta_Pagar.Id)-- and
                                                                                                                           --  Cpp.Parcela = Conta_Pagar_Parcela.Parcela and
                                                                                                                           --  Cpv.Id <> Conta_Pagar_Vinculo.Id)
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
                when Conta_Pagar_Vinculo.Id = (select first 1 conta_pagar_vinculo.Id
                                               from conta_pagar_vinculo
                                               where conta_pagar_vinculo.Id_Conta_Pagar = Conta_Pagar.Id
                                               order by conta_pagar_vinculo.Id desc) then Conta_Pagar_Parcela.Valor - (select sum(
                                                                                                                              case
                                                                                                                                when Parcelas.Qtde_Parcelas = Cpp.Parcela then Cpv.Valor - (trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                                                                                else trunc(Cpv.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                                                                              end)
                                                                                                                       from Conta_Pagar_Parcela Cpp
                                                                                                                       inner join Conta_Pagar Cp on (Cp.Id = Cpp.Id_Conta_Pagar)
                                                                                                                       inner join Conta_Pagar_Vinculo Cpv on (Cpv.id_conta_pagar = Cp.Id)
                                                                                                                       where Cpp.Id_Conta_Pagar = Conta_Pagar.Id and
                                                                                                                             Cpp.Parcela = Conta_Pagar_Parcela.Parcela)-- and
                                                                                                                           --  Cpv.Id <> Conta_Pagar_Vinculo.Id)
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



create or alter view View_Conta_Pagar (
    Id,
    Id_Vinculo,
    Id_Organizacao_Origem,
    Nome_Organizacao,
    Tipo_Origem,
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
inner join Organizacao on (Conta_Pagar_Vinculo.Id_Organizacao_Origem = Organizacao.Id);



create or alter view View_Conta_Pagar (
    Id,
    Id_Vinculo,
    Id_Organizacao_Origem,
    Nome_Organizacao,
    Tipo_Origem,
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
inner join Organizacao on (Conta_Pagar_Vinculo.Id_Organizacao_Origem = Organizacao.Id);



create or alter view View_Conta_Receber (
    Id,
    Id_Vinculo,
    Id_Organizacao_Origem,
    Nome_Organizacao,
    Tipo_Origem,
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
       Fundo.Id_Organizacao as Id_Organizacao_Origem,
       Organizacao.Nome as Nome_Organizacao,
       1 as Tipo_Origem,
       Conta_Receber_Vinculo.Id_Fundo as Id_Origem_Recurso,
       'Conta_' || Conta_Receber_Vinculo.Id_Fundo as Id_Unico_Origem_Recurso,
       Fundo.Nome as Origem_Recurso,
       Conta_Receber_Parcela.Vencimento as Data,
       Conta_Receber_Parcela.Data_Recebimento,
       Conta_Receber.Forma_Pagto as Forma_Recebimento,
       case
         when Parcelas.Qtde_Parcelas = 1 then Conta_Receber.Descricao
         else Conta_Receber.Descricao || ' (' || Conta_Receber_Parcela.Parcela || '/' || Parcelas.Qtde_Parcelas || ')'
       end as Descricao,
--Valor
       case
         when Parcelas.Qtde_Parcelas = 1 then Conta_Receber_Vinculo.Valor
         else case
                when ((select count(*)
                      from Conta_Receber_Vinculo
                      where Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id) > 1) and (Conta_Receber_Vinculo.Id = (select first 1 Conta_Receber_Vinculo.Id
                                                                                                                             from Conta_Receber_Vinculo
                                                                                                                             where Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id
                                                                                                                             order by Conta_Receber_Vinculo.Id desc)) then Conta_Receber_Parcela.Valor - (select sum(
                                                                                                                                                                                                                 case
                                                                                                                                                                                                                   when Parcelas.Qtde_Parcelas = Crp.Parcela then Crv.Valor - (trunc(Crv.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                                                                                                                                                                   else trunc(Crv.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                                                                                                                                                                 end)
                                                                                                                                                                                                          from Conta_Receber_Parcela Crp
                                                                                                                                                                                                          inner join Conta_Receber Cp on (Cp.Id = Crp.Id_Conta_Receber)
                                                                                                                                                                                                          inner join Conta_Receber_Vinculo Crv on (Crv.Id_Conta_Receber = Cp.Id)
                                                                                                                                                                                                          where Crp.Id_Conta_Receber = Conta_Receber.Id and
                                                                                                                                                                                                                Crp.Parcela = Conta_Receber_Parcela.Parcela and
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
                                                             when ((select count(*)
                                                                   from Conta_Receber_Vinculo
                                                                   where Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id) > 1) and (Conta_Receber_Vinculo.Id = (select first 1 Conta_Receber_Vinculo.Id
                                                                                                                                                                          from Conta_Receber_Vinculo
                                                                                                                                                                          where Conta_Receber_Vinculo.Id_Conta_Receber = Conta_Receber.Id
                                                                                                                                                                          order by Conta_Receber_Vinculo.Id desc)) then Conta_Receber_Parcela.Valor - (select sum(
                                                                                                                                                                                                                                                              case
                                                                                                                                                                                                                                                                when Parcelas.Qtde_Parcelas = Crp.Parcela then Crv.Valor - (trunc(Crv.Valor / Parcelas.Qtde_Parcelas, 2) * (Parcelas.Qtde_Parcelas - 1))
                                                                                                                                                                                                                                                                else trunc(Crv.Valor / Parcelas.Qtde_Parcelas, 2)
                                                                                                                                                                                                                                                              end)
                                                                                                                                                                                                                                                       from Conta_Receber_Parcela Crp
                                                                                                                                                                                                                                                       inner join Conta_Receber Cp on (Cp.Id = Crp.Id_Conta_Receber)
                                                                                                                                                                                                                                                       inner join Conta_Receber_Vinculo Crv on (Crv.Id_Conta_Receber = Cp.Id)
                                                                                                                                                                                                                                                       where Crp.Id_Conta_Receber = Conta_Receber.Id and
                                                                                                                                                                                                                                                             Crp.Parcela = Conta_Receber_Parcela.Parcela and
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
inner join Organizacao on (Fundo.Id_Organizacao = Organizacao.Id);

