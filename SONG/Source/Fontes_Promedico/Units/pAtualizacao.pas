unit pAtualizacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, pTypes,
  System.RegularExpressions, System.IOUtils, Vcl.ExtCtrls, WUpdate, WUpdateWiz,
  WUpdateLanguagesU, System.IniFiles, IdComponent, IdHTTP, IdBaseComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP,
  pMethod2009, System.Types, pCallback, Data.DBXJSON, System.JSON;

type
  TFuncVerificaVersao = reference to function(ipCodigoSistema: Integer; ipVersaoAtual: string; var opNovaVersao: string): String;
  TFuncVerificaVersaoEx = reference to function(ipCodigoSistema: Integer; ipVersaoAtual: string; var opNovaVersao: string; ipCallback: TDBXCallback): String;
  TFuncDownload = reference to function(ipEnderecoArquivo: string; ipInicioStream, ipTamanhoDoBuffer: Integer; out ipTamanhoTotal: Int64; ipPegarTamanhoTotal: Boolean): TStream;

  TfrmAtualizacao = class(TForm)
    pbProgresso: TProgressBar;
    lbSistema: TLabel;
    lbNovaVersao: TLabel;
    lbStatus: TLabel;
    tmrShow: TTimer;
    Update: TWebUpdate;
    httpCloud: TIdHTTP;
    procedure tmrShowTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure httpCloudWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure httpCloudWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
  private
    FAguardandoPServer: Boolean;
    FNovaVersao: string;
    FArquivoNovaVersao: String;
    FNovoArquivo: String;
    FSistema: TSistemaCloud;
    FVersaoAtual: String;
    FFuncaoVerificarVersao: TFuncVerificaVersao;
    FFuncaoDownload: TFuncDownload;
    FEnderecoHost: String;
    FFuncaoVerificarVersaoEx: TFuncVerificaVersaoEx;
    procedure SetSistema(const Value: TSistemaCloud);
    procedure SetVersaoAtual(const Value: String);
    procedure ppvValidar;
    procedure SetFuncaoDownload(const Value: TFuncDownload);
    procedure SetFuncaoVerificarVersao(const Value: TFuncVerificaVersao);
    procedure ppvAtualizar();
    function fpvBuscarArquivoCloud(ipDiretorioDestino: String): String;
    function fpvPrepararArquivoAtualizacao(ipArquivo: String; ipVersao: TArray<String>): String;
    procedure SetEnderecoHost(const Value: String);
    procedure SetFuncaoVerificarVersaoEx(const Value: TFuncVerificaVersaoEx);

    { Private declarations }
  public
    property Sistema: TSistemaCloud read FSistema write SetSistema;
    property VersaoAtual: String read FVersaoAtual write SetVersaoAtual;
    property FuncaoVerificarVersao: TFuncVerificaVersao read FFuncaoVerificarVersao write SetFuncaoVerificarVersao;
    property FuncaoVerificarVersaoEx: TFuncVerificaVersaoEx read FFuncaoVerificarVersaoEx write SetFuncaoVerificarVersaoEx;
    property FuncaoDownload: TFuncDownload read FFuncaoDownload write SetFuncaoDownload;
    property EnderecoHost: String read FEnderecoHost write SetEnderecoHost;
    function fpuBuscarNovaVersao(): Boolean;

    procedure ppuTrocarExe(ipArquivo: String);

  end;

implementation

{$R *.dfm}

{ TfrmAtualizacao }

procedure TfrmAtualizacao.FormShow(Sender: TObject);
begin
  if not FAguardandoPServer then
    tmrShow.Enabled := true;
end;

function TfrmAtualizacao.fpuBuscarNovaVersao(): Boolean;
var
  vaCallBack: TMessageCallback;
