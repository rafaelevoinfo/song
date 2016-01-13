unit pMethod2009;

interface

uses
  AdvSmoothMessageDialog, TLHelp32, pTypes, System.IOUtils, ppDB, ppmClasse,
  AdvStyleIF,
  Math,
  GDIPFill,
  Printers, cxEdit,
  RegularExpressions,
  Forms, DBClient, DB, SysUtils, DBCtrls, Windows, Variants, Dialogs, Grids,
  Messages, ComCtrls, ExtCtrls, jpeg, StdCtrls, ExtDlgs, Classes, Cripto, Gauges,
  URLMon, IniFiles, idHashMessageDigest, idHash, ComObj, ShellAPI, StrUtils,

  System.Json,
  Firedac.Comp.Client,

  cxGridDBTableView, Mask, Graphics, Buttons, Controls, DBXJSon, cxRichEdit,
  RichEdit, SHLOBJ, ZLib, SqlExpr, Generics.Collections, cxCustomPivotGrid, cxDBPivotGrid, pCarregarDados, cxGraphics,
  Datasnap.DSConnect, pmSQLConnection, dxGDIPlusClasses, CRVData, RVTable, RVStyle, pUtils,
  Data.SqlTimSt, System.DateUtils;

type
  TVersaoInfo = (viMaJorVersion, viMinorVersion, viRelease, viBuild);

  TEventos = class // classe 'burra' para controlar eventos de componentes dinamicos, ainda sem uso
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function StringToTipoHonomedFuncao(ipFuncao: String): TTipoHonomedFuncao;

procedure pmSetFocus(ipObject: TObject);
function fpuCriarVaResultList(ipTexto: string): TStringList;
procedure AtribuirValoresInfoRegistro(ipClientDataSet: TClientDataSet; var ioInformacoesRegistro: array of string);
procedure AtribuirValoresClientDataSet(ipInformacoesRegistro: array of string; ipClientDataSet: TClientDataSet);

procedure DateDiff(ipDate1, ipDate2: TDateTime; var ioDia, ioMes, ioAno: Word);

function Pegar_Idade(ipDataNascimento, ipData_Referencia: TDate; ipCalcularMeses1Ano: Boolean = True): string;

procedure Idade_Exata(Data_Nascimento, Data_Atual: TDate; var Idade: Integer; var IdadeEm: String);

function VersaoExe(const ipFileName: string; const ipVersaoAte: TVersaoInfo): String;
function ImpressoraPadrao: String; // Retorna a impressora padr�o do windows

function VerificaDataPadrao(const ipDataInicial, ipDataFinal, ipDataAtual: TDateTime; ipMostrarMensagem: Boolean = True): Boolean;
function AbrirExplorer(OpenAtPath: string; OpenWithExplorer, OpenAsRoot: Boolean): Boolean;

function TemParametro(ipParametro: String): Boolean;
function TryGetParametroChaveValor(ipNomeChave: String; out ipValor: String; ipSeparador: String = ':'): Boolean;
function RemoveAcentos(ipTexto: String): String;
Procedure RemoverDiretorio(Const sPath: String);

function VerificaCodigoBarras(ipCodigoBarras: String): Boolean;

function ValidaEAN(CodBar: string): Boolean;

procedure RemoverArquivosDiretorio(ipEndereco: string);
function BoolToInt(ipBoolean: Boolean): Integer; // retornar 0 para false e 1 para true;
function FormAtivo(ipFormNome: String): Boolean; // testa se o form est� ativo
function SubstituiTextoCDS(const ipTexto, ipTagInicio, ipTagFim, ipTextoEntreTag: String; const ipCDS: TDataSet): String;
function JSONArrayToString(ipJSONArray: TJSONArray; ipCampo: String): String; // recebe um JSONArray e o campo que deseja pegar e retorna o valor do campo;
function CompactarArquivo(ipEndNomeArquivoOriginal, ipEndNomeArquivoCompac: String; ipCompressao: TCompressionLevel): String;
function DesCompactarArquivo(ipEndNomeArquivoOriginal, ipEndNomeArquivoCompac: String; ipCompressao: TCompressionLevel): String;
function InternaQtdeIntervalo(ipIntervalo: Integer): Double; // Receber um intervalo e retorna a qtde em um dia;
procedure CopiarRegistroCds(ipDataSetOrigem: TDataSet; ipDataSetCopia: TDataSet; ipCriar_Fields: Boolean); overload;
// procedure CopiarRegistroCds(ipDataSetOrigem, ipDataSetCopia: TDataSet; ipCriar_Fields: Boolean); overload;

procedure AjustaColunacxGrid(ipTamanhoJaUtilizado, ipColunaObs: Integer; ipcxGridDBTableView: TcxGridDBTableView);
function SysPegaEndereco(ipFolder: Integer; ipCanCreate: Boolean): string; // fun��o que retorna o endere�o padr�o do windows;
function SysNomeComputador: string; { Retorna o nome do computador }
procedure JSONArrayToClientDataSet(ipJSONArray: TJSONArray; ipCDS: TClientDataSet);
function Ajustar_Tamanho_Str(Original: String; Tamanho: Integer): String; // caso a string seja maior, corta 1 pedaco, caso seja menor, preenche com ' ' a direita by waldir
procedure Justify(ipRichEdit: TRichEdit); // Usando TRichEdit
function SetJSon(ipNomeCampo: String; ipJSON: TJSONObject): Variant; // fun��o que recebe um JSON e sua codifica��o e retorna o valor;
function DataFeriado(ipData: TDateTime = 0): Boolean;
function IncDiaUtil(ipData: TDateTime; ipQtdeDias: Integer): TDateTime;
function RoundTo(ipValorBase: Double; ipCasas: Integer): Double;
function CoalesceTexto(const ipTexto: String): String; overload;
function CoalesceTexto(const ipTexto, ipTextoRet: String): String; overload;

function Capitalize(ipString: string): String;
function verPalavraSensurada(const ipTexto: String; ipMostrarMensagem: Boolean): String;

function verPalavraReservadaBanco(const ipTexto: String; ipMostrarMensagem: Boolean): String;
function XlsToStringGrid(ipAGrid: TStringGrid; ipGauge: TGauge; ipXLSFile: string): Boolean;
function Mask_Cep(Texto: String): String; // fun��o para colocar os pontos no cep
procedure FocusPrimaryDB(ipFormFocus: TForm; ipDataSource: TDataSource);
function BooleanToStr(ipBoolean: Boolean): String; // fun��o que recebe um valor boolean e retorna 0 ou 1, 0 = False e 1 = True;
procedure DataHoraInc(ipData: TDate; ipHora: TTime; var opDataHora: TDateTime);
function Verifica_Email(ipForm: TForm; ipEmail, ipCampo: string; ipMostrarMensagem: Boolean = True): String;
function MaskCpf_Cnpj(Texto: String): String; // by Eliomar fun��o para colocar os pontos do cpf ou cnpj;
function VerificaCPF_CNPJ(ipForm: TForm; ipDoc, ipCampo: String): Boolean; // esta fun��o ir� receber um valor string e retornar verificar se o cpf ou cnpj passado � valido ou n�o;
procedure Atualizar(ipForm: TForm; ipEnderecoHttp, ipDiretorio, ipArquivoWeb, ipArquivoOriginal, ipNomeSoftware, ipExecutar, ipPaginaComercial: String);
function LerIni(arquivo_endereco, arquivo_nome, tabela_ini, campo_ini: String): String; overload;
procedure GravarIni(arquivo_endereco, arquivo_nome, tabela_ini, campo_ini, valor_ini: String);
function DownloadFile(Source, Dest: string): Boolean; // Esta fun��o baixa o arquivo da net e salva na pasta no computador.
function CriptoDecripto(ipCripDecrip: Integer; ipKey, ipTexto: String): String;
function DiferencaTempo(ipDataHoraInicial, ipDatahoraFinal: TDateTime): String;
function SoNumeros(ipTexto: String): String; overload; // by Eliomar fun��o para pegar a string e deixar somente numeros e retorna tb numeros;
function SoNumeros(ipTexto, ipDefault: String): String; overload; // by Eliomar fun��o para pegar a string e deixar somente numeros, se n�o tiver nada retornar o texto ipDefault;
function SoLetrasNumeros(ipTexto: string): string; // by waldir jr funcao que retorna apenas letras e numeros de uma string
function SoLetras(ipTexto: string): string; // by waldir jr. funcao que retorna apenas as letras da string informada
function Preenchimento(ipTexto: String; ipCaractere: Char; ipTamanho, ipPosicaoPreenchimento: Integer): String; overload;
function Preenchimento(ipTexto: String; ipText: Char; ipTamanho: Integer; ipAdireita: Boolean): String; overload;
procedure GravaLog(const ipDiretorio, ipMensagem: String);
function MessageTela(const ipGravarLog: Boolean; ipQtde_Btn: Integer; const ipMensagem: String; const ipTempoSegundos, ipTempoMilesegundos: Integer; const ipHeight: Integer = 240; const ipWidth: Integer = 480): Integer; overload;
function MessageTela(const ipGravarLog: Boolean; ipQtde_Btn: Integer; const ipMensagem: String; const ipTempoSegundos: Integer): Integer; overload;
// fun��o ir� chamar uma tela para que o usuario possa escolher N�o, Sim ou Cancelar/OK: sendo N�o = 0, Sim = 1 Cancelar / OK = 2;
function MessageTela(const ipMensagem: String): Integer; overload; // fun�ao que ira considerar que � uma mensagem padrao que vai chamar outra message tela passando MessageTela(False, 1, ipMsg, 0);
// fun��o ir� chamar uma tela para que o usuario possa escolher N�o, Sim ou Cancelar/OK: sendo N�o = 0, Sim = 1 Cancelar / OK = 2;
procedure SetFocus_Campo(ipFormFocus: TForm; ipCampo: String);
function Campos_Requeridos(ipForm: TForm; ipDataSet: TDataSet): String; overload;

function Campos_Requeridos(ipDataSet: TDataSet): TField; overload;
procedure Tab_To_Enter(Sender: TWinControl; var Key: Char); // esta repetida na unit_util, tem que ser assim por enquanto ate deixar
procedure Load_Img(var ip_img: TImage; ip_imgbd: TBlobField); // funcao que carrega uma img de 1 bd para 1 timage by junior
function Arq_Md5(const fileName: string): string;
function MD5_Stream(ipStream: TMemoryStream): string;
function MD5_String(ipString: string): string;
function VirgulaToPonto(Valor: Double): String; Overload;
function VirgulaToPonto(Valor: Real; Casas_Decimais: Integer): String; Overload;
function PontoToVirgulaComDecimais(ipValor: String): Double;
function IntToStrZero(Valor, Tamanho: Integer): String; overload;
function IntToStrZero(Tipo: String; Valor, Tamanho: Integer): String; overload;
function IntToStrZeroFinal(Valor, Tamanho: Integer): String;
function SenhaDiaria: String;
function Gera_SenhaPMedico(NSerie, DLicen: String): String;
function TamanhoArq(fileName: string): Int64; // funcao para descobrir o tamanho de algum arquivo
function Pegar_Dir_Temp: String; // funcao para poder pegar o diretorio temporario do windows
function Pegar_Arq_Temp: String; // funcao pra poder pegar um arquivo temporario do windows
procedure Extrair_Res(ipDir, ipArq, ipNomeRes, ipTipoRes: String; ipSobrepor: Boolean); // procedure para extrair arquivos res
procedure SalvarLayoutGrid(ipEndConfig: String; ipGridView: TcxGridDBTableView; ipNomeGrid: String; ipIgnorarValidacoes:Boolean = false); // salva os grids cxgrid (na verdade os tablesviews)
procedure RestoreLayoutGrid(ipEndConfig: String; ipGridView: TcxGridDBTableView; ipNomeGrid: String; ipIgnorarValidacoes:Boolean = false); // restaura os grids cxgrid (na verdade os tablesviews)
procedure Espera_Tempo(Quanto_Tempo: TDateTime);
function ValiData(Teste_Data, Base_Data, Teto_Data: TDateTime): Boolean; // valida a data
function FatMult(PercInicial: Double; Qtde: Integer): Double;
function StrInicio(Tipo, Valor: String; Tamanho: Integer): String; // Completa o inicio de uma string com algum valor
function ObterDataSis(Var Data: String): Boolean; // Esta fun��o retorna true se for pressionado OK e false em caso contr�rio.Se for OK, o texto digitado pelo usu�rio ser� copiado para a vari�vel Data}
function ExecutarPrograma(const fileName, Params: string; const WindowState: Word): Boolean; // Esta fun��o chama um programa externo... E aguarda at� que finalize o programa
procedure AjustaTamanhoTela(ipForm: TForm); overload;
procedure AjustaTamanhoTela(ipForm: TForm; ipWidth, ipHeigth: Integer); overload;
function RetornaTeclaString(ipTecla: Word): string;
procedure ReinciarAplicativo;

procedure AppendToRichEdit(const Source, destination: TcxRichEdit);

procedure ConcatRichEdit(const Source, destination: TcxRichEdit);

function HtmlParaColor(ipCor: String): TColor;

function FocarForm(hwnd: THandle): Boolean;

procedure ResizeImg(var ipImg: TBitmap; ipLargura, ipAltura: Integer);

procedure alterarVisibilidade(ipComponentes: Array of TWinControl; ipFlag: Boolean);

function fpuStrToDate(ipData: string): TDateTime;

procedure ppuAlterarEditValue(ipComponente: TcxCustomEdit; ipValue: Variant);
procedure HabilitarDesabilitarControls(ipFlag: Boolean; ipPropriedadeVisible: Boolean; ipControls: Array of TControl);

function TruncTo(ipValor: Double; ipCasasDecimais: Integer): Double;

procedure VerificarReferenciaCircular(ipDic: TDictionary<String, String>);

function FileTimeToDTime(FTime: TFileTime): TDateTime;

function BuscarArquivoRecente(ipEndArq: string; ipDias: Integer = 7; ipExtensao: string = '.xml'; ipInicioNome: string = 'log_'): string;

function VerificarFaixaIdade(ipTipoAge, ipTipoAgePac: string; ipAge1, ipAge2, ipAgePac: Integer): Boolean;

function ExtrairNumero(ipTexto: String): Double;

function HoraParaSegundos(ipHora: TTime): Integer;

function ListarArquivosDiretorio(ipDiretorio: string; ipSubDiretorio: Boolean = True; ipCaminhCompleto: Boolean = True): TStrings;

function contaLinhasTXT(vaNomeArquivo: String): Integer;

function FocarJanela(hwnd: THandle): Boolean;

procedure TocarBeep(ipFrequencia: Cardinal = 300; ipDuracao: Cardinal = 500);

function ExtrairValorTag(ipTag: String): String;

function MontarStringCodigo(ipCods: Array of Integer; ipDelimitador: String): String; overload;

function MontarStringCodigo(ipCods: TDataSet; ipNomeField, ipDelimitador: String): String; overload;

function MontarStringCodigo(ipCods: TDataSet; ipNomeField, ipDelimitador: String; ipQtde: Integer): String; overload;

function MontarStringCodigo(ipCods: TDataSet; ipNomeField, ipDelimitador: String; ipIgnorarDuplicados: Boolean): String; overload;

function MontarStringCodigo(ipCods: TDataSet; ipNomeField, ipDelimitador: String; ipQtde: Integer; ipIgnorarDuplicados: Boolean): String; overload;

function MontarStringCodigo(ipCods: TJSONArray; ipDelimitador: String): String; overload;

function MontarStringCodigo(ipCods: TList<Integer>; ipDelimitador: String): String; overload;

function fpuParametroMultiplasInstancias(): Boolean;

function fpuGetNomeUsuarioLogado: string;

function fpuGetNomeUsuarioDominioFromPID(ProcessId: DWORD; var User, Domain: string): Boolean;

function ModFloat(Dividendo, Divisor: Double): Double;

function PegarValorCdsBaseadoPivotCell(ipCell: TcxPivotGridDataCellViewInfo; ipCdsOriginal, ipCdsAux: TClientDataSet; ipFieldName: String): String;

procedure ColorirCelulaBaseadoReferencias(ipCanvas: TcxCanvas; ipCdsRef, ipCdsFicha: TClientDataSet; ipValor: Double; ipCodModLabCampo, ipNFicha: Integer; ipDataAtual: TDate; ipCdsConfig: TClientDataSet = nil);

function VerificarFaixaIdadeSexo(ipTipoAge, ipTipoAgePac: string; ipAge1, ipAge2, ipAgePac: Integer; ipSexo, ipSexoPac: String): Boolean;

function PegarCorValorRefAcima(ipCdsConfig: TClientDataSet = nil): TColor;
function PegarCorValorRefAbaixo(ipCdsConfig: TClientDataSet = nil): TColor;

function ProgramaAberto(ipExeFileName: String; var ipProcessId: Cardinal): Boolean;

{$REGION 'TISS 3.0'}
function TISSUF3_0(ipUF: string): string;
function TipoGlosaTexto(ipTipoGlosa: string): String;
function TISSSiglaConselho3_0(ipSiglaConselho: String): string;
function ViaAcessoToTiss3(ipVia: String): string;
function PorVideoToTiss3(ipPorVideo: String): string;
{$ENDREGION}
function RemoverRegistrosDuplicados(ipCDS: TClientDataSet; ipFieldBusca: String; ipProcEncontrou: TProc<TClientDataSet>): OleVariant;

function GetEXEVersionData(const fileName: string): TEXEVersionData;

function fpuCloneConnection(ipConn: TSQLConnection): TSQLConnection; overload;
function fpuCloneConnection(ipConn: TpmADConnection): TpmADConnection; overload;
// obtem o valor mediano

function ValorMediano(ipArray: Array of Extended): Extended;

procedure ObterQuartiles(ipArray: array of Extended; var ioQ1, ioQ3: Extended);

function ObterMediaSemOutlier(ipArray: Array of Extended): Extended;

function SegundosParaHora(Sec: Integer): string;

function CloneProviderConnection(ipProvider: TDSProviderConnection; ipOwner: TComponent; ipCon: TSQLConnection): TDSProviderConnection;

procedure PercorrerCds(ipCDS: TClientDataSet; ipProc: TProc; ipManterPosicao: Boolean = True; ipOtimizarLoop: Boolean = True); overload;

procedure PercorrerCds(ipCDS: TClientDataSet; ipFunc: TFunc<Boolean>; ipManterPosicao: Boolean = True; ipOtimizarLoop: Boolean = True); overload;

procedure DesfazerMasterSource(ipCDS: TClientDataSet);

function PegarIdadeCompleta(ipDataNascimento, ipData_Referencia: TDate): string;

function CriptografarSha1ComSaltPadrao(ipSenha: String): String;

// Converte a quantidade passada em quantidade oficial baseando-se no divisor e multiplicador informado
function ConverterQuantidadeOficial(ipQuantidade, ipDivisor, ipMultiplicador: Double): Double;

function RedimensionarImg(ipImg: TBlobField; ipLargura, ipAltura: Integer): TJPEGImage;

function DesabilitarPipeLines(ipForm: TForm): TList<TppDataPipeline>;
procedure HabilitarPipeLines(ipPipes: TList<TppDataPipeline>);

function SubstituirCaracteresEspeciais(ipTexto: String): String;

function QuantLetrasRichView(ipRVData: TCustomRVData): Integer;
function EncapsularPanelNoForm(ipPanel: TPanel; ipCaption: String): TForm;
function fpuProcuraArquivo(aPath, fileName: string; SubDir: Boolean = True): String;

function VerificarQuantidadePacientesDistintos(ipCDS: TClientDataSet; ipNomeCampoNroFicha: String): Integer;

function E_XP: Boolean;
function fpuSubtraiTempoDeUmDateTime(ipDtHr: TDateTime; ipTempo: string; ipQtdeDias: Integer = 0): TDateTime;
function fpuTrocarChavePorValorSMS(ipTexto, ipChaveValor: string): string;
function fpuVerificaExisteFieldClientDataSet(ipCDS: TClientDataSet; ipField: string): Boolean;
function fpuFormEstaCriado(AClass: TClass): Boolean;

function MatarProcesso(ExeFileName: string): Integer;

function VerificaAniversario(vaDiaMesNasc, vaDiaMesHoje: TDateTime): Boolean;
procedure AtualizarDataHoraComputador(ipData, ipHora: TDateTime);

procedure CopyStreamToBytesStream(const ASource: TStream; var ADest: TBytesStream; const Rewind: Boolean = True);
function ExtrairArquivoRar(ipArquivo, ipDiretorio: String; var opErro: String): Boolean;

function FormatarDateTimeUtc(ipData: TDateTime; ipUtcEmMinutos: Integer): TSQLTimeStampOffset;

function CalcularTaxaOcupacaoAgenda(ipAgendaConsulta: Boolean; ipHorarios, ipHorariosConfigurados: TDataSet): Double;
function ValidarCNS(ipCNS: string): Boolean;
function MesNumericoToMesEscrito(ipMesNumerico: Integer): string;

function ValidarCelular(ipCelular:String; ipValidarCodigoPais, ipValidarDDD:Boolean):Boolean;

