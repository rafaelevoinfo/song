unit fCompra;

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
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuEstoque, dmuLookup, uTypes,
  System.DateUtils, uClientDataSet, uControleAcesso, System.TypInfo, cxMemo,
  cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCurrencyEdit,
  uMensagem, cxCalc, uExceptions, fEntrada, fLote_Muda;

type
  TCompra = class(TModelo)
  private
    FIdPessoaComprou: Integer;
    FData: TDateTime;
    procedure SetData(const Value: TDateTime);
    procedure SetIdPessoaComprou(const Value: Integer);
  public
    property Data: TDateTime read FData write SetData;
    property IdPessoaComprou: Integer read FIdPessoaComprou write SetIdPessoaComprou;
  end;

  TfrmCompra = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_FORNECEDOR: TcxGridDBColumn;
    viewRegistrosID_CONTA_PAGAR: TcxGridDBColumn;
    viewRegistrosID_PESSOA_COMPROU: TcxGridDBColumn;
    viewRegistrosDATA: TcxGridDBColumn;
    viewRegistrosSTATUS_ENTREGA: TcxGridDBColumn;
    viewRegistrosVALOR_FRETE: TcxGridDBColumn;
    viewRegistrosCODIGO_RASTREIO: TcxGridDBColumn;
    viewRegistrosDESCRICAO: TcxGridDBColumn;
    viewRegistrosFORNECEDOR: TcxGridDBColumn;
    viewRegistrosPESSOA_COMPROU: TcxGridDBColumn;
    viewRegistrosVALOR_TOTAL: TcxGridDBColumn;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_ITEM: TcxGridDBColumn;
    viewRegistrosDetailID_ESPECIE: TcxGridDBColumn;
    viewRegistrosDetailQTDE: TcxGridDBColumn;
    viewRegistrosDetailVALOR_UNITARIO: TcxGridDBColumn;
    viewRegistrosDetailITEM: TcxGridDBColumn;
    viewRegistrosDetailESPECIE: TcxGridDBColumn;
    lbl1: TLabel;
    cbComprador: TcxDBLookupComboBox;
    lbl2: TLabel;
    EditDataCompra: TcxDBDateEdit;
    lbl3: TLabel;
    cbStatusEntrega: TcxDBImageComboBox;
    lbl4: TLabel;
    EditDescricao: TcxDBMemo;
    lbl5: TLabel;
    cbFornecedor: TcxDBLookupComboBox;
    Label3: TLabel;
    EditValorFrete: TcxDBCurrencyEdit;
    btnProdutoEntregue: TButton;
    Ac_Produto_Entregue: TAction;
    Label4: TLabel;
    cbItem: TcxDBLookupComboBox;
    Label5: TLabel;
    cbEspecie: TcxDBLookupComboBox;
    Label7: TLabel;
    EditQtde: TcxDBCalcEdit;
    lbUnidade: TLabel;
    lbl6: TLabel;
    EditValorUnitario: TcxDBCurrencyEdit;
    cbPesquisaPessoa: TcxLookupComboBox;
    cbItemPesquisa: TcxLookupComboBox;
    cbPesquisaFornecedor: TcxLookupComboBox;
    EditCodigoRastreio: TcxDBTextEdit;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Ac_Produto_EntregueUpdate(Sender: TObject);
    procedure Ac_Produto_EntregueExecute(Sender: TObject);
    procedure viewRegistrosSTATUS_ENTREGACustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cbItemPropertiesEditValueChanged(Sender: TObject);
  private
    dmEstoque: TdmEstoque;
    dmLookup: TdmLookup;
    procedure ppvRealizarEntradas;
    procedure ppvGerarEntrada();
    procedure ppvGerarEntradaSemente;
    procedure ppvGerarEntradaMuda;
  protected
    function fprGetPermissao: string; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    function fprConfigurarControlesPesquisa: TWinControl; override;
    procedure pprValidarPesquisa; override;
    procedure pprExecutarSalvar; override;

    procedure pprBeforeSalvarDetail; override;

    procedure pprCarregarDadosModelo; override;
    procedure pprCarregarDadosModeloDetail; override;
  public
    procedure ppuIncluir; override;
  public const
    coPesquisaItem = 6;
    coPesquisaComprador = 5;
    coPesquisaCodigoRastreio = 7;
    coPesquisaFornecedor = 8;
    { Public declarations }
  end;

var
  frmCompra: TfrmCompra;

implementation

uses
  fLote_Semente;

{$R *.dfm}


