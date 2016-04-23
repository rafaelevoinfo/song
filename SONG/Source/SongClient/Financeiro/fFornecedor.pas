unit fFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fFinanciador, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, System.Actions, Vcl.ActnList,
  cxMemo, cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxRadioGroup, Vcl.StdCtrls,
  cxDropDownEdit, cxImageComboBox, cxTextEdit, cxMaskEdit, cxCalendar, Vcl.ExtCtrls,
  cxPC, System.TypInfo, uControleAcesso, uTypes, uUtils, uExceptions;

type
  TfrmFornecedor = class(TfrmFinanciador)
    rgTipoFornecedor: TcxRadioGroup;
    procedure rgTipoFornecedorPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  protected
    function fprGetTipo: TTipoFinForCli; override;
    function fprGetTipoPessoa: TTipoRelacionamentoPessoa; override;
    function fprGetPermissao: string; override;
    procedure pprBeforeSalvar; override;
    procedure pprValidarCPFCNPJ; override;

  public
    procedure ppuAlterar(ipId: Integer); override;
    procedure ppuIncluir; override;

    { Public declarations }
  end;

var
  frmFornecedor: TfrmFornecedor;

const
  coPessoaJuridica = 0;
  coPessoaFisica = 1;

implementation

{$R *.dfm}

{ TfrmFornecedor }

function TfrmFornecedor.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoFinanceiro), Ord(finFinanciador));
end;

function TfrmFornecedor.fprGetTipo: TTipoFinForCli;
begin
  Result := tfFornecedor;
end;

function TfrmFornecedor.fprGetTipoPessoa: TTipoRelacionamentoPessoa;
begin
  Result := trpFornecedor;
end;

procedure TfrmFornecedor.pprBeforeSalvar;
begin
  inherited;
  if rgTipoFornecedor.ItemIndex = coPessoaFisica then
    dmFinanceiro.cdsFin_For_CliRAZAO_SOCIAL.Clear;

end;

procedure TfrmFornecedor.pprValidarCPFCNPJ;
begin
  //nao chamar o inherited
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

procedure TfrmFornecedor.ppuAlterar(ipId: Integer);
begin
  inherited;
  if TUtils.fpuExtrairNumeros(dmFinanceiro.cdsFin_For_CliCPF_CNPJ.AsString).Length = 14 then // cnpj
    rgTipoFornecedor.ItemIndex := coPessoaJuridica
  else
    rgTipoFornecedor.ItemIndex := coPessoaFisica;

end;

procedure TfrmFornecedor.ppuIncluir;
begin
  inherited;
  rgTipoFornecedor.ItemIndex := coPessoaJuridica;
end;

procedure TfrmFornecedor.rgTipoFornecedorPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if rgTipoFornecedor.ItemIndex = coPessoaJuridica then
    begin
      EditCpfCnpj.Properties.EditMask := coRegexCNPJ;
      lbNome.Caption := 'Nome Fantasia';
      lbCpfCnpj.Caption := 'CNPJ';
    end
  else
    begin
      EditCpfCnpj.Properties.EditMask := coRegexCPF;
      lbNome.Caption := 'Nome do Fornecedor';
      lbCpfCnpj.Caption := 'CPF';
    end;
  EditRazaoSocial.Enabled := rgTipoFornecedor.ItemIndex = coPessoaJuridica;
end;

end.
