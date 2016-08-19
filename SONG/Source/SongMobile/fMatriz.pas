unit fMatriz;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, System.ImageList, FMX.ImgList,
  FMX.Ani;

type
  TfrmMatriz = class(TForm)
    ImageList1: TImageList;
    pnPrincipal: TPanel;
    tbAcao: TToolBar;
    btnRetornar: TButton;
    btnIncluir: TButton;
    btnSincronizar: TButton;
    FloatAnimation1: TFloatAnimation;
    procedure btnRetornarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMatriz: TfrmMatriz;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}


procedure TfrmMatriz.btnRetornarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMatriz.FormCreate(Sender: TObject);
begin
  FloatAnimation1.StartValue := Self.Width;
  FloatAnimation1.Start;
end;

end.
