unit fSplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmuPrincipal, fBasico, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, Vcl.StdCtrls, cxImage, cxProgressBar,
  dxGDIPlusClasses, fLogin;

type
  TfrmSplash = class(TfrmBasico)
    cxImage1: TcxImage;
    Label7: TLabel;
    Label1: TLabel;
    pbProgresso: TcxProgressBar;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

procedure TfrmSplash.FormActivate(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  pbProgresso.Properties.Max := 10;
  for I := 0 to 10 do
    begin
      pbProgresso.Properties.Text := 'Fase ' + I.ToString();
      pbProgresso.Position := i;
      Application.ProcessMessages;
      Sleep(100);
    end;
end;

end.
