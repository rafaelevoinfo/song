unit uTypes;

interface

uses
  Winapi.Messages, System.Classes, System.SysUtils;

type
  TBancoDados = class
  public const
    coMacroWhere: string = 'WHERE';
    // campos comuns
    coId = 'ID';
    coNome = 'NOME';
    coAtivo = 'ATIVO';
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
      property Descricao:String read FDescricao write SetDescricao;
      property Valor:Double read FValor write SetValor;
      property Vencimento:TDateTime read FVencimento write SetVencimento;
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
    procedure SetQtde(const Value: Double);
    procedure SetIdEspecie(const Value: Integer);
    procedure SetIdItemCompraVenda(const Value: Integer);
    procedure SetIdLoteMuda(const Value: Integer);
    procedure SetIdLoteSemente(const Value: Integer);
  public
    property IdEspecie: Integer read FIdEspecie write SetIdEspecie;
    property IdItemCompraVenda: Integer read FIdItemCompraVenda write SetIdItemCompraVenda;
    property IdLoteMuda: Integer read FIdLoteMuda write SetIdLoteMuda;
    property IdLoteSemente: Integer read FIdLoteSemente write SetIdLoteSemente;
    property Qtde: Double read FQtde write SetQtde;
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

  TNotificacao = class
  private
    FId: Integer;
    FTipo: Integer;
    FInfo: TModelo;
    procedure SetId(const Value: Integer);
    procedure SetTipo(const Value: Integer);
    procedure SetInfo(const Value: TModelo);
  public
    Destructor Destroy;override;
    property Id: Integer read FId write SetId;
    property Tipo: Integer read FTipo write SetTipo;
    property Info:TModelo read FInfo write SetInfo;
  end;

  TTipoPesquisaPadrao = (tppActive, tppTodos, tppId, tppNome, tppData);

  TAcaoTela = (atVisualizar, atIncluir, atAlterar, atExcluir, atAtivar, atInativar);

  TVersaoInfo = (viMaJorVersion, viMinorVersion, viRelease, viBuild);

  TTipoPerfil = (tpNormal, tpAdministrador);

  TStatusProjeto = (spElaboracao, spAguardandoAnalise, spRecusado, spEmExecucao, spExecutado, spCancelado);
  TStatusAtividade = (saProgramada, saInicioAtrasado, saExecutando, saAtrasada, saFinalizada, saCancelada);

  TTipoVinculo = (tvRelacionado, tvDependente);

  TModoExecucao = (meNormal, mePesquisa, mePesquisaDetail, meSomentePesquisa, meSomenteCadastro, meSomenteEdicao);

  TTipoFinForCli = (tfFinanciador = 1, tfFornecedor, tfCliente);

  TTipoRelacionamentoPessoa = (trpFuncionario, trpMembroDiretoria, trpCliente, trpFornecedor, trpFinanciador, trpParceiro, trpEstagiario,
    trpVoluntario, trpOutro);

  TStatusSolicitacaoCompra = (sscSolicitacada, sscAprovada, sscNegada);

  TTipoPlanoContas = (tpcDespesa, tpcReceita);

  TTipoItem = (tiOutro, tiSemente, tiMuda);

  TStatusEntregaProduto = (sepACaminho, sepEntregue);

  TRelacionamentosPessoa = Set of TTipoRelacionamentoPessoa;

  TOrigemRecurso = (orProjeto, orFundo, orFinanciamento);
  TOrigem = (oriProjeto, oriFundo);

  TTipoMovimentacao = (tmDespesa, tmReceita);

  TTipoSaida = (tsVenda, tsConsumo, tsPerda, tsPlantio, tsOutro);

  TFormaPagamento = (fpTransferencia, fpDebitoConta, fpCartaoCredito, fpCartaoDebito, fpCheque, fpDinheiro, fpOutro);

  TStatusMuda = (smDesenvolvimento, smProntaPlantio);

  TTipoNotificacao = (tnContaPagarVencendo, tnContaReceberVencida, tnRubricaAtigindoSaldo, tnFundoFicandoSemSaldo, tnAtividadeCadastrada,
    tnAtividadeIniciada, tnAtividadeVencendo);

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
  TipoRelacionamentoPessoa: array [TTipoRelacionamentoPessoa] of string = ('Funcion�rio', 'Membro da Diretoria', 'Cliente', 'Fornecedor',
    'Financiador', 'Parceiro', 'Estagi�rio', 'Volunt�rio', 'Outro');
  FormaPagamennto: array [TFormaPagamento] of string = ('Transfer�ncia Banc�ria', 'D�bito em Conta', 'Cart�o de Cr�dito', 'Cart�o de D�bito',
    'Cheque', 'Dinheiro', 'Outro');

  TiposNotificacao: array [TTipoNotificacao] of String = ('Conta a Pagar Vencendo/Vencida', 'Conta a Receber Vencida', 'Rubrica atingindo limite',
    'Fundo atingindo limite', 'Atividade cadastrada', 'Atividade iniciada', 'Atividade prestes a vencer prazo de execu��o');

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

end.
