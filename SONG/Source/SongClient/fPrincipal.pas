unit fPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasico, fLogin, uTypes,
  cxLookAndFeelPainters, cxGraphics, dxSkinsCore, dxSkinBlack, cxClasses,
  dxAlertWindow, System.Actions, Vcl.ActnList, Vcl.Menus, uUtils, fPerfil,
  cxControls, cxLookAndFeels, dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC,
  fPessoa, dxSkinsForm, Vcl.StdCtrls, fOrganizacao, fProjeto, fFinanciador,
  fBanco, fAtividade, fEspecie, fFornecedor, fMatriz, fCanteiro,
  fLote_Semente, fLote_Muda, fPlano_Contas, fRubrica, fConta_Pagar, Vcl.ExtCtrls,
  fConta_Receber, fCliente, fItem, fEntrada, fSolicitacaoCompra, fCompra,
  uControleAcesso, System.TypInfo, cxContainer, cxEdit, cxLabel,
  fRelatorioFinanceiro, fSaida, fTransferenciaFinanceira, fVenda,
  fRelatorioViveiro, fLocalUso, fFamilia_Botanica, fNotificacao, fCamara_Fria,
  cxStyles, cxCustomData, Data.DB, cxDBData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxGridCardView, cxGridDBCardView, dxLayoutContainer,
  cxGridCustomView, cxGridCustomTableView, cxGridCustomLayoutView,
  cxGridLayoutView, cxGridDBLayoutView, cxGridLevel, cxGrid,
  dxCustomTileControl, dxTileControl, aduna_ds_list, dmuLookup, fAgenda,
  fAgendamento, fItemPatrimonio, uMensagem, fPatrimonio, fRelatorioPatrimonio,
  fDoacao, dmuPrincipal, fAreaAtuacao, fTipoEspecie, fMix_Muda, fOrcamento,
  fAparelhosRegistrados, dxCore;

