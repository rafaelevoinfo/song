unit fLote_Semente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrud, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, cxLocalization, System.Actions,
  Vcl.ActnList, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxGroupBox,
  cxRadioGroup, Vcl.StdCtrls, cxDropDownEdit, cxImageComboBox, cxTextEdit,
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuViveiro, cxDBEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCalc, fmGrids,
  Datasnap.DBClient, dmuLookup, uClientDataSet, uTypes, System.TypInfo,
  uControleAcesso, fPessoa, uUtils, System.DateUtils, uMensagem,
  fBasicoCrudMasterDetail, cxSplitter, dmuPrincipal, cxMemo, cxSpinEdit;

type
  TLoteSemente = class(TLote)
  private
    FQtde: Double;
    FIdPessoaColetou: Integer;
    procedure SetIdPessoaColetou(const Value: Integer);
  public
    property IdPessoaColetou: Integer read FIdPessoaColetou write SetIdPessoaColetou;    
  end;

  TfrmLoteSemente = class(TfrmBasicoCrudMasterDetail)
    pnMatrizes: TPanel;
    pnTopEditsCadastro: TPanel;
    Label3: TLabel;
    EditNome: TcxDBTextEdit;
    lbl1: TLabel;
    cbEspecie: TcxDBLookupComboBox;
    Label4: TLabel;
    cbPessoaColetou: TcxDBLookupComboBox;
    Label5: TLabel;
    EditData: TcxDBDateEdit;
    Label6: TLabel;
    EditQtde: TcxDBCalcEdit;
    frameMatrizes: TframeGrids;
    cdsLocalMatrizes: TClientDataSet;
    dsLocalMatrizes: TDataSource;
    cdsLocalMatrizesID: TIntegerField;
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_PESSOA_COLETOU: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosDATA: TcxGridDBColumn;
    viewRegistrosNOME_ESPECIE: TcxGridDBColumn;
    viewRegistrosQTDE: TcxGridDBColumn;
    btnPesquisarAtividade: TButton;
    Ac_Pesquisar_Pessoa: TAction;
    Label7: TLabel;
    cbEspeciePesquisa: TcxLookupComboBox;
    viewRegistrosQTDE_ARMAZENADA: TcxGridDBColumn;
    viewRegistrosQTDE_SEMEADA: TcxGridDBColumn;
    btnFinalizarReiniciarGerminacao: TButton;
    Ac_Reiniciar_Etapa_Germinacao: TAction;
    Ac_Finalizar_Etapa_Germinacao: TAction;
    viewRegistrosTAXA_GERMINACAO: TcxGridDBColumn;
    viewRegistrosTAXA_DESCARTE: TcxGridDBColumn;
    tabDetailGerminacao: TcxTabSheet;
    Label8: TLabel;
    cbPessoaSemeou: TcxDBLookupComboBox;
    btnPesquisar_Pessoa_Semeadura: TButton;
    Ac_Pesquisar_Pessoa_Semeou: TAction;
    cbCanteiro: TcxDBLookupComboBox;
    lbl2: TLabel;
    EditQtdeSemeada: TcxDBCalcEdit;
    Label9: TLabel;
    EditDataSemeadura: TcxDBDateEdit;
    Label10: TLabel;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_PESSOA_SEMEOU: TcxGridDBColumn;
    viewRegistrosDetailQTDE_SEMEADA: TcxGridDBColumn;
    viewRegistrosDetailDATA: TcxGridDBColumn;
    viewRegistrosDetailID_CANTEIRO: TcxGridDBColumn;
    EditObservacaoSemeadura: TcxDBMemo;
    Label11: TLabel;
    tabCadastroGerminacao: TcxTabSheet;
    viewRegistrosDetailPESSOA_SEMEOU: TcxGridDBColumn;
    viewRegistrosDetailNOME_CANTEIRO: TcxGridDBColumn;
    pn1: TPanel;
    btnactCnPrefixWizard: TButton;
    cxGrid1: TcxGrid;
    viewGerminacao: TcxGridDBTableView;
    level1: TcxGridLevel;
    dsGerminacao: TDataSource;
    viewGerminacaoID: TcxGridDBColumn;
    viewGerminacaoDATA: TcxGridDBColumn;
    viewGerminacaoQTDE_GERMINADA: TcxGridDBColumn;
    viewGerminacaoPESSOA_VERIFICOU: TcxGridDBColumn;
    ColumnAlterarGerminacao: TcxGridDBColumn;
    ColumnExcluirGerminacao: TcxGridDBColumn;
    pnBotoesCadastroGerminacao: TPanel;
    btnSalvar_Germinacao: TButton;
    btnCancelar_Germinacao: TButton;
    btnSalvar_Incluir_Germinacao: TButton;
    pnEditsCadastroGerminacao: TPanel;
    Label12: TLabel;
    cbPessoaVerificou: TcxDBLookupComboBox;
    btnPesquisar_Pessoa_Verificou: TButton;
    Label13: TLabel;
    Label14: TLabel;
    EditDataVerificacao: TcxDBDateEdit;
    Ac_Pesquisar_Pessoa_Verificou: TAction;
    Label15: TLabel;
    EditDataPrevistaGerminacao: TcxDBDateEdit;
    viewRegistrosDetailDATA_PREVISTA_GERMINACAO: TcxGridDBColumn;
    lbl3: TLabel;
    viewRegistrosDetailQTDE_TUBETE: TcxGridDBColumn;
    EditQtdeTubete: TcxDBSpinEdit;
    EditQtdeGerminada: TcxDBSpinEdit;
    viewRegistrosID_ESPECIE: TcxGridDBColumn;
    viewRegistrosPESSOA_COLETOU: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure cbEspeciePropertiesEditValueChanged(Sender: TObject);
    procedure cbPessoaColetouKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ac_Pesquisar_PessoaExecute(Sender: TObject);
    procedure rgStatusPropertiesEditValueChanged(Sender: TObject);
    procedure Ac_Finalizar_Etapa_GerminacaoExecute(Sender: TObject);
    procedure Ac_Reiniciar_Etapa_GerminacaoExecute(Sender: TObject);
    procedure Ac_Finalizar_Etapa_GerminacaoUpdate(Sender: TObject);
    procedure Ac_Pesquisar_Pessoa_SemeouExecute(Sender: TObject);
    procedure cbPessoaSemeouKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pcDetailsChange(Sender: TObject);
    procedure Ac_Pesquisar_Pessoa_VerificouExecute(Sender: TObject);
    procedure cbPessoaVerificouKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditDataSemeaduraPropertiesEditValueChanged(Sender: TObject);
  private
    dmViveiro: TdmViveiro;
    dmLookup: TdmLookup;

    procedure ppvConfigurarGrids;
    procedure ppvCarregarMatrizes;
    procedure ppvRemoverMatrizesOutrasEspecie;

    function fpvGerminacaoEmAndamento: Boolean;
  protected
    procedure pprBeforeIncluirDetail; override;
    procedure pprBeforeAlterar; override;
    procedure pprEfetuarPesquisa; override;

    function fprHabilitarSalvar(): Boolean; override;
    procedure pprBeforeSalvar; override;
    procedure pprExecutarSalvar; override;
    procedure pprAfterSalvarDetail; override;
    function fprGetPermissao: String; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    function fprHabilitarAlterar: Boolean; override;
    function fprHabilitarIncluirDetail: Boolean; override;
    function fprHabilitarAlterarDetail: Boolean; override;

    procedure pprExecutarCancelar; override;
    procedure pprValidarDadosDetail; override;
    procedure pprDefinirTabDetailCadastro; override;

    procedure pprCarregarDadosModelo; override;
  public

    procedure ppuIncluir; override;
    function fpuExcluirDetail(ipIds: TArray<Integer>): Boolean; override;

  public const
    coLoteAberto = 0;
    coLoteFechado = 1;
    coTiposPessoaPadrao: Set of TTipoRelacionamentoPessoa = [trpFuncionario, trpEstagiario, trpVoluntario, trpMembroDiretoria];
  end;

