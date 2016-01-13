unit pEnviarEmail;

interface

uses
  Classes, IdMessage, IdSMTP, IdText, SysUtils, IdAttachmentMemory, IdSSLOpenSSL,
  IdEMailAddress, IdGlobal, IdExplicitTLSClientServerBase, pMethod2009, ShellApi,
  IdSASLLogin, IdSASLAnonymous, IdSASLDigest, IdSASLExternal, IdSASLOTP,
  IdSASLPlain, IdSASLSKey, IdUserPassProvider, IdSASL_CRAM_MD5, IdSASL_CRAM_SHA1,
  System.RegularExpressions, Vcl.Dialogs,

  IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdBaseComponent, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSMTPBase, AdvSmartMessageBox;

type
  TTipoAutenticacao = IdSMTP.TIdSMTPAuthenticationType;
  TVersaoSSL = IdSSLOpenSSL.TIdSSLVersion;
  TModoSSL = IdSSLOpenSSL.TIdSSLMode;
  TUseTLS = TIdUseTLS;
  TStatusInfo = procedure(const ipMensagem: string) of object;
  TFormatMensagem = reference to procedure (var opMensagem:String);

  // Classe para definir como os arquivos, que serão anexados ao e-mail, serão organizados
  TAnexoItem = class(TCollectionItem)
  private
    FNomeArquivo: string;
    FArquivo: TMemoryStream;
    FLocalArquivo: string;
    procedure SetArquivo(const Value: TMemoryStream);
    procedure SetNomeArquivo(const Value: string);
    procedure SetLocalArquivo(const Value: string);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property Arquivo: TMemoryStream read FArquivo write SetArquivo;
    property NomeArquivo: string read FNomeArquivo write SetNomeArquivo;
    property LocalArquivo: string read FLocalArquivo write SetLocalArquivo;
  end;

  // Classe que armazena os arquivos a serem anexados ao e-mail
  TAnexoCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TAnexoItem;
    procedure SetItem(Index: Integer; Value: TAnexoItem);
  public
    constructor Create;
    function Add: TAnexoItem;
    function Insert(Index: Integer): TAnexoItem;
    property Items[Index: Integer]: TAnexoItem read GetItem write SetItem;
  end;

  // Classe para definir como os endereços de e-mail serão organizados
  TEnderecoEMail = class
  private
    FEMail: string;
    FNome: string;
    procedure SetEMail(const Value: string);
    procedure SetNome(const Value: string);
  public
    constructor Create;
    procedure Assign(Source: TEnderecoEMail);
    property Nome: string read FNome write SetNome;
    property EMail: string read FEMail write SetEMail;
  end;

  // Classe que define como um endereço de e-mail será armazenado
  TEnderecoEMailItem = class(TCollectionItem)
  private
    FEnderecoEMail: TEnderecoEMail;
    procedure SetEnderecoEMail(const Value: TEnderecoEMail);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property EnderecoEMail: TEnderecoEMail read FEnderecoEMail write SetEnderecoEMail;
  end;

  // Classe que armazena os endereços de e-mails
  TEnderecoEMailCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TEnderecoEMailItem;
    procedure SetItem(Index: Integer; Value: TEnderecoEMailItem);
  public
    constructor Create;
    function Add: TEnderecoEMailItem;
    function Insert(Index: Integer): TEnderecoEMailItem;
    property Items[Index: Integer]: TEnderecoEMailItem read GetItem write SetItem;
  end;

  // Classe que armazena os endereços dos destinatários do e-mail
  TDestinatario = class
  private
    FPara: TEnderecoEMailCollection;
    FCc: TEnderecoEMailCollection;
    FCco: TEnderecoEMailCollection;
    procedure SetCc(const Value: TEnderecoEMailCollection);
    procedure SetCco(const Value: TEnderecoEMailCollection);
    procedure SetPara(const Value: TEnderecoEMailCollection);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TDestinatario);
    property Para: TEnderecoEMailCollection read FPara write SetPara;
    property Cc: TEnderecoEMailCollection read FCc write SetCc;
    property Cco: TEnderecoEMailCollection read FCco write SetCco;
  end;

  // Classe de configuração do e-mail
  TConfiguracao = class
  private
    FSenha: string;
    FTipoAutenticacao: TTipoAutenticacao;
    FHost: string;
    FUsuario: string;
    FPorta: Word;
    FModo: TModoSSL;
    FMetodo: TVersaoSSL;
    FUseTLS: TUseTLS;
    FCodigoTabContaEMail: Integer;
    procedure SetHost(const Value: string);
    procedure SetMetodo(const Value: TVersaoSSL);
    procedure SetModo(const Value: TModoSSL);
    procedure SetPorta(const Value: Word);
    procedure SetSenha(const Value: string);
    procedure SetTipoAutenticacao(const Value: TTipoAutenticacao);
    procedure SetUsuario(const Value: string);
    procedure SetUseTLS(const Value: TUseTLS);
    procedure SetCodigoTabContaEMail(const Value: Integer);
  public
    constructor Create;
    procedure Assign(Source: TConfiguracao);
    property Host: string read FHost write SetHost;
    property Porta: Word read FPorta write SetPorta;
    property TipoAutenticacao: TTipoAutenticacao read FTipoAutenticacao write SetTipoAutenticacao;
    property Senha: string read FSenha write SetSenha;
    property Usuario: string read FUsuario write SetUsuario;
    property UseTLS: TUseTLS read FUseTLS write SetUseTLS;
    property Metodo: TVersaoSSL read FMetodo write SetMetodo;
    property Modo: TModoSSL read FModo write SetModo;
    property CodigoTabContaEMail: Integer read FCodigoTabContaEMail write SetCodigoTabContaEMail;
  end;

  // Classe responsável por guardar todas as informações do e-mail
  TEMail = class
  private
    FAnexo: TAnexoCollection;
    FAssunto: string;
    FConfiguracao: TConfiguracao;
    FDestinatario: TDestinatario;
    FMensagem: string;
    FRemetente: TEnderecoEMail;
    FResponderPara: TEnderecoEMailCollection;
    procedure SetAnexo(const Value: TAnexoCollection);
    procedure SetAssunto(const Value: string);
    procedure SetConfiguracao(const Value: TConfiguracao);
    procedure SetDestinatario(const Value: TDestinatario);
    procedure SetMensagem(const Value: string);
    procedure SetRemetente(const Value: TEnderecoEMail);
    procedure SetResponderPara(const Value: TEnderecoEMailCollection);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TEMail);
    property Configuracao: TConfiguracao read FConfiguracao write SetConfiguracao;
    property Remetente: TEnderecoEMail read FRemetente write SetRemetente;
    property Destinatario: TDestinatario read FDestinatario write SetDestinatario;
    property ResponderPara: TEnderecoEMailCollection read FResponderPara write SetResponderPara;
    property Anexo: TAnexoCollection read FAnexo write SetAnexo;
    property Assunto: string read FAssunto write SetAssunto;
    property Mensagem: string read FMensagem write SetMensagem;
  end;

  TErroEnviarEMail = function(ioEMail: TEMail; const ipErro: string): Boolean of object;

  // Classe responsável por enviar o e-mail
  TEnviarEmail = class(TThread)
  private
    FEnviado: Boolean;
    FMotivoErro: String;
    FListaCodigoEmailEnviado: string;
    FEMail: TEMail;
    FStatusInfo: TStatusInfo;
    FErroEnviarEMail: TErroEnviarEMail;
    FExibirMensagens: Boolean;
    FInformacoesExtras: String;
    FOnFormatMensagem: TFormatMensagem;
    procedure ppvEnviar_Email;
    function fpvEmailTipoMIME(ipTipoMIME: Integer): String;
    function GetMotivoErro: string;
    procedure SetListaCodigoEmailEnviado(const Value: string);
    procedure SetEMail(const Value: TEMail);
    procedure ppvStatusInfo(const ipMensagem: string);
    procedure SetStatusInfo(const Value: TStatusInfo);
    procedure SetErroEnviarEMail(const Value: TErroEnviarEMail);
    procedure SetExibirMensagens(const Value: Boolean);
    procedure ppvExibirMsg(ipMsg,ipCaption: PWideChar;ipFlags:Integer=0);
    procedure SetInformacoesExtras(const Value: String);
    procedure SetOnFormatMensagem(const Value: TFormatMensagem);
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean);
    destructor Destroy; override;
    property EMail: TEMail read FEMail write SetEMail;
    property Enviado: Boolean read FEnviado;
    property ListaCodigoEmailEnviado: string read FListaCodigoEmailEnviado write SetListaCodigoEmailEnviado;
    property MotivoErro: string read GetMotivoErro;
    property OnStatusInfo: TStatusInfo read FStatusInfo write SetStatusInfo;
    property OnErroEnviarEMail: TErroEnviarEMail read FErroEnviarEMail write SetErroEnviarEMail;
    property ExibirMensagens:Boolean read FExibirMensagens write SetExibirMensagens;
    property OnFormatMensagem:TFormatMensagem read FOnFormatMensagem write SetOnFormatMensagem;
    //property para guardar alguma informacao extra que seja necessaria posteriormente
    property InformacoesExtras:String read FInformacoesExtras write SetInformacoesExtras;
  end;

