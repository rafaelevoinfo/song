unit fPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrudMasterDetail, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, System.Actions, Vcl.ActnList,
  cxSplitter, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls,
  cxDropDownEdit, cxImageComboBox, cxTextEdit, cxMaskEdit, cxCalendar,
  Vcl.ExtCtrls, cxPC, dmuAdministrativo, cxDBEdit, cxGroupBox, uExceptions,
  uUtils, Datasnap.DBClient, fmGrids, uTypes, uClientDataSet,
  System.TypInfo, uControleAcesso, cxRadioGroup, dmuPrincipal, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dmuLookup, cxMemo, cxCheckBox,
  cxCheckComboBox, Vcl.CustomizeDlg, cxLocalization, Vcl.ExtDlgs;

type
  TfrmPessoa = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosCELULAR: TcxGridDBColumn;
    viewRegistrosRG: TcxGridDBColumn;
    viewRegistrosCPF: TcxGridDBColumn;
    viewRegistrosENDERECO: TcxGridDBColumn;
    viewRegistrosLOGIN: TcxGridDBColumn;
    viewRegistrosBAIRRO: TcxGridDBColumn;
    viewRegistrosCOMPLEMENTO: TcxGridDBColumn;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_PERFIL: TcxGridDBColumn;
    rgInfoPessoais: TcxGroupBox;
    rgInfoContato: TcxGroupBox;
    rgInfoLogin: TcxGroupBox;
    EditNome: TcxDBTextEdit;
    Label3: TLabel;
    EditRg: TcxDBTextEdit;
    Label4: TLabel;
    Label5: TLabel;
    EditCpf: TcxDBMaskEdit;
    Label6: TLabel;
    EditEmail: TcxDBTextEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EditEndereco: TcxDBTextEdit;
    Label10: TLabel;
    Label11: TLabel;
    EditComplemento: TcxDBTextEdit;
    lbl1: TLabel;
    EditLogin: TcxDBTextEdit;
    lbl2: TLabel;
    EditSenha: TcxTextEdit;
    viewRegistrosTELEFONE: TcxGridDBColumn;
    viewRegistrosEMAIL: TcxGridDBColumn;
    frameGrids: TframeGrids;
    cdsLocalPerfis: TClientDataSet;
    cdsLocalPerfisID: TIntegerField;
    EditCelular: TcxDBMaskEdit;
    EditTelefone: TcxDBMaskEdit;
    Label12: TLabel;
    EditBairro: TcxDBTextEdit;
    Label13: TLabel;
    cbTipo: TcxDBImageComboBox;
    viewRegistrosCIDADE: TcxGridDBColumn;
    viewRegistrosTIPO: TcxGridDBColumn;
    cbCidade: TcxDBLookupComboBox;
    dslkCidade: TDataSource;
    EditDataNascimento: TcxDBDateEdit;
    Label14: TLabel;
    Label15: TLabel;
    EditObservacao: TcxDBMemo;
    Label16: TLabel;
    cbTipoVinculoPesquisa: TcxCheckComboBox;
    CustomizeDlg1: TCustomizeDlg;
    EditCep: TcxDBMaskEdit;
    lb1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ColumnExcluirCustomDrawHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure frameGridsbtnAddTodosClick(Sender: TObject);
    procedure frameGridsbtnRemoverClick(Sender: TObject);
  private
    dmAdministrativo: TdmAdministrativo;
    dmLookup: TdmLookup;
    procedure ppvCarregarPerfis;
    procedure ppvConfigurarGrids;
    procedure ppvCarregarTipos;
  protected
    procedure pprValidarDados; override;
    procedure pprBeforeSalvar; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    procedure pprExecutarSalvarDetail; override;

    function fprHabilitarAlterar: Boolean; override;

    function fprGetPermissao: String; override;
  public
    procedure ppuIncluirDetail; override;
    procedure ppuAlterarDetail(ipId: Integer); override;

    procedure ppuAlterar(ipId: Integer); override;
    procedure ppuIncluir; override;

  public const
    coLogin = 5;

  end;

var
  frmPessoa: TfrmPessoa;

implementation

{$R *.dfm}


procedure TfrmPessoa.ppvCarregarTipos;
var
  vaTipo: TcxCheckComboBoxItem;
  vaTipoImg: TcxImageComboBoxItem;
  i: Integer;
begin
  cbTipoVinculoPesquisa.Properties.Items.Clear;
  for i := 0 to dmLookup.repIcbTipoPessoa.Properties.Items.Count - 1 do
    begin
      vaTipoImg := dmLookup.repIcbTipoPessoa.Properties.Items[i];

      vaTipo := cbTipoVinculoPesquisa.Properties.Items.Add;
      vaTipo.Tag := vaTipoImg.Value;
      vaTipo.Description := vaTipoImg.Description;
    end;
end;

