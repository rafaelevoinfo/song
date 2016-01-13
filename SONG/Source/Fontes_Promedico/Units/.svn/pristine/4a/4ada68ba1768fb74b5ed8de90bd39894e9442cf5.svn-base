unit pAesCrypto;

interface

uses
  SBSymmetricCrypto;

type
  TAesCripto = class
  private
    FSenha: string;
    FSalt: String;
    FKey: string;
    FIV: string;
    FFactory: TElSymmetricCryptoFactory;
    FTipoCriptografia: TElSymmetricCrypto;
    FKeyMaterial: TElSymmetricKeyMaterial;

    procedure SetSenha(const Value: string);
{$REGION 'Documentacao'}
    /// <summary>
    /// Caso FSenha esteja vazio vamos pegar a senha padrão
    /// </summary>
{$ENDREGION}
    function GetSenha: string;
    procedure SetSalt(const Value: String);
    procedure SetIV(const Value: string);
    procedure SetKey(const Value: string);
    procedure SetFactory(const Value: TElSymmetricCryptoFactory);
{$REGION 'Documentacao'}
    /// <summary>
    /// Gera o salt + key + iv
    /// </summary>
{$ENDREGION}
    procedure GerarSaltKey(ipSalt: string);
  public
    property Senha: string read GetSenha write SetSenha;
{$REGION 'Documentacao'}
    /// <summary>
    /// Salt (Binario)
    /// </summary>
{$ENDREGION}
    property Salt: String read FSalt write SetSalt;
    property Key: string read FKey write SetKey;
    property IV: string read FIV write SetIV;
    {$REGION 'Documentacao'}
    /// <summary>
    ///   Criptografa uma string, retornando a string ja criptografada
    /// </summary>
    /// <param name="ipString">
    ///   Texto a ser criptografado
    /// </param>
    /// <param name="ipSalt">
    ///   Salt (Opcional) caso não seja passado sera gerado um aleatoriamente
    /// </param>
    /// <param name="ipSenha">
    ///   Senha a ser usada, se não for passada sera usada a padrao
    /// </param>
    /// <example>
    ///   <para>
    ///     TAesCripto.Criptografar('teste');
    ///   </para>
    ///   <para>
    ///     showmessage(TAesCripto.Descriptografar(TAesCripto.Criptografar('teste')));
    ///   </para>
    /// </example>
    {$ENDREGION}
    class function Criptografar(ipString: string; ipSalt: String = ''; ipSenha: string = ''): string;
    {$REGION 'Documentacao'}
    /// <summary>
    ///   Descriptografa uma string, caso o salt nao seja informado sera usado
    ///   os primeiros 16 digitos
    /// </summary>
    /// <param name="ipString">
    ///   String criptografada
    /// </param>
    /// <param name="ipSalt">
    ///   Salt (Opcional)
    /// </param>
    /// <param name="ipSenha">
    ///   Senha (Opcional)
    /// </param>
    /// <example>
    ///   <para>
    ///     TAesCripto.Descriptografar('17104C16247B4A30Xys8+MpVURK5SFagbdTyBQ==');
    ///   </para>
    ///   <para>
    ///     showmessage(TAesCripto.Descriptografar(TAesCripto.Criptografar('teste')));
    ///   </para>
    /// </example>
    {$ENDREGION}
    class function Descriptografar(ipString: string; ipSalt: string = ''; ipSenha: string = ''): string;

{$REGION 'Documentacao'}
    /// <summary>
    /// Cria o KeyMaterial
    /// </summary>
{$ENDREGION}
    function CriarKeyMaterial: TElSymmetricKeyMaterial;
    constructor Create(ipSenha, ipSalt: string);
    destructor Destroy; override;
  end;

implementation

Uses
  SBPKCS5, SBRandom, SBUtils, SBConstants, SBTypes, System.SysUtils,
  SBEncoding;

{ TAesCripto }

constructor TAesCripto.Create(ipSenha, ipSalt: string);
begin
  if ipSenha <> '' then
    Senha := ipSenha;
  GerarSaltKey(ipSalt);
  FFactory := TElSymmetricCryptoFactory.Create;
  FTipoCriptografia := FFactory.CreateInstance(SB_ALGORITHM_CNT_AES256, cmCBC);
  FKeyMaterial := CriarKeyMaterial;
  FTipoCriptografia.KeyMaterial := FKeyMaterial;
end;

function TAesCripto.CriarKeyMaterial: TElSymmetricKeyMaterial;
var
  vaIV, vaKey: ByteArray;
  vaTamamho: integer;
begin
  if (Length(Key) <> 256 div 4) or (Length(IV) <> 128 div 4) then
    raise Exception.Create('Key/IV inválidas');

  SetLength(vaIV, 16);
  vaTamamho := 16;
  SBUtils.StringToBinary(IV, @vaIV[0], vaTamamho);
  SetLength(vaIV, vaTamamho);

  SetLength(vaKey, 32);
  vaTamamho := 32;
  SBUtils.StringToBinary(Key, @vaKey[0], vaTamamho);
  SetLength(vaKey, vaTamamho);

  Result := TElSymmetricKeyMaterial.Create;
  Result.Key := vaKey;
  Result.IV := vaIV;

