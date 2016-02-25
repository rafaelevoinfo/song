unit uSQLGenerator;

interface

uses
  System.SysUtils, uTypes, System.Variants, uUtils;

type
  TSQLGenerator = class
  public
    class function fpuFilterInteger(ipWhere, ipTabela, ipCampo: string; ipValor: Integer; ipAnd: Boolean = true): string; overload;
    class function fpuFilterInteger(ipWhere, ipTabela, ipCampo: string; ipValores: Array of Integer): string; overload;
    class function fpuFilterInteger(ipWhere, ipTabela, ipCampo: string; ipValores: Array of Integer; ipAnd: Boolean)
      : string; overload;
    class function fpuFilterString(ipWhere, ipTabela, ipCampo, ipValor: string): string; overload;
    class function fpuFilterString(ipWhere, ipTabela, ipCampo, ipValor: string; ipStartWith, ipEndWith, ipAnd: Boolean)
      : string; overload;
    class function fpuFilterData(ipWhere, ipTabela, ipCampo: string; ipDataInicial, ipDataFinal: TDateTime; ipAnd: Boolean): string;
  end;

implementation

{ TSQLGenerator }

class function TSQLGenerator.fpuFilterString(ipWhere, ipTabela, ipCampo, ipValor: string): string;
begin
  Result := TSQLGenerator.fpuFilterString(ipWhere, ipTabela, ipCampo, ipValor, true, false, true);
end;

class function TSQLGenerator.fpuFilterInteger(ipWhere, ipTabela,
  ipCampo: string; ipValores: Array of Integer): string;
begin
  Result := TSQLGenerator.fpuFilterInteger(ipWhere, ipTabela, ipCampo, ipValores, true);
end;

class function TSQLGenerator.fpuFilterData(ipWhere, ipTabela, ipCampo: string;
  ipDataInicial, ipDataFinal: TDateTime; ipAnd: Boolean): string;
var
  vaWhere: string;
begin
  vaWhere := Format(' (%s.%s between %s and %s)',
    [ipTabela, ipCampo, QuotedStr(FormatDateTime('dd.mm.yyyy', ipDataInicial)), QuotedStr(FormatDateTime('dd.mm.yyyy', ipDataFinal))]);

  if ipAnd then
    Result := ipWhere + vaWhere + ' AND '
  else
    Result := ipWhere + vaWhere + ' OR ';

end;

class
  function TSQLGenerator.fpuFilterInteger(ipWhere, ipTabela,
  ipCampo: string; ipValores: Array of Integer; ipAnd: Boolean): string;
var
  vaCodigos: string;
begin
  vaCodigos := TUtils.fpuMontarStringCodigo(ipValores, ',');

  Result := ipWhere + Format(' (%s.%s in (%s))', [ipTabela, ipCampo, vaCodigos]);
  if ipAnd then
    Result := Result + ' AND '
  else
    Result := Result + ' OR ';

end;

class
  function TSQLGenerator.fpuFilterInteger(ipWhere, ipTabela,
  ipCampo: string; ipValor: Integer; ipAnd: Boolean): string;
begin
  Result := ipWhere + Format(' (%s.%s = %d)', [ipTabela, ipCampo, ipValor]);
  if ipAnd then
    Result := Result + ' and '
  else
    Result := Result + ' or ';
end;

class
  function TSQLGenerator.fpuFilterString(ipWhere, ipTabela, ipCampo, ipValor: string;
  ipStartWith, ipEndWith, ipAnd: Boolean): string;
var
  vaFilter: string;
begin
  vaFilter := ipValor;
  if ipStartWith then
    vaFilter := vaFilter + '%';
  if ipEndWith then
    vaFilter := '%' + vaFilter;

  if ipAnd then
    Result := ipWhere + Format(' (%s.%s like %s) %s', [ipTabela, ipCampo, QuotedStr(vaFilter), ' AND '])
  else
    Result := ipWhere + Format(' (%s.%s like %s) %s', [ipTabela, ipCampo, QuotedStr(vaFilter), ' OR ']);

end;

end.
