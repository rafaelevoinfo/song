unit fLote;

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
  fBasicoCrudMasterDetail, cxSplitter, dmuPrincipal, cxMemo;

type
  TfrmLote = class(TfrmBasicoCrudMasterDetail)
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
    btnAbrirFecharLote: TButton;
    Ac_Reabrir_Lote: TAction;
    Ac_Fechar_Lote: TAction;
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
    EditQtdeGerminada: TcxDBCalcEdit;
    Label14: TLabel;
    EditDataVerificacao: TcxDBDateEdit;
    Ac_Pesquisar_Pessoa_Verificou: TAction;
    procedure FormCreate(Sender: TObject);
    procedure cbEspeciePropertiesEditValueChanged(Sender: TObject);
    procedure cbPessoaColetouKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ac_Pesquisar_PessoaExecute(Sender: TObject);
    procedure rgStatusPropertiesEditValueChanged(Sender: TObject);
    procedure Ac_Fechar_LoteExecute(Sender: TObject);
    procedure Ac_Reabrir_LoteExecute(Sender: TObject);
    procedure Ac_Fechar_LoteUpdate(Sender: TObject);
    procedure Ac_Pesquisar_Pessoa_SemeouExecute(Sender: TObject);
    procedure cbPessoaSemeouKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pcDetailsChange(Sender: TObject);
    procedure Ac_Pesquisar_Pessoa_VerificouExecute(Sender: TObject);
    procedure cbPessoaVerificouKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    dmViveiro: TdmViveiro;
    dmLookup: TdmLookup;

    procedure ppvConfigurarGrids;
    procedure ppvCarregarMatrizes;
    procedure ppvPesquisarPessoa(ipEditResultado: TcxDBLookupComboBox);
    procedure ppvCarregarPessoas(ipIdEspecifico: Integer);
    procedure ppvRemoverMatrizesOutrasEspecie;
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

    procedure pprExecutarCancelar; override;
    procedure pprValidarDadosDetail; override;
    procedure pprDefinirTabDetailCadastro; override;
  public

    procedure ppuIncluir; override;
    function fpuExcluirDetail(ipIds: TArray<Integer>): Boolean; override;
  public const
    coLoteAberto = 0;
    coLoteFechado = 1;
  end;

var
  frmLote: TfrmLote;

implementation

{$R *.dfm}


procedure TfrmLote.Ac_Fechar_LoteExecute(Sender: TObject);
begin
  inherited;
  if TMensagem.fpuPerguntar('Confirma o fechamento do lote. ' +
    'Após essa ação nenhuma outra operação será permitida para este lote.', ppSimNao) = rpSim then
    begin
      dmPrincipal.FuncoesViveiro.ppuFecharLoteSemente(dmViveiro.cdsLoteID.AsInteger);
      pprEfetuarPesquisa;
    end;
end;

procedure TfrmLote.Ac_Fechar_LoteUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := dmViveiro.cdsLote.Active and (dmViveiro.cdsLote.RecordCount > 0);
end;

procedure TfrmLote.Ac_Pesquisar_PessoaExecute(Sender: TObject);
begin
  inherited;
  ppvPesquisarPessoa(cbPessoaColetou);
end;

procedure TfrmLote.Ac_Pesquisar_Pessoa_SemeouExecute(Sender: TObject);
begin
  inherited;
  ppvPesquisarPessoa(cbPessoaSemeou);
end;

procedure TfrmLote.Ac_Pesquisar_Pessoa_VerificouExecute(Sender: TObject);
begin
  inherited;
  ppvPesquisarPessoa(cbPessoaVerificou);
end;

procedure TfrmLote.Ac_Reabrir_LoteExecute(Sender: TObject);
begin
  inherited;
  if TMensagem.fpuPerguntar('Confirma a reabertura do lote.', ppSimNao) = rpSim then
    begin
      dmPrincipal.FuncoesViveiro.ppuReabrirLoteSemente(dmViveiro.cdsLoteID.AsInteger);
      pprEfetuarPesquisa;
    end;
end;

procedure TfrmLote.ppvCarregarPessoas(ipIdEspecifico: Integer);
var
  vaValor: String;
begin
  dmLookup.cdslkPessoa.ppuLimparParametros;
  if ipIdEspecifico <> 0 then
    dmLookup.cdslkPessoa.ppuAddParametro(TParametros.coID, ipIdEspecifico, TOperadores.coOR);

  // recusado, cancelado, executado
  dmLookup.cdslkPessoa.ppuDataRequest([TParametros.coTipo], [Ord(trpFuncionario).ToString + ',' + Ord(trpEstagiario).ToString + ',' +
    Ord(trpVoluntario).ToString + ',' + Ord(trpMembroDiretoria).ToString]);
end;

