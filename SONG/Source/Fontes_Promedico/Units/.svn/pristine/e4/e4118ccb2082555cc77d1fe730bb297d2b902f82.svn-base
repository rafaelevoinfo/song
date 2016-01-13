unit pCallback;

interface
{**********************************************
CLASSE Utilizada para servir como callback durante a execução de uma
função no Server. Qualquer funcao que se deseje que durante sua execução
seja enviado notificações para a aplicação cliente basta que em seu escopo
possua um parametro do tipo TDBXCallback, e dentro da funcao chamar o metodo
execute sempre que quiser enviar um retorno para a aplicação cliente.
**********************************************}
uses
  DBXJSon,System.JSON;

type
  TDSCallbackMethod = reference to function(const ipArg: TJSONValue): TJSONValue;

  TMessageCallback = class(TDBXCallback)
  private
    FCallBackMethod: TDSCallbackMethod;

  public
    constructor Create(ipCallBackMethod: TDSCallbackMethod);
    function Execute(const ipArg: TJSONValue): TJSONValue; override;
  end;

implementation

constructor TMessageCallback.Create(ipCallBackMethod: TDSCallbackMethod);
begin
  FCallBackMethod := ipCallBackMethod;
end;

function TMessageCallback.Execute(const ipArg: TJSONValue): TJSONValue;
begin
  Result := FCallBackMethod(ipArg);
end;

end.
