unit uControleAcesso;

interface

uses
  System.Generics.Collections, System.Generics.Defaults;

type
  TControleAcesso = class
  private
    FModulos: TDictionary<string, TList<string>>;
    constructor Create;
    destructor Destroy; override;
  private
    class var FInstance: TControleAcesso;
  public
    property Modulos: TDictionary < string, TList < string >> read FModulos;

    class function fpuGetInstance: TControleAcesso;
  public const
    admPessoas: string = 'Gerenciamento de Pessoas';
    admPerfis: string = 'Gerenciamento de Perfis';
  end;

implementation

{ TPermissoes }

constructor TControleAcesso.Create;
var
  vaPermissoes: TList<string>;
begin
  FModulos := TDictionary < String, TList < String >>.Create();

  vaPermissoes := TList<string>.Create;
  // administrativo
  vaPermissoes.Add(admPessoas);
  vaPermissoes.Add(admPerfis);
  FModulos.Add('Administrativo', vaPermissoes);

end;

destructor TControleAcesso.Destroy;
var
  vaPermissoes: TList<String>;
begin
  for vaPermissoes in FModulos.Values do
    begin
      vaPermissoes.Free;
    end;
  FModulos.Clear;
  FModulos.Free;
  inherited;
end;

class function TControleAcesso.fpuGetInstance: TControleAcesso;
begin
  if Not Assigned(FInstance) then
    FInstance := TControleAcesso.Create;

  Result := FInstance;
end;

end.