implementation

uses
  pPrincipal, Vcl.Forms, IdAttachmentFile, System.StrUtils, Winapi.Windows;

{ TEnviarEmail }

constructor TEnviarEmail.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
  Priority := tpLowest;
  FStatusInfo := nil;
  FErroEnviarEMail := nil;
  FEMail := TEMail.Create;
  FExibirMensagens := true;
end;

destructor TEnviarEmail.Destroy;
begin
  FreeAndNil(FEMail);
  inherited Destroy;
end;

procedure TEnviarEmail.Execute;
var
  vaDestinations, vaCC, vaCCo, vaResposta, vaAnexo, vaTextoCorpo: TStringList;
  i: Integer;
begin
  ppvEnviar_Email;
end;

function TEnviarEmail.fpvEmailTipoMIME(ipTipoMIME: Integer): String;
begin
  Result := EmptyStr;

  case ipTipoMIME of
    0:
      Result := 'text/plain';
    1:
      Result := 'text/html';
    2:
      Result := 'text/richtext';
    3:
      Result := 'text/x-aiff';
    4:
      Result := 'audio/basic';
    5:
      Result := 'audio/wav';
    6:
      Result := 'image/gif';
    7:
      Result := 'image/jpeg';
    8:
      Result := 'image/pjpeg';
    9:
      Result := 'image/tiff';
    10:
      Result := 'image/x-png';
    11:
      Result := 'image/x-xbitmap';
    12:
      Result := 'image/bmp';
    13:
      Result := 'image/x-jg';
    14:
      Result := 'image/x-emf';
    15:
      Result := 'image/x-wmf';
    16:
      Result := 'video/avi';
    17:
      Result := 'video/mpeg';
    18:
      Result := 'application/postscript';
    19:
      Result := 'application/base64';
    20:
      Result := 'application/macbinhex40';
    21:
      Result := 'application/pdf'; // arquivos PDF
    22:
      Result := 'application/x-compressed';
    23:
      Result := 'application/x-zip-compressed';
    24:
      Result := 'application/x-gzip-compressed';
    25:
      Result := 'application/java';
    26:
      Result := 'application/x-msdownload';
    27:
      Result := 'application/octet-stream'; // arquivos .dat
    28:
      Result := 'multipart/mixed';
    29:
      Result := 'multipart/relative';
    30:
      Result := 'multipart/digest';
    31:
      Result := 'multipart/alternative';
    32:
      Result := 'multipart/related';
    33:
      Result := 'multipart/report';
    34:
      Result := 'multipart/signed';
    35:
      Result := 'multipart/encrypted';
  end;
