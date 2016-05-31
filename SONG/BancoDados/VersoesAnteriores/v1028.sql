

ALTER TABLE CONTA_RECEBER
    ADD ID_VENDA INTEGER;

alter table CONTA_RECEBER
alter ID position 1;

alter table CONTA_RECEBER
alter ID_CLIENTE_FINANCIADOR position 2;

alter table CONTA_RECEBER
alter ID_PLANO_CONTAS position 3;

alter table CONTA_RECEBER
alter ID_CONTA_CORRENTE position 4;

alter table CONTA_RECEBER
alter ID_VENDA position 5;

alter table CONTA_RECEBER
alter DESCRICAO position 6;

alter table CONTA_RECEBER
alter VALOR_TOTAL position 7;

alter table CONTA_RECEBER
alter FORMA_PAGTO position 8;

alter table CONTA_RECEBER
alter OBSERVACAO position 9;

alter table CONTA_RECEBER
alter NUMERO_DOCUMENTO position 10;



ALTER TABLE CONTA_RECEBER
ADD CONSTRAINT FK_CONTA_RECEBER_4
FOREIGN KEY (ID_VENDA)
REFERENCES VENDA(ID)
ON UPDATE CASCADE;




SET TERM ^ ;

create or alter procedure Sp_Ajusta_Saldo_Item (
    Id_Item integer)
as
declare variable Va_Qtde_Entrada numeric(15,2);
declare variable Va_Qtde_Saida numeric(15,2);
declare variable Va_Todos smallint;
declare variable Va_Id integer;
begin
  Va_Todos = 1;
  if (Id_Item <> 0) then
  begin
    Va_Todos = 0;
  end
  for select Item.Id
      from Item
      where (Item.Tipo = 0) and
            (Item.Id = :Id_Item or (:Va_Todos = 1))
      order by Item.Id
      into :Va_Id
  do
  begin
    select sum(Entrada_Item.Qtde)
    from Entrada_Item
    where Entrada_Item.Id_Item = :Va_Id
    into :Va_Qtde_Entrada;

    select sum(Saida_Item.Qtde)
    from Saida_Item
    where Saida_Item.Id_Item = :Va_Id
    into :Va_Qtde_Saida;

    update Item
    set Item.Saldo = :Va_Qtde_Entrada - :Va_Qtde_Saida
    where Item.Id = :Va_Id;

  end

  suspend;
end^

SET TERM ; ^



SET TERM ^ ;

CREATE OR ALTER procedure Sp_Ajusta_Saldo_Item (
    Id_Item integer)
as
declare variable Va_Qtde_Entrada numeric(15,2);
declare variable Va_Qtde_Saida numeric(15,2);
declare variable Va_Todos smallint;
declare variable Va_Id integer;
begin
  Va_Todos = 1;
  if (Id_Item <> 0) then
  begin
    Va_Todos = 0;
  end
  for select Item.Id
      from Item
      where ((Item.Tipo = 0) or (item.tipo is null) ) and
            (Item.Id = :Id_Item or (:Va_Todos = 1))
      order by Item.Id
      into :Va_Id
  do
  begin
    select sum(Entrada_Item.Qtde)
    from Entrada_Item
    where Entrada_Item.Id_Item = :Va_Id
    into :Va_Qtde_Entrada;

    select sum(Saida_Item.Qtde)
    from Saida_Item
    where Saida_Item.Id_Item = :Va_Id
    into :Va_Qtde_Saida;

    update Item
    set Item.Saldo = :Va_Qtde_Entrada - :Va_Qtde_Saida
    where Item.Id = :Va_Id;

  end

  suspend;
end^

SET TERM ; ^



SET TERM ^ ;

CREATE OR ALTER procedure Sp_Ajusta_Saldo_Item (
    Id_Item integer)
as
declare variable Va_Qtde_Entrada numeric(15,2);
declare variable Va_Qtde_Saida numeric(15,2);
declare variable Va_Todos smallint;
declare variable Va_Id integer;
begin
  Va_Todos = 1;
  if (Id_Item <> 0) then
  begin
    Va_Todos = 0;
  end
  for select Item.Id
      from Item
      where ((Item.Tipo = 0) or (item.tipo is null) ) and
            (Item.Id = :Id_Item or (:Va_Todos = 1))
      order by Item.Id
      into :Va_Id
  do
  begin
    select coalesce(sum(Entrada_Item.Qtde),0)
    from Entrada_Item
    where Entrada_Item.Id_Item = :Va_Id
    into :Va_Qtde_Entrada;

    select coalesce(sum(Saida_Item.Qtde),0)
    from Saida_Item
    where Saida_Item.Id_Item = :Va_Id
    into :Va_Qtde_Saida;

    update Item
    set Item.Saldo = :Va_Qtde_Entrada - :Va_Qtde_Saida
    where Item.Id = :Va_Id;

  end

  suspend;
end^

SET TERM ; ^

