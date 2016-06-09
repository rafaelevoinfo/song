unit uBackup;

interface

uses
  FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.IBWrapper, System.Classes,
  System.SysUtils, System.IOUtils;

type
  TBackup = class
  private
    FConn: TFDConnection;
    FNBackup: TFDFBNBackup;
    FEnderecoBackupRede: String;
    FEnderecoBackup: String;
    FEnderecoBackupFTP: String;
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
  FNBackup := TFDFBNBackup.Create(nil);
  FNBackup.Level := 0; // full backup
  FNBackup.DriverLink := ipDriverLink;
  FNBackup.Protocol := ipLocal;

  FNBackup.Database := ipConn.Params.Values['Database'];
  FNBackup.UserName := ipConn.Params.Values['User_Name'];
  FNBackup.Password := ipConn.Params.Values['Password'];
  FNBackup.Host := ipConn.Params.Values['server'];

  if not ipConn.Connected then
    ipConn.Open();

end;

destructor TBackup.Destroy;
begin
  FNBackup.Free;
  inherited;
end;

procedure TBackup.ppuRealizarBackup;
begin
  if EnderecoBackup = '' then
    raise Exception.Create('Informe um endereço de backup.');

  FNBackup.BackupFile := FEnderecoBackup;
  if TFile.Exists(EnderecoBackup) then
    TFile.Delete(EnderecoBackup);

  FNBackup.Backup;
end;

procedure TBackup.SetEnderecoBackup(const Value: String);
begin
  FEnderecoBackup := Value;
end;

procedure TBackup.SetEnderecoBackupFTP(const Value: String);
begin
  FEnderecoBackupFTP := Value;
end;

procedure TBackup.SetEnderecoBackupRede(const Value: String);
begin
  FEnderecoBackupRede := Value;
end;

end.
