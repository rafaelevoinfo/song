unit smuEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, dmuPrincipal,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uQuery, uUtils, uClientDataSet, uSQLGenerator,
  Datasnap.Provider, System.Generics.Collections, Datasnap.DBClient;

type
  TsmEstoque = class(TsmBasico)
    qItem: TRFQuery;
    qItemID: TIntegerField;
    qItemNOME: TStringField;
    qItemTIPO: TSmallintField;
    qEntrada: TRFQuery;
    qEntradaID: TIntegerField;
    qEntradaDATA: TSQLTimeStampField;
    qItemUNIDADE: TStringField;
    qSolicitacao_Compra: TRFQuery;
    qSolicitacao_CompraID: TIntegerField;
    qSolicitacao_CompraID_PESSOA_SOLICITOU: TIntegerField;
    qSolicitacao_CompraID_PESSOA_ANALISOU: TIntegerField;
    qSolicitacao_CompraDATA: TSQLTimeStampField;
    qSolicitacao_CompraDATA_ANALISE: TSQLTimeStampField;
    qSolicitacao_CompraSTATUS: TSmallintField;
    qSolicitacao_CompraSOLICITANTE: TStringField;
    qSolicitacao_CompraRESPONSAVEL_ANALISE: TStringField;
    qSolicitacao_Compra_Item: TRFQuery;
    qSolicitacao_Compra_ItemID: TIntegerField;
    qSolicitacao_Compra_ItemID_SOLICITACAO_COMPRA: TIntegerField;
    qSolicitacao_Compra_ItemID_ITEM: TIntegerField;
    qSolicitacao_Compra_ItemID_ESPECIE: TIntegerField;
    qSolicitacao_Compra_ItemQTDE: TBCDField;
    qSolicitacao_Compra_ItemNOME_ITEM: TStringField;
    qSolicitacao_Compra_ItemESPECIE: TStringField;
    qSolicitacao_CompraOBSERVACAO: TStringField;
    qCompra: TRFQuery;
    qCompraID: TIntegerField;
    qCompraID_FORNECEDOR: TIntegerField;
    qCompraID_PESSOA_COMPROU: TIntegerField;
    qCompraDATA: TSQLTimeStampField;
    qCompraSTATUS_ENTREGA: TSmallintField;
    qCompraVALOR_FRETE: TBCDField;
    qCompraCODIGO_RASTREIO: TStringField;
    qCompraDESCRICAO: TStringField;
    qCompraFORNECEDOR: TStringField;
    qCompraPESSOA_COMPROU: TStringField;
    qCompra_Item: TRFQuery;
    qCompra_ItemID: TIntegerField;
    qCompra_ItemID_COMPRA: TIntegerField;
    qCompra_ItemID_ITEM: TIntegerField;
    qCompra_ItemID_ESPECIE: TIntegerField;
    qCompra_ItemQTDE: TBCDField;
    qCompra_ItemVALOR_UNITARIO: TBCDField;
    qCompra_ItemITEM: TStringField;
    qCompra_ItemESPECIE: TStringField;
    qCompraVALOR_TOTAL: TBCDField;
    qEntrada_Item: TRFQuery;
    qEntrada_ItemID: TIntegerField;
    qEntrada_ItemID_ENTRADA: TIntegerField;
    qEntrada_ItemID_ITEM: TIntegerField;
    qEntrada_ItemQTDE: TBCDField;
    qEntrada_ItemNOME_ITEM: TStringField;
    qCompra_ItemTIPO_ITEM: TSmallintField;
    qCompraID_SOLICITACAO_COMPRA: TIntegerField;
    qEntradaID_PESSOA: TIntegerField;
    qEntradaPESSOA: TStringField;
    qEntrada_ItemID_COMPRA_ITEM: TIntegerField;
    qSaida: TRFQuery;
    qSaidaID: TIntegerField;
    qSaidaDATA: TSQLTimeStampField;
    qSaidaTIPO: TSmallintField;
    qSaida_Item: TRFQuery;
    qSaida_ItemID: TIntegerField;
    qSaida_ItemID_SAIDA: TIntegerField;
    qSaida_ItemID_ITEM: TIntegerField;
    qSaida_ItemID_LOTE_SEMENTE: TIntegerField;
    qSaida_ItemID_LOTE_MUDA: TIntegerField;
    qSaida_ItemQTDE: TBCDField;
    qSaida_ItemNOME_ITEM: TStringField;
    qSaida_ItemLOTE_SEMENTE: TStringField;
    qSaida_ItemLOTE_MUDA: TStringField;
    qSaida_ItemID_ESPECIE: TIntegerField;
    qSaida_ItemNOME_ESPECIE: TStringField;
    qItemSALDO: TBCDField;
    qVenda: TRFQuery;
    qVenda_Item: TRFQuery;
    qVendaID: TIntegerField;
    qVendaID_CLIENTE: TIntegerField;
    qVendaID_PESSOA_VENDEU: TIntegerField;
    qVendaDATA: TSQLTimeStampField;
    qVendaDESCRICAO: TIntegerField;
    qVenda_ItemID: TIntegerField;
    qVenda_ItemID_VENDA: TIntegerField;
    qVenda_ItemID_ITEM: TIntegerField;
    qVenda_ItemID_ESPECIE: TIntegerField;
    qVenda_ItemQTDE: TBCDField;
    qVenda_ItemVALOR_UNITARIO: TBCDField;
    qVendaCLIENTE: TStringField;
    qVendaVENDEDOR: TStringField;
    qVenda_ItemITEM: TStringField;
    qVenda_ItemESPECIE: TStringField;
    qVendaVALOR_TOTAL: TBCDField;
    qSaida_ItemID_VENDA_ITEM: TIntegerField;
    qVenda_ItemID_LOTE_SEMENTE: TIntegerField;
    qVenda_ItemLOTE_SEMENTE: TStringField;
    qVenda_ItemID_LOTE_MUDA: TIntegerField;
    qVenda_ItemLOTE_MUDA: TStringField;
    qSaida_ItemUNIDADE: TStringField;
    qVenda_ItemUNIDADE: TStringField;
    qSaida_ItemCALC_QTDE: TStringField;
    qVenda_ItemCALC_QTDE: TStringField;
    qLocal_Uso: TRFQuery;
    qLocal_UsoID: TIntegerField;
    qLocal_UsoNOME: TStringField;
    qSaidaID_LOCAL_USO: TIntegerField;
    qSaidaLOCAL_USO: TStringField;
    dspqSaida: TDataSetProvider;
    dspqSaida_Item: TDataSetProvider;
    qItem_Patrimonio: TRFQuery;
    qPatrimonio: TRFQuery;
    qItem_PatrimonioID: TIntegerField;
    qItem_PatrimonioNOME: TStringField;
    qItem_PatrimonioATIVO: TSmallintField;
    qItem_PatrimonioTAXA_DEPRECIACAO_ANUAL: TIntegerField;
    qPatrimonioID: TIntegerField;
    qPatrimonioID_ITEM_PATRIMONIO: TIntegerField;
    qPatrimonioNOME_ITEM: TStringField;
    qPatrimonioDATA_AQUISICAO: TSQLTimeStampField;
    qPatrimonioIDENTIFICACAO: TStringField;
    qPatrimonioMARCA: TStringField;
    qPatrimonioVALOR_INICIAL: TBCDField;
    qPatrimonioTAXA_DEPRECIACAO_ANUAL: TIntegerField;
    qPatrimonioLOCALIZACAO: TStringField;
    qPatrimonioNOTA_FISCAL: TStringField;
    qPatrimonioSTATUS: TSmallintField;
    qPatrimonioCALC_VALOR_ATUAL: TBCDField;
    qPatrimonioMODELO: TStringField;
    qPatrimonioOBSERVACAO: TStringField;
    procedure qSaida_ItemCalcFields(DataSet: TDataSet);
    procedure qVenda_ItemCalcFields(DataSet: TDataSet);
    procedure dspqSaidaAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
    procedure dspqSaidaBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
      var Applied: Boolean);
    procedure DSServerModuleDestroy(Sender: TObject);
    procedure dspqSaida_ItemAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
    procedure qPatrimonioCalcFields(DataSet: TDataSet);
  private
    FIdsEspecies: TList<Integer>;
  protected
    function fprMontarWhere(ipTabela, ipWhere: string; ipParam: TParam): string; override;
    { Public declarations }
  end;

