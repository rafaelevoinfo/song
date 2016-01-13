unit pLaudoLabImp;

interface

uses
  printers, Cripto, pMethod2009,
  pZero, pGridValues, ppmClasse, DBClient, uFServidor, System.Json, pCarregarDados,
  SqlExpr, Generics.Collections,

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ProfGrid, ExtCtrls, ComCtrls, StdCtrls, DBCtrls,
  Db, IBX.IBCustomDataSet, IBX.IBStoredProc, jpeg, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxCore, dxCoreClasses,
  dxHashUtils, dxSpreadSheetCore, dxSpreadSheetPrinting, dxSpreadSheetFormulas,
  dxSpreadSheetFunctions, dxSpreadSheetGraphics, dxSpreadSheetClasses,
  dxSpreadSheetTypes, dxSkinsCore, pmPromedicoSkin, dxSkinscxPCPainter,
  dxBarBuiltInMenu, dxSpreadSheet, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, ppBands, ppCache, ppDesignLayer, ppParameter, ppStrtch,
  ppRichView, ppPrnabl, ppCtrls, ppTypes, ppRichTx, dxGDIPlusClasses,
  System.Math, System.Generics.Collections, pmClientDataSet, RVScroll, RichView,
  RVEdit, System.RegularExpressions, SclRView, DBSRVE, CRVFData,
  System.Variants, RVStyle, PtblRV, RVReport, pTypes, System.Generics.Defaults,
  dxSpreadSheetCoreHistory;

type
{$REGION 'TExameLabTamanho - Type criado para guardar o tamanho do exame.'}
  /// <summary>TExameLabTamanho - Type criado para guardar o tamanho do
  /// exame.</summary>
  /// <remarks>Utilizado para saber o codigo do Exame Laboratorio o Tamanho que
  /// o mesmo ir� ocupar na impress�o.</remarks>
{$ENDREGION}
  TExameLabTamanho = Record
    Codigo: Integer;
    Tamanho: Integer;
    NewPage: Integer; // sera utilizado para saber se � ou nao para dar uma nova pagina; [-1=N�o Cabe Folha|0-Nao|1-Sim];
    // informa��es necessarias para nao precisar mais dos CDS
    NomeProcedimento: String;
    Origem: String;
    Convenio: String;
    Solicitante: String;
    DataHoraLiberacao: TDateTime;
    CodigoUsuarioLiberou: Integer;
  end;

  TPaciente = Record
    DataNascimento: TDateTime;
    idade: Integer;
    unidadeIdade: string;
    Sexo: string;
  end;

  TModeloInfo = record
    Codigo: Integer;
    Versao: Integer;
  end;

  TLaudoLabFormula = class
  public
{$REGION 'Documentation'}
    /// <summary>Verifica se a condi��o de uma formula � verdadeira ou
    /// nao.</summary>
{$ENDREGION}
    class function fpuVerificarCondicaoFormula(ipCondicao: string; ipDecimais: Integer;
      ipPaciente: TPaciente; ipSheet: TdxSpreadSheet; ipGridValues: TArrayOfArrayOfTMyGridConf): boolean;

{$REGION 'Documentation'}
    /// <summary>Calcula uma formula criada para os laudos de
    /// laborat�rio.</summary>
    /// <param name="ipFormula">Uma string contendo a formula</param>
    /// <param name="ipUnidadeIdade">Unidade da Idade do pacientes, Anos, meses
    /// ou dias.</param>
    /// <param name="ipSexo">Sexo do paciente</param>
    /// <param name="ipIdade">Idade do paciente</param>
    /// <param name="ipDecimais">Quant. de casas apos a virgula</param>
    /// <param name="ipRetirarDecimal">Se True troca virgula(,) por ponto(.) no
    /// resultado.</param>
    /// <param name="ipGridValues">Array de array de TMyGridConf contendo as
    /// informa��es de todas as celulas do laudo.</param>
{$ENDREGION}
    class function fpuTraduzirFormula(ipFormula: string; ipDecimais: Integer; ipRetirarDecimal: boolean; ipPaciente: TPaciente; ipGridValues: TArrayOfArrayOfTMyGridConf): String;

{$REGION 'Documentation'}
    /// <summary>Extrai o valor de ipCelula do ipGridValues.</summary>
{$ENDREGION}
    class function fpuTraduzirCelula(ipCelula: String; ipDecimais: Integer; ipGridValues: TArrayOfArrayOfTMyGridConf): String;

    class function fpuCalcularFormula(ipFormula: String; ipDecimais: Integer; ipPaciente: TPaciente; ipGridValues: TArrayOfArrayOfTMyGridConf; ipSheet: TdxSpreadSheet): Double;

  end;

  TfrmLaudoLabImp = class(TfrmZero) // FormAntigo TfrmZero)
    ProfGrid1: TProfGrid;
    sheet: TdxSpreadSheet;
    ppImpLaudo: TppReport;
    ppDBDados: TppDBPipeline;
    cdsDados: TClientDataSet;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    cdsDadosLAUDO: TBlobField;
    dsDados: TDataSource;
    dsInfoExtras: TDataSource;
    ppDBInfoExtras: TppDBPipeline;
    cdsDadosCODIGO: TIntegerField;
    cdsDadosORDEM_IMPRESSAO: TIntegerField;
    cdsDadosUSUARIOLIBEROU: TIntegerField;
    cdsDadosLARGURA_LAUDO: TIntegerField;
    cdsDadosALTURA_LAUDO: TIntegerField;
    cdsDadosORDEM_SESSAO: TIntegerField;
    cdsDadosCODIGO_SESSAO: TIntegerField;
    cdsInfoExtras: TClientDataSet;
    cdsInfoExtrasIMG_CABECALHO: TBlobField;
    cdsInfoExtrasCABECALHO: TBlobField;
    cdsInfoExtrasRODAPE: TBlobField;
    cdsInfoExtrasSUMARIO: TBlobField;
    cdsInfoExtrasIMG_ASSINATURA: TBlobField;
    cdsInfoExtrasLEFT_ASSINATURA: TIntegerField;
    cdsInfoExtrasTOP_ASSINATURA: TIntegerField;
    cdsInfoExtrasMD5: TStringField;
    cdsInfoExtrasCODIGO_EXAME: TIntegerField;
    cdsInfoExtrasDATA_EXAME: TDateTimeField;
    cdsInfoExtrasNOME_PROCEDIMENTO: TStringField;
    cdsInfoExtrasMATERIAL: TStringField;
    cdsInfoExtrasNROFICHA: TIntegerField;
    cdsInfoExtrasNOME_PACIENTE: TStringField;
    cdsInfoExtrasESTADO_CIVIL: TStringField;
    cdsInfoExtrasPROFISSAO: TStringField;
    cdsInfoExtrasSEXO: TStringField;
    cdsInfoExtrasNATURALIDADE: TStringField;
    cdsInfoExtrasDATA_NASCIMENTO: TDateTimeField;
    cdsInfoExtrasRG: TStringField;
    cdsInfoExtrasIDADE: TStringField;
    cdsInfoExtrasMEDICO_SOLICITANTE: TStringField;
    cdsInfoExtrasCONVENIO: TStringField;
    RichTemp: TSRichViewEdit;
    ppImgCabecalho: TppDBImage;
    ppRichCabecalho: TppDBRichView;
    ppImgLaudo: TppDBImage;
    ppRichRodape: TppDBRichView;
    ppMD5: TppDBText;
    ppRichSumario: TppDBRichView;
    ppImgAssinatura: TppDBImage;
    cdsDadosPAGINA: TIntegerField;
    rvHelper: TRVReportHelper;
    RVStyle: TRVStyle;
    function NumberOfColumn(Column: String): Integer;
    function IntToAlignment(MyNumber: Integer): TAlignment;
    function StrToStyles(MyString: String): TFontStyles;

    procedure Atribuir_Chave(Chave, Campo: String; Editor: TRichEdit);
  private
    pvModelos: TDictionary<Integer, TModeloInfo>;
    pvMd5: string;
    pvGridValues: TArrayOfArrayOfTMyGridConf; // Array of Array of TMyGridConf
    pvPaciente: TPaciente;
    FcdslkModelo_Lab: TClientDataSet;
    FcdslkMlLabRef: TClientDataSet;
    FcdsExame: TClientDataSet;
    FcdslkFichas: TClientDataSet;
    FcdslkConfigFrm_Texto: TClientDataSet;
    FcdslkModelo_Lab_Campo_Resultados: TClientDataSet;
    FDataSis: TDateTime;
    FcdslkMedicos: TClientDataSet;
    FcdslkMedicos_Assinatura: TClientDataSet;
    FcdslkConfigFrm_AssDigital: TClientDataSet;
    FProxyProcedimentos: TSMFuncoesProcedimentosClient;
    FInserirMd5: boolean;
    FcdslkSenhaUs: TClientDataSet;
    FCallBackLog: TCallBackLog;
    FImprimirAssDigitalPorLaudo: boolean;
    FcdslkExameProc: TClientDataSet;
    FcdslkExameSessao: TClientDataSet;
    FNomeConvenio: String;
    FNomeSolicitante: String;
    FQuantidadePaginasImpressas: Integer;
    FTotalPaginas: Integer;
    FcdslkModelo_Lab_Rodape: TClientDataSet;
    procedure LoadToGrid;
    function fpvFormatarValor(ipTipo: TTipoDado; ipRefText, ipUnidade: string; ipDecimais: Integer; ipRefMin, ipRefMax: Double): string;
    procedure ppvProcessarFormulas;
    procedure ppvCalcularFormatarFormula(ipCol, ipRow: Integer);
    procedure ppvPreencherReferencias();
    procedure SetcdslkModeloLab(const Value: TClientDataSet);
    procedure SetcdsExame(const Value: TClientDataSet);
    procedure SetcdslkConfigFrm_Texto(const Value: TClientDataSet);
    procedure SetcdslkFichas(const Value: TClientDataSet);
    procedure SetcdslkMlLabRef(const Value: TClientDataSet);
    procedure SetcdslkModelo_Lab_Campo_Resultados(const Value: TClientDataSet);
    procedure SetDataSis(const Value: TDateTime);
    procedure SetcdslkMedicos(const Value: TClientDataSet);
    procedure SetcdslkMedicos_Assinatura(const Value: TClientDataSet);
    procedure SetcdslkConfigFrm_AssDigital(const Value: TClientDataSet);
    procedure SetProxyProcedimentos(const Value: TSMFuncoesProcedimentosClient);
    function ppvValidarColRow(ipCol, ipRow: Integer;
      ipGridValues: TArrayOfArrayOfTMyGridConf): boolean;

    procedure SetInserirMd5(const Value: boolean);
    function fpvPegarInfoModelo(ipCodExameProc: Integer): boolean;
    procedure SetcdslkSenhaUs(const Value: TClientDataSet);
    procedure SetCallBackLog(const Value: TCallBackLog);
    procedure ppvGravarLog(ipMsg: String);
    function fpvCarregarAssinaturaDigital(ipUsuarioLiberou: Integer): TStream;
    procedure SetImprimirAssDigitalPorLaudo(const Value: boolean);

    procedure ppvAjustarTamanhoLaudos(ipDetailHeight: Integer; var opAlturaAcumulada: Integer);
    procedure ppvCriarGrafico(ipValor: String; ipTipoRef: TTipoReferencia; ipValorRefMin, ipValorRefMax: Double; ipColDestRef, ipRowDestRef: Integer);
    procedure SetcdslkExameProc(const Value: TClientDataSet);
    procedure SetcdslkExameSessao(const Value: TClientDataSet);

    procedure SetNomeConvenio(const Value: String);
    procedure SetNomeSolicitante(const Value: String);
    procedure ppvUnirLaudos;

    procedure ppvGerarLaudo(ipOrdemSessao, ipCodigoExameProc: Integer);
    // coloca o cds na ordem certa de impressao e
    procedure ppvOrdenarLaudos(ipCodigoSessao: Integer);

    procedure ppvCarregarCabecalhoRodapeSumario;

    procedure ppvPosicionarAssinaturaDigital;
    procedure ppvTrocarChaves(ipRichView: TSRichViewEdit; ipFieldOrigem, ipFieldDestino: TBlobField);
    function fpvValidarExames(
      ipCodigosExmProc: TArray<Integer>): TArray<Integer>;
    procedure SetcdslkModelo_Lab_Rodape(const Value: TClientDataSet);
    procedure ppvCarregarRodapeLaudo(ipModeloInfo: TModeloInfo);
    procedure ppvAdicionarCabecalhos;

{ Private declarations }
  public
    procedure LoadFromTable(ipCodigoExameProcedimento: Integer);

    property DataSis: TDateTime read FDataSis write SetDataSis;
    property NomeSolicitante: String read FNomeSolicitante write SetNomeSolicitante;
    property NomeConvenio: String read FNomeConvenio write SetNomeConvenio;
    property cdslkModelo_Lab: TClientDataSet read FcdslkModelo_Lab write SetcdslkModeloLab;
    property cdslkConfigFrm_Texto: TClientDataSet read FcdslkConfigFrm_Texto write SetcdslkConfigFrm_Texto;
    property cdslkMlLabRef: TClientDataSet read FcdslkMlLabRef write SetcdslkMlLabRef;
    property cdslkFichas: TClientDataSet read FcdslkFichas write SetcdslkFichas;
    property cdslkModelo_Lab_Campo_Resultados: TClientDataSet read FcdslkModelo_Lab_Campo_Resultados write SetcdslkModelo_Lab_Campo_Resultados;
    property cdslkModelo_Lab_Rodape: TClientDataSet read FcdslkModelo_Lab_Rodape write SetcdslkModelo_Lab_Rodape;
    property cdslkExame: TClientDataSet read FcdsExame write SetcdsExame;
    property cdslkExameProc: TClientDataSet read FcdslkExameProc write SetcdslkExameProc;
    property cdslkExameSessao: TClientDataSet read FcdslkExameSessao write SetcdslkExameSessao;
    property cdslkMedicos: TClientDataSet read FcdslkMedicos write SetcdslkMedicos;
    property cdslkMedicos_Assinatura: TClientDataSet read FcdslkMedicos_Assinatura write SetcdslkMedicos_Assinatura;
    property cdslkConfigFrm_AssDigital: TClientDataSet read FcdslkConfigFrm_AssDigital write SetcdslkConfigFrm_AssDigital;
    property ProxyProcedimentos: TSMFuncoesProcedimentosClient read FProxyProcedimentos write SetProxyProcedimentos;
    property InserirMd5: boolean read FInserirMd5 write SetInserirMd5 default false;
    property cdslkSenhaUs: TClientDataSet read FcdslkSenhaUs write SetcdslkSenhaUs;
    property CallBackLog: TCallBackLog read FCallBackLog write SetCallBackLog;
    property ImprimirAssDigitalPorLaudo: boolean read FImprimirAssDigitalPorLaudo write SetImprimirAssDigitalPorLaudo;

    property QuantidadePaginasImpressas: Integer read FQuantidadePaginasImpressas;
    property TotalPaginas: Integer read FTotalPaginas;
    property InfoModelos:TDictionary<Integer, TModeloInfo> read pvModelos;

