//
// Created by the DataSnap proxy generator.
// 02/10/2016 22:35:51
//

unit uFuncoes;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, uTypes, aduna_ds_list, Data.DBXJSONReflect;

type
  TsmAdministrativoClient = class(TDSAdminClient)
  private
    FqProjeto_RubricaCalcFieldsCommand: TDBXCommand;
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure qProjeto_RubricaCalcFields(DataSet: TDataSet); virtual;
    procedure DSServerModuleCreate(Sender: TObject); virtual;
  end;

  TsmFuncoesGeralClient = class(TDSAdminClient)
  private
    FfpuVerificarNovaVersaoCommand: TDBXCommand;
    FfpuBaixarAtualizacaoCommand: TDBXCommand;
    FfpuGetIdCommand: TDBXCommand;
    FfpuDataHoraAtualCommand: TDBXCommand;
    FfpuTestarConexaoCommand: TDBXCommand;
    FfpuVerificarAlteracaoCommand: TDBXCommand;
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function fpuVerificarNovaVersao(ipVersaoAtual: string): string; virtual;
    function fpuBaixarAtualizacao(ipVersao: string): TStream; virtual;
    function fpuGetId(ipTabela: string): Integer; virtual;
    function fpuDataHoraAtual: string; virtual;
    function fpuTestarConexao: Boolean; virtual;
    function fpuVerificarAlteracao(ipTabela: string; ipUltimaSincronizacao: string): Boolean; virtual;
    procedure DSServerModuleCreate(Sender: TObject); virtual;
  end;

  TsmLookupClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject); virtual;
  end;

  TsmFuncoesAdministrativoClient = class(TDSAdminClient)
  private
    FfpuPermissoesUsuarioCommand: TDBXCommand;
    FfpuValidarFinanciadorFornecedorClienteCommand: TDBXCommand;
    FfpuValidarLoginCommand: TDBXCommand;
    FfpuValidarNomeProjetoCommand: TDBXCommand;
    FfpuValidarAreaProjetoCommand: TDBXCommand;
    FfpuInfoPessoaCommand: TDBXCommand;
    FppuValidarFinalizarAtividadeCommand: TDBXCommand;
    FfpuValidarNomeCpfPessoaCommand: TDBXCommand;
    FfpuValidarNomeAreaAtuacaoCommand: TDBXCommand;
    FfpuSomaOrcamentoRubricaCommand: TDBXCommand;
    FfpuSomaPagametosFinanciadorCommand: TDBXCommand;
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function fpuPermissoesUsuario(ipLogin: string): OleVariant; virtual;
    function fpuValidarFinanciadorFornecedorCliente(ipId: Integer; ipTipo: Integer; ipRazaoSocial: string; ipCpfCnpj: string): Boolean; virtual;
    function fpuValidarLogin(ipId: Integer; ipLogin: string): Boolean; virtual;
    function fpuValidarNomeProjeto(ipIdProjeto: Integer; ipNome: string): Boolean; virtual;
    function fpuValidarAreaProjeto(ipIdProjeto: Integer; ipIdAreaAtuacao: Integer): Boolean; virtual;
    function fpuInfoPessoa(ipLogin: string): TPessoa; virtual;
    procedure ppuValidarFinalizarAtividade(ipIdAtividade: Integer); virtual;
    function fpuValidarNomeCpfPessoa(ipIdPessoa: Integer; ipNome: string; ipCpf: string): Boolean; virtual;
    function fpuValidarNomeAreaAtuacao(ipIdAreaAtuacao: Integer; ipNome: string): Boolean; virtual;
    function fpuSomaOrcamentoRubrica(ipIdProjeto: Integer): Double; virtual;
    function fpuSomaPagametosFinanciador(ipIdProjetoFinanciador: Integer): Double; virtual;
    procedure DSServerModuleCreate(Sender: TObject); virtual;
  end;

  TsmFinanceiroClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject); virtual;
  end;

  TsmViveiroClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject); virtual;
  end;

  TsmFuncoesViveiroClient = class(TDSAdminClient)
  private
    FfpuValidarNomeMatrizCommand: TDBXCommand;
    FfpuValidarNomeCanteiroCommand: TDBXCommand;
    FfpuvalidarNomeCamaraFriaCommand: TDBXCommand;
    FfpuvalidarNomeTipoEspecieCommand: TDBXCommand;
    FppuValidarSemeaduraCommand: TDBXCommand;
    FfpuBuscarLotesMudasCommand: TDBXCommand;
    FfpuBuscarLoteMudaCommand: TDBXCommand;
    FfpuBuscarLotesSementesCommand: TDBXCommand;
    FfpuBuscarLoteSementeCommand: TDBXCommand;
    FppuAjustarSaldoEspecieCommand: TDBXCommand;
    FfpuCalcularPrevisaoProducaoMudaCommand: TDBXCommand;
    FppuCalcularQuantidadeMudasMixCommand: TDBXCommand;
    FfpuBuscarIdItemMudaCommand: TDBXCommand;
    FfpuCalcularQtdeMudasRocamboleCommand: TDBXCommand;
    FfpuGetIdCommand: TDBXCommand;
    FfpuDataHoraAtualCommand: TDBXCommand;
    FfpuTestarConexaoCommand: TDBXCommand;
    FfpuVerificarAlteracaoCommand: TDBXCommand;
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function fpuValidarNomeMatriz(ipId: Integer; ipNome: string): Boolean; virtual;
    function fpuValidarNomeCanteiro(ipId: Integer; ipNome: string): Boolean; virtual;
    function fpuvalidarNomeCamaraFria(ipId: Integer; ipNome: string): Boolean; virtual;
    function fpuvalidarNomeTipoEspecie(ipId: Integer; ipNome: string): Boolean; virtual;
    procedure ppuValidarSemeadura(ipIdLote: Integer; ipIdSemeadura: Integer; ipQtdeSemeada: Double); virtual;
    function fpuBuscarLotesMudas(ipIdCompra: Integer): string; virtual;
    function fpuBuscarLoteMuda(ipIdCompraItem: Integer): Integer; virtual;
    function fpuBuscarLotesSementes(ipIdCompra: Integer): string; virtual;
    function fpuBuscarLoteSemente(ipIdCompraItem: Integer): Integer; virtual;
    procedure ppuAjustarSaldoEspecie(ipIdEspecie: Integer); virtual;
    function fpuCalcularPrevisaoProducaoMuda(ipEspecies: TadsObjectlist<uTypes.TEspecie>; ipDataPrevisao: string): OleVariant; virtual;
    procedure ppuCalcularQuantidadeMudasMix(ipIdMixMuda: Integer); virtual;
    function fpuBuscarIdItemMuda: Integer; virtual;
    function fpuCalcularQtdeMudasRocambole(ipIdMixMuda: Integer): OleVariant; virtual;
    function fpuGetId(ipTabela: string): Integer; virtual;
    function fpuDataHoraAtual: string; virtual;
    function fpuTestarConexao: Boolean; virtual;
    function fpuVerificarAlteracao(ipTabela: string; ipUltimaSincronizacao: string): Boolean; virtual;
    procedure DSServerModuleCreate(Sender: TObject); virtual;
  end;

  TsmFuncoesFinanceiroClient = class(TDSAdminClient)
  private
    FfpuVerificarDependenciasPlanoContaCommand: TDBXCommand;
    FfpuVerificarDependenciasRubricaCommand: TDBXCommand;
    FfpuGerarIdentificadorPlanoContasCommand: TDBXCommand;
    FfpuGerarIdentificadorRubricaCommand: TDBXCommand;
    FppuQuitarParcelaCommand: TDBXCommand;
    FppuReabrirParcelaCommand: TDBXCommand;
    FppuReabrirTodasParcelasContaPagarCommand: TDBXCommand;
    FppuReceberParcelaCommand: TDBXCommand;
    FppuCancelarRecebimentoParcelaCommand: TDBXCommand;
    FppuCancelarTodosRecebimentosContaReceberCommand: TDBXCommand;
    FfpuSaldoRealRubricaCommand: TDBXCommand;
    FfpuValidarCadastroRubricaProjetoCommand: TDBXCommand;
    FfpuGetIdCommand: TDBXCommand;
    FfpuDataHoraAtualCommand: TDBXCommand;
    FfpuTestarConexaoCommand: TDBXCommand;
    FfpuVerificarAlteracaoCommand: TDBXCommand;
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function fpuVerificarDependenciasPlanoConta(ipIdentificador: string): Boolean; virtual;
    function fpuVerificarDependenciasRubrica(ipIdentificador: string): Boolean; virtual;
    function fpuGerarIdentificadorPlanoContas(ipIdConta: Integer): string; virtual;
    function fpuGerarIdentificadorRubrica(ipIdRubrica: Integer): string; virtual;
    procedure ppuQuitarParcela(ipIdParcela: Integer; ipDataPagamento: string); virtual;
    procedure ppuReabrirParcela(ipIdParcela: Integer); virtual;
    procedure ppuReabrirTodasParcelasContaPagar(ipIdContaPagar: Integer); virtual;
    procedure ppuReceberParcela(ipIdParcela: Integer); virtual;
    procedure ppuCancelarRecebimentoParcela(ipIdParcela: Integer); virtual;
    procedure ppuCancelarTodosRecebimentosContaReceber(ipIdContaReceber: Integer); virtual;
    function fpuSaldoRealRubrica(ipIdProjeto: Integer; ipIdRubrica: Integer): Double; virtual;
    function fpuValidarCadastroRubricaProjeto(ipIdIgnorar: Integer; ipIdProjeto: Integer; ipIdRubrica: Integer): Boolean; virtual;
    function fpuGetId(ipTabela: string): Integer; virtual;
    function fpuDataHoraAtual: string; virtual;
    function fpuTestarConexao: Boolean; virtual;
    function fpuVerificarAlteracao(ipTabela: string; ipUltimaSincronizacao: string): Boolean; virtual;
    procedure DSServerModuleCreate(Sender: TObject); virtual;
  end;

  TsmEstoqueClient = class(TDSAdminClient)
  private
    FDSServerModuleDestroyCommand: TDBXCommand;
    FqPatrimonioCalcFieldsCommand: TDBXCommand;
    FqEntrada_ItemCalcFieldsCommand: TDBXCommand;
    FqVendaCalcFieldsCommand: TDBXCommand;
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleDestroy(Sender: TObject); virtual;
    procedure qPatrimonioCalcFields(DataSet: TDataSet); virtual;
    procedure qEntrada_ItemCalcFields(DataSet: TDataSet); virtual;
    procedure qVendaCalcFields(DataSet: TDataSet); virtual;
    procedure DSServerModuleCreate(Sender: TObject); virtual;
  end;

  TsmFuncoesEstoqueClient = class(TDSAdminClient)
  private
    FfpuValidarNomeItemCommand: TDBXCommand;
    FfpuValidarNomeLocalUsoCommand: TDBXCommand;
    FfpuVerificarComprasJaGeradaCommand: TDBXCommand;
    FfpuVerificarContaPagarJaGeradaCommand: TDBXCommand;
    FfpuVerificarContaReceberJaGeradaCommand: TDBXCommand;
    FfpuBuscarItensEntradaCommand: TDBXCommand;
    FfpuBuscarItemEntradaCommand: TDBXCommand;
    FfpuBuscarItensSaidaCommand: TDBXCommand;
    FfpuBuscarItemSaidaCommand: TDBXCommand;
    FppuAtualizarSaldoItemCommand: TDBXCommand;
    FfpuGetIdCommand: TDBXCommand;
    FfpuDataHoraAtualCommand: TDBXCommand;
    FfpuTestarConexaoCommand: TDBXCommand;
    FfpuVerificarAlteracaoCommand: TDBXCommand;
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function fpuValidarNomeItem(ipIdItem: Integer; ipNome: string): Boolean; virtual;
    function fpuValidarNomeLocalUso(ipIdLocalUso: Integer; ipNome: string): Boolean; virtual;
    function fpuVerificarComprasJaGerada(ipIdSolicitacao: Integer): Boolean; virtual;
    function fpuVerificarContaPagarJaGerada(ipIdCompra: Integer): Boolean; virtual;
    function fpuVerificarContaReceberJaGerada(ipIdVenda: Integer): Boolean; virtual;
    function fpuBuscarItensEntrada(ipIdCompra: Integer): string; virtual;
    function fpuBuscarItemEntrada(ipIdCompraItem: Integer): Integer; virtual;
    function fpuBuscarItensSaida(ipIdVenda: Integer): string; virtual;
    function fpuBuscarItemSaida(ipIdVendaItem: Integer): Integer; virtual;
    procedure ppuAtualizarSaldoItem(ipIdItem: Integer; ipQtdeSubtrair: Double; ipQtdeSomar: Double); virtual;
    function fpuGetId(ipTabela: string): Integer; virtual;
    function fpuDataHoraAtual: string; virtual;
    function fpuTestarConexao: Boolean; virtual;
    function fpuVerificarAlteracao(ipTabela: string; ipUltimaSincronizacao: string): Boolean; virtual;
    procedure DSServerModuleCreate(Sender: TObject); virtual;
  end;

  TsmRelatorioClient = class(TDSAdminClient)
  private
    FqPatrimonioCalcFieldsCommand: TDBXCommand;
    FqView_Movimentacao_FinanceiraCalcFieldsCommand: TDBXCommand;
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure qPatrimonioCalcFields(DataSet: TDataSet); virtual;
    procedure qView_Movimentacao_FinanceiraCalcFields(DataSet: TDataSet); virtual;
    procedure DSServerModuleCreate(Sender: TObject); virtual;
  end;

  TsmFuncoesRelatorioClient = class(TDSAdminClient)
  private
    FfpuGetIdCommand: TDBXCommand;
    FfpuDataHoraAtualCommand: TDBXCommand;
    FfpuTestarConexaoCommand: TDBXCommand;
    FfpuVerificarAlteracaoCommand: TDBXCommand;
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function fpuGetId(ipTabela: string): Integer; virtual;
    function fpuDataHoraAtual: string; virtual;
    function fpuTestarConexao: Boolean; virtual;
    function fpuVerificarAlteracao(ipTabela: string; ipUltimaSincronizacao: string): Boolean; virtual;
    procedure DSServerModuleCreate(Sender: TObject); virtual;
  end;

  TsmSistemaClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject); virtual;
  end;

  TsmFuncoesSistemaClient = class(TDSAdminClient)
  private
    FfpuValidarTipoNotificacaoCommand: TDBXCommand;
    FfpuVerificarNotificacoesCommand: TDBXCommand;
    FppuCriarAgendaPessoalCommand: TDBXCommand;
    FfpuGetIdCommand: TDBXCommand;
    FfpuDataHoraAtualCommand: TDBXCommand;
    FfpuTestarConexaoCommand: TDBXCommand;
    FfpuVerificarAlteracaoCommand: TDBXCommand;
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function fpuValidarTipoNotificacao(ipIdNotificacao: Integer; ipTipo: Integer): Boolean; virtual;
    function fpuVerificarNotificacoes(ipId: Integer; ipIdPessoa: Integer; ipTipo: Integer; ipNotificacaoEmail: Boolean; ipNotificacaoSistema: Boolean): TadsObjectlist<uTypes.TNotificacao>; virtual;
    procedure ppuCriarAgendaPessoal(ipIdPessoa: Integer); virtual;
    function fpuGetId(ipTabela: string): Integer; virtual;
    function fpuDataHoraAtual: string; virtual;
    function fpuTestarConexao: Boolean; virtual;
    function fpuVerificarAlteracao(ipTabela: string; ipUltimaSincronizacao: string): Boolean; virtual;
    procedure DSServerModuleCreate(Sender: TObject); virtual;
  end;

