unit fSplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmuPrincipal, fBasico, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, Vcl.StdCtrls, cxImage, cxProgressBar,
  dxGDIPlusClasses, fLogin, uUtils, uTypes;

type
  TfrmSplash = class(TfrmBasico)
    cxImage1: TcxImage;
    Label7: TLabel;
    Label1: TLabel;
    pbProgresso: TcxProgressBar;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

procedure TfrmSplash.FormActivate(Sender: TObject);
begin
  inherited;
  pbProgresso.Properties.Max := 1;
  pbProgresso.Position := 0;
  try
    pbProgresso.Properties.Text := 'Configurando a conex�o com o servidor.';
    dmPrincipal.ppuConfigurarConexao('','');
    pbProgresso.Position := pbProgresso.Position + 1;
    Application.ProcessMessages;
  except
    on e: Exception do
      begin
        TMsg.ppuShowException('Erro ao conectar no servidor. Certifique-se que o arquivo de configura��o "' +
          coArquivoConfiguracao + '" est� configurado corretamente.', e);

        Application.Terminate;
      end;
  end;
  // configurando a conexao

  // for I := 0 to 10 do
  // begin
  // pbProgresso.Properties.Text := 'Fase ' + I.ToString();
  // pbProgresso.Position := i;
  // Application.ProcessMessages;
  // Sleep(100);
  // end;
end;

end.
