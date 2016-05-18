unit fSaida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrudMasterDetail, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, System.Actions, Vcl.ActnList,
  cxSplitter, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxGroupBox,
  cxRadioGroup, Vcl.StdCtrls, cxDropDownEdit, cxImageComboBox, cxTextEdit,
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuEstoque, uTypes,
  System.DateUtils, System.TypInfo, uControleAcesso, dmuLookup, cxDBEdit,
  cxCalc, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, uClientDataSet,
  uExceptions, dmuPrincipal, uUtils, System.Generics.Collections;

type
  TfrmSaida = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_VENDA: TcxGridDBColumn;
    viewRegistrosDATA: TcxGridDBColumn;
    viewRegistrosTIPO: TcxGridDBColumn;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_SAIDA: TcxGridDBColumn;
    viewRegistrosDetailID_ITEM: TcxGridDBColumn;
    viewRegistrosDetailID_LOTE_SEMENTE: TcxGridDBColumn;
    viewRegistrosDetailID_LOTE_MUDA: TcxGridDBColumn;
    viewRegistrosDetailQTDE: TcxGridDBColumn;
    viewRegistrosDetailNOME_ITEM: TcxGridDBColumn;
    viewRegistrosDetailLOTE_SEMENTE: TcxGridDBColumn;
    viewRegistrosDetailLOTE_MUDA: TcxGridDBColumn;
    Label4: TLabel;
    EditDataSaida: TcxDBDateEdit;
    cbTipoSaida: TcxDBImageComboBox;
    Label3: TLabel;
    Label5: TLabel;
    cbItem: TcxDBLookupComboBox;
    Label6: TLabel;
    EditQtde: TcxDBCalcEdit;
    lbUnidade: TLabel;
    pnEspecieLotes: TPanel;
    pnLoteSemente: TPanel;
    pnLoteMuda: TPanel;
    lb1: TLabel;
    cbLoteSemente: TcxDBLookupComboBox;
    Label7: TLabel;
    cbLoteMuda: TcxDBLookupComboBox;
    cbPesquisaItem: TcxLookupComboBox;
    cbPesquisaTipoSaida: TcxImageComboBox;
    Label8: TLabel;
    cbPesquisaEspecie: TcxLookupComboBox;
    pnEspecie: TPanel;
    cbEspecie: TcxDBLookupComboBox;
    lb2: TLabel;
    viewRegistrosDetailID_ESPECIE: TcxGridDBColumn;
    viewRegistrosDetailNOME_ESPECIE: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure cbItemPropertiesEditValueChanged(Sender: TObject);
    procedure cbEspeciePropertiesEditValueChanged(Sender: TObject);
  private
    dmEstoque: TdmEstoque;
    dmLookup: TdmLookup;
    procedure ppvConfigurarEdits;
    procedure ppvCarregarLotes;
  protected
    procedure pprValidarPesquisa; override;
    function fprConfigurarControlesPesquisa: TWinControl; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    procedure pprBeforeSalvarDetail; override;
    procedure pprExecutarExcluirDetail(ipId: Integer); override;
    procedure pprExecutarExcluir(ipId: Integer; ipAcao: TAcaoTela); override;

    function fprGetPermissao: string; override;

    procedure pprValidarDadosDetail; override;
    procedure pprExecutarSalvarDetail; override;
  public
    procedure ppuIncluirDetail; override;
    procedure ppuIncluir; override;
    procedure ppuAlterarDetail(ipId: Integer); override;

  public const
    coPesquisaItem = 5;
    coPesquisaTipo = 6;
    coPesquisaVenda = 7;

  end;

var
  frmSaida: TfrmSaida;

implementation


{$R *.dfm}


procedure TfrmSaida.pprExecutarExcluir(ipId: Integer; ipAcao: TAcaoTela);
var
  vaIdsEspeciesSementes, vaIdsItem: TDictionary<Integer, Double>;
  vaIdsEspeciesMudas:TDictionary<Integer, Integer>;
  vaId: Integer;
