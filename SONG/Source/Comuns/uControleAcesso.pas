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

  strict private
    class var FInstance: TModulos;
  public
    property Items: TDictionary < string, TList < TPermissao >> read FItems;
    class function fpuGetInstance: TModulos;

    function fpuGetDescricao(ipPermissao: String): string;
    destructor Destroy; override;
  end;

  TPessoa = class
  private
    FId: Integer;
    FNome: string;
    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: string);
  public
    property Id: Integer read FId write SetId;
    property Nome: string read FNome write SetNome;
  end;

  TUsuario = class(TPessoa)
  private
    FPermissoes: TClientDataSet;
    FSenha: string;
    FLogin: string;
    FAdministrador: Boolean;
    procedure SetLogin(const Value: string);
    procedure SetPermissoes(const Value: TClientDataSet);
    procedure SetSenha(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    property Login: string read FLogin write SetLogin;
    property Senha: string read FSenha write SetSenha;
    property Administrador: Boolean read FAdministrador;
    property Permissoes: TClientDataSet read FPermissoes write SetPermissoes;

    procedure ppuChecarAdministrador;
    function fpuValidarPermissao(ipAcao: TAcaoTela; ipPermissao: string): Boolean;
  end;

  TInfoLogin = class
  strict private
    class var FInstance: TInfoLogin;
    constructor Create;

  private
    FUsuario: TUsuario;
    procedure SetUsuario(const Value: TUsuario);
  public
    property Usuario: TUsuario read FUsuario write SetUsuario;
    destructor Destroy; override;
    class function fpuGetInstance: TInfoLogin;
  end;

  TPermissaoAdministrativo = (admPessoa, admPerfil, admOrganizacao, admProjeto, admAtividade);
  TPermissaoFinanceiro = (finBanco, finFinanciador, finFornecedor, finPlanoConta, finRubrica,
    finContaPagar, finContaReceber, finCliente);
  TPermissaoViveiro = (vivEspecie, vivMatriz, vivLoteSemente, vivCanteiro, vivLoteMuda);
  TPermissaoEstoque = (estItem, estEntrada,estSolicitacaoCompra);

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

  procedure plAddViveiro(ipPermissao: TPermissaoViveiro; ipDescricao: String);
  var
    vaPermissao: TPermissao;
  begin
    vaPermissao := TPermissao.Create(GetEnumName(TypeInfo(TPermissaoViveiro), Ord(ipPermissao)), ipDescricao);
    vaPermissoes.Add(vaPermissao);
  end;

  procedure plAddEstoque(ipPermissao: TPermissaoEstoque; ipDescricao: String);
  var
    vaPermissao: TPermissao;
  begin
    vaPermissao := TPermissao.Create(GetEnumName(TypeInfo(TPermissaoEstoque), Ord(ipPermissao)), ipDescricao);
    vaPermissoes.Add(vaPermissao);
  end;

begin
  FItems := TDictionary < String, TList < TPermissao >>.Create();

  // administrativo
  vaPermissoes := TList<TPermissao>.Create;
  plAddAdministrativo(admAtividade, 'Atividades');
  plAddAdministrativo(admPessoa, 'Gerenciamento de Pessoas');
  plAddAdministrativo(admPerfil, 'Gerenciamento de Perfis');
  plAddAdministrativo(admOrganizacao, 'Organizações');
  plAddAdministrativo(admProjeto, 'Projetos');
  FItems.Add('Administrativo', vaPermissoes);
  // Financeiro
  vaPermissoes := TList<TPermissao>.Create;
  plAddFinanceiro(finBanco, 'Bancos');
  plAddFinanceiro(finCliente, 'Clientes');
  plAddFinanceiro(finContaPagar, 'Contas a Pagar');
  plAddFinanceiro(finContaReceber, 'Contas a Receber');
  plAddFinanceiro(finFinanciador, 'Financiadores');
  plAddFinanceiro(finFinanciador, 'Fornecedores');
  plAddFinanceiro(finRubrica, 'Rubricas');
  plAddFinanceiro(finPlanoConta, 'Plano de Contas');
  FItems.Add('Financeiro', vaPermissoes);
  // Viveiro
  vaPermissoes := TList<TPermissao>.Create;
  plAddViveiro(vivCanteiro, 'Canteiros');
  plAddViveiro(vivEspecie, 'Espécies');
  plAddViveiro(vivLoteSemente, 'Lote de Sementes');
  plAddViveiro(vivLoteMuda, 'Lote de Mudas');
  plAddViveiro(vivMatriz, 'Matrizes');
  FItems.Add('Viveiro', vaPermissoes);

  vaPermissoes := TList<TPermissao>.Create;
  plAddEstoque(estItem, 'Itens');
  plAddEstoque(estEntrada, 'Entradas');
  plAddEstoque(estSolicitacaoCompra, 'Solicitação de Compra');
  FItems.Add('Estoque', vaPermissoes);

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
  FUsuario := TUsuario.Create;
end;

destructor TInfoLogin.Destroy;
begin
  FUsuario.Free;
  inherited;
end;

class function TInfoLogin.fpuGetInstance: TInfoLogin;
begin
  if not Assigned(FInstance) then
    FInstance := TInfoLogin.Create;

  Result := FInstance;
end;

procedure TInfoLogin.SetUsuario(const Value: TUsuario);
begin
  FUsuario := Value;
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

{ TPessoa }

procedure TPessoa.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TPessoa.SetNome(const Value: string);
begin
  FNome := Value;
end;

{ TUsuario }

constructor TUsuario.Create;
begin
  FPermissoes := TClientDataSet.Create(nil);
end;

destructor TUsuario.Destroy;
begin
  FPermissoes.Free;
  inherited;
end;

function TUsuario.fpuValidarPermissao(ipAcao: TAcaoTela;
  ipPermissao: string): Boolean;
var
  vaField: string;
begin
  // se for administrador pode tudo
  if FAdministrador then
    Exit(True);

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

procedure TUsuario.ppuChecarAdministrador;
begin
  FAdministrador := FPermissoes.Locate('TIPO', Ord(tpAdministrador), []);
end;

procedure TUsuario.SetLogin(const Value: string);
begin
  FLogin := Value;
end;

procedure TUsuario.SetPermissoes(const Value: TClientDataSet);
begin
  FPermissoes := Value;
end;

procedure TUsuario.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

end.
