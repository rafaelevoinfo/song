unit fBasico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfrmBasico = class(TForm)
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmBasico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Char(VK_RETURN) then
    Self.SelectNext(Self.ActiveControl,True,true);
end;

end.
