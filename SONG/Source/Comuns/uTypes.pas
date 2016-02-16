unit uTypes;

interface

uses
  Winapi.Messages;

type
  TBancoDados = class
  public const
    coMacroWhere: string = 'WHERE';
    // campos comuns
    coId = 'ID';
    coNome = 'NOME';
    coAtivo = 'ATIVO';

    // operadores
    coAnd = ' and ';
  end;

  TTipoPesquisa = (tpActive=-1, tpTodos, tpId, tpNome);

  TAcaoTela = (atVisualizar, atIncluir, atAlterar, atExcluir, atAtivar, atInativar);

  TVersaoInfo = (viMaJorVersion, viMinorVersion, viRelease, viBuild);

  TTipoPerfil = (tpNormal,tpAdministrador);


const
  // mensagens customizadas do windows
  MSG_AFTER_SHOW = WM_USER + 1;
  coRegistroAtivo = 0;
  coRegistroInativo = 1;

  coArquivoConfiguracao = 'song.sys';
  coNomePadraoSongClient = 'SongClientV';
  coPastaAtualizacoes = 'Atualizacoes/';
  coExtensaoCompactacao = '.zip';

  AcaoTelaDescricao: array [TAcaoTela] of string = ('Visualizar', 'Incluir', 'Alterar', 'Excluir','Ativar', 'Inativar');

implementation

end.