var
  smEstoque: TsmEstoque;

implementation

{$R *.dfm}

{ TsmEstoque }

procedure TsmEstoque.dspqSaidaAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
var
  vaIdEspecie: Integer;
begin
  inherited;
  if UpdateKind = ukDelete then
    begin
      if Assigned(FIdsEspecies) and (FIdsEspecies.Count > 0) then
        begin
          for vaIdEspecie in FIdsEspecies do
            begin
              dmPrincipal.Connection.ExecSQL('execute procedure sp_ajusta_saldo_especie(' +
                vaIdEspecie.ToString + ',1,1)');
            end;

          FIdsEspecies.Clear;

          dmPrincipal.Connection.Commit;
        end;
    end;

  pprAfterUpdateRecord(Sender, SourceDS, DeltaDS, UpdateKind);
end;

procedure TsmEstoque.dspqSaidaBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
begin
  inherited;
  if UpdateKind = ukDelete then
    begin
      if not Assigned(FIdsEspecies) then
        FIdsEspecies := TList<Integer>.Create
      else
        FIdsEspecies.Clear;

      qAux.Close;
      qAux.sql.Text := 'Select saida_item.id_especie ' +
        ' from saida_item ' +
        ' where saida_item.id_especie is not null and ' +
        '       saida_item.id_saida =' + VarToStr(DeltaDS.FieldByName('ID').OldValue);
      qAux.Open;
      while not qAux.Eof do
        begin
          FIdsEspecies.Add(qAux.FieldByName('ID_ESPECIE').AsInteger);
          qAux.Next;
        end;
    end;
