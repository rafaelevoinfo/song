unit pSms_Tipos;

interface

uses
  System.Generics.Collections;



// http://docs.zenviasms.apiary.io/#introduction/tabela-de-status
Const
  smsStatusCode: array [0 .. 11] of string = ('OK', 'Agendada', 'Enviada', 'Entregue', 'Não recebida', 'Bloqueada, sem cobertura', 'Bloqueada, lista negra',
    'Bloqueada, número inválido', 'Bloqueada, conteúdo não permitido', 'Bloqueada, mensagem expirada', 'Bloqueada', 'Erro');
  coSmsTipoCancelamento = 6;
  coUrl = 'https://api-rest.zenvia360.com.br/services';
  coUrlEnvio = 'send-sms'; // post
  coUrlMultiplos = 'send-sms-multiple'; // post
  coConsultaStatus = 'get-sms-status'; // get, precisa passar /ID da mensagem
  coConsultaRecebidos = 'received/list'; // get,lista os sms recebidos
  coConsultaSmsRecebidosPeriodo = 'received/search/'; // get, precisa passar /startdate/finishdate
  coCancelaSmsAgendado = 'cancel-sms'; // get, precisa passar o /id
  coRestClientAccept = 'application/json, text/plain; q=0.9, text/html;q=0.8,';
  coRestClientAcceptCharset = 'UTF-8, *;q=0.8';
  coRestClientAcceptEncoding = 'identity';
  coRestResponseContentType = 'application/json';
  coRestRequestTimeOut = 500000;
  coRootElementEnvio = 'sendSmsResponse';
  coRootElementCancelar = 'cancelSmsResp';
function SmsPegarDetailMsgCode(ipCodigo: Integer): string;


type
  TpmSmsInputEnvio = class
  private
    FTipo_Envio: Integer;
    FNumProc: Integer;
    FDestinatario: string;
    FCodigo_Medicos: Integer;
    FMsg: string;
    FRemetente: string;
    FDataHoraAgendada: TDateTime;
    FUsuario: Integer;
    procedure SetCodigo_Medicos(const Value: Integer);
    procedure SetDataHoraAgendada(const Value: TDateTime);
    procedure SetDestinatario(const Value: string);
    procedure SetMsg(const Value: string);
    procedure SetNumProc(const Value: Integer);
    procedure SetRemetente(const Value: string);
    procedure SetTipo_Envio(const Value: Integer);
    procedure SetUsuario(const Value: Integer);
  public
    property Codigo_Medicos: Integer read FCodigo_Medicos write SetCodigo_Medicos;
    property Msg: string read FMsg write SetMsg;
    property Destinatario: string read FDestinatario write SetDestinatario;
    property Remetente: string read FRemetente write SetRemetente;
    property NumProc: Integer read FNumProc write SetNumProc;
    property Tipo_Envio: Integer read FTipo_Envio write SetTipo_Envio;
    property Usuario: Integer read FUsuario write SetUsuario;
    property DataHoraAgendada: TDateTime read FDataHoraAgendada write SetDataHoraAgendada;
    constructor Create;
  end;

type
  TpmSmsInputCancelamento = class
      private
    FNumProc: Integer;
    FTipoEnvio: Integer;
    FUsuario: Integer;
    FCodigo_Sms_Log: Integer;
    FDestinatario: string;
    procedure SetCodigo_Sms_Log(const Value: Integer);
    procedure SetNumProc(const Value: Integer);
    procedure SetTipoEnvio(const Value: Integer);
    procedure SetUsuario(const Value: Integer);
    procedure SetDestinatario(const Value: string);

      public
        property Codigo_Sms_Log : Integer read FCodigo_Sms_Log write SetCodigo_Sms_Log;
        property TipoEnvio : Integer read FTipoEnvio write SetTipoEnvio;
        property NumProc : Integer read FNumProc write SetNumProc;
        property Usuario : Integer read FUsuario write SetUsuario;
        property Destinatario: string read FDestinatario write SetDestinatario;
       constructor Create;
  end;
implementation

