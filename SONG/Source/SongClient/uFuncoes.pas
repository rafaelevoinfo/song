//
// Created by the DataSnap proxy generator.
// 05/02/2016 23:33:41
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
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function fpuVerificarNovaVersao(ipVersaoAtual: string): string;
    function fpuGetId(ipTabela: string): Integer;
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
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function fpuPermissoesUsuario(ipLogin: string): OleVariant;
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
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
end;

end.

