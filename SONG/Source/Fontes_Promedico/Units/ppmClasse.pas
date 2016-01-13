unit ppmClasse;

interface

uses
  Generics.Collections, pTypes, Classes, cxTL, SysUtils, Forms, Menus, Dialogs, cxGridDBTableView, DBClient,
  pAtributos;

{$REGION 'Constantes'}


const
  coSatO2 = 1;
  coFC = 2;
  coPA_Sistolica = 3;
  coPA_Diastolica = 4;
  coTemperatura = 5;
  copCO2 = 6;
  coPrimeiroHorarioAgora = -2;
  coAnd = ' AND ';
  coRgPesquisa = 'RGPESQUISA';
  coEditPesquia = 'EDITPESQUISA';
  coTrue = 'True';
  coFalse = 'False';
  coNumeroTrue = 1;
  coNumeroFalse = 0;
  coLoteUnicoData: TDate = 2958465; // data de 31/12/9999;
  coLoteUnicoIdent = 'UNICO';
  coTunel = 'Promedico';
  coTissNomeAplicativoGeradorSOLUS = 'SOLUS';
  coTissNomeAplicativoGeradorSulAmerica = 'Saude On Line';
  coFindPanelTexto = 'Digite Aqui para Filtrar os Resultados Abaixo';
  coTissSolusMatMed = 'MATERIAIS E MEDICAMENTOS';
  coRegExNro = '(^[0-9]+$)';
  coRegExNroIn = '(^(\([0-9]+)(,[0-9]+)*\)$)';
  coRegExNroEntre = '(^\(([0-9]+-[0-9]+)\)+)$';
  coRegExFaturamentoPesqLote = '^[0-9]+((,|-)?[0-9]+)*$';
  coInicialCodigoBarras = 'PMB';
  coInicialCodigoBarrasAbreviado = 'P';
  coInicialCodigoBarrasWorkStation = '#';
  coRegExCodigoBarrasWorkStation = '^#\d+$';
  coRegExCodEntradaItem = coInicialCodigoBarras + '[1-9]\d*$';
  coRegExCodBarraItem = '(^(-?)([1-9]\d*\*)?' + coInicialCodigoBarras + '\d+)|([0-9]{1,13}$)';
  coHintGrid = '(ctrl+a) Seleciona todos, ctrl+click para sele��o intercalada, shift+click para intervalo.';
  coDelimitador = '|';
  coDelimitadorDiferente = '�'; // codigo do caracter = 0254
  coTamanhoPixel = 3.7;
  coUF = '[AL][AP][AM][BA][CE][DF][ES][GO][MA][MT][MS][MG][PA][PB][PR][PE][PI][RJ][RN][RS][RO][RR][SC][SP][SE][TO]';
  coRelModelo = 'MODELO - ';
  coResultOK = 'OK!';
  coExit = 'Exit';
  coAlerta = '/*ALERTA*\';
  coParametrosIni = 'Parametros.ini';
  coModTabela = 'tbl.';
  coReferenciaOutraPergunta = 'fk.';
  coTagIni = '<campo>';
  coTagFim = '</campo>';
  coTagRepIni = '<repetir>';
  coTagRepFim = '</repetir>';
  coAcessoPermitido = 'Acesso Permitido';
  coIncluir = 'Incluir';
  coModificar = 'Modificar';
  coDeletar = 'Deletar';
  coImprimir = 'Imprimir';
  coExportar = 'Exportar';
  coFavoritosPadrao = 'Ac_Sistema_Usuario_Trocar_Usuario' + #13 +
    'Ac_Recepcao_Pacientes' + #13 +
    'Ac_Consultorios_FichaMedica' + #13 +
    'Ac_Consultorios_AtestadoMedico' + #13 +
    'Ac_Exames_Laudos' + #13 +
    'Ac_Internacao_RegistrosInternacao' + #13 +
    'Ac_Pronto_Atendimento_Registro'+ #13 +
    'Ac_Estoque_Saidas_Saidas' + #13 +
    'Ac_Admin_CtaPagar_CtaPagar' + #13 +
    'Ac_Admin_CtaReceber_ContasReceber' + #13 +
    'Ac_Controle_Bancario' + #13 +
    'Ac_BI_BI' + #13 +
    'Ac_Recepcao_Agendas_Agenda_Telefonica' + #13 +
    'Ac_Bd_Cid' + #13 +
    'Ac_Sistema_Gerenciador_Msg' + #13 +
    'Ac_Faturamento_FaturasConvenio' + #13 +
    'Ac_Sistema_Sair';
{$WRITEABLECONST ON}
  coEndConfig: String = '\ProMedico\';
  coMensagemSemAcesso: String = 'Voc� esta sem permiss�o de acesso.';
{$WRITEABLECONST OFF}

{$ENDREGION}

{$REGION 'Tipo de Dados Customizados'}


type
  TCModulo = (cmAnamnesesAcesso, cmAnamnesesAlteracao, cmLaudos, cmCirurgias, cmInternacoes, cmFaturas, cmFicha_Medica, cmImagens);
  TPrescricaoHorario = (phSN, phACM, phIntervaloSN, phCM); // quando for incluso algum tipo, tem que ir em fpuHorario_In_PrescSeNecessario para ajustar l� tb.
  TTipoCategoria = (tcZero, tcCON, tcDT, tcEXM, tcHM, tcLAB, tcMM, tcPAC, tcSD, tcKit);
  TSubTipoCategoria = (stcNenhum, stcMM_Detalhado); // caso alguma categoria tenha mais de uma tela de visualizacao, usara esse subtipo para identificar qual devera ser aberta
  TTipoAcaoLaudo = (talImpressao, talVisualizar, talEditar, talIncluir);
  TTipoPesquisa = (tpZero, tpFicha, tpProcedimento, tpItem, tpInternacao, tpReceita, tpProntoAtendimento, tpInterna_PA);
  TMemuList = (mlSistema, mlBaseDados, mlRecepcao, mlConsultorio, mlExames,
    mlCirurgia, mlInternacao, mlEstoqueGeral, mlFaturamento, mlSusAns, mlCaixa,
    mlAdministracao, mlCusto, mlModulos);
  TProAlerta = (paZero, paPedidoOrcamento, paNovaRequisicao, paPrescLibMatMed, paPrescSuspensa, paInternaRegistro, paExame_Laudo, paNovoExame, paExame_Laboratorio, paPontoReposicaoItem, paPrescEnfermagemDiagnostico, paAltaInternacao, paCCIH_Negado,
    paPedidoAprovado, paAprovacaoPedidoCompra);
  TEstSaiTipSai = (estsConsumo, estsDoacao, estsOutro, estsPerda, estsTransferencia, estsVenda);
  TBcDiaTax = (bdtZero, bdtAluguel, bdtDiaria, bdtGas, bdtOutro, bdtTaxa);
  TTipoEvolucao = (teNaoInformado, teEvolucaoEnfermagem, teEvolucaoMedica, teEvolucaoMultidisciplinar, teAnotacaoEnfermagem, tePlanoTerapeutico);
  TTipoCampoInput = (tciZero, tciDBData, tciDBEdit, tciDBMemo, tciDBRichEdit, tciData, tciEdit, tciMemo, tciRichEdit, tciCheckBox, tciComboBox, tciTime);
  TProcedureChamarLog = procedure(const ipTabela: String; const ipCodigo: Integer) of object;
  TTipoImpressao = (tiSALVAR_PDF, tiIMPRIMIR, tiVISUALIZAR, tiNONE);
  TTagsConhecidas = (IDADE, PESO, DATA_COLETA, DATA_EXAME, PESSOA_ENTREGOU, QUANT_INTERFACEAMENTO, RESULTADOS_ANTERIORES);
  TArrayOfString = Array of string;
  TTipoGrupo = (tgMedicamentos, tgMateriais, tgMateriais_Descartaveis, tgOrteseEProtese, tgOutros);
  TTipoUnidade = (tuENTRADA, tuARMAZENAGEM, tuSAIDA);
  TResultLocalizarItemCodigoBarras = (rlResult, rlTipoGrupo, rlCodItem, rlNomeItem, rlEstq_Lote_Codigo, rlEstq_Lote_Vencimento, rlQtde, rlPodeSairEstoque, rlIdentificacao, rlMedicoObrigatorioPaciente);
  TResultHonomedInfoDiaTax = (rhResult, rhCodigo_Procedimento, rhCodigo_BcDiaTax, rhQtde_CH, rhValor_CH, rhValor_Procedimento, rhPVCodigo_Procedimento, rhPVCodigo_BcDiaTax, rhPVQtde_CH, rhPVValor_CH, rhPVValor_Procedimento, rhCodigo_Oficial_Insumo);
  TResultPrecoProcedimento = (rppResult, rppInformacao, rppValor, rppValorInsumo, rppValorManual, rppQtdeCh, rppQtdeFilme, rppValorFilme);
  TPrescMedStatus = (pmsIncluido, pmsRegistrado_Pela_Enfermagem, pmsRegistrado_No_MatMed, pmsNaoUsadoDelphiAinda, pmsMedicamento_Suspenso);
  TTipoHonomedFuncao = (thfClinico, thfFisioterapeuta, thfFonoaudiologo, thfMedicoUti, thfPerfusionista, thfNutricionista, thfPsicologo, thfcCirurgicao, thfc1Auxiliar, thfc2Auxiliar, thfc3Auxiliar, thfc4Auxiliar, thfcAnestesista, thfcInstrumentador,
    thfcPediatra, thfAnestesiologista, thfcIntensivista);
  TGrupoFichaOftalmologica = (gfoAV_CC, gfoAV_SC, gfoCERATOMETRIA, gfoCID, gfoDP, gfoLENTE_CONTATO_PRESC, gfoLENTE_CONTATO_USO, gfoOLHO_DOMINANTE,
    gfoRECEITA_OCULOS_PRESC, gfoRECEITA_OCULOS_USO, gfoRAD, gfoRAE, gfoRMD, gfoRME, gfoADICAO_OCULOS_USO, gfoADICAO_OCULOS_PRESC, gfoTIPO_MODELO_OCULOS_PRESC,
    gfoTIPO_MODELO_OCULOS_USO, gfoPIO, gfoImpReceita, gfoDNP, gfoBttCopyRME_RMD);

  // tabelas a serem verificadas antes de realizar uma transferencia de internacao
  TTabelasTransferenciaInternacao = (ttiINTERNACAO, ttiEXAME, ttiHONOMED, ttiDIATAX, ttiESTSAI, ttiSDIVER, ttiPACOTES, ttiKITS, ttiTRANSCRICAO);
  // categorias de opcoes medicas
  TTabelasTransferenciaOpcoesMedicas = (ttomPRESCMEDICA, ttomEVOLMEDICA, ttomEVOLENFERMULTIDIS, ttomDESCCIRURGICA, ttomANESTESIOLOGIA, ttomANOTACAOENFERM, ttomSOLTRANSFUSAO, ttomSINAISVITAIS, ttomDIURESE, ttomDRENO, ttomQuestionarioCirurgiaSegura);

  // Tipos para VidaPlus / Gerenciador;
  TConfigCampos = (ccCodigoAgencia = 1, ccNumeroContaCorrente, ccCodigoCedente, ccInicioNossoNumero, ccFimNossoNumero, ccIdentificacaoCedente, ccLayOutBoleto, ccPercentualJurosDiaAtraso, ccPercentualMultaAtraso, ccPercentualDesconto,
    ccValorOutrosAcrescimos, ccPadroesBoletoDemonstrativo, ccPadroesBoletoInstrucoesCaixa, ccHtmlPersonalizado, ccLocalPagamento, ccId_Bancos_Conta, ccNomeArquivoConf, ccLayoutRetRem);
  TParcelas_PagtoStatus = (ppsNaoBaixado, ppsBaixaManual, ppsCancelado, ppsBaixaAutomatica);
  TParcelas_Arquivo_Tipo = (patRemessa, patRetorno);
  TLoginCampos = (lcResult, lcId_Usuario, lcId_Usuario_Perfil, lcNome, lcLogin);
  TPermissaoAcesso = (paACESSO, paINCLUIR, paALTERAR, paEXCLUIR);
  TStatusLaudo = (slNaoLiberado, slAguardandoConfirmacao, slConfirmado, slLiberado, slLiberadoDigitacao);
  TCallBackLog = reference to procedure(ipMsg: string);

  // TODO: Remover assim que n�o lan�ar mais build para a versao 2.1.65
  TAgendaPadrao = (apGeral);

  TConfiguracoesExtra = (ceObrigarPreencherCIDnaBaixaDePA, cePermitirVisualizarAnamnesePA, ceBloquearMensagemParaTodos, ceObrigarMedicoNoPA, ceListarApenasConsultaMedicoPA,
    cePermitirQueConsultasMedicosNaoGeremDebito, ceLancamentoObrigatorioBancarioBxaCtaPagarCtaReceb, ceReceitaChkApenasPrescricao,
    ceObrigarMedicoMotivoRetificacao, ceSalvarAnamneseAutomaticamente, ceVirMarcadoApenasPacientesComTriagem, ceDesabilitarRecuperacaoAnamnese, cePermitirMudarStatusListaEsperaPA,
    ceBloquearEdicaoAnamnese, ceTornarObrigPreenchimentoPosicaoPacientePrescricao, ceNaoPermitirDigitacaoManualNroFicha, ceObrigarPreencimentoCPFCNPJEmitenteBaixaContaCorrente, ceTrocarMedicoConsultaPA,
    ceNaoAlterarConsultasPAMarcadaAtendida, cePermitirLancarVariasCategoriasAmbulatorio, ceNaoPermitirFichaCPFDuplicado, ceExibirUnidadeAndFatorConversaoDeArmazenamento,
    cePermitirQualquerMedicoSumarioDaAlta, ceObrigarCIDAnamnese, ceObrigarCIDPedidoExame, ceBloquearEdicaoAnamneseCampoVeioPreConsulta, ceObrigarInformarLaudoNormal,
    ceObrigarEnvioSMS, ceVirZeradaQuantidadeLiberadaDispensacaoPrescricao, ceVirZeradaQuantidadeDispensadaDispensacaoRequisicao, ceBloquearAlteracaoStatusCompras,
    ceObrigarPreenchimentoDestinoPacienteFimAtendimento, ceTirarObrigatoriedadeCamposIncluirFicha);

