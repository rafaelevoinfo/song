unit pUsuarioPMOnline;

interface

uses
  pTypes, pAtributos;

type
  TUsuarioPMOnline = class
  private
    FEmail: String;
    FCodigoTipo: Integer;
    FCodigo: Integer;
    FStatus: TStatusUsuarioSite;
    FSenha: String;
    FNome: String;
    FTipo: TTipoUsuarioSite;
    FDataCriacao: Tdatetime;
    FCodigoEmpresa: Integer;
    FLinkAtivacao: String;
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoEmpresa(const Value: Integer);
    procedure SetCodigoTipo(const Value: Integer);
    procedure SetDataCriacao(const Value: Tdatetime);
    procedure SetEmail(const Value: String);
    procedure SetNome(const Value: String);
    procedure SetSenha(const Value: String);
    procedure SetStatus(const Value: TStatusUsuarioSite);
    procedure SetTipo(const Value: TTipoUsuarioSite);
    procedure SetLinkAtivacao(const Value: String);

  public
    [TJson]
    property Codigo: Integer read FCodigo write SetCodigo;
    [TJson]
    property Nome: String read FNome write SetNome;
    [TJson]
    property CodigoEmpresa: Integer read FCodigoEmpresa write SetCodigoEmpresa;
    [TJson]
    property Email: String read FEmail write SetEmail;
    [TJson]
    property Senha: String read FSenha write SetSenha;
    [TJson]
    property Tipo: TTipoUsuarioSite read FTipo write SetTipo;
    [TJson]
    property CodigoTipo: Integer read FCodigoTipo write SetCodigoTipo;
    [TJson]
    property Status: TStatusUsuarioSite read FStatus write SetStatus;
    [TJson]
    property DataCriacao: Tdatetime read FDataCriacao write SetDataCriacao;
    [TJson]
    property LinkAtivacao:String read FLinkAtivacao write SetLinkAtivacao;

  end;

implementation


{ TUsuarioPMOnline }

procedure TUsuarioPMOnline.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TUsuarioPMOnline.SetCodigoEmpresa(const Value: Integer);
begin
  FCodigoEmpresa := Value;
end;

procedure TUsuarioPMOnline.SetCodigoTipo(const Value: Integer);
begin
  FCodigoTipo := Value;
end;

procedure TUsuarioPMOnline.SetDataCriacao(const Value: Tdatetime);
begin
  FDataCriacao := Value;
end;

procedure TUsuarioPMOnline.SetEmail(const Value: String);
begin
  FEmail := Value;
end;

procedure TUsuarioPMOnline.SetLinkAtivacao(const Value: String);
begin
  FLinkAtivacao := Value;
end;

procedure TUsuarioPMOnline.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TUsuarioPMOnline.SetSenha(const Value: String);
begin
  FSenha := Value;
end;

procedure TUsuarioPMOnline.SetStatus(const Value: TStatusUsuarioSite);
begin
  FStatus := Value;
end;

procedure TUsuarioPMOnline.SetTipo(const Value: TTipoUsuarioSite);
begin
  FTipo := Value;
end;

end.
