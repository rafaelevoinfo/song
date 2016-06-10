unit uBackup;

interface

uses
  FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.IBWrapper, System.Classes,
  System.SysUtils, System.IOUtils, FireDAC.Phys.IBBase, Winapi.Windows,
  System.DateUtils;

type
  TBackup = class
  private
    FConn: TFDConnection;
    FBackup: TFDIBBackup;
    FEnderecoBackupRede: String;
    FEnderecoBackup: String;
    FEnderecoBackupFTP: String;
    FNomePadrao: String;
    procedure SetEnderecoBackup(const Value: String);
    procedure SetEnderecoBackupFTP(const Value: String);
    procedure SetEnderecoBackupRede(const Value: String);
  public
    constructor Create(ipConn: TFDConnection; ipDriverLink: TFDPhysFBDriverLink);
    destructor Destroy; override;

    property EnderecoBackup: String read FEnderecoBackup write SetEnderecoBackup;
    property EnderecoBackupRede: String read FEnderecoBackupRede write SetEnderecoBackupRede;
    property EnderecoBackupFTP: String read FEnderecoBackupFTP write SetEnderecoBackupFTP;

    procedure ppuRealizarBackup;
  end;

implementation

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

  CopyFile(PChar(FEnderecoBackup), PChar(FEnderecoBackupRede), false);

  if not TFile.Exists(FEnderecoBackupRede) then
    raise Exception.Create('O backup não foi copiado para a pasta na rede.');
end;

procedure TBackup.SetEnderecoBackup(const Value: String);
begin
  FEnderecoBackup := IncludeTrailingBackslash(Value) + FNomePadrao;
end;

procedure TBackup.SetEnderecoBackupFTP(const Value: String);
begin
  FEnderecoBackupFTP := IncludeTrailingBackslash(Value) + FNomePadrao;
end;

procedure TBackup.SetEnderecoBackupRede(const Value: String);
begin
  FEnderecoBackupRede := IncludeTrailingBackslash(Value) + FNomePadrao;
end;

end.