const
  coPalavrasReservadaBanco: array [1 .. 7] of string = ('INSERT', 'DROP', 'CREATE', 'INACTIVE', 'UPDATE', 'SET ', 'ALTER');

  coPalavrasSensuradas: array [1 .. 9] of string = ('Derrubar', '*', 'INSERT', 'DROP', 'CREATE', 'INACTIVE', 'UPDATE', 'SET ', 'ALTER');

  msg1 = 'Caractere(s) inv�lido(s) no in�cio do e-mail.';
  msg2 = 'S�mbolo @ n�o foi encontrado.';
  msg3 = 'Excesso do s�mbolo @.';
  msg4 = 'Caractere(s) inv�lido(s) antes do s�mbolo @.';
  msg5 = 'Caractere(s) inv�lido(s) depois do s�mbolo @.';
  msg6 = 'Agrupamento de caractere(s) inv�lido(s) a esqueda do @.';
  msg7 = 'N�o existe ponto(s) digitado(s).';
  msg8 = 'Ponto encontrado no final do e-mail.';
  msg9 = 'Aus�ncia de caractere(s) ap�s o �ltimo ponto.';
  msg10 = 'Excesso de ponto(s) a direita do @.';
  msg11 = 'Ponto(s) disposto(s) de forma errada ap�s o @.';
  msg12 = 'Caractere(s) inv�lido(s) antes do ponto.';
  msg13 = 'Caractere(s) inv�lido(s) depois do ponto.';

  vet_valido: array [0 .. 35] of string = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z');
  coWidthRedutor: Integer = 50;
  coHeigthRedutor: Integer = 130;
  coHeightRedutor600: Integer = 50;

var
  Eventos: TEventos;

  // variavel que guarda todas as procedures que sao atribuidas para os eventos
implementation

uses pMessageTela, TestaCPF_CNPJ, IdGlobal, pRichUtils, RVEdit;

function ValidarCelular(ipCelular:String; ipValidarCodigoPais, ipValidarDDD:Boolean):Boolean;
var
  vaMask:String;
begin
  vaMask := '^';
  if ipValidarCodigoPais then
    vaMask := vaMask + '55';
  if ipValidarDDD then
    vaMask := vaMask + '\d{2}';

  vaMask := vaMask + '\d{8,9}$';
  Result := TRegex.IsMatch(ipCelular,vaMask);
end;


function CalcularTaxaOcupacaoAgenda(ipAgendaConsulta: Boolean; ipHorarios, ipHorariosConfigurados: TDataSet): Double;
var
  vaTotal, vaAgendados, vaRecNo: Integer;
  vaHora: TTime;
  vaFilter: String;
begin
  Result := 0;
  if ipHorarios.Active and (ipHorarios.RecordCount > 0) then
    begin
      vaTotal := ipHorariosConfigurados.RecordCount;
      // se for zero significa que nao existe horario configurado para esse dia, entao significa que so teve horarios avulsos
      if vaTotal = 0 then
        Exit(100);
      try
        vaRecNo := ipHorarios.RecNo;
        vaFilter := '';
        // vamos pegar o total agendado
        if ipHorarios.Filter <> '' then
          begin
            vaFilter := ipHorarios.Filter;
            ipHorarios.Filter := vaFilter + ' AND ((TDESCRICAO = ' + QuotedStr('S') + ') or (BLOQUEADO = ' + QuotedStr('S') + '))';
          end
        else
          begin
            ipHorarios.Filter := '((TDESCRICAO = ' + QuotedStr('S') + ') or (BLOQUEADO = ' + QuotedStr('S') + '))';
          end;

        // se for uma agenda de consulta temos que remover da conta os registros que nao sao consulta
        if ipAgendaConsulta then
          ipHorarios.Filter := ipHorarios.Filter + ' AND (TIPO_AGENDA = ' + Ord(taConsulta).ToString + ')';

        ipHorarios.Filtered := True;

        vaAgendados := ipHorarios.RecordCount;
      finally
        if vaFilter = '' then
          ipHorarios.Filtered := false;

        ipHorarios.Filter := vaFilter;

        ipHorarios.RecNo := vaRecNo;
      end;
      { OBSERVACOES
        * vaAgendados cont�m al�m dos agendamentos normais os agendamentos encaixados
        * vaTotal cot�m o total de agendamentos configurados
        * Se houver encaixes o resultado pode ultrapassar os 100%
 }
      Result := (vaAgendados * 100) / (vaTotal);
    end;
end;

function FormatarDateTimeUtc(ipData: TDateTime; ipUtcEmMinutos: Integer): TSQLTimeStampOffset;
var
  vaHoraUtc: TTime;
begin
  try
    Result.Year := YearOf(ipData);
    Result.Month := MonthOf(ipData);
    Result.Day := DayOf(ipData);

    Result.Hour := HourOf(ipData);
    Result.Minute := MinuteOf(ipData);
    Result.Second := SecondOf(ipData);

    // 720 = 12 horas, � o valor maximo para o UTC
    if Abs(ipUtcEmMinutos) > 720 then
      begin
        Result.TimeZoneHour := 0;
        Result.TimeZoneMinute := 0;
      end
    else
      begin
        Result.TimeZoneHour := ipUtcEmMinutos div 60;
        Result.TimeZoneMinute := ipUtcEmMinutos mod 60;
      end;

  except
    Result := DateTimeToSQLTimeStampOffset(now);
  end;
end;

function ExtrairArquivoRar(ipArquivo, ipDiretorio: String; var opErro: String): Boolean;
var
  vaParametros, vaWinrar: String;
  vaExtensao: String;
begin
  Result := false;
  vaExtensao := TPath.GetExtension(ipArquivo);
  if TRegex.IsMatch(vaExtensao, '\.rar', [roIgnoreCase]) then
    begin
      vaWinrar := fpuProcuraArquivo('C:', 'unrar.exe');
      if vaWinrar <> '' then
        begin
          vaParametros := ' e -y "' + ipArquivo + '" ' + IncludeTrailingBackslash(ipDiretorio);
          if not ExecutarPrograma(vaWinrar, vaParametros, sw_normal) then
            opErro := 'N�o foi poss�vel descompactar o arquivo.'
          else
            Result := True;
        end
      else
        opErro := 'O Winrar n�o foi encontrado. Certifique-se que est� instalado na Unidade C:';
    end;
end;

procedure CopyStreamToBytesStream(const ASource: TStream; var ADest: TBytesStream; const Rewind: Boolean = True);
const
  LBufSize = $F000;
var
  LBuffer: PByte;
  LReadCount: Integer;
begin
  GetMem(LBuffer, LBufSize);
  ADest.Clear;
  try
    repeat
      LReadCount := ASource.Read(LBuffer^, LBufSize);
      if LReadCount > 0 then
        ADest.WriteBuffer(LBuffer^, LReadCount);
    until LReadCount < LBufSize;
  finally
    FreeMem(LBuffer, LBufSize);
  end;
  if Rewind then
    ADest.Seek(0, TSeekOrigin.soBeginning);
end;

procedure AtualizarDataHoraComputador(ipData, ipHora: TDateTime);
var
  vaHoraSistema: TSystemTime;
begin
  With vaHoraSistema do
    begin
      // Definindo o dia do sistema
      wDay := StrToInt(Copy(DateToStr(ipData), 1, 2));
      wMonth := StrToInt(Copy(DateToStr(ipData), 4, 2));
      wYear := StrToInt(Copy(DateToStr(ipData), 7, 4));
      // Definindo a hora do sistema
      wHour := StrToInt(Copy(TimeToStr(ipHora), 1, 2));
      wMinute := StrToInt(Copy(TimeToStr(ipHora), 4, 2));
      wSecond := StrToInt(Copy(TimeToStr(ipHora), 7, 2));
    end;

  SetLocalTime(vaHoraSistema);
  PostMessage(HWND_BROADCAST, WM_TIMECHANGE, 0, 0);
end;

procedure ReinciarAplicativo;
begin
  ShellExecute(Application.Handle, nil, PChar(Application.ExeName), nil, nil, SW_SHOWNORMAL);
  ExitProcess(0); // exit process melhor que application.terminate pois � mais rapido impedindo assim que de mensagem dizendo que o sistema ja esta aberto
end;

function QuantLetrasRichView(ipRVData: TCustomRVData): Integer;
var
  I, r, c: Integer;
  table: TRVTableItemInfo;
begin
  Result := 0;
  for I := 0 to ipRVData.Items.Count - 1 do
    Begin
      if ipRVData.GetItemStyle(I) >= 0 then
        inc(Result, ipRVData.ItemLength(I))
      else if ipRVData.GetItemStyle(I) = rvsTab then
        inc(Result)
      else if ipRVData.GetItemStyle(I) = rvsTable then
        begin
          table := TRVTableItemInfo(ipRVData.GetItem(I));
          for r := 0 to table.Rows.Count - 1 do
            for c := 0 to table.Rows[r].Count - 1 do
              if table.Cells[r, c] <> nil then
                inc(Result, QuantLetrasRichView(table.Cells[r, c].GetRVData));
        end;
    end;

end;

function EncapsularPanelNoForm(ipPanel: TPanel; ipCaption: String): TForm;
begin
  Result := TForm.Create(nil);
  Result.Caption := ipCaption;
  Result.KeyPreview := True;
  ipPanel.Parent := Result;
  ipPanel.Visible := True;
  ipPanel.Top := 0;
  ipPanel.Left := 0;
  ipPanel.bevelOuter := bvNone;

  Result.Width := ipPanel.Width + 10;
  Result.Height := ipPanel.Height + 35;

  Result.BorderIcons := [];
  Result.BorderStyle := bsSingle;

  Result.position := poMainFormCenter;
end;

function StringToTipoHonomedFuncao(ipFuncao: String): TTipoHonomedFuncao;
var
  vaFuncao: TTipoHonomedFuncao;
begin
  for vaFuncao := low(TiposHonomedFuncao) to high(TiposHonomedFuncao) do
    begin
      if TiposHonomedFuncao[vaFuncao] = ipFuncao then
        Exit(vaFuncao);
    end;

  raise Exception.Create('A fun��o ' + ipFuncao + ' n�o existe.');
end;

procedure HabilitarPipeLines(ipPipes: TList<TppDataPipeline>);
var
  vaPipe: TppDataPipeline;
begin
  for vaPipe in ipPipes do
    begin
      vaPipe.Visible := True;
    end;
end;

function DesabilitarPipeLines(ipForm: TForm): TList<TppDataPipeline>;
var
  vaParents: TArray<TForm>;
  I, j: Integer;
  vaPipe: TppDataPipeline;

  function flAcharParent(ipFormBase: TForm): Boolean;
  var
    k: Integer;
  begin
    Result := false;
    for k := Low(vaParents) to High(vaParents) do
      if vaParents[k] = ipFormBase then
        Exit(True);

  end;

  procedure plPegarParents;
  var
    vaForm: TWinControl;
  begin
    vaForm := ipForm.Parent;
    while vaForm <> nil do
      begin
        if vaForm is TForm then
          begin
            setLength(vaParents, length(vaParents) + 1);
            vaParents[high(vaParents)] := TForm(vaForm);
          end;
        vaForm := vaForm.Parent;
      end;
  end;

begin
  Result := TList<TppDataPipeline>.Create;

  plPegarParents;

  for I := 0 to Screen.FormCount - 1 do
    Begin
      if (ipForm <> Screen.Forms[I]) and (not flAcharParent(Screen.Forms[I])) then
        Begin
          for j := 0 to Screen.Forms[I].ComponentCount - 1 do
            Begin
              if (Screen.Forms[I].Components[j] is TppDataPipeline) then
                Begin
                  vaPipe := TppDataPipeline(Screen.Forms[I].Components[j]);
                  vaPipe.Visible := false;
                  Result.Add(vaPipe);
                End;
            End;
        End;
    End;

end;

function RedimensionarImg(ipImg: TBlobField; ipLargura, ipAltura: Integer): TJPEGImage;
var
  vaImg: TdxSmartImage;
  vaBmp, vaBmpAux: TBitmap;
  vaProporcao: Double;
begin
  if Assigned(ipImg) and (not ipImg.IsNull) then
    begin
      vaImg := TdxSmartImage.Create;
      try
        vaImg.LoadFromFieldValue(ipImg.Value);

        vaBmp := vaImg.GetAsBitmap;
        vaBmpAux := TBitmap.Create;
        try
          if ipLargura > ipAltura then
            begin
              vaBmpAux.Width := ipLargura;
              // vamos calcular a proporcao correta para nao distorcer a img
              vaProporcao := (ipLargura * 100 / vaBmp.Width) / 100;
              vaBmpAux.Height := Round(vaBmp.Height * vaProporcao);
            end
          else
            begin
              vaBmpAux.Height := ipAltura;
              // vamos calcular a proporcao correta para nao distorcer a img
              vaProporcao := (ipAltura * 100 / vaBmp.Height) / 100;
              vaBmpAux.Width := Round(vaBmp.Width * vaProporcao);
            end;

          vaBmpAux.Canvas.StretchDraw(vaBmpAux.Canvas.ClipRect, vaBmp);
          Result := TJPEGImage.Create;
          Result.Assign(vaBmpAux);
        finally
          FreeAndNil(vaBmpAux);
          FreeAndNil(vaBmp);
        end;
      finally
        FreeAndNil(vaImg);
      end;
    end;
end;

function SubstituirCaracteresEspeciais(ipTexto: String): String;
begin
  Result := ipTexto;
  Result := StringReplace(Result, '�', 'C', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'c', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'A', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'A', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'A', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'a', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'a', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'a', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'e', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'e', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'E', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'E', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'I', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'I', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'i', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'i', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'O', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'O', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'O', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'o', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'o', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'o', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'U', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'U', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'U', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'u', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'u', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'u', [rfReplaceAll]);
end;

function ConverterQuantidadeOficial(ipQuantidade, ipDivisor, ipMultiplicador: Double): Double;
begin
  Result := ipQuantidade;
  if (ipDivisor > 0) or (ipMultiplicador > 0) then
    begin

      if ipDivisor > 0 then
        Result := ipQuantidade / ipDivisor
      else if ipMultiplicador > 0 then
        Result := ipQuantidade * ipMultiplicador;

      // caso a quantidade nao esteja exata, vou arredondala para cima
      if (Result > 0) and (ModFloat(Result, Trunc(Result)) > 0) then
        Result := Trunc(Result) + 1;
    end;
end;

function CriptografarSha1ComSaltPadrao(ipSenha: String): String;
begin
  Result := TCriptografa.fpuTextToCriptoSha1(ipSenha + coSaltSHA1 + IntToStr(length(ipSenha)));
end;

procedure DesfazerMasterSource(ipCDS: TClientDataSet);
begin
  ipCDS.MasterSource := nil;
  ipCDS.MasterFields := '';
  ipCDS.PacketRecords := -1;
end;

procedure PercorrerCds(ipCDS: TClientDataSet; ipProc: TProc; ipManterPosicao: Boolean = True; ipOtimizarLoop: Boolean = True);
var
  vaRecNo: Integer;
begin
  PercorrerCds(ipCDS,
    function: Boolean
    begin
      ipProc;
      Exit(True);
    end,
    ipManterPosicao, ipOtimizarLoop);
end;

procedure PercorrerCds(ipCDS: TClientDataSet; ipFunc: TFunc<Boolean>; ipManterPosicao: Boolean = True; ipOtimizarLoop: Boolean = True);
var
  vaRecNo: Integer;
begin
  if ipCDS.Active and (ipCDS.RecordCount > 0) then
    begin
      vaRecNo := 1;
      if ipManterPosicao then
        vaRecNo := ipCDS.RecNo;

      if ipOtimizarLoop then
        ipCDS.DisableControls;

      try
        ipCDS.First;
        while not ipCDS.Eof do
          begin
            if not ipFunc then // se retornar false, paro o loop
              Exit;
            ipCDS.Next;
          end;
      finally
        if ipManterPosicao then
          if ipCDS.Active and (ipCDS.RecordCount > 0) and (vaRecNo <= ipCDS.RecordCount) then
            ipCDS.RecNo := vaRecNo;

        if ipOtimizarLoop then
          ipCDS.EnableControls;
      end;
    end;

end;

function CloneProviderConnection(ipProvider: TDSProviderConnection; ipOwner: TComponent; ipCon: TSQLConnection): TDSProviderConnection;
begin
  Result := TDSProviderConnection.Create(ipOwner);
  Result.SQLConnection := ipCon;
  Result.ServerClassName := ipProvider.ServerClassName;
  Result.connected := True;
end;

function SegundosParaHora(Sec: Integer): string;
var
  H, M, S: string;
  ZH, ZM, ZS: Integer;
begin
  ZH := Sec div 3600;
  ZM := Sec div 60 - ZH * 60;
  ZS := Sec - (ZH * 3600 + ZM * 60);
  H := IntToStr(ZH);
  if length(H) = 1 then
    H := '0' + H;
  M := IntToStr(ZM);
  if length(M) = 1 then
    M := '0' + M;
  S := IntToStr(ZS);
  if length(S) = 1 then
    S := '0' + S;
  Result := H + ':' + M + ':' + S;
end;

function ObterMediaSemOutlier(ipArray: Array of Extended): Extended;
var
  vaQ1, vaQ3, vaLimiteInferior, vaLimiteSuperior, vaIQR: Extended;
  vaTempArray: array of Extended;
  I, j: Integer;
begin
  if High(ipArray) < 0 then
    Begin
      Result := 0;
      Exit;
    End;
  TArray.Sort<Extended>(ipArray); // ordenando
  ObterQuartiles(ipArray, vaQ1, vaQ3);
  vaIQR := (vaQ3 - vaQ1) * 1.5;
  vaLimiteInferior := vaQ1 - vaIQR;
  vaLimiteSuperior := vaQ3 + vaIQR;
  j := 0;
  for I := 0 to High(ipArray) do
    Begin
      if (ipArray[I] >= vaLimiteInferior) and (ipArray[I] <= vaLimiteSuperior) then
        Begin
          setLength(vaTempArray, j + 1);
          vaTempArray[j] := ipArray[I];
          inc(j);
        End;
    End;
  Result := Mean(vaTempArray);
end;

procedure ObterQuartiles(ipArray: array of Extended; var ioQ1, ioQ3: Extended);
var
  j: Single;
  I: Integer;
begin
  if High(ipArray) < 0 then // caso seja vazio nao podemos devovler nenhum valor e por seguranca precisamos de 1 raise
    raise Exception.Create('N�o � poss�vel obter os valores em um array vazio')
  else if High(ipArray) = 0 then // so tem 1 valor, ele vai ser o ioq1 e o ioq3
    begin
      ioQ1 := ipArray[0];
      ioQ3 := ipArray[0];
    end
  else
    begin
      TArray.Sort<Extended>(ipArray); // ordenando array
      // obtendo o primeiro quartilho
      j := (High(ipArray) + 1) / 4 + 0.5;
      I := Trunc(j);
      j := Frac(j);
      if I - 1 < High(ipArray) then
        ioQ1 := ipArray[I - 1] + (ipArray[I]
          - ipArray[I - 1]) * j
      else // Ultimo Valor
        ioQ1 := ipArray[I - 1];

      // Calculando o terceiro quartilho

      j := 3 * (High(ipArray) + 1) / 4 + 0.5;
      I := Trunc(j);
      j := Frac(j);
      if I - 1 < High(ipArray) then
        ioQ3 := ipArray[I - 1] + (ipArray[I]
          - ipArray[I - 1]) * j
      else // Pegando o ultimo numero
        ioQ3 := ipArray[I - 1];
    end;

End;

function ValorMediano(ipArray: Array of Extended): Extended;
var
  vaIndexMeio: Integer;
begin
  TArray.Sort<Extended>(ipArray);

  vaIndexMeio := length(ipArray) div 2;
  if Odd(length(ipArray)) then
    Result := ipArray[vaIndexMeio]
  else
    Result := (ipArray[vaIndexMeio - 1] + ipArray[vaIndexMeio]) / 2;
End;

function fpuCloneConnection(ipConn: TSQLConnection): TSQLConnection;
begin
  Result := TSQLConnection.Create(nil);
  Result.LoadParamsOnConnect := ipConn.LoadParamsOnConnect;
  Result.LoginPrompt := ipConn.LoginPrompt;
  Result.DriverName := ipConn.DriverName;
  Result.ConnectionName := ipConn.ConnectionName;
  Result.Name := ipConn.Name + 'Clone1';
  Result.Params.Clear;
  Result.Params.AddStrings(ipConn.Params);
  Result.GetDriverFunc := ipConn.GetDriverFunc;
  Result.LibraryName := ipConn.LibraryName;
  Result.VendorLib := ipConn.VendorLib;
end;

function fpuCloneConnection(ipConn: TpmADConnection): TpmADConnection;
begin
  Result := TpmADConnection.Create(nil);
  Result.LoginPrompt := ipConn.LoginPrompt;
  Result.DriverName := ipConn.DriverName;
  Result.ConnectionName := ipConn.ConnectionName;
  Result.Name := ipConn.Name + 'Clone1';
  Result.Params.AddStrings(ipConn.Params);
end;

function RemoverRegistrosDuplicados(ipCDS: TClientDataSet; ipFieldBusca: String; ipProcEncontrou: TProc<TClientDataSet>): OleVariant;
var
  vaCds: TClientDataSet;
  vaCont: Integer;
