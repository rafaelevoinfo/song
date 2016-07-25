unit fOrganizacao;

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
  cxDBEdit, cxMemo, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  uControleAcesso, System.TypInfo, uUtils, uClientDataSet, uTypes,
  dmuPrincipal, uMensagem, cxImage, cxCheckBox, Datasnap.DBClient;

type
  TfrmOrganizacao = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosCNPJ: TcxGridDBColumn;
    viewRegistrosINSCRICAO_ESTADUAL: TcxGridDBColumn;
    viewRegistrosENDERECO: TcxGridDBColumn;
    viewRegistrosBAIRRO: TcxGridDBColumn;
    viewRegistrosCOMPLEMENTO: TcxGridDBColumn;
    viewRegistrosCIDADE: TcxGridDBColumn;
    viewRegistrosTELEFONE: TcxGridDBColumn;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_PESSOA: TcxGridDBColumn;
    viewRegistrosDetailFUNCAO: TcxGridDBColumn;
    Label3: TLabel;
    EditNome: TcxDBTextEdit;
    Label4: TLabel;
    EditCnpj: TcxDBMaskEdit;
    Label5: TLabel;
    EditInscricaoEstadual: TcxDBTextEdit;
    rgEndereco: TcxGroupBox;
    Label6: TLabel;
    EditEndereco: TcxDBTextEdit;
    EditBairro: TcxDBTextEdit;
    Label7: TLabel;
    Label8: TLabel;
    EditComplemento: TcxDBTextEdit;
    Label9: TLabel;
    Label11: TLabel;
    EditFuncao: TcxDBTextEdit;
    Label12: TLabel;
    cbPessoa: TcxDBLookupComboBox;
    Label13: TLabel;
    EditObs: TcxDBMemo;
    Label10: TLabel;
    EditTelefone: TcxDBMaskEdit;
    cbCidade: TcxDBLookupComboBox;
    dslkCidade: TDataSource;
    EditFoto: TcxDBImage;
    lb1: TLabel;
    btnLimparFoto: TButton;
    btnCarregarFoto: TButton;
    Ac_CarregarImagem: TAction;
    Ac_Limpar: TAction;
    tabDetailFundo: TcxTabSheet;
    pnBotoesDetailFundo: TPanel;
    Button1: TButton;
    cxGridFundo: TcxGrid;
    viewFundo: TcxGridDBTableView;
    ColumnAlterarFundo: TcxGridDBColumn;
    ColumnExcluirFundo: TcxGridDBColumn;
    level1: TcxGridLevel;
    tabCadastroFundo: TcxTabSheet;
    pnBotoesCadastroFundo: TPanel;
    btnSalvarFundo: TButton;
    btnCancelarFundo: TButton;
    btnSalvarIncluirFundo: TButton;
    pnEditsCadastroFundo: TPanel;
    dsDetailFundo: TDataSource;
    viewFundoID: TcxGridDBColumn;
    viewFundoNOME: TcxGridDBColumn;
    viewFundoSALDO: TcxGridDBColumn;
    Label14: TLabel;
    EditNomeFundo: TcxDBTextEdit;
    Label15: TLabel;
    EditDescricaoFundo: TcxDBMemo;
    chkRequerAutorizacao: TcxDBCheckBox;
    viewFundoREQUER_AUTORIZACAO: TcxGridDBColumn;
    btnAjustarSaldo: TButton;
    Ac_Ajustar_Saldo: TAction;
    cdsLocalSaldo: TClientDataSet;
    cdsLocalSaldoID_ORGANIZACAO: TIntegerField;
    cdsLocalSaldoNOME_ORGANIZACAO: TStringField;
    cdsLocalSaldoID_PROJETO_FUNDO: TIntegerField;
    cdsLocalSaldoNOME_PROJETO_FUNDO: TStringField;
    cdsLocalSaldoSALDO: TBCDField;
    cdsLocalSaldoSALDO_GERAL: TBCDField;
    cdsLocalSaldoTIPO_ORIGEM: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure Ac_CarregarImagemExecute(Sender: TObject);
    procedure Ac_LimparExecute(Sender: TObject);
    procedure pcDetailsChange(Sender: TObject);
    procedure Ac_Ajustar_SaldoExecute(Sender: TObject);
  private
    dmAdministrativo: TdmAdministrativo;
    dmLookup: TdmLookup;
  protected
    function fprGetPermissao: String; override;
    procedure pprBeforeIncluirDetail; override;
    procedure pprBeforeAlterarDetail; override;

    procedure pprDefinirTabDetailCadastro; override;
    procedure pprPreencherCamposPadroes(ipDataSet: TDataSet); override;

    procedure pprEfetuarPesquisa; override;

    procedure pprFiltrarPessoas(ipIdPessoaIgnorar: Integer = 0);
  public
    procedure ppuRetornar; override;

  end;

var
  frmOrganizacao: TfrmOrganizacao;

implementation

{$R *.dfm}

{ TfrmOrganizacao }

