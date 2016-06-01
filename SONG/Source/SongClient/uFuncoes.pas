//
// Created by the DataSnap proxy generator.
// 31/05/2016 23:56:39
//

unit uFuncoes;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, uControleAcesso, Data.DBXJSONReflect;

type
  TsmAdministrativoClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
  end;

  TsmFuncoesGeralClient = class(TDSAdminClient)
  private
    FfpuVerificarNovaVersaoCommand: TDBXCommand;
    FfpuBaixarAtualizacaoCommand: TDBXCommand;
    FfpuGetIdCommand: TDBXCommand;
    FfpuDataHoraAtualCommand: TDBXCommand;
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function fpuVerificarNovaVersao(ipVersaoAtual: string): string;
    function fpuBaixarAtualizacao(ipVersao: string): TStream;
    function fpuGetId(ipTabela: string): Integer;
    function fpuDataHoraAtual: string;
    procedure DSServerModuleCreate(Sender: TObject);
  end;

  TsmLookupClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
  end;

  TsmFuncoesAdministrativoClient = class(TDSAdminClient)
  private
    FfpuPermissoesUsuarioCommand: TDBXCommand;
    FfpuValidarFinanciadorFornecedorClienteCommand: TDBXCommand;
    FfpuValidarLoginCommand: TDBXCommand;
    FfpuValidarNomeProjetoCommand: TDBXCommand;
    FfpuValidarNomeAreaProjetoCommand: TDBXCommand;
    FfpuInfoPessoaCommand: TDBXCommand;
    FppuValidarFinalizarAtividadeCommand: TDBXCommand;
    FfpuValidarNomeCpfPessoaCommand: TDBXCommand;
    FfpuSomaOrcamentoRubricaCommand: TDBXCommand;
    FfpuSomaPagametosFinanciadorCommand: TDBXCommand;
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function fpuPermissoesUsuario(ipLogin: string): OleVariant;
    function fpuValidarFinanciadorFornecedorCliente(ipId: Integer; ipTipo: Integer; ipRazaoSocial: string; ipCpfCnpj: string): Boolean;
    function fpuValidarLogin(ipId: Integer; ipLogin: string): Boolean;
    function fpuValidarNomeProjeto(ipIdProjeto: Integer; ipNome: string): Boolean;
    function fpuValidarNomeAreaProjeto(ipIdProjeto: Integer; ipIdAreaProjeto: Integer; ipNome: string): Boolean;
    function fpuInfoPessoa(ipLogin: string): TPessoa;
    procedure ppuValidarFinalizarAtividade(ipIdAtividade: Integer);
    function fpuValidarNomeCpfPessoa(ipIdPessoa: Integer; ipNome: string; ipCpf: string): Boolean;
    function fpuSomaOrcamentoRubrica(ipIdProjeto: Integer): Double;
    function fpuSomaPagametosFinanciador(ipIdProjetoFinanciador: Integer): Double;
    procedure DSServerModuleCreate(Sender: TObject);
  end;

  TsmFinanceiroClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
  end;

  TsmViveiroClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
  end;

  TsmFuncoesViveiroClient = class(TDSAdminClient)
  private
    FfpuCalcularQuantidadeSementeCommand: TDBXCommand;
    FfpuCalcularTaxaGerminacaoLoteCommand: TDBXCommand;
    FppuAtualizarTaxaGerminacaoLoteCommand: TDBXCommand;
    FppuAtualizarTaxaClassificacaoMudaCommand: TDBXCommand;
    FfpuValidarNomeMatrizCommand: TDBXCommand;
    FfpuValidarNomeCanteiroCommand: TDBXCommand;
    FppuValidarSemeaduraCommand: TDBXCommand;
    FppuFinalizarEtapaGerminacaoLoteCommand: TDBXCommand;
    FppuReiniciarEtapaGerminacaoLoteCommand: TDBXCommand;
    FppuAtualizarQtdeSementeEstoqueCommand: TDBXCommand;
    FppuAtualizarQtdeMudaEstoqueCommand: TDBXCommand;
    FfpuBuscarLotesMudasCommand: TDBXCommand;
    FfpuBuscarLoteMudaCommand: TDBXCommand;
    FfpuBuscarLotesSementesCommand: TDBXCommand;
    FfpuBuscarLoteSementeCommand: TDBXCommand;
    FppuAjustarSaldoEspecieCommand: TDBXCommand;
    FfpuGetIdCommand: TDBXCommand;
    FfpuDataHoraAtualCommand: TDBXCommand;
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function fpuCalcularQuantidadeSemente(ipIdEspecie: Integer; ipQtdeKg: Double): Integer;
    function fpuCalcularTaxaGerminacaoLote(ipIdLote: Integer): Double;
    procedure ppuAtualizarTaxaGerminacaoLote(ipIdLote: Integer);
    procedure ppuAtualizarTaxaClassificacaoMuda(ipIdLote: Integer);
    function fpuValidarNomeMatriz(ipId: Integer; ipNome: string): Boolean;
    function fpuValidarNomeCanteiro(ipId: Integer; ipNome: string): Boolean;
    procedure ppuValidarSemeadura(ipIdLote: Integer; ipIdSemeadura: Integer; ipQtdeSemeada: Double);
    procedure ppuFinalizarEtapaGerminacaoLote(ipIdLote: Integer);
    procedure ppuReiniciarEtapaGerminacaoLote(ipId: Integer);
    procedure ppuAtualizarQtdeSementeEstoque(ipIdEspecie: Integer; ipIdLote: Integer; ipQtdeSubtrair: Double; ipQtdeSomar: Double);
    procedure ppuAtualizarQtdeMudaEstoque(ipIdEspecie: Integer; ipIdLote: Integer; ipQtdeSubtrair: Integer; ipQtdeSomar: Integer);
    function fpuBuscarLotesMudas(ipIdCompra: Integer): string;
    function fpuBuscarLoteMuda(ipIdCompraItem: Integer): Integer;
    function fpuBuscarLotesSementes(ipIdCompra: Integer): string;
    function fpuBuscarLoteSemente(ipIdCompraItem: Integer): Integer;
    procedure ppuAjustarSaldoEspecie(ipIdEspecie: Integer);
    function fpuGetId(ipTabela: string): Integer;
    function fpuDataHoraAtual: string;
    procedure DSServerModuleCreate(Sender: TObject);
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
    FfpuGetIdCommand: TDBXCommand;
    FfpuDataHoraAtualCommand: TDBXCommand;
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function fpuVerificarDependenciasPlanoConta(ipIdentificador: string): Boolean;
    function fpuVerificarDependenciasRubrica(ipIdentificador: string): Boolean;
    function fpuGerarIdentificadorPlanoContas(ipIdConta: Integer): string;
    function fpuGerarIdentificadorRubrica(ipIdRubrica: Integer): string;
    procedure ppuQuitarParcela(ipIdParcela: Integer; ipDataPagamento: string);
    procedure ppuReabrirParcela(ipIdParcela: Integer);
    procedure ppuReabrirTodasParcelasContaPagar(ipIdContaPagar: Integer);
    procedure ppuReceberParcela(ipIdParcela: Integer);
    procedure ppuCancelarRecebimentoParcela(ipIdParcela: Integer);
    procedure ppuCancelarTodosRecebimentosContaReceber(ipIdContaReceber: Integer);
    function fpuSaldoRealRubrica(ipIdProjeto: Integer; ipIdRubrica: Integer): Double;
    function fpuGetId(ipTabela: string): Integer;
    function fpuDataHoraAtual: string;
    procedure DSServerModuleCreate(Sender: TObject);
  end;

  TsmEstoqueClient = class(TDSAdminClient)
  private
    FqSaida_ItemCalcFieldsCommand: TDBXCommand;
    FqVenda_ItemCalcFieldsCommand: TDBXCommand;
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure qSaida_ItemCalcFields(DataSet: TDataSet);
    procedure qVenda_ItemCalcFields(DataSet: TDataSet);
    procedure DSServerModuleCreate(Sender: TObject);
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
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function fpuValidarNomeItem(ipIdItem: Integer; ipNome: string): Boolean;
    function fpuValidarNomeLocalUso(ipIdLocalUso: Integer; ipNome: string): Boolean;
    function fpuVerificarComprasJaGerada(ipIdSolicitacao: Integer): Boolean;
    function fpuVerificarContaPagarJaGerada(ipIdCompra: Integer): Boolean;
    function fpuVerificarContaReceberJaGerada(ipIdVenda: Integer): Boolean;
    function fpuBuscarItensEntrada(ipIdCompra: Integer): string;
    function fpuBuscarItemEntrada(ipIdCompraItem: Integer): Integer;
    function fpuBuscarItensSaida(ipIdVenda: Integer): string;
    function fpuBuscarItemSaida(ipIdVendaItem: Integer): Integer;
    procedure ppuAtualizarSaldoItem(ipIdItem: Integer; ipQtdeSubtrair: Double; ipQtdeSomar: Double);
    function fpuGetId(ipTabela: string): Integer;
    function fpuDataHoraAtual: string;
    procedure DSServerModuleCreate(Sender: TObject);
  end;

  TsmRelatorioClient = class(TDSAdminClient)
  private
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
  end;

  TsmFuncoesRelatorioClient = class(TDSAdminClient)
  private
    FfpuMovimentacaoFinanceiraCommand: TDBXCommand;
    FfpuSaldoCommand: TDBXCommand;
    FfpuGetIdCommand: TDBXCommand;
    FfpuDataHoraAtualCommand: TDBXCommand;
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function fpuMovimentacaoFinanceira(ipIdOrganizacao: Integer; ipIdProjeto: Integer; ipIdFundo: Integer; ipDataInicial: string; ipDataFinal: string; ipReceitas: Boolean; ipDespesas: Boolean; ipSomenteRegistroAberto: Boolean): OleVariant;
    function fpuSaldo(ipIdOrganizacao: Integer; ipIdProjeto: Integer; ipIdFundo: Integer): OleVariant;
    function fpuGetId(ipTabela: string): Integer;
    function fpuDataHoraAtual: string;
    procedure DSServerModuleCreate(Sender: TObject);
  end;

