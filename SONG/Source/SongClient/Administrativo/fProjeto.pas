unit fProjeto;

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
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, uTypes, dmuAdministrativo, cxCalc,
  cxDBEdit, cxMemo, dmuLookup, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  dmuPrincipal, uControleAcesso, System.TypInfo, uClientDataSet, uUtils,
  uExceptions, Vcl.ExtDlgs, System.IOUtils, cxCurrencyEdit, cxLocalization,
  cxCheckBox;

type
  TfrmProjeto = class(TfrmBasicoCrudMasterDetail)
    tabCadastroDetailOrganizacao: TcxTabSheet;
    tabCadastroDetailFinanciador: TcxTabSheet;
    tabCadastroDetailDocumento: TcxTabSheet;
    Label3: TLabel;
    EditNome: TcxDBTextEdit;
    Label4: TLabel;
    EditDataInicio: TcxDBDateEdit;
    Label5: TLabel;
    EditDataTermino: TcxDBDateEdit;
    Label6: TLabel;
    cbStatusProjeto: TcxDBImageComboBox;
    Label7: TLabel;
    EditDescricao: TcxDBMemo;
    Label8: TLabel;
    EditOrcamento: TcxDBCalcEdit;
    Label9: TLabel;
    cbPessoa: TcxDBLookupComboBox;
    Label10: TLabel;
    EditFuncao: TcxDBTextEdit;
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosDATA_INICIO: TcxGridDBColumn;
    viewRegistrosDATA_TERMINO: TcxGridDBColumn;
    viewRegistrosORCAMENTO: TcxGridDBColumn;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_PESSOA: TcxGridDBColumn;
    viewRegistrosDetailFUNCAO: TcxGridDBColumn;
    cbStatusPesquisa: TcxImageComboBox;
    tabDetailOrganizacao: TcxTabSheet;
    tabDetailFinanciador: TcxTabSheet;
    tabDetailDocumento: TcxTabSheet;
    Panel1: TPanel;
    btnIncluirOrganizacao: TButton;
    Panel2: TPanel;
    btnIncluirFinanciador: TButton;
    Panel3: TPanel;
    btnIncluirDocumento: TButton;
    cxGrid3: TcxGrid;
    viewProjetoDocumento: TcxGridDBTableView;
    ColumnAlterarDetailDocumento: TcxGridDBColumn;
    ColumnExcluirDetailDocumentos: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    dsOrganizacao: TDataSource;
    dsFinanciador: TDataSource;
    dsDocumento: TDataSource;
    cxGrid1: TcxGrid;
    viewProjetoOrganizacao: TcxGridDBTableView;
    ColumnAlterarDetailOrganizacao: TcxGridDBColumn;
    ColumnExcluirDetailOrganizacao: TcxGridDBColumn;
    level1: TcxGridLevel;
    Panel4: TPanel;
    btnSalvarDetailOrganizacao: TButton;
    btnCancelarDetailOrganizacao: TButton;
    btnSalvarIncluirDetailOrganizacao: TButton;
    Panel5: TPanel;
    btnSalvarDetailFinanciador: TButton;
    btnCancelarDetailFinanciador: TButton;
    btnSalvarIncluirDetailFinanciador: TButton;
    Panel6: TPanel;
    btnSalvarDetailDocumento: TButton;
    btnCancelarDetailDocumento: TButton;
    btnSalvarIncluirDetailDocumento: TButton;
    FileDialog: TOpenTextFileDialog;
    Ac_CarregarArquivo: TAction;
    viewProjetoOrganizacaoID: TcxGridDBColumn;
    viewProjetoOrganizacaoID_ORGANIZACAO: TcxGridDBColumn;
    viewProjetoDocumentoID: TcxGridDBColumn;
    viewProjetoDocumentoNOME: TcxGridDBColumn;
    viewProjetoDocumentoDATA_UPLOAD: TcxGridDBColumn;
    Label17: TLabel;
    cbContaCorrente: TcxDBLookupComboBox;
    viewRegistrosID_BANCO_CONTA_CORRENTE: TcxGridDBColumn;
    pnProjetoFinanciador: TPanel;
    cxGrid2: TcxGrid;
    viewProjetoFinanciador: TcxGridDBTableView;
    viewProjetoFinanciadorID: TcxGridDBColumn;
    viewProjetoFinanciadorID_FINANCIADOR: TcxGridDBColumn;
    ColumnAlterarDetailFinanciador: TcxGridDBColumn;
    ColumnExcluirDetailFinanciador: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    cxGrid4: TcxGrid;
    viewPagamentos: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    dsFinanciador_Pagto: TDataSource;
    viewPagamentosID: TcxGridDBColumn;
    viewPagamentosVALOR: TcxGridDBColumn;
    viewPagamentosDATA: TcxGridDBColumn;
    Ac_Excluir_Pagamento: TAction;
    Ac_Incluir_Pagamento: TAction;
    Label19: TLabel;
    ColumnDownloadProjetoDocumento: TcxGridDBColumn;
    Ac_Download: TAction;
    SaveDialogDocumento: TSaveDialog;
    pnCadastroOrganizacao: TPanel;
    Label11: TLabel;
    cbOrganizacao: TcxDBLookupComboBox;
    pnCadastroFinanciador: TPanel;
    Label12: TLabel;
    cbFinanciador: TcxDBLookupComboBox;
    Label18: TLabel;
    EditObservacao: TcxDBMemo;
    rgPagamentos: TcxGroupBox;
    pnEditsPagamento: TPanel;
    Label14: TLabel;
    Label13: TLabel;
    btnSalvarPagamento: TButton;
    EditDataPagamento: TcxDateEdit;
    EditValorPagamento: TcxCurrencyEdit;
    cxGrid5: TcxGrid;
    viewPagamentosCadastro: TcxGridDBTableView;
    Column1: TcxGridDBColumn;
    Column2: TcxGridDBColumn;
    Column3: TcxGridDBColumn;
    Column4: TcxGridDBColumn;
    level2: TcxGridLevel;
    pnCadastroDocumento: TPanel;
    Label15: TLabel;
    EditNomeDocumento: TcxDBTextEdit;
    Label16: TLabel;
    EditCaminhoDocumento: TcxButtonEdit;
    viewRegistrosSTATUS: TcxGridDBColumn;
    btnAddContaCorrente: TButton;
    Ac_Adicionar_Conta_Corrente: TAction;
    btnAdicionar_Financiador: TButton;
    Ac_Adicionar_Financiador: TAction;
    tabCadastroDetailRubrica: TcxTabSheet;
    tabDetailRubrica: TcxTabSheet;
    Panel7: TPanel;
    btnIncluirRubrica: TButton;
    cxGrid6: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    dsRubrica: TDataSource;
    cxGridDBTableView1ID: TcxGridDBColumn;
    cxGridDBTableView1ID_RUBRICA: TcxGridDBColumn;
    cxGridDBTableView1ORCAMENTO: TcxGridDBColumn;
    cxGridDBTableView1NOME_RUBRICA: TcxGridDBColumn;
    Panel8: TPanel;
    btnSalvarDetailRubrica: TButton;
    btnCancelarDetailRubrica: TButton;
    btnSalvarIncluirDetailRubrica: TButton;
    pnCadastroRubrica: TPanel;
    Label20: TLabel;
    cbRubrica: TcxDBLookupComboBox;
    Label21: TLabel;
    EditOrcamentoRubrica: TcxDBCurrencyEdit;
    tabDetailArea: TcxTabSheet;
    tabCadastroDetailArea: TcxTabSheet;
    Panel9: TPanel;
    btnSalvarDetailArea: TButton;
    btnCancelarDetailArea: TButton;
    btnSalvarIncluirDetailArea: TButton;
    pnEditsCadastroDetailArea: TPanel;
    lbl2: TLabel;
    EditNomeArea: TcxDBTextEdit;
    dsArea: TDataSource;
    Panel10: TPanel;
    btnIncluirArea: TButton;
    cxGrid7: TcxGrid;
    viewAreaAtuacao: TcxGridDBTableView;
    level3: TcxGridLevel;
    viewAreaAtuacaoID: TcxGridDBColumn;
    viewAreaAtuacaoID_PROJETO: TcxGridDBColumn;
    viewAreaAtuacaoNOME: TcxGridDBColumn;
    ColumnAlterarDetailArea: TcxGridDBColumn;
    ColumnExcluirDetailArea: TcxGridDBColumn;
    viewPagamentosPERCENTUAL: TcxGridDBColumn;
    cxGridDBTableView1RECEBIDO: TcxGridDBColumn;
    cxGridDBTableView1GASTO: TcxGridDBColumn;
    lbl1: TLabel;
    EditValorGasto: TcxDBCurrencyEdit;
    lbl3: TLabel;
    EditValorRecebido: TcxDBCurrencyEdit;
    Label22: TLabel;
    EditPercentualPagamento: TcxCalcEdit;
    viewPagamentosCadastroPERCENTUAL: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure pcDetailsChange(Sender: TObject);
    procedure Ac_CarregarArquivoExecute(Sender: TObject);
    procedure Ac_Excluir_PagamentoExecute(Sender: TObject);
    procedure Ac_Incluir_PagamentoExecute(Sender: TObject);
    procedure Ac_DownloadExecute(Sender: TObject);
    procedure viewRegistrosSTATUSPropertiesEditValueChanged(Sender: TObject);
    procedure Ac_Adicionar_Conta_CorrenteExecute(Sender: TObject);
    procedure Ac_Adicionar_FinanciadorExecute(Sender: TObject);
    procedure cbFinanciadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbContaCorrenteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditValorPagamentoPropertiesEditValueChanged(Sender: TObject);
  private
    dmAdministrativo: TdmAdministrativo;
    dmLookup: TdmLookup;
    procedure ppvLimparEditsPagamento;
    procedure ppvAdicionarContaCorrente;
    procedure ppvCarregarContasCorrentes();
    procedure ppvAdicionarFinanciador;
    procedure ppvCarregarFinanciadores;
    procedure ppvExcluirPagamento;
    procedure ppvAtualizarRubricas(ipIncrementar: Boolean);
    { Private declarations }
  protected
    function fprGetPermissao: string; override;
    procedure pprValidarDados; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    procedure pprValidarPesquisa; override;
    procedure pprDefinirTabDetailCadastro; override;
    procedure pprEfetuarPesquisa; override;

    procedure pprExecutarSalvarDetail; override;
    function fprHabilitarSalvarDetail(): Boolean; override;
    procedure pprEfetuarCancelarDetail; override;
    function fprConfigurarControlesPesquisa: TWinControl; override;
    procedure pprEfetuarExcluirDetail(ipId: Integer); override;

    procedure pprValidarDadosDetail; override;
  public
    procedure ppuBaixarArquivo(ipId: Integer);
    procedure ppuIncluirDetail; override;
  public const
    coPesqPorStatus = 4;

  end;

