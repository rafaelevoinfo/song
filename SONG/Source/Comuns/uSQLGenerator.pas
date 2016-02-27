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
  vaWhere: string;
begin
  vaWhere := Format(' (%s.%s between %s and %s)',
    [ipTabela, ipCampo, QuotedStr(FormatDateTime('dd.mm.yyyy', ipDataInicial)), QuotedStr(FormatDateTime('dd.mm.yyyy', ipDataFinal))]);

  Result := ipWhere + vaWhere + ' ' + ipOperador + ' ';

end;

class
  function TSQLGenerator.fpuFilterInteger(ipWhere, ipTabela,
  ipCampo: string; ipValores: Array of Integer; ipOperador: String): string;
var
  vaCodigos: string;
begin
  vaCodigos := TUtils.fpuMontarStringCodigo(ipValores, ',');

  Result := ipWhere + Format(' (%s.%s in (%s))', [ipTabela, ipCampo, vaCodigos]);

  Result := Result + ' ' + ipOperador + ' ';

end;

class
  function TSQLGenerator.fpuFilterInteger(ipWhere, ipTabela,
  ipCampo: string; ipValor: Integer; ipOperador: String): string;
begin
  Result := ipWhere + Format(' (%s.%s = %d) %s', [ipTabela, ipCampo, ipValor, ipOperador]);
end;

class
  function TSQLGenerator.fpuFilterString(ipWhere, ipTabela, ipCampo, ipValor: string;
  ipStartWith, ipEndWith: bOOLEAN; ipOperador: String): string;
var
  vaFilter: string;
begin
  vaFilter := ipValor;
  if ipStartWith then
    vaFilter := vaFilter + '%';
  if ipEndWith then
    vaFilter := '%' + vaFilter;

  Result := ipWhere + Format(' (%s.%s like %s) %s', [ipTabela, ipCampo, QuotedStr(vaFilter), ipOperador]);

end;

end.
