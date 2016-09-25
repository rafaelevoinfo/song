unit dmuPrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, IPPeerClient,
  Data.DBXCommon, Data.DB, Data.SqlExpr, dxSkinsCore, dxSkinBlack, cxClasses,
  cxLookAndFeels, dxSkinsForm, System.IOUtils, uTypes, uMensagem,
  Datasnap.DSMetadata, Datasnap.DSConnectionMetaDataProvider,
  Datasnap.DSClientMetadata, Datasnap.DSProxyDelphi, uFuncoes, Vcl.AppEvnts,
  uExceptions, Vcl.ImgList, Vcl.Controls, cxGraphics, Vcl.StdCtrls,
  Datasnap.DBClient, Datasnap.DSConnect, uConnection, uUtils, System.TypInfo,
  uControleAcesso, Winapi.Windows, Winapi.Messages, System.RegularExpressions, MidasLib, Midas,
  Vcl.Forms, uClientDataSet, cxEdit, cxDBEditRepository, System.ImageList,
  cxLocalization, uProvider, System.Rtti, uProxyGenerator, Datasnap.DSProxy,
  cxEditRepositoryItems, Vcl.Dialogs;

type
  TdmPrincipal = class(TDataModule)
    DataSnapConn: TRFSQLConnection;
    ProxyGenerator: TDSProxyGenerator;
    DSConnectionMetaDataProvider1: TDSConnectionMetaDataProvider;
    ApplicationEvents1: TApplicationEvents;
    imgIcons_32: TcxImageList;
    imgIcons_16: TcxImageList;
    ProviderAdministrativo: TRFProviderConnection;
    ProviderLookup: TRFProviderConnection;
    ProviderFinanceiro: TRFProviderConnection;
    ProviderViveiro: TRFProviderConnection;
    cdslkCidade: TRFClientDataSet;
    cdslkCidadeID: TIntegerField;
    cdslkCidadeUF: TStringField;
    cdslkCidadeNOME: TStringField;
    Repositorio: TcxEditRepository;
    repLcbCidade: TcxEditRepositoryLookupComboBoxItem;
    repIcbTipoTransferencia: TcxEditRepositoryImageComboBoxItem;
    repIcbStatusAtividade: TcxEditRepositoryImageComboBoxItem;
    dslkCidade: TDataSource;
    cxLocalizer1: TcxLocalizer;
    ProviderEstoque: TRFProviderConnection;
    ProviderRelatorio: TRFProviderConnection;
    ProviderSistema: TRFProviderConnection;
    procedure DataSnapConnAfterConnect(Sender: TObject);
    procedure DataSnapConnAfterDisconnect(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    FInterceptorFuncoesGeral: TVirtualMethodInterceptor;
    FFuncoesGeral: TsmFuncoesGeralClient;

    FInterceptorFuncoesAdministrativo: TVirtualMethodInterceptor;
    FFuncoesAdministrativo: TsmFuncoesAdministrativoClient;

    FInterceptorFuncoesViveiro: TVirtualMethodInterceptor;
    FFuncoesViveiro: TSMFuncoesViveiroClient;

    FInterceptorFuncoesFinanceiro: TVirtualMethodInterceptor;
    FFuncoesFinanceiro: TSMFuncoesFinanceiroClient;

    FInterceptorFuncoesEstoque: TVirtualMethodInterceptor;
    FFuncoesEstoque: TSMFuncoesEstoqueClient;

    FInterceptorFuncoesRelatorio: TVirtualMethodInterceptor;
    FFuncoesRelatorio: TsmFuncoesRelatorioClient;

    FInterceptorFuncoesSistema: TVirtualMethodInterceptor;
    FFuncoesSistema: TsmFuncoesSistemaClient;

    procedure SetFuncoesSistema(const Value: TsmFuncoesSistemaClient);
    function fpvGetProxyByClassName(ipClassName: String): TDSAdminClient;

    { Private declarations }
  public
    procedure ppuConfigurarConexao(ipUsuario, ipSenha: String; ipHost: String = '');

    property FuncoesGeral: TsmFuncoesGeralClient read FFuncoesGeral;
    property FuncoesAdm: TsmFuncoesAdministrativoClient read FFuncoesAdministrativo;
    property FuncoesViveiro: TSMFuncoesViveiroClient read FFuncoesViveiro;
    property FuncoesFinanceiro: TSMFuncoesFinanceiroClient read FFuncoesFinanceiro;
    property FuncoesEstoque: TSMFuncoesEstoqueClient read FFuncoesEstoque;
    property FuncoesRelatorio: TsmFuncoesRelatorioClient read FFuncoesRelatorio;
    property FuncoesSistema: TsmFuncoesSistemaClient read FFuncoesSistema write SetFuncoesSistema;

  end;

var
  dmPrincipal: TdmPrincipal;

const
  coTiposPessoaPadrao: Set of TTipoRelacionamentoPessoa = [trpFuncionario, trpEstagiario, trpVoluntario, trpMembroDiretoria, trpParceiro];

implementation

uses
  fReconexao;

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}