var
  frmLoteSemente: TfrmLoteSemente;

implementation

{$R *.dfm}


procedure TfrmLoteSemente.Ac_Finalizar_Etapa_GerminacaoExecute(Sender: TObject);
begin
  inherited;
  if TMensagem.fpuPerguntar('Confirma a finalização da etapa de germinação desse lote. ' +
    'Após essa ação nenhuma outra operação será permitida para este lote.', ppSimNao) = rpSim then
    begin
      dmPrincipal.FuncoesViveiro.ppuFinalizarEtapaGerminacaoLote(dmViveiro.cdsLote_SementeID.AsInteger);
      pprEfetuarPesquisa;
    end;
end;

procedure TfrmLoteSemente.Ac_Finalizar_Etapa_GerminacaoUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := dmViveiro.cdsLote_Semente.Active and (dmViveiro.cdsLote_Semente.RecordCount > 0);
end;

procedure TfrmLoteSemente.Ac_Pesquisar_PessoaExecute(Sender: TObject);
begin
  inherited;
  dmLookup.ppuPesquisarPessoa(cbPessoaColetou, coTiposPessoaPadrao);
end;

procedure TfrmLoteSemente.Ac_Pesquisar_Pessoa_SemeouExecute(Sender: TObject);
begin
  inherited;
  dmLookup.ppuPesquisarPessoa(cbPessoaSemeou, coTiposPessoaPadrao);
