unit pChatTipos;

interface

uses
  System.Classes, System.SysUtils, RVEdit, RVStyle, System.Generics.Collections,
  Winapi.Windows, System.Zip, Vcl.Graphics, dxGDIPlusClasses, Vcl.Imaging.jpeg,
  System.Math, System.Variants;

type
  // Criando tipos
  TChatFormatoStream = (ftDocx, ftHtml, ftRtf, ftRvf, ftTxt);
  TChatTipoAba = (taConfiguracao, taConversaGrupo, taConversaUsuario, taPesquisa);
  TChatTipoArquivo = (taqImagem, taqOutros);
  TChatTipoPesquisa = (tpqCodigo, tpqCodigoMesagensProximas, tpqUltimasMensagens, tpqData, tpqDataTexto, tpqTexto);
  TChatEstiloRich = (erNormal, erResultadoPesquisa);

  // Criando os registros
  TChatIdentificacaoUsuario = record
  private
    FCodigoUsuario: Integer;
    FCodigoHospital: Integer;
    procedure SetCodigoHospital(const Value: Integer);
    procedure SetCodigoUsuario(const Value: Integer);
    { Private declarations }
  public
    procedure ppuCopiarDe(const ipOrigem: TChatIdentificacaoUsuario);
    property CodigoHospital: Integer read FCodigoHospital write SetCodigoHospital;
    property CodigoUsuario: Integer read FCodigoUsuario write SetCodigoUsuario;
    { Public declarations }
  end;

  TChatUsuarioLogado = record
  private
    FEnviaMensagemGrupoTodos: Boolean;
    FIdentificacaoUsuario: TChatIdentificacaoUsuario;
    procedure SetEnviaMensagemGrupoTodos(const Value: Boolean);
    procedure SetIdentificacaoUsuario(const Value: TChatIdentificacaoUsuario);
    { Private declarations }
  public
    procedure ppuCopiarDe(const ipOrigem: TChatUsuarioLogado);
    property EnviaMensagemGrupoTodos: Boolean read FEnviaMensagemGrupoTodos write SetEnviaMensagemGrupoTodos;
    property IdentificacaoUsuario: TChatIdentificacaoUsuario read FIdentificacaoUsuario write SetIdentificacaoUsuario;
    { Public declarations }
  end;

  TChatConversa = record
  private
    FIdentificacaoUsuario: TChatIdentificacaoUsuario;
    FNotificar: Boolean;
    FSelecionar: Boolean;
    procedure SetIdentificacaoUsuario(const Value: TChatIdentificacaoUsuario);
    procedure SetNotificar(const Value: Boolean);
    procedure SetSelecionar(const Value: Boolean);
    { Private declarations }
  public
    procedure ppuCopiarDe(const ipOrigem: TChatConversa);
    property IdentificacaoUsuario: TChatIdentificacaoUsuario read FIdentificacaoUsuario write SetIdentificacaoUsuario;
    property Notificar: Boolean read FNotificar write SetNotificar;
    property Selecionar: Boolean read FSelecionar write SetSelecionar;
    { Public declarations }
  end;

  TChatDadosConversa = record
  private
    FAnexos: OleVariant;
    FMensagens: OleVariant;
    FPosicaoScroll: Integer;
    procedure SetAnexos(const Value: OleVariant);
    procedure SetMensagens(const Value: OleVariant);
    procedure SetPosicaoScroll(const Value: Integer);
    { Private declarations }
  public
    procedure ppuCopiarDe(const ipOrigem: TChatDadosConversa);
    property Anexos: OleVariant read FAnexos write SetAnexos;
    property Mensagens: OleVariant read FMensagens write SetMensagens;
    property PosicaoScroll: Integer read FPosicaoScroll write SetPosicaoScroll;
    { Public declarations }
  end;

  TChatStatus = record
  private
    FIdentificacaoUsuario: TChatIdentificacaoUsuario;
    FStatus: Integer;
    procedure SetIdentificacaoUsuario(const Value: TChatIdentificacaoUsuario);
    procedure SetStatus(const Value: Integer);
    { Private declarations }
  public
    procedure ppuCopiarDe(const ipOrigem: TChatStatus);
    property IdentificacaoUsuario: TChatIdentificacaoUsuario read FIdentificacaoUsuario write SetIdentificacaoUsuario;
    property Status: Integer read FStatus write SetStatus;
    { Public declarations }
  end;

  TChatHospital = record
  private
    FCodigo: Integer;
    FNomeFantasia: string;
    FRazaoSocial: string;
    procedure SetCodigo(const Value: Integer);
    procedure SetNomeFantasia(const Value: string);
    procedure SetRazaoSocial(const Value: string);
    { Private declarations }
  public
    procedure ppuCopiarDe(const ipOrigem: TChatHospital);
    property Codigo: Integer read FCodigo write SetCodigo;
    property NomeFantasia: string read FNomeFantasia write SetNomeFantasia;
    property RazaoSocial: string read FRazaoSocial write SetRazaoSocial;
    { Public declarations }
  end;

  TChatAnexoPropriedades = record
  private
    FExtencao: string;
    FId: Integer;
    FNome: string;
    FTamanho: Int64;
    FTamanhoFormatado: string;
    FTamanhoOriginal: Int64;
    FTamanhoOriginalFtd: string;
    { Private declarations }
  public
    procedure ppuCopiarDe(const ipOrigem: TChatAnexoPropriedades);
    property Extencao: string read FExtencao;
    property Id: Integer read FId;
    property Nome: string read FNome;
    property Tamanho: Int64 read FTamanho;
    property TamanhoFomatado: string read FTamanhoFormatado;
    property TamanhoOriginal: Int64 read FTamanhoOriginal;
    property TamanhoOriginalFtd: string read FTamanhoOriginalFtd;
    { Public declarations }
  end;

  // Declarando algumas classes necess�rias para os eventos.
  // Essas classes est�o implementadas na parte de cria��o
  // das classes
  TChatConfiguracoes = class;
  TChatDadosUsuario = class;
  TChatMensagem = class;

  // Criando eventos
  TChatAnexoLimiteAtingido = procedure(const ipArquivosRecusados: TStrings) of object;
  TChatConfirmarLeituraMensagens = procedure(const ipUsuarioLeu: TChatIdentificacaoUsuario; const ipMensagensLidas: string) of object;
  TChatDownloadArquivo = function(const ipCodigoHospital: Integer; const ipEnerecoArquivo: string): TBytesStream of object;
  TChatEnviarMensagem = procedure(const ipMensagem: TChatMensagem; const ipDestinatarios: TArray<TChatDadosUsuario>) of object;
  TChatMudarStatusConversa = procedure(const ipUsuarioLogado, ipUsuarioConversa: TChatIdentificacaoUsuario; const ipConversaAtiva: Boolean) of object;
  TChatPesquisarAnexos = function(const ipUsuarioLoagado, ipUsuarioConversa: TChatIdentificacaoUsuario; const ipQuantidadeAnexos, ipCodigoMensagem: Integer; const ipUsuarioSistema, ipPesqSomenteMsgEnviadas: Boolean): OleVariant of object;
  TChatPesquisarConfiguracoes = function(const ipUsuarioLogado: TChatIdentificacaoUsuario): TChatConfiguracoes of object;
  TChatPesquisarGrupos = function(const ipCodigoHospital: Integer; const ipCodigosGrupos: string; const ipGruposAtivos, ipGruposInativos: Boolean): OleVariant of object;
  TChatPesquisarLeitoresMensagens = function(const ipCodigoHospital, ipCodigoMensagem: Integer): OleVariant of object;
  TChatPesquisarUsuarios = function(const ipCodigoHospital: Integer; const ipCodigosUsuarios: string; const ipUsuariosAtivos, ipUsuariosInativos: Boolean; const ipTipoPapelUsuarioSistema: Integer): OleVariant of object;
  TChatPesquisarMensagens = function(const ipTipoPesquisa: TChatTipoPesquisa; const ipTexto: string; const ipDataInicial, ipDataFinal: TDate; const ipUsuarioLoagado, ipUsuarioConversa: TChatIdentificacaoUsuario; const ipUsuarioSistema, ipPesqSomenteMsgEnviadas: Boolean): OleVariant of object;
  TChatSalvarConfiguracoes = procedure(const ipConfiguracoes: TChatConfiguracoes; const ipUsuario: TChatIdentificacaoUsuario) of object;

  // Criando as classes
  TChatDadosUsuario = class
  private
    FFotoUsuario: TPicture;
    FIdentificacao: TChatIdentificacaoUsuario;
    FNome: string;
    procedure SetFotoUsuario(const Value: TPicture);
    procedure SetIdentificacao(const Value: TChatIdentificacaoUsuario);
    procedure SetNome(const Value: string);
    { Private declarations }
  public
    constructor Create;
    destructor Destroy; override;
    procedure ppuCopiarDe(const ipOrigem: TChatDadosUsuario);
    property FotoUsuario: TPicture read FFotoUsuario write SetFotoUsuario;
    property Identificacao: TChatIdentificacaoUsuario read FIdentificacao write SetIdentificacao;
    property Nome: string read FNome write SetNome;
    { Public declarations }
  end;

  TChatDadosPesquisa = class
  private
    FDadosConversa: TChatDadosConversa;
    FDataInicial: TDate;
    FDataFinal: TDate;
    FFotoUsuario: TPicture;
    FIdentificador: string;
    FNomeHospital: string;
    FNomeFuncao: string;
    FNomeUsuario: string;
    FPesquisarData: Boolean;
    FTexto: String;
    procedure SetDadosConversa(const Value: TChatDadosConversa);
    procedure SetDataFinal(const Value: TDate);
    procedure SetDataInicial(const Value: TDate);
    procedure SetFotoUsuario(const Value: TPicture);
    procedure SetIdentificador(const Value: string);
    procedure SetNomeFuncao(const Value: string);
    procedure SetNomeHospital(const Value: string);
    procedure SetNomeUsuario(const Value: string);
    procedure SetPesquisarData(const Value: Boolean);
    procedure SetTexto(const Value: String);
    { Private declarations }
  public
    constructor Create;
    destructor Destroy; override;
    procedure ppuCopiarDe(const ipOrigem: TChatDadosPesquisa);
    property DadosConversa: TChatDadosConversa read FDadosConversa write SetDadosConversa;
    property DataInicial: TDate read FDataInicial write SetDataInicial;
    property DataFinal: TDate read FDataFinal write SetDataFinal;
    property FotoUsuario: TPicture read FFotoUsuario write SetFotoUsuario;
    property Identificador: string read FIdentificador write SetIdentificador;
    property NomeHospital: string read FNomeHospital write SetNomeHospital;
    property NomeFuncao: string read FNomeFuncao write SetNomeFuncao;
    property NomeUsuario: string read FNomeUsuario write SetNomeUsuario;
    property PesquisarData: Boolean read FPesquisarData write SetPesquisarData;
    property Texto: String read FTexto write SetTexto;
    { Public declarations }
  end;

  TChatConfiguracoes = class
  private
    FEMail: string;
    FFonteNome: string;
    FFonteTamanho: Integer;
    FFoto: TPicture;
    FNovasMensagensApenasAlerta: Integer;
    FPermitirAlterarAlertaMensagens: Boolean;
    FTelefone: string;
    procedure SetEMail(const Value: string);
    procedure SetFonteNome(const Value: string);
    procedure SetFonteTamanho(const Value: Integer);
    procedure SetFoto(const Value: TPicture);
    procedure SetNovasMensagensApenasAlerta(const Value: Integer);
    procedure SetPermitirAlterarAlertaMensagens(const Value: Boolean);
    procedure SetTelefone(const Value: string);
    { Private declarations }
  public
    constructor Create;
    procedure ppuCopiarDe(const ipOrigem: TChatConfiguracoes);
    property EMail: string read FEMail write SetEMail;
    property FonteNome: string read FFonteNome write SetFonteNome;
    property FonteTamanho: Integer read FFonteTamanho write SetFonteTamanho;
    property Foto: TPicture read FFoto write SetFoto;
    property NovasMensagensApenasAlerta: Integer read FNovasMensagensApenasAlerta write SetNovasMensagensApenasAlerta;
    property PermitirAlterarAlertaMensagens: Boolean read FPermitirAlterarAlertaMensagens write SetPermitirAlterarAlertaMensagens;
    property Telefone: string read FTelefone write SetTelefone;
    { Public declarations }
  end;

  TChatUsuario = class
  private
    FAtivoInativo: Integer;
    FEMail: string;
    FFoto: TPicture;
    FFotoThumbnail: TPicture;
    FFuncao: string;
    FGrupoUsuarios: TArray<Integer>;
    FIdentificacaoUsuario: TChatIdentificacaoUsuario;
    FNome: string;
    FPromedico: Integer;
    FStatus: Integer;
    FUsuarioGrupo: Integer;
    procedure SetAtivoInativo(const Value: Integer);
    procedure SetEMail(const Value: string);
    procedure SetFoto(const Value: TPicture);
    procedure SetFotoThumbnail(const Value: TPicture);
    procedure SetFuncao(const Value: string);
    procedure SetGrupoUsuarios(const Value: TArray<Integer>);
    procedure SetIdentificacaoUsuario(const Value: TChatIdentificacaoUsuario);
    procedure SetNome(const Value: string);
    procedure SetPromedico(const Value: Integer);
    procedure SetStatus(const Value: Integer);
    procedure SetUsuarioGrupo(const Value: Integer);
    { Private declarations }
  public
    constructor Create;
    destructor Destroy; override;
    procedure ppuCopiarDe(const ipOrigem: TChatUsuario);
    property AtivoInativo: Integer read FAtivoInativo write SetAtivoInativo;
    property EMail: string read FEMail write SetEMail;
    property Foto: TPicture read FFoto write SetFoto;
    property FotoThumbnail: TPicture read FFotoThumbnail write SetFotoThumbnail;
    property Funcao: string read FFuncao write SetFuncao;
    property GrupoUsuarios: TArray<Integer> read FGrupoUsuarios write SetGrupoUsuarios;
    property IdentificacaoUsuario: TChatIdentificacaoUsuario read FIdentificacaoUsuario write SetIdentificacaoUsuario;
    property Nome: string read FNome write SetNome;
    property Promedico: Integer read FPromedico write SetPromedico;
    property Status: Integer read FStatus write SetStatus;
    property UsuarioGrupo: Integer read FUsuarioGrupo write SetUsuarioGrupo;
    { Public declarations }
  end;

  TChatAnexo = class
  private
    FArquivo: TBytesStream;
    FArquivoThumbnail: TBytesStream;
    FEndereco: string; // Este endere�o � usado para informar o caminho completo do arquivo no servidor (incluindo o nome que ele foi gravado)
    FId: Integer; // Este identificador ser� utilizado na classe TChatMensagem para atribuir um n�mero �nico para o objeto
    FNome: string;
    FTamanhoOriginal: Int64;
    function fpvTamanhoFormatado(const ipTamanho: Int64): string;
    function GetExtencao: string;
    function GetTamanho: Int64;
    function GetPropriedades: TChatAnexoPropriedades;
    function GetTamanhoFormatado: string;
    function GetTamanhoOriginalFtd: string;
    procedure SetEndereco(const Value: string);
    { Private declarations }
  public
    constructor Create;
    destructor Destroy; override;
    procedure ppuAnexarArquivo(const ipArquivo: TFileStream; const ipArquivoThumbnail: TBytesStream; const ipNome: string; const ipTamanhoOriginal: Int64);
    procedure ppuCopiarDe(const ipOrigem: TChatAnexo);
    property Arquivo: TBytesStream read FArquivo;
    property ArquivoThumbnail: TBytesStream read FArquivoThumbnail;
    property Endereco: string read FEndereco write SetEndereco;
    property Extencao: string read GetExtencao;
    property Id: Integer read FId;
    property Nome: string read FNome;
    property Propriedades: TChatAnexoPropriedades read GetPropriedades;
    property Tamanho: Int64 read GetTamanho;
    property TamanhoFormatado: string read GetTamanhoFormatado;
    property TamanhoOriginal: Int64 read FTamanhoOriginal;
    property TamanhoOriginalFtd: string read GetTamanhoOriginalFtd;
    { Public declarations }
  end;

  TChatMensagem = class
  private
    FAnexos: TList<TChatAnexo>;
    FAnexosLimite: Int64;
    FAnexosNextId: Integer;
    FAoAtingirLimiteAnexos: TChatAnexoLimiteAtingido;
    FDestinatario: TChatIdentificacaoUsuario;
    FMensagemRVF: TBytesStream;
    FRemetente: TChatIdentificacaoUsuario;
    FTipoMensagem: Integer;
    function fpvRetornaIndiceAnexo(const ipId: Integer): Integer;
    function fpvRetornaStreamFormatado(const ipFormato: TChatFormatoStream): TBytesStream;
    function fpvRetornaString(const ipFormato: TChatFormatoStream): string;
    function GetAnexosPropriedades: TArray<TChatAnexoPropriedades>;
    function GetAnexosQtde: Integer;
    function GetAnexosTotal: Int64;
    function GetMensagemDOCX: TBytesStream;
    function GetMensagemHTML: string;
    function GetMensagemRTF: TBytesStream;
    function GetMensagemRVF: TBytesStream;
    function GetMensagemTXT: string;
    procedure ppvCarrearStream(const ipFormato: TChatFormatoStream; const ipBytesStream: TBytesStream);
    procedure SetAnexosLimite(const Value: Int64);
    procedure SetAoAtingirLimiteAnexos(const Value: TChatAnexoLimiteAtingido);
    procedure SetDestinatario(const Value: TChatIdentificacaoUsuario);
    procedure SetMensagemRTF(const Value: TBytesStream);
    procedure SetMensagemRVF(const Value: TBytesStream);
    procedure SetMensagemTXT(const Value: string);
    procedure SetRemetente(const Value: TChatIdentificacaoUsuario);
    procedure SetTipoMensagem(const Value: Integer);
    { Private declarations }
  public
    constructor Create;
    destructor Destroy; override;
    function fpuAnexarArquivos(const ipArquivos: TStrings): TArray<TChatAnexoPropriedades>;
    function fpuDeletarAnexo(const ipId: Integer): Boolean;
    function fpuPropriedadeAnexo(const ipId: Integer): TChatAnexoPropriedades;
    procedure ppuCopiarDe(const ipOrigem: TChatMensagem);
    procedure ppuLimparAnexos;
    procedure ppuLimparMensagem;
    property Anexos: TList<TChatAnexo> read FAnexos;
    property AnexosLimite: Int64 read FAnexosLimite write SetAnexosLimite;
    property AnexosTotal: Int64 read GetAnexosTotal;
    property AnexosPropriedades: TArray<TChatAnexoPropriedades> read GetAnexosPropriedades;
    property AnexosQtde: Integer read GetAnexosQtde;
    property AoAtingirLimiteAnexos: TChatAnexoLimiteAtingido read FAoAtingirLimiteAnexos write SetAoAtingirLimiteAnexos;
    property Destinatario: TChatIdentificacaoUsuario read FDestinatario write SetDestinatario;
    property MensagemDOCX: TBytesStream read GetMensagemDOCX;
    property MensagemHTML: string read GetMensagemHTML;
    property MensagemRTF: TBytesStream read GetMensagemRTF write SetMensagemRTF;
    property MensagemRVF: TBytesStream read GetMensagemRVF write SetMensagemRVF;
    property MensagemTXT: string read GetMensagemTXT write SetMensagemTXT;
    property Remetente: TChatIdentificacaoUsuario read FRemetente write SetRemetente;
    property TipoMensagem: Integer read FTipoMensagem write SetTipoMensagem;
    { Public declarations }
  end;