const // campo se primeiro horario � maximo dois digitos
  FuncoesClinico: set of TTipoHonomedFuncao = [thfClinico, thfFisioterapeuta, thfFonoaudiologo, thfMedicoUti, thfPerfusionista, thfNutricionista, thfPsicologo, thfAnestesiologista, thfcIntensivista];
  TiposPrescricaoHorario: array [TPrescricaoHorario] of string = ('SN', 'ACM', 'S/N', 'CM');
  TiposUnidade: array [TTipoUnidade] of string = ('Entrada', 'Armazenagem', 'Sa�da');
  TiposHonomedFuncao: array [TTipoHonomedFuncao] of string = ('CL�NICO', 'FISIOTERAPEUTA', 'FONOAUDI�LOGO', 'M�DICO UTI', 'PERFUSIONISTA', 'NUTRICIONISTA', 'PSIC�LOGO', 'CIRURGI�O', '1� AUXILIAR', '2� AUXILIAR', '3� AUXILIAR', '4� AUXILIAR',
    'ANESTESISTA', 'INSTRUMENTADOR', 'PEDIATRA', 'ANESTESIOLOGISTA', 'INTENSIVISTA');
  TiposCategoria: array [TTipoCategoria] of string = ('Zero', 'CON', 'D.T', 'EXM', 'H.M', 'LAB', 'M.M', 'PAC', 'S.D', 'KIT');
  GrupoFichaOftalmologica: array [TGrupoFichaOftalmologica] of string = ('Acuidade Visual CC', 'Acuidade Visual SC', 'Ceratometria', 'CID',
    'Dist�ncia Pupilar(DP)', 'Lente de Contato Prescrito', 'Lente Contato Uso', 'Olho Dominante', 'Receita do �culos Prescrito', 'Receita do �culos em Uso', 'Refra��o Autom�tica(RAD)',
    'Refra��o Autom�tica(RAE)', 'Refra��o Manual(RMD)', 'Refra��o Manual(RME)', 'Adi��o �culos Uso', 'Adi��o �culos Prescrito', 'Tipo/Modelo �culos Prescrito', 'Tipo/Modelo �culos em Uso', 'Tonometria de Aplana��o (PIO)', 'Imprimir Receita',
    'Dist�ncia Naso-Pupilar (DNP)', 'Bot�es Copiar RME e RMD');
  TabelasTransferenciaInternacao: array [TTabelasTransferenciaInternacao] of string = ('Interna��o', 'Exames', 'Honor�rios M�dicos', 'Di�rias e Taxas', 'Materias/Medicamentos', 'Servi�os Diversos', 'Pacotes', 'Kits', 'Transcri��es');
  TabelasTransferenciaOpcoesMedicas: array [TTabelasTransferenciaOpcoesMedicas] of string = ('Prescri��o M�dica', 'Evolu��o M�dica', 'Evolu��o Multidisciplinar', 'Descri��o Cir�rgica', 'Anestesiologia', 'Anota��o Enfermagem',
    'Solicita��o Transfus�o', 'Sinais Vitais', 'Diurese', 'Dreno', 'Question�rio de Cirurgia Segura');
  StatusLaudo: array [TStatusLaudo] of string = ('N�o Liberado', 'Aguardando Confirma��o', 'Confirmado', 'Liberado', 'Liberado para digita��o');

  PermissaoAcesso: array [TPermissaoAcesso] of string = ('ACESSO_PERMITIDO', 'INCLUIR', 'MODIFICAR', 'EXCLUIR');
  ConfiguracoesExtra: array [TConfiguracoesExtra] of string = ('Obrigar preenchimento do CID na baixa do Pronto Atendimento',
    'Permitir que as anamneses de pronto atendimento sejam visualizadas por todos os m�dicos',
    'Bloquear o envio de mensagem para TODOS',
    'Tornar o nome do m�dico obrigat�rio no Pronto Atendimento',
    'Aparecer apenas consultas do m�dico no Pronto Atendimento',
    'Permitir que as Consultas dos M�dicos n�o Gerem D�bito',
    'Lan�amento Obrigat�rio para o Controle Banc�rio nas Baixas de Contas a Pagar e Receber',
    'J� vir marcado CheckBox "Apenas Prescri��o do DEF" na Receita',
    'Obrigar o m�dico a informar o motivo da retifica��o dos laudos',
    'Salvar anamnese automaticamente(sem fazer a pergunta) ao sair da ficha m�dica',
    'J� vir marcado CheckBox "Apenas Paciente Com Triagem" no Atendimentos(Ficha M�dica)',
    'Desabilitar Recupera��o de Anamnese',
    'Permitir mudar o STATUS (A Atender/Atendido) na Lista de Espera do Pronto Atendimento',
    'Bloquear a edi��o de anamnese (deixar� editar as de hoje e as que foram marcadas como Aguardando Exame)',
    'Tornar obrigat�rio o preenchimento da posi��o do paciente na prescri��o',
    'N�o Permitir a Digita��o Manual do N�mero da Ficha no cadastro do Paciente',
    'Obrigar o Preenchimento do CPF/CNPJ do Emitente na Baixa da Conta Corrente',
    'Trocar m�dico da consulta (no PA) quando o mesmo fizer uma anamense',
    'N�o alterar o M�dico nas consultas (no PA) quando a consulta j� estiver marcada como Atendida',
    'Permitir Lan�ar V�rias Categorias no Ambulat�rio',
    'N�o permitir duplica��o de CPF no cadastro de pacientes',
    'Exibir unidade e fator de convers�o de armazenamento',
    'Permitir que qualquer m�dico tenha acesso ao Sum�rio da Alta, n�o apenas o m�dico respons�vel',
    'Obrigar o preenchimento do CID na Anamnese',
    'Obrigar o preenchimento do CID no Pedido de Exame',
    'Bloquear edi��o na Anamnese dos campos que vieram da Pr�-Consulta',
    'Obrigar preencher o campo Laudo Normal durante a digita��o do laudo.',
    'Obrigar o envio do SMS no cadastro das fichas',
    'Vir Zerada a Quantidade Liberada na Dispensa��o da Prescri��o',
    'Vir Zerada a Quantidade Dispensada na Dispensa��o da Requisi��o',
    'Bloquear a Altera��o do Status no M�dulo de Compras',
    'Obrigar Preenchimento do "Destino do Paciente Ap�s Fim do Atendimento" na Finaliza��o do Pronto Atendimento',
    'Tirar a Obrigatoriedade dos Campos ao Incluir a Ficha pela Interna��o');
  // Constantes do Vida Plus;
  coVersaoVidaPlus = '"Vida Plus 1.0.1"';
{$ENDREGION}

{$REGION 'TMenuLista'}


type
  TMenuLista = Class
  public
    NomeMenu: String;
    Permissoes: TStringList;
    constructor Create;
    destructor destroy; override;
  End;
{$ENDREGION}

{$REGION 'Permissao Lista'}


type
  TPermissaoLista = Class
  private

  public
    FMenuLista: TObjectList<TMenuLista>;

    { Sistema }
    siLogAcoes, siTransfProcedimentosPaciente, siRelatorios, siRecalcular,
      siSenhaMensal, siConfigSistema, siConfigRateioFaturamento, siConfigRegrasHonorarioFaturamento,
      siConfigBoletos, siUsuarios, siDeletaRegistrosPagmsAnteriores,
      siLiberarHorario, siGerenciadorMensagem, siGerenciadorPermissaoRelatorio, siEnviarMensagemTodos, siConfigurarGuicheSenha,
      siDicomPesquisa, siLogInterfaceamento, siLogComoOutroUsuario, siConfigRegrasExameFaturamento, siWorklist, siConfigPrestadoresDebRecepcao, siEmail_Enviar, siEmail_Config,
      siTelasCustomizadas, siUsuarioPMOnline, siRegraSuspensaoMedico, siConfigSMSModulo, siImportarDef, siCertificadosRaiz, siValidarCertificado,
      siBackupRestore, siEfetuarBackup, siEfetuarRestore, siConfiguracaoBackupRestore, siMonitorarBD, siMonitorarHDServidor, siControleAcesso, siDeclaracaoTermoUso,
      siAlterarConfigAlertaMsgChat,

    { Base de Dados }
    bdCCe, bdCidades, bdMotivosGlosa, bdDestinoP, bdDicionario, bdFeriado,
      bdAdmissao, bdTbEspecial, bdCFuncao, bdBoletos, bdPreConsulta, bdNaTrata,
      bdAlerta, bdAlertaEmail, bdEpidemia, bdFormaPagto, bdLabMaterial, bdUnidades, bdViaAdm,
      bdSolicitantes, bdModeloTexto, bdTributos, bdCtExames, bdBcPlanilha, bdCid, bdTabGeralProcedimentos, bdAtualTabGeralProcedimentos,
      bdTabGeralProcedimentosReajustarValores, bdTabGeralProcedimentosLayout, bdTabGeralDiaTax, bdAtualTabGeralDiaTax, bdTabGeralMatMed, bdAtualTabGeralMatMed,
      bdGrpValFilmes, bdModFaturasEletronicas, bdModFaturasEletronicasExpotar,
      bdModFaturasEletronicasImportar, bdCadGeralConvenios, bdTabPrestadores, bdTabMedicos,
      bdTabIntrucoes, bdTabIndicadores, bdConfigFormularios, bdModCarteirinhas, bdTabProcedimentos,
      bdTabProcedimentosModLaudos, bdTabDiaTax, bdTabGrpServicosDiversos, bdTabServicosDiversos,
      bdTabPacotes, bdTabKits, bdTabOrigemExames, bdTabProcCirurgicos, bdTabProcedimentosCIH,
      bdRelCustomizados, bdRelRelatorios, bdHistorico_Atendim, bdModelo_Chave, bdAla, bdTipo_Visita, bdModeloLab,
      bdTabAbreviacoes, bdTabTipoOculos, bdOftalProdLimpeza, bdGrupoLancamento, bdPrioridade, bdPrescricaoIntervalo, bdGerenciarModeloTexto,
      bdTabHonorarioFormula, bdProfissionais_Saude, bdProfissoes, bdTiposDigitalizacao, bdPrescricao_Servico, bdTabLaboratorios, bdDiagnostico_Enf,
      bdServicosEnfermagem, bdCadGeralConveniosConfiguracoes, bdGrupoOutrosImpressos, bdExame_Sessao_Lab, bdConfigurar_Documentos, bdDocumentos_Gerais,
      bdFilas,

{ Recepcao }
    reAlterarAtendimento, rePacientes, reRegCasosEspeciais, reAgendaGeral, reAgendaGeralCategorias,
      rePermitirBaixaRetroativaParticular,
      reAgmtoCirurgias, reAgmtoCirurgiasLiberar, reAgmtoCirurgiasBloquearDesbloquear,
      reAgmtoConsultas, reAgmtoConsultasBloquearDesbloquear, reAgmtoExames, reAgmtoExamesBloquearDesbloquear,
      reAgendaTelefonica, reRecibos, reFichario, reFicharioModeloImpressao,
      reFicharioeArqMorto, reCtCorPaciente, reCtCorPacienteEfetBaixaParticular, reCtCorPacienteEfetBaixaConvenio,
      reCtCorPacienteDelBaixaParticular, reCtCorPacienteDelBaixaConvenio, reRegProcAmbulatorio,
      reRegProcInternacao, reRegMatMedAmbulatorio, reRelMalaDireta, reRelRegCasosEspeciais,
      reRelAgendamentos,
      reRelConsultasGeral, reRelExamesProcedimentos, reRelPlanilhaBancadaExamePeriodo, reRelEpidemias,
      reRelProcsGeradosPeriodo, reRelProducaoMedico,
      reRelHonorariosMedicos, reRelDiaTaxPeriodo, reRelSericosDiversos, reRelObitosPeriodo, reRelpacCadastradosPeriodo,
      reRelUltimoAtendimento, reSessao, reVisitantes, reRelVisitantes, reRelPacotes, reListaEspera, reAgendaAlterarHorarios,
      reFicharioPrioridade, reImpressaoFichaCadastral, reConfigAgenda, reConfigAgendaUsuarios, reConfigAgendaHorarios, reConfigAgendaRestricoes,
      reConfigAgendaRestricoesConvenio, reChamarSenhas, reArquivo, reAlterarConvenioProcedimento, reMotivos_Cancelamento, reAlterarConvenioGuias,
      reCirurgiaStatus, rePainelCirurgico, reCirurgiaUrgencia, reAlertaFicha, reRelReferenciaCruzada, reRelConsumoSMS, reRelProducaoPorUsuario,
      reXMLWebService, reEditarValorDiariaTaxa, reRelAtendimentosFaixaEtaria,

    { Consultorio / PEP }
    coConsAtendimento, coAtestados, coModeloAtestado, coPedGuiaInternCirurgia, coSolicEntradaPac,
      coModeloPresc, coRecibosMedicos, coFichaOftalmologica, coPlantao, coCopiarModeloAnamnese, coModeloAtestadoGeral, coModeloDefGeral, coModeloReceitaGeral,
      coModeloAnamnese, coModeloAnamneseRespostasPadrao, coOutros_Imp, coOutros_Imp_Modelo, coOutros_Imp_Modelo_Geral, coProntuarioMedico,
      coAnamnese, coImagensProntuario, coReceitas, coLogAnamnese,
      coAmenorreia, coLembretePaciente, coPlanilhaAtendimento, coAlergiaAlerta, coVisualizarAnamnese,

      // essas abaixo eram da interna��o estamos transferindo para o consultorio / PEP
    coSumarioAlta, coPrescricaoMedica, coEvolucaoMedica, coEvolucaoEnfermagem, coAnestesiologia, coPlanoTerapeutico, coScorePrognostico,
      coDescricaoCurativos, coEvolucaoMultidisciplinar, coPrescricaoEnfermagemDiagnostico, coAnotacoesEnfermagem, coBalancoHidrico,
      coAlterDelAnotacaoEvolucaoEnfermagem, coPrescAprazamento, coModPrescricaoMedica, coTranscricaoPrescricao, coPrescricaoEnfermagem,
      coImprimirSumario, coImprimirEtiqueta, coImprimirPulseira, coImprimirAIH, coImprimirGuiaSolicitacaoInternacao, coSolicitacaoTransfusao,
      coEscalasIndices, coDelegacaoPoder,

{ Exames }
    exPodeTrocarLabComLaudo, exPedidoExame, exLaudos, exLaudosVisualizarBttIncluirNova, exLaudosLab, exLaudosAlterarTamanhoTexto,
      exLaudosLabLiberar, exLaudosLabModificaImp, exModeloLaudo, exModeloLaudoLab, exRelatorios, exImportarImgDicom,
      exEntregaLaudo, exMeusModelosExamesPadrao, exLaudosAlterarMedicoConferidor, exLaudosEnviarLaudoPorEmail, exInterfaceamento,
      exInterfaceamento_Config, exInterfaceamento_Laboratorios, exInterfaceamento_Lotes, exLaudoExcluirImpresso, exLaudoExcluirEntregue, exFilaAtendimentos, exImagensExames,
      exConfiguracoesPedidoExame,exEntregaColeta,

    { Cirurgia }
    ciRegistroCirurgia, ciDescricaoCirurgia, ciRelCirurgiaProcedimento,

    { Interna��o }
    inRegistroMatMed, inAbrirFecharInternacao, inLocInternacaoLeitos, inRegistrosInternacao, inHonorariosedicos, inDiariasTaxas,
      inServicosDiversos, inPacoates, inKits, inMapaOcupacaoLeitos, inDelTodosRegistrosInternacao, inRelPacientesInternados,
      inRelPacientesInternadosPVez, inRelAltasGeral, inRelInternacoesGeral, inRelInternacoesMedico, inRelTaxaOcupacaoLeitos, inRelInternaNaturTratamtGeral,
      inRelComparacaoPacotesSus, inRelKitsPeriodo, inRelVisitantes, inPodeAlterarPacote, inPodeAlterarConvenio,
      inVisualizarContaInternacao, inTransferirInternacao, inTransferirLanctosInternacao, inDataFutura, inAltaDataFutura, inCCIH,
      inConfigTelaMapaOcupacao, inTabelaPosicoesPaciente, inTransferenciaLeitos, inRelAltasCidsDiferentes,

    { Pronto Atendimento }
    paRegistroMatMedPA, paAbrirFecharPA, paLocPALeitos, paRegistrosPA, paDelTodosRegistrosPA, paPodeAlterarPacotePA,
      paPodeAlterarConvenioPA, paVisualizarContaPA, paTransferirPA, paTransferirLanctosPA,

    { Terapia }
    teRegistroMatMed, teAbrirFecharTerapia, teLocTerapiaLeitos, teRegistrosTerapia, teDelTodosRegistrosTerapia, tePodeAlterarPacote,
      tePodeAlterarConvenio, teVisualizarContaTerapia, teTransferirTerapia, teTransferirLanctosTerapia, teRevisaoPrescricaoTerapica,
      teEnviarConvenioPrescricaoTerapica,

    { EstoqueGeral }
    esDevolucaoEntrada, esDevolucaoRequisicao, esDevolucaoVenda, esEntradas, esGrpSubgpEstoque,
      esVisualizarCusto,
      esItens, esLotesSaldos, esPedidos_Aprovacao,
      esPrescMedicaLibMatMed, esRestrItens, esRefItens, esItensRevisaoRef,
      esRequisicoes, esRequisicoesDispensar, esSaidas, esSetores,
      esTabRestrEstoque, esRelGeralEntradas, esRelGeralItens,
      esRelSaidas, esRelLotesVencidosVencer,
      esRelSaldoExtratoInventario, esRelItensPontoReposicao, esRelResumoSaidasItem,
      esRelListaPrecos, esRelMapaComparaPrecos, esRelMedicamentosMedico,
      esRelPacLancamMatMed, esRelTransfPeriodo, esRelItensMaisMenosVendidos,
      esRelCustoSetor, esRelPrecoMedioPeriodo, esLocal_Uso, esAbrirNota, esFecharNota, esAcertoEstoque,
      esRastreabilidade, esEditarRequisicaoOutroUsuario, esUnidades, esSubTipoSaida, esPodeEditarValorMatMed, esRelCurvaABC,
      esEnxovalItens, esEnxovalGrupos, esEnxovalControle, esEnxovalLoacais, esEnxovalMovimentacao, esRequisicoesMatMed, esRequisicoesCompraMatMed,
      esRelEnxovais, esComprasOrcamento, esComprasPedido, esComprasAprovacaoPedido, esRelPrecoMatMedConvenio,

    { Faturamento }
    ftFaturConvenio, ftFaturConvenioLotes, ftFaturConvenioLotesAbreFecha,
      ftFaturConvenioImprime, ftRegsInternacao, ftPreConta, ftPreContaExportar,
      ftRelGuiasNaoEnviadas, ftRelGuiasEnviadas, ftRelGuiasPagasGlosadas, ftAbrirlote, ftFecharLote, ftFaturaRecebimento,
      ftQuitarGlosarGuia, ftQuitarGlosarGuiaOutro, ftRelGuiasFaturadasPorGuia, ftAlterarNumeroSequencial, ftRecursoGlosa,

    { SusAns }
    suGerarArquivo, suRelBPA, suImportarIH, suUnidadeSUS, suConfiguracoes, suBPA_I, suBPA_C, suExportarSUS, suAIH,

    { Auditoria }
    auAuditoria, auSetarChecado, auAuditoriaRegistros,

    { Caixa }
    cxEnvGuiasFaturamento, cxEnvGuiasFaturamRecebimento, cxFechaCaixa,
      cxFechaCaixaConfirmar, cxFechaCaixaTiraConfirmar, cxRelMovDiarioCaixa,
      cxRelProcAberto, cxRelGuiasMedico, cxRelMovDiarioProcedim, cxRelRateioPeriodo,

    { Administracao }
    adGrupos_CtApagar, adBcorigcr,
      adClientes_Ctareceb, adCtExames, adPatrimonio, adPatrimonio_Local,
      adContas_Balancete, adFornec, adLotesCtPagar, adPatrimEmprestimo, adCtPagar,
      adCtPagarImprCheques, adCtReceber, adBancPessModelCheque, adBancPessHistoricos,
      adBancPessContas, adBancPessLancamentos, adBancPessChecagemExtrato, adBancPessImprCheques,
      adBancEmpresModelCheque, adBancEmpresHistoricos, adBancEmpresContas, adBancEmpresLancamentos,
      adBancEmpresChecagemExtrato, adBancEmpresImprCheques, adBancEmpresConciliacao, adBancEmpresAlteraConciliados, adAntecipaPagamts,
      adCadChequesSemFundo, adRepasseMedPrestador, adAdmContasTransf, adTermoConfisDivida, adTipoDocumento,
      adCartasCobranca, adRelImprCartirinhas, adRelInfOnLine, adRelCtPagasPagar, adRelCtRenegociadas,
      adRelExtratoCtBalancete, adRelNotasPagasPeriodo, adRelCtRecebidasReceber, adRelBalancFinanceiro,
      adRelAntecPagmts, adRelBancPessSaldoGeralCts, adRelMovBancario, adRelFluxoCaixa,
      adRelTermoConfDivida, adRelFaturamento,
      adRelRelacPatrimonial, adRelChequesSemFundo, adRelResumoContasBalance, adGerarDemed, adFechamentoBancario, adPastaArquivo,
      adContaBalanceteCategoria, adGruposFornec,
    { BI }
    biBI, biDashBoard, biModeloBi,
    { Custo }
    cuCentrosCusto, cuCentrosCustoDespesas,
      cuCentrosCustoRateio, cuRelEstMargContribuicao,
      cuDespesas: String;

    constructor Create;
    destructor destroy; override;
    procedure ppuRetornaListaPermissaocds(ipCds: TClientDataSet; ipCdsPermissoesFormCustom: TClientDataSet = nil);
  end;
{$ENDREGION}