end;

procedure TfrmLoteSemente.Ac_Pesquisar_Pessoa_VerificouExecute(Sender: TObject);
begin
  inherited;
  dmLookup.ppuPesquisarPessoa(cbPessoaVerificou, coTiposPessoaPadrao);
end;

procedure TfrmLoteSemente.Ac_Reiniciar_Etapa_GerminacaoExecute(Sender: TObject);
begin
  inherited;
  if TMensagem.fpuPerguntar('Confirma a reinicialização do estado de germinação do lote?', ppSimNao) = rpSim then
    begin
      dmPrincipal.FuncoesViveiro.ppuReiniciarEtapaGerminacaoLote(dmViveiro.cdsLote_SementeID.AsInteger);
      pprEfetuarPesquisa;
    end;
end;

procedure TfrmLoteSemente.cbEspeciePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if (pcPrincipal.ActivePage = tabCadastro) and (dmViveiro.cdsLote_Semente.State in [dsEdit, dsInsert]) then
    begin
      cbEspecie.PostEditValue;
      ppvCarregarMatrizes;
      // caso tenha trocado de especie, todos os registros filho desse lote devem ser excluidos
      ppvRemoverMatrizesOutrasEspecie;
    end;
end;

procedure TfrmLoteSemente.ppvRemoverMatrizesOutrasEspecie;
begin
  cbEspecie.PostEditValue;
  dmViveiro.cdsLote_Semente_Matriz.DisableControls;
  try
    dmViveiro.cdsLote_Semente_Matriz.First;
    while not dmViveiro.cdsLote_Semente_Matriz.Eof do
      begin
        dmViveiro.cdsLote_Semente_Matriz.Delete;
      end;
  finally
    dmViveiro.cdsLote_Semente_Matriz.EnableControls;
  end;

end;

procedure TfrmLoteSemente.rgStatusPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if rgStatus.ItemIndex = coLoteAberto then
    btnFinalizarReiniciarGerminacao.Action := Ac_Finalizar_Etapa_Germinacao
  else
    btnFinalizarReiniciarGerminacao.Action := Ac_Reiniciar_Etapa_Germinacao;
end;

