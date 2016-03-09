program SongServer;

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
  smuFuncoesGeral in 'ServerModules\smuFuncoesGeral.pas' {smFuncoesGeral: TDSServerModule},
  smuLookup in 'ServerModules\smuLookup.pas' {smLookup: TDSServerModule},
  smuFuncoesAdministrativo in 'ServerModules\smuFuncoesAdministrativo.pas' {smFuncoesAdministrativo: TDSServerModule},
  uUtils in '..\Comuns\uUtils.pas',
  smuFinanceiro in 'ServerModules\smuFinanceiro.pas' {smFinanceiro: TDSServerModule},
  uControleAcesso in '..\Comuns\uControleAcesso.pas',
  smuViveiro in 'ServerModules\smuViveiro.pas' {smViveiro: TDSServerModule},
  uMensagem in '..\Comuns\uMensagem.pas' {Mensagem},
  fAtualizacao in 'fAtualizacao.pas' {frmAtualizacao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TMensagem, Mensagem);
  Application.Run;
end.