var
  frmProjeto: TfrmProjeto;

implementation

uses
  fBanco, fFinanciador;

{$R *.dfm}


procedure TfrmProjeto.Ac_Adicionar_Conta_CorrenteExecute(Sender: TObject);
begin
  inherited;
  ppvAdicionarContaCorrente;
end;

procedure TfrmProjeto.ppvAdicionarContaCorrente;
var
  vaFrmBanco: TfrmBanco;
begin
  vaFrmBanco := TfrmBanco.Create(nil);
  try
    vaFrmBanco.ppuConfigurarModoExecucao(mePesquisaDetail);
    vaFrmBanco.ShowModal;
    if vaFrmBanco.IdDetailEscolhido <> 0 then
      begin
        if dmLookup.cdslkConta_Corrente.Locate(TBancoDados.coId, vaFrmBanco.IdDetailEscolhido, []) then
          begin
            cbContaCorrente.EditValue := vaFrmBanco.IdDetailEscolhido;
            cbContaCorrente.PostEditValue;
          end
        else
          begin
            ppvCarregarContasCorrentes();
            if dmLookup.cdslkConta_Corrente.Locate(TBancoDados.coId, vaFrmBanco.IdDetailEscolhido, []) then
              begin
                cbContaCorrente.EditValue := vaFrmBanco.IdDetailEscolhido;
                cbContaCorrente.PostEditValue;
              end;
          end;
      end;

  finally
    vaFrmBanco.Free;
  end;
