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
  fBasicoCrudMasterDetail, cxSplitter, dmuPrincipal, cxMemo, cxSpinEdit,
  fCanteiro, System.Generics.Collections, Vcl.ExtDlgs;

type
  TLoteSemente = class(TLote)
  private
    FIdPessoaColetou: Integer;
    FIdLoteOrigem: Integer;
    FIdCamaraFria: Integer;
    FMatrizes: TList<Integer>;
    procedure SetIdPessoaColetou(const Value: Integer);
    procedure SetIdLoteOrigem(const Value: Integer);
    procedure SetIdCamaraFria(const Value: Integer);
    procedure SetMatrizes(const Value: TList<Integer>);
  public
    constructor Create;
    Destructor Destroy; override;

    property IdPessoaColetouComprou: Integer read FIdPessoaColetou write SetIdPessoaColetou;
    property IdLoteOrigem: Integer read FIdLoteOrigem write SetIdLoteOrigem;
    property IdCamaraFria: Integer read FIdCamaraFria write SetIdCamaraFria;

    property Matrizes: TList<Integer> read FMatrizes write SetMatrizes;
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
    cbCamaraFria: TcxDBLookupComboBox;
    Label16: TLabel;
    viewRegistrosCAMARA_FRIA: TcxGridDBColumn;
    tabDetailMatrizes: TcxTabSheet;
    cxGrid2: TcxGrid;
    viewMatrizes: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    viewMatrizesID: TcxGridDBColumn;
    viewMatrizesID_LOTE_SEMENTE: TcxGridDBColumn;
    viewMatrizesID_MATRIZ: TcxGridDBColumn;
    dsLote_Semente_Matriz: TDataSource;
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
    procedure EditQtdeTubetePropertiesEditValueChanged(Sender: TObject);
    procedure frameMatrizesbtnAddClick(Sender: TObject);
    procedure viewRegistrosFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure tabDetailMatrizesShow(Sender: TObject);
  private
    dmViveiro: TdmViveiro;
    dmLookup: TdmLookup;

    procedure ppvConfigurarGrids;
    procedure ppvCarregarMatrizes(ipAbaCadastro: Boolean = true);
    procedure ppvRemoverMatrizesOutrasEspecie;

    function fpvGerminacaoEmAndamento: Boolean;
    procedure ppvGerarLoteMudas;
    procedure ppvGerarLoteSemente(ipQuantidadeInicial: Double);
  protected
    procedure pprBeforeIncluirDetail; override;
    procedure pprBeforeAlterar; override;
    procedure pprEfetuarPesquisa; override;

    function fprHabilitarSalvar(): Boolean; override;
    procedure pprBeforeSalvar; override;
    procedure pprBeforeSalvarDetail; override;

    procedure pprExecutarSalvar; override;
    function fprGetPermissao: String; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    function fprHabilitarAlterar: Boolean; override;
    function fprHabilitarIncluirDetail: Boolean; override;
    function fprHabilitarAlterarDetail: Boolean; override;

    procedure pprExecutarCancelar; override;
    procedure pprValidarDadosDetail; override;
    procedure pprDefinirTabDetailCadastro; override;

    procedure pprCarregarDadosModelo; override;

    procedure pprBeforeIncluir; override;
  public
    procedure ppuIncluir; override;
    procedure ppuIncluirDetail; override;
    function fpuExcluirDetail(ipIds: TArray<Integer>): Boolean; override;

    procedure ppuRetornar(ipAtualizar: Boolean); override;

  public const
    coLoteAberto = 0;
    coLoteFechado = 1;
    coTiposPessoaPadrao: Set of TTipoRelacionamentoPessoa = [trpFuncionario, trpEstagiario, trpVoluntario, trpMembroDiretoria];
  end;

var
  frmLoteSemente: TfrmLoteSemente;

implementation

uses
  fLote_Muda;

{$R *.dfm}


procedure TfrmLoteSemente.ppvGerarLoteSemente(ipQuantidadeInicial: Double);
var
  vaLoteSemente: TLoteSemente;
