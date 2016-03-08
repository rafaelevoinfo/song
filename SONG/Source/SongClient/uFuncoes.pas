//
// Created by the DataSnap proxy generator.
// 07/03/2016 23:59:38
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
    FfpuGetIdCommand: TDBXCommand;
    FfpuBaixarAtualizacaoCommand: TDBXCommand;
    FfpuDataHoraAtualCommand: TDBXCommand;
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function fpuVerificarNovaVersao(ipVersaoAtual: string): string;
    function fpuGetId(ipTabela: string): Integer;
    function fpuBaixarAtualizacao(ipVersao: string): TStream;
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
  FfpuGetIdCommand.DisposeOf;
  FfpuBaixarAtualizacaoCommand.DisposeOf;
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

end.