end;

procedure TfrmProjeto.Ac_Adicionar_FinanciadorExecute(Sender: TObject);
begin
  inherited;
  ppvAdicionarFinanciador;
end;

procedure TfrmProjeto.ppvAdicionarFinanciador;
var
  vaFrmFinanciador: TfrmFinanciador;
begin
  vaFrmFinanciador := TfrmFinanciador.Create(nil);
  try
    vaFrmFinanciador.ppuConfigurarModoExecucao(meSomenteCadastro);
    vaFrmFinanciador.ShowModal;
    if vaFrmFinanciador.IdEscolhido <> 0 then
      begin
        ppvCarregarFinanciadores;
        if dmLookup.cdslkFinanciador.Locate(TBancoDados.coId, vaFrmFinanciador.IdEscolhido, []) then
          begin
            cbFinanciador.EditValue := vaFrmFinanciador.IdEscolhido;
            cbFinanciador.PostEditValue;
          end;
      end;
  finally
    vaFrmFinanciador.Free;
  end;

end;

procedure TfrmProjeto.Ac_CarregarArquivoExecute(Sender: TObject);
begin
  inherited;
  if FileDialog.Execute then
    begin
      if not TFile.Exists(FileDialog.FileName) then
        raise Exception.Create('Arquivo n�o encontrado.');

      if not(dmAdministrativo.cdsProjeto_Documento.State in [dsEdit, dsInsert]) then
        dmAdministrativo.cdsProjeto_Documento.Edit;

      EditCaminhoDocumento.Text := FileDialog.FileName;
      dmAdministrativo.cdsProjeto_DocumentoDOCUMENTO.LoadFromFile(FileDialog.FileName);
      dmAdministrativo.cdsProjeto_DocumentoNOME_ORIGINAL.AsString := TPath.GetFileName(FileDialog.FileName);
      dmAdministrativo.cdsProjeto_DocumentoDATA_UPLOAD.AsDateTime := StrToDateTime(dmPrincipal.FuncoesGeral.fpuDataHoraAtual);
    end
  else
    EditCaminhoDocumento.Text := '';