begin
  vaLoteSemente := TLoteSemente.Create;
  try
    vaLoteSemente.Id := dmPrincipal.FuncoesGeral.fpuGetId('LOTE_SEMENTE');
    vaLoteSemente.Nome := dmViveiro.cdsLote_SementeNOME.AsString;
    vaLoteSemente.Qtde := ipQuantidadeInicial;
    vaLoteSemente.IdLoteOrigem := dmViveiro.cdsLote_SementeID.AsInteger;
    vaLoteSemente.IdPessoaColetouComprou := dmViveiro.cdsLote_SementeID_PESSOA_COLETOU.AsInteger;
    vaLoteSemente.IdEspecie := dmViveiro.cdsLote_SementeID_ESPECIE.AsInteger;
    vaLoteSemente.IdCamaraFria := dmViveiro.cdsLote_SementeID_CAMARA_FRIA.AsInteger;
    vaLoteSemente.Data := now;

    dmViveiro.cdsLote_Semente_Matriz.First;
    while not dmViveiro.cdsLote_Semente_Matriz.eof do
      begin
        vaLoteSemente.Matrizes.Add(dmViveiro.cdsLote_Semente_MatrizID_MATRIZ.AsInteger);
        dmViveiro.cdsLote_Semente_Matriz.Next;
      end;

    ppuConfigurarModoExecucao(meSomenteCadastro, vaLoteSemente);

    ppuIncluir;
    ppuSalvar;
  finally
    ppuConfigurarModoExecucao(meNormal, nil);

    ppuRetornar(false);
  end;
end;

procedure TfrmLoteSemente.Ac_Finalizar_Etapa_GerminacaoExecute(Sender: TObject);
var
  vaQuantidade: Double;
  vaResposta: TRespostaPadrao;
begin
  inherited;
  vaResposta := rpNao;
  if not dmViveiro.cdsGerminacao.Active then
    dmViveiro.cdsGerminacao.Open;

  if dmViveiro.cdsGerminacao.RecordCount = 0 then
    raise Exception.Create('Nenhum registro de germinação foi incluido.' +
      ' É necessário que seja informado algum registro de germinação para que seja possível gerar um lote de muda.');

  if TMensagem.fpuPerguntar('Confirma a finalização da etapa de germinação desse lote. ' +
    'Após essa ação um lote de mudas será gerado automaticamente.', ppSimNao) = rpSim then
    begin
      if dmViveiro.cdsLote_SementeQTDE_ARMAZENADA.AsFloat > 0 then
        begin
          vaResposta := TMensagem.fpuPerguntar('O lote atual não foi totalmente semeado. Deseja gerar um novo lote de semente com o valor restante?',
            ppSimNaoCancelar);

          if vaResposta = rpSim then
            begin
              vaQuantidade := dmViveiro.cdsLote_SementeQTDE_ARMAZENADA.AsFloat;

              dmViveiro.cdsLote_Semente.Edit;
              dmViveiro.cdsLote_SementeQTDE.AsFloat := dmViveiro.cdsLote_SementeQTDE.AsFloat - dmViveiro.cdsLote_SementeQTDE_ARMAZENADA.AsFloat;
              dmViveiro.cdsLote_SementeSTATUS.AsInteger := coLoteFechado;
              dmViveiro.cdsLote_Semente.Post;

              ppvGerarLoteMudas;
              ppvGerarLoteSemente(vaQuantidade);
            end
          else if vaResposta = rpCancelar then
            begin
              Exit;
            end;
        end;

      if vaResposta = rpNao then
        begin
          dmViveiro.cdsLote_Semente.Edit;
          dmViveiro.cdsLote_SementeSTATUS.AsInteger := coLoteFechado;
          dmViveiro.cdsLote_Semente.Post;

          ppvGerarLoteMudas;
        end;

      pprEfetuarPesquisa;

    end;

end;

procedure TfrmLoteSemente.ppvGerarLoteMudas;
var
  vaFrmLoteMuda: TfrmLoteMuda;
  vaLoteMuda: TLoteMuda;
  vaIdsExcluir: TArray<Integer>;