begin
  try
    if Assigned(FuncaoVerificarVersaoEx) then
      begin
        vaCallBack := TMessageCallback.Create(
          function(const ipArg: TJSONValue): TJSONValue
          begin
            Result := nil; // nao quero retornar nada
            if ipArg is TJsonObject then
              begin
                FAguardandoPServer := true;//faz o timer nao ser disparado quando der o show
                if not Showing then
                  Show;
                lbStatus.Caption := 'Aguardando o servidor baixar o arquivo ' + TJsonObject(ipArg).Pairs[0].JsonString.Value + ' ... ';
                pbProgresso.Position := 0;
                pbProgresso.Max := StrToIntDef(TJsonObject(ipArg).Pairs[0].JsonValue.Value, 0);
                lbNovaVersao.Caption := TJsonObject(ipArg).Pairs[1].JsonValue.Value;
                Application.HandleMessage;
              end
            else if ipArg is TJsonNumber then
              begin
                pbProgresso.Position := TJsonNumber(ipArg).AsInt;
                Application.HandleMessage;
              end;
          end);

        FArquivoNovaVersao := FuncaoVerificarVersaoEx(Ord(Sistema), VersaoAtual, FNovaVersao, vaCallback);
        if Showing then
          close;
      end
    else if Assigned(FuncaoVerificarVersao) then
      FArquivoNovaVersao := FuncaoVerificarVersao(Ord(Sistema), VersaoAtual, FNovaVersao)
    else
      raise Exception.Create('Função de verificar versão não foi definida!');

    Result := FArquivoNovaVersao.Trim <> '';
  finally
    FAguardandoPServer := false;
  end;
end;

procedure TfrmAtualizacao.httpCloudWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  if (AWorkMode = wmRead) and (Pos('chunked', LowerCase(httpCloud.Response.TransferEncoding)) = 0) and (httpCloud.Response.ContentLength > 0) then
    begin
      pbProgresso.Position := AWorkCount;
      Application.ProcessMessages;
    end;
end;

procedure TfrmAtualizacao.httpCloudWorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  pbProgresso.Max := AWorkCountMax;
end;

function TfrmAtualizacao.fpvBuscarArquivoCloud(ipDiretorioDestino: String): String;
var
  vaVersaoCompleta: TArray<String>;
  vaVersao, vaBuild, j: Integer;
  vaDiretorioCloud, vaNomeArquivo: String;
  vaStream: TMemoryStream;
begin
  Result := '';

  // somente vou pegar do cloud caso esteja usando um pmedico pela internet, ou seja, o endereco do pserver esta no formato xxxx.pmedico.com
  if not EnderecoHost.Contains('.pmedico.com') then
    Exit;

  vaVersaoCompleta := TRegex.Split(FNovaVersao, TRegex.Escape('.'), []);
  vaVersao := StrToInt(vaVersaoCompleta[0] + vaVersaoCompleta[1] + vaVersaoCompleta[2]);
  vaBuild := StrToInt(vaVersaoCompleta[3]);
  vaNomeArquivo := '';

  case FSistema of
    scPWorkStation:
      begin
        vaNomeArquivo := Format('PWorkStationV%d-B%d.cab', [vaVersao, vaBuild]);
           // http://pmedico.com/wp-content/uploads/builds/workstation/v2175/PWorkStationV2175-B1.cab
        vaDiretorioCloud := Format('http://pmedico.com/wp-content/uploads/builds/workstation/v%d', [vaVersao]);
      end;
    scPMedico:
      begin
        vaNomeArquivo := Format('PMedicoV%d-B%d.rar', [vaVersao, vaBuild]);
          // http://pmedico.com/wp-content/uploads/builds/v2175/PMedicoV2175-B1.rar
        vaDiretorioCloud := Format('http://pmedico.com/wp-content/uploads/builds/v%d', [vaVersao]);
      end;
    scTeamViewer:
      begin
        vaNomeArquivo := 'TeamViewer.cab';
        vaDiretorioCloud := 'http://pmedico.com/downloads';
      end;
  end;

  vaStream := TMemoryStream.Create;
  try
    lbStatus.Caption := 'Baixando arquivos...';
    httpCloud.get(IncludeTrailingBackslash(vaDiretorioCloud) + vaNomeArquivo, vaStream);
    vaStream.SaveToFile(IncludeTrailingBackslash(ipDiretorioDestino) + vaNomeArquivo);

    if FSistema = scPMedico then
      Result := fpvPrepararArquivoAtualizacao(IncludeTrailingBackslash(ipDiretorioDestino) + vaNomeArquivo, vaVersaoCompleta)
    else
      Result := vaNomeArquivo;

  finally
    vaStream.Free;
  end;

end;

