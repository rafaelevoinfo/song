unit pRecordPlayer;

interface

uses
  ActiveX, IOUtils, Generics.Collections, Diagnostics, TimeSpan, pTypes, RegularExpressions, DB,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, DateUtils,
  Controls, Forms, Dialogs,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxTrackBar, StdCtrls, OleServer, ComCtrls, SMEXAUDIOLib_TLB, Rtti,
  cxButtons, cxLabel, AdvTrackBar,
  AdvReflectionImage, cxProgressBar, AdvSmartMessageBox, Menus, ExtCtrls, ImgList, ActnList, SpMikeCtrl_TLB,
  dxSkinsForm, dxSkinsCore, pmPromedicoSkin, cxPC, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, DBClient, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxDockControl, dxDockPanel, dxSkinscxPCPainter,
  cxGroupBox, cxRadioGroup, ShlObj, inifiles,
  System.Actions, pMessageTela, System.ImageList;

type
  TEnderecoArquivosRemotoDownload = record
    EnderecoLocal, EnderecoRemoto: string;
  end;

  TfrmRecordPlayer = class(Tform)
    smAudio: TSmAudio;
    SpeechMikeControl: TSpeechMikeControl;
    pnPai: TPanel;
    ActionList1: TActionList;
    Ac_Gravar: TAction;
    Ac_Voltar: TAction;
    Ac_Avancar: TAction;
    Ac_Parar: TAction;
    Ac_Final: TAction;
    Ac_Inicio: TAction;
    Ac_PlayPause: TAction;
    lbTitulo: TcxLabel;
    lbSubTitulo: TcxLabel;
    Ac_Sair: TAction;
    btnSair: TcxButton;
    pnLinhaTempo: TPanel;
    lbStatus: TLabel;
    lbTempoTotal: TLabel;
    lbTempoAtual: TLabel;
    pnBotoes: TPanel;
    tbLinhaTempo: TAdvTrackBar;
    pbProgresso: TcxProgressBar;
    lbAutor: TLabel;
    Ac_Salvar: TAction;
    dxSkinController1: TdxSkinController;
    dockPlayList: TdxDockSite;
    dxDockPanel1: TdxDockPanel;
    dxLayoutDockSite1: TdxLayoutDockSite;
    cxGridPlayList: TcxGrid;
    cxGridPlayListDBTableView1: TcxGridDBTableView;
    cxGridPlayListLevel1: TcxGridLevel;
    cdsLocalPlayList: TClientDataSet;
    cdsLocalPlayListFAIXA: TIntegerField;
    cdsLocalPlayListNOME: TStringField;
    dsPlayList: TDataSource;
    cxImageList1: TcxImageList;
    cxGridPlayListDBTableView1FAIXA: TcxGridDBColumn;
    cxGridPlayListDBTableView1Nome: TcxGridDBColumn;
    pnConfig: TPanel;
    rgConfig: TcxRadioGroup;
    tmrGravando: TTimer;
    btnGravar: TcxButton;
    btnAnterior: TcxButton;
    btnVoltar: TcxButton;
    btnPlayPause: TcxButton;
    btnStop: TcxButton;
    btnAvancar: TcxButton;
    btnProximo: TcxButton;
    btnSalvar: TcxButton;
    pnBarras: TPanel;
    lbFaixaAtual: TLabel;
    advMessage: TAdvSmartMessageBox;
    Panel1: TPanel;
    tbVolume: TAdvTrackBar;
    tbVelocidade: TcxTrackBar;
    procedure SpeechMikeControlSPMEventButton(ASender: TObject;
      lDeviceID: Integer; EventId: TOleEnum);
    procedure smAudioSoundLength(ASender: TObject; NewLength: Integer);
    procedure smAudioSoundPosition(ASender: TObject; NewPosition: Integer);
    procedure smAudioState(ASender: TObject; NewState: TOleEnum);
    procedure smAudioEOS(Sender: TObject);
    procedure Ac_InicioExecute(Sender: TObject);
    procedure Ac_VoltarExecute(Sender: TObject);
    procedure Ac_PlayPauseExecute(Sender: TObject);
    procedure Ac_PararExecute(Sender: TObject);
    procedure Ac_AvancarExecute(Sender: TObject);
    procedure Ac_FinalExecute(Sender: TObject);
    procedure Ac_GravarExecute(Sender: TObject);
    procedure Ac_SairExecute(Sender: TObject);
    procedure tbLinhaTempoChange(Sender: TObject);
    procedure pnPaiMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Ac_SalvarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbVolumeChange(Sender: TObject);
    procedure dxSkinController1SkinForm(Sender: TObject; AForm: TCustomForm;
      var ASkinName: string; var UseSkin: Boolean);
    procedure cxGridPlayListDBTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tmrGravandoTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbVelocidadePropertiesChange(Sender: TObject);
  private
    FAudioAtual: Integer;
    FModoGravacao: Boolean;
    FListaAudio: TDictionary<Integer, String>;
    FGravacaoIniciada: Boolean;
    FProcEnvArq: TProcEnviarArquivo;
    FFuncListDir: TFuncListarDiretorio;
    FFuncBaixarArquivo: TFuncBaixarArquivo;
    FOnFinish: TProc;

    FPosicaoTop: Integer;
    FPosicaoLeft: Integer;
    FSpeechMikeControlExterno: TSpeechMikeControl;

{$REGION 'Documentation'}
    /// <summary>Inicia a gravaçao do audio caso esteja em modo de
    /// gravação.</summary>
{$ENDREGION}
    procedure ppvIniciarGravacaoAudio;

{$REGION 'Documentation'}
    /// <summary>Salva o áudio que foi gravado.</summary>
{$ENDREGION}
    procedure ppvSalvarGravacao;

{$REGION 'Documentation'}
    /// <summary>Adiciona ao arquivo de áudio algumas informações
    /// personalizadas.</summary>
{$ENDREGION}

{$REGION 'Documentation'}
    /// <summary>Faz o upload o arquivo para o PServer</summary>
{$ENDREGION}
    procedure ppvConfigurarProgressBar(ipMostrar: Boolean; ipMax: Integer = 0);

