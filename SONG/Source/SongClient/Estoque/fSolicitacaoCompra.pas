unit fSolicitacaoCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrudMasterDetail, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, System.Actions, Vcl.ActnList,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxGroupBox, cxRadioGroup, Vcl.StdCtrls,
  cxDropDownEdit, cxImageComboBox, cxTextEdit, cxMaskEdit, cxCalendar,
  Vcl.ExtCtrls, cxPC, cxCheckBox, cxCheckComboBox, dmuLookup,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, uTypes, System.DateUtils,
  cxSplitter, dmuEstoque, cxMemo, cxDBEdit, cxCalc, uClientDataSet,
  uControleAcesso, System.TypInfo, uMensagem, uExceptions, uUtils, fCompra,
  dmuPrincipal;

type
  TfrmSolicitacaoCompra = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_PESSOA_SOLICITOU: TcxGridDBColumn;
    viewRegistrosID_PESSOA_ANALISOU: TcxGridDBColumn;
    viewRegistrosDATA: TcxGridDBColumn;
    viewRegistrosDATA_ANALISE: TcxGridDBColumn;
    viewRegistrosSTATUS: TcxGridDBColumn;
    viewRegistrosSOLICITANTE: TcxGridDBColumn;
    viewRegistrosRESPONSAVEL_ANALISE: TcxGridDBColumn;
    cbStatusPesquisa: TcxCheckComboBox;
    Label3: TLabel;
    Label4: TLabel;
    cbSolicitante: TcxDBLookupComboBox;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_ITEM: TcxGridDBColumn;
    viewRegistrosDetailID_ESPECIE: TcxGridDBColumn;
    viewRegistrosDetailQTDE: TcxGridDBColumn;
    viewRegistrosDetailNOME_ITEM: TcxGridDBColumn;
    viewRegistrosDetailESPECIE: TcxGridDBColumn;
    EditDataSolicitacao: TcxDBDateEdit;
    Label5: TLabel;
    Label6: TLabel;
    EditObservacao: TcxDBMemo;
    lbl1: TLabel;
    cbItem: TcxDBLookupComboBox;
    lbl2: TLabel;
    cbEspecie: TcxDBLookupComboBox;
    EditQtde: TcxDBCalcEdit;
    Label7: TLabel;
    cbStatus: TcxDBImageComboBox;
    Label8: TLabel;
    btnAprovar: TButton;
    btnNegar: TButton;
    Ac_Aprovar: TAction;
    Ac_Negar: TAction;
    btnGerarCompras: TButton;
    Ac_Gerar_Compras: TAction;
    lbUnidade: TLabel;
    cbPessoa: TcxLookupComboBox;
    cbItemPesquisa: TcxLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Ac_AprovarExecute(Sender: TObject);
    procedure Ac_NegarExecute(Sender: TObject);
    procedure Ac_AprovarUpdate(Sender: TObject);
    procedure Ac_NegarUpdate(Sender: TObject);
    procedure viewRegistrosCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cbItemPropertiesEditValueChanged(Sender: TObject);
    procedure Ac_Gerar_ComprasExecute(Sender: TObject);
    procedure Ac_Gerar_ComprasUpdate(Sender: TObject);
  private
    dmLookup: TdmLookup;
    dmEstoque: TdmEstoque;
    procedure ppvGerarRegistroCompras;
    procedure ppvValidarAprovacaoNegacao;
    procedure ppvAprovarNegar(ipStatus: TStatusSolicitacaoCompra);
  protected
    function fprGetPermissao: string; override;
    procedure pprBeforeSalvar; override;
    procedure pprBeforeSalvarDetail; override;
    procedure pprValidarDados; override;

    procedure pprAfterSalvar; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    function fprConfigurarControlesPesquisa: TWinControl; override;
    procedure pprValidarPesquisa; override;
    procedure pprBeforeAlterar; override;

    procedure pprBeforeIncluirDetail; override;
    procedure pprBeforeAlterarDetail; override;
    procedure pprBeforeExcluirDetail(ipId:Integer);override;

  public
    procedure ppuIncluir; override;
  public const
    coPesquisaItem = 5;
    coPesquisaSolicitante = 6;
    coPesquisaAnalisador = 7;
  end;

var
  frmSolicitacaoCompra: TfrmSolicitacaoCompra;

