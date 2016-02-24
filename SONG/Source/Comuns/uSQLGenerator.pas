unit uSQLGenerator;

interface

uses
  System.SysUtils, uTypes, System.Variants;

type
  TSQLGenerator = class
  public
    class function fpuFilterInteger(ipWhere, ipTabela, ipCampo: string; ipValor: Integer): string; overload;
    class function fpuFilterInteger(ipWhere, ipTabela, ipCampo: string; ipValores: Array of Variant): string; overload;
    class function fpuFilterInteger(ipWhere, ipTabela, ipCampo: string; ipValores: Array of Variant; ipAnd: Boolean)
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
  ipCampo: string; ipValores: Array of Variant): string;
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
    ipCampo: string; ipValores: Array of Variant; ipAnd: Boolean): string;
  var
    I: Integer;
  vaWhere: string;
  begin
    vaWhere := '(';
  for I := 0 to High(ipValores) do
  begin
    if not VarIsNull(ipValores[I]) then
    vaWhere := vaWhere + Format(' (%s.%s = %d)', [ipTabela, ipCampo, VarToStr(ipValores[I]).ToInteger])
  else
    vaWhere := vaWhere + Format(' (%s.%s is null)', [ipTabela, ipCampo]);

  if I <> High(ipValores) then
  begin
    if ipAnd then
    vaWhere := vaWhere + ' and '
  else
    vaWhere := vaWhere + ' or ';
  end;
  end;

  vaWhere := vaWhere + ') AND ';

  Result := ipWhere + vaWhere;
  end;

  class
  function TSQLGenerator.fpuFilterInteger(ipWhere, ipTabela,
    ipCampo: string; ipValor: Integer): string;
  begin
    Result := TSQLGenerator.fpuFilterInteger(ipWhere, ipTabela, ipCampo, [ipValor]);
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
