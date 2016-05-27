unit fEntrada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrud, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, System.Actions, Vcl.ActnList,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxGroupBox, cxRadioGroup, Vcl.StdCtrls,
  cxDropDownEdit, cxImageComboBox, cxTextEdit, cxMaskEdit, cxCalendar,
  Vcl.ExtCtrls, cxPC, dmuEstoque, dmuLookup, uTypes, System.TypInfo,
  uControleAcesso, uClientDataSet, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxDBEdit, cxCalc, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, fLote_Semente, fLote_Muda, dmuPrincipal, System.DateUtils,
  fBasicoCrudMasterDetail, cxSplitter, uUtils, System.Generics.Collections, System.Generics.Defaults;

type

  TEntrada = class(TModelo)
  private
    FItens: TObjectList<TItem>;
    FData: TDateTime;
    procedure SetData(const Value: TDateTime);
    procedure SetItens(const Value: TObjectList<TItem>);
  public
    property Data: TDateTime read FData write SetData;
    property Itens: TObjectList<TItem> read FItens write SetItens;
  end;

  TfrmEntrada = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosDATA: TcxGridDBColumn;
    cbPesquisaItem: TcxLookupComboBox;
    EditDataEntrada: TcxDBDateEdit;
    Label4: TLabel;
    Label3: TLabel;
    cbItem: TcxDBLookupComboBox;
    Label5: TLabel;
    EditQtde: TcxDBCalcEdit;
    lbUnidade: TLabel;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_ITEM: TcxGridDBColumn;
    viewRegistrosDetailQTDE: TcxGridDBColumn;
    viewRegistrosDetailNOME_ITEM: TcxGridDBColumn;
    viewRegistrosID_PESSOA: TcxGridDBColumn;
    viewRegistrosPESSOA: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure cbItemPropertiesEditValueChanged(Sender: TObject);
  private
    dmEstoque: TdmEstoque;
    dmLookup: TdmLookup;
  protected
    function fprGetPermissao: String; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    function fprConfigurarControlesPesquisa: TWinControl; override;
    procedure pprValidarPesquisa; override;

    procedure pprPreencherCamposPadroes(ipDataSet: TDataSet); override;
    procedure pprExecutarSalvarDetail; override;
    procedure pprExecutarExcluirDetail(ipId: Integer); override;
    procedure pprExecutarExcluir(ipId: Integer; ipAcao: TAcaoTela); override;

    procedure pprCarregarDadosModelo; override;
    procedure pprCarregarDadosModeloDetail; override;

    { Public declarations }
  public const
    coPesquisaItem = 5;
    coPesquisaCompra = 6;

  end;

var
  frmEntrada: TfrmEntrada;

implementation

uses
  fPrincipal;

{$R *.dfm}


procedure TfrmEntrada.cbItemPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  cbItem.PostEditValue;
  lbUnidade.Caption := dmLookup.cdslkItemUNIDADE.AsString;
end;

procedure TfrmEntrada.FormCreate(Sender: TObject);
begin
  dmEstoque := TdmEstoque.Create(Self);
  dmEstoque.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';
  inherited;

  PesquisaPadrao := Ord(tppData);

  EditDataInicialPesquisa.Date := IncDay(now, -7);
  EditDataFinalPesquisa.Date := now;

  dmLookup.cdslkItem.ppuDataRequest([TParametros.coTipo], [Ord(tiOutro)]); // sementes e mudas nao podem ser lançadas aqui
  dmLookup.cdslkEspecie.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);
end;

function TfrmEntrada.fprConfigurarControlesPesquisa: TWinControl;
begin
  Result := inherited;
  cbPesquisaItem.Visible := cbPesquisarPor.EditValue = coPesquisaItem;
  if cbPesquisarPor.EditValue = coPesquisaCompra then
    begin
      EditPesquisa.Properties.EditMask := '\d+';
    end;

  EditPesquisa.Visible := EditPesquisa.Visible and (not cbPesquisaItem.Visible);

  if cbPesquisaItem.Visible then
    Result := cbPesquisaItem;
end;

function TfrmEntrada.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoEstoque), Ord(estEntrada));
end;

procedure TfrmEntrada.pprPreencherCamposPadroes(ipDataSet: TDataSet);
begin
  inherited;
  if ipDataSet = dmEstoque.cdsEntrada then
    begin
      if dmEstoque.cdsEntradaID_PESSOA.IsNull then
        dmEstoque.cdsEntradaID_PESSOA.AsInteger := TInfoLogin.fpuGetInstance.Usuario.Id;
    end;
end;

procedure TfrmEntrada.pprCarregarDadosModelo;
var
  vaEntrada: TEntrada;

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
  if (ModoExecucao in [meSomenteCadastro, meSomenteEdicao]) and Assigned(Modelo) and (Modelo is TEntrada) then
    begin
      vaEntrada := TEntrada(Modelo);

      plSetEdit(EditDataEntrada, vaEntrada.Data);

    end;
end;