type
  TfrmPrincipal = class(TfrmBasico)
    mmMenuPrincipal: TMainMenu;
    ActionList1: TActionList;
    Ac_Pessoas: TAction;
    miRecursosHumanos: TMenuItem;
    Pessoa1: TMenuItem;
    Ac_Perfis: TAction;
    PerfisdeUsurios1: TMenuItem;
    pcPrincipal: TcxPageControl;
    tabNotificacoes: TcxTabSheet;
    Ac_Organizacao: TAction;
    Ac_Projeto: TAction;
    Ac_Financiador: TAction;
    miGestao: TMenuItem;
    Financiadores2: TMenuItem;
    Organizaes1: TMenuItem;
    Projetos1: TMenuItem;
    Ac_Banco: TAction;
    miFinanceiro: TMenuItem;
    Bancos1: TMenuItem;
    Ac_Atividade: TAction;
    Atividades1: TMenuItem;
    miViveiro: TMenuItem;
    Ac_Especie: TAction;
    Espcie1: TMenuItem;
    Ac_Fornecedor: TAction;
    Ac_Matriz: TAction;
    Matrizes1: TMenuItem;
    Ac_Lote_Semente: TAction;
    Lotes1: TMenuItem;
    Ac_Canteiro: TAction;
    Canteiros1: TMenuItem;
    Ac_Lote_Muda: TAction;
    LotesdeMudas1: TMenuItem;
    Ac_Plano_Contas: TAction;
    readeCusto1: TMenuItem;
    Ac_Rubricas: TAction;
    Ac_Conta_Pagar: TAction;
    ContasaPagar1: TMenuItem;
    Ac_Conta_Receber: TAction;
    ContasaReceber1: TMenuItem;
    Ac_Cliente: TAction;
    Estoque1: TMenuItem;
    Ac_Item: TAction;
    Itens1: TMenuItem;
    Ac_Entrada: TAction;
    Entradas1: TMenuItem;
    Ac_Solicitacao_Compra: TAction;
    Ac_Compra: TAction;
    Ac_Meus_Dados: TAction;
    Sistema1: TMenuItem;
    MeusDados1: TMenuItem;
    Ac_Relatorio_Financeiro: TAction;
    Relatrios1: TMenuItem;
    Ac_Saida: TAction;
    Sadas1: TMenuItem;
    Ac_Transferencia: TAction;
    ransfernciadeRecursos1: TMenuItem;
    Ac_Venda: TAction;
    Ac_Relatorio_Viveiro: TAction;
    Relatrios2: TMenuItem;
    Ac_Local_Uso: TAction;
    LocaisdeUso1: TMenuItem;
    Ac_Familia_Botanica: TAction;
    FamliaBotnica1: TMenuItem;
    Ac_Notificacao: TAction;
    ConfiguraodeNotificaes1: TMenuItem;
    Ac_Camara_Fria: TAction;
    CmaraFria1: TMenuItem;
    TileControl: TdxTileControl;
    btnAtualizar: TButton;
    tmrAtualizacoes: TTimer;
    AlertWindowManager: TdxAlertWindowManager;
    TileControlAniversario: TdxTileControl;
    Ac_Agenda: TAction;
    Agendas1: TMenuItem;
    Ac_Agendamento: TAction;
    Agendas2: TMenuItem;
    Patrimnio1: TMenuItem;
    Ac_Item_Patrimonio: TAction;
    ItensdoPatrimnio1: TMenuItem;
    Ac_Sair: TAction;
    Sair1: TMenuItem;
    Ac_Patrimonio: TAction;
    Patrimnio2: TMenuItem;
    Ac_Relatorio_Patrimonio: TAction;
    Relatrio1: TMenuItem;
    Ac_Doacao: TAction;
    Doaes1: TMenuItem;
    Rubricas2: TMenuItem;
    Ac_Atualizar_Notificacoes: TAction;
    ComprasVendas1: TMenuItem;
    Compras2: TMenuItem;
    Vendas2: TMenuItem;
    Clientes2: TMenuItem;
    Fornecedores2: TMenuItem;
    SolicitaodeCompra2: TMenuItem;
    Ac_Area_Atuacao: TAction;
    reasdeAtuao1: TMenuItem;
    Ac_Tipo_Especie: TAction;
    ipodeEspcie1: TMenuItem;
    Ac_Mix_Muda: TAction;
    MixdeMudas1: TMenuItem;
    Ac_Modelo_Orcamento: TAction;
    ModelosdeOramento1: TMenuItem;
    Ac_Orcamento: TAction;
    Oramento1: TMenuItem;
    Ac_Aparelho_Registrado: TAction;
    AparelhosExternos1: TMenuItem;
    dxSkinController1: TdxSkinController;
    procedure Ac_PerfisExecute(Sender: TObject);
    procedure Ac_PessoasExecute(Sender: TObject);
    procedure dxSkinController1SkinControl(Sender: TObject; AControl: TWinControl; var UseSkin: Boolean);
    procedure Ac_OrganizacaoExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Ac_ProjetoExecute(Sender: TObject);
    procedure Ac_FinanciadorExecute(Sender: TObject);
    procedure Ac_BancoExecute(Sender: TObject);
    procedure Ac_AtividadeExecute(Sender: TObject);
    procedure Ac_EspecieExecute(Sender: TObject);
    procedure Ac_FornecedorExecute(Sender: TObject);
    procedure Ac_MatrizExecute(Sender: TObject);
    procedure Ac_Lote_SementeExecute(Sender: TObject);
    procedure Ac_CanteiroExecute(Sender: TObject);
    procedure Ac_Lote_MudaExecute(Sender: TObject);
    procedure Ac_Plano_ContasExecute(Sender: TObject);
    procedure Ac_RubricasExecute(Sender: TObject);
    procedure Ac_Conta_PagarExecute(Sender: TObject);
    procedure Ac_Conta_ReceberExecute(Sender: TObject);
    procedure Ac_ClienteExecute(Sender: TObject);
    procedure Ac_ItemExecute(Sender: TObject);
    procedure Ac_EntradaExecute(Sender: TObject);
    procedure Ac_Solicitacao_CompraExecute(Sender: TObject);
    procedure Ac_CompraExecute(Sender: TObject);
    procedure Ac_Meus_DadosExecute(Sender: TObject);
    procedure Ac_Relatorio_FinanceiroExecute(Sender: TObject);
    procedure Ac_SaidaExecute(Sender: TObject);
    procedure Ac_TransferenciaExecute(Sender: TObject);
    procedure Ac_VendaExecute(Sender: TObject);
    procedure Ac_Relatorio_ViveiroExecute(Sender: TObject);
    procedure Ac_Local_UsoExecute(Sender: TObject);
    procedure Ac_Familia_BotanicaExecute(Sender: TObject);
    procedure Ac_NotificacaoExecute(Sender: TObject);
    procedure Ac_Camara_FriaExecute(Sender: TObject);
    procedure tmrAtualizacoesTimer(Sender: TObject);
    procedure AlertWindowManagerClick(Sender: TObject;
      AAlertWindow: TdxAlertWindow);
    procedure Ac_AgendaExecute(Sender: TObject);
    procedure Ac_AgendamentoExecute(Sender: TObject);
    procedure Ac_Item_PatrimonioExecute(Sender: TObject);
    procedure Ac_SairExecute(Sender: TObject);
    procedure Ac_PatrimonioExecute(Sender: TObject);
    procedure Ac_Relatorio_PatrimonioExecute(Sender: TObject);
    procedure Ac_DoacaoExecute(Sender: TObject);
    procedure Ac_Atualizar_NotificacoesExecute(Sender: TObject);
    procedure Ac_Area_AtuacaoExecute(Sender: TObject);
    procedure Ac_Tipo_EspecieExecute(Sender: TObject);
    procedure Ac_Mix_MudaExecute(Sender: TObject);
    procedure Ac_Modelo_OrcamentoExecute(Sender: TObject);
    procedure Ac_OrcamentoExecute(Sender: TObject);
    procedure Ac_Aparelho_RegistradoExecute(Sender: TObject);
  private
    dmLookup: TdmLookup;
    procedure ppvOnClickItem(ipItem: TdxTileControlItem);
  protected
    procedure pprAfterShow(var ipMsg: TMessage); override;
  public
    procedure ppuCarregarNotificacoes(ipExibirAlerta: Boolean);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  fBasicoCrud, fModeloOrcamento;

