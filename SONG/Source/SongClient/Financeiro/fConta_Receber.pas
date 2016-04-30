unit fConta_Receber;

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
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuFinanceiro, uControleAcesso,
  System.TypInfo, uTypes, dmuLookup, cxMemo, cxDBEdit, dmuPrincipal,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCalc, cxCurrencyEdit,
  cxSpinEdit, dxCheckGroupBox, Datasnap.DBClient, uClientDataSet, uUtils,
  System.Math, System.DateUtils, uMensagem, System.Generics.Collections;

type
  TfrmContaReceber = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailVENCIMENTO: TcxGridDBColumn;
    viewRegistrosDetailVALOR: TcxGridDBColumn;
    viewRegistrosDetailPARCELA: TcxGridDBColumn;
    Label3: TLabel;
    EditDescricao: TcxDBTextEdit;
    Label7: TLabel;
    EditObservacao: TcxDBMemo;
    Label17: TLabel;
    cbContaCorrente: TcxDBLookupComboBox;
    Label4: TLabel;
    cbCliente: TcxDBLookupComboBox;
    cbPlanoContas: TcxDBLookupComboBox;
    Label5: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    cbFormaPagamento: TcxDBImageComboBox;
    EditValorTotal: TcxDBCurrencyEdit;
    rgParcelas: TcxGroupBox;
    Label9: TLabel;
    EditQtdeParcelas: TcxSpinEdit;
    cxGrid1: TcxGrid;
    viewParcelas: TcxGridDBTableView;
    viewParcelasID: TcxGridDBColumn;
    viewParcelasID_CONTA_PAGAR: TcxGridDBColumn;
    viewParcelasVENCIMENTO: TcxGridDBColumn;
    viewParcelasVALOR: TcxGridDBColumn;
    viewParcelasPARCELA: TcxGridDBColumn;
    levelGrid1Level1: TcxGridLevel;
    Label11: TLabel;
    btnIncluirParcelas: TButton;
    Ac_Gerar_Parcelas: TAction;
    rgVinculos: TcxGroupBox;
    Label10: TLabel;
    cxGrid2: TcxGrid;
    viewVinculos: TcxGridDBTableView;
    level1: TcxGridLevel;
    btnAddProjeto: TButton;
    Ac_Incluir_Vinculo: TAction;
    dsVinculos: TDataSource;
    ColumnDeletarVinculo: TcxGridDBColumn;
    Ac_Excluir_Vinculo: TAction;
    EditVencimentoParcela: TcxDateEdit;
    cbFundo: TcxLookupComboBox;
    cbPesquisaClienteFinanciador: TcxLookupComboBox;
    cbPesquisaPlanoConta: TcxLookupComboBox;
    btnBaixarReabrir: TButton;
    Ac_Baixar_Reabrir: TAction;
    viewRegistrosDetailSTATUS: TcxGridDBColumn;
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_CLIENTE_FINANCIADOR: TcxGridDBColumn;
    viewRegistrosID_PLANO_CONTAS: TcxGridDBColumn;
    viewRegistrosID_CONTA_CORRENTE: TcxGridDBColumn;
    viewRegistrosDESCRICAO: TcxGridDBColumn;
    viewRegistrosVALOR_TOTAL: TcxGridDBColumn;
    viewRegistrosFORMA_PAGTO: TcxGridDBColumn;
    viewRegistrosNOME_FANTASIA: TcxGridDBColumn;
    viewRegistrosPLANO_CONTAS: TcxGridDBColumn;
    viewRegistrosCONTA_CORRENTE: TcxGridDBColumn;
    viewRegistrosDetailDATA_RECEBIMENTO: TcxGridDBColumn;
    viewRegistrosNUMERO_DOCUMENTO: TcxGridDBColumn;
    Label13: TLabel;
    EditNroDocumento: TcxDBTextEdit;
    Label21: TLabel;
    EditValorVinculo: TcxCurrencyEdit;
    viewVinculosID: TcxGridDBColumn;
    viewVinculosID_CONTA_RECEBER: TcxGridDBColumn;
    viewVinculosID_FUNDO: TcxGridDBColumn;
    viewVinculosVALOR: TcxGridDBColumn;
    viewVinculosFUNDO: TcxGridDBColumn;
    tabVinculos: TcxTabSheet;
    cxGrid3: TcxGrid;
    viewPesquisaVinculo: TcxGridDBTableView;
    level2: TcxGridLevel;
    viewPesquisaVinculoID: TcxGridDBColumn;
    viewPesquisaVinculoID_CONTA_RECEBER: TcxGridDBColumn;
    viewPesquisaVinculoID_FUNDO: TcxGridDBColumn;
    viewPesquisaVinculoVALOR: TcxGridDBColumn;
    viewPesquisaVinculoFUNDO: TcxGridDBColumn;
    cbPesquisaFundo: TcxLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Ac_Incluir_VinculoExecute(Sender: TObject);
    procedure Ac_Gerar_ParcelasExecute(Sender: TObject);
    procedure Ac_Excluir_VinculoExecute(Sender: TObject);
    procedure Ac_Baixar_ReabrirUpdate(Sender: TObject);
    procedure Ac_Baixar_ReabrirExecute(Sender: TObject);
    procedure viewRegistrosDetailCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormDestroy(Sender: TObject);
  private

    dmFinanceiro: TdmFinanceiro;
    dmLookup: TdmLookup;
    FParcelasBaixadas: Boolean;
    FIdsParcelasCancelar: TList<Integer>;
    procedure ppvAddVinculo();
    procedure ppvAdicionarParcela(ipParcela: Integer; ipVencimento: TDate;
      ipValor: Double);
    procedure ppvReceberParcela;
    procedure ppvCancelarRecebimento;
  protected
    function fprGetPermissao: string; override;
    procedure pprExecutarSalvar; override;
    procedure pprBeforeAlterar; override;
    procedure pprBeforeIncluir; override;
    procedure pprValidarDados; override;
    procedure pprEfetuarPesquisa; override;
    function fprHabilitarSalvar(): Boolean; override;
    function fprHabilitarAlterarDetail: Boolean; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    function fprConfigurarControlesPesquisa: TWinControl; override;
    procedure pprExecutarCancelar; override;
    procedure pprBeforeExcluir(ipAcao: TAcaoTela); override;
  public
    procedure ppuIncluir; override;
  public const
    coProjeto = 1;
    coAtividade = 2;

    coPesquisaDescricao = 5;
    coPesquisaClienteFinanciador = 6;
    coPesquisaPlanoConta = 7;
    coPesquisaFundo = 8;

  end;

