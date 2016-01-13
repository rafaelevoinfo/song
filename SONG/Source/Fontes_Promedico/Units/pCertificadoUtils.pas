unit pCertificadoUtils;

interface

uses
  SBTypes, SBX509Ext, System.Classes, SBRDN, SBX509;

function CertObterErroCertificado(ipCodigoErrro: Integer): string;
function CertByteArrayParaStringHex(ipByteArray: ByteArray): string;
function CertObterAlgoritimoEncriptacao(Algorithm: Integer): string;
function CertObterOIDString(const S: ByteArray): string;
function CertValidadeParaString(ipValidade: TSBCertificateValidity): string;
function CertRazaoParaString(ipRazao: TSBCertificateValidityReason): string;

implementation

uses
  System.SysUtils, SBConstants, SBUtils, SBStrUtils;

function CertRazaoParaString(ipRazao: TSBCertificateValidityReason): string;
begin
  Result := '';
  if vrBadData in ipRazao then
    Result := Result + 'Data Inv�lida,';
  if vrRevoked in ipRazao then
    Result := Result + 'Revogado,';
  if vrNotYetValid in ipRazao then
    Result := Result + 'Ainda n�o � V�lido,';
  if vrExpired in ipRazao then
    Result := Result + 'Expirado,';
  if vrInvalidSignature in ipRazao then
    Result := Result + 'Assinatura Inv�lida.,';
  if vrUnknownCA in ipRazao then
    Result := Result + 'CA Desconhecida,';
  if vrCAUnauthorized in ipRazao then
    Result := Result + 'CA n�o autorizada,';
  if vrCRLNotVerified in ipRazao then
    Result := Result + 'CRL n�o verificado,';
  if vrOCSPNotVerified in ipRazao then
    Result := Result + 'OCSP n�o verificado,';
  if vrIdentityMismatch in ipRazao then
    Result := Result + 'Identidades n�o batem,';
  if vrNoKeyUsage in ipRazao then
    Result := Result + 'N�o possui Chave de Uso,';
  if vrBlocked in ipRazao then
    Result := Result + 'bloqueado,';

  Delete(Result, Length(Result), 1);
end;

function CertValidadeParaString(ipValidade: TSBCertificateValidity): string;
Begin
  case ipValidade of
    cvOk:
      Result := 'V�lido';
    cvSelfSigned:
      Result := 'Auto-Assinado';
    cvInvalid:
      Result := 'Inv�lido';
    cvStorageError:
      Result := 'Erro de Storage';
    cvChainUnvalidated:
      Result := 'Cadeia de Certificados Inv�lida';
  end;
End;

function CertObterOIDString(const S: ByteArray): string;
begin
  if CompareContent(S, SB_CERT_OID_COMMON_NAME) then
    Result := 'CN'
  else
    if CompareContent(S, SB_CERT_OID_COUNTRY) then
    Result := 'C'
  else
    if CompareContent(S, SB_CERT_OID_LOCALITY) then
    Result := 'L'
  else
    if CompareContent(S, SB_CERT_OID_STATE_OR_PROVINCE) then
    Result := 'S'
  else
    if CompareContent(S, SB_CERT_OID_ORGANIZATION) then
    Result := 'O'
  else
    if CompareContent(S, SB_CERT_OID_ORGANIZATION_UNIT) then
    Result := 'OU'
  else
    if CompareContent(S, SB_CERT_OID_EMAIL) then
    Result := 'Email'
  else
    Result := 'Desconhecido';
end;