begin
  // realizando a entrada de muda
  vaFrmLoteMuda := TfrmLoteMuda.Create(nil);
  try
    vaFrmLoteMuda.ModoSilencioso := true;
    if not dmViveiro.cdsGerminacao.Active then
      dmViveiro.cdsGerminacao.Open;

    dmViveiro.cdsGerminacao.Last; // ultimo registro cadastrado

    vaLoteMuda := TLoteMuda.Create;
    vaLoteMuda.IdLoteSemente := dmViveiro.cdsLote_SementeID.AsInteger;

    vaLoteMuda.Qtde := dmViveiro.cdsGerminacaoQTDE_GERMINADA.AsInteger;

    vaFrmLoteMuda.ppuConfigurarPesquisa(vaFrmLoteMuda.coPesquisaLoteSemente, dmViveiro.cdsLote_SementeID.AsString);
    vaFrmLoteMuda.ppuPesquisar;
    if vaFrmLoteMuda.dsMaster.DataSet.RecordCount > 0 then
      begin
        try
          vaFrmLoteMuda.ppuConfigurarModoExecucao(meSomenteEdicao, vaLoteMuda);
          vaFrmLoteMuda.ppuAlterar(vaFrmLoteMuda.dsMaster.DataSet.FieldByName(TBancoDados.coId).AsInteger);
          vaFrmLoteMuda.ppuSalvar;
          // vamos excluir todos os canteiros vinculados e cadastrar novamente
          vaFrmLoteMuda.pcDetails.ActivePage := vaFrmLoteMuda.tabDetailCanteiros;

          SetLength(vaIdsExcluir, vaFrmLoteMuda.dsLote_Muda_Canteiro.DataSet.RecordCount);
          TUtils.ppuPercorrerCds(TClientDataSet(vaFrmLoteMuda.dsLote_Muda_Canteiro.DataSet),
            procedure
            begin
              vaIdsExcluir[vaFrmLoteMuda.dsLote_Muda_Canteiro.DataSet.RecNo - 1] :=
                vaFrmLoteMuda.dsLote_Muda_Canteiro.DataSet.FieldByName(TBancoDados.coId).AsInteger;
            end);

          vaFrmLoteMuda.fpuExcluirDetail(vaIdsExcluir);
        except
          on e: Exception do
            raise Exception.Create('Não foi possível alterar o lote de muda vinculado a este lote de semente. ' +
              'Será necessário alterá-lo manualmente. Detalhes: ' + e.Message);
        end;
      end
    else
      begin
        vaLoteMuda.Data := dmViveiro.cdsGerminacaoDATA.AsDateTime;
        vaLoteMuda.IdEspecie := dmViveiro.cdsLote_SementeID_ESPECIE.AsInteger;
        vaLoteMuda.Nome := dmViveiro.cdsLote_SementeNOME.AsString;

        try
          vaFrmLoteMuda.ppuConfigurarModoExecucao(meSomenteCadastro, vaLoteMuda);
          vaFrmLoteMuda.ppuIncluir;
          vaFrmLoteMuda.ppuSalvar;
        except
          on e: Exception do
            raise Exception.Create('Não foi possível incluir o lote de muda. Detalhes: ' + e.Message);
        end;
      end;

    // garantindo que esteja na aba certa
    vaFrmLoteMuda.pcDetails.ActivePage := vaFrmLoteMuda.tabDetailCanteiros;
    try
      TUtils.ppuPercorrerCds(dmViveiro.cdsSemeadura,
        procedure
        var
          vaCanteiro: TCanteiro;
        begin
          vaCanteiro := TCanteiro.Create;
          vaCanteiro.Id := dmViveiro.cdsSemeaduraID_CANTEIRO.AsInteger;

          vaFrmLoteMuda.Modelo := vaCanteiro;
          vaFrmLoteMuda.ppuIncluirDetail;
          vaFrmLoteMuda.ppuSalvarDetail;
        end);
    except
      on e: Exception do
        raise Exception.Create('Não foi possível incluir os canteiros no qual estão as mudas do lote gerado.' +
          'Será necessário incluí-los manualmente. Detalhes: ' + e.Message);
    end;
  finally
    vaFrmLoteMuda.Free;
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
      dmViveiro.cdsLote_Semente.Edit;
      dmViveiro.cdsLote_SementeSTATUS.AsInteger := coLoteAberto;
      dmViveiro.cdsLote_Semente.Post;

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
    while not dmViveiro.cdsLote_Semente_Matriz.eof do
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

procedure TfrmLoteSemente.tabDetailMatrizesShow(Sender: TObject);
begin
  inherited;
  ppvCarregarMatrizes(false);
end;

procedure TfrmLoteSemente.viewRegistrosFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  ppvCarregarMatrizes(false);

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

procedure TfrmLoteSemente.pprBeforeIncluir;
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
      dmViveiro.cdsLote_SementeTAXA_GERMINACAO.AsInteger := 0;
      dmViveiro.cdsLote_SementeTAXA_DESCARTE.AsInteger := 100;
    end;

  if not (dmViveiro.cdsLote_Semente.State in [dsEdit, dsInsert]) then
    dmViveiro.cdsLote_Semente.Edit;

  dmViveiro.cdsLote_SementeNOME_ESPECIE.AsString := cbEspecie.Text;
  dmViveiro.cdsLote_SementePESSOA_COLETOU.AsString := cbPessoaColetou.Text;
  dmViveiro.cdsLote_SementeCAMARA_FRIA.AsString := cbCamaraFria.Text;