procedure TfrmCompra.Ac_Produto_EntregueExecute(Sender: TObject);
begin
  inherited;
  dmEstoque.cdsCompra.Edit;
  dmEstoque.cdsCompraSTATUS_ENTREGA.AsInteger := Ord(sepEntregue);
  dmEstoque.cdsCompra.Post;

  ppvRealizarEntradas;
end;

procedure TfrmCompra.ppvRealizarEntradas();
begin
  if dmEstoque.cdsCompra_Item.RecordCount > 0 then
    begin
      if TMensagem.fpuPerguntar('Deseja realizar a entrada do produtos comprados?', ppSimNao) = rpSim then
        begin
          // Tipo Outros
          if dmEstoque.cdsCompra_Item.Locate(dmEstoque.cdsCompra_ItemTIPO_ITEM.FieldName, Ord(tiOutro), []) then
            ppvGerarEntrada();
          // Semente
          if dmEstoque.cdsCompra_Item.Locate(dmEstoque.cdsCompra_ItemTIPO_ITEM.FieldName, Ord(tiSemente), []) then
            ppvGerarEntradaSemente();
          // Muda
          if dmEstoque.cdsCompra_Item.Locate(dmEstoque.cdsCompra_ItemTIPO_ITEM.FieldName, Ord(tiMuda), []) then
            ppvGerarEntradaMuda();

          TMensagem.ppuShowMessage('Entradas realizadas com sucesso.');
        end;
    end;
end;

procedure TfrmCompra.Ac_Produto_EntregueUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := fprHabilitarAlterar and (dmEstoque.cdsCompraSTATUS_ENTREGA.AsInteger <> Ord(sepEntregue));
end;

procedure TfrmCompra.cbItemPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  cbItem.PostEditValue;
  lbUnidade.Caption := dmLookup.cdslkItemUNIDADE.AsString;
  cbEspecie.Enabled := dmLookup.cdslkItemTIPO.AsInteger in ([Ord(tiSemente), Ord(tiMuda)]);
end;

procedure TfrmCompra.FormCreate(Sender: TObject);
begin
  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  dmEstoque := TdmEstoque.Create(Self);
  dmEstoque.Name := '';

  inherited;

  PesquisaPadrao := tppData;
  EditDataInicialPesquisa.Date := IncDay(Now, -7);;
  EditDataFinalPesquisa.Date := IncDay(Now, 7);

  dmLookup.ppuCarregarPessoas(0, [trpFuncionario, trpEstagiario, trpVoluntario, trpMembroDiretoria]);
  dmLookup.cdslkItem.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);
  dmLookup.cdslkEspecie.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);
  dmLookup.cdslkFornecedor.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);

end;

function TfrmCompra.fprConfigurarControlesPesquisa: TWinControl;
begin
  Result := inherited;
  cbPesquisaPessoa.Visible := (cbPesquisarPor.EditValue = coPesquisaComprador);
  cbItemPesquisa.Visible := cbPesquisarPor.EditValue = coPesquisaItem;
  cbPesquisaFornecedor.Visible := cbPesquisarPor.EditValue = coPesquisaFornecedor;

  EditPesquisa.Visible := EditPesquisa.Visible and (not(cbItemPesquisa.Visible or cbPesquisaPessoa.Visible or cbPesquisaFornecedor.Visible));

  if cbPesquisaPessoa.Visible then
    Result := cbPesquisaPessoa
  else if cbItemPesquisa.Visible then
    Result := cbItemPesquisa
  else if cbPesquisaFornecedor.Visible then
    Result := cbPesquisaFornecedor;
end;

function TfrmCompra.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoEstoque), Ord(estCompra));
end;

procedure TfrmCompra.pprBeforeSalvarDetail;
begin
  inherited;
  // vamos garantir que somente itens do tipo smente e muda vao estar vinculados a uma especie
  if dmLookup.cdslkItemTIPO.AsInteger = Ord(tiOutro) then
    dmEstoque.cdsCompra_ItemID_ESPECIE.Clear;
end;

procedure TfrmCompra.pprCarregarDadosModelo;
var
  vaCompra: TCompra;
begin
  inherited;
  if (ModoExecucao in [meSomenteCadastro, meSomenteEdicao]) and Assigned(Modelo) and (Modelo is TCompra) then
    begin
      vaCompra := TCompra(Modelo);

      EditDataCompra.EditValue := vaCompra.Data;
      EditDataCompra.PostEditValue;

      cbComprador.EditValue := vaCompra.IdPessoaComprou;
      cbComprador.PostEditValue;
    end;
end;

