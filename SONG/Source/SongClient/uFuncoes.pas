//
// Created by the DataSnap proxy generator.
// 15/02/2016 22:46:10
//

unit uFuncoes;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

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
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function fpuVerificarNovaVersao(ipVersaoAtual: string): string;
    function fpuGetId(ipTabela: string): Integer;
    function fpuBaixarAtualizacao(ipVersao: string): TStream;
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
    FfpuValidarNomeFinanciadorCommand: TDBXCommand;
    FfpuValidarLoginCommand: TDBXCommand;
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function fpuPermissoesUsuario(ipLogin: string): OleVariant;
    function fpuValidarNomeFinanciador(ipIdFinanciador: Integer; ipNome: string): Boolean;
    function fpuValidarLogin(ipId: Integer; ipLogin: string): Boolean;
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

function TsmFuncoesAdministrativoClient.fpuValidarNomeFinanciador(ipIdFinanciador: Integer; ipNome: string): Boolean;
begin
  if FfpuValidarNomeFinanciadorCommand = nil then
  begin
    FfpuValidarNomeFinanciadorCommand := FDBXConnection.CreateCommand;
    FfpuValidarNomeFinanciadorCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuValidarNomeFinanciadorCommand.Text := 'TsmFuncoesAdministrativo.fpuValidarNomeFinanciador';
    FfpuValidarNomeFinanciadorCommand.Prepare;
  end;
  FfpuValidarNomeFinanciadorCommand.Parameters[0].Value.SetInt32(ipIdFinanciador);
  FfpuValidarNomeFinanciadorCommand.Parameters[1].Value.SetWideString(ipNome);
  FfpuValidarNomeFinanciadorCommand.ExecuteUpdate;
  Result := FfpuValidarNomeFinanciadorCommand.Parameters[2].Value.GetBoolean;
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
  FfpuValidarNomeFinanciadorCommand.DisposeOf;
  FfpuValidarLoginCommand.DisposeOf;
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
end;

end.