end;

class function TAesCripto.Criptografar(ipString: string; ipSalt: String = ''; ipSenha: string = ''): string;
var
  vaCripto: TAesCripto;
  vaInBuf, vaOutBuf: ByteArray;
  vaOutSize: integer;
begin
  vaCripto := TAesCripto.Create(ipSenha, ipSalt);
  try
    try
      vaInBuf := BytesOfString(ipString);

      vaOutSize := 0;
      vaCripto.FTipoCriptografia.Encrypt(@vaInBuf[0], Length(vaInBuf), nil, vaOutSize);
      SetLength(vaOutBuf, vaOutSize);
      vaCripto.FTipoCriptografia.Encrypt(@vaInBuf[0], Length(vaInBuf), @vaOutBuf[0], vaOutSize);
      SetLength(vaOutBuf, vaOutSize);

      Result := vaCripto.Salt + Base64EncodeArray(vaOutBuf, false);
    except
      on E: Exception do
        raise Exception.Create('Erro ao Codificar: ' + E.Message);
    end;

  finally
    vaCripto.Free;
  end;
end;

class function TAesCripto.Descriptografar(ipString: string; ipSalt: string = ''; ipSenha: string = ''): string;
var
  vaSalt, vaTexto: String;
  vaCripto: TAesCripto;
  vaInBuf, vaOutBuf: ByteArray;
  vaOutSize: integer;
  vaBufSt : AnsiString;
begin
  if ipSalt = '' then
    Begin
      vaSalt := Copy(ipString, 0, 16);
      vaTexto := Copy(ipString, 17, Length(ipString));
    End;
  vaCripto := TAesCripto.Create(ipSenha,vaSalt);
  try
    try
      vaInBuf := SBEncoding.Base64DecodeArray(vaTexto);
      vaBufSt := StringOfBytes(vaInBuf);

      vaOutSize := 0;
      vaCripto.FTipoCriptografia.Decrypt(@vaInBuf[0], Length(vaInBuf), nil, vaOutSize);
      SetLength(vaOutBuf, vaOutSize);
      vaCripto.FTipoCriptografia.Decrypt(@vaInBuf[0], Length(vaInBuf), @vaOutBuf[0], vaOutSize);
      SetLength(vaOutBuf, vaOutSize);

      Result := StringOfBytes(vaOutBuf);
    except
      on E : Exception do
      raise Exception.Create('Erro ao Decodificar: ' + E.Message);
    end;

  finally
    vaCripto.Free;
  end;
end;

destructor TAesCripto.Destroy;
begin
  if Assigned(FFactory) then
    FFactory.Free;
  if Assigned(FTipoCriptografia) then
    FTipoCriptografia.Free;
  if Assigned(FKeyMaterial) then
    FKeyMaterial.Free;
  inherited;
end;

function TAesCripto.GetSenha: string;
begin
  // valor padrao
  if FSenha = '' then
    Result := '`CNpob*.kytx3!3=e67vj%8tg3vqb6Pn[mfK23|!|YM63u!R4v5D9N45>MA<B2a'
  else
    Result := FSenha;
end;

procedure TAesCripto.GerarSaltKey(ipSalt: string);
var
  vaPBE: TElPKCS5PBE;
  vaTamanho: integer;
  vaKey: ByteArray;
  vaSalt: AnsiString;
begin
  if Length(ipSalt) = 0 then // gerando um salt aleatorio
    Begin
      SetLength(vaSalt, 8);
      SBRndGenerate(@vaSalt[1], 8);
      Salt := BinaryToString(@vaSalt[1], 8);
    End
  else
    begin
      Salt := ipSalt;
      vaTamanho := (Length(Salt) div 2) + 1;
      SetLength(vaSalt, vaTamanho);
      StringToBinary(Salt, @vaSalt[1], vaTamanho);
      SetLength(vaSalt, vaTamanho);
    end;

  vaPBE := TElPKCS5PBE.Create(SB_ALGORITHM_CNT_AES128 { doesn't matter as we do not intend to do any encryption } , SB_ALGORITHM_DGST_SHA256, true);
  try
    vaPBE.Salt := BytesOfString(vaSalt);
    vaPBE.IterationCount := 1;
    vaKey := vaPBE.DeriveKey(Senha, 256 + 128);
  finally
    FreeAndNil(vaPBE);
  end;
  Key := BinaryToString(@vaKey[0], 256 div 8);
  IV := BinaryToString(@vaKey[256 div 8], 128 div 8);
end;

procedure TAesCripto.SetFactory(const Value: TElSymmetricCryptoFactory);
begin
  FFactory := Value;
end;

procedure TAesCripto.SetIV(const Value: string);
begin
  FIV := Value;
end;

procedure TAesCripto.SetKey(const Value: string);
begin
  FKey := Value;
end;

procedure TAesCripto.SetSalt(const Value: string);
begin
  FSalt := Value;
end;

procedure TAesCripto.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

end.
