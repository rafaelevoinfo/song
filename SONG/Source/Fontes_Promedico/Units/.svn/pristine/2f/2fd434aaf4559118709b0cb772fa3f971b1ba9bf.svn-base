// ---------------------------------------------------------------------------

// This software is Copyright (c) 2011 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of Delphi, C++Builder or RAD Studio (Embarcadero Products).
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

// ---------------------------------------------------------------------------
// Version of PC1 filter that generates random keys.

unit PC1DynamicKey;

interface

uses Data.DBXTransport, System.SysUtils, Data.DBXPlatform, Data.DBXEncryption,
  pTypes, Cripto;

type
  TTransportCypherFilterDynamicKey = class sealed(TTransportFilter)
  private
    FDelegateFilter: TTransportCypherFilter;
    FKeyVerdadeira: String;

    function fpvCriptoDecripto(ipCripDecrip: Integer; ipKey, ipTexto: String): String;
  public
    constructor Create; override;
    destructor Destroy; override;
    function GetParameterValue(const ParamName: UnicodeString): UnicodeString; override;
    function ProcessInput(const Data: TBytes): TBytes; override;
    function ProcessOutput(const Data: TBytes): TBytes; override;
    function SetParameterValue(const ParamName: UnicodeString; const ParamValue: UnicodeString): Boolean; override;
    function SetConfederateParameter(const ParamName: UnicodeString; const ParamValue: UnicodeString): Boolean; override;
    function Id: UnicodeString; override;
  protected
    function GetUserParameters: TDBXStringArray; override;
    function GetParameters: TDBXStringArray; override;
  end;

const
  coKeyCriptoVerdadeira = '1944021A1E094A546F274B53153C4C44E8';

implementation


function TTransportCypherFilterDynamicKey.fpvCriptoDecripto(ipCripDecrip: Integer; ipKey, ipTexto: String): String;
var
  MyCripto: TCriptografa;
begin
  try
    if ipKey = '' then
      raise Exception.Create('Não foi passado a Chave para Criptografar ou Descriptografar.');

    MyCripto := TCriptografa.Create(nil);
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

function TTransportCypherFilterDynamicKey.GetParameterValue(const ParamName: UnicodeString): UnicodeString;
begin
  Result := FDelegateFilter.GetParameterValue(ParamName);
end;

function RandomKey: string;
var
  i: Integer;
begin
  SetLength(Result, 16);
  for i := 1 to 16 do
    Result[i] := Char(Random(255 - Ord(' ')) + Ord(' '));
end;

constructor TTransportCypherFilterDynamicKey.Create;
var
  LCypherKey: string;
begin
  inherited;
  FDelegateFilter := TTransportCypherFilter.Create;
  LCypherKey := RandomKey; // nao importa, iremos trocar essa chave depois
  FDelegateFilter.SetParameterValue('Key', LCypherKey);

  FKeyVerdadeira := fpvCriptoDecripto(1, coSaltSHA1, coKeyCriptoVerdadeira);
end;

destructor TTransportCypherFilterDynamicKey.Destroy;
begin
  FDelegateFilter.Free;
  inherited;
end;

function TTransportCypherFilterDynamicKey.GetUserParameters: TDBXStringArray;
begin
  Result := FDelegateFilter.UserParameters;
end;

function TTransportCypherFilterDynamicKey.GetParameters: TDBXStringArray;
begin
  Result := FDelegateFilter.Parameters;
end;

function TTransportCypherFilterDynamicKey.ProcessInput(const Data: TBytes): TBytes;
begin
  FDelegateFilter.SetParameterValue('Key', FKeyVerdadeira);
  Result := FDelegateFilter.ProcessInput(Data);
end;

function TTransportCypherFilterDynamicKey.ProcessOutput(const Data: TBytes): TBytes;
begin
  FDelegateFilter.SetParameterValue('Key', FKeyVerdadeira);
  Result := FDelegateFilter.ProcessOutput(Data);
end;

function TTransportCypherFilterDynamicKey.SetParameterValue(const ParamName: UnicodeString; const ParamValue: UnicodeString): Boolean;
begin
  Result := FDelegateFilter.SetParameterValue(ParamName, ParamValue);
end;

function TTransportCypherFilterDynamicKey.SetConfederateParameter(const ParamName: UnicodeString; const ParamValue: UnicodeString): Boolean;
begin
  if 'Key' = ParamName then
    Result := FDelegateFilter.SetConfederateParameter(ParamName, FKeyVerdadeira)
  else
    Result := FDelegateFilter.SetConfederateParameter(ParamName, ParamValue);

  Result := true;
end;

function TTransportCypherFilterDynamicKey.Id: UnicodeString;
begin
  Result := 'PC1DynamicKey';
end;

initialization

TTransportFilterFactory.RegisterFilter(TTransportCypherFilterDynamicKey);

finalization

TTransportFilterFactory.UnregisterFilter(TTransportCypherFilterDynamicKey);

end.
