unit uMensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxContainer, cxEdit, dxGDIPlusClasses, cxImage,
  Vcl.ExtCtrls, Vcl.StdCtrls, cxPC, Vcl.ImgList, dxDockControl, dxDockPanel;

type
  TPerguntaPadrao = (ppSimNao, ppSimNaoCancelar);
  TRespostaPadrao = (rpSim, rpNao, rpCancelar);

  TMensagem = class(TForm)
    pcTiposMsg: TcxPageControl;
    tabPergunta: TcxTabSheet;
    pnPergunta: TPanel;
    Label2: TLabel;
    Shape1: TShape;
    pnBotoesPergunta: TPanel;
    tabMensagem: TcxTabSheet;
    cxImageList1: TcxImageList;
    Panel2: TPanel;
    imgIcon: TcxImage;
    lbPergunta: TLabel;
    tabErro: TcxTabSheet;
    btnSim: TButton;
    btnNao: TButton;
    btnCancelar: TButton;
    pnMsg: TPanel;
    Label3: TLabel;
    lbMsg: TLabel;
    pnBotoesMsg: TPanel;
    btnOk: TButton;
    pnInfo: TPanel;
    cxImage1: TcxImage;
    Shape2: TShape;
    pnErro: TPanel;
    Label4: TLabel;
    lbErro: TLabel;
    Panel3: TPanel;
    btnOkErro: TButton;
    Panel4: TPanel;
    cxImage2: TcxImage;
    Shape3: TShape;
    procedure FormCreate(Sender: TObject);
  private

    { Private declarations }
  public
    procedure ppuConfigurarPergunta(ipPergunta: string; ipBotoes: TPerguntaPadrao);
    procedure ppuConfigurarMensagem(ipMsg: string);
    procedure ppuConfigurarErro(ipMsgErro: string; ipException: Exception);

    class function fpuPerguntar(ipPergunta: string; ipBotoes: TPerguntaPadrao): TRespostaPadrao;
    class procedure ppuShowMessage(ipMsg: String);
    class procedure ppuShowException(ipMsg: string; ipEx: Exception); overload;
    class procedure ppuShowException(ipEx: Exception); overload;

  end;

var
  Mensagem: TMensagem;

implementation

{$R *.dfm}


procedure TMensagem.FormCreate(Sender: TObject);
begin
  pcTiposMsg.Properties.HideTabs := True;
end;

procedure TMensagem.ppuConfigurarErro(ipMsgErro: string; ipException: Exception);
begin
  pcTiposMsg.ActivePage := tabErro;
  lbErro.Caption := '';

  if Assigned(ipException) then
    begin
      if ipMsgErro <> '' then
        lbErro.Caption := ipMsgErro + slinebreak + 'Detalhes: ' + ipException.Message
      else
        lbErro.Caption := ipException.Message;
    end
  else
    if ipMsgErro <> '' then
    lbErro.Caption := ipMsgErro;
end;

procedure TMensagem.ppuConfigurarMensagem(ipMsg: string);
begin
  pcTiposMsg.ActivePage := tabMensagem;
  lbMsg.Caption := ipMsg;
end;

procedure TMensagem.ppuConfigurarPergunta(ipPergunta: string; ipBotoes: TPerguntaPadrao);
begin
  pcTiposMsg.ActivePage := tabPergunta;
  if ipBotoes = ppSimNao then
    btnCancelar.Visible := false;

  lbPergunta.Caption := ipPergunta;
end;

class function TMensagem.fpuPerguntar(ipPergunta: string;
  ipBotoes: TPerguntaPadrao): TRespostaPadrao;
var
  vaMsg: TMensagem;
begin
  vaMsg := TMensagem.Create(nil);
  try
    vaMsg.ppuConfigurarPergunta(ipPergunta, ipBotoes);
    case vaMsg.ShowModal of
      mrYes:
        Result := rpSim;
      mrNo:
        Result := rpNao;
      mrCancel:
        Result := rpCancelar;
    end;
  finally
    vaMsg.Free;
  end;
end;

class procedure TMensagem.ppuShowException(ipMsg: string; ipEx: Exception);
var
  vaMsg: TMensagem;
begin
  vaMsg := TMensagem.Create(nil);
  try
    vaMsg.ppuConfigurarErro(ipMsg, ipEx);
    vaMsg.ShowModal;
  finally
    vaMsg.Free;
  end;
end;

class procedure TMensagem.ppuShowException(ipEx: Exception);
begin
  TMensagem.ppuShowException('', ipEx);
end;

class procedure TMensagem.ppuShowMessage(ipMsg: String);
var
  vaMsg: TMensagem;
begin
  vaMsg := TMensagem.Create(nil);
  try
    vaMsg.ppuConfigurarMensagem(ipMsg);
    vaMsg.ShowModal;
  finally
    vaMsg.Free;
  end;

end;

end.
