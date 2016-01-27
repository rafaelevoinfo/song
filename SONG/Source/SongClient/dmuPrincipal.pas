unit dmuPrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, IPPeerClient,
  Data.DBXCommon, Data.DB, Data.SqlExpr, dxSkinsCore, dxSkinBlack, cxClasses,
  cxLookAndFeels, dxSkinsForm, System.IOUtils, uTypes, uMensagem,
  Datasnap.DSMetadata, Datasnap.DSConnectionMetaDataProvider,
  Datasnap.DSClientMetadata, Datasnap.DSProxyDelphi, uFuncoes, Vcl.AppEvnts,
  uExceptions, Vcl.ImgList, Vcl.Controls, cxGraphics;

type
  TdmPrincipal = class(TDataModule)
    DataSnapConn: TSQLConnection;
    dxSkinController1: TdxSkinController;
    ProxyGenerator: TDSProxyGenerator;
    DSConnectionMetaDataProvider1: TDSConnectionMetaDataProvider;
    ApplicationEvents1: TApplicationEvents;
    imgIcons_32: TcxImageList;
    imgIcons_16: TcxImageList;
    procedure DataSnapConnAfterConnect(Sender: TObject);
    procedure DataSnapConnAfterDisconnect(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
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

procedure TdmPrincipal.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  if E is TControlException then
    begin
      if TControlException(E).Control.CanFocus then
        begin
          try
            TControlException(E).Control.SetFocus;
          except
            //ignora se nao conseguir focar
          end;
        end;
    end;

  TMsg.ppuShowException(e);
end;

procedure TdmPrincipal.DataSnapConnAfterConnect(Sender: TObject);
begin
  FFuncoesGeral := TsmFuncoesGeralClient.Create(DataSnapConn.DBXConnection);
end;

procedure TdmPrincipal.DataSnapConnAfterDisconnect(Sender: TObject);
begin
  if Assigned(FFuncoesGeral) then
    FreeAndNil(FFuncoesGeral);
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