{ TdmPrincipal }

procedure TdmPrincipal.ApplicationEvents1Exception(Sender: TObject; E: Exception);
begin
  if E is TPararExecucaoException then
    Exit // vamos ignorar, exception criada apenas parar o fluxo do programa
  else if E is TControlException then
    begin
      TUtils.fpuFocar(TControlException(E).Control);
      TMensagem.ppuShowMessage(E.Message);
    end
  else
    begin
      if TfrmReconexao.fpuDetectarPerdaConexao(E) then
        TfrmReconexao.ppuIniciarReconexao
      else if TRegex.IsMatch(E.Message, 'FOREIGN KEY constraint', [roIgnoreCase]) then
        begin
          TMensagem.ppuShowException('Houve uma violação de chave estrangeira.' +
            'Caso esteja excluindo isso significa que o registro a ser excluído possui dependências, e por isso não pode ser excluído.', E);
        end
      else
        TMensagem.ppuShowException(E);
    end;
end;

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
var
  vaProcOnException: TInterceptExceptionNotify;
begin
  // desabilita o Beep do windows tocado a cada enter. Porem desabilita para o windows todo. Espero que nao precisem em outros programas :)
  SystemParametersInfo(SPI_SETBEEP, 0, nil, SPIF_SENDWININICHANGE);

  cxLocalizer1.Active := True;
  cxLocalizer1.Locale := 1046; // Portugues Brasil

  FInterceptorFuncoesGeral := TVirtualMethodInterceptor.Create(TsmFuncoesGeralClient);
  FInterceptorFuncoesAdministrativo := TVirtualMethodInterceptor.Create(TsmFuncoesAdministrativoClient);
  FInterceptorFuncoesViveiro := TVirtualMethodInterceptor.Create(TSMFuncoesViveiroClient);
  FInterceptorFuncoesFinanceiro := TVirtualMethodInterceptor.Create(TSMFuncoesFinanceiroClient);
  FInterceptorFuncoesEstoque := TVirtualMethodInterceptor.Create(TSMFuncoesEstoqueClient);
  FInterceptorFuncoesRelatorio := TVirtualMethodInterceptor.Create(TsmFuncoesRelatorioClient);
  FInterceptorFuncoesSistema := TVirtualMethodInterceptor.Create(TsmFuncoesSistemaClient);

  vaProcOnException := procedure(Instance: TObject; Method: TRttiMethod; const Args: TArray<TValue>;
      out RaiseException: Boolean; TheException: Exception; out Result: TValue)
    var
      vaClassName: String;
    begin
      if TfrmReconexao.fpuDetectarPerdaConexao(TheException) then
        begin
          vaClassName := Instance.ClassName;
          TfrmReconexao.ppuIniciarReconexao;
          RaiseException := false; // nao vai propagar a exception
          Result := Method.Invoke(fpvGetProxyByClassName(vaClassName), Args); // chama o metodo novamente
        end;
    end;

  FInterceptorFuncoesGeral.OnException := vaProcOnException;
  FInterceptorFuncoesAdministrativo.OnException := vaProcOnException;
  FInterceptorFuncoesViveiro.OnException := vaProcOnException;
  FInterceptorFuncoesFinanceiro.OnException := vaProcOnException;
  FInterceptorFuncoesEstoque.OnException := vaProcOnException;
  FInterceptorFuncoesRelatorio.OnException := vaProcOnException;
  FInterceptorFuncoesSistema.OnException := vaProcOnException;
end;

function TdmPrincipal.fpvGetProxyByClassName(ipClassName: String): TDSAdminClient;
begin
  if ipClassName = FFuncoesGeral.ClassName then
    Result := FFuncoesGeral
  else if ipClassName = FFuncoesAdministrativo.ClassName then
    Result := FFuncoesAdministrativo
  else if ipClassName = FFuncoesViveiro.ClassName then
    Result := FFuncoesViveiro
  else if ipClassName = FFuncoesFinanceiro.ClassName then
    Result := FFuncoesFinanceiro
  else if ipClassName = FFuncoesEstoque.ClassName then
    Result := FFuncoesEstoque
  else if ipClassName = FFuncoesRelatorio.ClassName then
    Result := FFuncoesRelatorio
  else if ipClassName = FFuncoesSistema.ClassName then
    Result := FFuncoesSistema;
end;

procedure TdmPrincipal.DataModuleDestroy(Sender: TObject);
begin
  // volta o Beep do windows
  SystemParametersInfo(SPI_SETBEEP, 1, nil, SPIF_SENDWININICHANGE);

  DataSnapConn.Close;

  FInterceptorFuncoesGeral.Free;
  FInterceptorFuncoesAdministrativo.Free;
  FInterceptorFuncoesViveiro.Free;
  FInterceptorFuncoesFinanceiro.Free;
  FInterceptorFuncoesEstoque.Free;
  FInterceptorFuncoesRelatorio.Free;
  FInterceptorFuncoesSistema.Free;

  TInfoLogin.fpuGetInstance.Free;
  TModulos.fpuGetInstance.Free;