begin
  vaIdsEspeciesSementes := TDictionary<Integer, Double>.Create;
  vaIdsEspeciesMudas := TDictionary<Integer, Integer>.Create;
  vaIdsItem := TDictionary<Integer, Double>.Create;
  try
    TUtils.ppuPercorrerCds(dmEstoque.cdsSaida_Item,
      procedure
      begin
        if (dmEstoque.cdsSaida_ItemID_LOTE_SEMENTE.AsInteger <> 0) then
          begin
            if not vaIdsEspeciesSementes.ContainsKey(dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger) then
              vaIdsEspeciesSementes.Add(dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger, 0);

            vaIdsEspeciesSementes.Items[dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger] := vaIdsEspeciesSementes.Items
              [dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger] + dmEstoque.cdsSaida_ItemQTDE.AsFloat;
          end
        else if dmEstoque.cdsSaida_ItemID_LOTE_MUDA.AsInteger <> 0 then
          begin
            if not vaIdsEspeciesMudas.ContainsKey(dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger) then
              vaIdsEspeciesMudas.Add(dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger, 0);

            vaIdsEspeciesMudas.Items[dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger] := vaIdsEspeciesMudas.Items
              [dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger] + dmEstoque.cdsSaida_ItemQTDE.AsInteger;
          end
        else
          begin
            if not vaIdsItem.ContainsKey(dmEstoque.cdsSaida_ItemID_ITEM.AsInteger) then
              vaIdsItem.Add(dmEstoque.cdsSaida_ItemID_ITEM.AsInteger, 0);

            vaIdsItem.Items[dmEstoque.cdsSaida_ItemID_ITEM.AsInteger] := vaIdsItem.Items
              [dmEstoque.cdsSaida_ItemID_ITEM.AsInteger] + dmEstoque.cdsSaida_ItemQTDE.AsFloat;
          end;
      end);

    inherited;

    for vaId in vaIdsEspeciesSementes.Keys do
      begin
        dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeSementeEstoque(vaId, 0, 0, vaIdsEspeciesSementes.Items[vaId]);
      end;
    for vaId in vaIdsEspeciesMudas.Keys do
      begin
        dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeMudaEstoque(vaId, 0, 0, vaIdsEspeciesMudas.Items[vaId]);
      end;
    for vaId in vaIdsItem.Keys do
      begin
        dmPrincipal.FuncoesEstoque.ppuAtualizarSaldoItem(vaId, 0, vaIdsItem.Items[vaId]);
      end;
  finally
    vaIdsEspeciesSementes.Free;
    vaIdsEspeciesMudas.Free;
    vaIdsItem.Free;
  end;
end;

procedure TfrmSaida.pprExecutarExcluirDetail(ipId: Integer);
var
  vaIdItem, vaIdEspecie, vaIdLoteSemente, vaIdLoteMuda: Integer;
  vaQtde: Double;
begin
  vaIdItem := dmEstoque.cdsSaida_ItemID_ITEM.AsInteger;
  vaIdEspecie := dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger;
  vaIdLoteSemente := dmEstoque.cdsSaida_ItemID_LOTE_SEMENTE.AsInteger;
  vaIdLoteMuda := dmEstoque.cdsSaida_ItemID_LOTE_MUDA.AsInteger;
  vaQtde := dmEstoque.cdsSaida_ItemQTDE.AsFloat;
  inherited;
  if vaIdEspecie <> 0 then
    begin
      if vaIdLoteSemente <> 0 then
        dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeSementeEstoque(vaIdEspecie, 0, 0, vaQtde)
      else if vaIdLoteMuda <> 0 then
        dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeMudaEstoque(vaIdEspecie, 0, 0, Trunc(vaQtde))
    end
  else
    dmPrincipal.FuncoesEstoque.ppuAtualizarSaldoItem(vaIdItem, 0, vaQtde);

end;

procedure TfrmSaida.pprExecutarSalvarDetail;
var
  vaQtdeAnterior: Double;
  vaIdItemAnterior, vaIdEspecieAnterior, vaIdLoteSementeAnterior, vaIdLoteMudaAnterior: Integer;
  vaState: TDataSetState;
