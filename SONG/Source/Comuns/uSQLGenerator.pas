unit uSQLGenerator;

interface

uses
  System.SysUtils, uTypes, System.Variants, uUtils;

type
  TSQLGenerator = class
  public
    class function fpuFilterInteger(ipWhere, ipTabela, ipCampo: string; ipValor: Integer; ipOperador: String = ' And '): string; overload;
    class function fpuFilterInteger(ipWhere, ipTabela, ipCampo: string; ipValores: Array of Integer): string; overload;
    class function fpuFilterInteger(ipWhere, ipTabela, ipCampo: string; ipValores: Array of Integer; ipOperador: String)
      : string; overload;
    class function fpuFilterString(ipWhere, ipTabela, ipCampo, ipValor, ipOperador: string): string; overload;
    class function fpuFilterString(ipWhere, ipTabela, ipCampo, ipValor: string; ipStartWith, ipEndWith: Boolean; ipOperador: String)
      : string; overload;
    class function fpuFilterData(ipWhere, ipTabela, ipCampo: string; ipDataInicial, ipDataFinal: TDateTime; ipOperador: String): string;
  end;

implementation

{ TSQLGenerator }

class function TSQLGenerator.fpuFilterString(ipWhere, ipTabela, ipCampo, ipValor, ipOperador: string): string;
begin
  Result := TSQLGenerator.fpuFilterString(ipWhere, ipTabela, ipCampo, ipValor, true, false, ipOperador);
end;

class function TSQLGenerator.fpuFilterInteger(ipWhere, ipTabela,
  ipCampo: string; ipValores: Array of Integer): string;
begin
  Result := TSQLGenerator.fpuFilterInteger(ipWhere, ipTabela, ipCampo, ipValores, TOperadores.coAnd);
end;

class function TSQLGenerator.fpuFilterData(ipWhere, ipTabela, ipCampo: string;
  ipDataInicial, ipDataFinal: TDateTime; ipOperador: String): string;
var
  vaDataInicial, vaDataFinal: string;
begin
  vaDataInicial := QuotedStr(FormatDateTime('dd.mm.yyyy', ipDataInicial));
  vaDataFinal := QuotedStr(FormatDateTime('dd.mm.yyyy', ipDataFinal));

  if ipWhere <> '' then
    Result := Format('(%s (%s.%s between %s and %s)) %s', [ipWhere, ipTabela, ipCampo, vaDataInicial, vaDataFinal, ipOperador])
  else
    Result := Format('(%s.%s between %s and %s) %s', [ipTabela, ipCampo, vaDataInicial, vaDataFinal, ipOperador]);

end;

class
  function TSQLGenerator.fpuFilterInteger(ipWhere, ipTabela,
  ipCampo: string; ipValores: Array of Integer; ipOperador: String): string;
var
  vaCodigos: string;
begin
  vaCodigos := TUtils.fpuMontarStringCodigo(ipValores, ',');

  if ipWhere <> '' then
    Result := Format('(%s (%s.%s in (%s) )) %s', [ipWhere, ipTabela, ipCampo, vaCodigos, ipOperador])
  else
    Result := Format('(%s.%s in (%s)) %s', [ipTabela, ipCampo, vaCodigos, ipOperador]);

end;

class
  function TSQLGenerator.fpuFilterInteger(ipWhere, ipTabela,
  ipCampo: string; ipValor: Integer; ipOperador: String): string;
begin
  if ipWhere <> '' then
    Result := Format('(%s (%s.%s = %d)) %s', [ipWhere, ipTabela, ipCampo, ipValor, ipOperador])
  else
    Result := Format('(%s.%s = %d) %s', [ipTabela, ipCampo, ipValor, ipOperador])
end;

class
  function TSQLGenerator.fpuFilterString(ipWhere, ipTabela, ipCampo, ipValor: string;
  ipStartWith, ipEndWith: Boolean; ipOperador: String): string;
var
  vaFilter: string;
begin
  vaFilter := ipValor;
  if ipStartWith then
    vaFilter := vaFilter + '%';
  if ipEndWith then
    vaFilter := '%' + vaFilter;

  if ipWhere <> '' then
    Result := Format('(%s (%s.%s like %s)) %s', [ipWhere, ipTabela, ipCampo, QuotedStr(vaFilter), ipOperador])
  else
    Result := Format('(%s.%s like %s) %s', [ipTabela, ipCampo, QuotedStr(vaFilter), ipOperador])

end;

end.
