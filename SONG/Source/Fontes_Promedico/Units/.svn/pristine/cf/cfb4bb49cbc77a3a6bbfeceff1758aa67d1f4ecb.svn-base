unit Unit_ECF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, Buttons, ExtCtrls, DB, DBTables, ShellApi;

function Exec_Abre_Jornada(Modelo_ECF : String) : Boolean;
function Retorno_Impressora(Modelo_Ecf : String) : Boolean;
function Exec_Testa_Modelo_Impressora(Modelo_ECF : String) : String;
function Exec_ImpressoraLigada(Modelo_ECF : String) : Boolean;
function Exec_ProgramaTruncamento(Modelo_ECF : String) : Boolean;
function Exec_ProgramaArredondamento(Modelo_ECF : String) : Boolean;
function Exec_TestaTruncamento(Modelo_ECF : String) : String;
procedure ECF_Pouco_Papel_Aberto(Modelo_ECF : String; var Pouco_Papel, Aberto : Boolean);
function ECF_CarregaIndicesISS(Modelo_ECF : String) : String;
function ECF_CarregaAliquotas(Modelo_ECF : String) : String;
function ECF_ProgramaFormaPagmento(Modelo_ECF, ipPosicao, FormaPagto, Normal_TEF : String) : String;
function ECF_Testa_Gaveta(Modelo_ECF, Invertido : String) : String;
function PegaNumerodeSerie(Modelo_ECF : String) : String;
function PegaNumerodoCupom(Modelo_ECF : String) : Integer;
function TruncDec(Valor : Double; Casas : Integer) : Double;
function AvaliaRetorno(Modelo_ECF:String; CRetorno:Integer): String;
function Exec_AbrePorta(Modelo_ECF:String; Porta_Com:Integer): String;
function Exec_FechaPorta(Modelo_ECF:String): String;
function ECF_AbreGaveta(Modelo_ECF:String): String;
function ECF_SuprimentoSangria(Tipo, Modelo_ECF : String) : String;
function Exec_LeituraX(Modelo_ECF:String): String;
function Exec_ReducaoZ(Modelo_ECF:String): String;
function ECF_RegistraItem(Modelo_ECF:String; QtdeItem:Real; QtdeReg: Integer): String;
function ECF_CancelaItem(Modelo_ECF:String; Posicao_Item: Integer): String;
function Exec_CancelaCupomFiscal(Modelo_ECF:String): String;
function ECF_FinalizaCupom(Modelo_ECF:String; FormaPgto:String; ValorPgto: Double; ValorDesconto: Double; Sequencia_Venda : Integer): String;
function ECF_LerMemFiscal(Modelo_ECF:String; Data_Inicial, Data_Final, Tipo : String): String;
//=================================================================================================
// EPSON_Serial
//=================================================================================================
function EPSON_Serial_Abrir_Porta(dwVelocidade:Integer; wPorta:Integer):Integer;StdCall; External 'InterfaceEpson.dll';
function EPSON_Serial_Fechar_Porta ():Integer;StdCall; External 'InterfaceEpson.dll';
//=================================================================================================
// EPSON_Fiscal
//=================================================================================================
function EPSON_Fiscal_Abrir_Cupom(pszCNPJ:PChar; pszRazaoSocial:PChar; pszEndereco1:PChar; pszEndereco2:PChar; dwPosicao:Integer):Integer;StdCall; External 'InterfaceEpson.dll';
function EPSON_Fiscal_Cancelar_Cupom():Integer;StdCall; External 'InterfaceEpson.dll';
function EPSON_Fiscal_Vender_Item(pszCodigo:PChar; pszDescricao:PChar; pszQuantidade:PChar; dwQuantCasasDecimais:Integer; pszUnidade:PChar; pszPrecoUnidade:PChar; dwPrecoCasasDecimais:Integer; pszAliquotas:PChar; dwLinhas:Integer):Integer;StdCall; External 'InterfaceEpson.dll';
function EPSON_Fiscal_Cancelar_Item(pszNumeroItem:PChar):Integer;StdCall; External 'InterfaceEpson.dll';
function EPSON_Fiscal_Pagamento(pszNumeroPagamento:PChar; pszValorPagamento:PChar; dwCasasDecimais:Integer; pszDescricao1:PChar; pszDescricao2:PChar):Integer;StdCall; External 'InterfaceEpson.dll';
function EPSON_Fiscal_Imprimir_Mensagem(pszLinhaTexto1:PChar; pszLinhaTexto2:PChar; pszLinhaTexto3:PChar; pszLinhaTexto4:PChar; pszLinhaTexto5:PChar; pszLinhaTexto6:PChar; pszLinhaTexto7:PChar; pszLinhaTexto8:PChar):Integer;StdCall; External 'InterfaceEpson.dll';
function EPSON_Fiscal_Mensagem_Aplicacao(pszLinha01:PChar; pszLinha02:PChar):Integer;StdCall; External 'InterfaceEpson.dll';
function EPSON_Fiscal_Fechar_Cupom(bCortarPapel:Boolean; bAdicional:Boolean):Integer;StdCall; External 'InterfaceEpson.dll';
//=================================================================================================
// EPSON_Obter
//=================================================================================================
function EPSON_Obter_Estado_Impressora(pszDados:PChar):Integer;StdCall; External 'InterfaceEpson.dll';
function EPSON_Obter_Dados_Impressora(pszDadosImpressora:PChar):Integer;StdCall; External 'InterfaceEpson.dll';
function EPSON_Obter_Estado_Cupom(pszEstado:PChar):Integer;StdCall; External 'InterfaceEpson.dll';
function EPSON_Obter_Contadores(pszDados:PChar):Integer;StdCall; External 'InterfaceEpson.dll';
//=================================================================================================
// EPSON_RelatorioFiscal
//=================================================================================================
function EPSON_RelatorioFiscal_LeituraX():Integer;StdCall; External 'InterfaceEpson.dll';
function EPSON_RelatorioFiscal_RZ(pszData:PChar; pszHora:PChar; dwHorarioVerao:Integer; pszCRZ:PChar):Integer;StdCall; External 'InterfaceEpson.dll';
function EPSON_RelatorioFiscal_Leitura_MF(pszInicio:PChar; pszFim:PChar; dwTipoImpressao:Integer; pszBuffer:PChar; pszArquivo:PChar; pdwTamanhoBuffer:PInteger; dwTamBuffer:Integer):Integer;StdCall; External 'InterfaceEpson.dll';
function EPSON_RelatorioFiscal_Abrir_Dia():Integer;StdCall; External 'InterfaceEpson.dll';
//=================================================================================================
// EPSON_NaoFiscal
//=================================================================================================
function EPSON_NaoFiscal_Sangria(pszValor:PChar; dwCasasDecimais:Integer):Integer;StdCall; External 'InterfaceEpson.dll';
function EPSON_NaoFiscal_Fundo_Troco(pszValor:PChar; dwCasasDecimais:Integer):Integer;StdCall; External 'InterfaceEpson.dll';
//=================================================================================================
// EPSON_Config
//=================================================================================================
function EPSON_Config_Forma_Pagamento(bVinculado:Boolean; pszNumeroMeio:PChar; pszDescricao:PChar):Integer;StdCall; External 'InterfaceEpson.dll';
//=================================================================================================
// EPSON_Impressora
//=================================================================================================
function EPSON_Impressora_Abrir_Gaveta():Integer;StdCall; External 'InterfaceEpson.dll';