{$REGION 'Documentation'}
    /// <summary>Cria uma nova instancia. Alguns CDS passados j� devem estar
    /// abertos e corretamente posicionados para que tudo funcione.</summary>
    /// <param name="ipCdsExame_Procedimento">Necess�rio estar aberto e
    /// posicionado.</param>
    /// <param name="ipCdslkConfigFrm_Texto">Necess�rio estar aberto e
    /// posicionado.</param>
    /// <param name="ipCdslkFichas">Necess�rio estar aberto e
    /// posicionado.</param>
    /// <param name="ipCdslkExame">Necess�rio estar aberto e
    /// posicionado.</param>
    /// <param name="ipCdslkExame_Proc">Precisa ja estar com todos os registros carregados</param>
    /// <param name="ipCdslkExameSessao">CDS que ira carregar as sessoes para saber a ordem de impressao</param>
    /// <param name="ipConexaoBanco">Conexao com qualquer banco de dados
    /// Firebird (Usado para fazer um select na tabela Sequencial)</param>
    /// <param name="ipCdsExame">Necess�rio estar aberto e posicionado.</param>
{$ENDREGION}
    constructor Create(ipCdslkModelo_Lab, ipCdslkConfigFrm_Texto, ipCdslkMlLabRef, ipCdslkFichas, ipCdslkModelo_Lab_Campo_Resultados, ipCdslkExame, ipCdslkExame_Proc, ipCdslkExameSessao, ipCdslkMedicos, ipCdsLkMedicos_Assinatura,
      ipCdslkConfigFrm_AssDigital, ipCdslkModelo_Lab_Rodape: TClientDataSet;
      ipDataSis: TDateTime;
      ipProxyProcedimentos: TSMFuncoesProcedimentosClient);

    destructor Destroy; override;

    procedure ppuConfigurarLarguraAltura(ipMudarTamanhoPapel: boolean);

{$REGION 'Documentation'}
    /// <summary>
    /// <para>Carrega a imagem do cabe�alho do laudo.</para>
    /// <para>Quando esta fun��o � chamada a margim superior configurada para
    /// o laudo � substituido pelo height da imagem.</para>
    /// </summary>
    /// <param name="ipCdsConfigLaudo">
    /// <para>CDS contendo as informa��es da tabela CONFIG do banco do
    /// PLaudo quando chamado do PLaudo, caso seja executado pelo promedico, deve conter
    /// as informa��es da tabela configfrm do banco do pmedico.</para>
    /// <para>Nao precisa estar aberto, pois caso esteja fechado sera aberto
    /// dentro da funcao.</para>
    /// </param>
{$ENDREGION}
    procedure ppuCarregarImagemCabecalho(ipCdsConfigLaudo: TClientDataSet);

{$REGION 'Documentation'}
    /// <summary>Retorna o tamanho diponivel na pagina desconsiderando as
    /// margins, cabecalho, rodape e sumario.</summary>
{$ENDREGION}
    function fpuGetTamanhoDisponivel: Double;
{$REGION 'Documentation'}
    /// <summary>Gera o laudos dos codigos passados.</summary>
    /// <return>Array com os codigos do exames que foram possiveis de se gerar o laudo, pois pode acontecer de algum dos codigo passados nao possuir modelo por exemplo,
    /// impedindo assim sua impressao.</return>
{$ENDREGION}
    function fpuGerarLaudos(ipCodigosExmProc: TArray<Integer>): TArray<Integer>;

    { Public declarations }
  end;

const
  coUltimaPosicao = 1000;
  coPrimeiraPagina = 1;

implementation

uses
  pRichUtils;

{$R *.DFM}


procedure TfrmLaudoLabImp.ppvGerarLaudo(ipOrdemSessao, ipCodigoExameProc: Integer);
var
  vaStream: TStream;
  vaRectImg: TRect;
  vaLargura, vaPagina, vaAlturaMaxima: Integer;
begin
  if cdslkExameProc.locate('CODIGO', ipCodigoExameProc, []) then
    begin
      LoadFromTable(ipCodigoExameProc);

  // Primeiro vamos ver se existe assinatura digital para esse laudo
      if FImprimirAssDigitalPorLaudo then
        begin
          vaStream := fpvCarregarAssinaturaDigital(cdslkExameProc.FieldByName('USUARIOLIBEROU').AsInteger);
          if Assigned(vaStream) then
            begin
              try
                vaRectImg.Top := cdslkConfigFrm_AssDigital.FieldByName('MARGEM_SUPERIOR').AsInteger;
                vaRectImg.Left := cdslkConfigFrm_AssDigital.FieldByName('MARGEM_ESQUERDA').AsInteger;
                vaRectImg.Right := vaRectImg.Left + cdslkConfigFrm_AssDigital.FieldByName('WIDTH').AsInteger;
                vaRectImg.Bottom := vaRectImg.Top + cdslkConfigFrm_AssDigital.FieldByName('HEIGHT').AsInteger;

                ProfGrid1.Assinatura := TAssinatura.Create;
                ProfGrid1.Assinatura.Rect := vaRectImg;
                ProfGrid1.Assinatura.Image := TJPEGImage.Create;

                vaStream.Position := 0;
                ProfGrid1.Assinatura.Image.LoadFromStream(vaStream);
              finally
                FreeAndNil(vaStream);
              end;
            end;
        end;

  // quando muda a unidade, os valores ja sao alterados automaticamente
      ppImpLaudo.Units := utScreenPixels;

      vaLargura := Round(ppImpLaudo.PrinterSetup.PaperWidth - ppImpLaudo.PrinterSetup.MarginLeft - ppImpLaudo.PrinterSetup.MarginRight);

      vaAlturaMaxima := Round(fpuGetTamanhoDisponivel);
      ProfGrid1.AlturaMaximaPagina := vaAlturaMaxima;
      vaPagina := 0;
      repeat
        Inc(vaPagina);
        vaStream := ProfGrid1.fpuGerarStream(vaLargura, vaPagina, vaAlturaMaxima);
        if Assigned(vaStream) then
          begin
            try
              cdsDados.Append;
              vaStream.Position := 0;
              cdsDadosLAUDO.LoadFromStream(vaStream);
              cdsDadosORDEM_IMPRESSAO.AsInteger := coUltimaPosicao; // usado futuramente para ordenar o cds
              cdsDadosCODIGO.AsInteger := cdslkExameProc.FieldByName('CODIGO').AsInteger;
              cdsDadosUSUARIOLIBEROU.AsInteger := cdslkExameProc.FieldByName('USUARIOLIBEROU').AsInteger;
              cdsDadosLARGURA_LAUDO.AsInteger := vaLargura;
              if ProfGrid1.AlturaTotal - (vaAlturaMaxima * (vaPagina - 1)) > vaAlturaMaxima then
                cdsDadosALTURA_LAUDO.AsInteger := vaAlturaMaxima
              else
                cdsDadosALTURA_LAUDO.AsInteger := ProfGrid1.AlturaTotal - (vaAlturaMaxima * (vaPagina - 1));

              cdsDadosCODIGO_SESSAO.AsInteger := cdslkExameProc.FieldByName('CODIGO_EXAME_SESSAO_LAB').AsInteger;
              cdsDadosORDEM_SESSAO.AsInteger := ipOrdemSessao;
              cdsDadosPAGINA.AsInteger := vaPagina;
              cdsDados.Post;

              Inc(FQuantidadePaginasImpressas);
            finally
              FreeAndNil(vaStream);
            end;
          end;

      until ((ProfGrid1.AlturaTotal - (vaAlturaMaxima * (vaPagina - 1))) <= vaAlturaMaxima);
    end;
end;

function TfrmLaudoLabImp.fpvValidarExames(ipCodigosExmProc: TArray<Integer>): TArray<Integer>;
var
  vaCodExameProc: Integer;
begin
  SetLength(Result, 0);
   // vamos ver quais exames possuem modelos vinculados, o q nao possuirem vao sair da lista
  for vaCodExameProc in ipCodigosExmProc do
    begin
      if fpvPegarInfoModelo(vaCodExameProc) then
        begin
          SetLength(Result, Length(Result) + 1);
          Result[High(Result)] := vaCodExameProc;
        end;
    end;

  if Length(Result) = 0 then
    raise Exception.Create('Nenhum exame selecionado possui modelo de laudo definido.');

  if not cdslkModelo_Lab.Active then
    cdslkModelo_Lab.Open;

  if not cdslkModelo_Lab.locate('codigo', pvModelos[Result[0]].Codigo, []) then
    raise Exception.Create(Format('N�o foi encontrado nenhum modelo de laudo para o exame de c�digo %d', [Result[0]]));
end;

function TfrmLaudoLabImp.fpuGerarLaudos(ipCodigosExmProc: TArray<Integer>): TArray<Integer>;
var
  vaCodigos: TStringList;
  vaSessoes: TDictionary<Integer, TList<Integer>>;
  vaCodExameProc: Integer;
  vaList: TList<Integer>;
begin
  if Length(ipCodigosExmProc) = 0 then
    raise Exception.Create('Somente Laudos Liberados Ser�o Impresso, nenhum Laudo Liberado foi selecionado.');

  // percorre os modelos e garante q pelo menos um � elegivel a ser impresso. Caso nenhum seja, uma exce��o sera lancada
  Result := fpvValidarExames(ipCodigosExmProc);
  FTotalPaginas := Length(Result); // inicialmente vou considerar q cada laudo sera uma pagina

// vamos preencher o cdsInfoExtras
  cdsInfoExtras.Edit;
  cdsInfoExtrasCODIGO_EXAME.AsInteger := cdslkExame.FieldByName('CODIGO').AsInteger;
  cdsInfoExtrasDATA_EXAME.AsDateTime := cdslkExame.FieldByName('DATA_EXAME').AsDateTime;
  cdsInfoExtrasNOME_PROCEDIMENTO.AsString := cdslkExameProc.FieldByName('NOMEPROC').AsString;
  // vamos pegar o materia do primeiro que acharmos
  cdsInfoExtrasMATERIAL.AsString := cdslkModelo_Lab.FieldByName('MATERIAL').AsString;
  cdsInfoExtrasNROFICHA.AsInteger := cdslkExame.FieldByName('NROFICHA_FICHAS').AsInteger;
  cdsInfoExtrasNOME_PACIENTE.AsString := cdslkFichas.FieldByName('NOMEPACIENTE').AsString;
  cdsInfoExtrasESTADO_CIVIL.AsString := cdslkFichas.FieldByName('ECIVIL').AsString;
  cdsInfoExtrasPROFISSAO.AsString := cdslkFichas.FieldByName('PROFISSAO').AsString;
  cdsInfoExtrasSEXO.AsString := pvPaciente.Sexo;
  cdsInfoExtrasNATURALIDADE.AsString := cdslkFichas.FieldByName('NATURALIDADE').AsString;
  cdsInfoExtrasDATA_NASCIMENTO.AsDateTime := pvPaciente.DataNascimento;
  cdsInfoExtrasRG.AsString := cdslkFichas.FieldByName('NRORG').AsString;
  if cdslkFichas.FieldByName('DTNASCIMENTO').AsString <> '' then
    cdsInfoExtrasIDADE.AsString := IntToStr(pvPaciente.idade) + ' ' + pvPaciente.unidadeIdade;

  cdsInfoExtrasCONVENIO.AsString := NomeConvenio;
  cdsInfoExtrasMEDICO_SOLICITANTE.AsString := NomeSolicitante;
  cdsInfoExtras.Post;

  vaCodigos := TStringList.Create;
  vaSessoes := TDictionary < Integer, TList < Integer >>.Create;
  try
    vaCodigos.DelimitedText := ',';
    vaCodigos.StrictDelimiter := True;
    vaCodigos.Clear;

    // vamos primeiro pegar todas sessoes e agrupar os exames de acordo com a ordem da sessao
    for vaCodExameProc in Result do
      begin
        if cdslkExameProc.locate('CODIGO', vaCodExameProc, []) then
          begin
            if (not cdslkExameProc.FieldByName('CODIGO_EXAME_SESSAO_LAB').IsNull) and (vaCodigos.IndexOf(cdslkExameProc.FieldByName('CODIGO_EXAME_SESSAO_LAB').AsString) = -1) then
              vaCodigos.Add(cdslkExameProc.FieldByName('CODIGO_EXAME_SESSAO_LAB').AsString);

            // coloca zero para os exames que nao estao ligado a nenhuma sessao
            if not vaSessoes.ContainsKey(cdslkExameProc.FieldByName('CODIGO_EXAME_SESSAO_LAB').AsInteger) then
              begin
                vaSessoes.Add(cdslkExameProc.FieldByName('CODIGO_EXAME_SESSAO_LAB').AsInteger, TList<Integer>.Create);
                vaSessoes[cdslkExameProc.FieldByName('CODIGO_EXAME_SESSAO_LAB').AsInteger].Add(vaCodExameProc);
              end
            else
              begin
                vaSessoes[cdslkExameProc.FieldByName('CODIGO_EXAME_SESSAO_LAB').AsInteger].Add(vaCodExameProc);
              end;

          end;
      end;

    // primeiro vamos descobrir se existem registros q nao estao ligados a nenhuma sessao, pois se existirem, serao os primeiros a serem impressos
    if vaSessoes.ContainsKey(0) then
      begin

        for vaCodExameProc in vaSessoes[0] do
          begin
            ppvGerarLaudo(0, vaCodExameProc);
          end;

        // agora que os laudos foram gerados vamos ordenalos
        ppvOrdenarLaudos(0);
      end;

    if vaCodigos.Count > 0 then
      begin
        TCarregaDados.ppuCarregarDados(cdslkExameSessao, ['CODIGOS'], [vaCodigos.DelimitedText]);
// vamos garantir que esteja ordenado pelo campo ordem da impressao
        cdslkExameSessao.IndexFieldNames := 'ORDEM_IMPRESSAO';
        cdslkExameSessao.First;
        while not cdslkExameSessao.Eof do
          begin
            if vaSessoes.ContainsKey(cdslkExameSessao.FieldByName('CODIGO').AsInteger) then
              begin
                for vaCodExameProc in vaSessoes[cdslkExameSessao.FieldByName('CODIGO').AsInteger] do
                  begin
                    ppvGerarLaudo(cdslkExameSessao.FieldByName('ORDEM_IMPRESSAO').AsInteger, vaCodExameProc);
                  end;

              // agora que os laudos foram gerados vamos ordenalos
                ppvOrdenarLaudos(cdslkExameSessao.FieldByName('CODIGO').AsInteger);
              end;

            cdslkExameSessao.Next;
          end;
      end;

    ppvCarregarCabecalhoRodapeSumario;

    ppvPosicionarAssinaturaDigital(); // caso nao esteja imprimindo a assinatura por laudo, entao carrega e posiciona a assinatura no local correto

 // Adicionando o MD5
    if InserirMd5 then
      begin
        cdsInfoExtras.Edit;
        cdsInfoExtrasMD5.AsString := TCriptografa.fpuTextToCriptoMD5(pvMd5);
        cdsInfoExtras.Post;
      end;

      // agora resta configurar o tamanho da img que contem o laudo, pois o cabecalho e o rodape tiveram suas alteras alteradas.
    cdsDados.First;
    ppImpLaudo.PrinterSetup.Units := utScreenPixels;
    ppImpLaudo.Units := utScreenPixels;

    ppImgLaudo.Width := cdsDadosLARGURA_LAUDO.AsInteger;
    ppDetailBand1.Height := Round(fpuGetTamanhoDisponivel) - 2;
    ppImgLaudo.Height := ppDetailBand1.Height;

    // por fim vamos ver se tem como unir os laudos em uma mesma pagina quando forem da mesma sessao
    ppvUnirLaudos;
  finally
    vaCodigos.Free;
    for vaList in vaSessoes.Values do
      begin
        vaList.Free;
      end;
    vaSessoes.Free;
  end;
