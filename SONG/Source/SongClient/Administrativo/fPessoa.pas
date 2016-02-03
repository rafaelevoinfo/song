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
  uUtils, Datasnap.DBClient, fmGrids, dmuLookup;

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
    EditCelular: TcxDBMaskEdit;
    Label8: TLabel;
    EditTelefone: TcxDBMaskEdit;
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
    cdsLocalPerfisNOME: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    dmAdministrativo: TdmAdministrativo;
    dmLookup: TdmLookup;
    procedure ppvCarregarPerfis;
  protected
    procedure pprValidarDados; override;
    procedure pprBeforeSalvar; override;
  public
    procedure ppuIncluirDetail; override;
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

  ppvCarregarPerfis;

end;

procedure TfrmPessoa.ppvCarregarPerfis;
begin
  dmLookup.cdslkPerfil.Open;
  cdsLocalPerfis.Data := dmLookup.cdslkPerfil.Data;
end;

procedure TfrmPessoa.pprBeforeSalvar;
begin
  inherited;
  if Trim(EditSenha.Text) <> '' then
    dmAdministrativo.cdsPessoaSENHA.AsString := TUtils.fpuCriptografarSha1(Trim(EditSenha.Text));

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

procedure TfrmPessoa.ppuIncluirDetail;
begin
  inherited;
   // nao quero que fique em insert
  dmAdministrativo.cdsPessoa_Perfil.Cancel;
end;

end.