implementation

procedure TsmAdministrativoClient.qProjeto_RubricaCalcFields(DataSet: TDataSet);
begin
  if FqProjeto_RubricaCalcFieldsCommand = nil then
  begin
    FqProjeto_RubricaCalcFieldsCommand := FDBXConnection.CreateCommand;
    FqProjeto_RubricaCalcFieldsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FqProjeto_RubricaCalcFieldsCommand.Text := 'TsmAdministrativo.qProjeto_RubricaCalcFields';
    FqProjeto_RubricaCalcFieldsCommand.Prepare;
  end;
  FqProjeto_RubricaCalcFieldsCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FqProjeto_RubricaCalcFieldsCommand.ExecuteUpdate;
end;

procedure TsmAdministrativoClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TsmAdministrativo.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;


constructor TsmAdministrativoClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TsmAdministrativoClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TsmAdministrativoClient.Destroy;
begin
  FqProjeto_RubricaCalcFieldsCommand.DisposeOf;
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
end;

function TsmFuncoesGeralClient.fpuVerificarNovaVersao(ipVersaoAtual: string): string;
begin
  if FfpuVerificarNovaVersaoCommand = nil then
  begin
    FfpuVerificarNovaVersaoCommand := FDBXConnection.CreateCommand;
    FfpuVerificarNovaVersaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuVerificarNovaVersaoCommand.Text := 'TsmFuncoesGeral.fpuVerificarNovaVersao';
    FfpuVerificarNovaVersaoCommand.Prepare;
  end;
  FfpuVerificarNovaVersaoCommand.Parameters[0].Value.SetWideString(ipVersaoAtual);
  FfpuVerificarNovaVersaoCommand.ExecuteUpdate;
  Result := FfpuVerificarNovaVersaoCommand.Parameters[1].Value.GetWideString;
end;

function TsmFuncoesGeralClient.fpuBaixarAtualizacao(ipVersao: string): TStream;
begin
  if FfpuBaixarAtualizacaoCommand = nil then
  begin
    FfpuBaixarAtualizacaoCommand := FDBXConnection.CreateCommand;
    FfpuBaixarAtualizacaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuBaixarAtualizacaoCommand.Text := 'TsmFuncoesGeral.fpuBaixarAtualizacao';
    FfpuBaixarAtualizacaoCommand.Prepare;
  end;
  FfpuBaixarAtualizacaoCommand.Parameters[0].Value.SetWideString(ipVersao);
  FfpuBaixarAtualizacaoCommand.ExecuteUpdate;
  Result := FfpuBaixarAtualizacaoCommand.Parameters[1].Value.GetStream(FInstanceOwner);
end;

function TsmFuncoesGeralClient.fpuGetId(ipTabela: string): Integer;
begin
  if FfpuGetIdCommand = nil then
  begin
    FfpuGetIdCommand := FDBXConnection.CreateCommand;
    FfpuGetIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuGetIdCommand.Text := 'TsmFuncoesGeral.fpuGetId';
    FfpuGetIdCommand.Prepare;
  end;
  FfpuGetIdCommand.Parameters[0].Value.SetWideString(ipTabela);
  FfpuGetIdCommand.ExecuteUpdate;
  Result := FfpuGetIdCommand.Parameters[1].Value.GetInt32;
end;

function TsmFuncoesGeralClient.fpuDataHoraAtual: string;
begin
  if FfpuDataHoraAtualCommand = nil then
  begin
    FfpuDataHoraAtualCommand := FDBXConnection.CreateCommand;
    FfpuDataHoraAtualCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuDataHoraAtualCommand.Text := 'TsmFuncoesGeral.fpuDataHoraAtual';
    FfpuDataHoraAtualCommand.Prepare;
  end;
  FfpuDataHoraAtualCommand.ExecuteUpdate;
  Result := FfpuDataHoraAtualCommand.Parameters[0].Value.GetWideString;
end;

function TsmFuncoesGeralClient.fpuTestarConexao: Boolean;
begin
  if FfpuTestarConexaoCommand = nil then
  begin
    FfpuTestarConexaoCommand := FDBXConnection.CreateCommand;
    FfpuTestarConexaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuTestarConexaoCommand.Text := 'TsmFuncoesGeral.fpuTestarConexao';
    FfpuTestarConexaoCommand.Prepare;
  end;
  FfpuTestarConexaoCommand.ExecuteUpdate;
  Result := FfpuTestarConexaoCommand.Parameters[0].Value.GetBoolean;
end;

function TsmFuncoesGeralClient.fpuVerificarAlteracao(ipTabela: string; ipUltimaSincronizacao: string): Boolean;
begin
  if FfpuVerificarAlteracaoCommand = nil then
  begin
    FfpuVerificarAlteracaoCommand := FDBXConnection.CreateCommand;
    FfpuVerificarAlteracaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuVerificarAlteracaoCommand.Text := 'TsmFuncoesGeral.fpuVerificarAlteracao';
    FfpuVerificarAlteracaoCommand.Prepare;
  end;
  FfpuVerificarAlteracaoCommand.Parameters[0].Value.SetWideString(ipTabela);
  FfpuVerificarAlteracaoCommand.Parameters[1].Value.SetWideString(ipUltimaSincronizacao);
  FfpuVerificarAlteracaoCommand.ExecuteUpdate;
  Result := FfpuVerificarAlteracaoCommand.Parameters[2].Value.GetBoolean;
end;

procedure TsmFuncoesGeralClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TsmFuncoesGeral.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;


constructor TsmFuncoesGeralClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TsmFuncoesGeralClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TsmFuncoesGeralClient.Destroy;
begin
  FfpuVerificarNovaVersaoCommand.DisposeOf;
  FfpuBaixarAtualizacaoCommand.DisposeOf;
  FfpuGetIdCommand.DisposeOf;
  FfpuDataHoraAtualCommand.DisposeOf;
  FfpuTestarConexaoCommand.DisposeOf;
  FfpuVerificarAlteracaoCommand.DisposeOf;
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
end;

procedure TsmLookupClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TsmLookup.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;


constructor TsmLookupClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TsmLookupClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TsmLookupClient.Destroy;
begin
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
end;

function TsmFuncoesAdministrativoClient.fpuPermissoesUsuario(ipLogin: string): OleVariant;
begin
  if FfpuPermissoesUsuarioCommand = nil then
  begin
    FfpuPermissoesUsuarioCommand := FDBXConnection.CreateCommand;
    FfpuPermissoesUsuarioCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuPermissoesUsuarioCommand.Text := 'TsmFuncoesAdministrativo.fpuPermissoesUsuario';
    FfpuPermissoesUsuarioCommand.Prepare;
  end;
  FfpuPermissoesUsuarioCommand.Parameters[0].Value.SetWideString(ipLogin);
  FfpuPermissoesUsuarioCommand.ExecuteUpdate;
  Result := FfpuPermissoesUsuarioCommand.Parameters[1].Value.AsVariant;
end;

