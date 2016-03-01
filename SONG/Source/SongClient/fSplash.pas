unit fSplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmuPrincipal, fBasico, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, Vcl.StdCtrls, cxImage, cxProgressBar,
  dxGDIPlusClasses, fLogin, uMensagem, uTypes, uUtils, System.IOUtils,
  Winapi.ShellAPI, System.Zip, System.ZLib;

type
  TfrmSplash = class(TfrmBasico)
    cxImage1: TcxImage;
    Label7: TLabel;
    Label1: TLabel;
    pbProgresso: TcxProgressBar;
  private
    procedure ppvAtualizar(ipArquivo: string);
  protected
    procedure pprAfterShow(var ipMsg: TMessage); override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}


procedure TfrmSplash.ppvAtualizar(ipArquivo: string);
var
  vaExecutavelAtual, vaBatchName, vaNovoExecutavel: string;
  vaBatch: TStringList;
begin
  //vamos descompcatar
  TZipFile.ExtractZipFile(ipArquivo, TDirectory.GetCurrentDirectory);
  vaNovoExecutavel := StringReplace(ipArquivo, '.zip', '.exe', []);

  vaBatch := TStringList.Create;
  try
    // criar bath e sobrepor exe
    vaExecutavelAtual := ExtractFileName((Application.ExeName));
    vaBatchName := 'atualizar.bat';
    vaBatch.Add(':Label1');
    vaBatch.Add('@echo off');
    vaBatch.Add('del ' + vaExecutavelAtual);
    vaBatch.Add('if Exist ' + vaExecutavelAtual + ' goto Label1');
    vaBatch.Add('Move ' + vaNovoExecutavel + ' ' + vaExecutavelAtual);
    vaBatch.Add('Call ' + vaExecutavelAtual);
    vaBatch.Add('del ' + ipArquivo);
    vaBatch.Add('del ' + vaBatchName);

    vaBatch.SaveToFile(vaBatchName);
    ShellExecute(Application.Handle, PWideChar('open'), PWideChar(vaBatchName), nil,
      PWideChar(TDirectory.GetCurrentDirectory), SW_HIDE);
  finally
    vaBatch.Free;
    Application.Terminate;
  end;
end;

procedure TfrmSplash.pprAfterShow(var ipMsg: TMessage);
var
  vaVersao,vaNovaVersao, vaNovoExecutavel: string;
  vaExecutavel: TBytesStream;
  vaStream: TStream;

begin
  inherited;
  pbProgresso.Properties.Max := 2;
  pbProgresso.Position := 0;
  try
    pbProgresso.Properties.Text := 'Configurando a conexão com o servidor.';
    Application.ProcessMessages;
    dmPrincipal.ppuConfigurarConexao('', '');

    pbProgresso.Position := pbProgresso.Position + 1;
    // Buscando atualizacoes
    pbProgresso.Properties.Text := 'Verificando novas atualizações.';
    Application.ProcessMessages;

    vaVersao := TUtils.fpuVersaoExecutavel(Application.ExeName, viBuild);
    vaNovaVersao := dmPrincipal.FuncoesGeral.fpuVerificarNovaVersao(vaVersao);

    if vaNovaVersao <> '' then
      begin
        pbProgresso.Properties.Max := 3;
        pbProgresso.Position := pbProgresso.Position + 1;
        pbProgresso.Properties.Text := 'Baixando nova versão.';
        Application.ProcessMessages;

        vaExecutavel := TBytesStream.Create();
        try
          vaStream := dmPrincipal.FuncoesGeral.fpuBaixarAtualizacao(vaNovaVersao);
          vaStream.Position := 0;
          TUtils.ppuCopyStreamToByteStream(vaStream, vaExecutavel);

          vaNovoExecutavel := coNomePadraoSongClient + vaNovaVersao + coExtensaoCompactacao;
          vaExecutavel.SaveToFile(vaNovoExecutavel);
        finally
          vaExecutavel.Free;
        end;

        ppvAtualizar(vaNovoExecutavel);
      end;

    pbProgresso.Position := pbProgresso.Position + 1;
    Application.ProcessMessages;

    Close;
  except
    on e: Exception do
      begin
        TMensagem.ppuShowException('Erro ao conectar no servidor. Certifique-se que o arquivo de configuração "' +
          coArquivoConfiguracao + '" está preenchido corretamente.', e);

        Application.Terminate;
      end;
  end;
end;

end.
