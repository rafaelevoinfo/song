program SongClient;

uses
  Vcl.Forms,
  fPrincipal in 'fPrincipal.pas' {frmPrincipal},
  fBasico in 'fBasico.pas' {frmBasico},
  dmuPrincipal in 'dmuPrincipal.pas' {dmPrincipal: TDataModule},
  dmuBasico in 'dmuBasico.pas' {dmBasico: TDataModule},
  fSplash in 'fSplash.pas' {frmSplash},
  fLogin in 'fLogin.pas' {frmLogin},
  uTypes in '..\Comuns\uTypes.pas',
  uUsuario in '..\Comuns\uUsuario.pas',
  uUtils in '..\Comuns\uUtils.pas',
  uFuncoes in 'uFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmSplash, frmSplash);
  frmSplash.Show;

  frmSplash.Close;
  Application.Run;
end.