begin
  vaCds := TClientDataSet.Create(nil);
  try
    vaCds.FieldDefs.Assign(ipCDS.FieldDefs); // apenas para clonar os fields
    vaCds.CreateDataSet;
    vaCds.Open;
    ipCDS.First;
    while not ipCDS.Eof do
      begin
        if vaCds.Locate(ipFieldBusca, ipCDS.FieldByName(ipFieldBusca).AsString, [loCaseInsensitive]) then // nao pode repetir
          Begin
            vaCds.Edit;
            ipProcEncontrou(vaCds);
          End
        else // podemos inserir
          Begin
            vaCds.Insert;
            for vaCont := 0 to ipCDS.Fields.Count - 1 do
              begin
                vaCds.Fields[vaCont].Value := ipCDS.Fields[vaCont].Value;
              end;
          End;
        vaCds.Post;

        ipCDS.Next;
      end;
    Result := vaCds.Data;
  finally
    vaCds.free;
  end;
end;

function TipoGlosaTexto(ipTipoGlosa: string): String;
begin
  if ipTipoGlosa = '1001' then
    Result := 'N�mero da Careteira Inv�lido'
  else if ipTipoGlosa = '1002' then
    Result := 'N�mero do Cart�o Nacional de Sa�de Inv�lido'
  else if ipTipoGlosa = '1003' then
    Result := 'A admiss�o do benefici�rio no prestador ocorreu antes da inclus�o do benefici�rio na operadora'
  else if ipTipoGlosa = '5001' then
    Result := 'Mensagem Eletr�nica fora do padr�o Tiss';
end;

function TISSUF3_0(ipUF: string): string;
begin
  { 11	Rond�nia   	  RO  | 12	Acre	          AC | 13	Amazonas           	AM  | 14	Roraima	RR
    15	Par�	        PA  | 16	Amap�	          AP | 17	Tocantins	          TO  | 21	Maranh�o	MA
    22	Piau�	        PI  | 23	Cear� 	        CE | 24	Rio Grande do Norte	RN  | 25	Para�ba	PB
    26	Pernambuco	  PE  | 27	Alagoas	        AL | 28	Sergipe	            SE  | 29	Bahia	BA
    31	Minas Gerais	MG  | 32	Esp�rito Santo	ES | 33	Rio de Janeiro	    RJ  | 35	S�o Paulo	SP
    41	Paran�	      PR  | 42	Santa Catarina	SC | 43	Rio Grande do Sul	  RS  | 50	Mato Grosso do Sul	MS
    51	Mato Grosso	  MT  | 52	Goi�s	          GO | 53	Distrito Federal	DF }
  if UpperCase(ipUF) = 'RO' then
    Result := '11'
  else if UpperCase(ipUF) = 'AC' then
    Result := '12'
  else if UpperCase(ipUF) = 'AM' then
    Result := '13'
  else if UpperCase(ipUF) = 'RR' then
    Result := '14'
  else if UpperCase(ipUF) = 'PA' then
    Result := '15'
  else if UpperCase(ipUF) = 'AP' then
    Result := '16'
  else if UpperCase(ipUF) = 'TO' then
    Result := '17'
  else if UpperCase(ipUF) = 'MA' then
    Result := '21'
  else if UpperCase(ipUF) = 'PI' then
    Result := '22'
  else if UpperCase(ipUF) = 'CE' then
    Result := '23'
  else if UpperCase(ipUF) = 'RN' then
    Result := '24'
  else if UpperCase(ipUF) = 'PB' then
    Result := '25'
  else if UpperCase(ipUF) = 'PE' then
    Result := '26'
  else if UpperCase(ipUF) = 'AL' then
    Result := '27'
  else if UpperCase(ipUF) = 'SE' then
    Result := '28'
  else if UpperCase(ipUF) = 'BA' then
    Result := '29'
  else if UpperCase(ipUF) = 'MG' then
    Result := '31'
  else if UpperCase(ipUF) = 'ES' then
    Result := '32'
  else if UpperCase(ipUF) = 'RJ' then
    Result := '33'
  else if UpperCase(ipUF) = 'SP' then
    Result := '35'
  else if UpperCase(ipUF) = 'PR' then
    Result := '41'
  else if UpperCase(ipUF) = 'SC' then
    Result := '42'
  else if UpperCase(ipUF) = 'RS' then
    Result := '43'
  else if UpperCase(ipUF) = 'MS' then
    Result := '50'
  else if UpperCase(ipUF) = 'MT' then
    Result := '51'
  else if UpperCase(ipUF) = 'GO' then
    Result := '52'
  else if UpperCase(ipUF) = 'DF' then
    Result := '53'
  else
    Result := '';
end;

function TISSSiglaConselho3_0(ipSiglaConselho: String): string;
begin
  { <!--	1 CRAS	Conselho Regional de Assist�ncia Social	-->
    <!--	2 COREN 	Conselho Regional de Enfermagem	-->
    <!--	3 CRF		Conselho Regional de Farm�cia	-->
    <!--	4 CRFA 	Conselho Regional de Fonoaudiologia	-->
    <!--	5 CREFITO	Conselho Regional de Fisioterapia e Terapia Ocupacional	-->
    <!--	6 CRM		Conselho Regional de Medicina	-->
    <!--	7 CRN		Conselho Regional de Nutri��o	-->
    <!--	8 CRO		Conselho Regional de Odontologia	-->
    <!--	9 CRP		Conselho Regional de Psicologia	-->
    <!--	10 OUT		Outros Conselhos	--> }
  if UpperCase(ipSiglaConselho) = 'CRAS' then
    Result := '1'
  else if UpperCase(ipSiglaConselho) = 'COREN' then
    Result := '2'
  else if UpperCase(ipSiglaConselho) = 'CRF' then
    Result := '3'
  else if UpperCase(ipSiglaConselho) = 'CRFA' then
    Result := '4'
  else if UpperCase(ipSiglaConselho) = 'CREFITO' then
    Result := '5'
  else if UpperCase(ipSiglaConselho) = 'CRM' then
    Result := '6'
  else if UpperCase(ipSiglaConselho) = 'CRN' then
    Result := '7'
  else if UpperCase(ipSiglaConselho) = 'CRO' then
    Result := '8'
  else if UpperCase(ipSiglaConselho) = 'CRP' then
    Result := '9'
  else if UpperCase(ipSiglaConselho) = 'OUT' then
    Result := '10'
  else if UpperCase(ipSiglaConselho) = '' then
    Result := ''
  else
    Result := '10';
end;

function ViaAcessoToTiss3(ipVia: String): string;
begin
  if ipVia = 'U' then
    Result := '1'
  else if ipVia = 'M' then
    Result := '2'
  else if ipVia = 'D' then
    Result := '3';
end;

function PorVideoToTiss3(ipPorVideo: String): string;
begin
  if ipPorVideo = 'C' then
    Result := '1'
  else if ipPorVideo = 'V' then
    Result := '2';

end;

function fpuGetNomeUsuarioDominioFromPID(ProcessId: DWORD; var User, Domain: string): Boolean;
type
  PTOKEN_USER = ^TOKEN_USER;

  _TOKEN_USER = record
    User: TSidAndAttributes;
  end;

  TOKEN_USER = _TOKEN_USER;
var
  hToken: THandle;
  cbBuf: Cardinal;
  ptiUser: PTOKEN_USER;
  snu: SID_NAME_USE;
  ProcessHandle: THandle;
  UserSize, DomainSize: DWORD;
  bSuccess: Boolean;
begin
  Result := false;
  ProcessHandle := OpenProcess(PROCESS_QUERY_INFORMATION, false, ProcessId);
  if ProcessHandle <> 0 then
    begin
      if OpenProcessToken(ProcessHandle, TOKEN_QUERY, hToken) then
        begin
          bSuccess := GetTokenInformation(hToken, TokenUser, nil, 0, cbBuf);
          ptiUser := nil;
          while (not bSuccess) and (GetLastError = ERROR_INSUFFICIENT_BUFFER) do
            begin
              ReallocMem(ptiUser, cbBuf);
              bSuccess := GetTokenInformation(hToken, TokenUser, ptiUser, cbBuf, cbBuf);
            end;
          CloseHandle(hToken);

          if not bSuccess then
            begin
              Exit;
            end;

          UserSize := 0;
          DomainSize := 0;
          LookupAccountSid(nil, ptiUser.User.Sid, nil, UserSize, nil, DomainSize, snu);
          if (UserSize <> 0) and (DomainSize <> 0) then
            begin
              setLength(User, UserSize);
              setLength(Domain, DomainSize);
              if LookupAccountSid(nil, ptiUser.User.Sid, PChar(User), UserSize,
                PChar(Domain), DomainSize, snu) then
                begin
                  Result := True;
                  User := StrPas(PChar(User));
                  Domain := StrPas(PChar(Domain));
                end;
            end;

          if bSuccess then
            begin
              FreeMem(ptiUser);
            end;
        end;
      CloseHandle(ProcessHandle);
    end;
end;

function ModFloat(Dividendo, Divisor: Double): Double;
var
  Quociente: Integer;
begin
  if Divisor = 0 then
    Quociente := 0
  else
    Quociente := Trunc(Dividendo / Divisor);
  Result := Dividendo - Divisor * Quociente;
end;

function fpuGetNomeUsuarioLogado: string;
Var
  vaTamanho: DWORD;
Begin
  vaTamanho := 50;
  setLength(Result, vaTamanho);
  GetUserName(PChar(Result), vaTamanho);
  setLength(Result, StrLen(PChar(Result)));
End;

function fpuParametroMultiplasInstancias(): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := 1 to ParamCount do
    if ParamStr(I) = 'multiInstancia' then
      Exit(True);
end;

function PegarCorValorRefAcima(ipCdsConfig: TClientDataSet): TColor;
var
  vaFechar: Boolean;
begin
  if not Assigned(ipCdsConfig) then
    Exit(RGB(255, 232, 149));

  vaFechar := false;
  if not ipCdsConfig.Active then
    begin
      ipCdsConfig.Open;
      vaFechar := True;
    end;
  try
    if ipCdsConfig.FieldByName('Cor_celula_valor_acima_ref').IsNull then
      Result := RGB(255, 232, 149)
    else
      Result := ipCdsConfig.FieldByName('Cor_celula_valor_acima_ref').AsInteger;
  finally
    if vaFechar then
      ipCdsConfig.Close;
  end;
end;

function PegarCorValorRefAbaixo(ipCdsConfig: TClientDataSet): TColor;
var
  vaFechar: Boolean;
begin
  if not Assigned(ipCdsConfig) then
    Exit(RGB(255, 247, 217));

  vaFechar := false;
  if not ipCdsConfig.Active then
    begin
      ipCdsConfig.Open;
      vaFechar := True;
    end;
  try
    if ipCdsConfig.FieldByName('Cor_celula_valor_abaixo_ref').IsNull then
      Result := RGB(255, 247, 217)
    else
      Result := ipCdsConfig.FieldByName('Cor_celula_valor_abaixo_ref').AsInteger;
  finally
    if vaFechar then
      ipCdsConfig.Close;
  end;
end;

procedure ColorirCelulaBaseadoReferencias(ipCanvas: TcxCanvas; ipCdsRef, ipCdsFicha: TClientDataSet; ipValor: Double; ipCodModLabCampo, ipNFicha: Integer; ipDataAtual: TDate; ipCdsConfig: TClientDataSet = nil);
var
  vaIdadeEm: String;
  vaIdade: Integer;
begin
  ipCdsRef.Filter := 'CODIGO_MODELO_LAB_CAMPO = ' + IntToStr(ipCodModLabCampo);
  ipCdsRef.Filtered := True;

  try
    if ipCdsRef.RecordCount > 0 then
      begin
        if (not ipCdsFicha.Active) or (ipCdsFicha.FieldByName('NROFICHA').AsInteger <> ipNFicha) then
          TCarregaDados.ppuCarregarDados(ipCdsFicha, ['RGPESQUISA', 'EDITPESQUISA'], ['No. Ficha', ipNFicha]);
        if ipCdsFicha.RecordCount > 0 then
          begin
            Idade_Exata(ipCdsFicha.FieldByName('DTNASCIMENTO').AsDateTime, ipDataAtual, vaIdade, vaIdadeEm);
            ipCdsRef.First;
            while not ipCdsRef.Eof do
              begin
                if VerificarFaixaIdadeSexo(ipCdsRef.FieldByName('TIPO_AGE').AsString,
                  vaIdadeEm,
                  ipCdsRef.FieldByName('AGE1').AsInteger,
                  ipCdsRef.FieldByName('AGE2').AsInteger,
                  vaIdade,
                  ipCdsRef.FieldByName('SEXO').AsString,
                  ipCdsFicha.FieldByName('SEXO').AsString) then
                  begin
                    if ipCdsRef.FieldByName('VLREFMIN').AsFloat > ipValor then
                      ipCanvas.Brush.Color := PegarCorValorRefAbaixo(ipCdsConfig) // laranja bem claro
                    else if ipCdsRef.FieldByName('VLREFMAX').AsFloat < ipValor then
                      ipCanvas.Brush.Color := PegarCorValorRefAcima(ipCdsConfig); // laranja um pouco mais escuro

                    break;
                  end;

                ipCdsRef.Next;
              end;
          end;
      end;

  finally
    ipCdsRef.Filtered := false;
  end;
end;

{$REGION 'Documentation'}
/// <summary>Verifica se a idade e o tipo da idade do paciente passado se
/// encaixa dentro da faixa de tipo e idade passada.</summary>
/// <param name="ipTipoAge">Tipo da idade a comparar
/// (ANOS,MESES,DIAS)</param>
/// <param name="ipTipoAgePac">Tipo da idade do paciente (ANOS, MESES,
/// DIAS)</param>
/// <param name="ipAge1">Idade inicial</param>
/// <param name="ipAge2">Idade final</param>
/// <param name="ipAgePac">Idade do paciente</param>
{$ENDREGION}


function VerificarFaixaIdadeSexo(ipTipoAge, ipTipoAgePac: string;
  ipAge1, ipAge2, ipAgePac: Integer; ipSexo, ipSexoPac: String): Boolean;
begin
  Result := false;
  if (ipSexo = 'AMBOS') or (ipSexo = ipSexoPac) then
    begin
      Result := VerificarFaixaIdade(ipTipoAge, ipTipoAgePac, ipAge1, ipAge2, ipAgePac);
    end;
end;

function PegarValorCdsBaseadoPivotCell(ipCell: TcxPivotGridDataCellViewInfo; ipCdsOriginal, ipCdsAux: TClientDataSet; ipFieldName: String): String;
var
  vaFieldCol, vaFieldRow, vaValueCol, vaValueRow: String;
begin
  Result := '';
  if (ipCell.CrossCell.DataController.RowCount > 0) then
    begin
      if (ipCell.CrossCell.Column.Field is TcxDBPivotGridField) and (ipCell.CrossCell.Row.Field is TcxDBPivotGridField) then
        begin
          vaFieldCol := TcxDBPivotGridField(ipCell.CrossCell.Column.Field).DataBinding.FieldName;
          vaValueCol := ipCell.CrossCell.Column.DisplayText;

          vaFieldRow := TcxDBPivotGridField(ipCell.CrossCell.Row.Field).DataBinding.FieldName;
          vaValueRow := ipCell.CrossCell.Row.DisplayText;
          if (vaValueCol <> '') and (vaValueRow <> '') then
            begin
              ipCdsAux.CloneCursor(ipCdsOriginal, false);
              if ipCdsAux.Locate(vaFieldCol + ';' + vaFieldRow, VarArrayOf([vaValueCol, vaValueRow]), [loCaseInsensitive]) then
                begin
                  Result := ipCdsAux.FieldByName(ipFieldName).AsString;
                end;
            end;
        end;
    end;

end;

function MontarStringCodigo(ipCods: TJSONArray; ipDelimitador: String): String;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to ipCods.Size - 1 do
    begin
      if Result = '' then
        Result := ipCods.get(I).Value
      else
        Result := Result + ' ' + ipDelimitador + ' ' + ipCods.get(I).Value;
    end;
end;

function MontarStringCodigo(ipCods: TList<Integer>; ipDelimitador: String): String;
var
  vaCod: Variant;
begin
  Result := '';
  for vaCod in ipCods do
    begin
      if Result = '' then
        Result := IntToStr(vaCod)
      else
        Result := Result + ' ' + ipDelimitador + ' ' + IntToStr(vaCod);
    end;
end;

function MontarStringCodigo(ipCods: Array of Integer; ipDelimitador: String): String;
var
  vaCod: Variant;
begin
  Result := '';
  for vaCod in ipCods do
    begin
      if Result = '' then
        Result := IntToStr(vaCod)
      else
        Result := Result + ' ' + ipDelimitador + ' ' + IntToStr(vaCod);
    end;
end;

function MontarStringCodigo(ipCods: TDataSet; ipNomeField, ipDelimitador: String; ipQtde: Integer; ipIgnorarDuplicados: Boolean): String;
var
  vaCod: Variant;
  vaList: TList<String>;
begin
  Result := '';
  vaList := TList<String>.Create;
  try
    ipCods.DisableControls;
    try
      ipCods.First;
      while (ipCods.RecNo <= ipQtde) and (not ipCods.Eof) do
        begin
          if ipIgnorarDuplicados and vaList.Contains(ipCods.FieldByName(ipNomeField).AsString) then
            begin
              ipCods.Next;
              continue;
            end;
          vaList.Add(ipCods.FieldByName(ipNomeField).AsString);

          if ipCods.FieldByName(ipNomeField).AsString <> '' then
            Result := Result + ipCods.FieldByName(ipNomeField).AsString + ipDelimitador;
          ipCods.Next;
        end;
    finally
      ipCods.EnableControls;
    end;
  finally
    vaList.free;
  end;

  Result := Copy(Result, 1, length(Result) - length(ipDelimitador)); // retirando o ultimo delimitador

end;

function MontarStringCodigo(ipCods: TDataSet; ipNomeField, ipDelimitador: String; ipIgnorarDuplicados: Boolean): String;
begin
  Result := MontarStringCodigo(ipCods, ipNomeField, ipDelimitador, ipCods.RecordCount, ipIgnorarDuplicados);
end;

function MontarStringCodigo(ipCods: TDataSet; ipNomeField, ipDelimitador: String; ipQtde: Integer): String;
begin
  Result := MontarStringCodigo(ipCods, ipNomeField, ipDelimitador, ipQtde, false);
end;

function MontarStringCodigo(ipCods: TDataSet; ipNomeField, ipDelimitador: String): String;
begin
  Result := MontarStringCodigo(ipCods, ipNomeField, ipDelimitador, ipCods.RecordCount);
end;

function ExtrairValorTag(ipTag: String): String;
var
  vaRegEx: TRegex;
begin
  // Pega tudo que estiver entre > e </
  vaRegEx := TRegex.Create('(?<=\>).*(?=\</)');
  if vaRegEx.IsMatch(ipTag) then
    Result := vaRegEx.Match(ipTag).Value
  else
    Result := '';
end;

function FocarJanela(hwnd: THandle): Boolean;
const
  SPI_GETFOREGROUNDLOCKTIMEOUT = $2000;
  SPI_SETFOREGROUNDLOCKTIMEOUT = $2001;
var
  ForegroundThreadID: DWORD;
  ThisThreadID: DWORD;
  timeout: DWORD;
begin
{$IF NOT DEBUG}
  if IsIconic(Application.Handle) then
    ShowWindow(Application.Handle, SW_SHOWNOACTIVATE);
  SetWindowPos(hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOACTIVATE or SWP_NOMOVE);
  SetWindowPos(hwnd, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOACTIVATE or SWP_NOMOVE);
{$IFEND}
End;

function ListarArquivosDiretorio(ipDiretorio: string; ipSubDiretorio: Boolean = True; ipCaminhCompleto: Boolean = True): TStrings;
var
  SR: TSearchRec;
