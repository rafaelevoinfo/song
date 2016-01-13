{ *
*  TCriptografa
*
*  Copyright 97, 99 by Sebastião Elivaldo Ribeiro
*  http://www.utranet.com.br/~elivaldo
*  e-mail: elivaldo@utranet.com.br

* }

unit CriptoMobile;

interface

uses
  FMX.Dialogs,
  System.SysUtils, System.Classes, IdHashMessageDigest,IdHashSHA;

type
  TCriptografa = class(TComponent)
  private
    FKey: string;
    FText: string;
    FCriptoBin: string;
    FCriptoHex: string;
    FInicioString: Integer;
    FCorrecaoSPos: Integer;
    procedure SetText(Value: string);
    procedure SetKey(Value: string);
    procedure SetCriptoBin(Value: string);
    procedure SetCriptoHex(Value: string);
    function Invert(SText: string): string;
    function DecToHex(Number: Integer): string;
    function HexToDec(Number: string): Byte;
    function TamanhoStr(ipString: String): Integer;
  public
    constructor Create(AOwner: TComponent); override;
    function TextToCriptoBin(SText: string): string;
    function TextToCriptoHex(SText: string): string;
    class function fpuTextToCriptoMD5(ipSenha: string): string;
    class function fpuTextToCriptoSha1(ipSenha: String): String;
    function CriptoBinToText(SText: string): string;
    function CriptoHexToText(SText: string): string;
  published
    property CriptoBin: string read FCriptoBin write SetCriptoBin;
    property CriptoHex: string read FCriptoHex write SetCriptoHex;
    property Key: string read FKey write SetKey;
    property Text: string read FText write SetText;
  end;

implementation

// Create
constructor TCriptografa.Create(AOwner: TComponent);
const
  bShareware: Boolean = False;
begin
  inherited Create(AOwner);
  FKey := '1234';
  FInicioString := 1;
  FCorrecaoSPos := 0;
{$IFDEF IOS}
  FInicioString := 0;
  FCorrecaoSPos := 1;
{$ENDIF}
end;

// SetKey
procedure TCriptografa.SetKey(Value: string);
begin
  if FKey <> Value then
    begin
      FKey := Value;
      FText := '';
      FCriptoBin := '';
      FCriptoHex := '';
    end;
end;

// SetText
procedure TCriptografa.SetText(Value: string);
begin
  if FText <> Value then
    begin
      FText := Value;
      FCriptoBin := TextToCriptoBin(FText);
      FCriptoHex := TextToCriptoHex(FText);
    end;
end;

// SetCriptoBin
procedure TCriptografa.SetCriptoBin(Value: string);
begin
  if FCriptoBin <> Value then
    begin
      FCriptoBin := Value;
      FText := CriptoBinToText(FCriptoBin);
      FCriptoHex := TextToCriptoHex(FText);
    end;
end;

// SetCriptoHex
procedure TCriptografa.SetCriptoHex(Value: string);
begin
  if FCriptoHex <> Value then
    begin
      FCriptoHex := Value;
      FText := CriptoHexToText(FCriptoHex);
      FCriptoBin := TextToCriptoBin(FText);
    end;
end;

// TextToCriptoBin
function TCriptografa.TamanhoStr(ipString: String): Integer;
begin
  Result := ipString.Length;
{$IFDEF IOS}
  Result := Result - 1;
{$ENDIF}
end;

function TCriptografa.TextToCriptoBin(SText: string): string;
var
  SPos: Integer;
  BKey: Byte;
  S: Char;
begin
  // inverte texto
  SText := Invert(SText);
  // criptografa
  Result := '';
  for SPos := FInicioString to TamanhoStr(SText) do
    begin
      FKey.CopyTo(((SPos+FCorrecaoSPos) mod FKey.Length), S, 0, 1);
      BKey := Ord(S) + SPos + FCorrecaoSPos;
      Result := Result + Chr(Ord(SText[SPos]) xor BKey);
    end;
end;

// CriptoBinToText
function TCriptografa.CriptoBinToText(SText: string): string;
var
  SPos: Integer;
  BKey: Byte;
  S: Char;
begin
  Result := '';
  // converte
  for SPos := FInicioString to TamanhoStr(SText) do
    begin
      FKey.CopyTo(((SPos+FCorrecaoSPos) mod FKey.Length), S, 0, 1);
      BKey := Ord(S) + SPos + FCorrecaoSPos;
      Result := Result + Chr(Ord(SText[SPos]) xor BKey);
    end;
  // inverte Result
  Result := Invert(Result);
end;

// TextToCriptoHex
function TCriptografa.TextToCriptoHex(SText: string): string;
var
  SPos: Integer;
begin
  SText := TextToCriptoBin(SText);

  // converte para hex
  Result := '';
  for SPos := FInicioString to TamanhoStr(SText) do
    Result := Result + DecToHex(Ord(SText[SPos]));
end;

// CriptoHexToText
function TCriptografa.CriptoHexToText(SText: string): string;
var
  SPos: Integer;
begin
  Result := '';
  for SPos := FInicioString to (TamanhoStr(SText) div 2) do
    Result := Result + Chr(HexToDec(Copy(SText, ((SPos * 2) - 1), 2)));
  // converte para texto
  Result := CriptoBinToText(Result);
end;

// Invert
function TCriptografa.Invert(SText: string): string;
var
  Position: Integer;
begin
  Result := '';
  for Position := TamanhoStr(SText) downto FInicioString do
    Result := Result + SText[Position];
end;

// DecToHex
function TCriptografa.DecToHex(Number: Integer): string;
begin
  Result := Copy('0123456789ABCDEF', (Number mod 16) + 1, 1);
  Number := Number div 16;
  Result := Copy('0123456789ABCDEF', (Number mod 16) + 1, 1) + Result
end;

class function TCriptografa.fpuTextToCriptoMD5(ipSenha: string): string;
var
  vaCriptador: TIdHashMessageDigest5;
begin
  vaCriptador := TIdHashMessageDigest5.Create;
  try
    Result := vaCriptador.HashStringAsHex(ipSenha);
  finally
    vaCriptador.free;
  end;
end;

class function TCriptografa.fpuTextToCriptoSha1(ipSenha: String): String;
var
  vaSha1: TIdHashSHA1;
begin
  vaSha1 := TIdHashSHA1.Create;
  try
    Result := vaSha1.HashStringAsHex(ipSenha);
  finally
    vaSha1.free;
  end;
end;

// HexToDec
function TCriptografa.HexToDec(Number: string): Byte;
begin
  Number := UpperCase(Number);
  Result := (Pos(Number[1], '0123456789ABCDEF') - 1) * 16;
  Result := Result + (Pos(Number[2], '0123456789ABCDEF') - 1);
end;

end.
