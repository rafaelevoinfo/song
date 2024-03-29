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
  uExceptions, dmuPrincipal, uUtils, System.Generics.Collections, uMensagem,
  Vcl.ExtDlgs, Vcl.Menus, Datasnap.DBClient;

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
    function fpvSelecionarLote(ipCdsLote: TClientDataSet; ipFieldSaldo: String): Integer;

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
    function fprMontarTextoPanelFiltro(ipParametro: String; ipValor: Variant): String; override;
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
        if (dmEstoque.cdsSaida_ItemID_LOTE_SEMENTE.AsInteger = 0) and (dmEstoque.cdsSaida_ItemID_LOTE_MUDA.AsInteger = 0) then
          begin
            vaItem.Id := dmEstoque.cdsSaida_ItemID_ITEM.AsInteger;
            vaItem.Qtde := dmEstoque.cdsSaida_ItemQTDE.AsFloat;
          end;
        vaItens.Add(vaItem)
      end);

    inherited;

    for vaItem in vaItens do
      begin
        dmPrincipal.FuncoesEstoque.ppuAtualizarSaldoItem(vaItem.Id, 0, vaItem.Qtde);
      end;
  finally
    vaItens.Free;
  end;
end;

procedure TfrmSaida.pprExecutarExcluirDetail(ipId: Integer);
var
  vaIdItem, vaIdEspecie: Integer;
  vaQtde: Double;
begin
  vaIdItem := dmEstoque.cdsSaida_ItemID_ITEM.AsInteger;
  vaIdEspecie := dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger;
  vaQtde := dmEstoque.cdsSaida_ItemQTDE.AsFloat;

  inherited;
  if vaIdEspecie = 0 then
    dmPrincipal.FuncoesEstoque.ppuAtualizarSaldoItem(vaIdItem, 0, vaQtde);

end;

procedure TfrmSaida.pprExecutarSalvarDetail;
var
  vaQtdeAnterior: Double;
  vaIdItemAnterior: Integer;
  vaState: TDataSetState;
begin
  vaState := dmEstoque.cdsSaida_Item.State;
  vaIdItemAnterior := StrToIntDef(VarToStrDef(dmEstoque.cdsSaida_ItemID_ITEM.OldValue, '0'), 0);
  vaQtdeAnterior := StrToFloatDef(VarToStrDef(dmEstoque.cdsSaida_ItemQTDE.OldValue, '0'), 0);

  inherited;

  if vaState = dsInsert then
    begin
      if (dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger = 0) then
        dmPrincipal.FuncoesEstoque.ppuAtualizarSaldoItem(dmEstoque.cdsSaida_ItemID_ITEM.AsInteger, dmEstoque.cdsSaida_ItemQTDE.AsFloat, 0);
    end
  else if vaState = dsEdit then
    begin
      if vaIdItemAnterior <> dmEstoque.cdsSaida_ItemID_ITEM.AsInteger then
        begin
          dmPrincipal.FuncoesEstoque.ppuAtualizarSaldoItem(vaIdItemAnterior, 0, vaQtdeAnterior);
          dmPrincipal.FuncoesEstoque.ppuAtualizarSaldoItem(dmEstoque.cdsSaida_ItemID_ITEM.AsInteger, dmEstoque.cdsSaida_ItemQTDE.AsFloat, 0);
        end
      else
        dmPrincipal.FuncoesEstoque.ppuAtualizarSaldoItem(dmEstoque.cdsSaida_ItemID_ITEM.AsInteger, dmEstoque.cdsSaida_ItemQTDE.AsFloat, vaQtdeAnterior);

    end;

end;

function TfrmSaida.fpvSelecionarLote(ipCdsLote: TClientDataSet; ipFieldSaldo: String): Integer;
var
  vaItem: TItem;
  vaMaiorQtde: Double;
begin
  Result := 0;
  vaMaiorQtde := 0;

  vaItem := TItem(Modelo);
  // vamos tentar achar um lote que contenha a quantidade suficiente, se nao achar teremos de distribuir entre varios
  ipCdsLote.First;
  while not ipCdsLote.Eof do
    begin
      if ipCdsLote.FieldByName(ipFieldSaldo).AsFloat > vaMaiorQtde then
        begin

          Result := ipCdsLote.FieldByName(TBancoDados.coId).AsInteger;

          vaMaiorQtde := ipCdsLote.FieldByName(ipFieldSaldo).AsFloat;
        end;

      if vaMaiorQtde >= vaItem.Qtde then
        break;

      ipCdsLote.Next;
    end;
