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
  uExceptions, dmuPrincipal, uUtils, System.Generics.Collections, uMensagem;

type
  TSaida = class(TModelo)
  private
    FItens: TObjectList<TItem>;
    FData: TDateTime;
    FTipo: TTipoSaida;
    procedure SetData(const Value: TDateTime);
    procedure SetItens(const Value: TObjectList<TItem>);
    procedure SetTipo(const Value: TTipoSaida);
  public
    property Data: TDateTime read FData write SetData;
    property Tipo: TTipoSaida read FTipo write SetTipo;
    property Itens: TObjectList<TItem> read FItens write SetItens;
  end;

  TfrmSaida = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
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
    viewRegistrosDetailID_VENDA_ITEM: TcxGridDBColumn;
    viewRegistrosDetailUNIDADE: TcxGridDBColumn;
    viewRegistrosDetailCALC_QTDE: TcxGridDBColumn;
    pnLocalUso: TPanel;
    Label9: TLabel;
    cbLocalUso: TcxDBLookupComboBox;
    viewRegistrosID_LOCAL_USO: TcxGridDBColumn;
    viewRegistrosLOCAL_USO: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure cbItemPropertiesEditValueChanged(Sender: TObject);
    procedure cbEspeciePropertiesEditValueChanged(Sender: TObject);
    procedure cbTipoSaidaPropertiesEditValueChanged(Sender: TObject);
  private
    dmEstoque: TdmEstoque;
    dmLookup: TdmLookup;
    procedure ppvConfigurarEdits;
    procedure ppvCarregarLotes;

  protected
    procedure pprValidarPesquisa; override;
    function fprConfigurarControlesPesquisa: TWinControl; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    procedure pprBeforeSalvar; override;
    procedure pprBeforeSalvarDetail; override;
    procedure pprExecutarExcluirDetail(ipId: Integer); override;
    procedure pprExecutarExcluir(ipId: Integer; ipAcao: TAcaoTela); override;
    procedure pprCarregarDadosModelo; override;
    procedure pprCarregarDadosModeloDetail; override;

    function fprGetPermissao: string; override;

    procedure pprValidarDados; override;
    procedure pprValidarDadosDetail; override;
    procedure pprExecutarSalvarDetail; override;
  public
    procedure ppuIncluirDetail; override;
    procedure ppuIncluir; override;
    procedure ppuAlterarDetail(ipId: Integer); override;
    function fpuExcluirDetail(ipIds: TArray<Integer>): Boolean; override;

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
  vaItens: TObjectList<TItem>;
  vaItem: TItem;
begin
  vaItens := TObjectList<TItem>.Create;
  try
    TUtils.ppuPercorrerCds(dmEstoque.cdsSaida_Item,
      procedure
      begin
        vaItem := TItem.Create;
        if (dmEstoque.cdsSaida_ItemID_LOTE_SEMENTE.AsInteger <> 0) then
          begin
            vaItem.IdEspecie := dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger;
            vaItem.IdLoteSemente := dmEstoque.cdsSaida_ItemID_LOTE_SEMENTE.AsInteger;
            vaItem.Qtde := dmEstoque.cdsSaida_ItemQTDE.AsFloat;
          end
        else if dmEstoque.cdsSaida_ItemID_LOTE_MUDA.AsInteger <> 0 then
          begin
            vaItem.IdEspecie := dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger;
            vaItem.IdLoteMuda := dmEstoque.cdsSaida_ItemID_LOTE_MUDA.AsInteger;
            vaItem.Qtde := dmEstoque.cdsSaida_ItemQTDE.AsInteger;
          end
        else
          begin
            vaItem.Id := dmEstoque.cdsSaida_ItemID_ITEM.AsInteger;
            vaItem.Qtde := dmEstoque.cdsSaida_ItemQTDE.AsFloat;
          end;
        vaItens.Add(vaItem)
      end);

    inherited;

    for vaItem in vaItens do
      begin
        if vaItem.IdLoteSemente <> 0 then
          dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeSementeEstoque(vaItem.IdEspecie, vaItem.IdLoteSemente, 0, vaItem.Qtde)
        else if vaItem.IdLoteMuda <> 0 then
          dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeMudaEstoque(vaItem.IdEspecie, vaItem.IdLoteMuda, 0, Trunc(vaItem.Qtde))
        else
          dmPrincipal.FuncoesEstoque.ppuAtualizarSaldoItem(vaItem.Id, 0, vaItem.Qtde);
      end;
  finally
    vaItens.Free;
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
        dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeSementeEstoque(vaIdEspecie, vaIdLoteSemente, 0, vaQtde)
      else if vaIdLoteMuda <> 0 then
        dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeMudaEstoque(vaIdEspecie, vaIdLoteMuda, 0, Trunc(vaQtde))
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