procedure TfrmLoteSemente.pcDetailsChange(Sender: TObject);
begin
  inherited;
  if pcDetails.ActivePage = tabDetail then
    dsDetail.DataSet := dmViveiro.cdsSemeadura
  else if pcDetails.ActivePage = tabDetailGerminacao then
    dsDetail.DataSet := dmViveiro.cdsGerminacao;

  if not dsDetail.DataSet.Active then
    begin
      dsDetail.DataSet.Open;
      if dsDetail.DataSet = dmViveiro.cdsSemeadura then
        begin
          dmLookup.ppuCarregarPessoasAvulsas(dmViveiro.cdsSemeadura, dmViveiro.cdsSemeaduraID_PESSOA_SEMEOU.FieldName,
            dmViveiro.cdsSemeaduraPESSOA_SEMEOU.FieldName);
        end
      else if dsDetail.DataSet = dmViveiro.cdsGerminacao then
        begin
          dmLookup.ppuCarregarPessoasAvulsas(dmViveiro.cdsGerminacao, dmViveiro.cdsGerminacaoID_PESSOA_VERIFICOU.FieldName,
            dmViveiro.cdsGerminacaoPESSOA_VERIFICOU.FieldName);
        end;
    end;
end;

procedure TfrmLoteSemente.pprBeforeAlterar;
begin
  inherited;
  ppvCarregarMatrizes;
end;

procedure TfrmLoteSemente.pprBeforeIncluirDetail;
begin
  inherited;
  if pcDetails.ActivePage = tabDetail then
    begin
      if dmViveiro.cdsLote_SementeQTDE_ARMAZENADA.AsFloat <= 0 then
        raise Exception.Create('Este lote já foi totalmente semeado.');
    end;
end;

procedure TfrmLoteSemente.pprBeforeSalvar;
begin
  inherited;
  if dmViveiro.cdsLote_Semente.State = dsInsert then
    begin
      dmViveiro.cdsLote_SementeQTDE_ARMAZENADA.AsFloat := dmViveiro.cdsLote_SementeQTDE.AsFloat;
    end;
end;

procedure TfrmLoteSemente.pprCarregarDadosModelo;
var
  vaLote: TLoteSemente;

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
  if (ModoExecucao in [meSomenteCadastro, meSomenteEdicao]) and Assigned(Modelo) and (Modelo is TLoteSemente) then
    begin
      vaLote := TLoteSemente(Modelo);

      plSetEdit(EditNome, vaLote.Nome);
      if vaLote.IdPessoaColetou <> 0 then
        plSetEdit(cbPessoaColetou, vaLote.IdPessoaColetou);

      if vaLote.Data <> 0 then
        plSetEdit(EditData, vaLote.Data);

      if vaLote.Qtde <> 0 then
        plSetEdit(EditQtde, vaLote.Qtde);

      if vaLote.IdEspecie <> 0 then
        plSetEdit(cbEspecie, vaLote.IdEspecie);
    end;

end;

procedure TfrmLoteSemente.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  ipCds.ppuAddParametro(TParametros.coStatus, rgStatus.ItemIndex);

  if not VarIsNull(cbEspeciePesquisa.EditValue) then
    ipCds.ppuAddParametro(TParametros.coEspecie, cbEspeciePesquisa.EditValue);
end;

procedure TfrmLoteSemente.pprDefinirTabDetailCadastro;
begin
  inherited;
  if pcDetails.ActivePage = tabDetail then
    pcPrincipal.ActivePage := tabCadastroDetail
  else if pcDetails.ActivePage = tabDetailGerminacao then
    pcPrincipal.ActivePage := tabCadastroGerminacao;

end;

procedure TfrmLoteSemente.pprEfetuarPesquisa;
begin
  dmViveiro.cdsLote_Semente_Matriz.Close;
  inherited;
  dmViveiro.cdsLote_Semente_Matriz.Open;

  dmLookup.ppuCarregarPessoasAvulsas(dmViveiro.cdsLote_Semente, dmViveiro.cdsLote_SementeID_PESSOA_COLETOU.FieldName,
    dmViveiro.cdsLote_SementePESSOA_COLETOU.FieldName);
  dmLookup.ppuCarregarPessoasAvulsas(dmViveiro.cdsGerminacao, dmViveiro.cdsGerminacaoID_PESSOA_VERIFICOU.FieldName,
    dmViveiro.cdsGerminacaoPESSOA_VERIFICOU.FieldName);
  dmLookup.ppuCarregarPessoasAvulsas(dmViveiro.cdsSemeadura, dmViveiro.cdsSemeaduraID_PESSOA_SEMEOU.FieldName,
    dmViveiro.cdsSemeaduraPESSOA_SEMEOU.FieldName);