{$REGION 'AlertaInfo'}


type
  TAlertaInfo = Record
    AlertaOrigem: TProAlerta;
    CodigoAlerta, NroFicha: Integer;
    Descricao: String;
  end;
{$ENDREGION}

{$REGION 'Classe para pesquisa no LOG'}

  TInfoBuscaLog = class
  private
    FValorPesquisa: String;
    FSomenteAtividadePorDelegacao: Boolean;
    FTabela: String;
    FComponente: Integer;
    FEventos: String;
    FTipoPesquisa: Integer;
    FNivelCriticidade: Integer;
    FTipoAcao: String;
    FDataFinal: String;
    FDataInicial: String;
    FFiltroDelta: String;
    procedure SetComponente(const Value: Integer);
    procedure SetNivelCriticidade(const Value: Integer);
    procedure SetEventos(const Value: String);
    procedure SetSomenteAtividadePorDelegacao(const Value: Boolean);
    procedure SetTabela(const Value: String);
    procedure SetTipoAcao(const Value: String);
    procedure SetTipoPesquisa(const Value: Integer);
    procedure SetValorPesquisa(const Value: String);
    procedure SetDataFinal(const Value: String);
    procedure SetDataInicial(const Value: String);
    procedure SetFiltroDelta(const Value: String);


  public
    constructor Create;

    property DataInicial:String read FDataInicial write SetDataInicial;
    property DataFinal:String read FDataFinal write SetDataFinal;
    property TipoPesquisa: Integer read FTipoPesquisa write SetTipoPesquisa;
    property ValorPesquisa: String read FValorPesquisa write SetValorPesquisa;
    property TipoAcao: String read FTipoAcao write SetTipoAcao;
    property Eventos: String read FEventos write SetEventos;
    property Tabela: String read FTabela write SetTabela;
    property NivelCriticidade: Integer read FNivelCriticidade write SetNivelCriticidade;
    property Componente: Integer read FComponente write SetComponente;
    property SomenteAtividadePorDelegacao: Boolean read FSomenteAtividadePorDelegacao write SetSomenteAtividadePorDelegacao;

    //Property usadas apenas no lado cliente
    property FiltroDelta:String read FFiltroDelta write SetFiltroDelta;
  end;
{$ENDREGION}
{$REGION 'Classe para guardar os componentes importantes de um form'}


Type
  TListaComponentes = Class
  const
    coClasses = '[TcxGridDBTableView]';
  private
    lcFormAtual: TForm;
  public
    lcLista: TList;
    FChamarLog: TProcedureChamarLog;
    constructor Create(ipForm: TForm);
    destructor destroy;
    procedure PopClick(Sender: TObject);
    procedure SalvarGrids;
    procedure ResturarGrids;
    procedure CriarPopUpLog(ipProcedure: TProcedureChamarLog);
  End;
{$ENDREGION}

{$REGION 'Records com os parametros de lancamento e consulta de procedimentos'}

  TParametrosLancamento = Record
  public
    NroFicha: Integer;
    NroInternacao: Integer;
    ProntoAtendimento: Boolean;
    Terapia: Boolean;
    FecharAoSalvar: Boolean;
    TravarCampoMedico: Boolean;

    TipoCategoria: TTipoCategoria;

    NroRegistroAlterar: Integer;

    CodigoProcPgos: Integer;

    CodigoConvenio: Integer;

    CodigoMedicoExaminador: Integer;

    CategoriasEspecificas: String;

    MedicosEspecificos: String;

    MovimentandoPeloFaturamento: Boolean;

    CodigoBXACORRE: Integer;

    CodigoAgendaHs: Integer;

    CodigoLocalUso: Integer;

    DataRegistro: TDateTime;
    // Usado apenas para a tela de insercao de exames
    CategoriaExame: Integer;
    // Indica se durante o lan�amento deve realizar o agrupamento de exames.
    ModoAgrupamento: Boolean;
    // Usado no honorario para lan�ar um or�amento ou invez de lan�ar um honorario
    CodigoPreConta: Integer;

    CodigoModoConsulta: Integer;
    SomenteLeitura: Boolean;
    AbrirSomenteEdicaoModal: Boolean;

    // Utilizado para se saber de onde foi feito a chamada para abrir a tela. Usado por enquando na consulta para nao
    // imprimir o protocolo quando salvar
    TelaOrigem: TTelaOrigem;
    // Informa se vai permitir lancar o procedimento sem referencia(utilizado inicialmente pela consulta lancada da agenda)
    PermitirProcedimentoSemReferencia: Boolean;

    // Utilizado pela tela de mat/med para saber se deve-se editar somente as informacoes complementares
    ApenasInfoComplementar: Boolean;

    SubTipoCategoria: TSubTipoCategoria;

    HoraInicio: TTime;

    HoraFim: TTime;

    DataInternacao, DataAlta: TDate;

    //qualquer informacao extra que seja necessaria
    InfoExtra:TObject;
    // esse construtor tem q ter pelo menos um parametro pq senao da erro
    constructor Create(ipCategoria: TTipoCategoria);
  end;

  TParametrosConsulta = record
    NroFicha: Integer;
    NroInternacao: Integer;
    Codigo: Integer;
    TipoCategoria: TTipoCategoria;
    // Usado apenas para a tela de consulta de exames)
    CategoriaExame: Integer;
    ProntoAtendimento: Boolean;
    Terapia: Boolean;
    TravarCampoMedico: Boolean;
    SubTipoCategoria: TSubTipoCategoria;
    CodigoBXACORRE: Integer;

    // esse construtor tem q ter pelo menos um parametro pq senao da erro
    constructor Create(ipCategoria: TTipoCategoria);
  end;

{$ENDREGION}

  IContainerConsultaProcedimentos = interface
    procedure ppuRecriarFrame(ipParametros: TParametrosConsulta);
  end;

function fpuHorario_In_PrescSeNecessario(ipHorario: Integer): Boolean;
function TipoCategoriaToStr(ipTipoCategoria: TTipoCategoria): String;
function StrToTipoCategoria(ipString: String): TTipoCategoria;
function StrToTipoCampoInput(ipString: String): TTipoCampoInput;
function TipoPesquisaToStr(ipTipoPesquisa: TTipoPesquisa): String;
function StrToTipoPesquisa(ipTipoPesquisa: String): TTipoPesquisa;
function ProAlertaToStr(ipAlerta: TProAlerta): String;
function fcEstSaiTipSaiToStr(ipEstSaiTipSai: TEstSaiTipSai): String;
function StrToProAlerta(ipString: String): TProAlerta;
function StrToBcDiaTax(ipString: String): TBcDiaTax;

implementation