procedure TfrmSaida.pprCarregarDadosModeloDetail;
var
  vaItem: TItem;

  procedure plSetEdit(ipEdit: TcxCustomEdit; ipValor: Variant);
  begin
    if not VarIsNull(ipValor) then
      begin
        ipEdit.EditValue := ipValor;
        ipEdit.PostEditValue;
      end;
  end;

begin
  inherited;
  if (ModoExecucao in [meSomenteCadastro, meSomenteEdicao]) and Assigned(Modelo) and (Modelo is TItem) then
    begin
      vaItem := TItem(Modelo);
      plSetEdit(cbItem, vaItem.Id);
      plSetEdit(EditQtde, vaItem.Qtde);

      if vaItem.IdEspecie <> 0 then
        plSetEdit(cbEspecie, vaItem.IdEspecie);

      if vaItem.IdLoteMuda <> 0 then
        plSetEdit(cbLoteMuda, vaItem.IdLoteMuda);

      if vaItem.IdLoteSemente <> 0 then
        plSetEdit(cbLoteSemente, vaItem.IdLoteSemente);

      if vaItem.IdItemCompraVenda <> 0 then
        dmEstoque.cdsSaida_ItemID_VENDA_ITEM.AsInteger := vaItem.IdItemCompraVenda;
    end;
end;

procedure TfrmSaida.pprCarregarDadosModelo;
var
  vaSaida: TSaida;
begin
  inherited;
  if (ModoExecucao in [meSomenteCadastro, meSomenteEdicao]) and Assigned(Modelo) and (Modelo is TSaida) then
    begin
      vaSaida := TSaida(Modelo);
      if vaSaida.Data <> 0 then
        dmEstoque.cdsSaidaDATA.AsDateTime := vaSaida.Data;

      dmEstoque.cdsSaidaTIPO.AsInteger := Ord(vaSaida.Tipo);
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
      if dmLookup.cdslkItemTIPO.AsInteger = Ord(tiSemente) then
        begin
          if (not dmLookup.cdslkLote_Semente.Active) or (dmLookup.cdslkLote_SementeID_ESPECIE.AsInteger <> cbEspecie.EditValue) then
            begin
              dmLookup.cdslkLote_Semente.ppuDataRequest([TParametros.coEspecie, TParametros.coStatus, TParametros.coPossuiEstoque],
                [cbEspecie.EditValue, coAberto, true], TOperadores.coAnd, true);
            end;
        end
      else if dmLookup.cdslkItemTIPO.AsInteger = Ord(tiMuda) then
        begin
          if (not dmLookup.cdslkLote_Muda.Active) or (dmLookup.cdslkLote_MudaID_ESPECIE.AsInteger <> cbEspecie.EditValue) then
            begin
              dmLookup.cdslkLote_Muda.ppuDataRequest([TParametros.coEspecie, TParametros.coPossuiEstoque],
                [cbEspecie.EditValue, true], TOperadores.coAnd, true);
            end;
        end;
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

procedure TfrmSaida.cbTipoSaidaPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  // nao faz sentido existir um local de saida se foi uma saida do tipo venda
  if not VarIsNull(cbTipoSaida.EditValue) then
    pnLocalUso.Visible := cbTipoSaida.EditValue <> Ord(tsVenda);
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
  if dmEstoque.cdsSaidaDATA.IsNull then
    dmEstoque.cdsSaidaDATA.AsDateTime := Now;

  if dmEstoque.cdsSaidaTIPO.IsNull then
    dmEstoque.cdsSaidaTIPO.AsInteger := Ord(tsConsumo);
