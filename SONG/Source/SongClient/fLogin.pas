unit fLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasico, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxGDIPlusClasses, cxImage, Vcl.StdCtrls, Vcl.Menus, cxButtons,
  cxTextEdit, dmuPrincipal, uUtils;

type
  TfrmLogin = class(TfrmBasico)
    Label1: TLabel;
    Label2: TLabel;
    edtLogin: TcxTextEdit;
    edtSenha: TcxTextEdit;
    cxImage1: TcxImage;
    btnLogar: TcxButton;
    procedure btnLogarClick(Sender: TObject);
  private
    FLoginEfetuado: Boolean;
    procedure SetLoginEfetuado(const Value: Boolean);

    { Private declarations }
  public
    property LoginEfetuado: Boolean read FLoginEfetuado write SetLoginEfetuado;

    procedure ppuLogar(ipUsuario, ipSenha: string);
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}
{ TfrmLogin }

procedure TfrmLogin.btnLogarClick(Sender: TObject);
begin
  inherited;
  ppuLogar(edtLogin.text, edtSenha.Text);
end;

procedure TfrmLogin.ppuLogar(ipUsuario, ipSenha: string);
begin
  try
    dmPrincipal.ppuConfigurarConexao(ipUsuario, ipSenha);
//    dmPrincipal.FuncoesGeral.fpuVerificarNovaVersao('');
//    ShowMessage('ok');
//    dmPrincipal.FuncoesGeral.teste;

    LoginEfetuado := True;
  except
    on e: Exception do
      begin
        TMsg.ppuShowException('Erro ao realizar o login.', e);
        LoginEfetuado := False;
      end;
  end;
end;

procedure TfrmLogin.SetLoginEfetuado(const Value: Boolean);
begin
  FLoginEfetuado := Value;
end;

end.
