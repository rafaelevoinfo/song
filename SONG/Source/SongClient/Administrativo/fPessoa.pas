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
  uUtils, Datasnap.DBClient, fmGrids, dmuLookup, uTypes, uClientDataSet,
  System.TypInfo, uControleAcesso;

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
    EditBairro: TcxDBTextEdit;
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
    procedure FormCreate(Sender: TObject);
  private
    dmAdministrativo: TdmAdministrativo;
    dmLookup: TdmLookup;
    procedure ppvCarregarPerfis;
    procedure ppvConfigurarGrids;
  protected
    procedure pprValidarDados; override;
    procedure pprBeforeSalvar; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    procedure pprRealizarPesquisaInicial; override;

    function fprGetPermissao: String; override;
  public
    procedure ppuIncluirDetail; override;
    procedure ppuAlterarDetail(ipId: Integer); override;

    procedure ppuAlterar(ipId: Integer); override;
    procedure ppuIncluir; override;
  public const
    coNome = 2;
    coLogin = 3;

  end;

var
  frmPessoa: TfrmPessoa;

implementation

{$R *.dfm}

procedure TfrmPessoa.FormCreate(Sender: TObject);
begin
  dmAdministrativo := TdmAdministrativo.Create(Self);
  dmAdministrativo.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';
  inherited;

  dmLookup.cdslkPerfil.Open;

  ppvConfigurarGrids;
end;

procedure TfrmPessoa.ppvConfigurarGrids;
begin
  // Esquerda
  frameGrids.ppuAdicionarField(frameGrids.viewEsquerda, 'ID', dmLookup.repLcbPerfil);
  // Direita
  frameGrids.ppuAdicionarField(frameGrids.viewDireita, 'ID_PERFIL', dmLookup.repLcbPerfil);
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
  Result := GetEnumName(TypeInfo(TPermissao), Ord(admPessoa));
end;

procedure TfrmPessoa.pprBeforeSalvar;
begin
  inherited;
  if Trim(EditSenha.Text) <> '' then
    dmAdministrativo.cdsPessoaSENHA.AsString := TUtils.fpuCriptografarSha1(Trim(EditSenha.Text));

end;

procedure TfrmPessoa.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.ItemIndex = coNome then
    ipCds.ppuAddParametro(TParametros.coNome, EditPesquisa.Text)
  else if (cbPesquisarPor.ItemIndex = coLogin) then
    ipCds.ppuAddParametro(TParametros.coLogin, EditPesquisa.Text);
end;

procedure TfrmPessoa.pprRealizarPesquisaInicial;
begin
  inherited; // vai apenas abrir a tabela
  cbPesquisarPor.ItemIndex := coNome;
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