end;

procedure TfrmLoteSemente.pprExecutarCancelar;
begin
  if dmViveiro.cdsLote_Semente_Matriz.ChangeCount > 0 then
    dmViveiro.cdsLote_Semente_Matriz.CancelUpdates;
  inherited;
end;

procedure TfrmLoteSemente.pprExecutarSalvar;
var
  vaEditando: Boolean;
begin
  vaEditando := dmViveiro.cdsLote_Semente.State = dsEdit;
  inherited;
  if vaEditando then
    dmPrincipal.FuncoesViveiro.ppuAtualizarEstoqueLoteSemente(dmViveiro.cdsLote_SementeID.AsInteger);

  if (dmViveiro.cdsLote_Semente_Matriz.ChangeCount > 0) then
    dmViveiro.cdsLote_Semente_Matriz.ApplyUpdates(0);
end;

procedure TfrmLoteSemente.pprAfterSalvarDetail;
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastroDetail then
    dmPrincipal.FuncoesViveiro.ppuAtualizarEstoqueLoteSemente(dmViveiro.cdsLote_SementeID.AsInteger)
  else if pcPrincipal.ActivePage = tabCadastroGerminacao then
    dmPrincipal.FuncoesViveiro.ppuAtualizarTaxaGerminacaoLote(dmViveiro.cdsLote_SementeID.AsInteger);
end;

procedure TfrmLoteSemente.pprValidarDadosDetail;
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastroDetail then
    dmPrincipal.FuncoesViveiro.ppuValidarSemeadura(dmViveiro.cdsLote_SementeID.AsInteger, dmViveiro.cdsSemeaduraID.AsInteger,
      dmViveiro.cdsSemeaduraQTDE_SEMEADA.AsFloat);
end;

procedure TfrmLoteSemente.ppuIncluir;
begin
  inherited;
  ppvCarregarMatrizes;
  pprPreencherCamposPadroes(dmViveiro.cdsLote_Semente);
end;

procedure TfrmLoteSemente.ppvCarregarMatrizes;
begin
  cbEspecie.PostEditValue;

  if cdsLocalMatrizes.Active then
    cdsLocalMatrizes.EmptyDataSet
  else
    cdsLocalMatrizes.CreateDataSet;

  if not VarIsNull(cbEspecie.EditValue) then
    begin
      if (not dmLookup.cdslkMatriz.Active) or (dmLookup.cdslkMatrizID_ESPECIE.AsInteger <> cbEspecie.EditValue) then
        begin
          dmLookup.cdslkMatriz.ppuDataRequest([TParametros.coEspecie], [cbEspecie.EditValue], TOperadores.coAnd, true);
        end;

      dmViveiro.cdsLote_Semente_Matriz.DisableControls;
      try
        TUtils.ppuPercorrerCds(dmLookup.cdslkMatriz,
          procedure
          begin
            if not dmViveiro.cdsLote_Semente_Matriz.Locate(dmViveiro.cdsLote_Semente_MatrizID_MATRIZ.FieldName, dmLookup.cdslkMatrizID.AsInteger, [])
            then
              begin
                cdsLocalMatrizes.Append;
                cdsLocalMatrizesID.AsInteger := dmLookup.cdslkMatrizID.AsInteger;
                cdsLocalMatrizes.Post;
              end;
          end);
      finally
        dmViveiro.cdsLote_Semente_Matriz.EnableControls;
      end;
    end;
end;

procedure TfrmLoteSemente.cbPessoaColetouKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    dmLookup.ppuPesquisarPessoa(cbPessoaColetou, coTiposPessoaPadrao);
end;

procedure TfrmLoteSemente.cbPessoaSemeouKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    dmLookup.ppuPesquisarPessoa(cbPessoaSemeou, coTiposPessoaPadrao);
end;

