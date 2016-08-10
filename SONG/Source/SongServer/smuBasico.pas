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
  uSQLGenerator, dmuPrincipal, uClientDataSet, uQuery, System.Variants, uUtils,
  Datasnap.DSSession;

type
  TTipoMacro = (tmWhere, tmAnd);

  TsmBasico = class(TDSServerModule)
    qAux: TRFQuery;
    procedure DSServerModuleCreate(Sender: TObject);
  private
    FConnection: TFDConnection;

    function fpvOnDataRequest(ipSender: TObject; ipInput: OleVariant): OleVariant;
    procedure SetConnection(const Value: TFDConnection);
    function GetConnection: TFDConnection;
    function fpvMontarWhere(ipTabela: string; ipParams: TParams): string; virtual;

  protected
    procedure pprCriarProvider(ipDataSet: TFDQuery); virtual;
    function fprMontarWhere(ipTabela, ipWhere: string; ipParam: TParam): string; virtual;
    function fprAjustarValorMacro(ipValor: string; ipTipo: TTipoMacro): string; virtual;
    function fprGetNomeTabela(ipProvider: TDataSetProvider): string;

    procedure pprCriarDataSet(var opDataSet: TRFQuery);

    procedure pprEncapsularConsulta(ipProc: TProc<TRFQuery>);

    function fprValidarCampoUnico(ipTabela, ipCampo: string; ipIdIgnorar: integer; ipValor: String): Boolean;
    function fprValidarCamposUnicos(ipTabela: String; ipCampos, ipValores: TArray<String>; ipIdIgnorar: integer): Boolean;

    procedure pprAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);

  public
    property Connection: TFDConnection read GetConnection write SetConnection;
  end;

implementation

uses
  fPrincipal;

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}
{ TDSServerModule1 }

procedure TsmBasico.DSServerModuleCreate(Sender: TObject);
var
  I: integer;
  vaDataSet: TFDQuery;
begin
  for I := 0 to ComponentCount - 1 do
    begin
      if Components[I] is TFDQuery then
        begin
          vaDataSet := TFDQuery(Components[I]);
          vaDataSet.Connection := Connection;

          pprCriarProvider(vaDataSet);
        end;
    end;

end;

procedure TsmBasico.pprCriarDataSet(var opDataSet: TRFQuery);
begin
  opDataSet := TRFQuery.Create(nil);
  opDataSet.Connection := Connection;
end;

procedure TsmBasico.pprCriarProvider(ipDataSet: TFDQuery);
var
  vaProvider: TDataSetProvider;
begin
  vaProvider := Self.FindComponent('dsp' + ipDataSet.Name) AS TDataSetProvider;
  if not Assigned(vaProvider) then
    begin
      vaProvider := TDataSetProvider.Create(Self);
      vaProvider.Name := 'dsp' + ipDataSet.Name;
      vaProvider.DataSet := ipDataSet;
      vaProvider.UpdateMode := upWhereKeyOnly;
      vaProvider.Options := [];
      // remove o useQuotedStr para evitar problemas com maiusculo e minusculo nos nomes das tabelas
    end;

  if not Assigned(vaProvider.OnDataRequest) then
    vaProvider.OnDataRequest := fpvOnDataRequest;
  if not Assigned(vaProvider.AfterUpdateRecord) then
    vaProvider.AfterUpdateRecord := pprAfterUpdateRecord;
end;

procedure TsmBasico.pprEncapsularConsulta(ipProc: TProc<TRFQuery>);
var
  vaDataSet: TRFQuery;
begin
  pprCriarDataSet(vaDataSet);
  try
    ipProc(vaDataSet);
  finally
    vaDataSet.Close;
    vaDataSet.Free;
  end;
end;

procedure TsmBasico.SetConnection(const Value: TFDConnection);
begin
  FConnection := Value;
end;

procedure TsmBasico.pprAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
var
  vaTabela: String;
  vaSessaoUsuario: TObject;
  vaFieldId: TField;
begin
  inherited;
  vaSessaoUsuario := TDSSessionManager.GetThreadSession.GetObject(coKeySessaoUsuario);
  if Assigned(vaSessaoUsuario) then
    begin
      vaFieldId := DeltaDS.FindField(TBancoDados.coId);

      if Assigned(vaFieldId) then
        begin
          vaTabela := fprGetNomeTabela(Sender as TDataSetProvider);

          Connection.ExecSQL('insert into log(log.Id, log.id_tabela, log.Tabela, log.Operacao, log.Usuario, log.Data_Hora)' +
            ' values (next value for Gen_Log,:ID_TABELA, :TABELA, :OPERACAO, :USUARIO, current_timestamp) ',
            [vaFieldId.OldValue, vaTabela.ToUpper, Ord(UpdateKind), TSessaoUsuario(vaSessaoUsuario).Id]);

          Connection.Commit;
        end;
    end;
end;

function TsmBasico.fprGetNomeTabela(ipProvider: TDataSetProvider): string;
begin
  if TRegEx.IsMatch(ipProvider.Name, '^dspqlk', []) then // lookups
    Result := Copy(ipProvider.Name, 7, Length(ipProvider.Name))
  else
    Result := Copy(ipProvider.Name, 5, Length(ipProvider.Name));
end;

function TsmBasico.fpvOnDataRequest(ipSender: TObject; ipInput: OleVariant): OleVariant;
var
  vaParams: TParams;
  vaDataSet: TFDQuery;
  vaValorMacro, vaTabela: string;
  vaMacro: TFDMacro;
  vaAchouMacro: Boolean;