end;

procedure TfrmLaudoLabImp.ppvUnirLaudos;
var
  vaDetailHeight, vaAlturaAcumulada: Integer;
begin
  cdsDados.First;
  vaDetailHeight := Trunc(ppImgLaudo.Height);
 // vamos percorrer todos os laudos (ja estao ordenados de forma correta) verificando quais cabem na mesma pagina para entao juntar os laudos em uma mesma img
  vaAlturaAcumulada := cdsDadosALTURA_LAUDO.AsInteger;
  ppvAjustarTamanhoLaudos(vaDetailHeight, vaAlturaAcumulada);
end;

procedure TfrmLaudoLabImp.ppvOrdenarLaudos(ipCodigoSessao: Integer);
var
  vaAcumulado, vaTamanhoDisponivel, vaPosAtual: Integer;
  vaOrdenacao: String;
  vaCds: TClientDataSet;

  procedure plAlterarOrdemImpressaoPaginasLaudo(ipCodigo, ipNovaOrdemImpressao: Integer);
  var
    vaRecNo: Integer;
  begin
    vaRecNo := cdsDados.RecNo;
    try
      cdsDados.First;
      while cdsDados.locate(cdsDadosCODIGO_SESSAO.FieldName + ';' + cdsDadosCODIGO.FieldName + ';' + cdsDadosORDEM_IMPRESSAO.FieldName, VarArrayOf([ipCodigoSessao, ipCodigo, coUltimaPosicao]), []) do
        begin
          cdsDados.Edit;
          cdsDadosORDEM_IMPRESSAO.AsInteger := ipNovaOrdemImpressao;
          cdsDados.Post;
        end;
    finally
      cdsDados.RecNo := vaRecNo;
    end;

  end;

begin
  vaPosAtual := 0;
  // vamos tirar temporariamente a ordenacao
  vaOrdenacao := cdsDados.IndexFieldNames;
  cdsDados.IndexFieldNames := '';

  vaCds := TClientDataSet.Create(nil);
  try
    cdsDados.Filter := 'CODIGO_SESSAO = ' + IntToStr(ipCodigoSessao);
    cdsDados.Filtered := True;

    // vamos ordenar pelo codigo para que independe da ordenacao do grid do usuario sai sempre da mesma forma o laudo
    cdsDados.IndexFieldNames := cdsDadosCODIGO.FieldName + ';' + cdsDadosPAGINA.FieldName;

    vaCds.CloneCursor(cdsDados, false);

    vaTamanhoDisponivel := Round(fpuGetTamanhoDisponivel);
    cdsDados.First;
    while not cdsDados.Eof do
      begin
        if cdsDadosALTURA_LAUDO.AsInteger < vaTamanhoDisponivel then
          begin
            if cdsDadosORDEM_IMPRESSAO.AsInteger = coUltimaPosicao then
              begin
                vaAcumulado := cdsDadosALTURA_LAUDO.AsInteger;
                vaCds.First;
// vaCds.RecNo := cdsDados.RecNo;
// vaCds.Next;
                while not vaCds.Eof do
                  begin
                    if (cdsDadosCODIGO.AsInteger <> vaCds.FieldByName(cdsDadosCODIGO.FieldName).AsInteger) and (vaCds.FieldByName(cdsDadosORDEM_IMPRESSAO.FieldName).AsInteger = coUltimaPosicao) and
                      (vaCds.FieldByName(cdsDadosPAGINA.FieldName).AsInteger = coPrimeiraPagina) then
                      begin
                        if (vaCds.FieldByName(cdsDadosALTURA_LAUDO.FieldName).AsInteger + vaAcumulado) <= vaTamanhoDisponivel then
                          begin
                            Inc(vaPosAtual);
                            cdsDados.Edit;
                            cdsDadosORDEM_IMPRESSAO.AsInteger := vaPosAtual;
                            cdsDados.Post;
                            // se nao for a primeira pagina, tenho que alterar todas as paginas referente a esse laudo pq senao vai sair o final de um laudo junto com outro
                            if cdsDadosPAGINA.AsInteger <> coPrimeiraPagina then
                              plAlterarOrdemImpressaoPaginasLaudo(cdsDadosCODIGO.AsInteger, vaPosAtual);

                            Inc(vaPosAtual);
                            vaCds.Edit;
                            vaCds.FieldByName(cdsDadosORDEM_IMPRESSAO.FieldName).AsInteger := vaPosAtual;
                            vaCds.Post;

                            vaAcumulado := vaAcumulado + vaCds.FieldByName(cdsDadosALTURA_LAUDO.FieldName).AsInteger;
                          end;
                      end;
                    vaCds.Next;
                  end;
              end;
          end;
        cdsDados.Next;
      end;
  finally
    vaCds.Free;
    cdsDados.Filtered := false;
    cdsDados.IndexFieldNames := vaOrdenacao;
  end;

end;

// function TfrmLaudoLabImp.fpvCalcularDetailHeightDisponivel: Integer;
// begin
// Result := Trunc(ppImpLaudo.PrinterSetup.PaperHeight - ppHeaderBand1.Height - ppFooterBand1.Height - ppImpLaudo.PrinterSetup.MarginTop - ppImpLaudo.PrinterSetup.MarginBottom) - 2;
// if FUltimaPagina then
// Result := Result - ppImpLaudo.SummaryBand.Height;
// end;

procedure TfrmLaudoLabImp.ppvAjustarTamanhoLaudos(ipDetailHeight: Integer; var opAlturaAcumulada: Integer);
var
  vaStream: TMemoryStream;
  vaMetaFileCanvas: TMetaFileCanvas;
  vaMetaFile, vaMetaFile2, vaMetaFileUnion: TMetaFile;
  vaCodigoSessao: Integer;
begin
  vaMetaFile := nil;
  vaMetaFile2 := nil;
  vaMetaFileUnion := nil;
  vaCodigoSessao := cdsDadosCODIGO_SESSAO.AsInteger;

  cdsDados.Next;
  if cdsDados.Eof then
    exit;

  if ((opAlturaAcumulada + cdsDadosALTURA_LAUDO.AsInteger) <= ipDetailHeight) and (vaCodigoSessao = cdsDadosCODIGO_SESSAO.AsInteger) then
    begin
      vaStream := TMemoryStream.Create;
      try
      // salva a img
        vaMetaFile2 := TMetaFile.Create;
        cdsDadosLAUDO.SaveToStream(vaStream);
        vaStream.Position := 0;
        vaMetaFile2.LoadFromStream(vaStream);

// volta pra registro anterior
        cdsDados.Prior;
       // pega a img
        vaMetaFile := TMetaFile.Create;
        vaStream.Clear;
        cdsDadosLAUDO.SaveToStream(vaStream);
        vaStream.Position := 0;
        vaMetaFile.LoadFromStream(vaStream);
       // deleta o registro
        cdsDados.Delete;
       // realiza a uniao das imagens
        vaMetaFileUnion := TMetaFile.Create;
        vaMetaFileUnion.SetSize(Max(vaMetaFile.Width, vaMetaFile2.Width), vaMetaFile.Height + vaMetaFile2.Height);

        vaMetaFileCanvas := TMetaFileCanvas.Create(vaMetaFileUnion, 0);
        try
          vaMetaFileCanvas.Draw(0, 0, vaMetaFile);
          vaMetaFileCanvas.Draw(0, vaMetaFile.Height, vaMetaFile2);
        finally
          // tem q destruir o Canvas primeiro para depois salvar no stream pq senao nao funciona
          vaMetaFileCanvas.Free;
        end;

        vaStream.Clear;
        vaMetaFileUnion.SaveToStream(vaStream);
        vaStream.Position := 0;

        cdsDados.Edit;
        cdsDadosLAUDO.LoadFromStream(vaStream);
        cdsDados.Post;

        // incrementa o valor de AlturaAcumulada
        opAlturaAcumulada := vaMetaFileUnion.Height;
      finally
        FreeAndNil(vaStream);
        if Assigned(vaMetaFile) then
          FreeAndNil(vaMetaFile);

        if Assigned(vaMetaFile2) then
          FreeAndNil(vaMetaFile2);

        if Assigned(vaMetaFileUnion) then
          FreeAndNil(vaMetaFileUnion);
      end;
      // chama a funcao novamente
      ppvAjustarTamanhoLaudos(ipDetailHeight, opAlturaAcumulada);
    end
  else
    begin
      opAlturaAcumulada := cdsDadosALTURA_LAUDO.AsInteger;
      ppvAjustarTamanhoLaudos(ipDetailHeight, opAlturaAcumulada);
    end;
end;

procedure TfrmLaudoLabImp.ppvPosicionarAssinaturaDigital;
var
  vaStream: TStream;
  vaDifImgTopAndHeader, vaDetailHeight: Integer;
begin
  if not ImprimirAssDigitalPorLaudo then
    begin
      cdsDados.First; // ja deve estar ordenado
      vaStream := fpvCarregarAssinaturaDigital(cdsDadosUSUARIOLIBEROU.AsInteger);
      if Assigned(vaStream) then
        begin
          try
            ppImpLaudo.PrinterSetup.Units := utScreenPixels;
            ppImpLaudo.Units := utScreenPixels;

            vaDetailHeight := Round(fpuGetTamanhoDisponivel) - 2;

            vaDifImgTopAndHeader := Round(cdslkConfigFrm_AssDigital.FieldByName('MARGEM_SUPERIOR').AsInteger - (ppImpLaudo.PrinterSetup.MarginTop + ppHeaderBand1.Height));
            if vaDifImgTopAndHeader > vaDetailHeight then // o inicio da img nao esta dentro do detail, vamos trocar o parent da assinatura para ser o footer entao
              begin
                ppImgAssinatura.Band := ppFooterBand1;
                ppImgAssinatura.Top := vaDifImgTopAndHeader - vaDetailHeight;
              end
            else
              ppImgAssinatura.Top := vaDifImgTopAndHeader;

            ppImgAssinatura.Left := cdslkConfigFrm_AssDigital.FieldByName('MARGEM_ESQUERDA').AsInteger;
            ppImgAssinatura.Width := cdslkConfigFrm_AssDigital.FieldByName('WIDTH').AsInteger;
            ppImgAssinatura.Height := cdslkConfigFrm_AssDigital.FieldByName('HEIGHT').AsInteger;

            cdsInfoExtras.Edit;
            vaStream.Position := 0;
            cdsInfoExtrasIMG_ASSINATURA.LoadFromStream(vaStream);
            cdsInfoExtrasLEFT_ASSINATURA.AsInteger := Round(ppImgAssinatura.Left);
            cdsInfoExtrasTOP_ASSINATURA.AsInteger := Round(ppImgAssinatura.Top);
            cdsInfoExtras.Post;

          finally
            vaStream.Free;
          end;
        end;

    end
  else
    ppImgAssinatura.Visible := false;
end;

function TfrmLaudoLabImp.fpvCarregarAssinaturaDigital(ipUsuarioLiberou: Integer): TStream;
Begin
  Result := nil;
  // Devemos ver se a categoria tem laudo
  if cdslkConfigFrm_Texto.RecordCount = 0 then
    Begin
      exit;
    end;

  if not cdslkMedicos.Active then
    begin
      cdslkMedicos_Assinatura.Close;
       // abrindo tabela de medicos com todos os Medicos ativos e colocando nos clientdataset locais;
      cdslkMedicos.Close;
      cdslkMedicos.Params.ParamByName('ipTodosMedicos').AsInteger := 1; // ira trazer todos os medicos;
      cdslkMedicos.Params.ParamByName('ipCodCTExames').AsInteger := 0;
      cdslkMedicos.Open;
      cdslkMedicos_Assinatura.Open; // cds filho do cdsMedicos(usando master detail)

    end;
  // ----------------Devemos descobrir se o usuario que liberou � um medico----------------
  // Caso n�o tenha encontrado nada setar a visibilidade da img para false e sair da procedure
  if not(cdslkMedicos.locate('cusuario', ipUsuarioLiberou, [loCaseInsensitive])) then
    begin
      exit;
    end;
  // ou caso n�o tenha img
  if (cdslkMedicos_Assinatura.FieldByName('ASSINATURA').IsNull) then
    Begin
      exit;
    end;

  // Agora devemos descobrir se o medico possui configuracao propria nesse formulario
  TCarregaDados.ppuCarregarDados(cdslkConfigFrm_AssDigital, ['CODIGO_CONFIGFRM', 'CODIGO_MEDICO'], [cdslkConfigFrm_Texto.FieldByName('CODIGO').AsInteger, cdslkMedicos.FieldByName('CODIGO').AsInteger]);
  // Caso n�o tenha tentar encontrar a configuracao generica
  if (cdslkConfigFrm_AssDigital.Eof) then
    Begin
      TCarregaDados.ppuCarregarDados(cdslkConfigFrm_AssDigital, ['CODIGO_CONFIGFRM', 'GENERICA'], [cdslkConfigFrm_Texto.FieldByName('CODIGO').AsInteger, 0]);
      // se mesmo assim n�o tiver encontrado nada podemos parar a procedure
      if cdslkConfigFrm_AssDigital.Eof then
        Begin
          exit;
        end;
    end;

  Result := TMemoryStream.Create;
  TBlobField(cdslkMedicos_Assinatura.FieldByName('ASSINATURA')).SaveToStream(Result);
  if (Result.Size = 0) then
    begin
      FreeAndNil(Result);
    end;

end;

function TfrmLaudoLabImp.fpvPegarInfoModelo(ipCodExameProc: Integer): boolean;
var
  vaInfoModelolab: TJSONArray;
  vaInfoMod: TModeloInfo;
begin
  Result := false;
  if not pvModelos.ContainsKey(ipCodExameProc) then
    begin
      vaInfoModelolab := ProxyProcedimentos.fpuBuscarModeloLab(ipCodExameProc);
      if vaInfoModelolab.Size > 0 then
        begin
          vaInfoMod.Versao := StrToInt(vaInfoModelolab.Get(0).Value);
          vaInfoMod.Codigo := StrToInt(vaInfoModelolab.Get(1).Value);

          pvModelos.Add(ipCodExameProc, vaInfoMod);
          Result := True;
        end;
    end
  else
    begin
      Result := True;
    end;
end;

procedure TfrmLaudoLabImp.LoadFromTable(ipCodigoExameProcedimento: Integer);
var
  vaCol, vaRow, I: Integer;
  vaTexto: string;
  vaAddUnidade: boolean;
  vaValor: Double;
  vaInfoMod: TModeloInfo;
begin
  pvMd5 := '';
  if fpvPegarInfoModelo(ipCodigoExameProcedimento) then
    begin
      vaInfoMod := pvModelos.Items[ipCodigoExameProcedimento];

      if not cdslkModelo_Lab.Active then
        cdslkModelo_Lab.Open;

        // vamos localizar o Modelo que deve ser seguido.
      if not cdslkModelo_Lab.locate('codigo', vaInfoMod.Codigo, [loCaseInsensitive]) then
        raise Exception.Create(Format('N�o foi encontrado nenhum modelo de codigo %d para o exame %d', [vaInfoMod.Codigo, ipCodigoExameProcedimento]));

