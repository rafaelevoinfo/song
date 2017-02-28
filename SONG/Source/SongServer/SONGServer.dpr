program SongServer;

uses
  {$IFDEF DEBUG}
  FastMM4,
  {$ENDIF }
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
  smuLookup in 'ServerModules\smuLookup.pas' {smLookup: TDSServerModule},
  uUtils in '..\Comuns\uUtils.pas',
  smuFinanceiro in 'ServerModules\smuFinanceiro.pas' {smFinanceiro: TDSServerModule},
  uControleAcesso in '..\Comuns\uControleAcesso.pas',
  smuViveiro in 'ServerModules\smuViveiro.pas' {smViveiro: TDSServerModule},
  uMensagem in '..\Comuns\uMensagem.pas' {Mensagem},
  fAtualizacao in 'fAtualizacao.pas' {frmAtualizacao},
  smuFuncoesAdministrativo in 'ServerModules\Funcoes\smuFuncoesAdministrativo.pas' {smFuncoesAdministrativo: TDSServerModule},
  smuFuncoesBasico in 'ServerModules\Funcoes\smuFuncoesBasico.pas' {smFuncoesBasico: TDSServerModule},
  smuFuncoesFinanceiro in 'ServerModules\Funcoes\smuFuncoesFinanceiro.pas' {smFuncoesFinanceiro: TDSServerModule},
  smuFuncoesGeral in 'ServerModules\Funcoes\smuFuncoesGeral.pas' {smFuncoesGeral: TDSServerModule},
  smuFuncoesViveiro in 'ServerModules\Funcoes\smuFuncoesViveiro.pas' {smFuncoesViveiro: TDSServerModule},
  smuEstoque in 'ServerModules\smuEstoque.pas' {smEstoque: TDSServerModule},
  smuFuncoesEstoque in 'ServerModules\Funcoes\smuFuncoesEstoque.pas' {smFuncoesEstoque: TDSServerModule},
  smuRelatorio in 'ServerModules\smuRelatorio.pas' {smRelatorio: TDSServerModule},
  smuFuncoesRelatorio in 'ServerModules\Funcoes\smuFuncoesRelatorio.pas' {smFuncoesRelatorio: TDSServerModule},
  aduna_ds_list in '..\Comuns\aduna_ds_list.pas',
  uBackup in 'uBackup.pas',
  smuSistema in 'ServerModules\smuSistema.pas' {smSistema: TDSServerModule},
  smuFuncoesSistema in 'ServerModules\Funcoes\smuFuncoesSistema.pas' {smFuncoesSistema: TDSServerModule},
  uEnviarEmail in '..\Comuns\uEnviarEmail.pas',
  uSMBIOS in 'uSMBIOS.pas',
  pAtributos in '..\Comuns\pAtributos.pas';

{$R *.res}

{$IFDEF DEBUG}
{$INCLUDE FastMM4Options.inc}
{$ENDIF}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := true;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;

end.