function SmsPegarDetailMsgCode(ipCodigo: Integer): string;
begin
  case ipCodigo of
    0:
      Result := 'Mensagem Enviada';
    2:
      Result := 'Mensagem cancelada com sucesso';
    10:
      Result := 'Mensagem com conteúdo vazio';
    11:
      Result := 'Mensagem com conteúdo inválido';
    12:
      Result := 'Mensagem excedeu o limite de caracteres';
    13:
      Result := 'Número do destinatário inválido';
    14:
      Result := 'Número do destinatário vazio';
    15:
      Result := 'Data do Agendamento Inválida';
    16:
      Result := 'ID excedeu o limite de caracteres';
    17:
      Result := 'Parametro url é inválida ou incorreta';
    18:
      Result := 'Campo remetente inválido';
    21:
      Result := 'Campo ID é obrigatório';
    80:
      Result := 'Mensagem com o mesmo ID já enviada';
    100:
      Result := ' Mensagem adicionada na fila';
    110:
      Result := 'Mensagem enviada para a operadora';
    111:
      Result := 'Confirmação da mensagem indisponível';
    120:
      Result := 'Mensagem recebida no celular';
    130:
      Result := 'Mensagem bloqueada';
    131:
      Result := 'Mensagem bloqueada por limpeza preventiva';
    132:
      Result := 'Mensagem já cancelada';
    133:
      Result := 'Conteúdo da mensagem em análise';
    134:
      Result := 'Mensagem bloqueada por ter conteúdo não permitido';
    135:
      Result := 'Campo agregado é inválido ou está inativo';
    136:
      Result := 'Mensagem expirada';
    140:
      Result := 'Número do celular não coberto';
    141:
      Result := 'Envio internacional não permitido';
    145:
      Result := 'Número de celular inativo';
    150:
      Result := 'Mensagem expirada na operadora';
    160:
      Result := 'Erro de rede na operadora';
    161:
      Result := 'Mensagem rejeitada pela operadora';
    162:
      Result := 'Mensagem cancelada ou bloqueada pela operadora';
    170:
      Result := 'Mensagem inválida';
    171:
      Result := 'Número inválido';
    172:
      Result := 'Parametro faltando';
    180:
      Result := 'ID não encontrado';
    190:
      Result := 'Erro desconhecido';
    200:
      Result := 'Mensagens enviadas';
    210:
      Result := 'Mensagens agendadasa mas a conta atingiu o limite';
    240:
      Result := 'Arquivo vazio ou não enviado';
    241:
      Result := 'Arquivo muito grande';
    242:
      Result := 'Errp de leitura/escrita no arquivo';
    300:
      Result := 'Mensagem recebida encontrada';
    301:
      Result := 'Nenhuma mensagem recebida encontrada';
    400:
      Result := 'Entidade salva';
    900:
      Result := 'Erro de autenticação';
    901:
      Result := 'Tipo de conta não suportada nesta operadora';
    990:
      Result := 'Limite da conta atingido, por favor entre em contato com o suporte';
    998:
      Result := 'Erro com o tipo de operação requisitada';
    999:
      Result := 'Erro desconhecido';
  end;
end;

{ TpmEnvioSms }
 { TpmSmsInputEnvio }

constructor TpmSmsInputEnvio.Create;
begin
  Codigo_Medicos := 0;
  Msg := '';
  Destinatario := '';
  Remetente := '';
  NumProc := 0;
  Tipo_Envio := 0;
  Usuario := 0;
  DataHoraAgendada := 0;
end;

procedure TpmSmsInputEnvio.SetCodigo_Medicos(const Value: Integer);
begin
  FCodigo_Medicos := Value;
end;

procedure TpmSmsInputEnvio.SetDataHoraAgendada(const Value: TDateTime);
begin
  FDataHoraAgendada := Value;
end;

procedure TpmSmsInputEnvio.SetDestinatario(const Value: string);
begin
  FDestinatario := Value;
end;

procedure TpmSmsInputEnvio.SetMsg(const Value: string);
begin
  FMsg := Value;
end;

procedure TpmSmsInputEnvio.SetNumProc(const Value: Integer);
begin
  FNumProc := Value;
end;

procedure TpmSmsInputEnvio.SetRemetente(const Value: string);
begin
  FRemetente := Value;
end;

procedure TpmSmsInputEnvio.SetTipo_Envio(const Value: Integer);
begin
  FTipo_Envio := Value;
end;

procedure TpmSmsInputEnvio.SetUsuario(const Value: Integer);
begin
  FUsuario := Value;
end;

{ TpmSmsInputCancelamento }

constructor TpmSmsInputCancelamento.Create;
begin
  Codigo_Sms_Log:=0;
  TipoEnvio:=0;
  NumProc:=0;
  Usuario:=0;
end;

procedure TpmSmsInputCancelamento.SetCodigo_Sms_Log(const Value: Integer);
begin
  FCodigo_Sms_Log := Value;
end;

procedure TpmSmsInputCancelamento.SetDestinatario(const Value: string);
begin
  FDestinatario := Value;
end;

procedure TpmSmsInputCancelamento.SetNumProc(const Value: Integer);
begin
  FNumProc := Value;
end;

procedure TpmSmsInputCancelamento.SetTipoEnvio(const Value: Integer);
begin
  FTipoEnvio := Value;
end;

procedure TpmSmsInputCancelamento.SetUsuario(const Value: Integer);
begin
  FUsuario := Value;
end;

end.