// --- Abrindo a tabela de celulas
      try
        cdslkModelo_Lab_Campo_Resultados.Close;
        cdslkModelo_Lab_Campo_Resultados.Params.ParamByName('CODIGO_EXAME_PROC').AsInteger := ipCodigoExameProcedimento;
        cdslkModelo_Lab_Campo_Resultados.Params.ParamByName('VERSAO').AsInteger := vaInfoMod.Versao;
        cdslkModelo_Lab_Campo_Resultados.Params.ParamByName('CODIGO_MODELO_LAB').AsInteger := vaInfoMod.Codigo;
        cdslkModelo_Lab_Campo_Resultados.Open;
      except
        on E: Exception do
          begin
            raise Exception.Create('Erro ao tentar montar o PDF do exame de c�digo: ' + IntToStr(ipCodigoExameProcedimento) + '. Detalhes: ' + E.Message);
          end;
      end;

      // limpando o ProfGrid, nao da pra deletar todas as linhas e colunas, o profgrid nao deixa, tem q ficar pelo menos uma celula
      while ProfGrid1.ColCount > 1 do
        ProfGrid1.DeleteColumn(0);
      while ProfGrid1.RowCount > 1 do
        ProfGrid1.DeleteRow(0);

      // Limpando a ultima celula para garantir que nao vai pegar lixo
      ProfGrid1.Cells[0, 0].Text := '';
      ProfGrid1.Cells[0, 0].Graphic := nil;

      if Assigned(ProfGrid1.Assinatura) then
        begin
          ProfGrid1.Assinatura.Free;
          ProfGrid1.Assinatura := nil;
        end;

      ProfGrid1.Cabecalho.Clear;
      ProfGrid1.Rodape.Clear;

      SetLength(pvGridValues, 0, 0); // zerando
     // SetLength(pvGridValues, ProfGrid1.ColCount, ProfGrid1.RowCount);
      cdslkModelo_Lab_Campo_Resultados.First;
      while not cdslkModelo_Lab_Campo_Resultados.Eof do
        begin
          vaCol := NumberOfColumn(cdslkModelo_Lab_Campo_Resultados.FieldByName('COL').AsString) - 1;
          if vaCol = -1 then
            raise Exception.Create(Format('Modelo de c�digo %d e vers�o %d esta corrompido pois n�o existe a coluna %s ', [vaInfoMod.Codigo, vaInfoMod.Versao, cdslkModelo_Lab_Campo_Resultados.FieldByName('COL').AsString]));

          vaRow := cdslkModelo_Lab_Campo_Resultados.FieldByName('ROW').AsInteger - 1;
          if vaCol + 1 > High(pvGridValues) then
            SetLength(pvGridValues, vaCol + 1);
          if vaRow + 1 > High(pvGridValues[0]) then
            SetLength(pvGridValues, Length(pvGridValues), vaRow + 1);

          if ppvValidarColRow(vaCol, vaRow, pvGridValues) then
            begin
              pvGridValues[vaCol, vaRow].Codigo := cdslkModelo_Lab_Campo_Resultados.FieldByName('CODIGO').AsInteger;
              pvGridValues[vaCol, vaRow].Col := cdslkModelo_Lab_Campo_Resultados.FieldByName('COL').AsString;
              pvGridValues[vaCol, vaRow].Row := vaRow;
              pvGridValues[vaCol, vaRow].Visivel := cdslkModelo_Lab_Campo_Resultados.FieldByName('VISIVEL').AsInteger;
              pvGridValues[vaCol, vaRow].Width := cdslkModelo_Lab_Campo_Resultados.FieldByName('WIDTH').AsInteger;
              pvGridValues[vaCol, vaRow].FontName := cdslkModelo_Lab_Campo_Resultados.FieldByName('FONTNAME').AsString;
              pvGridValues[vaCol, vaRow].FontColor := cdslkModelo_Lab_Campo_Resultados.FieldByName('FONTCOLOR').AsInteger;
              pvGridValues[vaCol, vaRow].FontSize := cdslkModelo_Lab_Campo_Resultados.FieldByName('FONTSIZE').AsInteger;
              pvGridValues[vaCol, vaRow].FontAlignment := cdslkModelo_Lab_Campo_Resultados.FieldByName('FONTALIGNMENT').AsInteger;
              pvGridValues[vaCol, vaRow].FontStyle := cdslkModelo_Lab_Campo_Resultados.FieldByName('FONTSTYLE').AsString;
              pvGridValues[vaCol, vaRow].Contorno := cdslkModelo_Lab_Campo_Resultados.FieldByName('CONTORNO').AsInteger;
              pvGridValues[vaCol, vaRow].Formula := cdslkModelo_Lab_Campo_Resultados.FieldByName('FORMULA').AsString;
              pvGridValues[vaCol, vaRow].Condicao := cdslkModelo_Lab_Campo_Resultados.FieldByName('CONDICAO').AsString;
              pvGridValues[vaCol, vaRow].Decimais := cdslkModelo_Lab_Campo_Resultados.FieldByName('DECIMAIS').AsInteger;
              pvGridValues[vaCol, vaRow].Unidade := cdslkModelo_Lab_Campo_Resultados.FieldByName('UNIDADE').AsString;
              pvGridValues[vaCol, vaRow].TipoDado := TTipoDado(cdslkModelo_Lab_Campo_Resultados.FieldByName('TIPODADO').AsInteger);
              pvGridValues[vaCol, vaRow].OrigemDado := cdslkModelo_Lab_Campo_Resultados.FieldByName('ORIGEMDADO').AsInteger;
              pvGridValues[vaCol, vaRow].NameCellRef := cdslkModelo_Lab_Campo_Resultados.FieldByName('NAMECELLREF').AsString;
              pvGridValues[vaCol, vaRow].CellGrafRef := cdslkModelo_Lab_Campo_Resultados.FieldByName('CELULA_GRAFICO_REFERENCIA').AsString;

              pvGridValues[vaCol, vaRow].Editavel := cdslkModelo_Lab_Campo_Resultados.FieldByName('EDITAVEL').AsInteger = 0;
              pvGridValues[vaCol, vaRow].EditavelSemFoco := cdslkModelo_Lab_Campo_Resultados.FieldByName('EDITAVEL').AsInteger = 2;
              pvGridValues[vaCol, vaRow].Tag := Trim(cdslkModelo_Lab_Campo_Resultados.FieldByName('TAG').AsString);
              pvGridValues[vaCol, vaRow].GraficoReferencia := nil; // caso contenha algum grafico sera preenchido na funcao ppvPreencherReferencias

// se for editavel ou possuir tag pego da tabela exame_proc_laudo_lab (VALOR � o campo Resultado da exame_proc_laudo_lab)
              if (pvGridValues[vaCol, vaRow].Editavel or pvGridValues[vaCol, vaRow].EditavelSemFoco) OR (pvGridValues[vaCol, vaRow].Tag <> '') or (pvGridValues[vaCol, vaRow].Formula <> '') then
                begin
                  vaTexto := cdslkModelo_Lab_Campo_Resultados.FieldByName('VALOR').AsString;
                  pvGridValues[vaCol, vaRow].ResultadoSemFormatacao := vaTexto
                end
              else
                begin
                  vaTexto := cdslkModelo_Lab_Campo_Resultados.FieldByName('TEXT').AsString;
                  pvGridValues[vaCol, vaRow].ResultadoSemFormatacao := '';
                end;

              vaAddUnidade := false;
          // verifico se preciso formatar o numero
          // 0 = Editavel                             //TIPODADO = 1 = VALOR
              if ((cdslkModelo_Lab_Campo_Resultados.FieldByName('EDITAVEL').AsInteger = 0) or (cdslkModelo_Lab_Campo_Resultados.FieldByName('EDITAVEL').AsInteger = 2)) and
                (cdslkModelo_Lab_Campo_Resultados.FieldByName('TIPODADO').AsInteger = Ord(VALOR)) then
                begin
                  vaTexto := StringReplace(vaTexto, '.', ',', [rfReplaceAll]);
                  if TryStrToFloat(vaTexto, vaValor) then // se na conseguir converter eu mostro do jeito que estiver mesmo
                    begin
                      vaTexto := FormatFloat(',0.' + StringOfChar('0', cdslkModelo_Lab_Campo_Resultados.FieldByName('DECIMAIS').AsInteger), vaValor);
                      vaAddUnidade := True;
                    end;
                end;
          // Tenho que verificar isto, pois pode ser que durante o loop alguma vez alguma referencia ja tenha sido colocada nesta posicao
              if Trim(pvGridValues[vaCol, vaRow].Text) = '' then
                begin
              // verifico se preciso adicionar a unidade
                  if (cdslkModelo_Lab_Campo_Resultados.FieldByName('UNIDADE').AsString <> '') and vaAddUnidade and (vaTexto <> '') then
                    pvGridValues[vaCol, vaRow].Text := vaTexto + ' ' + cdslkModelo_Lab_Campo_Resultados.FieldByName('UNIDADE').AsString
                  else
                    pvGridValues[vaCol, vaRow].Text := vaTexto;
                end;

               // Vamos salvar o texto caso seja necessario gerar o MD5 futuramente
               // Somente � considerado para gera��o do MD5 campos editaveis, com formulas ou que possuam interfaceamento.
              if pvGridValues[vaCol][vaRow].Editavel or pvGridValues[vaCol][vaRow].EditavelSemFoco or
                (pvGridValues[vaCol][vaRow].Formula <> '') or (pvGridValues[vaCol][vaRow].Tag <> '') then
                begin
                  pvMd5 := pvMd5 + Trim(pvGridValues[vaCol][vaRow].Text);
                end;

              pvGridValues[vaCol, vaRow].Merge_Status := TMerge(cdslkModelo_Lab_Campo_Resultados.FieldByName('MERGE_STATUS').AsInteger);
              pvGridValues[vaCol, vaRow].Merge_Col_Ini := cdslkModelo_Lab_Campo_Resultados.FieldByName('MERGE_COL_INI').AsString;
              pvGridValues[vaCol, vaRow].Merge_Col_Fim := cdslkModelo_Lab_Campo_Resultados.FieldByName('MERGE_COL_FIM').AsString;
            end;

          cdslkModelo_Lab_Campo_Resultados.Next;
        end;

      // colocando o tamanho do ProfGrid do mesmo tamanho do GridValues, fiz aqui em baixo ao invez de la em cima pq nesse momento meu gridvalues ja esta com o tamanho correto.
      ProfGrid1.ColCount := Length(pvGridValues);
      ProfGrid1.RowCount := Length(pvGridValues[0]);

      // vou calcular as formulas agora
      // TODO: Este codigo foi add somente por causa das formulas que dependem de outras que sao executadas depois, isto DEVE ser retirado assim q o esquema do BLOB estiver ativo
      for I := 0 to 1 do
        ppvProcessarFormulas;

      // tenho que passar em todos os registros novamente retirando a referencia para os que nao forem texto ou possuam texto padrao
      ppvPreencherReferencias();

      cdslkModelo_Lab_Campo_Resultados.Close;

      LoadToGrid; // Carregar no grid

      ppvCarregarRodapeLaudo(vaInfoMod);
    end;
end;

procedure TfrmLaudoLabImp.ppvCarregarRodapeLaudo(ipModeloInfo: TModeloInfo);
var
  vaStream: TStream;
  vaLargura, vaAltura: Integer;
  vaMetaFile: TMetaFile;
  vaMetaFileCanvas: TMetaFileCanvas;
  vaUltimaLinha: Integer;
begin
  cdslkModelo_Lab_Rodape.Close;
  try
    try
      cdslkModelo_Lab_Rodape.Params.ParamByName('VERSAO').AsInteger := ipModeloInfo.Versao;
      cdslkModelo_Lab_Rodape.Params.ParamByName('CODIGO_MODELO_LAB').AsInteger := ipModeloInfo.Codigo;
      cdslkModelo_Lab_Rodape.Open;

      if not cdslkModelo_Lab_Rodape.Eof then
        begin
          if not cdslkModelo_Lab_Rodape.FieldByName('RODAPE').IsNull then
            begin
              ppImpLaudo.Units := utScreenPixels;
              vaLargura := Round((ppImpLaudo.PrinterSetup.PaperWidth - ppImpLaudo.PrinterSetup.MarginLeft - ppImpLaudo.PrinterSetup.MarginRight) + 0.5);
              vaAltura := Round((cdslkModelo_Lab_Rodape.FieldByName('ALTURA').AsFloat * 38) + 0.5); // o +0.5 � para arredondar para cima

              vaStream := TBytesStream.Create;
              try
                TBlobField(cdslkModelo_Lab_Rodape.FieldByName('RODAPE')).SaveToStream(vaStream);
                vaStream.Position := 0;

                rvHelper.RichView.LoadRVFFromStream(vaStream);
              finally
                vaStream.Free;
              end;

              rvHelper.Init(Self.Canvas, vaLargura);

              while rvHelper.FormatNextPage(vaAltura) do;

              vaMetaFile := TMetaFile.Create;
              try
                vaMetaFile.Width := vaLargura;
                vaMetaFile.Height := vaAltura; // rvHelper.GetLastPageHeight; // me retorna a altura maxima necessaria, evitando desperdicios

                vaMetaFileCanvas := TMetaFileCanvas.Create(vaMetaFile, 0);
                try
                  rvHelper.DrawPage(1, vaMetaFileCanvas, True, vaAltura);
                finally
                  vaMetaFileCanvas.Free;
                end;

                ProfGrid1.RowCount := ProfGrid1.RowCount + 1;
                vaUltimaLinha := ProfGrid1.RowCount - 1;
                ProfGrid1.MergeHoriz(0, ProfGrid1.ColCount - 1, vaUltimaLinha);
                ProfGrid1.Cells[0, vaUltimaLinha].Graphic := vaMetaFile;
              finally
                FreeAndNil(vaMetaFile);
              end;
            end;
        end;
    except
      on E: Exception do
        raise Exception.Create('Erro ao tentar carregar o rodap� do laudo. Detalhes:' + slineBreak + E.Message);
    end;
  finally
    cdslkModelo_Lab_Rodape.Close;
  end;
end;

procedure TfrmLaudoLabImp.ppvPreencherReferencias();
var
  vaCol, vaPosicaoPontoVirgula, vaRow, NRow, NCol: Integer;
  vaRefConfere: boolean;
  vaCodigos: string;
  vaCols, vaRows: array of Integer;
  vaAux, I, j: Integer;