end;

function TEnviarEmail.GetMotivoErro: String;
begin
  if not Enviado then
    Result := FMotivoErro
  else
    Result := '';
end;

procedure TEnviarEmail.ppvExibirMsg(ipMsg, ipCaption:PWideChar; ipFlags:Integer=0);
begin
  if ExibirMensagens then
    Application.MessageBox(ipMsg, ipCaption,ipFlags);
end;

procedure TEnviarEmail.ppvEnviar_Email;
var
  i: Integer;
  vaReenviarEMail: Boolean;
  vaWideChar: array [0 .. 150] of WideChar;
  vaIdSMTP: TIdSMTP;
  vaIdMessage: TIdMessage;
  vaIdText: TIdText;
  vaIdAnexo: TIdAttachmentFile;
  vaIdSSL: TIdSSLIOHandlerSocketOpenSSL;
  vaIdEMailAddressItem: TIdEMailAddressItem;

  vaIdUserPassProvider: TIdUserPassProvider;
  vaIdSASLAnonymous: TIdSASLAnonymous;
  vaIdSASLExternal: TIdSASLExternal;
  vaIdSASLCRAMMD5: TIdSASLCRAMMD5;
  vaIdSASLCRAMSHA1: TIdSASLCRAMSHA1;
  vaIdSASLDigest: TIdSASLDigest;
  vaIdSASLLogin: TIdSASLLogin;
  vaIdSASLOTP: TIdSASLOTP;
  vaIdSASLPlain: TIdSASLPlain;
  vaIdSASLSKey: TIdSASLSKey;
  vaMsg:String;