var
  frmContaReceber: TfrmContaReceber;

implementation

{$R *.dfm}

{ TfrmContaPagar }

procedure TfrmContaReceber.pprBeforeAlterar;
begin
  inherited;
  FParcelasBaixadas := False;
  TUtils.ppuPercorrerCds(dmFinanceiro.cdsConta_Receber_Parcela,
    function: Boolean
    begin
      if dmFinanceiro.cdsConta_Receber_ParcelaSTATUS.AsInteger = 1 then // recebida
        begin
          FParcelasBaixadas := True;
          Exit(False);
        end
      else
        Exit(True);
    end);

  rgVinculos.Enabled := not FParcelasBaixadas;
  viewParcelasVALOR.Options.Editing := not FParcelasBaixadas;

  if FParcelasBaixadas then
    begin
      TMensagem.ppuShowMessage
        ('Algumas parcelas já foram baixadas, portanto não será mais possível editar os vínculos e nem o valor individual de uma parcela.');
    end;

  EditQtdeParcelas.Value := 1;
  EditVencimentoParcela.Clear;

  cbFundo.Clear;
  EditValorVinculo.Clear;

  FIdsParcelasCancelar.Clear;
end;

procedure TfrmContaReceber.pprBeforeExcluir(ipAcao: TAcaoTela);
begin
  inherited;
  dmPrincipal.FuncoesFinanceiro.ppuCancelarTodosRecebimentosContaReceber(dmFinanceiro.cdsConta_ReceberID.AsInteger);