end;

procedure TfrmLoteSemente.pprBeforeSalvarDetail;
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastroDetail then
    begin
      dmViveiro.cdsSemeaduraPESSOA_SEMEOU.AsString := cbPessoaSemeou.Text;
      dmViveiro.cdsSemeaduraNOME_CANTEIRO.AsString := cbCanteiro.Text;
    end
  else if pcPrincipal.ActivePage = tabCadastroGerminacao then
    begin
      dmViveiro.cdsGerminacaoPESSOA_VERIFICOU.AsString := cbPessoaVerificou.Text;
    end;
end;

procedure TfrmLoteSemente.pprCarregarDadosModelo;
var
  vaLote: TLoteSemente;
  vaIdMatriz: Integer;

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
      if vaLote.Id <> 0 then
        dmViveiro.cdsLote_SementeID.AsInteger := vaLote.Id;

      if vaLote.IdPessoaColetouComprou <> 0 then
        plSetEdit(cbPessoaColetou, vaLote.IdPessoaColetouComprou);

      if vaLote.Data <> 0 then
        plSetEdit(EditData, vaLote.Data);

      if vaLote.Qtde <> 0 then
        plSetEdit(EditQtde, vaLote.Qtde);

      if vaLote.IdEspecie <> 0 then
        plSetEdit(cbEspecie, vaLote.IdEspecie);

      if vaLote.IdItemCompra <> 0 then
        dmViveiro.cdsLote_SementeID_COMPRA_ITEM.AsInteger := vaLote.IdItemCompra;

      if vaLote.IdCamaraFria <> 0 then
        plSetEdit(cbCamaraFria, vaLote.IdCamaraFria);

      if vaLote.IdLoteOrigem <> 0 then
        dmViveiro.cdsLote_SementeID_LOTE_SEMENTE_ORIGEM.AsInteger := vaLote.IdLoteOrigem;

      if vaLote.Matrizes.Count > 0 then
        begin
          for vaIdMatriz in vaLote.Matrizes do
            begin
              if cdsLocalMatrizes.Locate(TBancoDados.coId, vaIdMatriz, []) then
                begin
                  frameMatrizes.Ac_Add.Execute;
                end;
            end;
        end;
    end;

end;

procedure TfrmLoteSemente.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  ipCds.ppuAddParametro(TParametros.coStatus, rgStatus.ItemIndex);

  if not VarIsNull(cbEspeciePesquisa.EditValue) then
    ipCds.ppuAddParametro(TParametros.coEspecie, cbEspeciePesquisa.EditValue)

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
begin

  inherited;

  if (dmViveiro.cdsLote_Semente_Matriz.ChangeCount > 0) then
    dmViveiro.cdsLote_Semente_Matriz.ApplyUpdates(0);
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
  pprPreencherCamposPadroes(dmViveiro.cdsLote_Semente);
  dmViveiro.cdsLote_SementeSTATUS.AsInteger := 0;
end;

procedure TfrmLoteSemente.ppuIncluirDetail;
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastroGerminacao then
    begin
      if dmLookup.cdslkPessoa.Locate(TBancoDados.coId, TInfoLogin.fpuGetInstance.Usuario.Id, []) then
        dmViveiro.cdsGerminacaoID_PESSOA_VERIFICOU.AsInteger := TInfoLogin.fpuGetInstance.Usuario.Id;
    end
end;

procedure TfrmLoteSemente.ppuRetornar(ipAtualizar: Boolean);
begin
  // inherited;
  if (pcPrincipal.ActivePage = tabCadastroGerminacao) then
    inherited
  else
    pcPrincipal.ActivePage := tabPesquisa;
end;