implementation

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

function TsmFuncoesAdministrativoClient.fpuValidarNomeAreaProjeto(ipIdProjeto: Integer; ipIdAreaProjeto: Integer; ipNome: string): Boolean;
begin
  if FfpuValidarNomeAreaProjetoCommand = nil then
  begin
    FfpuValidarNomeAreaProjetoCommand := FDBXConnection.CreateCommand;
    FfpuValidarNomeAreaProjetoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuValidarNomeAreaProjetoCommand.Text := 'TsmFuncoesAdministrativo.fpuValidarNomeAreaProjeto';
    FfpuValidarNomeAreaProjetoCommand.Prepare;
  end;
  FfpuValidarNomeAreaProjetoCommand.Parameters[0].Value.SetInt32(ipIdProjeto);
  FfpuValidarNomeAreaProjetoCommand.Parameters[1].Value.SetInt32(ipIdAreaProjeto);
  FfpuValidarNomeAreaProjetoCommand.Parameters[2].Value.SetWideString(ipNome);
  FfpuValidarNomeAreaProjetoCommand.ExecuteUpdate;
  Result := FfpuValidarNomeAreaProjetoCommand.Parameters[3].Value.GetBoolean;
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
  FfpuValidarNomeAreaProjetoCommand.DisposeOf;
  FfpuInfoPessoaCommand.DisposeOf;
  FppuValidarFinalizarAtividadeCommand.DisposeOf;
  FfpuValidarNomeCpfPessoaCommand.DisposeOf;
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

