unit uControleAcesso;

interface

uses
  System.Generics.Collections, System.Generics.Defaults, System.TypInfo,
  Datasnap.DBClient, uTypes, System.Variants;

type
  TPermissao = record
  private
    FPermissao: string;
    FDescricao: string;
    procedure SetDescricao(const Value: string);
    procedure SetPermissao(const Value: string);
  public
    constructor Create(ipPermissao, ipDescricao: String);
    property Permissao: string read FPermissao write SetPermissao;
    property Descricao: string read FDescricao write SetDescricao;
  end;

  TModulos = class
  strict private
    FItems: TDictionary<string, TList<TPermissao>>;
    constructor Create;
    destructor Destroy; override;
  strict private
    class var FInstance: TModulos;
  public
    property Items: TDictionary < string, TList < TPermissao >> read FItems;
    class function fpuGetInstance: TModulos;

    function fpuGetDescricao(ipPermissao: String): string;
  end;

  TInfoLogin = class
  strict private
    class var FInstance: TInfoLogin;
  strict private
    FIdUsuario: Integer;
    FPermissoes: TClientDataSet;
    FSenhaUsuario: string;
    FNomeUsuario: string;
    FAdministrador: Boolean;
    procedure SetIdUsuario(const Value: Integer);
    procedure SetNomeUsuario(const Value: string);
    procedure SetSenhaUsuario(const Value: string);

    constructor Create;
    destructor Destroy; override;


  public
    property IdUsuario:Integer read FIdUsuario write SetIdUsuario;
    property NomeUsuario: string read FNomeUsuario write SetNomeUsuario;
    property SenhaUsuario: string read FSenhaUsuario write SetSenhaUsuario;
    property Permissoes: TClientDataSet read FPermissoes;
    property Administrador: Boolean read FAdministrador;

    procedure ppuChecarAdministrador;
    function fpuValidarPermissao(ipAcao: TAcaoTela; ipPermissao: string): Boolean;
    class function fpuGetInstance: TInfoLogin;
  end;

  TPermissaoAdministrativo = (admPessoa, admPerfil, admOrganizacao, admProjeto, admAtividade);
  TPermissaoFinanceiro = (finBanco,finFinanciador);

implementation

{ TPermissoes }

constructor TModulos.Create;
var
  vaPermissoes: TList<TPermissao>;

  procedure plAddAdministrativo(ipPermissao: TPermissaoAdministrativo; ipDescricao: String);
  var
    vaPermissao: TPermissao;
  begin
    vaPermissao := TPermissao.Create(GetEnumName(TypeInfo(TPermissaoAdministrativo), Ord(ipPermissao)), ipDescricao);
    vaPermissoes.Add(vaPermissao);
  end;

  procedure plAddFinanceiro(ipPermissao: TPermissaoFinanceiro; ipDescricao: String);
  var
    vaPermissao: TPermissao;
  begin
    vaPermissao := TPermissao.Create(GetEnumName(TypeInfo(TPermissaoFinanceiro), Ord(ipPermissao)), ipDescricao);
    vaPermissoes.Add(vaPermissao);
  end;

begin
  FItems := TDictionary < String, TList < TPermissao >>.Create();

  // administrativo
  vaPermissoes := TList<TPermissao>.Create;
  plAddAdministrativo(admPessoa, 'Gerenciamento de Pessoas');
  plAddAdministrativo(admPerfil, 'Gerenciamento de Perfis');
  plAddAdministrativo(admOrganizacao, 'Organizações');
  plAddAdministrativo(admProjeto, 'Projetos');
  FItems.Add('Administrativo', vaPermissoes);
   //Financeiro
  vaPermissoes := TList<TPermissao>.Create;
  plAddFinanceiro(finBanco, 'Bancos');
  plAddFinanceiro(finFinanciador, 'Financiadores');
  FItems.Add('Financeiro', vaPermissoes);


end;

destructor TModulos.Destroy;
var
  vaPermissoes: TList<TPermissao>;
begin
  for vaPermissoes in FItems.Values do
    begin
      vaPermissoes.Free;
    end;
  FItems.Clear;
  FItems.Free;
  inherited;
end;

function TModulos.fpuGetDescricao(ipPermissao: String): string;
var
  vaModulo: TList<TPermissao>;
  vaPermissao: TPermissao;
begin
  Result := '';
  for vaModulo in FItems.Values do
    begin
      for vaPermissao in vaModulo do
        begin
          if vaPermissao.Permissao = ipPermissao then
            Exit(vaPermissao.Descricao);

        end;
    end;
end;

class function TModulos.fpuGetInstance: TModulos;
begin
  if Not Assigned(FInstance) then
    FInstance := TModulos.Create;

  Result := FInstance;
end;

{ TInfoLogin }

constructor TInfoLogin.Create;
begin
  FPermissoes := TClientDataSet.Create(nil);
end;

destructor TInfoLogin.Destroy;
begin
  FPermissoes.Free;
  inherited;
end;

class function TInfoLogin.fpuGetInstance: TInfoLogin;
begin
  if not Assigned(FInstance) then
    FInstance := TInfoLogin.Create;

  Result := FInstance;
end;

function TInfoLogin.fpuValidarPermissao(ipAcao: TAcaoTela; ipPermissao: string): Boolean;
var
  vaField: string;
begin
  // se for administrador pode tudo
  if FAdministrador then
    Exit(True);

  Result := False;
  case ipAcao of
    atVisualizar:
      vaField := 'VISUALIZAR';
    atIncluir:
      vaField := 'INCLUIR';
    atAlterar:
      vaField := 'ALTERAR';
    atExcluir, atAtivar, atInativar:
      vaField := 'EXCLUIR';
  end;

  Result := FPermissoes.Locate('PERMISSAO;' + vaField, VarArrayOf([ipPermissao, 1]), []);

end;

procedure TInfoLogin.ppuChecarAdministrador;
begin
  FAdministrador := FPermissoes.Locate('TIPO', Ord(tpAdministrador), []);
end;

procedure TInfoLogin.SetIdUsuario(const Value: Integer);
begin
  FIdUsuario := Value;
end;

procedure TInfoLogin.SetNomeUsuario(const Value: string);
begin
  FNomeUsuario := Value;
end;

procedure TInfoLogin.SetSenhaUsuario(const Value: string);
begin
  FSenhaUsuario := Value;
end;

{ TPermissao }

constructor TPermissao.Create(ipPermissao, ipDescricao: String);
begin
  FPermissao := ipPermissao;
  FDescricao := ipDescricao;
end;

procedure TPermissao.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TPermissao.SetPermissao(const Value: string);
begin
  FPermissao := Value;
end;

end.