{$REGION 'Documentation'}
    /// <summary>Realiza o download do PServer das faixas gravadas</summary>
{$ENDREGION}
    procedure ppvDownloadListaReproducao(ipEnderecos: TEnderecoArquivosRemotoDownload);

{$REGION 'Documentation'}
    /// <summary>Toca uma faixa de áudio</summary>
    /// <param name="ipPosicao">Numero da Faixa - Inicia em zero.</param>
{$ENDREGION}
    procedure ppvTocarAudio(ipPosicao: Integer);
    procedure ppvConfigurarEnabled(ipModoGravacao: Boolean);

{$REGION 'Documentation'}
    /// <summary>Funcao que pega o soundPosition ou SoundLength do componente
    /// de audio e converte para um TTime.</summary>
{$ENDREGION}
    function fpvCriarTimeBaseadoSoundPosition(ipPosition: Integer): TTime;

{$REGION 'Documentation'}
    /// <summary>Altera o valor do Position do tbLinhaTempo impedindo que o
    /// evento do tbLinhaTempo seja disparado.</summary>
{$ENDREGION}
    procedure ppvAlterarLinhaTempo(ipValor: Integer);
    procedure ppvShow;
    function fpvPegarEnderecoPastaUser(ipFolder: Integer;
      ipCanCreate: Boolean): string;
    procedure ppvGravarIni(ipEndereco, ipNomeArq, ipTabela, ipChave,
      ipValor: String);
    function fpvLerIni(ipEndereco, ipNomeArq, ipTabela,
      ipChave: String): String;

    procedure SetPosicaoLeft(const Value: Integer);
    procedure SetPosicaoTop(const Value: Integer);
    // tem que ficar no private, qualquer um que queria uma instancia desse cara deve chamar TfrmRecordPlayer.fpuGetInstancia
    constructor Create(AOwner: TComponent); override;
    procedure ppvReativarSpeechMikeExterno;
  public
    puEnderecoArquivoImportacao: string;
    FEndPastaArquivo: String;
    FEndArquivoSalvo: String;
    FEnderecoArquivoLocal: String;
    FFuncDefDir: TFuncDefinirDiretorio;
    FInfoArq: TPmf;
    FSalvarAudioLocal: Boolean; // usado em alguns caso quando outra tela usa o speechmike, nesse caso tenho q q desabilitado para nao intereferir nessa tela
    FProcGravarAudio: TProcGravarAudio;
    FProcGravarAudioSemVinculo: TProcGravarAudioSemVinculo;
    FInfoExame: TInfoExame;

    procedure ppvShowMessage(ipMsg: String);
    function ppvGerarArquivoCustomizado: String;
    procedure ppvUpload(ipEnderecoLocal, ipEnderecoRemoto: string);
{$REGION 'Documentation'}
    /// <summary>Abre o form para gravação</summary>
    /// <param name="ipInfoArq">Informações a serem gravadas junto ao
    /// arquivo.</param>
    /// <param name="ipFuncDefDir">Função do Pserver que cria o diretorio onde
    /// o arquivo será salvo no pserver</param>
    /// <param name="ipProcEnvArq">Procedure do PServer que faz o upload do
    /// arquivo.</param>
    /// <param name="ipOnFinish">Função que será chamada ao fechar este
    /// form</param>
{$ENDREGION}
    procedure ppuIniciarGravacao(ipInfoArq: TPmf; ipInfoExame: TInfoExame; ipFuncDefDir: TFuncDefinirDiretorio; ipProcEnvArq: TProcEnviarArquivo; ipProcGravarAudio: TProcGravarAudio; ipProcGravarAudioSemVinculo: TProcGravarAudioSemVinculo;
      ipOnFinish: TProc);

{$REGION 'Documentation'}
    /// <summary>Abre o form para reprodução das faixas gravadas</summary>
    /// <param name="ipEnderecoArquivos">Endereço do PServer onde se econtra os
    /// audios.</param>
    /// <param name="ipFuncListDir">Função do Pserver que retorna um TStrinList
    /// com a lista de todos os audios gravados.</param>
    /// <param name="ipFuncBaixarArq">Função do PServer que retorna o audio
    /// gravado.</param>
    /// <param name="ipOnFinish">Funcao que será chamada ao fechar este
    /// form.</param>
{$ENDREGION}
    procedure ppuIniciarReproducao(ipEnderecoArquivos: String; ipFuncListDir: TFuncListarDiretorio; ipFuncBaixarArq: TFuncBaixarArquivo; ipOnFinish: TProc);

{$REGION 'Documentation'}
    /// <summary>Retorna a localização (no servidor) da pasta onde o arquivo de áudio foi salvo.</summary>
{$ENDREGION}
    function fpuGetEndPastaArqSalvo: String;
    function fpuGetEndArquivoSalvo: String;

   // procedure static para criar e destruir o player
    class function fpuGetInstancia(ipSpeechMikeControl: TSpeechMikeControl = nil): TfrmRecordPlayer;

    property InfoArq: TPmf read FInfoArq;
    property PosicaoLeft: Integer read FPosicaoLeft write SetPosicaoLeft;
    property PosicaoTop: Integer read FPosicaoTop write SetPosicaoTop;
    // sera true apenas quando der erro durante o salvar e o usuario escolher salvar o audio localmente
    property SalvarAudioLocal: Boolean read FSalvarAudioLocal;
    property EnderecoArquivoLocal: String read FEnderecoArquivoLocal;
    property InfoExame: TInfoExame read FInfoExame;

  public const
    coGravando = 'Gravando';
    coParado = 'Parado';
    coPausado = 'Pausado';
    coTocando = 'Tocando';
    coVoltando = 'Voltando';
    coAvancando = 'Avançando';
    coInserindo = 'Inserindo';

    coLarguraForm = 290;
    coCorFundo = clBlack;
    coCorBarra = $00EEEEEE;
    coLarguraBarra = 10;
    coOffSet = 0;
    coBufferDowlnoad = 51200; // 50 kb. Tamanho do Pacote que iremos trazer cada vez que for no servidor buscar 1 pedaco do arquivo

    coDiretorioTemporario = 'Temp\Audios\';
    coDiretorioTemporarioDownload = 'Temp\Audios\Downloads\';
    coExtensaoArquivoTemporario = '.pmtemp';
    coExtensaoArquivoPmedico = '.pmf';
    coTempoRefreshBarraProgresso = 200; // refresh (em milisegundos) das barras de progresso
{$WRITEABLECONST ON}
    coEndConfig: String = '';
{$WRITEABLECONST OFF}
    coPMedicoPlayerConfig = 'pMedicoPlayer.ini';
    coConfigs = 'Configs';

    // const de config
    coPlayPressionado = 0;
    coPlayPressRelease = 1;
  end;