begin
  FMotivoErro := '';
  vaIdMessage := nil;
  vaIdSMTP := nil;
  vaIdUserPassProvider := nil;
  vaIdSASLAnonymous := nil;
  vaIdSASLExternal := nil;
  vaIdSASLCRAMMD5 := nil;
  vaIdSASLCRAMSHA1 := nil;
  vaIdSASLDigest := nil;
  vaIdSASLLogin := nil;
  vaIdSASLOTP := nil;
  vaIdSASLPlain := nil;
  vaIdSASLSKey := nil;

  try
    // Criando a mensagem
    vaIdMessage := TIdMessage.Create(nil);

    // Montando a estrutura da mensagem
    vaIdMessage.Clear;
    vaIdMessage.IsEncoded := True;
    vaIdMessage.AttachmentEncoding := 'MIME';
    vaIdMessage.Encoding := meMIME; // meDefault;
    vaIdMessage.ConvertPreamble := True;
    vaIdMessage.Priority := mpNormal;
    vaIdMessage.ContentType := 'multipart/mixed'; // Não altere esta linha
    vaIdMessage.CharSet := 'ISO-8859-1';
    vaIdMessage.Date := Now;

    // Remetente
    vaIdMessage.From.Name := FEMail.Remetente.Nome;
    vaIdMessage.From.Address := FEMail.Remetente.EMail;

    // Auto-resposta (confirmação de leitura)      Ainda não tem essa opção implementada
    if false then
      vaIdMessage.ReceiptRecipient.Text := FEMail.Remetente.EMail;

    // Destinatários (Para)
    for i := 0 to FEMail.Destinatario.Para.Count - 1 do
      begin
        vaIdEMailAddressItem := vaIdMessage.Recipients.Add;
        vaIdEMailAddressItem.Address := Trim(FEMail.Destinatario.Para.Items[i].EnderecoEMail.EMail);
        vaIdEMailAddressItem.Name := FEMail.Destinatario.Para.Items[i].EnderecoEMail.Nome;
      end;

    // Destinatários (Cc - Cópia)
    for i := 0 to FEMail.Destinatario.Cc.Count - 1 do
      begin
        vaIdEMailAddressItem := vaIdMessage.CCList.Add;
        vaIdEMailAddressItem.Address := Trim(FEMail.Destinatario.Cc.Items[i].EnderecoEMail.EMail);
        vaIdEMailAddressItem.Name := FEMail.Destinatario.Cc.Items[i].EnderecoEMail.Nome;
      end;

    // Destinatários (Cco - Cópia oculta)
    for i := 0 to FEMail.Destinatario.Cco.Count - 1 do
      begin
        vaIdEMailAddressItem := vaIdMessage.BccList.Add;
        vaIdEMailAddressItem.Address := Trim(FEMail.Destinatario.Cco.Items[i].EnderecoEMail.EMail);
        vaIdEMailAddressItem.Name := FEMail.Destinatario.Cco.Items[i].EnderecoEMail.Nome;
      end;

    // Assunto
    vaIdMessage.Subject := FEMail.Assunto;

    // Montando a mensagem em HTML
    vaIdText := TIdText.Create(vaIdMessage.MessageParts, nil);
    vaIdText.ContentType := fpvEmailTipoMIME(1); // 1 = 'text/html'
    vaIdText.ContentDescription := 'multipart-1';
    vaIdText.CharSet := 'ISO-8859-1'; // Lingua portuguesa (Brasil) PT-BR (Latin-1)
    vaIdText.ContentTransfer := '16bit'; // 16 bits para sair acentuado, pois 8 bits sai sem acento
    vaIdText.Body.Clear;
    vaMsg :=
      '<html><head>' +
      '<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">' +
      '<style type="text/css">' +
      'table {display: table; border-collapse: separate; border-spacing: 5px; border: 0px solid black;}' +
      'td {display: table-cell; text-align: center; vertical-align: middle;}' +
      '</style></head><body><div>' +
      FEMail.Mensagem +
      '</div><div><hr /><table><tr><td>' +
      '<a href="http://www.pmedico.com"><img border="0" hspace="0" alt="www.pmedico.com" src="http://www.pmedico.com/%C3%ACcone1.png"></a></td>' +
      '<td><b>' + //pPrincipal.puInfSistema.EmpresaNome + '<br />' + pPrincipal.puInfSistema.EmpresaFone + '</b></td></tr></table></div>' +
      '</body></html>';
    //se quem estiver usando essa classe e desejar alterar a formatacao, poderá fazer isso nesse envento
    if Assigned(FOnFormatMensagem) then
      FOnFormatMensagem(vaMsg);

    vaIdText.Body.Add(vaMsg);
    // Anexando os arquivos
    for i := 0 to FEMail.Anexo.Count - 1 do
      begin
        vaIdAnexo := TIdAttachmentFile.Create(vaIdMessage.MessageParts, FEMail.Anexo.Items[i].NomeArquivo);
        vaIdAnexo.ContentDisposition := 'attachment';
        vaIdAnexo.ContentTransfer := 'base64';
        vaIdAnexo.LoadFromStream(FEMail.Anexo.Items[i].Arquivo);
      end;

    // Criando o SMTP para enviar a mensagem
    vaIdSMTP := TIdSMTP.Create(nil);
    vaIdSMTP.Disconnect();

    // Se a porta for 25 ou o UseTLS for igual a utNoTLSSupport, então não está usando conexão segura
    // Gmail e Globo usam a porta 465 (smtp) e 995 (pop3) com SSL
    // Hotmail usam a porta 25 (smpt.live.com) e 995 (pop3.live.com) sem SSL
    // Bol usa a porta 25 (smtp.bol.com.br) e 110 (pop3.bol.com.br) sem SSL

    // Configurando o SMTP para enviar a mensagem
    if (FEMail.Configuracao.Porta = 25) or (FEMail.Configuracao.UseTLS = TIdUseTLS.utNoTLSSupport) then
      begin
        // Se definiu a porta 25 ou UseTLS = utNoTLSSupport, então não está usando uma conexão segura
        vaIdSMTP.IOHandler := TIdIOHandler.MakeDefaultIOHandler(nil);
        vaIdSMTP.UseTLS := TIdUseTLS.utNoTLSSupport;
      end
    else
      begin
        try
          // Está utilizando uma conxão segura
          vaIdSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
          vaIdSSL.Name := 'SSLSocket';
          vaIdSSL.SSLOptions.Method := FEMail.Configuracao.Metodo;
          vaIdSSL.SSLOptions.Mode := FEMail.Configuracao.Modo;

          if Assigned(FStatusInfo) then
            vaIdSSL.OnStatusInfo := ppvStatusInfo;

          vaIdSMTP.IOHandler := vaIdSSL;
          vaIdSMTP.UseTLS := FEMail.Configuracao.UseTLS;
        except
          on E: Exception do
            begin
              FEnviado := false;
              FMotivoErro := E.Message; 
              ppvExibirMsg('Não foi possível realizar uma autenticação segura. Tente novamente!', 'Atenção', MB_ICONINFORMATION);
            end;
        end;
      end;

    try
      vaIdSMTP.AuthType := FEMail.Configuracao.FTipoAutenticacao;
      vaIdSMTP.ReadTimeout := 10000; // Tempo aguardando a conexão. 10 segundos.
      vaIdSMTP.Host := FEMail.Configuracao.Host;
      vaIdSMTP.Port := FEMail.Configuracao.Porta;
      if Pos('@pmedico.com', FEMail.Configuracao.Usuario) > 0 then
        FEMail.Configuracao.Usuario := StringReplace(FEMail.Configuracao.Usuario, '@pmedico.com', '', [rfIgnoreCase]);
      vaIdSMTP.Username := FEMail.Configuracao.Usuario;
      vaIdSMTP.Password := FEMail.Configuracao.Senha;

      // Se for SASL tem que informar
      if vaIdSMTP.AuthType = TIdSMTPAuthenticationType.satSASL then
        begin
          vaIdUserPassProvider := TIdUserPassProvider.Create(vaIdSMTP);
          vaIdUserPassProvider.Name := 'UserPassProvider';
          vaIdSASLExternal := TIdSASLExternal.Create(vaIdSMTP);
          vaIdSASLExternal.Name := 'IdSASLExternal';
          vaIdSASLAnonymous := TIdSASLAnonymous.Create(vaIdSMTP);
          vaIdSASLAnonymous.Name := 'IdSASLAnonymous';
          vaIdSASLLogin := TIdSASLLogin.Create(vaIdSMTP);
          vaIdSASLLogin.Name := 'IdSASLLogin';
          vaIdSASLCRAMMD5 := TIdSASLCRAMMD5.Create(vaIdSMTP);
          vaIdSASLCRAMMD5.Name := 'IdSASLCRAMMD5';
          vaIdSASLCRAMSHA1 := TIdSASLCRAMSHA1.Create(vaIdSMTP);
          vaIdSASLCRAMSHA1.Name := 'IdSASLCRAMSHA1';
          vaIdSASLDigest := TIdSASLDigest.Create(vaIdSMTP);
          vaIdSASLDigest.Name := 'IdSASLDigest';
          vaIdSASLOTP := TIdSASLOTP.Create(vaIdSMTP);
          vaIdSASLOTP.Name := 'IdSASLOTP';
          vaIdSASLPlain := TIdSASLPlain.Create(vaIdSMTP);
          vaIdSASLPlain.Name := 'IdSASLPlain';
          vaIdSASLSKey := TIdSASLSKey.Create(vaIdSMTP);
          vaIdSASLSKey.Name := 'IdSASLSKey';

          vaIdUserPassProvider.Username := FEMail.Configuracao.Usuario;
          vaIdUserPassProvider.Password := FEMail.Configuracao.Senha;

          vaIdSASLLogin.UserPassProvider := vaIdUserPassProvider;
          vaIdSASLCRAMMD5.UserPassProvider := vaIdUserPassProvider;
          vaIdSASLCRAMSHA1.UserPassProvider := vaIdUserPassProvider;
          vaIdSASLDigest.UserPassProvider := vaIdUserPassProvider;
          vaIdSASLOTP.UserPassProvider := vaIdUserPassProvider;
          vaIdSASLPlain.UserPassProvider := vaIdUserPassProvider;
          vaIdSASLSKey.UserPassProvider := vaIdUserPassProvider;

          // Adicinando os mecadimos na ordem mais seguro para o menos seguro
          vaIdSMTP.SASLMechanisms.Add.SASL := vaIdSASLDigest;
          vaIdSMTP.SASLMechanisms.Add.SASL := vaIdSASLCRAMSHA1;
          vaIdSMTP.SASLMechanisms.Add.SASL := vaIdSASLCRAMMD5;
          vaIdSMTP.SASLMechanisms.Add.SASL := vaIdSASLSKey;
          vaIdSMTP.SASLMechanisms.Add.SASL := vaIdSASLOTP;
          vaIdSMTP.SASLMechanisms.Add.SASL := vaIdSASLPlain;
          vaIdSMTP.SASLMechanisms.Add.SASL := vaIdSASLAnonymous;
          vaIdSMTP.SASLMechanisms.Add.SASL := vaIdSASLExternal;
          vaIdSMTP.SASLMechanisms.Add.SASL := vaIdSASLLogin;
        end;

      // Garantindo que está desconectado
      vaIdSMTP.Disconnect();

      try
        // Conectando
        if FMotivoErro = '' then
          vaIdSMTP.Connect;
      except
        on E: Exception do
          begin
            FEnviado := false;
            FMotivoErro := E.Message;

            if TRegEx.IsMatch(FMotivoErro, 'Connection timed out\.', [roIgnoreCase, roSingleLine]) then
              begin
                StringToWideChar('Tempo de conexão excedido. Não foi possível enviar o e-mail,' + sLineBreak + 'verifique a sua conexão com internet e tente mais tarde.', vaWideChar, 151);
                ppvExibirMsg(vaWideChar, 'Atenção', MB_ICONINFORMATION);
              end
            else
              ppvExibirMsg('Houve um erro ao conectar no servidor de e-mail. Tente novamente!', 'Atenção', MB_ICONINFORMATION);
          end;
      end;

      try
        if FMotivoErro = '' then
          vaIdSMTP.Authenticate;
      except
        on E: Exception do
          begin
            FEnviado := false;
            FMotivoErro := E.Message;

            if TRegEx.IsMatch(FMotivoErro, 'Username and password not accepted\.', [roIgnoreCase, roSingleLine]) then
              begin
                StringToWideChar('Usuário e senha inválidos para o e-mail ' + FEMail.Remetente.EMail + '.', vaWideChar, 151);
                ppvExibirMsg(vaWideChar, 'Atenção', MB_ICONINFORMATION);
              end
            else
              ppvExibirMsg('Houve um erro na autenticação do e-mail. Tente novamente!', 'Atenção', MB_ICONINFORMATION);
          end;
      end;

      if vaIdSMTP.Connected and (FMotivoErro = '') then
        begin
          try
            vaIdSMTP.Send(vaIdMessage);
            FEnviado := True;
            ppvExibirMsg('Mensagem enviada com sucesso', 'Aviso', MB_ICONINFORMATION);
          except
            on E: Exception do
              begin
                FEnviado := false;
                FMotivoErro := E.Message;
                ppvExibirMsg('Houve um erro ao enviar o e-mail.', 'Aviso', MB_ICONINFORMATION);
              end;
          end;
        end
      else
        begin
          if FMotivoErro = '' then
            ppvExibirMsg('A conexão com o provedor de e-mail foi interrompida.' + sLineBreak + 'Verifique se a sua internet está ativa.', 'Atenção', MB_ICONINFORMATION);
        end;
    finally
      vaIdSMTP.Disconnect;
    end;
  finally
    if Assigned(vaIdMessage) then
      FreeAndNil(vaIdMessage);

    if Assigned(vaIdSMTP) then
      FreeAndNil(vaIdSMTP);

    if Assigned(vaIdSASLAnonymous) then
      FreeAndNil(vaIdSASLAnonymous);

    if Assigned(vaIdSASLExternal) then
      FreeAndNil(vaIdSASLExternal);

    if Assigned(vaIdSASLCRAMMD5) then
      FreeAndNil(vaIdSASLCRAMMD5);

    if Assigned(vaIdSASLCRAMSHA1) then
      FreeAndNil(vaIdSASLCRAMSHA1);

    if Assigned(vaIdSASLDigest) then
      FreeAndNil(vaIdSASLDigest);

    if Assigned(vaIdSASLLogin) then
      FreeAndNil(vaIdSASLLogin);

    if Assigned(vaIdSASLOTP) then
      FreeAndNil(vaIdSASLOTP);

    if Assigned(vaIdSASLPlain) then
      FreeAndNil(vaIdSASLPlain);

    if Assigned(vaIdSASLSKey) then
      FreeAndNil(vaIdSASLSKey);

    if Assigned(vaIdUserPassProvider) then
      FreeAndNil(vaIdUserPassProvider);
  end;

  // Se ocorreu algum erro ao enviar o e-mail e foi definida uma função de erro, então vamos
  // executar a função
  if (FMotivoErro <> '') and Assigned(FErroEnviarEMail) then
    begin
      Synchronize(
        procedure
        begin
          try
            vaReenviarEMail := FErroEnviarEMail(FEMail, FMotivoErro);
          except
            on E: Exception do
              begin
                // Se houve erro na função FErroEnviarEMail, então não reenvia o e-mail
                vaReenviarEMail := false;
              end;
          end;
        end);

      // Executando a função novamente para reenviar o e-mail
      if vaReenviarEMail then
        ppvEnviar_Email;
    end;
