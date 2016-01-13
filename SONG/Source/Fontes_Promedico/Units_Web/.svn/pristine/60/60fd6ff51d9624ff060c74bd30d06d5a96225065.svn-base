unit pSms;

/// Classe de envio de sms
///
/// TODO: remover restresponseadapter, esta dando leak, fazer na bruta
interface


uses
  pMethod2009, FireDAC.Comp.Client, REST.Authenticator.Basic, System.Classes,
  System.SysUtils, REST.Client, pmAdQuery, pSms_Tipos, REST.Types,
  Datasnap.DBClient, REST.Response.Adapter;

type
  TpmSms = class
  private
    FidMensagem: string;
    FConnCriada: Boolean;
    FConn: TFDConnection;
    FAutenticador: THTTPBasicAuthenticator;
    FRestClient: TRESTClient;
    FRestResponse: TRESTResponse;
    FRestRequest: TRESTRequest;
    pvAux: TpmADQuery;
    FExecutandoEmThread: Boolean;
    pvCds: TClientDataSet;
    FRestResponseAdapter: TRESTResponseDataSetAdapter;
    procedure SetConn(const Value: TFDConnection);
    procedure SetAutenticador(const Value: THTTPBasicAuthenticator);
    procedure SetRestClient(const Value: TRESTClient);
    procedure SetRestResponse(const Value: TRESTResponse);
    procedure SetRestRequest(const Value: TRESTRequest);
    procedure FinalizarEnvioSms(ipParametros: TpmSmsInputEnvio);
    procedure FinalizarCancelarSmsAgendado(ipParametros: TpmSmsInputCancelamento);
    procedure GravarLogErro(ipDestinatario, ipObs, ipMsg: string; ipTipoEnvio, ipNumProc, ipUsuario: Integer);
    procedure SetRestResponseAdapter(const Value: TRESTResponseDataSetAdapter);

  public
    property RestResponseAdapter: TRESTResponseDataSetAdapter read FRestResponseAdapter write SetRestResponseAdapter;
    property Conn: TFDConnection read FConn write SetConn;
    property Autenticador: THTTPBasicAuthenticator read FAutenticador write SetAutenticador;
    property RestClient: TRESTClient read FRestClient write SetRestClient;
    property RestResponse: TRESTResponse read FRestResponse write SetRestResponse;
    property RestRequest: TRESTRequest read FRestRequest write SetRestRequest;
    procedure CancelarSmsAgendado(ipParametros: TpmSmsInputCancelamento; ipExecutarThread: Boolean = True);
    function EnviarSms(ipParametros: TpmSmsInputEnvio; ipExecutarThread: Boolean = True): Integer;

    constructor Create(ipCon: TFDConnection);
    destructor Destroy; override;
  end;

implementation

uses
  Vcl.Dialogs, pSCPrincipal, System.RegularExpressions, pAesCrypto;

{ TpmSms }

procedure TpmSms.CancelarSmsAgendado(ipParametros: TpmSmsInputCancelamento; ipExecutarThread: Boolean = True);
var
  vaParametros: TpmSmsInputCancelamento;
begin
  vaParametros := TpmSmsInputCancelamento.Create; // free na funcao finalizarcancelarsmsagendado
  vaParametros.Codigo_Sms_Log := ipParametros.Codigo_Sms_Log;
  vaParametros.TipoEnvio := ipParametros.TipoEnvio;
  vaParametros.NumProc := ipParametros.NumProc;
  vaParametros.Usuario := ipParametros.Usuario;
  // preparando o restrequest
  RestRequest.Params.Clear;
  RestRequest.Resource := ''; // coCancelaSmsAgendado + '/' + IntToStr(ipCodigo);
  RestClient.BaseURL := coUrl + '/' + coCancelaSmsAgendado + '/' + IntToStr(vaParametros.Codigo_Sms_Log);
  RestRequest.Method := rmPOST;
  RestResponse.RootElement := coRootElementCancelar;
  if ipExecutarThread then
    Begin
      FExecutandoEmThread := True;