end;

procedure TfrmProjeto.Ac_DownloadExecute(Sender: TObject);
begin
  inherited;
  ppuBaixarArquivo(dmAdministrativo.cdsProjeto_DocumentoID.AsInteger);
end;

procedure TfrmProjeto.ppvAtualizarRubricas(ipIncrementar: Boolean);
var
  vaAutoApply: Boolean;
begin
  if not dmAdministrativo.cdsProjeto_Rubrica.Active then
    dmAdministrativo.cdsProjeto_Rubrica.Open;

  vaAutoApply := dmAdministrativo.cdsProjeto_Rubrica.RFApplyAutomatico;
  try
    dmAdministrativo.cdsProjeto_Rubrica.RFApplyAutomatico := False;

    TUtils.ppuPercorrerCds(dmAdministrativo.cdsProjeto_Rubrica,
      procedure
      begin
        dmAdministrativo.cdsProjeto_Rubrica.Edit;
        if ipIncrementar then
          begin
            dmAdministrativo.cdsProjeto_RubricaRECEBIDO.AsFloat := dmAdministrativo.cdsProjeto_RubricaRECEBIDO.AsFloat +
              (dmAdministrativo.cdsProjeto_RubricaORCAMENTO.AsFloat * ((dmAdministrativo.cdsProjeto_Financiador_PagtoPERCENTUAL.AsFloat / 100)));
          end
        else
          begin
            dmAdministrativo.cdsProjeto_RubricaRECEBIDO.AsFloat := dmAdministrativo.cdsProjeto_RubricaRECEBIDO.AsFloat -
              (dmAdministrativo.cdsProjeto_RubricaORCAMENTO.AsFloat * ((dmAdministrativo.cdsProjeto_Financiador_PagtoPERCENTUAL.AsFloat / 100)));

            if dmAdministrativo.cdsProjeto_RubricaRECEBIDO.AsFloat < 0 then
              dmAdministrativo.cdsProjeto_RubricaRECEBIDO.AsFloat := 0;
          end;
        dmAdministrativo.cdsProjeto_Rubrica.Post;
      end);

    if dmAdministrativo.cdsProjeto_Rubrica.ChangeCount > 0 then
      dmAdministrativo.cdsProjeto_Rubrica.ApplyUpdates(0);
  finally
    dmAdministrativo.cdsProjeto_Rubrica.RFApplyAutomatico := vaAutoApply;
  end;