implementation

{$R *.dfm}


procedure TfrmSolicitacaoCompra.Ac_AprovarExecute(Sender: TObject);
begin
  inherited;
  if TMensagem.fpuPerguntar('Confirma a aprovação desta solicitação? Após aprovada não poderá ser mais alterada.', ppSimNao) = rpSim then
    begin
      ppvAprovarNegar(sscAprovada);
    end;
end;

procedure TfrmSolicitacaoCompra.Ac_AprovarUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := fprHabilitarAlterar and (dmEstoque.cdsSolicitacao_CompraSTATUS.AsInteger <> Ord(sscAprovada));
end;

procedure TfrmSolicitacaoCompra.Ac_Gerar_ComprasExecute(Sender: TObject);
begin
  inherited;
  ppvGerarRegistroCompras;
end;

procedure TfrmSolicitacaoCompra.Ac_Gerar_ComprasUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := dmEstoque.cdsSolicitacao_Compra.Active and (dmEstoque.cdsSolicitacao_Compra.RecordCount > 0) and
    (dmEstoque.cdsSolicitacao_CompraSTATUS.AsInteger = Ord(sscAprovada));
end;

procedure TfrmSolicitacaoCompra.Ac_NegarExecute(Sender: TObject);
begin
  inherited;
  if TMensagem.fpuPerguntar('Confirma a negação desta solicitação?', ppSimNao) = rpSim then
    begin
      ppvAprovarNegar(sscNegada);
    end;
end;

procedure TfrmSolicitacaoCompra.ppvAprovarNegar(ipStatus: TStatusSolicitacaoCompra);
begin
  dmEstoque.cdsSolicitacao_Compra.Edit;
  dmEstoque.cdsSolicitacao_CompraSTATUS.AsInteger := Ord(ipStatus);
  dmEstoque.cdsSolicitacao_CompraDATA_ANALISE.AsDateTime := Now;
  dmEstoque.cdsSolicitacao_CompraID_PESSOA_ANALISOU.AsInteger := TInfoLogin.fpuGetInstance.Usuario.Id;
  dmEstoque.cdsSolicitacao_Compra.Post;

  if ipStatus = sscAprovada then
    ppvGerarRegistroCompras;
end;

procedure TfrmSolicitacaoCompra.Ac_NegarUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := fprHabilitarAlterar and (dmEstoque.cdsSolicitacao_CompraSTATUS.AsInteger <> Ord(sscNegada));
end;

procedure TfrmSolicitacaoCompra.cbItemPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbItem.PostEditValue;
  lbUnidade.Caption := dmLookup.cdslkItemUNIDADE.AsString;
  cbEspecie.Enabled := dmLookup.cdslkItemTIPO.AsInteger in ([Ord(tiSemente), Ord(tiMuda)]);

end;

procedure TfrmSolicitacaoCompra.ppvGerarRegistroCompras;
var
  vaFrmCompra: TfrmCompra;
  vaCompra: TCompra;
  vaItem: TItem;
  vaIdCompra: Integer;
  vaPergunta: string;
  vaCompraJaGerada: Boolean;
begin
  vaCompraJaGerada := dmPrincipal.FuncoesEstoque.fpuVerificarComprasJaGerada(dmEstoque.cdsSolicitacao_CompraID.AsInteger);
  if vaCompraJaGerada then
    vaPergunta := 'Um registro no compras já foi gerado para essa solicitação. Tem certeza que deseja gerar outro?'
  else
    vaPergunta := 'Deseja incluir um novo registro no compras?';

  if TMensagem.fpuPerguntar(vaPergunta, ppSimNao) = rpSim then
    begin
      vaFrmCompra := TfrmCompra.Create(nil);
      try
        vaCompra := TCompra.Create;
        vaCompra.Data := dmEstoque.cdsSolicitacao_CompraDATA.AsDateTime;
        vaCompra.IdPessoaComprou := dmEstoque.cdsSolicitacao_CompraID_PESSOA_ANALISOU.AsInteger;
        vaCompra.IdSolicitacao := dmEstoque.cdsSolicitacao_CompraID.AsInteger;

        vaFrmCompra.ppuConfigurarModoExecucao(meSomenteCadastro, vaCompra);
        vaFrmCompra.ShowModal;
        vaIdCompra := vaFrmCompra.IdEscolhido;
        if vaIdCompra <> 0 then
          begin
            dmEstoque.cdsSolicitacao_Compra_Item.First;
            while not dmEstoque.cdsSolicitacao_Compra_Item.Eof do
              begin
                vaItem := TItem.Create;
                vaItem.IdItem := dmEstoque.cdsSolicitacao_Compra_ItemID_ITEM.AsInteger;
                vaItem.IdEspecie := dmEstoque.cdsSolicitacao_Compra_ItemID_ESPECIE.AsInteger;
                vaItem.Qtde := dmEstoque.cdsSolicitacao_Compra_ItemQTDE.AsFloat;

                vaFrmCompra.Modelo := vaItem;
                vaFrmCompra.ppuIncluirDetail;
                vaFrmCompra.ShowModal;

                dmEstoque.cdsSolicitacao_Compra_Item.Next;
              end;

            TMensagem.ppuShowMessage('Compra gerada com sucesso.');
          end;
      finally
        vaFrmCompra.Free;
      end;
    end;
