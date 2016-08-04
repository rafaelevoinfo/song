unit fCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fFinanciador, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, System.Actions, Vcl.ActnList,
  cxMemo, cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxGroupBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxRadioGroup,
  Vcl.StdCtrls, cxDropDownEdit, cxImageComboBox, cxTextEdit, cxMaskEdit,
  cxCalendar, Vcl.ExtCtrls, cxPC, uTypes, uControleAcesso, System.TypInfo,
  uUtils, uExceptions, dmuPrincipal, Vcl.ExtDlgs;

type
  TfrmCliente = class(TfrmFinanciador)
    rgTipoFornecedor: TcxRadioGroup;
    procedure rgTipoFornecedorPropertiesEditValueChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private


    { Private declarations }
  protected
    function fprGetTipo: TTipoFinForCli; override;
    function fprGetTipoPessoa: TTipoRelacionamentoPessoa; override;
    function fprGetPermissao: String; override;
    procedure pprBeforeSalvar; override;
    procedure pprValidarCPFCNPJ; override;
    procedure pprValidarCampoUnico;override;
  public
    procedure ppuIncluir; override;
    procedure ppuAlterar(ipId: Integer); override;
  end;

var
  frmCliente: TfrmCliente;

const
  coPessoaJuridica = 0;
  coPessoaFisica = 1;

implementation

{$R *.dfm}

{ TfrmFinanciador1 }

procedure TfrmCliente.FormCreate(Sender: TObject);
begin
  inherited;
  PesquisaPadrao := coRazaoSocial;
end;

function TfrmCliente.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoFinanceiro), Ord(finCliente));
end;

function TfrmCliente.fprGetTipo: TTipoFinForCli;
begin
  Result := tfCliente;
end;

function TfrmCliente.fprGetTipoPessoa: TTipoRelacionamentoPessoa;
begin
  Result := trpcliente;
end;

procedure TfrmCliente.ppuAlterar(ipId: Integer);
begin
  inherited;
  if TUtils.fpuExtrairNumeros(dmFinanceiro.cdsFin_For_CliCPF_CNPJ.AsString).Length = 14 then // cnpj
    rgTipoFornecedor.ItemIndex := coPessoaJuridica
  else
    rgTipoFornecedor.ItemIndex := coPessoaFisica;
end;

procedure TfrmCliente.ppuIncluir;
begin
  inherited;
  rgTipoFornecedor.ItemIndex := coPessoaJuridica;
end;

procedure TfrmCliente.pprBeforeSalvar;
begin
  inherited;
  if rgTipoFornecedor.ItemIndex = coPessoaFisica then
    dmFinanceiro.cdsFin_For_CliNOME_FANTASIA.Clear;
end;

procedure TfrmCliente.pprValidarCPFCNPJ;
begin
  // nao chamar o inherited
  if rgTipoFornecedor.ItemIndex = coPessoaJuridica then
    begin
      if not TUtils.fpuValidarCnpj(dmFinanceiro.cdsFin_For_CliCPF_CNPJ.AsString) then
        raise TControlException.Create('CNPJ inválido.', EditCpfCnpj);
    end
  else
    begin
      if not TUtils.fpuValidarCpf(dmFinanceiro.cdsFin_For_CliCPF_CNPJ.AsString) then
        raise TControlException.Create('CPF inválido.', EditCpfCnpj);
    end;
end;

procedure TfrmCliente.pprValidarCampoUnico;
begin
  // nao chamar o inherited
  if not dmPrincipal.FuncoesAdm.fpuValidarFinanciadorFornecedorCliente(dmFinanceiro.cdsFin_For_CliID.AsInteger,
    Ord(fprGetTipo), dmFinanceiro.cdsFin_For_CliRAZAO_SOCIAL.AsString, dmFinanceiro.cdsFin_For_CliCPF_CNPJ.AsString) then
    begin
      if rgTipoFornecedor.ItemIndex = coPessoaJuridica then
        raise TControlException.Create('Já existe um cliente cadastrado com esta razão social e este CNPJ', EditRazaoSocial)
      else
        raise TControlException.Create('Já existe um cliente cadastrado com este nome e CPF', EditRazaoSocial);
    end;
end;

procedure TfrmCliente.rgTipoFornecedorPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if rgTipoFornecedor.ItemIndex = coPessoaJuridica then
    begin
      EditCpfCnpj.Properties.EditMask := coRegexCNPJ;
      lbRazaoSocial.Caption := 'Razão Social';
      lbCpfCnpj.Caption := 'CNPJ';
    end
  else
    begin
      EditCpfCnpj.Properties.EditMask := coRegexCPF;
      lbRazaoSocial.Caption := 'Nome do Cliente';
      lbCpfCnpj.Caption := 'CPF';
    end;
  EditNomeFantasia.Enabled := rgTipoFornecedor.ItemIndex = coPessoaJuridica;
end;

end.