function TsmFuncoesViveiroClient.fpuCalcularQuantidadeSemente(ipIdEspecie: Integer; ipQtdeKg: Double): Integer;
begin
  if FfpuCalcularQuantidadeSementeCommand = nil then
  begin
    FfpuCalcularQuantidadeSementeCommand := FDBXConnection.CreateCommand;
    FfpuCalcularQuantidadeSementeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuCalcularQuantidadeSementeCommand.Text := 'TsmFuncoesViveiro.fpuCalcularQuantidadeSemente';
    FfpuCalcularQuantidadeSementeCommand.Prepare;
  end;
  FfpuCalcularQuantidadeSementeCommand.Parameters[0].Value.SetInt32(ipIdEspecie);
  FfpuCalcularQuantidadeSementeCommand.Parameters[1].Value.SetDouble(ipQtdeKg);
  FfpuCalcularQuantidadeSementeCommand.ExecuteUpdate;
  Result := FfpuCalcularQuantidadeSementeCommand.Parameters[2].Value.GetInt32;
end;

function TsmFuncoesViveiroClient.fpuCalcularTaxaGerminacaoLote(ipIdLote: Integer): Double;
begin
  if FfpuCalcularTaxaGerminacaoLoteCommand = nil then
  begin
    FfpuCalcularTaxaGerminacaoLoteCommand := FDBXConnection.CreateCommand;
    FfpuCalcularTaxaGerminacaoLoteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuCalcularTaxaGerminacaoLoteCommand.Text := 'TsmFuncoesViveiro.fpuCalcularTaxaGerminacaoLote';
    FfpuCalcularTaxaGerminacaoLoteCommand.Prepare;
  end;
  FfpuCalcularTaxaGerminacaoLoteCommand.Parameters[0].Value.SetInt32(ipIdLote);
  FfpuCalcularTaxaGerminacaoLoteCommand.ExecuteUpdate;
  Result := FfpuCalcularTaxaGerminacaoLoteCommand.Parameters[1].Value.GetDouble;