end;

procedure TfrmSaida.pprBeforeSalvar;
begin
  inherited;
  if dmEstoque.cdsSaidaTIPO.AsInteger = Ord(tsVenda) then
    dmEstoque.cdsSaidaID_LOCAL_USO.Clear;
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

procedure TfrmSaida.pprValidarDados;
begin
  inherited;
  if dmEstoque.cdsSaida.State = dsEdit then
    begin
      if dmEstoque.cdsSaidaTIPO.AsInteger = Ord(tsPlantio) then
        begin
          dmLookup.cdslkItem.DisableControls;
          try
            TUtils.ppuPercorrerCds(dmEstoque.cdsSaida_Item,
              procedure
              begin
                if dmLookup.cdslkItem.Locate(TBancoDados.coId, dmEstoque.cdsSaida_ItemID_ITEM.AsInteger, []) then
                  begin
                    if dmLookup.cdslkItemTIPO.AsInteger <> Ord(tiMuda) then
                      raise Exception.Create('Para uma saída do tipo Plantio é permitido somente o cadastro do item muda.');
                  end;
              end);
          finally
            dmLookup.cdslkItem.EnableControls;
          end;
        end;
    end;
end;

procedure TfrmSaida.pprValidarDadosDetail;
begin
  inherited;
  if dmEstoque.cdsSaidaTIPO.AsInteger = Ord(tsPlantio) then
    begin
      if dmLookup.cdslkItemTIPO.AsInteger <> Ord(tiMuda) then
        raise Exception.Create('Somente o item muda pode ser cadastrado para uma saída do tipo Plantio');

    end;

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
          if (dmEstoque.cdsSaidaTIPO.AsInteger = Ord(tsPlantio)) and (dmLookup.cdslkLote_MudaSTATUS.AsInteger = Ord(smDesenvolvimento)) then
            raise TControlException.Create('O lote de mudas informado não esta pronto para plantio ainda.',cbLoteMuda);

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
var
  vaVisivel: Boolean;
begin
  vaVisivel := (not VarIsNull(cbItem.EditValue));
  if vaVisivel then
    begin
      vaVisivel := dmLookup.cdslkItem.Locate(TBancoDados.coId, cbItem.EditValue, []) and
        (dmLookup.cdslkItemTIPO.AsInteger in [Ord(tiSemente), Ord(tiMuda)]);

      pnLoteSemente.Visible := dmLookup.cdslkItemTIPO.AsInteger = Ord(tiSemente);
      pnLoteMuda.Visible := dmLookup.cdslkItemTIPO.AsInteger = Ord(tiMuda);
      pnEspecieLotes.Visible := vaVisivel;

      lbUnidade.Caption := dmLookup.cdslkItemUNIDADE.AsString;
    end;
end;

procedure TfrmSaida.FormCreate(Sender: TObject);
begin
  dmEstoque := TdmEstoque.Create(Self);
  dmEstoque.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  inherited;

  PesquisaPadrao := Ord(tppData);

  EditDataInicialPesquisa.Date := IncDay(Now, -7);
  EditDataFinalPesquisa.Date := Now;

  dmLookup.cdslkEspecie.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, true);
  dmLookup.cdslkItem.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, true);
  dmLookup.cdslkLocal_Uso.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, true);
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

function TfrmSaida.fpuExcluirDetail(ipIds: TArray<Integer>): Boolean;
begin
  Result := inherited;
  if Result then
    begin
      if (dmEstoque.cdsSaida_Item.RecordCount = 0) then
        begin
          if ModoSilencioso or
            (TMensagem.fpuPerguntar('Todos os itens desta saída foram excluídos. Deseja excluir a saída também?', ppSimNao) = rpSim) then
            begin
              Result := fpuExcluir([dmEstoque.cdsSaidaID.AsInteger]);
            end;
        end;
    end;
end;

{ TSaida }

procedure TSaida.SetData(const Value: TDateTime);
begin
  FData := Value;
end;

procedure TSaida.SetItens(const Value: TObjectList<TItem>);
begin
  FItens := Value;
end;

procedure TSaida.SetTipo(const Value: TTipoSaida);
begin
  FTipo := Value;
end;

end.
