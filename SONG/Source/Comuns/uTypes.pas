unit uTypes;

interface

uses
  Winapi.Messages;

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

  TItem = class(TModelo)
  private
    FIdItem: Integer;
    FQtde: Double;
    FIdEspecie: Integer;
    FIdItemCompra: Integer;
    procedure SetIdItem(const Value: Integer);
    procedure SetQtde(const Value: Double);
    procedure SetIdEspecie(const Value: Integer);
    procedure SetIdItemCompra(const Value: Integer);
  public
    property IdItem: Integer read FIdItem write SetIdItem;
    property IdEspecie: Integer read FIdEspecie write SetIdEspecie;
    property IdItemCompra: Integer read FIdItemCompra write SetIdItemCompra;
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

  TTipoSaida = (tsVenda, tsConsumo, tsPerda,tsOutro);

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

procedure TItem.SetIdItem(const Value: Integer);
begin
  FIdItem := Value;
end;

procedure TItem.SetIdItemCompra(const Value: Integer);
begin
  FIdItemCompra := Value;
end;

procedure TItem.SetQtde(const Value: Double);
begin
  FQtde := Value;
end;

end.