procedure TfrmOrganizacao.Ac_Ajustar_SaldoExecute(Sender: TObject);
begin
  inherited;
  if TMensagem.fpuPerguntar('Tem certeza que deseja ajustar o saldo agora? Isto poderá demorar algum tempo.', ppSimNao) = rpSim then
    begin
      cdsLocalSaldo.Data := dmPrincipal.FuncoesRelatorio.fpuSaldo(dmAdministrativo.cdsOrganizacaoID.AsInteger, -1, dmAdministrativo.cdsFundoID.AsInteger);
      if cdsLocalSaldo.Locate(cdsLocalSaldoID_PROJETO_FUNDO.FieldName + ';' + cdsLocalSaldoTIPO_ORIGEM.FieldName,
        VarArrayOf([dmAdministrativo.cdsFundoID.AsInteger, Ord(oriFundo)]), []) then
        begin
          dmAdministrativo.cdsFundo.Edit;
          dmAdministrativo.cdsFundoSALDO.AsFloat := cdsLocalSaldoSALDO.AsFloat;
          dmAdministrativo.cdsFundo.Post;
          if dmAdministrativo.cdsFundo.ChangeCount > 0 then
            dmAdministrativo.cdsFundo.ApplyUpdates(0);
        end
      else
        raise Exception.Create('Não foi encontrado nenhuma informação sobre a conta selecionada.');
    end;
end;

procedure TfrmOrganizacao.Ac_CarregarImagemExecute(Sender: TObject);
begin
  inherited;
  try
    EditFoto.LoadFromFile;
  except
    on e: Exception do
      TMensagem.ppuShowException('Imagem inválida.', e);
  end;
end;

procedure TfrmOrganizacao.Ac_LimparExecute(Sender: TObject);
begin
  inherited;
  try
    if not(dmAdministrativo.cdsOrganizacao.State in [dsEdit, dsInsert]) then
      dmAdministrativo.cdsOrganizacao.Edit;

    dmAdministrativo.cdsOrganizacaoLOGO.Clear;
  except
    on e: Exception do
      TMensagem.ppuShowException('Erro ao remover a logo.', e);
  end;
end;

procedure TfrmOrganizacao.FormCreate(Sender: TObject);
begin
  dmAdministrativo := TdmAdministrativo.Create(Self);
  dmAdministrativo.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';
  inherited;
  PesquisaPadrao := Ord(tppTodos);

  dmLookup.cdslkPessoa.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);
  if not dmPrincipal.cdslkCidade.Active then
    dmPrincipal.cdslkCidade.Open;
  // Essa tela tela é um caso especial, por isso precisei fazer isso
  dsDetail.DataSet := dmAdministrativo.cdsFundo;
end;

function TfrmOrganizacao.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoAdministrativo), Ord(admOrganizacao));
end;

procedure TfrmOrganizacao.pprFiltrarPessoas(ipIdPessoaIgnorar: Integer);
var
  vaCodigosPessoa: string;
begin
  inherited;
  vaCodigosPessoa := TUtils.fpuMontarStringCodigo(dmAdministrativo.cdsOrganizacao_Pessoa,
    dmAdministrativo.cdsOrganizacao_PessoaID_PESSOA.FieldName, ', ');
  if vaCodigosPessoa <> '' then
    begin
      dmLookup.cdslkPessoa.Filter := Format('(NOT %s IN (' + vaCodigosPessoa + '))', [TBancoDados.coId]);
      if ipIdPessoaIgnorar <> 0 then
        dmLookup.cdslkPessoa.Filter := dmLookup.cdslkPessoa.Filter + ' OR (' + TBancoDados.coId + ' = ' +
          ipIdPessoaIgnorar.ToString + ')';
    end
  else
    dmLookup.cdslkPessoa.Filter := '';

  dmLookup.cdslkPessoa.Filtered := dmLookup.cdslkPessoa.Filter <> '';
end;

procedure TfrmOrganizacao.pprPreencherCamposPadroes(ipDataSet: TDataSet);
begin
  inherited;
  if ipDataSet = dmAdministrativo.cdsFundo then
    begin
      if dmAdministrativo.cdsFundoSALDO.IsNull then
        dmAdministrativo.cdsFundoSALDO.AsFloat := 0;
    end;
end;

procedure TfrmOrganizacao.ppuRetornar;
begin
  inherited;
  dmLookup.cdslkPessoa.Filtered := False;
end;

procedure TfrmOrganizacao.pcDetailsChange(Sender: TObject);
begin
  inherited;
  if pcDetails.ActivePage = tabDetail then
    dsDetail.DataSet := dmAdministrativo.cdsOrganizacao_Pessoa
  else if pcDetails.ActivePage = tabDetailFundo then
    dsDetail.DataSet := dmAdministrativo.cdsFundo;

  if not dsDetail.DataSet.Active then
    dsDetail.DataSet.Open;
end;

procedure TfrmOrganizacao.pprBeforeAlterarDetail;
begin
  inherited;
  if pcDetails.ActivePage = tabDetail then
    pprFiltrarPessoas(dmAdministrativo.cdsOrganizacao_PessoaID_PESSOA.AsInteger);
end;

procedure TfrmOrganizacao.pprBeforeIncluirDetail;
begin
  inherited;
  if pcDetails.ActivePage = tabDetail then
    pprFiltrarPessoas;
end;

procedure TfrmOrganizacao.pprDefinirTabDetailCadastro;
begin
  if pcDetails.ActivePage = tabDetail then
    pcPrincipal.ActivePage := tabCadastroDetail
  else if pcDetails.ActivePage = tabDetailFundo then
    pcPrincipal.ActivePage := tabCadastroFundo;
end;

procedure TfrmOrganizacao.pprEfetuarPesquisa;
begin
  viewFundo.BeginUpdate(lsimImmediate);
  try
    dmAdministrativo.cdsFundo.Close;
    inherited;
    dmAdministrativo.cdsFundo.Open;
  finally
    viewFundo.EndUpdate;
  end;

end;

end.