implementation

{ TChatAnexo }

constructor TChatAnexo.Create;
begin
  FArquivo := nil;
  FArquivoThumbnail := nil;
  FEndereco := '';
  FId := 0;
  FNome := '';
end;

destructor TChatAnexo.Destroy;
begin
  if Assigned(FArquivo) then
    FreeAndNil(FArquivo);

  if Assigned(FArquivoThumbnail) then
    FreeAndNil(FArquivoThumbnail);

  inherited Destroy;
end;

function TChatAnexo.GetExtencao: string;
begin
  Result := ExtractFileExt(FNome);
end;

function TChatAnexo.GetPropriedades: TChatAnexoPropriedades;
begin
  Result.FExtencao := Extencao;
  Result.FId := FId;
  Result.FNome := FNome;
  Result.FTamanho := Tamanho;
  Result.FTamanhoFormatado := TamanhoFormatado;
  Result.FTamanhoOriginal := TamanhoOriginal;
  Result.FTamanhoOriginalFtd := TamanhoOriginalFtd;
end;

function TChatAnexo.GetTamanho: Int64;
begin
  Result := 0;

  if Assigned(FArquivo) then
    Result := FArquivo.Size;
end;

function TChatAnexo.GetTamanhoFormatado: string;
begin
  Result := '0B';

  if Assigned(FArquivo) then
    Result := fpvTamanhoFormatado(FArquivo.Size);