//      TThread.CreateAnonymousThread(
//        procedure
//        begin
//          RestRequest.Execute;
//          RestResponseAdapter.Active := True;
//          FinalizarCancelarSmsAgendado(vaParametros);
//          FreeAndNil(FRestRequest);
//          Self.Free;
//        end).Start;
      RestRequest.ExecuteAsync(
        procedure
        begin
          FExecutandoEmThread := True;
          RestResponseAdapter.Active := True;
          FinalizarCancelarSmsAgendado(vaParametros);
          FreeAndNil(FRestRequest);
          Self.Free;
        end);
    end
  else
    Begin
      FExecutandoEmThread := False;
      RestRequest.Execute;
      RestResponseAdapter.Active := True;
      FinalizarCancelarSmsAgendado(vaParametros);
    End
end;

constructor TpmSms.Create(ipCon: TFDConnection);
var
  vaLogin, vaSenha: string;
begin
  if ipCon = nil then
    Begin
      FConnCriada := True;
      Conn := SCPrincipal.fpuCriarConnection
    end
  else
    Begin
      FConnCriada := False;
      Conn := ipCon;
    end;

  pvAux := TpmADQuery.Create(nil);
  pvAux.Connection := Conn;
  pvAux.SQL.Text := 'Select first 1 login,senha from SMS_CONFIGURACAO';
  pvAux.Open;
  if pvAux.RecordCount > 0 then
    Begin
      vaLogin := pvAux.FieldByName('login').AsString;
      vaSenha := TAesCripto.Descriptografar(pvAux.FieldByName('senha').AsString);
      Autenticador := THTTPBasicAuthenticator.Create(vaLogin, vaSenha);
      RestClient := TRESTClient.Create(coUrl);
      RestClient.Authenticator := Autenticador;
      RestClient.Accept := coRestClientAccept;
      RestClient.AcceptCharset := coRestClientAcceptCharset;
      RestClient.AcceptEncoding := coRestClientAcceptEncoding;
      RestResponse := TRESTResponse.Create(nil);
      RestResponse.ContentType := coRestResponseContentType;
      RestRequest := TRESTRequest.Create(nil);
      RestRequest.Client := RestClient;
      RestRequest.Response := RestResponse;
      RestRequest.Timeout := coRestRequestTimeOut;
      pvCds := TClientDataSet.Create(nil);
      RestResponseAdapter := TRESTResponseDataSetAdapter.Create(nil);
      RestResponseAdapter.AutoUpdate := False;
      RestResponseAdapter.Response := RestResponse;
      RestResponseAdapter.Dataset := pvCds;
    End
  else
    raise Exception.Create('Sms não configurado!');
  FExecutandoEmThread := False;
end;

destructor TpmSms.Destroy;
begin
  if Assigned(Autenticador) then
    FreeAndNil(FAutenticador);
  if Assigned(RestClient) then
    Begin
      RestClient.Disconnect;
      FreeAndNil(FRestClient);
    End;
  if Assigned(RestResponse) then
    FreeAndNil(FRestResponse);
  if Assigned(RestRequest) and (not FExecutandoEmThread) then
    begin
      FreeAndNil(FRestRequest);
    end;
  if Assigned(pvAux) then
    Begin
      pvAux.Close;
      FreeAndNil(pvAux);
    end;
  if Assigned(pvCds) then
    Begin
      pvCds.Close;
      FreeAndNil(pvCds);
    end;
  if Assigned(RestResponseAdapter) then
    FreeAndNil(FRestResponseAdapter);
  if Assigned(Conn) and (FConnCriada) then
    Begin
      Conn.Close;
      FreeAndNil(FConn);
    end;
  inherited;
end;

function TpmSms.EnviarSms(ipParametros: TpmSmsInputEnvio; ipExecutarThread: Boolean = True): Integer;
var
  vaStringEnvio: string;
  vaParametros: TpmSmsInputEnvio;
  vaProc: TThreadProcedure;
