unit pCategoria;

interface
uses
  pAtributos, pUtils;

type
  TCategoria = class
  private
    FCodigo: Integer;
    FNome: String;
    procedure SetCodigo(const Value: Integer);
    procedure SetNome(const Value: String);
    public
    [TColumn]
    property Codigo:Integer read FCodigo write SetCodigo;
    [TColumn('DESCRICAO')]
    property Nome:String read FNome write SetNome;
  end;

implementation

{ TCategoria }

procedure TCategoria.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TCategoria.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
