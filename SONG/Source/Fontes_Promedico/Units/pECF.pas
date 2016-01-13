unit pECF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, Buttons, ExtCtrls, DB, DBTables, ShellApi,
  SwSystem;

function Exec_Testa_Modelo_Impressora(Modelo_ECF : String) : String;
function Exec_ImpressoraLigada(Modelo_ECF : String) : Boolean;
function Exec_ProgramaTruncamento(Modelo_ECF : String) : Boolean;
function Exec_ProgramaArredondamento(Modelo_ECF : String) : Boolean;
function Exec_TestaTruncamento(Modelo_ECF : String) : String;
procedure ECF_Pouco_Papel_Aberto(Modelo_ECF : String; var Pouco_Papel, Aberto : Boolean);
function ECF_CarregaIndicesISS(Modelo_ECF : String) : String;
function ECF_CarregaAliquotas(Modelo_ECF : String) : String;
function ECF_ProgramaFormaPagmento(Modelo_ECF, FormaPagto, Normal_TEF : String) : String;
function ECF_Testa_Gaveta(Modelo_ECF, Invertido : String) : String;
function PegaNumerodeSerie(Modelo_ECF : String) : String;
function PegaNumerodoCupom(Modelo_ECF : String) : Integer;
function AvaliaRetorno(Modelo_ECF:String; CRetorno:Integer): String;
function Exec_AbrePorta(Modelo_ECF:String; Porta_Com:Integer): String;
function Exec_FechaPorta(Modelo_ECF:String): String;
function ECF_AbreGaveta(Modelo_ECF:String): String;
function ECF_SuprimentoSangria(Tipo, Modelo_ECF : String) : String;
function Exec_LeituraX(Modelo_ECF, ip_Operador :String): String;
function Exec_ReducaoZ(Modelo_ECF, ip_Operador :String): String;
function ECF_RegistraItem(Modelo_ECF, ip_Codigo_Barras, ip_Nome_Reduzido, ip_Taxa_ICMS :String; ip_QtdeItem, ip_Valor_Unitario, ip_Valor_Total : Real; ip_QtdeReg: Integer): String;
function ECF_CancelaItem(Modelo_ECF, ip_Posicao_Item : String): String;
function Exec_CancelaCupomFiscal(Modelo_ECF, ip_Operador : String): String;
function ECF_FinalizaCupom(Modelo_ECF, ip_FormaPgto, ip_Mensagem : String; ip_Valor_Desconto, ip_ValorPgto: Double; ip_Codigo_Usuario, Sequencia_Venda : Integer; ip_Fechar_Cupom : Boolean): String;
function ECF_LerMemFiscal(Modelo_ECF:String; Data_Inicial, Data_Final, Tipo : String): String;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//                Declarações SHALTER dll dll32phi.dll                        //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

{Funções da DLL Shalter}
function ChangePort (chose:integer): integer;stdcall; external 'dll32phi.dll';
function ecfAbreGaveta: integer;stdcall; external 'dll32phi.dll';
function ecfLeituraX (operador: String): integer;stdcall; external 'dll32phi.dll';
function ecfLineFeed (byEst:Integer; wLin:Integer): integer;stdcall; external 'dll32phi.dll';
function ecfReducaoZ (operador: String): integer;stdcall; external 'dll32phi.dll';
function ecfImpCab (byEst: integer): integer;stdcall; external 'dll32phi.dll';
function ecfVenda_Item (szCodigo: String; szDescricao:String; szQInteira:String; szQFracionada:String; szValor:String; byTaxa:integer): integer;stdcall; external 'dll32phi.dll';
function ecfCancVenda (operador: String): integer;stdcall; external 'dll32phi.dll';
function ecfCancDoc (operador: String): integer;stdcall; external 'dll32phi.dll';

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//                Declarações BEMATECH dll BEMAFI32.DLL                       //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

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

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//                FIM DE Declarações SWEDA dll CONVECF.dll                    //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////


var
  iRetorno, iRetorno_Impressora : Integer;
  //Variaveis utilizadas por sweda SERSWEDA.DLL
  Comando  : array[0..512] of Char;
  Resposta : String;

implementation

uses Unit_Method, Unit_SimNao, Unit_Sweda, pPrincipal;

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
procedure Retorno_Impressora(Modelo_Ecf : String);
  var iACK, iST1, iST2: Integer;