end;

procedure TfrmSaida.pprCarregarDadosModeloDetail;
var
  vaItem: TItem;
  vaQtdeRestante: Double;
  vaTipo: TTipoItem;
begin
  inherited;
  vaQtdeRestante := 0;
  if (ModoExecucao in [meSomenteCadastro, meSomenteEdicao]) and Assigned(Modelo) and (Modelo is TItem) then
    begin
      vaItem := TItem(Modelo);
      if not dmLookup.cdslkItem.Locate(TBancoDados.coId, vaItem.Id, []) then
        raise Exception.Create('N�o foi poss�vel encontrar o item informado.');

      vaTipo := TTipoItem(dmLookup.cdslkItemTIPO.AsInteger);

      dmEstoque.cdsSaida_ItemID_ITEM.AsInteger := vaItem.Id;
      dmEstoque.cdsSaida_ItemQTDE.AsFloat := vaItem.Qtde;

      if vaItem.IdEspecie <> 0 then
        dmEstoque.cdsSaida_ItemID_ESPECIE.AsInteger := vaItem.IdEspecie;

      if vaItem.IdItemCompraVenda <> 0 then
        dmEstoque.cdsSaida_ItemID_VENDA_ITEM.AsInteger := vaItem.IdItemCompraVenda;

      if (vaTipo in [tiMuda, tiSemente]) then
        begin
          if (vaItem.IdLoteMuda = 0) and (vaItem.IdLoteSemente = 0) then
            begin
              // temos que localizar lotes que sejam suficientes para a qtde informada
              ppvCarregarLotes;
              if vaTipo = tiMuda then
                vaItem.IdLoteMuda := fpvSelecionarLote(dmLookup.cdslkLote_Muda, dmLookup.cdslkLote_MudaSALDO.FieldName)
              else // semente
                vaItem.IdLoteSemente := fpvSelecionarLote(dmLookup.cdslkLote_Semente, dmLookup.cdslkLote_SementeQTDE_ARMAZENADA.FieldName)
            end;

          if vaTipo = tiMuda then
            begin
              if dmLookup.cdslkLote_Muda.Locate(TBancoDados.coId, vaItem.IdLoteMuda, []) then
                begin
                  if dmLookup.cdslkLote_MudaSALDO.AsInteger < vaItem.Qtde then
                    begin
                      vaQtdeRestante := vaItem.Qtde - dmLookup.cdslkLote_MudaSALDO.AsInteger;
                      dmEstoque.cdsSaida_ItemQTDE.AsFloat := dmLookup.cdslkLote_MudaSALDO.AsInteger;
                    end
                  else
                    dmEstoque.cdsSaida_ItemQTDE.AsFloat := vaItem.Qtde;
                end
              else
                raise Exception.Create('N�o foi poss�vel encontrar lotes de mudas da esp�cie ' + dmLookup.cdslkEspecieNOME.AsString +
                  ' com saldo suficiente para a quantidade solicitada.')
            end
          else if vaTipo = tiSemente then
            begin
              if dmLookup.cdslkLote_Semente.Locate(TBancoDados.coId, vaItem.IdLoteSemente, []) then
                begin
                  if dmLookup.cdslkLote_SementeQTDE_ARMAZENADA.AsFloat < vaItem.Qtde then
                    begin
                      vaQtdeRestante := vaItem.Qtde - dmLookup.cdslkLote_SementeQTDE_ARMAZENADA.AsFloat;
                      dmEstoque.cdsSaida_ItemQTDE.AsFloat := dmLookup.cdslkLote_SementeQTDE_ARMAZENADA.AsFloat;
                    end
                  else
                    dmEstoque.cdsSaida_ItemQTDE.AsFloat := vaItem.Qtde;
                end
              else
                raise Exception.Create('N�o foi poss�vel encontrar lotes de sementes da esp�cie ' + dmLookup.cdslkEspecieNOME.AsString +
                  ' com saldo suficiente para a quantidade solicitada.')
            end;
        end;

      if vaItem.IdLoteMuda <> 0 then
        dmEstoque.cdsSaida_ItemID_LOTE_MUDA.AsInteger := vaItem.IdLoteMuda;

      if vaItem.IdLoteSemente <> 0 then
        dmEstoque.cdsSaida_ItemID_LOTE_SEMENTE.AsInteger := vaItem.IdLoteSemente;

      // tem que ser as ultimas coisas dessa funcao
      if vaQtdeRestante > 0 then
        begin
          ppuSalvarDetail;

          if vaTipo = tiMuda then
            vaItem.IdLoteMuda := 0
          else
            vaItem.IdLoteSemente := 0;
          vaItem.Qtde := vaQtdeRestante;

          ppuIncluirDetail;
        end;
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
                      raise Exception.Create('Para uma sa�da do tipo Plantio � permitido somente o cadastro do item muda.');
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
        raise Exception.Create('Somente o item muda pode ser cadastrado para uma sa�da do tipo Plantio');

    end;

  if pnEspecieLotes.Visible then
    begin
      if VarIsNull(cbEspecie.EditValue) then
        raise TControlException.Create('Informe a esp�cie.', cbEspecie);

      if (dmLookup.cdslkItemTIPO.AsInteger = Ord(tiSemente)) then
        begin
          if VarIsNull(cbLoteSemente.EditValue) then
            raise TControlException.Create('Informe de qual lote de sementes ser� feito a sa�da.', cbLoteSemente);

          dmLookup.cdslkLote_Semente.Locate(TBancoDados.coId, cbLoteSemente.EditValue, []);
          if dmEstoque.cdsSaida_ItemQTDE.AsFloat > dmLookup.cdslkLote_SementeQTDE_ARMAZENADA.AsFloat then
            raise Exception.Create('O lote informado n�o possui saldo suficiente de sementes.');

        end;

      if (dmLookup.cdslkItemTIPO.AsInteger = Ord(tiMuda)) then
        begin
          if VarIsNull(cbLoteMuda.EditValue) then
            raise TControlException.Create('Informe de qual lote de mudas ser� feito a sa�da.', cbLoteMuda);

          dmLookup.cdslkLote_Muda.Locate(TBancoDados.coId, cbLoteMuda.EditValue, []);
          if (dmEstoque.cdsSaidaTIPO.AsInteger = Ord(tsPlantio)) and (dmLookup.cdslkLote_MudaSTATUS.AsInteger = Ord(smDesenvolvimento)) then
            raise TControlException.Create('O lote de mudas informado n�o esta pronto para plantio ainda.', cbLoteMuda);

          if dmEstoque.cdsSaida_ItemQTDE.AsFloat > dmLookup.cdslkLote_MudaSALDO.AsInteger then
            raise Exception.Create('O lote informado n�o possui saldo suficiente de mudas.');

        end;
    end
  else
    begin
      if dmLookup.cdslkItem.Locate(TBancoDados.coId, dmEstoque.cdsSaida_ItemID_ITEM.AsInteger, []) then
        begin
          if dmEstoque.cdsSaida_ItemQTDE.AsFloat > dmLookup.cdslkItemSALDO.AsFloat then
            raise Exception.Create('O Item informado n�o possui saldo suficiente.');
        end;
    end;