procedure TfrmLoteSemente.ppvCarregarMatrizes(ipAbaCadastro: Boolean);
begin
  if ipAbaCadastro then
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
    end
  else // aba de pesquisa
    begin
      if dmViveiro.cdsLote_Semente.Active and (dmViveiro.cdsLote_Semente.RecordCount > 0) and (pcDetails.ActivePage = tabDetailMatrizes) then
        begin
          if (not dmLookup.cdslkMatriz.Active) or (dmLookup.cdslkMatrizID_ESPECIE.AsInteger <> dmViveiro.cdsLote_SementeID_ESPECIE.AsInteger) then
            begin
              dmLookup.cdslkMatriz.ppuDataRequest([TParametros.coEspecie], [dmViveiro.cdsLote_SementeID_ESPECIE.AsInteger], TOperadores.coAnd, true);
            end;
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
          if dmLookup.cdslkEspecie.Locate(TBancoDados.coId, dmViveiro.cdsLote_SementeID_ESPECIE.AsInteger, []) then
            begin
              if not(dmViveiro.cdsSemeadura.State in [dsEdit, dsInsert]) then
                dmViveiro.cdsSemeadura.Edit;

              dmViveiro.cdsSemeaduraDATA_PREVISTA_GERMINACAO.AsDateTime :=
                IncDay(EditDataSemeadura.Date, dmLookup.cdslkEspecieTEMPO_GERMINACAO.AsInteger);
            end;
        end;
    end;
end;

procedure TfrmLoteSemente.EditQtdeTubetePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastroDetail then
    begin
      if dmViveiro.cdsSemeadura.State in [dsEdit, dsInsert] then
        begin
          if dmLookup.cdslkEspecie.Locate(TBancoDados.coId, dmViveiro.cdsLote_SementeID_ESPECIE.AsInteger, []) then
            begin
              dmViveiro.cdsSemeaduraQTDE_SEMEADA.AsFloat := TUtils.fpuTruncTo((dmLookup.cdslkEspeciePESO_MEDIO_SEMENTE.AsFloat *
                (dmViveiro.cdsSemeaduraQTDE_TUBETE.AsInteger * dmLookup.cdslkEspecieQTDE_SEMENTE_TUBETE.AsInteger)) / 1000, 2);
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

  PesquisaPadrao := Ord(tppData);

  dmLookup.ppuCarregarPessoas(0, coTiposPessoaPadrao);
  dmLookup.cdslkEspecie.ppuAddParametro(TParametros.coTodos, 'NAO_IMPORTA');
  dmLookup.ppuAbrirCache(dmLookup.cdslkEspecie);

  dmLookup.cdslkCanteiro.ppuAddParametro(TParametros.coTodos, 'NAO_IMPORTA');
  dmLookup.ppuAbrirCache(dmLookup.cdslkCanteiro);

  dmLookup.cdslkCamara_Fria.ppuAddParametro(TParametros.coTodos, 'NAO_IMPORTA');
  dmLookup.ppuAbrirCache(dmLookup.cdslkCamara_Fria);

  ppvConfigurarGrids;

  EditDataInicialPesquisa.Date := IncDay(now, -7);
  EditDataFinalPesquisa.Date := now;
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
      pprEfetuarPesquisa;
    end;
end;

function TfrmLoteSemente.fpvGerminacaoEmAndamento: Boolean;
begin
  Result := dmViveiro.cdsLote_Semente.Active and (dmViveiro.cdsLote_SementeSTATUS.AsInteger = 0);
end;

procedure TfrmLoteSemente.frameMatrizesbtnAddClick(Sender: TObject);
begin
  inherited;
  frameMatrizes.Ac_AddExecute(Sender);

end;

procedure TfrmLoteSemente.ppvConfigurarGrids;
begin
  // Esquerda
  frameMatrizes.fpuAdicionarField(frameMatrizes.viewEsquerda, 'ID', dmLookup.replcbMatriz);
  // Direita
  frameMatrizes.fpuAdicionarField(frameMatrizes.viewDireita, 'ID_MATRIZ', dmLookup.replcbMatriz);
  // mapeando
  frameMatrizes.ppuMapearFields('ID', 'ID_MATRIZ');
end;

{ TLoteSemente }

constructor TLoteSemente.Create;
begin
  FMatrizes := TList<Integer>.Create;
end;

destructor TLoteSemente.Destroy;
begin
  FMatrizes.Free;
  inherited;
end;

procedure TLoteSemente.SetIdCamaraFria(const Value: Integer);
begin
  FIdCamaraFria := Value;
end;

procedure TLoteSemente.SetIdLoteOrigem(const Value: Integer);
begin
  FIdLoteOrigem := Value;
end;

procedure TLoteSemente.SetIdPessoaColetou(const Value: Integer);
begin
  FIdPessoaColetou := Value;
end;

procedure TLoteSemente.SetMatrizes(const Value: TList<Integer>);
begin
  FMatrizes := Value;
end;

end.
