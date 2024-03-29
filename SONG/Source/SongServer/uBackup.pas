unit uBackup;

interface

uses
  FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.IBWrapper, System.Classes,
  System.SysUtils, System.IOUtils, FireDAC.Phys.IBBase, Winapi.Windows,
  System.DateUtils, IdFTP, System.SyncObjs, IdFTPCommon;

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

end;

destructor TBackup.Destroy;
begin
  FBackup.Free;
  inherited;
end;

procedure TBackup.ppuRealizarBackup;
var
  vaBackupFile, vaNomeArquivo: String;
begin
  if EnderecoBackup = '' then
    raise Exception.Create('Informe um endere�o de backup.');

  FBackup.BackupFiles.Clear;

  vaNomeArquivo := 'song_' + DayOf(now).ToString + '.fbk';
  vaBackupFile := FEnderecoBackup + vaNomeArquivo;
  FBackup.BackupFiles.Add(vaBackupFile);

  if TFile.Exists(vaBackupFile) then
    TFile.Delete(vaBackupFile);

  FBackup.Backup;
  if not TFile.Exists(vaBackupFile) then
    raise Exception.Create('O backup falhou. Detalhes: N�o foi gerado o arquivo .fbk');

  if FEnderecoBackupRede.Trim <> '' then
    begin
      CopyFile(PChar(vaBackupFile), PChar(FEnderecoBackupRede + vaNomeArquivo), false);

      if not TFile.Exists(FEnderecoBackupRede + vaNomeArquivo) then
        frmPrincipal.ppuAdicionarErroLog('O arquivo de backup n�o foi copiado para a pasta na rede');
    end;

  if Ftp.Host.Trim <> '' then
    begin
      try
        ppvEnviarParaFTP(vaBackupFile);
      except
        on E: Exception do
          frmPrincipal.ppuAdicionarErroLog('Erro ao enviar o arquivo para o FTP. Detalhes: ' + E.Message);
      end;
    end;

end;

procedure TBackup.ppvEnviarParaFTP(ipArquivo: String);
var
  vaFtp: TIdFTP;
  vaNomeArquivo: String;
begin
  vaFtp := TIdFTP.Create(nil);
  try
    vaFtp.Host := Ftp.Host;
    vaFtp.UserName := Ftp.Usuario;
    vaFtp.Password := Ftp.Senha;
    vaFtp.Passive := true;

    vaFtp.Connect;
    if vaFtp.Connected then
      begin
        vaFtp.ChangeDir(Ftp.Pasta);
        // muito importante. Sem isso o arquivo fica corrompido.
        vaFtp.TransferType := ftBinary;

        vaNomeArquivo := TPath.GetFileName(ipArquivo);
        vaFtp.Put(ipArquivo, vaNomeArquivo);

        // FTP da oreades parece nao ter suporte para verificacao, mas deixei caso futuramente passe a ter.
        if vaFtp.SupportsVerification and (not vaFtp.VerifyFile(ipArquivo, vaNomeArquivo)) then
          raise Exception.Create('O arquivo que foi carregado para o FTP n�o confere com o arquivo local.');
      end
    else
      raise Exception.Create('N�o foi poss�vel conectar no FTP.');
  finally
    vaFtp.Disconnect;
    vaFtp.Free;
  end;
end;

procedure TBackup.SetEnderecoBackup(const Value: String);
begin
  FEnderecoBackup := IncludeTrailingBackslash(Value);
end;

procedure TBackup.SetEnderecoBackupRede(const Value: String);
begin
  FEnderecoBackupRede := IncludeTrailingBackslash(Value);
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

procedure TThreadBackup.Execute;
var
  vaDataAtual, vaProximoBkp: TDateTime;
  vaMinutoAtual, vaTempoEspera: Integer;
  vaHoraAtual: TTime;

  procedure plCalcularTempoEspera;
  begin
    // vamos acordar 5 minuto antes para ter uma folga caso o servidor trava por algum motivo
    vaTempoEspera := MilliSecondsBetween(vaHoraAtual, HoraBackup) - 300000;
    if vaTempoEspera < 0 then
      vaTempoEspera := 1000;

    FEvent.WaitFor(vaTempoEspera);
  end;

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
                if (vaMinutoAtual = MinuteOf(HoraBackup)) then
                  begin
                    if Assigned(FOnStartBackup) then
                      Synchronize(FOnStartBackup);

                    Backup.ppuRealizarBackup;

                    DataUltimoBackup := now;
                    vaProximoBkp := IncHour(DataUltimoBackup, 23);
                    vaProximoBkp := IncMinute(vaProximoBkp, 55);

                    if Assigned(FOnFinishBackup) then
                      Synchronize(FOnFinishBackup);

                    FEvent.WaitFor(MilliSecondsBetween(vaProximoBkp, DataUltimoBackup)); // 23 hr e 55 min
                  end
                else
                  FEvent.WaitFor(MilliSecondsBetween(vaHoraAtual, HoraBackup));
              end
            else
              plCalcularTempoEspera
          end
        else
          plCalcularTempoEspera;
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
