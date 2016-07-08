unit uBackup;

interface

uses
  FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.IBWrapper, System.Classes,
  System.SysUtils, System.IOUtils, FireDAC.Phys.IBBase, Winapi.Windows,
  System.DateUtils, IdFTP, System.SyncObjs;

type
  TFtp = record
  private
    FPasta: String;
    FSenha: String;
    FHost: String;
    FUsuario: String;
    procedure SetHost(const Value: String);
    procedure SetPasta(const Value: String);
    procedure SetSenha(const Value: String);
    procedure SetUsuario(const Value: String);
  public
    property Host: String read FHost write SetHost;
    property Usuario: String read FUsuario write SetUsuario;
    property Senha: String read FSenha write SetSenha;
    property Pasta: String read FPasta write SetPasta;
  end;

  TBackup = class
  private
    FBackup: TFDIBBackup;
    FEnderecoBackupRede: String;
    FEnderecoBackup: String;
    FNomePadrao: String;
    FFtp: TFtp;
    procedure SetEnderecoBackup(const Value: String);
    procedure SetEnderecoBackupRede(const Value: String);
    procedure ppvEnviarParaFTP(ipArquivo: String);
    procedure SetFtp(const Value: TFtp);
  public
    constructor Create(ipConn: TFDConnection; ipDriverLink: TFDPhysFBDriverLink);
    destructor Destroy; override;

    // FTP
    property Ftp: TFtp read FFtp write SetFtp;

    property EnderecoBackup: String read FEnderecoBackup write SetEnderecoBackup;
    property EnderecoBackupRede: String read FEnderecoBackupRede write SetEnderecoBackupRede;

    procedure ppuRealizarBackup;
  end;

  TThreadBackup = class(TThread)
  private
    FEvent: TEvent;
    FBackup: TBackup;
    FDataUltimoBackup: TDateTime;
    FHoraBackup: TTime;
    FOnFinishBackup: TThreadProcedure;
    FOnStartBackup: TThreadProcedure;
    procedure SetBackup(const Value: TBackup);
    procedure SetDataUltimoBackup(const Value: TDateTime);
    procedure SetHoraBackup(const Value: TTime);
    procedure SetOnFinishBackup(const Value: TThreadProcedure);
    procedure SetOnStartBackup(const Value: TThreadProcedure);
  public
    property DataUltimoBackup: TDateTime read FDataUltimoBackup write SetDataUltimoBackup;
    property HoraBackup: TTime read FHoraBackup write SetHoraBackup;
    property Backup: TBackup read FBackup write SetBackup;
    property Event: TEvent read FEvent;

    property OnStartBackup: TThreadProcedure read FOnStartBackup write SetOnStartBackup;
    property OnFinishBackup: TThreadProcedure read FOnFinishBackup write SetOnFinishBackup;

    constructor Create;
    destructor Destroy; override;

    procedure Execute; override;
  end;

implementation

uses
  fPrincipal;

{ TBackup }

constructor TBackup.Create(ipConn: TFDConnection; ipDriverLink: TFDPhysFBDriverLink);
begin
  FBackup := TFDIBBackup.Create(nil);
  FBackup.DriverLink := ipDriverLink;
  FBackup.Protocol := ipLocal;

  FBackup.Database := ipConn.Params.Values['Database'];
  FBackup.UserName := ipConn.Params.Values['User_Name'];
  FBackup.Password := ipConn.Params.Values['Password'];
  FBackup.Host := ipConn.Params.Values['server'];

  FNomePadrao := 'song_' + DayOf(now).ToString + '.fbk';

end;

destructor TBackup.Destroy;
begin
  FBackup.Free;
  inherited;
end;

procedure TBackup.ppuRealizarBackup;
begin
  if EnderecoBackup = '' then
    raise Exception.Create('Informe um endereço de backup.');

  FBackup.BackupFiles.Add(FEnderecoBackup);
  if TFile.Exists(FEnderecoBackup) then
    TFile.Delete(FEnderecoBackup);

  FBackup.Backup;
  if not TFile.Exists(FEnderecoBackup) then
    raise Exception.Create('O backup falhou. Detalhes: Não foi gerado o arquivo .fbk');

  if FEnderecoBackupRede.Trim <> '' then
    begin
      CopyFile(PChar(FEnderecoBackup), PChar(FEnderecoBackupRede), false);

      if not TFile.Exists(FEnderecoBackupRede) then
        frmPrincipal.ppuAdicionarErroLog('O arquivo de backup não foi copiado para a pasta na rede');
    end;

  if Ftp.Host.Trim <> '' then
    begin
      try
        ppvEnviarParaFTP(FEnderecoBackup);
      except
        on E: Exception do
          frmPrincipal.ppuAdicionarErroLog('Erro ao enviar o arquivo para o FTP. Detalhes: ' + E.Message);
      end;
    end;

