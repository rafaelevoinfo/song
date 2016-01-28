unit smuBasico;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  Datasnap.DSProviderDataModuleAdapter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.Provider, Datasnap.DBClient,
  System.Generics.Collections, uTypes, System.RegularExpressions,
  uSQLGenerator, dmuPrincipal;

type
  TsmBasico = class(TDSServerModule)
    procedure DSServerModuleCreate(Sender: TObject);
  private
    FScriptsOriginais: TDictionary<String, String>;
    FConnection: TFDConnection;

    function fpvOnDataRequest(ipSender: TObject; ipInput: OleVariant): OleVariant;
    procedure SetConnection(const Value: TFDConnection);
    function GetConnection: TFDConnection;

  protected
    procedure pprCriarProvider(ipDataSet: TFDQuery); virtual;
    function fprMontarWhere(ipTabela: string; ipParams: TParams): string; virtual;
    function fprAjustarWhere(ipWhere: string): string; virtual;
    function fprGetNomeTabela(ipProvider: TDataSetProvider): string;
  public
    property Connection: TFDConnection read GetConnection write SetConnection;
  end;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}
{ TDSServerModule1 }

procedure TsmBasico.DSServerModuleCreate(Sender: TObject);
var
  I: Integer;
  vaDataSet: TFDQuery;
begin
  FScriptsOriginais := TDictionary<String, String>.Create;
  for I := 0 to ComponentCount - 1 do
    begin
      if Components[I] is TFDQuery then
        begin
          vaDataSet := TFDQuery(Components[I]);
          vaDataSet.Connection := Connection;
          FScriptsOriginais.Add(vaDataSet.Name, vaDataSet.SQL.Text);

          pprCriarProvider(vaDataSet);
        end;
    end;

end;

procedure TsmBasico.pprCriarProvider(ipDataSet: TFDQuery);
var
  vaProvider: TDataSetProvider;
begin
  vaProvider := Self.FindComponent('dsp' + ipDataSet.Name) AS TDataSetProvider;
  if not Assigned(vaProvider) then
    begin
      vaProvider := TDataSetProvider.Create(Self);
      vaProvider.Name := 'dsp'+ipDataSet.Name;
      vaProvider.DataSet := ipDataSet;
      vaProvider.UpdateMode := upWhereKeyOnly;
      vaProvider.Options := [];//remove o useQuotedStr para evitar problemas com maiusculo e minusculo nos nomes das tabelas
    end;

  if not Assigned(vaProvider.OnDataRequest) then
    vaProvider.OnDataRequest := fpvOnDataRequest;
end;

procedure TsmBasico.SetConnection(const Value: TFDConnection);
begin
  FConnection := Value;
end;

function TsmBasico.fprGetNomeTabela(ipProvider:TDataSetProvider):string;
begin
   Result := Copy(ipProvider.Name, 5, Length(ipProvider.Name));
end;

function TsmBasico.fpvOnDataRequest(ipSender: TObject; ipInput: OleVariant): OleVariant;
var
  vaParams: TParams;
  vaDataSet: TFDQuery;
  vaScript, vaWhere, vaTabela: string;
  vaMacroWhere: TFDMacro;
begin
  vaParams := TParams.Create;
  try
    UnpackParams(ipInput, vaParams);

    // voltando o SQL Original
    if ipSender is TDataSetProvider and Assigned(TDataSetProvider(ipSender).DataSet) then
      begin
        vaDataSet := TDataSetProvider(ipSender).DataSet as TFDQuery;
        vaMacroWhere := vaDataSet.FindMacro(TBancoDados.coMacroWhere);
        if Assigned(vaMacroWhere) and FScriptsOriginais.TryGetValue(vaDataSet.Name, vaScript) then
          begin
            vaDataSet.SQL.Text := vaScript;
            vaTabela := fprGetNomeTabela(TDataSetProvider(ipSender));
            vaWhere := fprMontarWhere(vaTabela, vaParams);
            if vaWhere <> '' then
              begin
                vaWhere := fprAjustarWhere(vaWhere);
              end;
            vaMacroWhere.AsRaw := vaWhere;
          end;
      end;

  finally
    vaParams.Free;
  end;
end;

function TsmBasico.GetConnection: TFDConnection;
begin
  if not Assigned(FConnection) then
    FConnection := dmPrincipal.Connection;

  Result := FConnection;
end;

function TsmBasico.fprAjustarWhere(ipWhere: string): string;
begin
  Result := ipWhere;
  // vamos adicionar o where e remover o ultimo and
  if not TRegex.IsMatch(ipWhere, ' where ', [roIgnoreCase]) then
    Result := ' where ' + ipWhere;
  // remove o ultimo and
  Result := TRegex.Replace(Result, 'and\s*$', '', [roIgnoreCase, roMultiLine]);
end;

function TsmBasico.fprMontarWhere(ipTabela: string; ipParams: TParams): string;
var
  vaParam: TParam;
  I: Integer;
begin
  Result := '';
  // vamos verificar se tem os parametros default
  for I := 0 to ipParams.Count - 1 do
    begin
      vaParam := ipParams[I];
      if vaParam.Name = TParametros.coID then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, TBancoDados.coID, vaParam.Text.ToInteger())
      else if vaParam.Name = TParametros.coNome then
        Result := TSQLGenerator.fpuFilterString(Result, ipTabela, TBancoDados.coNome, vaParam.Text)
      else if vaParam.Name = TParametros.coActive then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, TBancoDados.coID, -1);
    end;

end;

end.