(*****************************************************************************//
//                                                                            //
//                Declarações BEMATECH dll BEMAFI32.DLL *)                    //
//                                                                            //
//****************************************************************************//
{ Funções da DLL BEMATECH }
function Bematech_FI_FechaPortaSerial: Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_FechaPortaSerial';
function Bematech_FI_Sangria(Valor: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_Suprimento(Valor: String; FormaPagamento: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaFormasPagamento( Formas: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaImpressoraLigada: Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_VerificaImpressoraLigada';
//Funções de Inicialização BEMATECH
function Bematech_FI_ProgramaArredondamento: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ProgramaTruncamento: Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_ProgramaTruncamento';
// Funções de Informações da Impressora BEMATECH
function Bematech_FI_VerificaTruncamento( Flag: string ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RetornoImpressora( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroSerie( NumeroSerie: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroSerieMFD(NumeroSerie : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RetornoAliquotas( Aliquotas: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaIndiceAliquotasIss( Flag: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaEstadoImpressora( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ModeloImpressora(Modelo : string): Integer; StdCall; External 'BEMAFI32.DLL';
// Funções do cupom fiscal BEMATECH
function Bematech_FI_AbreCupom( CGC_CPF: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroCupom( NumeroCupom: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VendeItem( Codigo: String; Descricao: String; Aliquota: String; TipoQuantidade: String; Quantidade: String; CasasDecimais: Integer; ValorUnitario: String; TipoDesconto: String; Desconto: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaCupom: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaItemGenerico( NumeroItem: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_IniciaFechamentoCupom( AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EfetuaFormaPagamento( FormaPagamento: String; ValorFormaPagamento: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EfetuaFormaPagamentoIndice( FormaPagamento: String; ValorFormaPagamento: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_TerminaFechamentoCupom( Mensagem: String): Integer; StdCall; External 'BEMAFI32.DLL';
// Funções de Autenticação e Gaveta de Dinheiro BEMATECH
function Bematech_FI_VerificaEstadoGaveta( Var EstadoGaveta: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AcionaGaveta:Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_AcionaGaveta';
// Funções dos Relatórios Fiscais BEMATECH
function Bematech_FI_LeituraX : Integer; StdCall; External 'BEMAFI32.DLL' ;
function Bematech_FI_ReducaoZ( Data: String; Hora: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalData( DataInicial: String; DataFinal: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalDataMFD(DataInicial, DataFinal, FlagLeitura : string): Integer; StdCall; External 'BEMAFI32.DLL';
// Funções da Impressora Fiscal MFD
function Bematech_FI_ProgramaFormaPagamentoMFD(FormaPagto, OperacaoTef: String) : Integer; StdCall; External 'BEMAFI32.DLL';


////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//                Declarações SWEDA dll CONVECF.dll                           //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
// Funções de Inicialização
function ECF_AlteraSimboloMoeda( SimboloMoeda: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ProgramaAliquota( Aliquota: String; ICMS_ISS: Integer ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ProgramaHorarioVerao: Integer; StdCall; External 'CONVECF.DLL';
function ECF_NomeiaDepartamento(Indice: Integer;Departamento: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_NomeiaTotalizadorNaoSujeitoIcms(Indice: Integer; Totalizador: String): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ProgramaArredondamento: Integer; StdCall; External 'CONVECF.DLL';
function ECF_ProgramaTruncamento: Integer;StdCall; External 'CONVECF.DLL' Name 'ECF_ProgramaTruncamento';
function ECF_LinhasEntreCupons( Linhas: Integer ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_EspacoEntreLinhas( Dots: Integer ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ForcaImpactoAgulhas( ForcaImpacto: Integer ): Integer;StdCall; External 'CONVECF.DLL';
// Funções do Cupom Fiscal
function ECF_AbreCupom( CGC_CPF: String ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_VendeItem(   Codigo: String; Descricao: String; Aliquota: String; TipoQuantidade: String;Quantidade: String; CasasDecimais: Integer;ValorUnitario: String;TipoDesconto: String;Desconto: String): Integer;StdCall; External 'CONVECF.DLL';
function ECF_VendeItemDepartamento(Codigo: String;Descricao: String;Aliquota: String;ValorUnitario: String;Quantidade: String;Acrescimo: String;Desconto: String;IndiceDepartamento: String;UnidadeMedida: String): Integer;StdCall; External 'CONVECF.DLL';
function ECF_CancelaItemAnterior: Integer;StdCall; External 'CONVECF.DLL';
function ECF_CancelaItemGenerico( NumeroItem: String ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_CancelaCupom: Integer; StdCall; External 'CONVECF.DLL';
function ECF_FechaCupomResumido( FormaPagamento: String; Mensagem: String ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_FechaCupom( FormaPagamento: String; AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String; ValorPago: String; Mensagem: String): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ResetaImpressora: Integer; StdCall; External 'CONVECF.DLL';
function ECF_IniciaFechamentoCupom( AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_EfetuaFormaPagamento( FormaPagamento: String; ValorFormaPagamento: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_EfetuaFormaPagamentoDescricaoForma( FormaPagamento: string; ValorFormaPagamento: string; DescricaoFormaPagto: string ): integer; StdCall; External 'CONVECF.DLL';
function ECF_TerminaFechamentoCupom( Mensagem: String): Integer; StdCall; External 'CONVECF.DLL';
function ECF_EstornoFormasPagamento( FormaOrigem: String; FormaDestino: String; Valor: String ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_UsaUnidadeMedida(UnidadeMedida: String ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_AumentaDescricaoItem( Descricao: String ): Integer; StdCall; External 'CONVECF.DLL';
// Funções dos Relatórios Fiscais
function ECF_LeituraX: Integer; StdCall; External 'CONVECF.DLL' ;
function ECF_ReducaoZ( Data: String; Hora: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_RelatorioGerencial( Texto: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_RelatorioGerencialTEF( Texto: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_FechaRelatorioGerencial: Integer; StdCall; External 'CONVECF.DLL';
function ECF_LeituraMemoriaFiscalData( DataInicial: String; DataFinal: String ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_LeituraMemoriaFiscalReducao( ReducaoInicial: String; ReducaoFinal: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_LeituraMemoriaFiscalSerialData( DataInicial: String; DataFinal: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_LeituraMemoriaFiscalSerialReducao( ReducaoInicial: String; ReducaoFinal: String ): Integer; StdCall; External 'CONVECF.DLL';
// Funções das Operações Não Fiscais
function ECF_RecebimentoNaoFiscal( IndiceTotalizador: String; Valor: String; FormaPagamento: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_AbreComprovanteNaoFiscalVinculado( FormaPagamento: String; Valor: String; NumeroCupom: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_UsaComprovanteNaoFiscalVinculado( Texto: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_UsaComprovanteNaoFiscalVinculadoTEF( Texto: String ): Integer; StdCall; External 'CONVECF.DLL'
function ECF_FechaComprovanteNaoFiscalVinculado: Integer; StdCall; External 'CONVECF.DLL';
function ECF_Sangria( Valor: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_Suprimento( Valor: String; FormaPagamento: String ): Integer; StdCall; External 'CONVECF.DLL';
// Funções de Informações da Impressora
function ECF_NumeroSerie( NumeroSerie: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_SubTotal( SubTotal: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_NumeroCupom( NumeroCupom: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_LeituraXSerial: Integer; StdCall; External 'CONVECF.DLL';
function ECF_VersaoFirmware( VersaoFirmware: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_CGC_IE( CGC: String; IE: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_GrandeTotal( GrandeTotal: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_Cancelamentos( ValorCancelamentos: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_Descontos( ValorDescontos: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_NumeroOperacoesNaoFiscais( NumeroOperacoes: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_NumeroCuponsCancelados( NumeroCancelamentos: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_NumeroIntervencoes( NumeroIntervencoes: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_NumeroReducoes( NumeroReducoes: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_NumeroSubstituicoesProprietario( NumeroSubstituicoes: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_UltimoItemVendido( NumeroItem: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ClicheProprietario( Cliche: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_NumeroCaixa( NumeroCaixa: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_NumeroLoja(   NumeroLoja: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_SimboloMoeda( SimboloMoeda: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_MinutosLigada( Minutos: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_MinutosImprimindo( Minutos: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaModoOperacao( Modo: string ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaEpromConectada( Flag: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_FlagsFiscais( Var Flag: Integer ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ValorPagoUltimoCupom( ValorCupom: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_DataHoraImpressora( Data: String; Hora: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ContadoresTotalizadoresNaoFiscais( Contadores: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaTotalizadoresNaoFiscais( Totalizadores: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_DataHoraReducao( Data: String; Hora: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_DataMovimento( Data: String ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_VerificaTruncamento( Flag: string ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_Acrescimos( ValorAcrescimos: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ContadorBilhetePassagem( ContadorPassagem: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaAliquotasIss( Flag: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaFormasPagamento( Formas: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaRecebimentoNaoFiscal( Recebimentos: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaDepartamentos( Departamentos: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaTipoImpressora( Var TipoImpressora: Integer ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_VerificaTotalizadoresParciais( Totalizadores: String ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_RetornoAliquotas( Aliquotas: String ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_VerificaEstadoImpressora( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_DadosUltimaReducao( DadosReducao: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_MonitoramentoPapel( Var Linhas: Integer): Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaIndiceAliquotasIss( Flag: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ValorFormaPagamento( FormaPagamento: String; Valor: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ValorTotalizadorNaoFiscal( Totalizador: String; Valor: String ): Integer; StdCall; External 'CONVECF.DLL';
// Funções de Autenticação e Gaveta de Dinheiro
function ECF_Autenticacao:Integer;StdCall; External 'CONVECF.DLL' Name 'ECF_Autenticacao';
function ECF_ProgramaCaracterAutenticacao( Parametros: String ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_AcionaGaveta:Integer; StdCall; External 'CONVECF.DLL' Name 'ECF_AcionaGaveta';
function ECF_VerificaEstadoGaveta( Var EstadoGaveta: Integer ): Integer; StdCall; External 'CONVECF.DLL';
// Funções de Impressão de Cheques
function ECF_ProgramaMoedaSingular(MoedaSingular: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ProgramaMoedaPlural( MoedaPlural: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_CancelaImpressaoCheque: Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaStatusCheque(Var StatusCheque: Integer ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ImprimeCheque(Banco: String; Valor: String; Favorecido: String; Cidade: String; Data: String; Mensagem: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_IncluiCidadeFavorecido( Cidade: String; Favorecido: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ImprimeCopiaCheque: Integer; StdCall; External 'CONVECF.DLL' Name 'ECF_ImprimeCopiaCheque';
// Outras Funções
function ECF_AbrePortaSerial: Integer; StdCall; External 'CONVECF.DLL';
function ECF_RetornoImpressora( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_FechaPortaSerial: Integer; StdCall; External 'CONVECF.DLL' Name 'ECF_FechaPortaSerial';
function ECF_MapaResumo:Integer;StdCall; External 'CONVECF.DLL' Name 'ECF_MapaResumo';
function ECF_AberturaDoDia( ValorCompra: string; FormaPagamento: string ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_FechamentoDoDia: Integer; StdCall; External 'CONVECF.DLL' Name 'ECF_FechamentoDoDia';
function ECF_ImprimeConfiguracoesImpressora:Integer;StdCall; External 'CONVECF.DLL' Name 'ECF_ImprimeConfiguracoesImpressora';
function ECF_ImprimeDepartamentos: Integer;StdCall; External 'CONVECF.DLL' Name 'ECF_ImprimeDepartamentos';
function ECF_RelatorioTipo60Analitico: Integer;StdCall; External 'CONVECF.DLL' Name 'ECF_RelatorioTipo60Analitico';
function ECF_RelatorioTipo60Mestre: Integer; StdCall; External 'CONVECF.DLL' Name 'ECF_RelatorioTipo60Mestre';
function ECF_VerificaImpressoraLigada: Integer; StdCall; External 'CONVECF.DLL' Name 'ECF_VerificaImpressoraLigada';
function ECF_ImpressaoCarne( Titulo, Percelas: string; Datas, Quantidade: integer; Texto, Cliente, RG_CPF, Cupom: string; Vias, Assina: integer ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_InfoBalanca( Porta: string; Modelo: integer; Peso, PrecoKilo, Total: string ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_DadosSintegra( DataInicio: string; DataFinal: string ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_IniciaModoTEF: Integer; StdCall; External 'CONVECF.DLL' Name 'ECF_IniciaModoTEF';
function ECF_FinalizaModoTEF: Integer; StdCall; External 'CONVECF.DLL' Name 'ECF_FinalizaModoTEF';
function ECF_VersaoDll( Versao: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_RegistrosTipo60: Integer; StdCall; External 'CONVECF.DLL' Name 'ECF_RegistrosTipo60';
function ECF_LeArquivoRetorno( Retorno: String ): Integer; StdCall; External 'CONVECF.DLL';
// Funções da Impressora Fiscal MFD
function ECF_AbreCupomMFD(CGC: string;Nome: string;Endereco : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_CancelaCupomMFD(CGC, Nome,Endereco: string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ProgramaFormaPagamentoMFD(FormaPagto,OperacaoTef: String) : Integer;StdCall; External 'CONVECF.DLL';
function ECF_EfetuaFormaPagamentoMFD(FormaPagamento,ValorFormaPagamento,Parcelas,DescricaoFormaPagto: string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_CupomAdicionalMFD(): Integer; StdCall; External 'CONVECF.DLL';
function ECF_AcrescimoDescontoItemMFD (Item,AcrescimoDesconto,TipoAcrescimoDesconto,ValorAcrescimoDesconto: string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_NomeiaRelatorioGerencialMFD (Indice, Descricao : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_AutenticacaoMFD(Linhas, Texto : string) : Integer;StdCall; External 'CONVECF.DLL';
function ECF_AbreComprovanteNaoFiscalVinculadoMFD(FormaPagamento,Valor,NumeroCupom,CGC,nome,Endereco : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ReimpressaoNaoFiscalVinculadoMFD() : Integer; StdCall; External 'CONVECF.DLL';
function ECF_AbreRecebimentoNaoFiscalMFD(CGC, Nome, Endereco : string): Integer; StdCall; External 'CONVECF.DLL';
function ECF_EfetuaRecebimentoNaoFiscalMFD(IndiceTotalizador,ValorRecebimento : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_IniciaFechamentoRecebimentoNaoFiscalMFD(AcrescimoDesconto,TipoAcrescimoDesconto,ValorAcrescimo,ValorDesconto : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_FechaRecebimentoNaoFiscalMFD(Mensagem : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_CancelaRecebimentoNaoFiscalMFD(CGC,Nome,Endereco : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_AbreRelatorioGerencialMFD(Indice : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_UsaRelatorioGerencialMFD(Texto : string): Integer; StdCall; External 'CONVECF.DLL';
function ECF_UsaRelatorioGerencialMFDTEF(Texto : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_SegundaViaNaoFiscalVinculadoMFD(): Integer;StdCall; External 'CONVECF.DLL';
function ECF_EstornoNaoFiscalVinculadoMFD(CGC,Nome,Endereco : string): Integer; StdCall; External 'CONVECF.DLL';
function ECF_NumeroSerieMFD(NumeroSerie : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_VersaoFirmwareMFD(VersaoFirmware : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_CNPJMFD(CNPJ : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_InscricaoEstadualMFD(InscricaoEstadual : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_InscricaoMunicipalMFD(InscricaoMunicipal : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_TempoOperacionalMFD(TempoOperacional : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_MinutosEmitindoDocumentosFiscaisMFD(Minutos : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ContadoresTotalizadoresNaoFiscaisMFD(Contadores : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_VerificaTotalizadoresNaoFiscaisMFD(Totalizadores : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_VerificaFormasPagamentoMFD(FormasPagamento : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_VerificaRecebimentoNaoFiscalMFD(Recebimentos : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_VerificaRelatorioGerencialMFD(Relatorios : string): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ContadorComprovantesCreditoMFD(Comprovantes : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ContadorOperacoesNaoFiscaisCanceladasMFD(OperacoesCanceladas : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ContadorRelatoriosGerenciaisMFD (Relatorios : String): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ContadorCupomFiscalMFD(CuponsEmitidos : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ContadorFitaDetalheMFD(ContadorFita : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ComprovantesNaoFiscaisNaoEmitidosMFD(Comprovantes : string):Integer;StdCall; External 'CONVECF.DLL';
function ECF_NumeroSerieMemoriaMFD(NumeroSerieMFD : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_MarcaModeloTipoImpressoraMFD(Marca,Modelo,Tipo : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ReducoesRestantesMFD(Reducoes : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_VerificaTotalizadoresParciaisMFD(Totalizadores : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_DadosUltimaReducaoMFD(DadosReducao : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_LeituraMemoriaFiscalDataMFD(DataInicial,DataFinal,FlagLeitura : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_LeituraMemoriaFiscalReducaoMFD(ReducaoInicial,ReducaoFinal,FlagLeitura : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_LeituraMemoriaFiscalSerialDataMFD(DataInicial,DataFinal,FlagLeitura : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_LeituraMemoriaFiscalSerialReducaoMFD(ReducaoInicial,ReducaoFinal,FlagLeitura : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_LeituraChequeMFD(CodigoCMC7 : string): Integer;StdCall; External 'CONVECF.DLL';
function ECF_ImprimeChequeMFD(
NumeroBanco,
Valor,
Favorecido,
Cidade,
Data,
Mensagem,
ImpressaoVerso,
Linhas : string): Integer;
StdCall; External 'CONVECF.DLL';
function ECF_HabilitaDesabilitaRetornoEstendidoMFD(FlagRetorno : string):Integer;StdCall; External 'CONVECF.DLL';
function ECF_RetornoImpressoraMFD(Var ACK: Integer;Var ST1: Integer;Var ST2: Integer;Var ST3: Integer ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_AbreBilhetePassagemMFD(Embarque,Destino,Linha,Agencia,Data,Hora,Poltrona,Plataforma,TipoPassagem,RGCliente,NomeCliente,EnderecoCliente,UFDetino: string ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_CancelaAcrescimoDescontoItemMFD( cFlag, cItem: string ): integer;StdCall; External 'CONVECF.DLL';
function ECF_SubTotalizaCupomMFD: integer; StdCall; External 'CONVECF.DLL';
function ECF_SubTotalizaRecebimentoMFD: integer; StdCall; External 'CONVECF.DLL';
function ECF_TotalLivreMFD( cMemoriaLivre: string ): integer;StdCall; External 'CONVECF.DLL';
function ECF_TamanhoTotalMFD( cTamanhoMFD: string ): integer;StdCall; External 'CONVECF.DLL';
function ECF_AcrescimoDescontoSubtotalRecebimentoMFD(cFlag, cTipo, cValor: string ): integer;StdCall; External 'CONVECF.DLL';
function ECF_AcrescimoDescontoSubtotalMFD( cFlag, cTipo, cValor: string): integer;StdCall; External 'CONVECF.DLL';
function ECF_CancelaAcrescimoDescontoSubtotalMFD(cFlag: string): integer;StdCall; External 'CONVECF.DLL';
function ECF_CancelaAcrescimoDescontoSubtotalRecebimentoMFD( cFlag: string ): integer;StdCall; External 'CONVECF.DLL';
function ECF_TotalizaCupomMFD: integer; StdCall; External 'CONVECF.DLL';
function ECF_TotalizaRecebimentoMFD: integer; StdCall; External 'CONVECF.DLL';
function ECF_PercentualLivreMFD( cMemoriaLivre: string ): integer;StdCall; External 'CONVECF.DLL';
function ECF_DataHoraUltimoDocumentoMFD( cDataHora: string ): integer;StdCall; External 'CONVECF.DLL';
function ECF_MapaResumoMFD:Integer;StdCall; External 'CONVECF.DLL' Name 'ECF_MapaResumoMFD';
function ECF_RelatorioTipo60AnaliticoMFD: Integer;StdCall; External 'CONVECF.DLL' Name 'ECF_RelatorioTipo60AnaliticoMFD';
function ECF_ValorFormaPagamentoMFD( FormaPagamento: String; Valor: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ValorTotalizadorNaoFiscalMFD( Totalizador: String; Valor: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_VerificaEstadoImpressoraMFD( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer; Var ST3: Integer ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_IniciaFechamentoCupomMFD( AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimo: String; ValorDesconto: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_TerminaFechamentoCupomCodigoBarrasMFD(
 cMensagem: String;
 cTipoCodigo: String;
 cCodigo: String;
 iAltura: Integer;
 iLargura: Integer;
 iPosicaoCaracteres: Integer;
 iFonte: Integer;
 iMargem: Integer;
 iCorrecaoErros: Integer;
 iColunas: Integer ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_CancelaItemNaoFiscalMFD( NumeroItem: String ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_AcrescimoItemNaoFiscalMFD( NumeroItem: String; AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_CancelaAcrescimoNaoFiscalMFD( NumeroItem: String; AcrescimoDesconto: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_ImprimeClicheMFD:Integer; StdCall; External 'CONVECF.DLL' Name 'ECF_ImprimeClicheMFD';
function ECF_ImprimeInformacaoChequeMFD( Posicao: Integer; Linhas: Integer; Mensagem: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_RelatorioSintegraMFD(
 iRelatorios : Integer;
 cArquivo    : String;
 cMes        : String;
 cAno        : String;
 cRazaoSocial: String;
 cEndereco   : String;
 cNumero     : String;
 cComplemento: String;
 cBairro     : String;
 cCidade     : String;
 cCEP        : String;
 cTelefone   : String;
 cFax        : String;
 cContato    : String ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_GeraRelatorioSintegraMFD (
 iRelatorios : Integer;
 cArquivoOrigem : String;
 cArquivoDestino: String;
 cMes           : String;
 cAno           : String;
 cRazaoSocial   : String;
 cEndereco      : String;
 cNumero        : String;
 cComplemento   : String;
 cBairro        : String;
 cCidade        : String;
 cCEP           : String;
 cTelefone      : String;
 cFax           : String;
 cContato       : String ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_DownloadMF( Arquivo: String ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_DownloadMFD( Arquivo: String; TipoDownload: String; ParametroInicial: String; ParametroFinal: String; UsuarioECF: String ): Integer;  StdCall; External 'CONVECF.DLL';
function ECF_FormatoDadosMFD( ArquivoOrigem: String; ArquivoDestino: String; TipoFormato: String; TipoDownload: String; ParametroInicial: String; ParametroFinal: String; UsuarioECF: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_AtivaDesativaVendaUmaLinhaMFD( iFlag: Integer ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_AtivaDesativaAlinhamentoEsquerdaMFD( iFlag: Integer ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_AtivaDesativaCorteProximoMFD(): Integer;StdCall; External 'CONVECF.DLL';
function ECF_AtivaDesativaTratamentoONOFFLineMFD( iFlag: Integer ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_StatusEstendidoMFD( Var iStatus: Integer ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_VerificaFlagCorteMFD( Var iStatus: Integer ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_TempoRestanteComprovanteMFD( cTempo: String ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_UFProprietarioMFD( cUF: String ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_GrandeTotalUltimaReducaoMFD( cGT: String ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_DataMovimentoUltimaReducaoMFD( cData: String ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_SubTotalComprovanteNaoFiscalMFD( cSubTotal: String ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_InicioFimCOOsMFD( cCOOIni, cCOOFim: String ): Integer;StdCall; External 'CONVECF.DLL';
function ECF_InicioFimGTsMFD( cGTIni, cGTFim: String ): Integer;StdCall; External 'CONVECF.DLL';
// Função para Configuração dos Códigos de Barras
function ECF_ConfiguraCodigoBarrasMFD( Altura: Integer; Largura: Integer; PosicaoCaracteres: Integer; Fonte: Integer; Margem: Integer): Integer;StdCall; External 'CONVECF.DLL';
// Funções para Impressão dos Códigos de Barras
function ECF_CodigoBarrasUPCAMFD( Codigo: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_CodigoBarrasUPCEMFD( Codigo: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_CodigoBarrasEAN13MFD( Codigo: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_CodigoBarrasEAN8MFD( Codigo: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_CodigoBarrasCODE39MFD( Codigo: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_CodigoBarrasCODE93MFD( Codigo: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_CodigoBarrasCODE128MFD( Codigo: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_CodigoBarrasITFMFD( Codigo: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_CodigoBarrasCODABARMFD( Codigo: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_CodigoBarrasISBNMFD( Codigo: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_CodigoBarrasMSIMFD( Codigo: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_CodigoBarrasPLESSEYMFD( Codigo: String ): Integer; StdCall; External 'CONVECF.DLL';
function ECF_CodigoBarrasPDF417MFD( NivelCorrecaoErros: Integer; Altura: Integer; Largura: Integer; Colunas: Integer; Codigo: String ): Integer; StdCall; External 'CONVECF.DLL';
// Novas Funções
Function ECF_VendeItemTresDecimais(codigo: String; nome: String; aliquota: String; quant: String; valor: String; tipoacrdesc: String; perc: String): Integer;StdCall; External 'CONVECF.DLL';
Function ECF_IdentificaConsumidor( nomei: String; endi: String; cpfi: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__EmitirCupomAdicional(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__AbreRelatorioGerencial(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__EnviarTextoCNF(cTexto: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__AbreRecebimentoNaoFiscal( indice: String; tipoacredesc: String;  tipovalor: String; acredesci: String; receb: String; texto: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__EfetuaFormaPagamentoNaoFiscal(legenda: String; valor: String; texto: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__FundoCaixa(valor: String; legenda: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__ReducaoZAjustaDataHora(cdata: String; chora: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__AutenticacaoStr(texto: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__ProgramaFormasPagamento(Modal: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__ProgramaOperador(oper: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__CfgFechaAutomaticoCupom(fac: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__CfgRedZAutomatico(zauto: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__CfgCupomAdicional(adicional: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__CfgEspacamentoCupons(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__CfgHoraMinReducaoZ(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__CfgLimiarNearEnd(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF__CfgPermMensPromoCNF(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_Registry(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_Registry_AlteraRegistry( chave: String; valori: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_Registry_Path(path: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_Registry_PathMFD(path: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_Registry_ZAutomatica(zauto: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_Registry_Verao(verao: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_Registry_Log(log: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_Registry_AplMensagem1(apl: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_Registry_AplMensagem2(apl: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_Registry_Default(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_Registry_RetornaValor(ecf: String; chave: String; valor: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_StatusCupomFiscal(cupa: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_StatusRelatorioGerencial(rela: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_StatusComprovanteNaoFiscalVinculado (vinc: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_StatusComprovanteNaoFiscalNaoVinculado (nvinc: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_VerificaModeloEcf(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_VerificaHorarioVerao(verao: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_VerificaZPendente(zpen: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_VerificaXPendente(xpen: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_VerificaDiaAberto(diaa: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_VerificaDescricaoFormasPagamento(Formas:String):Integer; StdCall; External 'CONVECF.DLL';
Function ECF_VerificaFormasPagamentoEx(FPag: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_VerificaTotalizadoresNaoFiscaisEx (Recebimento: String):Integer; StdCall; External 'CONVECF.DLL';
Function ECF_ClicheProprietarioEx (ClicheProprietario: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RegistraNumeroSerie(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_VerificaNumeroSerie(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaSerialCriptografado(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_COO(COOi: String; COOf: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_LerAliquotasComIndice(taxas: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_VendaBruta(vbruta: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_UltimaFormaPagamento(nome: String; Valor: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_TipoUltimoDocumento(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_PalavraStatusBinario(status: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaErroExtendido(status: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaAcrescimoNF(acnf: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaCFCancelados(cfc: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaCNFCancelados(nfc: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaCLX(clx: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaCNFNV(Recebimento: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaCNFV(Vinculado: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaCOO(COO: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaCRO(cro: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaCRZ(crz: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaCRZRestante(sRed: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaCancelamentoNF( cnf: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaDescontoNF( dnf: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaGNF(gnf: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaTempoImprimindo(MinImprim: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaTempoLigado(MinutosLigada: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaTotalPagamentos(FPag: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaTroco(troco: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaRegistradoresNaoFiscais(rnf: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaRegistradoresFiscais(rf: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaValorComprovanteNaoFiscal (indice: String; Valor: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_RetornaIndiceComprovanteNaoFiscal (nome:String; indice: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_CasasDecimaisProgramada(    dval: String; dqt: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_TempoEsperaCheque(segundos: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_StatusCheque(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_ImprimirCheque(banco: String;
                            cidade: String;
                            cdata: String;
                            nominal: String;
                            valor: String;
                            pos: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_ImprimirVersoCheque(texto: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_LiberarCheque(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_LeituraCodigoMICR(cmc7: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_CancelarCheque(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_ProgramarLeiauteCheque(banco: String; geometria: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_LeituraLeiautesCheques(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_DescontoSobreItemVendido(item: String;
                                      tipodesc: String;
                                      valor: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_AcrescimosICMSISS(vaicms: String; vaiss: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_CancelamentosICMSISS(vcicms: String; vciss: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_DescontosICMSISS(vdicms: String; vdiss: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_LeituraInformacaoUltimoDoc(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_LeituraInformacaoUltimosCNF(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_VerificaRelatorioGerencialProgMFD(sRG: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_SegundaViaCNFV(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_CancelamentoCNFV(ignorado: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_TEF_ImprimirRespostaCartao(path: String; forma: String; trava: String; valor: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_TEF_ImprimirResposta(path: String;
                                  forma: String;
                                  trava: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_TEF_FechaRelatorio(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_TEF_EsperarArquivo(path: String; segundos: String; trava: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_TEF_TravarTeclado(trava: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_ApagaTabelaNomesNaoFiscais(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_ApagaTabelaNomesFormasdePagamento(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_ApagaTabelaAliquotas(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_ApagaTabelaNomesRelatoriosGerenciais(): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_ArquivoSintegra2004MFD( itipo: Integer;
                                    cArquivo: String;
                                    cMes: String;
                                    cAno: String;
                                    cMesf: String;
                                    cAnof: String;
                                    cRazaoSocial: String;
                                    cEndereco: String;
                                    cNumero: String;
                                    cComplemento: String;
                                    cBairro: String;
                                    cCidade: String;
                                    cUF: String;
                                    cCEP: String;
                                    cTelefone: String;
                                    cFax: String;
                                    cContato: String): Integer;
                StdCall; External 'CONVECF.DLL';
Function ECF_LigaDesligaJanelas(    impressora, resto: String): Integer; StdCall; External 'CONVECF.DLL';
Function ECF_EnviarLogotipoCliche  (path: String): Integer; StdCall; External 'CONVECF.DLL';
Function  ECF_GravarLogotipoCliche  (): Integer; StdCall; External 'CONVECF.DLL';
Function  ECF_ExcluirLogotipoCliche (): Integer; StdCall; External 'CONVECF.DLL';
Function  ECF_ProgramarParametrosDiversos
                    (ecf,
                    loja,
                    extra,
                    qt,
                    iss: String): Integer; StdCall; External 'CONVECF.DLL';
Function  ECF_ProgramarCliche (    razao, fantasia, endereco:  String): Integer; StdCall; External 'CONVECF.DLL';
Function  ECF_RetornaTipoEcf  (tipo: String): Integer; StdCall; External 'CONVECF.DLL';
Function  ECF_TabelaMercadoriasServicos3404 (destino, inicio, fim: String): Integer; StdCall; External 'CONVECF.DLL';
Function  ECF_ReproduzirMemoriaFiscalMFD(tipo, fxai, fxaf, asc, bin: String): Integer; StdCall; External 'CONVECF.DLL';



var
  iRetorno, iRetorno_Impressora : Integer;
  //Variaveis utilizadas por sweda SERSWEDA.DLL
  Comando  : array[0..512] of Char;
  Resposta : String;
implementation

uses pPrincipal, DataModule1, Unit_VendaVisual, Unit_Method, Unit_Sweda;

function Exec_Abre_Jornada(Modelo_ECF : String) : Boolean;
begin
  Result := False;
  if Modelo_ECF = 'EPSON TM-T81 FBII' then
    begin
      iRetorno := EPSON_RelatorioFiscal_Abrir_Dia();
      Result := Retorno_Impressora(Modelo_ECF);
    end
  else
    MessageTela(True, False, 'Software não programado para Exec_Abre_Jornada com ECF Modelo ' + Modelo_ECF,0);
end;
function Analiza_Resposta_SerSweda(ip_Resposta : String) : Boolean;
var
  va_Sinal : String;
  va_Aut, va_Slip, va_Status : Integer;
begin
  Result := False;
  if copy(ip_Resposta,3,1) = 'P' then
    begin
      va_Sinal := Copy(ip_Resposta, 2,1);
      va_Aut := StrToInt(Copy(ip_Resposta,4,1));
      va_Slip := StrToInt(Copy(ip_Resposta,5,1));
      va_Status := StrToInt(Copy(ip_Resposta,6,1));
(*      case va_Aut of
        0 : MessageTela(True, False, 'HÁ documento para AUTENTICAR!', 'Atenção', MB_ICONHAND);
        1 : MessageTela(True, False, 'Impressora off-line!', 'Atenção', MB_ICONHAND);
        2 : MessageTela(True, False, 'Time-out de Transmissão!', 'Atenção', MB_ICONHAND);
        5 : MessageTela(True, False, 'SEM documento para AUTENTICAR!', 'Atenção', MB_ICONHAND);
        6 : MessageTela(True, False, 'Time-out de recepção do impressor do ECF!', 'Atenção', MB_ICONHAND);
      else
        MessageTela(True, False, Pchar('Retorno da Impressora:' +#13#10+ ip_Resposta), 'Atenção', MB_ICONHAND)
      end;
      case va_Slip of
        0 : MessageTela(True, False, 'HÁ folha SOLTA PRESENTE!', 'Atenção', MB_ICONHAND);
        1 : MessageTela(True, False, 'Impressora off-line!', 'Atenção', MB_ICONHAND);
        2 : MessageTela(True, False, 'Time-out de Transmissão!', 'Atenção', MB_ICONHAND);
        5 : MessageTela(True, False, 'SEM FOLHA solta presente!', 'Atenção', MB_ICONHAND);
        6 : MessageTela(True, False, 'Time-out de recepção do impressor do ECF!', 'Atenção', MB_ICONHAND);
      else
        MessageTela(True, False, Pchar('Retorno da Impressora:' +#13#10+ ip_Resposta), 'Atenção', MB_ICONHAND)
      end;*)
      case va_Status of
        0 : Result := True;
        1 : MessageTela(True, False, 'Impressora off-line!',0);
        2 : MessageTela(True, False, 'Time-out de Transmissão!',0);
        5 : MessageTela(True, False, 'Sem papel/papel acabando!',0);
        6 : MessageTela(True, False, 'Time-out de recepção do impressor do ECF!',0);
      else
        MessageTela(True, False, 'Retorno da Impressora:' +#13#10+ ip_Resposta,0);
      end;
    end
  else
    begin
      if copy(ip_resposta, 1,2) = '.-' then
        MessageTela(True, False, 'Retorno da Impressora:' +#13#10+ ip_Resposta,0)
      else
        Result := True;
    end;
  Comando := '';
end;

function AvaliaRetorno(Modelo_ECF:String; CRetorno:Integer): String;
begin
  AvaliaRetorno := '**';
  if Modelo_ECF = 'SCHALTER SPRINT 3.00' then
    begin
      if (CRetorno = 4) or (CRetorno = 132) then
        begin
          MessageTela(True, False, 'ECF Desligado ou Fora de Linha. Certifique-se de que ele esteja ligado e em linha.',0);
          AvaliaRetorno := '**';
          Exit;
        end;
      if CRetorno = 81 then
        begin
          MessageTela(True, False, 'Papel Próximo do Fim. Troque a Bobina e Continue a Operação.',0);
          AvaliaRetorno := '**';
          Exit;
        end;
      AvaliaRetorno := 'OK';
    end
  else
    if Modelo_ECF = 'YANCO 8000 V 1.1' then
      begin
        if CRetorno = 17 then
          begin
            MessageTela(True, False, 'ECF Desligado ou Fora de Linha. Certifique-se de que ele esteja ligado e em linha.',0);
            AvaliaRetorno := '**';
            Exit;
          end;
        if (CRetorno = 10) or (CRetorno = 11) then
          begin
            MessageTela(True, False, 'Papel Próximo do Fim. Troque a Bobina e Continue a Operação.',0);
            AvaliaRetorno := '**';
            Exit;
          end;
        AvaliaRetorno := 'OK';
      end
    else
      if Modelo_ECF = 'BEMATECH MP20 FI II' then
        begin
          case iRetorno of
            0 : MessageTela(True, False, 'Erro de Comunicação !',0);
           -1 : MessageTela(True, False,  'Erro de Execução na Função. Verifique!',0);
           -2 : MessageTela(True, False,  'Parâmetro Inválido !',0);
           -3 : MessageTela(True, False,  'Alíquota não programada !',0);
           -4 : MessageTela(True, False,  'Arquivo BemaFI32.INI não encontrado. Verifique!',0);
           -5 : MessageTela(True, False,  'Erro ao Abrir a Porta de Comunicação',0);
           -6 : MessageTela(True, False,  'Impressora Desligada ou Desconectada',0);
           -7 : MessageTela(True, False,  'Banco Não Cadastrado no Arquivo BemaFI32.ini',0);
           -8 : MessageTela(True, False,  'Erro ao Criar ou Gravar no Arquivo Retorno.txt ou Status.txt',0);
           -18: MessageTela(True, False,  'Não foi possível abrir arquivo INTPOS.001 !',0);
           -19: MessageTela(True, False,  'Parâmetro diferentes !',0);
           -20: MessageTela(True, False,  'Transação cancelada pelo Operador !',0);
           -21: MessageTela(True, False,  'A Transação não foi aprovada !',0);
           -22: MessageTela(True, False,  'Não foi possível terminal a Impressão !',0);
           -23: MessageTela(True, False,  'Não foi possível terminal a Operação !',0);
           -24: MessageTela(True, False,  'Forma de pagamento não programada.',0);
           -25: MessageTela(True, False,  'Totalizador não fiscal não programado.',0);
           -26: MessageTela(True, False,  'Transação já Efetuada !',0);
           -28: MessageTela(True, False,  'Não há Informações para serem Impressas !',0);
          else
            AvaliaRetorno := 'OK'
          end
        end
      else
        MessageTela(True, False, PChar('Modelo de ECF ' + Modelo_ECF + ' não encontrado.'),0);
end;

// -------------------- Analisa a Variável iRetorno ---------------------
procedure Analisa_iRetorno(Modelo_Ecf : String);
begin
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') then
    begin
      if iRetorno <> 1 then//se retornou 1 então esta tudo certo.
        case iRetorno of
          0 : MessageTela(True, False,  'Erro de Comunicação !',0);
         -1 : MessageTela(True, False,  'Erro de Execução na Função. Verifique!',0);
         -2 : MessageTela(True, False,  'Parâmetro Inválido !',0);
         -3 : MessageTela(True, False,  'Alíquota não programada !',0);
         -4 : MessageTela(True, False,  'Arquivo BemaFI32.INI não encontrado. Verifique!',0);
         -5 : MessageTela(True, False,  'Erro ao Abrir a Porta de Comunicação',0);
         -6 : MessageTela(True, False,  'Impressora Desligada ou Desconectada',0);
         -7 : MessageTela(True, False,  'Banco Não Cadastrado no Arquivo BemaFI32.ini',0);
         -8 : MessageTela(True, False,  'Erro ao Criar ou Gravar no Arquivo Retorno.txt ou Status.txt',0);
         -10: MessageTela(True, False,  'ECF não está em MIT.',0);
         -11: MessageTela(True, False,  'Existe um documento aberto.',0);
         -18: MessageTela(True, False,  'Não foi possível abrir arquivo INTPOS.001 !',0);
         -19: MessageTela(True, False,  'Parâmetro diferentes !',0);
         -20: MessageTela(True, False,  'Transação cancelada pelo Operador !',0);
         -21: MessageTela(True, False,  'A Transação não foi aprovada !',0);
         -22: MessageTela(True, False,  'Não foi possível terminal a Impressão !',0);
         -23: MessageTela(True, False,  'Não foi possível terminal a Operação !',0);
         -24: MessageTela(True, False,  'Forma de pagamento não programada.',0);
         -25: MessageTela(True, False,  'Totalizador não fiscal não programado.',0);
         -26: MessageTela(True, False,  'Transação já Efetuada !',0);
         -27: MessageTela(True, False,  'Status do ECF diferente de 6,0,0,0 (Ack,St1,St2,St3).',0);
         -28: MessageTela(True, False,  'Não há Informações para serem Impressas!',0);
         -30: MessageTela(True, False,  'Função não compatível com a Impressora!',0);
         -36: MessageTela(True, False,  'Faltando Forma de pagamento para finalizar!',0);
        else
          MessageTela(True, False, 'RETORNO NÃO ESPERADO "' + IntToStr(iRetorno) + '"',0);
        end;
    end
  else
    MessageTela(True, False, 'Analise de Retorno não programada para ECF ' + Modelo_ECF + '.',0);
end;

// ------------------- Analisa Retorno da Impressora --------------------
function Retorno_Impressora(Modelo_Ecf : String) : Boolean;
var
  // Variaveis para Impressora Bematech e Sweda //
  iACK, iST1, iST2: Integer;

  // Variaveis para Impressora Epson //
  vaMensagem, ST1err, ST1field,ST2, ST3, ST4, ST5, Temp : String;
  iST3, iST4, iST5, iConta, ret : Integer;
  vaResult, flagB15, flagB14, flagB11, flagB10, flagB09 : Boolean;
begin
  Result := False;
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') then
    begin
      iACK := 0;
      iST1 := 0;
      iST2 := 0;
      if Modelo_ECF = 'BEMATECH MP20 FI II' then
        iRetorno_Impressora := Bematech_FI_RetornoImpressora(iACK, iST1, iST2)
      else
        if Modelo_ECF = 'SWEDA ST100' then
          iRetorno_Impressora := ECF_RetornoImpressora(iAck,iSt1,iSt2);
      if iACK = 6 then
        begin
          // Verifica ST1
          if iST1 >= 128 then
            begin
              iST1 := iST1 - 128;
              MessageTela(True, False, 'ST1 - BIT 7 - Fim de Papel.',0);
              iRetorno_Impressora := 0;
            end;
          if iST1 >= 64 then
            begin
              iST1 := iST1 - 64;
              Form_VendaVisual.Label2.Caption := 'POUCO PAPEL - ' + Form_VendaVisual.Label2.Caption;
            end;
          if iST1 >= 32 then
            begin
              iST1 := iST1 - 32;
              MessageTela(True, False, 'ST1 - BIT 5 - Erro no Relógio.',0);
              iRetorno_Impressora := 0;
            end;
          if iST1 >= 16 then
            begin
              iST1 := iST1 - 16;
              MessageTela(True, False, 'ST1 - BIT 4 - Impressora em ERRO.',0);
              iRetorno_Impressora := 0;
            end;
          if iST1 >= 8 then
            begin
              iST1 := iST1 - 8;
              MessageTela(True, False, 'ST1 - BIT 3 - CMD não iniciado com ESC.',0);
              iRetorno_Impressora := 0;
            end;
          if iST1 >= 4 then
            begin
              iST1 := iST1 - 4;
              MessageTela(True, False, 'ST1 - BIT 2 - Comando Inexistente.',0);
              iRetorno_Impressora := 0;
            end;
          if iST1 >= 2 then
            begin
              iST1 := iST1 - 2;
              MessageTela(True, False, 'ST1 - BIT 1 - Cupom Aberto.',0);
              iRetorno_Impressora := 0;
            end;
          if iST1 >= 1 then
            begin
              iST1 := iST1 - 1;
              MessageTela(True, False, 'ST1 - BIT 0 - Nº de Parâmetros Inválidos.',0);
              iRetorno_Impressora := 0;
            end;

          // Verifica ST2
          if iST2 >= 128 then
            begin
              iST2 := iST2 - 128;
              MessageTela(True, False, 'ST2 - BIT 7 - Tipo de Parâmetro Inválido.',0);
              iRetorno_Impressora := 0;
            end;
          if iST2 >= 64 then
            begin
              iST2 := iST2 - 64;
              MessageTela(True, False, 'ST2 - BIT 6 - Memória Fiscal Lotada.',0);
              iRetorno_Impressora := 0;
            end;
          if iST2 >= 32 then
            begin
              iST2 := iST2 - 32;
              MessageTela(True, False, 'ST2 - BIT 5 - CMOS não Volátil.',0);
              iRetorno_Impressora := 0;
            end;
          if iST2 >= 16 then
            begin
              iST2 := iST2 - 16;
              MessageTela(True, False, 'ST2 - BIT 4 - Alíquota Não Programada.',0);
              iRetorno_Impressora := 0;
            end;
          if iST2 >= 8 then
            begin
              iST2 := iST2 - 8;
              MessageTela(True, False, 'ST2 - BIT 3 - Alíquotas lotadas.',0);
              iRetorno_Impressora := 0;
            end;
          if iST2 >= 4 then
            begin
              iST2 := iST2 - 4;
              MessageTela(True, False, 'ST2 - BIT 2 - Cancelamento não Permitido.',0);
              iRetorno_Impressora := 0;
            end;
          if iST2 >= 2 then
            begin
              iST2 := iST2 - 2;
              MessageTela(True, False, 'ST2 - BIT 1 - CNPJ/IE não Programados.',0);
              iRetorno_Impressora := 0;
            end;
          if iST2 >= 1 then
            begin
              iST2 := iST2 - 1;
              MessageTela(True, False, 'ST2 - BIT 0 - Comando não Executado.',0);
              iRetorno_Impressora := 0;
            end;
        end;

      if iACK = 21 Then
        begin
          MessageTela(True, False, 'Atenção!!!' + #13#10 +
                                   'A Impressora retornou NAK. O programa será abortado.',0);
          Form_Sage.Close;
          Application.Terminate;
          Exit;
        end;
    end
  else
    if Modelo_ECF = 'EPSON TM-T81 FBII' then
      begin
        vaMensagem := '';
        for iConta := 1 to 2 do
          ST1err := ST1err + ' ';

        For iConta := 1 To 2 Do
          ST1field := ST1field + ' ';

        For iConta := 1 To 4 Do
          ST2 := ST2 + ' ';

        For iConta := 1 To 4 Do
          ST3 := ST3 + ' ';

        For iConta := 1 To 4 Do
          ST4 := ST4 + ' ';

        For iConta := 1 To 4 Do
          ST5 := ST5 + ' ';

        For iConta := 1 To 20 Do
          Temp := Temp + ' ';

        ret := EPSON_Obter_Estado_Impressora(PChar(Temp));

        If ret <> 0 Then
          begin
            Result := False;
            vaMensagem := 'Retorno da Impressora = ' + IntToStr(ret);
          end
        Else
          begin
            If iRetorno_Impressora <> 0 Then
              Result := False
            Else
              Result := True;

            ST1err := Copy(Temp,1,2);
            ST1field := Copy(Temp,3,2);
            ST2 := Copy(Temp,5,4);
            ST3 := Copy(Temp,9,4);
            ST4 := Copy(Temp,13,4);
            ST5 := Copy(Temp,17,4);

            //==============================================================================
            //Parâmetros do último comando
            //==============================================================================
            Case StrToInt(ST1err) of
              0: vaMensagem := 'Campos sem erro.';
              1: vaMensagem := 'Campo deve ser um ponteiro para string.';
              2: vaMensagem := 'String com data inválida.';
              3: vaMensagem := 'String com hora inválida.';
              4: vaMensagem := 'String não está vazia ou contém data inválida.';
              5: vaMensagem := 'String não está vazia ou contém hora inválida.';
              6: vaMensagem := 'String não pode ser vazia.';
              else vaMensagem := 'Erro não mapeado.';
            End;

            if StrToInt(ST1err) <> 0 then
              vaMensagem := vaMensagem + ' - Campo com erro: ' + ST1field;

            //==============================================================================
            //Estado da Comunicação
            //==============================================================================
            Case StrToInt('$' + ST2) of
              0:  vaMensagem := vaMensagem + 'Porta aberta com sucesso.';
              1:  vaMensagem := vaMensagem + 'Porta já está aberta.';
              2:  vaMensagem := vaMensagem + 'Porta usada por outra aplicação.';
              4:  vaMensagem := vaMensagem + 'Número de porta inválido.';
              5:  vaMensagem := vaMensagem + 'Velocidade inválida.';
              16: vaMensagem := vaMensagem + 'String não está vazia ou contém hora inválida.';
              else vaMensagem := vaMensagem + 'Erro interno da biblioteca.';
            end;

            //==============================================================================
            //Estado da Impressora
            //==============================================================================
            flagB09 := false;
            flagB10 := false;
            iST3 := StrToInt('$' + ST3);
            //****************************************************************************
            //                       TRATAMENTO DO BIT 15                                *
            //****************************************************************************
            If (iST3 >= 32768) Then
              BEGIN
                vaMensagem := vaMensagem + ' - Impressora(Offline) - ';
                iST3 := iST3 - 32768;
              END;

            //****************************************************************************
            //                       TRATAMENTO DO BIT 14                                *
            //****************************************************************************
            If (iST3 >= 16384) Then
              BEGIN
                vaMensagem := vaMensagem + 'Erro de impressão - ';
                iST3 := iST3 - 16384;
              END;

            //****************************************************************************
            //                       TRATAMENTO DO BIT 13                                *
            //****************************************************************************
            If (iST3 >= 8192) Then
              BEGIN
                vaMensagem := vaMensagem + ' Tampa superior aberta - ';
                iST3 := iST3 - 8192;
              END;

            //****************************************************************************
            //                       TRATAMENTO DO BIT 12                                *
            //****************************************************************************
            If (iST3 >= 4096) Then
              BEGIN
                vaMensagem := vaMensagem + ' Estado da gaveta = 1 - ';
                iST3 := iST3 - 4096;
              END;

            //****************************************************************************
            //                       TRATAMENTO DOS BITS 10 E 9                          *
            //****************************************************************************
            If (iST3 >= 1024) Then
              BEGIN
                flagB10 := true;
                iST3 := iST3 - 1024;
              END;

            If (iST3 >= 512) Then
              BEGIN
                flagB09 := true;
                iST3 := iST3 - 512;
              END;

            If ((flagB10 = True) And (flagB09 = True)) Then
              vaMensagem := vaMensagem + ' Leitura do MICR - '
            Else If ((flagB10 = True) And (flagB09 = False)) Then
              vaMensagem := vaMensagem + ' Estação Autenticação (TMH6000 e TMU675) - '
            Else If ((flagB10 = False) And (flagB09 = True)) Then
              vaMensagem := vaMensagem + ' Estação cheque - '
            Else If ((flagB10 = False) And (flagB09 = False)) Then
              vaMensagem := vaMensagem + ' Impressora Online - ';

            //****************************************************************************
            //                       TRATAMENTO DO BIT 8                                 *
            //****************************************************************************
            If (iST3 >= 256) Then
              BEGIN
                vaMensagem := vaMensagem + ' Aguardando retirada do papel - ';
                iST3 := iST3 - 256;
              END;

            //****************************************************************************
            //                       TRATAMENTO DO BIT 7                                 *
            //****************************************************************************
            If (iST3 >= 128) Then
              BEGIN
                vaMensagem := vaMensagem + ' Aguardando inserção do papel - ';
                iST3 := iST3 - 128;
              END;

            //****************************************************************************
            //                       TRATAMENTO DO BIT 6                                 *
            //****************************************************************************
            If (iST3 >= 64) Then
              BEGIN
                vaMensagem := vaMensagem + ' Estado do sensor inferior da estação de cheque = 1 - ';
                iST3 := iST3 - 64;
              END;

            //****************************************************************************
            //                       TRATAMENTO DO BIT 5                                 *
            //****************************************************************************
            If (iST3 >= 32) Then
              BEGIN
                vaMensagem := vaMensagem + ' Estado do sensor superior da estação do cheque = 1 - ';
                iST3 := iST3 - 32;
              END;

            //****************************************************************************
            //                       TRATAMENTO DO BIT 4                                 *
            //****************************************************************************
            If (iST3 >= 16) Then
              BEGIN
                vaMensagem := vaMensagem + ' Estado do sensor de autenticação = 1 - ';
                iST3 := iST3 - 16;
              END;

            //****************************************************************************
            //                       TRATAMENTO DO BIT 3                                 *
            //****************************************************************************
            If (iST3 >= 8) Then
              BEGIN
                vaMensagem := vaMensagem + ' Sem papel - ';
                iST3 := iST3 - 8;
              END;

            //****************************************************************************
            //                       TRATAMENTO DO BIT 2                                 *
            //****************************************************************************
            If (iST3 >= 4) Then
              BEGIN
                vaMensagem := vaMensagem + ' Pouco papel - ';
                iST3 := iST3 - 4;
              END;

            //****************************************************************************
            //                       TRATAMENTO DO BIT 1                                 *
            //****************************************************************************
            If (iST3 >= 2) Then
              BEGIN
                vaMensagem := vaMensagem + ' Sem papel - ';
                iST3 := iST3 - 2;
              END;

            //****************************************************************************
            //                       TRATAMENTO DO BIT 0                                 *
            //****************************************************************************
            If (iST3 >= 1) Then
              BEGIN
                vaMensagem := vaMensagem + ' Pouco papel - ';
              END;

            //==============================================================================
            //Estado fiscal
            //==============================================================================
            flagB15 := false;
            flagB14 := false;
            flagB11 := false;
            flagB10 := false;

            iST4 := StrToInt('$' + ST4);

            //****************************************************************************
            //                       TRATAMENTO DOS BITS 15 E 14                         *
            //****************************************************************************
            If (iST4 >= 32768) Then
              BEGIN
                flagB15 := true;
                iST4 := iST4 - 32768;
              END;

            If (iST4 >= 16384) Then
              BEGIN
                flagB14 := true;
                iST4 := iST4 - 16384;
              END;

            If ((flagB15 = True) And (flagB14 = True)) Then
              vaMensagem := vaMensagem + ' Modo Fiscalizado - '
            Else If ((flagB15 = True) And (flagB14 = False)) Then
              vaMensagem := vaMensagem + ' Modo manufatura (Não-Fiscalizado) - '
            Else If ((flagB15 = False) And (flagB14 = False)) Then
                vaMensagem := vaMensagem + ' Modo bloqueado - ';
            //****************************************************************************

            //****************************************************************************
            //                           TRATAMENTO DO BITS 12                           *
            //****************************************************************************
            If (iST4 >= 4096) Then
              BEGIN
                vaMensagem := vaMensagem + ' Modo de Intervenção Técnica - ';
                iST4 := iST4 - 4096;
              END
            Else
              vaMensagem := vaMensagem + ' Modo de operação normal - ';
            //****************************************************************************

            //****************************************************************************
            //                       TRATAMENTO DOS BITS 11 E 10                         *
            //****************************************************************************
            If (iST4 >= 2048) Then
              BEGIN
                flagB11 := true;
                iST4 := iST4 - 2048;
              END;

            If (iST4 >= 1024) Then
              BEGIN
                flagB10 := true;
                iST4 := iST4 - 1024;
              END;

            If ((flagB11 = True) And (flagB10 = True)) Then
              vaMensagem := vaMensagem + ' Erro de leitura/escrita da Memória Fiscal - '
            Else If ((flagB11 = True) And (flagB10 = False)) Then
              vaMensagem := vaMensagem + ' Memória Fiscal cheia - '
            Else If ((flagB11 = False) And (flagB10 = True)) Then
              vaMensagem := vaMensagem + ' Memória Fiscal em esgotamento - '
            Else If ((flagB11 = False) And (flagB10 = False)) Then
              vaMensagem := vaMensagem + ' Memória Fiscal em operação normal - ';
            //****************************************************************************

            //****************************************************************************
            //                           TRATAMENTO DO BIT7                              *
            //****************************************************************************
            If (iST4 >= 128) Then
              BEGIN
                vaMensagem := vaMensagem + ' Período de vendas aberto - ';
                iST4 := iST4 - 128;
              END
            ELSE
              vaMensagem := vaMensagem + ' Período de vendas fechado - ';
            //****************************************************************************

            //****************************************************************************
            //                       TRATAMENTO DOS BITS 3,2,1 E 0                       *
            //****************************************************************************
            If iST4 = 9 Then
              vaMensagem := vaMensagem + ' Cheque ou autenticação (TMH6000 e TMU675) - '
            Else If iST4 = 8 Then
              vaMensagem := vaMensagem + ' Comprovante Não-Fiscal - '
            Else If iST4 = 4 Then
              vaMensagem := vaMensagem + ' Relatório Gerencial - '
            Else If iST4 = 3 Then
              vaMensagem := vaMensagem + ' Estorno de Comprovante de Crédito ou Débito - '
            Else If iST4 = 2 Then
              vaMensagem := vaMensagem + ' Comprovante de Crédito ou Débito - '
            Else If iST4 = 1 Then
              vaMensagem := vaMensagem + ' Cupom Fiscal aberto - '
            Else If iST4 = 0 Then
              vaMensagem := vaMensagem + ' Documento fechado - ';
            //****************************************************************************

            //==============================================================================
            //Estado de execução do último comando
            //==============================================================================
            ST5 := UpperCase(ST5);
            iST5 := StrToInt('$' + ST5);
            vaResult := Result;
            Result := False;
            vaMensagem := vaMensagem + #13#10; 
            Case iST5 of
              $0000: begin
                       vaMensagem := vaMensagem + 'Resultado sem erro';
                       Result := vaResult;
                     end;
              $0001: vaMensagem := vaMensagem + 'Erro interno';
              $0002: vaMensagem := vaMensagem + 'Erro de iniciação do equipamento';
              $0003: vaMensagem := vaMensagem + 'Erro de processo interno';
              $0101: vaMensagem := vaMensagem + 'Comando inválido para o estado atual';
              $0102: vaMensagem := vaMensagem + 'Comando inválido para o documento atual';
              $0106: vaMensagem := vaMensagem + 'Comando aceito apenas fora de intervenção';
              $0107: vaMensagem := vaMensagem + 'Comando aceito apenas dentro de intervenção';
              $0108: vaMensagem := vaMensagem + 'Comando inválido durante processo de scan';
              $0109: vaMensagem := vaMensagem + 'Excesso de intervenções';
              $0201: vaMensagem := vaMensagem + 'Comando com frame inválido';
              $0202: vaMensagem := vaMensagem + 'Comando inválido';
              $0203: vaMensagem := vaMensagem + 'Campos em excesso';
              $0204: vaMensagem := vaMensagem + 'Campos em falta';
              $0205: vaMensagem := vaMensagem + 'Campo não opcional';
              $0206: vaMensagem := vaMensagem + 'Campo alfanumérico inválido';
              $0207: vaMensagem := vaMensagem + 'Campo alfabético inválido';
              $0208: vaMensagem := vaMensagem + 'Campo numérico inválido';
              $0209: vaMensagem := vaMensagem + 'Campo binário inválido';
              $020A: vaMensagem := vaMensagem + 'Campo imprimível inválido';
              $020B: vaMensagem := vaMensagem + 'Campo hexadecimal inválido';
              $020C: vaMensagem := vaMensagem + 'Campo data inválido';
              $020D: vaMensagem := vaMensagem + 'Campo hora inválido';
              $020E: vaMensagem := vaMensagem + 'Campo com atributos de impressão inválidos';
              $020F: vaMensagem := vaMensagem + 'Campo booleano inválido';
              $0210: vaMensagem := vaMensagem + 'Campo com tamanho inválido';
              $0211: vaMensagem := vaMensagem + 'Extensão de comando inválida';
              $0212: vaMensagem := vaMensagem + 'Código de barra não permitido';
              $0213: vaMensagem := vaMensagem + 'Atributos de impressão não permitidos';
              $0214: vaMensagem := vaMensagem + 'Atributos de impressão inválidos';
              $0215: vaMensagem := vaMensagem + 'Código de barras incorretamente definido';
              $0217: vaMensagem := vaMensagem + 'Comando invalido para a porta selecionada';
              $0301: vaMensagem := vaMensagem + 'Erro de hardware';
              $0302: vaMensagem := vaMensagem + 'Impressora não está pronta';
              $0303: vaMensagem := vaMensagem + 'Erro de Impressão';
              $0304: vaMensagem := vaMensagem + 'Falta de papel';
              $0305: vaMensagem := vaMensagem + 'Pouco papel disponível';
              $0306: vaMensagem := vaMensagem + 'Erro em carga ou expulsão do papel';
              $0307: vaMensagem := vaMensagem + 'Característica não suportada pela impressora';
              $0308: vaMensagem := vaMensagem + 'Erro de display';
              $0309: vaMensagem := vaMensagem + 'Seqüência de scan inválida';
              $300A: vaMensagem := vaMensagem + 'Número de área de recorte inválido';
              $300B: vaMensagem := vaMensagem + 'Scanner não preparado';
              $300C: vaMensagem := vaMensagem + 'Qualidade de Logotipo não suportada pela impressora';
              $030E: vaMensagem := vaMensagem + 'Erro de leitura do microcódigo';
              $0401: vaMensagem := vaMensagem + 'Número de série inválido';
              $0402: vaMensagem := vaMensagem + 'Requer dados de fiscalização já configurados';
              $0501: vaMensagem := vaMensagem + 'Data / Hora não configurada';
              $0502: vaMensagem := vaMensagem + 'Data inválida';
              $0503: vaMensagem := vaMensagem + 'Data em intervalo inválido';
              $0504: vaMensagem := vaMensagem + 'Nome operador inválido';
              $0505: vaMensagem := vaMensagem + 'Número de caixa inválido';
              $0508: vaMensagem := vaMensagem + 'Dados de Cabeçalho ou rodapé inválidos';
              $0509: vaMensagem := vaMensagem + 'Excesso de fiscalização';
              $500C: vaMensagem := vaMensagem + 'Número máximo de meios de pagamento já definidos';
              $050D: vaMensagem := vaMensagem + 'Meio de pagamento já definido';
              $050E: vaMensagem := vaMensagem + 'Meio de pagamento inválido';
              $050F: vaMensagem := vaMensagem + 'Descrição do meio de pagamento inválido';
              $0510: vaMensagem := vaMensagem + 'Valor máximo de desconto inválido';
              $0513: vaMensagem := vaMensagem + 'Logotipo do usuário inválido';
              $0514: vaMensagem := vaMensagem + 'Seqüência de logotipo inválido';
              $0515: vaMensagem := vaMensagem + 'Configuração de display inválida';
              $0516: vaMensagem := vaMensagem + 'Dados do MICR inválidos';
              $0517: vaMensagem := vaMensagem + 'Campo de endereço inválido';
              $0518: vaMensagem := vaMensagem + 'Nome da loja não definido';
              $0519: vaMensagem := vaMensagem + 'Dados fiscais não definidos';
              $510A: vaMensagem := vaMensagem + 'Número seqüencial do ECF inválido';
              $510B: vaMensagem := vaMensagem + 'Simbologia do GT inválida, devem ser todos diferentes';
              $510C: vaMensagem := vaMensagem + 'Número de CNPJ inválido';
              $051D: vaMensagem := vaMensagem + 'Senha de fiscalização inválida';
              $051E: vaMensagem := vaMensagem + 'Último documento deve ser uma redução Z';
              $051F: vaMensagem := vaMensagem + 'Símbolo da moeda igual ao atualmente cadastrado';
              $0520: vaMensagem := vaMensagem + 'Identificação da alíquota não cadastrada';
              $0521: vaMensagem := vaMensagem + 'Alíquota não cadastrada';
              $0601: vaMensagem := vaMensagem + 'Memória de Fita-detalhe esgotada';
              $0605: vaMensagem := vaMensagem + 'Número de série invalido para a Memória de Fita-detalhe';
              $0606: vaMensagem := vaMensagem + 'Memória de Fita-detalhe não iniciada';
              $0607: vaMensagem := vaMensagem + 'Memória de Fita-detalhe não pode estar iniciada';
              $0608: vaMensagem := vaMensagem + 'Número de série da Memória de Fita-detalhe não confere';
              $0609: vaMensagem := vaMensagem + 'Erro Interno na Memória de Fita-detalhe';
              $0701: vaMensagem := vaMensagem + 'Valor inválido para o número do registro';
              $0702: vaMensagem := vaMensagem + 'Valor inválido para o número do item';
              $0703: vaMensagem := vaMensagem + 'Intervalo inválido para a leitura da MFD';
              $0704: vaMensagem := vaMensagem + 'Número de usuário inválido para MFD';
              $0801: vaMensagem := vaMensagem + 'Comando inválido com jornada fiscal fechada';
              $0802: vaMensagem := vaMensagem + 'Comando inválido com jornada fiscal aberta';
              $0803: vaMensagem := vaMensagem + 'Memória Fiscal esgotada';
              $0804: vaMensagem := vaMensagem + 'Jornada fiscal deve ser fechada';
              $0805: vaMensagem := vaMensagem + 'Não há meios de pagamento definidos';
              $0806: vaMensagem := vaMensagem + 'Excesso de meios de pagamento utilizados na jornada fiscal';
              $0807: vaMensagem := vaMensagem + 'Jornada fiscal sem movimento de vendas';
              $0808: vaMensagem := vaMensagem + 'Intervalo de jornada fiscal inválido';
              $0809: vaMensagem := vaMensagem + 'Existem mais dados para serem lidos';
              $800A: vaMensagem := vaMensagem + 'Não existem mais dados para serem lidos';
              $800B: vaMensagem := vaMensagem + 'Não pode abrir jornada fiscal';
              $800C: vaMensagem := vaMensagem + 'Não pode fechar jornada fiscal';
              $080D: vaMensagem := vaMensagem + 'Limite máximo do período fiscal atingido';
              $080E: vaMensagem := vaMensagem + 'Limite máximo do período fiscal não atingido';
              $080F: vaMensagem := vaMensagem + 'Abertura da jornada fiscal não permitida';
              $0901: vaMensagem := vaMensagem + 'Valor muito grande';
              $0902: vaMensagem := vaMensagem + 'Valor muito pequeno';
              $0903: vaMensagem := vaMensagem + 'Itens em excesso';
              $0904: vaMensagem := vaMensagem + 'Alíquotas em excesso';
              $0905: vaMensagem := vaMensagem + 'Desconto ou acréscimos em excesso';
              $0906: vaMensagem := vaMensagem + 'Meios de pagamento em excesso';
              $0907: vaMensagem := vaMensagem + 'Item não encontrado';
              $0908: vaMensagem := vaMensagem + 'Meio de pagamento não encontrado';
              $0909: vaMensagem := vaMensagem + 'Total nulo';
              $900C: vaMensagem := vaMensagem + 'Tipo de pagamento não definido';
              $090F: vaMensagem := vaMensagem + 'Alíquota não encontrada';
              $0910: vaMensagem := vaMensagem + 'Alíquota inválida';
              $0911: vaMensagem := vaMensagem + 'Excesso de meios de pagamento com CDC';
              $0912: vaMensagem := vaMensagem + 'Meio de pagamento com CDC já emitido';
              $0913: vaMensagem := vaMensagem + 'Meio de pagamento com CDC ainda não emitido';
              $0914: vaMensagem := vaMensagem + 'Leitura da Memória Fiscal – intervalo CRZ inválido';
              $0915: vaMensagem := vaMensagem + 'Leitura da Memória Fiscal – intervalo de data inválido';
              $0A01: vaMensagem := vaMensagem + 'Operação não permitida após desconto / acréscimo';
              $0A02: vaMensagem := vaMensagem + 'Operação não permitida após registro de pagamentos';
              $0A03: vaMensagem := vaMensagem + 'Tipo de item inválido';
              $0A04: vaMensagem := vaMensagem + 'Linha de descrição em branco';
              $0A05: vaMensagem := vaMensagem + 'Quantidade muito pequena';
              $0A06: vaMensagem := vaMensagem + 'Quantidade muito grande';
              $0A07: vaMensagem := vaMensagem + 'Total do item com valor muito alto';
              $0A08: vaMensagem := vaMensagem + 'Operação não permitida antes do registro de pagamentos';
              $0A09: vaMensagem := vaMensagem + 'Registro de pagamento incompleto';
              $0A0A: vaMensagem := vaMensagem + 'Registro de pagamento finalizado';
              $0A0B: vaMensagem := vaMensagem + 'Valor pago inválido';
              $0A0C: vaMensagem := vaMensagem + 'Valor de desconto ou acréscimo não permitido';
              $0A0E: vaMensagem := vaMensagem + 'Valor não pode ser zero';
              $0A0F: vaMensagem := vaMensagem + 'Operação não permitida antes do registro de itens';
              $0A11: vaMensagem := vaMensagem + 'Cancelamento de desconto e acréscimo somente para item atual';
              $0A12: vaMensagem := vaMensagem + 'Não foi possível cancelar último Cupom Fiscal';
              $0A13: vaMensagem := vaMensagem + 'Último Cupom Fiscal não encontrado';
              $0A14: vaMensagem := vaMensagem + 'Último Comprovante Não-Fiscal não encontrado';
              $0A15: vaMensagem := vaMensagem + 'Cancelamento de CDC necessária';
              $0A16: vaMensagem := vaMensagem + 'Número de item em Cupom Fiscal inválido';
              $0A17: vaMensagem := vaMensagem + 'Operação somente permitida após subtotalização';
              $0A18: vaMensagem := vaMensagem + 'Operação somente permitida durante a venda de itens';
              $0A19: vaMensagem := vaMensagem + 'Operação não permitida em item com desconto ou acréscimo';
              $0A1A: vaMensagem := vaMensagem + 'Dígitos de quantidade inválidos';
              $0A1B: vaMensagem := vaMensagem + 'Dígitos de valor unitário inválido';
              $0A1C: vaMensagem := vaMensagem + 'Não há desconto ou acréscimo a cancelar';
              $0A1D: vaMensagem := vaMensagem + 'Não há item para cancelar';
              $0A1E: vaMensagem := vaMensagem + 'Desconto ou acréscimo somente no item atual';
              $0A1F: vaMensagem := vaMensagem + 'Desconto ou acréscimo já efetuado';
              $0A20: vaMensagem := vaMensagem + 'Desconto ou acréscimo nulo não permitido';
              $0A21: vaMensagem := vaMensagem + 'Valor unitário inválido';
              $0A22: vaMensagem := vaMensagem + 'Quantidade inválida';
              $0A23: vaMensagem := vaMensagem + 'Código de item inválido';
              $0A24: vaMensagem := vaMensagem + 'Descrição inválida';
              $0A25: vaMensagem := vaMensagem + 'Operação de desconto ou acréscimo não permitida';
              $0A26: vaMensagem := vaMensagem + 'Mensagem promocional já impressa';
              $0A27: vaMensagem := vaMensagem + 'Linhas adicionais não podem ser impressas';
              $0A28: vaMensagem := vaMensagem + 'Dados do consumidor já impresso';
              $0A29: vaMensagem := vaMensagem + 'Dados do consumidor somente no fim do documento';
              $0A2A: vaMensagem := vaMensagem + 'Dados do consumidor somente no inicio do documento';
              $0A2B: vaMensagem := vaMensagem + 'Comando Inválido para o item';
              $0E01: vaMensagem := vaMensagem + 'Número de linhas em documento excedido';
              $0E02: vaMensagem := vaMensagem + 'Número do relatório inválido';
              $0E03: vaMensagem := vaMensagem + 'Operação não permitida após registro de itens';
              $0E04: vaMensagem := vaMensagem + 'Registro de valor nulo não permitido';
              $0E05: vaMensagem := vaMensagem + 'Não há desconto a cancelar';
              $0E06: vaMensagem := vaMensagem + 'Não há acréscimo a cancelar';
              $0E07: vaMensagem := vaMensagem + 'Operação somente permitida após subtotalização';
              $0E08: vaMensagem := vaMensagem + 'Operação somente permitida durante registro de itens';
              $0E09: vaMensagem := vaMensagem + 'Operação não-fiscal inválida';
              $0E0A: vaMensagem := vaMensagem + 'Último comprovante Não-Fiscal não encontrado';
              $0E0B: vaMensagem := vaMensagem + 'Meio de pagamento não encontrado';
              $0E0C: vaMensagem := vaMensagem + 'Não foi possível imprimir nova via';
              $0E0D: vaMensagem := vaMensagem + 'Não foi possível realizar reimpressão';
              $0E0E: vaMensagem := vaMensagem + 'Não foi possível imprimir nova parcela';
              $0E0F: vaMensagem := vaMensagem + 'Não há mais parcelas a imprimir';
              $0E10: vaMensagem := vaMensagem + 'Registro de item Não-Fiscal inválido';
              $0E11: vaMensagem := vaMensagem + 'Desconto ou acréscimo já efetuado';
              $0E12: vaMensagem := vaMensagem + 'Valor de desconto ou acréscimo inválido';
              $0E13: vaMensagem := vaMensagem + 'Não foi possível cancelar o item';
              $0E14: vaMensagem := vaMensagem + 'Itens em excesso';
              $0E15: vaMensagem := vaMensagem + 'Operação Não-Fiscal não cadastrada';
              $0E16: vaMensagem := vaMensagem + 'Excesso de relatórios / operações não-fiscais cadastradas';
              $0E17: vaMensagem := vaMensagem + 'Relatório não encontrado';
              $0E18: vaMensagem := vaMensagem + 'Comando não permitido';
              $0E19: vaMensagem := vaMensagem + 'Comando não permitido em operações não-fiscais para movimento de monetário';
              $0E1A: vaMensagem := vaMensagem + 'Comando permitido apenas em operações não-fiscais para movimento de monetário';
              $0E1B: vaMensagem := vaMensagem + 'Número de parcelas inválido para a emissão de CCD';
              $0E1C: vaMensagem := vaMensagem + 'Operação não fiscal já cadastrada';
              $0E1D: vaMensagem := vaMensagem + 'Relatório gerencial já cadastrado';
              $0E1E: vaMensagem := vaMensagem + 'Relatório Gerencial Inválido';
              $3001: vaMensagem := vaMensagem + 'Configuração de cheque não registrada';
              $3002: vaMensagem := vaMensagem + 'Configuração de cheque não encontrada';
              $3003: vaMensagem := vaMensagem + 'Valor do cheque já impresso';
              $3004: vaMensagem := vaMensagem + 'Nominal ao cheque já impresso';
              $3005: vaMensagem := vaMensagem + 'Linhas adicionais no cheque já impresso';
              $3006: vaMensagem := vaMensagem + 'Autenticação já impressa';
              $3007: vaMensagem := vaMensagem + 'Número máximo de autenticações já impresso';
              else   vaMensagem := vaMensagem + 'Erro desconhecido';
            end;
            //==============================================================================
          end;
        if not(Result) then
          begin
            MessageTela(True, False, Trim(vaMensagem), 0);
          end;
      end
    else
      MessageTela(True, False, 'Retorno da Impressora não programado para ECF ' + Modelo_ECF + '.',0);
end;

function Exec_Testa_Modelo_Impressora(Modelo_ECF : String) : String;
var
  iConta, iRetorno : Integer;
  cModeloImp : String;
begin
  Result := '';
  if Modelo_ECF = 'BEMATECH MP20 FI II' then
    begin
      for iConta := 1 to 10 do
        cModeloImp := cModeloImp + ' ';
      iRetorno := Bematech_FI_ModeloImpressora( cModeloImp );
      Analisa_iRetorno(Modelo_ECF);
      Retorno_Impressora(Modelo_ECF);
      if iRetorno = 1 then//tudo certo;
        Result := Trim(cModeloImp);
    end
  else
    MessageTela(True, False, 'Software não programado para Exec_Testa_Modelo_Impressora no ECF Modelo ' + Modelo_ECF,0);
end;

function Exec_ImpressoraLigada(Modelo_ECF : String) : Boolean;
var
  iConta  : Integer;
  szDados : String;
begin
  Result := False;
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') then
    begin
      if (Modelo_ECF = 'BEMATECH MP20 FI II') then
        iRetorno := Bematech_FI_VerificaImpressoraLigada()
      else
        if (Modelo_ECF = 'SWEDA ST100') then
          iRetorno := ECF_VerificaImpressoraLigada();
      case iRetorno of
        0 : MessageTela(True, False, 'Erro de Comunicação!',0);
        1 : Result := True;
        -4: MessageTela(True, False, 'O arquivo de inicialização BemaFI32.ini não foi encontrado.',0);
        -5: MessageTela(True, False, 'Erro ao abrir a porta de comunicação.',0);
        -6: MessageTela(True, False, 'Impressora desligada ou cabo de comunicação desconectado.'+#13#10+ 'Favor Verificar.',0);
      end;
    end
  else
    if (Modelo_ECF = 'SWEDA 9000') then
      begin
        StrPCopy(Comando,#27+'.23}'); // Status da Impressora
        Resposta := EnviaComando(Comando);
        Result := Analiza_Resposta_SerSweda(Resposta);
      end
    else
      if Modelo_ECF = 'EPSON TM-T81 FBII' then
        begin
          for iConta := 1 to 20 do
            szDados := szDados + ' ';

          iRetorno := EPSON_Obter_Estado_Impressora(PChar(szDados));
          Result := Retorno_Impressora(Modelo_ECF);
        end
      else
        MessageTela(True, False, 'Software não programado para Exec_ImpressoraLigada no Modelo ECF ' + Modelo_ECF,0);
end;

function Exec_ProgramaTruncamento(Modelo_ECF : String) : Boolean;
begin
  Result := False;
  if Modelo_ECF = 'BEMATECH MP20 FI II' then
    begin
      iRetorno := Bematech_FI_ProgramaTruncamento();
      Analisa_iRetorno(Modelo_ECF);
      Retorno_Impressora(Modelo_ECF);
      if iRetorno = 1 then//tudo certo
        Result := True;
    end
  else
    MessageTela(True, False, 'Software não programado para Exec_ProgramaTruncamento no Modelo ECF ' + Modelo_ECF,0);
end;

function Exec_ProgramaArredondamento(Modelo_ECF : String) : Boolean;
begin
  Result := False;
  if Modelo_ECF = 'BEMATECH MP20 FI II' then
    begin
      iRetorno := Bematech_FI_ProgramaArredondamento();
      Analisa_iRetorno(Modelo_ECF);
      Retorno_Impressora(Modelo_ECF);
      if iRetorno = 1 then//tudo certo
        Result := True;
    end
  else
    MessageTela(True, False, 'Software não programado para Exec_ProgramaArredondamento no Modelo ECF ' + Modelo_ECF,0);
end;

function Exec_TestaTruncamento(Modelo_ECF : String) : String;
var
  va_Tipo_Impressora, sModo: string;
  iConta: integer;
begin
  Result := '';
  if Modelo_ECF = 'BEMATECH MP20 FI II' then
    begin
      //vamos testar qual impressora esta sendo utilizada para ver se a impressora só faz truncamento
      va_Tipo_Impressora := Exec_Testa_Modelo_Impressora(Modelo_ECF);
      if (va_Tipo_Impressora = 'EMULADOR') or
         (va_Tipo_Impressora = 'MP25FI') or
         (va_Tipo_Impressora = 'MP50FI') or
         (va_Tipo_Impressora = 'MP2000FI') or
         (va_Tipo_Impressora = 'MP6000FI') then//essas impressora somente operam em modo truncamento.
        Result := 'SIM'
      else
        begin
          for iConta := 1 to 2 do
            sModo := sModo + ' ';
          iRetorno := Bematech_FI_VerificaTruncamento( sModo );
          if copy( sModo,1,1 ) = '1' then
            Result := 'SIM'
          else
            Result := 'NÃO';
          Analisa_iRetorno(Modelo_ECF);
          Retorno_Impressora(Modelo_ECF);
        end;
    end
  else
    if Modelo_ECF = 'SWEDA ST100' then
      begin
        for iConta := 1 to 2 do
          sModo := sModo + ' ';
        iRetorno := ECF_VerificaTruncamento( sModo );
        if copy( sModo,1,1 ) = '1' then
          Result := 'SIM'
        else
          Result := 'NÃO';
        Analisa_iRetorno(Modelo_ECF);
        Retorno_Impressora(Modelo_ECF);
      end
    else
      MessageTela(True, False, 'Software não programado para Exec_TestaTruncamento no Modelo ECF ' + Modelo_ECF,0);
end;

procedure ECF_Pouco_Papel_Aberto(Modelo_ECF : String; var Pouco_Papel, Aberto : Boolean);
var
  iACK, iST1, iST2 : Integer;
  //variaveis para impressora epson
  iConta   : Integer;
  szEstado : String;
begin
  Aberto := False;
  Pouco_Papel := False;
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') then
    begin
      iACK := 0;
      iST1 := 0;
      iST2 := 0;
      if (Modelo_ECF = 'BEMATECH MP20 FI II') then
        iRetorno_Impressora := Bematech_FI_VerificaEstadoImpressora(iACK, iST1, iST2)
      else
        if (Modelo_ECF = 'SWEDA ST100') then
          iRetorno_Impressora := ECF_VerificaEstadoImpressora(iACK, iST1, iST2);
      if iACK = 6 then
        begin
          if iST1 >= 64 then
            begin
              Pouco_Papel := True;
              iST1 := iST1 - 64;
            end;
          if iST1 = 2 then
            Aberto := True;
        end;
    end
  else
    if Modelo_ECF = 'SWEDA 9000' then
      begin
        StrPCopy(Comando,#27+'.23}'); // Status da Impressora
        Resposta := EnviaComando(Comando);
        if copy(Resposta,1,2) = '.+' then
          begin
            if Copy(Resposta,6,1) = '5' then
              Pouco_Papel := True
            else
              Pouco_Papel := False
          end
        else
          Analiza_Resposta_SerSweda(Resposta);

        StrPCopy(Comando,#27+'.28}'); // Status da impressora completo
        Resposta := EnviaComando(Comando);
        if copy(Resposta,1,2) = '.+' then
          begin
            if (copy(Resposta,10,1) = 'P') then
              Aberto := True
            else
              Aberto := False;
          end
        else
          Analiza_Resposta_SerSweda(Resposta);
      end
    else
      if Modelo_ECF = 'EPSON TM-T81 FBII' then
        begin
          // vamos testar se tem cupom fiscal aberto.
          for iConta := 1 to 57 do
            szEstado := szEstado + ' ';

          iRetorno := EPSON_Obter_Estado_Cupom(PChar(szEstado));
          if Trim(szEstado) <> '' then
            Aberto := not(Trim(szEstado) = '00');
        end
      else
        MessageTela(True, False, 'Software não programado para ECF_Pouco_Papel_Aberto no Modelo ECF ' + Modelo_ECF,0);
end;

function ECF_CarregaIndicesISS(Modelo_ECF : String) : String;
var DAta: String;
    iConta: integer;
Begin
  Result := '';
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') then
    begin
      for iConta := 1 to 79 do
        Data := Data + ' ';

      if (Modelo_ECF = 'BEMATECH MP20 FI II') then
        iRetorno := Bematech_FI_VerificaIndiceAliquotasIss( Data )
      else
        if Modelo_ECF = 'SWEDA ST100' then
          iRetorno := ECF_VerificaAliquotasIss( Data );

      Analisa_iRetorno(Modelo_ECF);
      Retorno_Impressora(Modelo_ECF);
      if iRetorno = 1 then//tudo certo
        Result := Trim(Data);
    end
  else
    MessageTela(True, False, 'Soft não programado para o Modelo de ECF - ' + Modelo_ECF,0);
end;

function ECF_CarregaAliquotas(Modelo_ECF : String) : String;
var cAliquotas: String;
    iConta: Integer;
begin
  Result := '';
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') then
    begin
      For iConta := 1 To 79 Do
        cAliquotas := cAliquotas + ' ';

      if (Modelo_ECF = 'BEMATECH MP20 FI II') then
        iRetorno := Bematech_FI_RetornoAliquotas( cAliquotas )
      else
        if Modelo_ECF = 'SWEDA ST100' then
          iRetorno := ECF_RetornoAliquotas( cAliquotas );

      Analisa_iRetorno(Modelo_ECF);
      Retorno_Impressora(Modelo_ECF);
      if iRetorno = 1 then//tudo certo
        Result := Trim(cAliquotas);
    end
  else
    MessageTela(True, False, 'Soft não programado para ECF_CarregaAliquotas com o Modelo de ECF - ' + Modelo_ECF,0);
end;

function ECF_ProgramaFormaPagmento(Modelo_ECF, ipPosicao, FormaPagto, Normal_TEF : String) : String;
begin
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') then
    begin
      if (Modelo_ECF = 'BEMATECH MP20 FI II') then
        iRetorno := Bematech_FI_ProgramaFormaPagamentoMFD(FormaPagto, Normal_TEF)
      else
        if Modelo_ECF = 'SWEDA ST100' then
          iRetorno := ECF_ProgramaFormaPagamentoMFD(FormaPagto, Normal_TEF);
      Analisa_iRetorno(Modelo_ECF);
      Retorno_Impressora(Modelo_ECF);
      if iRetorno = 1 then//Retorno 1 = tudo certo.
        ECF_ProgramaFormaPagmento := 'OK';
    end
  else
    if (Modelo_ECF = 'EPSON TM-T81 FBII') then
      begin
        if Normal_TEF = '0' then
          iRetorno := EPSON_Config_Forma_Pagamento(False, PChar(ipPosicao), PChar(FormaPagto))
        else
          iRetorno := EPSON_Config_Forma_Pagamento(True, PChar(ipPosicao), PChar(FormaPagto));
        if Retorno_Impressora(Modelo_ECF) then
          ECF_ProgramaFormaPagmento := 'OK';
      end
    else
      MessageTela(True, False, 'Soft não programado para o Modelo de ECF - ' + Modelo_ECF,0);
end;

function ECF_Testa_Gaveta(Modelo_ECF, Invertido : String) : String;
var
  vEstadoGaveta : Integer;
begin
  ECF_Testa_Gaveta := 'ERRO';
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') then
    begin
      vEstadoGaveta := 0;
      if (Modelo_ECF = 'BEMATECH MP20 FI II') then
        iRetorno := Bematech_FI_VerificaEstadoGaveta(vEstadoGaveta)
      else
        if (Modelo_ECF = 'SWEDA ST100') then
          iRetorno := ECF_VerificaEstadoGaveta(vEstadoGaveta);
      Analisa_iRetorno(Modelo_ECF);
      Retorno_Impressora(Modelo_ECF);
      if iRetorno = 1 then//Tudo certo
        begin
          if Invertido = 'SIM' then
            if vEstadoGaveta = 0 then
              vEstadoGaveta := 1
            else
              if vEstadoGaveta = 1 then
                vEstadoGaveta := 0;
          case vEstadoGaveta of
            0 : ECF_Testa_Gaveta := 'ABERTA';
            1 : ECF_Testa_Gaveta := 'FECHADA';
          else
            begin
              ECF_Testa_Gaveta := 'NÃO DEFINIDO';
              MessageTela(True, False, 'Não foi possível definir o Estado da Gaveta.',0);
            end;
          end;
        end;
    end
  else
    if Modelo_ECF = 'SWEDA 9000' then
      begin
        StrPCopy(Comando,#27+'.22}'); // Status da Gaveta
        Resposta := EnviaComando(Comando);
        if copy(Resposta,1,2) = '.+' then
          begin
            if Resposta = '.+G001}' then
              ECF_Testa_Gaveta := 'FECHADA'
            else
              if Resposta = '.+G000}' then
                ECF_Testa_Gaveta := 'ABERTA'
              else
                ECF_Testa_Gaveta := 'NÃO DEFINIDO';
          end
        else
          Analiza_Resposta_SerSweda(Resposta);
      end
    else
      MessageTela(True, False, 'Soft não programado para ECF_Testa_Gaveta no Modelo de ECF - ' + Modelo_ECF,0);
end;

// -------- Retorno do Número de Série da Impressora --------------------
function PegaNumerodeSerie(Modelo_ECF : String) : String;
var
  va_Tipo_Impressora, cNumeroSerie : String;
  iConta : Integer;
Begin
  PegaNumerodeSerie := '';
  if Modelo_ECF = 'BEMATECH MP20 FI II' then
    begin
      // reserva 20 bytes para a variável
      for iConta := 1 To 20 Do
        cNumeroSerie := cNumeroSerie + ' ';
      va_Tipo_Impressora := Exec_Testa_Modelo_Impressora(Modelo_ECF);
      if (va_Tipo_Impressora = 'MP2000FI') or
         (va_Tipo_Impressora = 'MP2100FI') or
         (va_Tipo_Impressora = 'MP6000FI') or
         (va_Tipo_Impressora = 'MP3000FI') then
        iRetorno := Bematech_FI_NumeroSerieMFD( cNumeroSerie )
      else
        iRetorno := Bematech_FI_NumeroSerie( cNumeroSerie );
      Analisa_iRetorno(Modelo_ECF);
      Retorno_Impressora(Modelo_ECF);
      if iRetorno = 1 then//tudo certo
        PegaNumerodeSerie := Trim(cNumeroSerie);
    end
  else
    if Modelo_ECF = 'SWEDA ST100' then
      begin
        for iConta := 1 to 20 do
          cNumeroSerie := cNumeroSerie + ' ';
        iRetorno := ECF_NumeroSerieMFD(cNumeroSerie);
        Analisa_iRetorno(Modelo_ECF);
        Retorno_Impressora(Modelo_ECF);
        if iRetorno = 1 then//tudo certo
          PegaNumerodeSerie := Trim(cNumeroSerie);
      end
    else
      if Modelo_ECF = 'SWEDA 9000' then
        begin
          StrPCopy(Comando,#27+'.27H}'); // Vamos pegar as informações da impressora
          Resposta := EnviaComando(Comando);
          if Analiza_Resposta_SerSweda(Resposta) then
            if Copy(Resposta,1,3) = '.+C' then
              PegaNumerodeSerie := Trim(Copy(Resposta,8,21));
        end
      else
        if Modelo_ECF = 'EPSON TM-T81 FBII' then
          begin
            for iConta := 1 to 110 do
              cNumeroSerie := cNumeroSerie + ' ';

            iRetorno := EPSON_Obter_Dados_Impressora(PChar(cNumeroSerie));
            PegaNumerodeSerie := Copy(Trim(cNumeroSerie),1,20);
          end
        else
          MessageTela(True, False, 'Soft não programado para PegaNumerodeSerie com Modelo de ECF - ' + Modelo_ECF, 0);
End;

function PegaNumerodoCupom(Modelo_ECF : String) : Integer;
var
  cNumeroCupom : String;
  iConta       : Integer;
begin
  PegaNumerodoCupom := 0;
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') then
    begin
      for iConta := 1 to 6 do
        cNumeroCupom := cNumeroCupom + ' ';
      if (Modelo_ECF = 'BEMATECH MP20 FI II') then
        iRetorno := Bematech_FI_NumeroCupom( cNumeroCupom )
      else
        if (Modelo_ECF = 'SWEDA ST100') then
          iRetorno := Ecf_NumeroCupom( cNumeroCupom );
      Analisa_iRetorno(Modelo_ECF);
      Retorno_Impressora(Modelo_ECF);
      if iRetorno = 1 then//tudo certo
        begin//vamos testar aqui se existe o arquivo c:\yes.txt então tem que colocar o número para negativo isso para colocar no padrao de utilizar MP6000 quando passa no esquema.
          if FileExists('c:\yes.txt') then
            PegaNumerodoCupom := StrToInt(cNumeroCupom) * -1
          else
            PegaNumerodoCupom := StrToInt(cNumeroCupom)
        end;
    end
  else
    if Modelo_ECF = 'SWEDA 9000' then
      begin
        StrPCopy(Comando,#27+'.27H}'); // Status da Impressora com ESC 27
        Resposta := EnviaComando(Comando);
        if Analiza_Resposta_SerSweda(Resposta) then
          if Copy(Resposta,1,3) = '.+C' then
            begin
              if Copy(Resposta,41,8) = '00000000' then
                PegaNumerodoCupom := StrToInt(Copy(Resposta,73,6)) * -1
              else
                PegaNumerodoCupom := StrToInt(Copy(Resposta,73,6));
            end;
      end
    else
      if Modelo_ECF = 'EPSON TM-T81 FBII' then
        begin
          for iConta := 1 to 100 do
            cNumeroCupom := cNumeroCupom + ' ';
          iRetorno := EPSON_Obter_Contadores(PChar(cNumeroCupom));
          if Retorno_Impressora(Modelo_ECF) then
            begin//vamos testar aqui se existe o arquivo c:\yes.txt então tem que colocar o número para negativo isso para colocar no padrao de utilizar MP6000 quando passa no esquema.
              if FileExists('c:\yes.txt') then
                PegaNumerodoCupom := StrToInt(Copy(cNumeroCupom,1,6)) * -1
              else
                PegaNumerodoCupom := StrToInt(Copy(cNumeroCupom,1,6))
            end;
        end
      else
        MessageTela(True, False, 'Soft não programado para PegaNumerodoCupom no Modelo de ECF - ' + Modelo_ECF,0);
End;

function TruncDec(Valor : Double; Casas : Integer) : Double;
var
  I, PosVir : Integer;
begin
  PosVir := 0;
//Encontrar Virgula;
  for I := 1 to Length(FloatToStr(Valor)) do
    if Copy(FloatToStr(Valor),I,1) = ',' then
      PosVir := I;
  if PosVir = 0 then
    TruncDec := Valor
  else                    (*Antes da virgula                          /* Depois da virgula com qtde casas*)
    TruncDec := StrToFloat(Copy(FloatToStr(Valor),1,PosVir -1) + ','+ Copy(FloatToStr(Valor),PosVir + 1,Casas));
end;

function ErroSchalter(CRetorno:Integer): String;
var
  MensagemErro: String;
begin
  case CRetorno of
    0:MensagemErro:='Comando OK';
    1:MensagemErro:='Erro de checksum';
    2:MensagemErro:='Timeout RX';
    3:MensagemErro:='Memória insuficiente';
    4:MensagemErro:='Impressora fora de linha ou desligada';
    10:MensagemErro:='Erro de sobreposição';
    11:MensagemErro:='Erro de paridade';
    12:MensagemErro:='Erro de sobreposição e paridade';
    13:MensagemErro:='Erro de formato';
    14:MensagemErro:='Erro de sobreposição e formato';
    15:MensagemErro:='Erro de paridade e sobreposição';
    16:MensagemErro:='Erro de sobreposição, paridade e formato';
    20:MensagemErro:='Erro no cadastro de bancos';
    21:MensagemErro:='Banco não cadastrado';
    22:MensagemErro:='Moeda não cadastrada';
    23:MensagemErro:='Extenso excedido';
    65:MensagemErro:='Em venda';
    66:MensagemErro:='Limite de cabeçalho alcançado';
    68:MensagemErro:='Cabeçalho impresso';
    69:MensagemErro:='Não começou venda';
    70:MensagemErro:='Valor inválido';
    73:MensagemErro:='Valor a menor';
    74:MensagemErro:='Valor a maior';
    78:MensagemErro:='Número máximo de Reduções Z alcançado';
    79:MensagemErro:='Erro de comunicação';
    80:MensagemErro:='Palavra reservada';
    81:MensagemErro:='Papel próximo do fim';
    82:MensagemErro:='Data não localizada';
    84:MensagemErro:='Erro de memória fiscal';
    85:MensagemErro:='Perda da RAM';
    86:MensagemErro:='Não houve pagamento';
    87:MensagemErro:='Cupom já totalizado';
    88:MensagemErro:='Não pode cancelar venda';
    89:MensagemErro:='Comando não completo';
    90:MensagemErro:='Cupom aberto';
    91:MensagemErro:='Não há cupom a cancelar';
    92:MensagemErro:='Tabela de taxa não inicializada';
    94:MensagemErro:='Seleção de taxa inválida';
    95:MensagemErro:='Cancelamento inválido';
    96:MensagemErro:='Nada a retificar';
    97:MensagemErro:='Redução não localizada';
    98:MensagemErro:='Cabeçalho não carregado';
    99:MensagemErro:='Impressora em intervenção técnica';
    100:MensagemErro:='Impressora em período de venda';
    101:MensagemErro:='Somente com intervenção técnica';
    102:MensagemErro:='Desconto inválido';
    103:MensagemErro:='Limite de linhas alcançado';
    104:MensagemErro:='Somente após o total';
    105:MensagemErro:='Dados inválidos';
    106:MensagemErro:='Alteração de taxa não disponível';
    107:MensagemErro:='Comando inválido';
    108:MensagemErro:='Não houve o fechamento do dia';
    109:MensagemErro:='Erro irrecuperável';
    110:MensagemErro:='Alteração inválida';
    111:MensagemErro:='Data já alterada';
    112:MensagemErro:='Alíquota não carregada';
    113:MensagemErro:='Fechamento diário não realizado';
    114:MensagemErro:='Abertura do dia inválida';
    115:MensagemErro:='Fechamento já realizado';
    116:MensagemErro:='Ajuste somente de +/- 1 hora';
    117:MensagemErro:='Acréscimo inválido';
    118:MensagemErro:='Pagamento incompleto';
    121:MensagemErro:='Erro de gravação na memória fiscal';
    126:MensagemErro:='Comando fora de seqüência';
    127:MensagemErro:='Autenticação sem papel';
    132:MensagemErro:='Queda de energia';
    133:MensagemErro:='Data inválida';
    134:MensagemErro:='Item fora da faixa';
    135:MensagemErro:='Item não vendido';
    136:MensagemErro:='Parâmetro errado';
    137:MensagemErro:='Limite de valor ultrapassado';
    138:MensagemErro:='Relógio fora de operação';
    139:MensagemErro:='Pagamento não definido';
    140:MensagemErro:='Limite de autenticação excedido';
    141:MensagemErro:='Comando inválido';
    142:MensagemErro:='Posição já programada';
    143:MensagemErro:='Posição inexistente';
    144:MensagemErro:='Cupom vinculado pendente';
    145:MensagemErro:='Excesso de documentos vinculados';
    147:MensagemErro:='Em horário já solicitado';
    148:MensagemErro:='Oscilador do relógio desativado';
    149:MensagemErro:='Formas de pagamento não inicializadas';
    606:MensagemErro:='Não foi possível setar os parâmetros configuráveis da porta serial';
    707:MensagemErro:='Não foi possível programar os parâmetros setados referentes à porta serial';
    808:MensagemErro:='Não foi possível limpar a fila de transmissão';
    809:MensagemErro:='Não foi possível limpar a fila de recepção';
    909:MensagemErro:='Ocorreu um erro na programação interna dos timeouts da porta serial';
    1010:MensagemErro:='A porta serial requisitada está bloqueada por outro aplicativo';
    2323:MensagemErro:='Ocorreu um problema desconhecido na recepção de retorno simples da impressora';
  else
    MensagemErro:='Erro Não Previsto';
  end;
  ErroSchalter := MensagemErro;
end;

procedure ErroYanco8000V11(CRetorno:Integer);
var
  MensagemErro: String;
begin
  case CRetorno of
    1:MensagemErro:='Inicialização incompleta ou Erro de Memoria Fiscal';
    2:MensagemErro:='Hora / Data não inicializadas';
    3:MensagemErro:='CGC e Inscrição Estadual não inicializadas.';
    4:MensagemErro:='Identificação da Moeda não inicializada';
    5:MensagemErro:='Tabela de Tributações  não inicializada';
    6:MensagemErro:='Constantes não inicializadas';
    7:MensagemErro:='Clichê não inicializado';
    9:MensagemErro:='Total diário diferente de zero';
    12:MensagemErro:='DSR desabilitado na transmissão para o PC';
    13:MensagemErro:='Time-out na Comunicação com o Impressor';
    14:MensagemErro:='DSR desabilitado na transmissão do Impressor';
    15:MensagemErro:='Impressão abortada pelo usuário';
    16:MensagemErro:='Comando enviado pelo PC inválido.';
    18:MensagemErro:='Jumper de intervenção aberto';
    19:MensagemErro:='Jumper OP1 aberto';
    20:MensagemErro:='Preço Total incorreto';
    21:MensagemErro:='Desconto sem venda ou não permitido nesta condição';
    22:MensagemErro:='Valor do desconto de item maior que o valor do item';
    23:MensagemErro:='Valor do desconto em subtotal maior ou igual ao valor da venda';
    24:MensagemErro:='Cancelamento de desconto sem desconto aplicado';
    25:MensagemErro:='Cancelamento sem venda ou não permitido nesta condição';
    26:MensagemErro:='Valor do cancelamento diferente do valor apurado';
    27:MensagemErro:='Mais de um desconto aplicado. Venda não pode ser cancelada';
    28:MensagemErro:='Valor total informado diferente do valor apurado';
    29:MensagemErro:='Pagamento excedeu o total da venda';
    30:MensagemErro:='Total da operação igual a zero';
    31:MensagemErro:='Função não permitida após totalização';
    32:MensagemErro:='Função não permitida sem totalização';
    34:MensagemErro:='Situação tributária inválida';
    35:MensagemErro:='Campo numérico inválido';
    36:MensagemErro:='Números não permitidos neste campo';
    37:MensagemErro:='Parametros incorretos';
    38:MensagemErro:='Tamanho Máximo do Valor Inválido';
    39:MensagemErro:='Campo deve conter, no mínimo, um caractere';
    40:MensagemErro:='Função inexistente';
    41:MensagemErro:='Função não permitida sem inicio de operação Fiscal';
    42:MensagemErro:='Função não permitida sem início de operação  Não Fiscal';
    43:MensagemErro:='Função não permitida durante operação Fiscal ou Não Fiscal';
    44:MensagemErro:='Função não permitida sem início do Dia';
    45:MensagemErro:='Função não permitida sem status de intervenção ou durante operação Fiscal ou Não-Fiscal';
    46:MensagemErro:='Função não permitida com status de intervenção. Desligar a impressora,'+
                     'colocar os jumpers em INT e OP1, Ligar a impressora e tentar novamente';
    47:MensagemErro:='Função não permitida após o Início do Dia';
    48:MensagemErro:='Não são permitidos mais comentários';
    49:MensagemErro:='Não é permitido o Inicio do Dia após Redução Z';
    50:MensagemErro:='Necessita Redução Z';
    51:MensagemErro:='Hora / Data inválida';
    52:MensagemErro:='Data menor que a da Memória Fiscal';
    53:MensagemErro:='Última função não permite a execução deste comando';
    54:MensagemErro:='Cupom aberto mas não finalizado';
    55:MensagemErro:='Função não permitida sem abertura de Relatório X ou Z';
    56:MensagemErro:='É permitido apenas quatro validações';
    57:MensagemErro:='Tempo esgotado para este comando';
    60:MensagemErro:='Não há reduções no intervalo pedido';
    61:MensagemErro:='Não há mais espaço para esta alteração na EPROM';
    62:MensagemErro:='Memória Fiscal Esgotada';
    63:MensagemErro:='Memória fiscal não disponível ou erro de leitura/gravação';
    64:MensagemErro:='Para este comando é necessário Intervenção Técnica';
    65:MensagemErro:='Palavra de uso exclusivo do firmware fiscal';
    66:MensagemErro:='Tempo esgotado para este comando';
    67:MensagemErro:='Leitura da Memória Fiscal chegou ao fim';
    68:MensagemErro:='Memória Fiscal não apagada';
    69:MensagemErro:='Impressora de cheque não está pronta';
    70:MensagemErro:='Impossível Cancelar Item';
    71:MensagemErro:='Excedido Limite de Cupons Nao Fiscais Vinculados';
    999997:MensagemErro:='Caracteres inválidos no arquivo Y8000.STS';
    999998:MensagemErro:='Caracteres inválidos no arquivo PACOTE.TXT';
    999999:MensagemErro:='O arquivo que gera o status da impressora, Y8000.STS, nao foi encontado';
  else
    MensagemErro:='Erro Não Previsto';
  end;
  MessageTela(True, False, 'ERRO NO ECF: '+IntToStr(CRetorno)+' = '+MensagemErro,0);
end;

function Exec_AbrePorta(Modelo_ECF:String; Porta_Com:Integer): String;
begin
  Exec_AbrePorta := 'ERRO!';
  if Modelo_ECF = 'SWEDA 9000' then
    begin
      try
        AbrePorta(Porta_Com, 5);
        Exec_AbrePorta := 'OK';
      except
        begin
          Exec_AbrePorta := 'ERRO';
          MessageTela(True, False, 'Erro na Abertura da Porta COM' + IntToStr(Porta_Com),0);
        end;
      end;
    end
  else
    if Modelo_ECF = 'EPSON TM-T81 FBII' then
      begin
        iRetorno := EPSON_Serial_Abrir_Porta(38400, Porta_Com);
        if Retorno_Impressora(Modelo_ECF) then
          Exec_AbrePorta := 'OK';
      end
    else
      MessageTela(True, False, 'Software não programa para Exec_AbrePorta com Modelo ECF ' + Modelo_ECF,0);
end;

function Exec_FechaPorta(Modelo_ECF:String): String;
begin
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') or
     (Modelo_ECF = 'EPSON TM-T81 FBII') then
    begin
      if (Modelo_ECF = 'BEMATECH MP20 FI II') then
        iRetorno := Bematech_FI_FechaPortaSerial()
      else
        if (Modelo_ECF = 'SWEDA ST100') then
          iRetorno := ECF_FechaPortaSerial()
        else
          iRetorno := EPSON_Serial_Fechar_Porta();
      if ((iRetorno <> 1) and (Modelo_ECF <> 'EPSON TM-T81 FBII')) then
         begin
           MessageTela(True, False, 'Erro ao Fechar a Porta.',0);
           Exec_FechaPorta := 'ERRO';
         end;
    end
  else
    if Modelo_ECF = 'SWEDA 9000' then
      begin
         if FechaPorta(ECF_Porta) then
           Exec_FechaPorta := 'OK'
         else
           Exec_FechaPorta := 'ERRO';
      end
    else
      MessageTela(True, False, 'Software não programado para Exec_FechaPorta com Modelo ECF ' + Modelo_ECF, 0);
end;

function ECF_AbreGaveta(Modelo_ECF:String): String;
begin
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') then
    begin
      if (Modelo_ECF = 'BEMATECH MP20 FI II') then
        iRetorno := Bematech_FI_AcionaGaveta()
      else
        if (Modelo_ECF = 'SWEDA ST100') then
          iRetorno := ECF_AcionaGaveta();
      Analisa_iRetorno(Modelo_ECF);
      Retorno_Impressora(Modelo_ECF);
      if iRetorno = 1 then//Retorno 1 = tudo certo.
        ECF_AbreGaveta := 'OK';
    end
  else
    if Modelo_ECF = 'SWEDA 9000' then
      begin
        StrPCopy(Comando,#27+'.21}'); // Abrir gaveta.
        Resposta := EnviaComando(Comando);
        if Analiza_Resposta_SerSweda(Resposta) then
          ECF_AbreGaveta := 'OK';
      end
    else
      if Modelo_ECF = 'EPSON TM-T81 FBII' then
        begin
          iRetorno  := EPSON_Impressora_Abrir_Gaveta();
          if Retorno_Impressora(Modelo_ECF) then
            ECF_AbreGaveta := 'OK';
        end
      else
        MessageTela(True, False, 'Soft não programado para ECF_AbreGaveta no Modelo de ECF - ' + Modelo_ECF,0);
end;

function ECF_SuprimentoSangria(Tipo, Modelo_ECF : String) : String;
var
  Valor : String;
begin
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') or
     (Modelo_ECF = 'EPSON TM-T81 FBII') then
    begin
      if UpperCase(Tipo) = 'SU' then
        InputQuery('Suprimento','Valor Suprimento', Valor)
      else
        if UpperCase(Tipo) = 'SA' then
          InputQuery('Sangria','Valor Sangria', Valor)
        else
          begin
            MessageTela(True, False, 'Tipo #'+Tipo+'# não conhecido.',0);
            Exit;
          end;
      try
        if StrToFloat(Valor) <= 0 then
          begin
            MessageTela(True, False, 'Valor informado Menor ou Igual a Zero.',0);
            Exit;
          end
        else
          begin
            Valor := FormatFloat('#########0.00', StrToFloat(Valor));
            Valor := Copy(Valor, 1, Length(Valor) - 3) + Copy(Valor, Length(Valor) - 1, 2);
          end;
      except
        on E: Exception do
          begin
            MessageTela(True, False, 'Valor informado Inválido.'+#13#10+E.Message,0);
            Exit;
          end;
      end;
      if UpperCase(Tipo) = 'SA' then
        begin
          if (Modelo_ECF = 'BEMATECH MP20 FI II') then
            iRetorno := Bematech_FI_Sangria(Valor)
          else
            if (Modelo_ECF = 'SWEDA ST100') then
              iRetorno := ECF_Sangria(Valor)
            else
              if (Modelo_ECF = 'EPSON TM-T81 FBII') then
                iRetorno := EPSON_NaoFiscal_Sangria(Pchar(Valor), 2);
        end
      else
        if UpperCase(Tipo) = 'SU' then
          begin
            if (Modelo_ECF = 'BEMATECH MP20 FI II') then
              iRetorno := Bematech_FI_Suprimento(Valor, 'Dinheiro')
            else
              if (Modelo_ECF = 'SWEDA ST100') then
                iRetorno := ECF_Suprimento(Valor, 'Dinheiro')
              else
                if (Modelo_ECF = 'EPSON TM-T81 FBII') then
                  iRetorno := EPSON_NaoFiscal_Fundo_Troco(PChar(Valor), 2);
          end
        else
          begin
            MessageTela(True, False, 'Tipo #'+Tipo+'# não conhecido.',0);
            Exit;
          end;
      if (Modelo_ECF <> 'EPSON TM-T81 FBII') then
        Analisa_iRetorno(Modelo_ECF);
      Retorno_Impressora(Modelo_ECF);
    end
  else
    MessageTela(True, False, 'Soft não programado para ECF_SuprimentoSangria no Modelo de ECF - ' + Modelo_ECF,0);
end;

function Exec_LeituraX(Modelo_ECF:String): String;
begin
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') then
    begin
      if (Modelo_ECF = 'BEMATECH MP20 FI II') then
        iRetorno := Bematech_FI_LeituraX()
      else
        if Modelo_ECF = 'SWEDA ST100' then
          iRetorno := ECF_LeituraX();
      Analisa_iRetorno(Modelo_ECF);
      Retorno_Impressora(Modelo_ECF);
      if iRetorno = 1 then//Retorno 1 = tudo certo.
        Exec_LeituraX := 'OK';
    end
  else
    if Modelo_ECF = 'SWEDA 9000' then
      begin
        StrPCopy(Comando,#27+'.13N}'); // Leitura X sem o relatório gerencial
        Resposta := EnviaComando(Comando);
        if Analiza_Resposta_SerSweda(Resposta) then
          Exec_LeituraX := 'OK';
      end
    else
      if Modelo_ECF = 'EPSON TM-T81 FBII' then
        begin
          iRetorno := EPSON_RelatorioFiscal_LeituraX();
          if Retorno_Impressora(Modelo_ECF) then
            Exec_LeituraX := 'OK';
        end
      else
        MessageTela(True, False, 'Soft não programado para Exec_LeituraX no Modelo de ECF - ' + Modelo_ECF,0);
end;

function Exec_ReducaoZ(Modelo_ECF:String): String;
var
  //variaveis para impressora epson
  szCRZ : String;
  iConta : Integer;
begin
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') then
    begin
      if (Modelo_ECF = 'BEMATECH MP20 FI II') then
        iRetorno := Bematech_FI_ReducaoZ(PChar(DateToStr(Date)), PChar(TimeToStr(Time)))
      else
        if (Modelo_ECF = 'SWEDA ST100') then
          iRetorno := ECF_ReducaoZ(pchar(DateToStr(Date)), pchar(TimeToStr(Time)));
      Analisa_iRetorno(Modelo_ECF);
      Retorno_Impressora(Modelo_ECF);
      if iRetorno = 1 then//Retorno 1 = tudo certo.
        Exec_ReducaoZ := 'OK';
    end
  else
    if Modelo_ECF = 'SWEDA 9000' then
      begin
        StrPCopy(Comando,#27+'.14N'+ Copy(DateToStr(Date),1,2) + Copy(DateToStr(Date),4,2) + Copy(DateToStr(Date),9,2)+ '}'); // Emissão da redução Z;
        Resposta := EnviaComando(Comando);
        if Analiza_Resposta_SerSweda(Resposta) then
          Exec_ReducaoZ := 'OK';
      end
    else
      if Modelo_ECF = 'EPSON TM-T81 FBII' then
        begin
          for iConta := 1 to 20 do
            szCRZ := szCRZ + ' ';

          iRetorno := EPSON_RelatorioFiscal_RZ('', '', 2, PChar(szCRZ));
          if Retorno_Impressora(Modelo_ECF) then
            begin
              Exec_ReducaoZ := 'OK';
              ShowMessage('Redução Z número: ' + szCRZ);
            end
        end
      else
        MessageTela(True, False, 'Soft não programado para Exec_ReducaoZ no Modelo de ECF - ' + Modelo_ECF,0);
end;

function ECF_RegistraItem(Modelo_ECF:String; QtdeItem:Real; QtdeReg: Integer): String;
var
  I, iDecimal, VTaxa: Integer;
  VCodigo, VDescricao, VQtde_I, VQtde_F, VValor,
  vaUnidade, sTipoDesconto, VQtde_Formatado, VValor_Formatado : String;
begin
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') or
     (Modelo_ECF = 'EPSON TM-T81 FBII') then
    begin
    if (LerIni(Form_sage.va_endereco_programa, 'Fechamento.ini', 'ECF', 'Status Cupom') <> '1') then
      begin
        if QtdeReg = 1 then//Primeiro item vendido vamos abrir o cupom fiscal
          begin
            //Vamos testar se tem pouco papel;
            ECF_Pouco_Papel_Aberto(Modelo_ECF, Form_VendaVisual.pu_Pouco_Papel, Form_VendaVisual.pu_Cupom_Aberto);
            if Form_VendaVisual.pu_Pouco_Papel then
              if not(MessageTela(True, True, 'Atenção, Tem POUCO Papel no ECF. Deseja Continuar?',0)) then
                Exit;
            if (Modelo_ECF = 'BEMATECH MP20 FI II') then
              iRetorno := Bematech_FI_AbreCupom( Pchar( '' ) )
            else
              if (Modelo_ECF = 'SWEDA ST100') then
                iRetorno := ECF_AbreCupom(Pchar(''))
              else
                if Modelo_ECF = 'EPSON TM-T81 FBII' then
                  iRetorno := EPSON_Fiscal_Abrir_Cupom('','','','',1);

            if Modelo_ECF <> 'EPSON TM-T81 FBII' then
              begin
                Analisa_iRetorno(Modelo_ECF);
                if (iRetorno <> 1) then//Retorno diferente de um não conseguiu abrir o cupom fiscal vamos parar.
                  begin
                    MessageTela(True, False, 'Feche a Tela de Venda Digitação e Entre Novamente.',0);
                    ECF_RegistraItem := 'ERRO';
                    Exit;
                  end;
              end
            else
              begin
                if not(Retorno_Impressora(Modelo_ECF)) then//Retorno diferente true não conseguiu abrir o cupom fiscal vamos parar.
                  begin
                    MessageTela(True, False, 'Feche a Tela de Venda Digitação e Entre Novamente.',0);
                    ECF_RegistraItem := 'ERRO';
                    Exit;
                  end;
              end;
            GravarINI(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'ECF', 'Status Cupom', '1');
          end;
        end;

      //Passando Informações para Edits;
      Form_VendaVisual.EditCodBarra.Text := DM1.TbIteSelCODIGOBARRA.Value;//Codigo Barra;
      Form_VendaVisual.EditNomeReduzido.Text := DM1.TbIteSelNOMEREDUZIDO.Value;//Nome do Item;
      if Modelo_ECF <> 'EPSON TM-T81 FBII' then
        begin
          if DM1.TbIteSelTAXAECF.Value = 'T06 S.TRIBUT 00,00%' then//Pegando a aliquota de ICMS.
            Form_VendaVisual.EditTaxaECF.Text := 'FF'
          else
            if DM1.TbIteSelTAXAECF.Value = 'T07 ISENTO    00,00%' then
              Form_Vendavisual.EditTaxaECF.Text := 'II'
            else
              if DM1.TbIteSelTAXAECF.Value = 'T10 NÃO INCIDÊNCIA' then
                Form_VendaVisual.EditTaxaECF.Text := 'NN'
              else
                begin
                  //vamos achar em qual posição esta a aliquota;
                  Form_VendaVisual.EditTaxaECF.Text := '0000';
                  for I := 1 to (Form_Sage.vaECF_Qtde_Posicoes)  do//mais um pq não usa a primeira posicao da variavel que é zero
                    if (Form_Sage.vaECF_Aliquotas[I]) = (SoNumeros(Copy(DM1.TbIteSelTAXAECF.Value,13,5))) then
                      Form_VendaVisual.EditTaxaECF.Text := IntToStrZero(I,2);
                end;
        end
      else
        if DM1.TbIteSelTAXAECF.Value = 'T06 S.TRIBUT 00,00%' then//Pegando a aliquota de ICMS.
          Form_VendaVisual.EditTaxaECF.Text := 'F'
        else
          if DM1.TbIteSelTAXAECF.Value = 'T07 ISENTO    00,00%' then
            Form_Vendavisual.EditTaxaECF.Text := 'I'
          else
            if DM1.TbIteSelTAXAECF.Value = 'T10 NÃO INCIDÊNCIA' then
              Form_VendaVisual.EditTaxaECF.Text := 'N'
            else //vamos passar a aliquota da taxaecf
              Form_VendaVisual.EditTaxaECF.Text := SoNumeros(Copy(DM1.TbIteSelTAXAECF.Value,5,20));
          
      Form_VendaVisual.EditQuantidade.Text := SoNumeros(FormatFloat('########0.000',DM1.TbIteSelQTDE.Value));//Passa so numeros e com tres ultimas casas são para fração
      iDecimal := 2;//Quantide de casas decimais do valor unitário 2 ou 3;
      Form_VendaVisual.EditValor_Unitario.Text := SoNumeros(FormatFloat('########0.00',DM1.TbIteSelVALUNIT.Value));//Passa so numeros e com duas ultimas casas são para os centavos
      sTipoDesconto := '%';
      Form_VendaVisual.EditValor_Desconto.Text := '0000';//ValorDesconto: String com até 8 dígitos para desconto por valor (2 casas decimais) e 4 dígitos para desconto percentual

      if (Modelo_ECF = 'BEMATECH MP20 FI II') then
        iRetorno := Bematech_FI_VendeItem( Form_VendaVisual.EditCodBarra.Text,
                                           Form_VendaVisual.EditNomeReduzido.Text,
                                           Form_VendaVisual.EditTaxaECF.Text,
                                           'F',
                                           Form_VendaVisual.EditQuantidade.Text,
                                           iDecimal,
                                           Form_VendaVisual.EditValor_Unitario.Text,
                                           sTipoDesconto,
                                           Form_VendaVisual.EditValor_Desconto.Text )
      else
        if (Modelo_ECF = 'SWEDA ST100') then
          iRetorno := ECF_VendeItem( Form_VendaVisual.EditCodBarra.Text,
                                     Form_VendaVisual.EditNomeReduzido.Text,
                                     Form_VendaVisual.EditTaxaECF.Text,
                                     'F',
                                     Form_VendaVisual.EditQuantidade.Text,
                                     iDecimal,
                                     Form_VendaVisual.EditValor_Unitario.Text,
                                     sTipoDesconto,
                                     Form_VendaVisual.EditValor_Desconto.Text )
        else
          if Modelo_ECF = 'EPSON TM-T81 FBII' then
            iRetorno := EPSON_Fiscal_Vender_Item( Pchar(Form_VendaVisual.EditCodBarra.Text),
                                                  Pchar(Form_VendaVisual.EditNomeReduzido.Text),
                                                  Pchar(Form_VendaVisual.EditQuantidade.Text),
                                                  3,
                                                  Pchar(DM1.TbIteSelUNIDADE.AsString),
                                                  Pchar(SoNumeros(Form_VendaVisual.EditValor_Unitario.Text)),
                                                  2,
                                                  Pchar(Form_VendaVisual.EditTaxaECF.Text),
                                                  1);

      if Modelo_ECF <> 'EPSON TM-T81 FBII' then
        begin
          Analisa_iRetorno(Modelo_ECF);
          Retorno_Impressora(Modelo_ECF);
          if iRetorno = 1 then//iRetorno é igual a 1 então tudo certo
            Result := 'OK';
        end
      else
        if Retorno_Impressora(Modelo_ECF) then
          Result := 'OK';
    end
  else
    if Modelo_ECF = 'SWEDA 9000' then
      begin
        if DM1.TbIteSelNSEQUENCIA.AsInteger = 1 then//vamos testar se tem cupom aberto se não tiver vamos abrir
          begin
            StrPCopy(Comando,#27+'.17}'); // Abertura do cupom fiscal
            Resposta := EnviaComando(Comando);
            if not(Analiza_Resposta_SerSweda(Resposta)) then
              Exit;
          end;
        (**** comando
        ASCII ESC.01 COD(13)
                     QUANT(7)
                     PRUNIT(9)
                     PRTOT(12)
                     DESCR(24)
                     TRIB(3)
                     [TAMCOD(2) | DESCR2(40)] }
        ****)
        //Passando Informações para Edits;
        Form_VendaVisual.EditCodBarra.Text := Preenchimento(DM1.TbIteSelCODIGOBARRA.Value, ' ', 13, False);//Codigo Barra;
        Form_VendaVisual.EditQuantidade.Text := Preenchimento(SoNumeros(FormatFloat('########0.000',DM1.TbIteSelQTDE.Value)), '0', 7, False);//Passa so numeros e com tres ultimas casas são para fração
        Form_VendaVisual.EditValor_Unitario.Text := Preenchimento(SoNumeros(FormatFloat('########0.00',DM1.TbIteSelVALUNIT.Value)), '0', 9, False);//Passa so numeros e com duas ultimas casas são para centavos
        Form_VendaVisual.EditValor_Total.Text := Preenchimento(SoNumeros(FormatFloat('########0.00',DM1.TbIteSelVALTOTAL.Value)), '0', 12, False);//Passa so numeros e com dizendo o valor total do item
        Form_VendaVisual.EditNomeReduzido.Text := Preenchimento(Copy(DM1.TbIteSelNOMEREDUZIDO.Value,1,24),' ', 24, True);//Nome do Item;

        if DM1.TbIteSelTAXAECF.Value = 'T06 S.TRIBUT 00,00%' then//Pegando a aliquota de ICMS.
          Form_VendaVisual.EditTaxaECF.Text := 'F  '
        else
          if DM1.TbIteSelTAXAECF.Value = 'T07 ISENTO    00,00%' then
            Form_Vendavisual.EditTaxaECF.Text := 'I  '
          else
            if DM1.TbIteSelTAXAECF.Value = 'T10 NÃO INCIDÊNCIA' then
              Form_VendaVisual.EditTaxaECF.Text := 'N  '
            else
              begin
                //vamos achar em qual posição esta a aliquota;
                Form_VendaVisual.EditTaxaECF.Text := 'T00';
                for I := 1 to (Form_Sage.vaECF_Qtde_Posicoes)  do//mais um pq não usa a primeira posicao da variavel que é zero
                  if (Form_Sage.vaECF_Aliquotas[I]) = (SoNumeros(Copy(DM1.TbIteSelTAXAECF.Value,13,5))) then
                    Form_VendaVisual.EditTaxaECF.Text := 'T' + IntToStrZero(I,2);
              end;
        if Form_VendaVisual.EditTaxaECF.Text = 'T00' then
          begin
            MessageTela(True, False, 'Não foi encontrado a posição da aliquota no ECF.',0);
            Exit;
          end;
        StrPCopy(Comando,#27+'.01'+Form_VendaVisual.EditCodBarra.Text+
                                   Form_VendaVisual.EditQuantidade.Text+
                                   Form_VendaVisual.EditValor_Unitario.Text+
                                   Form_VendaVisual.EditValor_Total.Text+
                                   Form_VendaVisual.EditNomeReduzido.Text+
                                   Form_VendaVisual.EditTaxaECF.Text+
                                   '}'); // Vamos fazer venda do item
        Resposta := EnviaComando(Comando);
        if Analiza_Resposta_SerSweda(Resposta) then
          Result := 'OK'
        else
          if DM1.TbIteSelNSEQUENCIA.AsInteger = 1 then
            Exec_CancelaCupomFiscal(ModeloECF);
      end
    else
      MessageTela(True, False, 'Soft não programado para ECF_RegistraItem no Modelo de ECF - ' + Modelo_ECF,0);
end;

function ECF_CancelaItem(Modelo_ECF:String; Posicao_Item: Integer): String;
begin
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') then
    begin
      if (Modelo_ECF = 'BEMATECH MP20 FI II') then
        iRetorno := Bematech_FI_CancelaItemGenerico(DM1.tbIteSelNSequencia.AsString)
      else
        if Modelo_ECF = 'SWEDA ST100' then
          iRetorno := ECF_CancelaItemGenerico(DM1.tbIteSelNSequencia.AsString);
      Analisa_iRetorno(Modelo_ECF);
      Retorno_Impressora(Modelo_ECF);
      if iRetorno = 1 then//Retorno 1 = tudo certo.
        ECF_CancelaItem := 'OK';
    end
  else
    if Modelo_ECF = 'SWEDA 9000' then
      begin
        StrPCopy(Comando,#27+'.04'+ Preenchimento(DM1.tbIteSelNSequencia.AsString, '0', 3, False) +'}'); // Cancelamento do item registrado na venda em andamento
        Resposta := EnviaComando(Comando);
        if Analiza_Resposta_SerSweda(Resposta) then
          ECF_CancelaItem := 'OK';
      end
    else
      if Modelo_ECF = 'EPSON TM-T81 FBII' then
        begin
          iRetorno := EPSON_Fiscal_Cancelar_Item(PChar(DM1.tbIteSelNSequencia.AsString));
          if Retorno_Impressora(Modelo_ECF) then
            ECF_CancelaItem := 'OK';
        end
      else
        MessageTela(True, False, 'Soft não programado para ECF_CancelaItem no Modelo de ECF - ' + Modelo_ECF,0);
end;

function Exec_CancelaCupomFiscal(Modelo_ECF:String): String;
begin
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') then
    begin
      if Modelo_ECF = 'BEMATECH MP20 FI II' then
        iRetorno := Bematech_FI_CancelaCupom()
      else
        if Modelo_ECF = 'SWEDA ST100' then
          iRetorno := ECF_CancelaCupom();
      Analisa_iRetorno(Modelo_ECF);
      Retorno_Impressora(Modelo_ECF);
      if iRetorno = 1 then//Retorno 1 = tudo certo.
        begin
          Exec_CancelaCupomFiscal := 'OK';
          GravarINI(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'ECF', 'Status Cupom', '0');
        end;
    end
  else
    if (Modelo_ECF = 'SWEDA 9000') then
      begin
        StrPCopy(Comando,#27+'.05}'); // Cancela o cupom fiscal anterio
        Resposta := EnviaComando(Comando);
        if Analiza_Resposta_SerSweda(Resposta) then
          begin
            Exec_CancelaCupomFiscal := 'OK';
            GravarINI(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'ECF', 'Status Cupom', '0');
          end;
      end
    else
      if Modelo_ECF = 'EPSON TM-T81 FBII' then
        begin
          iRetorno := EPSON_Fiscal_Cancelar_Cupom();
          if Retorno_Impressora(Modelo_ECF) then
            begin
              Exec_CancelaCupomFiscal := 'OK';
              GravarINI(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'ECF', 'Status Cupom', '0');
            end;
        end
      else
        MessageTela(True, False, 'Soft não programado para Exec_CancelaCupomFiscal no Modelo de ECF - ' + Modelo_ECF,0);
end;

function ECF_FinalizaCupom(Modelo_ECF:String; FormaPgto:String; ValorPgto: Double; ValorDesconto: Double; Sequencia_Venda : Integer): String;
var
  va_mensagem : String;
  vaMensagem2, vaMensagem3, vaMensagem4, vaMensagem5, vaMensagem6, vaMensagem7, vaMensagem8 : String;
begin
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') or
     (Modelo_ECF = 'EPSON TM-T81 FBII') then
    begin
      // 'A' para Acréscimo
      // 'D' para Desconto
      // '%' para Percentual
      // '$' para Valor
      if (LerIni(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'INICIO_FECHAMENTO') <> 'SIM') then//não fez fechamento vamos fazer...
        begin//Inicia o fechamento cupom fiscal
          if (Modelo_ECF = 'BEMATECH MP20 FI II') then
            iRetorno := Bematech_FI_IniciaFechamentoCupom('D', '$', Form_VendaVisual.Edit6.Text)
          else
            if (Modelo_ECF = 'SWEDA ST100') then
              iRetorno := ECF_IniciaFechamentoCupom('D', '$', Form_VendaVisual.Edit6.Text);
          if (Modelo_ECF <> 'EPSON TM-T81 FBII') then
            begin
              Analisa_iRetorno(Modelo_ECF);
              Retorno_Impressora(Modelo_ECF);
              if iRetorno <> 1 then//Deu erro
                begin
                  ECF_FinalizaCupom := 'ERRO';
                  Exit;
                end;
              GravarINI(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'INICIO_FECHAMENTO', 'SIM');
            end;
        end;

      DM1.tbAux.SelectSQL.Text := 'select forpgven.formapag, ' +
                                  '       forpgven.valor ' +
                                  '  from forpgven ' +
                                  ' where forpgven.nvenda = ' + IntToStr(Sequencia_Venda) +
                                  ' order by forpgven.valor ';
      try
        DM1.tbAux.Open;
      except
        on E: Exception do
          begin
            ECF_FinalizaCupom := 'ERRO';
            DM1.tbAux.Close;
            ShowMessage('Problemas para selecionar as formas de pagamento.'+#13#10+E.Message);
            Exit;
          end;
      end;

      while DM1.tbAux.Eof = False do
        begin
          if (DM1.tbAux.FieldByName('valor').AsCurrency > 0) and
             (LerIni(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', DM1.tbAux.FieldByName('formapag').AsString) = '0,00') then
            begin
              Form_VendaVisual.EditForma_Pagto.Text := DM1.tbAux.FieldByName('formapag').AsString;
              if Form_VendaVisual.EditForma_Pagto.Text = 'Dinheiro' then
                begin
                  if StrToFloat(Form_VendaVisual.Edit9.Text) > StrToFloat(Form_VendaVisual.Edit7.Text) then
                    Form_VendaVisual.EditForma_Pagto_Valor.Text := FormatFloat('###,###,##0.00', DM1.tbAux.FieldByName('valor').AsCurrency)
                  else
                    Form_VendaVisual.EditForma_Pagto_Valor.Text := Form_VendaVisual.Edit9.Text;
                end
              else
                Form_VendaVisual.EditForma_Pagto_Valor.Text := FormatFloat('###,###,##0.00', DM1.tbAux.FieldByName('valor').AsCurrency);
              if (Modelo_ECF = 'BEMATECH MP20 FI II') then
                iRetorno := Bematech_FI_EfetuaFormaPagamento( Form_VendaVisual.EditForma_Pagto.Text, Form_VendaVisual.EditForma_Pagto_Valor.Text )
              else
                if (Modelo_ECF = 'SWEDA ST100') then
                  iRetorno := ECF_EfetuaFormaPagamento( Form_VendaVisual.EditForma_Pagto.Text, Form_VendaVisual.EditForma_Pagto_Valor.Text )
                else
                  if (Modelo_ECF = 'EPSON TM-T81 FBII') then
                    begin
                      if Form_VendaVisual.EditForma_Pagto.Text = 'Dinheiro' then
                        iRetorno := EPSON_Fiscal_Pagamento('1', PChar(SoNumeros(Form_VendaVisual.EditForma_Pagto_Valor.Text)), 2, '', '')
                      else
                        if Form_VendaVisual.EditForma_Pagto.Text = 'Cheque' then
                          iRetorno := EPSON_Fiscal_Pagamento('2', PChar(SoNumeros(Form_VendaVisual.EditForma_Pagto_Valor.Text)), 2, '', '')
                        else
                          if Form_VendaVisual.EditForma_Pagto.Text = 'Fidelidade' then
                            iRetorno := EPSON_Fiscal_Pagamento('3', PChar(SoNumeros(Form_VendaVisual.EditForma_Pagto_Valor.Text)), 2, '', '')
                          else
                            if Form_VendaVisual.EditForma_Pagto.Text = 'Outros' then
                              iRetorno := EPSON_Fiscal_Pagamento('4', PChar(SoNumeros(Form_VendaVisual.EditForma_Pagto_Valor.Text)), 2, '', '')
                            else
                              if Form_VendaVisual.EditForma_Pagto.Text = 'Carteira' then
                                iRetorno := EPSON_Fiscal_Pagamento('5', PChar(SoNumeros(Form_VendaVisual.EditForma_Pagto_Valor.Text)), 2, '', '')
                              else
                                if Form_VendaVisual.EditForma_Pagto.Text = 'Cheque Pre' then
                                  iRetorno := EPSON_Fiscal_Pagamento('6', PChar(SoNumeros(Form_VendaVisual.EditForma_Pagto_Valor.Text)), 2, '', '')
                                else
                                  if Form_VendaVisual.EditForma_Pagto.Text = 'CARTAO' then
                                    iRetorno := EPSON_Fiscal_Pagamento('7', PChar(SoNumeros(Form_VendaVisual.EditForma_Pagto_Valor.Text)), 2, '', '')
                                  else                                          
                                    if Form_VendaVisual.EditForma_Pagto.Text = 'Div. Parc.' then
                                      iRetorno := EPSON_Fiscal_Pagamento('8', PChar(SoNumeros(Form_VendaVisual.EditForma_Pagto_Valor.Text)), 2, '', '');
                      if not(Retorno_Impressora(Modelo_ECF)) then
                        begin
                          ECF_FinalizaCupom := 'ERRO';
                          Break;
                          Exit;
                        end;
                    end;
              if (Modelo_ECF <> 'EPSON TM-T81 FBII') then
                begin
                  Analisa_iRetorno(Modelo_ECF);
                  Retorno_Impressora(Modelo_ECF);
                  if iRetorno <> 1 then//deu erro
                    begin
                      ECF_FinalizaCupom := 'ERRO';
                      Break;
                      Exit;
                    end;
                end;
              GravarINI(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', Form_VendaVisual.EditForma_Pagto.Text, Form_VendaVisual.EditForma_Pagto_Valor.Text);
            end;
          DM1.tbAux.Next;
        end;
      DM1.tbAux.Close;

      //Fechamento do cupom fiscal
      if (LerIni(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'TEM_FECHAMENTO') <> 'SIM') then//não fez fechamento vamos fazer...
        begin
          if (Modelo_ECF = 'BEMATECH MP20 FI II') then
            iRetorno := Bematech_FI_TerminaFechamentoCupom(Form_VendaVisual.Label19.Caption + ' -  Venda '+IntToStr(Sequencia_Venda) + ' - Usuario '+FloatToStr(Operador_Sis.CodUsuario) + #13#10 + Form_VendaVisual.Memo1.Text)
          else
            if (Modelo_ECF = 'SWEDA ST100') then
              iRetorno := ECF_TerminaFechamentoCupom(Form_VendaVisual.Label19.Caption + ' -  Venda '+IntToStr(Sequencia_Venda) + ' - Usuario '+FloatToStr(Operador_Sis.CodUsuario) + #13#10 + Form_VendaVisual.Memo1.Text)
            else
              if (Modelo_ECF = 'EPSON TM-T81 FBII') then
                begin
                  //vamos escrever a mensagem no cupom fiscal;
                  if Form_VendaVisual.Memo1.Lines[0] <> ''then
                    vaMensagem2 := Form_VendaVisual.Memo1.Lines[0];
                  if Form_VendaVisual.Memo1.Lines[1] <> '' then
                    vaMensagem3 := Form_VendaVisual.Memo1.Lines[1];
                  if Form_VendaVisual.Memo1.Lines[2] <> ''then
                    vaMensagem4 := Form_VendaVisual.Memo1.Lines[2];
                  if Form_VendaVisual.Memo1.Lines[3] <> '' then
                    vaMensagem5 := Form_VendaVisual.Memo1.Lines[3];
                  if Form_VendaVisual.Memo1.Lines[4] <> '' then
                    vaMensagem6 := Form_VendaVisual.Memo1.Lines[4];
                  if Form_VendaVisual.Memo1.Lines[5] <> '' then
                    vaMensagem7 := Form_VendaVisual.Memo1.Lines[5];
                  if Form_VendaVisual.Memo1.Lines[6] <> '' then
                    vaMensagem8 := Form_VendaVisual.Memo1.Lines[6];

                  iRetorno := EPSON_Fiscal_Imprimir_Mensagem(PChar(Form_VendaVisual.Label19.Caption + ' -  Venda '+IntToStr(Sequencia_Venda) + ' - Usuario '+FloatToStr(Operador_Sis.CodUsuario) ),
                                                             PChar(vaMensagem2), PChar(vaMensagem3), PChar(vaMensagem4), PChar(vaMensagem5), PChar(vaMensagem6), PChar(vaMensagem7), PChar(vaMensagem8));
                  if not(Retorno_Impressora(Modelo_ECF)) then
                    begin
                      ECF_FinalizaCupom := 'ERRO';
                      Exit;
                    end;

                  iRetorno := EPSON_Fiscal_Mensagem_Aplicacao(PChar(Copy(Form_Sage.RxLabel2.Caption,1,23)), '');
                  if not(Retorno_Impressora(Modelo_ECF)) then
                    begin
                      ECF_FinalizaCupom := 'ERRO';
                      Exit;
                    end;
                  iRetorno := EPSON_Fiscal_Fechar_Cupom( False, False);
                  if not(Retorno_Impressora(Modelo_ECF)) then
                    begin
                      ECF_FinalizaCupom := 'ERRO';
                      Exit;
                    end;
                end;
          if (Modelo_ECF <> 'EPSON TM-T81 FBII') then
            begin
              Analisa_iRetorno(Modelo_ECF);
              Retorno_Impressora(Modelo_ECF);
              if iRetorno <> 1 then//deu erro
                begin
                  ECF_FinalizaCupom := 'ERRO';
                  Exit;
                end;
            end;
          GravarINI(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'TEM_FECHAMENTO', 'SIM');
        end;

      //Vamos gravar as formas de pagamento com valores zero pq já passou em tudo e esta tudo certo.
      Form_VendaVisual.Limpa_Inf_Fechamento;
    end
  else
    if Modelo_ECF = 'SWEDA 9000' then
      begin
        //forma de pagamento dinheiro
        if (StrToFloat(Form_VendaVisual.Edit9.Text) > 0) and (LerIni(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'DINHEIRO') = '0,00') then
          begin
            StrPCopy(Comando,#27+'.10' + '01' + Preenchimento(SoNumeros(Form_VendaVisual.Edit9.Text), '0', 12, False) + '}'); // Fazer inicio de fechamento do cupom fiscal
            Resposta := EnviaComando(Comando);
            if Analiza_Resposta_SerSweda(Resposta) then
              GravarINI(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'DINHEIRO', Form_VendaVisual.Edit9.Text)
            else
              begin
                ECF_FinalizaCupom := 'ERRO';
                Exit;
              end;
          end;

        //forma de pagamento Cheque
        if (StrToFloat(Form_VendaVisual.Edit11.Text) > 0) and (LerIni(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'CHEQUE') = '0,00') then
          begin
            StrPCopy(Comando,#27+'.10' + '02' + Preenchimento(SoNumeros(Form_VendaVisual.Edit11.Text), '0', 12, False) + '}'); // Fazer inicio de fechamento do cupom fiscal
            Resposta := EnviaComando(Comando);
            if Analiza_Resposta_SerSweda(Resposta) then
              GravarINI(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'CHEQUE', Form_VendaVisual.Edit11.Text)
            else
              begin
                ECF_FinalizaCupom := 'ERRO';
                Exit;
              end;
          end;

        //forma de pagamento Fidelidade
        if (StrToFloat(Form_VendaVisual.Edit12.Text) > 0) and (LerIni(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'FIDELIDADE') = '0,00') then
          begin
            StrPCopy(Comando,#27+'.10' + '03' + Preenchimento(SoNumeros(Form_VendaVisual.Edit12.Text), '0', 12, False) + '}'); // Fazer inicio de fechamento do cupom fiscal
            Resposta := EnviaComando(Comando);
            if Analiza_Resposta_SerSweda(Resposta) then
              GravarINI(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'FIDELIDADE', Form_VendaVisual.Edit12.Text)
            else
              begin
                ECF_FinalizaCupom := 'ERRO';
                Exit;
              end;
          end;

        //forma de pagamento Outros
        if (StrToFloat(Form_VendaVisual.Edit14.Text) > 0) and (LerIni(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'OUTROS') = '0,00') then
          begin
            StrPCopy(Comando,#27+'.10' + '04' + Preenchimento(SoNumeros(Form_VendaVisual.Edit14.Text), '0', 12, False) + '}'); // Fazer inicio de fechamento do cupom fiscal
            Resposta := EnviaComando(Comando);
            if Analiza_Resposta_SerSweda(Resposta) then
              GravarINI(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'OUTROS', Form_VendaVisual.Edit14.Text)
            else
              begin
                ECF_FinalizaCupom := 'ERRO';
                Exit;
              end;
          end;

        //forma de pagamento Carteira
        if (StrToFloat(Form_VendaVisual.Edit16.Text) > 0) and (LerIni(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'CARTEIRA') = '0,00') then
          begin
            StrPCopy(Comando,#27+'.10' + '05' + Preenchimento(SoNumeros(Form_VendaVisual.Edit16.Text), '0', 12, False) + '}'); // Fazer inicio de fechamento do cupom fiscal
            Resposta := EnviaComando(Comando);
            if Analiza_Resposta_SerSweda(Resposta) then
              GravarINI(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'CARTEIRA', Form_VendaVisual.Edit16.Text)
            else
              begin
                ECF_FinalizaCupom := 'ERRO';
                Exit;
              end;
          end;

        //forma de pagamento Cheque pre
        if (StrToFloat(Form_VendaVisual.Edit17.Text) > 0) and (LerIni(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'CHEQUE PRE') = '0,00') then
          begin
            StrPCopy(Comando,#27+'.10' + '06' + Preenchimento(SoNumeros(Form_VendaVisual.Edit17.Text), '0', 12, False) + '}'); // Fazer inicio de fechamento do cupom fiscal
            Resposta := EnviaComando(Comando);
            if Analiza_Resposta_SerSweda(Resposta) then
              GravarINI(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'CHEQUE PRE', Form_VendaVisual.Edit17.Text)
            else
              begin
                ECF_FinalizaCupom := 'ERRO';
                Exit;
              end;
          end;

        //forma de pagamento Cartao
        if (StrToFloat(Form_VendaVisual.Edit18.Text) > 0) and (LerIni(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'CARTAO') = '0,00') then
          begin
            StrPCopy(Comando,#27+'.10' + '07' + Preenchimento(SoNumeros(Form_VendaVisual.Edit18.Text), '0', 12, False) + '}'); // Fazer inicio de fechamento do cupom fiscal
            Resposta := EnviaComando(Comando);
            if Analiza_Resposta_SerSweda(Resposta) then
              GravarINI(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'CARTAO', Form_VendaVisual.Edit18.Text)
            else
              begin
                ECF_FinalizaCupom := 'ERRO';
                Exit;
              end;
          end;

        //forma de pagamento Div. Parc.
        if (StrToFloat(Form_VendaVisual.Edit20.Text) > 0) and (LerIni(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'DIV PARC') = '0,00') then
          begin
            StrPCopy(Comando,#27+'.10' + '08' + Preenchimento(SoNumeros(Form_VendaVisual.Edit20.Text), '0', 12, False) + '}'); // Fazer inicio de fechamento do cupom fiscal
            Resposta := EnviaComando(Comando);
            if Analiza_Resposta_SerSweda(Resposta) then
              GravarINI(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'DIV PARC', Form_VendaVisual.Edit20.Text)
            else
              begin
                ECF_FinalizaCupom := 'ERRO';
                Exit;
              end;
          end;
        //vamos finalizar o cupom fiscal
        if (LerIni(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'TEM_FECHAMENTO') <> 'SIM') then//não fez fechamento vamos fazer...
          begin
            va_mensagem := '1'+ Preenchimento(Copy(Form_VendaVisual.Label19.Caption + ' -  Venda '+IntToStr(Sequencia_Venda) + ' - Usuario '+FloatToStr(Operador_Sis.CodUsuario),1,40), ' ' , 40 , True);
            if Form_VendaVisual.Memo1.Lines[0] <> '' then
              va_mensagem := va_mensagem + '1'+ Preenchimento(Form_VendaVisual.Memo1.Lines[0], ' ', 40, True)
            else
              va_mensagem := va_mensagem + '                                        ';
            if Form_VendaVisual.Memo1.Lines[1] <> '' then
              va_mensagem := va_mensagem + '1'+ Preenchimento(Form_VendaVisual.Memo1.Lines[1], ' ', 40, True)
            else
              va_mensagem := va_mensagem + '                                        ';
            if Form_VendaVisual.Memo1.Lines[2] <> '' then
              va_mensagem := va_mensagem + '1'+ Preenchimento(Form_VendaVisual.Memo1.Lines[2], ' ', 40, True)
            else
              va_mensagem := va_mensagem + '                                        ';
            if Form_VendaVisual.Memo1.Lines[3] <> '' then
              va_mensagem := va_mensagem + '1'+ Preenchimento(Form_VendaVisual.Memo1.Lines[3], ' ', 40, True)
            else
              va_mensagem := va_mensagem + '                                        ';
            if Form_VendaVisual.Memo1.Lines[4] <> '' then
              va_mensagem := va_mensagem + '1'+ Preenchimento(Form_VendaVisual.Memo1.Lines[4], ' ', 40, True)
            else
              va_mensagem := va_mensagem + '                                        ';
            if Form_VendaVisual.Memo1.Lines[5] <> '' then
              va_mensagem := va_mensagem + '1'+ Preenchimento(Form_VendaVisual.Memo1.Lines[5], ' ', 40, True)
            else
              va_mensagem := va_mensagem + '                                        ';
            if Form_VendaVisual.Memo1.Lines[6] <> '' then
              va_mensagem := va_mensagem + '1'+ Preenchimento(Form_VendaVisual.Memo1.Lines[6], ' ', 40, True)
            else
              va_mensagem := va_mensagem + '                                        ';
            StrPCopy(Comando,#27+'.12N'+ va_mensagem +'}'); // Faz o fechamento do cupom fiscal
            Resposta := EnviaComando(Comando);
            if Analiza_Resposta_SerSweda(Resposta) then
              GravarINI(Form_Sage.va_endereco_programa, 'Fechamento.ini', 'PAGAMENTOS', 'TEM_FECHAMENTO', 'SIM')
            else
              begin
                ECF_FinalizaCupom := 'ERRO';
                Exit;
              end;
          end;
        //Vamos gravar as formas de pagamento com valores zero pq já passou em tudo e esta tudo certo.
        Form_VendaVisual.Limpa_Inf_Fechamento;
      end
    else
      MessageTela(True, False, 'Soft não programado para ECF_FinalizaCupom no Modelo de ECF - ' + Modelo_ECF,0);
end;

function ECF_LerMemFiscal(Modelo_ECF:String; Data_Inicial, Data_Final, Tipo : String): String;
var
  va_Tipo_Impressora : String;
  //variaveis para impressora epson
  iConta, tambuff:Integer;
  vaArquivo, pszDados : String;
begin
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') then
    begin
      if (Modelo_ECF = 'BEMATECH MP20 FI II') then
        begin
          va_Tipo_Impressora := Exec_Testa_Modelo_Impressora(Modelo_ECF);
          if (va_Tipo_Impressora = 'MP2000FI') or
             (va_Tipo_Impressora = 'MP2100FI') or
             (va_Tipo_Impressora = 'MP6000FI') or
             (va_Tipo_Impressora = 'MP3000FI') then
            iRetorno := Bematech_FI_LeituraMemoriaFiscalDataMFD( pchar( Data_Inicial ), pchar( Data_Final ), Pchar( Tipo ))
          else
            iRetorno := Bematech_FI_LeituraMemoriaFiscalData( pchar( Data_Inicial ), pchar( Data_Final ))
        end
      else
        if (Modelo_ECF = 'SWEDA ST100') then
          iRetorno := ECF_LeituraMemoriaFiscalDataMFD( pchar( Data_Inicial ), pchar( Data_Final ), pchar( Tipo ));
      Analisa_iRetorno(Modelo_ECF);
      Retorno_Impressora(Modelo_ECF);
      if iRetorno = 1 then//Retornou 1 = Tudo certo.
        ECF_LerMemFiscal := 'OK';
    end
  else
    if Modelo_Ecf = 'SWEDA 9000' then
      begin
        if Tipo = 'S' then
          StrPCopy(Comando,#27+'.16'+Copy(Data_Inicial,1,2)+Copy(Data_Inicial,4,2)+ copy(Data_Inicial,9,2)+Copy(Data_Final,1,2)+Copy(Data_Final,4,2)+ copy(Data_Final,9,2)+Tipo+'}') // Leitura da memoria fiscal por data
        else
          StrPCopy(Comando,#27+'.16'+Copy(Data_Inicial,1,2)+Copy(Data_Inicial,4,2)+ copy(Data_Inicial,9,2)+Copy(Data_Final,1,2)+Copy(Data_Final,4,2)+ copy(Data_Final,9,2)+'C}'); // Leitura da memoria fiscal por data
        Resposta := EnviaComando(Comando);
        if Analiza_Resposta_SerSweda(Resposta) then
          ECF_LerMemFiscal := 'OK';
      end
    else
      if Modelo_Ecf = 'EPSON TM-T81 FBII' then
        begin
          for iConta := 1 to 10000 do
            pszDados := pszDados + ' ';
          tambuff := 0;
          vaArquivo := 'c:\EPSON_MF_' + SoNumeros(DateTimeToStr(Now)) + '.txt';
          iRetorno := EPSON_RelatorioFiscal_Leitura_MF( PChar(SoNumeros(Data_Inicial)), PChar(SoNumeros(Data_Final)), StrToInt(Tipo), PChar(pszDados), PChar(vaArquivo), @tambuff, 10000);
          if Retorno_Impressora(Modelo_ECF) then
            begin
              ECF_LerMemFiscal := 'OK';
              if (StrToInt(Tipo) >= 8) and (StrToInt(Tipo) < 16) then
                MessageTela(False, False, 'Tamanho: ' + IntToStr(tambuff) + #13#10 +
                                          'Dados: ' + Trim(pszDados),0)
              else
                if (StrToInt(Tipo) >= 16) and (StrToInt(Tipo) < 24) then
                  MessageTela(False, False, 'O Arquivo foi Salvo em: ' + #13#10 + vaArquivo,0)
                else
                  if StrToInt(Tipo) >= 24 then
                    MessageTela(False, False, 'O Arquivo foi Salvo em: ' + #13#10 + vaArquivo + #13+#10 +
                                              'Tamanho: ' + IntToStr(tambuff) + #13#10 +
                                              'Dados: ' + Trim(pszDados),0);
            end;
        end
      else
        MessageTela(True, False, 'Soft não programado para ECF_LerMemFiscal no Modelo de ECF - ' + Modelo_ECF,0);
end;

function SendYanco8000V11(Comando, Mensagem: String): Integer;
var
  Pacote, Status: String;
  ArqPacote, ArqCmd, ArqSTS: TextFile;
begin
{Lê/Grava PACOTE.TXT}
  AssignFile(ArqPacote,'PACOTE.TXT');
  if FileExists('PACOTE.TXT') then
    begin
     Reset(ArqPacote);
     Readln(ArqPAcote,Pacote);
     Readln(ArqPAcote,Pacote);
     try
       Pacote := IntToStr(StrToInt(Trim(Pacote)) + 1);
     except
       on E: Exception do
         begin
           SendYanco8000V11 := 999998;
           Exit;
         end;
     end;
     CloseFile(ArqPacote);
    end
  else
     Pacote := '1';
  Rewrite(ArqPacote);
  Writeln(ArqPacote,Pacote);
  CloseFile(ArqPacote);
{Grava Y8000.CMD}
  AssignFile(ArqCmd,'Y8000.CMD');
  Rewrite(ArqCmd);
  Writeln(ArqCmd, Pacote);
  Writeln(ArqCmd, Comando);
  Writeln(ArqCmd, Mensagem);
  CloseFile(ArqCmd);
{Chama Y8000WIN.EXE}
  ShellExecute (Form_Sage.Handle,'open','y8000win.exe','2','',0);
{Analisa Y8000.STS}
  if FileExists('Y8000.STS') then
    begin
      AssignFile(ArqSTS,'Y8000.STS');
      Reset(ArqSTS);
      Readln(ArqSTS,Status);
      CloseFile(ArqSTS);
      try
        SendYanco8000V11 := StrToInt(Trim(Status));
      except
        on E: Exception do
          begin
            SendYanco8000V11 := 999997;
            Exit;
          end;
      end;
    end
  else
    SendYanco8000V11 := 999999;
end;

end.