begin
  // vou percorrer o GridValues e pegar as celulas q tem referencias
  for vaCol := low(pvGridValues) to high(pvGridValues) do
    begin
      for vaRow := low(pvGridValues[vaCol]) to high(pvGridValues[vaCol]) do
        begin
         // o namecellref nao pode estar vazio,
          if (pvGridValues[vaCol, vaRow].NameCellRef <> '') then
            begin
              // verifico se esta coluna ja existe
              if not TArray.BinarySearch<Integer>(vaCols, vaCol, vaAux) then
                begin
                  SetLength(vaCols, Length(vaCols) + 1);
                  vaCols[High(vaCols)] := vaCol;
                end;

              SetLength(vaRows, Length(vaRows) + 1);
              vaRows[High(vaRows)] := vaRow;

              vaCodigos := vaCodigos + ',' + IntToStr(pvGridValues[vaCol, vaRow].Codigo);
            end;
        end;
    end;
  try
  // retirando a virgula
    vaCodigos := copy(vaCodigos, 2, Length(vaCodigos) - 1);
    if Trim(vaCodigos) <> '' then
      begin
  // carrego todas as referencias deste modelo
        TCarregaDados.ppuCarregarDados(cdslkMlLabRef, ['CODIGO_MODELO_LAB_CAMPO', 'SEXO'], [vaCodigos, pvPaciente.Sexo]);
  // percorre todas as celulas que tem referencia

        for I := low(vaCols) to high(vaCols) do
          begin
            for j := low(vaRows) to high(vaRows) do
              begin

                cdslkMlLabRef.Filtered := false;
                cdslkMlLabRef.Filter := 'CODIGO_MODELO_LAB_CAMPO = ' + IntToStr(pvGridValues[vaCols[I], vaRows[j]].Codigo);
                cdslkMlLabRef.Filtered := True;

                vaRefConfere := false;
                cdslkMlLabRef.First;
          // vou passar em cada resultado verificando se algum se encaixa nas referencias
                while not cdslkMlLabRef.Eof do
                  begin
                    vaRefConfere := VerificarFaixaIdade(cdslkMlLabRef.FieldByName('TIPO_AGE').AsString, pvPaciente.unidadeIdade, cdslkMlLabRef.FieldByName('AGE1').AsInteger,
                      cdslkMlLabRef.FieldByName('AGE2').AsInteger, pvPaciente.idade);
                    if not vaRefConfere then
                      cdslkMlLabRef.Next
                    else
                      Break;
                  end;

          // para montar a ref ela tem q ter sido encontrada no loop anterior, o tipo do dado precisa ser TEXTO e a Origem nao pode ser 1(Texto padrao)
                if (vaRefConfere) then
                  begin
                    vaPosicaoPontoVirgula := Pos(';', pvGridValues[vaCols[I], vaRows[j]].NameCellRef); // verifica se tem mais de uma c�lula

                    if vaPosicaoPontoVirgula > 0 then // tem duas celulas
                      begin
                        case TTipoReferencia(cdslkMlLabRef.FieldByName('TIPO_REFERENCIA').AsInteger) of
                          trEntreValores:
                            begin
                               // celula 1
                              NCol := TProfGrid.getIndexByNameCol(copy(pvGridValues[vaCols[I], vaRows[j]].NameCellRef, 1, 1));
                              NRow := StrToInt(Trim(copy(pvGridValues[vaCols[I], vaRows[j]].NameCellRef, 2, vaPosicaoPontoVirgula - 2))) - 1;
                              if ppvValidarColRow(NCol, NRow, pvGridValues) and (pvGridValues[NCol, NRow].TipoDado IN [OBSERVACAO, TEXTO]) and (pvGridValues[NCol, NRow].OrigemDado <> 1) then
                                pvGridValues[NCol, NRow].Text := Format('%s %s', [FormatFloat(',0.' + StringOfChar('0', pvGridValues[vaCols[I], vaRows[j]].Decimais), cdslkMlLabRef.FieldByName('VLREFMIN').AsFloat),
                                  pvGridValues[vaCols[I], vaRows[j]].Unidade]);

                  // celula 2
                              NCol := TProfGrid.getIndexByNameCol(copy(pvGridValues[vaCols[I], vaRows[j]].NameCellRef, vaPosicaoPontoVirgula + 1, 1));
                              NRow := StrToInt(Trim(copy(pvGridValues[vaCols[I], vaRows[j]].NameCellRef, vaPosicaoPontoVirgula + 2, Length(pvGridValues[vaCols[I], vaRows[j]].NameCellRef) -
                                (vaPosicaoPontoVirgula + 1)))) - 1;
                  // preenche o grid value e o profGrid com os valores da referencia
                              if ppvValidarColRow(NCol, NRow, pvGridValues) and (pvGridValues[NCol, NRow].TipoDado IN [OBSERVACAO, TEXTO]) and (pvGridValues[NCol, NRow].OrigemDado <> 1) then
                                pvGridValues[NCol, NRow].Text :=
                                  Format('A %s %s', [FormatFloat(',0.' + StringOfChar('0', pvGridValues[vaCols[I], vaRows[j]].Decimais), cdslkMlLabRef.FieldByName('VLREFMAX').AsFloat),
                                  pvGridValues[vaCols[I], vaRows[j]].Unidade]);
                            end;
                          trMenorQue:
                            begin
                              NCol := TProfGrid.getIndexByNameCol(copy(pvGridValues[vaCols[I], vaRows[j]].NameCellRef, 1, 1));
                              NRow := StrToInt(Trim(copy(pvGridValues[vaCols[I], vaRows[j]].NameCellRef, 2, vaPosicaoPontoVirgula - 2))) - 1;
                              if ppvValidarColRow(NCol, NRow, pvGridValues) and (pvGridValues[NCol, NRow].TipoDado IN [OBSERVACAO, TEXTO]) and (pvGridValues[NCol, NRow].OrigemDado <> 1) then
                                pvGridValues[NCol, NRow].Text := Format('< %s %s', [FormatFloat(',0.' + StringOfChar('0', pvGridValues[vaCols[I], vaRows[j]].Decimais), cdslkMlLabRef.FieldByName('VLREFMAX').AsFloat),
                                  pvGridValues[vaCols[I], vaRows[j]].Unidade]);
                            end;
                          trMaiorQue:
                            begin
                              NCol := TProfGrid.getIndexByNameCol(copy(pvGridValues[vaCols[I], vaRows[j]].NameCellRef, 1, 1));
                              NRow := StrToInt(Trim(copy(pvGridValues[vaCols[I], vaRows[j]].NameCellRef, 2, vaPosicaoPontoVirgula - 2))) - 1;
                              if ppvValidarColRow(NCol, NRow, pvGridValues) and (pvGridValues[NCol, NRow].TipoDado IN [OBSERVACAO, TEXTO]) and (pvGridValues[NCol, NRow].OrigemDado <> 1) then
                                pvGridValues[NCol, NRow].Text := Format('> %s %s', [FormatFloat(',0.' + StringOfChar('0', pvGridValues[vaCols[I], vaRows[j]].Decimais), cdslkMlLabRef.FieldByName('VLREFMIN').AsFloat),
                                  pvGridValues[vaCols[I], vaRows[j]].Unidade]);
                            end;
                        end;

                      end
                    else // tem apenas uma celula
                      begin
                        NCol := TProfGrid.getIndexByNameCol(copy(pvGridValues[vaCols[I], vaRows[j]].NameCellRef, 1, 1));
                        NRow := StrToInt(Trim(copy(pvGridValues[vaCols[I], vaRows[j]].NameCellRef, 2, Length(pvGridValues[vaCols[I], vaRows[j]].NameCellRef) - 1))) - 1;

                        case TTipoReferencia(cdslkMlLabRef.FieldByName('TIPO_REFERENCIA').AsInteger) of
                          trEntreValores:
                            begin
                  // celula unica
                              if ppvValidarColRow(NCol, NRow, pvGridValues) and (pvGridValues[NCol, NRow].TipoDado IN [OBSERVACAO, TEXTO]) and (pvGridValues[NCol, NRow].OrigemDado <> 1) then
                                pvGridValues[NCol, NRow].Text := fpvFormatarValor(pvGridValues[vaCols[I], vaRows[j]].TipoDado, cdslkMlLabRef.FieldByName('TEXT').AsString, pvGridValues[vaCols[I], vaRows[j]].Unidade,
                                  pvGridValues[vaCols[I], vaRows[j]].Decimais,
                                  cdslkMlLabRef.FieldByName('VLREFMIN').AsFloat,
                                  cdslkMlLabRef.FieldByName('VLREFMAX').AsFloat);
                            end;
                          trMenorQue:
                            begin
                              if ppvValidarColRow(NCol, NRow, pvGridValues) and (pvGridValues[NCol, NRow].TipoDado IN [OBSERVACAO, TEXTO]) and (pvGridValues[NCol, NRow].OrigemDado <> 1) then
                                pvGridValues[NCol, NRow].Text := Format('< %s %s', [FormatFloat(',0.' + StringOfChar('0', pvGridValues[vaCols[I], vaRows[j]].Decimais), cdslkMlLabRef.FieldByName('VLREFMAX').AsFloat),
                                  pvGridValues[vaCols[I], vaRows[j]].Unidade]);
                            end;
                          trMaiorQue:
                            begin
                              if ppvValidarColRow(NCol, NRow, pvGridValues) and (pvGridValues[NCol, NRow].TipoDado IN [OBSERVACAO, TEXTO]) and (pvGridValues[NCol, NRow].OrigemDado <> 1) then
                                pvGridValues[NCol, NRow].Text := Format('> %s %s', [FormatFloat(',0.' + StringOfChar('0', pvGridValues[vaCols[I], vaRows[j]].Decimais), cdslkMlLabRef.FieldByName('VLREFMIN').AsFloat),
                                  pvGridValues[vaCols[I], vaRows[j]].Unidade]);
                            end;
                        end;
                      end;

                    // vamos ver se tem grafico de referencia
                    if pvGridValues[vaCols[I], vaRows[j]].CellGrafRef <> '' then
                      begin
                        NCol := TProfGrid.getIndexByNameCol(copy(pvGridValues[vaCols[I], vaRows[j]].CellGrafRef, 1, 1));
                        NRow := StrToInt(Trim(copy(pvGridValues[vaCols[I], vaRows[j]].CellGrafRef, 2, Length(pvGridValues[vaCols[I], vaRows[j]].CellGrafRef)))) - 1;

                        if ppvValidarColRow(NCol, NRow, pvGridValues) and (pvGridValues[NCol, NRow].TipoDado IN [OBSERVACAO, TEXTO]) and (pvGridValues[NCol, NRow].OrigemDado <> 1) then
                          begin
                            ppvCriarGrafico(pvGridValues[vaCols[I], vaRows[j]].ResultadoSemFormatacao, TTipoReferencia(cdslkMlLabRef.FieldByName('TIPO_REFERENCIA').AsInteger), cdslkMlLabRef.FieldByName('VLREFMIN').AsFloat,
                              cdslkMlLabRef.FieldByName('VLREFMAX').AsFloat, NCol, NRow);
                          end;
                      end;
                  end;
              end;
          end;

      end;
  finally
    cdslkMlLabRef.Filtered := false;
  end;

end;

procedure TfrmLaudoLabImp.ppvCriarGrafico(ipValor: String; ipTipoRef: TTipoReferencia; ipValorRefMin, ipValorRefMax: Double; ipColDestRef, ipRowDestRef: Integer);
var
  vaBmp: TBitmap;
  vaValorRepresentativo, vaRaio, vaDiametro, vaBorda, vaLinhaTop, vaLinhaCentro, vaLinhaBottom, vaTamanhoProporcional: Integer;
  vaResultado, vaTamanhoReal, vaProporcao: Double;
  vaResultadoCentro: boolean;
begin
  if TryStrToFloat(ipValor, vaResultado) then
    begin

      vaRaio := 3;
      vaDiametro := vaRaio * 2;
  // vamos criar a img agora
      vaBmp := TBitmap.Create;
      try
        vaBmp.Canvas.Pen.Color := clBlack;

         // configurando o tamanho da reta representativa
        // subtraio o raio para que tenha um espaco em branco no cantos para quando a bolinha do valor fica bem na extremidade

        vaBmp.SetSize(pvGridValues[ipColDestRef, ipRowDestRef].Width, ProfGrid1.DefaultRowHeight);
        vaTamanhoProporcional := Trunc(pvGridValues[ipColDestRef, ipRowDestRef].Width / 3);
        // colocando onde a reta sera desenhada
        vaLinhaCentro := vaBmp.Height div 2;
        // desenhando a linha
        vaBmp.Canvas.MoveTo(0, vaLinhaCentro);
        vaBmp.Canvas.LineTo(pvGridValues[ipColDestRef, ipRowDestRef].Width, vaLinhaCentro);

        vaLinhaTop := vaLinhaCentro - vaRaio;
        vaLinhaBottom := vaLinhaCentro + vaRaio;

        vaBmp.Canvas.Brush.Color := clBlack;
        { **************************
        O Seguinte calculo ser� feito:
        Pega-se a ref. max e min. e subtrai o maior do menor resultando no tamanho da reta, ent�o
        divide-se o tamanho da reta real pelo tamanho da real representativa, logo, tem-se a propor��o. Portanto, para descobrir os valores na reta
        representativa basta pegar ir pegando os valores reais subtraindo pelo menor valor real e ent�o dividir o valor pela propor��o encontrada.
        Formula:
        (Valor Desejado Real - Menor Ref. real)/Proporcao encontrada entre as retas => valor equivalente na reta representativa
        *************************** }

        if ipTipoRef = trMenorQue then
          ipValorRefMin := ipValorRefMax - vaTamanhoProporcional
        else if ipTipoRef = trMaiorQue then
          ipValorRefMax := ipValorRefMin + vaTamanhoProporcional;

        ipValorRefMin := Min(ipValorRefMin, ipValorRefMax);
        ipValorRefMax := Max(ipValorRefMin, ipValorRefMax);

        vaTamanhoReal := ipValorRefMax - ipValorRefMin;
        vaProporcao := vaTamanhoReal / vaTamanhoProporcional;

        // vamos desenhar a linha de ref.
        if ipTipoRef <> trMenorQue then
          begin
            vaBmp.Canvas.MoveTo(vaTamanhoProporcional, vaLinhaTop);
            vaBmp.Canvas.LineTo(vaTamanhoProporcional, vaLinhaBottom);
          end;

        if ipTipoRef <> trMaiorQue then
          begin
            vaBmp.Canvas.MoveTo(vaTamanhoProporcional * 2, vaLinhaTop);
            vaBmp.Canvas.LineTo(vaTamanhoProporcional * 2, vaLinhaBottom);
          end;

        vaValorRepresentativo := Round((vaResultado - ipValorRefMin) / vaProporcao) + vaTamanhoProporcional;
        if vaValorRepresentativo > ((vaTamanhoProporcional * 3) - vaRaio) then
          vaValorRepresentativo := (vaTamanhoProporcional * 3) - vaRaio
        else if vaValorRepresentativo < vaRaio then
          vaValorRepresentativo := vaDiametro;

        vaBmp.Canvas.Ellipse(vaValorRepresentativo - vaRaio, vaLinhaTop, vaValorRepresentativo + vaRaio, vaLinhaBottom);

        pvGridValues[ipColDestRef, ipRowDestRef].GraficoReferencia := vaBmp;
      except
        FreeAndNil(vaBmp);
      end;

    end;
end;

function TfrmLaudoLabImp.ppvValidarColRow(ipCol, ipRow: Integer; ipGridValues: TArrayOfArrayOfTMyGridConf): boolean;
begin
  Result := false;
  if (ipCol >= Low(ipGridValues)) and (ipCol <= High(ipGridValues)) and (ipRow >= Low(ipGridValues[ipCol])) and (ipRow <= High(ipGridValues[ipCol])) then
    Result := True;

end;

procedure TfrmLaudoLabImp.ppvProcessarFormulas;
var
  vaCol, vaRow: Integer;