{$R *.dfm}


procedure TfrmPrincipal.Ac_Plano_ContasExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmPlanoContas>(pcPrincipal, TfrmPlanoContas, frmPlanoContas);
end;

procedure TfrmPrincipal.Ac_AgendaExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmAgenda>(pcPrincipal, TfrmAgenda, frmAgenda);
end;

procedure TfrmPrincipal.Ac_AgendamentoExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmAgendamento>(pcPrincipal, TfrmAgendamento, frmAgendamento);
end;

procedure TfrmPrincipal.Ac_Aparelho_RegistradoExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmAparelhoRegistrado>(pcPrincipal, TfrmAparelhoRegistrado, frmAparelhoRegistrado);
end;

procedure TfrmPrincipal.Ac_Area_AtuacaoExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmAreaAtuacao>(pcPrincipal, TfrmAreaAtuacao, frmAreaAtuacao);
end;

procedure TfrmPrincipal.Ac_AtividadeExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmAtividade>(pcPrincipal, TfrmAtividade, frmAtividade);
end;

procedure TfrmPrincipal.Ac_Atualizar_NotificacoesExecute(Sender: TObject);
begin
  inherited;
  ppuCarregarNotificacoes(false);
end;

procedure TfrmPrincipal.Ac_BancoExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmBanco>(pcPrincipal, TfrmBanco, frmBanco);
end;

procedure TfrmPrincipal.Ac_Camara_FriaExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmCamaraFria>(pcPrincipal, TfrmCamaraFria, frmCamaraFria);
end;

procedure TfrmPrincipal.Ac_CanteiroExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmCanteiro>(pcPrincipal, TfrmCanteiro, frmCanteiro);
end;