begin

  vaState := dmEstoque.cdsSaida_Item.State;
  vaIdItemAnterior := StrToIntDef(VarToStrDef(dmEstoque.cdsSaida_ItemID_ITEM.OldValue, '0'), 0);
  vaQtdeAnterior := StrToFloatDef(VarToStrDef(dmEstoque.cdsSaida_ItemQTDE.OldValue, '0'), 0);
  vaIdEspecieAnterior := StrToIntDef(VarToStrDef(dmEstoque.cdsSaida_ItemID_ESPECIE.OldValue, '0'), 0);
  vaIdLoteSementeAnterior := StrToIntDef(VarToStrDef(dmEstoque.cdsSaida_ItemID_LOTE_SEMENTE.OldValue, '0'), 0);
  vaIdLoteMudaAnterior := StrToIntDef(VarToStrDef(dmEstoque.cdsSaida_ItemID_LOTE_MUDA.OldValue, '0'), 0);
  inherited;

  if vaState = dsInsert then
    begin
      if dmEstoque.cdsSaida_ItemID_LOTE_SEMENTE.AsInteger <> 0 then
        begin
          dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeSementeEstoque(dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger,
            dmEstoque.cdsSaida_ItemID_LOTE_SEMENTE.AsInteger, dmEstoque.cdsSaida_ItemQTDE.AsFloat, 0);
        end
      else if dmEstoque.cdsSaida_ItemID_LOTE_MUDA.AsInteger <> 0 then
        begin
          dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeMudaEstoque(dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger,
            dmEstoque.cdsSaida_ItemID_LOTE_MUDA.AsInteger, dmEstoque.cdsSaida_ItemQTDE.AsInteger, 0);
        end
      else
        dmPrincipal.FuncoesEstoque.ppuAtualizarSaldoItem(dmEstoque.cdsSaida_ItemID_ITEM.AsInteger, dmEstoque.cdsSaida_ItemQTDE.AsFloat, 0);
    end
  else if vaState = dsEdit then
    begin
      if vaIdLoteSementeAnterior <> 0 then
        begin
          if (vaIdEspecieAnterior <> dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger) or
            (vaIdLoteSementeAnterior <> dmEstoque.cdsSaida_ItemID_LOTE_SEMENTE.AsInteger) then
            begin
              dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeSementeEstoque(vaIdEspecieAnterior, vaIdLoteSementeAnterior, 0, vaQtdeAnterior);
              if dmEstoque.cdsSaida_ItemID_LOTE_SEMENTE.AsInteger <> 0 then
                dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeSementeEstoque(dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger,
                  dmEstoque.cdsSaida_ItemID_LOTE_SEMENTE.AsInteger, dmEstoque.cdsSaida_ItemQTDE.AsFloat, 0);
            end
          else
            dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeSementeEstoque(dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger,
              dmEstoque.cdsSaida_ItemID_LOTE_SEMENTE.AsInteger, dmEstoque.cdsSaida_ItemQTDE.AsFloat, vaQtdeAnterior);
        end
      else if vaIdLoteMudaAnterior <> 0 then
        begin
          if (vaIdEspecieAnterior <> dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger) or
            (vaIdLoteMudaAnterior <> dmEstoque.cdsSaida_ItemID_LOTE_MUDA.AsInteger) then
            begin
              dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeMudaEstoque(vaIdEspecieAnterior, vaIdLoteMudaAnterior, 0, Trunc(vaQtdeAnterior));
              if dmEstoque.cdsSaida_ItemID_LOTE_MUDA.AsInteger <> 0 then
                dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeMudaEstoque(dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger,
                  dmEstoque.cdsSaida_ItemID_LOTE_MUDA.AsInteger, dmEstoque.cdsSaida_ItemQTDE.AsInteger, 0);
            end
          else
            dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeMudaEstoque(dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger,
              dmEstoque.cdsSaida_ItemID_LOTE_MUDA.AsInteger, dmEstoque.cdsSaida_ItemQTDE.AsInteger, Trunc(vaQtdeAnterior));
        end
      else
        begin
          if vaIdItemAnterior <> dmEstoque.cdsSaida_ItemID_ITEM.AsInteger then
            begin
              dmPrincipal.FuncoesEstoque.ppuAtualizarSaldoItem(vaIdItemAnterior, 0, vaQtdeAnterior);
              dmPrincipal.FuncoesEstoque.ppuAtualizarSaldoItem(dmEstoque.cdsSaida_ItemID_ITEM.AsInteger, dmEstoque.cdsSaida_ItemQTDE.AsFloat, 0);
            end
          else
            dmPrincipal.FuncoesEstoque.ppuAtualizarSaldoItem(dmEstoque.cdsSaida_ItemID_ITEM.AsInteger, dmEstoque.cdsSaida_ItemQTDE.AsFloat,
              vaQtdeAnterior);
        end;
    end;