end;

procedure TsmEstoque.dspqSaida_ItemAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
  inherited;
  if ((Not VarIsNull(DeltaDS.FieldByName('ID_ESPECIE').NewValue)) and (DeltaDS.FieldByName('ID_ESPECIE').NewValue <> Unassigned)) or
    ((Not VarIsNull(DeltaDS.FieldByName('ID_ESPECIE').OldValue)) and (DeltaDS.FieldByName('ID_ESPECIE').OldValue <> Unassigned))
  then
    begin
      if (UpdateKind = ukModify) and (Not VarIsNull(DeltaDS.FieldByName('ID_ESPECIE').NewValue)) and
        (DeltaDS.FieldByName('ID_ESPECIE').NewValue <> Unassigned) then
        begin
          if (Not VarIsNull(DeltaDS.FieldByName('ID_ESPECIE').OldValue)) and (DeltaDS.FieldByName('ID_ESPECIE').OldValue <> Unassigned) then
            begin
              dmPrincipal.Connection.ExecSQL('execute procedure sp_ajusta_saldo_especie(' +
                VarToStr(DeltaDS.FieldByName('ID_ESPECIE').OldValue) + ',1,1)');
            end;
          dmPrincipal.Connection.ExecSQL('execute procedure sp_ajusta_saldo_especie(' +
            VarToStr(DeltaDS.FieldByName('ID_ESPECIE').NewValue) + ',1,1)');
        end
      else
        dmPrincipal.Connection.ExecSQL('execute procedure sp_ajusta_saldo_especie(' +
          VarToStr(DeltaDS.FieldByName('ID_ESPECIE').OldValue) + ',1,1)');

      dmPrincipal.Connection.Commit;
    end;

  pprAfterUpdateRecord(Sender, SourceDS, DeltaDS, UpdateKind);
end;

procedure TsmEstoque.DSServerModuleDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(FIdsEspecies) then
    FreeAndNil(FIdsEspecies);
end;

function TsmEstoque.fprMontarWhere(ipTabela, ipWhere: string; ipParam: TParam): string;
var
  vaValor, vaOperador: string;