end;

procedure TEnviarEmail.ppvStatusInfo(const ipMensagem: string);
begin
  if Assigned(FStatusInfo) then
    begin
      Synchronize(
        procedure
        begin
          try
            FStatusInfo(ipMensagem);
          except
            on E: Exception do
              begin
                // Se hocorreu erro no procedimento FStatusInfo, ignora o erro
                // e continua com o envio do e-mail
              end;
          end;
        end);
    end;
end;

procedure TEnviarEmail.SetEMail(const Value: TEMail);
begin
  FEMail.Assign(Value);
end;

procedure TEnviarEmail.SetListaCodigoEmailEnviado(const Value: string);
begin
  FListaCodigoEmailEnviado := Value;
end;

procedure TEnviarEmail.SetOnFormatMensagem(const Value: TFormatMensagem);
begin
  FOnFormatMensagem := Value;
end;

procedure TEnviarEmail.SetErroEnviarEMail(const Value: TErroEnviarEMail);
begin
  FErroEnviarEMail := Value;
end;

procedure TEnviarEmail.SetExibirMensagens(const Value: Boolean);
begin
  FExibirMensagens := Value;
end;

procedure TEnviarEmail.SetInformacoesExtras(const Value: String);
begin
  FInformacoesExtras := Value;
end;

