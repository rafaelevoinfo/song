unit uSQLGenerator;

interface

uses
  System.SysUtils, uTypes;

type
  TSQLGenerator = class
  public
    class function fpuFilterInteger(ipWhere, ipTabela, ipCampo: string; ipValor: Integer): string; overload;
    class function fpuFilterInteger(ipWhere, ipTabela, ipCampo: string; ipValor: Integer; ipAnd: Boolean)
      : string; overload;
    class function fpuFilterString(ipWhere, ipTabela, ipCampo, ipValor: string): string; overload;
    class function fpuFilterString(ipWhere, ipTabela, ipCampo, ipValor: string; ipStartWith, ipEndWith, ipAnd: Boolean)
      : string; overload;
  end;

implementation

{ TSQLGenerator }

class function TSQLGenerator.fpuFilterInteger(ipWhere, ipTabela, ipCampo: String; ipValor: Integer): string;
begin
  Result := TSQLGenerator.fpuFilterInteger(ipWhere, ipTabela, ipCampo, ipValor, true);
end;

class function TSQLGenerator.fpuFilterInteger(ipWhere, ipTabela, ipCampo: String; ipValor: Integer;
  ipAnd: Boolean): string;
begin
  Result := ipWhere + Format(' (%s.%s = %d) %s', [ipTabela, ipCampo, ipValor, ' and ']);
end;

class function TSQLGenerator.fpuFilterString(ipWhere, ipTabela, ipCampo, ipValor: string): string;
begin
  Result := TSQLGenerator.fpuFilterString(ipWhere, ipTabela, ipCampo, ipValor, true, false, true);
end;

class function TSQLGenerator.fpuFilterString(ipWhere, ipTabela, ipCampo, ipValor: string;
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