end;

procedure TdmPrincipal.DataSnapConnAfterConnect(Sender: TObject);
begin
  FFuncoesGeral := TsmFuncoesGeralClient.Create(DataSnapConn.DBXConnection);
  FFuncoesAdministrativo := TsmFuncoesAdministrativoClient.Create(DataSnapConn.DBXConnection);
  FFuncoesViveiro := TSMFuncoesViveiroClient.Create(DataSnapConn.DBXConnection);
  FFuncoesFinanceiro := TSMFuncoesFinanceiroClient.Create(DataSnapConn.DBXConnection);
  FFuncoesEstoque := TSMFuncoesEstoqueClient.Create(DataSnapConn.DBXConnection);
  FFuncoesRelatorio := TsmFuncoesRelatorioClient.Create(DataSnapConn.DBXConnection);
  FFuncoesSistema := TsmFuncoesSistemaClient.Create(DataSnapConn.DBXConnection);

  FInterceptorFuncoesGeral.Proxify(FFuncoesGeral);
  FInterceptorFuncoesAdministrativo.Proxify(FFuncoesAdministrativo);
  FInterceptorFuncoesViveiro.Proxify(FFuncoesViveiro);
  FInterceptorFuncoesFinanceiro.Proxify(FFuncoesFinanceiro);
  FInterceptorFuncoesEstoque.Proxify(FFuncoesEstoque);
  FInterceptorFuncoesRelatorio.Proxify(FFuncoesRelatorio);
  FInterceptorFuncoesSistema.Proxify(FFuncoesSistema);
end;

procedure TdmPrincipal.DataSnapConnAfterDisconnect(Sender: TObject);
begin
  if Assigned(FFuncoesGeral) then
    begin
      FInterceptorFuncoesGeral.Unproxify(FFuncoesGeral);
      FreeAndNil(FFuncoesGeral);
    end;

  if Assigned(FFuncoesAdministrativo) then
    begin
      FInterceptorFuncoesAdministrativo.Unproxify(FFuncoesAdministrativo);
      FreeAndNil(FFuncoesAdministrativo);
    end;

  if Assigned(FFuncoesViveiro) then
    begin
      FInterceptorFuncoesViveiro.Unproxify(FFuncoesViveiro);
      FreeAndNil(FFuncoesViveiro);
    end;

  if Assigned(FFuncoesFinanceiro) then
    begin
      FInterceptorFuncoesFinanceiro.Unproxify(FFuncoesFinanceiro);
      FreeAndNil(FFuncoesFinanceiro);
    end;

  if Assigned(FFuncoesEstoque) then
    begin
      FInterceptorFuncoesEstoque.Unproxify(FFuncoesEstoque);
      FreeAndNil(FFuncoesEstoque);
    end;

  if Assigned(FFuncoesRelatorio) then
    begin
      FInterceptorFuncoesRelatorio.Unproxify(FFuncoesRelatorio);
      FreeAndNil(FFuncoesRelatorio);
    end;

  if Assigned(FFuncoesSistema) then
    begin
      FInterceptorFuncoesSistema.Unproxify(FFuncoesSistema);
      FreeAndNil(FFuncoesSistema);
    end;
end;

procedure TdmPrincipal.ppuConfigurarConexao(ipUsuario, ipSenha, ipHost: String);
var
  vaHost: string;
  vaPorta: Integer;
  vaFile: TStringList;
  vaFilePath: string;
begin
  vaHost := 'localhost';
  vaPorta := 3004;

  vaFilePath := IncludeTrailingBackslash(TDirectory.GetCurrentDirectory) + coArquivoConfiguracao;
  // primeiro vamos ver se achamos um arquivo de configuracao
  if TFile.Exists(vaFilePath) then
    begin
      vaFile := TStringList.Create;
      try
        vaFile.LoadFromFile(vaFilePath);
        if vaFile.Count > 0 then
          vaHost := vaFile.Strings[0];

        if vaFile.Count > 1 then
          vaPorta := StrToIntDef(vaFile.Strings[1], 3004);
      finally
        vaFile.Free;
      end;
    end;

  if ipHost <> '' then
    vaHost := ipHost;

  DataSnapConn.Close;
  DataSnapConn.Params.Values['HostName'] := vaHost;
  DataSnapConn.Params.Values['Port'] := vaPorta.ToString;
  DataSnapConn.Params.Values['DSAuthenticationUser'] := ipUsuario;
  DataSnapConn.Params.Values['DSAuthenticationPassword'] := ipSenha;
  DataSnapConn.Open;

end;

procedure TdmPrincipal.SetFuncoesSistema(const Value: TsmFuncoesSistemaClient);
begin
  FFuncoesSistema := Value;
end;

end.
