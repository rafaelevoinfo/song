unit fBasico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTypes, cxMemo;

type
  TfrmBasico = class(TForm)
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    procedure WM_AfterShow(var ipMsg: TMessage); message MSG_AFTER_SHOW;
  protected
    procedure pprAfterShow(var ipMsg: TMessage); virtual;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


procedure TfrmBasico.FormKeyPress(Sender: TObject; var Key: Char);
var
  vaCurrentControl:TWinControl;
begin
  vaCurrentControl := ActiveControl;

  if (Key = Char(VK_RETURN)) and (not (vaCurrentControl is TcxCustomInnerMemo)) then
    Self.SelectNext(vaCurrentControl, True, True);
end;

procedure TfrmBasico.FormShow(Sender: TObject);
begin
  PostMessage(Self.Handle, MSG_AFTER_SHOW, 0, 0)
end;

procedure TfrmBasico.pprAfterShow(var ipMsg: TMessage);
begin
  // cada classe filha implementa o que dizer
end;

procedure TfrmBasico.WM_AfterShow(var ipMsg: TMessage);
begin
  pprAfterShow(ipMsg);
end;

end.