function TsmFuncoesAdministrativoClient.fpuValidarFinanciadorFornecedorCliente(ipId: Integer; ipTipo: Integer; ipRazaoSocial: string; ipCpfCnpj: string): Boolean;
begin
  if FfpuValidarFinanciadorFornecedorClienteCommand = nil then
  begin
    FfpuValidarFinanciadorFornecedorClienteCommand := FDBXConnection.CreateCommand;
    FfpuValidarFinanciadorFornecedorClienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuValidarFinanciadorFornecedorClienteCommand.Text := 'TsmFuncoesAdministrativo.fpuValidarFinanciadorFornecedorCliente';
    FfpuValidarFinanciadorFornecedorClienteCommand.Prepare;
  end;
  FfpuValidarFinanciadorFornecedorClienteCommand.Parameters[0].Value.SetInt32(ipId);
  FfpuValidarFinanciadorFornecedorClienteCommand.Parameters[1].Value.SetInt32(ipTipo);
  FfpuValidarFinanciadorFornecedorClienteCommand.Parameters[2].Value.SetWideString(ipRazaoSocial);
  FfpuValidarFinanciadorFornecedorClienteCommand.Parameters[3].Value.SetWideString(ipCpfCnpj);
  FfpuValidarFinanciadorFornecedorClienteCommand.ExecuteUpdate;
  Result := FfpuValidarFinanciadorFornecedorClienteCommand.Parameters[4].Value.GetBoolean;
end;

function TsmFuncoesAdministrativoClient.fpuValidarLogin(ipId: Integer; ipLogin: string): Boolean;
begin
  if FfpuValidarLoginCommand = nil then
  begin
    FfpuValidarLoginCommand := FDBXConnection.CreateCommand;
    FfpuValidarLoginCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuValidarLoginCommand.Text := 'TsmFuncoesAdministrativo.fpuValidarLogin';
    FfpuValidarLoginCommand.Prepare;
  end;
  FfpuValidarLoginCommand.Parameters[0].Value.SetInt32(ipId);
  FfpuValidarLoginCommand.Parameters[1].Value.SetWideString(ipLogin);
  FfpuValidarLoginCommand.ExecuteUpdate;
  Result := FfpuValidarLoginCommand.Parameters[2].Value.GetBoolean;
end;

function TsmFuncoesAdministrativoClient.fpuValidarNomeProjeto(ipIdProjeto: Integer; ipNome: string): Boolean;
begin
  if FfpuValidarNomeProjetoCommand = nil then
  begin
    FfpuValidarNomeProjetoCommand := FDBXConnection.CreateCommand;
    FfpuValidarNomeProjetoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuValidarNomeProjetoCommand.Text := 'TsmFuncoesAdministrativo.fpuValidarNomeProjeto';
    FfpuValidarNomeProjetoCommand.Prepare;
  end;
  FfpuValidarNomeProjetoCommand.Parameters[0].Value.SetInt32(ipIdProjeto);
  FfpuValidarNomeProjetoCommand.Parameters[1].Value.SetWideString(ipNome);
  FfpuValidarNomeProjetoCommand.ExecuteUpdate;
  Result := FfpuValidarNomeProjetoCommand.Parameters[2].Value.GetBoolean;
end;

function TsmFuncoesAdministrativoClient.fpuValidarAreaProjeto(ipIdProjeto: Integer; ipIdAreaAtuacao: Integer): Boolean;
begin
  if FfpuValidarAreaProjetoCommand = nil then
  begin
    FfpuValidarAreaProjetoCommand := FDBXConnection.CreateCommand;
    FfpuValidarAreaProjetoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuValidarAreaProjetoCommand.Text := 'TsmFuncoesAdministrativo.fpuValidarAreaProjeto';
    FfpuValidarAreaProjetoCommand.Prepare;
  end;
  FfpuValidarAreaProjetoCommand.Parameters[0].Value.SetInt32(ipIdProjeto);
  FfpuValidarAreaProjetoCommand.Parameters[1].Value.SetInt32(ipIdAreaAtuacao);
  FfpuValidarAreaProjetoCommand.ExecuteUpdate;
  Result := FfpuValidarAreaProjetoCommand.Parameters[2].Value.GetBoolean;
end;