procedure TfrmLote.ppvPesquisarPessoa(ipEditResultado: TcxDBLookupComboBox);
var
  vaFrmPessoa: TfrmPessoa;
begin
  inherited;
  vaFrmPessoa := TfrmPessoa.Create(nil);
  try
    vaFrmPessoa.ppuConfigurarModoExecucao(mePesquisa);

    vaFrmPessoa.ShowModal;
    if vaFrmPessoa.IdEscolhido <> 0 then
      begin
        if dmLookup.cdslkPessoa.Locate(TBancoDados.coID, vaFrmPessoa.IdEscolhido, []) then
          begin
            ipEditResultado.EditValue := vaFrmPessoa.IdEscolhido;
            ipEditResultado.PostEditValue;
          end
        else
          begin
            ppvCarregarPessoas(vaFrmPessoa.IdEscolhido);
            if dmLookup.cdslkPessoa.Locate(TBancoDados.coID, vaFrmPessoa.IdEscolhido, []) then
              begin
                ipEditResultado.EditValue := vaFrmPessoa.IdEscolhido;
                ipEditResultado.PostEditValue;
              end;
          end;

      end;
  finally
    vaFrmPessoa.Free;
  end;
end;

procedure TfrmLote.cbEspeciePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if (pcPrincipal.ActivePage = tabCadastro) and (dmViveiro.cdsLote.State in [dsEdit, dsInsert]) then
    begin
      cbEspecie.PostEditValue;
      ppvCarregarMatrizes;
      // caso tenha trocado de especie, todos os registros filho desse lote devem ser excluidos
      ppvRemoverMatrizesOutrasEspecie;
    end;
end;

procedure TfrmLote.ppvRemoverMatrizesOutrasEspecie;
begin
  cbEspecie.PostEditValue;
  dmViveiro.cdsLote_Matriz.DisableControls;
  try
    dmViveiro.cdsLote_Matriz.First;
    while not dmViveiro.cdsLote_Matriz.Eof do
      begin
        dmViveiro.cdsLote_Matriz.Delete;
      end;
  finally
    dmViveiro.cdsLote_Matriz.EnableControls;
  end;

end;

procedure TfrmLote.rgStatusPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if rgStatus.ItemIndex = coLoteAberto then
    btnAbrirFecharLote.Action := Ac_Fechar_Lote
  else
    btnAbrirFecharLote.Action := Ac_Reabrir_Lote;
end;

procedure TfrmLote.pcDetailsChange(Sender: TObject);
begin
  inherited;
  if pcDetails.ActivePage = tabDetail then
    dsDetail.DataSet := dmViveiro.cdsSemeadura
  else if pcDetails.ActivePage = tabDetailGerminacao then
    dsDetail.DataSet := dmViveiro.cdsGerminacao;

  if not dsDetail.DataSet.Active then
    dsDetail.DataSet.Open;
end;

procedure TfrmLote.pprAfterSalvarDetail;
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastroDetail then
    dmPrincipal.FuncoesViveiro.ppuAtualizarEstoqueSementeLote(dmViveiro.cdsLoteID.AsInteger)
  else if pcPrincipal.ActivePage = tabCadastroGerminacao then
    dmPrincipal.FuncoesViveiro.ppuAtualizarTaxaGerminacaoLote(dmViveiro.cdsLoteID.AsInteger);
end;

procedure TfrmLote.pprBeforeAlterar;
begin
  inherited;
  ppvCarregarMatrizes;
end;

procedure TfrmLote.pprBeforeIncluirDetail;
begin
  inherited;
  if pcDetails.ActivePage = tabDetail then
    begin
      if dmViveiro.cdsLoteQTDE_ARMAZENADA.AsFloat <= 0 then
        raise Exception.Create('Este lote já foi totalmente semeado.');
    end;
end;

procedure TfrmLote.pprBeforeSalvar;
begin
  inherited;
  if dmViveiro.cdsLote.State = dsInsert then
    begin
      dmViveiro.cdsLoteQTDE_ARMAZENADA.AsFloat := dmViveiro.cdsLoteQTDE.AsFloat;
    end;
end;

procedure TfrmLote.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  ipCds.ppuAddParametro(TParametros.coStatus, rgStatus.ItemIndex);

  if not VarIsNull(cbEspeciePesquisa.EditValue) then
    ipCds.ppuAddParametro(TParametros.coEspecie, cbEspeciePesquisa.EditValue);
end;

procedure TfrmLote.pprDefinirTabDetailCadastro;
begin
  inherited;
  if pcDetails.ActivePage = tabDetail then
    pcPrincipal.ActivePage := tabCadastroDetail
  else if pcDetails.ActivePage = tabDetailGerminacao then
    pcPrincipal.ActivePage := tabCadastroGerminacao;

end;

procedure TfrmLote.pprEfetuarPesquisa;
begin
  dmViveiro.cdsLote_Matriz.Close;
  inherited;
  dmViveiro.cdsLote_Matriz.Open;
