unit dmuPrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, IPPeerClient,
  Data.DBXCommon, Data.DB, Data.SqlExpr, dxSkinsCore, dxSkinBlack, cxClasses,
  cxLookAndFeels, dxSkinsForm, System.IOUtils, uTypes, uMensagem,
  Datasnap.DSMetadata, Datasnap.DSConnectionMetaDataProvider,
  Datasnap.DSClientMetadata, Datasnap.DSProxyDelphi, uFuncoes, Vcl.AppEvnts,
  uExceptions, Vcl.ImgList, Vcl.Controls, cxGraphics, Vcl.StdCtrls,
  Datasnap.DBClient, Datasnap.DSConnect, uConnection, uUtils, System.TypInfo,
  uControleAcesso, Winapi.Windows, Winapi.Messages, System.RegularExpressions;

type
  TdmPrincipal = class(TDataModule)
    DataSnapConn: TRFSQLConnection;
    ProxyGenerator: TDSProxyGenerator;
    DSConnectionMetaDataProvider1: TDSConnectionMetaDataProvider;
    ApplicationEvents1: TApplicationEvents;
    imgIcons_32: TcxImageList;
    imgIcons_16: TcxImageList;
    ProviderAdministrativo: TDSProviderConnection;
    ProviderLookup: TDSProviderConnection;
    ProviderFinanceiro: TDSProviderConnection;
    procedure DataSnapConnAfterConnect(Sender: TObject);
    procedure DataSnapConnAfterDisconnect(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    FFuncoesGeral: TsmFuncoesGeralClient;
    FFuncoesAdministrativo: TsmFuncoesAdministrativoClient;
    { Private declarations }
  public
    procedure ppuConfigurarConexao(ipUsuario, ipSenha: String);

    property FuncoesGeral: TsmFuncoesGeralClient read FFuncoesGeral;
    property FuncoesAdm: TsmFuncoesAdministrativoClient read FFuncoesAdministrativo;
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}
{ TdmPrincipal }

procedure TdmPrincipal.ApplicationEvents1Exception(Sender: TObject; E: Exception);
var
  vaException: Exception;
begin
  vaException := nil;
  if E is TControlException then
    begin
      TUtils.fpuFocar(TControlException(E).Control);
    end
  else
    begin
      if TRegex.IsMatch(E.Message, 'FOREIGN KEY constraint', [roIgnoreCase]) then
        vaException := Exception.Create('O registro atual não pode ser excluido pois está sendo utilizado em outra tabela.');

    end;
  if Assigned(vaException) then
    begin
      TMensagem.ppuShowException(vaException);
      vaException.Free;
    end
  else
    TMensagem.ppuShowException(E);

end;

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
  // desabilita o Beep do windows tocado a cada enter. Porem desabilita para o windows todo. Espero que nao precisem em outros programas :)
  SystemParametersInfo(SPI_SETBEEP, 0, nil, SPIF_SENDWININICHANGE);
end;

procedure TdmPrincipal.DataModuleDestroy(Sender: TObject);
begin
  // volta o Beep do windows
  SystemParametersInfo(SPI_SETBEEP, 1, nil, SPIF_SENDWININICHANGE);
  TInfoLogin.fpuGetInstance.Free;
  TModulos.fpuGetInstance.Free;
end;

procedure TdmPrincipal.DataSnapConnAfterConnect(Sender: TObject);
begin
  FFuncoesGeral := TsmFuncoesGeralClient.Create(DataSnapConn.DBXConnection);
  FFuncoesAdministrativo := TsmFuncoesAdministrativoClient.Create(DataSnapConn.DBXConnection);
end;

procedure TdmPrincipal.DataSnapConnAfterDisconnect(Sender: TObject);
begin
  if Assigned(FFuncoesGeral) then
    FreeAndNil(FFuncoesGeral);

  if Assigned(FFuncoesAdministrativo) then
    FreeAndNil(FFuncoesAdministrativo);
end;

procedure TdmPrincipal.ppuConfigurarConexao(ipUsuario, ipSenha: String);
var
  vaHost: string;
  vaPorta: Integer;
  vaFile: TStringList;
begin
  vaHost := 'localhost';
  vaPorta := 3004;

  // primeiro vamos ver se achamos um arquivo de configuracao
  if TFile.Exists(coArquivoConfiguracao) then
    begin
      vaFile := TStringList.Create;
      try
        vaFile.LoadFromFile(coArquivoConfiguracao);
        if vaFile.Count > 0 then
          vaHost := vaFile.Strings[0];

        if vaFile.Count > 1 then
          vaPorta := StrToIntDef(vaFile.Strings[1], 3004);
      finally
        vaFile.Free;
      end;
    end;

  DataSnapConn.Close;
  DataSnapConn.Params.Values['HostName'] := vaHost;
  DataSnapConn.Params.Values['Port'] := vaPorta.ToString;
  DataSnapConn.Params.Values['DSAuthenticationUser'] := ipUsuario;
  DataSnapConn.Params.Values['DSAuthenticationPassword'] := ipSenha;
  DataSnapConn.Open;

end;

end.
