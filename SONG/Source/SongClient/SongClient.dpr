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
  uFuncoes in 'uFuncoes.pas',
  uExceptions in '..\Comuns\uExceptions.pas',
  fBasicoCrud in 'fBasicoCrud.pas' {frmBasicoCrud},
  fBasicoCrudMasterDetail in 'fBasicoCrudMasterDetail.pas' {frmBasicoCrudMasterDetail},
  uMensagem in '..\Comuns\uMensagem.pas',
  fPerfil in 'Administrativo\fPerfil.pas' {frmPerfil},
  dmuAdministrativo in 'Administrativo\dmuAdministrativo.pas' {dmAdministrativo: TDataModule},
  uControleAcesso in '..\Comuns\uControleAcesso.pas',
  dmuLookup in 'Geral\dmuLookup.pas' {dmLookup: TDataModule},
  fPessoa in 'Administrativo\fPessoa.pas' {frmPessoa},
  fmGrids in 'Frames\fmGrids.pas' {frameGrids: TFrame},
  fOrganizacao in 'Administrativo\fOrganizacao.pas' {frmOrganizacao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmSplash, frmSplash);
  frmSplash.ShowModal;

  Application.Run;
end.