function TfrmAtualizacao.fpvPrepararArquivoAtualizacao(ipArquivo: String; ipVersao: TArray<String>): String;
var
  vaParametros, vaWinrar: String;
  vaFiles: TStringDynArray;
  vaFile, vaNovoFile, vaExtensao: String;
begin
  Result := ipArquivo;
  vaExtensao := TPath.GetExtension(ipArquivo);
  if TRegex.IsMatch(vaExtensao, '.rar', [roIgnoreCase]) then
    begin
      vaWinrar := fpuProcuraArquivo('C:', 'unrar.exe');
      if vaWinrar <> '' then
        begin
          vaParametros := ' e -y "' + ipArquivo + '" ' + IncludeTrailingBackslash(TPath.GetDirectoryName(ipArquivo));
          if not ExecutarPrograma(vaWinrar, vaParametros, sw_normal) then
            raise Exception.Create('Não foi possível descompactar o arquivo.')
          else // agora temos que percorrer os arquivos descompactados e renomea-los
            begin
              vaFiles := TDirectory.GetFiles(TPath.GetDirectoryName(ipArquivo));
              for vaFile in vaFiles do
                begin
                  if TRegex.IsMatch(vaFile, 'PMedico.cab', [roIgnoreCase]) then
                    begin
                      vaNovoFile := IncludeTrailingBackslash(TPath.GetDirectoryName(vaFile)) + 'PMedicoV' + ipVersao[0] + ipVersao[1] + ipVersao[2] + '-B' + ipVersao[3] + '.cab';
                      if TFile.Exists(vaNovoFile) then
                        TFile.Delete(vaNovoFile);

                      TFile.Move(vaFile, vaNovoFile);
                      if TFile.Exists(vaNovoFile) then
                        TFile.Delete(ipArquivo);

                      Result := TPath.GetFileName(vaNovoFile);

                      break;
                    end;
                end;
            end;
        end
      else
        raise Exception.Create('O Winrar não foi encontrado. Certifique-se que está instalado na Unidade C:');
    end;
end;

procedure TfrmAtualizacao.ppvAtualizar();
var
  vaFile: TFileStream;
  vaStream: TStream;
  vaInicioStream: Integer;
  vaTamanhoTotal: Int64;
  vaPegarTotal: Boolean;
  vaArqUpdate: TFileDescription;
  vaPathArquivo, vaNomeArquivo: String;
begin
  ppvValidar;
  vaNomeArquivo := '';
  vaPathArquivo := '';
  if Assigned(FuncaoDownload) then
    begin
      lbStatus.Caption := 'Procurando novas versões...';
      Application.ProcessMessages;

      if FArquivoNovaVersao.Trim <> '' then
        begin
          lbNovaVersao.Caption := 'Nova Versão: ' + FNovaVersao;
          Application.ProcessMessages;

          vaPathArquivo := IncludeTrailingBackslash(TPath.GetDocumentsPath);
          case Sistema of
            scPWorkStation:
              vaPathArquivo := vaPathArquivo + 'PWorkStation\Atualizacoes\';
            scPMedico:
              vaPathArquivo := vaPathArquivo + 'ProMedico\Atualizacoes\';
            scTeamViewer:
              vaPathArquivo := vaPathArquivo + 'ProMedico\QS\';
          end;

          if not TDirectory.Exists(vaPathArquivo) then
            TDirectory.CreateDirectory(vaPathArquivo);

          // vamos ver se acho o arquivo no cloud e se esta configurado para pegar dele, caso sim, pego direto dele.
          try
            vaNomeArquivo := fpvBuscarArquivoCloud(vaPathArquivo);
          except
            // deu algum erro, entao vou pegar do pserver mesmo
            vaNomeArquivo := '';
          end;

          if vaNomeArquivo = '' then // nao achou no cloud ou nao esta configurado para pegar dele.
            begin
              vaPathArquivo := vaPathArquivo + TPath.GetFileName(FArquivoNovaVersao);

              vaPegarTotal := true;
              vaInicioStream := 0;

              vaFile := TFileStream.Create(vaPathArquivo, fmCreate);
              try
                lbStatus.Caption := 'Baixando arquivos...';
                repeat
                  vaStream := FuncaoDownload(FArquivoNovaVersao, vaInicioStream, coBufferDowlnoad, vaTamanhoTotal, vaPegarTotal);
                  vaPegarTotal := false;

                  vaFile.CopyFrom(vaStream, vaStream.Size);

                  pbProgresso.Max := vaTamanhoTotal;
                  pbProgresso.Position := vaFile.Size;
                  Application.ProcessMessages;

                  vaInicioStream := vaInicioStream + vaStream.Size;
                until vaFile.Size >= vaTamanhoTotal;

                vaPathArquivo := vaFile.FileName;
              finally
                vaFile.Free;
              end;
            end
          else
            begin
              vaPathArquivo := vaPathArquivo + vaNomeArquivo;
            end;

          ppuTrocarExe(vaPathArquivo);
        end;
    end
  else
    raise Exception.Create('Funções de download não definida');

