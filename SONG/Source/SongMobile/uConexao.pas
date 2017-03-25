unit uConexao;

interface

uses
  Data.SqlExpr, System.Classes, System.Generics.Collections, FMX.Dialogs,
  System.RegularExpressions, System.SysUtils, dmuPrincipal;

type
  TConexaoEstabelecida = reference to procedure(ipConexao: TSQLConnection);

  TConexaoServidor = class(TThread)
  private
    FConexao: TSQLConnection;
    FLoginIncorreto: Boolean;
  public
    property LoginIncorreto: Boolean read FLoginIncorreto;
    property Conexao: TSQLConnection read FConexao;

    constructor Create(ipParametrosConexao: TStrings);

    procedure Execute; override;
  end;

  TGerenciadorConexao = class
  private
    FThreadsProcessadas: Integer;
    FTotalThreads: Integer;
    FConexaoEstabelecida: Boolean;
    FOnEstabeleceuConexao: TConexaoEstabelecida;
    procedure ppvOnTerminateThread(ipSender: TObject);
  public
    procedure ppuConectarServidor(ipOnEstabeleceuConexao: TConexaoEstabelecida);
  end;

implementation

{ TConexaoServidor }

constructor TConexaoServidor.Create(ipParametrosConexao: TStrings);
begin
  inherited Create(true);
  FConexao := TSQLConnection.Create(nil);
  FConexao.DriverName := 'DataSnap';
  FConexao.Params.Assign(ipParametrosConexao);
end;

procedure TConexaoServidor.Execute;
begin
  inherited;
  FLoginIncorreto := false;
  try
    FConexao.Open;
  except
    on e: Exception do
      begin
        if TRegEx.IsMatch(e.message, 'Authentication manager rejected user credentials', [roIgnoreCase]) then
          begin
            FLoginIncorreto := true;
          end
        else
          raise;
      end;
  end;
end;

{ TGerenciadorConexao }

procedure TGerenciadorConexao.ppuConectarServidor(ipOnEstabeleceuConexao: TConexaoEstabelecida);
var
  vaThread: TConexaoServidor;
  vaListaParametros: TObjectList<TStrings>;
  vaParametros: TStrings;
begin
  FOnEstabeleceuConexao := ipOnEstabeleceuConexao;
  FConexaoEstabelecida := false;
  FThreadsProcessadas := 0;

  dmPrincipal.ppuAbrirConfig;
  vaListaParametros := TObjectList<TStrings>.Create;
  try
    if dmPrincipal.qConfigHOST_SERVIDOR_INTERNO.AsString <> '' then
      begin
        vaParametros := TStringList.Create;
        vaParametros.Assign(dmPrincipal.SongServerCon.Params);
        dmPrincipal.ppuConfigurarConexaoServidor(dmPrincipal.qConfigHOST_SERVIDOR_INTERNO.AsString, vaParametros);

        vaListaParametros.Add(vaParametros);
      end;

    if dmPrincipal.qConfigHOST_SERVIDOR_EXTERNO.AsString <> '' then
      begin
        vaParametros := TStringList.Create;
        vaParametros.Assign(dmPrincipal.SongServerCon.Params);
        dmPrincipal.ppuConfigurarConexaoServidor(dmPrincipal.qConfigHOST_SERVIDOR_EXTERNO.AsString, vaParametros);

        vaListaParametros.Add(vaParametros);
      end;

    FTotalThreads := vaListaParametros.Count;

    for vaParametros in vaListaParametros do
      begin
        vaThread := TConexaoServidor.Create(vaParametros);
        vaThread.FreeOnTerminate := true;
        vaThread.OnTerminate := ppvOnTerminateThread;
        vaThread.Start;
      end;
  finally
    vaListaParametros.Free;
  end;
end;

procedure TGerenciadorConexao.ppvOnTerminateThread(ipSender: TObject);
begin
  Inc(FThreadsProcessadas);
  if not FConexaoEstabelecida then
    begin
      if Assigned(TConexaoServidor(ipSender).FatalException) then
        begin
          if (FThreadsProcessadas = FTotalThreads) then
            begin
              FOnEstabeleceuConexao(nil);
              showMessage('Não foi possível se conectar ao servidor');
            end;
        end
      else
        begin
          FConexaoEstabelecida := true;
          if TConexaoServidor(ipSender).LoginIncorreto then
            begin
              FOnEstabeleceuConexao(nil);
              showMessage('Usuário e/ou Senha de acesso ao SONG incorreto.');
            end
          else
            begin
              FOnEstabeleceuConexao(TConexaoServidor(ipSender).Conexao);
              Exit;
            end;
        end;
    end;
  // se chegar aqui é pq ou deu erro ou a conexao ja foi estabelecida por outra thread
  TConexaoServidor(ipSender).Conexao.Free;
end;

end.
