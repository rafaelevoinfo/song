program SONGServer;

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  fPrincipal in 'fPrincipal.pas' {frmPrincipal},
  dmuPrincipal in 'dmuPrincipal.pas' {dmPrincipal: TDataModule},
  smuBasico in 'smuBasico.pas' {smBasico: TDSServerModule},
  smuAdministrativo in 'ServerModules\smuAdministrativo.pas' {smAdministrativo: TDSServerModule},
  uTypes in '..\Comuns\uTypes.pas',
  uSQLGenerator in '..\Comuns\uSQLGenerator.pas',
  uRoles in '..\Comuns\uRoles.pas',
  smuFuncoesGeral in 'ServerModules\smuFuncoesGeral.pas' {smFuncoesGeral: TDSServerModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.

