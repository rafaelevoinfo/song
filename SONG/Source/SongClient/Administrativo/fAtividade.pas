unit fAtividade;

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
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuAdministrativo, dmuLookup,
  cxCheckBox, cxCheckComboBox, uTypes, System.TypInfo, uControleAcesso, cxDBEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dmuPrincipal, cxMemo,
  uClientDataSet, System.IOUtils, Vcl.ExtDlgs;

type
  TfrmAtividade = class(TfrmBasicoCrudMasterDetail)
    tabDetailProjeto: TcxTabSheet;
    tabDetailVinculo: TcxTabSheet;
    tabDetailArquivo: TcxTabSheet;
    tabDetailComentario: TcxTabSheet;
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosID_SOLICITANTE: TcxGridDBColumn;
    viewRegistrosID_RESPONSAVEL: TcxGridDBColumn;
    viewRegistrosSTATUS: TcxGridDBColumn;
    viewRegistrosDATA_INICIAL: TcxGridDBColumn;
    viewRegistrosDATA_FINAL: TcxGridDBColumn;
    viewRegistrosNOTIFICAR_ENVOLVIDOS: TcxGridDBColumn;
    Label3: TLabel;
    cbProjetos: TcxCheckComboBox;
    Label4: TLabel;
    EditNome: TcxDBTextEdit;
    Label5: TLabel;
    EditDataInicio: TcxDBDateEdit;
    Label6: TLabel;
    EditDataTermino: TcxDBDateEdit;
    Label7: TLabel;
    cbSolicitante: TcxDBLookupComboBox;
    Label8: TLabel;
    cbResponsavel: TcxDBLookupComboBox;
    cbStatus: TcxDBImageComboBox;
    Label9: TLabel;
    chkNotificarEnvolvidos: TcxDBCheckBox;
    Label10: TLabel;
    EditDescricao: TcxDBMemo;
    Label11: TLabel;
    EditFuncaoPessoa: TcxDBTextEdit;
    Label12: TLabel;
    cbPessoaEnvolvida: TcxDBLookupComboBox;
    tabCadastroDetailProjeto: TcxTabSheet;
    tabCadastroDetailVinculo: TcxTabSheet;
    tabCadastroDetailArquivo: TcxTabSheet;
    tabCadastroDetailComentario: TcxTabSheet;
    pnCadastroDetailVinculo: TPanel;
    btnSalvarAtividadeVinculo: TButton;
    btnSalvarIncluirAtividadeVinculo: TButton;
    btnactCnPrefixWizard2: TButton;
    pnCadastroDetailArquivo: TPanel;
    btnSalvarArquivo: TButton;
    btnCancelarArquivo: TButton;
    btnSalvarIncluirArquivo: TButton;
    pnCadastroDetailComentario: TPanel;
    btnSalvarComentario: TButton;
    btnCancelarComentario: TButton;
    btnSalvarIncluirComentario: TButton;
    pnCadastroDetailProjeto: TPanel;
    btnSalvarProjeto: TButton;
    btnCancelarProjeto: TButton;
    btnSalvarIncluirProjeto: TButton;
    Label13: TLabel;
    cbProjeto: TcxDBLookupComboBox;
    Label14: TLabel;
    dsAtividade_Projeto: TDataSource;
    dsAtividade_Vinculo: TDataSource;
    dsAtividade_Arquivo: TDataSource;
    dsAtividade_Comentario: TDataSource;
    EditObsAtividadeProjeto: TcxDBMemo;
    Label15: TLabel;
    Label16: TLabel;
    EditObservacaoVinculo: TcxDBMemo;
    cbTipoVinculo: TcxDBImageComboBox;
    Label17: TLabel;
    cbProjetoPrincipal: TcxDBLookupComboBox;
    btnPesquisarProjeto: TButton;
    Ac_Pesquisar_Projeto: TAction;
    Button1: TButton;
    Label18: TLabel;
    cbAtividadeVinculo: TcxDBLookupComboBox;
    btnPesquisarAtividade: TButton;
    Label19: TLabel;
    EditNomeArquivo: TcxDBTextEdit;
    Label20: TLabel;
    EditCaminhoArquivo: TcxButtonEdit;
    Ac_CarregarArquivo: TAction;
    SaveDialogDocumento: TSaveDialog;
    FileDialog: TOpenTextFileDialog;
    Label21: TLabel;
    EditDescricaoArquivo: TcxDBMemo;
    Label22: TLabel;
    EditComentario: TcxDBMemo;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_PESSOA: TcxGridDBColumn;
    viewRegistrosDetailFUNCAO: TcxGridDBColumn;
    pnBotoesDetailVinculo: TPanel;
    btnIncluirVinculo: TButton;
    cxGrid1: TcxGrid;
    viewDetailVinculo: TcxGridDBTableView;
    viewDetailVinculoID: TcxGridDBColumn;
    viewDetailVinculoTIPO_VINCULO: TcxGridDBColumn;
    viewDetailVinculoID_ATIVIDADE_ORIGEM: TcxGridDBColumn;
    viewDetailVinculoID_ATIVIDADE_ALVO: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    Panel1: TPanel;
    Button2: TButton;
    cxGrid2: TcxGrid;
    viewProjetos: TcxGridDBTableView;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    viewProjetosID: TcxGridDBColumn;
    viewProjetosID_PROJETO: TcxGridDBColumn;
    Panel2: TPanel;
    Button3: TButton;
    cxGrid3: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    Panel3: TPanel;
    Button4: TButton;
    cxGrid4: TcxGrid;
    viewDetailComentario: TcxGridDBTableView;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    cxGridDBTableView1ID: TcxGridDBColumn;
    cxGridDBTableView1NOME: TcxGridDBColumn;
    cxGridDBTableView1DATA_UPLOAD: TcxGridDBColumn;
    viewDetailComentarioID: TcxGridDBColumn;
    viewDetailComentarioID_PESSOA: TcxGridDBColumn;
    viewDetailComentarioCOMENTARIO: TcxGridDBColumn;
    viewDetailComentarioDATA_HORA: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure viewRegistrosSTATUSPropertiesEditValueChanged(Sender: TObject);
    procedure Ac_CarregarArquivoExecute(Sender: TObject);
    procedure pcDetailsChange(Sender: TObject);
  private
    { Private declarations }
  protected
    function fprGetPermissao: string; override;
    procedure pprPreencherCamposPadroes(ipDataSet: TDataSet); override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    procedure pprDefinirTabDetailCadastro; override;
  public
    procedure ppuIncluir; override;
    procedure ppuIncluirDetail; override;

  end;