begin
  vaParams := TParams.Create;
  try
    try
      UnpackParams(ipInput, vaParams);

      // voltando o SQL Original
      if ipSender is TDataSetProvider and Assigned(TDataSetProvider(ipSender).DataSet) then
        begin
          vaAchouMacro := false;
          vaDataSet := TDataSetProvider(ipSender).DataSet as TFDQuery;

          vaTabela := fprGetNomeTabela(TDataSetProvider(ipSender)).ToUpper;
          vaMacro := vaDataSet.FindMacro(TBancoDados.coMacroWhere);
          if Assigned(vaMacro) then
            begin
              vaAchouMacro := true;
              vaValorMacro := fpvMontarWhere(vaTabela, vaParams);

              vaValorMacro := fprAjustarValorMacro(vaValorMacro, tmWhere);
              vaMacro.AsRaw := vaValorMacro;
            end;

          vaMacro := vaDataSet.FindMacro(TBancoDados.coMacroAnd);
          if Assigned(vaMacro) then
            begin
              vaAchouMacro := true;
              vaValorMacro := fpvMontarWhere(vaTabela, vaParams);

              vaValorMacro := fprAjustarValorMacro(vaValorMacro, tmAnd);
              vaMacro.AsRaw := vaValorMacro;
            end;

          if vaAchouMacro then
            vaDataSet.Prepare;
        end;
    except
      on E: Exception do
        begin
          frmPrincipal.ppuAdicionarErroLog('Erro ao realizar o monta SQL. Detalhes: ' + E.message);
          raise;
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

function TsmBasico.fprAjustarValorMacro(ipValor: string; ipTipo: TTipoMacro): string;
begin
  Result := ipValor;
  if ipValor.Trim <> '' then
    begin
      if ipTipo = tmWhere then
        begin
          // vamos adicionar o where e remover o ultimo and
          if not TRegEx.IsMatch(ipValor, 'where ', [roIgnoreCase]) then
            Result := ' where ' + ipValor;
        end
      else
        begin
          // vamos adicionar o where e remover o ultimo and
          if not TRegEx.IsMatch(ipValor, '^\s*and\s', [roIgnoreCase]) then
            Result := ' and ' + ipValor;
        end;
      // remove o ultimo AND ou OR
      Result := TRegEx.Replace(Result, '((and)|(or))\s*$', '', [roIgnoreCase]);
    end;
end;

function TsmBasico.fprMontarWhere(ipTabela, ipWhere: string; ipParam: TParam): string;
var
  vaValor, vaOperador: string;
  vaIdsString: TArray<string>;
  vaIds: TArray<integer>;
  I: integer;
begin
  Result := ipWhere;
  TUtils.ppuExtrairValorOperadorParametro(ipParam.Text, vaValor, vaOperador, TParametros.coDelimitador);

  if ipParam.Name = TParametros.coId then
    begin
      vaIdsString := TRegEx.split(vaValor, coDelimitadorPadrao);
      if Length(vaIdsString) > 1 then
        begin
          SetLength(vaIds, Length(vaIdsString));
          for I := 0 to High(vaIdsString) do
            vaIds[I] := vaIdsString[I].ToInteger();

          Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, TBancoDados.coId, vaIds, vaOperador)
        end
      else
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, TBancoDados.coId, vaValor.ToInteger(), vaOperador)
    end
  else if ipParam.Name = TParametros.coNome then
    Result := TSQLGenerator.fpuFilterString(Result, ipTabela, TBancoDados.coNome, vaValor, vaOperador)
  else if ipParam.Name = TParametros.coActive then
    Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, TBancoDados.coId, -1, vaOperador)
  else if ipParam.Name = TParametros.coAtivo then
    begin
      if vaValor.ToInteger <> coRegistroAtivo then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, TBancoDados.coAtivo, vaValor.ToInteger(), vaOperador)
      else
        begin
          Result := Result + '((' + ipTabela + '.' + TBancoDados.coAtivo + ' = ' + IntToStr(coRegistroAtivo) + ') OR '
            + '(' + ipTabela + '.' + TBancoDados.coAtivo + ' is null)) ' + vaOperador;
        end;
    end;
end;

function TsmBasico.fprValidarCamposUnicos(ipTabela: String; ipCampos, ipValores: TArray<String>;
  ipIdIgnorar: integer): Boolean;
var
  vaResult: Boolean;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)

    var
      I: integer;
    begin
      ipDataSet.SQL.Text := 'select ID ' +
        ' from  ' + ipTabela +
        ' where ID <> :ID ';

      for I := 0 to High(ipCampos) do
        begin
          ipDataSet.SQL.Text := ipDataSet.SQL.Text + ' and ' + ipCampos[I] + ' = ' + QuotedStr(ipValores[I]);
        end;

      ipDataSet.ParamByName('ID').AsInteger := ipIdIgnorar;
      ipDataSet.Open();

      vaResult := ipDataSet.Eof;
    end);

  Result := vaResult;

end;

function TsmBasico.fprValidarCampoUnico(ipTabela, ipCampo: string;
ipIdIgnorar: integer; ipValor: String): Boolean;
var
  vaResult: Boolean;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := Format('select ID ' +
        ' from %s ' +
        ' where ID <> :ID and ' +
        '       %s = :NOME', [ipTabela, ipCampo]);

      ipDataSet.ParamByName('ID').AsInteger := ipIdIgnorar;
      ipDataSet.ParamByName('NOME').AsString := ipValor;
      ipDataSet.Open();

      vaResult := ipDataSet.Eof;
    end);

  Result := vaResult;

end;

function TsmBasico.fpvMontarWhere(ipTabela: string; ipParams: TParams): string;
var
  I: integer;
begin
  Result := '';
  // vamos verificar se tem os parametros default
  for I := 0 to ipParams.Count - 1 do
    begin
      Result := fprMontarWhere(ipTabela, Result, ipParams[I]);
    end;

end;

end.
