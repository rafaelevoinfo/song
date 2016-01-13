unit pAtributos;

interface

type
  TLiveBinding = class(TCustomAttribute)
  private
    FNome: String;
  public
    constructor Create(ipNome: String); overload;
    constructor Create; overload;
    property Nome: String read FNome;
  end;

  TColumn = class(TCustomAttribute)
  private
    FNome: String;
    FPrefix:String;
  public
    constructor Create(ipNome, ipPrefix: String); overload;
    constructor Create(ipNome: String); overload;
    constructor Create; overload;
    property Nome: String read FNome;
    //Prefixo a ser utilizado para pegar o nome do field. Necessario quando se tem duas ou mais propertys da mesma classe, entao os nomes no dataset devem ser prefixados de alguma
    //forma que seja possivel identificar qual é qual.
    //Ex. Medico Exmaminador e Medico Solicitante  (Olhar unit pLaudos para entender melhor)
    property Prefix:String read FPrefix;

  end;

  TJson = class(TCustomAttribute)
  private
    FNome: String;
    procedure SetNome(const Value: String);
  public
    constructor Create; overload;
    constructor Create(ipNome: String); overload;
    property Nome: String read FNome write SetNome;
  end;

implementation

{ TLiveBinding }

constructor TLiveBinding.Create(ipNome: String);
begin
  FNome := ipNome;
end;

constructor TLiveBinding.Create;
begin

end;

{ TColumn }

constructor TColumn.Create(ipNome: String);
begin
  FNome := ipNome;
end;

constructor TColumn.Create;
begin

end;

constructor TColumn.Create(ipNome, ipPrefix: String);
begin
   FNome := ipNome;
   FPrefix := ipPrefix;
end;

{ TJson }

constructor TJson.Create;
begin

end;

constructor TJson.Create(ipNome: String);
begin
  FNome := ipNome;
end;

procedure TJson.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