end;

procedure TsmFuncoesViveiroClient.ppuAtualizarTaxaGerminacaoLote(ipIdLote: Integer);
begin
  if FppuAtualizarTaxaGerminacaoLoteCommand = nil then
  begin
    FppuAtualizarTaxaGerminacaoLoteCommand := FDBXConnection.CreateCommand;
    FppuAtualizarTaxaGerminacaoLoteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FppuAtualizarTaxaGerminacaoLoteCommand.Text := 'TsmFuncoesViveiro.ppuAtualizarTaxaGerminacaoLote';
    FppuAtualizarTaxaGerminacaoLoteCommand.Prepare;
  end;
  FppuAtualizarTaxaGerminacaoLoteCommand.Parameters[0].Value.SetInt32(ipIdLote);
  FppuAtualizarTaxaGerminacaoLoteCommand.ExecuteUpdate;
end;

procedure TsmFuncoesViveiroClient.ppuAtualizarTaxaClassificacaoMuda(ipIdLote: Integer);
begin
  if FppuAtualizarTaxaClassificacaoMudaCommand = nil then
  begin
    FppuAtualizarTaxaClassificacaoMudaCommand := FDBXConnection.CreateCommand;
    FppuAtualizarTaxaClassificacaoMudaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FppuAtualizarTaxaClassificacaoMudaCommand.Text := 'TsmFuncoesViveiro.ppuAtualizarTaxaClassificacaoMuda';
    FppuAtualizarTaxaClassificacaoMudaCommand.Prepare;
  end;
  FppuAtualizarTaxaClassificacaoMudaCommand.Parameters[0].Value.SetInt32(ipIdLote);
  FppuAtualizarTaxaClassificacaoMudaCommand.ExecuteUpdate;
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

procedure TsmFuncoesViveiroClient.ppuFinalizarEtapaGerminacaoLote(ipIdLote: Integer);
begin
  if FppuFinalizarEtapaGerminacaoLoteCommand = nil then
  begin
    FppuFinalizarEtapaGerminacaoLoteCommand := FDBXConnection.CreateCommand;
    FppuFinalizarEtapaGerminacaoLoteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FppuFinalizarEtapaGerminacaoLoteCommand.Text := 'TsmFuncoesViveiro.ppuFinalizarEtapaGerminacaoLote';
    FppuFinalizarEtapaGerminacaoLoteCommand.Prepare;
  end;
  FppuFinalizarEtapaGerminacaoLoteCommand.Parameters[0].Value.SetInt32(ipIdLote);
  FppuFinalizarEtapaGerminacaoLoteCommand.ExecuteUpdate;
end;

procedure TsmFuncoesViveiroClient.ppuReiniciarEtapaGerminacaoLote(ipId: Integer);
begin
  if FppuReiniciarEtapaGerminacaoLoteCommand = nil then
  begin
    FppuReiniciarEtapaGerminacaoLoteCommand := FDBXConnection.CreateCommand;
    FppuReiniciarEtapaGerminacaoLoteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FppuReiniciarEtapaGerminacaoLoteCommand.Text := 'TsmFuncoesViveiro.ppuReiniciarEtapaGerminacaoLote';
    FppuReiniciarEtapaGerminacaoLoteCommand.Prepare;
  end;
  FppuReiniciarEtapaGerminacaoLoteCommand.Parameters[0].Value.SetInt32(ipId);
  FppuReiniciarEtapaGerminacaoLoteCommand.ExecuteUpdate;
end;

