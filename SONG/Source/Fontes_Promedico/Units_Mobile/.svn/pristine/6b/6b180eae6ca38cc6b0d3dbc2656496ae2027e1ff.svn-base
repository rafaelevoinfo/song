unit pFuncoesMobile;

interface

Uses
{$IFDEF IOS}
  iOSapi.UIKit,
{$ENDIF}
{$IFDEF ANDROID}
  androidapi.JNI.JavaTypes,
  androidapi.Helpers,
  androidapi.JNI.Os,
{$ENDIF}
  Fmx.Dialogs,
  System.DateUtils,
  System.SysUtils,
  Data.DBXJSON,
  System.IOUtils,
  CriptoMobile, System.JSON;
/// <summary>
/// Funcao para criptografar / Descriptografar dados do promedico
/// </summary>
function CriptoDecripto(ipCripDecrip: Integer; ipKey, ipTexto: String): String;

/// <summary>
/// Busca informações do dispositivo mobile
/// </summary>
function BuscarNomeDispositivo: String;

/// <summary>
/// Efetua o capitalize das strings
/// </summary>
function Capitalize(ipString: string): String;

/// <summary>
/// Formata a data/hora/separador decimal do sistema
/// </summary>
procedure FormatarDataHoraSistema;

/// <param name="ipJSONArray">
/// JSonArray
/// </param>
/// <param name="ipCampo">
/// Campo que queremos obter
/// </param>
function JSONArrayToString(ipJSONArray: TJSONArray; ipCampo: String): String; // recebe um JSONArray e o campo que deseja pegar e retorna o valor do campo;

/// <summary>
/// Diferenca entre duas datas
/// </summary>
procedure DateDiff(ipDate1, ipDate2: TDateTime; var ioDia, ioMes, ioAno: Word);
/// <summary>
/// Calcula a Idade
/// </summary>
function Pegar_Idade(ipDataNascimento, ipData_Referencia: TDate; ipCalcularMeses1Ano: Boolean = True): string;
// Pega o endereco padrao dos documentos
function PegarEnderecoPadraoDocumentos: string;
//funcao criptografia sha1 com salt padrao
function CriptografarSha1ComSaltPadrao(ipSenha: String): String;

implementation

uses
  pTypes;

function CriptografarSha1ComSaltPadrao(ipSenha: String): String;
begin
  result := TCriptografa.fpuTextToCriptoSha1(ipSenha + coSaltSHA1 + IntToStr(Length(ipSenha)));
end;

function PegarEnderecoPadraoDocumentos: string;
Begin
  Result := TPath.GetDocumentsPath;
End;

procedure DateDiff(ipDate1, ipDate2: TDateTime; var ioDia, ioMes, ioAno: Word);
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
      Inc(ioMes, 12);
      Dec(ioAno);
    end;
  Inc(ioMes, Month2 - Month1);
  if Day2 < Day1 then
    begin
      Inc(ioDia, DaysInMonth(ipDate1));
      if ioMes = 0 then
        begin
          Dec(ioAno);
          ioMes := 11;
        end
      else
        Dec(ioMes);
    end;
  Inc(ioDia, Day2 - Day1);
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
        Result := IntToStr(vaMeses) + ' Mês e '
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

End;

function JSONArrayToString(ipJSONArray: TJSONArray; ipCampo: String): String; // recebe um JSONArray e o campo que deseja pegar e retorna o valor do campo;
var
  ja: TJSONArray;
  jSubObj, vajsonObj: TJSONObject;
  i, J: Integer;
  jSubPar, jp: TJSONPair;
begin
  try
    Result := '';
    vajsonObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes('{"result":' + ipJSONArray.ToString + '}'), 0) as TJSONObject;
    jp := vajsonObj.Get(0); // pega o par zero
    ja := (jp.JsonValue as TJSONArray); // do par zero pega o valor, que é array
    for i := 0 to ja.Size - 1 do // itera o array para pegar cada elemento
      begin
        jSubObj := (ja.Get(i) as TJSONObject); // pega cada elemento do array, onde cada elemento é um objeto, neste caso, em função da string JSON montada acima
        for J := 0 to jSubObj.Size - 1 do // quantidade de pares do objeto
          begin
            jSubPar := jSubObj.Get(J); // pega o par no índice j
            if AnsiCompareText(jSubPar.JsonString.Value, ipCampo) = 0 then // quer dizer que é o mesmo campo vamos retornar o valor;
              begin
                Result := jSubPar.JsonValue.Value; // atribuindo os valores do json para cds;
                break;
              end;
          end;
      end;
  finally
    vajsonObj.Free;
  end;
end;

procedure FormatarDataHoraSistema;
begin
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  FormatSettings.ShortTimeFormat := 'HH:mm:ss';
  FormatSettings.DecimalSeparator := ',';
  FormatSettings.DateSeparator := '/';
  FormatSettings.TimeSeparator := ':';
end;

function Capitalize(ipString: string): String;
var
  IsStartWord: Boolean;
  i: Integer;
  ch: Char;
  vaTemp: String;
begin
  Result := '';
  if (ipString.Length > 0) then
    Begin
      vaTemp := ipString.ToLower;
      IsStartWord := True;
      for i := 0 to vaTemp.Length - 1 do
        begin
          vaTemp.CopyTo(i, ch, 0, 1);
          if IsStartWord then
            ch := UpCase(ch);
          IsStartWord := (ch = ' ');
          Result := Result + ch;
        end;
    End;
End;

function BuscarNomeDispositivo: String;
{$IFDEF IOS}
var
  Device: UIDevice;
  DeviceType: Cardinal;
{$ENDIF}
Begin
  Result := 'Não Mobile';
{$IFDEF IOS}
  Device := TUIDevice.Wrap(TUIDevice.OCClass.currentDevice);
  DeviceType := Device.userInterfaceIdiom;
  Result := Device.systemName.UTF8String + '(' + Device.systemVersion.UTF8String + ')';
  case DeviceType of
    UIUserInterfaceIdiomPhone:
      Result := Result + ' - Iphone';
    UIUserInterfaceIdiomPad:
      Result := Result + ' - Ipad';
  end;
{$ENDIF}
{$IFDEF ANDROID}
  Result := Format('Device Type: %s', [JStringToString(TJBuild.JavaClass.MODEL)]) + '( ' + Format('OS Version: %s', [JStringToString(TJBuild_VERSION.JavaClass.RELEASE)]) + ')';
{$ENDIF}

End;

function CriptoDecripto(ipCripDecrip: Integer; ipKey,
  ipTexto: String): String;
var
  MyCripto: TCriptografa;
begin
  try
    if ipKey = '' then
      begin
        ShowMessage('Não foi passado a Chave para Criptografar ou Descriptografar.');
        Exit('');
      end;

    MyCripto := TCriptografa.Create(nil);
    // retirado validacao por causa do promedico, estava usando chave padrao em muitos lugares
    // if ipKey = MyCripto.Key then
    // begin
    // MessageTela(False, 1, 'Favor informar Chave diferente de Chave padrão.', 0);
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
  end;
end;

end.