end;

procedure TfrmAtualizacao.ppuTrocarExe(ipArquivo: String);
var
  vaInf: TIniFile;
  vaUpdateInf: String;
begin
  if Sistema <> scTeamViewer then
    begin
      vaUpdateInf := IncludeTrailingBackslash(TPath.GetDocumentsPath) + 'update.inf';
      if TFile.Exists(vaUpdateInf) then
        TFile.Delete(vaUpdateInf);

  // vamos montar o arquivo .inf
      vaInf := TIniFile.Create(vaUpdateInf);
      try
        vaInf.WriteString('update', 'unconditional', '1');
        vaInf.WriteString('files', 'count', '1');
        vaInf.WriteString('file1', 'url', ipArquivo);
    // ATENCAO: Application.Name por default nao retorna nada, tem q ir no .dpr e adicionar logo apos o Application.Title a linha Application.Name := 'Nome_do_exe' Ex.: PMedico/PWorkstation etc
    // fiz dessa forma pq se eu pegar o Application.ExeName no Workstation ficaria pWorkstation, no caso com a letra p Minuscula.
        vaInf.WriteString('file1', 'localversion', Application.Name + '.exe');
        vaInf.WriteString('file1', 'targetdir', '{app}');
        vaInf.WriteString('file1', 'compressed', '0');
        vaInf.WriteString('file1', 'mandatory', '1');
        vaInf.WriteString('application', 'appupdate', '1');
        vaInf.WriteString('application', 'appname', Application.Name + '.exe');
        vaInf.WriteString('application', 'silentrestart', '1');
        vaInf.WriteString('application', 'appcomps', TPath.GetFileName(ipArquivo));
        vaInf.UpdateFile;
      finally
        vaInf.Free;
      end;

      Update.URL := vaUpdateInf;
      Update.DoUpdate;
    end;
end;

procedure TfrmAtualizacao.ppvValidar;
begin
  if not TRegex.IsMatch(VersaoAtual, '^\d+(\.\d+){3}', [roIgnoreCase]) then
    raise Exception.Create('Versão inválida. Dever estar no formato MAJOR.MINOR.RELEASE.BUILD');
end;

procedure TfrmAtualizacao.SetEnderecoHost(const Value: String);
begin
  FEnderecoHost := Value;
end;

procedure TfrmAtualizacao.SetFuncaoDownload(const Value: TFuncDownload);
begin
  FFuncaoDownload := Value;
end;

procedure TfrmAtualizacao.SetFuncaoVerificarVersao(
  const Value: TFuncVerificaVersao);
begin
  FFuncaoVerificarVersao := Value;
end;

procedure TfrmAtualizacao.SetFuncaoVerificarVersaoEx(
  const Value: TFuncVerificaVersaoEx);
begin
  FFuncaoVerificarVersaoEx := Value;
end;

procedure TfrmAtualizacao.SetSistema(const Value: TSistemaCloud);
begin
  FSistema := Value;
  lbSistema.Caption := 'Atualizando ' + coDescricaoSistemasCloud[FSistema];
end;

procedure TfrmAtualizacao.SetVersaoAtual(const Value: String);
begin
  FVersaoAtual := Value;
end;

procedure TfrmAtualizacao.tmrShowTimer(Sender: TObject);
begin
  tmrShow.Enabled := false;
  try
    ppvAtualizar;
  finally
    close;
  end;
end;

end.
