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

  TTipoPesquisaPadrao = (tppActive, tppTodos, tppId, tppNome, tppData);

  TAcaoTela = (atVisualizar, atIncluir, atAlterar, atExcluir, atAtivar, atInativar);

  TVersaoInfo = (viMaJorVersion, viMinorVersion, viRelease, viBuild);

  TTipoPerfil = (tpNormal,tpAdministrador);

  TStatusProjeto = (spElaboracao, spAguardandoAnalise, spRecusado, spEmExecucao, spExecutado, spCancelado);
  TStatusAtividade = (saProgramada, saInicioAtrasado, saExecutando, saAtrasada, saFinalizada, saCancelada);

  TTipoVinculo = (tvRelacionado, tvDependente);


const
  // mensagens customizadas do windows
  MSG_AFTER_SHOW = WM_USER + 1;
  coRegistroAtivo = 0;
  coRegistroInativo = 1;

  coArquivoConfiguracao = 'song.sys';
  coNomePadraoSongClient = 'SongClientV';
  coPastaAtualizacoes = 'Atualizacoes/';
  coExtensaoCompactacao = '.zip';
  coDelimitadorPadrao = ';';

  AcaoTelaDescricao: array [TAcaoTela] of string = ('Visualizar', 'Incluir', 'Alterar', 'Excluir','Ativar', 'Inativar');

implementation

end.