function CertObterAlgoritimoEncriptacao(Algorithm: Integer): string;
begin
  case (Algorithm) of
    SB_CERT_ALGORITHM_ID_RSA_ENCRYPTION:
      Result := 'RSA';
    SB_CERT_ALGORITHM_MD2_RSA_ENCRYPTION:
      Result := 'MD2 com RSA';
    SB_CERT_ALGORITHM_MD5_RSA_ENCRYPTION:
      Result := 'MD5 com RSA';
    SB_CERT_ALGORITHM_SHA1_RSA_ENCRYPTION:
      Result := 'SHA1 com RSA';
    SB_CERT_ALGORITHM_ID_DSA:
      Result := 'DSA';
    SB_CERT_ALGORITHM_ID_DSA_SHA1:
      Result := 'DSA com SHA1';
    SB_CERT_ALGORITHM_DH_PUBLIC:
      Result := 'DH';
    SB_CERT_ALGORITHM_SHA224_RSA_ENCRYPTION:
      Result := 'SHA224 com RSA';
    SB_CERT_ALGORITHM_SHA256_RSA_ENCRYPTION:
      Result := 'SHA256 com RSA';
    SB_CERT_ALGORITHM_SHA384_RSA_ENCRYPTION:
      Result := 'SHA384 com RSA';
    SB_CERT_ALGORITHM_SHA512_RSA_ENCRYPTION:
      Result := 'SHA512 com RSA';
    SB_CERT_ALGORITHM_ID_RSAPSS:
      Result := 'RSA-PSS';
    SB_CERT_ALGORITHM_ID_RSAOAEP:
      Result := 'RSA-OAEP';
    SB_CERT_ALGORITHM_EC:
      Result := 'EC';
    SB_CERT_ALGORITHM_SHA1_ECDSA:
      Result := 'ECDSA com SHA1';
    SB_CERT_ALGORITHM_SHA224_ECDSA:
      Result := 'ECDSA com SHA224';
    SB_CERT_ALGORITHM_SHA256_ECDSA:
      Result := 'ECDSA com SHA256';
    SB_CERT_ALGORITHM_SHA384_ECDSA:
      Result := 'ECDSA com SHA384';
    SB_CERT_ALGORITHM_SHA512_ECDSA:
      Result := 'ECDSA com SHA512';
    SB_CERT_ALGORITHM_SPECIFIED_ECDSA:
      Result := 'ECDSA com specified';
    SB_CERT_ALGORITHM_GOST_R3410_1994:
      Result := 'GOST R34.10-1994';
    SB_CERT_ALGORITHM_GOST_R3410_2001:
      Result := 'GOST R34.10-2001';
    SB_CERT_ALGORITHM_GOST_R3411_WITH_R3410_1994:
      Result := 'GOST R34.10-1994 with R34.11-1994';
    SB_CERT_ALGORITHM_GOST_R3411_WITH_R3410_2001:
      Result := 'GOST R34.10-2001 with R34.11-1994';

    SB_CERT_ALGORITHM_UNKNOWN:
      Result := 'Desconhecido';
  end;
end;

function CertByteArrayParaStringHex(ipByteArray: ByteArray): string;
var
  vaCont: Integer;
begin
  Result := '';
  for vaCont := 0 to Length(ipByteArray) - 1 do
    Result := Result + IntToHex(ipByteArray[vaCont], 2) + ' ';

end;

function CertObterErroCertificado(ipCodigoErrro: Integer): string;
begin
  case ipCodigoErrro of
    0:
      Result := 'OK';
    20481:
      Result := 'Buffer n�o cont�m uma sequ�ncia v�lida (Chave Privada)';
    20482:
      Result := 'Senha inv�lida';
    20493:
      Result := 'Tentativa de salvar uma chave privada, quando a mesma n�o existe';
    20484:
      Result := 'Tentativa de salvar a chave para um algoritimo que n�o suporta chaves privadas';
    20485:
      Result := 'Chave Privada est� em um formato iv�lido';
    20486:
      Result := 'Erro interno, contate o suporte';
    20487:
      Result := 'Espa�o insuficiente no buffer para armazenar o certificado';
    20488:
      Result := 'Buffer n�o cont�m um certificado';
    20489:
      Result := 'Formato n�o reconhecido';
    7937:
      Result := 'Buffer n�o cont�m uma sequencia v�lida (PFX)';
    7938:
      Result := 'Mensagem PFX n�o cont�m um certificado';
    7939:
      Result := 'Alguns parametros no PFX s�o inv�lidos';
    7940:
      Result := 'PFX inv�lido';
    7941:
      Result := 'PFX poussi conte�dos inv�lidos';
    7942:
      Result := 'AuthenticatedSafe inv�lido (PFX)';
    7943:
      Result := 'Mac inv�lido (PFX)';
    7944:
      Result := 'A entidade localizada na mensagem PFX possui conte�do inv�lido';
    7945:
      Result := 'A entidade localizada na mensagem PFX possui formato inv�lido';
    7946:
      Result := 'A chave privada no PFX possui formato inv�lido';
    7947:
      Result := 'Salvando: Inv�lido PBE algoritmo especificado, Carregando: Foi usando um Algoritmo PBE desconhecido ao codificar a mensagem';
    7948:
      Result := 'Erro interno, contate o suporte';
    7949:
      Result := 'Par�metros no algoritmo PBE (interation count e salt) s�o inv�lidos ';
    7950:
      Result := 'O certificado contido na mensagem PFX possui um formato inv�lido';
    7951:
      Result := 'O certificado contido na mensagem PFX possui um tipo n�o suportado';
    7952:
      Result := 'A chave privada contida na mensagem PFX possui um formato inv�lido';
    7953:
      Result := 'Verifica��o MAC falhou';
    7954:
      Result := 'Salvando: Nada para salvar';
    7955:
      Result := 'Senha inv�lida';
    7956:
      Result := 'Buffer n�o possui espa�o suficiente para codificar o certificado';
    7957:
      Result := 'Estrutura PKCS12 Bag inv�lida';
    7958:
      Result := 'CRL n�o suportado';
  else
    Result := 'Erro desconhecido';
  end;
end;

end.
