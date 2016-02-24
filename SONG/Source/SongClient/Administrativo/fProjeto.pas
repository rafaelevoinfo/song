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
  uExceptions, Vcl.ExtDlgs, System.IOUtils, cxCurrencyEdit;

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
    cbSituacao: TcxDBImageComboBox;
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
    viewRegistrosSTATUS: TcxGridDBColumn;
    viewRegistrosORCAMENTO: TcxGridDBColumn;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_PESSOA: TcxGridDBColumn;
    viewRegistrosDetailFUNCAO: TcxGridDBColumn;
    cbSituacaoPesquisa: TcxImageComboBox;
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
    Label11: TLabel;
    cbOrganizacao: TcxDBLookupComboBox;
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
    Label12: TLabel;
    cbFinanciador: TcxDBLookupComboBox;
    Label15: TLabel;
    EditNomeDocumento: TcxDBTextEdit;
    Label16: TLabel;
    FileDialog: TOpenTextFileDialog;
    EditCaminhoDocumento: TcxButtonEdit;
    Ac_CarregarArquivo: TAction;
    viewProjetoOrganizacaoID: TcxGridDBColumn;
    viewProjetoOrganizacaoID_ORGANIZACAO: TcxGridDBColumn;
    viewProjetoDocumentoID: TcxGridDBColumn;
    viewProjetoDocumentoNOME: TcxGridDBColumn;
    viewProjetoDocumentoDATA_UPLOAD: TcxGridDBColumn;
    Label17: TLabel;
    cbContaCorrente: TcxDBLookupComboBox;
    viewRegistrosID_BANCO_CONTA_CORRENTE: TcxGridDBColumn;
    EditObservacao: TcxDBMemo;
    Label18: TLabel;
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
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    dsFinanciador_Pagto: TDataSource;
    viewPagamentosID: TcxGridDBColumn;
    viewPagamentosVALOR: TcxGridDBColumn;
    viewPagamentosDATA: TcxGridDBColumn;
    Ac_Excluir_Pagamento: TAction;
    rgPagamentos: TcxGroupBox;
    pnEditsPagamento: TPanel;
    Label14: TLabel;
    Label13: TLabel;
    cxGrid5: TcxGrid;
    viewPagamentosCadastro: TcxGridDBTableView;
    Column1: TcxGridDBColumn;
    Column2: TcxGridDBColumn;
    Column3: TcxGridDBColumn;
    Column4: TcxGridDBColumn;
    level2: TcxGridLevel;
    btnSalvarPagamento: TButton;
    Ac_Salvar_Pagamento: TAction;
    EditDataPagamento: TcxDateEdit;
    Label19: TLabel;
    EditValorPagamento: TcxCurrencyEdit;
    ColumnDownloadProjetoDocumento: TcxGridDBColumn;
    Ac_Download: TAction;
    SaveDialogDocumento: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure cbPesquisarPorPropertiesEditValueChanged(Sender: TObject);
    procedure pcDetailsChange(Sender: TObject);
    procedure Ac_CarregarArquivoExecute(Sender: TObject);
    procedure Ac_Excluir_PagamentoExecute(Sender: TObject);
    procedure Ac_Salvar_PagamentoExecute(Sender: TObject);
    procedure Ac_DownloadExecute(Sender: TObject);
    procedure viewRegistrosSTATUSPropertiesEditValueChanged(Sender: TObject);
  private
    dmAdministrativo: TdmAdministrativo;
    dmLookup: TdmLookup;
    procedure ppvLimparEditsPagamento;
    { Private declarations }
  protected
    function fprGetPermissao: string; override;
    procedure pprBeforeSalvar; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    procedure pprValidarPesquisa; override;
    procedure pprDefinirTabDetailCadastro; override;
    procedure pprEfetuarPesquisa; override;
    procedure ppuIncluirDetail; override;

    procedure pprExecutarSalvarDetail; override;
    function fprHabilitarSalvarDetail(): Boolean; override;
    procedure pprEfetuarCancelarDetail; override;
  public
    procedure ppuBaixarArquivo(ipId: Integer);
  public const
    coPesqPorSituacao = 4;

  end;

var
  frmProjeto: TfrmProjeto;

implementation

{$R *.dfm}


procedure TfrmProjeto.Ac_CarregarArquivoExecute(Sender: TObject);
begin
  inherited;
  if FileDialog.Execute then
    begin
      if not TFile.Exists(FileDialog.FileName) then
        raise Exception.Create('Arquivo não encontrado.');

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

procedure TfrmProjeto.Ac_Excluir_PagamentoExecute(Sender: TObject);
begin
  inherited;
  dmAdministrativo.cdsProjeto_Financiador_Pagto.Delete;
end;

procedure TfrmProjeto.Ac_Salvar_PagamentoExecute(Sender: TObject);
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
    dmAdministrativo.cdsProjeto_Financiador_Pagto.Post;
  except
    dmAdministrativo.cdsProjeto_Financiador_Pagto.Cancel;
    raise;
  end;

  ppvLimparEditsPagamento;

  TUtils.ppuFocar(EditValorPagamento);
end;

procedure TfrmProjeto.cbPesquisarPorPropertiesEditValueChanged(Sender: TObject);
begin
  EditPesquisa.Visible := cbPesquisarPor.EditValue <> coPesqPorSituacao;
  cbSituacaoPesquisa.Visible := not EditPesquisa.Visible;
  if cbPesquisarPor.EditValue <> coPesqPorSituacao then
    inherited
  else
    TUtils.ppuFocar(cbSituacao);

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
  dmLookup.cdslkOrganizacao.Open;
  dmLookup.cdslkFinanciador.Open;
  dmLookup.cdslkConta_Corrente.Open;
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
    dsDetail.DataSet := dmAdministrativo.cdsProjeto_Documento;

  if not dsDetail.DataSet.Active then
    dsDetail.DataSet.Open;
end;

procedure TfrmProjeto.pprBeforeSalvar;
begin
  inherited;
  if not dmPrincipal.FuncoesAdm.fpuValidarNomeProjeto(dmAdministrativo.cdsProjetoID.AsInteger,
    dmAdministrativo.cdsProjetoNOME.AsString) then
    raise Exception.Create('Já existe um projeto com este nome. Por favor, informe outro nome.');

end;

procedure TfrmProjeto.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if (cbPesquisarPor.EditValue = coPesqPorSituacao) then
    dmAdministrativo.cdsProjeto.ppuAddParametro(TParametros.coSituacao, cbSituacaoPesquisa.EditValue);
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
end;

procedure TfrmProjeto.pprEfetuarCancelarDetail;
begin
  inherited;
  dmAdministrativo.cdsProjeto_Financiador_Pagto.CancelUpdates;
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
end;

procedure TfrmProjeto.pprValidarPesquisa;
begin
  inherited;
  if cbSituacaoPesquisa.Visible and VarIsNull(cbSituacaoPesquisa.EditValue) then
    raise TControlException.Create('Informe a situação a ser pesquisada.', cbSituacaoPesquisa);
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
    raise Exception.Create('Registro não encontrado.');
end;

procedure TfrmProjeto.ppuIncluirDetail;
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastroDetailDocumento then
    EditCaminhoDocumento.Text := ''
  else if pcDetails.ActivePage = tabCadastroDetailFinanciador then
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
  if dmAdministrativo.cdsProjeto.State in [dsEdit,dsInsert] then
    dmAdministrativo.cdsProjeto.Post;
end;

end.