procedure TfrmPrincipal.Ac_ClienteExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TFrmCliente>(pcPrincipal, TFrmCliente, frmCliente);
end;

procedure TfrmPrincipal.Ac_CompraExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmCompra>(pcPrincipal, TfrmCompra, frmCompra);
end;

procedure TfrmPrincipal.Ac_Conta_PagarExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TFrmContaPagar>(pcPrincipal, TFrmContaPagar, frmContaPagar);
end;

procedure TfrmPrincipal.Ac_Conta_ReceberExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmContaReceber>(pcPrincipal, TfrmContaReceber, frmContaReceber);
end;

procedure TfrmPrincipal.Ac_DoacaoExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmDoacao>(pcPrincipal, TfrmDoacao, frmDoacao);
end;

procedure TfrmPrincipal.Ac_EntradaExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmEntrada>(pcPrincipal, TfrmEntrada, frmEntrada);
end;

procedure TfrmPrincipal.Ac_EspecieExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmEspecie>(pcPrincipal, TfrmEspecie, frmEspecie);
end;

procedure TfrmPrincipal.Ac_Familia_BotanicaExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmFamiliaBotanica>(pcPrincipal, TfrmFamiliaBotanica, frmFamiliaBotanica);
end;

procedure TfrmPrincipal.Ac_FinanciadorExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmFinanciador>(pcPrincipal, TfrmFinanciador, frmFinanciador);
end;

procedure TfrmPrincipal.Ac_FornecedorExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmFornecedor>(pcPrincipal, TfrmFornecedor, frmFornecedor);
end;

procedure TfrmPrincipal.Ac_ItemExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmItem>(pcPrincipal, TfrmItem, frmItem);
end;

procedure TfrmPrincipal.Ac_Item_PatrimonioExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmItemPatrimonio>(pcPrincipal, TfrmItemPatrimonio, frmItemPatrimonio);
end;

procedure TfrmPrincipal.Ac_Local_UsoExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmLocalUso>(pcPrincipal, TfrmLocalUso, frmLocalUso);
end;

procedure TfrmPrincipal.Ac_Lote_MudaExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmLoteMuda>(pcPrincipal, TfrmLoteMuda, frmLoteMuda);
end;

procedure TfrmPrincipal.Ac_Lote_SementeExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmLoteSemente>(pcPrincipal, TfrmLoteSemente, frmLoteSemente);
end;

procedure TfrmPrincipal.Ac_MatrizExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmMatriz>(pcPrincipal, TfrmMatriz, frmMatriz);
end;

procedure TfrmPrincipal.Ac_Meus_DadosExecute(Sender: TObject);
var
  vaFrmPessoa: TfrmPessoa;
  vaPessoa: TPessoa;
begin
  inherited;
  // vamos dar permissao temporaria de acesso a essa tela. Nao importando se ja tem acesso ou nao.
  if not TInfoLogin.fpuGetInstance.Usuario.Permissoes.Locate('PERMISSAO',
    GetEnumName(TypeInfo(TPermissaoAdministrativo), Ord(admPessoa)), []) then
    begin
      TInfoLogin.fpuGetInstance.Usuario.Permissoes.Append;
    end
  else
    begin
      TInfoLogin.fpuGetInstance.Usuario.Permissoes.Edit;
    end;

  TInfoLogin.fpuGetInstance.Usuario.Permissoes.FieldByName('PERMISSAO').AsString :=
    GetEnumName(TypeInfo(TPermissaoAdministrativo), Ord(admPessoa));
  TInfoLogin.fpuGetInstance.Usuario.Permissoes.FieldByName('VISUALIZAR').AsInteger := 1;
  TInfoLogin.fpuGetInstance.Usuario.Permissoes.FieldByName('ALTERAR').AsInteger := 1;
  TInfoLogin.fpuGetInstance.Usuario.Permissoes.FieldByName('INCLUIR').AsInteger := 1;
  TInfoLogin.fpuGetInstance.Usuario.Permissoes.FieldByName('EXCLUIR').AsInteger := 1;
  TInfoLogin.fpuGetInstance.Usuario.Permissoes.Post;

  vaFrmPessoa := TfrmPessoa.Create(nil);
  try
    vaPessoa := TPessoa.Create;
    vaPessoa.Id := TInfoLogin.fpuGetInstance.Usuario.Id;
    vaPessoa.Nome := TInfoLogin.fpuGetInstance.Usuario.Nome;

    vaFrmPessoa.ppuConfigurarModoExecucao(meSomenteEdicao, vaPessoa);
    vaFrmPessoa.ppuConfigurarPesquisa(Ord(tppId), vaPessoa.Id.ToString());
    vaFrmPessoa.ppuPesquisar;

    vaFrmPessoa.ppuAlterar(vaPessoa.Id);
    vaFrmPessoa.ShowModal;

  finally
    TInfoLogin.fpuGetInstance.Usuario.Permissoes.Cancel;
    vaFrmPessoa.Free;
  end;