begin
  // vamos fazer o la�o novamente
  cdslkModelo_Lab_Campo_Resultados.First;
  while not cdslkModelo_Lab_Campo_Resultados.Eof do
    begin
      vaCol := TProfGrid.getIndexByNameCol(cdslkModelo_Lab_Campo_Resultados.FieldByName('COL').AsString);
      vaRow := cdslkModelo_Lab_Campo_Resultados.FieldByName('ROW').AsInteger - 1;

      if ppvValidarColRow(vaCol, vaRow, pvGridValues) and (Trim(cdslkModelo_Lab_Campo_Resultados.FieldByName('FORMULA').AsString) <> '') then
        begin
          ppvCalcularFormatarFormula(vaCol, vaRow);
        end;

      cdslkModelo_Lab_Campo_Resultados.Next;
    end;
end;

procedure TfrmLaudoLabImp.ppuCarregarImagemCabecalho(ipCdsConfigLaudo: TClientDataSet);
var
  vaImgField: TField;
begin
  vaImgField := nil;

  if Assigned(ipCdsConfigLaudo) and (not ipCdsConfigLaudo.Active) then
    ipCdsConfigLaudo.Open;

  try
    // vamos verificar se essa funcao foi chamado do plaudo ou do pmedico
    if Assigned(ipCdsConfigLaudo) then
      begin
        if (not ipCdsConfigLaudo.FieldByName('IMAGEM_CABECALHO').IsNull) then
          begin
          // quando se usa img de cabecalho o MARGSUP do configFrm_Texto deixa de ser usado
            ppImpLaudo.PrinterSetup.Units := utMillimeters;
            ppImpLaudo.PrinterSetup.MarginTop := 1;
            // vamos aumentar o tamanho do cabecalho para que caiba a img do cabecalho, como o rich esta ancorado em left e bottom ele ira descer deixando a img acima dele.
            ppHeaderBand1.Height := ppHeaderBand1.Height + Trunc(ipCdsConfigLaudo.FieldByName('ALTURA').AsFloat * 10);

            ppImgCabecalho.Left := 0;
            ppImgCabecalho.Top := 0; // em relacao ao cabecalho
            ppImgCabecalho.Width := Trunc(ipCdsConfigLaudo.FieldByName('LARGURA').AsFloat * 10);
            ppImgCabecalho.Height := Trunc(ipCdsConfigLaudo.FieldByName('ALTURA').AsFloat * 10);
            ppImgCabecalho.Stretch := ipCdsConfigLaudo.FieldByName('STRETCH').AsInteger = 1;
            if ipCdsConfigLaudo.FieldByName('CENTRALIZAR').AsInteger = 1 then
              ppImgCabecalho.Left := (ppImpLaudo.PrinterSetup.PaperWidth - (ipCdsConfigLaudo.FieldByName('LARGURA').AsFloat * 10))/2;
            ppImgCabecalho.BringToFront;

            cdsInfoExtras.Edit;
            cdsInfoExtrasIMG_CABECALHO.Assign(ipCdsConfigLaudo.FieldByName('IMAGEM_CABECALHO'));
            cdsInfoExtras.Post;

            ppRichCabecalho.Top := ppImgCabecalho.Height;

            ppImgCabecalho.Visible := True;
          end;
      end
    else // chamdo pelo pmedico
      begin
        // qnd chamado pelo promedico nao precisa disso pois a img ja esta no cabecalho.
        // Essa img � utilizada somente por causa do papel timbrado, pois quando imprime nao precisa, mas como nesse caso esta gerando um PDF ira precisar
        ppImgCabecalho.Visible := false;
      end;
  except
    on E: Exception do
      raise Exception.Create('Erro ao tentar carregar a imagem do cabe�alho. Detalhes: ' + E.Message);
  end;

end;

procedure TfrmLaudoLabImp.ppuConfigurarLarguraAltura(ipMudarTamanhoPapel: boolean);
begin
  if ipMudarTamanhoPapel then // ira mudar o tamanho do papel
    Begin
      ppImpLaudo.Units := utMillimeters;
      ppImpLaudo.PrinterSetup.Units := utMillimeters;
      ppImpLaudo.PrinterSetup.PaperHeight := cdslkConfigFrm_Texto.FieldByName('ALTUPAP').AsFloat * 10;
      ppImpLaudo.PrinterSetup.PaperWidth := cdslkConfigFrm_Texto.FieldByName('LARGPAP').AsFloat * 10;
      ppImpLaudo.PrinterSetup.MarginTop := cdslkConfigFrm_Texto.FieldByName('MARGSUP').AsFloat * 10;
      ppImpLaudo.PrinterSetup.MarginBottom := cdslkConfigFrm_Texto.FieldByName('MARGINF').AsFloat * 10;

      if cdslkConfigFrm_Texto.FieldByName('TPIMPRE').AsString = 'PAISAGEM' then
        ppImpLaudo.PrinterSetup.Orientation := poLandscape
      else
        ppImpLaudo.PrinterSetup.Orientation := poPortrait;
    End;

  ppImpLaudo.PrinterSetup.MarginLeft := cdslkConfigFrm_Texto.FieldByName('MARGESQ').AsFloat * 10;
  ppImpLaudo.PrinterSetup.MarginRight := ppImpLaudo.PrinterSetup.PaperWidth - ((cdslkConfigFrm_Texto.FieldByName('LARGTXT').AsFloat * 10) + ppImpLaudo.PrinterSetup.MarginLeft);

  // Tive que colocar zero por causa do quick, pois ele nao usava a margim, ao invez ficava setando o left de cada header, detail e footer, entao tive q fazer assim tbm pra continuar funcionando
// ppImpLaudo.PrinterSetup.MarginLeft := 0;

  // ppImpLaudo.Units := utScreenPixels;
  ppHeaderBand1.Height := Trunc(cdslkConfigFrm_Texto.FieldByName('ALTUCAB').AsInteger * 10); // * 38);
  ppRichCabecalho.Height := ppHeaderBand1.Height;
  ppRichCabecalho.Width := Trunc(cdslkConfigFrm_Texto.FieldByName('LARGTXT').AsInteger * 10);

  ppFooterBand1.Height := Trunc(cdslkConfigFrm_Texto.FieldByName('ALTUROD').AsInteger * 10);
  ppRichRodape.Height := ppImpLaudo.FooterBand.Height;
  ppRichRodape.Width := Trunc(cdslkConfigFrm_Texto.FieldByName('LARGTXT').AsInteger * 10);

  // TODO: Achar um jeito de resolver o problema do sumario, pois uma vez q o detail ocupa toda a pagina for�a o sumario a ocupar uma nova pagina, mesmo q a ultima pagina tenha espaco suficiente
  ppSummaryBand1.Height := 0;
  ppRichSumario.Height := 0;
  ppRichSumario.Width := 0;

  ppRichCabecalho.Left := 0;
  ppRichCabecalho.Top := 0;

  ppImgLaudo.Left := 0;
  ppImgLaudo.Top := 0;

  ppRichRodape.Left := 0;
  ppRichRodape.Top := 0;

  ppRichSumario.Left := 0;
  ppRichSumario.Top := 0;

// ppSummaryBand1.Height := Trunc(cdslkConfigFrm_Texto.FieldByName('ALTUSUM').AsInteger * 10);
// ppRichSumario.Height := Trunc(cdslkConfigFrm_Texto.FieldByName('ALTUSUM').AsInteger * 10);
// ppRichSumario.Width := Trunc(cdslkConfigFrm_Texto.FieldByName('LARGTXT').AsInteger * 10);
end;

procedure TfrmLaudoLabImp.ppvCalcularFormatarFormula(ipCol, ipRow: Integer);
const
  coLocalSeNegativo = 'SE NEGATIVO=';
var
  vaResultadoFormula: Double;
  vaResultadoCondicao: boolean;
  vaPosSeNegativo: Integer;

begin
  inherited;
  vaPosSeNegativo := Pos(coLocalSeNegativo, UpperCase(pvGridValues[ipCol, ipRow].Condicao));

  vaResultadoCondicao := True;
  if vaPosSeNegativo <= 0 then // quer dizer que n�o tem a condi��o se negativo
    vaResultadoCondicao := TLaudoLabFormula.fpuVerificarCondicaoFormula(cdslkModelo_Lab_Campo_Resultados.FieldByName('CONDICAO').AsString,
      cdslkModelo_Lab_Campo_Resultados.FieldByName('DECIMAIS').AsInteger, pvPaciente, sheet, pvGridValues); // calcula a condi��o

  vaResultadoFormula := TLaudoLabFormula.fpuCalcularFormula(cdslkModelo_Lab_Campo_Resultados.FieldByName('FORMULA').AsString, cdslkModelo_Lab_Campo_Resultados.FieldByName('DECIMAIS').AsInteger, pvPaciente, pvGridValues, sheet);
  // calcula a formula
  if (vaResultadoCondicao) then // a condi��o � verdadeira
    begin
      pvGridValues[ipCol, ipRow].Text := FloatToStr(vaResultadoFormula);
      pvGridValues[ipCol, ipRow].ResultadoSemFormatacao := pvGridValues[ipCol, ipRow].Text;
      if pvGridValues[ipCol, ipRow].Decimais > 0 then
        pvGridValues[ipCol, ipRow].Text := FormatFloat(',0.' + StringOfChar('0', pvGridValues[ipCol, ipRow].Decimais), vaResultadoFormula)
      else
        pvGridValues[ipCol, ipRow].Text := FormatFloat(',0', vaResultadoFormula);

      if ((vaPosSeNegativo > 0) and (vaResultadoFormula < 0)) then
        // quer dizer que o resultado ser� o que estiver na frente do = e n�o o valor negativo
        begin
          vaPosSeNegativo := Pos('=', pvGridValues[ipCol, ipRow].Condicao);
          pvGridValues[ipCol, ipRow].Text := copy(pvGridValues[ipCol, ipRow].Condicao, vaPosSeNegativo + 1);
          pvGridValues[ipCol, ipRow].ResultadoSemFormatacao := pvGridValues[ipCol, ipRow].Text;
        end
      else
        // mostra no prof Grid com as unidades
        pvGridValues[ipCol, ipRow].Text := pvGridValues[ipCol, ipRow].Text + ' ' + pvGridValues[ipCol, ipRow].Unidade;
    end
  else // a condi��o � falsa
    begin
      pvGridValues[ipCol, ipRow].Text := '';
    end;
end;

function TfrmLaudoLabImp.fpuGetTamanhoDisponivel: Double;
begin
  // 3.8 converte milimetros para pixels (LEMBRE-SE: O TopMargin e o BottonMargim estao em MM, enquanto o height esta em pixels)
  // Result := QuickRep1.Height - (QuickRep1.Page.TopMargin * 3.8) - (QuickRep1.Page.BottomMargin * 3.8) - QRBandHeader.Height - QRBandFooter.Height;
  ppImpLaudo.PrinterSetup.Units := utScreenPixels;
  ppImpLaudo.Units := utScreenPixels;

  Result := (ppImpLaudo.PrinterSetup.PaperHeight) - (ppImpLaudo.PrinterSetup.MarginTop) - (ppImpLaudo.PrinterSetup.MarginBottom) - (ppImpLaudo.HeaderBand.Height) - (ppImpLaudo.FooterBand.Height);
// if FUltimaPagina then
// Result := Result - ppImpLaudo.SummaryBand.Height;

end;

function TfrmLaudoLabImp.fpvFormatarValor(ipTipo: TTipoDado; ipRefText, ipUnidade: string; ipDecimais: Integer; ipRefMin, ipRefMax: Double): string;
begin

  if (ipTipo IN [OBSERVACAO, TEXTO]) or (ipRefText <> '') THEN
    Result := cdslkMlLabRef.FieldByName('TEXT').AsString
  else
    begin
      if ipDecimais > 0 then
        begin
          Result := Format('%s a %s %s', [FormatFloat(',0.' + StringOfChar('0', ipDecimais), ipRefMin),
            FormatFloat(',0.' + StringOfChar('0', ipDecimais), ipRefMax), ipUnidade]);
        end
      else
        begin
          Result := Format('%s a %s %s', [FormatFloat(',0', ipRefMin), FormatFloat(',0', ipRefMax), ipUnidade]);
        end;
    end

end;

procedure TfrmLaudoLabImp.LoadToGrid;
var
  vaCol, I, TCol, NCol, TLin, NLin: Integer;
  vaDeletarLinha: boolean;
  vaLinhasExcluir: TArray<Integer>;
begin
  SetLength(vaLinhasExcluir, 0);
  // ---Monta o Grid e carrega os dados para ele
  NLin := 0;
  TLin := ProfGrid1.RowCount;
  TCol := ProfGrid1.ColCount;

  while NLin < TLin do
    begin
      NCol := 0;
      while (NCol < TCol) and ppvValidarColRow(NCol, NLin, pvGridValues) do
        begin
          ProfGrid1.Cols[NCol].Width := pvGridValues[NCol, NLin].Width; // Largura da Coluna
          ProfGrid1.Cells[NCol, NLin].Font.Name := pvGridValues[NCol, NLin].FontName; // Nome da fonte
          ProfGrid1.Cells[NCol, NLin].Font.Color := pvGridValues[NCol, NLin].FontColor; // cor
          ProfGrid1.Cells[NCol, NLin].Font.Size := pvGridValues[NCol, NLin].FontSize; // tamanho
          ProfGrid1.Cells[NCol, NLin].Alignment := IntToAlignment(pvGridValues[NCol, NLin].FontAlignment); // alinhamento
          ProfGrid1.Cells[NCol, NLin].Font.Style := StrToStyles(pvGridValues[NCol, NLin].FontStyle); // estilo

          if (pvGridValues[NCol, NLin].Visivel = Ord(viImprimirLinhaSomenteSeHouverConteudo)) then
            begin
              vaDeletarLinha := True;
              // Nesse caso verifico a linha toda, se nao houver nada na linha, vou deleta-la
              for vaCol := Low(pvGridValues) to High(pvGridValues) do
                begin
                  if (pvGridValues[vaCol, NLin].Text.Trim <> '') and ((pvGridValues[vaCol, NLin].Text.Trim <> coObsLaudo)) then
                    begin
                      vaDeletarLinha := false;
                      Break;
                    end;
                end;
              if vaDeletarLinha then
                begin
                  // pra nao ter q percorrer o gridvalues e ir jogando uma linha pra outra para q a exclusao funcione, vou apenas anotar as linhas a serem excluidas
                  SetLength(vaLinhasExcluir, Length(vaLinhasExcluir) + 1);
                  vaLinhasExcluir[high(vaLinhasExcluir)] := NLin;

                  Break;
                end;
            end;
          if (pvGridValues[NCol, NLin].Visivel in [Ord(viImprimir), Ord(viImprimirLinhaSomenteSeHouverConteudo)]) then
            begin
              // se for valor
              ProfGrid1.Cells[NCol, NLin].Text := pvGridValues[NCol, NLin].Text; // Texto/Valor da Celula
              ProfGrid1.Cells[NCol, NLin].ImprimirContorno := pvGridValues[NCol, NLin].Contorno;
              if Assigned(pvGridValues[NCol, NLin].GraficoReferencia) then
                begin
                  ProfGrid1.Cells[NCol, NLin].Graphic := pvGridValues[NCol, NLin].GraficoReferencia;
                  FreeAndNil(pvGridValues[NCol, NLin].GraficoReferencia); // se nao destruir vai dar memory leak
                end;
            end;

          Inc(NCol);
        end;
      Inc(NLin);
    end;

  // ---Carregando mesclagens para as c�lulas
  NLin := 0;
  while NLin < TLin do
    begin
      NCol := 0;
      while NCol < TCol do
        begin
          if ppvValidarColRow(NCol, NLin, pvGridValues) and (pvGridValues[NCol, NLin].Merge_Status = INICIA_MERGE) then
            begin
              ProfGrid1.MergeHoriz(NumberOfColumn(pvGridValues[NCol, NLin].Merge_Col_Ini) - 1, NumberOfColumn(pvGridValues[NCol, NLin].Merge_Col_Fim) - 1, NLin);
            end;
          Inc(NCol);
        end;
      Inc(NLin);
    end;

   // garantindo que esteja ordenado
  TArray.Sort<Integer>(vaLinhasExcluir, TComparer<Integer>.construct(
    function(const Left, Right: Integer): Integer
    begin
      Result := Left - Right;
    end));

  // vamos remover as linhas q nao � para serem impressas
  for I := high(vaLinhasExcluir) downto Low(vaLinhasExcluir) do
    ProfGrid1.DeleteRow(vaLinhasExcluir[I]);

  // vamos atualizar o tamanho
  Dec(TLin, Length(vaLinhasExcluir));

  ProfGrid1.RowCount := TLin;
  ProfGrid1.ColCount := NCol;

