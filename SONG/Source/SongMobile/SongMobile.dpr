program SongMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  fPrincipal in 'fPrincipal.pas' {frmPrincipal},
  fMatriz in 'fMatriz.pas' {frmMatriz},
  dmuPrincipal in 'dmuPrincipal.pas' {dmPrincipal: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