begin
  Result := TStringList.Create;
  if FindFirst(ipDiretorio + '\*.*', faAnyFile, SR) = 0 then
    begin
      repeat
        if (SR.Name <> '.') And (SR.Name <> '..') then
          Begin
            if (SR.Attr <> faDirectory) then
              begin
                if ipCaminhCompleto then
                  Result.Add(ipDiretorio + '\' + SR.Name)
                else
                  Result.Add(SR.Name);
              end
            else if ipSubDiretorio then
              Result.AddStrings(ListarArquivosDiretorio(ipDiretorio + '\' + SR.Name));
          End;
      until FindNext(SR) <> 0;
      SysUtils.FindClose(SR);
    end;
end;

function contaLinhasTXT(vaNomeArquivo: String): Integer;
var
  arquivo: TextFile;
  cont: Integer;
begin
  cont := 0;
  AssignFile(arquivo, vaNomeArquivo);
  Reset(arquivo);
  While not Eof(arquivo) do
    begin
      ReadLn(arquivo);
      inc(cont);
    end;
  CloseFile(arquivo);
  Result := cont;
end;

function ExtrairNumero(ipTexto: String): Double;
var
  vaReg: TRegex;
  vaResult: string;
begin
  // tenta extrair somente os numeros, caso nao consiga retorna zero
  vaReg := TRegex.Create('[0-9]+((,|.)[0-9]+)*');
  try
    vaResult := vaReg.Match(ipTexto).Value;
    vaResult := StringReplace(vaResult, '.', '', [rfReplaceAll]); // substituo os pontos por nada
    Result := StrToFloat(vaResult);
  except
    Result := 0;
  end;
end;

procedure pmSetFocus(ipObject: TObject);
begin
  try
    if ipObject is TWinControl then
      if TWinControl(ipObject).CanFocus then
        TWinControl(ipObject).SetFocus;
  except
    // ignoro caso de erro
  end;
end;

function Capitalize(ipString: string): String;
begin
  Result := TUtils.fpuCapitalize(ipString);
end;

function fpuCriarVaResultList(ipTexto: string): TStringList;
begin
  Result := TStringList.Create;
  Result.StrictDelimiter := True;
  Result.Delimiter := coDelimitador;
  Result.DelimitedText := ipTexto;
end;

procedure AtribuirValoresClientDataSet(
  ipInformacoesRegistro: array of string; ipClientDataSet: TClientDataSet);
var
  I: Integer;
  vaReadOnly: Boolean;
begin
  for I := 0 to length(ipInformacoesRegistro) - 1 do
    begin
      vaReadOnly := ipClientDataSet.Fields[I].ReadOnly;
      ipClientDataSet.Fields[I].ReadOnly := false;
      ipClientDataSet.Fields[I].AsString := ipInformacoesRegistro[I];
      ipClientDataSet.Fields[I].ReadOnly := vaReadOnly;
    end;
end;

procedure AtribuirValoresInfoRegistro(
  ipClientDataSet: TClientDataSet; var ioInformacoesRegistro: array of string);
var
  I: Integer;
begin
  for I := 0 to ipClientDataSet.Fields.Count - 1 do
    begin
      ioInformacoesRegistro[I] := ipClientDataSet.Fields[I].AsString;
    end;
end;

function VerificaCodigoBarras(ipCodigoBarras: String): Boolean;
  function Par(Cod: Integer): Boolean;
  begin
    Result := Cod Mod 2 = 0;
  end;

var
  I, SomaPar, SomaImpar: Integer;
begin
  if ipCodigoBarras = '' then
    Exit(True);
  if length(ipCodigoBarras) < 13 then
    Exit(false);

  SomaPar := 0;
  SomaImpar := 0;
  for I := 1 to 12 do
    if Par(I) then
      SomaPar := SomaPar + StrToInt(ipCodigoBarras[I])
    else
      SomaImpar := SomaImpar + StrToInt(ipCodigoBarras[I]);
  SomaPar := SomaPar * 3;
  I := 0;
  while I < (SomaPar + SomaImpar) do
    inc(I, 10);

  Result := IntToStr(I - (SomaPar + SomaImpar)) = ipCodigoBarras[13];

end;

function ValidaEAN(CodBar: string): Boolean;
var
  sl_CodIni: String;
  il_SeqSom, il_Soma, il_TodNum: Integer;
begin
  // se codigo eh invalido
  if (length(Trim(CodBar)) = 0) then
    Result := True
  else if ((length(Trim(CodBar)) <> 13) and (length(Trim(CodBar)) <> 8)) THEN
    Result := false
    // se codigo eh certo, entao continua
  else
    begin
      sl_CodIni := Copy(Trim(CodBar), 1, length(CodBar) - 1);
      il_Soma := 0;
      il_SeqSom := 1;

      // se for ean8 entao completa numeros
      if length(Trim(CodBar)) = 8 then
        sl_CodIni := '00000' + sl_CodIni;

      for il_TodNum := 1 to length(sl_CodIni) do
        begin
          if il_SeqSom = 1 then
            begin
              il_Soma := il_Soma + (StrToInt(Copy(sl_CodIni, il_TodNum, 1)) * il_SeqSom);
              il_SeqSom := 3;
            end
          else
            begin
              il_Soma := il_Soma + (StrToInt(Copy(sl_CodIni, il_TodNum, 1)) * il_SeqSom);
              il_SeqSom := 1;
            end
        end;
      // calcula o restante
      // para numeros que nao sao zero no final
      if Copy(IntToStr(il_Soma), length(IntToStr(il_Soma)), 1) <> '0' then
        begin
          if Copy(Trim(CodBar), length(CodBar), 1) = IntToStr(10 - StrToInt(Copy(IntToStr(il_Soma), length(IntToStr(il_Soma)), 1))) then
            Result := True
          else
            Result := false;
        end
      else if StrToInt(Copy(Trim(CodBar), length(CodBar), 1)) = 0 then
        Result := True
      else
        Result := false;
    end;
end;

procedure AppendToRichEdit(const Source, destination: TcxRichEdit);
var
  rtfStream: TEditStream;
  sourceStream: TMemoryStream;

  function EditStreamReader(
    dwCookie: DWORD;
    pBuff: Pointer;
    cb: LongInt;
    pcb: PLongInt): DWORD; stdcall;
  begin
    Result := $0000;
    try
      pcb^ := TStream(dwCookie).Read(pBuff^, cb);
    except
      Result := $FFFF;
    end;
  end; (* EditStreamReader *)

begin
  destination.Lines.BeginUpdate;
  destination.SelLength := 0;
  destination.SelStart := destination.GetTextLen; // position caret at end
  destination.Perform(EM_SCROLLCARET, 0, 0); // ensure viewport is right
  sourceStream := TMemoryStream.Create;
  try
    Source.Lines.SaveToStream(sourceStream);
    sourceStream.position := 0;

    destination.Properties.MaxLength := destination.Properties.MaxLength + sourceStream.Size;

    rtfStream.dwCookie := DWORD(sourceStream);
    rtfStream.dwError := $0000;
    rtfStream.pfnCallback := @EditStreamReader;
    destination.InnerControl.Perform(
      EM_STREAMIN,
      SFF_SELECTION or SF_RTF or SFF_PLAINRTF, LPARAM(@rtfStream));
    if rtfStream.dwError <> $0000 then
      raise Exception.Create('Error appending RTF data.');
  finally
    sourceStream.free;
    destination.Lines.EndUpdate;
  end;
end;

procedure ConcatRichEdit(const Source, destination: TcxRichEdit);
var
  rtfStream: TEditStream;
  sourceStream: TMemoryStream;
  TempString: String;
  Posicao: Integer;

  function EditStreamReader(
    dwCookie: DWORD;
    pBuff: Pointer;
    cb: LongInt;
    pcb: PLongInt): DWORD; stdcall;
  begin
    Result := $0000;
    try
      pcb^ := TStream(dwCookie).Read(pBuff^, cb);
    except
      Result := $FFFF;
    end;
  end; (* EditStreamReader *)

begin
  TempString := destination.Text;
  TempString := StringReplace(TempString, #$A, '', [rfReplaceAll]);
  Posicao := length(TempString);
  destination.Lines.BeginUpdate;
  destination.SelLength := 0;
  destination.SelStart := Posicao - 1; // position caret at end
  destination.Perform(EM_SCROLLCARET, 0, 0); // ensure viewport is right
  sourceStream := TMemoryStream.Create;
  try
    Source.Lines.SaveToStream(sourceStream);
    sourceStream.position := 0;

    destination.Properties.MaxLength := destination.Properties.MaxLength + sourceStream.Size;

    rtfStream.dwCookie := DWORD(sourceStream);
    rtfStream.dwError := $0000;
    rtfStream.pfnCallback := @EditStreamReader;
    destination.InnerControl.Perform(
      EM_STREAMIN,
      SFF_SELECTION or SF_RTF or SFF_PLAINRTF, LPARAM(@rtfStream));
    if rtfStream.dwError <> $0000 then
      raise Exception.Create('Error appending RTF data.');
  finally
    sourceStream.free;
    destination.Lines.EndUpdate;
  end;
end;

function HtmlParaColor(ipCor: String): TColor;
Begin
  Result := StringToColor('$' + Copy(ipCor, 6, 2) + Copy(ipCor, 4, 2) + Copy(ipCor, 2, 2));
End;

function FocarForm(hwnd: THandle): Boolean;
// (W) 2001 Daniel Rolf
// http://www.finecode.de
// rolf@finecode.de
var
  hlp: TForm;
begin
  hlp := TForm.Create(nil);
  try
    hlp.BorderStyle := bsNone;
    hlp.SetBounds(0, 0, 1, 1);
    hlp.FormStyle := fsStayOnTop;
    hlp.Show;
    mouse_event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
    mouse_event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
    SetForegroundWindow(hwnd);
  finally
    hlp.free;
  end;
end;

procedure ResizeImg(var ipImg: TBitmap; ipLargura, ipAltura: Integer);
var
  TmpBmp: TBitmap;
  ARect: TRect;
begin
  TmpBmp := TBitmap.Create;
  try
    TmpBmp.Width := ipLargura;
    TmpBmp.Height := ipAltura;
    ARect := Rect(0, 0, ipLargura, ipAltura);
    TmpBmp.Canvas.StretchDraw(ARect, ipImg);
    ipImg.Assign(TmpBmp);
  finally
    TmpBmp.free;
  end;
End;

// Diferenca de Data
procedure DateDiff(ipDate1, ipDate2: TDateTime; var ioDia, ioMes, ioAno: Word);
{ Corrected by Anatoly A. Sanko (2:450/73) }
var
  DtSwap: TDateTime;
  Day1, Day2, Month1, Month2, Year1, Year2: Word;
begin
  if ipDate1 > ipDate2 then
    begin
      DtSwap := ipDate1;
      ipDate1 := ipDate2;
      ipDate2 := DtSwap;
    end;
  DecodeDate(ipDate1, Year1, Month1, Day1);
  DecodeDate(ipDate2, Year2, Month2, Day2);
  ioAno := Year2 - Year1;
  ioMes := 0;
  ioDia := 0;
  if Month2 < Month1 then
    begin
      inc(ioMes, 12);
      Dec(ioAno);
    end;
  inc(ioMes, Month2 - Month1);
  if Day2 < Day1 then
    begin
      inc(ioDia, DaysInMonth(ipDate1));
      if ioMes = 0 then
        begin
          Dec(ioAno);
          ioMes := 11;
        end
      else
        Dec(ioMes);
    end;
  inc(ioDia, Day2 - Day1);
end;

function Pegar_Idade(ipDataNascimento, ipData_Referencia: TDate; ipCalcularMeses1Ano: Boolean = True): string;
var
  vaDias, vaMeses, vaAnos: Word;
begin
  DateDiff(ipDataNascimento, ipData_Referencia, vaDias, vaMeses, vaAnos);
  if vaAnos = 1 then
    Begin
      Result := IntToStr(vaAnos) + ' Ano';
      if ipCalcularMeses1Ano then
        Result := Result + ' e ' + IntToStr(vaMeses) + ' Meses ';
    End
  else if vaAnos > 1 then
    Result := IntToStr(vaAnos) + ' Anos'
  else if (vaAnos = 0) and (vaMeses > 0) then
    Begin
      if vaMeses = 1 then
        Result := IntToStr(vaMeses) + ' M�s e '
      else
        Result := IntToStr(vaMeses) + ' Meses e ';
      if vaDias <= 1 then
        Result := Result + IntToStr(vaDias) + ' Dia'
      else
        Result := Result + IntToStr(vaDias) + ' Dias'
    End
  else if (vaAnos = 0) and (vaMeses = 0) and (vaDias > 0) then
    begin
      if vaDias = 1 then
        Result := Result + IntToStr(vaDias) + ' Dia'
      else
        Result := Result + IntToStr(vaDias) + ' Dias'
    end;
end;

function PegarIdadeCompleta(ipDataNascimento, ipData_Referencia: TDate): string;
var
  vaDias, vaMeses, vaAnos: Word;
  resultAnos, resultMeses, resultDias: String;
begin
  DateDiff(ipDataNascimento, ipData_Referencia, vaDias, vaMeses, vaAnos);
  if vaAnos > 1 then
    resultAnos := IntToStr(vaAnos) + ' Anos '
  else
    resultAnos := IntToStr(vaAnos) + ' Ano ';

  if vaMeses > 1 then
    resultMeses := IntToStr(vaMeses) + ' Meses '
  else
    resultMeses := IntToStr(vaMeses) + ' M�s ';

  if vaDias > 1 then
    resultDias := IntToStr(vaDias) + ' Dias '
  else
    resultDias := IntToStr(vaDias) + ' Dia ';

  Result := resultAnos + resultMeses + resultDias
end;

// retorna a idade exata expressa em dia, mes ou ano
procedure Idade_Exata(Data_Nascimento, Data_Atual: TDate; var Idade: Integer; var IdadeEm: String);
var
  Idade_Dia, Idade_Mes, Idade_Ano: Word;
begin
  // iniciando variaveis
  Idade_Dia := 0;
  Idade_Mes := 0;
  Idade_Ano := 0;
  // calculando a idade
  DateDiff(Data_Nascimento, Data_Atual, Idade_Dia, Idade_Mes, Idade_Ano);
  if Idade_Ano > 0 then // a idade ser� expressa em anos
    begin
      Idade := Idade_Ano;
      IdadeEm := 'ANOS';
    end
  else
    begin
      if Idade_Mes > 0 then
        begin
          Idade := Idade_Mes;
          IdadeEm := 'MESES';
        end
      else
        begin
          if Idade_Dia > 29 then // maior que 29 dias considera 1 mes
            begin
              Idade := 1;
              IdadeEm := 'MESES';
            end
          else
            begin
              Idade := Idade_Dia;
              IdadeEm := 'DIAS';
            end;
        end;
    end;
end;

function TemParametro(ipParametro: String): Boolean;
var
  cont: Integer;
Begin
  Result := false;
  for cont := 0 to ParamCount do
    Begin
      if AnsiCompareStr(ParamStr(cont), ipParametro) = 0 then
        Result := True;
    End;
End;

// funcao para matar processo
function MatarProcesso(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while Integer(ContinueLoop) <> 0 do
    begin
      if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName)))
        and (GetCurrentProcessId <> FProcessEntry32.th32ProcessID) then
        Result := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0), FProcessEntry32.th32ProcessID), 0));
      ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
    end;
  CloseHandle(FSnapshotHandle);
end;

function VerificaAniversario(vaDiaMesNasc, vaDiaMesHoje: TDateTime): Boolean;
begin
  Result := false;
  if (MonthOf(vaDiaMesNasc) = MonthOf(vaDiaMesHoje)) then
    begin
      if ((DayOf(vaDiaMesNasc) <= DayOf(vaDiaMesHoje + 4)) and
        (DayOf(vaDiaMesNasc) >= DayOf(vaDiaMesHoje - 4))) then
        Result := True;
    end;
end;

function ProgramaAberto(ipExeFileName: String; var ipProcessId: Cardinal): Boolean;
var
  vaLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := false;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  vaLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while Integer(vaLoop) <> 0 do
    begin
      if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ipExeFileName)) or
        (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ipExeFileName))) and (GetCurrentProcessId <> FProcessEntry32.th32ProcessID) then
        begin
          Result := True;
          ipProcessId := FProcessEntry32.th32ProcessID;
        end;
      vaLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
    end;
  CloseHandle(FSnapshotHandle);
end;

function TryGetParametroChaveValor(ipNomeChave: String; out ipValor: String; ipSeparador: String = ':'): Boolean;
var
  I: Integer;
  vaMatch: TMatch;
Begin
  Result := false;
  ipValor := '';
  // ParamStr(0) contem o endereco da aplicacao, por isso ignoro ele aqui
  for I := 1 to ParamCount do
    Begin
      ipSeparador := TRegex.escape(ipSeparador);
      // pega tudo que tiver a sua esquerda o valor de ipNomeChave seguido do valor de ipSeparador
      vaMatch := TRegex.Match(ParamStr(I), '(?<=' + ipNomeChave + ipSeparador + ').+', [roIgnoreCase]);
      if vaMatch.Success then
        begin
          Result := True;
          ipValor := vaMatch.Value;
          break;
        end;
    End;
end;

function GetEXEVersionData(const fileName: string): TEXEVersionData;
type
  PLandCodepage = ^TLandCodepage;

  TLandCodepage = record
    wLanguage,
      wCodePage: Word;
  end;
var
  dummy,
    len: Cardinal;
  buf, pntr: Pointer;
  lang: string;
begin
  len := GetFileVersionInfoSize(PChar(fileName), dummy);
  if len = 0 then
    RaiseLastOSError;

  GetMem(buf, len);
  try
    if not GetFileVersionInfo(PChar(fileName), 0, len, buf) then
      RaiseLastOSError;

    if not VerQueryValue(buf, '\VarFileInfo\Translation\', pntr, len) then
      RaiseLastOSError;

    lang := Format('%.4x%.4x', [PLandCodepage(pntr)^.wLanguage, PLandCodepage(pntr)^.wCodePage]);

    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\CompanyName'), pntr, len) { and (@len <> nil) } then
      Result.CompanyName := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\FileDescription'), pntr, len) { and (@len <> nil) } then
      Result.FileDescription := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\FileVersion'), pntr, len) { and (@len <> nil) } then
      Result.FileVersion := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\InternalName'), pntr, len) { and (@len <> nil) } then
      Result.InternalName := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\LegalCopyright'), pntr, len) { and (@len <> nil) } then
      Result.LegalCopyright := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\LegalTrademarks'), pntr, len) { and (@len <> nil) } then
      Result.LegalTrademarks := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\OriginalFileName'), pntr, len) { and (@len <> nil) } then
      Result.OriginalFileName := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\ProductName'), pntr, len) { and (@len <> nil) } then
      Result.ProductName := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\ProductVersion'), pntr, len) { and (@len <> nil) } then
      Result.ProductVersion := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\Comments'), pntr, len) { and (@len <> nil) } then
      Result.Comments := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\PrivateBuild'), pntr, len) { and (@len <> nil) } then
      Result.PrivateBuild := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\SpecialBuild'), pntr, len) { and (@len <> nil) } then
      Result.SpecialBuild := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\LastCompiledTime'), pntr, len) { and (@len <> nil) } then
      Result.BuildData := PChar(pntr);
  finally
    FreeMem(buf);
  end;
end;

function VersaoExe(const ipFileName: string; const ipVersaoAte: TVersaoInfo): String;
var
  VerInfoSize, VerValueSize, dummy: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
  V1, V2, V3, V4: Word;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ipFileName), dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ipFileName), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '', Pointer(VerValue), VerValueSize);
  with VerValue^ do
    begin
      V1 := dwFileVersionMS shr 16;
      V2 := dwFileVersionMS and $FFFF;
      V3 := dwFileVersionLS shr 16;
      V4 := dwFileVersionLS and $FFFF;

    end;
  FreeMem(VerInfo, VerInfoSize);
  case ipVersaoAte of
    viMaJorVersion:
      VersaoExe := IntToStr(V1);
    viMinorVersion:
      VersaoExe := IntToStr(V1) + '.' + IntToStr(V2);
    viRelease:
      VersaoExe := IntToStr(V1) + '.' + IntToStr(V2) + '.' + IntToStr(V3);
    viBuild:
      VersaoExe := IntToStr(V1) + '.' + IntToStr(V2) + '.' + IntToStr(V3) + '.' + IntToStr(V4);
  end;
end;

function ImpressoraPadrao: String; // Retorna a impressora padr�o do windows
var
  Device: array [0 .. 255] of Char;
  Driver: array [0 .. 255] of Char;
  Port: array [0 .. 255] of Char;
  hDMode: THandle;
begin
  Printer.GetPrinter(Device, Driver, Port, hDMode);
  Result := Device;
end;

function VerificaDataPadrao(const ipDataInicial, ipDataFinal, ipDataAtual: TDateTime; ipMostrarMensagem: Boolean): Boolean;
var
  vaMsg: string;
begin
  Result := True;
  if ipDataInicial > ipDataAtual then
    begin
      vaMsg := ('Data Inicial ' + DateTimeToStr(ipDataInicial) + ' esta maior que Data Atual ' + DateTimeToStr(ipDataAtual) + '.');
      Result := false;
    end;
  if ipDataFinal > ipDataAtual then
    begin
      vaMsg := ('Data Final ' + DateTimeToStr(ipDataFinal) + ' esta maior que Data Atual ' + DateTimeToStr(ipDataAtual) + '.');
      Result := false;
    end;
  if ipDataInicial > ipDataFinal then
    begin
      vaMsg := ('Data Inicial ' + DateTimeToStr(ipDataInicial) + ' esta maior que Data Final ' + DateTimeToStr(ipDataFinal) + '.');
      Result := false;
    end;

  if not Result then
    begin
      if ipMostrarMensagem then
        MessageTela(vaMsg)
      else
        raise Exception.Create(vaMsg);
    end;
end;

function AbrirExplorer(OpenAtPath: string; OpenWithExplorer, OpenAsRoot: Boolean): Boolean;
var
  S: string;
begin
  if OpenWithExplorer then
    begin
      if OpenAsRoot then
        S := ' /e,/root,"' + OpenAtPath + '"'
      else
        S := ' /e,"' + OpenAtPath + '"';
    end
  else
    S := '"' + OpenAtPath + '"';
  Result := ShellExecute(Application.Handle, PChar('open'), PChar('explorer.exe'), PChar(S), nil, sw_normal) > 32;
end;

procedure RemoverArquivosDiretorio(ipEndereco: string);
var
  OpStruc: TSHFileOpStruct;
  vaEndereco: string;
  vaEnderecoBuffer: Array [0 .. 128] of Char;
Begin
  vaEndereco := ipEndereco + '\*.*';
  fillChar(OpStruc, SizeOf(OpStruc), 0);
  fillChar(vaEnderecoBuffer, SizeOf(vaEnderecoBuffer), 0);
  StrPCopy(vaEnderecoBuffer, vaEndereco);
  with OpStruc do
    begin
      Wnd := 0;
      wFunc := FO_DELETE;
      pFrom := PChar(vaEndereco);
      fAnyOperationsAborted := false;
      fFlags := FOF_NOCONFIRMATION or FOF_SILENT or FOF_NO_UI;
    end;
  ShFileOperation(OpStruc);