var
  FPlayer: TfrmRecordPlayer;

implementation


{$R *.dfm}


procedure TfrmRecordPlayer.ppuIniciarGravacao(ipInfoArq: TPmf; ipInfoExame: TInfoExame; ipFuncDefDir: TFuncDefinirDiretorio; ipProcEnvArq: TProcEnviarArquivo; ipProcGravarAudio: TProcGravarAudio;
  ipProcGravarAudioSemVinculo: TProcGravarAudioSemVinculo; ipOnFinish: TProc);
begin
  try
    FModoGravacao := true;
    ppvConfigurarEnabled(FModoGravacao);

    FInfoArq := ipInfoArq;
    FInfoExame := ipInfoExame;
    FFuncDefDir := ipFuncDefDir;
    FProcEnvArq := ipProcEnvArq;
    FProcGravarAudio := ipProcGravarAudio;
    FProcGravarAudioSemVinculo := ipProcGravarAudioSemVinculo;
    FOnFinish := ipOnFinish;

    case FInfoArq.TipoArquivo of
      taAudioWaveGSM610_11025HzMono:
        smAudio.AudioFormat := smxGSM610_11025HzMono;
    else
      raise Exception.Create('Tipo de áudio não suportado');
    end;

    FEndPastaArquivo := coEndConfig + coDiretorioTemporario;
    if not DirectoryExists(FEndPastaArquivo) then
      ForceDirectories(FEndPastaArquivo);

    Randomize;
    FEndPastaArquivo := FEndPastaArquivo + TRegex.Match(DateToStr(FInfoArq.Data), '\d+').Value + IntToStr(Random(10000)) + IntToStr(Random(1000));
    lbAutor.Caption := 'Autor: ' + FInfoArq.Autor;
    lbTitulo.Caption := FInfoArq.Titulo;
    lbSubTitulo.Caption := FInfoArq.SubTitulo;

  except
    ppvReativarSpeechMikeExterno; // esse codigo sempre precisa ser executado apos uma chamada a fpuGetInstancia ser feita
    raise;
  end;
  if Trim(puEnderecoArquivoImportacao) = '' then
    ppvShow
  else
    begin
      smAudio.CloseFile;
      smAudio.OpenFile(puEnderecoArquivoImportacao);
      ppvSalvarGravacao;
    end;
end;

procedure TfrmRecordPlayer.ppvConfigurarEnabled(ipModoGravacao: Boolean);
begin
  btnAnterior.Visible := not ipModoGravacao;
  btnProximo.Visible := not ipModoGravacao;
  btnGravar.Visible := ipModoGravacao;
  btnSalvar.Visible := ipModoGravacao;
  dockPlayList.Visible := not ipModoGravacao;
  lbFaixaAtual.Visible := not ipModoGravacao;
  pnConfig.Visible := not ipModoGravacao;
  tbVolume.Visible := ipModoGravacao;
  tbVelocidade.Visible := not ipModoGravacao;
  pnPai.Update;
  self.Update;
end;

procedure TfrmRecordPlayer.ppvShow;
var
  vaLeft, vaTop: Integer;
begin
  Show;
   // caso tenha sido informado a posicao, vou usala, caso nao, vou usar a posicao salva pela propria tela
  if (PosicaoLeft = -1) and TryStrToInt(fpvLerIni(coEndConfig, coPMedicoPlayerConfig, coConfigs, 'RecordPlayerLeft'), vaLeft) then
    PosicaoLeft := vaLeft;

  if (PosicaoTop = -1) and TryStrToInt(fpvLerIni(coEndConfig, coPMedicoPlayerConfig, coConfigs, 'RecordPlayerTop'), vaTop) then
    PosicaoTop := vaTop;

  if PosicaoTop > -1 then
    self.Top := PosicaoTop;

  if PosicaoLeft > -1 then // caso tenha sido informado a posicao, vou usala, caso nao, vou usar a posicao salva pela propria tela
    self.Left := PosicaoLeft

end;

procedure TfrmRecordPlayer.ppuIniciarReproducao(ipEnderecoArquivos: String; ipFuncListDir: TFuncListarDiretorio; ipFuncBaixarArq: TFuncBaixarArquivo; ipOnFinish: TProc);
var
  vaResultado: TStringList;
  I: Integer;
  vaTotal, vaAtual: String;
  vaEndereco: TEnderecoArquivosRemotoDownload;
begin
  try
    FModoGravacao := false;
    ppvConfigurarEnabled(FModoGravacao);

    FFuncListDir := ipFuncListDir;
    FFuncBaixarArquivo := ipFuncBaixarArq;
    FOnFinish := ipOnFinish;

    cdsLocalPlayList.CreateDataSet;

    vaResultado := TStringList.Create;
    try
    // vamos ver se foi passado um diretorio ou o endereço de um arquivo
      if TRegex.IsMatch(ipEnderecoArquivos, '(\.pmf)$', [roIgnoreCase]) then // arquivo
        vaResultado.Add('') // add vazio para que mais na frente o endereco fique certo, pois ipEnderecoArquivos ja é o endereco completo
      else
        vaResultado.LoadFromStream(ipFuncListDir(ipEnderecoArquivos + '*.pmf'));
      if vaResultado.Count = 0 then // nao tem nenhum arquivo de audio
        raise Exception.Create('Este Exame Não Possui Nenhuma Nota de Voz Gravada');
    // vamos preparar a lista para download dos arquivos
      if not DirectoryExists(coEndConfig + coDiretorioTemporarioDownload) then
        ForceDirectories(coEndConfig + coDiretorioTemporarioDownload);

      ppvConfigurarProgressBar(true, vaResultado.Count);
      try
        ppvShow;

        pbProgresso.Properties.ShowTextStyle := cxtsText;
        vaTotal := IntToStr(vaResultado.Count);
        for I := 0 to vaResultado.Count - 1 do
          Begin
            vaEndereco.EnderecoRemoto := ipEnderecoArquivos + vaResultado[I];
            vaEndereco.EnderecoLocal := coEndConfig + coDiretorioTemporarioDownload + ExtractFileName(vaEndereco.EnderecoRemoto);
            vaAtual := IntToStr(I + 1);
            pbProgresso.Properties.Text := 'Efetuando Download de Arquivos ' + vaAtual + ' de ' + vaTotal;

            ppvDownloadListaReproducao(vaEndereco);
            FListaAudio.Add(I, vaEndereco.EnderecoLocal);

            cdsLocalPlayList.Append;
            cdsLocalPlayListFAIXA.Asinteger := I;
            cdsLocalPlayListNOME.AsString := 'Faixa ' + Format('%2.2u', [I + 1]);
            cdsLocalPlayList.Post;
          End;

      finally
        ppvConfigurarProgressBar(false);
      end;

      ppvTocarAudio(0);
    finally
      FreeAndNil(vaResultado);
    end;
  except
    ppvReativarSpeechMikeExterno; // esse codigo sempre precisa ser executado apos uma chamada a fpuGetInstancia ser feita
    raise;
  end;

