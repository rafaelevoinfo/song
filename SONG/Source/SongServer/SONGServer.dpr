program SONGServer;

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  fPrincipal in 'fPrincipal.pas' {frmPrincipal},
  dmuPrincipal in 'dmuPrincipal.pas' {dmPrincipal: TDataModule},
  smuBasico in 'smuBasico.pas' {smBasico: TDSServerModule},
  smuAdministrativo in 'smuAdministrativo.pas' {smAdministrativo: TDSServerModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TsmAdministrativo, smAdministrativo);
  Application.Run;
end.

