program SongMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  fPrincipal in 'fPrincipal.pas' {frmPrincipal},
  fMatriz in 'fMatriz.pas' {frmMatriz},
  dmuPrincipal in 'dmuPrincipal.pas' {dmPrincipal: TDataModule},
  uConstantes in 'uConstantes.pas',
  fBasico in 'fBasico.pas' {frmBasico},
  fBasicoCadastro in 'fBasicoCadastro.pas' {frmBasicoCadastro},
  fLote in 'fLote.pas' {frmLote};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