begin
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
              iRetorno := 0;
            end;
          if iST1 >= 64 then
            begin
              iST1 := iST1 - 64;
              MessageTela(True, False, 'POUCO PAPEL',0);
            end;
          if iST1 >= 32 then
            begin
              iST1 := iST1 - 32;
              MessageTela(True, False, 'ST1 - BIT 5 - Erro no Relógio.',0);
              iRetorno := 0;
            end;
          if iST1 >= 16 then
            begin
              iST1 := iST1 - 16;
              MessageTela(True, False, 'ST1 - BIT 4 - Impressora em ERRO.',0);
              iRetorno := 0;
            end;
          if iST1 >= 8 then
            begin
              iST1 := iST1 - 8;
              MessageTela(True, False, 'ST1 - BIT 3 - CMD não iniciado com ESC.',0);
              iRetorno := 0;
            end;
          if iST1 >= 4 then
            begin
              iST1 := iST1 - 4;
              MessageTela(True, False, 'ST1 - BIT 2 - Comando Inexistente.',0);
              iRetorno := 0;
            end;
          if iST1 >= 2 then
            begin
              iST1 := iST1 - 2;
              MessageTela(True, False, 'ST1 - BIT 1 - Cupom Aberto.',0);
              iRetorno := 0;
            end;
          if iST1 >= 1 then
            begin
              iST1 := iST1 - 1;
              MessageTela(True, False, 'ST1 - BIT 0 - Nº de Parâmetros Inválidos.',0);
              iRetorno := 0;
            end;

          // Verifica ST2
          if iST2 >= 128 then
            begin
              iST2 := iST2 - 128;
              MessageTela(True, False, 'ST2 - BIT 7 - Tipo de Parâmetro Inválido.',0);
              iRetorno := 0;
            end;
          if iST2 >= 64 then
            begin
              iST2 := iST2 - 64;
              MessageTela(True, False, 'ST2 - BIT 6 - Memória Fiscal Lotada.',0);
              iRetorno := 0;
            end;
          if iST2 >= 32 then
            begin
              iST2 := iST2 - 32;
              MessageTela(True, False, 'ST2 - BIT 5 - CMOS não Volátil.',0);
              iRetorno := 0;
            end;
          if iST2 >= 16 then
            begin
              iST2 := iST2 - 16;
              MessageTela(True, False, 'ST2 - BIT 4 - Alíquota Não Programada.',0);
              iRetorno := 0;
            end;
          if iST2 >= 8 then
            begin
              iST2 := iST2 - 8;
              MessageTela(True, False, 'ST2 - BIT 3 - Alíquotas lotadas.',0);
              iRetorno := 0;
            end;
          if iST2 >= 4 then
            begin
              iST2 := iST2 - 4;
              MessageTela(True, False, 'ST2 - BIT 2 - Cancelamento não Permitido.',0);
              iRetorno := 0;
            end;
          if iST2 >= 2 then
            begin
              iST2 := iST2 - 2;
              MessageTela(True, False, 'ST2 - BIT 1 - CNPJ/IE não Programados.',0);
              iRetorno := 0;
            end;
          if iST2 >= 1 then
            begin
              iST2 := iST2 - 1;
              MessageTela(True, False, 'ST2 - BIT 0 - Comando não Executado.',0);
              iRetorno := 0;
            end;
        end;

      if iACK = 21 Then
        begin
          MessageTela(True, False, 'Atenção!!!' + #13#10 +
                                   'A Impressora retornou NAK. O programa será Finalizado.',0);
          Application.Terminate;
          Exit;
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
    MessageTela(True, False, 'Soft não programado para o Modelo de ECF - ' + Modelo_ECF,0);
end;

function ECF_ProgramaFormaPagmento(Modelo_ECF, FormaPagto, Normal_TEF : String) : String;
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
  var va_Tipo_Impressora, cNumeroSerie : String;
      iConta       : Integer;
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
        MessageTela(True, False, 'Soft não programado para o Modelo de ECF - ' + Modelo_ECF,0);
End;

function PegaNumerodoCupom(Modelo_ECF : String) : Integer;
var cNumeroCupom: String;
    iConta   : Integer;
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
      MessageTela(True, False, 'Soft não programado para PegaNumerodoCupom no Modelo de ECF - ' + Modelo_ECF,0);
End;

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

function Exec_AbrePorta(Modelo_ECF:String; Porta_Com:Integer): String;
var
  Retorno: Integer;