procedure TsmFuncoesViveiroClient.ppuAtualizarQtdeSementeEstoque(ipIdEspecie: Integer; ipIdLote: Integer; ipQtdeSubtrair: Double; ipQtdeSomar: Double);
begin
  if FppuAtualizarQtdeSementeEstoqueCommand = nil then
  begin
    FppuAtualizarQtdeSementeEstoqueCommand := FDBXConnection.CreateCommand;
    FppuAtualizarQtdeSementeEstoqueCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FppuAtualizarQtdeSementeEstoqueCommand.Text := 'TsmFuncoesViveiro.ppuAtualizarQtdeSementeEstoque';
    FppuAtualizarQtdeSementeEstoqueCommand.Prepare;
  end;
  FppuAtualizarQtdeSementeEstoqueCommand.Parameters[0].Value.SetInt32(ipIdEspecie);
  FppuAtualizarQtdeSementeEstoqueCommand.Parameters[1].Value.SetInt32(ipIdLote);
  FppuAtualizarQtdeSementeEstoqueCommand.Parameters[2].Value.SetDouble(ipQtdeSubtrair);
  FppuAtualizarQtdeSementeEstoqueCommand.Parameters[3].Value.SetDouble(ipQtdeSomar);
  FppuAtualizarQtdeSementeEstoqueCommand.ExecuteUpdate;
end;

procedure TsmFuncoesViveiroClient.ppuAtualizarQtdeMudaEstoque(ipIdEspecie: Integer; ipIdLote: Integer; ipQtdeSubtrair: Integer; ipQtdeSomar: Integer);
begin
  if FppuAtualizarQtdeMudaEstoqueCommand = nil then
  begin
    FppuAtualizarQtdeMudaEstoqueCommand := FDBXConnection.CreateCommand;
    FppuAtualizarQtdeMudaEstoqueCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FppuAtualizarQtdeMudaEstoqueCommand.Text := 'TsmFuncoesViveiro.ppuAtualizarQtdeMudaEstoque';
    FppuAtualizarQtdeMudaEstoqueCommand.Prepare;
  end;
  FppuAtualizarQtdeMudaEstoqueCommand.Parameters[0].Value.SetInt32(ipIdEspecie);
  FppuAtualizarQtdeMudaEstoqueCommand.Parameters[1].Value.SetInt32(ipIdLote);
  FppuAtualizarQtdeMudaEstoqueCommand.Parameters[2].Value.SetInt32(ipQtdeSubtrair);
  FppuAtualizarQtdeMudaEstoqueCommand.Parameters[3].Value.SetInt32(ipQtdeSomar);
  FppuAtualizarQtdeMudaEstoqueCommand.ExecuteUpdate;
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
  FfpuCalcularQuantidadeSementeCommand.DisposeOf;
  FfpuCalcularTaxaGerminacaoLoteCommand.DisposeOf;
  FppuAtualizarTaxaGerminacaoLoteCommand.DisposeOf;
  FppuAtualizarTaxaClassificacaoMudaCommand.DisposeOf;
  FfpuValidarNomeMatrizCommand.DisposeOf;
  FfpuValidarNomeCanteiroCommand.DisposeOf;
  FppuValidarSemeaduraCommand.DisposeOf;
  FppuFinalizarEtapaGerminacaoLoteCommand.DisposeOf;
  FppuReiniciarEtapaGerminacaoLoteCommand.DisposeOf;
  FppuAtualizarQtdeSementeEstoqueCommand.DisposeOf;
  FppuAtualizarQtdeMudaEstoqueCommand.DisposeOf;
  FfpuBuscarLotesMudasCommand.DisposeOf;
  FfpuBuscarLoteMudaCommand.DisposeOf;
  FfpuBuscarLotesSementesCommand.DisposeOf;
  FfpuBuscarLoteSementeCommand.DisposeOf;
  FppuAjustarSaldoEspecieCommand.DisposeOf;
  FfpuGetIdCommand.DisposeOf;
  FfpuDataHoraAtualCommand.DisposeOf;
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
  FfpuGetIdCommand.DisposeOf;
  FfpuDataHoraAtualCommand.DisposeOf;
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
end;

procedure TsmEstoqueClient.qSaida_ItemCalcFields(DataSet: TDataSet);
begin
  if FqSaida_ItemCalcFieldsCommand = nil then
  begin
    FqSaida_ItemCalcFieldsCommand := FDBXConnection.CreateCommand;
    FqSaida_ItemCalcFieldsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FqSaida_ItemCalcFieldsCommand.Text := 'TsmEstoque.qSaida_ItemCalcFields';
    FqSaida_ItemCalcFieldsCommand.Prepare;
  end;
  FqSaida_ItemCalcFieldsCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FqSaida_ItemCalcFieldsCommand.ExecuteUpdate;
