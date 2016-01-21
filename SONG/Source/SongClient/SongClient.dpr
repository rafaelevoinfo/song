program SongClient;

uses
  Vcl.Forms,
  fPrincipal in 'fPrincipal.pas' {frmPrincipal},
  fBasico in 'fBasico.pas' {frmBasico},
  dmuPrincipal in 'dmuPrincipal.pas' {dmPrincipal: TDataModule},
  dmuBasico in 'dmuBasico.pas' {dmBasico: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