procedure TEnviarEmail.SetStatusInfo(const Value: TStatusInfo);
begin
  FStatusInfo := Value;
end;

{ TEMail }

procedure TEMail.Assign(Source: TEMail);
begin
  SetAnexo(Source.Anexo);
  SetAssunto(Source.Assunto);
  SetConfiguracao(Source.Configuracao);
  SetDestinatario(Source.Destinatario);
  SetMensagem(Source.Mensagem);
  SetRemetente(Source.Remetente);
  SetResponderPara(Source.ResponderPara);
end;

constructor TEMail.Create;
begin
  FAnexo := TAnexoCollection.Create;
  FAssunto := EmptyStr;
  FConfiguracao := TConfiguracao.Create;
  FDestinatario := TDestinatario.Create;
  FMensagem := EmptyStr;
  FRemetente := TEnderecoEMail.Create;
  FResponderPara := TEnderecoEMailCollection.Create;
end;

destructor TEMail.Destroy;
begin
  FreeAndNil(FAnexo);
  FreeAndNil(FConfiguracao);
  FreeAndNil(FDestinatario);
  FreeAndNil(FRemetente);
  FreeAndNil(FResponderPara);
  inherited Destroy;
end;

procedure TEMail.SetAnexo(const Value: TAnexoCollection);
begin
  FAnexo.Assign(Value);