end;

function TChatAnexo.GetTamanhoOriginalFtd: string;
begin
  Result := fpvTamanhoFormatado(FTamanhoOriginal);
end;

function TChatAnexo.fpvTamanhoFormatado(const ipTamanho: Int64): string;
const
  KB = 1024;
  MB = 1024 * KB;
  GB = 1024 * MB;
begin
  Result := '0B';

  if ipTamanho > 0 then
    begin
      case ipTamanho of
        0 .. (KB - 1):
          Result := FormatFloat(',0', ipTamanho) + 'B';
        KB .. (MB - 1):
          Result := FormatFloat(',0.00', ipTamanho / KB) + 'KB';
        MB .. (GB - 1):
          Result := FormatFloat(',0.00', ipTamanho / MB) + 'MB';
      else
        Result := FormatFloat(',0.00', ipTamanho / GB) + 'GB';
      end;
    end;
end;

procedure TChatAnexo.ppuAnexarArquivo(const ipArquivo: TFileStream;
  const ipArquivoThumbnail: TBytesStream; const ipNome: string;
  const ipTamanhoOriginal: Int64);
begin
  if Assigned(ipArquivo) then
    begin
      if not Assigned(FArquivo) then
        FArquivo := TBytesStream.Create;

      FArquivo.Clear;
      FArquivo.LoadFromStream(ipArquivo);

      if Assigned(ipArquivoThumbnail) then
        begin
          if not Assigned(FArquivoThumbnail) then
            FArquivoThumbnail := TBytesStream.Create;

          FArquivoThumbnail.Clear;
          FArquivoThumbnail.LoadFromStream(ipArquivoThumbnail);
        end
      else
        begin
          if Assigned(FArquivoThumbnail) then
            FreeAndNil(FArquivoThumbnail);
        end;

      FTamanhoOriginal := ipTamanhoOriginal;

      if ipNome = '' then
        FNome := ExtractFileName(ipArquivo.FileName)
      else
        FNome := ipNome;
    end
  else
    begin
      if Assigned(FArquivo) then
        FreeAndNil(FArquivo);

      if Assigned(FArquivoThumbnail) then
        FreeAndNil(FArquivoThumbnail);

      FNome := '';
      FTamanhoOriginal := 0;
    end;