end;

procedure TfrmPrincipal.Ac_Mix_MudaExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmMixMuda>(pcPrincipal, TfrmMixMuda, frmMixMuda);
end;

procedure TfrmPrincipal.Ac_Modelo_OrcamentoExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmModeloOrcamento>(pcPrincipal, TfrmModeloOrcamento, frmModeloOrcamento);
end;

procedure TfrmPrincipal.Ac_NotificacaoExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmNotificacao>(pcPrincipal, TfrmNotificacao, frmNotificacao);
end;

procedure TfrmPrincipal.Ac_OrcamentoExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmOrcamento>(pcPrincipal, TfrmOrcamento, frmOrcamento);
end;

procedure TfrmPrincipal.Ac_OrganizacaoExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmOrganizacao>(pcPrincipal, TfrmOrganizacao, frmOrganizacao);
end;

procedure TfrmPrincipal.Ac_PatrimonioExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmPatrimonio>(pcPrincipal, TfrmPatrimonio, frmPatrimonio);
end;

procedure TfrmPrincipal.Ac_PerfisExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmPerfil>(pcPrincipal, TfrmPerfil, frmPerfil);
end;

procedure TfrmPrincipal.Ac_PessoasExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmPessoa>(pcPrincipal, TfrmPessoa, frmPessoa);
end;

procedure TfrmPrincipal.Ac_ProjetoExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmProjeto>(pcPrincipal, TfrmProjeto, frmProjeto);
end;

procedure TfrmPrincipal.Ac_Relatorio_FinanceiroExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmRelatorioFinanceiro>(pcPrincipal, TfrmRelatorioFinanceiro, frmRelatorioFinanceiro);
end;

procedure TfrmPrincipal.Ac_Relatorio_PatrimonioExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmRelatorioPatrimonio>(pcPrincipal, TfrmRelatorioPatrimonio, frmRelatorioPatrimonio);
end;

procedure TfrmPrincipal.Ac_Relatorio_ViveiroExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmRelatorioViveiro>(pcPrincipal, TfrmRelatorioViveiro, frmRelatorioViveiro);
end;

procedure TfrmPrincipal.Ac_RubricasExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TFrmRubrica>(pcPrincipal, TFrmRubrica, frmRubrica);
end;

procedure TfrmPrincipal.Ac_SaidaExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmSaida>(pcPrincipal, TfrmSaida, frmSaida);
end;

procedure TfrmPrincipal.Ac_SairExecute(Sender: TObject);
begin
  inherited;
  if TMensagem.fpuPerguntar('Realmente deseja sair do sistema?', ppSimNao) = rpSim then
    Close;
end;

procedure TfrmPrincipal.Ac_Solicitacao_CompraExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmSolicitacaoCompra>(pcPrincipal, TfrmSolicitacaoCompra, frmSolicitacaoCompra);
end;

