unit smuFuncoesViveiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, uQuery, smuFuncoesBasico,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uTypes, Datasnap.DBClient, System.Generics.Collections,
  uClientDataSet, System.Generics.Defaults, System.DateUtils, aduna_ds_list,
  System.Math, System.Types, uUtils;

type
  TsmFuncoesViveiro = class(TsmFuncoesBasico)
    qAjusta_Saldo_Especie: TRFQuery;
    cdsPrevisaoProducao: TRFClientDataSet;
    cdsPrevisaoProducaoID: TIntegerField;
    cdsPrevisaoProducaoNOME: TStringField;
    cdsPrevisaoProducaoNOME_CIENTIFICO: TStringField;
    cdsPrevisaoProducaoFAMILIA_BOTANICA: TStringField;
    cdsPrevisaoProducaoQTDE_MUDA_PRONTA: TIntegerField;
    cdsPrevisaoProducaoQTDE_MUDA_DESENVOLVIMENTO: TIntegerField;
    cdsPrevisaoProducaoQTDE_SEMENTE_ESTOQUE: TBCDField;
    cdsPrevisaoProducaoQTDE_SEMENTE_KILO: TIntegerField;
  private

    { Private declarations }
  public
    function fpuValidarNomeMatriz(ipId: Integer; ipNome: String): Boolean;
    function fpuValidarNomeCanteiro(ipId: Integer; ipNome: String): Boolean;
    function fpuvalidarNomeCamaraFria(ipId: Integer; ipNome: String): Boolean;
    function fpuvalidarNomeTipoEspecie(ipId: Integer; ipNome: String): Boolean;
    procedure ppuValidarSemeadura(ipIdLote, ipIdSemeadura: Integer; ipQtdeSemeada: Double);

    function fpuBuscarLotesMudas(ipIdCompra: Integer): string;
    function fpuBuscarLoteMuda(ipIdCompraItem: Integer): Integer;

    function fpuBuscarLotesSementes(ipIdCompra: Integer): string;
    function fpuBuscarLoteSemente(ipIdCompraItem: Integer): Integer;

    procedure ppuAjustarSaldoEspecie(ipIdEspecie: Integer);

    function fpuCalcularPrevisaoProducaoMuda(ipEspecies: TadsObjectlist<TEspecie>; ipDataPrevisao: String): OleVariant;

    procedure ppuCalcularQuantidadeMudasMix(ipIdMixMuda: Integer);

    function fpuBuscarIdItemMuda(): Integer;
  end;

var
  smFuncoesViveiro: TsmFuncoesViveiro;

implementation

{$R *.dfm}

{ TsmBasico1 }

function TsmFuncoesViveiro.fpuBuscarIdItemMuda: Integer;
var
  vaId: Integer;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'Select item.id from item where item.tipo = 2';
      ipDataSet.Open;
      if ipDataSet.Eof then
        raise Exception.Create('Não existe nenhum item do tipo Muda cadastrado. Procure o administrador do sistema.');

      vaId := ipDataSet.FieldByName('ID').AsInteger;
    end);

  Result := vaId;
end;

function TsmFuncoesViveiro.fpuBuscarLoteMuda(ipIdCompraItem: Integer): Integer;
var
  vaId: Integer;
begin
  vaId := 0;
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select lote_Muda.id from lote_muda ' +
        ' where lote_muda.id_compra_item = :ID_COMPRA_ITEM';
      ipDataSet.ParamByName('ID_COMPRA_ITEM').AsInteger := ipIdCompraItem;
      ipDataSet.Open();
      if (not ipDataSet.Eof) then
        vaId := ipDataSet.FieldByName('ID').AsInteger;
    end);

  Result := vaId;

end;

function TsmFuncoesViveiro.fpuBuscarLoteSemente(
  ipIdCompraItem: Integer): Integer;
var
  vaId: Integer;
