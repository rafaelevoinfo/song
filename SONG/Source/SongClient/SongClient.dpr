program SongClient;

uses
  {$IFDEF DEBUG}
  FastMM4,
  {$ENDIF }
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
  fPerfil in 'Administrativo\fPerfil.pas' {frmPerfil},
  dmuAdministrativo in 'Administrativo\dmuAdministrativo.pas' {dmAdministrativo: TDataModule},
  uControleAcesso in '..\Comuns\uControleAcesso.pas',
  dmuLookup in 'Geral\dmuLookup.pas' {dmLookup: TDataModule},
  fPessoa in 'Administrativo\fPessoa.pas' {frmPessoa},
  fmGrids in 'Frames\fmGrids.pas' {frameGrids: TFrame},
  fOrganizacao in 'Administrativo\fOrganizacao.pas' {frmOrganizacao},
  fProjeto in 'Administrativo\fProjeto.pas' {frmProjeto},
  dmuFinanceiro in 'Financeiro\dmuFinanceiro.pas' {dmFinanceiro: TDataModule},
  fBanco in 'Financeiro\fBanco.pas' {frmBanco},
  fAtividade in 'Administrativo\fAtividade.pas' {frmAtividade},
  fEspecie in 'Viveiro\fEspecie.pas' {frmEspecie},
  dmuViveiro in 'Viveiro\dmuViveiro.pas' {dmViveiro: TDataModule},
  uMensagem in '..\Comuns\uMensagem.pas' {Mensagem},
  fFinanciador in 'Financeiro\fFinanciador.pas' {frmFinanciador},
  fFornecedor in 'Financeiro\fFornecedor.pas' {frmFornecedor},
  fMatriz in 'Viveiro\fMatriz.pas' {frmMatriz},
  fLote_Semente in 'Viveiro\fLote_Semente.pas' {frmLoteSemente},
  fCanteiro in 'Viveiro\fCanteiro.pas' {frmCanteiro},
  fLote_Muda in 'Viveiro\fLote_Muda.pas' {frmLoteMuda},
  fPlano_Contas in 'Financeiro\fPlano_Contas.pas' {frmPlanoContas},
  fRubrica in 'Financeiro\fRubrica.pas' {frmRubrica},
  fConta_Pagar in 'Financeiro\fConta_Pagar.pas' {frmContaPagar},
  fConta_Receber in 'Financeiro\fConta_Receber.pas' {frmContaReceber},
  fCliente in 'Financeiro\fCliente.pas' {frmCliente},
  dmuEstoque in 'Estoque\dmuEstoque.pas' {dmEstoque: TDataModule},
  fItem in 'Estoque\fItem.pas' {frmItem},
  fEntrada in 'Estoque\fEntrada.pas' {frmEntrada},
  fCompra in 'Estoque\fCompra.pas' {frmCompra},
  fSolicitacaoCompra in 'Estoque\fSolicitacaoCompra.pas' {frmSolicitacaoCompra},
  fRelatorioBasico in 'Relatorios\fRelatorioBasico.pas' {frmRelatorioBasico},
  fRelatorioFinanceiro in 'Relatorios\fRelatorioFinanceiro.pas' {frmRelatorioFinanceiro},
  dmuRelatorio in 'Relatorios\dmuRelatorio.pas' {dmRelatorio: TDataModule},
  fSaida in 'Estoque\fSaida.pas' {frmSaida},
  fTransferenciaFinanceira in 'Financeiro\fTransferenciaFinanceira.pas' {frmTransferenciaFinanceira},
  fVenda in 'Estoque\fVenda.pas' {frmVenda},
  fRelatorioViveiro in 'Viveiro\fRelatorioViveiro.pas' {frmRelatorioViveiro},
  fLocalUso in 'Estoque\fLocalUso.pas' {frmLocalUso},
  aduna_ds_list in '..\Comuns\aduna_ds_list.pas',
  fFamilia_Botanica in 'Viveiro\fFamilia_Botanica.pas' {frmFamiliaBotanica},
  dmuSistema in 'Sistema\dmuSistema.pas' {dmSistema: TDataModule},
  fNotificacao in 'Sistema\fNotificacao.pas' {frmNotificacao},
  fCamara_Fria in 'Viveiro\fCamara_Fria.pas' {frmCamaraFria},
  fReconexao in 'Geral\fReconexao.pas' {frmReconexao},
  fAgenda in 'Sistema\fAgenda.pas' {frmAgenda},
  fAgendamento in 'Sistema\fAgendamento.pas' {frmAgendamento},
  fAgendamento_Cadastro in 'Sistema\fAgendamento_Cadastro.pas' {frmAgendamentoCadastro},
  fItemPatrimonio in 'Estoque\fItemPatrimonio.pas' {frmItemPatrimonio},
  fPatrimonio in 'Estoque\fPatrimonio.pas' {frmPatrimonio},
  fRelatorioPatrimonio in 'Relatorios\fRelatorioPatrimonio.pas' {frmRelatorioPatrimonio},
  fDoacao in 'Financeiro\fDoacao.pas' {frmDoacao},
  fAreaAtuacao in 'Administrativo\fAreaAtuacao.pas' {frmAreaAtuacao},
  fTipoEspecie in 'Viveiro\fTipoEspecie.pas' {frmTipoEspecie},
  fMix_Muda in 'Viveiro\fMix_Muda.pas' {frmMixMuda},
  fmEditor in 'Frames\fmEditor.pas' {frameEditor: TFrame};

{$R Localization.RES}
{$R *.res}

{$IFDEF DEBUG}
{$INCLUDE FastMM4Options.inc}
{$ENDIF}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmSplash, frmSplash);
  frmSplash.ShowModal;

  Application.Run;

end.