procedure TfrmEntrada.pprCarregarDadosModeloDetail;
var
  vaItem: TItem;
begin
  inherited;
  if (ModoExecucao in [meSomenteCadastro, meSomenteEdicao]) and Assigned(Modelo) and (Modelo is TItem) then
    begin
      vaItem := TItem(Modelo);
      cbItem.EditValue := vaItem.Id;
      cbItem.PostEditValue;

      EditQtde.EditValue := vaItem.Qtde;
      EditQtde.PostEditValue;

      if vaItem.IdItemCompraVenda <> 0 then
        dmEstoque.cdsEntrada_ItemID_COMPRA_ITEM.AsInteger := vaItem.IdItemCompraVenda;
    end;
end;

procedure TfrmEntrada.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.EditValue = coPesquisaItem then
    ipCds.ppuAddParametro(TParametros.coItem, cbPesquisaItem.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaCompra then
    ipCds.ppuAddParametro(TParametros.coCompra, EditPesquisa.Text)
end;

procedure TfrmEntrada.pprExecutarExcluir(ipId: Integer; ipAcao: TAcaoTela);
var
  vaIdsItem: TDictionary<Integer, Double>;
  vaId: Integer;
begin
  vaIdsItem := TDictionary<Integer, Double>.Create;
  try
    TUtils.ppuPercorrerCds(dmEstoque.cdsEntrada_Item,
      procedure
      begin

        if not vaIdsItem.ContainsKey(dmEstoque.cdsEntrada_ItemID_ITEM.AsInteger) then
          vaIdsItem.Add(dmEstoque.cdsEntrada_ItemID_ITEM.AsInteger, 0);

        vaIdsItem.Items[dmEstoque.cdsEntrada_ItemID_ITEM.AsInteger] := vaIdsItem.Items[dmEstoque.cdsEntrada_ItemID_ITEM.AsInteger] +
          dmEstoque.cdsEntrada_ItemQTDE.AsFloat;

      end);

    inherited;

    for vaId in vaIdsItem.Keys do
      begin
        dmPrincipal.FuncoesEstoque.ppuAtualizarSaldoItem(vaId, vaIdsItem.Items[vaId],0);
      end;
  finally
    vaIdsItem.Free;
  end;
end;

procedure TfrmEntrada.pprExecutarExcluirDetail(ipId: Integer);
var
  vaIdItem: Integer;
  vaQtde: Double;
begin
  vaIdItem := dmEstoque.cdsEntrada_ItemID_ITEM.AsInteger;
  vaQtde := dmEstoque.cdsEntrada_ItemQTDE.AsFloat;
  inherited;
  dmPrincipal.FuncoesEstoque.ppuAtualizarSaldoItem(vaIdItem, vaQtde,0);
end;

procedure TfrmEntrada.pprExecutarSalvarDetail;
var
  vaState: TDataSetState;
  vaIdItemAnterior: Integer;
  vaQtdeAnterior: Double;
begin
  vaState := dmEstoque.cdsEntrada_Item.State;
  vaIdItemAnterior := StrToIntDef(VarToStrDef(dmEstoque.cdsEntrada_ItemID_ITEM.OldValue, '0'), 0);
  vaQtdeAnterior := StrToFloatDef(VarToStrDef(dmEstoque.cdsEntrada_ItemQTDE.OldValue, '0'), 0);
  inherited;

  if vaState = dsInsert then
    begin
      dmPrincipal.FuncoesEstoque.ppuAtualizarSaldoItem(dmEstoque.cdsEntrada_ItemID_ITEM.AsInteger, 0, dmEstoque.cdsEntrada_ItemQTDE.AsFloat);
    end
  else if vaState = dsEdit then
    begin
      if vaIdItemAnterior <> dmEstoque.cdsEntrada_ItemID_ITEM.AsInteger then
        begin
          dmPrincipal.FuncoesEstoque.ppuAtualizarSaldoItem(vaIdItemAnterior, vaQtdeAnterior, 0);
          dmPrincipal.FuncoesEstoque.ppuAtualizarSaldoItem(dmEstoque.cdsEntrada_ItemID_ITEM.AsInteger, 0, dmEstoque.cdsEntrada_ItemQTDE.AsFloat);
        end
      else
        dmPrincipal.FuncoesEstoque.ppuAtualizarSaldoItem(dmEstoque.cdsEntrada_ItemID_ITEM.AsInteger, vaQtdeAnterior, dmEstoque.cdsEntrada_ItemQTDE.AsFloat);
    end;
end;

procedure TfrmEntrada.pprValidarPesquisa;
begin
  inherited;
  if (cbPesquisarPor.EditValue = coPesquisaItem) and (VarIsNull(cbPesquisaItem.EditValue)) then
    raise Exception.Create('Informe o item a ser pesquisado.');
end;

{ TEntrada }

procedure TEntrada.SetData(const Value: TDateTime);
begin
  FData := Value;
end;

procedure TEntrada.SetItens(const Value: TObjectList<TItem>);
begin
  FItens := Value;
end;

end.