begin
  // precisamos copiar os parametros caso contrario vai dar av se chamado pelo datasnap
  vaParametros := TpmSmsInputEnvio.Create; // vai receber o free na funcao de finalizarenvio
  vaParametros.Codigo_Medicos := ipParametros.Codigo_Medicos;
  vaParametros.Msg := TRegEx.Replace(ipParametros.Msg, '\r\n', '\n', [roSingleLine]);
  vaParametros.Destinatario := ipParametros.Destinatario;
  vaParametros.Remetente := ipParametros.Remetente;
  vaParametros.NumProc := ipParametros.NumProc;
  vaParametros.Tipo_Envio := ipParametros.Tipo_Envio;
  vaParametros.Usuario := ipParametros.Usuario;
  vaParametros.DataHoraAgendada := ipParametros.DataHoraAgendada;
  // preparando o restrequest
  RestRequest.Params.Clear;
  RestRequest.Resource := coUrlEnvio;
  RestRequest.Method := rmPOST;
  RestResponse.RootElement := coRootElementEnvio;
  // pegando o codigo
  pvAux.Close;
  pvAux.SQL.Text := '{IF MSSQL}select next value for GEN_SMS_LOG_CODIGO as GEN_ID{FI}' + #13 +
    '{IF FIREBIRD}Select GEN_ID(GEN_SMS_LOG_CODIGO,1) from rdb$database{FI}';
  pvAux.Open;
  FidMensagem := pvAux.FieldByName('GEN_ID').AsString;
  Result := StrToInt(FidMensagem);
  // fazendo o envio
  try
    /// Achei mais facil usar a string mesmo em vez de fazer o json completo
    vaStringEnvio :=
      '{"sendSmsRequest": { ';
    if vaParametros.Remetente <> '' then
      vaStringEnvio := vaStringEnvio + '    "from": "' + vaParametros.Remetente + '",';
    vaStringEnvio := vaStringEnvio + '"to": "' + vaParametros.Destinatario + '",';
    if vaParametros.DataHoraAgendada > Now then
      vaStringEnvio := vaStringEnvio + '"schedule": "' + FormatDateTime('yyyy-mm-dd', vaParametros.DataHoraAgendada) + 'T' + FormatDateTime('hh:nn:ss', vaParametros.DataHoraAgendada) + '",';
    vaStringEnvio := vaStringEnvio + '    "id": "' + FidMensagem + '",' +
      '    "msg": "' + vaParametros.Msg + '"    }}';
    RestRequest.Params.Add;
    RestRequest.Params[0].ContentType := ctAPPLICATION_JSON;
    RestRequest.Params[0].Kind := pkGETorPOST;
    RestRequest.Params[0].Options := [];
    RestRequest.Params[0].Value := vaStringEnvio;
    if not ipExecutarThread then
      Begin
        FExecutandoEmThread := False;
        RestRequest.Execute;
        RestResponseAdapter.Active := True;
        if pvCds.FieldCount > 0 then
          FinalizarEnvioSms(vaParametros)
        else
          Begin
            GravarLogErro(vaParametros.Destinatario, 'Erro ao Enviar SMS', 'Erro ao solicitar o envio de SMS.', vaParametros.Tipo_Envio, vaParametros.NumProc, vaParametros.Usuario);
            if Assigned(vaParametros) then
              FreeAndNil(vaParametros);
          end;
      end
    else
      Begin
        FExecutandoEmThread := True;
        TThread.CreateAnonymousThread(
          procedure
          begin
            RestRequest.Execute;
            RestResponseAdapter.Active := True;
            try
              if pvCds.FieldCount > 0 then
                FinalizarEnvioSms(vaParametros) // vaparametros vai receber free nesta funcao
              else
                Begin
                  GravarLogErro(vaParametros.Destinatario, 'Erro ao Enviar SMS', 'Erro ao solicitar o envio de SMS.', vaParametros.Tipo_Envio, vaParametros.NumProc, vaParametros.Usuario);
                  if Assigned(vaParametros) then
                    FreeAndNil(vaParametros);
                end;
            finally
              FreeAndNil(FRestRequest);
              Self.Free;
            end
          end).Start;

//        RestRequest.ExecuteAsync(
//          procedure
//          begin
//            FExecutandoEmThread := True;
//            RestResponseAdapter.Active := True;
//            try
//              if pvCds.FieldCount > 0 then
//                FinalizarEnvioSms(vaParametros) // vaparametros vai receber free nesta funcao
//              else
//                Begin
//                  GravarLogErro(vaParametros.Destinatario, 'Erro ao Enviar SMS', 'Erro ao solicitar o envio de SMS.', vaParametros.Tipo_Envio, vaParametros.NumProc, vaParametros.Usuario);
//                  if Assigned(vaParametros) then
//                    FreeAndNil(vaParametros);
//                end;
//            finally
//              FreeAndNil(FRestRequest);
//              Self.Free;
//            end
//          end);
      end;
  except
    on e: Exception do
      Begin
        GravarLogErro(vaParametros.Destinatario, 'Erro ao Enviar SMS', e.Message, vaParametros.Tipo_Envio, vaParametros.NumProc, vaParametros.Usuario);
        if Assigned(vaParametros) then
          FreeAndNil(vaParametros);
      End;
  end;

