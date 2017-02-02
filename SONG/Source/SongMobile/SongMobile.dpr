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
  fLote in 'fLote.pas' {frmLote},
  uFuncoes in 'uFuncoes.pas',
  aduna_ds_list in '..\Comuns\aduna_ds_list.pas',
  uTypes in '..\Comuns\uTypes.pas',
  fSincronizacao in 'fSincronizacao.pas' {frmSincronizacao},
  fConfiguracoes in 'fConfiguracoes.pas' {frmConfiguracoes};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