end;

procedure TChatAnexo.ppuCopiarDe(const ipOrigem: TChatAnexo);
begin
  if Assigned(ipOrigem) then
    begin
      if Assigned(ipOrigem.FArquivo) then
        begin
          if Assigned(FArquivo) then
            FArquivo.Clear
          else
            FArquivo := TBytesStream.Create;

         ipOrigem.FArquivo.Position := 0;
         FArquivo.Position := 0;
         FArquivo.CopyFrom(ipOrigem.FArquivo, ipOrigem.FArquivo.Size);
         FArquivo.Position := 0;
         ipOrigem.FArquivo.Position := 0;
        end
      else
        begin
          if Assigned(FArquivo) then
            FreeAndNil(FArquivo);
        end;

      if Assigned(ipOrigem.FArquivoThumbnail) then
        begin
          if Assigned(FArquivoThumbnail) then
            FArquivoThumbnail.Clear
          else
            FArquivoThumbnail := TBytesStream.Create;

         ipOrigem.FArquivoThumbnail.Position := 0;
         FArquivoThumbnail.Position := 0;
         FArquivoThumbnail.CopyFrom(ipOrigem.FArquivoThumbnail, ipOrigem.FArquivoThumbnail.Size);
         FArquivoThumbnail.Position := 0;
         ipOrigem.FArquivoThumbnail.Position := 0;
        end
      else
        begin
          if Assigned(FArquivoThumbnail) then
            FreeAndNil(FArquivoThumbnail);
        end;

      FEndereco := ipOrigem.FEndereco;
      FId := ipOrigem.FId;
      FNome := ipOrigem.FNome;
      FTamanhoOriginal := ipOrigem.FTamanhoOriginal;
    end;
end;

procedure TChatAnexo.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

{ TChatMensagem }

constructor TChatMensagem.Create;
begin
  FAnexos := nil;
  FAnexosLimite := 0;
  FAnexosNextId := 1;
  FAoAtingirLimiteAnexos := nil;
  FDestinatario.CodigoHospital := 0;
  FDestinatario.CodigoUsuario := 0;
  FMensagemRVF := nil;
  FRemetente.CodigoHospital := 0;
  FRemetente.CodigoUsuario := 0;
  FTipoMensagem := 0;
end;

destructor TChatMensagem.Destroy;
var
  i: Integer;
  vaChatAnexo: TChatAnexo;
begin
  if Assigned(FMensagemRVF) then
    FreeAndNil(FMensagemRVF);

  if Assigned(FAnexos) then
    begin
      for i := 0 to FAnexos.Count - 1 do
        begin
          vaChatAnexo := FAnexos.Items[i];

          if Assigned(vaChatAnexo) then
            FreeAndNil(vaChatAnexo);
        end;

      FreeAndNil(FAnexos);
    end;

  inherited Destroy;
end;

function TChatMensagem.fpuAnexarArquivos(const ipArquivos: TStrings): TArray<TChatAnexoPropriedades>;
  function ExtractTempDir: String;
  var
    vaBuffer : array[0..144] of Char;
  begin
    GetTempPath(144, vaBuffer);
    Result := IncludeTrailingPathDelimiter(StrPas(vaBuffer));
  end;

  function CompactarArquivo(ipArquivo, ipPastaDestino: string): string;
  var
    vaZip: TZipFile;
    vaNomeArquivo, vaDestino: string;
  begin
    vaZip := TZipFile.Create;

    try
      vaNomeArquivo := Copy(ExtractFileName(ipArquivo), 1, Pos(ExtractFileExt(ipArquivo), ExtractFileName(ipArquivo)) - 1) + '.zip';
      vaDestino := IncludeTrailingPathDelimiter(ipPastaDestino) + vaNomeArquivo;
      vaZip.Open(vaDestino, zmWrite); // Local e nome do arquivo compactado
      vaZip.Add(ipArquivo); // Compactando o arquivo
    finally
      FreeAndNil(vaZip);
    end;

    Result := vaDestino;
  end;

var
  vaPastaTemp, vaArquivo, vaArquivoCompactado, vaNomeArquivo: string;
  i, vaNewHeight, vaOldHeight, vaNewWidth, vaOldWidth: Integer;
  vaTamanhoOriginal: Int64;
  vaArquivoFileStream: TFileStream;
  vaThumbanilBytesStream: TBytesStream;
  vaAnexo: TChatAnexo;
  vaAnexosRecusados: TStringList;
  vadxSmartImage: TdxSmartImage;
  vaBitmap, vaBitmapThumbnail: TBitmap;
  vaJPEGImage: TJPEGImage;