end;

procedure TBackup.ppvEnviarParaFTP(ipArquivo: String);
var
  vaFtp: TIdFTP;
begin
  vaFtp := TIdFTP.Create(nil);
  try
    vaFtp.Host := Ftp.Host;
    vaFtp.UserName := Ftp.Usuario;
    vaFtp.Password := Ftp.Senha;

    vaFtp.Connect;
    if vaFtp.Connected then
      begin
        vaFtp.ChangeDir(Ftp.Pasta);
        vaFtp.Put(ipArquivo, TPath.GetFileName(ipArquivo));
      end
    else
      raise Exception.Create('Não foi possível conectar no FTP.');
  finally
    vaFtp.Disconnect;
  end;
end;

procedure TBackup.SetEnderecoBackup(const Value: String);
begin
  if Value.Trim <> '' then
    FEnderecoBackup := IncludeTrailingBackslash(Value) + FNomePadrao
  else
    FEnderecoBackup := FNomePadrao;
end;

procedure TBackup.SetEnderecoBackupRede(const Value: String);
begin
  if Value.Trim <> '' then
    FEnderecoBackupRede := IncludeTrailingBackslash(Value) + FNomePadrao
  else
    FEnderecoBackupRede := '';

end;

procedure TBackup.SetFtp(const Value: TFtp);
begin
  FFtp := Value;
end;

{ TFtp }

procedure TFtp.SetHost(const Value: String);
begin
  FHost := Value;
end;

procedure TFtp.SetPasta(const Value: String);
begin
  FPasta := Value;
end;

procedure TFtp.SetSenha(const Value: String);
begin
  FSenha := Value;
end;

procedure TFtp.SetUsuario(const Value: String);
begin
  FUsuario := Value;
end;

{ TBackupThread }

constructor TThreadBackup.Create;
begin
  inherited Create(true);
  FEvent := TEvent.Create(nil, false, false, '');
end;

destructor TThreadBackup.Destroy;
begin
  FEvent.Free;
  FBackup.Free;

  inherited;
end;

procedure TThreadBackup.execute;
var
  vaDataAtual, vaProximoBkp: TDateTime;
  vaMinutoAtual: Integer;
  vaHoraAtual:TTime;
begin
  inherited;
  while not Terminated do
    begin
      try
        vaDataAtual := now;
        vaHoraAtual := Time;
        if (DataUltimoBackup = 0) or (DayOf(DataUltimoBackup) <> DayOf(vaDataAtual)) or
          (HourOf(DataUltimoBackup) <> HourOf(vaDataAtual)) then
          begin
            vaMinutoAtual := MinuteOf(vaDataAtual);
            if (HourOf(vaDataAtual) = HourOf(HoraBackup)) then
              begin
                if (vaMinutoAtual >= MinuteOf(IncMinute(HoraBackup,-2))) and
                  (vaMinutoAtual <= MinuteOf(IncMinute(HoraBackup, 2))) then
                  begin
                    if Assigned(FOnStartBackup) then
                      Synchronize(FOnStartBackup);

                    Backup.ppuRealizarBackup;

                    DataUltimoBackup := now;
                    vaProximoBkp := IncHour(DataUltimoBackup, 23);
                    vaProximoBkp := IncMinute(vaProximoBkp, 58);

                    if Assigned(FOnFinishBackup) then
                      Synchronize(FOnFinishBackup);

                    FEvent.WaitFor(MilliSecondsBetween(vaProximoBkp, DataUltimoBackup)); // 23 hr e 58 min
                  end
                else
                  FEvent.WaitFor(MilliSecondsBetween(vaHoraAtual, HoraBackup));
              end
            else
              FEvent.WaitFor(MilliSecondsBetween(vaHoraAtual, HoraBackup));
          end
        else
          FEvent.WaitFor(MilliSecondsBetween(vaHoraAtual, HoraBackup));
      except
        on E: Exception do
          begin
            frmPrincipal.ppuAdicionarErroLog('Erro na thread do backup. Detalhes: ' + E.Message);
            Sleep(10000);
          end;
      end;
    end;
end;

procedure TThreadBackup.SetBackup(const Value: TBackup);
begin
  FBackup := Value;
end;

procedure TThreadBackup.SetDataUltimoBackup(const Value: TDateTime);
begin
  FDataUltimoBackup := Value;
end;

procedure TThreadBackup.SetHoraBackup(const Value: TTime);
begin
  FHoraBackup := Value;
end;

procedure TThreadBackup.SetOnFinishBackup(const Value: TThreadProcedure);
begin
  FOnFinishBackup := Value;
end;

procedure TThreadBackup.SetOnStartBackup(const Value: TThreadProcedure);
begin
  FOnStartBackup := Value;
end;

end.