end;

procedure TpmSms.FinalizarCancelarSmsAgendado(ipParametros: TpmSmsInputCancelamento);
begin
  try
    pvAux.Close;
    try
      pvAux.SQL.Text := 'update sms_log ' +
        '   set sms_log.status = :ip_status, ' +
        '       sms_log.msg_status = :ip_msg_status, ' +
        '       sms_log.detail_code = :ip_detail_codigo, ' +
        '       sms_log.msg_detail = :ip_msg_detail, ' +
        '       sms_log.data_cancelamento=current_timestamp, ' +
        '       sms_log.usuario = :ip_usuario, ' +
        '       sms_log.usuariodh= current_timestamp ' +
        'where sms_log.codigo=:ip_codigo ';
      pvAux.ParamByName('ip_codigo').AsInteger := ipParametros.Codigo_Sms_Log;
      pvAux.ParamByName('ip_status').AsInteger := pvCds.FieldByName('statusCode').AsInteger;
      pvAux.ParamByName('ip_detail_codigo').AsInteger := pvCds.FieldByName('detailCode').AsInteger;
      pvAux.ParamByName('ip_msg_detail').AsString := SmsPegarDetailMsgCode(pvCds.FieldByName('detailCode').AsInteger);
      pvAux.ParamByName('ip_msg_status').AsString := smsStatusCode[pvCds.FieldByName('statuscode').AsInteger];
      pvAux.ParamByName('ip_usuario').AsInteger := ipParametros.Usuario;
      pvAux.ExecSQL;
      pvAux.Close;
    except
      on e: Exception do
        GravarLogErro(ipParametros.Destinatario, 'Erro ao gravar Log do cancelamento de SMS agendado', e.Message, ipParametros.TipoEnvio, ipParametros.NumProc, ipParametros.Usuario);
    end;
  finally
    ipParametros.Free;
  end;
end;

procedure TpmSms.FinalizarEnvioSms(ipParametros: TpmSmsInputEnvio);
begin
  try
    pvAux.Close;
    pvAux.SQL.Text := 'insert into sms_log (sms_log.codigo, ' +
      '   sms_log.codigo_medicos, ' +
      '   sms_log.texto, ' +
      '   sms_log.destinatario, ' +
      '   sms_log.tipo_envio, ' +
      '   sms_log.status, ' +
      '   sms_log.data_hora_solicitacao_envio, ' +
      '   sms_log.data_hora_agendamento, ' +
      '   sms_log.data_hora_envio, ' +
      '   sms_log.numproc, ' +
      '   sms_log.remetente, ' +
      '   sms_log.detail_code, ' +
      '   sms_log.msg_status, ' +
      '   sms_log.msg_detail, ' +
      '   sms_log.usuarioinc, ' +
      '   sms_log.usuario, ' +
      '   sms_log.usuarioincdh, ' +
      '   sms_log.usuariodh) ' +
      '       values (:ip_codigo, ' +
      '               :ip_codigo_medicos, ' +
      '               :ip_texto, ' +
      '               :ip_destinatario, ' +
      '               :ip_tipo_envio, ' +
      '               :ip_status, ' +
      '               current_timestamp, ' +
      '               :ip_data_hora_agendamento, ' +
      '               current_timestamp, ' +
      '               :ip_numproc, ' +
      '               :ip_remetente, ' +
      '               :ip_detail_code, ' +
      '               :ip_msg_status, ' +
      '               :ip_msg_detail, ' +
      '               :ip_usuario,  ' +
      '               :ip_usuario,   ' +
      '               current_timestamp, ' +
      '               current_timestamp)';
    pvAux.ParamByName('ip_codigo').AsInteger := StrToInt(FidMensagem);
    if ipParametros.Codigo_Medicos > 0 then
      pvAux.ParamByName('ip_codigo_medicos').AsInteger := ipParametros.Codigo_Medicos
    else
      pvAux.ParamByName('ip_codigo_medicos').Clear;
    pvAux.ParamByName('ip_texto').AsString := ipParametros.Msg;

    pvAux.ParamByName('ip_destinatario').AsString := ipParametros.Destinatario;
    pvAux.ParamByName('ip_tipo_envio').AsInteger := ipParametros.Tipo_Envio;
    pvAux.ParamByName('ip_status').AsInteger := pvCds.FieldByName('statuscode').AsInteger;
    if ipParametros.DataHoraAgendada > Now then
      pvAux.ParamByName('ip_data_hora_agendamento').AsDateTime := ipParametros.DataHoraAgendada
    else
      pvAux.ParamByName('ip_data_hora_agendamento').Clear;
    if ipParametros.NumProc > 0 then
      pvAux.ParamByName('ip_numproc').AsInteger := ipParametros.NumProc
    else
      pvAux.ParamByName('ip_numproc').Clear;
    pvAux.ParamByName('ip_remetente').AsString := ipParametros.Remetente;
    pvAux.ParamByName('ip_detail_code').AsInteger := pvCds.FieldByName('detailCode').AsInteger;
    pvAux.ParamByName('ip_msg_status').AsString := smsStatusCode[pvCds.FieldByName('statuscode').AsInteger];
    pvAux.ParamByName('ip_msg_detail').AsString := SmsPegarDetailMsgCode(pvCds.FieldByName('detailCode').AsInteger);
    pvAux.ParamByName('ip_usuario').AsInteger := ipParametros.Usuario;
    try
      pvAux.ExecSQL;
      pvAux.Close;
    except
      on e: Exception do
        GravarLogErro(ipParametros.Destinatario, 'Erro ao gravar Log do do envio do SMS', e.Message, ipParametros.Tipo_Envio, ipParametros.NumProc, ipParametros.Usuario);
    end;
  finally
    ipParametros.Free;
  end;