End;

procedure RemoverDiretorio(Const sPath: String);
// var
// OpStruc: TSHFileOpStruct;
// FromBuffer, ToBuffer: Array [0 .. 128] of Char;
begin
  // Apaga Pasta, Sub-Pastas e Arquivos;;;
  if DirectoryExists(sPath) then
    TDirectory.Delete(sPath, True);
  {
    fillChar(OpStruc, SizeOf(OpStruc), 0);
    fillChar(FromBuffer, SizeOf(FromBuffer), 0);
    fillChar(ToBuffer, SizeOf(ToBuffer), 0);
    StrPCopy(FromBuffer, sPath);
    With OpStruc Do
    Begin
    Wnd := hHandle;
    wFunc := FO_DELETE;
    pFrom := @FromBuffer;
    pTo := @ToBuffer;
    fFlags := FOF_NOCONFIRMATION;
    fAnyOperationsAborted := False;
    hNameMappings := nil;
    End;
    ShFileOperation(OpStruc); }
end;

function RemoveAcentos(ipTexto: String): String; { Remove caracteres acentuados de uma string }
const
  ComAcento = '����������������������������������������������';
  SemAcento = 'aaaaaeeeeiiiiooooouuuucAAAAAEEEEIIIIOOOOOUUUUC';
var
  x: Integer;
begin
  for x := 1 to length(ipTexto) do
    if Pos(ipTexto[x], ComAcento) <> 0 then
      ipTexto[x] := SemAcento[Pos(ipTexto[x], ComAcento)];
  Result := ipTexto;
end;

function BoolToInt(ipBoolean: Boolean): Integer; // retornar 0 para false e 1 para true;
begin
  if ipBoolean then
    Result := 1
  else
    Result := 0;
end;

function FormAtivo(ipFormNome: String): Boolean; // testa se o form est� ativo
var
  cont: Integer;
begin
  Result := false;
  for cont := 0 to Screen.FormCount - 1 do
    if (AnsiCompareText(Screen.Forms[cont].Name, ipFormNome) = 0) then // quer dizer que o os nomes s�o iguais
      if (Screen.Forms[cont].Visible) then // testando se o form esta visible
        Exit(True);
end;

function SubstituiTextoCDS(const ipTexto, ipTagInicio, ipTagFim, ipTextoEntreTag: String; const ipCDS: TDataSet): String;
var
  vaSair, vaPosIni, vaPosFinal: Integer;
  vaTexto, vaStringOld, vaStringNew, vaCampo: String;
begin
  vaSair := 0;
  vaTexto := ipTexto;
  while ((Pos(ipTagInicio, vaTexto) > 0) and (vaSair < 100)) do
    begin
      vaPosIni := Pos(ipTagInicio, vaTexto);
      vaPosFinal := Pos(ipTagFim, Copy(vaTexto, vaPosIni));
      if vaPosFinal > 0 then // quer dizer que encontrou a posi��o final;
        begin
          vaPosFinal := vaPosIni + vaPosFinal + length(ipTagFim);
          vaStringOld := Copy(vaTexto, vaPosIni, vaPosFinal - vaPosIni - 1);
          vaCampo := Copy(vaStringOld, length(ipTagInicio) + 1, Pos(ipTagFim, vaStringOld) - length(ipTagInicio) - 1);
          try
            if ipTextoEntreTag = '' then
              vaStringNew := ipCDS.FieldByName(vaCampo).AsString
            else
              vaStringNew := ipTextoEntreTag;
          except
            vaStringNew := '*CAMPO ' + vaCampo + ' INEXISTENTE*';
          end;
          vaTexto := StringReplace(vaTexto, vaStringOld, vaStringNew, [rfReplaceAll]);
        end
      else
        inc(vaSair)
    end;
  Exit(vaTexto);
end;

function CompactarArquivo(ipEndNomeArquivoOriginal, ipEndNomeArquivoCompac: String; ipCompressao: TCompressionLevel): String;
var
  FileIni, FileOut: TFileStream;
  Zip: TCompressionStream;
begin
  try
    try
      FileIni := TFileStream.Create(ipEndNomeArquivoOriginal, fmOpenRead and fmShareExclusive);
      FileOut := TFileStream.Create(ipEndNomeArquivoCompac, fmCreate or fmShareExclusive);
      Zip := TCompressionStream.Create(ipCompressao, FileOut);
      Zip.CopyFrom(FileIni, FileIni.Size);
    except
      on E: Exception do
        Exit('N�o foi poss�vel fazer compacta��o do Arquivo: ' + #13 + ipEndNomeArquivoOriginal + ' + #13 + ' + 'para o Arquivo: ' + #13 + ipEndNomeArquivoCompac + #13 + E.Message);
    end;
    Exit(coResultOK);
  finally
    FreeAndNil(Zip);
    FreeAndNil(FileOut);
    FreeAndNil(FileIni);
  end;
end;

function DesCompactarArquivo(ipEndNomeArquivoOriginal, ipEndNomeArquivoCompac: String; ipCompressao: TCompressionLevel): String;
var
  FileIni, FileOut: TFileStream;
  DeZip: TDecompressionStream;
  I: Integer;
  buf: array [0 .. 1023] of Byte;
begin
  try
    try
      FileIni := TFileStream.Create(ipEndNomeArquivoCompac, fmOpenRead and fmShareExclusive);
      FileOut := TFileStream.Create(ipEndNomeArquivoOriginal, fmCreate or fmShareExclusive);
      DeZip := TDecompressionStream.Create(FileIni);
      repeat
        I := DeZip.Read(buf, SizeOf(buf));
        if I <> 0 then
          FileOut.Write(buf, I);
      until I <= 0;
    except
      on E: Exception do
        Exit('N�o foi poss�vel fazer a Descompacta��o do Arquivo: ' + #13 + ipEndNomeArquivoCompac + ' + #13 + ' + 'para o Arquivo: ' + #13 + ipEndNomeArquivoOriginal + #13 + E.Message);
    end;
    Exit(coResultOK);
  finally
    FreeAndNil(DeZip);
    FreeAndNil(FileOut);
    FreeAndNil(FileIni);
  end;
end;

function InternaQtdeIntervalo(ipIntervalo: Integer): Double;
/// /////////////////////////////////////////////////////////////////////////////
/// Fun��o utilizado no pserver.psmFuncoes.fpuInternaCriaPrecMat              //
/// Exemplos de como deve chegar o ipIntervalo                               //
/// 1/1 hs                                                                   //
/// 12/12 hs                                                                 //
/// 1x ao dia                                                                //
/// 2/2 hs                                                                   //
/// 2x ao dia                                                                //
/// 3/3 hs                                                                   //
/// 3x ao dia                                                                //
/// 4/4 hs                                                                   //
/// 5/5 hs                                                                   //
/// 6/6 hs                                                                   //
/// 8/8 hs
/// S/N                                                                        //
/// ACM                                                                        //
/// //////////////////////////////////////////////////////////////////////////////
var
  vaPosicao: Integer; // Receber um intervalo e retorna a qtde em um dia;
begin
  if ipIntervalo = 0 then // coloquei isso aqui senao ele da erro de divis�o por 0 no calcfild do smInternacao1.qPrescMed
    Exit(0);
  if fpuHorario_In_PrescSeNecessario(ipIntervalo) then
    Exit(1)
  else
    Exit(24 / ipIntervalo);
end;

// funcao para copiar 1 registro de 1 clientdataset pra outro
procedure CopiarRegistroCds(ipDataSetOrigem: TDataSet; ipDataSetCopia: TDataSet; ipCriar_Fields: Boolean);
var
  I: Integer;
  vaField: TField;
begin

  if ipCriar_Fields then
    Begin
      // ipDataSetCopia tem que ser algum desses tipos pq senao o metodo createdataset nao vai existir
      if (ipDataSetCopia is TClientDataSet) or (ipDataSetCopia is TFDQuery) then
        begin
          ipDataSetCopia.Close; // garantir que esta fechado
          ipDataSetCopia.FieldDefs.Assign(ipDataSetOrigem.FieldDefs);
          TClientDataSet(ipDataSetCopia).CreateDataSet; // mesmo se for um ADQuery o delphi aceita fazer o cast, pois o nome da procedure � exatamento o mesmo
          ipDataSetCopia.Open;
        end
      else
        raise Exception.Create('O DataSet de Copia n�o � uma inst�ncia de TClientDataSet ou TADQuery');
    End;

  if not(ipDataSetCopia.State in [dsInsert, dsEdit]) then
    ipDataSetCopia.Insert;

  for I := 0 to ipDataSetCopia.fieldcount - 1 do // copiando os fields
    begin
      // em caso de campos calculados, caso primeiro seja copiado de um cds q tem campo calculado para um cds qualquer o campo calculado nao vai,
      // ent�o se tentar retornar os valores deste segundo cds para o primeiro ir� ocorrer index out of bounds. por isto foi
      // adicinado esta condi��o (Ocorreu isto na prescri��o m�dica)
      if I < ipDataSetOrigem.fieldcount then
        begin

          if ((not ipDataSetCopia.Fields[I].ReadOnly) and (ipDataSetOrigem.Fields[I].FieldKind = fkData)) then
            begin
              vaField := ipDataSetOrigem.FindField(ipDataSetCopia.Fields[I].FieldName);
              if Assigned(vaField) then
                ipDataSetCopia.Fields[I].Assign(vaField);
            end;
        end
      else
        break;
    end;

end;

// funcao para copiar 1 registro de 1 clientdataset pra outro
// procedure CopiarRegistroCds(ipDataSetOrigem, ipDataSetCopia: TClientDataSet; ipCriar_Fields: Boolean);
// var
// i: Integer;
// vaField: TField;
// begin
// if ipCriar_Fields then
// Begin
// ipDataSetCopia.Close; // garantir que esta fechado
// ipDataSetCopia.FieldDefs.Assign(ipDataSetOrigem.FieldDefs);
// ipDataSetCopia.CreateDataSet;
// ipDataSetCopia.Open;
// End;
//
// if not(ipDataSetCopia.State in [dsInsert, dsEdit]) then
// ipDataSetCopia.Insert;
//
// for i := 0 to ipDataSetCopia.fieldcount - 1 do // copiando os fields
// begin
// // em caso de campos calculados, caso primeiro seja copiado de um cds q tem campo calculado para um cds qualquer o campo calculado nao vai,
// // ent�o se tentar retornar os valores deste segundo cds para o primeiro ir� ocorrer index out of bounds. por isto foi
// // adicinado esta condi��o (Ocorreu isto na prescri��o m�dica)
// if i < ipDataSetOrigem.fieldcount then
// begin
//
// if ((not ipDataSetCopia.Fields[i].ReadOnly) and (ipDataSetOrigem.Fields[i].FieldKind = fkData)) then
// begin
// vaField := ipDataSetOrigem.FindField(ipDataSetCopia.Fields[i].FieldName);
// if Assigned(vaField) then
// ipDataSetCopia.Fields[i].Assign(vaField);
// end;
// end
// else
// break;
// end;
// End;

// procedure que ir� receber o cxGridDBTableView e ajustar o tamanho da coluna x para o maximo posivel;
procedure AjustaColunacxGrid(ipTamanhoJaUtilizado, ipColunaObs: Integer; ipcxGridDBTableView: TcxGridDBTableView);
var
  I: Integer;
  vaWidthDisponivel, vaWidthTotal: Integer;
begin
  vaWidthTotal := ipTamanhoJaUtilizado;
  vaWidthDisponivel := Screen.Width - coWidthRedutor;
  for I := 0 to ipcxGridDBTableView.ColumnCount - 1 do
    if I <> ipColunaObs then
      vaWidthTotal := vaWidthTotal + ipcxGridDBTableView.Columns[I].Width;
  if vaWidthDisponivel > vaWidthTotal then // esta sobrando tela vamos ajustar coluna de obs
    ipcxGridDBTableView.Columns[ipColunaObs].Width := vaWidthDisponivel - vaWidthTotal;
end;

// procedure para ajustar o tamanho da tela com o tamanho do monitor
procedure AjustaTamanhoTela(ipForm: TForm); overload;
Begin
  if Screen.Height < 601 then
    ipForm.Height := Screen.Height - coHeightRedutor600
  else
    ipForm.Height := Screen.Height - coHeigthRedutor;
  ipForm.Width := Screen.Width - coWidthRedutor;
End;

// procedure para ajustar o tamanho da tela de acordo com o que for passado pelo user;
procedure AjustaTamanhoTela(ipForm: TForm; ipWidth, ipHeigth: Integer); overload;
Begin
  ipForm.Height := ipHeigth;
  ipForm.Width := ipWidth;
End;

Function SysPegaEndereco(ipFolder: Integer; ipCanCreate: Boolean): string;
// Call this routine as follows: GetSpecialFolderPath (CSIDL_PERSONAL, false), returns folder as result
var
  vaFilePath: array [0 .. 255] of Char;
begin
  SHGetSpecialFolderPath(0, @vaFilePath[0], ipFolder, ipCanCreate);
  Result := vaFilePath;
end;

function JSONArrayToString(ipJSONArray: TJSONArray; ipCampo: String): String; // recebe um JSONArray e o campo que deseja pegar e retorna o valor do campo;
var
  ja: TJSONArray;
  jSubObj, vajsonObj: TJSONObject;
  I, j: Integer;
  jSubPar, jp: TJSONPair;
begin
  try
    Result := '';
    vajsonObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes('{"result":' + ipJSONArray.ToString + '}'), 0) as TJSONObject;
    jp := vajsonObj.get(0); // pega o par zero
    ja := (jp.JsonValue as TJSONArray); // do par zero pega o valor, que � array
    for I := 0 to ja.Size - 1 do // itera o array para pegar cada elemento
      begin
        jSubObj := (ja.get(I) as TJSONObject); // pega cada elemento do array, onde cada elemento � um objeto, neste caso, em fun��o da string JSON montada acima
        for j := 0 to jSubObj.Size - 1 do // quantidade de pares do objeto
          begin
            jSubPar := jSubObj.get(j); // pega o par no �ndice j
            if AnsiCompareText(jSubPar.JsonString.Value, ipCampo) = 0 then // quer dizer que � o mesmo campo vamos retornar o valor;
              begin
                Result := jSubPar.JsonValue.Value; // atribuindo os valores do json para cds;
                break;
              end;
          end;
      end;
  finally
    vajsonObj.free;
  end;
end;

procedure JSONArrayToClientDataSet(ipJSONArray: TJSONArray; ipCDS: TClientDataSet);
var
  ja: TJSONArray;
  jSubObj, vajsonObj: TJSONObject;
  I, j: Integer;
  jSubPar, jp: TJSONPair;
begin
  try
    vajsonObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes('{"result":' + ipJSONArray.ToString + '}'), 0) as TJSONObject;
    jp := vajsonObj.get(0);
    ja := (jp.JsonValue as TJSONArray); // do par zero pega o valor, que � array
    for I := 0 to ja.Size - 1 do // itera o array para pegar cada elemento
      begin
        jSubObj := (ja.get(I) as TJSONObject); // pega cada elemento do array, onde cada elemento � um objeto, neste caso, em fun��o da string JSON montada acima
        ipCDS.Append;
        // quantidade de pares do objeto
        for j := 0 to jSubObj.Size - 1 do
          begin
            jSubPar := jSubObj.get(j); // pega o par no �ndice j
            ipCDS.FieldByName(jSubPar.JsonString.Value).AsVariant := jSubPar.JsonValue.Value; // atribuindo os valores do json para cds;
          end;
        ipCDS.Post;
      end;
  finally
    vajsonObj.free;
  end;
end;

// caso a string seja maior, corta 1 pedaco, caso seja menor, preenche com ' ' a direita by waldir
function Ajustar_Tamanho_Str(Original: STring; Tamanho: Integer): String;
Begin
  if length(Original) > Tamanho then
    Result := Copy(Original, 1, Tamanho)
  else if length(Original) = Tamanho then
    Result := Original
  else
    Result := Preenchimento(Original, ' ', Tamanho, True);
end;

procedure Justify(ipRichEdit: TRichEdit);
const
  WM_USER = $400;
  EM_EXSETSEL = (WM_USER + 55);
  EM_SETTYPOGRAPHYOPTIONS = (WM_USER + 202);
  EM_GETTYPOGRAPHYOPTIONS = (WM_USER + 203);
  TO_ADVANCEDTYPOGRAPHY = $1;
  mZERO = $0;
var
  x: tParaformat;
  L: LongInt;
  cp: charrange;
begin
  x.cbSize := SizeOf(x);
  if ipRichEdit.SelLength = 0 then
    begin
      cp.cpMin := 0;
      cp.cpMax := length(ipRichEdit.Text);
      SendMessage(ipRichEdit.Handle, EM_EXSETSEL, mZERO, LPARAM(@cp));
    end;
  L := SendMessageA(ipRichEdit.Handle, EM_SETTYPOGRAPHYOPTIONS, TO_ADVANCEDTYPOGRAPHY, TO_ADVANCEDTYPOGRAPHY);
  if L = 1 then
    begin
      SendMessageA(ipRichEdit.Handle, EM_GETTYPOGRAPHYOPTIONS, mZERO, mZERO);
      SendMessage(ipRichEdit.Handle, EM_GETPARAFORMAT, mZERO, LPARAM(@x));
      x.dwMask := PFM_ALIGNMENT;
      x.wAlignment := PFA_JUSTIFY;
      SendMessage(ipRichEdit.Handle, EM_SETPARAFORMAT, mZERO, LPARAM(@x));
    end;
  cp.cpMin := 0;
  cp.cpMax := 0;
  SendMessage(ipRichEdit.Handle, EM_EXSETSEL, mZERO, LPARAM(@cp));
  ipRichEdit.WordWrap := True;
end;

function SetJSon(ipNomeCampo: String; ipJSON: TJSONObject): Variant;
var
  I: Integer;
begin
  Result := '';
  I := 0;
  while ((I <= ipJSON.Size - 1) and (Result = '')) do
    begin
      if AnsiCompareText(ipJSON.get(I).JsonString.Value, ipNomeCampo) = 0 then // quer dizer que os dois campos sao iguais
        Result := (ipJSON.get(I).JsonValue.Value);
      inc(I);
    end;
end;

