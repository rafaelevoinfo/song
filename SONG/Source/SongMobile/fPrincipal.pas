unit fPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, fMatriz;

type
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    btnMatriz: TButton;
    btnLotes: TButton;
    btnSincronizar: TButton;
    procedure btnMatrizClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}

procedure TfrmPrincipal.btnMatrizClick(Sender: TObject);
begin
  Application.CreateForm(TfrmMatriz, frmMatriz);

  frmMatriz.Show;
end;

end.
