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
  Data.Bind.DBScope, fLote_Semente, fLote_Muda, dmuPrincipal;

type
  TfrmEntrada = class(TfrmBasicoCrud)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_ITEM: TcxGridDBColumn;
    viewRegistrosID_ESPECIE: TcxGridDBColumn;
    viewRegistrosID_COMPRA: TcxGridDBColumn;
    viewRegistrosQTDE: TcxGridDBColumn;
    viewRegistrosDATA: TcxGridDBColumn;
    viewRegistrosNOME_ITEM: TcxGridDBColumn;
    cbPesquisaTipoItem: TcxImageComboBox;
    cbPesquisaItem: TcxLookupComboBox;
    viewRegistrosNOME_ESPECIE: TcxGridDBColumn;
    cbItem: TcxDBLookupComboBox;
    Label3: TLabel;
    EditDataEntrada: TcxDBDateEdit;
    Label4: TLabel;
    cbEspecie: TcxDBLookupComboBox;
    lbl1: TLabel;
    EditQtde: TcxDBCalcEdit;
    Label5: TLabel;
    lbl2: TLabel;
    EditCompra: TcxDBCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure cbItemPropertiesEditValueChanged(Sender: TObject);
  private
    dmEstoque: TdmEstoque;
    dmLookup: TdmLookup;
    FLoteSemente: TfrmLoteSemente;
    FLoteMuda: TfrmLoteMuda;
  protected
    function fprGetPermissao: String; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    function fprConfigurarControlesPesquisa: TWinControl; override;
    procedure pprValidarPesquisa; override;
    procedure pprBeforeSalvar; override;
    procedure pprAfterSalvar; override;
    procedure pprValidarDados; override;

    { Public declarations }
  public const
    coPesquisaItem = 5;
    coPesquisaTipoItem = 6;
    coPesquisaCompra = 7;

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
  cbEspecie.Enabled := (Not VarIsNull(cbItem.EditValue)) // and dmLookup.cdslkItem.Locate(TBancoDados.coid, cbItem.EditValue, []) and
    and (dmLookup.cdslkItemTIPO.AsInteger in [1, 2]);
end;

procedure TfrmEntrada.FormCreate(Sender: TObject);
begin
  dmEstoque := TdmEstoque.Create(Self);
  dmEstoque.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';
  inherited;

  FLoteSemente := TfrmLoteSemente.Create(Self);
  FLoteSemente.ppuConfigurarModoExecucao(meSomenteCadastro);

  FLoteMuda := TfrmLoteMuda.Create(Self);
  FLoteMuda.ppuConfigurarModoExecucao(meSomenteCadastro);

  PesquisaPadrao := tppData;

  dmLookup.cdslkItem.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);
  dmLookup.cdslkEspecie.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);
end;

function TfrmEntrada.fprConfigurarControlesPesquisa: TWinControl;
begin
  Result := inherited;
  cbPesquisaTipoItem.Visible := cbPesquisarPor.EditValue = coPesquisaTipoItem;
  cbPesquisaItem.Visible := cbPesquisarPor.EditValue = coPesquisaItem;
  if cbPesquisarPor.EditValue = coPesquisaCompra then
    begin
      EditPesquisa.Properties.EditMask := '\d+';
    end;

  EditPesquisa.Visible := EditPesquisa.Visible and (not(cbPesquisaTipoItem.Visible or cbPesquisaItem.Visible));

  if cbPesquisaTipoItem.Visible then
    Result := cbPesquisaTipoItem
  else if cbPesquisaItem.Visible then
    Result := cbPesquisaItem;
end;

function TfrmEntrada.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoEstoque), Ord(estEntrada));
end;

procedure TfrmEntrada.pprAfterSalvar;
begin
  inherited;
  if dmLookup.cdslkItemTIPO.AsInteger = Ord(tiSemente) then
    begin
      FLoteSemente.Show;
      FLoteSemente.EditData.EditValue := dmEstoque.cdsEntradaDATA.AsDateTime;
      FLoteSemente.EditData.PostEditValue;

      FLoteSemente.EditQtde.EditValue := dmEstoque.cdsEntradaQTDE.AsFloat;
      FLoteSemente.EditQtde.PostEditValue;

      FLoteSemente.cbEspecie.EditValue := dmEstoque.cdsEntradaID_ESPECIE.AsFloat;
      FLoteSemente.EditQtde.PostEditValue;

      FLoteSemente.cbPessoaColetou.EditValue := TInfoLogin.fpuGetInstance.Usuario.Id;
      FLoteSemente.cbPessoaColetou.PostEditValue;
    end
  else if dmLookup.cdslkItemTIPO.AsInteger = Ord(tiMuda) then
    FLoteMuda.Show;
end;

procedure TfrmEntrada.pprBeforeSalvar;
begin
  inherited;
  if not cbEspecie.Enabled then
    dmEstoque.cdsEntradaID_ESPECIE.Clear;
end;

procedure TfrmEntrada.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.EditValue = coPesquisaTipoItem then
    ipCds.ppuAddParametro(TParametros.coTipoItem, cbPesquisaTipoItem.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaItem then
    ipCds.ppuAddParametro(TParametros.coItem, cbPesquisaItem.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaCompra then
    ipCds.ppuAddParametro(TParametros.coCompra, EditPesquisa.Text)
end;

procedure TfrmEntrada.pprValidarDados;
begin
  inherited;
  if dmLookup.cdslkItemTIPO.AsInteger in [Ord(tiSemente), Ord(tiMuda)] then
    begin
      if dmEstoque.cdsEntradaID_ESPECIE.IsNull then
        raise Exception.Create('Informe a espécie.');
    end;
end;

procedure TfrmEntrada.pprValidarPesquisa;
begin
  inherited;
  if (cbPesquisarPor.EditValue = coPesquisaTipoItem) and (VarIsNull(cbPesquisaTipoItem.EditValue)) then
    raise Exception.Create('Informe o tipo de item a ser pesquisado.');

  if (cbPesquisarPor.EditValue = coPesquisaItem) and (VarIsNull(cbPesquisaItem.EditValue)) then
    raise Exception.Create('Informe o item a ser pesquisado.');
end;

end.