begin
  vaId := 0;
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select Lote_Semente.id from Lote_Semente ' +
        ' where Lote_Semente.id_compra_item = :ID_COMPRA_ITEM';
      ipDataSet.ParamByName('ID_COMPRA_ITEM').AsInteger := ipIdCompraItem;
      ipDataSet.Open();
      if (not ipDataSet.Eof) then
        vaId := ipDataSet.FieldByName('ID').AsInteger;
    end);

  Result := vaId;

end;

function TsmFuncoesViveiro.fpuBuscarLotesMudas(ipIdCompra: Integer): string;
var
  vaIds: TStringList;
begin
  vaIds := TStringList.Create();
  try
    vaIds.Delimiter := coDelimitadorPadrao;
    vaIds.StrictDelimiter := True;

    pprEncapsularConsulta(
      procedure(ipDataSet: TRFQuery)
      begin
        ipDataSet.SQL.Text := 'select lote_Muda.id from lote_muda ' +
          ' where lote_muda.id_compra_item in (select compra_item.id from compra_item where compra_item.id_compra = :ID_COMPRA)';
        ipDataSet.ParamByName('ID_COMPRA').AsInteger := ipIdCompra;
        ipDataSet.Open();
        while (not ipDataSet.Eof) do
          begin
            vaIds.Add(ipDataSet.FieldByName(TBancoDados.coId).AsString);
            ipDataSet.Next;
          end;
      end);

    Result := vaIds.DelimitedText;
  finally
    vaIds.Free;
  end;
end;

function TsmFuncoesViveiro.fpuBuscarLotesSementes(ipIdCompra: Integer): string;
var
  vaIds: TStringList;
begin
  vaIds := TStringList.Create();
  try
    vaIds.Delimiter := coDelimitadorPadrao;
    vaIds.StrictDelimiter := True;

    pprEncapsularConsulta(
      procedure(ipDataSet: TRFQuery)
      begin
        ipDataSet.SQL.Text := 'select lote_semente.id from lote_semente ' +
          ' where lote_semente.id_compra_item in (select compra_item.id from compra_item where compra_item.id_compra = :ID_COMPRA)';
        ipDataSet.ParamByName('ID_COMPRA').AsInteger := ipIdCompra;
        ipDataSet.Open();
        while (not ipDataSet.Eof) do
          begin
            vaIds.Add(ipDataSet.FieldByName(TBancoDados.coId).AsString);
            ipDataSet.Next;
          end;
      end);

    Result := vaIds.DelimitedText;
  finally
    vaIds.Free;
  end;

end;

function TsmFuncoesViveiro.fpuCalcularPrevisaoProducaoMuda(ipEspecies: TadsObjectlist<TEspecie>; ipDataPrevisao: String): OleVariant;
var
  vaEspecies: String;
  vaEspecie: TEspecie;
  vaDataSet: TRFQuery;
  vaDataAtual, vaDataPrevisao, vaDataMudaPronta, vaDataMudaGerminada: TDateTime;
  vaQtdeMudaPronta, vaQtdeMudaGerminada: Integer;

  function flGetEspecie(ipId: Integer): TEspecie;
  var
    vaEsp: TEspecie;
  begin
    for vaEsp in ipEspecies do
      begin
        if vaEsp.Id = ipId then
          Exit(vaEsp);
      end;
    Exit(nil);
  end;