end;

procedure TfrmRecordPlayer.ppvTocarAudio(ipPosicao: Integer);
var
  vaStream, vaStreamAudio: TMemoryStream;
  vaArquivo: TPmf;
  vaTamanho: Integer;
  vaEndereco: String;
begin
  vaStream := TMemoryStream.Create;
  vaStreamAudio := TMemoryStream.Create;
  try
    if not FListaAudio.TryGetValue(ipPosicao, vaEndereco) then
      Begin
        ppvShowMessage('Arquivo de Áudio Não Localizado');
        exit;
      End;
    vaStream.LoadFromFile(vaEndereco);
    vaStream.Position := 0;
    vaStream.ReadBuffer(vaTamanho, SizeOf(Integer));
    vaStream.Position := SizeOf(Integer);
    vaStream.ReadBuffer(vaArquivo, vaTamanho);
    vaStream.Position := SizeOf(Integer) + vaTamanho;
    lbAutor.Caption := 'Autor: ' + vaArquivo.Autor;
    lbTitulo.Caption := vaArquivo.Titulo;
    lbSubTitulo.Caption := vaArquivo.SubTitulo;
    vaStreamAudio.CopyFrom(vaStream, (vaStream.Size - (SizeOf(Integer) + vaTamanho)));
    vaStreamAudio.Position := 0;
    case vaArquivo.TipoArquivo of
      taAudioWaveGSM610_11025HzMono:
        vaEndereco := StringReplace(vaEndereco, coExtensaoArquivoPmedico, '.wav', [rfReplaceAll]);
    else
      raise Exception.Create('Tipo de áudio não suportado');
    end;

    vaStreamAudio.SaveToFile(vaEndereco);

    smAudio.CloseFile;
    smAudio.OpenFile(vaEndereco);
    smAudio.Play;

    FAudioAtual := ipPosicao;
    if cdsLocalPlayList.Locate(cdsLocalPlayListFAIXA.FieldName, FAudioAtual, []) then
      lbFaixaAtual.Caption := cdsLocalPlayListNOME.AsString;
  finally
    FreeAndNil(vaStream);
    FreeAndNil(vaStreamAudio);
  end;
end;

procedure TfrmRecordPlayer.ppvDownloadListaReproducao(ipEnderecos: TEnderecoArquivosRemotoDownload);
var
  vaStream: TStream;
  vaFile: TFileStream;
  vaInicioStream: Int64;
  vaTamanhoTotal: Int64;
  vaPegarTotal: Boolean;
  vaTempo: TStopWatch;
begin
  vaFile := TFileStream.Create(ipEnderecos.EnderecoLocal, fmCreate);
  try
    FAudioAtual := 0;
    vaInicioStream := 0;

    vaTamanhoTotal := -1;
    vaPegarTotal := true;
    vaTempo := TStopWatch.StartNew;
    repeat
      vaStream := FFuncBaixarArquivo(ipEnderecos.EnderecoRemoto, vaInicioStream, coBufferDowlnoad, vaTamanhoTotal, vaPegarTotal);
      if vaPegarTotal then
        Begin
          pbProgresso.Properties.Max := vaTamanhoTotal;
          vaPegarTotal := false;
        End;
      vaFile.CopyFrom(vaStream, vaStream.Size);
      if vaTempo.Elapsed.TotalMilliseconds >= coTempoRefreshBarraProgresso then
        Begin
          pbProgresso.Position := vaInicioStream;
          vaTempo.stop;
          Application.ProcessMessages;
        End;
      vaInicioStream := vaInicioStream + vaStream.Size;
    until vaStream.Size < coBufferDowlnoad; // acredito que seja melhor comparar com o tamanho vaTamanhoTotal

    pbProgresso.Position := pbProgresso.Properties.Max;
    Application.ProcessMessages;
  finally
    vaFile.Free;
  end;
end;

procedure TfrmRecordPlayer.ppvIniciarGravacaoAudio;
begin
  if FModoGravacao then
    begin
      if not FGravacaoIniciada then
        begin
          smAudio.ActivateControlDevice;
          smAudio.NewFile;

          FGravacaoIniciada := true;
        end;
      smAudio.Record_;
    end;
end;

procedure TfrmRecordPlayer.Ac_AvancarExecute(Sender: TObject);
begin
  smAudio.FastForward;
end;

procedure TfrmRecordPlayer.Ac_FinalExecute(Sender: TObject);
begin
  if FAudioAtual < (FListaAudio.Count - 1) then
    begin
      Inc(FAudioAtual);
      ppvTocarAudio(FAudioAtual);
    end;
end;

procedure TfrmRecordPlayer.Ac_InicioExecute(Sender: TObject);
begin
  if FAudioAtual > 0 then
    begin
      Dec(FAudioAtual);
      ppvTocarAudio(FAudioAtual);
    end;
end;

procedure TfrmRecordPlayer.Ac_GravarExecute(Sender: TObject);
begin
  if smAudio.State = smxRecord then
    smAudio.RecordPause
  else
    ppvIniciarGravacaoAudio;
end;