var
  frmAtividade: TfrmAtividade;

implementation

{$R *.dfm}

{ TfrmAtividade }

procedure TfrmAtividade.Ac_CarregarArquivoExecute(Sender: TObject);
begin
  inherited;
  if FileDialog.Execute then
    begin
      if not TFile.Exists(FileDialog.FileName) then
        raise Exception.Create('Arquivo não encontrado.');

      if not(dmAdministrativo.cdsAtividade_Arquivo.State in [dsEdit, dsInsert]) then
        dmAdministrativo.cdsAtividade_Arquivo.Edit;

      EditCaminhoArquivo.Text := FileDialog.FileName;
      dmAdministrativo.cdsAtividade_ArquivoARQUIVO.LoadFromFile(FileDialog.FileName);
      dmAdministrativo.cdsAtividade_ArquivoNOME_ORIGINAL.AsString := TPath.GetFileName(FileDialog.FileName);
      dmAdministrativo.cdsAtividade_ArquivoDATA_UPLOAD.AsDateTime := StrToDateTime(dmPrincipal.FuncoesGeral.fpuDataHoraAtual);
    end
  else
    EditCaminhoArquivo.Text := '';
end;

procedure TfrmAtividade.FormCreate(Sender: TObject);
begin
  dmAdministrativo := TdmAdministrativo.Create(Self);
  dmAdministrativo.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';
  inherited;
  PesquisaPadrao := tppTodos;

  dmLookup.cdslkPessoa.Open;

  dmLookup.cdslkProjeto.ppuDataRequest([TParametros.coSituacaoDiferente],
    [Ord(spRecusado).ToString + ';' + Ord(spExecutado).ToString + ';' + Ord(spCancelado).ToString]); // recusado, cancelado, executado

