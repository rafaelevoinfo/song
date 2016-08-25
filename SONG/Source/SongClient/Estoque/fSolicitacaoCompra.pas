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
  dmuPrincipal, Vcl.ExtDlgs, fItem, ppDB, ppDBPipe, ppParameter, ppDesignLayer,
  ppModule, raCodMod, ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, ppStrtch, ppMemo, ppTableGrid;

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
    btnAprovar: TButton;
    btnNegar: TButton;
    Ac_Aprovar: TAction;
    Ac_Negar: TAction;
    btnGerarCompras: TButton;
    Ac_Gerar_Compras: TAction;
    lbUnidade: TLabel;
    cbPessoa: TcxLookupComboBox;
    cbItemPesquisa: TcxLookupComboBox;
    btnAdicionarItem: TButton;
    Ac_Incluir_Item: TAction;
    ColumnImprimir: TcxGridDBColumn;
    Ac_Imprimir_Autorizacao: TAction;
    ppAutorizacao: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDBImage2: TppDBImage;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLabel13: TppLabel;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppParameterList2: TppParameterList;
    DBPipeSolicitacao: TppDBPipeline;
    DBPipeItensSolicitacao: TppDBPipeline;
    raCodeModule1: TraCodeModule;
    DBPipeOrganizacao: TppDBPipeline;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppLabel2: TppLabel;
    ppShape3: TppShape;
    ppDBText2: TppDBText;
    ppShape4: TppShape;
    ppLabel3: TppLabel;
    ppShape5: TppShape;
    ppLabel4: TppLabel;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppShape8: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine3: TppLine;
    ppLine2: TppLine;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppShape9: TppShape;
    ppLine6: TppLine;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLabel17: TppLabel;
    ppShape10: TppShape;
    ppLabel1: TppLabel;
    ppLabel18: TppLabel;
    ppShape11: TppShape;
    ppLabel19: TppLabel;
    ppShape12: TppShape;
    ppLabel20: TppLabel;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppLine1: TppLine;
    ppShape13: TppShape;
    ppLabel21: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText5: TppDBText;
    ppLine11: TppLine;
    ppShape14: TppShape;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppSummaryBand1: TppSummaryBand;
    procedure FormCreate(Sender: TObject);
    procedure Ac_AprovarExecute(Sender: TObject);
    procedure Ac_NegarExecute(Sender: TObject);
    procedure Ac_AprovarUpdate(Sender: TObject);
    procedure Ac_NegarUpdate(Sender: TObject);
    procedure cbItemPropertiesEditValueChanged(Sender: TObject);
    procedure Ac_Gerar_ComprasExecute(Sender: TObject);
    procedure Ac_Gerar_ComprasUpdate(Sender: TObject);
    procedure Ac_Incluir_ItemExecute(Sender: TObject);
    procedure cbItemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Ac_Imprimir_AutorizacaoExecute(Sender: TObject);
    procedure viewRegistrosSTATUSCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    dmLookup: TdmLookup;
    dmEstoque: TdmEstoque;
    procedure ppvGerarRegistroCompras;
    procedure ppvValidarAprovacaoNegacao;
    procedure ppvAprovarNegar(ipStatus: TStatusSolicitacaoCompra);
    procedure ppvAdicionarItem;
    procedure ppvCarregarItens;
  protected
    function fprGetPermissao: string; override;
    procedure pprBeforeSalvar; override;
    procedure pprBeforeSalvarDetail; override;
    procedure pprValidarDados; override;

    procedure pprAfterSalvar(ipAcaoExecutada: TDataSetState); override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    function fprConfigurarControlesPesquisa: TWinControl; override;
    procedure pprValidarPesquisa; override;
    procedure pprBeforeAlterar; override;

    procedure pprBeforeIncluirDetail; override;
    procedure pprBeforeAlterarDetail; override;
    procedure pprBeforeExcluirDetail(ipId: Integer); override;

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

procedure TfrmSolicitacaoCompra.Ac_Imprimir_AutorizacaoExecute(Sender: TObject);
begin
  inherited;
  if dmEstoque.cdsSolicitacao_CompraSTATUS.AsInteger <> Ord(sscAprovada) then
    raise Exception.Create('So é possivel imprimir a autorização de compra para solicitações aprovadas.');

  // TODO: se houver mais de uma organizacao fazer aparecer uma tela para o ususario escolher a desejada
  if not dmLookup.cdslkOrganizacao.Active then
    dmLookup.cdslkOrganizacao.Open;

  //Precisa desabilitar os controles pq senao da um erro de parameter incorrect ao desenhar o cxGrid
  dmEstoque.cdsSolicitacao_Compra.DisableControls;
  dmEstoque.cdsSolicitacao_Compra_Item.DisableControls;
  try
    ppAutorizacao.PrintReport;
  finally
    dmEstoque.cdsSolicitacao_Compra_Item.EnableControls;
    dmEstoque.cdsSolicitacao_Compra.EnableControls;
  end;
end;

procedure TfrmSolicitacaoCompra.Ac_Incluir_ItemExecute(Sender: TObject);
begin
  inherited;
  ppvAdicionarItem;
end;

procedure TfrmSolicitacaoCompra.ppvAdicionarItem;
var
  vaFrmItem: TfrmItem;
begin
  vaFrmItem := TfrmItem.Create(nil);
  try
    vaFrmItem.ppuConfigurarModoExecucao(meSomenteCadastro);
    vaFrmItem.ShowModal;
    if vaFrmItem.IdEscolhido <> 0 then
      begin
        ppvCarregarItens;
        if dmLookup.cdslkItem.Locate(TBancoDados.coId, vaFrmItem.IdEscolhido, []) then
          begin
            cbItem.EditValue := vaFrmItem.IdEscolhido;
            cbItem.PostEditValue;
          end;
      end;
  finally
    vaFrmItem.Free;
  end;

end;

procedure TfrmSolicitacaoCompra.ppvCarregarItens();
begin
  dmLookup.cdslkItem.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);
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

procedure TfrmSolicitacaoCompra.cbItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvAdicionarItem;
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
  vaPergunta := '';
  vaCompraJaGerada := dmPrincipal.FuncoesEstoque.fpuVerificarComprasJaGerada(dmEstoque.cdsSolicitacao_CompraID.AsInteger);
  if vaCompraJaGerada then
    vaPergunta := 'Um registro no compras já foi gerado para essa solicitação. Tem certeza que deseja gerar outro?';

  if (vaPergunta='') or (TMensagem.fpuPerguntar(vaPergunta, ppSimNao) = rpSim) then
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
                vaItem.Id := dmEstoque.cdsSolicitacao_Compra_ItemID_ITEM.AsInteger;
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
  ppvCarregarItens;
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

procedure TfrmSolicitacaoCompra.pprAfterSalvar(ipAcaoExecutada: TDataSetState);
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

procedure TfrmSolicitacaoCompra.viewRegistrosSTATUSCustomDrawCell(
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