procedure TfrmRecordPlayer.Ac_PararExecute(Sender: TObject);
begin
  if smAudio.State in [smxRecord, smxPlayback, smxRecordPause] then
    begin
      smAudio.stop;
      smAudio.SoundPosition := 0;
    end;
end;

procedure TfrmRecordPlayer.Ac_PlayPauseExecute(Sender: TObject);
begin
  if smAudio.State <> smxPlayback then
    begin
      smAudio.Play;
    end
  else
    begin
      smAudio.RecordPause;
    end;
end;

procedure TfrmRecordPlayer.Ac_SairExecute(Sender: TObject);
begin
  if smAudio.State = smxRecord then
    smAudio.stop;

  if FModoGravacao and (smAudio.SoundLength > 0) then
    begin
      if MessageDlg('Deseja salvar a gravação realizada?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
        begin
          ppvSalvarGravacao;
          exit;
        end;
    end;

  smAudio.CloseFile;
  close;
end;

procedure TfrmRecordPlayer.Ac_SalvarExecute(Sender: TObject);
begin
  ppvSalvarGravacao;
end;

procedure TfrmRecordPlayer.Ac_VoltarExecute(Sender: TObject);
begin
  smAudio.FastRewind;
end;

constructor TfrmRecordPlayer.Create(AOwner: TComponent);
begin
  inherited;
  FGravacaoIniciada := false;
  FSalvarAudioLocal := false;
  FListaAudio := TDictionary<Integer, String>.Create;

  try
    SpeechMikeControl.Initialize(WordBool(0));
    SpeechMikeControl.Activate;

    smAudio.Initialize;
  except
    raise Exception.Create('Para que esta opção funcione corretamente é necessário que o ' + slineBreak +
      'software SpeechMike esteja instalado em seu computador.');
  end;

  tbVolume.Position := StrToIntDef(fpvLerIni(coEndConfig, coPMedicoPlayerConfig, coConfigs, tbVolume.name), 50);
  rgConfig.ItemIndex := StrToIntDef(fpvLerIni(coEndConfig, coPMedicoPlayerConfig, coConfigs, rgConfig.name), 1);

  // teve que colocar a string aqui pq por algum motivo ao abrir a tela novamente ele nao limpa esse valor
  coEndConfig := fpvPegarEnderecoPastaUser(CSIDL_PERSONAL, true) + '\ProMedico\PMedicoPlayer\';

  FPosicaoTop := -1;
  FPosicaoLeft := -1;

  self.AutoSize := true;
end;

procedure TfrmRecordPlayer.cxGridPlayListDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  ppvTocarAudio(cdsLocalPlayListFAIXA.Asinteger);
end;

procedure TfrmRecordPlayer.dxSkinController1SkinForm(Sender: TObject;
  AForm: TCustomForm; var ASkinName: string; var UseSkin: Boolean);
begin
  UseSkin := false;
end;

function TfrmRecordPlayer.ppvGerarArquivoCustomizado: String;
var
  vaFile: TFileStream;
  vaStream: TMemoryStream;
  vaTamanho: Integer;
  vaEnderecoNovoArquivo: string;
begin
  Result := '';
  // queremos que as informacoes venham no comeco do arquivo e nao no final, por isso iremos usar o tfilestream
  vaFile := TFileStream.Create(FEndPastaArquivo, fmShareDenyWrite);
  vaStream := TMemoryStream.Create;
  try
    vaTamanho := SizeOf(FInfoArq);
    // primeira posicao sempre será o tamanho do type, dessa forma conseguimos recuperar a informacao mesmo que o type seja alterado
    vaStream.WriteBuffer(vaTamanho, SizeOf(Integer));
    // adicionando as informacoes customizadas
    vaStream.WriteBuffer(FInfoArq, vaTamanho);
    // fazendo append no arquivo de audio
    vaStream.CopyFrom(vaFile, 0);
    // trocando a extensao do arquivo
    vaEnderecoNovoArquivo := StringReplace(FEndPastaArquivo, coExtensaoArquivoTemporario, coExtensaoArquivoPmedico, [rfReplaceAll]);
    // salvando o arquivo
    vaStream.SaveToFile(vaEnderecoNovoArquivo);
    Result := vaEnderecoNovoArquivo;
  finally
    FreeAndNil(vaFile);
    FreeAndNil(vaStream);
  end;

end;

procedure TfrmRecordPlayer.ppvConfigurarProgressBar(ipMostrar: Boolean; ipMax: Integer);
begin
  pbProgresso.Visible := ipMostrar;
  pbProgresso.Properties.ShowTextStyle := cxtsPercent;

  if ipMostrar then
    if ipMax > 0 then
      pbProgresso.Properties.Max := ipMax;

end;

procedure TfrmRecordPlayer.ppvUpload(ipEnderecoLocal, ipEnderecoRemoto: string);
var
  vaArquivo: TFileStream;
  vaStream: TStream;
  vaPosicaoStream: Int64;
  vaTamanhoBuffer: Integer;
  vaTamanhoTotal: Int64;
  vaCopyFrom: Integer;
  vaTempo: TStopWatch;
begin
  inherited;
  vaArquivo := TFileStream.Create(ipEnderecoLocal, fmShareDenyWrite);
  vaTamanhoTotal := vaArquivo.Size;

  vaTamanhoBuffer := 64000;
  if vaTamanhoTotal < 64000 then
    vaTamanhoBuffer := vaTamanhoTotal;

  vaPosicaoStream := 0;
  ppvConfigurarProgressBar(true, vaTamanhoTotal);
  vaTempo := TStopWatch.StartNew;
  try
    while vaPosicaoStream <= vaTamanhoTotal do
      Begin
        vaStream := TMemoryStream.Create;
        vaArquivo.Position := vaPosicaoStream;
        if (vaPosicaoStream + vaTamanhoBuffer) <= vaTamanhoTotal then
          vaStream.CopyFrom(vaArquivo, vaTamanhoBuffer)
        else
          Begin
            vaCopyFrom := vaArquivo.Size;
            vaCopyFrom := vaCopyFrom - vaArquivo.Position;
            vaStream.CopyFrom(vaArquivo, vaCopyFrom);
          End;
        vaStream.Position := 0;
        // envia para o pServer
        FProcEnvArq(ipEnderecoRemoto, vaPosicaoStream, vaStream);
        vaPosicaoStream := vaPosicaoStream + vaTamanhoBuffer;
        // refresh
        // refresh na tela
        if vaTempo.Elapsed.TotalMilliseconds >= coTempoRefreshBarraProgresso then
          Begin
            pbProgresso.Position := vaPosicaoStream;
            vaTempo.stop;
            vaTempo.Reset;
            vaTempo.Start;
            Application.ProcessMessages;
          End;
        // ipStream.Free; nao podemos fazer o free no ipstream neste momento, o datasnap cuida disso pelo jeito
      end;
    pbProgresso.Position := vaTamanhoTotal;
  finally
    ppvConfigurarProgressBar(false);
    vaArquivo.Free;
  end;

end;

procedure TfrmRecordPlayer.SetPosicaoLeft(const Value: Integer);
begin
  if Value < 0 then
    FPosicaoLeft := 0
  else if Value > Screen.WorkAreaWidth then
    FPosicaoLeft := Screen.WorkAreaWidth
  else
    FPosicaoLeft := Value;
end;

procedure TfrmRecordPlayer.SetPosicaoTop(const Value: Integer);
begin
  if Value < 0 then
    FPosicaoTop := 0
  else if Value > Screen.Height then
    FPosicaoTop := Screen.Height
  else
    FPosicaoTop := Value;
end;

procedure TfrmRecordPlayer.ppvSalvarGravacao;
var
  vaEnderecoArquivoRemoto, vaEndTemp: String;

  function flDefinirDiretorioEnviar: Boolean;
  begin
    Result := false;
    try
    // definindo o diretorio que sera utilizado no server para salvar o arquivo
      vaEnderecoArquivoRemoto := FFuncDefDir(FInfoArq.Codigo, DateToStr(FInfoArq.Data), Ord(FInfoArq.TipoArquivo));
          // adicionando as informacoes do arquivo junto ao arquivo de audio e renomeando para a extensao .pmf
      vaEnderecoArquivoRemoto := vaEnderecoArquivoRemoto + '\' + ExtractFileName(FEnderecoArquivoLocal);
      if (vaEnderecoArquivoRemoto <> '') and (FEnderecoArquivoLocal <> '') then
        ppvUpload(FEnderecoArquivoLocal, vaEnderecoArquivoRemoto);

      Result := true;
// vamos gravar o endereo no banco agora
    except
      on E: Exception do
        begin
          case TfrmMessageTela.fpuMsg('Houve um erro ao enviar o arquivo. Detalhes:' + slineBreak + E.Message + slineBreak + 'O que deseja fazer?',
            ['Tentar Novamente', 'Salvar Local', 'Descartar Áudio'], [ibOK_SIM, ibOK_SIM, ibRETORNAR], icINTERROGACAO, 0, true, false) of
            0: // tentar novamente
              Result := flDefinirDiretorioEnviar;
            1:
              FSalvarAudioLocal := true; // salvar local
            2:
              exit; // abortar
          end;
        end;
    end;
  end;

  function flGravarBanco: Boolean;
  var
    vaFuncaoNaoDefinida: Boolean;
  begin
    Result := false;
    vaFuncaoNaoDefinida := false;
    try
      if FInfoArq.Codigo <> 0 then
        begin
          if Assigned(FProcGravarAudio) then
            FProcGravarAudio(FInfoArq.Codigo, FEndPastaArquivo)
          else
            vaFuncaoNaoDefinida := true;

          Result := true;
        end
      else if Assigned(FProcGravarAudioSemVinculo) then // nao tem vinculo do exame com nenhum exame
        begin
          FProcGravarAudioSemVinculo(FInfoExame.NomePaciente, DateToStr(now), DateToStr(FInfoExame.DataExame), FEndArquivoSalvo, FInfoExame.NomeProcedimento, FInfoExame.ExameUid);
          Result := true;
        end
      else // em teoria nunca vai acontecer
        vaFuncaoNaoDefinida := true;
    except
      on E: Exception do
        begin
          case TfrmMessageTela.fpuMsg('Houve um erro ao gravar no banco. Detalhes:' + slineBreak + E.Message + slineBreak + 'O que deseja fazer?',
            ['Tentar Novamente', 'Salvar Local', 'Descartar Áudio'], [ibOK_SIM, ibOK_SIM, ibRETORNAR], icINTERROGACAO, 0, true, false) of
            0: // tentar novamente
              Result := flGravarBanco;
            1:
              FSalvarAudioLocal := true; // salvar local
            2:
              exit; // abortar
          end;
        end;
    end;

    if vaFuncaoNaoDefinida then
      raise Exception.Create('Nenhuma função de gravação foi definida.' + slineBreak + 'O áudio foi enviado porém não foi salvo no banco de dados.');
  end;

begin
  if smAudio.State <> smxNoSoundFile then
    smAudio.stop;

  if smAudio.SoundLength > 0 then
    begin
      if Assigned(FFuncDefDir) then
        begin
          if Assigned(FProcEnvArq) then
            begin

          // salvando o audio para o disco
              smAudio.SaveFileAs(FEndPastaArquivo);
              vaEndTemp := smAudio.FileName;
              smAudio.CloseFile;

          // o savefileas salvou um arquivo com uma extensao .wav, vou renomear para ficar com a extensao do promedico
              TFile.Move(vaEndTemp, FEndPastaArquivo + coExtensaoArquivoTemporario);
          // adicionando a estensao do promedico ao nome do arquivo
              FEndPastaArquivo := FEndPastaArquivo + coExtensaoArquivoTemporario;

              FEnderecoArquivoLocal := ppvGerarArquivoCustomizado;

              if flDefinirDiretorioEnviar then
                begin
                  FEndArquivoSalvo := vaEnderecoArquivoRemoto;
                  FEndPastaArquivo := ExtractFilePath(FEndArquivoSalvo);

                  if flGravarBanco then
                    ppvShowMessage('Áudio salvo com sucesso !!!');
                end;
              close;

            end
          else
            raise Exception.Create('A função de enviar o arquivo não foi definida.');
        end
      else
        raise Exception.Create('A função de definir o diretório do arquivo não foi informada.');
    end
  else
    raise Exception.Create('Nenhum audio foi gravado para ser salvo.');

end;

procedure TfrmRecordPlayer.ppvShowMessage(ipMsg: String);
begin
  with advMessage.Messages.Add do
    Begin
      MinDuration := 1000;
      MaxDuration := 1000;
      Text := ipMsg;
      Show;
    End;

end;

procedure TfrmRecordPlayer.smAudioEOS(Sender: TObject);
begin
  ppvSalvarGravacao;
end;

procedure TfrmRecordPlayer.smAudioSoundLength(ASender: TObject;
  NewLength: Integer);
var
  vaTempo: TTime;
begin
  tbLinhaTempo.Max := NewLength;
  vaTempo := fpvCriarTimeBaseadoSoundPosition(NewLength);
  if MinuteOf(vaTempo) > 59 then
    begin
      Ac_PararExecute(nil);
      lbStatus.Caption := 'Tempo máximo (59 min).';
    end;

  lbTempoTotal.Caption := TimeToStr(fpvCriarTimeBaseadoSoundPosition(NewLength));
end;

function TfrmRecordPlayer.fpvCriarTimeBaseadoSoundPosition(ipPosition: Integer): TTime;
var
  vaPosition, vaSeg, vaMin, vaHora: Integer;
begin
  vaPosition := ipPosition; // position esta em milisegundos

  vaSeg := vaPosition div 1000; // quantidade em segundos
  vaMin := vaSeg div 60; // em minutos
  vaHora := vaMin div 60; // em horas

  if vaSeg > 59 then // se deu mais do que 59 seg, entao pego o resto da divisao por 60 pra saber o valor correto, pois nao existe 61 segs.
    vaSeg := vaSeg mod 60;

  if vaMin > 59 then
    vaMin := vaMin mod 60;

  if vaHora > 23 then
    vaHora := vaHora Mod 24;

  Result := encodeTime(vaHora, vaMin, vaSeg, 0);
end;

procedure TfrmRecordPlayer.ppvAlterarLinhaTempo(ipValor: Integer);
begin
  tbLinhaTempo.OnChange := nil;
  try
    tbLinhaTempo.Position := ipValor;
  finally
    tbLinhaTempo.OnChange := tbLinhaTempoChange;
  end;
end;

procedure TfrmRecordPlayer.smAudioSoundPosition(ASender: TObject;
  NewPosition: Integer);
begin
  if NewPosition <> tbLinhaTempo.Position then
    ppvAlterarLinhaTempo(NewPosition);

  lbTempoAtual.Caption := TimeToStr(fpvCriarTimeBaseadoSoundPosition(NewPosition));
end;

procedure TfrmRecordPlayer.tmrGravandoTimer(Sender: TObject);
begin
  if (smAudio.State = smxRecord) then
    begin
      lbStatus.Font.Color := clRed;
      lbStatus.Visible := not lbStatus.Visible;
    end
  else
    begin
      lbStatus.Font.Color := clWhite;
      lbStatus.Visible := true;
    end;
end;

procedure TfrmRecordPlayer.smAudioState(ASender: TObject; NewState: TOleEnum);
  procedure plAjustarVisible(ipVisible: Boolean);
  begin
    btnPlayPause.Visible := ipVisible;
    btnStop.Visible := ipVisible;

    if ipVisible then
      begin
        btnGravar.Left := 0;
        btnAnterior.Left := btnGravar.Left + 10;
        btnVoltar.Left := btnAnterior.Left + 10;
        btnPlayPause.Left := btnVoltar.Left + 10;
        btnStop.Left := btnPlayPause.Left + 10;
        btnAvancar.Left := btnStop.Left + 10;
        btnProximo.Left := btnAvancar.Left + 10;
        btnSalvar.Left := btnProximo.Left + 10;
      end;
  end;

begin
  if NewState <> smxRecord then
    begin
      plAjustarVisible(true);
      lbStatus.Font.Color := clWhite;
      Ac_Gravar.ImageIndex := 4; // icone do gravar
    end
  else
    begin
      if NewState = smxRecord then
        Ac_Gravar.ImageIndex := 12 // icone do pausar
    end;

  if NewState <> smxPlayback then
    Ac_PlayPause.ImageIndex := 3 // icone do play
  else
    Ac_PlayPause.ImageIndex := 2; // icone do pause

  case NewState of
    smxRecord:
      begin
        plAjustarVisible(false);
        lbStatus.Font.Color := clRed;
        case smAudio.RecordMode of
          smxOverwrite:
            lbStatus.Caption := coGravando;
          smxInsert:
            lbStatus.Caption := coInserindo;
        end;
      end;
    smxStop:
      begin
        lbStatus.Caption := coParado;
      end;
    smxPlayback:
      begin
        lbStatus.Caption := coTocando;
      end;
    smxRecordPause:
      begin
        lbStatus.Caption := coPausado;
      end;
    smxFastRewind:
      lbStatus.Caption := coVoltando;
    smxFastForward:
      lbStatus.Caption := coAvancando;
  end;

end;

procedure TfrmRecordPlayer.ppvGravarIni(ipEndereco, ipNomeArq, ipTabela, ipChave, ipValor: String);
var
  vaServerIni: TIniFile;
begin
  vaServerIni := TIniFile.Create(ipEndereco + ipNomeArq);
  try
    vaServerIni.WriteString(ipTabela, ipChave, ipValor);
  finally
    vaServerIni.Free;
  end;
end;

function TfrmRecordPlayer.fpvLerIni(ipEndereco, ipNomeArq, ipTabela, ipChave: String): String;
var
  ServerIni: TIniFile;
begin
  ServerIni := TIniFile.Create(ipEndereco + ipNomeArq);
  try
    Result := ServerIni.ReadString(ipTabela, ipChave, '');
  finally
    ServerIni.Free;
  end;
end;

procedure TfrmRecordPlayer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
  // finaliza os controles, e termina de salvar o arquivo.
    SpeechMikeControl.Deactivate;
    SpeechMikeControl.Deinitialize;

    smAudio.DeactivateControlDevice;
    smAudio.Deinitialize;

    if Assigned(FListaAudio) then
      FListaAudio.Free;

    if (not FModoGravacao) and (cdsLocalPlayList.Active) then
      cdsLocalPlayList.EmptyDataSet;

  // apagando os arquivos que foram baixados
    if TDirectory.Exists(coEndConfig + coDiretorioTemporarioDownload) then
      TDirectory.Delete(coEndConfig + coDiretorioTemporarioDownload, true);

    ppvGravarIni(coEndConfig, coPMedicoPlayerConfig, coConfigs, rgConfig.name, IntToStr(rgConfig.ItemIndex));
    ppvGravarIni(coEndConfig, coPMedicoPlayerConfig, coConfigs, tbVolume.name, IntToStr(tbVolume.Position));
    ppvGravarIni(coEndConfig, coPMedicoPlayerConfig, coConfigs, 'RecordPlayerLeft', IntToStr(self.Left));
    ppvGravarIni(coEndConfig, coPMedicoPlayerConfig, coConfigs, 'RecordPlayerTop', IntToStr(self.Top));

    if Assigned(FOnFinish) then
      FOnFinish;

  finally // coloquei no finally para garantir q vai executar esse codigo
    ppvReativarSpeechMikeExterno;
  end;
end;

procedure TfrmRecordPlayer.FormCreate(Sender: TObject);
begin
  smAudio.GlobalPlaybackSpeed := 50;
end;

procedure TfrmRecordPlayer.ppvReativarSpeechMikeExterno;
begin
  if Assigned(FSpeechMikeControlExterno) then
    begin
      try
        FSpeechMikeControlExterno.Initialize(WordBool(0));
        FSpeechMikeControlExterno.Activate;
      except
        // vamos ignorar
      end;
    end;
end;

Function TfrmRecordPlayer.fpvPegarEnderecoPastaUser(ipFolder: Integer; ipCanCreate: Boolean): string;
var
  vaFilePath: array [0 .. 255] of Char;
begin
  SHGetSpecialFolderPath(0, @vaFilePath[0], ipFolder, ipCanCreate);
  Result := vaFilePath;
end;

function TfrmRecordPlayer.fpuGetEndArquivoSalvo: String;
begin
  Result := FEndArquivoSalvo;
end;

function TfrmRecordPlayer.fpuGetEndPastaArqSalvo: String;
begin
  Result := FEndPastaArquivo;
end;

class function TfrmRecordPlayer.fpuGetInstancia(ipSpeechMikeControl: TSpeechMikeControl): TfrmRecordPlayer;
begin
  if Assigned(FPlayer) and (FPlayer.Showing) then
    raise Exception.Create('A tela de gravação/reprodução do Áudio já esta aberta.');

  // vamos destruir caso ja tenha sido criado  uma vez, isso é necessario pq quando a tela foi feita nao se pensou em reutiliza-la, entao sempre tem q criar e destuir
  if Assigned(FPlayer) then
    FreeAndNil(FPlayer);

  try
    FPlayer := TfrmRecordPlayer.Create(nil);
    FPlayer.FSpeechMikeControlExterno := ipSpeechMikeControl;

    // caso algum spikeMikeControl tenha sido informado, vou desativa-lo para garantir q nao vai interferir no player (utilizando no Workstation pois o pprincipal tbm tem um speechmikecontrol)
   // durante o onclose ele sera inicializado novamente
    if Assigned(ipSpeechMikeControl) then
      begin
        try
          ipSpeechMikeControl.Deactivate;
          ipSpeechMikeControl.Deinitialize;
        except
          on E: Exception do
        // se der exception é pq nao esta instalado o speeckmikecontrol, portanto no create nao foi inicializado, mas nao mostro mensagem algum lá.
            raise Exception.Create('O SpeechMikeControl não foi inicializado corretamente.' + slineBreak +
              'Certifique-se que o software Philips Device Control Center está instalado em seu computador. Detalhes:' + slineBreak + E.Message);
        end;
      end;

  except
    on E: Exception do
      Begin
        raise Exception.Create('Problemas ao tentar acessar a gravção do áudio, verifique a instalação do Philips Device Control Center' + slineBreak + ' Detalhes: ' + E.Message);
      end;
  end;

  Result := FPlayer;
end;

procedure TfrmRecordPlayer.pnPaiMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(self.Handle, WM_SYSCOMMAND, 61458, 0);
end;

procedure TfrmRecordPlayer.SpeechMikeControlSPMEventButton(ASender: TObject;
  lDeviceID: Integer; EventId: TOleEnum);
begin
  if Showing then
    begin
      if not FModoGravacao then
        begin
          case EventId of
            spmFastRewindPressed:
              btnVoltar.click;
            spmFastRewindReleased, spmFastForwardReleased:
              btnPlayPause.click;
            spmFastForwardPressed:
              btnAvancar.click;
            spmPlayPressed:
              begin
                if rgConfig.ItemIndex = coPlayPressionado then
                  if smAudio.State <> smxPlayback then
                    smAudio.Play;
              end;
            spmPlayReleased:
              begin
                if rgConfig.ItemIndex = coPlayPressRelease then
                  btnPlayPause.click
                else if rgConfig.ItemIndex = coPlayPressionado then
                  if smAudio.State = smxPlayback then
                    smAudio.RecordPause;
              end;
          end;
        end
      else
        begin
          case EventId of
            spmFunction1Released:
              ppvSalvarGravacao;
            spmRecordReleased:
              btnGravar.click;
          end;
        end;
    end;
end;

procedure TfrmRecordPlayer.tbLinhaTempoChange(Sender: TObject);
begin
  if smAudio.State in [smxStop, smxRecordPause] then
    begin
      smAudio.SoundPosition := tbLinhaTempo.Position;
    end;
end;

procedure TfrmRecordPlayer.tbVelocidadePropertiesChange(Sender: TObject);
begin
  case tbVelocidade.Position of
    0: smAudio.GlobalPlaybackSpeed := 0;
    1: smAudio.GlobalPlaybackSpeed := 50;
    2: smAudio.GlobalPlaybackSpeed := 100;
  end;
end;

procedure TfrmRecordPlayer.tbVolumeChange(Sender: TObject);
begin
  smAudio.GlobalWaveInVolume := tbVolume.Position;
end;

initialization

FPlayer := nil;
RegisterClasses([TfrmRecordPlayer, TSmAudio, TSpeechMikeControl]);

finalization

if Assigned(FPlayer) then
  FreeAndNil(FPlayer)

end.