end;

procedure TfrmSaida.cbEspeciePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastroDetail then
    ppvCarregarLotes;
end;

procedure TfrmSaida.ppvCarregarLotes;
const
  coAberto = 0;
begin
  if (not VarIsNull(cbEspecie.EditValue)) and dmLookup.cdslkEspecie.Locate(TBancoDados.coId, cbEspecie.EditValue, []) then
    begin
      dmLookup.cdslkLote_Semente.ppuDataRequest([TParametros.coEspecie, TParametros.coStatus, TParametros.coPossuiEstoque],
        [cbEspecie.EditValue, coAberto, true], TOperadores.coAnd, true);
      dmLookup.cdslkLote_Muda.ppuDataRequest([TParametros.coEspecie, TParametros.coPossuiEstoque],
        [cbEspecie.EditValue, true], TOperadores.coAnd, true);
    end
  else
    begin
      dmLookup.cdslkLote_Semente.Close;
      dmLookup.cdslkLote_Muda.Close;
    end;
end;

procedure TfrmSaida.cbItemPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastroDetail then
    ppvConfigurarEdits;
end;

procedure TfrmSaida.ppuAlterarDetail(ipId: Integer);
begin
  inherited;
  ppvConfigurarEdits;
  ppvCarregarLotes;
end;

procedure TfrmSaida.ppuIncluir;
begin
  inherited;
  dmEstoque.cdsSaidaDATA.AsDateTime := Now;
  dmEstoque.cdsSaidaTIPO.AsInteger := Ord(tsVenda);
end;

procedure TfrmSaida.pprBeforeSalvarDetail;
begin
  inherited;
  if not pnEspecieLotes.Visible then
    begin
      dmEstoque.cdsSaida_ItemID_ESPECIE.Clear;
      dmEstoque.cdsSaida_ItemID_LOTE_SEMENTE.Clear;
      dmEstoque.cdsSaida_ItemID_LOTE_MUDA.Clear;
    end
  else if not pnLoteSemente.Visible then
    dmEstoque.cdsSaida_ItemID_LOTE_SEMENTE.Clear
  else if not pnLoteMuda.Visible then
    dmEstoque.cdsSaida_ItemID_LOTE_MUDA.Clear;

end;

procedure TfrmSaida.ppuIncluirDetail;
begin
  inherited;
  ppvConfigurarEdits;
  ppvCarregarLotes;
end;

procedure TfrmSaida.pprValidarDadosDetail;
begin
  inherited;
  if pnEspecieLotes.Visible then
    begin
      if VarIsNull(cbEspecie.EditValue) then
        raise TControlException.Create('Informe a espécie.', cbEspecie);

      if (dmLookup.cdslkItemTIPO.AsInteger = Ord(tiSemente)) then
        begin
          if VarIsNull(cbLoteSemente.EditValue) then
            raise TControlException.Create('Informe de qual lote de sementes será feito a saída.', cbLoteSemente);

          dmLookup.cdslkLote_Semente.Locate(TBancoDados.coId, cbLoteSemente.EditValue, []);
          if dmEstoque.cdsSaida_ItemQTDE.AsFloat > dmLookup.cdslkLote_SementeQTDE_ARMAZENADA.AsFloat then
            raise Exception.Create('O lote informado não possui saldo suficiente de sementes.');

        end;

      if (dmLookup.cdslkItemTIPO.AsInteger = Ord(tiMuda)) then
        begin
          if VarIsNull(cbLoteMuda.EditValue) then
            raise TControlException.Create('Informe de qual lote de mudas será feito a saída.', cbLoteMuda);

          dmLookup.cdslkLote_Muda.Locate(TBancoDados.coId, cbLoteMuda.EditValue, []);
          if dmEstoque.cdsSaida_ItemQTDE.AsFloat > dmLookup.cdslkLote_MudaSALDO.AsInteger then
            raise Exception.Create('O lote informado não possui saldo suficiente de mudas.');

        end;
    end
  else
    begin
      if dmLookup.cdslkItem.Locate(TBancoDados.coId, dmEstoque.cdsSaida_ItemID_ITEM.AsInteger, []) then
        begin
          if dmEstoque.cdsSaida_ItemQTDE.AsFloat > dmLookup.cdslkItemSALDO.AsFloat then
            raise Exception.Create('O Item informado não possui saldo suficiente.');
        end;
    end;