end;

function TfrmAtividade.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoAdministrativo), Ord(admAtividade));
end;

procedure TfrmAtividade.pcDetailsChange(Sender: TObject);
begin
  inherited;
  if pcDetails.ActivePage = tabDetail then
    dsDetail.DataSet := dmAdministrativo.cdsAtividade_Pessoa
  else if pcDetails.ActivePage = tabDetailProjeto then
    dsDetail.DataSet := dmAdministrativo.cdsAtividade_Projeto
  else if pcDetails.ActivePage = tabDetailVinculo then
    begin
      dsDetail.DataSet := dmAdministrativo.cdsAtividade_Vinculo;
      if (not dmLookup.cdslkAtividade.Active) or (dmLookup.cdslkAtividade.ValoresParametros[0] <> dmAdministrativo.cdsAtividadeID_PROJETO.AsInteger)
      then
        begin
          dmLookup.cdslkAtividade.ppuLimparParametros;
          dmLookup.cdslkAtividade.ppuDataRequest(['PROJETO'], [dmAdministrativo.cdsAtividadeID_PROJETO.AsInteger]);
        end;
    end
  else if pcDetails.ActivePage = tabDetailArquivo then
    dsDetail.DataSet := dmAdministrativo.cdsAtividade_Arquivo
  else if pcDetails.ActivePage = tabDetailComentario then
    dsDetail.DataSet := dmAdministrativo.cdsAtividade_Comentario;

  if not dsDetail.DataSet.Active then
    dsDetail.DataSet.Open;
end;

procedure TfrmAtividade.ppuIncluirDetail;
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastroDetailArquivo then
    EditCaminhoArquivo.Text := ''
  else if pcDetails.ActivePage = tabCadastroDetailVinculo then
    dmAdministrativo.cdsAtividade_VinculoTIPO_VINCULO.AsInteger := Ord(tvRelacionado);
end;

procedure TfrmAtividade.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  { TODO -orafae -c : Percorrer os itens e pegar os codigos dos projetos marcados 24/02/2016 23:28:30 }
  // if (not VarIsNull(cbProjetos.EditValue)) and (cbProjetos.EditValue <> '') then
  // dmAdministrativo.cdsProjeto.ppuAddParametro(TParametros.coProjetos, cbProjetos.EditValue);
end;

procedure TfrmAtividade.pprDefinirTabDetailCadastro;
begin
  inherited;
  if pcDetails.ActivePage = tabDetail then
    pcPrincipal.ActivePage := tabCadastroDetail
  else if pcDetails.ActivePage = tabDetailProjeto then
    pcPrincipal.ActivePage := tabCadastroDetailProjeto
  else if pcDetails.ActivePage = tabDetailVinculo then
    pcPrincipal.ActivePage := tabCadastroDetailVinculo
  else if pcDetails.ActivePage = tabDetailArquivo then
    pcPrincipal.ActivePage := tabCadastroDetailArquivo
  else if pcDetails.ActivePage = tabDetailComentario then
    pcPrincipal.ActivePage := tabCadastroDetailComentario;
end;

procedure TfrmAtividade.pprPreencherCamposPadroes(ipDataSet: TDataSet);
begin
  inherited;
  if ipDataSet = dmAdministrativo.cdsAtividade_Comentario then
    dmAdministrativo.cdsAtividade_ComentarioDATA_HORA.AsDateTime := StrToDateTime(dmPrincipal.FuncoesGeral.fpuDataHoraAtual);
end;

procedure TfrmAtividade.ppuIncluir;
begin
  inherited;
  dmAdministrativo.cdsAtividadeSTATUS.AsInteger := 0; // programada
  dmAdministrativo.cdsAtividadeID_SOLICITANTE.AsInteger := TInfoLogin.fpuGetInstance.Usuario.Id;
end;

procedure TfrmAtividade.viewRegistrosSTATUSPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if dmAdministrativo.cdsAtividade.State in [dsEdit, dsInsert] then
    dmAdministrativo.cdsAtividade.Post;
end;

end.