// Adicionando os cabecalhos
  ppvAdicionarCabecalhos();

end;

procedure TfrmLaudoLabImp.ppvAdicionarCabecalhos();
var
  vaPosicao: Integer;
  vaHeader: THeaderFooterInfo;
  vaFontName, vaDataColeta, vaDataLiberouAssinou: String;

  function flCriarHeader(ipTitulo: String; ipFontSize: Integer; ipStyles: TFontStyles; ipAlinhamento: TAlignment = taLeftJustify; ipLinha: Integer = -1): THeaderFooterInfo;
  begin
    Result := THeaderFooterInfo.Create(ipTitulo);
    Result.Font := TFont.Create;
    Result.Font.Name := vaFontName;
    Result.Font.Size := ipFontSize;
    Result.Font.Style := ipStyles;
    Result.Alinhamento := ipAlinhamento;
    if ipLinha <> -1 then
      Result.Linha := ipLinha;
    ProfGrid1.Cabecalho.Add(Result);
  end;

begin
  vaFontName := 'Verdana';
  if not cdslkModelo_Lab.FieldByName('FONTE_TITULO').IsNull then
    vaFontName := cdslkModelo_Lab.FieldByName('FONTE_TITULO').AsString;

  vaPosicao := 0;
  if cdslkModelo_Lab.FieldByName('TIPO_CABECALHO').AsInteger = 1 then // Modelo com backgroud
    begin
      vaHeader := flCriarHeader('[Conv�nio: ' + NomeConvenio + ' | C�digo Oficial: ' + cdslkExameProc.FieldByName('CODIGO_OFICIAL').AsString + ']', 5, [], taLeftJustify, vaPosicao);

      if cdslkExameProc.FieldByName('Usuariodhrecebumat').IsNull then
        vaDataColeta := FormatDateTime('dd/MM/yyyy hh:mm', cdslkExameProc.FieldByName('USUARIODHINC').AsDateTime)
      else
        vaDataColeta := FormatDateTime('dd/MM/yyyy hh:mm', cdslkExameProc.FieldByName('Usuariodhrecebumat').AsDateTime);

      vaDataLiberouAssinou := FormatDateTime('dd/MM/yyyy hh:mm', cdslkExameProc.FieldByName('Usuariodhliberou').AsDateTime);
      vaHeader := flCriarHeader('[Coleta: ' + vaDataColeta + ' | Assinado: ' + vaDataLiberouAssinou + ']', 5, [], taRightJustify, vaPosicao);

      Inc(vaPosicao);
    end;

  if cdslkModelo_Lab.FieldByName('TITULO_EXAME').AsInteger = 1 then
    begin
      vaHeader := flCriarHeader(cdslkExameProc.FieldByName('NOMEPROC').AsString, 11, [fsBold], taLeftJustify, vaPosicao);
      if cdslkModelo_Lab.FieldByName('TIPO_CABECALHO').AsInteger = 1 then // Modelo com backgroud
        begin
          vaHeader.Title := vaHeader.Title;
          if not cdslkModelo_Lab.FieldByName('COR_BACKGROUND').IsNull then
            vaHeader.Background := cdslkModelo_Lab.FieldByName('COR_BACKGROUND').AsInteger;
          vaHeader.Contorno := 11001; // esquerda e acima

          vaHeader := flCriarHeader('No. Exame: ' + cdslkExameProc.FieldByName('CODIGO').AsString, 7, [], taRightJustify, vaPosicao);
          if not cdslkModelo_Lab.FieldByName('COR_BACKGROUND').IsNull then
            vaHeader.Background := cdslkModelo_Lab.FieldByName('COR_BACKGROUND').AsInteger;
          vaHeader.Contorno := 10011; // direita e acima
        end;

      Inc(vaPosicao);
    end;

  if cdslkModelo_Lab.FieldByName('TITULO_MATERIAL').AsInteger = 1 then
    begin
      vaHeader := flCriarHeader(cdslkModelo_Lab.FieldByName('MATERIAL').AsString, 7, [fsBold], taLeftJustify, vaPosicao);
      if cdslkModelo_Lab.FieldByName('TIPO_CABECALHO').AsInteger = 1 then // Modelo com backgroud
        begin
          vaHeader.Title := 'Material: ' + vaHeader.Title + ' | M�todo: ' + cdslkModelo_Lab.FieldByName('METODO').AsString;
          vaHeader.Font.Style := [];
          if not cdslkModelo_Lab.FieldByName('COR_BACKGROUND').IsNull then
            vaHeader.Background := cdslkModelo_Lab.FieldByName('COR_BACKGROUND').AsInteger;
          vaHeader.Contorno := 11110;
        end;
    end;
end;

function TfrmLaudoLabImp.NumberOfColumn(Column: String): Integer;
begin
  NumberOfColumn := -1;
  if Column = 'A' then
    NumberOfColumn := 1;
  if Column = 'B' then
    NumberOfColumn := 2;
  if Column = 'C' then
    NumberOfColumn := 3;
  if Column = 'D' then
    NumberOfColumn := 4;
  if Column = 'E' then
    NumberOfColumn := 5;
  if Column = 'F' then
    NumberOfColumn := 6;
  if Column = 'G' then
    NumberOfColumn := 7;
  if Column = 'H' then
    NumberOfColumn := 8;
  if Column = 'I' then
    NumberOfColumn := 9;
  if Column = 'J' then
    NumberOfColumn := 10;
  if Column = 'K' then
    NumberOfColumn := 11;
  if Column = 'L' then
    NumberOfColumn := 12;
  if Column = 'M' then
    NumberOfColumn := 13;
  if Column = 'N' then
    NumberOfColumn := 14;
  if Column = 'O' then
    NumberOfColumn := 15;
  if Column = 'P' then
    NumberOfColumn := 16;
  if Column = 'Q' then
    NumberOfColumn := 17;
  if Column = 'R' then
    NumberOfColumn := 18;
  if Column = 'S' then
    NumberOfColumn := 19;
  if Column = 'T' then
    NumberOfColumn := 20;
  if Column = 'U' then
    NumberOfColumn := 21;
  if Column = 'V' then
    NumberOfColumn := 22;
  if Column = 'W' then
    NumberOfColumn := 23;
  if Column = 'X' then
    NumberOfColumn := 24;
  if Column = 'Y' then
    NumberOfColumn := 25;
  if Column = 'Z' then
    NumberOfColumn := 26;
end;

function TfrmLaudoLabImp.IntToAlignment(MyNumber: Integer): TAlignment;
begin
  if MyNumber = 0 then
    IntToAlignment := taCenter;
  if MyNumber = 1 then
    IntToAlignment := taLeftJustify;
  if MyNumber = 2 then
    IntToAlignment := taRightJustify;
end;

procedure TfrmLaudoLabImp.SetCallBackLog(const Value: TCallBackLog);
begin
  FCallBackLog := Value;
end;

procedure TfrmLaudoLabImp.SetcdsExame(const Value: TClientDataSet);
begin
  FcdsExame := Value;
end;

procedure TfrmLaudoLabImp.SetcdslkConfigFrm_AssDigital(
  const Value: TClientDataSet);
begin
  FcdslkConfigFrm_AssDigital := Value;
end;

procedure TfrmLaudoLabImp.SetcdslkConfigFrm_Texto(
  const Value: TClientDataSet);
begin
  FcdslkConfigFrm_Texto := Value;
end;

procedure TfrmLaudoLabImp.SetcdslkExameProc(const Value: TClientDataSet);
begin
  FcdslkExameProc := Value;
end;

procedure TfrmLaudoLabImp.SetcdslkExameSessao(const Value: TClientDataSet);
begin
  FcdslkExameSessao := Value;
end;

procedure TfrmLaudoLabImp.SetcdslkFichas(const Value: TClientDataSet);
begin
  FcdslkFichas := Value;
end;

procedure TfrmLaudoLabImp.SetcdslkMedicos(const Value: TClientDataSet);
begin
  FcdslkMedicos := Value;
end;

procedure TfrmLaudoLabImp.SetcdslkMedicos_Assinatura(
  const Value: TClientDataSet);
begin
  FcdslkMedicos_Assinatura := Value;
end;

procedure TfrmLaudoLabImp.SetcdslkMlLabRef(const Value: TClientDataSet);
begin
  FcdslkMlLabRef := Value;
end;

procedure TfrmLaudoLabImp.SetcdslkModeloLab(const Value: TClientDataSet);
begin
  FcdslkModelo_Lab := Value;
end;

procedure TfrmLaudoLabImp.SetcdslkModelo_Lab_Campo_Resultados(
  const Value: TClientDataSet);
begin
  FcdslkModelo_Lab_Campo_Resultados := Value;
end;

procedure TfrmLaudoLabImp.SetcdslkModelo_Lab_Rodape(
  const Value: TClientDataSet);
begin
  FcdslkModelo_Lab_Rodape := Value;
end;

procedure TfrmLaudoLabImp.SetcdslkSenhaUs(const Value: TClientDataSet);
begin
  FcdslkSenhaUs := Value;
end;

procedure TfrmLaudoLabImp.SetDataSis(const Value: TDateTime);
begin
  FDataSis := Value;
end;

procedure TfrmLaudoLabImp.SetImprimirAssDigitalPorLaudo(const Value: boolean);
begin
  FImprimirAssDigitalPorLaudo := Value;
end;

procedure TfrmLaudoLabImp.SetInserirMd5(const Value: boolean);
begin
  FInserirMd5 := Value;
end;

procedure TfrmLaudoLabImp.SetNomeConvenio(const Value: String);
begin
  FNomeConvenio := Value;
end;

procedure TfrmLaudoLabImp.SetNomeSolicitante(const Value: String);
begin
  FNomeSolicitante := Value;
end;

procedure TfrmLaudoLabImp.SetProxyProcedimentos(
  const Value: TSMFuncoesProcedimentosClient);
begin
  FProxyProcedimentos := Value;
end;

function TfrmLaudoLabImp.StrToStyles(MyString: String): TFontStyles;
var
  stStyles: TFontStyles;
begin
  stStyles := [];
  // --Negrito
  if copy(MyString, 1, 1) = 'S' then
    stStyles := stStyles + [fsBold];
  // --Italico
  if copy(MyString, 2, 1) = 'S' then
    stStyles := stStyles + [fsItalic];
  // --Sublinhado
  if copy(MyString, 3, 1) = 'S' then
    stStyles := stStyles + [fsUnderline];
  // --Riscado
  if copy(MyString, 4, 1) = 'S' then
    stStyles := stStyles + [fsStrikeout];
  // --
  StrToStyles := stStyles;
end;

constructor TfrmLaudoLabImp.Create(ipCdslkModelo_Lab, ipCdslkConfigFrm_Texto, ipCdslkMlLabRef, ipCdslkFichas, ipCdslkModelo_Lab_Campo_Resultados, ipCdslkExame, ipCdslkExame_Proc, ipCdslkExameSessao, ipCdslkMedicos,
  ipCdsLkMedicos_Assinatura, ipCdslkConfigFrm_AssDigital, ipCdslkModelo_Lab_Rodape: TClientDataSet; ipDataSis: TDateTime; ipProxyProcedimentos: TSMFuncoesProcedimentosClient);
begin
  inherited Create(nil);
  pvModelos := TDictionary<Integer, TModeloInfo>.Create;

  cdslkModelo_Lab := ipCdslkModelo_Lab;
  cdslkConfigFrm_Texto := ipCdslkConfigFrm_Texto;
  cdslkMlLabRef := ipCdslkMlLabRef;
  cdslkFichas := ipCdslkFichas;
  cdslkModelo_Lab_Campo_Resultados := ipCdslkModelo_Lab_Campo_Resultados;
  cdslkExame := ipCdslkExame;
  cdslkExameProc := ipCdslkExame_Proc;
  cdslkExameSessao := ipCdslkExameSessao;
  cdslkMedicos := ipCdslkMedicos;
  cdslkMedicos_Assinatura := ipCdsLkMedicos_Assinatura;
  cdslkConfigFrm_AssDigital := ipCdslkConfigFrm_AssDigital;
  cdslkModelo_Lab_Rodape := ipCdslkModelo_Lab_Rodape;
  FProxyProcedimentos := ipProxyProcedimentos;
  DataSis := ipDataSis;

  // ppImgCabecalho.Visible := false; // caso queira exibi-la chame ppuCarregarImgCabecalho

  Idade_Exata(cdslkFichas.FieldByName('DTNASCIMENTO').AsDateTime, cdslkExame.FieldByName('DATA_EXAME').AsDateTime, pvPaciente.idade, pvPaciente.unidadeIdade);
  pvPaciente.Sexo := cdslkFichas.FieldByName('SEXO').AsString;
  pvPaciente.DataNascimento := cdslkFichas.FieldByName('DTNASCIMENTO').AsDateTime;

  cdsDados.CreateDataSet;
  cdsInfoExtras.CreateDataSet;

  rvHelper.RichView.Style := RVStyle;
  rvHelper.RichView.TopMargin := 0;
  rvHelper.RichView.LeftMargin := 0;
  rvHelper.RichView.RightMargin := 0;
  rvHelper.RichView.BottomMargin := 0;
end;

destructor TfrmLaudoLabImp.Destroy;
begin
  cdslkExameSessao.Close;
  pvModelos.Free;
  inherited;
end;

procedure TfrmLaudoLabImp.ppvCarregarCabecalhoRodapeSumario();
begin

  cdsInfoExtras.Edit;

  ppvTrocarChaves(RichTemp, TBlobField(cdslkConfigFrm_Texto.FieldByName('CABETXT')), TBlobField(cdsInfoExtrasCABECALHO));
  ppvTrocarChaves(RichTemp, TBlobField(cdslkConfigFrm_Texto.FieldByName('RODATXT')), TBlobField(cdsInfoExtrasRODAPE));
  ppvTrocarChaves(RichTemp, TBlobField(cdslkConfigFrm_Texto.FieldByName('SUMATXT')), TBlobField(cdsInfoExtrasSUMARIO));

  cdsInfoExtras.Post;

