unit uTypes;

interface

uses
  Winapi.Messages, System.Classes, System.SysUtils, aduna_ds_list;

type
  TBancoDados = class
  public const
    coMacroWhere: string = 'WHERE';
    coMacroAnd: string = 'AND';
    // campos comuns
    coId = 'ID';
    coNome = 'NOME';
    coAtivo = 'ATIVO';
    coDataCadastro = 'DATA_CADASTRO';
    coDataAlteracao = 'DATA_ALTERACAO';
  end;

  TOperadores = class
  public const
    coOR = ' OR ';
    coAnd = ' AND ';
  end;

  TModelo = class
  private
    FId: Integer;
    procedure SetId(const Value: Integer);
  public
    property Id: Integer read FId write SetId;
  end;

  TConta = class(TModelo)
  private
    FValor: Double;
    FDescricao: String;
    FVencimento: TDateTime;
    procedure SetDescricao(const Value: String);
    procedure SetValor(const Value: Double);
    procedure SetVencimento(const Value: TDateTime);
  public
    property Descricao: String read FDescricao write SetDescricao;
    property Valor: Double read FValor write SetValor;
    property Vencimento: TDateTime read FVencimento write SetVencimento;
  end;

  TRubrica = class(TModelo)
  private
    FNomeRubrica: String;
    FPercentualGasto: Double;
    FIdProjeto: Integer;
    FNomeProjeto: String;
    FSaldoReal: Double;
    procedure SetIdProjeto(const Value: Integer);
    procedure SetNomeProjeto(const Value: String);
    procedure SetNomeRubrica(const Value: String);
    procedure SetPercentualGasto(const Value: Double);
    procedure SetSaldoReal(const Value: Double);
  public
    property IdProjeto: Integer read FIdProjeto write SetIdProjeto;
    property NomeRubrica: String read FNomeRubrica write SetNomeRubrica;
    property NomeProjeto: String read FNomeProjeto write SetNomeProjeto;
    property PercentualGasto: Double read FPercentualGasto write SetPercentualGasto;
    property SaldoReal: Double read FSaldoReal write SetSaldoReal;
  end;

  TAtividade = class(TModelo)
  private
    FDataVencimento: TDateTime;
    FStatus: Integer;
    FNome: String;
    FNomeProjeto: String;
    procedure SetDataVencimento(const Value: TDateTime);
    procedure SetNome(const Value: String);
    procedure SetNomeProjeto(const Value: String);
    procedure SetStatus(const Value: Integer);
  public
    property Nome: String read FNome write SetNome;
    property NomeProjeto: String read FNomeProjeto write SetNomeProjeto;
    property Status: Integer read FStatus write SetStatus;
    property DataVencimento: TDateTime read FDataVencimento write SetDataVencimento;
  end;

  TFundo = class(TModelo)
  private
    FSaldo: Double;
    FNome: String;
    FNomeOrganizacao: String;
    procedure SetNome(const Value: String);
    procedure SetSaldo(const Value: Double);
    procedure SetNomeOrganizacao(const Value: String);
  public
    property Nome: String read FNome write SetNome;
    property NomeOrganizacao: String read FNomeOrganizacao write SetNomeOrganizacao;
    property Saldo: Double read FSaldo write SetSaldo;
  end;

  TEspecie = class(TModelo)
  private
    FTaxaClassificacao: Double;
    FTempoGerminacao: Integer;
    FTempoDesenvolvimento: Integer;
    FTaxaGerminacao: Double;
    procedure SetTaxaClassificacao(const Value: Double);
    procedure SetTaxaGerminacao(const Value: Double);
    procedure SetTempoDesenvolvimento(const Value: Integer);
    procedure SetTempoGerminacao(const Value: Integer);
  public
    property TaxaGerminacao: Double read FTaxaGerminacao write SetTaxaGerminacao;
    property TaxaClassificacao: Double read FTaxaClassificacao write SetTaxaClassificacao;
    property TempoDesenvolvimento: Integer read FTempoDesenvolvimento write SetTempoDesenvolvimento;
    property TempoGerminacao: Integer read FTempoGerminacao write SetTempoGerminacao;
  end;

  TItem = class(TModelo)
  private
    FQtde: Double;
    FIdEspecie: Integer;
    FIdItemCompraVenda: Integer;
    FIdLoteSemente: Integer;
    FIdLoteMuda: Integer;
    FValorUnitario: Double;
    procedure SetQtde(const Value: Double);
    procedure SetIdEspecie(const Value: Integer);
    procedure SetIdItemCompraVenda(const Value: Integer);
    procedure SetIdLoteMuda(const Value: Integer);
    procedure SetIdLoteSemente(const Value: Integer);
    procedure SetValorUnitario(const Value: Double);
  public
    property IdEspecie: Integer read FIdEspecie write SetIdEspecie;
    property IdItemCompraVenda: Integer read FIdItemCompraVenda write SetIdItemCompraVenda;
    property IdLoteMuda: Integer read FIdLoteMuda write SetIdLoteMuda;
    property IdLoteSemente: Integer read FIdLoteSemente write SetIdLoteSemente;
    property Qtde: Double read FQtde write SetQtde;
    property ValorUnitario:Double read FValorUnitario write SetValorUnitario;
  end;

  TLote = class(TModelo)
  private
    FIdEspecie: Integer;
    FNome: string;
    FData: TDateTime;
    FQtde: Double;
    FIdItemCompra: Integer;
    procedure SetData(const Value: TDateTime);
    procedure SetIdEspecie(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetQtde(const Value: Double);
    procedure SetIdItemCompra(const Value: Integer);
  public
    property Nome: string read FNome write SetNome;
    property Data: TDateTime read FData write SetData;
    property IdEspecie: Integer read FIdEspecie write SetIdEspecie;
    property Qtde: Double read FQtde write SetQtde;

    property IdItemCompra: Integer read FIdItemCompra write SetIdItemCompra;
  end;

  TSolicitacaoCompra = class(TModelo)
  private
    FDataAnalise: TDateTime;
    FItens: String;
    FDataSolicitacao: TDateTime;
    FStatus: Integer;
    FSolicitante: String;
    procedure SetDataAnalise(const Value: TDateTime);
    procedure SetDataSolicitacao(const Value: TDateTime);
    procedure SetItens(const Value: String);
    procedure SetStatus(const Value: Integer);
    procedure SetSolicitante(const Value: String);
  public
    property DataSolicitacao: TDateTime read FDataSolicitacao write SetDataSolicitacao;
    property DataAnalise: TDateTime read FDataAnalise write SetDataAnalise;
    property Status: Integer read FStatus write SetStatus;
    property Itens: String read FItens write SetItens;
    property Solicitante: String read FSolicitante write SetSolicitante;
  end;

  TPessoa = class(TModelo)
  private
    FDataNascimento: TDateTime;
    FNome: string;
    procedure SetDataNascimento(const Value: TDateTime);
    procedure SetNome(const Value: string);

  public
    property Nome: string read FNome write SetNome;
    property DataNascimento: TDateTime read FDataNascimento write SetDataNascimento;
  end;

  TEventoAgenda = class(TModelo)
  private
    FTitulo: String;
    FDataHoraFim: TDateTime;
    FDataHoraInicio: TDateTime;
    procedure SetDataHoraFim(const Value: TDateTime);
    procedure SetDataHoraInicio(const Value: TDateTime);
    procedure SetTitulo(const Value: String);
  public
    property Titulo: String read FTitulo write SetTitulo;
    property DataHoraInicio: TDateTime read FDataHoraInicio write SetDataHoraInicio;
    property DataHoraFim: TDateTime read FDataHoraFim write SetDataHoraFim;
  end;

  TAgenda = class(TModelo)
  private
    FEventos: TadsObjectlist<TEventoAgenda>;
    FNome: String;
    procedure SetNome(const Value: String);
    procedure SetEventos(const Value: TadsObjectlist<TEventoAgenda>);
  public
    constructor Create();
    destructor Destroy; override;
    property Nome: String read FNome write SetNome;
    property Eventos: TadsObjectlist<TEventoAgenda> read FEventos write SetEventos;
  end;

  TNotificacao = class
  private
    FId: Integer;
    FTipo: Integer;
    FInfo: TModelo;
    procedure SetId(const Value: Integer);
    procedure SetTipo(const Value: Integer);
    procedure SetInfo(const Value: TModelo);
  public
    Destructor Destroy; override;
    property Id: Integer read FId write SetId;
    property Tipo: Integer read FTipo write SetTipo;
    property Info: TModelo read FInfo write SetInfo;
  end;

  TTipoPesquisaPadrao = (tppActive, tppTodos, tppId, tppNome, tppData);

  TAcaoTela = (atVisualizar, atIncluir, atAlterar, atExcluir, atAtivar, atInativar);

  TVersaoInfo = (viMaJorVersion, viMinorVersion, viRelease, viBuild);

  TTipoPerfil = (tpNormal, tpAdministrador);

  TStatusProjeto = (spElaboracao, spAguardandoAnalise, spRecusado, spEmExecucao, spExecutado, spCancelado);
  TStatusAtividade = (saProgramada, saInicioAtrasado, saExecutando, saAtrasada, saFinalizada, saCancelada);

  TTipoVinculo = (tvRelacionado, tvDependente);

  TModoExecucao = (meNormal, mePesquisa, mePesquisaDetail, mePesquisaRealizada, meSomenteCadastro, meSomenteEdicao);

  TTipoFinForCli = (tfFinanciador = 1, tfFornecedor, tfCliente);

  TTipoRelacionamentoPessoa = (trpFuncionario, trpMembroDiretoria, trpCliente, trpFornecedor, trpFinanciador, trpParceiro, trpEstagiario,
    trpVoluntario, trpOutro);

  TStatusSolicitacaoCompra = (sscSolicitacada, sscAprovada, sscNegada);

  TTipoPlanoContas = (tpcDespesa, tpcReceita);

  TTipoItem = (tiOutro, tiSemente, tiMuda);

  TStatusEntregaProduto = (sepACaminho, sepEntregue);

  TRelacionamentosPessoa = Set of TTipoRelacionamentoPessoa;

  TOrigemRecurso = (orProjeto, orFundo, orFinanciamento, orDoacao, orTransferencia);
  TOrigem = (oriProjeto, oriFundo);

  TTipoMovimentacao = (tmDespesa, tmReceita);

  TTipoSaida = (tsVenda, tsConsumo, tsPerda, tsPlantio, tsOutro);

  //ficou errado quando foi feito, para nao ter q fazer update no banco inteiro vamos começar com o valor 1
  TFormaPagamento = (fpTransferencia=1, fpDebitoConta, fpCartaoCredito, fpCartaoDebito, fpCheque, fpDinheiro,fpBoleto, fpOutro);

  TStatusMuda = (smDesenvolvimento, smProntaPlantio);

  TTipoNotificacao = (tnContaPagarVencendo, tnContaReceberVencida, tnRubricaAtigindoSaldo, tnFundoFicandoSemSaldo, tnAtividadeCadastrada,
    tnAtividadeAlterada, tnAtividadeVencendo, tnSolicitacaoCompra, tnAniversario, tnEventoAgenda);

  TTipoAgenda = (taPessoal, taOutra);
  TTipoEvento = (teEventoAgenda, teEventoAtividade);

const
  // mensagens customizadas do windows
  MSG_AFTER_SHOW = WM_USER + 1;
  coRegistroAtivo = 0;
  coRegistroInativo = 1;

  coArquivoConfiguracao = 'song.sys';
  coNomePadraoSongClient = 'SongClientV';
  coPastaAtualizacoes = 'Atualizacoes';
  coExtensaoCompactacao = '.zip';
  coDelimitadorPadrao = ';';

  coRegexUniqueKey = '"UNQ\d+_.+?"'; // pega o nome da unique key

  AcaoTelaDescricao: array [TAcaoTela] of string = ('Visualizar', 'Incluir', 'Alterar', 'Excluir', 'Ativar', 'Inativar');
  TipoRelacionamentoPessoa: array [TTipoRelacionamentoPessoa] of string = ('Funcionário', 'Membro da Diretoria', 'Cliente', 'Fornecedor',
    'Financiador', 'Parceiro', 'Estagiário', 'Voluntário', 'Outro');
  FormaPagamennto: array [TFormaPagamento] of string = ('Transferência Bancária', 'Débito em Conta', 'Cartão de Crédito', 'Cartão de Débito',
    'Cheque', 'Dinheiro', 'Boleto', 'Outro');

  TiposNotificacao: array [TTipoNotificacao] of String = ('Conta a Pagar Vencendo/Vencida', 'Conta a Receber Vencida', 'Rubrica atingindo limite',
    'Fundo atingindo limite', 'Atividade cadastrada', 'Atividade alterada',
    'Atividade vencendo prazo de execução', 'Solicitação de Compra', 'Aniversários', 'Eventos de Agendas');

implementation

{ TLote }

procedure TLote.SetData(const Value: TDateTime);
begin
  FData := Value;
end;

procedure TLote.SetIdItemCompra(const Value: Integer);
begin
  FIdItemCompra := Value;
end;

procedure TLote.SetIdEspecie(const Value: Integer);
begin
  FIdEspecie := Value;
end;

procedure TLote.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TLote.SetQtde(const Value: Double);
begin
  FQtde := Value;
end;

{ TModelo }

procedure TModelo.SetId(const Value: Integer);
begin
  FId := Value;
end;

{ TItem }

procedure TItem.SetIdEspecie(const Value: Integer);
begin
  FIdEspecie := Value;
end;

procedure TItem.SetIdItemCompraVenda(const Value: Integer);
begin
  FIdItemCompraVenda := Value;
end;

procedure TItem.SetIdLoteMuda(const Value: Integer);
begin
  FIdLoteMuda := Value;
end;

procedure TItem.SetIdLoteSemente(const Value: Integer);
begin
  FIdLoteSemente := Value;
end;

procedure TItem.SetQtde(const Value: Double);
begin
  FQtde := Value;
end;

procedure TItem.SetValorUnitario(const Value: Double);
begin
  FValorUnitario := Value;
end;

{ TEspecie }

procedure TEspecie.SetTaxaClassificacao(const Value: Double);
begin
  FTaxaClassificacao := Value;
end;

procedure TEspecie.SetTaxaGerminacao(const Value: Double);
begin
  FTaxaGerminacao := Value;
end;

procedure TEspecie.SetTempoDesenvolvimento(const Value: Integer);
begin
  FTempoDesenvolvimento := Value;
end;

procedure TEspecie.SetTempoGerminacao(const Value: Integer);
begin
  FTempoGerminacao := Value;
end;

{ TNotificacao }

destructor TNotificacao.Destroy;
begin
  if Assigned(FInfo) then
    FreeAndNil(FInfo);
  inherited;
end;

procedure TNotificacao.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TNotificacao.SetInfo(const Value: TModelo);
begin
  FInfo := Value;
end;

procedure TNotificacao.SetTipo(const Value: Integer);
begin
  FTipo := Value;
end;

{ TConta }

procedure TConta.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TConta.SetValor(const Value: Double);
begin
  FValor := Value;
end;

procedure TConta.SetVencimento(const Value: TDateTime);
begin
  FVencimento := Value;
end;

{ TRubrica }

procedure TRubrica.SetIdProjeto(const Value: Integer);
begin
  FIdProjeto := Value;
end;

procedure TRubrica.SetNomeProjeto(const Value: String);
begin
  FNomeProjeto := Value;
end;

procedure TRubrica.SetNomeRubrica(const Value: String);
begin
  FNomeRubrica := Value;
end;

procedure TRubrica.SetPercentualGasto(const Value: Double);
begin
  FPercentualGasto := Value;
end;

procedure TRubrica.SetSaldoReal(const Value: Double);
begin
  FSaldoReal := Value;
end;

{ TFundo }

procedure TFundo.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TFundo.SetNomeOrganizacao(const Value: String);
begin
  FNomeOrganizacao := Value;
end;

procedure TFundo.SetSaldo(const Value: Double);
begin
  FSaldo := Value;
end;

{ TAtividade }

procedure TAtividade.SetDataVencimento(const Value: TDateTime);
begin
  FDataVencimento := Value;
end;

procedure TAtividade.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TAtividade.SetNomeProjeto(const Value: String);
begin
  FNomeProjeto := Value;
end;

procedure TAtividade.SetStatus(const Value: Integer);
begin
  FStatus := Value;
end;

{ TSolicitacaoCompra }

procedure TSolicitacaoCompra.SetDataAnalise(const Value: TDateTime);
begin
  FDataAnalise := Value;
end;

procedure TSolicitacaoCompra.SetDataSolicitacao(const Value: TDateTime);
begin
  FDataSolicitacao := Value;
end;

procedure TSolicitacaoCompra.SetItens(const Value: String);
begin
  FItens := Value;
end;

procedure TSolicitacaoCompra.SetSolicitante(const Value: String);
begin
  FSolicitante := Value;
end;

procedure TSolicitacaoCompra.SetStatus(const Value: Integer);
begin
  FStatus := Value;
end;

{ TPessoa }

procedure TPessoa.SetDataNascimento(const Value: TDateTime);
begin
  FDataNascimento := Value;
end;

procedure TPessoa.SetNome(const Value: string);
begin
  FNome := Value;
end;

{ TEventoAgenda }

procedure TEventoAgenda.SetDataHoraFim(const Value: TDateTime);
begin
  FDataHoraFim := Value;
end;

procedure TEventoAgenda.SetDataHoraInicio(const Value: TDateTime);
begin
  FDataHoraInicio := Value;
end;

procedure TEventoAgenda.SetTitulo(const Value: String);
begin
  FTitulo := Value;
end;

{ TAgenda }

constructor TAgenda.Create;
begin
  FEventos := TadsObjectlist<TEventoAgenda>.Create;
end;

destructor TAgenda.Destroy;
begin
  FEventos.Free;
  inherited;
end;

procedure TAgenda.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TAgenda.SetEventos(const Value: TadsObjectlist<TEventoAgenda>);
begin
  FEventos := Value;
end;

end.
