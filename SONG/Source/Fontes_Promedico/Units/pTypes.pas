unit pTypes;

interface

uses
  Classes, SysUtils {$IFNDEF FIREMONKEY}, dxCore, Winapi.Messages{$ENDIF}, pmSQLConnection, Data.SqlExpr, Generics.Collections,
  aduna_ds_list;

type
  TpmConexoesPserver = record
    ConexaoPmedico, ConexaoLogPmedico: TpmADConnection;
    ConexaoPCloud: TSQLConnection;
  end;

type

  TConfirmacao = class
  private
    FCodigoConfirmacao: Integer;
    FDescricao: string;
    procedure SetCodigoConfirmacao(const Value: Integer);
    procedure SetDescricao(const Value: string);
  public
    constructor Create(ipCodigoConfirmacao: Integer);
    property CodigoConfirmacao: Integer read FCodigoConfirmacao write SetCodigoConfirmacao;
    property Descricao: string read FDescricao write SetDescricao;
  end;

  TInfoProcedimentoAlterarExcluir = class
  private
    FAlterando: Boolean;
    FConfirmacoes: TadsObjectlist<TConfirmacao>;
    FBaixaAutomatica: Boolean;
    procedure SetAlterando(const Value: Boolean);
    procedure SetBaixaAutomatica(const Value: Boolean);
    procedure SetConfirmacoes(const Value: TadsObjectlist<TConfirmacao>);
  public
    constructor Create(ipAlterando: Boolean);
    destructor Destroy; override;

    property Alterando: Boolean read FAlterando write SetAlterando;
    property BaixaAutomatica: Boolean read FBaixaAutomatica write SetBaixaAutomatica;
    property Confirmacoes: TadsObjectlist<TConfirmacao> read FConfirmacoes write SetConfirmacoes;
  end;

  TInfoExame = record
  private
    FNomePaciente: String;
    FCodigoExameProc: Integer;
    FExameUid: String;
    FNomeProcedimento: String;
    FDataExame: Tdatetime;
    procedure SetCodigoExameProc(const Value: Integer);
    procedure SetDataExame(const Value: Tdatetime);
    procedure SetExameUid(const Value: String);
    procedure SetNomePaciente(const Value: String);
    procedure SetNomeProcedimento(const Value: String);
  public
    constructor Create(ipCodigoExameProc: Integer);
    property CodigoExameProc: Integer read FCodigoExameProc write SetCodigoExameProc;
    property NomeProcedimento: String read FNomeProcedimento write SetNomeProcedimento;
    property NomePaciente: String read FNomePaciente write SetNomePaciente;
    property ExameUid: String read FExameUid write SetExameUid;
    property DataExame: Tdatetime read FDataExame write SetDataExame;

  end;

  TExamesAgenda = class
  private
    FCodigoBcExames: Integer;
    FQuantidade: Integer;
    FCodigoCategoria: Integer;
    FCodigoOficial: String;
    FQuantidadeMaxima: Integer;
    FNomeProcedimento: String;
    FQuantidadeLancada: Integer;
    procedure SetCodigoBcExames(const Value: Integer);
    procedure SetCodigoCategoria(const Value: Integer);
    procedure SetQuantidade(const Value: Integer);
    procedure SetCodigoOficial(const Value: String);
    procedure SetNomeProcedimento(const Value: String);
    procedure SetQuantidadeMaxima(const Value: Integer);
    procedure SetQuantidadeLancada(const Value: Integer);
  public
    property CodigoBcExames: Integer read FCodigoBcExames write SetCodigoBcExames;
    property CodigoCategoria: Integer read FCodigoCategoria write SetCodigoCategoria;
    property CodigoOficial:String read FCodigoOficial write SetCodigoOficial;
    property NomeProcedimento:String read FNomeProcedimento write SetNomeProcedimento;
    property QuantidadeMaxima:Integer read FQuantidadeMaxima write SetQuantidadeMaxima;
    property QuantidadeLancada:Integer read FQuantidadeLancada write SetQuantidadeLancada;

    property Quantidade: Integer read FQuantidade write SetQuantidade;
  end;

