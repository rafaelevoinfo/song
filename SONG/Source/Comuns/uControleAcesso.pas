unit uControleAcesso;

interface

uses
  System.Generics.Collections, System.Generics.Defaults, System.TypInfo,
  Datasnap.DBClient;

type
  TModulos = class
  strict private
    FItems: TDictionary<string, TList<string>>;
    constructor Create;
    destructor Destroy; override;
  strict private
    class var FInstance: TModulos;
  public
    property Items: TDictionary < string, TList < string >> read FItems;

    class function fpuGetInstance: TModulos;
  end;

  TInfoLogin = class
  private
    FPermissoes: TClientDataSet;
    FSenhaUsuario: string;
    FNomeUsuario: string;
    procedure SetNomeUsuario(const Value: string);
    procedure SetPermissoes(const Value: TClientDataSet);
    procedure SetSenhaUsuario(const Value: string);
    public
      property NomeUsuario:string read FNomeUsuario write SetNomeUsuario;
      property SenhaUsuario:string read FSenhaUsuario write SetSenhaUsuario;

      property Permissoes:TClientDataSet read FPermissoes write SetPermissoes;
  end;

  TPermissao = (admPessoa, admPerfil);

const
  TPermissaoDescricao: array [TPermissao] of string = ('Gerenciamento de Pessoas',
    'Gerenciamento de Perfis');

implementation

{ TPermissoes }

constructor TModulos.Create;
var
  vaPermissoes: TList<string>;
begin
  FItems := TDictionary < String, TList < String >>.Create();

  vaPermissoes := TList<string>.Create;
  // administrativo
  vaPermissoes.Add(GetEnumName(TypeInfo(TPermissao), Ord(admPessoa)));
  vaPermissoes.Add(GetEnumName(TypeInfo(TPermissao), Ord(admPerfil)));
  FItems.Add('Administrativo', vaPermissoes);

end;

destructor TModulos.Destroy;
var
  vaPermissoes: TList<String>;
begin
  for vaPermissoes in FItems.Values do
    begin
      vaPermissoes.Free;
    end;
  FItems.Clear;
  FItems.Free;
  inherited;
end;

class function TModulos.fpuGetInstance: TModulos;
begin
  if Not Assigned(FInstance) then
    FInstance := TModulos.Create;

  Result := FInstance;
end;

{ TInfoLogin }

procedure TInfoLogin.SetNomeUsuario(const Value: string);
begin
  FNomeUsuario := Value;
end;

procedure TInfoLogin.SetPermissoes(const Value: TClientDataSet);
begin
  FPermissoes := Value;
end;

procedure TInfoLogin.SetSenhaUsuario(const Value: string);
begin
  FSenhaUsuario := Value;
end;

end.
