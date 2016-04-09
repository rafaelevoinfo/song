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
  Data.Bind.DBScope, fLote_Semente, fLote_Muda, dmuPrincipal, System.DateUtils;

type
  TfrmEntrada = class(TfrmBasicoCrud)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_ITEM: TcxGridDBColumn;
    viewRegistrosID_COMPRA: TcxGridDBColumn;
    viewRegistrosQTDE: TcxGridDBColumn;
    viewRegistrosDATA: TcxGridDBColumn;
    viewRegistrosNOME_ITEM: TcxGridDBColumn;
    cbPesquisaTipoItem: TcxImageComboBox;
    cbPesquisaItem: TcxLookupComboBox;
    cbItem: TcxDBLookupComboBox;
    Label3: TLabel;
    EditDataEntrada: TcxDBDateEdit;
    Label4: TLabel;
    EditQtde: TcxDBCalcEdit;
    Label5: TLabel;
    lbl2: TLabel;
    EditCompra: TcxDBCalcEdit;
    lbUnidade: TLabel;
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
  lbUnidade.Caption := dmLookup.cdslkItemUNIDADE.AsString;
end;

procedure TfrmEntrada.FormCreate(Sender: TObject);
begin
  dmEstoque := TdmEstoque.Create(Self);
  dmEstoque.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';
  inherited;

  PesquisaPadrao := tppData;

  EditDataInicialPesquisa.Date := IncDay(now, -7);
  EditDataFinalPesquisa.Date := now;

  dmLookup.cdslkItem.ppuDataRequest([TParametros.coTipo], [Ord(tiOutro)]); // sementes e mudas nao podem ser lançadas aqui
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

procedure TfrmEntrada.pprValidarPesquisa;
begin
  inherited;
  if (cbPesquisarPor.EditValue = coPesquisaTipoItem) and (VarIsNull(cbPesquisaTipoItem.EditValue)) then
    raise Exception.Create('Informe o tipo de item a ser pesquisado.');

  if (cbPesquisarPor.EditValue = coPesquisaItem) and (VarIsNull(cbPesquisaItem.EditValue)) then
    raise Exception.Create('Informe o item a ser pesquisado.');
end;

end.