end;

procedure TfrmSolicitacaoCompra.viewRegistrosCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if AViewInfo.GridRecord.Values[viewRegistrosSTATUS.Index] = Ord(sscAprovada) then
    begin
      ACanvas.Font.Color := clWhite;
      if AViewInfo.GridRecord.Selected then
        ACanvas.Brush.Color := $00274F00
      else
        ACanvas.Brush.Color := clGreen;
    end
  else if AViewInfo.GridRecord.Values[viewRegistrosSTATUS.Index] = Ord(sscNegada) then
    begin
      ACanvas.Font.Color := clWhite;
      if AViewInfo.GridRecord.Selected then
        ACanvas.Brush.Color := clMaroon
      else
        ACanvas.Brush.Color := clRed;
    end;
end;

procedure TfrmSolicitacaoCompra.FormCreate(Sender: TObject);
begin
  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  dmEstoque := TdmEstoque.Create(Self);
  dmEstoque.Name := '';

  inherited;

  PesquisaPadrao := Ord(tppData);
  EditDataInicialPesquisa.Date := IncDay(Now, -7);;
  EditDataFinalPesquisa.Date := IncDay(Now, 7);

  dmLookup.ppuCarregarPessoas(0, [trpFuncionario, trpEstagiario, trpVoluntario, trpMembroDiretoria]);
  dmLookup.cdslkItem.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);
  dmLookup.cdslkEspecie.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);

end;

function TfrmSolicitacaoCompra.fprConfigurarControlesPesquisa: TWinControl;
begin
  Result := inherited;
  cbPessoa.Visible := (cbPesquisarPor.EditValue = coPesquisaSolicitante) or (cbPesquisarPor.EditValue = coPesquisaAnalisador);
  cbItemPesquisa.Visible := cbPesquisarPor.EditValue = coPesquisaItem;

  EditPesquisa.Visible := EditPesquisa.Visible and (not(cbItemPesquisa.Visible or cbPessoa.Visible));

  if cbPessoa.Visible then
    Result := cbPessoa
  else if cbItemPesquisa.Visible then
    Result := cbItemPesquisa;
end;

function TfrmSolicitacaoCompra.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoEstoque), Ord(estSolicitacaoCompra));
end;

procedure TfrmSolicitacaoCompra.pprAfterSalvar;
begin
  inherited;
  if dmEstoque.cdsSolicitacao_CompraSTATUS.AsInteger = Ord(sscAprovada) then
    begin
      ppvGerarRegistroCompras;
    end;
end;

procedure TfrmSolicitacaoCompra.pprBeforeAlterar;
begin
  inherited;
  if dmEstoque.cdsSolicitacao_CompraSTATUS.AsInteger = Ord(sscAprovada) then
    raise Exception.Create('Não é possível editar uma solicitação já aprovada.');
end;

procedure TfrmSolicitacaoCompra.pprBeforeAlterarDetail;
begin
  inherited;
  if dmEstoque.cdsSolicitacao_CompraSTATUS.AsInteger = Ord(sscAprovada) then
    raise Exception.Create('Não é possível editar um item de uma solicitação já aprovada.');
end;