end;

procedure TfrmProjeto.ppvExcluirPagamento();
begin
  ppvAtualizarRubricas(False);
  dmAdministrativo.cdsProjeto_Financiador_Pagto.Delete;
end;

procedure TfrmProjeto.Ac_Excluir_PagamentoExecute(Sender: TObject);
begin
  inherited;
  ppvExcluirPagamento();
end;

procedure TfrmProjeto.Ac_Incluir_PagamentoExecute(Sender: TObject);
begin
  inherited;
  if VarIsNull(EditValorPagamento.EditValue) then
    raise TControlException.Create('Informe o valor do pagamento.', EditValorPagamento);

  if VarIsNull(EditDataPagamento.EditValue) then
    raise TControlException.Create('Informe a data do pagamento.', EditDataPagamento);

  try
    if dmAdministrativo.cdsProjeto_FinanciadorID.IsNull then
      pprPreencherCamposPadroes(dmAdministrativo.cdsProjeto_Financiador);

    dmAdministrativo.cdsProjeto_Financiador_Pagto.Append;
    pprPreencherCamposPadroes(dmAdministrativo.cdsProjeto_Financiador_Pagto);

    dmAdministrativo.cdsProjeto_Financiador_PagtoVALOR.AsFloat := EditValorPagamento.Value;
    dmAdministrativo.cdsProjeto_Financiador_PagtoDATA.AsDateTime := EditDataPagamento.Date;
    dmAdministrativo.cdsProjeto_Financiador_PagtoPERCENTUAL.AsFloat := EditPercentualPagamento.Value;
    dmAdministrativo.cdsProjeto_Financiador_Pagto.Post;

    ppvAtualizarRubricas(true);
  except
    dmAdministrativo.cdsProjeto_Financiador_Pagto.Cancel;
    raise;
  end;

  ppvLimparEditsPagamento;

  TUtils.fpuFocar(EditValorPagamento);
end;

procedure TfrmProjeto.cbContaCorrenteKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvAdicionarContaCorrente;
end;

procedure TfrmProjeto.cbFinanciadorKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvAdicionarFinanciador;
end;

procedure TfrmProjeto.EditValorPagamentoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if not VarIsNull(EditValorPagamento.EditValue) then
    begin
      EditPercentualPagamento.EditValue := (EditValorPagamento.EditValue * 100) / dmAdministrativo.cdsProjetoORCAMENTO.AsFloat;
      EditPercentualPagamento.PostEditValue;
    end
  else
    begin
      EditPercentualPagamento.EditValue := 0;
      EditPercentualPagamento.PostEditValue;
    end;
end;

procedure TfrmProjeto.FormCreate(Sender: TObject);
begin
  dmAdministrativo := TdmAdministrativo.Create(Self);
  dmAdministrativo.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  inherited;
  PesquisaPadrao := tppNome;

  dmLookup.cdslkPessoa.ppuDataRequest([TParametros.coAtivo], [coRegistroAtivo]);
  dmLookup.cdslkOrganizacao.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);
  dmLookup.cdslkRubrica.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);

  ppvCarregarFinanciadores;
  ppvCarregarContasCorrentes;

end;

procedure TfrmProjeto.ppvCarregarContasCorrentes();
begin
  dmLookup.cdslkConta_Corrente.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, true);
end;

