unit dmuPrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, IPPeerClient,
  Data.DBXCommon, Data.DB, Data.SqlExpr, dxSkinsCore, dxSkinBlack, cxClasses,
  cxLookAndFeels, dxSkinsForm, System.IOUtils, uTypes, uUtils,
  Datasnap.DSMetadata, Datasnap.DSConnectionMetaDataProvider,
  Datasnap.DSClientMetadata, Datasnap.DSProxyDelphi, uFuncoes;

type
  TdmPrincipal = class(TDataModule)
    DataSnapConn: TSQLConnection;
    dxSkinController1: TdxSkinController;
    ProxyGenerator: TDSProxyGenerator;
    DSConnectionMetaDataProvider1: TDSConnectionMetaDataProvider;
    procedure DataSnapConnAfterConnect(Sender: TObject);
  private
    FFuncoesGeral: TsmFuncoesGeralClient;
    { Private declarations }
  public
    procedure ppuConfigurarConexao(ipUsuario, ipSenha: String);

    property FuncoesGeral:TsmFuncoesGeralClient read FFuncoesGeral;
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}
{ TdmPrincipal }

procedure TdmPrincipal.DataSnapConnAfterConnect(Sender: TObject);
begin
  FFuncoesGeral := TsmFuncoesGeralClient.Create(DataSnapConn.DBXConnection);
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
        vaFile.free;
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