// Esta fun��o chama um programa externo... E aguarda at� que finalize o programa
// Externo para retornar ao programa que o chamou...
function ExecutarPrograma(const fileName, Params: string; const WindowState: Word): Boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: string;
begin
  { Coloca o nome do arquivo entre aspas. Isto � necess�rio devido aos espa�os contidos em nomes longos }
  CmdLine := '"' + fileName + '"' + Params;
  fillChar(SUInfo, SizeOf(SUInfo), #0);
  with SUInfo do
    begin
      cb := SizeOf(SUInfo);
      dwFlags := STARTF_USESHOWWINDOW;
      wShowWindow := WindowState;
    end;
  Result := CreateProcess(nil, PChar(CmdLine), nil, nil, false, CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, PChar(ExtractFilePath(fileName)), SUInfo, ProcInfo);
  { Aguarda at� ser finalizado }
  if Result then
    begin
      WaitForSingleObject(ProcInfo.hProcess, INFINITE);
      { Libera os Handles }
      CloseHandle(ProcInfo.hProcess);
      CloseHandle(ProcInfo.hThread);
    end;
end;

{ Esta fun��o retorna true se for pressionado OK e false em caso contr�rio.
  Se for OK, o texto digitado pelo usu�rio ser� copiado para a vari�vel Data }
function ObterDataSis(var Data: String): Boolean;
var
  Form_DataSis: TForm; { Vari�vel para o Form }
  MaskEdit1: TMaskEdit; { Vari�vel para o MaskEdit }
begin
  Result := false; { Por padr�o retorna false }
  { Cria o form }
  Form_DataSis := TForm.Create(Application);
  try
    { Altera algumas propriedades do Form }
    Form_DataSis.BorderIcons := [];
    Form_DataSis.BorderStyle := bsSingle;
    Form_DataSis.Caption := 'Data Sistema';
    Form_DataSis.position := poDesigned;
    Form_DataSis.Left := 323;
    Form_DataSis.Top := 108;
    Form_DataSis.Width := 120;
    Form_DataSis.Height := 111;
    { Coloca o MaskEdit }
    MaskEdit1 := TMaskEdit.Create(Form_DataSis);
    with MaskEdit1 do
      begin
        Font.Color := clBlack;
        Font.Height := -13;
        Font.Name := 'MS Sans Serif';
        Font.Style := [fsBold];
        Parent := Form_DataSis;
        Width := 85;
        Height := 30;
        { Posiciona de acordo com a largura do form }
        Left := Trunc((Form_DataSis.Width - Width) / 2) - 5;
        Top := 10;
        EditMask := '99/99/9999';
        Text := DateToStr(Date);
      end;
    { Coloca o bot�o OK }
    with TBitBtn.Create(Form_DataSis) do
      begin
        Parent := Form_DataSis;
        Height := 41;
        Width := 90;
        { Posiciona de acordo com a largura do form }
        Left := Trunc((Form_DataSis.Width - Width) / 2) - 5;
        Top := 40;
        Font.Color := clBlack;
        Font.Height := -13;
        Font.Name := 'MS Sans Serif';
        Font.Style := [fsBold];
        Kind := bkOK; { Bot�o Ok }
      end;
    { Exibe o form e aguarda a a��o do usu�rio. Se for OK... }
    if Form_DataSis.ShowModal = mrOK then
      begin
        try
          Data := DateToStr(StrToDate(MaskEdit1.Text));
          if (StrToDate(Data) > Date) or (StrToDate(Data) < Date - 1980) then
            begin
              MessageTela('Data Inv�lida');
              Data := '';
            end;
        except
          on E: Exception do
            begin
              MessageTela('Data Inv�lida');
              Data := '';
            end;
        end;
        Result := True;
      end;
  finally
    Form_DataSis.free;
  end;
end;

// Completa o inicio de uma string com algum valor
function StrInicio(Tipo, Valor: String; Tamanho: Integer): String;
var
  VFinal: String;
begin
  VFinal := Valor;
  While length(VFinal) < Tamanho do
    VFinal := Tipo + VFinal;
  StrInicio := VFinal;
end;

function FatMult(PercInicial: Double; Qtde: Integer): Double;
var
  FatorMult: Double;
begin
  FatorMult := 1;
  while Qtde >= 1 do
    begin
      FatorMult := FatorMult * PercInicial;
      Qtde := Qtde - 1;
    end;
  FatMult := FatorMult;
end;

// funcao para validar data
function ValiData(Teste_Data, Base_Data, Teto_Data: TDateTime): Boolean;
begin
  try
    if (Teste_Data < Base_Data) or (Teste_Data > Teto_Data) then
      ValiData := false
    else
      ValiData := True;
  except
    on E: Exception do
      ValiData := false;
  end;
end;

procedure Espera_Tempo(Quanto_Tempo: TDateTime);
var
  Hora1, Hora2: TDateTime;
begin
  Hora1 := Time;

  Hora2 := Time;
  While (Hora2 - Hora1) < Quanto_Tempo do
    Hora2 := Time;
end;

Function DataFeriado(ipData: TDateTime = 0): Boolean; // fun��o que retorna se a data � feriado ou n�o;
var
  vaiG, vaiI, vaiJ, vaiC, vaiH, vaiL, vaiAno, vaiMes: Integer;
  vawAno, vawMes, vawDia: Word;
  vadtCarnaval, vadtE, vadtSexta: TDateTime;
const
  FeriadosFixos: Array [1 .. 12] of String = ('01~', // Jan
  '', // Fev
  '', // Mar
  '21~', // Abr
  '01~', // Mai
  '', // Jun
  '', // Jul
  '', // Ago
  '07~', // Set
  '12~', // Out
  '02~15~', // Nov
  '25~'); // Dez
begin
  if ipData = 0 then
    Result := false
  else
    begin
      try
        vaiMes := StrToInt(FormatDateTime('mm', ipData));
      except
        vaiMes := 0;
      end;
      if (vaiMes < 1) or (vaiMes > 12) then
        Result := false
      else
        Result := Pos(FormatDateTime('dd', ipData), FeriadosFixos[vaiMes]) <> 0;
    end;
  // ---- Calcula o Feriado de Carnaval e Sexta-Feira Santa
  DecodeDate(ipData, vawAno, vawMes, vawDia);
  vaiAno := vawAno;
  vaiG := vaiAno mod 19;
  vaiC := vaiAno div 100;
  vaiH := (vaiC - vaiC div 4 - (8 * vaiC + 13) div 25 + 19 * vaiG + 15) mod 30;
  vaiI := vaiH - (vaiH div 28) * (1 - (vaiH div 28) * (29 div (vaiH + 1)) * ((21 - vaiG) div 11));
  vaiJ := (vaiAno + vaiAno div 4 + vaiI + 2 - vaiC + vaiC div 4) mod 7;
  vaiL := vaiI - vaiJ;
  vawMes := 3 + (vaiL + 40) div 44;
  vawDia := vaiL + 28 - 31 * (vawMes div 4);
  vadtE := EncodeDate(vawAno, vawMes, vawDia);
  while DayOfWeek(vadtE) > 1 do
    vadtE := vadtE + 1;
  vadtSexta := vadtE - 2; // --- Sexta-feira Santa
  vadtCarnaval := vadtE - 47; // --- Carnaval
  if (ipData = vadtSexta) or (ipData = vadtCarnaval) then
    Result := True;
End;

Function IncDiaUtil(ipData: TDateTime; ipQtdeDias: Integer): TDateTime;
var
  vaDataFinal: TDate;
  I: Integer;
begin
  vaDataFinal := ipData;
  while ((DayOfWeek(vaDataFinal) in [1, 7]) or (DataFeriado(vaDataFinal))) do // vamos testar se a data inicial � fim de semana ou se � feriado se for vamos incrementar para iniciar no dia util;
    vaDataFinal := IncDay(vaDataFinal, 1);
  for I := 1 to (ipQtdeDias - 1) do // vamos passar em cada dia para saber se � feriado ou se � fim de semana;
    begin
      vaDataFinal := IncDay(vaDataFinal, 1);
      while ((DayOfWeek(vaDataFinal) in [1, 7]) or (DataFeriado(vaDataFinal))) do
        vaDataFinal := IncDay(vaDataFinal, 1);
    end;
  Exit(vaDataFinal);
end;

procedure RestoreLayoutGrid(ipEndConfig: String; ipGridView: TcxGridDBTableView; ipNomeGrid: String; ipIgnorarValidacoes:Boolean);
begin
  if ((ipEndConfig <> '') and (ipIgnorarValidacoes or ipGridView.OptionsCustomize.ColumnsQuickCustomization)) then
    begin
      if FileExists(ipEndConfig + 'Grids\' + ipNomeGrid + '.ini') then
        ipGridView.RestoreFromIniFile(ipEndConfig + 'Grids\' + ipNomeGrid + '.ini', false, false, [], '');
    end;
end;

procedure SalvarLayoutGrid(ipEndConfig: String; ipGridView: TcxGridDBTableView; ipNomeGrid: String;ipIgnorarValidacoes:Boolean);
begin
  if ((ipEndConfig <> '') and (ipIgnorarValidacoes or (ipGridView.OptionsCustomize.ColumnsQuickCustomization))) then
    begin
      if not DirectoryExists(ipEndConfig + 'Grids\') then
        CreateDir(ipEndConfig + 'Grids\');
      ipGridView.StoreToIniFile(ipEndConfig + 'Grids\' + ipNomeGrid + '.ini', True, [], '');
    end;
end;

function RoundTo(ipValorBase: Double; ipCasas: Integer): Double;
begin
  case ipCasas of
    0:
      Result := StrToFloat(FormatFloat('#############', ipValorBase));
    1:
      Result := StrToFloat(FormatFloat('###########0.0', ipValorBase));
    2:
      Result := StrToFloat(FormatFloat('###########0.00', ipValorBase));
    3:
      Result := StrToFloat(FormatFloat('###########0.000', ipValorBase));
    4:
      Result := StrToFloat(FormatFloat('###########0.0000', ipValorBase));
    5:
      Result := StrToFloat(FormatFloat('###########0.00000', ipValorBase));
    6:
      Result := StrToFloat(FormatFloat('###########0.000000', ipValorBase));
    7:
      Result := StrToFloat(FormatFloat('###########0.0000000', ipValorBase));
    8:
      Result := StrToFloat(FormatFloat('###########0.00000000', ipValorBase));
    9:
      Result := StrToFloat(FormatFloat('###########0.000000000', ipValorBase));
    10:
      Result := StrToFloat(FormatFloat('###########0.0000000000', ipValorBase));
  else
    Result := ipValorBase;
  end;
end;

procedure Extrair_Res(ipDir, ipArq, ipNomeRes, ipTipoRes: String; ipSobrepor: Boolean); // procedure para extrair arquivos res
var
  vCaminho: String;
  Res: TResourceStream; // Classe espec�fica  do Delphi para manipula��o de recursos
Begin
  vCaminho := ipDir + '\' + ipArq;
  if not DirectoryExists(ipDir) then
    CreateDir(ipDir);
  if ipSobrepor and FileExists(vCaminho) then // deleta o arquivo se for para sobrepor
    Begin
      if not DeleteFile(PChar(vCaminho)) then
        Exit;
    End
  else if (not ipSobrepor) and (FileExists(vCaminho)) then // se nao for para sobrepor e o arquivo existir, pode sair
    Exit;
  Res := TResourceStream.Create(HInstance, PChar(ipNomeRes), PChar(ipTipoRes));
  try
    Res.SaveToFile(PChar(vCaminho));
  finally
    Res.free;
  end;
End;

function Pegar_Dir_Temp: String; // funcao para poder pegar diretorios temporarios do windows
var
  tempFolder: array [0 .. MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, @tempFolder);
  Result := StrPas(tempFolder);
end;

function Pegar_Arq_Temp: String; // Funcao para poder pegar arquivos temporarios do windows
var
  pc: PChar;
begin
  pc := StrAlloc(MAX_PATH + 1);
  GetTempFileName(PChar(Pegar_Dir_Temp), 'PMEDICO', 0, pc);
  Result := string(pc);
  StrDispose(pc);
end;

// descobre o tamanho de 1 arquivo sem precisar usar o filesize
function TamanhoArq(fileName: string): Int64;
var
  SearchRec: TSearchRec;
begin
  if FindFirst(fileName, faAnyFile, SearchRec) = 0 then
    // SearchRec.Size funciona, mas apenas para arquivos menores que 2GB, caso seja maior que 2GB usar o que esta comentando
    { Result := Int64(SearchRec.FindData.nFileSizeHigh) shl Int64(32) +    // calculando o tamanho do arquivo
      Int64(SearchRec.FindData.nFileSizeLow) }
    Result := SearchRec.Size
  else
    Result := 0;
  SysUtils.FindClose(SearchRec); // fecha a pesquisa
End;

function SysNomeComputador: string;
var
  I: DWORD;
begin
  I := MAX_COMPUTERNAME_LENGTH + 1;
  setLength(Result, I);
  Windows.GetComputerName(PChar(Result), I);
  Result := string(PChar(Result));
end;

function CoalesceTexto(const ipTexto: String): String;
begin
  if ipTexto <> '' then
    Result := ipTexto
  else
    Result := '.';
end;

function CoalesceTexto(const ipTexto, ipTextoRet: String): String;
begin
  if ipTexto <> '' then
    Result := ipTexto
  else
    Result := ipTextoRet;
end;

function verPalavraSensurada(const ipTexto: String; ipMostrarMensagem: Boolean): String;
var
  I: Integer;
begin
  Result := '';
  I := 0;
  while ((I <= length(coPalavrasSensuradas)) and (Result = '')) do
    begin
      if Pos(coPalavrasSensuradas[I], ipTexto) > 0 then
        begin
          Result := coPalavrasSensuradas[I];
          if ipMostrarMensagem then
            MessageTela(false, 1, 'Palavra [' + coPalavrasSensuradas[I] + '] n�o pode ser utilizada!', 0);
        end;
      inc(I);
    end;
end;

function verPalavraReservadaBanco(const ipTexto: String; ipMostrarMensagem: Boolean): String;
var
  I: Integer;
begin
  Result := '';
  I := 0;
  while ((I <= length(coPalavrasReservadaBanco)) and (Result = '')) do
    begin
      if Pos(coPalavrasReservadaBanco[I], ipTexto) > 0 then
        begin
          Result := coPalavrasReservadaBanco[I];
          if ipMostrarMensagem then
            MessageTela(false, 1, 'Palavra [' + coPalavrasReservadaBanco[I] + '] n�o pode ser utilizada!', 0);
        end;
      inc(I);
    end;
end;

function XlsToStringGrid(ipAGrid: TStringGrid; ipGauge: TGauge; ipXLSFile: string): Boolean;
const
  xlCellTypeLastCell = $0000000B;
var
  XLApp, Sheet: OleVariant;
  RangeMatrix: Variant;
  x, y, k, r: Integer;
begin
  Result := false;
  ipGauge.Progress := 0; // barras de progresso recebe zero;
  // Cria Excel- OLE Object
  XLApp := CreateOleObject('Excel.Application');
  try
    XLApp.Visible := false; // Esconde Excel
    XLApp.Workbooks.Open(ipXLSFile); // Abre o Workbook
    Sheet := XLApp.Workbooks[ExtractFileName(ipXLSFile)].WorkSheets[1];
    Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
    x := XLApp.ActiveCell.Row; // Pegar o n�mero da �ltima linha
    ipGauge.MaxValue := x; // seta para saber o maior valor que ser� a ultima linha;
    y := XLApp.ActiveCell.Column; // Pegar o n�mero da �ltima coluna
    ipAGrid.RowCount := x; // Seta Stringgrid linha e coluna
    ipAGrid.ColCount := y;
    RangeMatrix := XLApp.Range['A1', XLApp.Cells.Item[x, y]].Value; // Associaca a variant WorkSheet com a variant do Delphi
    k := 1; // Cria o loop para listar os registros no TStringGrid
    repeat
      for r := 1 to y do
        ipAGrid.Cells[(r - 1), (k - 1)] := RangeMatrix[k, r];
      inc(k, 1);
      ipGauge.Progress := k;
      Application.ProcessMessages;
    until k > x;
    RangeMatrix := Unassigned;
  finally
    if not VarIsEmpty(XLApp) then // Fecha o Excel
      begin
        XLApp.Quit;
        XLApp := Unassigned;
        Sheet := Unassigned;
        Result := True;
      end;
  end;
  ipAGrid.FixedRows := 1;
end;

function Mask_Cep(Texto: String): String; // fun��o para colocar os pontos no cep
begin
  Texto := Preenchimento(SoNumeros(Texto), '0', 10, 2); // faz o preenchimento com zero a direita;
  if Texto <> '' then
    Texto := Copy(Texto, 1, 2) + '.' + Copy(Texto, 3, 3) + '-' + Copy(Texto, 6, 3);
  Exit(Texto);
end;

procedure FocusPrimaryDB(ipFormFocus: TForm; ipDataSource: TDataSource);
var
  I: Integer;
  vaContinuar: Boolean;
begin
  // vamos passar em todos os componentes e ver qual o primeiro componente para dar o focus;
  vaContinuar := True;
  for I := 0 to (ipFormFocus.ComponentCount - 1) do
    begin
      if (ipFormFocus.Components[I] is TEdit) then
        begin
          if (ipFormFocus.Components[I] as TEdit).Enabled and (ipFormFocus.Components[I] as TEdit).Visible then
            begin
              if vaContinuar then
                begin
                  (ipFormFocus.Components[I] as TEdit).SetFocus;
                  vaContinuar := false;
                end;
            end
        end
      else if (ipFormFocus.Components[I] is TDBEdit) then
        begin
          if (ipFormFocus.Components[I] as TDBEdit).Enabled and (ipFormFocus.Components[I] as TDBEdit).Visible then
            begin
              if (ipFormFocus.Components[I] as TDBEdit).DataSource = ipDataSource then
                if vaContinuar then
                  begin
                    (ipFormFocus.Components[I] as TDBEdit).SetFocus;
                    vaContinuar := false;
                  end;
            end
        end
      else if (ipFormFocus.Components[I] is TDBCheckBox) then
        begin
          if (ipFormFocus.Components[I] as TDBCheckBox).Enabled and (ipFormFocus.Components[I] as TDBCheckBox).Visible then
            begin
              if (ipFormFocus.Components[I] as TDBCheckBox).DataSource = ipDataSource then
                if vaContinuar then
                  begin
                    (ipFormFocus.Components[I] as TDBCheckBox).SetFocus;
                    vaContinuar := false;
                  end;
            end
        end
      else if (ipFormFocus.Components[I] is TDBRadioGroup) then
        begin
          if (ipFormFocus.Components[I] as TDBRadioGroup).Enabled and (ipFormFocus.Components[I] as TDBRadioGroup).Visible then
            begin
              if (ipFormFocus.Components[I] as TDBRadioGroup).DataSource = ipDataSource then
                if vaContinuar then
                  begin
                    (ipFormFocus.Components[I] as TDBRadioGroup).SetFocus;
                    vaContinuar := false;
                  end;
            end
        end
      else if (ipFormFocus.Components[I] is TDBMemo) then
        begin
          if (ipFormFocus.Components[I] as TDBMemo).Enabled and (ipFormFocus.Components[I] as TDBMemo).Visible then
            begin
              if (ipFormFocus.Components[I] as TDBMemo).DataSource = ipDataSource then
                if vaContinuar then
                  begin
                    (ipFormFocus.Components[I] as TDBMemo).SetFocus;
                    vaContinuar := false;
                  end;
            end
        end;
    end;
end;

function Gera_SenhaPMedico(NSerie, DLicen: String): String;
// -NSer = N� de Serie do Sistema
// -DLicen = Data do Venc. da Licenca no Formato DD/MM/AAAA
var
  NAnos, NSer1, NSer2, NSer3, NSer4: Integer;
  NCons: Array [1 .. 12] of Integer;
begin
  // --
  NAnos := StrToInt(Copy(DLicen, 4, 2) + Copy(DLicen, 9, 2));
  // --
  NCons[01] := 1234 + NAnos;
  NCons[02] := 1869 + NAnos;
  NCons[03] := 2652 + NAnos;
  NCons[04] := 3987 + NAnos;
  NCons[05] := 4632 + NAnos;
  NCons[06] := 5720 + NAnos;
  NCons[07] := 6862 + NAnos;
  NCons[08] := 7638 + NAnos;
  NCons[09] := 8109 + NAnos;
  NCons[10] := 9026 + NAnos;
  NCons[11] := 9398 + NAnos;
  NCons[12] := 9827 + NAnos;
  // --
  NSer1 := StrToInt(Copy(NSerie, 01, 3));
  NSer2 := StrToInt(Copy(NSerie, 04, 3));
  NSer3 := StrToInt(Copy(NSerie, 07, 3));
  NSer4 := StrToInt(Copy(NSerie, 10, 1));
  // --
  NSer1 := NSer1 * NCons[StrToInt(Copy(DLicen, 4, 2))];
  NSer2 := NSer2 * NCons[StrToInt(Copy(DLicen, 4, 2))];
  NSer3 := NSer3 * NCons[StrToInt(Copy(DLicen, 4, 2))];
  NSer4 := NSer4 * NCons[StrToInt(Copy(DLicen, 4, 2))];
  // --
  Result := IntToStr(NSer1) + '.' + IntToStr(NSer2) + '.' + IntToStr(NSer3) + '.' + IntToStr(NSer4);
end;

function SenhaDiaria: String; // Retorna a senha di�ria
var
  VSenha, Data_Base: String;
  TDia_Semana: Array [1 .. 7, 1 .. 7] of Integer;
  VSubtra: Integer;
begin
  TDia_Semana[1, 1] := 7;
  TDia_Semana[2, 1] := 7;
  TDia_Semana[3, 1] := 5;
  TDia_Semana[4, 1] := 6;
  TDia_Semana[5, 1] := 6;
  TDia_Semana[6, 1] := 5;
  TDia_Semana[7, 1] := 6;

  TDia_Semana[1, 2] := 7;
  TDia_Semana[2, 2] := 6;
  TDia_Semana[3, 2] := 5;
  TDia_Semana[4, 2] := 4;
  TDia_Semana[5, 2] := 3;
  TDia_Semana[6, 2] := 2;
  TDia_Semana[7, 2] := 1;

  VSubtra := TDia_Semana[DayOfWeek(Date), 2];

  Data_Base := Copy(DateToStr(Date - VSubtra), 4, 2) + Copy(DateToStr(Date - VSubtra), 7, 4) + Copy(DateToStr(Date - VSubtra), 1, 2);
  VSenha := IntToStr((StrToInt(Data_Base) * DayOfWeek(Date)) + TDia_Semana[DayOfWeek(Date), 1]);

  Result := VSenha;
end;

function IntToStrZeroFinal(Valor, Tamanho: Integer): String;
var
  VFinal: String;
begin
  VFinal := IntToStr(Valor);
  While length(VFinal) < Tamanho do
    VFinal := VFinal + '0';
  Result := VFinal;
end;

// mantido apenas por compatibilidade com o promedico
function IntToStrZero(Tipo: String; Valor, Tamanho: Integer): String;
var
  VFinal: String;
begin
  VFinal := IntToStr(Valor);
  While length(VFinal) < Tamanho do
    VFinal := Tipo + VFinal;
  Result := VFinal;
end;

function PontoToVirgulaComDecimais(ipValor: String): Double;
var
  I: Integer;
  vaValor: string;
  vaAchou: Boolean;
begin
  vaAchou := false;
  ipValor := StringReplace(ipValor, '.', ',', [rfReplaceAll]);
  for I := length(ipValor) downto 1 do
    begin
      if (vaAchou = false) then
        begin
          if (ipValor[I] = ',') then
            vaAchou := True;
          vaValor := vaValor + ipValor[I];
        end
      else if ((vaAchou) and (ipValor[I] <> ',')) then
        vaValor := vaValor + ipValor[I];
    end;
  vaValor := ReverseString(vaValor);
  Result := StrToFloatDef(vaValor, 0)
end;

// joga zero e retorna string
function IntToStrZero(Valor, Tamanho: Integer): String; overload;
var
  VFinal: String;
begin
  VFinal := IntToStr(Valor);
  While length(VFinal) < Tamanho do
    VFinal := '0' + VFinal;
  Result := VFinal;
end;

// fun��o que recebe um valor boolean e retorna 0 ou 1, 0 = False e 1 = True;
function BooleanToStr(ipBoolean: Boolean): String;
begin
  if ipBoolean then
    Result := '1'
  else
    Result := '0';
end;

// Essa procedure ir� receber uma data e hora e ir� incrementar um segundo;
procedure DataHoraInc(ipData: TDate; ipHora: TTime; var opDataHora: TDateTime);
var
  H, M, S: Integer;
begin
  H := StrToInt(Copy(TimeToStr(ipHora), 1, 2));
  M := StrToInt(Copy(TimeToStr(ipHora), 4, 2));
  S := StrToInt(Copy(TimeToStr(ipHora), 7, 2));

  S := S + 1;

  if S >= 60 then
    begin
      S := 0;
      M := M + 1;
    end;

  if M >= 60 then
    begin
      M := 0;
      H := H + 1;
    end;

  if H >= 24 then
    begin
      H := 0;
      ipData := ipData + 1;
    end;

  ipHora := StrToTime(IntToStr(H) + ':' + IntToStr(M) + ':' + IntToStr(S));

  opDataHora := StrToDateTime(DateToStr(ipData) + ' ' + TimeToStr(ipHora));

end;

function Verifica_Email(ipForm: TForm; ipEmail, ipCampo: string; ipMostrarMensagem: Boolean = True): String;
var
  vaMatch: TMatch;
begin
  vaMatch := TRegex.Match(ipEmail, '^([0-9a-zA-Z][-\._0-9a-zA-Z]*@' + '([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$');
  if not vaMatch.Success then
    begin
      Result := 'Formato de E-mail n�o aceit�vel!!' + sLineBreak + 'Ele deve estar no padr�o: usuario@email.com';
      if ipMostrarMensagem then
        MessageTela(false, 1, Result, 0);

      if ipCampo <> '' then
        SetFocus_Campo(ipForm, ipCampo);
    end
  else
    Result := '';
end;

function MaskCpf_Cnpj(Texto: String): String; // By eliomar fun��o para colocar os pontos do cpf ou do cnpj
begin
  Texto := SoNumeros(Texto);
  if Texto <> '' then
    begin
      if length(Texto) <= 11 then
        begin
          Texto := Preenchimento(Texto, '0', 14, 2); // cpf
          Texto := Copy(Texto, 1, 3) + '.' + Copy(Texto, 4, 3) + '.' + Copy(Texto, 7, 3) + '-' + Copy(Texto, 10, 2)
        end
      else
        begin
          Texto := Preenchimento(Texto, '0', 18, 2); // cnpj;
          Texto := Copy(Texto, 1, 2) + '.' + Copy(Texto, 3, 3) + '.' + Copy(Texto, 6, 3) + '/' + Copy(Texto, 9, 4) + '-' + Copy(Texto, 13, 2);
        end;
    end;
  Exit(Texto);
end;

function VerificaCPF_CNPJ(ipForm: TForm; ipDoc, ipCampo: String): Boolean;
/// /////////////////////////////////////////////////////////////////////////////
// Esta fun��o ir� receber uma string e testar se � um CPF valido ou um CNPJ  //
/// /////////////////////////////////////////////////////////////////////////////
var
  MyDoc: TTestaCPF_CNPJ;
begin
  MyDoc := TTestaCPF_CNPJ.Create(ipForm);
  ipDoc := SoNumeros(ipDoc);
  if length(ipDoc) <= 11 then // quer dizer que � um cpf
    MyDoc.Mode := moCPF
  else
    MyDoc.Mode := moCNPJ;

  MyDoc.Input := ipDoc;
  Result := MyDoc.Result;
  ipDoc := MaskCpf_Cnpj(ipDoc);
  if ((Result = false) and ((AnsiCompareText(ipCampo, 'SemMessageTela') <> 0))) then
    begin
      if MyDoc.Mode = moCPF then
        MessageTela(false, 1, 'CPF ' + ipDoc + ' inv�lido.', 0)
      else
        MessageTela(false, 1, 'CNPJ ' + ipDoc + ' inv�lido.', 0);
      if ipCampo <> '' then
        SetFocus_Campo(ipForm, ipCampo);
    end;
  MyDoc.free;
end;

function Arq_Md5(const fileName: string): string;
var
  idmd5: TIdHashMessageDigest5;
  fs: TFileStream;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  fs := TFileStream.Create(fileName, fmOpenRead);
  try
    Result := idmd5.HashStreamAsHex(fs);
  finally
    fs.free;
    idmd5.free;
  end;
end;

function MD5_Stream(ipStream: TMemoryStream): string;
var
  idmd5: TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  ipStream.Seek(0, 0);
  try
    Result := idmd5.HashStreamAsHex(ipStream);
  finally
    idmd5.free;
  end;
end;

function MD5_String(ipString: string): string;
var
  idmd5: TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    Result := idmd5.HashStringAsHex(ipString, IdGlobal.IndyTextEncoding(encUTF8));
  finally
    idmd5.free;
  end;
end;

function LerIni(arquivo_endereco, arquivo_nome, tabela_ini, campo_ini: String): String; overload;
var
  ServerIni: TIniFile;
begin
  ServerIni := TIniFile.Create(arquivo_endereco + arquivo_nome);
  Result := ServerIni.ReadString(tabela_ini, campo_ini, '');
  ServerIni.free;
end;

procedure GravarIni(arquivo_endereco, arquivo_nome, tabela_ini, campo_ini, valor_ini: String);
var
  ServerIni: TIniFile;
begin
  ServerIni := TIniFile.Create(arquivo_endereco + arquivo_nome);
  ServerIni.WriteString(tabela_ini, campo_ini, valor_ini);
  // ServerIni.UpdateFile;
  ServerIni.free;
end;

function DownloadFile(Source, Dest: string): Boolean; // Esta fun��o baixa o arquivo da net e salva na pasta no computador
begin
  try
    Result := UrlDownloadToFile(nil, PChar(Source), PChar(Dest), 0, nil) = 0;
  except
    Result := false;
  end;
end;

function CriptoDecripto(ipCripDecrip: Integer; ipKey, ipTexto: String): String;
var
  MyCripto: TCriptografa;
begin
  try
    if ipKey = '' then
      begin
        MessageTela(false, 1, 'N�o foi passado a Chave para Criptografar ou Descriptografar.', 0);
        Exit('');
      end;

    MyCripto := TCriptografa.Create(nil);
    // retirado validacao por causa do promedico, estava usando chave padrao em muitos lugares
    // if ipKey = MyCripto.Key then
    // begin
    // MessageTela(False, 1, 'Favor informar Chave diferente de Chave padr�o.', 0);
    // Exit('');
    // end;
    MyCripto.Key := ipKey;
    case ipCripDecrip of
      0:
        Exit(MyCripto.TextToCriptoHex(ipTexto)); // iremos criptografar a string;
      1:
        Exit(MyCripto.CriptoHexToText(ipTexto)); // iremos descriptografar a string;
    end;
  finally
    FreeAndNil(MyCripto);
  end;
end;

procedure Atualizar(ipForm: TForm; ipEnderecoHttp, ipDiretorio, ipArquivoWeb, ipArquivoOriginal, ipNomeSoftware, ipExecutar, ipPaginaComercial: String);
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  vaArquivoAtualizador: string;
begin
  // NAO UTILIZADO MAIS
end;

function DiferencaTempo(ipDataHoraInicial, ipDatahoraFinal: TDateTime): String;
begin
  Result := IntToStr(Trunc(ipDatahoraFinal - ipDataHoraInicial)) + ' dias e ' + Copy(DateTimeToStr((ipDatahoraFinal - ipDataHoraInicial)), 12, 8);
end;

procedure Load_Img(var ip_img: TImage; ip_imgbd: TBlobField); // funcao que carrega uma img de 1 bd para 1 timage by junior
var
  stream: TMemoryStream;
  jpg: TJPEGImage;
begin
  jpg := nil;
  stream := nil;
  stream := TMemoryStream.Create;
  TBlobField(ip_imgbd).SaveToStream(stream);
  jpg := TJPEGImage.Create;
  stream.position := 0;
  jpg.LoadFromStream(stream);
  ip_img.Picture.Assign(jpg);
End;

function SoNumeros(ipTexto: String): String; overload;
/// pega uma string e retorna somente os n�meros contidos na string
var
  I: Integer;
begin
  Result := '';
  for I := 1 to length(ipTexto) do
    if (CharInSet(ipTexto[I], ['0' .. '9'])) then
      Result := Result + ipTexto[I];
end;

function SoNumeros(ipTexto, ipDefault: String): String; overload;
/// /////////////////////////////////////////////////////////////////////////////
/// by Eliomar fun��o para pegar a string e deixar somente numeros, se n�o encontrar
/// nada retornar o texto ipDefault;
/// /////////////////////////////////////////////////////////////////////////////
var // by eliomar
  I: Integer;
begin
  Result := '';
  for I := 1 to length(ipTexto) do
    if (CharInSet(ipTexto[I], ['0' .. '9'])) then
      Result := Result + ipTexto[I];
  if ((Result = '') and (ipDefault <> '')) then
    Result := ipDefault;
end;

function SoLetras(ipTexto: string): string;
var
  I: Integer;
begin
  Result := '';
  if Trim(ipTexto) <> '' then
    begin
      for I := 0 to length(ipTexto) do
        if (CharInSet(ipTexto[I], ['a' .. 'z', 'A' .. 'Z'])) then
          Result := Result + ipTexto[I];
    end;
end;

function SoLetrasNumeros(ipTexto: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to length(ipTexto) do
    if (CharInSet(ipTexto[I], ['0' .. '9', 'a' .. 'z', 'A' .. 'Z'])) then
      Result := Result + ipTexto[I];

end;

function Preenchimento(ipTexto: String; ipCaractere: Char; ipTamanho, ipPosicaoPreenchimento: Integer): String; overload;
/// /////////////////////////////////////////////////////////////////////////////
/// ipTexto: Texto que ser� preenchido;
/// ipCaractere: o caractere que ser� utilizado para fazer o preenchdimento;
/// iptamanho: � a quantidade que a fun��o ir� retornar, podendo at� cortar a
/// string, quando o ipTexto for maior que o tamanho de retorno;
/// ipPosicaoPreenchimento: mas onde ser� feito o preenchimento na String
/// 0 - Esquerda | 1 - Centro | 2 - Direita
/// /////////////////////////////////////////////////////////////////////////////
begin
  ipTexto := Copy(ipTexto, 1, ipTamanho);
  case ipPosicaoPreenchimento of
    0:
      Preenchimento := StringOfChar(ipCaractere, ipTamanho - length(ipTexto)) + ipTexto;
    1:
      Preenchimento := StringOfChar(' ', Trunc((ipTamanho - length(ipTexto)) / 2)) + ipTexto;
    2:
      Preenchimento := ipTexto + StringOfChar(ipCaractere, ipTamanho - length(ipTexto));
  end;
end;

function Preenchimento(ipTexto: String; ipText: Char; ipTamanho: Integer; ipAdireita: Boolean): String; overload;
begin
  ipTexto := Copy(ipTexto, 1, ipTamanho);
  if ipAdireita = True then
    Preenchimento := ipTexto + StringOfChar(ipText, ipTamanho - length(ipTexto))
  else
    Preenchimento := StringOfChar(ipText, ipTamanho - length(ipTexto)) + ipTexto;
end;

procedure GravaLog(const ipDiretorio, ipMensagem: String);
var
  F: TextFile;
begin
  if not DirectoryExists(ExtractFileDir(ipDiretorio)) then
    if not CreateDir(ipDiretorio) then
      Exit;
  try
    AssignFile(F, ipDiretorio + 'Log' + Copy(DateToStr(Date), 7, 4) + Copy(DateToStr(Date), 4, 2) + Copy(DateToStr(Date), 1, 2) + '.log');
    if not FileExists(ipDiretorio + 'Log' + Copy(DateToStr(Date), 7, 4) + Copy(DateToStr(Date), 4, 2) + Copy(DateToStr(Date), 1, 2) + '.log') then
      ReWrite(F)
    else
      Append(F);
    Writeln(F, '==> Hora: ' + TimeToStr(Time) + ' ERRO: ' + ipMensagem);
    Writeln(F, Preenchimento('-', '-', 48, 0));
    CloseFile(F);
  except
    on E: Exception do
      begin
        CloseFile(F);
        MessageTela(false, 1, 'Problemas para fazer cria��o do arquivo de log na pasta: ' + ipDiretorio + #13 + E.Message, 5);
        Exit;
      end;
  end;
end;

function MessageTela(const ipGravarLog: Boolean; ipQtde_Btn: Integer; const ipMensagem: String; const ipTempoSegundos, ipTempoMilesegundos: Integer; const ipHeight: Integer = 240; const ipWidth: Integer = 480): Integer; overload;
// fun��o ir� chamar uma tela para que o usuario possa escolher N�o, Sim ou Cancelar/OK: sendo N�o = 0, Sim = 1 Cancelar / OK = 2;
var
  vaMsg: TAdvSmoothMessageDialog;
  vaMsgTela: TfrmMessageTela;
  vaTamanhoIcone: Integer;
begin
  if ipQtde_Btn > 3 then
    ipQtde_Btn := 3
  else if ipQtde_Btn < 1 then
    ipQtde_Btn := 1;

  if ipGravarLog then
    GravaLog(coEndConfig + 'Error\', ipMensagem);

  vaTamanhoIcone := 38;
  vaMsgTela := TfrmMessageTela.Create(Nil);
  vaMsg := TAdvSmoothMessageDialog.Create(vaMsgTela);
  try
    vaMsg.Caption := sLineBreak;
    vaMsg.HTMLText.Text := StringReplace(ipMensagem, coRemoteError, 'RE', [rfReplaceAll, rfIgnoreCase]);
    vaMsg.position := poMainFormCenter;
    vaMsg.CaptionFill.BackGroundPicturePosition := ppTopLeft;
    vaMsg.DefaultButton := -1;
    vaMsg.position := poMainFormCenter;
    vaMsg.EnableKeyEvents := false;
    // TODO FAZER 1 FUNCAO PARA ADICIOANR OS BOTOES
    // adicionando os botoes, esta funcao do messagetela aceita apenas 1, 2 ou 3 botoes
    if ipQtde_Btn = 1 then
      begin
        with vaMsg.Buttons.Add do
          Begin
            Caption := '&OK';
            Picture.Assign(vaMsgTela.imgOKSIM.Picture);
            ButtonResult := 3;
          End;

        vaMsg.CaptionFill.Picture.Assign(vaMsgTela.imgCuidado.Picture);
      end
    else if ipQtde_Btn = 2 then
      begin
        with vaMsg.Buttons.Add do
          Begin
            Caption := '&Sim';
            Picture.Assign(vaMsgTela.imgOKSIM.Picture);
            ButtonResult := 2;
          End;
        with vaMsg.Buttons.Add do
          Begin
            Caption := '&N�o';
            Picture.Assign(vaMsgTela.imgNAO.Picture);
            ButtonResult := 1;
          End;
        vaMsg.CaptionFill.Picture.Assign(vaMsgTela.imgInterrogacao.Picture);

      end
    else if ipQtde_Btn = 3 then
      Begin
        with vaMsg.Buttons.Add do
          Begin
            Caption := '&Sim';
            Picture.Assign(vaMsgTela.imgOKSIM.Picture);
            ButtonResult := 2;
          End;
        with vaMsg.Buttons.Add do
          Begin
            Caption := '&Retornar';
            Picture.Assign(vaMsgTela.ImgRetornar.Picture);
            ButtonResult := 3;
          End;
        with vaMsg.Buttons.Add do
          Begin
            Caption := '&N�o';
            Picture.Assign(vaMsgTela.imgNAO.Picture);
            ButtonResult := 1;
          End;
        vaMsg.CaptionFill.Picture.Assign(vaMsgTela.imgInterrogacao.Picture);

      End;
    vaMsg.Caption := sLineBreak;
    vaMsg.SetComponentStyle(tsOffice2010Silver);
    vaMsg.Fill.Opacity := 255;
    vaMsg.Fill.OpacityTo := 255;
    vaMsg.Fill.OpacityMirror := 255;
    vaMsg.Fill.OpacityMirrorTo := 255;
    vaMsg.CaptionFill.PictureSize := psCustom;
    vaMsg.CaptionFill.PictureWidth := vaTamanhoIcone;
    vaMsg.CaptionFill.PictureHeight := vaTamanhoIcone;
    vaMsg.CaptionFill.PicturePosition := ppTopLeft;
    vaMsg.CaptionFill.PictureAspectRatio := True;
    vaMsg.CaptionFill.PictureAspectMode := pmStretch;

    if (ipTempoSegundos > 0) or (ipTempoMilesegundos > 0) then
      Begin
        vaMsg.ProgressVisible := True;
        vaMsg.ProgressMaximum := (ipTempoSegundos) + (ipTempoMilesegundos / 1000);
        vaMsgTela.puMsg := vaMsg;
        vaMsgTela.TimerFechar.Enabled := True;
      End
    else
      vaMsg.timeout := 15000;

    try
      // se NAO foi passado explicitamente o tempo para fechar, Vou fechar e abrir novamente(isso � pra tentar evitar o problema da janela ficar no fundo e o usuario nao ver)
      if (ipTempoSegundos = 0) and (ipTempoMilesegundos = 0) then
        begin
          repeat
            Result := vaMsg.ExecuteDialog - 1;
          until (Result <> 7);
        end
      else
        Result := vaMsg.ExecuteDialog - 1;
    except
      on E: Exception do
        Result := 0;
    end;
    // infelizmente por questao de compatibilidade precisamos usar o executedilaog-1
    // se setarmos o buttonresult para o valor devidido o nao ficara como 0 e o 0 � brNone dessa forma o delphi
    // nao ira fazer nada quando apertar o botao
  finally
    Begin
      FreeAndNil(vaMsgTela);
    End;
  end;
end;

function MessageTela(const ipGravarLog: Boolean; ipQtde_Btn: Integer; const ipMensagem: String; const ipTempoSegundos: Integer): Integer; overload;
begin
  Result := MessageTela(ipGravarLog, ipQtde_Btn, ipMensagem, ipTempoSegundos, 0);
end;

function MessageTela(const ipMensagem: String): Integer; overload;
begin
  // Result := MessageTela(False, 1, ipMensagem, 0);
  TfrmMessageTela.ppuMsg(ipMensagem);
  // ATEN�AO: Para manter a compatibilidade vou retornar o mesmo que a funcao antiga retornava. Teoricamente nao importa o que � retornado,
  // pois se essa funcao foi chamada signfica que apenas uma opcao (Ok) ser� possivel, e portanto quem chamou nem deveria testar seu retorno, porem
  // nao tenho como ter certeza, portanto vou fazer ela continuar a retornar o que era retornado
  Result := 2; // 2 = Ok
end;

procedure SetFocus_Campo(ipFormFocus: TForm; ipCampo: String);
var
  I: Integer;
begin
  ipCampo := UpperCase(ipCampo);
  for I := 0 to (ipFormFocus.ComponentCount - 1) do
    begin
      if (ipFormFocus.Components[I] is TDBEdit) then
        begin
          if (((ipFormFocus.Components[I] as TDBEdit).DataField = ipCampo) and ((ipFormFocus.Components[I] as TDBEdit).Visible) and ((ipFormFocus.Components[I] as TDBEdit).Enabled)) then
            begin
              (ipFormFocus.Components[I] as TDBEdit).SetFocus;
              // Abort;
              Exit;
            end
        end
      else if (ipFormFocus.Components[I] is TDBCheckBox) then
        begin
          if (((ipFormFocus.Components[I] as TDBCheckBox).DataField = ipCampo) and ((ipFormFocus.Components[I] as TDBCheckBox).Visible) and ((ipFormFocus.Components[I] as TDBCheckBox).Enabled)) then
            begin
              (ipFormFocus.Components[I] as TDBCheckBox).SetFocus;
              // Abort;
              Exit;
            end
        end
      else if (ipFormFocus.Components[I] is TDBMemo) then
        begin
          if (((ipFormFocus.Components[I] as TDBMemo).DataField = ipCampo) and ((ipFormFocus.Components[I] as TDBMemo).Visible) and ((ipFormFocus.Components[I] as TDBMemo).Enabled)) then
            begin
              (ipFormFocus.Components[I] as TDBMemo).SetFocus;
              // Abort;
              Exit;
            end
        end;
    end;
end;

function Campos_Requeridos(ipForm: TForm; ipDataSet: TDataSet): String;
var
  vaField: TField;
begin
  Result := '';
  vaField := Campos_Requeridos(ipDataSet);
  if Assigned(vaField) then
    begin
      Result := vaField.FieldName;
      MessageTela(false, 1, 'Campo: ' + vaField.DisplayName + ', n�o foi preenchido.', 0);
      SetFocus_Campo(ipForm, Result);
      Exit;
    end;
end;

function Campos_Requeridos(ipDataSet: TDataSet): TField;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to (ipDataSet as TClientDataSet).fieldcount - 1 do
    begin
      if (((ipDataSet as TClientDataSet).Fields[I].FieldKind = fkData) and ((ipDataSet as TClientDataSet).Fields[I].Required) and (((ipDataSet as TClientDataSet).Fields[I].IsNull) or ((ipDataSet as TClientDataSet).Fields[I].AsString = ''))) then
        begin
          Result := (ipDataSet as TClientDataSet).Fields[I];
          break;
        end;
    end;
end;

procedure Tab_To_Enter(Sender: TWinControl; var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0;
      SendMessage(Sender.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
end;

// Fun��o para pegar um valor double e passa para string substituindo a virgula pelo ponto
function VirgulaToPonto(Valor: Double): String; Overload;
var
  ValorTexto: String;
begin
  try
    ValorTexto := FormatFloat('########0.000', Valor);
    VirgulaToPonto := Copy(ValorTexto, 1, length(ValorTexto) - 4) + '.' + Copy(ValorTexto, length(ValorTexto) - 2, 3);
  except
    begin
      MessageTela('Valor Inv�lido.');
      VirgulaToPonto := '';
    end;
  end;
end;

function VirgulaToPonto(Valor: Real; Casas_Decimais: Integer): String; Overload;
var
  ValorTexto: String;
begin
  try
    case Casas_Decimais of
      1:
        ValorTexto := FormatFloat('########0.0', Valor);
      2:
        ValorTexto := FormatFloat('########0.00', Valor);
      3:
        ValorTexto := FormatFloat('########0.000', Valor);
      4:
        ValorTexto := FormatFloat('########0.0000', Valor);
      5:
        ValorTexto := FormatFloat('########0.00000', Valor);
      6:
        ValorTexto := FormatFloat('########0.000000', Valor);
      7:
        ValorTexto := FormatFloat('########0.0000000', Valor);
      8:
        ValorTexto := FormatFloat('########0.00000000', Valor);
      9:
        ValorTexto := FormatFloat('########0.000000000', Valor);
    end;
    VirgulaToPonto := StringReplace(ValorTexto, ',', '.', [rfReplaceAll]);
  except
    begin
      MessageTela('Valor Inv�lido.');
      VirgulaToPonto := '';
    end;
  end;
end;

procedure alterarVisibilidade(ipComponentes: Array of TWinControl; ipFlag: Boolean);
var
  vaComp: TWinControl;
begin
  for vaComp in ipComponentes do
    vaComp.Visible := ipFlag;
end;

function fpuStrToDate(ipData: string): TDateTime;
var
  vaDiaMesAno: TArray<string>;
begin
  vaDiaMesAno := TRegex.Split(ipData, '/');
  if (length(vaDiaMesAno) < 2) or (length(vaDiaMesAno) > 3) then
    raise Exception.Create('Data em formato inv�lido.');

  if length(vaDiaMesAno) = 2 then // nao informou o dia
    begin
      // coloco um dia qualquer somente para nao dar erro no StrToDate
      ipData := '01/' + ipData;
      // converto a string para uma Data
      Result := StrToDate(ipData);
      // pego o ultimo dia desse mes
      Result := EndOfTheMonth(Result);
    end
  else // informou o dia
    begin
      // converto a string para uma Data
      Result := StrToDate(ipData);
    end;

  // coloco a hora zero
  Result := StrToDateTime(DateToStr(Result) + ' 00:00:00');
end;

procedure ppuAlterarEditValue(ipComponente: TcxCustomEdit; ipValue: Variant);
begin
  ipComponente.LockChangeEvents(True);
  try
    ipComponente.EditValue := ipValue;
    ipComponente.PostEditValue;
  finally
    ipComponente.LockChangeEvents(false, false);
  end;
end;

procedure HabilitarDesabilitarControls(ipFlag, ipPropriedadeVisible: Boolean; ipControls: array of TControl);
var
  I: Integer;
begin
  if ipPropriedadeVisible then
    begin
      for I := low(ipControls) to high(ipControls) do
        ipControls[I].Visible := ipFlag;;
    end
  else
    begin
      for I := low(ipControls) to high(ipControls) do
        ipControls[I].Enabled := ipFlag;;
    end;
end;

function TruncTo(ipValor: Double; ipCasasDecimais: Integer): Double;
var
  vaAux: string;
  vaQuantCasas: string;
begin
  try
    vaQuantCasas := IntToStr(ipCasasDecimais);
    vaAux := FloatToStr(ipValor);
    // considerando somente a quant de casas decimais informada
    vaAux := TRegex.Replace(vaAux, '(?<=,\d{' + vaQuantCasas + ',' + vaQuantCasas + '})\d*', '');
    Result := StrToFloat(vaAux);
  except
    on E: Exception do
      raise Exception.Create('N�o foi poss�vel truncar o valor especificado.' + sLineBreak + 'Detalhes: ' + E.Message);
  end;
end;

procedure VerificarReferenciaCircular(ipDic: TDictionary<String, String>);
var
  vaKey: string;
  vaKeyStart: string;

  procedure verificar(ipKey, ipFormula: string);
  var
    vaMatches: TMatchCollection;
    vaMatch: TMatch;
  begin
    if vaKeyStart = '' then
      vaKeyStart := vaKey
    else if ipKey = vaKeyStart then
      raise Exception.Create(ipKey);

    // pegando as referencias dentro dos colchetes
    vaMatches := TRegex.Matches(ipFormula, '(?<=\[).+?(?=\])');
    for vaMatch in vaMatches do
      begin
        try
          if ipDic.ContainsKey(vaMatch.Value) then
            verificar(vaMatch.Value, ipDic.Items[vaMatch.Value]);
        except
          on E: Exception do
            begin
              raise Exception.Create(ipKey + '->' + E.Message);
            end;
        end;
      end;
  end;

begin

  try
    for vaKey in ipDic.Keys do
      begin
        vaKeyStart := '';
        verificar(vaKey, ipDic.Items[vaKey]);
      end;
  except
    on E: Exception do
      raise Exception.Create('Refer�ncia circular: ' + E.Message);
  end;
end;

function FileTimeToDTime(FTime: TFileTime): TDateTime;
var
  LocalFTime: TFileTime;
  STime: TSystemTime;
begin
  FileTimeToLocalFileTime(FTime, LocalFTime);
  FileTimeToSystemTime(LocalFTime, STime);
  Result := SystemTimeToDateTime(STime);
end;

function BuscarArquivoRecente(ipEndArq: string; ipDias: Integer = 7; ipExtensao: string = '.xml'; ipInicioNome: string = 'log_'): string;
var
  vaDataCri, vaDataIncrementada: TDateTime;
  vaDataLogRecente: TDateTime;
  vaSR: TSearchRec;
  vaArq: String;
begin
  vaDataLogRecente := IncYear(now, -10); // volta dez anos
  // arq := EndArqsLog + 'log_' + FormatDateTime('dd.mm.yyyy', now) + '.xml';
  vaArq := ipEndArq + ipInicioNome + '*' + ipExtensao;
  // pego o log mais recente
  if (FindFirst(vaArq, faAnyFile, vaSR) = 0) then
    begin
      repeat
        vaDataCri := FileTimeToDTime(vaSR.FindData.ftCreationTime);
        if vaDataCri > vaDataLogRecente then
          vaDataLogRecente := vaDataCri;
      until FindNext(vaSR) <> 0;
      SysUtils.FindClose(vaSR);
    end;

  vaDataIncrementada := IncDay(vaDataLogRecente, ipDias); // incremento a quantidade de ipDias (padrao uma semana)
  if not(vaDataIncrementada < now) then // se NAO for menor � pq nao passou a quantidade de ipDias, entao retorno o endere�o completo deste arquivo
    Result := ipEndArq + ipInicioNome + FormatDateTime('dd.mm.yyyy', vaDataLogRecente) + '.xml'
  else
    Result := '';

end;

function VerificarFaixaIdade(ipTipoAge, ipTipoAgePac: string; ipAge1, ipAge2, ipAgePac: Integer): Boolean;
begin
  Result := false;
  if ipTipoAge = 'ANOS' then // a idade da referencia est� em anos
    begin
      if ipTipoAgePac = 'ANOS' then // a idade do paciente est� em anos
        begin
          if (ipAgePac >= ipAge1) and (ipAgePac <= ipAge2) then // a idade do paciente est� dentro da idade da referencia
            Result := True;
        end
      else // a idade do paciente esta em MESES OU DIAS
        begin
          if ipAge1 = 0 then // a idade inicial da referencia � 0
            Result := True;
        end
    end
  else if ipTipoAge = 'MESES' then // a idade da referencia est� em meses
    begin
      if ipTipoAgePac = 'MESES' then // a idade do paciente est� em meses
        begin
          if (ipAgePac >= ipAge1) and (ipAgePac <= ipAge2) then // a idade do paciente est� dentro da idade da referencia
            Result := True;
        end
      else // a idade do paciente esta em ANOS OU DIAS
        begin
          if (ipTipoAgePac = 'DIAS') and (ipAge1 = 0) then // a idade do paciente esta em dias e a idade inicial da referencia � 0
            Result := True;
        end
    end
  else if ipTipoAge = 'DIAS' then // a idade da referencia est� em dias
    begin
      if ipTipoAgePac = 'DIAS' then // a idade do paciente est� em dias
        begin
          if (ipAgePac >= ipAge1) and (ipAgePac <= ipAge2) then
            // a idade do paciente est� dentro da idade da referencia
            Result := True;
        end;
    end;
end;

function HoraParaSegundos(ipHora: TTime): Integer;
var
  vaHora, vaMinuto, vaSegundo, vaMilisegundo: Word;
begin
  DecodeTime(ipHora, vaHora, vaMinuto, vaSegundo, vaMilisegundo);
  Result := vaSegundo + (vaMinuto * 60) + ((vaHora * 60) * 60);
end;

procedure TocarBeep(ipFrequencia, ipDuracao: Cardinal);
begin
  // habilita o beep do windows(no create do pprincipal ele � desabilitado)
  SystemParametersInfo(SPI_SETBEEP, 1, nil, SPIF_SENDWININICHANGE);
  try
    beep(ipFrequencia, ipDuracao);
  finally
    // desabilita o beep do windows
    SystemParametersInfo(SPI_SETBEEP, 0, nil, SPIF_SENDWININICHANGE);
  end;
end;

function RetornaTeclaString(ipTecla: Word): string;
begin
  if ipTecla = VK_BACK then
    Result := 'BACKSPACE'
  else if ipTecla = VK_TAB then
    Result := 'TAB'
  else if ipTecla = VK_SHIFT then
    Result := 'SHIFT'
  else if ipTecla = VK_RSHIFT then
    Result := 'SHIFT DIR.'
  else if ipTecla = VK_LSHIFT then
    Result := 'SHIFT ESQ.'
  else if ipTecla = VK_CONTROL then
    Result := 'CTRL'
  else if ipTecla = VK_RCONTROL then
    Result := 'CTRL DIR.'
  else if ipTecla = VK_LCONTROL then
    Result := 'CTRL ESQ.'
  else if ipTecla = VK_MENU then
    Result := 'MENU'
  else if ipTecla = VK_PAUSE then
    Result := 'PAUSE'
  else if ipTecla = VK_CAPITAL then
    Result := 'CAPS LOCK'
  else if ipTecla = VK_ESCAPE then
    Result := 'ESC'
  else if ipTecla = VK_SPACE then
    Result := 'ESPA�O'
  else if ipTecla = VK_PRIOR then
    Result := 'PAGE UP'
  else if ipTecla = VK_NEXT then
    Result := 'PAGE DOWN'
  else if ipTecla = VK_END then
    Result := 'END'
  else if ipTecla = VK_HOME then
    Result := 'HOME'
  else if ipTecla = VK_LEFT then
    Result := 'ESQUERDA'
  else if ipTecla = VK_RIGHT then
    Result := 'DIREITA'
  else if ipTecla = VK_UP then
    Result := 'CIMA'
  else if ipTecla = VK_DOWN then
    Result := 'BAIXO'
  else if ipTecla = VK_SNAPSHOT then
    Result := 'PRT SCN'
  else if ipTecla = VK_INSERT then
    Result := 'INSERT'
  else if ipTecla = VK_DELETE then
    Result := 'DELETE'
  else if ipTecla = VK_NUMPAD0 then
    Result := '0 NUM.'
  else if ipTecla = VK_NUMPAD1 then
    Result := '1 NUM.'
  else if ipTecla = VK_NUMPAD2 then
    Result := '2 NUM.'
  else if ipTecla = VK_NUMPAD3 then
    Result := '3 NUM.'
  else if ipTecla = VK_NUMPAD4 then
    Result := '4 NUM.'
  else if ipTecla = VK_NUMPAD5 then
    Result := '5 NUM.'
  else if ipTecla = VK_NUMPAD6 then
    Result := '6 NUM.'
  else if ipTecla = VK_NUMPAD7 then
    Result := '7 NUM.'
  else if ipTecla = VK_NUMPAD8 then
    Result := '8 NUM.'
  else if ipTecla = VK_NUMPAD9 then
    Result := '9 NUM.'
  else if ipTecla = VK_ADD then
    Result := '+'
  else if ipTecla = VK_SEPARATOR then
    Result := '.'
  else if ipTecla = VK_SUBTRACT then
    Result := '-'
  else if ipTecla = VK_DECIMAL then
    Result := ','
  else if ipTecla = VK_DIVIDE then
    Result := '/'
  else if ipTecla = VK_MULTIPLY then
    Result := '*'
  else if ipTecla = VK_F1 then
    Result := 'F1'
  else if ipTecla = VK_F2 then
    Result := 'F2'
  else if ipTecla = VK_F3 then
    Result := 'F3'
  else if ipTecla = VK_F4 then
    Result := 'F4'
  else if ipTecla = VK_F5 then
    Result := 'F5'
  else if ipTecla = VK_F6 then
    Result := 'F6'
  else if ipTecla = VK_F7 then
    Result := 'F7'
  else if ipTecla = VK_F8 then
    Result := 'F8'
  else if ipTecla = VK_F9 then
    Result := 'F9'
  else if ipTecla = VK_F10 then
    Result := 'F10'
  else if ipTecla = VK_F11 then
    Result := 'F11'
  else if ipTecla = VK_F12 then
    Result := 'F12'
  else if ipTecla = VK_RETURN then
    Result := 'ENTER'
  else if ipTecla = VK_NUMLOCK then
    Result := 'NUM LOCK'
  else if ipTecla = VK_SCROLL then
    Result := 'SCR LK'
  else if ipTecla = VK_LMENU then
    Result := 'MENU ESQ.'
  else if ipTecla = VK_RMENU then
    Result := 'MENU DIR.'
  else
    Result := Char(ipTecla);
end;

function fpuProcuraArquivo(aPath, fileName: string; SubDir: Boolean = True): String;
var
  FD: TWin32findData;

  function _FindDir(wPath: string; var vRes: string): Boolean;
  var
    H: THandle;
  begin
    _FindDir := false;
    H := FindFirstFile(PChar(wPath + fileName), FD);
    if H <> INVALID_HANDLE_VALUE then
      try
        repeat
          if (Copy(FD.cFileName, 1, 1) <> '.') then
            begin
              vRes := wPath + FD.cFileName;
              _FindDir := True;
              Exit;
            end;
        until not(FindNextFile(H, FD));
      finally
        Windows.FindClose(H);
      end;

    if not SubDir then
      Exit;

    H := FindFirstFile(PChar(wPath + '*.'), FD);
    if H <> INVALID_HANDLE_VALUE then
      try
        repeat
          if (FD.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) <> 0 then
            if Copy(FD.cFileName, 1, 1) <> '.' then
              begin
                if _FindDir(wPath + FD.cFileName + '\', vRes) then
                  begin
                    Result := True;
                    Exit;
                  end;
              end;
        until not(FindNextFile(H, FD));
      finally
        Windows.FindClose(H);
      end;
  end;

begin
  if not _FindDir(IncludeTrailingBackslash(aPath), Result) then
    Result := '';
end;

function VerificarQuantidadePacientesDistintos(ipCDS: TClientDataSet; ipNomeCampoNroFicha: String): Integer;
var
  vaNroFicha, vaRecNo: Integer;
  vaIndexFieldNames, vaIndexName: String;
begin
  Result := 0;
  vaNroFicha := 0;
  ipCDS.DisableControls;
  try
    vaRecNo := ipCDS.RecNo;
    vaIndexFieldNames := ipCDS.IndexFieldNames;
    vaIndexName := ipCDS.IndexName;
    ipCDS.IndexName := '';
    ipCDS.IndexFieldNames := ipNomeCampoNroFicha;
    ipCDS.First;
    while not ipCDS.Eof do
      begin
        if vaNroFicha <> ipCDS.FieldByName(ipNomeCampoNroFicha).AsInteger then
          begin
            vaNroFicha := ipCDS.FieldByName(ipNomeCampoNroFicha).AsInteger;
            inc(Result);
          end;
        ipCDS.Next;
      end;
    ipCDS.IndexFieldNames := vaIndexFieldNames;
    ipCDS.IndexName := vaIndexName;
    ipCDS.RecNo := vaRecNo;
  finally
    ipCDS.EnableControls;
  end;

end;

function E_XP: Boolean;
var
  VersionInfo: TOSVersionInfo; // pegando a versao do windows
begin
  VersionInfo.dwOSVersionInfoSize := SizeOf(VersionInfo);
  GetVersionEx(VersionInfo);
  if VersionInfo.dwMajorVersion < 6 then // XP
    Result := True
  else
    Result := false;
end;

function fpuSubtraiTempoDeUmDateTime(ipDtHr: TDateTime; ipTempo: string; ipQtdeDias: Integer = 0): TDateTime;
var
  vaLista: TStringList;
begin
  Result := IncDay(ipDtHr, -ipQtdeDias);
  vaLista := TStringList.Create;
  try
    vaLista.StrictDelimiter := True;
    vaLista.Delimiter := ':';
    vaLista.DelimitedText := ipTempo;
    Result := IncHour(Result, -StrToIntDef(vaLista[0], 0));
    Result := IncMinute(Result, -StrToIntDef(vaLista[1], 0));
    Result := IncSecond(Result, -StrToIntDef(vaLista[2], 0));
  finally
    FreeAndNil(vaLista);
  end;
end;

function fpuTrocarChavePorValorSMS(ipTexto, ipChaveValor: string): string;
var
  vaAux: TStringStream;
  vaEditor: TRichViewEdit;
  vaStyle: TRVStyle;
  vaForm: TForm;
  vaListaChaveValor: TStringList;
  I: Integer;
begin
  vaAux := TStringStream.Create;
  vaEditor := TRichViewEdit.Create(nil);
  vaStyle := TRVStyle.Create(nil);
  vaForm := TForm.Create(nil); // form criado apenas para dar parent ao vaEditor que precisa de um Parent
  vaListaChaveValor := TStringList.Create;
  try
    vaEditor.Visible := false;
    vaEditor.Parent := vaForm;
    vaEditor.Style := vaStyle;
    vaEditor.InsertTextA(ipTexto);
    vaEditor.Format;
    vaListaChaveValor.StrictDelimiter := True;
    vaListaChaveValor.Delimiter := coDelimitadorDiferente;
    vaListaChaveValor.DelimitedText := ipChaveValor;
    for I := 0 to vaListaChaveValor.Count - 1 do
      TRichUtils.ppuProcurarSubstituirMarcador(vaEditor, vaListaChaveValor.Names[I], vaListaChaveValor.Values[vaListaChaveValor.Names[I]], false, True);
    if vaEditor.SaveTextToStream('', vaAux, 0, false, True, 0) then
      begin
        vaAux.position := 0;
        Result := vaAux.ReadString(vaAux.Size);
      end;
  finally
    FreeAndNil(vaAux);
    FreeAndNil(vaEditor);
    FreeAndNil(vaStyle);
    FreeAndNil(vaForm);
    FreeAndNil(vaListaChaveValor);
  end;
end;

function fpuVerificaExisteFieldClientDataSet(ipCDS: TClientDataSet; ipField: string): Boolean;
var
  I: Integer;
begin
  Result := false;
  ipField := UpperCase(ipField);
  for I := 0 to ipCDS.fieldcount - 1 do
    if UpperCase(ipCDS.Fields.Fields[I].FieldName) = ipField then
      begin
        Result := True;
        break;
      end;
end;

function fpuFormEstaCriado(AClass: TClass): Boolean;
var
  I: Integer;
begin
  Result := false;
  for I := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[I] is AClass then
        begin
          Result := True;
          break;
        end;
    end;
end;

function ValidarCNS(ipCNS: string): Boolean;
var
  I, Soma: Integer;
begin
  if (ipCNS <> SoNumeros(ipCNS)) or (length(ipCNS) <> 15) then
    Result := false
  else
    Begin
      Soma := 0;
      for I := 1 to length(ipCNS) do
        Soma := Soma + StrToInt(ipCNS[I]) * (16 - I);
      Result := Soma mod 11 = 0;
    End;
end;

function MesNumericoToMesEscrito(ipMesNumerico: Integer): string;
begin
  case ipMesNumerico of
    1:
      Result := 'Janeiro';
    2:
      Result := 'Fevereiro';
    3:
      Result := 'Mar�o';
    4:
      Result := 'Abril';
    5:
      Result := 'Maio';
    6:
      Result := 'Junho';
    7:
      Result := 'Julho';
    8:
      Result := 'Agosto';
    9:
      Result := 'Setembro';
    10:
      Result := 'Outubro';
    11:
      Result := 'Novembro';
    12:
      Result := 'Dezembro';
  else
    Result := 'Inv�lida';
  end;
end;

end.