begin
  SetLength(Result, 0);
  vaAnexosRecusados := TStringList.Create;

  if Assigned(ipArquivos) then
    begin
      if not Assigned(FAnexos) then
        FAnexos := TList<TChatAnexo>.Create;

      // Pegando a pasta tempor�ria do Windows
      vaPastaTemp := ExtractTempDir + 'ProMedicoArquivosTemp';

      // Se n�o existir, ent�o cria a pasa ProMedicoArquivosTemp dentro da pasta tempor�ria do Windows
      if not DirectoryExists(vaPastaTemp) then
        CreateDir(vaPastaTemp);

      vaArquivoFileStream := nil;
      vaThumbanilBytesStream := nil;
      vaBitmap := nil;
      vaBitmapThumbnail := nil;
      vaJPEGImage := nil;

      try
        for vaArquivo in ipArquivos do
          begin
            if FileExists(vaArquivo) then
              begin
                vaTamanhoOriginal := 0;
                vaNomeArquivo := '';

                // Abrindo o arquivo, somente leitura, para pegar o tamanho e a exten��o do arquivo antes da compacta��o
                try
                  vaArquivoFileStream := TFileStream.Create(vaArquivo, fmOpenRead);
                  vaTamanhoOriginal := vaArquivoFileStream.Size;
                  vaNomeArquivo := ExtractFileName(vaArquivo);
                finally
                  FreeAndNil(vaArquivoFileStream);
                end;

                try
                  try
                    try
                      // Criando um thumbnail do arquivo.
                      // Se a imagem possuir altura ou largura maior do que 100 pixels, ela ser� reduzida.
                      // Todo thumbnail ser� do tipo jpg.

                      vadxSmartImage := TdxSmartImage.Create;
                      vadxSmartImage.LoadFromFile(vaArquivo); // Se ocorrer erro na leitura do arquivo � porque n�o � uma imagem, nesse caso o thumbnail ser� nil
                      vaBitmap := vadxSmartImage.GetAsBitmap;
                      vaBitmapThumbnail := TBitmap.Create;

                      if (vaBitmap.Height > 100) or (vaBitmap.Width > 100) then
                        begin
                          vaOldHeight := vaBitmap.Height;
                          vaOldWidth := vaBitmap.Width;

                          if vaOldHeight >= vaOldWidth then
                            begin
                              vaNewHeight := 100;

                              if vaOldHeight = vaOldWidth then
                                vaNewWidth := vaNewHeight
                              else
                                vaNewWidth := Trunc(SimpleRoundTo(100 / vaOldHeight * vaOldWidth, 0));
                            end
                          else
                            begin
                              vaNewHeight := Trunc(SimpleRoundTo(100 / vaOldWidth * vaOldHeight, 0));
                              vaNewWidth := 100;
                            end;

                          vaBitmapThumbnail.Height := vaNewHeight;
                          vaBitmapThumbnail.Width := vaNewWidth;
                        end;

                      vaBitmapThumbnail.Canvas.StretchDraw(vaBitmapThumbnail.Canvas.ClipRect, vaBitmap);
                      vaJPEGImage := TJPEGImage.Create;
                      vaJPEGImage.Assign(vaBitmapThumbnail);
                      vaThumbanilBytesStream := TBytesStream.Create; // N�o destruir esta vari�vel neste "try", pois ela ser� utilizada logo abaixo na fun��o ppuAnexarArquivo
                      vaJPEGImage.SaveToStream(vaThumbanilBytesStream);
                    except
                      on E: Exception do
                        begin
                          if Assigned(vaThumbanilBytesStream) then
                            FreeAndNil(vaThumbanilBytesStream);
                        end;
                    end;
                  finally
                    if Assigned(vadxSmartImage) then
                      FreeAndNil(vadxSmartImage);

                    if Assigned(vaBitmap) then
                      FreeAndNil(vaBitmap);

                    if Assigned(vaBitmapThumbnail) then
                      FreeAndNil(vaBitmapThumbnail);

                    if Assigned(vaJPEGImage) then
                      FreeAndNil(vaJPEGImage);
                  end;

                  // Compactando o arquivo
                  vaArquivoCompactado := CompactarArquivo(vaArquivo, vaPastaTemp);

                  // Abrindo o arquivo compactado
                  vaArquivoFileStream := TFileStream.Create(vaArquivoCompactado, fmOpenRead);

                  // Verificando se h� espa�o suficiente para anexar o arquivo
                  if (FAnexosLimite >= (AnexosTotal + vaArquivoFileStream.Size)) or (FAnexosLimite <= 0) then
                    begin
                      // Anexando o arquivo
                      vaAnexo := TChatAnexo.Create;
                      vaAnexo.ppuAnexarArquivo(vaArquivoFileStream, vaThumbanilBytesStream, vaNomeArquivo, vaTamanhoOriginal);

                      // Adicionando um identificador e adicionando o anexo na lista de anexos
                      vaAnexo.FId := FAnexosNextId;
                      Inc(FAnexosNextId);
                      FAnexos.Add(vaAnexo);

                      // Adicionando as informa��es do arquivo no array de retorno
                      i := Length(Result);
                      SetLength(Result, i + 1);
                      Result[i] := vaAnexo.Propriedades;
                    end
                  else
                    // Arquivo n�o anexado
                    vaAnexosRecusados.Add(vaArquivo);
                finally
                  if Assigned(vaArquivoFileStream) then
                    FreeAndNil(vaArquivoFileStream);

                  if Assigned(vaThumbanilBytesStream) then
                    FreeAndNil(vaThumbanilBytesStream);
                end;

                if FileExists(vaArquivoCompactado) then
                  DeleteFile(PChar(vaArquivoCompactado));
              end;
          end;
      finally
        if FAnexos.Count = 0 then
          FreeAndNil(FAnexos);
      end;
    end;

  // Se atingiu o limite, ent�o vamos disparar o evento de limite atingido
  try
    if Assigned(FAoAtingirLimiteAnexos) and (vaAnexosRecusados.Count > 0) then
      FAoAtingirLimiteAnexos(vaAnexosRecusados);
  finally
    FreeAndNil(vaAnexosRecusados);
  end;
end;

function TChatMensagem.fpuDeletarAnexo(const ipId: Integer): Boolean;
var
  i: Integer;
  vaAnexo: TChatAnexo;
begin
  Result := False;
  i := fpvRetornaIndiceAnexo(ipId);

  if i >= 0 then
    begin
      vaAnexo := FAnexos.Items[i];
      FreeAndNil(vaAnexo);
      FAnexos.Delete(i);
      Result := True;
    end;
end;

function TChatMensagem.fpuPropriedadeAnexo(
  const ipId: Integer): TChatAnexoPropriedades;
var
  i: Integer;
begin
  Result.FExtencao := '';
  Result.FId := 0;
  Result.FNome := '';
  Result.FTamanho := 0;
  Result.FTamanhoFormatado := '0B';
  i := fpvRetornaIndiceAnexo(ipId);

  if i >= 0 then
    Result := FAnexos.Items[i].Propriedades;
end;

function TChatMensagem.fpvRetornaIndiceAnexo(const ipId: Integer): Integer;
var
  i: Integer;
begin
  Result := -1;

  if Assigned(FAnexos) then
    begin
      i := 0;

      while (i < FAnexos.Count) and (Result = -1) do
        begin
          if Assigned(FAnexos.Items[i]) and (FAnexos.Items[i].Id = ipId) then
            Result := i;

          Inc(i);
        end;
    end;
end;

function TChatMensagem.fpvRetornaStreamFormatado(
  const ipFormato: TChatFormatoStream): TBytesStream;
var
  vaRvEdit: TRichViewEdit;
  vaRvStyle: TRVStyle;
begin
  Result := nil;
  vaRvEdit := nil;
  vaRvStyle := nil;

  try
    if Assigned(FMensagemRVF) then
      begin
        if (ipFormato in [ftHtml, ftTxt]) then
          Result := TStringStream.Create
        else
          Result := TBytesStream.Create;

        FMensagemRVF.Position := 0;

        if ipFormato <> ftRvf then
          begin
            vaRvStyle := TRVStyle.Create(nil);

            vaRvEdit := TRichViewEdit.Create(nil);
            vaRvEdit.Style := vaRvStyle;
            vaRvEdit.Clear;
            vaRvEdit.LoadRVFFromStream(FMensagemRVF);
            vaRvEdit.Change;
          end;

        case ipFormato of
          ftDocx: vaRvEdit.SaveDocXToStream(Result, False);
          ftHtml: vaRvEdit.SaveHTMLToStream(Result, '', '', '', []);
          ftRtf: vaRvEdit.SaveRTFToStream(Result, False);
          ftRvf: Result.LoadFromStream(FMensagemRVF);
          ftTxt: vaRvEdit.SaveTextToStream('', Result, 0, False, True);
        end;
      end;
  finally
    if Assigned(vaRvEdit) then
      FreeAndNil(vaRvEdit);

    if Assigned(vaRvStyle) then
      FreeAndNil(vaRvStyle);
  end;
end;

function TChatMensagem.fpvRetornaString(
  const ipFormato: TChatFormatoStream): string;
var
  vaStringStream: TStringStream;
begin
  Result := '';

  try
    if ipFormato = ftHtml then
      vaStringStream := TStringStream(fpvRetornaStreamFormatado(ftHtml))
    else
      vaStringStream := TStringStream(fpvRetornaStreamFormatado(ftTxt));

    if Assigned(vaStringStream) then
      begin
        vaStringStream.Position := 0;
        Result := vaStringStream.ReadString(vaStringStream.Size);
      end;
  finally
    if Assigned(vaStringStream) then
      FreeAndNil(vaStringStream);
  end;
end;

function TChatMensagem.GetAnexosPropriedades: TArray<TChatAnexoPropriedades>;
var
  i: Integer;
begin
  SetLength(Result, 0);

  if Assigned(FAnexos) then
    begin
      SetLength(Result, FAnexos.Count);

      for i := 0 to FAnexos.Count - 1 do
        Result[i] := FAnexos.Items[i].Propriedades;
    end;
