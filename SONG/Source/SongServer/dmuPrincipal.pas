unit dmuPrincipal;

interface

uses System.SysUtils, System.Classes,
  Datasnap.DSTCPServerTransport,
  Datasnap.DSHTTPCommon, Datasnap.DSHTTP,
  Datasnap.DSServer, Datasnap.DSCommonServer,
  Datasnap.DSAuth, IPPeerServer, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.IBBase;

type
  TdmPrincipal = class(TDataModule)
    Server: TDSServer;
    ServerTransport: TDSTCPServerTransport;
    HttpServer: TDSHTTPService;
    conSong: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
  private
    { Private declarations }
  public
    procedure ppuIniciarServidor(ipServidor, ipEnderecoBanco, ipUsuario,
      ipSenha: String; ipPorta:Integer);
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{$R *.dfm}

uses Winapi.Windows;

{ TdmPrincipal }

procedure TdmPrincipal.ppuIniciarServidor(ipServidor, ipEnderecoBanco, ipUsuario,
  ipSenha: String; ipPorta:Integer);
begin
  conSong.close;
  conSong.Params.Values['SERVER'] := ipServidor;
  conSong.Params.Values['DATABASE'] := ipEnderecoBanco;
  conSong.Params.Values['USER_NAME'] := ipUsuario;
  conSong.Params.Values['PASSWORD'] := ipSenha;
  conSong.Open();

  ServerTransport.Port := ipPorta;
  Server.Start;
end;

end.
