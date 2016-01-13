unit pCarregarDados;

interface

uses
  DBClient, Classes, DB, SysUtils, Generics.Collections, Variants, pmClientDataSet, Dialogs;

type
  TCarregaDados = class
  strict private
    FParametros: TList<String>;
    FValues: TList<Variant>;
    FNomeTabela: String;
    FDataSource: TDataSource;
    FTparams: TParams;

    procedure addDataSource(ds: TDataSource);
    procedure addNameTabela(nome: String);

  const
    TABELA = 'TABELA';

  public
    constructor Create;
    destructor Destroy; override;

    property DataSource: TDataSource read FDataSource write addDataSource;

    property NomeTabela: String read FNomeTabela write addNameTabela;

    procedure addParam(const parametro: String; const value: Variant);

    procedure addParams(const parametros: Array of String; const values: Array of Variant);

    procedure carregarDados(); overload;

    class procedure ppuCarregarDados(ipDataSet: TDataSet; const ipParametros: Array of string; ipValues: Array of Variant; ipNomeTabela: string = ''); static;

    procedure carregarDados(ds: TDataSource); overload;

    procedure carregarDados(ipDataSet: TDataSet); overload;

    procedure carregarDados(ds: TDataSource; const parametros: Array of String; const values: Array of Variant); overload;

    procedure carregarDados(ipDataSet: TDataSet; const parametros: Array of String; const values: Array of Variant); overload;

  end;

implementation

{ TCarregarDados }

procedure TCarregaDados.addDataSource(ds: TDataSource);
begin
  if Assigned(ds) then
    begin
      FDataSource := ds;
    end
  else
    raise Exception.Create('DataSource não pode ser nulo.');
end;

procedure TCarregaDados.addNameTabela(nome: String);
begin
  if nome <> '' then
    FNomeTabela := nome;
end;

procedure TCarregaDados.addParam(const parametro: String; const value: Variant);
begin
  if (Trim(parametro) <> '') AND (NOT VarIsNull(value)) then
    begin
      FParametros.Add(parametro);
      FValues.Add(value);
    end
  else
    raise Exception.Create('Valores inválidos para o parametro ou para o value.');

end;

procedure TCarregaDados.addParams(const parametros: array of String; const values: array of Variant);
var
  i: Integer;
begin
  if High(parametros) = High(values) then
    begin
      // percorre todo o array add cada elemento no list
      for i := Low(parametros) to High(parametros) do
        begin
          addParam(parametros[i], values[i]);
          // FParametros.Add(parametros[i]);
          // FValues.Add(values[i]);
        end;
    end
  else
    raise Exception.Create('Os arrays devem possuir o mesmo tamanho.');

end;

procedure TCarregaDados.carregarDados(ipDataSet: TDataSet; const parametros: array of String; const values: array of Variant);
var
  vaDs: TDataSource;
begin
  if Assigned(ipDataSet) then
    begin
      vaDs := TDataSource.Create(nil);
      try
        vaDs.DataSet := ipDataSet;
        addParams(parametros, values);
        carregarDados(vaDs);
      finally
        vaDs.Free;
      end;
    end
  else
    raise Exception.Create('O DataSet não deve ser nulo.');
end;

procedure TCarregaDados.carregarDados(ds: TDataSource; const parametros: array of String; const values: array of Variant);
begin
  addParams(parametros, values);
  carregarDados(ds);
end;

procedure TCarregaDados.carregarDados();
var
  i: Integer;
begin
  // limpo os parametros
  FTparams.Clear;
  if FNomeTabela <> '' then
    FTparams.CreateParam(ftString, TABELA, ptInput).AsString := UpperCase(FNomeTabela)
  else
    // coloco o parametro com o nome da tabela
    FTparams.CreateParam(ftString, TABELA, ptInput).AsString := UpperCase(FDataSource.DataSet.Name);

  // percorre todo o TList criando os parametros
  for i := 0 to FParametros.Count - 1 do
    begin
      FTparams.CreateParam(ftString, FParametros.Items[i], ptInput).AsString := FValues.Items[i];
    end;
  // fecho o dataSource
  FDataSource.DataSet.Close;
  // faz a requisição para o server
  try
    (FDataSource.DataSet as TpmClientDataSet).DataRequest(PackageParams(FTparams)); // faz a requisição empacotando os parâmetros para OLE
    FDataSource.DataSet.Open;
  finally
    // limpo os TList
    FParametros.Clear;
    FValues.Clear;
    FTparams.Clear;
    // LIMPO O nome da tabela
    FNomeTabela := '';
  end;
end;

procedure TCarregaDados.carregarDados(ds: TDataSource);
begin
  if (Assigned(ds)) then
    begin
      FDataSource := ds;
      carregarDados();
    end
  else
     raise Exception.Create('O DataSource não deve ser nulo.');

end;

procedure TCarregaDados.carregarDados(ipDataSet: TDataSet);
var
  vaDs: TDataSource;
begin
  if (Assigned(ipDataSet)) then
    begin
      vaDs := TDataSource.Create(nil);
      try
        vaDs.DataSet := ipDataSet;
        carregarDados(vaDs);
      finally
        vaDs.Free;
      end;
    end
  else
     raise Exception.Create('O DataSet não deve ser nulo.');

end;

constructor TCarregaDados.Create;
begin
  FParametros := TList<string>.Create;
  FValues := TList<Variant>.Create;
  FTparams := TParams.Create;
end;

destructor TCarregaDados.Destroy;
begin
  FreeAndNil(FParametros);
  FreeAndNil(FValues);
  FreeAndNil(FTparams);
  inherited;
end;

class procedure TCarregaDados.ppuCarregarDados(ipDataSet: TDataSet; const ipParametros: Array of string; ipValues: Array of Variant; ipNomeTabela: string);
var
  i: Integer;
  vaDataSource: TDataSource;
  vaParams: TParams;
begin
  // incializando
  vaParams := TParams.Create;
  vaDataSource := TDataSource.Create(nil);
  vaDataSource.DataSet := ipDataSet;
  try
    if ipNomeTabela <> '' then
      vaParams.CreateParam(ftString, TABELA, ptInput).AsString := UpperCase(ipNomeTabela)
    else
      // coloco o parametro com o nome da tabela
      vaParams.CreateParam(ftString, TABELA, ptInput).AsString := UpperCase(vaDataSource.DataSet.Name);

    // percorre todo o TList criando os parametros
    for i := 0 to High(ipParametros) do
      begin
        vaParams.CreateParam(ftString, ipParametros[i], ptInput).AsString := ipValues[i];
      end;
    // fecho o dataSource
    vaDataSource.DataSet.Close;
    // faz a requisição para o server

    (vaDataSource.DataSet as TClientDataSet).DataRequest(PackageParams(vaParams)); // faz a requisição empacotando os parâmetros para OLE
    vaDataSource.DataSet.Open;

  finally
    FreeAndNil(vaParams);
    FreeAndNil(vaDataSource);
  end;

end;

end.
