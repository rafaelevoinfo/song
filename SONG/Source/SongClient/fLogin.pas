unit fLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasico, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxGDIPlusClasses, cxImage, Vcl.StdCtrls, Vcl.Menus, cxButtons,
  cxTextEdit;

type
  TfrmLogin = class(TfrmBasico)
    Label1: TLabel;
    Label2: TLabel;
    edtLogin: TcxTextEdit;
    edtSenha: TcxTextEdit;
    cxImage1: TcxImage;
    btnLogar: TcxButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

end.
