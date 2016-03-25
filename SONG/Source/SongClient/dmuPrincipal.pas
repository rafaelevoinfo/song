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
  uControleAcesso, Winapi.Windows, Winapi.Messages, System.RegularExpressions, MidasLib, Midas,
  Vcl.Forms, uClientDataSet, cxEdit, cxDBEditRepository, System.ImageList,
  cxLocalization;

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
    ProviderViveiro: TDSProviderConnection;
    cdslkCidade: TRFClientDataSet;
    cdslkCidadeID: TIntegerField;
    cdslkCidadeUF: TStringField;
    cdslkCidadeNOME: TStringField;
    Repositorio: TcxEditRepository;
    repLcbCidade: TcxEditRepositoryLookupComboBoxItem;
    dslkCidade: TDataSource;
    cxLocalizer1: TcxLocalizer;
    procedure DataSnapConnAfterConnect(Sender: TObject);
    procedure DataSnapConnAfterDisconnect(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    FFuncoesGeral: TsmFuncoesGeralClient;
    FFuncoesAdministrativo: TsmFuncoesAdministrativoClient;
    FFuncoesViveiro: TSMFuncoesViveiroClient;
    FFuncoesFinanceiro: TSMFuncoesFinanceiroClient;
    { Private declarations }
  public
    procedure ppuConfigurarConexao(ipUsuario, ipSenha: String);

    property FuncoesGeral: TsmFuncoesGeralClient read FFuncoesGeral;
    property FuncoesAdm: TsmFuncoesAdministrativoClient read FFuncoesAdministrativo;
    property FuncoesViveiro: TSMFuncoesViveiroClient read FFuncoesViveiro;
    property FuncoesFinanceiro:TSMFuncoesFinanceiroClient read FFuncoesFinanceiro;
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
      TMensagem.ppuShowMessage(E.Message);
    end
  else
    begin
      if TRegex.IsMatch(E.Message, 'FOREIGN KEY constraint', [roIgnoreCase]) then
        begin
          TMensagem.ppuShowException('Houve uma viola��o de chave estrangeira.' +
            'Caso esteja excluindo isso significa que o registro a ser exclu�do possui depend�ncias, e por isso n�o pode ser exclu�do.', E);
        end
      else
        TMensagem.ppuShowException(E);
    end;
end;

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
begin
  // desabilita o Beep do windows tocado a cada enter. Porem desabilita para o windows todo. Espero que nao precisem em outros programas :)
  SystemParametersInfo(SPI_SETBEEP, 0, nil, SPIF_SENDWININICHANGE);

  cxLocalizer1.Active := True;
  cxLocalizer1.Locale := 1046;//Portugues Brasil
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
  FFuncoesViveiro := TSMFuncoesViveiroClient.Create(DataSnapConn.DBXConnection);
  FFuncoesFinanceiro := TSMFuncoesFinanceiroClient.Create(DataSnapConn.DBXConnection);
end;

procedure TdmPrincipal.DataSnapConnAfterDisconnect(Sender: TObject);
begin
  if Assigned(FFuncoesGeral) then
    FreeAndNil(FFuncoesGeral);

  if Assigned(FFuncoesAdministrativo) then
    FreeAndNil(FFuncoesAdministrativo);

  if Assigned(FFuncoesViveiro) then
    FreeAndNil(FFuncoesViveiro);

  if Assigned(FFuncoesFinanceiro) then
    FreeAndNil(FFuncoesFinanceiro);
end;

procedure TdmPrincipal.ppuConfigurarConexao(ipUsuario, ipSenha: String);
var
  vaHost: string;
  vaPorta: Integer;
  vaFile: TStringList;
  vaFilePath: string;
begin
  vaHost := 'localhost';
  vaPorta := 3004;

  vaFilePath := IncludeTrailingBackslash(TDirectory.GetCurrentDirectory) + coArquivoConfiguracao;
  // primeiro vamos ver se achamos um arquivo de configuracao
  if TFile.Exists(vaFilePath) then
    begin
      vaFile := TStringList.Create;
      try
        vaFile.LoadFromFile(vaFilePath);
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