begin
  Result := inherited;
  TUtils.ppuExtrairValorOperadorParametro(ipParam.Text, vaValor, vaOperador, TParametros.coDelimitador);
  if ipTabela = 'ITEM' then
    begin
      if ipParam.Name = TParametros.coTipo then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'TIPO', vaValor.ToInteger, vaOperador);
    end
  else if ipTabela = 'ENTRADA' then
    begin
      if ipParam.Name = TParametros.coItem then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'ENTRADA_ITEM', 'ID_ITEM', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coCompra then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'COMPRA_ITEM', 'ID_COMPRA', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coTipoItem then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'ITEM', 'TIPO', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coData then
        Result := TSQLGenerator.fpuFilterData(Result, ipTabela, 'DATA', TUtils.fpuExtrairData(vaValor, 0), TUtils.fpuExtrairData(vaValor, 1),
          vaOperador);
    end
  else if (ipTabela = 'SOLICITACAO_COMPRA') then
    begin
      if ipParam.Name = TParametros.coData then
        Result := TSQLGenerator.fpuFilterData(Result, ipTabela, 'DATA', TUtils.fpuExtrairData(vaValor, 0), TUtils.fpuExtrairData(vaValor, 1),
          vaOperador)
      else if ipParam.Name = TParametros.coSolicitante then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_PESSOA_SOLICITOU', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coResponsavelAnalise then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_PESSOA_ANALISOU', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coStatus then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'STATUS', TUtils.fpuConverterStringToArrayInteger(vaValor), vaOperador)
      else if ipParam.Name = TParametros.coItem then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'SOLICITACAO_COMPRA_ITEM', 'ID_ITEM', vaValor.ToInteger, vaOperador)
    end
  else if (ipTabela = 'COMPRA') then
    begin
      if ipParam.Name = TParametros.coData then
        Result := TSQLGenerator.fpuFilterData(Result, ipTabela, 'DATA', TUtils.fpuExtrairData(vaValor, 0), TUtils.fpuExtrairData(vaValor, 1),
          vaOperador)
      else if ipParam.Name = TParametros.coComprador then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_PESSOA_COMPROU', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coStatusEntrega then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'STATUS_ENTREGA', TUtils.fpuConverterStringToArrayInteger(vaValor), vaOperador)
      else if ipParam.Name = TParametros.coItem then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'COMPRA_ITEM', 'ID_ITEM', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coCodigoRastreio then
        Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'CODIGO_RASTREIO', vaValor, vaOperador)
      else if ipParam.Name = TParametros.coFornecedor then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_FORNECEDOR', vaValor.ToInteger, vaOperador)
    end
  else if (ipTabela = 'SAIDA') then
    begin
      if ipParam.Name = TParametros.coData then
        Result := TSQLGenerator.fpuFilterData(Result, ipTabela, 'DATA', TUtils.fpuExtrairData(vaValor, 0), TUtils.fpuExtrairData(vaValor, 1),
          vaOperador)
      else if ipParam.Name = TParametros.coTipo then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'TIPO', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coVenda then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'VENDA_ITEM', 'ID_VENDA', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coItem then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'SAIDA_ITEM', 'ID_ITEM', vaValor.ToInteger, vaOperador);

    end
  else if (ipTabela = 'ITEM_PATRIMONIO') then
    begin
      if ipParam.Name = TParametros.coNome then
        Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'NOME', vaValor, vaOperador);
    end
  else if (ipTabela = 'PATRIMONIO') then
    begin
      if ipParam.Name = TParametros.coItem then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_ITEM_PATRIMONIO', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coData then
        Result := TSQLGenerator.fpuFilterData(Result, ipTabela, 'DATA_AQUISICAO', TUtils.fpuExtrairData(vaValor, 0), TUtils.fpuExtrairData(vaValor, 1),
          vaOperador)
      else if ipParam.Name = TParametros.coIdentificacao then
        Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'IDENTIFICACAO', vaValor, vaOperador)
      else if ipParam.Name = TParametros.coStatus then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'STATUS', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coLocalizacao then
        Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'LOCALIZACAO', vaValor, vaOperador)
      else if ipParam.Name = TParametros.coNotaFiscal then
        Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'NOTA_FISCAL', vaValor, vaOperador)
    end
end;

procedure TsmEstoque.qPatrimonioCalcFields(DataSet: TDataSet);
begin
  inherited;
  qPatrimonioCALC_VALOR_ATUAL.AsFloat := TUtils.fpuCalcularDepreciacao(qPatrimonioDATA_AQUISICAO.AsDateTime, qPatrimonioVALOR_INICIAL.AsFloat,
    qPatrimonioTAXA_DEPRECIACAO_ANUAL.AsInteger);
end;

procedure TsmEstoque.qSaida_ItemCalcFields(DataSet: TDataSet);
begin
  inherited;
  qSaida_ItemCALC_QTDE.AsString := FormatFloat(',0.00', qSaida_ItemQTDE.AsFloat) + ' ' + qSaida_ItemUNIDADE.AsString;
end;

procedure TsmEstoque.qVenda_ItemCalcFields(DataSet: TDataSet);
begin
  inherited;
  qVenda_ItemCALC_QTDE.AsString := FormatFloat(',0.00', qVenda_ItemQTDE.AsFloat) + ' ' + qVenda_ItemUNIDADE.AsString;
end;

end.