end;

procedure TfrmSaida.pprValidarPesquisa;
begin
  inherited;
  if cbPesquisaItem.Visible and VarIsNull(cbPesquisaItem.EditValue) then
    raise TControlException.Create('Informe o item a ser pesquisado.', cbPesquisaItem);

  if cbPesquisaTipoSaida.Visible and VarIsNull(cbPesquisaTipoSaida.EditValue) then
    raise TControlException.Create('Informe o tipo de sa�da a ser pesquisado.', cbPesquisaTipoSaida);
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
    ipCds.ppuAddParametro(TParametros.coEspecie, cbPesquisaEspecie.EditValue);

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

function TfrmSaida.fprMontarTextoPanelFiltro(ipParametro: String;
ipValor: Variant): String;
begin
  if ipParametro = TParametros.coEspecie then
    Result := 'Esp�cie = ' + cbPesquisaEspecie.Text
  else
    Result := inherited;
end;

function TfrmSaida.fpuExcluirDetail(ipIds: TArray<Integer>): Boolean;
begin
  Result := inherited;
  if Result then
    begin
      if (dmEstoque.cdsSaida_Item.RecordCount = 0) then
        begin
          if ModoSilencioso or
            (TMensagem.fpuPerguntar('Todos os itens desta sa�da foram exclu�dos. Deseja excluir a sa�da tamb�m?', ppSimNao) = rpSim) then
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