uses pMethod2009;
{$REGION 'Funcoes Gerais}


function fpuHorario_In_PrescSeNecessario(ipHorario: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  i := 0;

  if ipHorario = -1 then
    Result := True
end;

function TipoCategoriaToStr(ipTipoCategoria: TTipoCategoria): String;
begin
  case ipTipoCategoria of
    tcZero:
      Result := '';
    tcCON:
      Result := 'CON';
    tcDT:
      Result := 'D.T';
    tcEXM:
      Result := 'EXM';
    tcHM:
      Result := 'H.M';
    tcLAB:
      Result := 'LAB';
    tcMM:
      Result := 'M.M';
    tcPAC:
      Result := 'PAC';
    tcSD:
      Result := 'S.D';
    tcKit:
      Result := 'KIT';
  end;
end;

function StrToTipoCategoria(ipString: String): TTipoCategoria;
begin
  if ipString = '' then
    Result := tcZero
  else if ipString = 'CON' then
    Result := tcCON
  else if ipString = 'D.T' then
    Result := tcDT
  else if ipString = 'EXM' then
    Result := tcEXM
  else if ipString = 'H.M' then
    Result := tcHM
  else if ipString = 'LAB' then
    Result := tcLAB
  else if ipString = 'M.M' then
    Result := tcMM
  else if ipString = 'PAC' then
    Result := tcPAC
  else if ipString = 'S.D' then
    Result := tcSD
  else if ipString = 'KIT' then
    Result := tcKit;
end;

function StrToTipoCampoInput(ipString: String): TTipoCampoInput;
begin
  if ipString = 'tciDBData' then
    Result := tciDBData
  else if ipString = 'tciDBEdit' then
    Result := tciDBEdit
  else if ipString = 'tciDBMemo' then
    Result := tciDBMemo
  else if ipString = 'tciDBRichEdit' then
    Result := tciDBRichEdit
  else if ipString = 'tciData' then
    Result := tciData
  else if ipString = 'tciEdit' then
    Result := tciEdit
  else if ipString = 'tciMemo' then
    Result := tciMemo
  else if ipString = 'tciRichEdit' then
    Result := tciRichEdit
  else if ipString = 'tciCheckBox' then
    Result := tciCheckBox
  else
    Result := tciZero;
end;

function TipoPesquisaToStr(ipTipoPesquisa: TTipoPesquisa): String;
begin
  Result := '';
  case ipTipoPesquisa of
    tpFicha:
      Result := 'tpFicha';
    tpProcedimento:
      Result := 'tpProcedimento';
    tpItem:
      Result := 'tpItem';
    tpInternacao:
      Result := 'tpInternacao';
    tpProntoAtendimento:
      Result := 'tpProntoAtendimento';
    tpInterna_PA:
      Result := 'tpInterna_PA';
  end;
end;

function StrToTipoPesquisa(ipTipoPesquisa: String): TTipoPesquisa;
begin
  Result := tpZero;
  if ipTipoPesquisa = 'tpFicha' then
    Result := tpFicha
  else if ipTipoPesquisa = 'tpProcedimento' then
    Result := tpProcedimento
  else if ipTipoPesquisa = 'tpItem' then
    Result := tpItem
  else if ipTipoPesquisa = 'tpInternacao' then
    Result := tpInternacao
  else if ipTipoPesquisa = 'tpProntoAtendimento' then
    Result := tpProntoAtendimento
  else if ipTipoPesquisa = 'tpReceita' then
    Result := tpReceita
  else if ipTipoPesquisa = 'tpInterna_PA' then
    Result := tpInterna_PA;
end;

function fcEstSaiTipSaiToStr(ipEstSaiTipSai: TEstSaiTipSai): String;
begin
  Result := '';
  case ipEstSaiTipSai of
    estsConsumo:
      Result := 'CONSUMO';
    estsDoacao:
      Result := 'DOA��O';
    estsOutro:
      Result := 'OUTRO';
    estsPerda:
      Result := 'PERDA';
    estsTransferencia:
      Result := 'TRANSFER�NCIA';
    estsVenda:
      Result := 'VENDA';
  end;
end;

function ProAlertaToStr(ipAlerta: TProAlerta): String;
begin
  Result := '';
  case ipAlerta of
    paPedidoOrcamento:
      Result := 'PEDIDO DE OR�AMENTO';
    paNovaRequisicao:
      Result := 'NOVA REQUISI��O';
    paPrescLibMatMed:
      Result := 'LIBERA��O MAT/MED PRESCRI��O';
    paPrescSuspensa:
      Result := 'PRESCRI��O SUSPENSA';
    paInternaRegistro:
      Result := 'REGISTRO DE INTERNA��O';
    paExame_Laudo:
      Result := 'Exame Laudo';
    paExame_Laboratorio:
      Result := 'Exame Laborat�rio';
    paPontoReposicaoItem:
      Result := 'PONTO DE REPOSI��O DO ITEM';
    paNovoExame:
      Result := 'NOVO EXAME';
    paPrescEnfermagemDiagnostico:
      Result := 'PRESCRI��O DE ENFERMAGEM - DIAGN�STICO';
    paAltaInternacao:
      Result := 'ALTA DA INTERNA��O';
    paCCIH_Negado:
      Result := 'CCIH ANTIMICROBIANO - NEGADO';
    paPedidoAprovado:
      Result := 'PEDIDO DE COMPRA APROVADO';
    paAprovacaoPedidoCompra:
      Result := 'APROVA��O DE PEDIDO DE COMPRA';
  end;
end;

function StrToProAlerta(ipString: String): TProAlerta;
begin
  Result := paZero;
  if ipString = 'PEDIDO DE OR�AMENTO' then
    Result := paPedidoOrcamento
  else if ipString = 'NOVA REQUISI��O' then
    Result := paNovaRequisicao
  else if ipString = 'LIBERA��O MAT/MED PRESCRI��O' then
    Result := paPrescLibMatMed
  else if ipString = 'PRESCRI��O SUSPENSA' then
    Result := paPrescSuspensa
  else if ipString = 'REGISTRO DE INTERNA��O' then
    Result := paInternaRegistro
  else if ipString = 'Exame Laudo' then
    Result := paExame_Laudo
  else if ipString = 'Exame Laborat�rio' then
    Result := paExame_Laboratorio
  else if ipString = 'PONTO DE REPOSI��O DO ITEM' then
    Result := paPontoReposicaoItem
  else if ipString = 'NOVO EXAME' then
    Result := paNovoExame
  else if ipString = 'PRESCRI��O DE ENFERMAGEM - DIAGN�STICO' then
    Result := paPrescEnfermagemDiagnostico
  else if ipString = 'ALTA DA INTERNA��O' then
    Result := paAltaInternacao
  else if ipString = 'CCIH ANTIMICROBIANO - NEGADO' then
    Result := paCCIH_Negado;
end;

function StrToBcDiaTax(ipString: String): TBcDiaTax;
begin
  Result := bdtZero;
  if ipString = 'ALUGUEL' then
    Result := bdtAluguel
  else if ipString = 'DI�RIA' then
    Result := bdtDiaria
  else if ipString = 'G�S' then
    Result := bdtGas
  else if ipString = 'OUTRO' then
    Result := bdtOutro
  else if ipString = 'TAXA' then
    Result := bdtTaxa;
end;
{$ENDREGION}
{$REGION 'TPermissao'}


{ TPermissao }
constructor TPermissaoLista.Create;
var
  vaMenuLista: TMenuLista;
begin
  FMenuLista := TObjectList<TMenuLista>.Create;
  { Sistema }
  vaMenuLista := TMenuLista.Create;
  vaMenuLista.NomeMenu := 'Sistema';

  siLogAcoes := 'Log - A��es';
  vaMenuLista.Permissoes.Add(siLogAcoes);
  siEnviarMensagemTodos := 'Enviar Mensagem para TODOS';
  vaMenuLista.Permissoes.Add(siEnviarMensagemTodos);
  siTransfProcedimentosPaciente := 'Transfer�ncia de Procedimentos de Pacientes';
  vaMenuLista.Permissoes.Add(siTransfProcedimentosPaciente);
  siRelatorios := 'Relat�rios';
  vaMenuLista.Permissoes.Add(siRelatorios);
  siRecalcular := 'Recalcular';
  vaMenuLista.Permissoes.Add(siRecalcular);
  siSenhaMensal := 'Senha Mensal';
  vaMenuLista.Permissoes.Add(siSenhaMensal);
  siConfigSistema := 'Configura��es - Sistema';
  vaMenuLista.Permissoes.Add(siConfigSistema);
  siConfigRateioFaturamento := 'Configura��es - Rateio do Faturamento';
  vaMenuLista.Permissoes.Add(siConfigRateioFaturamento);
  siConfigRegrasHonorarioFaturamento := 'Configura��es - Regras do Honor�rio no Faturamento';
  vaMenuLista.Permissoes.Add(siConfigRegrasHonorarioFaturamento);
  siConfigRegrasExameFaturamento := 'Configura��es - Regras dos Exames no Faturamento';
  vaMenuLista.Permissoes.Add(siConfigRegrasExameFaturamento);
  siConfigBoletos := 'Configura��es - Boletos';
  vaMenuLista.Permissoes.Add(siConfigBoletos);
  siUsuarios := 'Usu�rios';
  vaMenuLista.Permissoes.Add(siUsuarios);
  siDeletaRegistrosPagmsAnteriores := 'Deletar Registros de Pagamentos de Per�odos Anteriores';
  vaMenuLista.Permissoes.Add(siDeletaRegistrosPagmsAnteriores);
  siLiberarHorario := 'Liberar Hor�rio (Agendamento Geral)';
  vaMenuLista.Permissoes.Add(siLiberarHorario);
  siDicomPesquisa := 'Pesquisar Imagens Dicom';
  vaMenuLista.Permissoes.Add(siDicomPesquisa);
  siLogComoOutroUsuario := 'Pode Entrar no Sistema em Nome de Outro Usu�rio';
  vaMenuLista.Permissoes.Add(siLogComoOutroUsuario);
  siLogInterfaceamento := 'Log do Interfaceamento';
  vaMenuLista.Permissoes.Add(siLogInterfaceamento);
  siGerenciadorMensagem := 'Gerenciador de Mensagem';
  vaMenuLista.Permissoes.Add(siGerenciadorMensagem);
  siGerenciadorPermissaoRelatorio := 'Gerenciador de Permiss�o Relat�rio';
  vaMenuLista.Permissoes.Add(siGerenciadorPermissaoRelatorio);
  siConfigurarGuicheSenha := 'Configurar Guiche para o M�dulo de Senhas';
  vaMenuLista.Permissoes.Add(siConfigurarGuicheSenha);
  siConfigPrestadoresDebRecepcao := 'Configurar Prestadores que Ir�o Mostrar D�bitos na tela de Recep��o';
  vaMenuLista.Permissoes.Add(siConfigPrestadoresDebRecepcao);
  siEmail_Enviar := 'Enviar Emails';
  vaMenuLista.Permissoes.Add(siEmail_Enviar);
  siEmail_Config := 'Configurar Emails';
  vaMenuLista.Permissoes.Add(siEmail_Config);
  siWorklist := 'Worklist';
  vaMenuLista.Permissoes.Add(siWorklist);
  siTelasCustomizadas := 'Telas Customizadas';
  vaMenuLista.Permissoes.Add(siTelasCustomizadas);
  siUsuarioPMOnline := 'Usu�rios do Pr�-M�dico Online';
  vaMenuLista.Permissoes.Add(siUsuarioPMOnline);
  siRegraSuspensaoMedico := 'Regras de Suspens�o de M�dicos no Conv�nio';
  vaMenuLista.Permissoes.Add(siRegraSuspensaoMedico);
  siConfigSMSModulo := 'Configura��o dos M�dulos de SMS';
  vaMenuLista.Permissoes.Add(siConfigSMSModulo);
  siCertificadosRaiz := 'Gerenciar Certificados Raiz de Confian�a';
  vaMenuLista.Permissoes.Add(siCertificadosRaiz);
  siValidarCertificado := 'Valida��o de Certificados';
  vaMenuLista.Permissoes.Add(siValidarCertificado);
  siImportarDef := 'Importar DEFs do Cloud';
  vaMenuLista.Permissoes.Add(siImportarDef);
  siBackupRestore := 'Entrar na tela de Backup/Restore';
  vaMenuLista.Permissoes.Add(siBackupRestore);
  siEfetuarBackup := 'Efetuar Backup';
  vaMenuLista.Permissoes.Add(siEfetuarBackup);
  siEfetuarRestore := 'Efetuar Restore';
  vaMenuLista.Permissoes.Add(siEfetuarRestore);
  siConfiguracaoBackupRestore := 'Configurar Backup/Restore';
  vaMenuLista.Permissoes.Add(siConfiguracaoBackupRestore);
  siMonitorarBD := 'Monitorar Uso do Banco de Dados';
  vaMenuLista.Permissoes.Add(siMonitorarBD);
  siMonitorarHDServidor := 'Monitorar Uso do HD do Servidor';
  vaMenuLista.Permissoes.Add(siMonitorarHDServidor);
  siControleAcesso := 'Controle de Acesso ao Servidor';
  vaMenuLista.Permissoes.Add(siControleAcesso);
  siDeclaracaoTermoUso := 'Declara��o de Termo de Uso';
  vaMenuLista.Permissoes.Add(siDeclaracaoTermoUso);
  siAlterarConfigAlertaMsgChat := 'Alterar Configura��o de Alerta de Mensagens do Chat';
  vaMenuLista.Permissoes.Add(siAlterarConfigAlertaMsgChat);

  FMenuLista.Add(vaMenuLista);

  { Base de Dados }
  vaMenuLista := TMenuLista.Create;
  vaMenuLista.NomeMenu := 'Base de Dados';

  bdCCe := 'B.D. Cadastro de Casos Especiais';
  vaMenuLista.Permissoes.Add(bdCCe);
  bdCidades := 'B.D. Cidades';
  vaMenuLista.Permissoes.Add(bdCidades);
  bdMotivosGlosa := 'B.D. Tabela de Motivos de Glosa';
  vaMenuLista.Permissoes.Add(bdMotivosGlosa);
  bdDestinoP := 'B.D. Destino do Paciente Ap�s Alta';
  vaMenuLista.Permissoes.Add(bdDestinoP);
  bdDicionario := 'B.D. Dicion�rio do Corretor Ortogr�fico';
  vaMenuLista.Permissoes.Add(bdDicionario);
  bdFeriado := 'B.D. Tabela de Feriados';
  vaMenuLista.Permissoes.Add(bdFeriado);
  bdAdmissao := 'B.D. Locais de Admiss�o';
  vaMenuLista.Permissoes.Add(bdAdmissao);
  bdTbEspecial := 'B.D. Especialidades';
  vaMenuLista.Permissoes.Add(bdTbEspecial);
  bdCFuncao := 'B.D. Fun��es dos M�dicos';
  vaMenuLista.Permissoes.Add(bdCFuncao);
  bdBoletos := 'B.D. Modelos de Boletos Banc�rios';
  vaMenuLista.Permissoes.Add(bdBoletos);
  bdPreConsulta := 'B.D. Modelos Pr�-Consulta';
  vaMenuLista.Permissoes.Add(bdPreConsulta);
  bdNaTrata := 'B.D. Naturezas de Tratamento';
  vaMenuLista.Permissoes.Add(bdNaTrata);
  bdAlerta := 'B.D. Tabela Alerta';
  vaMenuLista.Permissoes.Add(bdAlerta);
  bdAlertaEmail := 'B.D. Tabela Alerta e-mail';
  vaMenuLista.Permissoes.Add(bdAlertaEmail);
  bdEpidemia := 'B.D. Tabela de Epidemias';
  vaMenuLista.Permissoes.Add(bdEpidemia);
  bdFormaPagto := 'B.D. Formas Pagto';
  vaMenuLista.Permissoes.Add(bdFormaPagto);
  bdLabMaterial := 'B.D. Tabela de Materiais';
  vaMenuLista.Permissoes.Add(bdLabMaterial);
  bdUnidades := 'B.D. Unidades';
  vaMenuLista.Permissoes.Add(bdUnidades);
  bdViaAdm := 'B.D. Vias de Administra��o de Medicamentos';
  vaMenuLista.Permissoes.Add(bdViaAdm);
  bdSolicitantes := 'B.D. Tabelas de M�dicos Solicitantes';
  vaMenuLista.Permissoes.Add(bdSolicitantes);
  bdModeloTexto := 'B.D. Modelos de Texto';
  vaMenuLista.Permissoes.Add(bdModeloTexto);
  bdTributos := 'B.D. Tabela Geral de Tributos';
  vaMenuLista.Permissoes.Add(bdTributos);
  bdCtExames := 'B.D. Tabela de Categorias';
  vaMenuLista.Permissoes.Add(bdCtExames);
  bdBcPlanilha := 'B.D. Planilhas de Exames';
  vaMenuLista.Permissoes.Add(bdBcPlanilha);
  bdCid := 'B.D. CID';
  vaMenuLista.Permissoes.Add(bdCid);
  bdTabGeralProcedimentos := 'B.D. Tabela Geral Procedimentos';
  vaMenuLista.Permissoes.Add(bdTabGeralProcedimentos);
  bdAtualTabGeralProcedimentos := 'B.D. Tabela Geral Procedimentos - Atualiza��es';
  vaMenuLista.Permissoes.Add(bdAtualTabGeralProcedimentos);
  bdTabGeralProcedimentosReajustarValores := 'B.D. Tabela Geral Procedimentos - Reajustar Valores';
  vaMenuLista.Permissoes.Add(bdTabGeralProcedimentosReajustarValores);
  bdTabGeralProcedimentosLayout := 'B.D. Tabela Geral Procedimentos - Layout';
  vaMenuLista.Permissoes.Add(bdTabGeralProcedimentosLayout);
  bdTabGeralDiaTax := 'B.D. Tabela Geral Di�rias e Taxas';
  vaMenuLista.Permissoes.Add(bdTabGeralDiaTax);
  bdAtualTabGeralDiaTax := 'B.D. Tabela Geral Di�rias e Taxas - Atualiza��es';
  vaMenuLista.Permissoes.Add(bdAtualTabGeralDiaTax);
  bdTabGeralMatMed := 'B.D. Tabela Geral de Mat/Med';
  vaMenuLista.Permissoes.Add(bdTabGeralMatMed);
  bdAtualTabGeralMatMed := 'B.D. Tabela Geral de Mat/Med - Atualiza��es';
  vaMenuLista.Permissoes.Add(bdAtualTabGeralMatMed);
  bdGrpValFilmes := 'B.D. Grupos Val. Filmes';
  vaMenuLista.Permissoes.Add(bdGrpValFilmes);
  bdModFaturasEletronicas := 'B.D. Modelos de Faturas Eletr�nicas';
  vaMenuLista.Permissoes.Add(bdModFaturasEletronicas);
  bdModFaturasEletronicasExpotar := 'B.D. Modelos de Faturas Eletr�nicas - Exportar';
  vaMenuLista.Permissoes.Add(bdModFaturasEletronicasExpotar);
  bdModFaturasEletronicasImportar := 'B.D. Modelos de Faturas Eletr�nicas - Importar';
  vaMenuLista.Permissoes.Add(bdModFaturasEletronicasImportar);
  bdCadGeralConvenios := 'B.D. Cadastro Geral Conv�nios';
  vaMenuLista.Permissoes.Add(bdCadGeralConvenios);
  bdCadGeralConveniosConfiguracoes := 'B.D. Cadastro Geral Conv�nios - Configura��es';
  vaMenuLista.Permissoes.Add(bdCadGeralConveniosConfiguracoes);
  bdTabPrestadores := 'B.D. Tabela de Prestadores';
  vaMenuLista.Permissoes.Add(bdTabPrestadores);
  bdTabMedicos := 'B.D. Tabela de M�dicos (Corpo Cl�nico)';
  vaMenuLista.Permissoes.Add(bdTabMedicos);
  bdTabIntrucoes := 'B.D. Tabela de Instru��es';
  vaMenuLista.Permissoes.Add(bdTabIntrucoes);
  bdTabIndicadores := 'B.D. Tabela de Indicadores';
  vaMenuLista.Permissoes.Add(bdTabIndicadores);
  bdConfigFormularios := 'B.D. Configura��es de Formul�rios';
  vaMenuLista.Permissoes.Add(bdConfigFormularios);
  bdModCarteirinhas := 'B.D. Modelos de Carteirinhas';
  vaMenuLista.Permissoes.Add(bdModCarteirinhas);
  bdTabProcedimentos := 'B.D. Tabelas de Procedimentos';
  vaMenuLista.Permissoes.Add(bdTabProcedimentos);
  bdTabProcedimentosModLaudos := 'B.D. Tabelas de Procedimentos - Modelos de Laudos';
  vaMenuLista.Permissoes.Add(bdTabProcedimentosModLaudos);
  bdTabDiaTax := 'B.D. Tabela de Di�rias e Taxas';
  vaMenuLista.Permissoes.Add(bdTabDiaTax);
  bdTabGrpServicosDiversos := 'B.D. Tabela de Grupos de Servi�os Diversos';
  vaMenuLista.Permissoes.Add(bdTabGrpServicosDiversos);
  bdTabServicosDiversos := 'B.D. Tabela de Servi�os Diversos';
  vaMenuLista.Permissoes.Add(bdTabServicosDiversos);
  bdTabPacotes := 'B.D. Tabela de Pacotes';
  vaMenuLista.Permissoes.Add(bdTabPacotes);
  bdTabKits := 'B.D. Tabela de Kits';
  vaMenuLista.Permissoes.Add(bdTabKits);
  bdTabOrigemExames := 'B.D. Tabela de Origem de Exames';
  vaMenuLista.Permissoes.Add(bdTabOrigemExames);
  bdTabProcCirurgicos := 'B.D. Tabela de Procedimentos Cir�rgicos';
  vaMenuLista.Permissoes.Add(bdTabProcCirurgicos);
  bdTabProcedimentosCIH := 'B.D. Tabela de Procedimentos (CIH)';
  vaMenuLista.Permissoes.Add(bdTabProcedimentosCIH);
  bdRelCustomizados := 'Relat�rios Customizados';
  vaMenuLista.Permissoes.Add(bdRelCustomizados);
  bdRelRelatorios := 'B.D. Relat�rios';
  vaMenuLista.Permissoes.Add(bdRelRelatorios);
  bdHistorico_Atendim := 'B.D. Hist�rico Atendimento';
  vaMenuLista.Permissoes.Add(bdHistorico_Atendim);
  bdModelo_Chave := 'B.D. F�rmulas';
  vaMenuLista.Permissoes.Add(bdModelo_Chave);
  bdAla := 'B.D. Ala';
  vaMenuLista.Permissoes.Add(bdAla);
  bdTipo_Visita := 'B.D. Tipo Visita';
  vaMenuLista.Permissoes.Add(bdTipo_Visita);
  bdModeloLab := 'B.D. Modelo de laudo de laborat�rio';
  vaMenuLista.Permissoes.Add(bdModeloLab);
  bdTabAbreviacoes := 'B.D. Tabela de Abrevia��es dos M�dicos';
  vaMenuLista.Permissoes.Add(bdTabAbreviacoes);
  bdTabTipoOculos := 'B.D. Tabela de Tipo �culos';
  vaMenuLista.Permissoes.Add(bdTabTipoOculos);
  bdOftalProdLimpeza := 'B.D. Tabela Produto de Limpeza Oftalmologico';
  vaMenuLista.Permissoes.Add(bdOftalProdLimpeza);
  bdGrupoLancamento := 'B.D. Tabela de Grupo de Lan�amento';
  vaMenuLista.Permissoes.Add(bdGrupoLancamento);
  bdPrioridade := 'B.D. Prioridade';
  vaMenuLista.Permissoes.Add(bdPrioridade);
  bdPrescricaoIntervalo := 'B.D. Intervalo de Prescri��es';
  vaMenuLista.Permissoes.Add(bdPrescricaoIntervalo);
  bdGerenciarModeloTexto := 'B.D. Gerenciar Modelos de Texto';
  vaMenuLista.Permissoes.Add(bdGerenciarModeloTexto);
  bdTabHonorarioFormula := 'B.D. Tabela de F�rmulas para Honor�rios';
  vaMenuLista.Permissoes.Add(bdTabHonorarioFormula);
  bdProfissionais_Saude := 'B.D. Tabela de Profissionais de Sa�de';
  vaMenuLista.Permissoes.Add(bdProfissionais_Saude);
  bdProfissoes := 'B.D. Tabela de Profiss�es';
  vaMenuLista.Permissoes.Add(bdProfissoes);
  bdTiposDigitalizacao := 'B.D. Tabela de Tipos de Digitaliza��o';
  vaMenuLista.Permissoes.Add(bdTiposDigitalizacao);
  bdPrescricao_Servico := 'Prescri��o de Servi�o';
  vaMenuLista.Permissoes.Add(bdPrescricao_Servico);
  bdTabLaboratorios := 'B.D. Tabela de Laborat�rios';
  vaMenuLista.Permissoes.Add(bdTabLaboratorios);
  bdDiagnostico_Enf := 'B.D. Tabela de Diagn�sticos de Enfermagem';
  vaMenuLista.Permissoes.Add(bdDiagnostico_Enf);
  bdServicosEnfermagem := 'B.D. Tabela de Servi�os de Enfermagem';
  vaMenuLista.Permissoes.Add(bdServicosEnfermagem);
  bdGrupoOutrosImpressos := 'B.D. Tabela de Grupo de Outros Impressos';
  vaMenuLista.Permissoes.Add(bdGrupoOutrosImpressos);
  bdExame_Sessao_Lab := 'B.D. Sess�es de Exames de Laborat�rio';
  vaMenuLista.Permissoes.Add(bdExame_Sessao_Lab);
  bdConfigurar_Documentos := 'B.D. Configurar Documentos';
  vaMenuLista.Permissoes.Add(bdConfigurar_Documentos);
  bdDocumentos_Gerais := 'B.D. Documentos Gerais';
  vaMenuLista.Permissoes.Add(bdDocumentos_Gerais);
  bdFilas := 'B.D. Tabela de Filas';
  vaMenuLista.Permissoes.Add(bdFilas);
  FMenuLista.Add(vaMenuLista);

  { Recepcao }
  vaMenuLista := TMenuLista.Create;
  vaMenuLista.NomeMenu := 'Recep��o';

  reAlterarAtendimento := 'Alterar estado do ATENDIMENTO';
  vaMenuLista.Permissoes.Add(reAlterarAtendimento);
  rePacientes := 'Pacientes';
  vaMenuLista.Permissoes.Add(rePacientes);
  rePermitirBaixaRetroativaParticular := 'Permitir Baixa Retroativa no Particular';
  vaMenuLista.Permissoes.Add(rePermitirBaixaRetroativaParticular);
  reRegCasosEspeciais := 'Registros de Casos Especiais';
  vaMenuLista.Permissoes.Add(reRegCasosEspeciais);
  reAgendaGeral := 'Agenda Geral';
  vaMenuLista.Permissoes.Add(reAgendaGeral);
  reAgendaGeralCategorias := 'Agenda Geral - Categorias';
  vaMenuLista.Permissoes.Add(reAgendaGeralCategorias);
  reAgmtoCirurgias := 'Agendamento de Cirurgias';
  vaMenuLista.Permissoes.Add(reAgmtoCirurgias);
  reAgmtoCirurgiasLiberar := 'Agendamento de Cirurgias - Liberar Cirurgia';
  vaMenuLista.Permissoes.Add(reAgmtoCirurgiasLiberar);
  reAgmtoCirurgiasBloquearDesbloquear := 'Agendamento de Cirurgias - Bloquear/Desbloquear Hor�rio';
  vaMenuLista.Permissoes.Add(reAgmtoCirurgiasBloquearDesbloquear);
  reAgmtoConsultas := 'Agendamento de Consultas';
  vaMenuLista.Permissoes.Add(reAgmtoConsultas);
  reAgmtoConsultasBloquearDesbloquear := 'Agendamento de Consultas - Bloquear/Desbloquear Hor�rio';
  vaMenuLista.Permissoes.Add(reAgmtoConsultasBloquearDesbloquear);
  reAgmtoExames := 'Agendamento de Exames';
  vaMenuLista.Permissoes.Add(reAgmtoExames);
  reAgmtoExamesBloquearDesbloquear := 'Agendamento de Exames - Bloquear/Desbloquear Hor�rio';
  vaMenuLista.Permissoes.Add(reAgmtoExamesBloquearDesbloquear);
  reAgendaTelefonica := 'Agenda Telef�nica';
  vaMenuLista.Permissoes.Add(reAgendaTelefonica);
  reRecibos := 'Recibos';
  vaMenuLista.Permissoes.Add(reRecibos);
  reFichario := 'Fich�rio';
  vaMenuLista.Permissoes.Add(reFichario);
  reFicharioModeloImpressao := 'Fich�rio - Modelos de Impress�o';
  vaMenuLista.Permissoes.Add(reFicharioModeloImpressao);
  reFicharioeArqMorto := 'Fich�rio - Arquivo Morto/Vivo';
  vaMenuLista.Permissoes.Add(reFicharioeArqMorto);
  reFicharioPrioridade := 'Fich�rio - Prioridade';
  vaMenuLista.Permissoes.Add(reFicharioPrioridade);
  reImpressaoFichaCadastral := 'Impress�o da Ficha Cadastral';
  vaMenuLista.Permissoes.Add(reImpressaoFichaCadastral);
  reCtCorPaciente := 'Conta Corrente Pacientes';
  vaMenuLista.Permissoes.Add(reCtCorPaciente);
  reCtCorPacienteEfetBaixaParticular := 'Conta Corrente Pacientes - Efetuar Baixa Particular';
  vaMenuLista.Permissoes.Add(reCtCorPacienteEfetBaixaParticular);
  reCtCorPacienteEfetBaixaConvenio := 'Conta Corrente Pacientes - Efetuar Baixa Conv�nio';
  vaMenuLista.Permissoes.Add(reCtCorPacienteEfetBaixaConvenio);
  reCtCorPacienteDelBaixaParticular := 'Conta Corrente Pacientes - Deletar Baixa Particular';
  vaMenuLista.Permissoes.Add(reCtCorPacienteDelBaixaParticular);
  reCtCorPacienteDelBaixaConvenio := 'Conta Corrente Pacientes - Deletar Baixa Conv�nio';
  vaMenuLista.Permissoes.Add(reCtCorPacienteDelBaixaConvenio);
  reRegProcAmbulatorio := 'Registro de Procedimentos de Ambulat�rio';
  vaMenuLista.Permissoes.Add(reRegProcAmbulatorio);
  reRegProcInternacao := 'Registro de Procedimentos de Interna��o';
  vaMenuLista.Permissoes.Add(reRegProcInternacao);
  reRegMatMedAmbulatorio := 'Registro de Mat/Med de Ambulat�rio';
  vaMenuLista.Permissoes.Add(reRegMatMedAmbulatorio);
  reRelMalaDireta := 'Rel. Mala Direta/Aniversariantes';
  vaMenuLista.Permissoes.Add(reRelMalaDireta);
  reRelRegCasosEspeciais := 'Rel. Registros de Casos Especiais Por C�digo';
  vaMenuLista.Permissoes.Add(reRelRegCasosEspeciais);
  reRelAgendamentos := 'Rel. Agendamentos no Per�odo';
  vaMenuLista.Permissoes.Add(reRelAgendamentos);
  reRelConsultasGeral := 'Rel. Consultas - Geral';
  vaMenuLista.Permissoes.Add(reRelConsultasGeral);
  reRelPlanilhaBancadaExamePeriodo := 'Rel. Ex. Laborat�rio - Planilha de Exames no Per�odo';
  vaMenuLista.Permissoes.Add(reRelPlanilhaBancadaExamePeriodo);
  reRelEpidemias := 'Rel. Epidemias - Por Epidemia';
  vaMenuLista.Permissoes.Add(reRelEpidemias);
  reRelExamesProcedimentos := 'Rel. Exames e Procedimentos';
  vaMenuLista.Permissoes.Add(reRelExamesProcedimentos);
  reRelProcsGeradosPeriodo := 'Rel. Procedimentos Gerados no Per�odo';
  vaMenuLista.Permissoes.Add(reRelProcsGeradosPeriodo);
  reRelProducaoMedico := 'Rel. Produ��o Por M�dico no Per�odo';
  vaMenuLista.Permissoes.Add(reRelProducaoMedico);
  reRelHonorariosMedicos := 'Rel. Honor�rios M�dicos no Per�odo';
  vaMenuLista.Permissoes.Add(reRelHonorariosMedicos);
  reRelDiaTaxPeriodo := 'Rel. Di�rias e Taxas no Per�odo';
  vaMenuLista.Permissoes.Add(reRelDiaTaxPeriodo);
  reRelSericosDiversos := 'Rel. Servi�os Diversos no Per�odo';
  vaMenuLista.Permissoes.Add(reRelSericosDiversos);
  reRelObitosPeriodo := 'Rel. Rela��o de �bitos no Per�odo';
  vaMenuLista.Permissoes.Add(reRelObitosPeriodo);
  reRelpacCadastradosPeriodo := 'Rel. Rela��o de Pacientes Cadastrados no Per�odo';
  vaMenuLista.Permissoes.Add(reRelpacCadastradosPeriodo);
  reRelUltimoAtendimento := 'Rel. �ltimo Atendimento';
  vaMenuLista.Permissoes.Add(reRelUltimoAtendimento);
  reAgendaAlterarHorarios := 'Agenda Geral - Alterar Hor�rios';
  vaMenuLista.Permissoes.Add(reAgendaAlterarHorarios);
  reSessao := 'Sess�o';
  vaMenuLista.Permissoes.Add(reSessao);
  reVisitantes := 'Visitantes';
  vaMenuLista.Permissoes.Add(reVisitantes);
  reRelVisitantes := 'Rel. Visitantes Por Per�odo';
  vaMenuLista.Permissoes.Add(reRelVisitantes);
  reRelPacotes := 'Rel. Pacotes no Per�odo';
  vaMenuLista.Permissoes.Add(reRelPacotes);
  reListaEspera := 'Lista de espera';
  vaMenuLista.Permissoes.Add(reListaEspera);
  reConfigAgenda := 'Configura��o de Agenda';
  vaMenuLista.Permissoes.Add(reConfigAgenda);
  reConfigAgendaUsuarios := 'Configura��o de Agenda - Configurar Usu�rios';
  vaMenuLista.Permissoes.Add(reConfigAgendaUsuarios);
  reConfigAgendaHorarios := 'Configura��o de Agenda - Configurar Hor�rios';
  vaMenuLista.Permissoes.Add(reConfigAgendaHorarios);
  reConfigAgendaRestricoes := 'Configura��o de Agenda - Restri��es';
  vaMenuLista.Permissoes.Add(reConfigAgendaRestricoes);
  reConfigAgendaRestricoesConvenio := 'Configura��o de Agenda - Restri��es de Conv�nio';
  vaMenuLista.Permissoes.Add(reConfigAgendaRestricoesConvenio);
  reChamarSenhas := 'Chamar Senhas';
  vaMenuLista.Permissoes.Add(reChamarSenhas);
  reArquivo := 'Arquivo';
  vaMenuLista.Permissoes.Add(reArquivo);
  reAlterarConvenioProcedimento := 'Alterar Conv�nio do Procedimento';
  vaMenuLista.Permissoes.Add(reAlterarConvenioProcedimento);
  reMotivos_Cancelamento := 'Motivos de Cancelamento';
  vaMenuLista.Permissoes.Add(reMotivos_Cancelamento);
  reAlterarConvenioGuias := 'Alterar Conv�nio da Guia';
  vaMenuLista.Permissoes.Add(reAlterarConvenioGuias);
  reCirurgiaStatus := 'Status de Cirurgia';
  vaMenuLista.Permissoes.Add(reCirurgiaStatus);
  rePainelCirurgico := 'Painel Cir�rgico';
  vaMenuLista.Permissoes.Add(rePainelCirurgico);
  reCirurgiaUrgencia := 'Cirugia de Urg�ncia';
  vaMenuLista.Permissoes.Add(reCirurgiaUrgencia);
  reAlertaFicha := 'Alergias/Doen�as Pr�-Existentes de Pacientes';
  vaMenuLista.Permissoes.Add(reAlertaFicha);
  reRelReferenciaCruzada := 'Rel. de Exames - Refer�ncia Cruzada';
  vaMenuLista.Permissoes.Add(reRelReferenciaCruzada);
  reRelConsumoSMS := 'Rel. Consumo de SMS';
  vaMenuLista.Permissoes.Add(reRelConsumoSMS);
  reRelProducaoPorUsuario := 'Rel. Produ��o por Usu�rio';
  vaMenuLista.Permissoes.Add(reRelProducaoPorUsuario);
  reXMLWebService := 'Chamadas WebService';
  vaMenuLista.Permissoes.Add(reXMLWebService);
  reEditarValorDiariaTaxa := 'Editar Valor das Di�ris e Taxas no Lan�amento';
  vaMenuLista.Permissoes.Add(reEditarValorDiariaTaxa);
  reRelAtendimentosFaixaEtaria := 'Rel. Atendimentos por Faixa Et�ria';
  vaMenuLista.Permissoes.Add(reRelAtendimentosFaixaEtaria);


  FMenuLista.Add(vaMenuLista);

  { Consultorio }
  vaMenuLista := TMenuLista.Create;
  vaMenuLista.NomeMenu := 'Consult�rio / PEP';

  coConsAtendimento := 'Cons. Atendimentos';
  vaMenuLista.Permissoes.Add(coConsAtendimento);
  coAtestados := 'Atestados';
  vaMenuLista.Permissoes.Add(coAtestados);
  coModeloAtestado := 'Modelo de Atestados';
  vaMenuLista.Permissoes.Add(coModeloAtestado);
  coPedGuiaInternCirurgia := 'Pedido de Guia de Interna��o / Cirurgia';
  vaMenuLista.Permissoes.Add(coPedGuiaInternCirurgia);
  coSolicEntradaPac := 'Solicita��es de Entrada de Pacientes';
  vaMenuLista.Permissoes.Add(coSolicEntradaPac);
  coModeloPresc := 'Modelo de Prescri��o';
  vaMenuLista.Permissoes.Add(coModeloPresc);
  coRecibosMedicos := 'Recibos M�dicos';
  vaMenuLista.Permissoes.Add(coRecibosMedicos);
  coFichaOftalmologica := 'Ficha M�dica Oftalmologica';
  vaMenuLista.Permissoes.Add(coFichaOftalmologica);
  coPlantao := 'Plant�o M�dico';
  vaMenuLista.Permissoes.Add(coPlantao);
  coCopiarModeloAnamnese := 'Copiar Modelo de Anamnese';
  vaMenuLista.Permissoes.Add(coCopiarModeloAnamnese);
  coModeloAtestadoGeral := 'Modelo de Atestados Geral';
  vaMenuLista.Permissoes.Add(coModeloAtestadoGeral);
  coModeloDefGeral := 'Modelo de DEF Geral';
  vaMenuLista.Permissoes.Add(coModeloDefGeral);
  coModeloReceitaGeral := 'Modelo de Receita Geral';
  vaMenuLista.Permissoes.Add(coModeloReceitaGeral);
  coModeloAnamnese := 'Modelo de Anamnese';
  vaMenuLista.Permissoes.Add(coModeloAnamnese);
  coModeloAnamneseRespostasPadrao := 'Respostas para Anamneses Padr�o';
  vaMenuLista.Permissoes.Add(coModeloAnamneseRespostasPadrao);
  coOutros_Imp := 'Outros Impressos';
  vaMenuLista.Permissoes.Add(coOutros_Imp);
  coOutros_Imp_Modelo := 'Modelos de Outros Impressos';
  vaMenuLista.Permissoes.Add(coOutros_Imp_Modelo);
  coOutros_Imp_Modelo_Geral := 'Modelos de Outros Impressos Geral';
  vaMenuLista.Permissoes.Add(coOutros_Imp_Modelo_Geral);
  coProntuarioMedico := 'Prontu�rio do M�dico';
  vaMenuLista.Permissoes.Add(coProntuarioMedico);
  coAnamnese := 'Anamnese';
  vaMenuLista.Permissoes.Add(coAnamnese);
  coSumarioAlta := 'Sum�rio de Alta';
  vaMenuLista.Permissoes.Add(coSumarioAlta);
  coPrescricaoMedica := 'Prescri��o M�dica';
  vaMenuLista.Permissoes.Add(coPrescricaoMedica);
  coEvolucaoMedica := 'Evolu��o M�dica';
  vaMenuLista.Permissoes.Add(coEvolucaoMedica);
  coEvolucaoEnfermagem := 'Evolu��o de Enfermagem';
  vaMenuLista.Permissoes.Add(coEvolucaoEnfermagem);
  coAnotacoesEnfermagem := 'Anota��es de Enfermagem';
  vaMenuLista.Permissoes.Add(coAnotacoesEnfermagem);
  coAlterDelAnotacaoEvolucaoEnfermagem := 'Pode Alterar/Excluir Anota��o e Evolu��o de Enfgm. Outros Usu�rios';
  vaMenuLista.Permissoes.Add(coAlterDelAnotacaoEvolucaoEnfermagem);
  coEvolucaoMultidisciplinar := 'Evolu��o Multidisciplinar';
  vaMenuLista.Permissoes.Add(coEvolucaoMultidisciplinar);
  coPlanoTerapeutico := 'Plano Terap�utico';
  vaMenuLista.Permissoes.Add(coPlanoTerapeutico);
  coDescricaoCurativos := 'Descri��o de Curativos';
  vaMenuLista.Permissoes.Add(coDescricaoCurativos);
  coAnestesiologia := 'Anestesiologia';
  vaMenuLista.Permissoes.Add(coAnestesiologia);
  coTranscricaoPrescricao := 'Transcri��o da Prescri��o';
  vaMenuLista.Permissoes.Add(coTranscricaoPrescricao);
  coPrescAprazamento := 'Prescri��o M�dica - Aprazamento';
  vaMenuLista.Permissoes.Add(coPrescAprazamento);
  coModPrescricaoMedica := 'Modelo de Prescri��o M�dica';
  vaMenuLista.Permissoes.Add(coModPrescricaoMedica);
  coPrescricaoEnfermagemDiagnostico := 'Diagn�stico de Enfermagem';
  vaMenuLista.Permissoes.Add(coPrescricaoEnfermagemDiagnostico);
  coPrescricaoEnfermagem := 'Prescri��o de Enfermagem';
  vaMenuLista.Permissoes.Add(coPrescricaoEnfermagem);
  coScorePrognostico := 'Score Progn�stico';
  vaMenuLista.Permissoes.Add(coScorePrognostico);
  coBalancoHidrico := 'Balan�o H�drico';
  vaMenuLista.Permissoes.Add(coBalancoHidrico);
  coImagensProntuario := 'Imagens do Prontu�rio';
  vaMenuLista.Permissoes.Add(coImagensProntuario);
  coReceitas := 'Receitas';
  vaMenuLista.Permissoes.Add(coReceitas);
  coAmenorreia := 'Amenorreia';
  vaMenuLista.Permissoes.Add(coAmenorreia);
  coLembretePaciente := 'Lembrete de Paciente';
  vaMenuLista.Permissoes.Add(coLembretePaciente);
  coLogAnamnese := 'Log da Anamnese';
  vaMenuLista.Permissoes.Add(coLogAnamnese);
  coPlanilhaAtendimento := 'Planilha de Atendimento';
  vaMenuLista.Permissoes.Add(coPlanilhaAtendimento);
  coAlergiaAlerta := 'Alergias e Alertas';
  vaMenuLista.Permissoes.Add(coAlergiaAlerta);
  coImprimirSumario := 'Imprimir Sum�rio';
  vaMenuLista.Permissoes.Add(coImprimirSumario);
  coImprimirEtiqueta := 'Imprimir Etiqueta';
  vaMenuLista.Permissoes.Add(coImprimirEtiqueta);
  coImprimirPulseira := 'Imprimir Pulseira';
  vaMenuLista.Permissoes.Add(coImprimirPulseira);
  coImprimirAIH := 'Imprimir AIH';
  vaMenuLista.Permissoes.Add(coImprimirAIH);
  coImprimirGuiaSolicitacaoInternacao := 'Imprimir Guia de Solicita��o de Interna��o';
  vaMenuLista.Permissoes.Add(coImprimirGuiaSolicitacaoInternacao);
  coSolicitacaoTransfusao := 'Solicita��o de Transfus�o';
  vaMenuLista.Permissoes.Add(coSolicitacaoTransfusao);
  coEscalasIndices := 'Escalas e �ndices';
  vaMenuLista.Permissoes.Add(coEscalasIndices);
  coDelegacaoPoder := 'Delega��o de Poder';
  vaMenuLista.Permissoes.Add(coDelegacaoPoder);
  coVisualizarAnamnese := 'Visualizar Anamnese';
  vaMenuLista.Permissoes.Add(coVisualizarAnamnese);


  FMenuLista.Add(vaMenuLista);

  { Exames }
  vaMenuLista := TMenuLista.Create;
  vaMenuLista.NomeMenu := 'Exames';

  exPodeTrocarLabComLaudo := 'Pode Trocar Exames de Lab. J� com Laudo (Nome do Exame)';
  vaMenuLista.Permissoes.Add(exPodeTrocarLabComLaudo);
  exPedidoExame := 'Pedidos de Exames';
  vaMenuLista.Permissoes.Add(exPedidoExame);
  exConfiguracoesPedidoExame := 'Configura��es dos Pedidos de Exames';
  vaMenuLista.Permissoes.Add(exConfiguracoesPedidoExame);
  exLaudos := 'Laudos';
  vaMenuLista.Permissoes.Add(exLaudos);
  exLaudosAlterarTamanhoTexto := 'Alterar Tamanho do Texto na Tela do Laudo';
  vaMenuLista.Permissoes.Add(exLaudosAlterarTamanhoTexto);
  exLaudosVisualizarBttIncluirNova := 'Visualizar Bot�o "Incluir Nova" Resposta nos Modelos';
  vaMenuLista.Permissoes.Add(exLaudosVisualizarBttIncluirNova);
  exLaudosLab := 'Laudos de Exames de Laborat�rio';
  vaMenuLista.Permissoes.Add(exLaudosLab);
  exLaudosLabLiberar := 'Laudos de Exames de Laborat�rio - Liberar Laudo';
  vaMenuLista.Permissoes.Add(exLaudosLabLiberar);
  exLaudosLabModificaImp := 'Laudos de Exames de Laborat�rio - Modificar Laudo Impresso';
  vaMenuLista.Permissoes.Add(exLaudosLabModificaImp);
  exModeloLaudo := 'Modelos de Laudos';
  vaMenuLista.Permissoes.Add(exModeloLaudo);
  exModeloLaudoLab := 'Modelos de Laudos de Exames de Laborat�rio';
  vaMenuLista.Permissoes.Add(exModeloLaudoLab);
  exRelatorios := 'Relat�rios de Exames';
  vaMenuLista.Permissoes.Add(exRelatorios);
  exImportarImgDicom := 'Importar Imagens Dicom';
  vaMenuLista.Permissoes.Add(exImportarImgDicom);

  exEntregaLaudo := 'Entreda de Laudos';
  vaMenuLista.Permissoes.Add(exEntregaLaudo);
  exMeusModelosExamesPadrao := 'Meus Modelos/Exames - Modelos Gerais';
  vaMenuLista.Permissoes.Add(exMeusModelosExamesPadrao);
  exLaudosAlterarMedicoConferidor := 'Laudos - Alterar M�dico Conferidor';
  vaMenuLista.Permissoes.Add(exLaudosAlterarMedicoConferidor);
  exLaudosEnviarLaudoPorEmail := 'Laudos - Enviar Laudo por Email';
  vaMenuLista.Permissoes.Add(exLaudosEnviarLaudoPorEmail);
  exInterfaceamento := 'Interfaceamento - Envio e Recebimento de Exames';
  vaMenuLista.Permissoes.Add(exInterfaceamento);
  exInterfaceamento_Config := 'Interfaceamento - Configura��es de Interfaceamento';
  vaMenuLista.Permissoes.Add(exInterfaceamento_Config);
  exInterfaceamento_Laboratorios := 'Interfaceamento - Configura��es de Laborat�rios';
  vaMenuLista.Permissoes.Add(exInterfaceamento_Laboratorios);
  exInterfaceamento_Lotes := 'Interfaceamento - Configura��es de Lotes';
  vaMenuLista.Permissoes.Add(exInterfaceamento_Lotes);
  exLaudoExcluirImpresso := 'Excluir Laudo - IMPRESSO';
  vaMenuLista.Permissoes.Add(exLaudoExcluirImpresso);
  exLaudoExcluirEntregue := 'Excluir Laudo - ENTREGUE';
  vaMenuLista.Permissoes.Add(exLaudoExcluirEntregue);
  exFilaAtendimentos := 'Fila de Atendimentos';
  vaMenuLista.Permissoes.Add(exFilaAtendimentos);
  exImagensExames := 'Imagens de Exames';
  vaMenuLista.Permissoes.Add(exImagensExames);
  exEntregaColeta := 'Entrega da Coleta';
  vaMenuLista.Permissoes.Add(exEntregaColeta);

  FMenuLista.Add(vaMenuLista);

  { Cirurgia }
  vaMenuLista := TMenuLista.Create;
  vaMenuLista.NomeMenu := 'Cirurgia';

  ciRegistroCirurgia := 'Registros de Cirurgias';
  vaMenuLista.Permissoes.Add(ciRegistroCirurgia);
  ciDescricaoCirurgia := 'Descri��o da Cirurgia';
  vaMenuLista.Permissoes.Add(ciDescricaoCirurgia);
  ciRelCirurgiaProcedimento := 'Rel. Geral de Cirurgias';
  vaMenuLista.Permissoes.Add(ciRelCirurgiaProcedimento);
  FMenuLista.Add(vaMenuLista);

  { Interna��o }
  vaMenuLista := TMenuLista.Create;
  vaMenuLista.NomeMenu := 'Interna��o';

  inRegistroMatMed := 'Registro de Mat/Med de Interna��o';
  vaMenuLista.Permissoes.Add(inRegistroMatMed);
  inAbrirFecharInternacao := 'Abrir/Fechar Interna��o';
  vaMenuLista.Permissoes.Add(inAbrirFecharInternacao);
  inLocInternacaoLeitos := 'Locais de Interna��o/Leitos';
  vaMenuLista.Permissoes.Add(inLocInternacaoLeitos);
  inRegistrosInternacao := 'Registros de Interna��o';
  vaMenuLista.Permissoes.Add(inRegistrosInternacao);
  inHonorariosedicos := 'Honor�rios M�dicos';
  vaMenuLista.Permissoes.Add(inHonorariosedicos);
  inDiariasTaxas := 'Di�rias e Taxas';
  vaMenuLista.Permissoes.Add(inDiariasTaxas);
  inServicosDiversos := 'Servi�os Diversos';
  vaMenuLista.Permissoes.Add(inServicosDiversos);
  inPacoates := 'Pacotes';
  vaMenuLista.Permissoes.Add(inPacoates);
  inDataFutura := 'Internar Paciente com Data Futura';
  vaMenuLista.Permissoes.Add(inDataFutura);
  inAltaDataFutura := 'Efetuar Alta do Paciente com Data Futura';
  vaMenuLista.Permissoes.Add(inAltaDataFutura);
  inKits := 'Kits';
  vaMenuLista.Permissoes.Add(inKits);
  inCCIH := 'Centro de Controle de Infec��o Hospitalar - CCIH';
  vaMenuLista.Permissoes.Add(inCCIH);
  inMapaOcupacaoLeitos := 'Mapa de Ocupa��o de Leitos';
  vaMenuLista.Permissoes.Add(inMapaOcupacaoLeitos);
  inDelTodosRegistrosInternacao := 'Deletar Todos os Registros da Interna��o';
  vaMenuLista.Permissoes.Add(inDelTodosRegistrosInternacao);
  inRelPacientesInternados := 'Rel. Pacientes Internados';
  vaMenuLista.Permissoes.Add(inRelPacientesInternados);
  inRelPacientesInternadosPVez := 'Rel. Pacientes Internados Pela 1� Vez';
  vaMenuLista.Permissoes.Add(inRelPacientesInternadosPVez);
  inRelAltasGeral := 'Rel. Altas no Per�odo - Geral';
  vaMenuLista.Permissoes.Add(inRelAltasGeral);
  inRelInternacoesGeral := 'Rel. Interna��es no Per�odo - Geral';
  vaMenuLista.Permissoes.Add(inRelInternacoesGeral);
  inRelInternacoesMedico := 'Rel. Interna��es no Per�odo por M�dico';
  vaMenuLista.Permissoes.Add(inRelInternacoesMedico);
  inRelTaxaOcupacaoLeitos := 'Rel. Taxa de Ocupa��o de Leitos';
  vaMenuLista.Permissoes.Add(inRelTaxaOcupacaoLeitos);
  inRelInternaNaturTratamtGeral := 'Rel. Interna��es por Natureza de Tratamento';
  vaMenuLista.Permissoes.Add(inRelInternaNaturTratamtGeral);
  inRelComparacaoPacotesSus := 'Rel. Compara��o de Pacotes Sus';
  vaMenuLista.Permissoes.Add(inRelComparacaoPacotesSus);
  inRelKitsPeriodo := 'Rel. Kits no Per�odo';
  vaMenuLista.Permissoes.Add(inRelKitsPeriodo);
  inRelVisitantes := 'Rel. Visitantes';
  vaMenuLista.Permissoes.Add(inRelVisitantes);
  inPodeAlterarPacote := 'Pode Alterar PACOTE na Interna��o';
  vaMenuLista.Permissoes.Add(inPodeAlterarPacote);
  inPodeAlterarConvenio := 'Pode Alterar CONV�NIO na Interna��o';
  vaMenuLista.Permissoes.Add(inPodeAlterarConvenio);
  inVisualizarContaInternacao := 'Visualizar Conta da Interna��o';
  vaMenuLista.Permissoes.Add(inVisualizarContaInternacao);
  inTransferirInternacao := 'Transferir Interna��o Para Outro Paciente';
  vaMenuLista.Permissoes.Add(inTransferirInternacao);
  inTransferirLanctosInternacao := 'Transferir Lan�amentos para Outra Interna��o';
  vaMenuLista.Permissoes.Add(inTransferirLanctosInternacao);
  inConfigTelaMapaOcupacao := 'Configura��o da Tela - Mapa de Ocupa��o/Visitantes';
  vaMenuLista.Permissoes.Add(inConfigTelaMapaOcupacao);
  inTabelaPosicoesPaciente := 'Tabela de Posi��es do Paciente (Prescri��o)';
  vaMenuLista.Permissoes.Add(inTabelaPosicoesPaciente);
  inTransferenciaLeitos := 'Transfer�ncia de Leitos';
  vaMenuLista.Permissoes.Add(inTransferenciaLeitos);
  inRelAltasCidsDiferentes := 'Rel. Altas com CIDs Diferentes na Interna��o';
  vaMenuLista.Permissoes.Add(inRelAltasCidsDiferentes);


  FMenuLista.Add(vaMenuLista);

{ Pronto Atendimento }
  vaMenuLista := TMenuLista.Create;
  vaMenuLista.NomeMenu := 'Pronto Atendimento';

  paRegistroMatMedPA := 'Registro de Mat/Med de Pronto Atendimento';
  vaMenuLista.Permissoes.Add(paRegistroMatMedPA);
  paAbrirFecharPA := 'Abrir/Fechar Pronto Atendimento';
  vaMenuLista.Permissoes.Add(paAbrirFecharPA);
  paRegistrosPA := 'Registros de Pronto Atendimento';
  vaMenuLista.Permissoes.Add(paRegistrosPA);
  paDelTodosRegistrosPA := 'Deletar Todos os Registros do Pronto Atendimento';
  vaMenuLista.Permissoes.Add(paDelTodosRegistrosPA);
  paPodeAlterarPacotePA := 'Pode Alterar PACOTE no Pronto Atendimento';
  vaMenuLista.Permissoes.Add(paPodeAlterarPacotePA);
  paPodeAlterarConvenioPA := 'Pode Alterar CONV�NIO no Pronto Atendimento';
  vaMenuLista.Permissoes.Add(paPodeAlterarConvenioPA);
  paVisualizarContaPA := 'Visualizar Conta do Pronto Atendimento';
  vaMenuLista.Permissoes.Add(paVisualizarContaPA);
  paTransferirPA := 'Transferir Pronto Atendimento Para Outro Paciente';
  vaMenuLista.Permissoes.Add(paTransferirPA);
  paTransferirLanctosPA := 'Transferir Lan�amentos para Outro Pronto Atendimento';
  vaMenuLista.Permissoes.Add(paTransferirLanctosPA);

  FMenuLista.Add(vaMenuLista);

{ Terapia }
  vaMenuLista := TMenuLista.Create;
  vaMenuLista.NomeMenu := 'Terapia';

  teRegistroMatMed := 'Registro de Mat/Med de Terapia';
  vaMenuLista.Permissoes.Add(teRegistroMatMed);
  teAbrirFecharTerapia := 'Abrir/Fechar Terapia';
  vaMenuLista.Permissoes.Add(teAbrirFecharTerapia);
  teRegistrosTerapia := 'Registros de Terapia';
  vaMenuLista.Permissoes.Add(teRegistrosTerapia);
  teDelTodosRegistrosTerapia := 'Deletar Todos os Registros da Terapia';
  vaMenuLista.Permissoes.Add(teDelTodosRegistrosTerapia);
  tePodeAlterarPacote := 'Pode Alterar PACOTE na Terapia';
  vaMenuLista.Permissoes.Add(tePodeAlterarPacote);
  tePodeAlterarConvenio := 'Pode Alterar CONV�NIO na Terapia';
  vaMenuLista.Permissoes.Add(tePodeAlterarConvenio);
  teVisualizarContaTerapia := 'Visualizar Conta da Terapia';
  vaMenuLista.Permissoes.Add(teVisualizarContaTerapia);
  teTransferirTerapia := 'Transferir Terapia Para Outro Paciente';
  vaMenuLista.Permissoes.Add(teTransferirTerapia);
  teTransferirLanctosTerapia := 'Transferir Lan�amentos para Outra Terapia';
  vaMenuLista.Permissoes.Add(teTransferirLanctosTerapia);
  teRevisaoPrescricaoTerapica := 'Revisar Prescri��o Ter�pica';
  vaMenuLista.Permissoes.Add(teRevisaoPrescricaoTerapica);
  teEnviarConvenioPrescricaoTerapica := 'Enviar ao Conv�nio Prescri��o Ter�pica';
  vaMenuLista.Permissoes.Add(teEnviarConvenioPrescricaoTerapica);

  FMenuLista.Add(vaMenuLista);

  { EstoqueGeral }
  vaMenuLista := TMenuLista.Create;
  vaMenuLista.NomeMenu := 'Estoque Geral';

  esDevolucaoEntrada := 'Devolu��es de Entrada';
  vaMenuLista.Permissoes.Add(esDevolucaoEntrada);
  esDevolucaoRequisicao := 'Devolu��es de Requisi��o';
  vaMenuLista.Permissoes.Add(esDevolucaoRequisicao);
  esDevolucaoVenda := 'Devolu��es de Venda';
  vaMenuLista.Permissoes.Add(esDevolucaoVenda);
  esEntradas := 'Entradas';
  vaMenuLista.Permissoes.Add(esEntradas);
  esGrpSubgpEstoque := 'Grupos e Subgrupos do Estoque';
  vaMenuLista.Permissoes.Add(esGrpSubgpEstoque);
  esVisualizarCusto := 'Visualizar Custo dos Itens nas Sa�das';
  vaMenuLista.Permissoes.Add(esVisualizarCusto);
  esItens := 'Itens';
  vaMenuLista.Permissoes.Add(esItens);
  esLotesSaldos := 'Lotes e Saldos';
  vaMenuLista.Permissoes.Add(esLotesSaldos);
  esPrescMedicaLibMatMed := 'Prescri��o M�dica Libera��o Mat/Med';
  vaMenuLista.Permissoes.Add(esPrescMedicaLibMatMed);
  esRestrItens := 'Restri��es dos Itens';
  vaMenuLista.Permissoes.Add(esRestrItens);
  esRefItens := 'Refer�ncias dos Itens';
  vaMenuLista.Permissoes.Add(esRefItens);
  esItensRevisaoRef := 'Revis�o de Refer�ncias Zeradas';
  vaMenuLista.Permissoes.Add(esItensRevisaoRef);
  esRequisicoes := 'Requisi��es';
  vaMenuLista.Permissoes.Add(esRequisicoes);
  esRequisicoesDispensar := 'Requisi��es - Dispensar';
  vaMenuLista.Permissoes.Add(esRequisicoesDispensar);
  esSaidas := 'Sa�das';
  vaMenuLista.Permissoes.Add(esSaidas);
  esSetores := 'Setores';
  vaMenuLista.Permissoes.Add(esSetores);
  esTabRestrEstoque := 'Tabela de Restri��es do Estoque';
  vaMenuLista.Permissoes.Add(esTabRestrEstoque);
  esRelGeralEntradas := 'Rel. Rela��o de Entradas de Itens Por - Data/Grupo/Geral';
  vaMenuLista.Permissoes.Add(esRelGeralEntradas);
  esRelGeralItens := 'Rel. Rela��o Geral de Itens';
  vaMenuLista.Permissoes.Add(esRelGeralItens);
  esRelSaidas := 'Rel. Sa�das Por Por Conv�nio/Item/Interna��o/Paciente no Per�odo';
  vaMenuLista.Permissoes.Add(esRelSaidas);
  esRelLotesVencidosVencer := 'Rel. Lotes Vencidos e A Vencer';
  vaMenuLista.Permissoes.Add(esRelLotesVencidosVencer);
  esRelSaldoExtratoInventario := 'Rel. Saldos / Extratos / Invent�rios';
  vaMenuLista.Permissoes.Add(esRelSaldoExtratoInventario);
  esRelItensPontoReposicao := 'Rel. Itens Em Ponto de Reposi��o';
  vaMenuLista.Permissoes.Add(esRelItensPontoReposicao);
  esRelResumoSaidasItem := 'Rel. Resumo de Sa�das Por Item';
  vaMenuLista.Permissoes.Add(esRelResumoSaidasItem);
  esRelListaPrecos := 'Rel. Lista de Pre�os';
  vaMenuLista.Permissoes.Add(esRelListaPrecos);
  esRelMapaComparaPrecos := 'Rel. Mapa de Compara��o de Pre�os';
  vaMenuLista.Permissoes.Add(esRelMapaComparaPrecos);
  esRelMedicamentosMedico := 'Rel. de Medicamentos Por M�dico';
  vaMenuLista.Permissoes.Add(esRelMedicamentosMedico);
  esRelPacLancamMatMed := 'Rel. Pacientes com Lan�amentos de Mat/Med';
  vaMenuLista.Permissoes.Add(esRelPacLancamMatMed);
  esRelTransfPeriodo := 'Rel. Transfer�ncias no Per�odo';
  vaMenuLista.Permissoes.Add(esRelTransfPeriodo);
  esRelItensMaisMenosVendidos := 'Rel. Itens Mais / Menos Vendidos';
  vaMenuLista.Permissoes.Add(esRelItensMaisMenosVendidos);
  esRelCustoSetor := 'Rel. de Custo Por Setor';
  vaMenuLista.Permissoes.Add(esRelCustoSetor);
  esRelPrecoMedioPeriodo := 'Rel. Pre�o M�dio (Compra) no Per�odo';
  vaMenuLista.Permissoes.Add(esRelPrecoMedioPeriodo);
  esLocal_Uso := 'Locais de Uso';
  vaMenuLista.Permissoes.Add(esLocal_Uso);
  esAbrirNota := 'Abrir Nota Fiscal';
  vaMenuLista.Permissoes.Add(esAbrirNota);
  esFecharNota := 'Fechar Nota Fiscal';
  vaMenuLista.Permissoes.Add(esFecharNota);
  esAcertoEstoque := 'Acerto de Estoque';
  vaMenuLista.Permissoes.Add(esAcertoEstoque);
  esRastreabilidade := 'Rastreabilidade';
  vaMenuLista.Permissoes.Add(esRastreabilidade);
  esEditarRequisicaoOutroUsuario := 'Editar Requisi��o Feita por Outro Usu�rio';
  vaMenuLista.Permissoes.Add(esEditarRequisicaoOutroUsuario);
  esUnidades := 'Unidades';
  vaMenuLista.Permissoes.Add(esUnidades);
  esSubTipoSaida := 'Cad. SubTipo de Sa�da';
  vaMenuLista.Permissoes.Add(esSubTipoSaida);
  esPodeEditarValorMatMed := 'Pode Editar Valor de Materias e Medicamentos';
  vaMenuLista.Permissoes.Add(esPodeEditarValorMatMed);
  esRelCurvaABC := 'Curva ABC';
  vaMenuLista.Permissoes.Add(esRelCurvaABC);
  esEnxovalItens := 'Itens de Enxoval';
  vaMenuLista.Permissoes.Add(esEnxovalItens);
  esEnxovalGrupos := 'Grupos de Enxoval';
  vaMenuLista.Permissoes.Add(esEnxovalGrupos);
  esEnxovalControle := 'Controle de Enxoval';
  vaMenuLista.Permissoes.Add(esEnxovalControle);
  esEnxovalLoacais := 'Locais de Movimenta��o de Enxoval';
  vaMenuLista.Permissoes.Add(esEnxovalLoacais);
  esEnxovalMovimentacao := 'Movimenta��o de Enxoval';
  vaMenuLista.Permissoes.Add(esEnxovalMovimentacao);
  esRequisicoesMatMed := 'Registro de Mat/Med de Requisi��o';
  vaMenuLista.Permissoes.Add(esRequisicoesMatMed);
  esRequisicoesCompraMatMed := 'Registro de Mat/Med de Requisi��o de Compra';
  vaMenuLista.Permissoes.Add(esRequisicoesCompraMatMed);
  esRelEnxovais := 'Rel. de Enxovais';
  vaMenuLista.Permissoes.Add(esRelEnxovais);
  esComprasOrcamento := 'Compras - Or�amento';
  vaMenuLista.Permissoes.Add(esComprasOrcamento);
  esComprasPedido := 'Compras - Pedido';
  vaMenuLista.Permissoes.Add(esComprasPedido);
  esComprasAprovacaoPedido := 'Compras - Aprova��o de Pedido';
  vaMenuLista.Permissoes.Add(esComprasAprovacaoPedido);
  esRelPrecoMatMedConvenio := 'Rel. Pre�o de Mat/Med por Conv�nio';
  vaMenuLista.Permissoes.Add(esRelPrecoMatMedConvenio);

  FMenuLista.Add(vaMenuLista);

  { Faturamento }
  vaMenuLista := TMenuLista.Create;
  vaMenuLista.NomeMenu := 'Faturamento';

  ftFaturConvenio := 'Faturas de Conv�nios';
  vaMenuLista.Permissoes.Add(ftFaturConvenio);
  ftFaturaRecebimento := 'Faturas Recebimento';
  vaMenuLista.Permissoes.Add(ftFaturaRecebimento);
  ftFaturConvenioLotes := 'Faturas de Conv�nios - Lotes';
  vaMenuLista.Permissoes.Add(ftFaturConvenioLotes);
  ftFaturConvenioLotesAbreFecha := 'Faturas de Conv�nios - Lotes - Abrir/Fechar';
  vaMenuLista.Permissoes.Add(ftFaturConvenioLotesAbreFecha);
  ftFaturConvenioImprime := 'Faturas de Conv�nios - Imprimir Faturas';
  vaMenuLista.Permissoes.Add(ftFaturConvenioImprime);
  ftPreConta := 'Pr�-Conta';
  vaMenuLista.Permissoes.Add(ftPreConta);
  ftPreContaExportar := 'Pr�-Conta - Exportar';
  vaMenuLista.Permissoes.Add(ftPreContaExportar);
  ftRelGuiasNaoEnviadas := 'Rel. Guias N�o Enviadas';
  vaMenuLista.Permissoes.Add(ftRelGuiasNaoEnviadas);
  ftRelGuiasEnviadas := 'Rel. Guias Enviadas';
  vaMenuLista.Permissoes.Add(ftRelGuiasEnviadas);
  ftRelGuiasFaturadasPorGuia := 'Rel. Guias Faturadas - Por Guia';
  vaMenuLista.Permissoes.Add(ftRelGuiasFaturadasPorGuia);
  ftRelGuiasPagasGlosadas := 'Rel. Guias Pagas/Glosadas no Per�odo';
  vaMenuLista.Permissoes.Add(ftRelGuiasPagasGlosadas);
  ftAbrirlote := 'Abrir Lote (Faturamento)';
  vaMenuLista.Permissoes.Add(ftAbrirlote);
  ftFecharLote := 'Fechar Lote (Faturamento)';
  vaMenuLista.Permissoes.Add(ftFecharLote);
  ftQuitarGlosarGuia := 'Quitar/Glosar Guias';
  vaMenuLista.Permissoes.Add(ftQuitarGlosarGuia);
  ftQuitarGlosarGuiaOutro := 'Quitar/Glosar Guias de Outros Usu�rios';
  vaMenuLista.Permissoes.Add(ftQuitarGlosarGuiaOutro);
  ftAlterarNumeroSequencial := 'Alterar N�mero Sequencial nos Prestadores';
  vaMenuLista.Permissoes.Add(ftAlterarNumeroSequencial);
  ftRecursoGlosa := 'Recursos de Glosa';
  vaMenuLista.Permissoes.Add(ftRecursoGlosa);

  FMenuLista.Add(vaMenuLista);

  { SusAns }
  vaMenuLista := TMenuLista.Create;
  vaMenuLista.NomeMenu := 'SusAns';

  suGerarArquivo := 'Gerar Arquivo (CIH)';
  vaMenuLista.Permissoes.Add(suGerarArquivo);
  suImportarIH := 'Importar Arquivos (IH)';
  vaMenuLista.Permissoes.Add(suImportarIH);
  suUnidadeSUS := 'Tabela de Unidades SUS';
  vaMenuLista.Permissoes.Add(suUnidadeSUS);
  suConfiguracoes := 'Configura��es - SUS';
  vaMenuLista.Permissoes.Add(suConfiguracoes);
  suBPA_I := 'BPA - Individualizada';
  vaMenuLista.Permissoes.Add(suBPA_I);
  suBPA_C := 'BPA - Consolidado';
  vaMenuLista.Permissoes.Add(suBPA_C);
  suExportarSUS := 'Exportar Arquivos SUS';
  vaMenuLista.Permissoes.Add(suExportarSUS);
  suRelBPA := 'Relat�rios BPA';
  vaMenuLista.Permissoes.Add(suRelBPA);
  suAIH := 'AIH';
  vaMenuLista.Permissoes.Add(suAIH);
  FMenuLista.Add(vaMenuLista);

  { Auditoria }
  vaMenuLista := TMenuLista.Create;
  vaMenuLista.NomeMenu := 'Auditoria';

  auAuditoria := 'Auditoria';
  vaMenuLista.Permissoes.Add(auAuditoria);
  auSetarChecado := 'Marcar como Checado/N�o Checado';
  vaMenuLista.Permissoes.Add(auSetarChecado);
  auAuditoriaRegistros := 'Auditoria dos Registros (Log)';
  vaMenuLista.Permissoes.Add(auAuditoriaRegistros);
  FMenuLista.Add(vaMenuLista);

{ Caixa }
  vaMenuLista := TMenuLista.Create;
  vaMenuLista.NomeMenu := 'Caixa';

  cxEnvGuiasFaturamento := 'Envio de Guias Para o Setor de Faturamento';
  vaMenuLista.Permissoes.Add(cxEnvGuiasFaturamento);
  cxEnvGuiasFaturamRecebimento := 'Envio de Guias Para o Setor de Faturamento - Recebimento';
  vaMenuLista.Permissoes.Add(cxEnvGuiasFaturamRecebimento);
  cxFechaCaixa := 'Fechamento de Caixa';
  vaMenuLista.Permissoes.Add(cxFechaCaixa);
  cxFechaCaixaConfirmar := 'Fechamento de Caixa - Confirmar';
  vaMenuLista.Permissoes.Add(cxFechaCaixaConfirmar);
  cxFechaCaixaTiraConfirmar := 'Fechamento de Caixa - Tirar Confirma��o';
  vaMenuLista.Permissoes.Add(cxFechaCaixaTiraConfirmar);
  cxRelMovDiarioCaixa := 'Rel. Mov. Di�rio Caixa';
  vaMenuLista.Permissoes.Add(cxRelMovDiarioCaixa);
  cxRelProcAberto := 'Rel. Procedimentos em Aberto';
  vaMenuLista.Permissoes.Add(cxRelProcAberto);
  cxRelGuiasMedico := 'Rel. Guias Por M�dico';
  vaMenuLista.Permissoes.Add(cxRelGuiasMedico);
  cxRelMovDiarioProcedim := 'Rel. Movimento Di�rio do Caixa Por Procedimento';
  vaMenuLista.Permissoes.Add(cxRelMovDiarioProcedim);
  cxRelRateioPeriodo := 'Rel. Rateio no Per�odo';
  vaMenuLista.Permissoes.Add(cxRelRateioPeriodo);
  FMenuLista.Add(vaMenuLista);

  { Administracao }
  vaMenuLista := TMenuLista.Create;
  vaMenuLista.NomeMenu := 'Administra��o';

  adGrupos_CtApagar := 'Grupos de Contas a Pagar';
  vaMenuLista.Permissoes.Add(adGrupos_CtApagar);
  adBcorigcr := 'Tabela de Origem do Contas a Receber';
  vaMenuLista.Permissoes.Add(adBcorigcr);
  adClientes_Ctareceb := 'Tabela de Clientes do Contas a Receber';
  vaMenuLista.Permissoes.Add(adClientes_Ctareceb);
  adPatrimonio := 'Patrim�nio';
  vaMenuLista.Permissoes.Add(adPatrimonio);
  adPatrimonio_Local := 'Cadastro de Localiza��o de Patrim�nio';
  vaMenuLista.Permissoes.Add(adPatrimonio_Local);
  adContas_Balancete := 'Contas do Balancete';
  vaMenuLista.Permissoes.Add(adContas_Balancete);
  adFornec := 'Fornecedores';
  vaMenuLista.Permissoes.Add(adFornec);
  adLotesCtPagar := 'Lotes de Contas a Pagar';
  vaMenuLista.Permissoes.Add(adLotesCtPagar);
  adPatrimEmprestimo := 'Patrim�nio - Emprestimo';
  vaMenuLista.Permissoes.Add(adPatrimEmprestimo);
  adCtPagar := 'Contas a Pagar';
  vaMenuLista.Permissoes.Add(adCtPagar);
  adCtPagarImprCheques := 'Contas a Pagar - Imprimir Cheques';
  vaMenuLista.Permissoes.Add(adCtPagarImprCheques);
  adCtReceber := 'Contas a Receber';
  vaMenuLista.Permissoes.Add(adCtReceber);
  adBancPessModelCheque := 'Banc�rio Pessoal - Modelos de Cheque';
  vaMenuLista.Permissoes.Add(adBancPessModelCheque);
  adBancPessHistoricos := 'Banc�rio Pessoal - Hist�ricos';
  vaMenuLista.Permissoes.Add(adBancPessHistoricos);
  adBancPessContas := 'Banc�rio Pessoal - Contas';
  vaMenuLista.Permissoes.Add(adBancPessContas);
  adBancPessLancamentos := 'Banc�rio Pessoal - Lan�amentos';
  vaMenuLista.Permissoes.Add(adBancPessLancamentos);
  adBancPessChecagemExtrato := 'Banc�rio Pessoal - Checagem de Extrato';
  vaMenuLista.Permissoes.Add(adBancPessChecagemExtrato);
  adBancPessImprCheques := 'Banc�rio Pessoal - Impress�o de Cheques';
  vaMenuLista.Permissoes.Add(adBancPessImprCheques);
  adBancEmpresModelCheque := 'Banc�rio Empresarial - Modelos de Cheque';
  vaMenuLista.Permissoes.Add(adBancEmpresModelCheque);
  adBancEmpresHistoricos := 'Banc�rio Empresarial - Hist�ricos';
  vaMenuLista.Permissoes.Add(adBancEmpresHistoricos);
  adBancEmpresContas := 'Banc�rio Empresarial - Contas';
  vaMenuLista.Permissoes.Add(adBancEmpresContas);
  adBancEmpresLancamentos := 'Banc�rio Empresarial - Lan�amentos';
  vaMenuLista.Permissoes.Add(adBancEmpresLancamentos);
  adBancEmpresChecagemExtrato := 'Banc�rio Empresarial - Checagem de Extrato';
  vaMenuLista.Permissoes.Add(adBancEmpresChecagemExtrato);
  adBancEmpresImprCheques := 'Banc�rio Empresarial - Impress�o de Cheques';
  vaMenuLista.Permissoes.Add(adBancEmpresImprCheques);
  adBancEmpresConciliacao := 'Banc�rio Empresarial - Concilia��o Banc�ria';
  vaMenuLista.Permissoes.Add(adBancEmpresConciliacao);
  adBancEmpresAlteraConciliados := 'Banc�rio Empresarial - Alterar Lan�amentos Conciliados';
  vaMenuLista.Permissoes.Add(adBancEmpresAlteraConciliados);
  adAntecipaPagamts := 'Antecipa��o de Pagamentos';
  vaMenuLista.Permissoes.Add(adAntecipaPagamts);
  adCadChequesSemFundo := 'Cadastro de Cheques Sem Fundos';
  vaMenuLista.Permissoes.Add(adCadChequesSemFundo);
  adRepasseMedPrestador := 'Repasse M�dico/Prestador';
  vaMenuLista.Permissoes.Add(adRepasseMedPrestador);
  adAdmContasTransf := 'Adm. de Contas (Transf.)';
  vaMenuLista.Permissoes.Add(adAdmContasTransf);
  adTermoConfisDivida := 'Termo de Confiss�o de D�vida';
  vaMenuLista.Permissoes.Add(adTermoConfisDivida);
  adTipoDocumento := 'Tipo de Documentos';
  vaMenuLista.Permissoes.Add(adTipoDocumento);
  adCartasCobranca := 'Cartas de Cobran�a';
  vaMenuLista.Permissoes.Add(adCartasCobranca);
  adRelImprCartirinhas := 'Impress�o de Carteirinhas';
  vaMenuLista.Permissoes.Add(adRelImprCartirinhas);
  adRelInfOnLine := 'Rel. Informa��es On Line';
  vaMenuLista.Permissoes.Add(adRelInfOnLine);
  adRelCtPagasPagar := 'Rel. Contas Pagas e a Pagar';
  vaMenuLista.Permissoes.Add(adRelCtPagasPagar);
  adRelCtRenegociadas := 'Rel. Contas Renegociadas';
  vaMenuLista.Permissoes.Add(adRelCtRenegociadas);
  adRelExtratoCtBalancete := 'Rel. Extrato por Contas do Balancete';
  vaMenuLista.Permissoes.Add(adRelExtratoCtBalancete);
  adRelNotasPagasPeriodo := 'Rel. Notas Pagas no Per�odo (Contas a Pagar)';
  vaMenuLista.Permissoes.Add(adRelNotasPagasPeriodo);
  adRelCtRecebidasReceber := 'Rel. Contas Recebidas e a Receber';
  vaMenuLista.Permissoes.Add(adRelCtRecebidasReceber);
  adRelBalancFinanceiro := 'Rel. Balancete Financeiro';
  vaMenuLista.Permissoes.Add(adRelBalancFinanceiro);
  adRelAntecPagmts := 'Rel. Antecipa��o de Pagamentos';
  vaMenuLista.Permissoes.Add(adRelAntecPagmts);
  adRelBancPessSaldoGeralCts := 'Rel. Banc�rio Pessoal - Saldo Geral das Contas';
  vaMenuLista.Permissoes.Add(adRelBancPessSaldoGeralCts);
  adRelMovBancario := 'Rel. Movimento Banc�rio';
  vaMenuLista.Permissoes.Add(adRelMovBancario);
  adRelFluxoCaixa := 'Rel. Fluxo de Caixa';
  vaMenuLista.Permissoes.Add(adRelFluxoCaixa);
  adRelTermoConfDivida := 'Rel. Termo C. D�vida';
  vaMenuLista.Permissoes.Add(adRelTermoConfDivida);
  adRelFaturamento := 'Rel. Faturamento';
  vaMenuLista.Permissoes.Add(adRelFaturamento);
  adRelRelacPatrimonial := 'Rel. Rela��o Patrimonial';
  vaMenuLista.Permissoes.Add(adRelRelacPatrimonial);
  adRelChequesSemFundo := 'Rel. Cheques Sem Fundo';
  vaMenuLista.Permissoes.Add(adRelChequesSemFundo);
  adRelResumoContasBalance := 'Rel. Resumo das Contas do Balancete';
  vaMenuLista.Permissoes.Add(adRelResumoContasBalance);
  adGerarDemed := 'Gerar Arquivo Dmed';
  vaMenuLista.Permissoes.Add(adGerarDemed);
  adFechamentoBancario := 'Fechamento Banc�rio';
  vaMenuLista.Permissoes.Add(adFechamentoBancario);
  adPastaArquivo := 'Pastas do Arquivo';
  vaMenuLista.Permissoes.Add(adPastaArquivo);
  adContaBalanceteCategoria := 'Contas do Balancete por Categoria';
  vaMenuLista.Permissoes.Add(adContaBalanceteCategoria);
  adGruposFornec := 'Grupos de Fornecedores';
  vaMenuLista.Permissoes.Add(adGruposFornec);
  FMenuLista.Add(vaMenuLista);
  { bi }
  vaMenuLista := TMenuLista.Create;
  vaMenuLista.NomeMenu := 'BI';

  biBI := 'BI';
  vaMenuLista.Permissoes.Add(biBI);
  biDashBoard := 'DashBoards';
  vaMenuLista.Permissoes.Add(biDashBoard);
  biModeloBi := 'Modelos de B.I.';
  vaMenuLista.Permissoes.Add(biModeloBi);
  FMenuLista.Add(vaMenuLista);
  { Custo }
  vaMenuLista := TMenuLista.Create;
  vaMenuLista.NomeMenu := 'Custo';

  cuDespesas := 'Despesas';
  vaMenuLista.Permissoes.Add(cuDespesas);
  cuCentrosCusto := 'Centros de Custo';
  vaMenuLista.Permissoes.Add(cuCentrosCusto);
  cuCentrosCustoDespesas := 'Centros de Custo - Despesas';
  vaMenuLista.Permissoes.Add(cuCentrosCustoDespesas);
  cuCentrosCustoRateio := 'Centros de Custo - Rateio';
  vaMenuLista.Permissoes.Add(cuCentrosCustoRateio);
  cuRelEstMargContribuicao := 'Rel. Estudo da Margem de Contribui��o';
  vaMenuLista.Permissoes.Add(cuRelEstMargContribuicao);
  FMenuLista.Add(vaMenuLista);

end;

destructor TPermissaoLista.destroy;
begin
  FreeAndNil(FMenuLista);
  inherited;
end;

procedure TPermissaoLista.ppuRetornaListaPermissaocds(ipCds: TClientDataSet; ipCdsPermissoesFormCustom: TClientDataSet);
var
  i, j, vaCodigo: Integer;
begin
  for i := 0 to FMenuLista.Count - 1 do
    Begin
      ipCds.Insert;
      ipCds.FieldByName('MODULO').AsString := TMenuLista(FMenuLista[i]).NomeMenu;
      ipCds.Post;
      vaCodigo := ipCds.FieldByName('CODIGO').AsInteger;
      for j := 0 to TMenuLista(FMenuLista[i]).Permissoes.Count - 1 do
        Begin
          ipCds.Insert;
          ipCds.FieldByName('MODULO').AsString := TMenuLista(FMenuLista[i]).Permissoes[j];
          ipCds.FieldByName('CODIGO_GRUPO').AsInteger := vaCodigo;
          ipCds.Post;
        End;
    End;
  if Assigned(ipCdsPermissoesFormCustom) then
    begin
      // agora vamos add a lista das permiss�es dos Forms Customizados
      ipCdsPermissoesFormCustom.First;
      i := -3971;
      while not ipCdsPermissoesFormCustom.Eof do
        begin
          if i <> ipCdsPermissoesFormCustom.FieldByName('TIPO').AsInteger then
            begin
              i := ipCdsPermissoesFormCustom.FieldByName('TIPO').AsInteger;
              ipCds.Insert;
              ipCds.FieldByName('MODULO').AsString := ipCdsPermissoesFormCustom.FieldByName('CALCTipo').AsString;
              ipCds.Post;
              vaCodigo := ipCds.FieldByName('CODIGO').AsInteger;
            end;
          ipCds.Insert;
          ipCds.FieldByName('MODULO').AsString := ipCdsPermissoesFormCustom.FieldByName('NOME_PERMISSAO').AsString;
          ipCds.FieldByName('CODIGO_GRUPO').AsInteger := vaCodigo;
          ipCds.Post;
          ipCdsPermissoesFormCustom.Next;
        end;
    end;
end;

{$ENDREGION}
{ TListaComponentes }

constructor TListaComponentes.Create(ipForm: TForm);
var
  cont: Integer;
begin
  lcLista := TList.Create;
  lcFormAtual := ipForm;
  // vamos percorrer os componentes do form e guardar na lista aqueles que forem importantes
  for cont := 0 to (lcFormAtual.ComponentCount - 1) do
    begin
      if (Pos('[' + lcFormAtual.Components[cont].ClassName + ']', coClasses) > 0) then // � um tableview
        lcLista.Add(lcFormAtual.Components[cont]);
    end;
end;

procedure TListaComponentes.CriarPopUpLog(ipProcedure: TProcedureChamarLog);
var
  cont: Integer;
  vaItemMenu: TMenuItem;
  vaMenu: TPopupMenu;
begin
  if lcFormAtual.Name = 'frmLog_Sistema' then
    Exit;
  FChamarLog := ipProcedure;
  for cont := 0 to lcLista.Count - 1 do
    begin
      if TComponent(lcLista.Items[cont]) is TcxGridDBTableView then
        Begin
          // verificar se o tableview ja nao tem popup atribuido
          if TcxGridDBTableView(lcLista.Items[cont]).PopupMenu = nil then // nao tem popup, vamos criar um
            Begin
              vaMenu := TPopupMenu.Create(lcFormAtual);
              TcxGridDBTableView(lcLista.Items[cont]).PopupMenu := vaMenu;
            End;
          vaItemMenu := TMenuItem.Create(TPopupMenu(TcxGridDBTableView(lcLista.Items[cont]).PopupMenu));
          vaItemMenu.Name := TcxGridDBTableView(lcLista.Items[cont]).Name;
          vaItemMenu.Caption := 'Ver Log Registro';
          vaItemMenu.OnClick := PopClick;
          TPopupMenu(TcxGridDBTableView(lcLista.Items[cont]).PopupMenu).Items.Add(vaItemMenu);
        End;
    end;

end;

destructor TListaComponentes.destroy;
begin
  FreeAndNil(lcLista);
  inherited destroy;
end;

procedure TListaComponentes.PopClick(Sender: TObject);
var
  vaNomeDataSet: String;
  vaCodigo: Integer;
begin
  if Sender is TMenuItem then
    Begin
      if not TcxGridDBTableView(lcFormAtual.FindComponent(TMenuItem(Sender).Name)).DataController.DataSource.DataSet.Active then
        Exit;
      vaNomeDataSet := TcxGridDBTableView(lcFormAtual.FindComponent(TMenuItem(Sender).Name)).DataController.DataSource.DataSet.Name;
      vaCodigo := TcxGridDBTableView(lcFormAtual.FindComponent(TMenuItem(Sender).Name)).DataController.DataSource.DataSet.Fields[0].AsInteger;
      FChamarLog(copy(vaNomeDataSet, 4), vaCodigo);
    End;
end;

procedure TListaComponentes.ResturarGrids;
var
  cont: Integer;
begin
  for cont := 0 to lcLista.Count - 1 do
    begin
      if TComponent(lcLista.Items[cont]) is TcxGridDBTableView then
        begin
          RestoreLayoutGrid(coEndConfig, TcxGridDBTableView(lcLista.Items[cont]), lcFormAtual.Name + TcxGridDBTableView(lcLista.Items[cont]).Name);
        end;
    end;
end;

procedure TListaComponentes.SalvarGrids;
var
  cont: Integer;
begin
  for cont := 0 to lcLista.Count - 1 do
    begin
      if TComponent(lcLista.Items[cont]) is TcxGridDBTableView then
        SalvarLayoutGrid(coEndConfig, TcxGridDBTableView(lcLista.Items[cont]), lcFormAtual.Name + TcxGridDBTableView(lcLista.Items[cont]).Name);
    end;
end;

{ TMenuLista }

constructor TMenuLista.Create;
begin
  Permissoes := TStringList.Create;
end;

destructor TMenuLista.destroy;
begin
  FreeAndNil(Permissoes);
  inherited;
end;

{ TParametrosConsulta }

constructor TParametrosConsulta.Create(ipCategoria: TTipoCategoria);
begin
  NroFicha := 0;
  NroInternacao := 0;
  Codigo := 0;
  CategoriaExame := 0;
  TipoCategoria := ipCategoria;
  ProntoAtendimento := False;
  TravarCampoMedico := False;
  SubTipoCategoria := stcNenhum;
  Terapia := False;
  CodigoBXACORRE := 0;
end;

{ TParametrosLancamento }

constructor TParametrosLancamento.Create(ipCategoria: TTipoCategoria);
begin
  Self.NroFicha := 0;
  Self.NroInternacao := 0;
  Self.TipoCategoria := ipCategoria;
  Self.NroRegistroAlterar := 0;
  Self.CodigoProcPgos := 0;
  Self.CodigoConvenio := 0;
  Self.CodigoMedicoExaminador := 0;
  Self.MovimentandoPeloFaturamento := False;
  Self.CodigoBXACORRE := 0;
  Self.CodigoAgendaHs := 0;
  Self.CategoriasEspecificas := '';
  Self.MedicosEspecificos := '';
  Self.CodigoLocalUso := 0;
  Self.DataRegistro := now;
  Self.CategoriaExame := 0;
  Self.CodigoPreConta := 0;
  Self.ModoAgrupamento := False;
  Self.CodigoModoConsulta := 0;
  Self.SomenteLeitura := False;
  Self.AbrirSomenteEdicaoModal := False;
  Self.TelaOrigem := toRecepcao;
  Self.PermitirProcedimentoSemReferencia := False;
  Self.ApenasInfoComplementar := False;
  Self.ProntoAtendimento := False;
  Self.TravarCampoMedico := False;
  Self.SubTipoCategoria := stcNenhum;
  Self.FecharAoSalvar := False;
  Self.HoraInicio := 0;
  Self.HoraFim := 0;
  Self.DataInternacao := 0;
  Self.DataAlta := 0;
  Self.Terapia := False;
  Self.InfoExtra := nil;
end;



{ TInfoBuscaLog }

constructor TInfoBuscaLog.Create;
begin
  inherited;
  FTipoAcao := '1,2,3';//Inclusao, Altera��o e Exclus�o
end;

procedure TInfoBuscaLog.SetComponente(const Value: Integer);
begin
  FComponente := Value;
end;

procedure TInfoBuscaLog.SetNivelCriticidade(const Value: Integer);
begin
  FNivelCriticidade := Value;
end;

procedure TInfoBuscaLog.SetDataFinal(const Value: String);
begin
  FDataFinal := Value;
end;

procedure TInfoBuscaLog.SetDataInicial(const Value: String);
begin
  FDataInicial := Value;
end;

procedure TInfoBuscaLog.SetEventos(const Value: String);
begin
  FEventos := Value;
end;

procedure TInfoBuscaLog.SetFiltroDelta(const Value: String);
begin
  FFiltroDelta := Value;
end;

procedure TInfoBuscaLog.SetSomenteAtividadePorDelegacao(const Value: Boolean);
begin
  FSomenteAtividadePorDelegacao := Value;
end;

procedure TInfoBuscaLog.SetTabela(const Value: String);
begin
  FTabela := Value.ToUpper;
end;

procedure TInfoBuscaLog.SetTipoAcao(const Value: String);
begin
  FTipoAcao := Value;
end;

procedure TInfoBuscaLog.SetTipoPesquisa(const Value: Integer);
begin
  FTipoPesquisa := Value;
end;

procedure TInfoBuscaLog.SetValorPesquisa(const Value: String);
begin
  FValorPesquisa := Value;
end;

end.
