unit fBasico;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs;

type
  TfrmBasico = class(TForm)
    Styles: TStyleBook;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FOnReturn: TProc;
    procedure SetOnReturn(const Value: TProc);
    { Private declarations }
  public
    property OnReturn:TProc read FOnReturn write SetOnReturn;
  end;

var
  frmBasico: TfrmBasico;

implementation

{$R *.fmx}

{ TfrmBasico }

procedure TfrmBasico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FOnReturn) then
    FOnReturn;
end;

procedure TfrmBasico.SetOnReturn(const Value: TProc);
begin
  FOnReturn := Value;
end;

end.