end;

procedure TEMail.SetAssunto(const Value: string);
begin
  FAssunto := Value;
end;

procedure TEMail.SetConfiguracao(const Value: TConfiguracao);
begin
  FConfiguracao.Assign(Value);
end;

procedure TEMail.SetDestinatario(const Value: TDestinatario);
begin
  FDestinatario.Assign(Value);
end;

procedure TEMail.SetMensagem(const Value: string);
begin
  FMensagem := Value;
end;

procedure TEMail.SetRemetente(const Value: TEnderecoEMail);
begin
  FRemetente.Assign(Value);
end;

procedure TEMail.SetResponderPara(const Value: TEnderecoEMailCollection);
begin
  FResponderPara.Assign(Value);
end;

{ TConfiguracao }

procedure TConfiguracao.Assign(Source: TConfiguracao);
begin
  SetSenha(Source.Senha);
  SetTipoAutenticacao(Source.TipoAutenticacao);
  SetHost(Source.Host);
  SetUsuario(Source.Usuario);
  SetPorta(Source.Porta);
  SetMetodo(Source.Metodo);
  SetModo(Source.Modo);
  SetUseTLS(Source.UseTLS);
  SetCodigoTabContaEMail(Source.CodigoTabContaEMail);
end;

constructor TConfiguracao.Create;
begin
  FSenha := EmptyStr;
  FTipoAutenticacao := TTipoAutenticacao.satDefault;
  FHost := EmptyStr;
  FUsuario := EmptyStr;
  FPorta := 25; // Porta padrão
  FModo := TModoSSL.sslmUnassigned;
  FMetodo := TVersaoSSL.sslvSSLv2;
  FCodigoTabContaEMail := 0;
end;

procedure TConfiguracao.SetCodigoTabContaEMail(const Value: Integer);
begin
  FCodigoTabContaEMail := Value;
end;

procedure TConfiguracao.SetHost(const Value: string);
begin
  FHost := Value;
end;

procedure TConfiguracao.SetMetodo(const Value: TVersaoSSL);
begin
  FMetodo := Value;
end;

procedure TConfiguracao.SetModo(const Value: TModoSSL);
begin
  FModo := Value;
end;

procedure TConfiguracao.SetPorta(const Value: Word);
begin
  if Value > 0 then
    FPorta := Value
  else
    FPorta := 25; // Porta padrão
end;

procedure TConfiguracao.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

procedure TConfiguracao.SetTipoAutenticacao(const Value: TTipoAutenticacao);
begin
  FTipoAutenticacao := Value;
end;

procedure TConfiguracao.SetUseTLS(const Value: TUseTLS);
begin
  FUseTLS := Value;