procedure TfrmCompra.pprCarregarDadosModeloDetail;
var
  vaItem: TItem;
begin
  inherited;
  if (ModoExecucao in [meSomenteCadastro, meSomenteEdicao]) and Assigned(Modelo) and (Modelo is TItem) then
    begin
      vaItem := TItem(Modelo);
      cbItem.EditValue := vaItem.IdItem;
      cbItem.PostEditValue;

      if vaItem.IdEspecie <> 0 then
        begin
          cbEspecie.EditValue := vaItem.IdEspecie;
          cbEspecie.PostEditValue;
        end;

      EditQtde.EditValue := vaItem.Qtde;
      EditQtde.PostEditValue;
    end;
end;

procedure TfrmCompra.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.EditValue = coPesquisaItem then
    ipCds.ppuAddParametro(TParametros.coItem, cbItemPesquisa.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaComprador then
    ipCds.ppuAddParametro(TParametros.coComprador, cbPesquisaPessoa.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaFornecedor then
    ipCds.ppuAddParametro(TParametros.coFornecedor, cbPesquisaFornecedor.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaCodigoRastreio then
    ipCds.ppuAddParametro(TParametros.coCodigoRastreio, EditPesquisa.Text)
end;

procedure TfrmCompra.pprExecutarSalvar;
var
  vaRealizarEntradas: Boolean;
begin
  vaRealizarEntradas := False;
  if not VarIsNull(dmEstoque.cdsCompraSTATUS_ENTREGA.NewValue) then
    begin
      if dmEstoque.cdsCompraSTATUS_ENTREGA.NewValue = Ord(sepEntregue) then
        begin
          if (not VarIsNull(dmEstoque.cdsCompraSTATUS_ENTREGA.OldValue)) and
            (dmEstoque.cdsCompraSTATUS_ENTREGA.NewValue <> dmEstoque.cdsCompraSTATUS_ENTREGA.OldValue) then
            vaRealizarEntradas := True
        end;
    end;
  inherited;

  if vaRealizarEntradas then
    ppvRealizarEntradas;
end;

procedure TfrmCompra.pprValidarPesquisa;
begin
  inherited;
  if cbPesquisaPessoa.Visible and (VarIsNull(cbPesquisaPessoa.EditValue)) then
    begin
      if cbPesquisarPor.EditValue = coPesquisaComprador then
        raise TControlException.Create('Informe o comprador.', cbPesquisaPessoa);
    end;

  if cbItemPesquisa.Visible and (VarIsNull(cbItemPesquisa.EditValue)) then
    raise Exception.Create('Informe o item a ser pesquisado.');

  if cbPesquisaFornecedor.Visible and (VarIsNull(cbPesquisaFornecedor.EditValue)) then
    raise Exception.Create('Informe o fornecedor a ser pesquisado.');
end;

procedure TfrmCompra.ppuIncluir;
begin
  inherited;
  if dmEstoque.cdsCompraSTATUS_ENTREGA.isNull then
    dmEstoque.cdsCompraSTATUS_ENTREGA.AsInteger := Ord(sepACaminho);

  if dmEstoque.cdsCompraDATA.isNull then
    dmEstoque.cdsCompraDATA.AsDateTime := Now;
end;

procedure TfrmCompra.ppvGerarEntrada();
var
  vaFrmEntrada: TfrmEntrada;
  vaEntrada: TEntrada;
  vaItem: TItem;
begin
  // realizando a entrada
  vaFrmEntrada := TfrmEntrada.Create(nil);
  try
    vaEntrada := TEntrada.Create; // vai ser destruido pelo frmEntrada
    vaEntrada.Data := dmEstoque.cdsCompraDATA.AsDateTime;
    vaEntrada.IdCompra := dmEstoque.cdsCompraID.AsInteger;

    vaFrmEntrada.ppuConfigurarModoExecucao(meSomenteCadastro, vaEntrada);
    vaFrmEntrada.ppuIncluir;
    vaFrmEntrada.ppuSalvar;
    dmEstoque.cdsCompra_Item.First;
    while not dmEstoque.cdsCompra_Item.Eof do
      begin
        if dmEstoque.cdsCompra_ItemTIPO_ITEM.AsInteger = Ord(tiOutro) then
          begin
            vaItem := TItem.Create; // vai ser destruido pelo vafrmEntrada
            vaItem.IdItem := dmEstoque.cdsCompra_ItemID_ITEM.AsInteger;
            vaItem.Qtde := dmEstoque.cdsCompra_ItemQTDE.AsFloat;

            vaFrmEntrada.Modelo := vaItem;
            vaFrmEntrada.ppuIncluirDetail;
            vaFrmEntrada.ppuSalvarDetail;

          end;
        dmEstoque.cdsCompra_Item.Next;
      end;
  finally
    vaFrmEntrada.Free;
  end;
end;

procedure TfrmCompra.ppvGerarEntradaSemente();
var
  vaFrmLoteSemente: TfrmLoteSemente;
  vaLoteSemente: TLoteSemente;
begin
  // realizando a entrada de sementes
  vaFrmLoteSemente := TfrmLoteSemente.Create(nil);
  try
    dmEstoque.cdsCompra_Item.First;
    while not dmEstoque.cdsCompra_Item.Eof do
      begin
        if dmEstoque.cdsCompra_ItemTIPO_ITEM.AsInteger = Ord(tiSemente) then
          begin
            vaLoteSemente := TLoteSemente.Create; // vai ser destruido pelo vaFrmLoteSemente
            vaLoteSemente.Data := dmEstoque.cdsCompraDATA.AsDateTime;
            vaLoteSemente.IdCompra := dmEstoque.cdsCompraID.AsInteger;
            vaLoteSemente.IdEspecie := dmEstoque.cdsCompra_ItemID_ESPECIE.AsInteger;
            vaLoteSemente.Nome := 'Compra de Semente';
            vaLoteSemente.Qtde := dmEstoque.cdsCompra_ItemQTDE.AsFloat;
            vaLoteSemente.IdPessoaColetouComprou := dmEstoque.cdsCompraID_PESSOA_COMPROU.AsInteger;

            vaFrmLoteSemente.ppuConfigurarModoExecucao(meSomenteCadastro, vaLoteSemente);
            vaFrmLoteSemente.ppuIncluir;
            vaFrmLoteSemente.ppuSalvar;

          end;
        dmEstoque.cdsCompra_Item.Next;
      end;
  finally
    vaFrmLoteSemente.Free;
  end;
end;

procedure TfrmCompra.ppvGerarEntradaMuda();
var
  vaFrmLoteMuda: TfrmLoteMuda;
  vaLoteMuda: TLoteMuda;
begin
  // realizando a entrada de muda
  vaFrmLoteMuda := TfrmLoteMuda.Create(nil);
  try
    dmEstoque.cdsCompra_Item.First;
    while not dmEstoque.cdsCompra_Item.Eof do
      begin
        if dmEstoque.cdsCompra_ItemTIPO_ITEM.AsInteger = Ord(tiMuda) then
          begin
            vaLoteMuda := TLoteMuda.Create;
            vaLoteMuda.Data := dmEstoque.cdsCompraDATA.AsDateTime;
            vaLoteMuda.IdCompra := dmEstoque.cdsCompraID.AsInteger;
            vaLoteMuda.IdEspecie := dmEstoque.cdsCompra_ItemID_ESPECIE.AsInteger;
            vaLoteMuda.Nome := 'Compra de Muda';
            vaLoteMuda.Qtde := dmEstoque.cdsCompra_ItemQTDE.AsFloat;

            vaFrmLoteMuda.ppuConfigurarModoExecucao(meSomenteCadastro, vaLoteMuda);
            vaFrmLoteMuda.ppuIncluir;
            vaFrmLoteMuda.ppuSalvar;

          end;
        dmEstoque.cdsCompra_Item.Next;
      end;
  finally
    vaFrmLoteMuda.Free;
  end;
end;

procedure TfrmCompra.viewRegistrosSTATUS_ENTREGACustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  // if AViewInfo.GridRecord.Values[viewRegistrosDetailSTATUS.Index] = 1 then
  // begin
  // ACanvas.Font.Color := clWhite;
  // if AViewInfo.GridRecord.Selected then
  // ACanvas.Brush.Color := $00274F00
  // else
  // ACanvas.Brush.Color := clGreen;
  // end
  // else if AViewInfo.GridRecord.Values[viewRegistrosDetailVENCIMENTO.Index] < Today then
  // begin
  // ACanvas.Font.Color := clWhite;
  // if AViewInfo.GridRecord.Selected then
  // ACanvas.Brush.Color := clMaroon
  // else
  // ACanvas.Brush.Color := clRed;
  // end;
end;

{ TCompra }

procedure TCompra.SetData(const Value: TDateTime);
begin
  FData := Value;
end;

procedure TCompra.SetIdPessoaComprou(const Value: Integer);
begin
  FIdPessoaComprou := Value;
end;

end.