end;

procedure TfrmLote.pprExecutarCancelar;
begin
  if dmViveiro.cdsLote_Matriz.ChangeCount > 0 then
    dmViveiro.cdsLote_Matriz.CancelUpdates;
  inherited;
end;

procedure TfrmLote.pprExecutarSalvar;
var
  vaEditando: Boolean;
begin
  vaEditando := dmViveiro.cdsLote.State = dsEdit;
  inherited;
  if vaEditando then
    dmPrincipal.FuncoesViveiro.ppuAtualizarEstoqueSementeLote(dmViveiro.cdsLoteID.AsInteger);

  if (dmViveiro.cdsLote_Matriz.ChangeCount > 0) then
    dmViveiro.cdsLote_Matriz.ApplyUpdates(0);
end;

procedure TfrmLote.pprValidarDadosDetail;
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastroDetail then
    dmPrincipal.FuncoesViveiro.ppuValidarSemeadura(dmViveiro.cdsLoteID.AsInteger, dmViveiro.cdsSemeaduraID.AsInteger,
      dmViveiro.cdsSemeaduraQTDE_SEMEADA.AsFloat);
end;

procedure TfrmLote.ppuIncluir;
begin
  inherited;
  ppvCarregarMatrizes;
  pprPreencherCamposPadroes(dmViveiro.cdsLote);
end;

procedure TfrmLote.ppvCarregarMatrizes;
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

      dmViveiro.cdsLote_Matriz.DisableControls;
      try
        TUtils.ppuPercorrerCds(dmLookup.cdslkMatriz,
          procedure
          begin
            if not dmViveiro.cdsLote_Matriz.Locate(dmViveiro.cdsLote_MatrizID_MATRIZ.FieldName, dmLookup.cdslkMatrizID.AsInteger, []) then
              begin
                cdsLocalMatrizes.Append;
                cdsLocalMatrizesID.AsInteger := dmLookup.cdslkMatrizID.AsInteger;
                cdsLocalMatrizes.Post;
              end;
          end);
      finally
        dmViveiro.cdsLote_Matriz.EnableControls;
      end;
    end;
end;

procedure TfrmLote.cbPessoaColetouKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvPesquisarPessoa(cbPessoaColetou);
end;

procedure TfrmLote.cbPessoaSemeouKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvPesquisarPessoa(cbPessoaSemeou);
end;

procedure TfrmLote.cbPessoaVerificouKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvPesquisarPessoa(cbPessoaVerificou);
end;

procedure TfrmLote.FormCreate(Sender: TObject);
begin
  dmViveiro := TdmViveiro.Create(Self);
  dmViveiro.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  inherited;

  PesquisaPadrao := tppData;

  ppvCarregarPessoas(0);
  dmLookup.cdslkEspecie.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);
  dmLookup.cdslkCanteiro.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);

  ppvConfigurarGrids;

  EditDataInicialPesquisa.Date := IncDay(Now, -7);
  EditDataFinalPesquisa.Date := Now;
end;

function TfrmLote.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro), Ord(vivLote));
end;

function TfrmLote.fprHabilitarAlterar: Boolean;
begin
  Result := inherited and dmViveiro.cdsLote.Active and (dmViveiro.cdsLoteSTATUS.AsInteger = 0);
end;

function TfrmLote.fprHabilitarSalvar: Boolean;
begin
  Result := inherited;
  if not Result then
    Result := dmViveiro.cdsLote_Matriz.Active and ((dmViveiro.cdsLote_Matriz.State in [dsEdit, dsInsert]) or
      (dmViveiro.cdsLote_Matriz.ChangeCount > 0));
end;

function TfrmLote.fpuExcluirDetail(ipIds: TArray<Integer>): Boolean;
begin

  if inherited then
    begin
      if pcDetails.ActivePage = tabDetail then
        dmPrincipal.FuncoesViveiro.ppuAtualizarEstoqueSementeLote(dmViveiro.cdsLoteID.AsInteger)
      else if pcDetails.ActivePage = tabDetailGerminacao then
        dmPrincipal.FuncoesViveiro.ppuAtualizarTaxaGerminacaoLote(dmViveiro.cdsLoteID.AsInteger);

      pprEfetuarPesquisa;
    end;
end;

procedure TfrmLote.ppvConfigurarGrids;
begin
  // Esquerda
  frameMatrizes.ppuAdicionarField(frameMatrizes.viewEsquerda, 'ID', dmLookup.replcbMatriz);
  // Direita
  frameMatrizes.ppuAdicionarField(frameMatrizes.viewDireita, 'ID_MATRIZ', dmLookup.replcbMatriz);
  // mapeando
  frameMatrizes.ppuMapearFields('ID', 'ID_MATRIZ');
end;

end.