procedure TfrmPessoa.ColumnExcluirCustomDrawHeader(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
begin
  inherited;
  if dmAdministrativo.cdsPessoa.Active and (dmAdministrativo.cdsPessoa.RecordCount > 0) then
    begin
      if dmAdministrativo.cdsPessoaATIVO.AsInteger = coRegistroAtivo then
        AViewInfo.Text := 'Inativar'
      else
        AViewInfo.Text := 'Ativar';
    end
  else
    AViewInfo.Text := 'Ativar/Inativar';
end;

procedure TfrmPessoa.FormCreate(Sender: TObject);
begin
  dmAdministrativo := TdmAdministrativo.Create(Self);
  dmAdministrativo.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';
  inherited;
  PesquisaPadrao := Ord(tppNome);

  dmLookup.cdslkPerfil.Open;
  ppvCarregarTipos;
  if not dmPrincipal.cdslkCidade.Active then
    dmPrincipal.cdslkCidade.Open;

  ppvConfigurarGrids;
end;

procedure TfrmPessoa.ppvConfigurarGrids;
begin
  // Esquerda
  frameGrids.fpuAdicionarField(frameGrids.viewEsquerda, 'ID', dmLookup.repLcbPerfil);
  // Direita
  frameGrids.fpuAdicionarField(frameGrids.viewDireita, 'ID_PERFIL', dmLookup.repLcbPerfil);
  // mapeando
  frameGrids.ppuMapearFields('ID', 'ID_PERFIL');
end;

procedure TfrmPessoa.ppvCarregarPerfis;
begin
  cdsLocalPerfis.Data := dmLookup.cdslkPerfil.Data;
  TUtils.ppuPercorrerCds(dmAdministrativo.cdsPessoa_Perfil,
    procedure
    begin
      if cdsLocalPerfis.Locate(TBancoDados.coId, dmAdministrativo.cdsPessoa_PerfilID_PERFIL.AsInteger, []) then
        begin
          cdsLocalPerfis.delete;
        end;
    end);

end;

function TfrmPessoa.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoAdministrativo), Ord(admPessoa));
end;

function TfrmPessoa.fprHabilitarAlterar: Boolean;
begin
  Result := inherited and dmAdministrativo.cdsPessoa.Active and (dmAdministrativo.cdsPessoaATIVO.AsInteger = 0);
end;

procedure TfrmPessoa.frameGridsbtnAddTodosClick(Sender: TObject);
begin
  inherited;
  frameGrids.Ac_AddTodosExecute(Sender);
end;

procedure TfrmPessoa.frameGridsbtnRemoverClick(Sender: TObject);
begin
  inherited;
  frameGrids.Ac_RemoverExecute(Sender);

end;

procedure TfrmPessoa.pprBeforeSalvar;
begin
  inherited;
  if Trim(EditSenha.Text) <> '' then
    dmAdministrativo.cdsPessoaSENHA.AsString := TUtils.fpuCriptografarSha1(Trim(EditSenha.Text));

end;

procedure TfrmPessoa.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
var
  vaTipos: string;
begin
  inherited;
  ipCds.ppuAddParametro(TParametros.coAtivo, rgStatus.ItemIndex);

  if (cbPesquisarPor.EditValue = coLogin) then
    ipCds.ppuAddParametro(TParametros.coLogin, EditPesquisa.Text);

  vaTipos := TUtils.fpuExtrairValoresCheckComboBox(cbTipoVinculoPesquisa);
  if vaTipos <> '' then
    ipCds.ppuAddParametro(TParametros.coTipo, vaTipos);
end;

procedure TfrmPessoa.pprExecutarSalvarDetail;
begin
  inherited;
  if dmAdministrativo.cdsPessoa_Perfil.ChangeCount > 0 then
    dmAdministrativo.cdsPessoa_Perfil.ApplyUpdates(0);
end;

procedure TfrmPessoa.pprValidarDados;
begin
  inherited;
  if dmAdministrativo.cdsPessoaNOME.AsString = '' then
    raise TControlException.Create('Informe o nome da pessoa.', EditNome);

  if (dmAdministrativo.cdsPessoaLOGIN.AsString <> '') and (dmAdministrativo.cdsPessoaSENHA.AsString = '') and
    (Trim(EditSenha.Text) = '') then
    raise TControlException.Create('Informe a senha.', EditSenha);

  if (dmAdministrativo.cdsPessoaEMAIL.AsString <> '') and
    (not TUtils.fpuValidarEmail(dmAdministrativo.cdsPessoaEMAIL.AsString)) then
    raise TControlException.Create('Formato de e-mail de inválido. Deve seguir o formato xxx@xxxx.xxx', EditEmail);

  if not dmPrincipal.FuncoesAdm.fpuValidarLogin(dmAdministrativo.cdsPessoaID.AsInteger,
    dmAdministrativo.cdsPessoaNOME.AsString) then
    raise TControlException.Create('O login informado já foi cadastrado. Por favor, informe outro.', EditLogin);

  if not dmPrincipal.FuncoesAdm.fpuValidarNomeCpfPessoa(dmAdministrativo.cdsPessoaID.AsInteger, dmAdministrativo.cdsPessoaNOME.AsString.Trim,
    dmAdministrativo.cdsPessoaCPF.AsString.Trim) then
    raise TControlException.Create('Já existe uma pessoa cadastrada com esse nome e CPF.', EditNome);
end;

procedure TfrmPessoa.ppuAlterar(ipId: Integer);
begin
  inherited;
  EditSenha.Clear;
end;

procedure TfrmPessoa.ppuAlterarDetail(ipId: Integer);
begin
  inherited;
  ppvCarregarPerfis;
end;

procedure TfrmPessoa.ppuIncluir;
begin
  inherited;
  EditSenha.Clear;
end;

procedure TfrmPessoa.ppuIncluirDetail;
begin
  inherited;
  // nao quero que fique em insert
  dmAdministrativo.cdsPessoa_Perfil.Cancel;
  ppvCarregarPerfis;
end;

end.