begin
  if not TryStrToDate(ipDataPrevisao, vaDataPrevisao) then
    raise Exception.Create('Data inválida.');

  vaDataAtual := Date;
  for vaEspecie in ipEspecies do
    begin
      if vaEspecies = '' then
        vaEspecies := vaEspecie.Id.ToString()
      else
        vaEspecies := vaEspecies + ',' + vaEspecie.Id.ToString();
    end;

  pprCriarDataSet(vaDataSet);
  try

    if cdsPrevisaoProducao.Active then
      cdsPrevisaoProducao.EmptyDataSet
    else
      cdsPrevisaoProducao.CreateDataSet;
    // ********************CONTABILIZANDO AS MUDAS QUE SERAO GERADAS A PARTIR DAS SEMENTES QUE SERAO SEMADAS***********
    // nao posso pegar aqui a quantidad de muda em desenvolvimento  pois isso causaria uma duplicação quando
    // chegasse na parte do codigo que calcula essas mudas. Portanto, vou deixar pra contabiliar somente lá.
    vaDataSet.SQL.Text := 'select Especie.Id,' +
      '       Especie.Nome,' +
      '       Especie.Nome_Cientifico,' +
      '       familia_botanica.nome as Familia_Botanica,' +
      '       Especie.Qtde_Semente_Kilo,' +
      '       Especie.Qtde_Semente_Estoque,' +
      '       Especie.Qtde_Muda_Pronta,' +
      '       0 as Qtde_Muda_Desenvolvimento' + // nao posso pegar o valor do banco aqui pq senao vai duplicar
      ' from Especie' +
      ' inner join familia_botanica on (familia_botanica.id = especie.id_familia_botanica) ' +
      ' where especie.id in (' + vaEspecies + ')';
    vaDataSet.Open;
    while not vaDataSet.Eof do
      begin
        cdsPrevisaoProducao.Append;
        cdsPrevisaoProducaoID.AsInteger := vaDataSet.FieldByName('ID').AsInteger;
        cdsPrevisaoProducaoNOME.AsString := vaDataSet.FieldByName('NOME').AsString;
        cdsPrevisaoProducaoNOME_CIENTIFICO.AsString := vaDataSet.FieldByName('NOME_CIENTIFICO').AsString;
        cdsPrevisaoProducaoFAMILIA_BOTANICA.AsString := vaDataSet.FieldByName('FAMILIA_BOTANICA').AsString;
        cdsPrevisaoProducaoQTDE_MUDA_PRONTA.AsInteger := vaDataSet.FieldByName('QTDE_MUDA_PRONTA').AsInteger;
        cdsPrevisaoProducaoQTDE_MUDA_DESENVOLVIMENTO.AsInteger := vaDataSet.FieldByName('QTDE_MUDA_DESENVOLVIMENTO').AsInteger;
        cdsPrevisaoProducaoQTDE_SEMENTE_ESTOQUE.AsFloat := vaDataSet.FieldByName('QTDE_SEMENTE_ESTOQUE').AsInteger;
        cdsPrevisaoProducaoQTDE_SEMENTE_KILO.AsInteger := vaDataSet.FieldByName('QTDE_SEMENTE_KILO').AsInteger;

        vaEspecie := flGetEspecie(vaDataSet.FieldByName('ID').AsInteger);
        vaDataMudaGerminada := IncDay(vaDataAtual, vaEspecie.TempoGerminacao);
        vaQtdeMudaGerminada := Trunc(vaDataSet.FieldByName('QTDE_SEMENTE_ESTOQUE').AsFloat * vaDataSet.FieldByName('QTDE_SEMENTE_KILO').AsInteger);
        vaQtdeMudaGerminada := Trunc(vaQtdeMudaGerminada * (vaEspecie.TaxaGerminacao / 100));
        if vaDataMudaGerminada <= vaDataPrevisao then
          begin
            vaDataMudaPronta := IncDay(vaDataMudaGerminada, vaEspecie.TempoDesenvolvimento);
            if vaDataMudaPronta <= vaDataPrevisao then
              begin
                vaQtdeMudaPronta := Trunc(vaQtdeMudaGerminada * (vaEspecie.TaxaClassificacao / 100));
                cdsPrevisaoProducaoQTDE_MUDA_PRONTA.AsInteger := cdsPrevisaoProducaoQTDE_MUDA_PRONTA.AsInteger + vaQtdeMudaPronta;
              end
            else
              cdsPrevisaoProducaoQTDE_MUDA_DESENVOLVIMENTO.AsInteger := cdsPrevisaoProducaoQTDE_MUDA_DESENVOLVIMENTO.AsInteger + vaQtdeMudaGerminada;
          end;

        cdsPrevisaoProducao.Post;

        vaDataSet.Next;
      end;
    // ******************CONTABILIZANDO AS MUDAS QUE SERAO GERADAS A PARTIR DAS SEMENTES JA SEMEADAS***************
    vaDataSet.Close;
    vaDataSet.SQL.Text := 'with Germinadas' +
      ' as (select max(Germinacao.Data) as data,' +
      '           Germinacao.Id_Lote_Semente,' +
      '           Germinacao.Qtde_Germinada' +
      '    from Germinacao' +
      '    group by Germinacao.Id_Lote_Semente, Germinacao.Qtde_Germinada)' +
      ' ' +
      'select Lote_Semente.Id_Especie,' +
      '       Semeadura.Data,' +
      '       Semeadura.Qtde_Semeada,' +
      '       germinadas.Qtde_Germinada,' +
      '       Germinadas.Data as Data_Germinacao ' +
      ' from Lote_Semente' +
      ' inner join Semeadura on (Semeadura.Id_Lote_Semente = Lote_Semente.Id)' +
      ' left join Germinadas on (Germinadas.Id_Lote_Semente = Lote_Semente.Id)' +
      ' where Lote_Semente.Id_Especie in (' + vaEspecies + ') and' +
      '       ((Lote_Semente.status is null) or (lote_semente.status = 0)) and ' +
    // aqui vamos garantir que pegaremos somente lotes que ainda nao tem registro na tabela germinacao
    // ou que tenha mas ainda nao tenha sido finalizado a fase de germinacao e portanto nao exista o lote de mudas
      '      (Germinadas.data is null or ((select count(*)' +
      '                                  from Lote_Muda' +
      '                                  where Lote_Muda.Id_Lote_Semente = Lote_Semente.Id) = 0))';
    vaDataSet.Open;
    while not vaDataSet.Eof do
      begin
        vaEspecie := flGetEspecie(vaDataSet.FieldByName('ID_ESPECIE').AsInteger);
        if cdsPrevisaoProducao.Locate(cdsPrevisaoProducaoID.FieldName, vaEspecie.Id, []) then
          begin
            cdsPrevisaoProducao.Edit;
            if not vaDataSet.FieldByName('DATA_GERMINACAO').IsNull then
              vaDataMudaGerminada := vaDataSet.FieldByName('DATA_GERMINACAO').AsDateTime
            else
              vaDataMudaGerminada := IncDay(vaDataSet.FieldByName('DATA').AsDateTime, vaEspecie.TempoGerminacao);
            // se ja germinou nao vou fazer conta alguma
            if vaDataSet.FieldByName('QTDE_GERMINADA').AsInteger > 0 then
              vaQtdeMudaGerminada := vaDataSet.FieldByName('QTDE_GERMINADA').AsInteger
            else
              vaQtdeMudaGerminada := Trunc((cdsPrevisaoProducaoQTDE_SEMENTE_KILO.AsInteger * vaDataSet.FieldByName('QTDE_SEMEADA').AsFloat) *
                (vaEspecie.TaxaGerminacao / 100));

            vaDataMudaPronta := IncDay(vaDataMudaGerminada, vaEspecie.TempoDesenvolvimento);
            if vaDataMudaPronta <= vaDataPrevisao then
              begin
                vaQtdeMudaPronta := Trunc(vaQtdeMudaGerminada * (vaEspecie.TaxaClassificacao / 100));
                cdsPrevisaoProducaoQTDE_MUDA_PRONTA.AsInteger := cdsPrevisaoProducaoQTDE_MUDA_PRONTA.AsInteger + vaQtdeMudaPronta;
              end
            else
              cdsPrevisaoProducaoQTDE_MUDA_DESENVOLVIMENTO.AsInteger := cdsPrevisaoProducaoQTDE_MUDA_DESENVOLVIMENTO.AsInteger + vaQtdeMudaGerminada;

            cdsPrevisaoProducao.Post;
          end;

        vaDataSet.Next;
      end;

    // ******************POR FIM VAMOS CONTABILIZAR AS MUDAS JA EM DESENVOLVIMENTO********

    vaDataSet.Close;
    vaDataSet.SQL.Text := 'select Lote_Muda.Id_Especie,' +
      '       (select first 1 classificacao.qtde' +
      '                  from classificacao' +
      '                  where classificacao.id_lote_muda = lote_muda.Id' +
      '                  order by classificacao.Data desc) AS Qtde_Classificada, ' +
      '       (Lote_Muda.Qtde_Inicial - coalesce((select sum(Saida_Item.Qtde)' +
      '                                  from Saida_Item' +
      '                                  where Saida_Item.Id_Lote_Muda = Lote_Muda.Id),0)) as Saldo,' +
      '       Lote_Muda.Data' +
      ' from Lote_Muda' +
      ' where Lote_Muda.Id_Especie in (' + vaEspecies + ') and' +
      '       Lote_Muda.Status = 0';

    vaDataSet.Open;
    while not vaDataSet.Eof do
      begin
        vaEspecie := flGetEspecie(vaDataSet.FieldByName('ID_ESPECIE').AsInteger);
        if cdsPrevisaoProducao.Locate(cdsPrevisaoProducaoID.FieldName, vaEspecie.Id, []) then
          begin
            cdsPrevisaoProducao.Edit;
            vaQtdeMudaPronta := Trunc(vaDataSet.FieldByName('SALDO').AsInteger * (vaEspecie.TaxaClassificacao / 100));
            // Se apos o calculo a qtde de muda pronta ainda for maior do que a quant já classificada então significa q
            // a taxa de classificacao nao funcionou, porntato vou pegar o valor da qtde_classficada
            if (vaDataSet.FieldByName('QTDE_CLASSIFICADA').AsInteger <> 0) and (vaQtdeMudaPronta > vaDataSet.FieldByName('QTDE_CLASSIFICADA').AsInteger) then
              vaQtdeMudaPronta := vaDataSet.FieldByName('QTDE_CLASSIFICADA').AsInteger;

            vaDataMudaPronta := IncDay(vaDataSet.FieldByName('DATA').AsDateTime, vaEspecie.TempoDesenvolvimento);
            if vaDataMudaPronta <= vaDataPrevisao then
              cdsPrevisaoProducaoQTDE_MUDA_PRONTA.AsInteger := cdsPrevisaoProducaoQTDE_MUDA_PRONTA.AsInteger + vaQtdeMudaPronta
            else // nao vai da tempo de ficarem prontas, entao vou pegar a quantidade ja classificada ate o momento
              begin
                if vaDataSet.FieldByName('QTDE_CLASSIFICADA').IsNull then
                  cdsPrevisaoProducaoQTDE_MUDA_DESENVOLVIMENTO.AsInteger := cdsPrevisaoProducaoQTDE_MUDA_DESENVOLVIMENTO.AsInteger +
                    vaDataSet.FieldByName('SALDO').AsInteger
                else
                  cdsPrevisaoProducaoQTDE_MUDA_DESENVOLVIMENTO.AsInteger := cdsPrevisaoProducaoQTDE_MUDA_DESENVOLVIMENTO.AsInteger +
                    vaDataSet.FieldByName('QTDE_CLASSIFICADA').AsInteger;
              end;

            cdsPrevisaoProducao.Post;
          end;

        vaDataSet.Next;
      end;
    Result := cdsPrevisaoProducao.Data;
  finally
    vaDataSet.Close;
    vaDataSet.Free;
  end;