procedure TfrmProjeto.ppvCarregarFinanciadores();
begin
  dmLookup.cdslkFinanciador.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, true);
end;

function TfrmProjeto.fprConfigurarControlesPesquisa: TWinControl;
begin
  cbStatusPesquisa.Visible := cbPesquisarPor.EditValue = coPesqPorStatus;
  if cbStatusPesquisa.Visible then
    begin
      EditPesquisa.Visible := False;
      pnData.Visible := False;
      Result := cbStatusPesquisa;
    end
  else
    Result := inherited;
end;

function TfrmProjeto.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoAdministrativo), Ord(admProjeto));
end;

function TfrmProjeto.fprHabilitarSalvarDetail: Boolean;
begin
  Result := inherited or (dmAdministrativo.cdsProjeto_Financiador_Pagto.Active and (dmAdministrativo.cdsProjeto_Financiador_Pagto.ChangeCount > 0));
end;

procedure TfrmProjeto.pcDetailsChange(Sender: TObject);
begin
  inherited;
  if pcDetails.ActivePage = tabDetail then
    dsDetail.DataSet := dmAdministrativo.cdsProjeto_Pessoa
  else if pcDetails.ActivePage = tabDetailOrganizacao then
    dsDetail.DataSet := dmAdministrativo.cdsProjeto_Organizacao
  else if pcDetails.ActivePage = tabDetailFinanciador then
    dsDetail.DataSet := dmAdministrativo.cdsProjeto_Financiador
  else if pcDetails.ActivePage = tabDetailDocumento then
    dsDetail.DataSet := dmAdministrativo.cdsProjeto_Documento
  else if pcDetails.ActivePage = tabDetailRubrica then
    dsDetail.DataSet := dmAdministrativo.cdsProjeto_Rubrica
  else if pcDetails.ActivePage = tabDetailArea then
    dsDetail.DataSet := dmAdministrativo.cdsProjeto_Area;

  if not dsDetail.DataSet.Active then
    dsDetail.DataSet.Open;
end;

procedure TfrmProjeto.pprValidarDados;
begin
  inherited;
  if not dmPrincipal.FuncoesAdm.fpuValidarNomeProjeto(dmAdministrativo.cdsProjetoID.AsInteger,
    dmAdministrativo.cdsProjetoNOME.AsString) then
    raise Exception.Create('J� existe um projeto com este nome. Por favor, informe outro nome.');

end;

procedure TfrmProjeto.pprValidarDadosDetail;
begin
  inherited;
  if not dmPrincipal.FuncoesAdm.fpuValidarNomeAreaProjeto(dmAdministrativo.cdsProjetoID.AsInteger,
    dmAdministrativo.cdsProjeto_AreaID.AsInteger,dmAdministrativo.cdsProjeto_AreaNOME.AsString) then
    begin
       raise Exception.Create('J� existe uma �rea para este projeto com este nome. Por favor, informe outro nome.');
    end;

end;

procedure TfrmProjeto.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if (cbPesquisarPor.EditValue = coPesqPorStatus) then
    dmAdministrativo.cdsProjeto.ppuAddParametro(TParametros.coStatus, cbStatusPesquisa.EditValue);
end;

procedure TfrmProjeto.pprDefinirTabDetailCadastro;
begin
  if pcDetails.ActivePage = tabDetail then
    pcPrincipal.ActivePage := tabCadastroDetail
  else if pcDetails.ActivePage = tabDetailOrganizacao then
    pcPrincipal.ActivePage := tabCadastroDetailOrganizacao
  else if pcDetails.ActivePage = tabDetailFinanciador then
    pcPrincipal.ActivePage := tabCadastroDetailFinanciador
  else if pcDetails.ActivePage = tabDetailDocumento then
    pcPrincipal.ActivePage := tabCadastroDetailDocumento
  else if pcDetails.ActivePage = tabDetailRubrica then
    pcPrincipal.ActivePage := tabCadastroDetailRubrica
  else if pcDetails.ActivePage = tabDetailArea then
    pcPrincipal.ActivePage := tabCadastroDetailArea
end;