end;

procedure TConfiguracao.SetUsuario(const Value: string);
begin
  FUsuario := Value;
end;

{ TAnexoItem }

procedure TAnexoItem.Assign(Source: TPersistent);
begin
  if Source is TAnexoItem then
    begin
      FNomeArquivo := TAnexoItem(Source).NomeArquivo;
      SetArquivo(TAnexoItem(Source).Arquivo);
    end
  else
    inherited Assign(Source);
end;

constructor TAnexoItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FNomeArquivo := EmptyStr;
  FArquivo := nil;
end;

destructor TAnexoItem.Destroy;
begin
  if Assigned(FArquivo) then
    FreeAndNil(FArquivo);

  inherited Destroy;
end;

procedure TAnexoItem.SetArquivo(const Value: TMemoryStream);
begin
  if not Assigned(FArquivo) then
    FArquivo := TMemoryStream.Create;

  FArquivo.LoadFromStream(Value);
end;

procedure TAnexoItem.SetLocalArquivo(const Value: string);
begin
  FLocalArquivo := Value;
end;

procedure TAnexoItem.SetNomeArquivo(const Value: string);
begin
  FNomeArquivo := Value;
end;

{ TAnexoCollection }

function TAnexoCollection.Add: TAnexoItem;
begin
  Result := TAnexoItem(inherited Add);
end;

constructor TAnexoCollection.Create;
begin
  inherited Create(TAnexoItem);
end;

function TAnexoCollection.GetItem(Index: Integer): TAnexoItem;
begin
  Result := TAnexoItem(inherited GetItem(Index));
end;

function TAnexoCollection.Insert(Index: Integer): TAnexoItem;
begin
  Result := TAnexoItem(inherited Insert(Index));
end;

procedure TAnexoCollection.SetItem(Index: Integer; Value: TAnexoItem);
begin
  inherited SetItem(Index, Value);
end;

{ TEnderecoEMail }

procedure TEnderecoEMail.Assign(Source: TEnderecoEMail);
begin
  FEMail := Source.EMail;
  FNome := Source.Nome;
end;

constructor TEnderecoEMail.Create;
begin
  FEMail := EmptyStr;
  FNome := EmptyStr;
end;

procedure TEnderecoEMail.SetEMail(const Value: string);
begin
  FEMail := Value;
end;

procedure TEnderecoEMail.SetNome(const Value: string);
begin
  FNome := Value;
end;

{ TEnderecoEMailItem }

procedure TEnderecoEMailItem.Assign(Source: TPersistent);
begin
  if Source is TEnderecoEMailItem then
    SetEnderecoEMail(TEnderecoEMailItem(Source).EnderecoEMail)
  else
    inherited Assign(Source);
end;

constructor TEnderecoEMailItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FEnderecoEMail := TEnderecoEMail.Create;
end;

destructor TEnderecoEMailItem.Destroy;
begin
  FreeAndNil(FEnderecoEMail);
  inherited Destroy;
end;

procedure TEnderecoEMailItem.SetEnderecoEMail(const Value: TEnderecoEMail);
begin
  FEnderecoEMail.Assign(Value);
end;

{ TEnderecoEMailCollection }

function TEnderecoEMailCollection.Add: TEnderecoEMailItem;
begin
  Result := TEnderecoEMailItem(inherited Add);
end;

constructor TEnderecoEMailCollection.Create;
begin
  inherited Create(TEnderecoEMailItem);
end;

function TEnderecoEMailCollection.GetItem(Index: Integer): TEnderecoEMailItem;
begin
  Result := TEnderecoEMailItem(inherited GetItem(Index));
end;

function TEnderecoEMailCollection.Insert(Index: Integer): TEnderecoEMailItem;
begin
  Result := TEnderecoEMailItem(inherited Insert(Index));
end;

procedure TEnderecoEMailCollection.SetItem(Index: Integer;
  Value: TEnderecoEMailItem);
begin
  inherited SetItem(Index, Value);
end;

{ TDestinatario }

procedure TDestinatario.Assign(Source: TDestinatario);
begin
  SetCc(Source.Cc);
  SetCco(Source.Cco);
  SetPara(Source.Para);
end;

constructor TDestinatario.Create;
begin
  FPara := TEnderecoEMailCollection.Create;
  FCc := TEnderecoEMailCollection.Create;
  FCco := TEnderecoEMailCollection.Create;
end;

destructor TDestinatario.Destroy;
begin
  FreeAndNil(FPara);
  FreeAndNil(FCc);
  FreeAndNil(FCco);
  inherited Destroy;
end;

procedure TDestinatario.SetCc(const Value: TEnderecoEMailCollection);
begin
  FCc.Assign(Value);
end;

procedure TDestinatario.SetCco(const Value: TEnderecoEMailCollection);
begin
  FCco.Assign(Value);
end;

procedure TDestinatario.SetPara(const Value: TEnderecoEMailCollection);
begin
  FPara.Assign(Value);
end;

end.