end;

function TChatMensagem.GetAnexosQtde: Integer;
begin
  Result := 0;

  if Assigned(FAnexos) then
    Result := FAnexos.Count;
end;

function TChatMensagem.GetAnexosTotal: Int64;
var
  i: Integer;
begin
  Result := 0;

  if Assigned(FAnexos) then
    begin
      for i := 0 to FAnexos.Count - 1 do
        Result := Result + FAnexos.Items[i].Tamanho;
    end;
end;

function TChatMensagem.GetMensagemDOCX: TBytesStream;
begin
  Result := fpvRetornaStreamFormatado(ftDocx);
end;

function TChatMensagem.GetMensagemHTML: string;
begin
  Result := fpvRetornaString(ftHtml);
end;

function TChatMensagem.GetMensagemRTF: TBytesStream;
begin
  Result := fpvRetornaStreamFormatado(ftRtf);
end;

function TChatMensagem.GetMensagemRVF: TBytesStream;
begin
  Result := fpvRetornaStreamFormatado(ftRvf);
end;

function TChatMensagem.GetMensagemTXT: string;
begin
  Result := fpvRetornaString(ftTxt);
end;

procedure TChatMensagem.ppuCopiarDe(const ipOrigem: TChatMensagem);
var
  i: Integer;
  vaChatAnexo: TChatAnexo;
begin
  if Assigned(ipOrigem) then
    begin
      ppuLimparAnexos;
      ppuLimparMensagem;

      if Assigned(ipOrigem.FAnexos) then
        begin
          FAnexos := TList<TChatAnexo>.Create;

          for i := 0 to ipOrigem.FAnexos.Count - 1 do
            begin
              vaChatAnexo := TChatAnexo.Create;
              vaChatAnexo.ppuCopiarDe(ipOrigem.FAnexos.Items[i]);
              FAnexos.Add(vaChatAnexo);
            end;
        end;

      FAnexosLimite := ipOrigem.FAnexosLimite;
      FAnexosNextId := ipOrigem.FAnexosNextId;
      FAoAtingirLimiteAnexos := ipOrigem.FAoAtingirLimiteAnexos;
      FDestinatario.ppuCopiarDe(ipOrigem.Destinatario);

      if Assigned(ipOrigem.FMensagemRVF) then
        begin
          FMensagemRVF := TBytesStream.Create;
          ipOrigem.FMensagemRVF.Position := 0;
          FMensagemRVF.Position := 0;
          FMensagemRVF.CopyFrom(ipOrigem.FMensagemRVF, ipOrigem.FMensagemRVF.Size);
          FMensagemRVF.Position := 0;
          ipOrigem.FMensagemRVF.Position := 0;
        end;

      FRemetente.ppuCopiarDe(ipOrigem.Remetente);
      FTipoMensagem := ipOrigem.FTipoMensagem;
    end;
end;

procedure TChatMensagem.ppuLimparAnexos;
var
  vaAnexo: TChatAnexo;
  i: Integer;
begin
  if Assigned(FAnexos) then
    begin
      for i := 0 to FAnexos.Count - 1 do
        begin
          vaAnexo := FAnexos.Items[i];

          if Assigned(vaAnexo) then
            FreeAndNil(vaAnexo);
        end;

      FreeAndNil(FAnexos);
    end;
end;

procedure TChatMensagem.ppuLimparMensagem;
begin
  if Assigned(FMensagemRVF) then
    FreeAndNil(FMensagemRVF);
end;

procedure TChatMensagem.ppvCarrearStream(const ipFormato: TChatFormatoStream;
  const ipBytesStream: TBytesStream);
var
  vaRvEdit: TRichViewEdit;
  vaRvStyle: TRVStyle;
begin
  vaRvEdit := nil;
  vaRvStyle := nil;

  try
    if not Assigned(ipBytesStream) then
      begin
        if Assigned(FMensagemRVF) then
          FreeAndNil(FMensagemRVF);
      end
    else
      begin
        if Assigned(FMensagemRVF) then
          FMensagemRVF.Clear
        else
          FMensagemRVF := TBytesStream.Create;

        ipBytesStream.Position := 0;

        if ipFormato = ftRvf then
          FMensagemRVF.LoadFromStream(ipBytesStream)
        else
          begin
            vaRvStyle := TRVStyle.Create(nil);

            vaRvEdit := TRichViewEdit.Create(nil);
            vaRvEdit.Style := vaRvStyle;
            vaRvEdit.Clear;

            case ipFormato of
              ftRtf: vaRvEdit.LoadRTFFromStream(ipBytesStream);
              ftTxt: vaRvEdit.LoadTextFromStream(ipBytesStream, 0, 0, True);
            end;

            vaRvEdit.Change;
            vaRvEdit.SaveRVFToStream(FMensagemRVF, False);
          end;
      end;
  finally
    if Assigned(vaRvEdit) then
      FreeAndNil(vaRvEdit);

    if Assigned(vaRvStyle) then
      FreeAndNil(vaRvStyle);
  end;
end;

procedure TChatMensagem.SetAnexosLimite(const Value: Int64);
begin
  if Value < 0 then
    FAnexosLimite := 0
  else
    FAnexosLimite := Value;
end;

procedure TChatMensagem.SetAoAtingirLimiteAnexos(
  const Value: TChatAnexoLimiteAtingido);
begin
  FAoAtingirLimiteAnexos := Value;
end;

procedure TChatMensagem.SetDestinatario(const Value: TChatIdentificacaoUsuario);
begin
  FDestinatario.ppuCopiarDe(Value);
end;

procedure TChatMensagem.SetMensagemRTF(const Value: TBytesStream);
begin
  ppvCarrearStream(ftRtf, Value);
end;

procedure TChatMensagem.SetMensagemRVF(const Value: TBytesStream);
begin
  ppvCarrearStream(ftRvf, Value);
end;

procedure TChatMensagem.SetMensagemTXT(const Value: string);
var
  vaStringStream: TStringStream;
begin
  if Value = '' then
    begin
      if Assigned(FMensagemRVF) then
        FreeAndNil(FMensagemRVF);
    end
  else
    begin
      vaStringStream := TStringStream.Create(Value);

      try
        ppvCarrearStream(ftTxt, vaStringStream);
      finally
        if Assigned(vaStringStream) then
          FreeAndNil(vaStringStream);
      end;
    end;
end;

procedure TChatMensagem.SetRemetente(const Value: TChatIdentificacaoUsuario);
begin
  FRemetente.ppuCopiarDe(Value);
end;

procedure TChatMensagem.SetTipoMensagem(const Value: Integer);
begin
  FTipoMensagem := Value;
end;

{ TChatUsuario }

constructor TChatUsuario.Create;
begin
  FIdentificacaoUsuario.CodigoUsuario := 0;
  FIdentificacaoUsuario.CodigoHospital := 0;
  FEMail := '';
  FFoto := nil;
  FFotoThumbnail := nil;
  FFuncao := '';
  SetLength(FGrupoUsuarios, 0);
  FNome := '';
  FPromedico := 0;
  FStatus := 0;
  FUsuarioGrupo := 0;
end;

destructor TChatUsuario.Destroy;
begin
  if Assigned(FFoto) then
    FreeAndNil(FFoto);

  if Assigned(FFotoThumbnail) then
    FreeAndNil(FFotoThumbnail);

  inherited;
end;

procedure TChatUsuario.ppuCopiarDe(const ipOrigem: TChatUsuario);
var
  i: Integer;
