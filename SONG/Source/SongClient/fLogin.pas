unit fLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasico, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxGDIPlusClasses, cxImage, Vcl.StdCtrls, Vcl.Menus, cxButtons,
  cxTextEdit, dmuPrincipal, uMensagem, uExceptions, uUtils, uControleAcesso;

type
  TfrmLogin = class(TfrmBasico)
    Label1: TLabel;
    Label2: TLabel;
    edtLogin: TcxTextEdit;
    edtSenha: TcxTextEdit;
    cxImage1: TcxImage;
    btnLogar: TButton;
    procedure btnLogarClick(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
  private
    FLoginEfetuado: Boolean;
    procedure SetLoginEfetuado(const Value: Boolean);
    procedure ppvValidarCampos;

    { Private declarations }
  public
    property LoginEfetuado: Boolean read FLoginEfetuado write SetLoginEfetuado;

    procedure ppuLogar(ipLogin, ipSenha: string);
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}
{ TfrmLogin }

procedure TfrmLogin.btnLogarClick(Sender: TObject);
begin
  inherited;
  ppuLogar(edtLogin.text, TUtils.fpuCriptografarSha1(edtSenha.text));
  if LoginEfetuado then
    Close;
end;

procedure TfrmLogin.ppvValidarCampos;
begin
  if edtLogin.text = '' then
    raise TControlException.Create('Informe o login.', edtLogin);

  if edtSenha.text = '' then
    raise TControlException.Create('Informe a senha.', edtSenha);
end;

procedure TfrmLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Ord(Key) = VK_RETURN then
    btnLogar.Click;
end;

procedure TfrmLogin.ppuLogar(ipLogin, ipSenha: string);
var
  vaInfoLogin: TInfoLogin;
  vaPessoa: TPessoa;
begin
  LoginEfetuado := False;
  ppvValidarCampos;
  try
    dmPrincipal.ppuConfigurarConexao(ipLogin, ipSenha);

    vaPessoa := dmPrincipal.FuncoesAdm.fpuInfoPessoa(ipLogin);
    if Assigned(vaPessoa) then
      begin
        vaInfoLogin := TInfoLogin.fpuGetInstance;
        vaInfoLogin.Usuario.Id := vaPessoa.Id;
        vaInfoLogin.Usuario.Nome := vaPessoa.Nome;
        vaInfoLogin.Usuario.Login := ipLogin;
        vaInfoLogin.Usuario.Senha := ipSenha;
        vaInfoLogin.Usuario.Permissoes.Data := dmPrincipal.FuncoesAdm.fpuPermissoesUsuario(ipLogin);
        vaInfoLogin.Usuario.ppuChecarAdministrador;
      end
    else
      raise Exception.Create('Login inválido.');

    LoginEfetuado := True;
  except
    on e: Exception do
      begin
        TMensagem.ppuShowMessage('Erro ao realizar o login. Possíveis causas:' + slineBreak +
          'Usuário e/ou senha incorretos.' + slineBreak +
          'Usuário desativado.' + slineBreak +
          'Servidor fora do ar.');
        LoginEfetuado := False;
      end;
  end;
end;

procedure TfrmLogin.SetLoginEfetuado(const Value: Boolean);
begin
  FLoginEfetuado := Value;
end;

end.