end;

function TsmFuncoesViveiro.fpuvalidarNomeCamaraFria(ipId: Integer;
ipNome: String): Boolean;
begin
  Result := fprValidarCampoUnico('CAMARA_FRIA', 'NOME', ipId, ipNome);
end;

function TsmFuncoesViveiro.fpuValidarNomeCanteiro(ipId: Integer;
ipNome: String): Boolean;
begin
  Result := fprValidarCampoUnico('CANTEIRO', 'NOME', ipId, ipNome);
end;

function TsmFuncoesViveiro.fpuValidarNomeMatriz(ipId: Integer;
ipNome: String): Boolean;
begin
  Result := fprValidarCampoUnico('MATRIZ', 'NOME', ipId, ipNome);
end;

function TsmFuncoesViveiro.fpuvalidarNomeTipoEspecie(ipId: Integer;
ipNome: String): Boolean;
begin
  Result := fprValidarCampoUnico('TIPO_ESPECIE', 'NOME', ipId, ipNome);
end;

procedure TsmFuncoesViveiro.ppuAjustarSaldoEspecie(ipIdEspecie: Integer);
begin
  if ipIdEspecie <> 0 then
    qAjusta_Saldo_Especie.ParamByName('ID_ESPECIE').AsInteger := ipIdEspecie
  else
    qAjusta_Saldo_Especie.ParamByName('ID_ESPECIE').Clear();

  qAjusta_Saldo_Especie.ExecSQL;
  qAjusta_Saldo_Especie.Connection.Commit;
