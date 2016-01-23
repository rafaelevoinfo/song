unit uUsuario;

interface

uses
  System.Generics.Collections, System.Generics.Defaults;

type
  TPermissao = class
  private
    FExcluir: Boolean;
    FIncluir: Boolean;
    FAlterar: Boolean;
    FVisualizar: Boolean;
    FNome: string;
    procedure SetAlterar(const Value: Boolean);
    procedure SetExcluir(const Value: Boolean);
    procedure SetIncluir(const Value: Boolean);
    procedure SetNome(const Value: string);
    procedure SetVisualizar(const Value: Boolean);
  public
    property Nome: string read FNome write SetNome;
    property Visualizar: Boolean read FVisualizar write SetVisualizar;
    property Incluir: Boolean read FIncluir write SetIncluir;
    property Alterar: Boolean read FAlterar write SetAlterar;
    property Excluir: Boolean read FExcluir write SetExcluir;
  end;

  TPerfil = class
  private
    FPermissoes: TObjectList<TPermissao>;
    FNome: string;
    procedure SetNome(const Value: string);
    procedure SetPermissoes(const Value: TObjectList<TPermissao>);
  public
    constructor Create;
    destructor Destroy; override;
    property Nome: string read FNome write SetNome;
    property Permissoes: TObjectList<TPermissao> read FPermissoes write SetPermissoes;
  end;

  TUsuario = class
  private
    FPerfis: TObjectList<TPerfil>;
    FSenha: string;
    FNome: string;
    procedure SetNome(const Value: string);
    procedure SetPerfis(const Value: TObjectList<TPerfil>);
    procedure SetSenha(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;

    property Nome: string read FNome write SetNome;
    property Senha: string read FSenha write SetSenha;
    property Perfis: TObjectList<TPerfil> read FPerfis write SetPerfis;
  end;

implementation

{ TUsuario }

constructor TUsuario.Create;
begin
  FPerfis := TObjectList<TPerfil>.Create;
end;

destructor TUsuario.Destroy;
begin
  FPerfis.Free;
  inherited;
end;

procedure TUsuario.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TUsuario.SetPerfis(const Value: TObjectList<TPerfil>);
begin
  FPerfis := Value;
end;

procedure TUsuario.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

{ TPerfil }

constructor TPerfil.Create;
begin
  FPermissoes := TObjectList<TPermissao>.Create;
end;

destructor TPerfil.Destroy;
begin
  FPermissoes.Free;
  inherited;
end;

procedure TPerfil.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TPerfil.SetPermissoes(const Value: TObjectList<TPermissao>);
begin
  FPermissoes := Value;
end;

{ TPermissao }

procedure TPermissao.SetAlterar(const Value: Boolean);
begin
  FAlterar := Value;
end;

procedure TPermissao.SetExcluir(const Value: Boolean);
begin
  FExcluir := Value;
end;

procedure TPermissao.SetIncluir(const Value: Boolean);
begin
  FIncluir := Value;
end;

procedure TPermissao.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TPermissao.SetVisualizar(const Value: Boolean);
begin
  FVisualizar := Value;
end;

end.
