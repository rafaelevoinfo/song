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
  dmuPrincipal, uMensagem, cxImage;

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
    procedure FormCreate(Sender: TObject);
    procedure Ac_CarregarImagemExecute(Sender: TObject);
    procedure Ac_LimparExecute(Sender: TObject);
    procedure pcDetailsChange(Sender: TObject);
  private
    dmAdministrativo: TdmAdministrativo;
    dmLookup: TdmLookup;
  protected
    function fprGetPermissao: String; override;
    procedure pprBeforeIncluirDetail; override;
    procedure pprBeforeAlterarDetail; override;

    procedure pprDefinirTabDetailCadastro; override;
    procedure pprPreencherCamposPadroes(ipDataSet: TDataSet);override;

    procedure pprFiltrarPessoas(ipIdPessoaIgnorar: Integer = 0);
  public
    procedure ppuRetornar; override;

  end;

var
  frmOrganizacao: TfrmOrganizacao;

implementation

{$R *.dfm}

{ TfrmOrganizacao }

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
  PesquisaPadrao := tppTodos;

  dmLookup.cdslkPessoa.Open;
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
  if dmAdministrativo.cdsFundoSALDO.IsNull then
    dmAdministrativo.cdsFundoSALDO.AsFloat := 0;
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
  pprFiltrarPessoas(dmAdministrativo.cdsOrganizacao_PessoaID_PESSOA.AsInteger);
end;

procedure TfrmOrganizacao.pprBeforeIncluirDetail;
begin
  inherited;
  pprFiltrarPessoas;
end;

procedure TfrmOrganizacao.pprDefinirTabDetailCadastro;
begin
   if pcDetails.ActivePage = tabDetail then
    pcPrincipal.ActivePage := tabCadastroDetail
  else if pcDetails.ActivePage = tabDetailFundo then
    pcPrincipal.ActivePage := tabCadastroFundo;
end;

end.