end;

procedure TfrmLaudoLabImp.ppvTrocarChaves(ipRichView: TSRichViewEdit; ipFieldOrigem, ipFieldDestino: TBlobField);
var
  vaStream: TMemoryStream;
begin
  vaStream := TMemoryStream.Create;
  try
    ipFieldOrigem.SaveToStream(vaStream);
    vaStream.Position := 0;
    ipRichView.Clear;
    ipRichView.LoadRVFFromStream(vaStream);

    TRichUtils.ppuProcurarSubstituirMarcador(ipRichView.ActiveEditor, 'NUMEXA', IntToStrZero(cdslkExame.FieldByName('CODIGO').AsInteger, 6));
    TRichUtils.ppuProcurarSubstituirMarcador(ipRichView.ActiveEditor, 'DATEXA', DateToStr(cdslkExame.FieldByName('DATA_EXAME').AsDateTime));
    TRichUtils.ppuProcurarSubstituirMarcador(ipRichView.ActiveEditor, 'NOMEXA', cdslkExameProc.FieldByName('NOMEPROC').AsString);
    TRichUtils.ppuProcurarSubstituirMarcador(ipRichView.ActiveEditor, 'MATEXA', cdslkModelo_Lab.FieldByName('MATERIAL').AsString);
    TRichUtils.ppuProcurarSubstituirMarcador(ipRichView.ActiveEditor, 'DATATU', DateToStr(DataSis));
    TRichUtils.ppuProcurarSubstituirMarcador(ipRichView.ActiveEditor, 'NUMFIC', IntToStrZero(cdslkExame.FieldByName('NROFICHA_FICHAS').AsInteger, 6));
    TRichUtils.ppuProcurarSubstituirMarcador(ipRichView.ActiveEditor, 'NOMPAC', cdslkFichas.FieldByName('NOMEPACIENTE').AsString);
    TRichUtils.ppuProcurarSubstituirMarcador(ipRichView.ActiveEditor, 'CIVPAC', cdslkFichas.FieldByName('ECIVIL').AsString);
    TRichUtils.ppuProcurarSubstituirMarcador(ipRichView.ActiveEditor, 'PROPAC', cdslkFichas.FieldByName('PROFISSAO').AsString);
    TRichUtils.ppuProcurarSubstituirMarcador(ipRichView.ActiveEditor, 'SEXPAC', cdslkFichas.FieldByName('SEXO').AsString);
    // TRichUtils.ppuProcurarSubstituirMarcador(ipRichView, 'NACPAC', cdslkFichas.FieldByName('PAIS_ORIGEM').AsString);
    TRichUtils.ppuProcurarSubstituirMarcador(ipRichView.ActiveEditor, 'NATPAC', cdslkFichas.FieldByName('NATURALIDADE').AsString);
    TRichUtils.ppuProcurarSubstituirMarcador(ipRichView.ActiveEditor, 'DATNAS', cdslkFichas.FieldByName('DTNASCIMENTO').AsString);
    TRichUtils.ppuProcurarSubstituirMarcador(ipRichView.ActiveEditor, 'RGPAC', cdslkFichas.FieldByName('NRORG').AsString);
    TRichUtils.ppuProcurarSubstituirMarcador(ipRichView.ActiveEditor, 'IDAPAC', IntToStr(pvPaciente.idade) + ' ' + pvPaciente.unidadeIdade);
    TRichUtils.ppuProcurarSubstituirMarcador(ipRichView.ActiveEditor, 'CONPAC', NomeConvenio);
    TRichUtils.ppuProcurarSubstituirMarcador(ipRichView.ActiveEditor, 'MEDSOL', NomeSolicitante);
    TRichUtils.ppuProcurarSubstituirMarcador(ipRichView.ActiveEditor, 'DHLIBE', DateToStr(cdslkExameProc.FieldByName('USUARIODHLIBEROU').AsDateTime));

    vaStream.Clear;
    //ipRichView.ActiveEditor.SaveRVFToStream(vaStream, false);
    //Existe um bug no componente do RichView para o Report que nao funciona corretamente os novos marcadores quando tem imagem junto, por isso usei RTF
    ipRichView.ActiveEditor.SaveRTFToStream(vaStream, false);

    vaStream.Position := 0;
    ipFieldDestino.LoadFromStream(vaStream);
  finally
    vaStream.Free;
  end;
end;

procedure TfrmLaudoLabImp.Atribuir_Chave(Chave, Campo: String; Editor: TRichEdit);
var
  PIni: Integer;
  vaAux: string;
  PFin: Integer;
  vaText: String;
begin
  vaText := StringReplace(Editor.Text, #$A, '', [rfReplaceAll]);
  PIni := Pos('[' + Chave, vaText) - 1;
  if PIni >= 0 then
    begin
      vaAux := copy(vaText, PIni);
      PFin := PIni + Pos(']', vaAux);
      Chave := '[' + Chave + StringOfChar(' ', (PFin - PIni - 3) - Length(Chave)) + ']';
      Campo := copy(Campo, 1, PFin - PIni);
      Campo := Campo + StringOfChar(' ', Length(Chave) - Length(Campo));
      Editor.SelStart := PIni;
      Editor.SelLength := (PFin - PIni) - 1;
      Editor.SelText := Campo;
    end;
end;

procedure TfrmLaudoLabImp.ppvGravarLog(ipMsg: String);
begin
  if Assigned(FCallBackLog) then
    FCallBackLog(ipMsg);
end;

{ TLaudoLabFormula }

class
  function TLaudoLabFormula.fpuCalcularFormula(ipFormula: String; ipDecimais: Integer; ipPaciente: TPaciente; ipGridValues: TArrayOfArrayOfTMyGridConf; ipSheet: TdxSpreadSheet): Double;
begin
  if Pos('^', ipFormula) > 0 then
    ipFormula := fpuTraduzirFormula(Trim(ipFormula), ipDecimais, false, ipPaciente, ipGridValues) // nesse caso nao podemos tirar o decimal, por causa da potencia
  else
    ipFormula := fpuTraduzirFormula(Trim(ipFormula), ipDecimais, True, ipPaciente, ipGridValues);

  // Uso o try execpt para que caso ocorra algum erro no calculo da formula eu irei mostrar zero.
  try

  // quem chamar essa funcao deve saber o tipo de retorno para trata-lo adequadamente
    ipFormula := StringReplace(ipFormula, '.', ',', [rfReplaceAll]); // o componente nao aceita .(ponto), temos q usar sempre ,(virgula)
    ipSheet.ActiveSheetAsTable.CreateCell(0, 0).SetText('=' + ipFormula, True);
    Result := ipSheet.ActiveSheetAsTable.Cells[0, 0].AsVariant;
  except
    Result := 0;
  end;
end;

class
  function TLaudoLabFormula.fpuTraduzirCelula(ipCelula: String;
  ipDecimais: Integer; ipGridValues: TArrayOfArrayOfTMyGridConf): String;
var
  vaCol, vaRow, vaDecimais: Integer;
  Letras: String;
  vaAux: Extended;
  vaResult: string;
  vaCelInfo: TMyGridConf;
begin
  Letras := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  ipCelula := UpperCase(Trim(ipCelula));
  Result := '0';
  if Length(ipCelula) > 1 then // checa se a celula tem mais de 1 caractere
    begin

      if Pos(copy(ipCelula, 1, 1), Letras) > 0 then // checa se o primeiro caractere da celula � uma letra
        begin
          vaCol := TProfGrid.getIndexByNameCol(copy(ipCelula, 1, 1)); // no. da coluna
          try
            vaRow := StrToInt(copy(ipCelula, 2, Length(ipCelula) - 1)) - 1; // no. da linha
          except
            on E: Exception do
              exit;
          end;
          if vaRow >= 0 then // ve se o no. da linha � valido
            begin
              // if ((vaCol + 1) <= ProfGrid1.ColCount) or ((vaRow + 1) <= ProfGrid1.RowCount) then // checa se a coluna e a linha informada existem
              if ((vaCol + 1) <= Length(ipGridValues)) or ((vaRow + 1) <= Length(ipGridValues[0])) then // checa se a coluna e a linha informada existem
                begin
                  vaCelInfo := ipGridValues[vaCol][vaRow];

                  if ipDecimais >= vaCelInfo.Decimais then
                    vaDecimais := ipDecimais
                  else
                    vaDecimais := vaCelInfo.Decimais;

                  vaResult := Trim(vaCelInfo.Text);
                  // fa�o isto para nao dar erro no momento da conversao de string para float
                  if Trim(vaCelInfo.Text) = '' then
                    vaResult := '0'
                    // GridValues[vaCol, vaRow].Text := '0'
                  else if not TryStrToFloat(Trim(vaCelInfo.Text), vaAux) then // se nao conseguir converter � pq nao � somente numero
                    vaResult := FloatToStr(ExtrairNumero(Trim(vaCelInfo.Text)));
                  // GridValues[vaCol, vaRow].Text := FloatToStr(fpvExtrairNumero(Trim(GridValues[vaCol, vaRow].Text)));
                  // tenta extrair o numero, caso nao consiga retorna zero

                  if vaDecimais > 0 then
                    Result := FormatFloat('0.' + StringOfChar('0', vaDecimais), StrToFloat(vaResult))
                    // Result := FormatFloat('0.' + StringOfChar('0', vaDecimais), StrToFloat(GridValues[vaCol, vaRow].Text))
                  else
                    Result := FormatFloat('0', StrToFloat(vaResult));
                  // Result := FormatFloat('0', StrToFloat(GridValues[vaCol, vaRow].Text));

                end;
            end;
        end;

    end;
end;

class
  function TLaudoLabFormula.fpuTraduzirFormula(ipFormula: string;
  ipDecimais: Integer; ipRetirarDecimal: boolean; ipPaciente: TPaciente;
  ipGridValues: TArrayOfArrayOfTMyGridConf): String;
var
  NPos, TPos, Cont: Integer;
  Letras, Numeros, pTexto, nFormula, Celula, sAux, Cel_Aux: String;
  Sair: boolean;
begin
  Letras := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  Numeros := '0123456789';
  ipFormula := UpperCase(Trim(ipFormula));
  nFormula := '';
  NPos := 1;
  Cont := 0;
  TPos := Length(ipFormula);
  // primeiro vamos trocar as palavras chaves
  if Pos('IDADEA', ipFormula) > 0 then // idade em anos
    Begin
      if (ipPaciente.unidadeIdade = 'ANO') or (ipPaciente.unidadeIdade = 'ANOS') then
        ipFormula := StringReplace(ipFormula, 'IDADEA', IntToStr(ipPaciente.idade), [rfReplaceAll])
      else // caso nao esteja em anos, jogar para 1
        ipFormula := StringReplace(ipFormula, 'IDADEA', '1', [rfReplaceAll]);
      TPos := Length(ipFormula); // caso tenha mudado o tamanho
    End;
  // --------------------------MASCULINO (CONDICAO)-----------------------------------------
  if Pos('|M=', ipFormula) > 0 then // caso seja MASCULINO
    Begin
      while Pos('|M=', ipFormula) > 0 do // enquanto tiver a condicao, continuar fazendo a troca
        Begin
          nFormula := ipFormula;
          sAux := '';
          Sair := false;
          Cont := Pos('|M=', ipFormula) + 3;
          while not Sair do
            Begin
              if nFormula[Cont] = '|' then
                Sair := True
              else
                Begin
                  sAux := nFormula[Cont] + sAux;
                  Inc(Cont);
                End; // fim do else
            End; // fim do while not sair
          // nesse ponto ja temos a primeira string, vamos verificaer se � MASCULINO
          if ipPaciente.Sexo = 'MASCULINO' then
            ipFormula := StringReplace(ipFormula, '|M=' + sAux + '|', sAux, [rfReplaceAll])
          else // caso nao seja
            ipFormula := StringReplace(ipFormula, '|M=' + sAux + '|', '', [rfReplaceAll]);
        End; // fim do while pos
    End; // fim do if pos
  // -----------------------------FEMININO(CONDICAO)-----------------------------------------
  if Pos('|F=', ipFormula) > 0 then // caso seja mulher
    Begin
      while Pos('|F=', ipFormula) > 0 do // enquanto tiver a condicao, continuar fazendo a troca
        Begin
          nFormula := ipFormula;
          sAux := '';
          Sair := false;
          Cont := Pos('|F=', ipFormula) + 3;
          while not Sair do
            Begin
              if nFormula[Cont] = '|' then
                Sair := True
              else
                Begin
                  sAux := sAux + nFormula[Cont];
                  Inc(Cont);
                End; // fim do else
            End; // fim do while not sair
          // nesse ponto ja temos a primeira string, vamos verificaer se � mulher
          if ipPaciente.Sexo = 'FEMININO' then
            ipFormula := StringReplace(ipFormula, '|F=' + sAux + '|', sAux, [rfReplaceAll])
          else // caso nao seja
            ipFormula := StringReplace(ipFormula, '|F=' + sAux + '|', '', [rfReplaceAll]);
        End; // fim do while pos
    End; // fim do if pos
  nFormula := '';
  while NPos <= TPos do
    begin
      pTexto := copy(ipFormula, NPos, 1); // pega um caractere da formula
      if Pos(pTexto, Letras) > 0 then // o caractere � uma letra
        begin
          Celula := pTexto; // montando a string que devera conter o nome da celula
          Inc(NPos);
          while NPos <= TPos do
            begin
              pTexto := copy(ipFormula, NPos, 1); // pega um caractere da formula
              if Pos(pTexto, Numeros) > 0 then // o caractere � um numero
                Celula := Celula + pTexto
              else
                Break;
              Inc(NPos);
            end;
          Cel_Aux := fpuTraduzirCelula(Celula, ipDecimais, ipGridValues);
          // n�o podemos permitir , vindo da celula
          Cel_Aux := StringReplace(Cel_Aux, ',', '.', [rfReplaceAll]);
          nFormula := nFormula + Cel_Aux; // TraduzCelula(Celula, eDecimais);
        end
      else
        begin
          nFormula := nFormula + pTexto;
          Inc(NPos);
        end;
    end;
  if ipRetirarDecimal then
    while Pos(',', nFormula) > 0 do
      nFormula[Pos(',', nFormula)] := '.';
  Result := nFormula;
end;

class
  function TLaudoLabFormula.fpuVerificarCondicaoFormula(ipCondicao: string; ipDecimais: Integer;
  ipPaciente: TPaciente; ipSheet: TdxSpreadSheet; ipGridValues: TArrayOfArrayOfTMyGridConf): boolean;
begin
  Result := false;

  if ipCondicao = '' then // n�o informou condi��o
    begin
      Result := True;
      exit;
    end;

  try
    ipCondicao := fpuTraduzirFormula(Trim(ipCondicao), ipDecimais, True, ipPaciente, ipGridValues);
    ipCondicao := StringReplace(ipCondicao, '.', ',', [rfReplaceAll]); // o componente nao aceita .(ponto), temos q usar sempre ,(virgula)

    ipSheet.ActiveSheetAsTable.CreateCell(0, 0).SetText('=' + ipCondicao, True);
    Result := ipSheet.ActiveSheetAsTable.Cells[0, 0].AsVariant;
  except
    Result := false;
  end;
end;

end.