end;

procedure TfrmSaida.pprValidarPesquisa;
begin
  inherited;
  if cbPesquisaItem.Visible and VarIsNull(cbPesquisaItem.EditValue) then
    raise TControlException.Create('Informe o item a ser pesquisado.', cbPesquisaItem);

  if cbPesquisaTipoSaida.Visible and VarIsNull(cbPesquisaTipoSaida.EditValue) then
    raise TControlException.Create('Informe o tipo de saída a ser pesquisado.', cbPesquisaTipoSaida);
end;

procedure TfrmSaida.ppvConfigurarEdits;
begin
  pnEspecieLotes.Visible := (not VarIsNull(cbItem.EditValue)) and dmLookup.cdslkItem.Locate(TBancoDados.coId, cbItem.EditValue, []) and
    (dmLookup.cdslkItemTIPO.AsInteger in [Ord(tiSemente), Ord(tiMuda)]);

  if pnEspecieLotes.Visible then
    begin
      pnLoteSemente.Visible := dmLookup.cdslkItemTIPO.AsInteger = Ord(tiSemente);
      pnLoteMuda.Visible := dmLookup.cdslkItemTIPO.AsInteger = Ord(tiMuda);
      lbUnidade.Caption := dmLookup.cdslkItemUNIDADE.AsString;
    end
  else
    lbUnidade.Caption := '';
end;

procedure TfrmSaida.FormCreate(Sender: TObject);
begin
  dmEstoque := TdmEstoque.Create(Self);
  dmEstoque.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  inherited;

  PesquisaPadrao := tppData;

  EditDataInicialPesquisa.Date := IncDay(Now, -7);
  EditDataFinalPesquisa.Date := Now;

  dmLookup.cdslkEspecie.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, true);
  dmLookup.cdslkItem.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, true);
end;

procedure TfrmSaida.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisaEspecie.Visible and (not VarIsNull(cbPesquisaEspecie.EditValue)) then
    ipCds.ppuAddParametro(TParametros.coEspecie, cbPesquisaEspecie.EditValue, TParametros.coEspecie, true);

  if cbPesquisarPor.EditValue = coPesquisaItem then
    ipCds.ppuAddParametro(TParametros.coItem, cbPesquisaItem.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaTipo then
    ipCds.ppuAddParametro(TParametros.coTipo, cbPesquisaTipoSaida.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaVenda then
    ipCds.ppuAddParametro(TParametros.coVenda, EditPesquisa.Text);
end;

function TfrmSaida.fprConfigurarControlesPesquisa: TWinControl;
begin
  Result := inherited;
  cbPesquisaItem.Visible := cbPesquisarPor.EditValue = coPesquisaItem;
  cbPesquisaTipoSaida.Visible := cbPesquisarPor.EditValue = coPesquisaTipo;
  if cbPesquisarPor.EditValue = coPesquisaVenda then
    begin
      EditPesquisa.Properties.EditMask := '\d+';
    end;

  EditPesquisa.Visible := EditPesquisa.Visible and (not(cbPesquisaItem.Visible or cbPesquisaTipoSaida.Visible));

  if cbPesquisaItem.Visible then
    Result := cbPesquisaItem
  else if cbPesquisaTipoSaida.Visible then
    Result := cbPesquisaTipoSaida;
end;

function TfrmSaida.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoEstoque), Ord(estSaida));
end;

end.
