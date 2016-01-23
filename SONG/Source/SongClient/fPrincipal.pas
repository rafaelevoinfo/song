unit fPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasico, fLogin, uTypes,
  cxLookAndFeelPainters, cxGraphics, dxSkinsCore, dxSkinBlack, cxClasses,
  dxAlertWindow;

type
  TfrmPrincipal = class(TfrmBasico)
    procedure FormShow(Sender: TObject);
  private
    procedure ppvAfterShow(var ipMsg: TMessage); message MSG_AFTER_SHOW;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  inherited;
  PostMessage(Self.Handle, MSG_AFTER_SHOW, 0, 0);
end;

procedure TfrmPrincipal.ppvAfterShow(var ipMsg: TMessage);
begin
  Application.CreateForm(TfrmLogin, frmLogin);
  frmLogin.ShowModal;
  if not frmLogin.LoginEfetuado then
    begin
      Application.Terminate;
    end;

end;

end.
