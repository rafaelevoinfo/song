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
    FIdCompra: Integer;
    FData: TDateTime;
    procedure SetData(const Value: TDateTime);
    procedure SetIdCompra(const Value: Integer);
    procedure SetItens(const Value: TObjectList<TItem>);
  public
    property Data: TDateTime read FData write SetData;
    property IdCompra: Integer read FIdCompra write SetIdCompra;
    property Itens:TObjectList<TItem> read FItens write SetItens;
  end;

  TfrmEntrada = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_COMPRA: TcxGridDBColumn;
    viewRegistrosDATA: TcxGridDBColumn;
    cbPesquisaTipoItem: TcxImageComboBox;
    cbPesquisaItem: TcxLookupComboBox;
    EditDataEntrada: TcxDBDateEdit;
    Label4: TLabel;
    lbl2: TLabel;
    Label3: TLabel;
    cbItem: TcxDBLookupComboBox;
    Label5: TLabel;
    EditQtde: TcxDBCalcEdit;
    lbUnidade: TLabel;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_ITEM: TcxGridDBColumn;
    viewRegistrosDetailQTDE: TcxGridDBColumn;
    viewRegistrosDetailNOME_ITEM: TcxGridDBColumn;
    cbCompra: TcxDBLookupComboBox;
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

    procedure pprCarregarDadosModelo; override;
    procedure pprCarregarDadosModeloDetail; override;

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
  dmLookup.cdslkCompra.ppuDataRequest([TParametros.coStatusEntrega, TParametros.coData],
    [Ord(sepEntregue), DateToStr(IncMonth(now, -3)) + ';' + DateToStr(now)]);
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
      plSetEdit(cbCompra, vaEntrada.IdCompra);
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
      cbItem.EditValue := vaItem.IdItem;
      cbItem.PostEditValue;

      EditQtde.EditValue := vaItem.Qtde;
      EditQtde.PostEditValue;
    end;
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

{ TEntrada }

procedure TEntrada.SetData(const Value: TDateTime);
begin
  FData := Value;
end;

procedure TEntrada.SetIdCompra(const Value: Integer);
begin
  FIdCompra := Value;
end;

procedure TEntrada.SetItens(const Value: TObjectList<TItem>);
begin
  FItens := Value;
end;

end.