begin
  FAtivoInativo := ipOrigem.FAtivoInativo;
  FEMail := ipOrigem.FEMail;

  if Assigned(ipOrigem.FFoto) then
    begin
      if not Assigned(FFoto) then
        FFoto := TPicture.Create;

      FFoto.Assign(ipOrigem.FFoto);
    end
  else
    begin
      if Assigned(FFoto) then
        FreeAndNil(FFoto);
    end;

  if Assigned(ipOrigem.FFotoThumbnail) then
    begin
      if not Assigned(FFotoThumbnail) then
        FFotoThumbnail := TPicture.Create;

      FFotoThumbnail.Assign(ipOrigem.FFotoThumbnail);
    end
  else
    begin
      if Assigned(FFotoThumbnail) then
        FreeAndNil(FFotoThumbnail);
    end;

  FFuncao := ipOrigem.FFuncao;

  SetLength(FGrupoUsuarios, Length(ipOrigem.FGrupoUsuarios));

  for i := Low(ipOrigem.FGrupoUsuarios) to High(ipOrigem.FGrupoUsuarios) do
    FGrupoUsuarios[i] := ipOrigem.FGrupoUsuarios[i];

  FIdentificacaoUsuario.ppuCopiarDe(ipOrigem.FIdentificacaoUsuario);
  FNome := ipOrigem.FNome;
  FPromedico := ipOrigem.FPromedico;
  FStatus := ipOrigem.FStatus;
  FUsuarioGrupo := ipOrigem.FUsuarioGrupo;
end;

procedure TChatUsuario.SetAtivoInativo(const Value: Integer);
begin
  FAtivoInativo := Value;
end;

procedure TChatUsuario.SetEMail(const Value: string);
begin
  FEMail := Value;
end;

procedure TChatUsuario.SetFoto(const Value: TPicture);
begin
  if Assigned(Value) then
    begin
      if not Assigned(FFoto) then
        FFoto := TPicture.Create;

      FFoto.Assign(Value);
    end
  else
    begin
      if Assigned(FFoto) then
        FreeAndNil(FFoto);
    end;
end;

procedure TChatUsuario.SetFotoThumbnail(const Value: TPicture);
begin
  if Assigned(Value) then
    begin
      if not Assigned(FFotoThumbnail) then
        FFotoThumbnail := TPicture.Create;

      FFotoThumbnail.Assign(Value);
    end
  else
    begin
      if Assigned(FFotoThumbnail) then
        FreeAndNil(FFotoThumbnail);
    end;
end;

procedure TChatUsuario.SetFuncao(const Value: string);
begin
  FFuncao := Value;
end;

procedure TChatUsuario.SetGrupoUsuarios(const Value: TArray<Integer>);
var
  i: Integer;
begin
  SetLength(FGrupoUsuarios, Length(Value));

  for i := Low(Value) to High(Value) do
    FGrupoUsuarios[i] := Value[i];
end;

procedure TChatUsuario.SetIdentificacaoUsuario(
  const Value: TChatIdentificacaoUsuario);
begin
  FIdentificacaoUsuario.ppuCopiarDe(Value);
end;

procedure TChatUsuario.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TChatUsuario.SetPromedico(const Value: Integer);
begin
  FPromedico := Value;
end;

procedure TChatUsuario.SetStatus(const Value: Integer);
begin
  FStatus := Value;
end;

procedure TChatUsuario.SetUsuarioGrupo(const Value: Integer);
begin
  FUsuarioGrupo := Value;
end;

{ TChatStatus }

procedure TChatStatus.ppuCopiarDe(const ipOrigem: TChatStatus);
begin
  FIdentificacaoUsuario.ppuCopiarDe(ipOrigem.FIdentificacaoUsuario);
  FStatus := ipOrigem.FStatus;
end;

procedure TChatStatus.SetIdentificacaoUsuario(
  const Value: TChatIdentificacaoUsuario);
begin
  FIdentificacaoUsuario.ppuCopiarDe(Value);
end;

procedure TChatStatus.SetStatus(const Value: Integer);
begin
  FStatus := Value;
end;

{ TChatHospital }

procedure TChatHospital.ppuCopiarDe(const ipOrigem: TChatHospital);
begin
  FCodigo := ipOrigem.FCodigo;
  FNomeFantasia := ipOrigem.FNomeFantasia;
  FRazaoSocial := ipOrigem.FRazaoSocial;
end;

procedure TChatHospital.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TChatHospital.SetNomeFantasia(const Value: string);
begin
  FNomeFantasia := Value;
end;

procedure TChatHospital.SetRazaoSocial(const Value: string);
begin
  FRazaoSocial := Value;
end;

{ TChatIdentificacaoUsuario }

procedure TChatIdentificacaoUsuario.ppuCopiarDe(
  const ipOrigem: TChatIdentificacaoUsuario);
begin
  FCodigoUsuario := ipOrigem.FCodigoUsuario;
  FCodigoHospital := ipOrigem.FCodigoHospital;
end;

procedure TChatIdentificacaoUsuario.SetCodigoHospital(const Value: Integer);
begin
  FCodigoHospital := Value;
end;

procedure TChatIdentificacaoUsuario.SetCodigoUsuario(const Value: Integer);
begin
  FCodigoUsuario := Value;
end;

{ TChatUsuarioLogado }

procedure TChatUsuarioLogado.ppuCopiarDe(const ipOrigem: TChatUsuarioLogado);
begin
  FEnviaMensagemGrupoTodos := ipOrigem.FEnviaMensagemGrupoTodos;
  FIdentificacaoUsuario.ppuCopiarDe(ipOrigem.FIdentificacaoUsuario);
end;

procedure TChatUsuarioLogado.SetEnviaMensagemGrupoTodos(const Value: Boolean);
begin
  FEnviaMensagemGrupoTodos := Value;
end;

procedure TChatUsuarioLogado.SetIdentificacaoUsuario(
  const Value: TChatIdentificacaoUsuario);
begin
  FIdentificacaoUsuario.ppuCopiarDe(Value);
end;

{ TChatConfiguracoes }

constructor TChatConfiguracoes.Create;
begin
  FEMail := '';
  FFonteNome := 'Calibri';
  FFonteTamanho := 11;
  FFoto := nil;
  FNovasMensagensApenasAlerta := 0;
  FPermitirAlterarAlertaMensagens := False;
  FTelefone := '';
end;

procedure TChatConfiguracoes.ppuCopiarDe(const ipOrigem: TChatConfiguracoes);
begin
  FEMail := ipOrigem.FEMail;
  FFonteNome := ipOrigem.FFonteNome;
  FFonteTamanho := ipOrigem.FFonteTamanho;

  if Assigned(ipOrigem.FFoto) then
    begin
      if not Assigned(FFoto) then
        FFoto := TPicture.Create;

      FFoto.Assign(ipOrigem.FFoto);
    end
  else
    begin
      if Assigned(FFoto) then
        FreeAndNil(FFoto);
    end;

  FNovasMensagensApenasAlerta := ipOrigem.FNovasMensagensApenasAlerta;
  FPermitirAlterarAlertaMensagens := ipOrigem.FPermitirAlterarAlertaMensagens;
  FTelefone := ipOrigem.FTelefone;
end;

procedure TChatConfiguracoes.SetEMail(const Value: string);
begin
  FEMail := Value;
end;

procedure TChatConfiguracoes.SetFonteNome(const Value: string);
begin
  FFonteNome := Value;
end;

procedure TChatConfiguracoes.SetFonteTamanho(const Value: Integer);
begin
  FFonteTamanho := Value;
end;

procedure TChatConfiguracoes.SetFoto(const Value: TPicture);
begin
  if Assigned(Value) then
    begin
      if not Assigned(FFoto) then
        FFoto := TPicture.Create;

      FFoto.Assign(Value);
    end
  else
    begin
      if Assigned(FFoto) then
        FreeAndNil(FFoto);
    end;