procedure TfrmProjeto.pprEfetuarCancelarDetail;
begin
  inherited;
  dmAdministrativo.cdsProjeto_Financiador_Pagto.CancelUpdates;
end;

procedure TfrmProjeto.pprEfetuarExcluirDetail(ipId: Integer);
begin
  if dsDetail.DataSet = dmAdministrativo.cdsProjeto_Financiador then
    begin
      if dmAdministrativo.cdsProjeto_Financiador.Locate(TBancoDados.coId, ipId, []) then
        begin
          dmAdministrativo.cdsProjeto_Financiador_Pagto.First;
          while not dmAdministrativo.cdsProjeto_Financiador_Pagto.Eof do
            begin
              ppvExcluirPagamento;
            end;

          if dmAdministrativo.cdsProjeto_Financiador_Pagto.ChangeCount > 0 then
            dmAdministrativo.cdsProjeto_Financiador_Pagto.ApplyUpdates(0);
        end;
    end;

  inherited;

  if dsDetail.DataSet = dmAdministrativo.cdsProjeto_Rubrica then
    begin
      if dmAdministrativo.cdsProjeto_Rubrica.ChangeCount > 0 then
        dmAdministrativo.cdsProjeto_Rubrica.ApplyUpdates(0);
    end;
end;

procedure TfrmProjeto.pprEfetuarPesquisa;
begin
  viewRegistrosDetail.BeginUpdate(lsimImmediate);
  try
    dmAdministrativo.cdsProjeto_Financiador_Pagto.Close;
    inherited;
    dmAdministrativo.cdsProjeto_Financiador_Pagto.Open;
  finally
    viewRegistrosDetail.EndUpdate;
  end;
end;

procedure TfrmProjeto.pprExecutarSalvarDetail;
begin
  inherited;
  if dmAdministrativo.cdsProjeto_Financiador_Pagto.ChangeCount > 0 then
    dmAdministrativo.cdsProjeto_Financiador_Pagto.ApplyUpdates(0);

  if dmAdministrativo.cdsProjeto_Rubrica.ChangeCount > 0 then
    dmAdministrativo.cdsProjeto_Rubrica.ApplyUpdates(0);

end;

procedure TfrmProjeto.pprValidarPesquisa;
begin
  inherited;
  if cbStatusPesquisa.Visible and VarIsNull(cbStatusPesquisa.EditValue) then
    raise TControlException.Create('Informe a situa��o a ser pesquisada.', cbStatusPesquisa);
end;

procedure TfrmProjeto.ppuBaixarArquivo(ipId: Integer);
begin
  if dmAdministrativo.cdsProjeto_Documento.Locate(TBancoDados.coId, ipId, []) then
    begin
      if not dmAdministrativo.cdsProjeto_DocumentoDOCUMENTO.IsNull then
        begin
          SaveDialogDocumento.FileName := dmAdministrativo.cdsProjeto_DocumentoNOME_ORIGINAL.AsString;
          if SaveDialogDocumento.Execute then
            begin
              dmAdministrativo.cdsProjeto_DocumentoDOCUMENTO.SaveToFile(SaveDialogDocumento.FileName);
            end;
        end
      else
        raise Exception.Create('Nenhum documento foi carregado para poder ser baixado.');
    end
  else
    raise Exception.Create('Registro n�o encontrado.');
end;

procedure TfrmProjeto.ppuIncluirDetail;
begin
  inherited;
  if dsDetail.DataSet = dmAdministrativo.cdsProjeto_Documento then
    EditCaminhoDocumento.Text := ''
  else if dsDetail.DataSet = dmAdministrativo.cdsProjeto_Financiador then
    ppvLimparEditsPagamento;
end;

procedure TfrmProjeto.ppvLimparEditsPagamento;
begin
  EditValorPagamento.Clear;
  EditDataPagamento.Clear;
end;

procedure TfrmProjeto.viewRegistrosSTATUSPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if dmAdministrativo.cdsProjeto.State in [dsEdit, dsInsert] then
    dmAdministrativo.cdsProjeto.Post;
end;

end.