end;

procedure TfrmContaReceber.pprBeforeIncluir;
begin
  inherited;
  EditQtdeParcelas.Value := 1;
  EditVencimentoParcela.Clear;
  cbFundo.Clear;
  EditValorVinculo.Clear;

  FIdsParcelasCancelar.Clear;

  rgVinculos.Enabled := True;
  viewParcelasVALOR.Options.Editing := True;
  FParcelasBaixadas := False;
end;

procedure TfrmContaReceber.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.EditValue = coPesquisaDescricao then
    ipCds.ppuAddParametro(TParametros.coDescricao, EditPesquisa.Text)
  else if cbPesquisarPor.EditValue = coPesquisaClienteFinanciador then
    ipCds.ppuAddParametro(TParametros.coClienteFinanciador, cbPesquisaClienteFinanciador.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaPlanoConta then
    ipCds.ppuAddParametro(TParametros.coPlanoConta, cbPesquisaPlanoConta.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaFundo then
    ipCds.ppuAddParametro(TParametros.coFundo, cbPesquisaFundo.EditValue)
end;

procedure TfrmContaReceber.pprEfetuarPesquisa;
begin
  dmFinanceiro.cdsConta_Receber_Vinculo.Close;
  inherited;
  dmFinanceiro.cdsConta_Receber_Vinculo.Open;
end;

procedure TfrmContaReceber.pprExecutarCancelar;
begin
  dmFinanceiro.cdsConta_Receber_Parcela.CancelUpdates;
  dmFinanceiro.cdsConta_Receber_Vinculo.CancelUpdates;
  inherited;
end;

procedure TfrmContaReceber.pprExecutarSalvar;
var
  vaIdParcela: Integer;
begin
  inherited;
  for vaIdParcela in FIdsParcelasCancelar do
    begin
      dmPrincipal.FuncoesFinanceiro.ppuCancelarRecebimentoParcela(vaIdParcela);
    end;

  if dmFinanceiro.cdsConta_Receber.ChangeCount > 0 then
    dmFinanceiro.cdsConta_Receber.ApplyUpdates(0);

  if dmFinanceiro.cdsConta_Receber_Parcela.ChangeCount > 0 then
    dmFinanceiro.cdsConta_Receber_Parcela.ApplyUpdates(0);

  if dmFinanceiro.cdsConta_Receber_Vinculo.ChangeCount > 0 then
    dmFinanceiro.cdsConta_Receber_Vinculo.ApplyUpdates(0);
end;

procedure TfrmContaReceber.pprValidarDados;
var
  vaValorParcelado, vaValorTotalVinculo: Double;
begin
  inherited;
  vaValorParcelado := 0;
  vaValorTotalVinculo := 0;
  if dmFinanceiro.cdsConta_Receber_Vinculo.RecordCount = 0 then
    raise Exception.Create('É necessário incluir pelo menos um vínculo.');

  TUtils.ppuPercorrerCds(dmFinanceiro.cdsConta_Receber_Vinculo,
    procedure
    begin
      vaValorTotalVinculo := vaValorTotalVinculo + dmFinanceiro.cdsConta_Receber_VinculoVALOR.AsFloat;
    end);

  if vaValorTotalVinculo <> dmFinanceiro.cdsConta_ReceberVALOR_TOTAL.AsFloat then
    raise Exception.Create('A soma dos valores de todos os vínculos deve ser igual ao valor total a se receber da conta.');

  TUtils.ppuPercorrerCds(dmFinanceiro.cdsConta_Receber_Parcela,
    procedure
    begin
      vaValorParcelado := vaValorParcelado + dmFinanceiro.cdsConta_Receber_ParcelaVALOR.AsFloat;
    end);

  if dmFinanceiro.cdsConta_Receber_Parcela.RecordCount <> 0 then
    begin
      if not SameValue(vaValorParcelado, dmFinanceiro.cdsConta_ReceberVALOR_TOTAL.AsFloat) then
        raise Exception.Create('O valor total está diferente do valor parcelado.');
    end
  else
    raise Exception.Create('É necessário gerar pelo menos uma parcela.');
end;

procedure TfrmContaReceber.ppuIncluir;
begin
  inherited;
  dmFinanceiro.cdsConta_ReceberID.AsInteger := dmPrincipal.FuncoesGeral.fpuGetId('CONTA_RECEBER');
end;

procedure TfrmContaReceber.ppvAddVinculo();
begin
  if not VarIsNull(cbFundo.EditValue) then
    begin
      if not VarIsNull(EditValorVinculo.EditValue) then
        begin
          dmFinanceiro.cdsConta_Receber_Vinculo.Append;
          dmFinanceiro.cdsConta_Receber_VinculoID.AsInteger := dmPrincipal.FuncoesGeral.fpuGetId('CONTA_RECEBER_VINCULO');
          dmFinanceiro.cdsConta_Receber_VinculoID_FUNDO.AsInteger := cbFundo.EditValue;
          dmFinanceiro.cdsConta_Receber_VinculoFUNDO.AsString := cbFundo.Text;
          dmFinanceiro.cdsConta_Receber_VinculoVALOR.AsFloat := EditValorVinculo.EditValue;
          dmFinanceiro.cdsConta_Receber_Vinculo.Post;
        end
      else
        TMensagem.ppuShowMessage('Informe o valor.');
    end
  else
    TMensagem.ppuShowMessage('Informe para qual fundo o dinheiro será encaminhado.');
end;

procedure TfrmContaReceber.Ac_Excluir_VinculoExecute(Sender: TObject);
begin
  inherited;
  dmFinanceiro.cdsConta_Receber_Vinculo.Delete;
end;

procedure TfrmContaReceber.Ac_Gerar_ParcelasExecute(Sender: TObject);
var
  vaValorParcela: Double;
  vaValorParcelado: Double;
  I: Integer;
begin
  inherited;
  if FParcelasBaixadas then
    begin
      if TMensagem.fpuPerguntar('Ao gerar novas parcelas todas as parcelas baixadas ' +
        'serão reabertas. Tem certeza que deseja fazer isso?', ppSimNao) = rpNao then
        Exit;
    end;

  if dmFinanceiro.cdsConta_ReceberVALOR_TOTAL.IsNull then
    raise Exception.Create('Informe o valor total para que seja possível gerar as parcelas.');

  if VarIsNull(EditQtdeParcelas.Value) then
    raise Exception.Create('Informe o valor total para que seja possível gerar as parcelas.');

  if VarIsNull(EditVencimentoParcela.EditValue) then
    raise Exception.Create('Informe o vencimento da primeira parcela.');

  dmFinanceiro.cdsConta_Receber_Parcela.DisableControls;
  try
    dmFinanceiro.cdsConta_Receber_Parcela.First;
    while not dmFinanceiro.cdsConta_Receber_Parcela.Eof do
      begin
        if dmFinanceiro.cdsConta_Receber_ParcelaSTATUS.AsInteger = 1 then
          FIdsParcelasCancelar.Add(dmFinanceiro.cdsConta_Receber_ParcelaID.AsInteger);

        dmFinanceiro.cdsConta_Receber_Parcela.Delete;
      end;

    vaValorParcela := dmFinanceiro.cdsConta_ReceberVALOR_TOTAL.AsFloat / EditQtdeParcelas.Value;
    vaValorParcelado := 0;
    for I := 1 to EditQtdeParcelas.Value do
      begin
        vaValorParcela := RoundTo(vaValorParcela, -2); // arredonda para 2 casas

        if I = EditQtdeParcelas.Value then
          vaValorParcela := dmFinanceiro.cdsConta_ReceberVALOR_TOTAL.AsFloat - vaValorParcelado
        else
          vaValorParcelado := vaValorParcelado + vaValorParcela;

        ppvAdicionarParcela(I, IncMonth(EditVencimentoParcela.Date, I - 1), vaValorParcela);
      end;

    viewParcelasVALOR.Options.Editing := True;
  finally
    dmFinanceiro.cdsConta_Receber_Parcela.EnableControls;
  end;

end;

procedure TfrmContaReceber.ppvAdicionarParcela(ipParcela: Integer;
ipVencimento:
  TDate;
ipValor:
  Double);
begin
  dmFinanceiro.cdsConta_Receber_Parcela.Append;
  dmFinanceiro.cdsConta_Receber_ParcelaID.AsInteger := dmPrincipal.FuncoesGeral.fpuGetId('CONTA_RECEBER_PARCELA');
  dmFinanceiro.cdsConta_Receber_ParcelaVENCIMENTO.AsDateTime := ipVencimento;
  dmFinanceiro.cdsConta_Receber_ParcelaPARCELA.AsInteger := ipParcela;
  dmFinanceiro.cdsConta_Receber_ParcelaVALOR.AsFloat := ipValor;
  dmFinanceiro.cdsConta_Receber_ParcelaSTATUS.AsInteger := 0;
  dmFinanceiro.cdsConta_Receber_Parcela.Post;
end;

procedure TfrmContaReceber.Ac_Incluir_VinculoExecute(Sender: TObject);
begin
  inherited;
  ppvAddVinculo;
end;

procedure TfrmContaReceber.Ac_Baixar_ReabrirExecute(Sender: TObject);
begin
  inherited;
  if dmFinanceiro.cdsConta_Receber_ParcelaSTATUS.AsInteger = 0 then
    ppvReceberParcela
  else
    ppvCancelarRecebimento;
end;

procedure TfrmContaReceber.ppvReceberParcela;
begin
  dmPrincipal.FuncoesFinanceiro.ppuReceberParcela(dmFinanceiro.cdsConta_Receber_ParcelaID.AsInteger);

  dmFinanceiro.cdsConta_Receber_Parcela.Edit;
  dmFinanceiro.cdsConta_Receber_ParcelaDATA_RECEBIMENTO.AsDateTime := Now;
  dmFinanceiro.cdsConta_Receber_ParcelaSTATUS.AsInteger := 1;
  dmFinanceiro.cdsConta_Receber_Parcela.Post;

  if dmFinanceiro.cdsConta_Receber_Parcela.ChangeCount > 0 then
    dmFinanceiro.cdsConta_Receber_Parcela.MergeChangeLog;
end;

procedure TfrmContaReceber.ppvCancelarRecebimento;
begin
  dmPrincipal.FuncoesFinanceiro.ppuCancelarRecebimentoParcela(dmFinanceiro.cdsConta_Receber_ParcelaID.AsInteger);

  dmFinanceiro.cdsConta_Receber_Parcela.Edit;
  dmFinanceiro.cdsConta_Receber_ParcelaDATA_RECEBIMENTO.Clear;
  dmFinanceiro.cdsConta_Receber_ParcelaSTATUS.AsInteger := 0;
  dmFinanceiro.cdsConta_Receber_Parcela.Post;

  if dmFinanceiro.cdsConta_Receber_Parcela.ChangeCount > 0 then
    dmFinanceiro.cdsConta_Receber_Parcela.ApplyUpdates(0);
end;

procedure TfrmContaReceber.viewRegistrosDetailCustomDrawCell(
  Sender: TcxCustomGridTableView;
ACanvas:
  TcxCanvas;
AViewInfo:
  TcxGridTableDataCellViewInfo;
var
  ADone:
  Boolean);
begin
  inherited;
  if AViewInfo.GridRecord.Values[viewRegistrosDetailSTATUS.Index] = 1 then
    begin
      ACanvas.Font.Color := clWhite;
      if AViewInfo.GridRecord.Selected then
        ACanvas.Brush.Color := $00274F00
      else
        ACanvas.Brush.Color := clGreen;
    end
  else if AViewInfo.GridRecord.Values[viewRegistrosDetailVENCIMENTO.Index] < Today then
    begin
      ACanvas.Font.Color := clWhite;
      if AViewInfo.GridRecord.Selected then
        ACanvas.Brush.Color := clMaroon
      else
        ACanvas.Brush.Color := clRed;
    end;

end;

procedure TfrmContaReceber.Ac_Baixar_ReabrirUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := dmFinanceiro.cdsConta_Receber_Parcela.Active and (dmFinanceiro.cdsConta_Receber_Parcela.RecordCount > 0);

  if dmFinanceiro.cdsConta_Receber_Parcela.Active and (dmFinanceiro.cdsConta_Receber_ParcelaSTATUS.AsInteger = 0) then
    begin
      Ac_Baixar_Reabrir.ImageIndex := 8;
      Ac_Baixar_Reabrir.Caption := 'Baixar Parcela';
    end
  else
    begin
      Ac_Baixar_Reabrir.ImageIndex := 3;
      Ac_Baixar_Reabrir.Caption := 'Reabrir Parcela';
    end;
end;

procedure TfrmContaReceber.FormCreate(Sender: TObject);
begin
  dmFinanceiro := TdmFinanceiro.Create(Self);
  dmFinanceiro.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';
  inherited;

  FIdsParcelasCancelar := TList<Integer>.Create;

  PesquisaPadrao := tppData;

  EditDataInicialPesquisa.Date := Now;
  EditDataFinalPesquisa.Date := IncDay(Now, 7);

  dmLookup.cdslkFin_For_Cli.ppuDataRequest([TParametros.coTipo], [Ord(tfCliente)], TOperadores.coAnd, True);
  dmLookup.cdslkPlano_Contas.ppuDataRequest([TParametros.coTipo], [Ord(tpcReceita)], TOperadores.coAnd, True);
  dmLookup.cdslkConta_Corrente.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);

  dmLookup.cdslkFundo.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);

  pcDetails.ActivePage := tabDetail;