end;

procedure TChatConfiguracoes.SetNovasMensagensApenasAlerta(
  const Value: Integer);
begin
  FNovasMensagensApenasAlerta := Value;
end;

procedure TChatConfiguracoes.SetPermitirAlterarAlertaMensagens(
  const Value: Boolean);
begin
  FPermitirAlterarAlertaMensagens := Value;
end;

procedure TChatConfiguracoes.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

{ TChatConversa }

procedure TChatConversa.ppuCopiarDe(const ipOrigem: TChatConversa);
begin
  FIdentificacaoUsuario.ppuCopiarDe(ipOrigem.FIdentificacaoUsuario);
  FNotificar := ipOrigem.FNotificar;
  FSelecionar := ipOrigem.FSelecionar;
end;

procedure TChatConversa.SetIdentificacaoUsuario(
  const Value: TChatIdentificacaoUsuario);
begin
  FIdentificacaoUsuario.ppuCopiarDe(Value);
end;

procedure TChatConversa.SetNotificar(const Value: Boolean);
begin
  FNotificar := Value;
end;

procedure TChatConversa.SetSelecionar(const Value: Boolean);
begin
  FSelecionar := Value;
end;

{ TChatDadosConversa }

procedure TChatDadosConversa.ppuCopiarDe(const ipOrigem: TChatDadosConversa);
begin
  FAnexos := ipOrigem.FAnexos;
  FMensagens := ipOrigem.FMensagens;
  FPosicaoScroll := ipOrigem.FPosicaoScroll;
end;

procedure TChatDadosConversa.SetAnexos(const Value: OleVariant);
begin
  FAnexos := Value;
end;

procedure TChatDadosConversa.SetMensagens(const Value: OleVariant);
begin
  FMensagens := Value;
end;

procedure TChatDadosConversa.SetPosicaoScroll(const Value: Integer);
begin
  FPosicaoScroll := Value;
end;

{ TChatDadosPesquisa }

constructor TChatDadosPesquisa.Create;
begin
  FDadosConversa.Anexos := null;
  FDadosConversa.Mensagens := null;
  FDadosConversa.PosicaoScroll := 0;
  FDataInicial := 0;
  FDataFinal := 0;
  FFotoUsuario := nil;
  FIdentificador := '';
  FNomeHospital := '';
  FNomeFuncao := '';
  FNomeUsuario := '';
  FPesquisarData := False;
  FTexto := '';
end;

destructor TChatDadosPesquisa.Destroy;
begin
  if Assigned(FFotoUsuario) then
    FreeAndNil(FFotoUsuario);

  inherited;
end;

procedure TChatDadosPesquisa.ppuCopiarDe(const ipOrigem: TChatDadosPesquisa);
begin
  FDadosConversa.ppuCopiarDe(ipOrigem.FDadosConversa);
  FDataInicial := ipOrigem.FDataInicial;
  FDataFinal := ipOrigem.FDataFinal;

  if Assigned(ipOrigem.FFotoUsuario) then
    begin
      if not Assigned(FFotoUsuario) then
        FFotoUsuario := TPicture.Create;

      FFotoUsuario.Assign(ipOrigem.FFotoUsuario);
    end
  else
    begin
      if Assigned(FFotoUsuario) then
        FreeAndNil(FFotoUsuario);
    end;

  FIdentificador := ipOrigem.FIdentificador;
  FNomeHospital := ipOrigem.FNomeHospital;
  FNomeFuncao := ipOrigem.FNomeFuncao;
  FNomeUsuario := ipOrigem.FNomeUsuario;
  FPesquisarData := ipOrigem.FPesquisarData;
  FTexto := ipOrigem.FTexto;
end;

procedure TChatDadosPesquisa.SetDadosConversa(const Value: TChatDadosConversa);
begin
  FDadosConversa.ppuCopiarDe(Value);
end;

procedure TChatDadosPesquisa.SetDataFinal(const Value: TDate);
begin
  FDataFinal := Value;
end;

procedure TChatDadosPesquisa.SetDataInicial(const Value: TDate);
begin
  FDataInicial := Value;
end;

procedure TChatDadosPesquisa.SetFotoUsuario(const Value: TPicture);
begin
  if Assigned(Value) then
    begin
      if not Assigned(FFotoUsuario) then
        FFotoUsuario := TPicture.Create;

      FFotoUsuario.Assign(Value);
    end
  else
    begin
      if Assigned(FFotoUsuario) then
        FreeAndNil(FFotoUsuario);
    end;
end;

procedure TChatDadosPesquisa.SetIdentificador(const Value: string);
begin
  FIdentificador := Value;
end;

procedure TChatDadosPesquisa.SetNomeFuncao(const Value: string);
begin
  FNomeFuncao := Value;
end;

procedure TChatDadosPesquisa.SetNomeHospital(const Value: string);
begin
  FNomeHospital := Value;
end;

procedure TChatDadosPesquisa.SetNomeUsuario(const Value: string);
begin
  FNomeUsuario := Value;
end;

procedure TChatDadosPesquisa.SetPesquisarData(const Value: Boolean);
begin
  FPesquisarData := Value;
end;

procedure TChatDadosPesquisa.SetTexto(const Value: String);
begin
  FTexto := Value;
end;

{ TChatAnexoPropriedades }

procedure TChatAnexoPropriedades.ppuCopiarDe(
  const ipOrigem: TChatAnexoPropriedades);
begin
  FExtencao := ipOrigem.FExtencao;
  FId := ipOrigem.FId;
  FNome := ipOrigem.FNome;
  FTamanho := ipOrigem.FTamanho;
  FTamanhoFormatado := ipOrigem.FTamanhoFormatado;
  FTamanhoOriginal := ipOrigem.FTamanhoOriginal;
  FTamanhoOriginalFtd := ipOrigem.FTamanhoOriginalFtd;
end;

{ TChatDadosUsuario }

constructor TChatDadosUsuario.Create;
begin
  FFotoUsuario := nil;
  FIdentificacao.CodigoUsuario := 0;
  FIdentificacao.CodigoUsuario := 0;
  FNome := '';
end;

destructor TChatDadosUsuario.Destroy;
begin
  if Assigned(FFotoUsuario) then
    FreeAndNil(FFotoUsuario);

  inherited;
end;

procedure TChatDadosUsuario.ppuCopiarDe(const ipOrigem: TChatDadosUsuario);
begin
  if Assigned(ipOrigem.FotoUsuario) then
    begin
      if not Assigned(FFotoUsuario) then
        FFotoUsuario := TPicture.Create;

      FFotoUsuario.Assign(ipOrigem.FFotoUsuario);
    end
  else
    begin
      if Assigned(FFotoUsuario) then
        FreeAndNil(FFotoUsuario);
    end;

  FIdentificacao.ppuCopiarDe(ipOrigem.FIdentificacao);
  FNome := ipOrigem.FNome;
end;

procedure TChatDadosUsuario.SetFotoUsuario(const Value: TPicture);
begin
  if Assigned(Value) then
    begin
      if not Assigned(FFotoUsuario) then
        FFotoUsuario := TPicture.Create;

      FFotoUsuario.Assign(Value);
    end
  else
    begin
      if Assigned(FFotoUsuario) then
        FreeAndNil(FFotoUsuario);
    end;
end;

procedure TChatDadosUsuario.SetIdentificacao(
  const Value: TChatIdentificacaoUsuario);
begin
  FIdentificacao.ppuCopiarDe(Value);
end;

procedure TChatDadosUsuario.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
