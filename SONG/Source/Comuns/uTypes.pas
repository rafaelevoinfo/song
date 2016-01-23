unit uTypes;

interface

uses
  Winapi.Messages;

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

const
//mensagens customizadas do windows
  MSG_AFTER_SHOW = WM_USER+1;

  coArquivoConfiguracao = 'song.sys';


implementation

end.
