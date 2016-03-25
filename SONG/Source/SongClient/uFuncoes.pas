//
// Created by the DataSnap proxy generator.
// 25/03/2016 17:08:39
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
    FfpuInfoPessoaCommand: TDBXCommand;
    FppuValidarFinalizarAtividadeCommand: TDBXCommand;
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function fpuPermissoesUsuario(ipLogin: string): OleVariant;
    function fpuValidarFinanciadorFornecedorCliente(ipId: Integer; ipTipo: Integer; ipRazaoSocial: string; ipNomeFantasia: string; ipCpfCnpj: string): string;
    function fpuValidarLogin(ipId: Integer; ipLogin: string): Boolean;
    function fpuValidarNomeProjeto(ipIdProjeto: Integer; ipNome: string): Boolean;
    function fpuInfoPessoa(ipLogin: string): TPessoa;
    procedure ppuValidarFinalizarAtividade(ipIdAtividade: Integer);
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
    FppuAtualizarEstoqueLoteSementeCommand: TDBXCommand;
    FfpuValidarNomeMatrizCommand: TDBXCommand;
    FfpuValidarNomeCanteiroCommand: TDBXCommand;
    FppuValidarSemeaduraCommand: TDBXCommand;
    FppuFinalizarEtapaGerminacaoLoteCommand: TDBXCommand;
    FppuReiniciarEtapaGerminacaoLoteCommand: TDBXCommand;
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
    procedure ppuAtualizarEstoqueLoteSemente(ipIdLote: Integer);
    function fpuValidarNomeMatriz(ipId: Integer; ipNome: string): Boolean;
    function fpuValidarNomeCanteiro(ipId: Integer; ipNome: string): Boolean;
    procedure ppuValidarSemeadura(ipIdLote: Integer; ipIdSemeadura: Integer; ipQtdeSemeada: Double);
    procedure ppuFinalizarEtapaGerminacaoLote(ipIdLote: Integer);
    procedure ppuReiniciarEtapaGerminacaoLote(ipId: Integer);
    function fpuGetId(ipTabela: string): Integer;
    function fpuDataHoraAtual: string;
    procedure DSServerModuleCreate(Sender: TObject);
  end;

  TsmFuncoesFinanceiroClient = class(TDSAdminClient)
  private
    FfpuVerificarDependenciasPlanoContaCommand: TDBXCommand;
    FfpuGerarIdentificadorCommand: TDBXCommand;
    FfpuGetIdCommand: TDBXCommand;
    FfpuDataHoraAtualCommand: TDBXCommand;
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function fpuVerificarDependenciasPlanoConta(ipIdentificador: string): Boolean;
    function fpuGerarIdentificador(ipIdConta: Integer): string;
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

function TsmFuncoesAdministrativoClient.fpuValidarFinanciadorFornecedorCliente(ipId: Integer; ipTipo: Integer; ipRazaoSocial: string; ipNomeFantasia: string; ipCpfCnpj: string): string;
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
  FfpuValidarFinanciadorFornecedorClienteCommand.Parameters[3].Value.SetWideString(ipNomeFantasia);
  FfpuValidarFinanciadorFornecedorClienteCommand.Parameters[4].Value.SetWideString(ipCpfCnpj);
  FfpuValidarFinanciadorFornecedorClienteCommand.ExecuteUpdate;
  Result := FfpuValidarFinanciadorFornecedorClienteCommand.Parameters[5].Value.GetWideString;
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
  FfpuInfoPessoaCommand.DisposeOf;
  FppuValidarFinalizarAtividadeCommand.DisposeOf;
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

procedure TsmFuncoesViveiroClient.ppuAtualizarEstoqueLoteSemente(ipIdLote: Integer);
begin
  if FppuAtualizarEstoqueLoteSementeCommand = nil then
  begin
    FppuAtualizarEstoqueLoteSementeCommand := FDBXConnection.CreateCommand;
    FppuAtualizarEstoqueLoteSementeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FppuAtualizarEstoqueLoteSementeCommand.Text := 'TsmFuncoesViveiro.ppuAtualizarEstoqueLoteSemente';
    FppuAtualizarEstoqueLoteSementeCommand.Prepare;
  end;
  FppuAtualizarEstoqueLoteSementeCommand.Parameters[0].Value.SetInt32(ipIdLote);
  FppuAtualizarEstoqueLoteSementeCommand.ExecuteUpdate;
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
  FppuAtualizarEstoqueLoteSementeCommand.DisposeOf;
  FfpuValidarNomeMatrizCommand.DisposeOf;
  FfpuValidarNomeCanteiroCommand.DisposeOf;
  FppuValidarSemeaduraCommand.DisposeOf;
  FppuFinalizarEtapaGerminacaoLoteCommand.DisposeOf;
  FppuReiniciarEtapaGerminacaoLoteCommand.DisposeOf;
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

function TsmFuncoesFinanceiroClient.fpuGerarIdentificador(ipIdConta: Integer): string;
begin
  if FfpuGerarIdentificadorCommand = nil then
  begin
    FfpuGerarIdentificadorCommand := FDBXConnection.CreateCommand;
    FfpuGerarIdentificadorCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuGerarIdentificadorCommand.Text := 'TsmFuncoesFinanceiro.fpuGerarIdentificador';
    FfpuGerarIdentificadorCommand.Prepare;
  end;
  FfpuGerarIdentificadorCommand.Parameters[0].Value.SetInt32(ipIdConta);
  FfpuGerarIdentificadorCommand.ExecuteUpdate;
  Result := FfpuGerarIdentificadorCommand.Parameters[1].Value.GetWideString;
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
  FfpuGerarIdentificadorCommand.DisposeOf;
  FfpuGetIdCommand.DisposeOf;
  FfpuDataHoraAtualCommand.DisposeOf;
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
end;

end.