procedure TfrmPrincipal.Ac_Tipo_EspecieExecute(Sender: TObject);
begin
  inherited;
   TUtils.ppuAbrirFormAba<TfrmTipoEspecie>(pcPrincipal, TfrmTipoEspecie, frmTipoEspecie);
end;

procedure TfrmPrincipal.Ac_TransferenciaExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmTransferenciaFinanceira>(pcPrincipal, TfrmTransferenciaFinanceira, frmTransferenciaFinanceira);
end;

procedure TfrmPrincipal.Ac_VendaExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmVenda>(pcPrincipal, TfrmVenda, frmVenda);
end;

procedure TfrmPrincipal.AlertWindowManagerClick(Sender: TObject;
  AAlertWindow: TdxAlertWindow);
begin
  inherited;
  pcPrincipal.ActivePage := tabNotificacoes;
end;

procedure TfrmPrincipal.dxSkinController1SkinControl(Sender: TObject; AControl: TWinControl; var UseSkin: Boolean);
begin
  inherited;
  UseSkin := not(AControl is TButton);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  inherited;
  Self.Caption := Self.Caption + ' - Vers�o: ' + TUtils.fpuVersaoExecutavel(Application.ExeName, viBuild);
end;

procedure TfrmPrincipal.pprAfterShow(var ipMsg: TMessage);
begin
  Application.CreateForm(TfrmLogin, frmLogin);
  frmLogin.ShowModal;
  if not frmLogin.LoginEfetuado then
    begin
      Application.Terminate;
    end
  else
    begin
      tmrAtualizacoes.Enabled := True; // a cada 10 min vai atualizar as notificacoes
      ppuCarregarNotificacoes(false);
    end;
end;

procedure TfrmPrincipal.ppvOnClickItem(ipItem: TdxTileControlItem);
var
  vaForm: TfrmBasicoCrud;
  vaFrmAgenda: TfrmAgendamento;
begin
  vaForm := nil;
  if TTipoNotificacao(ipItem.Group.Tag) = tnContaPagarVencendo then
    vaForm := TFrmContaPagar.Create(nil)
  else if TTipoNotificacao(ipItem.Group.Tag) = tnContaReceberVencida then
    vaForm := TfrmContaReceber.Create(nil)
  else if TTipoNotificacao(ipItem.Group.Tag) = tnRubricaAtigindoSaldo then
    vaForm := TfrmProjeto.Create(nil)
  else if TTipoNotificacao(ipItem.Group.Tag) = tnFundoFicandoSemSaldo then
    vaForm := TfrmOrganizacao.Create(nil)
  else if TTipoNotificacao(ipItem.Group.Tag) in [tnAtividadeCadastrada, tnAtividadeAlterada, tnAtividadeVencendo] then
    vaForm := TfrmAtividade.Create(nil)
  else if TTipoNotificacao(ipItem.Group.Tag) = tnSolicitacaoCompra then
    vaForm := TfrmSolicitacaoCompra.Create(nil)
  else if TTipoNotificacao(ipItem.Group.Tag) = tnAniversario then
    vaForm := TfrmPessoa.Create(nil)
  else if TTipoNotificacao(ipItem.Group.Tag) = tnEventoAgenda then
    begin
      vaFrmAgenda := TfrmAgendamento.Create(nil);
      try
        vaFrmAgenda.ppuCarregarAgendamentos;
        vaFrmAgenda.ShowModal;
      finally
        vaFrmAgenda.Free;
      end;
      Exit;
    end;

  if not Assigned(vaForm) then
    raise Exception.Create('Notifica��o ainda n�o suportada completamente.');

  try
    vaForm.ppuConfigurarModoExecucao(mePesquisaRealizada);
    vaForm.ppuConfigurarPesquisa(Ord(tppId), ipItem.Tag.ToString());
    vaForm.ppuPesquisar;

    vaForm.ShowModal;
  finally
    vaForm.Free;
  end;
end;

procedure TfrmPrincipal.tmrAtualizacoesTimer(Sender: TObject);
begin
  inherited;
  ppuCarregarNotificacoes(True);
end;

