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
  uExceptions, Vcl.ExtDlgs, System.IOUtils;

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
    cxGrid2: TcxGrid;
    viewProjetoFinanciador: TcxGridDBTableView;
    ColumnAlterarDetailFinanciador: TcxGridDBColumn;
    ColumnExcluirDetailFinanciador: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
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
    Label13: TLabel;
    EditDataPagamento: TcxDBDateEdit;
    Label14: TLabel;
    EditValorFinanciamento: TcxDBCalcEdit;
    Label15: TLabel;
    EditNomeDocumento: TcxDBTextEdit;
    Label16: TLabel;
    FileDialog: TOpenTextFileDialog;
    EditCaminhoDocumento: TcxButtonEdit;
    Ac_CarregarArquivo: TAction;
    viewProjetoOrganizacaoID: TcxGridDBColumn;
    viewProjetoOrganizacaoID_ORGANIZACAO: TcxGridDBColumn;
    viewProjetoFinanciadorID: TcxGridDBColumn;
    viewProjetoFinanciadorID_FINANCIADOR: TcxGridDBColumn;
    viewProjetoFinanciadorVALOR_FINANCIADO: TcxGridDBColumn;
    viewProjetoFinanciadorDATA_PAGAMENTO: TcxGridDBColumn;
    viewProjetoDocumentoID: TcxGridDBColumn;
    viewProjetoDocumentoNOME: TcxGridDBColumn;
    viewProjetoDocumentoDATA_UPLOAD: TcxGridDBColumn;
    Label17: TLabel;
    cbContaCorrente: TcxDBLookupComboBox;
    viewRegistrosID_BANCO_CONTA_CORRENTE: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure cbPesquisarPorPropertiesEditValueChanged(Sender: TObject);
    procedure pcDetailsChange(Sender: TObject);
    procedure Ac_CarregarArquivoExecute(Sender: TObject);
  private
    dmAdministrativo: TdmAdministrativo;
    dmLookup: TdmLookup;
    { Private declarations }
  protected
    function fprGetPermissao: string; override;
    procedure pprBeforeSalvar; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    procedure pprValidarPesquisa; override;
    procedure pprDefinirTabDetailCadastro; override;
    procedure ppuIncluirDetail; override;
    procedure pprPreencherCamposPadroes(ipDataSet: TDataSet); override;
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

      EditCaminhoDocumento.Text := FileDialog.FileName;
      dmAdministrativo.cdsProjeto_DocumentoDOCUMENTO.LoadFromFile(FileDialog.FileName);
    end
  else
    EditCaminhoDocumento.Text := '';
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

procedure TfrmProjeto.pprPreencherCamposPadroes(ipDataSet: TDataSet);
begin
  inherited;
  if pcDetails.ActivePage = tabCadastroDetailDocumento then
    begin
      if (dmAdministrativo.cdsProjeto_Documento.State = dsInsert) or (not VarIsNull(dmAdministrativo.cdsProjeto_DocumentoDOCUMENTO.NewValue)) then
        dmAdministrativo.cdsProjeto_DocumentoDATA_UPLOAD.AsDateTime := StrToDateTime(dmPrincipal.FuncoesGeral.fpuDataHoraAtual);
    end;
end;

procedure TfrmProjeto.pprValidarPesquisa;
begin
  inherited;
  if cbSituacaoPesquisa.Visible and VarIsNull(cbSituacaoPesquisa.EditValue) then
    raise TControlException.Create('Informe a situação a ser pesquisada.', cbSituacaoPesquisa);
end;

procedure TfrmProjeto.ppuIncluirDetail;
begin
  inherited;
  if pcDetails.ActivePage = tabCadastroDetailDocumento then
    EditCaminhoDocumento.Text := '';
end;

end.