{$REGION 'Type para Adicionar Resultados na Baixa/Paciente}

  TAdicionarProcedimentoBaixa = record
    CatProc: String;
    NumProc: Integer;
    Categoria: String;
    Nome_Procedimento: String;
    Valor_Total: Real;
    Valor_Debito: Real;
    Data: TDate;
    Qtde: Real;
    Numero_Internacao: Integer;
    Codigo_Convenio: Integer;
    Codigo_Medico_Responsavel: Integer;
    Codigo_Medico_Solicitante: Integer;
    Codigo_Prestador: Integer;
    InternaTipo: Integer;

    constructor Create(ipNumProc: Integer; ipCatProc: String); // tem q ter pelo menos um parametro no create pq senao nao funciona
  end;
{$ENDREGION}
{$REGION 'Tipos dicom'}


type
  TTipoArquivoSalvarImg = class
    InstanciaUID, Imagem_No, Paciente_Nome, Paciente_Sexo, Paciente_Codigo, Series_Uid, Series_Descricao, Exame_Uid, CodigoProcedimento, Exame_Descricao, Categoria, Nome_Arquivo, Arquivo_Diretorio, Diretorio_Base, Diretorio_Img, SerieNo: String;
    Exame_Data_Hora: Tdatetime;
  public
    constructor Create;
  end;

{$ENDREGION}
{$REGION 'Tipos de Arquivos Promedico'}


  // importante: N�O ALTERAR A ORDEM DESSE TYPE
type
  TTipoArquivoPmf = (
    taAudioLaudoOgg, taAudioWaveGSM610_11025HzMono, taTestRecorder, taAnexosMensagens);

type
  TTipoCriptografia = (
    tcNenhuma);
{$IFNDEF FIREMONKEY}


type
  TPmf = record

    Codigo: Integer;

    Versao: Integer;

    Usuario: string[100];

    Autor: string[100];

    Codigo_Usuario: Integer;

    Empresa: string[100];

    Titulo: string[100];

    SubTitulo: string[100];

    Data: TDate;

    DataHoraGravacao: Tdatetime;

    TipoArquivo: TTipoArquivoPmf;

    TipoCriptografia: TTipoCriptografia;
  end;

{$ENDREGION}
{$ENDIF}


  // Funcoes usadas para Enviar e Baixar arquivos do pserver
  TProcEnviarArquivo = reference to procedure(ipEnderecoArquivo: string; ipInicioStream: Integer; var ipStream: TStream);

  TFuncBaixarArquivo = reference to function(ipEnderecoArquivo: string; ipInicioStream, ipTamanhoDoBuffer: Integer; out ipTamanhoTotal: Int64; ipPegarTamanhoTotal: Boolean): TStream;

  TFuncListarDiretorio = reference to function(ipDiretorioComMascara: string): TStream;

  TProcGravarAudio = reference to procedure(ipCodigoExameProcedimento: Integer; ipEndArqServidor: String);

  TProcGravarAudioSemVinculo = reference to procedure(ipNomePaciente, ipDataCaptura, ipDataExame, ipEnderecoArquivo, ipNomeExame, ipExameUid: String);

  TTipoSequenciaTransacao = (tstApenasVerificarCriar = -1, tstVerificarEligibilidade, tstSolicatacaoProcedimento, tstCancelaGuia, tstComunicacaoBeneficiario, tstLoteAnexo, tstDemonstrativoPagamento, tstSolicitacaoStatus, tstSolicatacaoRecursoGlosa,
    tstLoteGuia);

  TFuncDefinirDiretorio = reference to function(ipCodigo: Integer; ipData: String; ipTipoArquivo: Integer): string;
  TTCritpografiaSenhaWS = (cpWS_None, cpWS_MD5, cpWS_Certificado);
  // types para leitura do proteq
  TTLerProteq = (lpStatus, lpVencimento, lpNumeroSerie, lpQtdLicensa, lpAlterarSenhaAcesso, lpDemo);
  // type de pesquisa do board
  TVariaveisDisponiveisModeloBi = (vbiCodigoUsuario, vbiCodigoMedico, vbiMesesAnteriores);

  TTipoAgenda = (taPessoal, taConsulta, taExame, taCirurgia, taAvulsa);

  TTelaOrigem = (toRecepcao, toInternacao, toAgenda);

  TTipoBanco = (tbPMedico, tbPmedicoLOG);

  TRetornoMatMedPrecoUnitario = (rmmMsg, rmmPreco, rmmCodAtualizacao, rmmDivisor, rmmMultiplicador);

  TAbaInicial = (aiPadrao, aiReceita);

  TCategoriaRateio = (crConsultasExames, crHonorarios, crDiariasTaxas, crServicosDiversos, crMateriaisMedicamentos, crTributos);

  TTipoCategoriaBaixa = (tcbSomenteConsulta, tcbOutros, tcbSomenteHonorarios, tcbConsultaHonorario);

  TMatMedReferencia = (mmrMsg, mmrCodigoMatMedItem, mmrCodigoOficial, mmrNomeOficial, mmrApresentacao, mmrUnidadeOficial, mmrDivisor, mmrMultiplicador, mmrCodigoTabela);

  TRestricaoInfo = (riOk, riEmitirAviso, riExigirLiberacaoUsuario, riBloqueado);

  TTipoConvenio = (tcNormal, tcSus, tcParticular, tcIpasgo);

  TTipoPesquisaWorkStation = (tpwNormal, tpwRapida);

  TOperacaoSenha = (osAviso, osSolicitacaoUsuario, osSolicitacaoAdmin, osSenhaExpirada, osRecuperacaoSenha);

  TStatusProcedimento = (spNenhum, spTranscricaoConferida);

  TCodigoTelaWorkStation = (ctwPrincipal, ctwQuery, ctwLaudo, ctwAudio, ctwHost);
  TTipoInfoCustomizacao = (ticGrid, ticTela, ticBarManager, ticDiversas);

  TTabelasMobile = (tmFicha, tmUsuario);

  TSistemaCloud = (scPWorkStation = 1000, scPServer, scPMedico, scPDicom, scTeamViewer);

  TTipoUsuarioSite = (tusPaciente, tusAdmin, tusMedicoExaminador, tusMedicoSolicitante, tusConvenio);
  TStatusUsuarioSite = (susAguardandoConfirmacao, susAtivo, susInativo);
  TipoStreamLaudo = (tslDocX, tslRvf, tslRtf);
  TTipoDigitacaoLaudo = (tdlTexto, tdlValor, tdlBirads);
  TTipoCampoLaudo = (tclInteiro, tclNumerico, tclData, tclTexto, tclRadioGroup, tclValorFixo, tclComboBox);
  TVisibilidadeImpressao = (viNaoImprimir, viImprimir, viImprimirLinhaSomenteSeHouverConteudo);
  TTiposPapeis = (tpNormal, tpAdministrador, tpMedico, tpEnfermeiro, tpTecnicoEnfermagem, tpAuditor, tpOperadorBackup, tpUsuarioSistema, tpColetorMaterial);
  TNivelCriticidade = (ncNaoInformado, ncEmergencia, ncAlerta, ncCritico, ncErro, ncAtencao, ncAviso, ncInformacao, ncDebug);
  TComponenteSistema = (csNaoInformado, csPromedico, csPServer, csPMobile, csPWorkstation, csPPainelSenha, csPHL7, csPromedicoOnline, csPainelCirurgico);
  TEventoLogSistema = (elIndefinido, elCriacaoConsultaRegistroRES, elImportacaoExportacaoDados, elImpressaoRegistrosRES, elTentativaTrocaSenhaSucesso,
    elTentativaTrocaSenhaSemSucesso, elRealizacaoAssinaturaDigital, elEncerramentoBloqueioSessao, elInicioParadaSistema, elGerenciamentoUsuariosPapeis, elGeracaoSenhaUsuario,
    elAcessoAuditoria, elDelegacaoPoder, elMovimentacaoFinanceira, elRegistroProcedimento);
  // nem todo os eventos estao na tabela log_sistema, por isso precisei separar
  TEventoExtraLog = (elTentativaAutenticacaoComSucesso = 100, elTentativaAutenticacaoSemSucesso, elBackupRestore);

  TAcaoLog = (alConsulta, alAlteracao, alInclusao, alExclusao, alImpressao, alExportacaoImportacao, alTodos, alNenhuma);
  TTipoPesquisaLog = (tplTodos, tplCodigo, tplCodigoUsuario, tplNomeUsuario, tplComputador, tplNroFicha, tplNomePaciente, tplLaudoExameNFicha, tplBaixasNFicha);
  TTabelaExtraLog = (telSistema, telBackupRestore, telLogin, telEvolucaoMedica, telEvolucaoEnfermagem, telEvolucaoMultidisciplinar, telAnotacaoEnfermagem, telPlanoTerapeutico, telAuditoria, telQuestionarioCirurgiaSegura);

  TPermissaoAgenda = (paVisualizar, paAgendarEditar, paBloquear, paDesbloquear, paIgnorarRestricoes, paRealizarEncaixe);

  TStatusFilaExameProcedimento = (sfepAguardandoAutorizacao,sfepAguardandoColeta,sfepColetaTodosMateriais, sfepColetaParcial,sfepColetarMaisTarde);

  TStatusHorarioAgenda = (
    shaLiberado,

    shaAdquirido,

    shaBloqueado,

    shaExpirado);

  // record que guarda os parametros possiveis no promedico
  TParametrosPM = record
  const
    coUsuario = 'usuario';
    coSenha = 'senha';
    coCodExameProcedimento = 'exame_procedimento';
    coRemoto = 'remoto';
    coSemFundo = 'semfundo';
    coIniciarGravacao = 'iniciar_gravacao';
  end;

  TParametrosWS = record
  const
    coUsuario = 'usuario';
    coSenha = 'senha';
    coHost = 'host';
    coPorta = 'porta';
    coHostDicom = 'host_dicom';
    coPortaDicom = 'porta_dicom';
    coExameUid = 'exame_uid';
    coCategoria = 'categoria';
    coQuantImg = 'quantidade_imagens';
    coExameProc = 'codigo_exame_procedimento';
    coLaudo = 'possui_laudo';
    coMultiplasInstancias = 'multi_instancia';
  end;

  TParametrosBuilder = record
  const
    coSilencioso = 'silencioso'; // abre, executa a funcao e fecha
    coHost = 'hostname';
    coPorta = 'porta';
    coEndPoint = 'endpoint';
    coBlogId = 'blog_id';
    coUsuario = 'usuario';
    coSenha = 'senha';
    coTitulo = 'titulo';
    coConteudo = 'conteudo';
    coCategorias = 'categorias';
    coVersao = 'versao';
    coVersaoCompleta = 'versao_completa';
    coVersaoMinimaPServer = 'versao_minima_pserver';
    coCompactar = 'compactar';
    coSistema = 'sistema'; // deve ser informado um codigo que esteja dentro da faixa de valores do enum TSistemaCloud
    coArquivoCab = 'arq_cab'; // arquivo .cab que foi carregado para o FTP, preciso desse cara no momento de notificar o PCloud, nao posso usar o conteudo pq ele pode ter varios arquivos.
    coSistema64Bits = 'sistema_64_bits';
    coApenasNotificarPCloud = 'notificar_pcloud';

    coFuncao = 'funcao';
    // valores possiveis para o parametro funcao
    coNovoPost = 'novo_post';
    coEditPost = 'edit_post';

    coGerarSql = 'gerar_sql';
    coArqOriginal = 'arq_original';
    coArqResultado = 'arq_resultado';

  end;

  IListenerCallBack = interface
    ['{7C5943C3-EE31-4182-BA0B-A0A172E63896}']

    procedure ppuProcessarCallBack(ipMsg: String);
    function GetChaveCallBack(): TArray<String>;

  end;

  // record que guarda as mensagens tratadas pelo CallBack do Promedico
  TCallBackMsgPM = record
  const
    // CallBacks referentes ao chat do Pro-M�dico
    coChatNovaMensagem = 'CHAT - NOVA MENSAGEM';
    coChatMensagemLida = 'CHAT - MENSAGEM LIDA';
    coChatStatusUsuarioAlterado = 'CHAT - STATUS DO USU�RIO ALTERADO';

    // Demais CallBacks
    coAbrirLaudo = 'ABRIR_LAUDO:'; // deve ser seguido do codigo do exame procedimento do qual se deseja abrir o laudo
    coIniciarGravacao = 'INICIAR_GRAVACAO_TEST_RECORDER';
    coPararGravacao = 'PARAR_GRAVACAO_TEST_RECORDER';
    coAtualizarAprazamento = 'ATUALIZAR_APRAZAMENTO';
    coAtualizarPainelCirurgico = 'ATUALIZAR_PAINEL_CIRURGICO';
    coErroEnviarEmailSenha = 'ERRO_ENVIAR_EMAIL_SENHA';
  end;

  // record que guarda as mensagens tratadas pelo CallBack do WorkStation
  TCallBackMsgWS = record
  const
    // Abre uma imagem dicom. Deve ser sucedido do Host:porta:cod_exame_procedimento:EXAME_UID:categoria:QTDE_IMG
    coAbrirImgs = 'ABRIR_IMGS_DICOM';
    coAtualizarQuery = 'ATUALIZAR_QUERY'; // Faz a tela de query realizar uma nova pesquisa
    coAtualizarHost = 'ATUALIZAR_HOST'; // Aviva que os hosts foram alterados
    coAtualizarCategoria = 'ATUALIZAR_CATEGORIA';
    coAtualizarConfig = 'ATUALIZAR_CONFIG'; // Avisa que as configuracoes foram alteradas

    // indice do callback coAbrirImg
    coChaveAbrirImgs = 0;
    coHostDicom = 1;
    coPortaDicom = 2;
    coCodExmProc = 3;
    coExameUid = 4;
    coCategoria = 5;
    coQuantImg = 6;
    coLaudo = 7;
    coQuantParametrosAbrirImgs = 8;
  end;

  TExeVersionData = record
    CompanyName, FileDescription, FileVersion, InternalName, LegalCopyright, LegalTrademarks, OriginalFileName, ProductName, ProductVersion, Comments, PrivateBuild, SpecialBuild, BuildData, Release, Build: string;
  end;

  TInfoPesquisaAgendamento = class
  private
    FCodigoAgenda: Integer;
    FCodigoConvenio: Integer;
    FExames: TadsObjectlist<TExamesAgenda>;
    FCodigoMedico: Integer;
    FTipoAgenda: TTipoAgenda;
    FNroFicha: Integer;
    FQuantidadeDias: integer;
    FDataInicial: String;
    FHora: TTime;
    procedure SetCodigoAgenda(const Value: Integer);
    procedure SetCodigoConvenio(const Value: Integer);
    procedure SetCodigoMedico(const Value: Integer);
    procedure SetExames(const Value: TadsObjectlist<TExamesAgenda>);
    procedure SetNroFicha(const Value: Integer);
    procedure SetTipoAgenda(const Value: TTipoAgenda);
    procedure SetDataInicial(const Value: String);
    procedure SetQuantidadeDias(const Value: integer);
    procedure SetHora(const Value: TTime);
  public
    constructor Create;
    property NroFicha: Integer read FNroFicha write SetNroFicha;
    property TipoAgenda: TTipoAgenda read FTipoAgenda write SetTipoAgenda;
    property CodigoAgenda: Integer read FCodigoAgenda write SetCodigoAgenda;
    property CodigoMedico: Integer read FCodigoMedico write SetCodigoMedico;
    property CodigoConvenio: Integer read FCodigoConvenio write SetCodigoConvenio;

    property DataInicial:String read FDataInicial write SetDataInicial;
    property QuantidadeDias:integer read FQuantidadeDias write SetQuantidadeDias;

    property Hora:TTime read FHora write SetHora;

    property Exames: TadsObjectlist<TExamesAgenda> read FExames write SetExames;
  end;

{$IFNDEF FIREMONKEY}


  // ATENCAO NAO MUDAR A ORDEM DESSE TYPE, podemos adicionar novos campos, mas nao trocar a ordem
Type
  TpmFieldPivot = record
    NomeField: string[100];
    OrdenadoPor: string[100];
    QtdeRegistros: Integer;
    MostrarOutros: Boolean;
    OrdenarCescente: Boolean;
    DisplayFormat: string[20];
    SummaryType: Integer;
  end;

{$IFNDEF FIREMONKEY}

  TpmChart = record
    SerieOrdenada: Integer;
    SortOrder: TdxSortOrder;
  end;
{$ENDIF}

  TpmCustomizacaoTela = record
    Largura: Integer;
    Altura: Integer;
    Left: Integer;
    Top: Integer;
  end;
{$ENDIF}


const
  // versao do mobile
  coVersaoMobile = 1;
  coVersaoPmf = 1;
  // usado no ws para saber se um listerner vai ouvir todo callback que chegar
  coTodosCallBack = 'TODOS_CALLBACK';

  coSeparadorParametros = ':';
  coNomeExeWorkstation = 'pWorkstation.exe';
  coNomeExeProMedico = 'PMedico.exe';

  coBufferUpload = 64000;
  coBufferDowlnoad = 51200; // 50 kb. Tamanho do Pacote que iremos trazer cada vez que for no servidor buscar 1 pedaco do arquivo

  coExtensaoArqTestRecorder = '.pmRec';

  coSeparadorSQLExecutado = '-----SQL EXECUTADO ATE AQUI-----';

  coCategoria_ModeloBi_DashBoard = 'DASHBOARD';

  coRelatorioWorkstation = 'WorkStation';

  coDescricaoVariaveisDisponiveisModeloBi: array [TVariaveisDisponiveisModeloBi] of String = ('C�d. Usu�rio', 'C�d. M�dico', 'Meses Anteriores');
  // a variavel MESES_ANTERIORES nao tem o colchete inicial pq ele sera inserido no momento de adicionar ao sql pq vira um numero apos ele. Ex. [3MESES_ANTERIROES]
  coVariaveisDisponiveisModeloBi: array [TVariaveisDisponiveisModeloBi] of String = ('[COD_USUARIO]', '[COD_MEDICO]', 'MESES_ANTERIORES]');

  coDescricaoSistemasCloud: array [TSistemaCloud] of string = ('PWorkStation', 'Pr�-Server', 'Pr�-M�dico', 'PDicom', 'TeamViewer');

  coTabelaExtraLog: array [TTabelaExtraLog] of string = ('SISTEMA', 'BACKUP/RESTORE', 'LOGIN', 'EVOLUCAO_MEDICA', 'EVOLUCAO_ENFERMAGEM', 'EVOLUCAO_MULTIDISCIPLINAR', 'ANOTACAO_ENFERMAGEM', 'PLANO_TERAPEUTICO', 'AUDITORIA',
    'QUESTIONARIO_CIRURGIA_SEGURA');

  coDisplayFormatMesModeloBi = 'M�s';
  coDisplayFormatMesAnoModeloBi = 'M�s - Ano';
  coDisplayFormatAnoMesModeloBi = 'Ano - M�s';

  // OP�OES DE ALTERACAO DE PROCEDIMENTOS
  coShowModal = 1;

  // acoes a serem executadas para poder alterar/excluir procedimento ou baixa
  coEXCLUIR_QUITACOES = 0;
  coEXCLUIR_BAIXA_NAO_TOTALMENTE_PAGA = 1;
  coEXCLUIR_BAIXA_TOTALMENTE_PAGA = 2;
  coPOSSUI_LOTE = 3;
  coPOSSUI_TRANSCRICAO = 4;
  coPOSSUI_STATUS_EXAME = 5;
  // MENSAGEM DE ERRO DO PSERVER
  coRemoteError = 'Remote Error';
  // Tipos de pagamentos de guias
  coGuiaConvenio = '2 - GUIA DE CONVENIO';
  coDinheiro = '1 - DINHEIRO';
  coDepositoOrdemPagto = 'A - DEPOSITO/ORDEM PGTO';
  coAntecipacaoPagto = 'B - ANTECIPA��O DE PGTO';
  coRequisicao = 'C - REQUISI��O';
  coGuiaFuncionario = 'D - GUIA FUNCION�RIO';
  coSemDocumento = '0 - SEM DOCUMENTO';
  coChequeAVista = '3 - CHEQUE � VISTA';
  coChequePrazo = '4 - CHEQUE � PRAZO';
  coBoletoBancario = '5 - BOLETO BANC�RIO';
  coDuplicata = '6 - DUPLICATA';
  coNotaPromissoria = '7 - NOTA PROMISS�RIA';
  coCartaoCredito = '8 - CART�O DE CR�DITO';
  coDesconto = '9 - DESCONTO';
  coCartaoDebito = '10- CART�O DE D�BITO';

  coModoExibicaoConsultaMatMed = 'ModoExibicaoConsultaMatMed';
  coDescricaoSaidaTranscricao = 'TRANSCRICAO ';

  coSaltSHA1 = '8.&kop$pm@';
{$IFNDEF FIREMONKEY}
  // mensagens do windos customizadas
  WM_LOAD_DICOM_DATASET = WM_USER + 1;
  WM_ON_PROGRESS = WM_USER + 2;
  WM_LOAD_FROM_DISK = WM_USER + 3;
  WM_ERROR_IMG_INVALIDA = WM_USER+4;
{$ENDIF}
  coPFB = 'PFB';
  // quantidades maximas de registros
  coQuantMaxRegistroDataSet = 100000; // datasets normais
  coQuantMaxRegistroDataSetRelatorio = 30000; // datasets de relatorio

  // msg usada para informar o WS que o exame q esta sendo procurado foi excluido
  coExameExcluido = 'EXAME_EXCLUIDO';
  // tipo de motivo de cancelamento
  coTipoAgenda = 0;
  coTipoLaudo = 1;
  // Tipo de conta de email
  coOrcamento = 0;
  coMalaDireta = 1;
  coPMedicoOnline = 2;
  coEnvioRecuperacaoSenha = 3;

  coDelimitadorCampos = '|';
  coObsLaudo = 'Obs.:';

implementation

{ TTipoArquivoSalvarImg }

constructor TTipoArquivoSalvarImg.Create;
begin
  InstanciaUID := '';
  Imagem_No := '';
  Paciente_Nome := '';
  Paciente_Sexo := '';
  Paciente_Codigo := '';
  Series_Uid := '';
  Series_Descricao := '';
  Exame_Uid := '';
  CodigoProcedimento := '';
  Exame_Descricao := '';
  Categoria := '';
  Nome_Arquivo := '';
  Arquivo_Diretorio := '';
  Diretorio_Base := '';
  Diretorio_Img := '';
  Exame_Data_Hora := Now;
end;

{ TAdicionarProcedimentoBaixa }

constructor TAdicionarProcedimentoBaixa.Create(ipNumProc: Integer; ipCatProc: String);
begin
  CatProc := ipCatProc;
  NumProc := ipNumProc;
  Categoria := '';
  Nome_Procedimento := '';
  Valor_Total := 0;
  Valor_Debito := 0;
  Data := 0;
  Qtde := 0;
  Numero_Internacao := 0;
  Codigo_Convenio := 0;
  Codigo_Medico_Responsavel := 0;
  Codigo_Medico_Solicitante := 0;
  Codigo_Prestador := 0;
end;

{ TInfoExame }

constructor TInfoExame.Create(ipCodigoExameProc: Integer);
begin
  FCodigoExameProc := ipCodigoExameProc;
  FDataExame := 0;
  FNomeProcedimento := '';
  FExameUid := '';
  FNomePaciente := '';
end;

procedure TInfoExame.SetCodigoExameProc(const Value: Integer);
begin
  FCodigoExameProc := Value;
end;

procedure TInfoExame.SetDataExame(const Value: Tdatetime);
begin
  FDataExame := Value;
end;

procedure TInfoExame.SetExameUid(const Value: String);
begin
  FExameUid := Value;
end;

procedure TInfoExame.SetNomePaciente(const Value: String);
begin
  FNomePaciente := Value;
end;

procedure TInfoExame.SetNomeProcedimento(const Value: String);
begin
  FNomeProcedimento := Value;
end;

{ TInfoProcedimentoAlterarExcluir }

constructor TInfoProcedimentoAlterarExcluir.Create(ipAlterando: Boolean);
begin
  FAlterando := ipAlterando;
  FConfirmacoes := TadsObjectlist<TConfirmacao>.Create;
  FBaixaAutomatica := false;
end;

destructor TInfoProcedimentoAlterarExcluir.Destroy;
begin
  Confirmacoes.Clear;
  Confirmacoes.Free;

  inherited;
end;

procedure TInfoProcedimentoAlterarExcluir.SetAlterando(const Value: Boolean);
begin
  FAlterando := Value;
end;

procedure TInfoProcedimentoAlterarExcluir.SetBaixaAutomatica(
  const Value: Boolean);
begin
  FBaixaAutomatica := Value;
end;

procedure TInfoProcedimentoAlterarExcluir.SetConfirmacoes(
  const Value: TadsObjectlist<TConfirmacao>);
begin
  FConfirmacoes := Value;
end;

{ TConfirmacao }

constructor TConfirmacao.Create(ipCodigoConfirmacao: Integer);
begin
  FCodigoConfirmacao := ipCodigoConfirmacao;
  FDescricao := '';
end;

procedure TConfirmacao.SetCodigoConfirmacao(const Value: Integer);
begin
  FCodigoConfirmacao := Value;
end;

procedure TConfirmacao.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

{ TExamesAgenda }

procedure TExamesAgenda.SetCodigoBcExames(const Value: Integer);
begin
  FCodigoBcExames := Value;
end;

procedure TExamesAgenda.SetCodigoCategoria(const Value: Integer);
begin
  FCodigoCategoria := Value;
end;

procedure TExamesAgenda.SetCodigoOficial(const Value: String);
begin
  FCodigoOficial := Value;
end;

procedure TExamesAgenda.SetNomeProcedimento(const Value: String);
begin
  FNomeProcedimento := Value;
end;

procedure TExamesAgenda.SetQuantidade(const Value: Integer);
begin
  FQuantidade := Value;
end;

procedure TExamesAgenda.SetQuantidadeLancada(const Value: Integer);
begin
  FQuantidadeLancada := Value;
end;

procedure TExamesAgenda.SetQuantidadeMaxima(const Value: Integer);
begin
  FQuantidadeMaxima := Value;
end;

{ TInfoAgendamento }

constructor TInfoPesquisaAgendamento.Create;
begin
  inherited;
  FExames := TadsObjectlist<TExamesAgenda>.create;
end;

procedure TInfoPesquisaAgendamento.SetCodigoAgenda(const Value: Integer);
begin
  FCodigoAgenda := Value;
end;

procedure TInfoPesquisaAgendamento.SetCodigoConvenio(const Value: Integer);
begin
  FCodigoConvenio := Value;
end;

procedure TInfoPesquisaAgendamento.SetCodigoMedico(const Value: Integer);
begin
  FCodigoMedico := Value;
end;

procedure TInfoPesquisaAgendamento.SetDataInicial(const Value: String);
begin
  FDataInicial := Value;
end;

procedure TInfoPesquisaAgendamento.SetExames(const Value: TadsObjectlist<TExamesAgenda>);
begin
  FExames := Value;
end;

procedure TInfoPesquisaAgendamento.SetHora(const Value: TTime);
begin
  FHora := Value;
end;

procedure TInfoPesquisaAgendamento.SetNroFicha(const Value: Integer);
begin
  FNroFicha := Value;
end;

procedure TInfoPesquisaAgendamento.SetQuantidadeDias(const Value: integer);
begin
  FQuantidadeDias := Value;
end;

procedure TInfoPesquisaAgendamento.SetTipoAgenda(const Value: TTipoAgenda);
begin
  FTipoAgenda := Value;
end;

end.