procedure TfrmPrincipal.ppuCarregarNotificacoes(ipExibirAlerta: Boolean);
var
  vaNotificacoes: TadsObjectlist<TNotificacao>;
  vaNotificacao: TNotificacao;
  vaGrupo: TdxTileControlGroup;
  I: Integer;
  vaItem: TdxTileControlItem;
  vaConta: TConta;
  vaRubrica: TRubrica;
  vaFundo: TFundo;
  vaAtividade: TAtividade;
  vaSolicitacao: TSolicitacaoCompra;
  vaPessoa: TPessoa;
  vaAgenda: TAgenda;
  vaEvento: TEventoAgenda;
  vaTotalNotificacoes: Integer;
  vaFrame: TdxTileControlItemFrame;
begin
  vaTotalNotificacoes := TileControl.Items.Count;

  TileControl.Items.Clear;
  TileControl.Groups.Clear;

  TileControlAniversario.Items.Clear;
  TileControlAniversario.Groups.Clear;

  vaNotificacoes := dmPrincipal.FuncoesSistema.fpuVerificarNotificacoes(-1, TInfoLogin.fpuGetInstance.Usuario.Id, -1, false, True);
  for vaNotificacao in vaNotificacoes do
    begin
      vaGrupo := nil;
      for I := 0 to TileControl.Groups.Count - 1 do
        begin
          if TileControl.Groups.Items[I].Tag = vaNotificacao.Tipo then
            begin
              vaGrupo := TileControl.Groups.Items[I];
              break;
            end;
        end;

      if not Assigned(vaGrupo) then
        begin
          if vaNotificacao.Tipo = Ord(tnAniversario) then
            vaGrupo := TileControlAniversario.Groups.Add
          else
            vaGrupo := TileControl.Groups.Add;
          vaGrupo.Tag := vaNotificacao.Tipo;
          if (vaNotificacao.Tipo <> Ord(tnAniversario)) then
            begin
              vaGrupo.Caption.Text := TiposNotificacao[TTipoNotificacao(vaNotificacao.Tipo)];
              vaGrupo.Caption.Font.Size := 12;
            end;
        end;

      if vaNotificacao.Tipo = Ord(tnAniversario) then
        vaItem := TileControlAniversario.Items.Add
      else
        vaItem := TileControl.Items.Add;
      vaItem.Tag := vaNotificacao.Id;
      vaItem.Size := tcisRegular;
      vaItem.OnClick := ppvOnClickItem;
      vaItem.AnimationInterval := 5000;

      vaItem.Text1.WordWrap := True;

      vaItem.Text2.Align := oaMiddleCenter;
      vaItem.Text2.WordWrap := True;

      vaItem.Group := vaGrupo;

      case TTipoNotificacao(vaNotificacao.Tipo) of
        tnContaPagarVencendo, tnContaReceberVencida:
          begin
            vaConta := vaNotificacao.Info as TConta;
            vaItem.Text1.Value := vaConta.Descricao;

            vaItem.Text2.Value := FormatFloat('R$ ,0.00', vaConta.Valor);
            vaItem.Text2.Font.Size := 12;
            vaItem.Text2.Font.Style := [fsBold];

            vaItem.Text3.Value := DateToStr(vaConta.Vencimento);
          end;
        tnRubricaAtigindoSaldo:
          begin
            vaRubrica := vaNotificacao.Info as TRubrica;
            vaItem.Text1.Value := vaRubrica.NomeRubrica + ' - ' + vaRubrica.NomeProjeto;

            vaItem.Text2.Value := FormatFloat(',0.00%', vaRubrica.PercentualGasto);
            vaItem.Text2.Font.Size := 12;
            vaItem.Text2.Font.Style := [fsBold];

            vaItem.Text3.Value := FormatFloat('Saldo: R$ ,0.00;Saldo: -R$ ,0.00', vaRubrica.SaldoReal);
            vaItem.Text3.WordWrap := True;
          end;
        tnFundoFicandoSemSaldo:
          begin
            vaFundo := vaNotificacao.Info as TFundo;
            vaItem.Text1.Value := vaFundo.Nome + ' - ' + vaFundo.NomeOrganizacao;

            vaItem.Text2.Value := FormatFloat('R$ ,0.00', vaFundo.Saldo);
            vaItem.Text2.Font.Size := 12;
            vaItem.Text2.Font.Style := [fsBold];
          end;
        tnAtividadeCadastrada, tnAtividadeAlterada, tnAtividadeVencendo:
          begin
            vaAtividade := vaNotificacao.Info as TAtividade;
            vaItem.Text1.Value := vaAtividade.NomeProjeto;

            vaItem.Text2.Value := vaAtividade.Nome;
            vaItem.Text2.Font.Size := 10;
            vaItem.Text2.Font.Style := [fsBold];

            if vaAtividade.DataVencimento <> 0 then
              vaItem.Text3.Value := 'Data Final: ' + DateToStr(vaAtividade.DataVencimento);
          end;
        tnAniversario:
          begin
            vaPessoa := vaNotificacao.Info as TPessoa;
            vaItem.Style.GradientBeginColor := $00D65612;

            vaItem.Text2.Value := vaPessoa.Nome;
            vaItem.Text2.Font.Size := 12;
            vaItem.Text2.Alignment := taCenter;
            vaItem.Text2.Font.Style := [fsBold];
          end;
        tnSolicitacaoCompra:
          begin
            vaSolicitacao := vaNotificacao.Info as TSolicitacaoCompra;
            vaFrame := vaItem.Frames.Add;

            vaFrame.Text1.Value := vaSolicitacao.Solicitante;
            vaFrame.Text2.Value := DateToStr(vaSolicitacao.DataSolicitacao);
            if vaSolicitacao.Status <> Ord(sscSolicitacada) then
              vaFrame.Text4.Value := 'Data da An�lise: ' + DateToStr(vaSolicitacao.DataSolicitacao);

            vaFrame.Text3.Align := oaMiddleCenter;
            vaFrame.Text3.Font.Style := [fsBold];

            if vaSolicitacao.Status = Ord(sscAprovada) then
              vaFrame.Text3.Value := 'Aprovada'
            else if vaSolicitacao.Status = Ord(sscNegada) then
              vaFrame.Text3.Value := 'Negada'
            else
              vaFrame.Text3.Value := 'Solicitada';

            vaFrame := vaItem.Frames.Add;
            vaFrame.Text1.WordWrap := True;
            vaFrame.Text1.Value := vaSolicitacao.Itens;

          end;
        tnEventoAgenda:
          begin
            vaAgenda := vaNotificacao.Info as TAgenda;
            vaFrame := vaItem.Frames.Add;

            vaFrame.Text2.Align := oaMiddleCenter;
            vaFrame.Text2.WordWrap := True;
            vaFrame.Text2.Font.Size := 12;
            vaFrame.Text2.Font.Style := [fsBold];
            vaFrame.Text2.Value := vaAgenda.Nome;

            vaFrame.Text4.Value := 'Qtde. de eventos: ' + vaAgenda.Eventos.Count.ToString;

            for vaEvento in vaAgenda.Eventos do
              begin
                vaFrame := vaItem.Frames.Add;
                vaFrame.Text1.WordWrap := True;
                vaFrame.Text1.Align := oaMiddleCenter;
                vaFrame.Text1.Font.Size := 10;
                vaFrame.Text1.Font.Style := [fsBold];
                vaFrame.Text1.Value := vaEvento.Titulo;

                vaFrame.Text3.Align := oaTopLeft;
                vaFrame.Text3.Value := DateTimeToStr(vaEvento.DataHoraInicio);

                vaFrame.Text4.Align := oaBottomLeft;
                vaFrame.Text4.Value := DateTimeToStr(vaEvento.DataHoraFim);
              end;

          end;
      end;

    end;

  if ipExibirAlerta and (TileControl.Items.Count <> vaTotalNotificacoes) then
    AlertWindowManager.Show('Novas Notifica��es', 'Existem novas notifica��es a serem visualizadas.');
end;

end.