begin
  if Modelo_ECF = 'SCHALTER SPRINT 3.00' then
    begin
      while True do
        begin
          Retorno := ChangePort(Porta_Com);
          if AvaliaRetorno('SCHALTER SPRINT 3.00',Retorno) = 'OK' then
            break;
        end;
      if Retorno <> Porta_Com then
        begin
          MessageTela(True, False, 'Erro no ECF Durante a Atribuição da Porta COM. Código: '+IntToStr(Retorno)+#13#10+ErroSchalter(Retorno),0);
          Exec_AbrePorta := 'ERRO';
        end;
    end
  else
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
      end;
end;

function Exec_FechaPorta(Modelo_ECF:String): String;
begin
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') then
    begin
      if (Modelo_ECF = 'BEMATECH MP20 FI II') then
        iRetorno := Bematech_FI_FechaPortaSerial()
      else
        if (Modelo_ECF = 'SWEDA ST100') then
          iRetorno := ECF_FechaPortaSerial();
      if iRetorno <> 1 then
         begin
           MessageTela(True, False, 'Erro ao Fechar a Porta.',0);
           Exec_FechaPorta := 'ERRO';
         end;
    end
  else
    if Modelo_ECF = 'SWEDA 9000' then
      begin
         if FechaPorta(frmPrincipal.pu_ECF_Porta) then
           Exec_FechaPorta := 'OK'
         else
           Exec_FechaPorta := 'ERRO';
      end
    else
      MessageTela(True, False, 'Software não programado para Exec_FechaPorta no Modelo ECF ' + Modelo_ECF,0);
end;

function ECF_AbreGaveta(Modelo_ECF:String): String;
var
  Retorno: Integer;
begin
  if Modelo_ECF = 'SCHALTER SPRINT 3.00' then
    begin
      while True do
        begin
          Retorno := ecfAbreGaveta();
          if AvaliaRetorno('SCHALTER SPRINT 3.00',Retorno) = 'OK' then
            break;
        end;
      if Retorno <> 0 then
        begin
          MessageTela(True, False, 'Erro no ECF. Código: '+IntToStr(Retorno)+#13#10+ErroSchalter(Retorno),0);
          ECF_AbreGaveta := 'ERRO';
          Exit;
        end;
    end
  else
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
          MessageTela(True, False, 'Soft não programado para ECF_AbreGaveta no Modelo de ECF - ' + Modelo_ECF,0);
end;

function ECF_SuprimentoSangria(Tipo, Modelo_ECF : String) : String;
var
  Valor : String;
begin
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') then
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
              iRetorno := ECF_Sangria(Valor);
        end
      else
        if UpperCase(Tipo) = 'SU' then
          begin
            if (Modelo_ECF = 'BEMATECH MP20 FI II') then
              iRetorno := Bematech_FI_Suprimento(Valor, 'Dinheiro')
            else
              if (Modelo_ECF = 'SWEDA ST100') then
                iRetorno := ECF_Suprimento(Valor, 'Dinheiro');
          end
        else
          begin
            MessageTela(True, False, 'Tipo #'+Tipo+'# não conhecido.',0);
            Exit;
          end;
      Analisa_iRetorno(Modelo_ECF);
      Retorno_Impressora(Modelo_ECF);
    end
  else
    MessageTela(True, False, 'Soft não programado para ECF_SuprimentoSangria no Modelo de ECF - ' + Modelo_ECF,0);
end;

function Exec_LeituraX(Modelo_ECF, ip_Operador :String): String;
var
  Retorno: Integer;
  VOperador: String;
begin
  if Modelo_ECF = 'SCHALTER SPRINT 3.00' then
    begin
      VOperador := Copy(ip_Operador,1,8);
      while True do
        begin
          Retorno := ecfLeituraX(VOperador);
          if AvaliaRetorno('SCHALTER SPRINT 3.00',Retorno) = 'OK' then
            break;
        end;
      if Retorno <> 0 then
        begin
          MessageTela(True, False, 'Erro no ECF. Código: '+IntToStr(Retorno)+#13#10+ErroSchalter(Retorno),0);
          Exec_LeituraX := 'ERRO';
          Exit;
        end;
      while True do
        begin
          Retorno := ecfLineFeed(1,10);
          if AvaliaRetorno('SCHALTER SPRINT 3.00',Retorno) = 'OK' then
            break;
        end;
    end
  else
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
        MessageTela(True, False, 'Soft não programado para Exec_LeituraX no Modelo de ECF - ' + Modelo_ECF,0);
end;

function Exec_ReducaoZ(Modelo_ECF, ip_Operador :String): String;
var
  Retorno: Integer;
  VOperador: String;
begin
  if Modelo_ECF = 'SCHALTER SPRINT 3.00' then
    begin
      VOperador := Copy(ip_Operador,1,8);
      while True do
        begin
          Retorno := ecfReducaoZ(VOperador);
          if AvaliaRetorno('SCHALTER SPRINT 3.00',Retorno) = 'OK' then
            break;
        end;
      if Retorno <> 0 then
        begin
          if Retorno = 78 then
            begin
              MessageTela(True, False, 'Número máximo de reduções Z alcançado.',0);
              Exec_ReducaoZ := 'ERRO';
              Exit;
            end
          else
            begin
              if Retorno = 115 then
                begin
                  MessageTela(True, False, 'Redução Z já realizada.',0);
                  Exec_ReducaoZ := 'ERRO';
                  Exit;
                end
              else
                begin
                  MessageTela(True, False, 'Erro no ECF. Código: '+IntToStr(Retorno)+#13#10+ErroSchalter(Retorno),0);
                  Exec_ReducaoZ := 'ERRO';
                  Exit;
                end;
            end;
        end;
      while True do
        begin
          Retorno := ecfLineFeed(1,10);
          if AvaliaRetorno('SCHALTER SPRINT 3.00',Retorno) = 'OK' then
            break;
        end;
      Exit;
    end
  else
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
        MessageTela(True, False, 'Soft não programado para Exec_ReducaoZ no Modelo de ECF - ' + Modelo_ECF, 0);
end;

function ECF_RegistraItem(Modelo_ECF, ip_Codigo_Barras, ip_Nome_Reduzido, ip_Taxa_ICMS :String; ip_QtdeItem, ip_Valor_Unitario, ip_Valor_Total : Real; ip_QtdeReg: Integer): String;
var
  I, iDecimal, Retorno, VTaxa: Integer;
  vaTaxa_ECF, VCodigo, VDescricao, VQtde_I, VQtde_F, VValor,
  sTipoDesconto, VQtde_Formatado, VValor_Formatado : String;
  va_Pouco_Papel, va_Cupom_Aberto : Boolean;
begin
  if Modelo_ECF = 'SCHALTER SPRINT 3.00' then
    begin
      if ip_QtdeReg = 1 then
        begin
          while True do
            begin
              Retorno := ecfImpCab(4);
              if AvaliaRetorno('SCHALTER SPRINT 3.00',Retorno) = 'OK' then
                break;
            end;
          if (Retorno <> 0) and (Retorno <> 68) then
            begin
              if (Retorno = 108) or (Retorno = 113) then
                begin
                  MessageTela(True, False, 'O Fechamento do dia anterior não foi realizado. '+#13#10+
                                           'É necessário fazer o fechamento, Redução Z, antes de iniciar o movimento de hoje.',0);
                  ECF_RegistraItem := 'ERRO';
                  Exit;
                end
              else
                begin
                  if (Retorno = 114) or (Retorno = 115) then
                     begin
                       MessageTela(True, False, 'O Fechamento deste dia já foi realizado. '+#13#10+
                                                'Não é possível registrar mais nenhum cupom neste dia.',0);
                       ECF_RegistraItem := 'ERRO';
                       Exit;
                     end
                  else
                    begin
                      MessageTela(True, False, 'Erro no ECF. Código: '+IntToStr(Retorno)+#13#10+ErroSchalter(Retorno),0);
                      ECF_RegistraItem := 'ERRO';
                      Exit;
                    end;
                end;
            end;
        end;
      VCodigo := Copy(ip_Codigo_Barras,1,13);
      VDescricao := ip_Nome_Reduzido;
      VQtde_Formatado := FormatFloat('000,000,000.000', ip_QtdeItem);
      VQtde_I := Copy(VQtde_Formatado,9,3);
      VQtde_F := Copy(VQtde_Formatado,13,3);
      VValor_Formatado := FormatFloat('000,000,000.00', ip_Valor_Unitario);
      VValor := IntToStr(StrToInt(Copy(VValor_Formatado,3,1)+Copy(VValor_Formatado,5,3)+Copy(VValor_Formatado,9,3)+Copy(VValor_Formatado,13,2)));
(*
      if Copy(DM1.TbIteSelTaxaECF.Value,1,3) = 'T01' then {7%}
        VTaxa := Trunc(DM1.TableConfigFT01.Value);
      if Copy(DM1.TbIteSelTaxaECF.Value,1,3) = 'T02' then {10%}
        VTaxa := Trunc(DM1.TableConfigFT02.Value);
      if Copy(DM1.TbIteSelTaxaECF.Value,1,3) = 'T03' then {12%}
        VTaxa := Trunc(DM1.TableConfigFT03.Value);
      if Copy(DM1.TbIteSelTaxaECF.Value,1,3) = 'T04' then {17%}
        VTaxa := Trunc(DM1.TableConfigFT04.Value);
      if Copy(DM1.TbIteSelTaxaECF.Value,1,3) = 'T05' then {25%}
        VTaxa := Trunc(DM1.TableConfigFT05.Value);
      if Copy(DM1.TbIteSelTaxaECF.Value,1,3) = 'T06' then {S.T}
        VTaxa := Trunc(DM1.TableConfigFT06.Value);
      if Copy(DM1.TbIteSelTaxaECF.Value,1,3) = 'T07' then {ISENTO}
        VTaxa := Trunc(DM1.TableConfigFT07.Value);
      if Copy(DM1.TbIteSelTaxaECF.Value,1,3) = 'T08' then {12%}
        VTaxa := Trunc(DM1.TableConfigFT08.Value);
      if Copy(DM1.TbIteSelTaxaECF.Value,1,3) = 'T09' then {17%}
        VTaxa := Trunc(DM1.TableConfigFT09.Value);
        *)
      while True do
        begin
          Retorno := ecfVenda_Item(VCodigo, VDescricao, VQtde_I, VQtde_F, VValor, VTaxa);
          if AvaliaRetorno('SCHALTER SPRINT 3.00',Retorno) = 'OK' then
            break;
        end;
      if Retorno <> 0 then
        begin
          if (Retorno = 108) or (Retorno = 113) then
            begin
              MessageTela(True, False, 'O Fechamento do dia anterior não foi realizado. '+#13#10+
                                       'É necessário fazer o fechamento, Redução Z, antes de iniciar o movimento de hoje.',0);
              ECF_RegistraItem := 'ERRO';
              Exit;
            end
          else
            begin
              if (Retorno = 114) or (Retorno = 115) then
                 begin
                   MessageTela(True, False, 'O Fechamento deste dia já foi realizado. '+#13#10+
                                            'Não é possível registrar mais nenhum cupom neste dia.',0);
                   ECF_RegistraItem := 'ERRO';
                   Exit;
                 end
              else
                begin
                  MessageTela(True, False, 'Erro no ECF. Código: '+IntToStr(Retorno)+#13#10+ErroSchalter(Retorno),0);
                  ECF_RegistraItem := 'ERRO';
                  Exit;
                end;
            end;
        end;
      Exit;
    end
  else
    if (Modelo_ECF = 'BEMATECH MP20 FI II') or
       (Modelo_ECF = 'SWEDA ST100') then
      begin
        if ip_QtdeReg = 1 then//Primeiro item vendido vamos abrir o cupom fiscal
          begin
            //Vamos testar se tem pouco papel;
            ECF_Pouco_Papel_Aberto(Modelo_ECF, va_Pouco_Papel, va_Cupom_Aberto);
            if va_Pouco_Papel then
              if not(MessageTela(True, True, 'Atenção, POUCO Papel no ECF.' + #13#10 +
                                             'Deseja Continuar?',0)) then
                Exit;
            if va_Cupom_Aberto then
              if not(MessageTela(True, False, 'Atenção, Cupom Fiscal já esta aberto.' + #13#10 +
                                              'Cancele o Cupom Fiscal Aberto e Tente Novamente.' + #13#10 +
                                              'Item não foi Registrado.',0)) then

                Exit;
                
            if (Modelo_ECF = 'BEMATECH MP20 FI II') then
              iRetorno := Bematech_FI_AbreCupom( Pchar( '' ) )
            else
              if (Modelo_ECF = 'SWEDA ST100') then
                iRetorno := ECF_AbreCupom(Pchar(''));
            Analisa_iRetorno(Modelo_ECF);
            Retorno_Impressora(Modelo_ECF);
            if iRetorno <> 1 then//Retorno diferente de 1(um) não conseguiu abrir o cupom fiscal vamos parar.
              begin
                MessageTela(True, False, 'Feche a Tela de Venda Digitação e Entre Novamente.',0);
                ECF_RegistraItem := 'ERRO';
                Exit;
              end;
          end;

        iDecimal := 2;//Quantide de casas decimais do valor unitário 2 ou 3;
        sTipoDesconto := '%';
        if (Modelo_ECF = 'BEMATECH MP20 FI II') then
          iRetorno := Bematech_FI_VendeItem( ip_Codigo_Barras,
                                             ip_Nome_Reduzido,
                                             ip_Taxa_ICMS,
                                             'F',
                                             SoNumeros(FormatFloat('########0.000',ip_QtdeItem)),//Passa so numeros e com tres ultimas casas são para fração,
                                             iDecimal,
                                             SoNumeros(FormatFloat('########0.00', ip_Valor_Unitario)),//Passa so numeros e com duas ultimas casas são para os centavos,
                                             sTipoDesconto,
                                             '0000')//ValorDesconto: String com até 8 dígitos para desconto por valor (2 casas decimais) e 4 dígitos para desconto percentual)
        else
          if (Modelo_ECF = 'SWEDA ST100') then
            iRetorno := ECF_VendeItem( ip_Codigo_Barras,
                                       ip_Nome_Reduzido,
                                       ip_Taxa_ICMS,
                                       'F',
                                       SoNumeros(FormatFloat('########0.000',ip_QtdeItem)),//Passa so numeros e com tres ultimas casas são para fração,
                                       iDecimal,
                                       SoNumeros(FormatFloat('########0.00', ip_Valor_Unitario)),//Passa so numeros e com duas ultimas casas são para os centavos,
                                       sTipoDesconto,
                                       '0000');//ValorDesconto: String com até 8 dígitos para desconto por valor (2 casas decimais) e 4 dígitos para desconto percentual)

        Analisa_iRetorno(Modelo_ECF);
        Retorno_Impressora(Modelo_ECF);
        if iRetorno = 1 then//iRetorno é igual a 1 então tudo certo
          Result := 'OK';
      end
    else
      if Modelo_ECF = 'SWEDA 9000' then
        begin
          if ip_QtdeReg = 1 then//vamos testar se tem cupom aberto se não tiver vamos abrir
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
          if ip_Taxa_ICMS = 'FF' then
            ip_Taxa_ICMS := 'F  '
          else
            if ip_Taxa_ICMS = 'II' then
              ip_Taxa_ICMS := 'I  '
            else
              if ip_Taxa_ICMS = 'NN' then
                ip_Taxa_ICMS := 'N  '
              else
                begin
                  //vamos achar em qual posição esta a aliquota;
                  vaTaxa_ECF := 'T00';
                  for I := 1 to (frmPrincipal.pu_ECF_Qtde_Posicoes)  do
                    if (frmPrincipal.pu_ECF_Aliquotas[I]) = (SoNumeros(ip_Taxa_ICMS)) then
                      vaTaxa_ECF := 'T' + IntToStrZero(I,2);
                  ip_Taxa_ICMS := vaTaxa_ECF;    
                end;
          if ip_Taxa_ICMS = 'T00' then
            begin
              MessageTela(True, False, 'Não foi encontrado a posição da aliquota no ECF.',0);
              Exit;
            end;
          StrPCopy(Comando,#27+'.01' + Preenchimento(ip_Codigo_Barras, ' ', 13, False) + //Codigo Barra;
                                       Preenchimento(SoNumeros(FormatFloat('########0.000',ip_QtdeItem)), '0', 7, False)  + //Passa so numeros e com tres ultimas casas são para fração
                                       Preenchimento(SoNumeros(FormatFloat('########0.00',ip_Valor_Unitario)), '0', 9, False)  + //Passa so numeros e com duas ultimas casas são para centavos
                                       Preenchimento(SoNumeros(FormatFloat('########0.00',ip_Valor_Total)), '0', 12, False) + //Passa so numeros e com dizendo o valor total do item
                                       Preenchimento(Copy(ip_Nome_Reduzido,1,24),' ', 24, True) + //Nome do Item;
                                       ip_Taxa_ICMS +
                                       '}'); // Vamos fazer venda do item
          Resposta := EnviaComando(Comando);
          if Analiza_Resposta_SerSweda(Resposta) then
            Result := 'OK'
          else
            if ip_QtdeReg = 1 then
              Exec_CancelaCupomFiscal(Modelo_ECF, 'CancItem');
        end
      else
        MessageTela(True, False, 'Soft não programado para ECF_RegistraItem no Modelo de ECF - ' + Modelo_ECF,0);
end;

function ECF_CancelaItem(Modelo_ECF, ip_Posicao_Item : String): String;
var
  Retorno: Integer;
begin
  if Modelo_ECF = 'SCHALTER SPRINT 3.00' then
    begin
      while True do
        begin
//aqui          Retorno := ecfCancItemDef(IntToStrZero('0',Posicao_Item),4),'Cancelamento Item Anterior');
          if AvaliaRetorno('SCHALTER SPRINT 3.00',Retorno) = 'OK' then
            break;
        end;
      if Retorno <> 0 then
        begin
          if (Retorno = 108) or (Retorno = 113) then
            begin
              MessageTela(True, False, 'O Fechamento do dia anterior não foi realizado. '+#13#10+
                                       'É necessário fazer o fechamento, Redução Z, antes de iniciar o movimento de hoje.',0);
              ECF_CancelaItem := 'ERRO';
              Exit;
            end
          else
            begin
              if (Retorno = 114) or (Retorno = 115) then
                begin
                  MessageTela(True, False, 'O Fechamento deste dia já foi realizado. '+#13#10+
                                           'Não é possível registrar mais nenhum cupom neste dia.',0);
                  ECF_CancelaItem := 'ERRO';
                  Exit;
                end
              else
                begin
                  MessageTela(True, False, 'Erro no ECF. Código: '+IntToStr(Retorno)+#13#10+ErroSchalter(Retorno),0);
                  ECF_CancelaItem := 'ERRO';
                  Exit;
                end;
            end;
        end;
      Exit;
    end
  else
    if (Modelo_ECF = 'BEMATECH MP20 FI II') or
       (Modelo_ECF = 'SWEDA ST100') then
      begin
        if (Modelo_ECF = 'BEMATECH MP20 FI II') then
          iRetorno := Bematech_FI_CancelaItemGenerico(ip_Posicao_Item)
        else
          if Modelo_ECF = 'SWEDA ST100' then
            iRetorno := ECF_CancelaItemGenerico(ip_Posicao_Item);
        Analisa_iRetorno(Modelo_ECF);
        Retorno_Impressora(Modelo_ECF);
        if iRetorno = 1 then//Retorno 1 = tudo certo.
          ECF_CancelaItem := 'OK';
      end
    else
      if Modelo_ECF = 'SWEDA 9000' then
        begin
          StrPCopy(Comando,#27+'.04'+ Preenchimento(ip_Posicao_Item, '0', 3, False) +'}'); // Cancelamento do item registrado na venda em andamento
          Resposta := EnviaComando(Comando);
          if Analiza_Resposta_SerSweda(Resposta) then
            ECF_CancelaItem := 'OK';
        end
      else
        MessageTela(True, False, 'Soft não programado para ECF_CancelaItem no Modelo de ECF - ' + Modelo_ECF,0);
end;

function ECF_CancelaVenda(Modelo_ECF, ip_Operador :String): String;
var
  Retorno: Integer;
  VOperador: String;
begin
  if Modelo_ECF = 'SCHALTER SPRINT 3.00' then
    begin
      VOperador := Copy(ip_Operador,1,8);
      while True do
        begin
          Retorno := ecfCancVenda(VOperador);
          if AvaliaRetorno('SCHALTER SPRINT 3.00',Retorno) = 'OK' then
            break;
        end;
      if Retorno <> 0 then
        begin
          if (Retorno = 108) or (Retorno = 113) then
            begin
              MessageTela(True, False, 'O Fechamento do dia anterior não foi realizado. '+#13#10+
                                       'É necessário fazer o fechamento, Redução Z, antes de iniciar o movimento de hoje.',0);
              ECF_CancelaVenda := 'ERRO';
              Exit;
            end
          else
            begin
              if (Retorno = 114) or (Retorno = 115) then
                begin
                  MessageTela(True, False, 'O Fechamento deste dia já foi realizado. '+#13#10+
                                           'Não é possível registrar mais nenhum cupom neste dia.',0);
                  ECF_CancelaVenda := 'ERRO';
                  Exit;
                end
              else
                begin
                  MessageTela(True, False, 'Erro no ECF. Código: '+IntToStr(Retorno)+#13#10+ErroSchalter(Retorno),0);
                  ECF_CancelaVenda := 'ERRO';
                  Exit;
                end;
            end;
        end;
      while True do
        begin
          Retorno := ecfLineFeed(1,10);
          if AvaliaRetorno('SCHALTER SPRINT 3.00',Retorno) = 'OK' then
            break;
        end;
    end
  else
    begin
      MessageTela(True, False, 'Soft não programado para fazer ECF_CancelaVenda com Modelo ' + Modelo_ECF, 0);
      ECF_CancelaVenda := 'ERRO';
    end;
end;

function Exec_CancelaCupomFiscal(Modelo_ECF, ip_Operador :String): String;
var
  Retorno: Integer;
  VOperador : String;
begin
  if Modelo_ECF = 'SCHALTER SPRINT 3.00' then
    begin
      VOperador := Copy(ip_Operador,1,8);
      while True do
        begin
          Retorno := ecfCancDoc(VOperador);
          if AvaliaRetorno('SCHALTER SPRINT 3.00',Retorno) = 'OK' then
            break;
        end;
      if Retorno <> 0 then
        begin
          if (Retorno = 108) or (Retorno = 113) then
            begin
              MessageTela(True, False, 'O Fechamento do dia anterior não foi realizado. '+#13#10+
                                       'É necessário fazer o fechamento, Redução Z, antes de iniciar o movimento de hoje.'+#13#10+
                                       'Será impossível cancelar este cupom.',0);
              Exec_CancelaCupomFiscal := 'ERRO';
              Exit;
            end
          else
            begin
              if (Retorno = 114) or (Retorno = 115) then
                begin
                  MessageTela(True, False, 'O Fechamento deste dia já foi realizado. '+#13#10+
                                           'Não é possível registrar mais nenhum cupom neste dia.'+#13#10+
                                           'Será impossível cancelar este cupom',0);
                  Exec_CancelaCupomFiscal := 'ERRO';
                  Exit;
                end
              else
                begin
                  MessageTela(True, False, 'Erro no ECF. Código: '+IntToStr(Retorno)+#13#10+ErroSchalter(Retorno),0);
                  Exec_CancelaCupomFiscal := 'ERRO';
                  Exit;
                end;
            end;
        end;
      while True do
        begin
          Retorno := ecfLineFeed(1,10);
          if AvaliaRetorno('SCHALTER SPRINT 3.00',Retorno) = 'OK' then
            break;
        end;
      Exit;
    end
  else
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
          Exec_CancelaCupomFiscal := 'OK';
      end
    else
      if (Modelo_ECF = 'SWEDA 9000') then
        begin
          StrPCopy(Comando,#27+'.05}'); // Cancela o cupom fiscal anterio
          Resposta := EnviaComando(Comando);
          if Analiza_Resposta_SerSweda(Resposta) then
            Exec_CancelaCupomFiscal := 'OK';
        end
      else
        MessageTela(True, False, 'Soft não programado para Exec_CancelaCupomFiscal no Modelo de ECF - ' + Modelo_ECF,0);
end;

function ECF_FinalizaCupom(Modelo_ECF, ip_FormaPgto, ip_Mensagem : String; ip_Valor_Desconto, ip_ValorPgto: Double; ip_Codigo_Usuario, Sequencia_Venda : Integer; ip_Fechar_Cupom : Boolean) : String;
var
  va_mensagem : String;
begin
  if (Modelo_ECF = 'BEMATECH MP20 FI II') or
     (Modelo_ECF = 'SWEDA ST100') then
    begin
      // 'A' para Acréscimo
      // 'D' para Desconto
      // '%' para Percentual
      // '$' para Valor
      if (LerIni(gsAppPath, 'Fechamento.ini', 'PAGAMENTOS', 'INICIO_FECHAMENTO') <> 'SIM') then//não fez fechamento vamos fazer...
        begin//Inicia o fechamento cupom fiscal
          if (Modelo_ECF = 'BEMATECH MP20 FI II') then
            iRetorno := Bematech_FI_IniciaFechamentoCupom('D', '$', FormatFloat('###,###,##0.00', ip_Valor_Desconto))
          else
            if (Modelo_ECF = 'SWEDA ST100') then
              iRetorno := ECF_IniciaFechamentoCupom('D', '$', FormatFloat('########0.00', ip_Valor_Desconto));
          Analisa_iRetorno(Modelo_ECF);
          Retorno_Impressora(Modelo_ECF);
          if iRetorno <> 1 then//Deu erro
            begin
              ECF_FinalizaCupom := 'ERRO';
              Exit;
            end;
          GravarINI(gsAppPath, 'Fechamento.ini', 'PAGAMENTOS', 'INICIO_FECHAMENTO', 'SIM');
        end;

      if ip_ValorPgto > 0 then
        begin
          if (Modelo_ECF = 'BEMATECH MP20 FI II') then
            iRetorno := Bematech_FI_EfetuaFormaPagamento( ip_FormaPgto, FormatFloat('###,###,##0.00', ip_ValorPgto))
          else
            if (Modelo_ECF = 'SWEDA ST100') then
              iRetorno := ECF_EfetuaFormaPagamento( ip_FormaPgto, FormatFloat('###,###,##0.00', ip_ValorPgto));
          Analisa_iRetorno(Modelo_ECF);
          Retorno_Impressora(Modelo_ECF);
          if iRetorno <> 1 then//deu erro
            begin
              ECF_FinalizaCupom := 'ERRO';
              Exit;
            end;
        end;

      //Fechamento do cupom fiscal
      if ip_Fechar_Cupom then
        if (LerIni(gsAppPath, 'Fechamento.ini', 'PAGAMENTOS', 'TEM_FECHAMENTO') <> 'SIM') then//não fez fechamento vamos fazer...
          begin
            if (Modelo_ECF = 'BEMATECH MP20 FI II') then
              iRetorno := Bematech_FI_TerminaFechamentoCupom('Venda '+IntToStr(Sequencia_Venda) + ' - Usuario '+ IntToStr(ip_Codigo_Usuario) + #13#10 + ip_Mensagem)
            else
              if (Modelo_ECF = 'SWEDA ST100') then
                iRetorno := ECF_TerminaFechamentoCupom('Venda '+IntToStr(Sequencia_Venda) + ' - Usuario '+ IntToStr(ip_Codigo_Usuario) + #13#10 + ip_Mensagem);
            Analisa_iRetorno(Modelo_ECF);
            Retorno_Impressora(Modelo_ECF);
            if iRetorno <> 1 then//deu erro
              begin
                ECF_FinalizaCupom := 'ERRO';
                Exit;
              end;
            GravarINI(gsAppPath, 'Fechamento.ini', 'PAGAMENTOS', 'INICIO_FECHAMENTO', 'NAO');
            GravarINI(gsAppPath, 'Fechamento.ini', 'PAGAMENTOS', 'TEM_FECHAMENTO', 'NAO');
          end;
    end
  else
    if Modelo_ECF = 'SWEDA 9000' then
      begin
(*        //forma de pagamento dinheiro
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
        Form_VendaVisual.Limpa_Inf_Fechamento;*)
        MessageTela(True, False, 'Soft não programado para ECF_FinalizaCupom no Modelo de ECF - ' + Modelo_ECF,0);
      end
    else
      MessageTela(True, False, 'Soft não programado para ECF_FinalizaCupom no Modelo de ECF - ' + Modelo_ECF,0);
end;

function ECF_LerMemFiscal(Modelo_ECF:String; Data_Inicial, Data_Final, Tipo : String): String;
var
  Retorno: Integer;
  va_Tipo_Impressora : String;
begin
  if Modelo_ECF = 'SCHALTER SPRINT 3.00' then
    begin
(*      while True do
        begin
//          if Tipo_Leitura = 0 then
            Retorno := ecfLeitMemFisc(1,Data_Inicial,Data_Final,1,2,'LeMemFis');
  //        else
    //        Retorno := ecfLeitMemFisc(3,Data_Inicial,Data_Final,1,2,Arquivo_Fiscal);
          if AvaliaRetorno('SCHALTER SPRINT 3.00',Retorno) = 'OK' then
            break;
        end;
      if Retorno <> 0 then
        begin
          MessageTela(True, False, 'Erro no ECF. Código: '+IntToStr(Retorno)+#13#10+ErroSchalter(Retorno),0);
          ECF_LerMemFiscal := 'ERRO';
          Exit;
        end;
//      if Tipo_Leitura = 0 then
        begin
          while True do
            begin
              Retorno := ecfLineFeed(1,10);
              if AvaliaRetorno('SCHALTER SPRINT 3.00',Retorno) = 'OK' then
                break;
            end;
        end;
        *)
      MessageTela(True, False, 'Soft não programado para ECF_LerMemFiscal no Modelo de ECF - ' + Modelo_ECF,0);
    end
  else
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
        MessageTela(True, False, 'Soft não programado para ECF_LerMemFiscal no Modelo de ECF - ' + Modelo_ECF,0);
end;

end.