procedure TfrmSolicitacaoCompra.pprBeforeExcluirDetail(ipId: Integer);
begin
  inherited;
  if dmEstoque.cdsSolicitacao_CompraSTATUS.AsInteger = Ord(sscAprovada) then
    raise Exception.Create('Não é possível excluir um item de uma solicitação já aprovada.');
end;

procedure TfrmSolicitacaoCompra.pprBeforeIncluirDetail;
begin
  inherited;
  if dmEstoque.cdsSolicitacao_CompraSTATUS.AsInteger = Ord(sscAprovada) then
    raise Exception.Create('Não é possível incluir um item de uma solicitação já aprovada.');
end;

procedure TfrmSolicitacaoCompra.pprBeforeSalvar;
begin
  inherited;
  if dmEstoque.cdsSolicitacao_CompraSTATUS.AsInteger = Ord(sscAprovada) then
    begin
      dmEstoque.cdsSolicitacao_CompraID_PESSOA_ANALISOU.AsInteger := TInfoLogin.fpuGetInstance.Usuario.Id;
      dmEstoque.cdsSolicitacao_CompraDATA_ANALISE.AsDateTime := Now;
    end;
end;

procedure TfrmSolicitacaoCompra.pprBeforeSalvarDetail;
begin
  inherited;
  // vamos garantir que somente itens do tipo smente e muda vao estar vinculados a uma especie
  if dmLookup.cdslkItemTIPO.AsInteger = Ord(tiOutro) then
    dmEstoque.cdsSolicitacao_Compra_ItemID_ESPECIE.Clear;
end;

procedure TfrmSolicitacaoCompra.pprCarregarParametrosPesquisa(
  ipCds: TRFClientDataSet);
var
  vaStatus: string;
begin
  inherited;
  vaStatus := TUtils.fpuExtrairValoresCheckComboBox(cbStatusPesquisa);
  if vaStatus <> '' then
    ipCds.ppuAddParametro(TParametros.coStatus, vaStatus);

  if cbPesquisarPor.EditValue = coPesquisaItem then
    ipCds.ppuAddParametro(TParametros.coItem, cbItemPesquisa.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaSolicitante then
    ipCds.ppuAddParametro(TParametros.coSolicitante, cbPessoa.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaAnalisador then
    ipCds.ppuAddParametro(TParametros.coResponsavelAnalise, cbPessoa.EditValue);
end;

procedure TfrmSolicitacaoCompra.ppvValidarAprovacaoNegacao;
begin
  if dmEstoque.cdsSolicitacao_Compra_Item.RecordCount = 0 then
    raise Exception.Create('Não é possível aprovar ou negar uma solicitação que não contenha nenhum item.');
end;

procedure TfrmSolicitacaoCompra.pprValidarDados;
begin
  inherited;
  if dmEstoque.cdsSolicitacao_CompraSTATUS.AsInteger in [Ord(sscAprovada), Ord(sscNegada)] then
    begin
      ppvValidarAprovacaoNegacao;

      if dmEstoque.cdsSolicitacao_CompraSTATUS.AsInteger = Ord(sscAprovada) then
        begin
          if TMensagem.fpuPerguntar('Ao aprovar uma solicitação não será mais possível editá-la. Tem certeza que deseja aprovar a solicitação?',
            ppSimNao) = rpNao then
            raise TPararExecucaoException.Create('');
        end;
    end;

end;

procedure TfrmSolicitacaoCompra.pprValidarPesquisa;
begin
  inherited;
  if cbPessoa.Visible and (VarIsNull(cbPessoa.EditValue)) then
    begin
      if cbPesquisarPor.EditValue = coPesquisaSolicitante then
        raise TControlException.Create('Informe o solicitante.', cbPessoa)
      else if cbPesquisarPor.EditValue = coPesquisaAnalisador then
        raise TControlException.Create('Informe o responsável.', cbPessoa);
    end;

  if cbItemPesquisa.Visible and (VarIsNull(cbItemPesquisa.EditValue)) then
    raise Exception.Create('Informe o item a ser pesquisado.');

end;

procedure TfrmSolicitacaoCompra.ppuIncluir;
begin
  inherited;
  dmEstoque.cdsSolicitacao_CompraSTATUS.AsInteger := Ord(sscSolicitacada);
  dmEstoque.cdsSolicitacao_CompraDATA.AsDateTime := Now;
end;

end.
