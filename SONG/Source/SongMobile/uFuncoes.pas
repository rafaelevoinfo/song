//
// Created by the DataSnap proxy generator.
// 28/02/2017 18:07:05
//

unit uFuncoes;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, aduna_ds_list, Data.DBXJSONReflect, uTypes;

type
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
    FfpuVerificarLoteMudaExisteCommand: TDBXCommand;
    FfpuSincronizarEspeciesCommand: TDBXCommand;
    FfpuSincronizarMatrizesCommand: TDBXCommand;
    FppuCadastrarLotesCommand: TDBXCommand;
    FfpuGetIdCommand: TDBXCommand;
    FfpuDataHoraAtualCommand: TDBXCommand;
    FfpuTestarConexaoCommand: TDBXCommand;
    FfpuVerificarAlteracaoCommand: TDBXCommand;
    FppuEnviarEmailCommand: TDBXCommand;
    FDSServerModuleCreateCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function fpuValidarNomeMatriz(ipId: Integer; ipNome: string): Boolean;
    function fpuValidarNomeCanteiro(ipId: Integer; ipNome: string): Boolean;
    function fpuvalidarNomeCamaraFria(ipId: Integer; ipNome: string): Boolean;
    function fpuvalidarNomeTipoEspecie(ipId: Integer; ipNome: string): Boolean;
    procedure ppuValidarSemeadura(ipIdLote: Integer; ipIdSemeadura: Integer; ipQtdeSemeada: Double);
    function fpuBuscarLotesMudas(ipIdCompra: Integer): string;
    function fpuBuscarLoteMuda(ipIdCompraItem: Integer): Integer;
    function fpuBuscarLotesSementes(ipIdCompra: Integer): string;
    function fpuBuscarLoteSemente(ipIdCompraItem: Integer): Integer;
    procedure ppuAjustarSaldoEspecie(ipIdEspecie: Integer);
    function fpuCalcularPrevisaoProducaoMuda(ipEspecies: TadsObjectlist<uTypes.TEspecie>; ipDataPrevisao: string): OleVariant;
    procedure ppuCalcularQuantidadeMudasMix(ipIdMixMuda: Integer);
    function fpuBuscarIdItemMuda: Integer;
    function fpuCalcularQtdeMudasRocambole(ipIdMixMuda: Integer): OleVariant;
    function fpuVerificarLoteMudaExiste(ipId: Integer): Boolean;
    function fpuSincronizarEspecies(ipDataUltimaSincronizacao: string): string;
    function fpuSincronizarMatrizes(ipDataUltimaSincronizacao: string; ipMatrizes: TadsObjectlist<uTypes.TMatriz>): TadsObjectlist<uTypes.TMatriz>;
    procedure ppuCadastrarLotes(ipJsonLotes: string);
    function fpuGetId(ipTabela: string): Integer;
    function fpuDataHoraAtual: string;
    function fpuTestarConexao: Boolean;
    function fpuVerificarAlteracao(ipTabela: string; ipUltimaSincronizacao: string): Boolean;
    procedure ppuEnviarEmail(ipAssunto: string; ipMsg: string; ipDestinatario: string; ipNomeAnexo: string; ipAnexo: TStream);
    procedure DSServerModuleCreate(Sender: TObject);
  end;

implementation

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

function TsmFuncoesViveiroClient.fpuVerificarLoteMudaExiste(ipId: Integer): Boolean;
begin
  if FfpuVerificarLoteMudaExisteCommand = nil then
  begin
    FfpuVerificarLoteMudaExisteCommand := FDBXConnection.CreateCommand;
    FfpuVerificarLoteMudaExisteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuVerificarLoteMudaExisteCommand.Text := 'TsmFuncoesViveiro.fpuVerificarLoteMudaExiste';
    FfpuVerificarLoteMudaExisteCommand.Prepare;
  end;
  FfpuVerificarLoteMudaExisteCommand.Parameters[0].Value.SetInt32(ipId);
  FfpuVerificarLoteMudaExisteCommand.ExecuteUpdate;
  Result := FfpuVerificarLoteMudaExisteCommand.Parameters[1].Value.GetBoolean;
end;