procedure TfrmLoteSemente.cbPessoaVerificouKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    dmLookup.ppuPesquisarPessoa(cbPessoaVerificou, coTiposPessoaPadrao);
end;

procedure TfrmLoteSemente.EditDataSemeaduraPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastroDetail then
    begin
      if not VarIsNull(EditDataSemeadura.EditValue) then
        begin
          if dmLookup.cdslkEspecie.Locate(TBancoDados.coID, dmViveiro.cdsLote_SementeID_ESPECIE.AsInteger, []) then
            begin
              if not(dmViveiro.cdsSemeadura.State in [dsEdit, dsInsert]) then
                dmViveiro.cdsSemeadura.Edit;

              dmViveiro.cdsSemeaduraDATA_PREVISTA_GERMINACAO.AsDateTime :=
                IncDay(EditDataSemeadura.Date, dmLookup.cdslkEspecieTEMPO_GERMINACAO.AsInteger);
            end;
        end;
    end;
end;

procedure TfrmLoteSemente.FormCreate(Sender: TObject);
begin
  dmViveiro := TdmViveiro.Create(Self);
  dmViveiro.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  inherited;

  PesquisaPadrao := tppData;

  dmLookup.ppuCarregarPessoas(0, coTiposPessoaPadrao);
  dmLookup.cdslkEspecie.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);
  dmLookup.cdslkCanteiro.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);

  ppvConfigurarGrids;

  EditDataInicialPesquisa.Date := IncDay(Now, -7);
  EditDataFinalPesquisa.Date := Now;
end;

function TfrmLoteSemente.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro), Ord(vivLoteSemente));
end;

function TfrmLoteSemente.fprHabilitarAlterar: Boolean;
begin
  Result := inherited and fpvGerminacaoEmAndamento;
end;

function TfrmLoteSemente.fprHabilitarAlterarDetail: Boolean;
begin
  Result := inherited and fpvGerminacaoEmAndamento;
end;

function TfrmLoteSemente.fprHabilitarIncluirDetail: Boolean;
begin
  Result := inherited and fpvGerminacaoEmAndamento;
end;

function TfrmLoteSemente.fprHabilitarSalvar: Boolean;
begin
  Result := inherited;
  if not Result then
    Result := dmViveiro.cdsLote_Semente_Matriz.Active and ((dmViveiro.cdsLote_Semente_Matriz.State in [dsEdit, dsInsert]) or
      (dmViveiro.cdsLote_Semente_Matriz.ChangeCount > 0));
end;

function TfrmLoteSemente.fpuExcluirDetail(ipIds: TArray<Integer>): Boolean;
begin
  Result := inherited;
  if Result then
    begin
      if pcDetails.ActivePage = tabDetail then
        dmPrincipal.FuncoesViveiro.ppuAtualizarEstoqueLoteSemente(dmViveiro.cdsLote_SementeID.AsInteger)
      else if pcDetails.ActivePage = tabDetailGerminacao then
        dmPrincipal.FuncoesViveiro.ppuAtualizarTaxaGerminacaoLote(dmViveiro.cdsLote_SementeID.AsInteger);

      pprEfetuarPesquisa;
    end;
end;

function TfrmLoteSemente.fpvGerminacaoEmAndamento: Boolean;
begin
  Result := dmViveiro.cdsLote_Semente.Active and (dmViveiro.cdsLote_SementeSTATUS.AsInteger = 0);
end;

procedure TfrmLoteSemente.ppvConfigurarGrids;
begin
  // Esquerda
  frameMatrizes.ppuAdicionarField(frameMatrizes.viewEsquerda, 'ID', dmLookup.replcbMatriz);
  // Direita
  frameMatrizes.ppuAdicionarField(frameMatrizes.viewDireita, 'ID_MATRIZ', dmLookup.replcbMatriz);
  // mapeando
  frameMatrizes.ppuMapearFields('ID', 'ID_MATRIZ');
end;

{ TLoteSemente }

procedure TLoteSemente.SetIdPessoaColetou(const Value: Integer);
begin
  FIdPessoaColetou := Value;
end;

end.