// ShowMessage(pvCds.Fields[0].AsString);
// ShowMessage(RestResponse.Content);
end;

procedure TpmSms.GravarLogErro(ipDestinatario, ipObs, ipMsg: string; ipTipoEnvio, ipNumProc, ipUsuario: Integer);
begin
  pvAux.Close;
  pvAux.SQL.Text := 'insert into sms_log_erro ( ' +
    '  sms_log_erro.codigo, ' +
    '  sms_log_erro.destinatario, ' +
    '  sms_log_erro.tipo_envio, ' +
    '  sms_log_erro.numproc, ' +
    '  sms_log_erro.obs, ' +
    '  sms_log_erro.msg_erro, ' +
    '  sms_log_erro.data_hora_erro, ' +
    '  sms_log_erro.usuario) ' +
    ' values( ' +
    ' (next value for GEN_SMS_LOG_ERRO_CODIGO), ' +
    '  :ipDestinatario, ' +
    '  :ipTipoEnvio, ' +
    '  :ipNumProc, ' +
    '  :ipObs, ' +
    '  :ipMsgErro, ' +
    '  :ipDataHoraErro, ' +
    '  :ipCodigoUsuario)';
  pvAux.ParamByName('ipDestinatario').AsString := ipDestinatario;
  pvAux.ParamByName('ipTipoEnvio').AsInteger := ipTipoEnvio;
  pvAux.ParamByName('ipNumProc').AsInteger := ipNumProc;
  pvAux.ParamByName('ipObs').AsString := ipObs;
  pvAux.ParamByName('ipMsgErro').AsString := ipMsg;
  pvAux.ParamByName('ipDataHoraErro').AsDateTime := Now;
  pvAux.ParamByName('ipCodigoUsuario').AsInteger := ipUsuario;
  try
    pvAux.ExecSQLCommit;
    pvAux.Close;
  except
      // não faz nada apenas pra nao aparecer erro algum
  end;
end;

procedure TpmSms.SetAutenticador(const Value: THTTPBasicAuthenticator);
begin
  FAutenticador := Value;
end;

procedure TpmSms.SetConn(const Value: TFDConnection);
begin
  FConn := Value;
end;

procedure TpmSms.SetRestClient(const Value: TRESTClient);
begin
  FRestClient := Value;
end;

procedure TpmSms.SetRestRequest(const Value: TRESTRequest);
begin
  FRestRequest := Value;
end;

procedure TpmSms.SetRestResponse(const Value: TRESTResponse);
begin
  FRestResponse := Value;
end;

procedure TpmSms.SetRestResponseAdapter(
  const Value: TRESTResponseDataSetAdapter);
begin
  FRestResponseAdapter := Value;
end;

end.