function TsmFuncoesViveiroClient.fpuSincronizarEspecies(ipDataUltimaSincronizacao: string): string;
begin
  if FfpuSincronizarEspeciesCommand = nil then
  begin
    FfpuSincronizarEspeciesCommand := FDBXConnection.CreateCommand;
    FfpuSincronizarEspeciesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuSincronizarEspeciesCommand.Text := 'TsmFuncoesViveiro.fpuSincronizarEspecies';
    FfpuSincronizarEspeciesCommand.Prepare;
  end;
  FfpuSincronizarEspeciesCommand.Parameters[0].Value.SetWideString(ipDataUltimaSincronizacao);
  FfpuSincronizarEspeciesCommand.ExecuteUpdate;
  Result := FfpuSincronizarEspeciesCommand.Parameters[1].Value.GetWideString;
end;

function TsmFuncoesViveiroClient.fpuSincronizarMatrizes(ipDataUltimaSincronizacao: string; ipMatrizes: TadsObjectlist<uTypes.TMatriz>): TadsObjectlist<uTypes.TMatriz>;
begin
  if FfpuSincronizarMatrizesCommand = nil then
  begin
    FfpuSincronizarMatrizesCommand := FDBXConnection.CreateCommand;
    FfpuSincronizarMatrizesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FfpuSincronizarMatrizesCommand.Text := 'TsmFuncoesViveiro.fpuSincronizarMatrizes';
    FfpuSincronizarMatrizesCommand.Prepare;
  end;
  FfpuSincronizarMatrizesCommand.Parameters[0].Value.SetWideString(ipDataUltimaSincronizacao);
  if not Assigned(ipMatrizes) then
    FfpuSincronizarMatrizesCommand.Parameters[1].Value.SetNull
  else
  begin
    FMarshal := TDBXClientCommand(FfpuSincronizarMatrizesCommand.Parameters[1].ConnectionHandler).GetJSONMarshaler;
    try
      FfpuSincronizarMatrizesCommand.Parameters[1].Value.SetJSONValue(FMarshal.Marshal(ipMatrizes), True);
      if FInstanceOwner then
        ipMatrizes.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FfpuSincronizarMatrizesCommand.ExecuteUpdate;
  if not FfpuSincronizarMatrizesCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDBXClientCommand(FfpuSincronizarMatrizesCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TadsObjectlist<uTypes.TMatriz>(FUnMarshal.UnMarshal(FfpuSincronizarMatrizesCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FfpuSincronizarMatrizesCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

procedure TsmFuncoesViveiroClient.ppuCadastrarLotes(ipJsonLotes: string);
begin
  if FppuCadastrarLotesCommand = nil then
  begin
    FppuCadastrarLotesCommand := FDBXConnection.CreateCommand;
    FppuCadastrarLotesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FppuCadastrarLotesCommand.Text := 'TsmFuncoesViveiro.ppuCadastrarLotes';
    FppuCadastrarLotesCommand.Prepare;
  end;
  FppuCadastrarLotesCommand.Parameters[0].Value.SetWideString(ipJsonLotes);
  FppuCadastrarLotesCommand.ExecuteUpdate;
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

procedure TsmFuncoesViveiroClient.ppuEnviarEmail(ipAssunto: string; ipMsg: string; ipDestinatario: string; ipNomeAnexo: string; ipAnexo: TStream);
begin
  if FppuEnviarEmailCommand = nil then
  begin
    FppuEnviarEmailCommand := FDBXConnection.CreateCommand;
    FppuEnviarEmailCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FppuEnviarEmailCommand.Text := 'TsmFuncoesViveiro.ppuEnviarEmail';
    FppuEnviarEmailCommand.Prepare;
  end;
  FppuEnviarEmailCommand.Parameters[0].Value.SetWideString(ipAssunto);
  FppuEnviarEmailCommand.Parameters[1].Value.SetWideString(ipMsg);
  FppuEnviarEmailCommand.Parameters[2].Value.SetWideString(ipDestinatario);
  FppuEnviarEmailCommand.Parameters[3].Value.SetWideString(ipNomeAnexo);
  FppuEnviarEmailCommand.Parameters[4].Value.SetStream(ipAnexo, FInstanceOwner);
  FppuEnviarEmailCommand.ExecuteUpdate;
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
  FfpuVerificarLoteMudaExisteCommand.DisposeOf;
  FfpuSincronizarEspeciesCommand.DisposeOf;
  FfpuSincronizarMatrizesCommand.DisposeOf;
  FppuCadastrarLotesCommand.DisposeOf;
  FfpuGetIdCommand.DisposeOf;
  FfpuDataHoraAtualCommand.DisposeOf;
  FfpuTestarConexaoCommand.DisposeOf;
  FfpuVerificarAlteracaoCommand.DisposeOf;
  FppuEnviarEmailCommand.DisposeOf;
  FDSServerModuleCreateCommand.DisposeOf;
  inherited;
end;

end.