end;

procedure TsmFuncoesViveiro.ppuCalcularQuantidadeMudasMix(
  ipIdMixMuda: Integer);
var
  vaDataSet, vaDataSetLote: TRFQuery;
  vaQtdeTotalMudas, vaQtdeCalculada, vaQtdeSomada, vaQtdeIncluir: Integer;
  vaPercentual: Double;
begin
  vaQtdeTotalMudas := 0;
  vaQtdeSomada := 0;

  pprCriarDataSet(vaDataSet);
  pprCriarDataSet(vaDataSetLote);
  try
    try
      Connection.StartTransaction;

      vaDataSet.SQL.Text := 'select Mix_Muda.Qtde_Muda,' +
        '       Mix_Muda.Qtde_Muda_Rocambole,' +
        '       Mix_Muda_Especie.Id,' +
        '       Mix_Muda_Especie.Id_Especie, ' +
        '       Especie.Qtde_Muda_Pronta, ' +
        '       Especie.nome as NOME_ESPECIE ' +
        '   from Mix_Muda_Especie' +
        '   inner join Mix_Muda on(Mix_Muda.Id = Mix_Muda_Especie.id_mix_muda)' +
        '   inner join Especie on(Especie.Id = Mix_Muda_Especie.Id_Especie)' +
        '   where Mix_Muda_Especie.id_mix_muda = :id_mix_muda ' +
        '   order by Especie.Qtde_Muda_Pronta'; // as maiores devem vir por ultimo
      vaDataSet.ParamByName('ID_MIX_MUDA').AsInteger := ipIdMixMuda;
      vaDataSet.Open();

      vaDataSet.First;
      while not vaDataSet.Eof do
        begin
          Inc(vaQtdeTotalMudas, vaDataSet.FieldByName('Qtde_Muda_Pronta').AsInteger);
          vaDataSet.Next;
        end;

      if vaQtdeTotalMudas < vaDataSet.FieldByName('Qtde_Muda').AsInteger then
        raise Exception.Create('As espécies selecionadas não possuem mudas suficientes para a quantidade de saidas.');

      vaDataSet.First;
      while not vaDataSet.Eof do
        begin
          vaPercentual := vaDataSet.FieldByName('Qtde_Muda_Pronta').AsInteger / vaQtdeTotalMudas;
          if vaDataSet.RecNo = vaDataSet.RecordCount then // ultimo registro
            vaQtdeCalculada := vaDataSet.FieldByName('Qtde_Muda').AsInteger - vaQtdeSomada
          else
            vaQtdeCalculada := Trunc(vaDataSet.FieldByName('Qtde_Muda').AsInteger * vaPercentual);

          // se a quantidade em estoque for muito baixa em relacao ao total pode dar valores muitos pequenos, por isso
          // tenho essa condicao para garantir pelo menos uma muda
          if vaQtdeCalculada < 1 then
            vaQtdeCalculada := 1;

          if (vaQtdeSomada + vaQtdeCalculada) > vaDataSet.FieldByName('QTDE_MUDA').AsInteger then
            vaQtdeCalculada := vaDataSet.FieldByName('QTDE_MUDA').AsInteger - vaQtdeSomada;

          Inc(vaQtdeSomada, vaQtdeCalculada);

          // vamos deletar todos registros filhos
          Connection.ExecSQL('delete from mix_muda_especie_lote where mix_muda_especie_lote.id_mix_muda_especie = :ID',
            [vaDataSet.FieldByName('ID').AsInteger]);

          // VAMOS PEGAR TODOS OS LOTES DE MUDAS DESSA ESPECIE QUE POSSUEM MUDAS PRONTAS
          vaDataSetLote.Close;
          vaDataSetLote.SQL.Text := 'select Lote_Muda.Id,' +
            '       Lote_Muda.Saldo' +
            ' from Lote_Muda' +
            ' where Lote_Muda.Id_Especie = :Id_Especie and' +
            '       Lote_Muda.Status = 1';
          vaDataSetLote.ParamByName('ID_ESPECIE').AsInteger := vaDataSet.FieldByName('ID_ESPECIE').AsInteger;
          vaDataSetLote.Open();
          if vaDataSetLote.Eof then
            raise Exception.Create('A espécie ' + vaDataSet.FieldByName('NOME_ESPECIE').AsString + ' não possui nenhum lote de muda pronto para plantio.');

          vaQtdeIncluir := vaQtdeCalculada;
          while vaQtdeCalculada > 0 do
            begin
              if vaDataSetLote.FieldByName('SALDO').AsInteger < vaQtdeCalculada then
                vaQtdeIncluir := vaDataSetLote.FieldByName('SALDO').AsInteger;

              Connection.ExecSQL('insert into Mix_Muda_Especie_Lote (Mix_Muda_Especie_Lote.Id, Mix_Muda_Especie_Lote.Id_Mix_Muda_Especie,' +
                '                                   Mix_Muda_Especie_Lote.Id_Lote_Muda, Mix_Muda_Especie_Lote.Qtde)' +
                ' values (next value for Gen_Mix_Muda_Especie_Lote, :Id_Mix_Muda_Especie, :Id_Lote_Muda, :Qtde)',
                [vaDataSet.FieldByName('ID').AsInteger, vaDataSetLote.FieldByName('ID').AsInteger, vaQtdeIncluir]);

              vaQtdeCalculada := vaQtdeCalculada - vaQtdeIncluir;
              vaDataSetLote.Next;
            end;

          vaDataSet.Next;
        end;
      Connection.Commit;
    except
      if Connection.InTransaction then
        Connection.Rollback;
    end;
  finally
    vaDataSet.Free;
    vaDataSetLote.Free;
  end;
end;

procedure TsmFuncoesViveiro.ppuValidarSemeadura(ipIdLote, ipIdSemeadura: Integer;
ipQtdeSemeada: Double);
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select lote_Semente.qtde_armazenada, ' +
        '                             semeadura.qtde_semeada ' +
        '                       from lote_Semente ' +
        '                      left join semeadura on (semeadura.id=:ID_SEMEADURA) ' +
        '                      where lote_Semente.id =:id';
      ipDataSet.ParamByName('ID').AsInteger := ipIdLote;
      ipDataSet.ParamByName('ID_SEMEADURA').AsInteger := ipIdSemeadura;
      ipDataSet.Open();
      if ipDataSet.Eof then
        raise Exception.Create('Lote inválido.');

      // Faço a soma para os caso onde estiver alterando, pois nesse caso tenho que desconsiderar o valor já cadastrado para a semeadura que esta sendo alterada
      if System.Math.CompareValue(ipDataSet.FieldByName('QTDE_ARMAZENADA').AsFloat + ipDataSet.FieldByName('QTDE_SEMEADA').AsFloat, ipQtdeSemeada) = LessThanValue
      then
        raise Exception.Create('Quantidade semeada não pode ser superior a quantidade em estoque para este lote.');

    end);
end;

end.
