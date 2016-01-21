unit uTypes;

interface

type
  TBancoDados = class
  public const
    coMacroWhere:string = 'WHERE';
    //campos comuns
    coId = 'ID';
    coNome = 'NOME';

    //operadores
    coAnd = ' and ';

  end;

  TParametros = class
    public const
      coID:string = 'ID';
      coNome:string = 'NOME';
      coActive:string = 'ACTIVE';
  end;

implementation

end.
