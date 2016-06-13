unit uBackup;

interface

uses
  FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.IBWrapper, System.Classes,
  System.SysUtils, System.IOUtils, FireDAC.Phys.IBBase, Winapi.Windows,
  System.DateUtils, IdFTP;

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

  if not ipConn.Connected then
    ipConn.Open();

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

end.