end;

procedure TfrmContaReceber.FormDestroy(Sender: TObject);
begin
  inherited;
  FIdsParcelasCancelar.Free;
end;

function TfrmContaReceber.fprConfigurarControlesPesquisa: TWinControl;
begin
  Result := inherited;
  cbPesquisaClienteFinanciador.Visible := cbPesquisarPor.EditValue = coPesquisaClienteFinanciador;
  cbPesquisaPlanoConta.Visible := cbPesquisarPor.EditValue = coPesquisaPlanoConta;
  cbPesquisaFundo.Visible := cbPesquisarPor.EditValue = coPesquisaFundo;
  EditPesquisa.Visible := EditPesquisa.Visible and
    (not(cbPesquisaClienteFinanciador.Visible or cbPesquisaPlanoConta.Visible or cbPesquisaFundo.Visible));

  if cbPesquisaClienteFinanciador.Visible then
    Result := cbPesquisaClienteFinanciador
  else if cbPesquisaPlanoConta.Visible then
    Result := cbPesquisaPlanoConta
  else if cbFundo.Visible then
    Result := cbFundo;
end;

function TfrmContaReceber.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoFinanceiro), Ord(finContaReceber));
end;

function TfrmContaReceber.fprHabilitarAlterarDetail: Boolean;
begin
  // nao chamar o inherited
  Result := False;
end;

function TfrmContaReceber.fprHabilitarSalvar: Boolean;
begin
  Result := inherited or fprHabilitarSalvarDetail or
    (dmFinanceiro.cdsConta_Receber_Vinculo.Active and (dmFinanceiro.cdsConta_Receber_Vinculo.ChangeCount > 0));
end;

end.
