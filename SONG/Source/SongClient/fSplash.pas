unit fSplash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmuPrincipal, fBasico, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, Vcl.StdCtrls, cxImage, cxProgressBar,
  dxGDIPlusClasses, fLogin, uMensagem, uTypes, uUtils, System.IOUtils,
  Winapi.ShellAPI, System.Zip, System.ZLib, System.Types, Vcl.ExtCtrls,
  cxGroupBox, cxRadioGroup, cxTextEdit;

type
  TfrmSplash = class(TfrmBasico)
    imgLogoOreades: TcxImage;
    Label7: TLabel;
    Label1: TLabel;
    pbProgresso: TcxProgressBar;
    imgLogoSong: TcxImage;
    pnBackground: TPanel;
    pnLocalizacao: TPanel;
    Label2: TLabel;
    rgLocalizacao: TcxRadioGroup;
    btnConectar: TButton;
    EditHostPersonalizado: TcxTextEdit;
    Label3: TLabel;
    btnFechar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    FHost: String;
    FDirAtualizacoes: string;
    procedure ppvAtualizar(ipArquivo: string);
    procedure ppvRealizarConfiguracoes;
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
  vaFile: string;
begin
  // vamos descompcatar
  vaNovoExecutavel := '';

  TZipFile.ExtractZipFile(ipArquivo, FDirAtualizacoes);
  for vaFile in TDirectory.GetFiles(FDirAtualizacoes) do
    begin
      if Pos('.exe', vaFile) > 0 then
        begin
          vaNovoExecutavel := vaFile;
          Break;
        end;
    end;
  if vaNovoExecutavel = '' then // algo deu errado
    begin
      TMensagem.ppuShowException('Não foi possível realizar a atualização.', nil);
      Exit;
    end;

  vaBatch := TStringList.Create;
  try
    // criar bath e sobrepor exe
    vaExecutavelAtual := ExtractFileName((Application.ExeName));
    vaBatchName := 'atualizar.bat';
    vaBatch.Add(':Label1');
    vaBatch.Add('@echo off');
    vaBatch.Add('del ' + vaExecutavelAtual);
    vaBatch.Add('if Exist ' + vaExecutavelAtual + ' goto Label1');
    vaBatch.Add('Move ' + vaNovoExecutavel + ' SongClient.exe');
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

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
  inherited;
  FDirAtualizacoes := IncludeTrailingBackslash(TDirectory.GetCurrentDirectory) + coPastaAtualizacoes;
  if not TDirectory.Exists(FDirAtualizacoes) then
    TDirectory.CreateDirectory(FDirAtualizacoes);
end;

procedure TfrmSplash.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
    if Key = Char(VK_RETURN) then
    TUtils.fpuFocar(btnConectar);
end;

procedure TfrmSplash.pprAfterShow(var ipMsg: TMessage);
begin
  ppvRealizarConfiguracoes;
end;

procedure TfrmSplash.ppvRealizarConfiguracoes;
var
  vaVersao, vaNovaVersao, vaNovoExecutavel: string;
  vaExecutavel: TBytesStream;
  vaStream: TStream;
  vaForm: Tform;
begin
  inherited;

  vaNovoExecutavel := '';
  pbProgresso.Properties.Max := 2;
  pbProgresso.Position := 0;
  try
    pbProgresso.Properties.Text := 'Configurando a conexão com o servidor.';
    Application.ProcessMessages;
    dmPrincipal.ppuConfigurarConexao('', '', FHost);
    if FHost <> '' then
      dmPrincipal.ppuAtualizarArquivoConfiguracao(FHost);

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
          if Assigned(vaStream) then
            begin
              vaStream.Position := 0;
              TUtils.ppuCopyStreamToByteStream(vaStream, vaExecutavel);

              vaNovoExecutavel := IncludeTrailingBackslash(coPastaAtualizacoes) + coNomePadraoSongClient + vaNovaVersao + coExtensaoCompactacao;
              vaExecutavel.SaveToFile(vaNovoExecutavel);

            end;
        finally
          vaExecutavel.Free;
        end;

        if vaNovoExecutavel <> '' then
          ppvAtualizar(vaNovoExecutavel);
      end;

    pbProgresso.Position := pbProgresso.Position + 1;
    Application.ProcessMessages;

    Close;
  except
    on e: Exception do
      begin
        vaForm := TUtils.fpuEncapsularPanelForm('Sem Conexão', pnLocalizacao);
        try
          vaForm.Position := poScreenCenter;
          vaForm.OnKeyPress := self.OnKeyPress;
          if vaForm.ShowModal = mrOk then
            begin
              if Trim(EditHostPersonalizado.Text) <> '' then
                FHost := Trim(EditHostPersonalizado.Text)
              else if rgLocalizacao.ItemIndex = 0 then // dentro da oreades
                FHost := '192.168.1.2'
              else if rgLocalizacao.ItemIndex = 1 then // fora da oreades
                FHost := 'oreades.ddns.net';

              ppvRealizarConfiguracoes;
            end
          else
            ExitProcess(0);
        finally
          pnLocalizacao.Visible := false;
          pnLocalizacao.Parent := self;
          vaForm.Free;
        end;
      end;
  end;
end;

end.