function TsmFuncoesAdministrativoClient.fpuInfoPessoa(ipLogin: string): TPessoa;
begin
  if FfpuInfoPessoaCommand = nil then
  begin
    FfpuInfoPessoaCommand := FDBXConnection.CreateCommand;
    FfpuInfoPessoaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuInfoPessoaCommand.Text := 'TsmFuncoesAdministrativo.fpuInfoPessoa';
    FfpuInfoPessoaCommand.Prepare;
  end;
  FfpuInfoPessoaCommand.Parameters[0].Value.SetWideString(ipLogin);
  FfpuInfoPessoaCommand.ExecuteUpdate;
  if not FfpuInfoPessoaCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDBXClientCommand(FfpuInfoPessoaCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TPessoa(FUnMarshal.UnMarshal(FfpuInfoPessoaCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FfpuInfoPessoaCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

procedure TsmFuncoesAdministrativoClient.ppuValidarFinalizarAtividade(ipIdAtividade: Integer);
begin
  if FppuValidarFinalizarAtividadeCommand = nil then
  begin
    FppuValidarFinalizarAtividadeCommand := FDBXConnection.CreateCommand;
    FppuValidarFinalizarAtividadeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FppuValidarFinalizarAtividadeCommand.Text := 'TsmFuncoesAdministrativo.ppuValidarFinalizarAtividade';
    FppuValidarFinalizarAtividadeCommand.Prepare;
  end;
  FppuValidarFinalizarAtividadeCommand.Parameters[0].Value.SetInt32(ipIdAtividade);
  FppuValidarFinalizarAtividadeCommand.ExecuteUpdate;
end;

function TsmFuncoesAdministrativoClient.fpuValidarNomeCpfPessoa(ipIdPessoa: Integer; ipNome: string; ipCpf: string): Boolean;
begin
  if FfpuValidarNomeCpfPessoaCommand = nil then
  begin
    FfpuValidarNomeCpfPessoaCommand := FDBXConnection.CreateCommand;
    FfpuValidarNomeCpfPessoaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuValidarNomeCpfPessoaCommand.Text := 'TsmFuncoesAdministrativo.fpuValidarNomeCpfPessoa';
    FfpuValidarNomeCpfPessoaCommand.Prepare;
  end;
  FfpuValidarNomeCpfPessoaCommand.Parameters[0].Value.SetInt32(ipIdPessoa);
  FfpuValidarNomeCpfPessoaCommand.Parameters[1].Value.SetWideString(ipNome);
  FfpuValidarNomeCpfPessoaCommand.Parameters[2].Value.SetWideString(ipCpf);
  FfpuValidarNomeCpfPessoaCommand.ExecuteUpdate;
  Result := FfpuValidarNomeCpfPessoaCommand.Parameters[3].Value.GetBoolean;
end;

function TsmFuncoesAdministrativoClient.fpuValidarNomeAreaAtuacao(ipIdAreaAtuacao: Integer; ipNome: string): Boolean;
begin
  if FfpuValidarNomeAreaAtuacaoCommand = nil then
  begin
    FfpuValidarNomeAreaAtuacaoCommand := FDBXConnection.CreateCommand;
    FfpuValidarNomeAreaAtuacaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuValidarNomeAreaAtuacaoCommand.Text := 'TsmFuncoesAdministrativo.fpuValidarNomeAreaAtuacao';
    FfpuValidarNomeAreaAtuacaoCommand.Prepare;
  end;
  FfpuValidarNomeAreaAtuacaoCommand.Parameters[0].Value.SetInt32(ipIdAreaAtuacao);
  FfpuValidarNomeAreaAtuacaoCommand.Parameters[1].Value.SetWideString(ipNome);
  FfpuValidarNomeAreaAtuacaoCommand.ExecuteUpdate;
  Result := FfpuValidarNomeAreaAtuacaoCommand.Parameters[2].Value.GetBoolean;
end;

function TsmFuncoesAdministrativoClient.fpuSomaOrcamentoRubrica(ipIdProjeto: Integer): Double;
begin
  if FfpuSomaOrcamentoRubricaCommand = nil then
  begin
    FfpuSomaOrcamentoRubricaCommand := FDBXConnection.CreateCommand;
    FfpuSomaOrcamentoRubricaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuSomaOrcamentoRubricaCommand.Text := 'TsmFuncoesAdministrativo.fpuSomaOrcamentoRubrica';
    FfpuSomaOrcamentoRubricaCommand.Prepare;
  end;
  FfpuSomaOrcamentoRubricaCommand.Parameters[0].Value.SetInt32(ipIdProjeto);
  FfpuSomaOrcamentoRubricaCommand.ExecuteUpdate;
  Result := FfpuSomaOrcamentoRubricaCommand.Parameters[1].Value.GetDouble;
end;

function TsmFuncoesAdministrativoClient.fpuSomaPagametosFinanciador(ipIdProjetoFinanciador: Integer): Double;
begin
  if FfpuSomaPagametosFinanciadorCommand = nil then
  begin
    FfpuSomaPagametosFinanciadorCommand := FDBXConnection.CreateCommand;
    FfpuSomaPagametosFinanciadorCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuSomaPagametosFinanciadorCommand.Text := 'TsmFuncoesAdministrativo.fpuSomaPagametosFinanciador';
    FfpuSomaPagametosFinanciadorCommand.Prepare;
  end;
  FfpuSomaPagametosFinanciadorCommand.Parameters[0].Value.SetInt32(ipIdProjetoFinanciador);
  FfpuSomaPagametosFinanciadorCommand.ExecuteUpdate;
  Result := FfpuSomaPagametosFinanciadorCommand.Parameters[1].Value.GetDouble;
end;

procedure TsmFuncoesAdministrativoClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TsmFuncoesAdministrativo.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;


constructor TsmFuncoesAdministrativoClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TsmFuncoesAdministrativoClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TsmFuncoesAdministrativoClient.Destroy;
begin
  FfpuPermissoesUsuarioCommand.DisposeOf;
  FfpuValidarFinanciadorFornecedorClienteCommand.DisposeOf;
  FfpuValidarLoginCommand.DisposeOf;
  FfpuValidarNomeProjetoCommand.DisposeOf;
  FfpuValidarAreaProjetoCommand.DisposeOf;
  FfpuInfoPessoaCommand.DisposeOf;
  FppuValidarFinalizarAtividadeCommand.DisposeOf;
  FfpuValidarNomeCpfPessoaCommand.DisposeOf;
  FfpuValidarNomeAreaAtuacaoCommand.DisposeOf;
  FfpuSomaOrcamentoRubricaCommand.DisposeOf;
  FfpuSomaPagametosFinanciadorCommand.DisposeOf;
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
end;

procedure TsmFinanceiroClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TsmFinanceiro.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;


constructor TsmFinanceiroClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TsmFinanceiroClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TsmFinanceiroClient.Destroy;
begin
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
end;

procedure TsmViveiroClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TsmViveiro.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;


constructor TsmViveiroClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TsmViveiroClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TsmViveiroClient.Destroy;
begin
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
end;

function TsmFuncoesViveiroClient.fpuValidarNomeMatriz(ipId: Integer; ipNome: string): Boolean;
begin
  if FfpuValidarNomeMatrizCommand = nil then
  begin
    FfpuValidarNomeMatrizCommand := FDBXConnection.CreateCommand;
    FfpuValidarNomeMatrizCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuValidarNomeMatrizCommand.Text := 'TsmFuncoesViveiro.fpuValidarNomeMatriz';
    FfpuValidarNomeMatrizCommand.Prepare;
  end;
  FfpuValidarNomeMatrizCommand.Parameters[0].Value.SetInt32(ipId);
  FfpuValidarNomeMatrizCommand.Parameters[1].Value.SetWideString(ipNome);
  FfpuValidarNomeMatrizCommand.ExecuteUpdate;
  Result := FfpuValidarNomeMatrizCommand.Parameters[2].Value.GetBoolean;
end;

function TsmFuncoesViveiroClient.fpuValidarNomeCanteiro(ipId: Integer; ipNome: string): Boolean;
begin
  if FfpuValidarNomeCanteiroCommand = nil then
  begin
    FfpuValidarNomeCanteiroCommand := FDBXConnection.CreateCommand;
    FfpuValidarNomeCanteiroCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuValidarNomeCanteiroCommand.Text := 'TsmFuncoesViveiro.fpuValidarNomeCanteiro';
    FfpuValidarNomeCanteiroCommand.Prepare;
  end;
  FfpuValidarNomeCanteiroCommand.Parameters[0].Value.SetInt32(ipId);
  FfpuValidarNomeCanteiroCommand.Parameters[1].Value.SetWideString(ipNome);
  FfpuValidarNomeCanteiroCommand.ExecuteUpdate;
  Result := FfpuValidarNomeCanteiroCommand.Parameters[2].Value.GetBoolean;
end;

function TsmFuncoesViveiroClient.fpuvalidarNomeCamaraFria(ipId: Integer; ipNome: string): Boolean;
begin
  if FfpuvalidarNomeCamaraFriaCommand = nil then
  begin
    FfpuvalidarNomeCamaraFriaCommand := FDBXConnection.CreateCommand;
    FfpuvalidarNomeCamaraFriaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuvalidarNomeCamaraFriaCommand.Text := 'TsmFuncoesViveiro.fpuvalidarNomeCamaraFria';
    FfpuvalidarNomeCamaraFriaCommand.Prepare;
  end;
  FfpuvalidarNomeCamaraFriaCommand.Parameters[0].Value.SetInt32(ipId);
  FfpuvalidarNomeCamaraFriaCommand.Parameters[1].Value.SetWideString(ipNome);
  FfpuvalidarNomeCamaraFriaCommand.ExecuteUpdate;
  Result := FfpuvalidarNomeCamaraFriaCommand.Parameters[2].Value.GetBoolean;
end;

function TsmFuncoesViveiroClient.fpuvalidarNomeTipoEspecie(ipId: Integer; ipNome: string): Boolean;
begin
  if FfpuvalidarNomeTipoEspecieCommand = nil then
  begin
    FfpuvalidarNomeTipoEspecieCommand := FDBXConnection.CreateCommand;
    FfpuvalidarNomeTipoEspecieCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuvalidarNomeTipoEspecieCommand.Text := 'TsmFuncoesViveiro.fpuvalidarNomeTipoEspecie';
    FfpuvalidarNomeTipoEspecieCommand.Prepare;
  end;
  FfpuvalidarNomeTipoEspecieCommand.Parameters[0].Value.SetInt32(ipId);
  FfpuvalidarNomeTipoEspecieCommand.Parameters[1].Value.SetWideString(ipNome);
  FfpuvalidarNomeTipoEspecieCommand.ExecuteUpdate;
  Result := FfpuvalidarNomeTipoEspecieCommand.Parameters[2].Value.GetBoolean;
end;

procedure TsmFuncoesViveiroClient.ppuValidarSemeadura(ipIdLote: Integer; ipIdSemeadura: Integer; ipQtdeSemeada: Double);
begin
  if FppuValidarSemeaduraCommand = nil then
  begin
    FppuValidarSemeaduraCommand := FDBXConnection.CreateCommand;
    FppuValidarSemeaduraCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FppuValidarSemeaduraCommand.Text := 'TsmFuncoesViveiro.ppuValidarSemeadura';
    FppuValidarSemeaduraCommand.Prepare;
  end;
  FppuValidarSemeaduraCommand.Parameters[0].Value.SetInt32(ipIdLote);
  FppuValidarSemeaduraCommand.Parameters[1].Value.SetInt32(ipIdSemeadura);
  FppuValidarSemeaduraCommand.Parameters[2].Value.SetDouble(ipQtdeSemeada);
  FppuValidarSemeaduraCommand.ExecuteUpdate;
end;

function TsmFuncoesViveiroClient.fpuBuscarLotesMudas(ipIdCompra: Integer): string;
begin
  if FfpuBuscarLotesMudasCommand = nil then
  begin
    FfpuBuscarLotesMudasCommand := FDBXConnection.CreateCommand;
    FfpuBuscarLotesMudasCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuBuscarLotesMudasCommand.Text := 'TsmFuncoesViveiro.fpuBuscarLotesMudas';
    FfpuBuscarLotesMudasCommand.Prepare;
  end;
  FfpuBuscarLotesMudasCommand.Parameters[0].Value.SetInt32(ipIdCompra);
  FfpuBuscarLotesMudasCommand.ExecuteUpdate;
  Result := FfpuBuscarLotesMudasCommand.Parameters[1].Value.GetWideString;
end;

function TsmFuncoesViveiroClient.fpuBuscarLoteMuda(ipIdCompraItem: Integer): Integer;
begin
  if FfpuBuscarLoteMudaCommand = nil then
  begin
    FfpuBuscarLoteMudaCommand := FDBXConnection.CreateCommand;
    FfpuBuscarLoteMudaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuBuscarLoteMudaCommand.Text := 'TsmFuncoesViveiro.fpuBuscarLoteMuda';
    FfpuBuscarLoteMudaCommand.Prepare;
  end;
  FfpuBuscarLoteMudaCommand.Parameters[0].Value.SetInt32(ipIdCompraItem);
  FfpuBuscarLoteMudaCommand.ExecuteUpdate;
  Result := FfpuBuscarLoteMudaCommand.Parameters[1].Value.GetInt32;
end;

function TsmFuncoesViveiroClient.fpuBuscarLotesSementes(ipIdCompra: Integer): string;
begin
  if FfpuBuscarLotesSementesCommand = nil then
  begin
    FfpuBuscarLotesSementesCommand := FDBXConnection.CreateCommand;
    FfpuBuscarLotesSementesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuBuscarLotesSementesCommand.Text := 'TsmFuncoesViveiro.fpuBuscarLotesSementes';
    FfpuBuscarLotesSementesCommand.Prepare;
  end;
  FfpuBuscarLotesSementesCommand.Parameters[0].Value.SetInt32(ipIdCompra);
  FfpuBuscarLotesSementesCommand.ExecuteUpdate;
  Result := FfpuBuscarLotesSementesCommand.Parameters[1].Value.GetWideString;
end;

function TsmFuncoesViveiroClient.fpuBuscarLoteSemente(ipIdCompraItem: Integer): Integer;
begin
  if FfpuBuscarLoteSementeCommand = nil then
  begin
    FfpuBuscarLoteSementeCommand := FDBXConnection.CreateCommand;
    FfpuBuscarLoteSementeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuBuscarLoteSementeCommand.Text := 'TsmFuncoesViveiro.fpuBuscarLoteSemente';
    FfpuBuscarLoteSementeCommand.Prepare;
  end;
  FfpuBuscarLoteSementeCommand.Parameters[0].Value.SetInt32(ipIdCompraItem);
  FfpuBuscarLoteSementeCommand.ExecuteUpdate;
  Result := FfpuBuscarLoteSementeCommand.Parameters[1].Value.GetInt32;
end;

procedure TsmFuncoesViveiroClient.ppuAjustarSaldoEspecie(ipIdEspecie: Integer);
begin
  if FppuAjustarSaldoEspecieCommand = nil then
  begin
    FppuAjustarSaldoEspecieCommand := FDBXConnection.CreateCommand;
    FppuAjustarSaldoEspecieCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FppuAjustarSaldoEspecieCommand.Text := 'TsmFuncoesViveiro.ppuAjustarSaldoEspecie';
    FppuAjustarSaldoEspecieCommand.Prepare;
  end;
  FppuAjustarSaldoEspecieCommand.Parameters[0].Value.SetInt32(ipIdEspecie);
  FppuAjustarSaldoEspecieCommand.ExecuteUpdate;
end;

function TsmFuncoesViveiroClient.fpuCalcularPrevisaoProducaoMuda(ipEspecies: TadsObjectlist<uTypes.TEspecie>; ipDataPrevisao: string): OleVariant;
begin
  if FfpuCalcularPrevisaoProducaoMudaCommand = nil then
  begin
    FfpuCalcularPrevisaoProducaoMudaCommand := FDBXConnection.CreateCommand;
    FfpuCalcularPrevisaoProducaoMudaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuCalcularPrevisaoProducaoMudaCommand.Text := 'TsmFuncoesViveiro.fpuCalcularPrevisaoProducaoMuda';
    FfpuCalcularPrevisaoProducaoMudaCommand.Prepare;
  end;
  if not Assigned(ipEspecies) then
    FfpuCalcularPrevisaoProducaoMudaCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FfpuCalcularPrevisaoProducaoMudaCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FfpuCalcularPrevisaoProducaoMudaCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(ipEspecies), True);
      if FInstanceOwner then
        ipEspecies.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FfpuCalcularPrevisaoProducaoMudaCommand.Parameters[1].Value.SetWideString(ipDataPrevisao);
  FfpuCalcularPrevisaoProducaoMudaCommand.ExecuteUpdate;
  Result := FfpuCalcularPrevisaoProducaoMudaCommand.Parameters[2].Value.AsVariant;
end;

procedure TsmFuncoesViveiroClient.ppuCalcularQuantidadeMudasMix(ipIdMixMuda: Integer);
begin
  if FppuCalcularQuantidadeMudasMixCommand = nil then
  begin
    FppuCalcularQuantidadeMudasMixCommand := FDBXConnection.CreateCommand;
    FppuCalcularQuantidadeMudasMixCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FppuCalcularQuantidadeMudasMixCommand.Text := 'TsmFuncoesViveiro.ppuCalcularQuantidadeMudasMix';
    FppuCalcularQuantidadeMudasMixCommand.Prepare;
  end;
  FppuCalcularQuantidadeMudasMixCommand.Parameters[0].Value.SetInt32(ipIdMixMuda);
  FppuCalcularQuantidadeMudasMixCommand.ExecuteUpdate;
end;

function TsmFuncoesViveiroClient.fpuBuscarIdItemMuda: Integer;
begin
  if FfpuBuscarIdItemMudaCommand = nil then
  begin
    FfpuBuscarIdItemMudaCommand := FDBXConnection.CreateCommand;
    FfpuBuscarIdItemMudaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuBuscarIdItemMudaCommand.Text := 'TsmFuncoesViveiro.fpuBuscarIdItemMuda';
    FfpuBuscarIdItemMudaCommand.Prepare;
  end;
  FfpuBuscarIdItemMudaCommand.ExecuteUpdate;
  Result := FfpuBuscarIdItemMudaCommand.Parameters[0].Value.GetInt32;
end;

function TsmFuncoesViveiroClient.fpuCalcularQtdeMudasRocambole(ipIdMixMuda: Integer): OleVariant;
begin
  if FfpuCalcularQtdeMudasRocamboleCommand = nil then
  begin
    FfpuCalcularQtdeMudasRocamboleCommand := FDBXConnection.CreateCommand;
    FfpuCalcularQtdeMudasRocamboleCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuCalcularQtdeMudasRocamboleCommand.Text := 'TsmFuncoesViveiro.fpuCalcularQtdeMudasRocambole';
    FfpuCalcularQtdeMudasRocamboleCommand.Prepare;
  end;
  FfpuCalcularQtdeMudasRocamboleCommand.Parameters[0].Value.SetInt32(ipIdMixMuda);
  FfpuCalcularQtdeMudasRocamboleCommand.ExecuteUpdate;
  Result := FfpuCalcularQtdeMudasRocamboleCommand.Parameters[1].Value.AsVariant;
end;

function TsmFuncoesViveiroClient.fpuGetId(ipTabela: string): Integer;
begin
  if FfpuGetIdCommand = nil then
  begin
    FfpuGetIdCommand := FDBXConnection.CreateCommand;
    FfpuGetIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuGetIdCommand.Text := 'TsmFuncoesViveiro.fpuGetId';
    FfpuGetIdCommand.Prepare;
  end;
  FfpuGetIdCommand.Parameters[0].Value.SetWideString(ipTabela);
  FfpuGetIdCommand.ExecuteUpdate;
  Result := FfpuGetIdCommand.Parameters[1].Value.GetInt32;
end;

function TsmFuncoesViveiroClient.fpuDataHoraAtual: string;
begin
  if FfpuDataHoraAtualCommand = nil then
  begin
    FfpuDataHoraAtualCommand := FDBXConnection.CreateCommand;
    FfpuDataHoraAtualCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuDataHoraAtualCommand.Text := 'TsmFuncoesViveiro.fpuDataHoraAtual';
    FfpuDataHoraAtualCommand.Prepare;
  end;
  FfpuDataHoraAtualCommand.ExecuteUpdate;
  Result := FfpuDataHoraAtualCommand.Parameters[0].Value.GetWideString;
end;

function TsmFuncoesViveiroClient.fpuTestarConexao: Boolean;
begin
  if FfpuTestarConexaoCommand = nil then
  begin
    FfpuTestarConexaoCommand := FDBXConnection.CreateCommand;
    FfpuTestarConexaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuTestarConexaoCommand.Text := 'TsmFuncoesViveiro.fpuTestarConexao';
    FfpuTestarConexaoCommand.Prepare;
  end;
  FfpuTestarConexaoCommand.ExecuteUpdate;
  Result := FfpuTestarConexaoCommand.Parameters[0].Value.GetBoolean;
end;

function TsmFuncoesViveiroClient.fpuVerificarAlteracao(ipTabela: string; ipUltimaSincronizacao: string): Boolean;
begin
  if FfpuVerificarAlteracaoCommand = nil then
  begin
    FfpuVerificarAlteracaoCommand := FDBXConnection.CreateCommand;
    FfpuVerificarAlteracaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuVerificarAlteracaoCommand.Text := 'TsmFuncoesViveiro.fpuVerificarAlteracao';
    FfpuVerificarAlteracaoCommand.Prepare;
  end;
  FfpuVerificarAlteracaoCommand.Parameters[0].Value.SetWideString(ipTabela);
  FfpuVerificarAlteracaoCommand.Parameters[1].Value.SetWideString(ipUltimaSincronizacao);
  FfpuVerificarAlteracaoCommand.ExecuteUpdate;
  Result := FfpuVerificarAlteracaoCommand.Parameters[2].Value.GetBoolean;
end;

procedure TsmFuncoesViveiroClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TsmFuncoesViveiro.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;


constructor TsmFuncoesViveiroClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TsmFuncoesViveiroClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TsmFuncoesViveiroClient.Destroy;
begin
  FfpuValidarNomeMatrizCommand.DisposeOf;
  FfpuValidarNomeCanteiroCommand.DisposeOf;
  FfpuvalidarNomeCamaraFriaCommand.DisposeOf;
  FfpuvalidarNomeTipoEspecieCommand.DisposeOf;
  FppuValidarSemeaduraCommand.DisposeOf;
  FfpuBuscarLotesMudasCommand.DisposeOf;
  FfpuBuscarLoteMudaCommand.DisposeOf;
  FfpuBuscarLotesSementesCommand.DisposeOf;
  FfpuBuscarLoteSementeCommand.DisposeOf;
  FppuAjustarSaldoEspecieCommand.DisposeOf;
  FfpuCalcularPrevisaoProducaoMudaCommand.DisposeOf;
  FppuCalcularQuantidadeMudasMixCommand.DisposeOf;
  FfpuBuscarIdItemMudaCommand.DisposeOf;
  FfpuCalcularQtdeMudasRocamboleCommand.DisposeOf;
  FfpuGetIdCommand.DisposeOf;
  FfpuDataHoraAtualCommand.DisposeOf;
  FfpuTestarConexaoCommand.DisposeOf;
  FfpuVerificarAlteracaoCommand.DisposeOf;
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
end;

function TsmFuncoesFinanceiroClient.fpuVerificarDependenciasPlanoConta(ipIdentificador: string): Boolean;
begin
  if FfpuVerificarDependenciasPlanoContaCommand = nil then
  begin
    FfpuVerificarDependenciasPlanoContaCommand := FDBXConnection.CreateCommand;
    FfpuVerificarDependenciasPlanoContaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuVerificarDependenciasPlanoContaCommand.Text := 'TsmFuncoesFinanceiro.fpuVerificarDependenciasPlanoConta';
    FfpuVerificarDependenciasPlanoContaCommand.Prepare;
  end;
  FfpuVerificarDependenciasPlanoContaCommand.Parameters[0].Value.SetWideString(ipIdentificador);
  FfpuVerificarDependenciasPlanoContaCommand.ExecuteUpdate;
  Result := FfpuVerificarDependenciasPlanoContaCommand.Parameters[1].Value.GetBoolean;
end;

function TsmFuncoesFinanceiroClient.fpuVerificarDependenciasRubrica(ipIdentificador: string): Boolean;
begin
  if FfpuVerificarDependenciasRubricaCommand = nil then
  begin
    FfpuVerificarDependenciasRubricaCommand := FDBXConnection.CreateCommand;
    FfpuVerificarDependenciasRubricaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuVerificarDependenciasRubricaCommand.Text := 'TsmFuncoesFinanceiro.fpuVerificarDependenciasRubrica';
    FfpuVerificarDependenciasRubricaCommand.Prepare;
  end;
  FfpuVerificarDependenciasRubricaCommand.Parameters[0].Value.SetWideString(ipIdentificador);
  FfpuVerificarDependenciasRubricaCommand.ExecuteUpdate;
  Result := FfpuVerificarDependenciasRubricaCommand.Parameters[1].Value.GetBoolean;
end;

function TsmFuncoesFinanceiroClient.fpuGerarIdentificadorPlanoContas(ipIdConta: Integer): string;
begin
  if FfpuGerarIdentificadorPlanoContasCommand = nil then
  begin
    FfpuGerarIdentificadorPlanoContasCommand := FDBXConnection.CreateCommand;
    FfpuGerarIdentificadorPlanoContasCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuGerarIdentificadorPlanoContasCommand.Text := 'TsmFuncoesFinanceiro.fpuGerarIdentificadorPlanoContas';
    FfpuGerarIdentificadorPlanoContasCommand.Prepare;
  end;
  FfpuGerarIdentificadorPlanoContasCommand.Parameters[0].Value.SetInt32(ipIdConta);
  FfpuGerarIdentificadorPlanoContasCommand.ExecuteUpdate;
  Result := FfpuGerarIdentificadorPlanoContasCommand.Parameters[1].Value.GetWideString;
end;

function TsmFuncoesFinanceiroClient.fpuGerarIdentificadorRubrica(ipIdRubrica: Integer): string;
begin
  if FfpuGerarIdentificadorRubricaCommand = nil then
  begin
    FfpuGerarIdentificadorRubricaCommand := FDBXConnection.CreateCommand;
    FfpuGerarIdentificadorRubricaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuGerarIdentificadorRubricaCommand.Text := 'TsmFuncoesFinanceiro.fpuGerarIdentificadorRubrica';
    FfpuGerarIdentificadorRubricaCommand.Prepare;
  end;
  FfpuGerarIdentificadorRubricaCommand.Parameters[0].Value.SetInt32(ipIdRubrica);
  FfpuGerarIdentificadorRubricaCommand.ExecuteUpdate;
  Result := FfpuGerarIdentificadorRubricaCommand.Parameters[1].Value.GetWideString;
end;

procedure TsmFuncoesFinanceiroClient.ppuQuitarParcela(ipIdParcela: Integer; ipDataPagamento: string);
begin
  if FppuQuitarParcelaCommand = nil then
  begin
    FppuQuitarParcelaCommand := FDBXConnection.CreateCommand;
    FppuQuitarParcelaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FppuQuitarParcelaCommand.Text := 'TsmFuncoesFinanceiro.ppuQuitarParcela';
    FppuQuitarParcelaCommand.Prepare;
  end;
  FppuQuitarParcelaCommand.Parameters[0].Value.SetInt32(ipIdParcela);
  FppuQuitarParcelaCommand.Parameters[1].Value.SetWideString(ipDataPagamento);
  FppuQuitarParcelaCommand.ExecuteUpdate;
end;

procedure TsmFuncoesFinanceiroClient.ppuReabrirParcela(ipIdParcela: Integer);
begin
  if FppuReabrirParcelaCommand = nil then
  begin
    FppuReabrirParcelaCommand := FDBXConnection.CreateCommand;
    FppuReabrirParcelaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FppuReabrirParcelaCommand.Text := 'TsmFuncoesFinanceiro.ppuReabrirParcela';
    FppuReabrirParcelaCommand.Prepare;
  end;
  FppuReabrirParcelaCommand.Parameters[0].Value.SetInt32(ipIdParcela);
  FppuReabrirParcelaCommand.ExecuteUpdate;
end;

procedure TsmFuncoesFinanceiroClient.ppuReabrirTodasParcelasContaPagar(ipIdContaPagar: Integer);
begin
  if FppuReabrirTodasParcelasContaPagarCommand = nil then
  begin
    FppuReabrirTodasParcelasContaPagarCommand := FDBXConnection.CreateCommand;
    FppuReabrirTodasParcelasContaPagarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FppuReabrirTodasParcelasContaPagarCommand.Text := 'TsmFuncoesFinanceiro.ppuReabrirTodasParcelasContaPagar';
    FppuReabrirTodasParcelasContaPagarCommand.Prepare;
  end;
  FppuReabrirTodasParcelasContaPagarCommand.Parameters[0].Value.SetInt32(ipIdContaPagar);
  FppuReabrirTodasParcelasContaPagarCommand.ExecuteUpdate;
end;

procedure TsmFuncoesFinanceiroClient.ppuReceberParcela(ipIdParcela: Integer);
begin
  if FppuReceberParcelaCommand = nil then
  begin
    FppuReceberParcelaCommand := FDBXConnection.CreateCommand;
    FppuReceberParcelaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FppuReceberParcelaCommand.Text := 'TsmFuncoesFinanceiro.ppuReceberParcela';
    FppuReceberParcelaCommand.Prepare;
  end;
  FppuReceberParcelaCommand.Parameters[0].Value.SetInt32(ipIdParcela);
  FppuReceberParcelaCommand.ExecuteUpdate;
end;

procedure TsmFuncoesFinanceiroClient.ppuCancelarRecebimentoParcela(ipIdParcela: Integer);
begin
  if FppuCancelarRecebimentoParcelaCommand = nil then
  begin
    FppuCancelarRecebimentoParcelaCommand := FDBXConnection.CreateCommand;
    FppuCancelarRecebimentoParcelaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FppuCancelarRecebimentoParcelaCommand.Text := 'TsmFuncoesFinanceiro.ppuCancelarRecebimentoParcela';
    FppuCancelarRecebimentoParcelaCommand.Prepare;
  end;
  FppuCancelarRecebimentoParcelaCommand.Parameters[0].Value.SetInt32(ipIdParcela);
  FppuCancelarRecebimentoParcelaCommand.ExecuteUpdate;
end;

procedure TsmFuncoesFinanceiroClient.ppuCancelarTodosRecebimentosContaReceber(ipIdContaReceber: Integer);
begin
  if FppuCancelarTodosRecebimentosContaReceberCommand = nil then
  begin
    FppuCancelarTodosRecebimentosContaReceberCommand := FDBXConnection.CreateCommand;
    FppuCancelarTodosRecebimentosContaReceberCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FppuCancelarTodosRecebimentosContaReceberCommand.Text := 'TsmFuncoesFinanceiro.ppuCancelarTodosRecebimentosContaReceber';
    FppuCancelarTodosRecebimentosContaReceberCommand.Prepare;
  end;
  FppuCancelarTodosRecebimentosContaReceberCommand.Parameters[0].Value.SetInt32(ipIdContaReceber);
  FppuCancelarTodosRecebimentosContaReceberCommand.ExecuteUpdate;
end;

function TsmFuncoesFinanceiroClient.fpuSaldoRealRubrica(ipIdProjeto: Integer; ipIdRubrica: Integer): Double;
begin
  if FfpuSaldoRealRubricaCommand = nil then
  begin
    FfpuSaldoRealRubricaCommand := FDBXConnection.CreateCommand;
    FfpuSaldoRealRubricaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuSaldoRealRubricaCommand.Text := 'TsmFuncoesFinanceiro.fpuSaldoRealRubrica';
    FfpuSaldoRealRubricaCommand.Prepare;
  end;
  FfpuSaldoRealRubricaCommand.Parameters[0].Value.SetInt32(ipIdProjeto);
  FfpuSaldoRealRubricaCommand.Parameters[1].Value.SetInt32(ipIdRubrica);
  FfpuSaldoRealRubricaCommand.ExecuteUpdate;
  Result := FfpuSaldoRealRubricaCommand.Parameters[2].Value.GetDouble;
end;

function TsmFuncoesFinanceiroClient.fpuValidarCadastroRubricaProjeto(ipIdIgnorar: Integer; ipIdProjeto: Integer; ipIdRubrica: Integer): Boolean;
begin
  if FfpuValidarCadastroRubricaProjetoCommand = nil then
  begin
    FfpuValidarCadastroRubricaProjetoCommand := FDBXConnection.CreateCommand;
    FfpuValidarCadastroRubricaProjetoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuValidarCadastroRubricaProjetoCommand.Text := 'TsmFuncoesFinanceiro.fpuValidarCadastroRubricaProjeto';
    FfpuValidarCadastroRubricaProjetoCommand.Prepare;
  end;
  FfpuValidarCadastroRubricaProjetoCommand.Parameters[0].Value.SetInt32(ipIdIgnorar);
  FfpuValidarCadastroRubricaProjetoCommand.Parameters[1].Value.SetInt32(ipIdProjeto);
  FfpuValidarCadastroRubricaProjetoCommand.Parameters[2].Value.SetInt32(ipIdRubrica);
  FfpuValidarCadastroRubricaProjetoCommand.ExecuteUpdate;
  Result := FfpuValidarCadastroRubricaProjetoCommand.Parameters[3].Value.GetBoolean;
end;

function TsmFuncoesFinanceiroClient.fpuGetId(ipTabela: string): Integer;
begin
  if FfpuGetIdCommand = nil then
  begin
    FfpuGetIdCommand := FDBXConnection.CreateCommand;
    FfpuGetIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuGetIdCommand.Text := 'TsmFuncoesFinanceiro.fpuGetId';
    FfpuGetIdCommand.Prepare;
  end;
  FfpuGetIdCommand.Parameters[0].Value.SetWideString(ipTabela);
  FfpuGetIdCommand.ExecuteUpdate;
  Result := FfpuGetIdCommand.Parameters[1].Value.GetInt32;
end;

function TsmFuncoesFinanceiroClient.fpuDataHoraAtual: string;
begin
  if FfpuDataHoraAtualCommand = nil then
  begin
    FfpuDataHoraAtualCommand := FDBXConnection.CreateCommand;
    FfpuDataHoraAtualCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuDataHoraAtualCommand.Text := 'TsmFuncoesFinanceiro.fpuDataHoraAtual';
    FfpuDataHoraAtualCommand.Prepare;
  end;
  FfpuDataHoraAtualCommand.ExecuteUpdate;
  Result := FfpuDataHoraAtualCommand.Parameters[0].Value.GetWideString;
end;

function TsmFuncoesFinanceiroClient.fpuTestarConexao: Boolean;
begin
  if FfpuTestarConexaoCommand = nil then
  begin
    FfpuTestarConexaoCommand := FDBXConnection.CreateCommand;
    FfpuTestarConexaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuTestarConexaoCommand.Text := 'TsmFuncoesFinanceiro.fpuTestarConexao';
    FfpuTestarConexaoCommand.Prepare;
  end;
  FfpuTestarConexaoCommand.ExecuteUpdate;
  Result := FfpuTestarConexaoCommand.Parameters[0].Value.GetBoolean;
end;

function TsmFuncoesFinanceiroClient.fpuVerificarAlteracao(ipTabela: string; ipUltimaSincronizacao: string): Boolean;
begin
  if FfpuVerificarAlteracaoCommand = nil then
  begin
    FfpuVerificarAlteracaoCommand := FDBXConnection.CreateCommand;
    FfpuVerificarAlteracaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuVerificarAlteracaoCommand.Text := 'TsmFuncoesFinanceiro.fpuVerificarAlteracao';
    FfpuVerificarAlteracaoCommand.Prepare;
  end;
  FfpuVerificarAlteracaoCommand.Parameters[0].Value.SetWideString(ipTabela);
  FfpuVerificarAlteracaoCommand.Parameters[1].Value.SetWideString(ipUltimaSincronizacao);
  FfpuVerificarAlteracaoCommand.ExecuteUpdate;
  Result := FfpuVerificarAlteracaoCommand.Parameters[2].Value.GetBoolean;
end;

procedure TsmFuncoesFinanceiroClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TsmFuncoesFinanceiro.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;


constructor TsmFuncoesFinanceiroClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TsmFuncoesFinanceiroClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TsmFuncoesFinanceiroClient.Destroy;
begin
  FfpuVerificarDependenciasPlanoContaCommand.DisposeOf;
  FfpuVerificarDependenciasRubricaCommand.DisposeOf;
  FfpuGerarIdentificadorPlanoContasCommand.DisposeOf;
  FfpuGerarIdentificadorRubricaCommand.DisposeOf;
  FppuQuitarParcelaCommand.DisposeOf;
  FppuReabrirParcelaCommand.DisposeOf;
  FppuReabrirTodasParcelasContaPagarCommand.DisposeOf;
  FppuReceberParcelaCommand.DisposeOf;
  FppuCancelarRecebimentoParcelaCommand.DisposeOf;
  FppuCancelarTodosRecebimentosContaReceberCommand.DisposeOf;
  FfpuSaldoRealRubricaCommand.DisposeOf;
  FfpuValidarCadastroRubricaProjetoCommand.DisposeOf;
  FfpuGetIdCommand.DisposeOf;
  FfpuDataHoraAtualCommand.DisposeOf;
  FfpuTestarConexaoCommand.DisposeOf;
  FfpuVerificarAlteracaoCommand.DisposeOf;
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
end;

procedure TsmEstoqueClient.DSServerModuleDestroy(Sender: TObject);
begin
  if FDSServerModuleDestroyCommand = nil then
  begin
    FDSServerModuleDestroyCommand := FDBXConnection.CreateCommand;
    FDSServerModuleDestroyCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleDestroyCommand.Text := 'TsmEstoque.DSServerModuleDestroy';
    FDSServerModuleDestroyCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleDestroyCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleDestroyCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleDestroyCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleDestroyCommand.ExecuteUpdate;
end;

procedure TsmEstoqueClient.qPatrimonioCalcFields(DataSet: TDataSet);
begin
  if FqPatrimonioCalcFieldsCommand = nil then
  begin
    FqPatrimonioCalcFieldsCommand := FDBXConnection.CreateCommand;
    FqPatrimonioCalcFieldsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FqPatrimonioCalcFieldsCommand.Text := 'TsmEstoque.qPatrimonioCalcFields';
    FqPatrimonioCalcFieldsCommand.Prepare;
  end;
  FqPatrimonioCalcFieldsCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FqPatrimonioCalcFieldsCommand.ExecuteUpdate;
end;

procedure TsmEstoqueClient.qEntrada_ItemCalcFields(DataSet: TDataSet);
begin
  if FqEntrada_ItemCalcFieldsCommand = nil then
  begin
    FqEntrada_ItemCalcFieldsCommand := FDBXConnection.CreateCommand;
    FqEntrada_ItemCalcFieldsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FqEntrada_ItemCalcFieldsCommand.Text := 'TsmEstoque.qEntrada_ItemCalcFields';
    FqEntrada_ItemCalcFieldsCommand.Prepare;
  end;
  FqEntrada_ItemCalcFieldsCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FqEntrada_ItemCalcFieldsCommand.ExecuteUpdate;
end;

procedure TsmEstoqueClient.qVendaCalcFields(DataSet: TDataSet);
begin
  if FqVendaCalcFieldsCommand = nil then
  begin
    FqVendaCalcFieldsCommand := FDBXConnection.CreateCommand;
    FqVendaCalcFieldsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FqVendaCalcFieldsCommand.Text := 'TsmEstoque.qVendaCalcFields';
    FqVendaCalcFieldsCommand.Prepare;
  end;
  FqVendaCalcFieldsCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FqVendaCalcFieldsCommand.ExecuteUpdate;
end;

procedure TsmEstoqueClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TsmEstoque.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;


constructor TsmEstoqueClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TsmEstoqueClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TsmEstoqueClient.Destroy;
begin
  FDSServerModuleDestroyCommand.DisposeOf;
  FqPatrimonioCalcFieldsCommand.DisposeOf;
  FqEntrada_ItemCalcFieldsCommand.DisposeOf;
  FqVendaCalcFieldsCommand.DisposeOf;
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
end;

function TsmFuncoesEstoqueClient.fpuValidarNomeItem(ipIdItem: Integer; ipNome: string): Boolean;
begin
  if FfpuValidarNomeItemCommand = nil then
  begin
    FfpuValidarNomeItemCommand := FDBXConnection.CreateCommand;
    FfpuValidarNomeItemCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuValidarNomeItemCommand.Text := 'TsmFuncoesEstoque.fpuValidarNomeItem';
    FfpuValidarNomeItemCommand.Prepare;
  end;
  FfpuValidarNomeItemCommand.Parameters[0].Value.SetInt32(ipIdItem);
  FfpuValidarNomeItemCommand.Parameters[1].Value.SetWideString(ipNome);
  FfpuValidarNomeItemCommand.ExecuteUpdate;
  Result := FfpuValidarNomeItemCommand.Parameters[2].Value.GetBoolean;
end;

function TsmFuncoesEstoqueClient.fpuValidarNomeLocalUso(ipIdLocalUso: Integer; ipNome: string): Boolean;
begin
  if FfpuValidarNomeLocalUsoCommand = nil then
  begin
    FfpuValidarNomeLocalUsoCommand := FDBXConnection.CreateCommand;
    FfpuValidarNomeLocalUsoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuValidarNomeLocalUsoCommand.Text := 'TsmFuncoesEstoque.fpuValidarNomeLocalUso';
    FfpuValidarNomeLocalUsoCommand.Prepare;
  end;
  FfpuValidarNomeLocalUsoCommand.Parameters[0].Value.SetInt32(ipIdLocalUso);
  FfpuValidarNomeLocalUsoCommand.Parameters[1].Value.SetWideString(ipNome);
  FfpuValidarNomeLocalUsoCommand.ExecuteUpdate;
  Result := FfpuValidarNomeLocalUsoCommand.Parameters[2].Value.GetBoolean;
end;

function TsmFuncoesEstoqueClient.fpuVerificarComprasJaGerada(ipIdSolicitacao: Integer): Boolean;
begin
  if FfpuVerificarComprasJaGeradaCommand = nil then
  begin
    FfpuVerificarComprasJaGeradaCommand := FDBXConnection.CreateCommand;
    FfpuVerificarComprasJaGeradaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuVerificarComprasJaGeradaCommand.Text := 'TsmFuncoesEstoque.fpuVerificarComprasJaGerada';
    FfpuVerificarComprasJaGeradaCommand.Prepare;
  end;
  FfpuVerificarComprasJaGeradaCommand.Parameters[0].Value.SetInt32(ipIdSolicitacao);
  FfpuVerificarComprasJaGeradaCommand.ExecuteUpdate;
  Result := FfpuVerificarComprasJaGeradaCommand.Parameters[1].Value.GetBoolean;
end;

function TsmFuncoesEstoqueClient.fpuVerificarContaPagarJaGerada(ipIdCompra: Integer): Boolean;
begin
  if FfpuVerificarContaPagarJaGeradaCommand = nil then
  begin
    FfpuVerificarContaPagarJaGeradaCommand := FDBXConnection.CreateCommand;
    FfpuVerificarContaPagarJaGeradaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuVerificarContaPagarJaGeradaCommand.Text := 'TsmFuncoesEstoque.fpuVerificarContaPagarJaGerada';
    FfpuVerificarContaPagarJaGeradaCommand.Prepare;
  end;
  FfpuVerificarContaPagarJaGeradaCommand.Parameters[0].Value.SetInt32(ipIdCompra);
  FfpuVerificarContaPagarJaGeradaCommand.ExecuteUpdate;
  Result := FfpuVerificarContaPagarJaGeradaCommand.Parameters[1].Value.GetBoolean;
end;

function TsmFuncoesEstoqueClient.fpuVerificarContaReceberJaGerada(ipIdVenda: Integer): Boolean;
begin
  if FfpuVerificarContaReceberJaGeradaCommand = nil then
  begin
    FfpuVerificarContaReceberJaGeradaCommand := FDBXConnection.CreateCommand;
    FfpuVerificarContaReceberJaGeradaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuVerificarContaReceberJaGeradaCommand.Text := 'TsmFuncoesEstoque.fpuVerificarContaReceberJaGerada';
    FfpuVerificarContaReceberJaGeradaCommand.Prepare;
  end;
  FfpuVerificarContaReceberJaGeradaCommand.Parameters[0].Value.SetInt32(ipIdVenda);
  FfpuVerificarContaReceberJaGeradaCommand.ExecuteUpdate;
  Result := FfpuVerificarContaReceberJaGeradaCommand.Parameters[1].Value.GetBoolean;
end;

function TsmFuncoesEstoqueClient.fpuBuscarItensEntrada(ipIdCompra: Integer): string;
begin
  if FfpuBuscarItensEntradaCommand = nil then
  begin
    FfpuBuscarItensEntradaCommand := FDBXConnection.CreateCommand;
    FfpuBuscarItensEntradaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuBuscarItensEntradaCommand.Text := 'TsmFuncoesEstoque.fpuBuscarItensEntrada';
    FfpuBuscarItensEntradaCommand.Prepare;
  end;
  FfpuBuscarItensEntradaCommand.Parameters[0].Value.SetInt32(ipIdCompra);
  FfpuBuscarItensEntradaCommand.ExecuteUpdate;
  Result := FfpuBuscarItensEntradaCommand.Parameters[1].Value.GetWideString;
end;

function TsmFuncoesEstoqueClient.fpuBuscarItemEntrada(ipIdCompraItem: Integer): Integer;
begin
  if FfpuBuscarItemEntradaCommand = nil then
  begin
    FfpuBuscarItemEntradaCommand := FDBXConnection.CreateCommand;
    FfpuBuscarItemEntradaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuBuscarItemEntradaCommand.Text := 'TsmFuncoesEstoque.fpuBuscarItemEntrada';
    FfpuBuscarItemEntradaCommand.Prepare;
  end;
  FfpuBuscarItemEntradaCommand.Parameters[0].Value.SetInt32(ipIdCompraItem);
  FfpuBuscarItemEntradaCommand.ExecuteUpdate;
  Result := FfpuBuscarItemEntradaCommand.Parameters[1].Value.GetInt32;
end;

function TsmFuncoesEstoqueClient.fpuBuscarItensSaida(ipIdVenda: Integer): string;
begin
  if FfpuBuscarItensSaidaCommand = nil then
  begin
    FfpuBuscarItensSaidaCommand := FDBXConnection.CreateCommand;
    FfpuBuscarItensSaidaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuBuscarItensSaidaCommand.Text := 'TsmFuncoesEstoque.fpuBuscarItensSaida';
    FfpuBuscarItensSaidaCommand.Prepare;
  end;
  FfpuBuscarItensSaidaCommand.Parameters[0].Value.SetInt32(ipIdVenda);
  FfpuBuscarItensSaidaCommand.ExecuteUpdate;
  Result := FfpuBuscarItensSaidaCommand.Parameters[1].Value.GetWideString;
end;

function TsmFuncoesEstoqueClient.fpuBuscarItemSaida(ipIdVendaItem: Integer): Integer;
begin
  if FfpuBuscarItemSaidaCommand = nil then
  begin
    FfpuBuscarItemSaidaCommand := FDBXConnection.CreateCommand;
    FfpuBuscarItemSaidaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuBuscarItemSaidaCommand.Text := 'TsmFuncoesEstoque.fpuBuscarItemSaida';
    FfpuBuscarItemSaidaCommand.Prepare;
  end;
  FfpuBuscarItemSaidaCommand.Parameters[0].Value.SetInt32(ipIdVendaItem);
  FfpuBuscarItemSaidaCommand.ExecuteUpdate;
  Result := FfpuBuscarItemSaidaCommand.Parameters[1].Value.GetInt32;
end;

procedure TsmFuncoesEstoqueClient.ppuAtualizarSaldoItem(ipIdItem: Integer; ipQtdeSubtrair: Double; ipQtdeSomar: Double);
begin
  if FppuAtualizarSaldoItemCommand = nil then
  begin
    FppuAtualizarSaldoItemCommand := FDBXConnection.CreateCommand;
    FppuAtualizarSaldoItemCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FppuAtualizarSaldoItemCommand.Text := 'TsmFuncoesEstoque.ppuAtualizarSaldoItem';
    FppuAtualizarSaldoItemCommand.Prepare;
  end;
  FppuAtualizarSaldoItemCommand.Parameters[0].Value.SetInt32(ipIdItem);
  FppuAtualizarSaldoItemCommand.Parameters[1].Value.SetDouble(ipQtdeSubtrair);
  FppuAtualizarSaldoItemCommand.Parameters[2].Value.SetDouble(ipQtdeSomar);
  FppuAtualizarSaldoItemCommand.ExecuteUpdate;
end;

function TsmFuncoesEstoqueClient.fpuGetId(ipTabela: string): Integer;
begin
  if FfpuGetIdCommand = nil then
  begin
    FfpuGetIdCommand := FDBXConnection.CreateCommand;
    FfpuGetIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuGetIdCommand.Text := 'TsmFuncoesEstoque.fpuGetId';
    FfpuGetIdCommand.Prepare;
  end;
  FfpuGetIdCommand.Parameters[0].Value.SetWideString(ipTabela);
  FfpuGetIdCommand.ExecuteUpdate;
  Result := FfpuGetIdCommand.Parameters[1].Value.GetInt32;
end;

function TsmFuncoesEstoqueClient.fpuDataHoraAtual: string;
begin
  if FfpuDataHoraAtualCommand = nil then
  begin
    FfpuDataHoraAtualCommand := FDBXConnection.CreateCommand;
    FfpuDataHoraAtualCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuDataHoraAtualCommand.Text := 'TsmFuncoesEstoque.fpuDataHoraAtual';
    FfpuDataHoraAtualCommand.Prepare;
  end;
  FfpuDataHoraAtualCommand.ExecuteUpdate;
  Result := FfpuDataHoraAtualCommand.Parameters[0].Value.GetWideString;
end;

function TsmFuncoesEstoqueClient.fpuTestarConexao: Boolean;
begin
  if FfpuTestarConexaoCommand = nil then
  begin
    FfpuTestarConexaoCommand := FDBXConnection.CreateCommand;
    FfpuTestarConexaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuTestarConexaoCommand.Text := 'TsmFuncoesEstoque.fpuTestarConexao';
    FfpuTestarConexaoCommand.Prepare;
  end;
  FfpuTestarConexaoCommand.ExecuteUpdate;
  Result := FfpuTestarConexaoCommand.Parameters[0].Value.GetBoolean;
end;

function TsmFuncoesEstoqueClient.fpuVerificarAlteracao(ipTabela: string; ipUltimaSincronizacao: string): Boolean;
begin
  if FfpuVerificarAlteracaoCommand = nil then
  begin
    FfpuVerificarAlteracaoCommand := FDBXConnection.CreateCommand;
    FfpuVerificarAlteracaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuVerificarAlteracaoCommand.Text := 'TsmFuncoesEstoque.fpuVerificarAlteracao';
    FfpuVerificarAlteracaoCommand.Prepare;
  end;
  FfpuVerificarAlteracaoCommand.Parameters[0].Value.SetWideString(ipTabela);
  FfpuVerificarAlteracaoCommand.Parameters[1].Value.SetWideString(ipUltimaSincronizacao);
  FfpuVerificarAlteracaoCommand.ExecuteUpdate;
  Result := FfpuVerificarAlteracaoCommand.Parameters[2].Value.GetBoolean;
end;

procedure TsmFuncoesEstoqueClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TsmFuncoesEstoque.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;


constructor TsmFuncoesEstoqueClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TsmFuncoesEstoqueClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TsmFuncoesEstoqueClient.Destroy;
begin
  FfpuValidarNomeItemCommand.DisposeOf;
  FfpuValidarNomeLocalUsoCommand.DisposeOf;
  FfpuVerificarComprasJaGeradaCommand.DisposeOf;
  FfpuVerificarContaPagarJaGeradaCommand.DisposeOf;
  FfpuVerificarContaReceberJaGeradaCommand.DisposeOf;
  FfpuBuscarItensEntradaCommand.DisposeOf;
  FfpuBuscarItemEntradaCommand.DisposeOf;
  FfpuBuscarItensSaidaCommand.DisposeOf;
  FfpuBuscarItemSaidaCommand.DisposeOf;
  FppuAtualizarSaldoItemCommand.DisposeOf;
  FfpuGetIdCommand.DisposeOf;
  FfpuDataHoraAtualCommand.DisposeOf;
  FfpuTestarConexaoCommand.DisposeOf;
  FfpuVerificarAlteracaoCommand.DisposeOf;
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
end;

procedure TsmRelatorioClient.qPatrimonioCalcFields(DataSet: TDataSet);
begin
  if FqPatrimonioCalcFieldsCommand = nil then
  begin
    FqPatrimonioCalcFieldsCommand := FDBXConnection.CreateCommand;
    FqPatrimonioCalcFieldsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FqPatrimonioCalcFieldsCommand.Text := 'TsmRelatorio.qPatrimonioCalcFields';
    FqPatrimonioCalcFieldsCommand.Prepare;
  end;
  FqPatrimonioCalcFieldsCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FqPatrimonioCalcFieldsCommand.ExecuteUpdate;
end;

procedure TsmRelatorioClient.qView_Movimentacao_FinanceiraCalcFields(DataSet: TDataSet);
begin
  if FqView_Movimentacao_FinanceiraCalcFieldsCommand = nil then
  begin
    FqView_Movimentacao_FinanceiraCalcFieldsCommand := FDBXConnection.CreateCommand;
    FqView_Movimentacao_FinanceiraCalcFieldsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FqView_Movimentacao_FinanceiraCalcFieldsCommand.Text := 'TsmRelatorio.qView_Movimentacao_FinanceiraCalcFields';
    FqView_Movimentacao_FinanceiraCalcFieldsCommand.Prepare;
  end;
  FqView_Movimentacao_FinanceiraCalcFieldsCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FqView_Movimentacao_FinanceiraCalcFieldsCommand.ExecuteUpdate;
end;

procedure TsmRelatorioClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TsmRelatorio.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;


constructor TsmRelatorioClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TsmRelatorioClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TsmRelatorioClient.Destroy;
begin
  FqPatrimonioCalcFieldsCommand.DisposeOf;
  FqView_Movimentacao_FinanceiraCalcFieldsCommand.DisposeOf;
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
end;

function TsmFuncoesRelatorioClient.fpuGetId(ipTabela: string): Integer;
begin
  if FfpuGetIdCommand = nil then
  begin
    FfpuGetIdCommand := FDBXConnection.CreateCommand;
    FfpuGetIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuGetIdCommand.Text := 'TsmFuncoesRelatorio.fpuGetId';
    FfpuGetIdCommand.Prepare;
  end;
  FfpuGetIdCommand.Parameters[0].Value.SetWideString(ipTabela);
  FfpuGetIdCommand.ExecuteUpdate;
  Result := FfpuGetIdCommand.Parameters[1].Value.GetInt32;
end;

function TsmFuncoesRelatorioClient.fpuDataHoraAtual: string;
begin
  if FfpuDataHoraAtualCommand = nil then
  begin
    FfpuDataHoraAtualCommand := FDBXConnection.CreateCommand;
    FfpuDataHoraAtualCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuDataHoraAtualCommand.Text := 'TsmFuncoesRelatorio.fpuDataHoraAtual';
    FfpuDataHoraAtualCommand.Prepare;
  end;
  FfpuDataHoraAtualCommand.ExecuteUpdate;
  Result := FfpuDataHoraAtualCommand.Parameters[0].Value.GetWideString;
end;

function TsmFuncoesRelatorioClient.fpuTestarConexao: Boolean;
begin
  if FfpuTestarConexaoCommand = nil then
  begin
    FfpuTestarConexaoCommand := FDBXConnection.CreateCommand;
    FfpuTestarConexaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuTestarConexaoCommand.Text := 'TsmFuncoesRelatorio.fpuTestarConexao';
    FfpuTestarConexaoCommand.Prepare;
  end;
  FfpuTestarConexaoCommand.ExecuteUpdate;
  Result := FfpuTestarConexaoCommand.Parameters[0].Value.GetBoolean;
end;

function TsmFuncoesRelatorioClient.fpuVerificarAlteracao(ipTabela: string; ipUltimaSincronizacao: string): Boolean;
begin
  if FfpuVerificarAlteracaoCommand = nil then
  begin
    FfpuVerificarAlteracaoCommand := FDBXConnection.CreateCommand;
    FfpuVerificarAlteracaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuVerificarAlteracaoCommand.Text := 'TsmFuncoesRelatorio.fpuVerificarAlteracao';
    FfpuVerificarAlteracaoCommand.Prepare;
  end;
  FfpuVerificarAlteracaoCommand.Parameters[0].Value.SetWideString(ipTabela);
  FfpuVerificarAlteracaoCommand.Parameters[1].Value.SetWideString(ipUltimaSincronizacao);
  FfpuVerificarAlteracaoCommand.ExecuteUpdate;
  Result := FfpuVerificarAlteracaoCommand.Parameters[2].Value.GetBoolean;
end;

procedure TsmFuncoesRelatorioClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TsmFuncoesRelatorio.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;


constructor TsmFuncoesRelatorioClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TsmFuncoesRelatorioClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TsmFuncoesRelatorioClient.Destroy;
begin
  FfpuGetIdCommand.DisposeOf;
  FfpuDataHoraAtualCommand.DisposeOf;
  FfpuTestarConexaoCommand.DisposeOf;
  FfpuVerificarAlteracaoCommand.DisposeOf;
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
end;

procedure TsmSistemaClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TsmSistema.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;


constructor TsmSistemaClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TsmSistemaClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TsmSistemaClient.Destroy;
begin
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
end;

function TsmFuncoesSistemaClient.fpuValidarTipoNotificacao(ipIdNotificacao: Integer; ipTipo: Integer): Boolean;
begin
  if FfpuValidarTipoNotificacaoCommand = nil then
  begin
    FfpuValidarTipoNotificacaoCommand := FDBXConnection.CreateCommand;
    FfpuValidarTipoNotificacaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuValidarTipoNotificacaoCommand.Text := 'TsmFuncoesSistema.fpuValidarTipoNotificacao';
    FfpuValidarTipoNotificacaoCommand.Prepare;
  end;
  FfpuValidarTipoNotificacaoCommand.Parameters[0].Value.SetInt32(ipIdNotificacao);
  FfpuValidarTipoNotificacaoCommand.Parameters[1].Value.SetInt32(ipTipo);
  FfpuValidarTipoNotificacaoCommand.ExecuteUpdate;
  Result := FfpuValidarTipoNotificacaoCommand.Parameters[2].Value.GetBoolean;
end;

function TsmFuncoesSistemaClient.fpuVerificarNotificacoes(ipId: Integer; ipIdPessoa: Integer; ipTipo: Integer; ipNotificacaoEmail: Boolean; ipNotificacaoSistema: Boolean): TadsObjectlist<uTypes.TNotificacao>;
begin
  if FfpuVerificarNotificacoesCommand = nil then
  begin
    FfpuVerificarNotificacoesCommand := FDBXConnection.CreateCommand;
    FfpuVerificarNotificacoesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuVerificarNotificacoesCommand.Text := 'TsmFuncoesSistema.fpuVerificarNotificacoes';
    FfpuVerificarNotificacoesCommand.Prepare;
  end;
  FfpuVerificarNotificacoesCommand.Parameters[0].Value.SetInt32(ipId);
  FfpuVerificarNotificacoesCommand.Parameters[1].Value.SetInt32(ipIdPessoa);
  FfpuVerificarNotificacoesCommand.Parameters[2].Value.SetInt32(ipTipo);
  FfpuVerificarNotificacoesCommand.Parameters[3].Value.SetBoolean(ipNotificacaoEmail);
  FfpuVerificarNotificacoesCommand.Parameters[4].Value.SetBoolean(ipNotificacaoSistema);
  FfpuVerificarNotificacoesCommand.ExecuteUpdate;
  if not FfpuVerificarNotificacoesCommand.Parameters[5].Value.IsNull then
  begin
    FUnMarshal := TDBXClientCommand(FfpuVerificarNotificacoesCommand.Parameters[5].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TadsObjectlist<uTypes.TNotificacao>(FUnMarshal.UnMarshal(FfpuVerificarNotificacoesCommand.Parameters[5].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FfpuVerificarNotificacoesCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

procedure TsmFuncoesSistemaClient.ppuCriarAgendaPessoal(ipIdPessoa: Integer);
begin
  if FppuCriarAgendaPessoalCommand = nil then
  begin
    FppuCriarAgendaPessoalCommand := FDBXConnection.CreateCommand;
    FppuCriarAgendaPessoalCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FppuCriarAgendaPessoalCommand.Text := 'TsmFuncoesSistema.ppuCriarAgendaPessoal';
    FppuCriarAgendaPessoalCommand.Prepare;
  end;
  FppuCriarAgendaPessoalCommand.Parameters[0].Value.SetInt32(ipIdPessoa);
  FppuCriarAgendaPessoalCommand.ExecuteUpdate;
end;

function TsmFuncoesSistemaClient.fpuGetId(ipTabela: string): Integer;
begin
  if FfpuGetIdCommand = nil then
  begin
    FfpuGetIdCommand := FDBXConnection.CreateCommand;
    FfpuGetIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuGetIdCommand.Text := 'TsmFuncoesSistema.fpuGetId';
    FfpuGetIdCommand.Prepare;
  end;
  FfpuGetIdCommand.Parameters[0].Value.SetWideString(ipTabela);
  FfpuGetIdCommand.ExecuteUpdate;
  Result := FfpuGetIdCommand.Parameters[1].Value.GetInt32;
end;

function TsmFuncoesSistemaClient.fpuDataHoraAtual: string;
begin
  if FfpuDataHoraAtualCommand = nil then
  begin
    FfpuDataHoraAtualCommand := FDBXConnection.CreateCommand;
    FfpuDataHoraAtualCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuDataHoraAtualCommand.Text := 'TsmFuncoesSistema.fpuDataHoraAtual';
    FfpuDataHoraAtualCommand.Prepare;
  end;
  FfpuDataHoraAtualCommand.ExecuteUpdate;
  Result := FfpuDataHoraAtualCommand.Parameters[0].Value.GetWideString;
end;

function TsmFuncoesSistemaClient.fpuTestarConexao: Boolean;
begin
  if FfpuTestarConexaoCommand = nil then
  begin
    FfpuTestarConexaoCommand := FDBXConnection.CreateCommand;
    FfpuTestarConexaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuTestarConexaoCommand.Text := 'TsmFuncoesSistema.fpuTestarConexao';
    FfpuTestarConexaoCommand.Prepare;
  end;
  FfpuTestarConexaoCommand.ExecuteUpdate;
  Result := FfpuTestarConexaoCommand.Parameters[0].Value.GetBoolean;
end;

function TsmFuncoesSistemaClient.fpuVerificarAlteracao(ipTabela: string; ipUltimaSincronizacao: string): Boolean;
begin
  if FfpuVerificarAlteracaoCommand = nil then
  begin
    FfpuVerificarAlteracaoCommand := FDBXConnection.CreateCommand;
    FfpuVerificarAlteracaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuVerificarAlteracaoCommand.Text := 'TsmFuncoesSistema.fpuVerificarAlteracao';
    FfpuVerificarAlteracaoCommand.Prepare;
  end;
  FfpuVerificarAlteracaoCommand.Parameters[0].Value.SetWideString(ipTabela);
  FfpuVerificarAlteracaoCommand.Parameters[1].Value.SetWideString(ipUltimaSincronizacao);
  FfpuVerificarAlteracaoCommand.ExecuteUpdate;
  Result := FfpuVerificarAlteracaoCommand.Parameters[2].Value.GetBoolean;
end;

procedure TsmFuncoesSistemaClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FDBXConnection.CreateCommand;
    FDSServerModuleCreateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDSServerModuleCreateCommand.Text := 'TsmFuncoesSistema.DSServerModuleCreate';
    FDSServerModuleCreateCommand.Prepare;
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.ExecuteUpdate;
end;


constructor TsmFuncoesSistemaClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TsmFuncoesSistemaClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TsmFuncoesSistemaClient.Destroy;
begin
  FfpuValidarTipoNotificacaoCommand.DisposeOf;
  FfpuVerificarNotificacoesCommand.DisposeOf;
  FppuCriarAgendaPessoalCommand.DisposeOf;
  FfpuGetIdCommand.DisposeOf;
  FfpuDataHoraAtualCommand.DisposeOf;
  FfpuTestarConexaoCommand.DisposeOf;
  FfpuVerificarAlteracaoCommand.DisposeOf;
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
end;

end.