end;

procedure TsmEstoqueClient.qVenda_ItemCalcFields(DataSet: TDataSet);
begin
  if FqVenda_ItemCalcFieldsCommand = nil then
  begin
    FqVenda_ItemCalcFieldsCommand := FDBXConnection.CreateCommand;
    FqVenda_ItemCalcFieldsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FqVenda_ItemCalcFieldsCommand.Text := 'TsmEstoque.qVenda_ItemCalcFields';
    FqVenda_ItemCalcFieldsCommand.Prepare;
  end;
  FqVenda_ItemCalcFieldsCommand.Parameters[0].Value.SetDBXReader(TDBXDataSetReader.Create(DataSet, FInstanceOwner), True);
  FqVenda_ItemCalcFieldsCommand.ExecuteUpdate;
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
  FqSaida_ItemCalcFieldsCommand.DisposeOf;
  FqVenda_ItemCalcFieldsCommand.DisposeOf;
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
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
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
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
end;

function TsmFuncoesRelatorioClient.fpuMovimentacaoFinanceira(ipIdOrganizacao: Integer; ipIdProjeto: Integer; ipIdFundo: Integer; ipDataInicial: string; ipDataFinal: string; ipReceitas: Boolean; ipDespesas: Boolean; ipSomenteRegistroAberto: Boolean): OleVariant;
begin
  if FfpuMovimentacaoFinanceiraCommand = nil then
  begin
    FfpuMovimentacaoFinanceiraCommand := FDBXConnection.CreateCommand;
    FfpuMovimentacaoFinanceiraCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuMovimentacaoFinanceiraCommand.Text := 'TsmFuncoesRelatorio.fpuMovimentacaoFinanceira';
    FfpuMovimentacaoFinanceiraCommand.Prepare;
  end;
  FfpuMovimentacaoFinanceiraCommand.Parameters[0].Value.SetInt32(ipIdOrganizacao);
  FfpuMovimentacaoFinanceiraCommand.Parameters[1].Value.SetInt32(ipIdProjeto);
  FfpuMovimentacaoFinanceiraCommand.Parameters[2].Value.SetInt32(ipIdFundo);
  FfpuMovimentacaoFinanceiraCommand.Parameters[3].Value.SetWideString(ipDataInicial);
  FfpuMovimentacaoFinanceiraCommand.Parameters[4].Value.SetWideString(ipDataFinal);
  FfpuMovimentacaoFinanceiraCommand.Parameters[5].Value.SetBoolean(ipReceitas);
  FfpuMovimentacaoFinanceiraCommand.Parameters[6].Value.SetBoolean(ipDespesas);
  FfpuMovimentacaoFinanceiraCommand.Parameters[7].Value.SetBoolean(ipSomenteRegistroAberto);
  FfpuMovimentacaoFinanceiraCommand.ExecuteUpdate;
  Result := FfpuMovimentacaoFinanceiraCommand.Parameters[8].Value.AsVariant;
end;

function TsmFuncoesRelatorioClient.fpuSaldo(ipIdOrganizacao: Integer; ipIdProjeto: Integer; ipIdFundo: Integer): OleVariant;
begin
  if FfpuSaldoCommand = nil then
  begin
    FfpuSaldoCommand := FDBXConnection.CreateCommand;
    FfpuSaldoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuSaldoCommand.Text := 'TsmFuncoesRelatorio.fpuSaldo';
    FfpuSaldoCommand.Prepare;
  end;
  FfpuSaldoCommand.Parameters[0].Value.SetInt32(ipIdOrganizacao);
  FfpuSaldoCommand.Parameters[1].Value.SetInt32(ipIdProjeto);
  FfpuSaldoCommand.Parameters[2].Value.SetInt32(ipIdFundo);
  FfpuSaldoCommand.ExecuteUpdate;
  Result := FfpuSaldoCommand.Parameters[3].Value.AsVariant;
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
  FfpuMovimentacaoFinanceiraCommand.DisposeOf;
  FfpuSaldoCommand.DisposeOf;
  FfpuGetIdCommand.DisposeOf;
  FfpuDataHoraAtualCommand.DisposeOf;
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
end;

end.

