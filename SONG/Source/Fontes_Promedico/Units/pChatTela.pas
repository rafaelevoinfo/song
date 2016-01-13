unit pChatTela;

interface

uses
  System.RegularExpressions, Winapi.ShellAPI, pChatComponentes, pChatTipos,
  System.Generics.Collections, pDMChat, RVTable, CRVFData, RVItem, pUtils,
  pMethod2009, System.Math, pZoomImg, System.Zip, dxGalleryControl, pTypes,
  System.SyncObjs, Winapi.ShlObj, pChatTelaPesquisa, Vcl.Imaging.JPEG,
  pChatFuncoes,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxBarBuiltInMenu, cxPC, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  RVStyle, Vcl.ImgList, Datasnap.DBClient, pmClientDataSet, System.Actions,
  Vcl.ActnList, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxMaskEdit,
  cxDropDownEdit, cxImageComboBox, cxDBEdit, cxCheckBox, dxDockPanel,
  dxDockControl, RVScroll, RichView, RVEdit, Vcl.Buttons, cxSplitter,
  Vcl.StdCtrls, cxTextEdit, dxGDIPlusClasses, cxScrollBox, Vcl.ExtCtrls, cxLabel,
  cxDBEditRepository, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxEditRepositoryItems, dxSkinsCore, pmPromedicoSkin, dxSkinscxPCPainter,
  cxGroupBox, cxSpinEdit, SclRView, RichViewActions, cxImage, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxCalendar, cxRadioGroup, System.DateUtils, pZero;

type
  TfrmChatTela = class(TfrmZero)
    pnlConversasListaUsuarios: TPanel;
    pgcPrincipal: TcxPageControl;
    TabInicial: TcxTabSheet;
    TabConversa: TcxTabSheet;
    slbConversasListaUsuarios: TcxScrollBox;
    pnlConversa: TPanel;
    pnlPesquisa: TPanel;
    lblPesquisa: TLabel;
    EditPesquisaUsuario: TcxTextEdit;
    cxSplitter1: TcxSplitter;
    dockSitePesqUsuarios: TdxDockSite;
    dockPanelPesqUsuarios: TdxDockPanel;
    dxLayoutDockSite1: TdxLayoutDockSite;
    pnlPesqUsuario: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Label1: TLabel;
    EditNomeUsuario: TcxTextEdit;
    ckbTodosGrupos: TcxCheckBox;
    cxSplitter3: TcxSplitter;
    rveMensagens: TRichViewEdit;
    cxGrid1DBTableView1CODIGO: TcxGridDBColumn;
    cxGrid1DBTableView1NOME: TcxGridDBColumn;
    cxGrid1DBTableView1FUNCAO: TcxGridDBColumn;
    cxGrid1DBTableView1ATIVO_INATIVO: TcxGridDBColumn;
    cxGrid1DBTableView1USUARIO_GRUPO: TcxGridDBColumn;
    cxGrid1DBTableView1STATUS: TcxGridDBColumn;
    pgcDadosConversa: TcxPageControl;
    tabPerfil: TcxTabSheet;
    imgFotoUsuario: TImage;
    lblNomeUsuario: TLabel;
    lblFuncao: TLabel;
    lblEmail: TLabel;
    lblStatus: TLabel;
    lblHospital: TLabel;
    spStatus: TShape;
    tabGrupo: TcxTabSheet;
    slbListaUsuariosGrupo: TcxScrollBox;
    Panel3: TPanel;
    lblListaUsuariosGrupo: TLabel;
    lblNomeGrupo: TLabel;
    tabArquivos: TcxTabSheet;
    slbListaArquivos: TcxScrollBox;
    cbGrupo: TcxLookupComboBox;
    lblHospitalGrupo: TLabel;
    TabConfiguracao: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    cbConfigFonteNome: TcxImageComboBox;
    EditConfigFonteTamanho: TcxSpinEdit;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    lblConfigFonteVisualizacao: TcxLabel;
    TabPesquisa: TcxTabSheet;
    Panel4: TPanel;
    rvePesquisa: TRichViewEdit;
    bttPesquisaTabPesquisa: TButton;
    imgFotoTabPesquisa: TImage;
    lblNomeUsuarioTabPesquisa: TLabel;
    lblFuncaoTabPesquisa: TLabel;
    lblHospitalTabPesquisa: TLabel;
    dockSiteSmileys: TdxDockSite;
    dockPanelSmileys: TdxDockPanel;
    dxLayoutDockSite2: TdxLayoutDockSite;
    slbSmileys: TcxScrollBox;
    pnlAlertaConversa: TPanel;
    Label6: TLabel;
    pnlAlertaPesquisa: TPanel;
    Label7: TLabel;
    cxGroupBox2: TcxGroupBox;
    Button5: TButton;
    Button6: TButton;
    Label8: TLabel;
    Label10: TLabel;
    EditConfigEMail: TcxTextEdit;
    EditConfigTelefone: TcxTextEdit;
    cxGroupBox3: TcxGroupBox;
    imgConfigFotoUsuario: TImage;
    Label11: TLabel;
    tabCapturaFoto: TcxTabSheet;
    bttRetornar: TButton;
    pnlUsuario: TPanel;
    imgFotoUsuarioLogado: TImage;
    lblStatusUsuarioLogado: TLabel;
    spStatusUsuarioLogado: TShape;
    lblNomeUsuarioLogado: TLabel;
    bttConfiguracoes: TButton;
    lblDadosPesquisa: TLabel;
    lblDadosPesquisaLinha1: TLabel;
    lblDadosPesquisaLinha2: TLabel;
    ckbStatus: TcxCheckBox;
    cbStatus: TcxImageComboBox;
    pnlDadosConversa: TPanel;
    pnlDadosConversaEnvioMensagem: TPanel;
    lblEnvioMensagemTitulo: TLabel;
    slbEnvioMensagens: TcxScrollBox;
    pnlConversaRodape: TPanel;
    pnlEnviarMensagemUsuariosConectados: TPanel;
    Label2: TLabel;
    pnlConversaAnexos: TPanel;
    slbAnexos: TcxScrollBox;
    Panel1: TPanel;
    lblAnexosQtde: TLabel;
    lblAnexos: TLabel;
    pnlConversaEdit: TPanel;
    pnlConversaEditBotoes: TPanel;
    bttEnviar: TButton;
    bttSmiley: TButton;
    bttAnexo: TButton;
    bttPesquisarConversas: TButton;
    rveMensagensEdit: TRichViewEdit;
    rgConfigNovaMensagemApenasAlerta: TcxRadioGroup;
    cxSplitter2: TcxSplitter;
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure EditPesquisaPropertiesChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure dockSitePesqUsuariosHideControl(Sender: TdxDockSite;
      AControl: TdxCustomDockControl);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure pgcPrincipalPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure EditNomeUsuarioPropertiesChange(Sender: TObject);
    procedure cbTodosGruposPropertiesEditValueChanged(Sender: TObject);
    procedure cbGrupoPropertiesEditValueChanged(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure dockSitePesqUsuariosShowControl(Sender: TdxDockSite;
      AControl: TdxCustomDockControl);
    procedure FormDestroy(Sender: TObject);
    procedure cbConfigFonteNomePropertiesChange(Sender: TObject);
    procedure EditConfigFonteTamanhoPropertiesChange(Sender: TObject);
    procedure rveMensagensEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rveMensagensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rveMensagensEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ckbStatusClick(Sender: TObject);
    procedure cbStatusPropertiesEditValueChanged(Sender: TObject);
    procedure EditPesquisaUsuarioEnter(Sender: TObject);
    procedure EditPesquisaUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rveMensagensEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    DMChat: TDMChat;
    FAoCapturarImagem: TNotifyEvent;
    FAoConfirmarLeituraMensagens: TChatConfirmarLeituraMensagens;
    FAoEnviarMensagem: TChatEnviarMensagem;
    FAoFazerDownloadArquivo: TChatDownloadArquivo;
    FAoMudarStatusConversa: TChatMudarStatusConversa;
    FAoPesquisarAnexos: TChatPesquisarAnexos;
    FAoPesquisarConfiguracoes: TChatPesquisarConfiguracoes;
    FAoPesquisarGrupos: TChatPesquisarGrupos;
    FAoPesquisarLeitores: TChatPesquisarLeitoresMensagens;
    FAoPesquisarMensagens: TChatPesquisarMensagens;
    FAoPesquisarUsuarios: TChatPesquisarUsuarios;
    FAoSalvarConfiguracoes: TChatSalvarConfiguracoes;
    FChatPanelSelecionado: TChatPanelConversaAba;
    FChatPanelSelecionadoCtrl: TDictionary<string, TChatPanelConversaAba>;
    FCodigoUsuarioConversaInicial: Integer;
    FCodigoUsuarioSistema: Integer;
    FConfiguracao: TChatConfiguracoes;
    FConversasModal: TDictionary<string, System.TArray<string>>;
    FDadosConversas: TDictionary<string, TChatDadosConversa>;
    FDadosUltimaPesquisa: TChatDadosConversa;
    FDadosUltimasPesquisas: TDictionary<string, TChatDadosPesquisa>;
    FOriginalWindowProc: TWndMethod;
    FPastaInicialSalvarImagem: string;
    FSmileys: TDictionary<string, string>;
    FSmileysExpressaoRegular: string;
    FUsuarioLogado: TDictionary<Integer, TChatUsuarioLogado>;
    FTelaModalSimplificada: Boolean;

    // Se��es cr�ticas
    // Algumas se��es cr�ticas foram criadas, pois existem fun��es p�blicas que s�o chamadas por
    // threads e neste caso precisa-se garantir a integridade das informa��es lidas e escritas
    FSecaoCriticaBancoDadosConversas: TCriticalSection;
    FSecaoCriticaBancoDadosUsuarios: TCriticalSection;
    FSecaoCriticaNovaMensagemModal: TCriticalSection;
    FSecaoCriticaPreencherRichViewEdit: TCriticalSection;
    FSecaoCriticaProgressaoUpLoad: TCriticalSection;
    FSecaoCriticaUsuarioLogado: TCriticalSection;

    function fpvClonarClientDataSet(const ipCdsOrigem: TpmClientDataSet): TpmClientDataSet;
    function fpvDownloadArquivo(const ipCodigoHospital: Integer; const ipEnerecoArquivo: string): TBytesStream;
    function fpvMouseSobreComponente(ipControl: TControl): Boolean; overload;
    function fpvMouseSobreComponente(ipControl: TControl; ipMousePos: TPoint): Boolean; overload;
    function fpvPesquisarConversa(const ipTipoPesquisa: TChatTipoPesquisa; const ipTexto: string; const ipDataInicial, ipDataFinal: TDate; const ipUsuarioLogado, ipUsuarioConversa: TChatIdentificacaoUsuario;
      const ipUsuarioSistema, ipPesquisarAnexosAdicionais: Boolean; var ioMensagem, ioMensagemAnexo: OleVariant): Boolean;
    function fpvPesquisarLeitoresMensagens(const ipCodigoHospital, ipCodigoMensagem: Integer): OleVariant;
    function fpvPosicionarMensagemNoRich(ipCodigoMensagem, ipCodigoHospital: Integer; ipRVE: TRichViewEdit): Boolean;
    function fpvUsuarioLogado(const ipCodigoHospital: Integer; var ioUsuarioLogado: Integer): Boolean; overload;
    function fpvUsuarioLogado(const ipCodigoHospital: Integer; var ioUsuarioLogado: TChatUsuarioLogado): Boolean; overload;
    function fpvUsuarioLogado(const ipCodigoHospital: Integer; var ioUsuarioLogado: TChatIdentificacaoUsuario): Boolean; overload;
    function fpvVisualizarSomenteMensagensEnviadas(const ipIdentificadorConversa: string): Boolean; overload;
    function fpvVisualizarSomenteMensagensEnviadas(const ipUsuarioConversa: TChatIdentificacaoUsuario): Boolean; overload;
    function fpvVisualizarSomenteMensagensEnviadas(const ipCodigoUsuarioConversa, ipCodigoHospital: Integer): Boolean; overload;
    function GetDataSourceFotoConfig: TDataSource;
    procedure ppvAbrirTelaPesqUsuario;
    procedure ppvAcAnexar(Sender: TObject);
    procedure ppvAcConfigCapturarImagem(Sender: TObject);
    procedure ppvAcConfigGravar(Sender: TObject);
    procedure ppvAcConfigPegarArquivoImagem(Sender: TObject);
    procedure ppvAcConfigRestaurar(Sender: TObject);
    procedure ppvAcConfiguracao(Sender: TObject);
    procedure ppvAcEnviar(Sender: TObject);
    procedure ppvAcPesquisarConversa(Sender: TObject);
    procedure ppvAcRetornar(Sender: TObject);
    procedure ppvAcSmiles(Sender: TObject);
    procedure ppvAdicionarConversa(const ipIdentificador: string; const ipSelecionarConversa, ipNotificar: Boolean);
    procedure ppvAdicionarPanelAnexo(const ipDadosArquivo: TChatAnexoPropriedades);
    procedure ppvAdicionarSmileys(Sender: TObject);
    procedure ppvAjustarImagem(const ipCdsUsuarios: TpmClientDataSet; const ipFoto, ipFotoThumbnail: Boolean);
    procedure ppvAnexarArquivos(ipArquivos: TStrings);
    procedure ppvAnexosLimiteAtingido(const ipArquivosRecusados: TStrings);
    procedure ppvAntesSelecionarConversaCtrl(var SelecionadoCtrl: Boolean);
    procedure ppvAtualizarDadosUsuarioLogado;
    procedure ppvAtualizarDadosUsuarioTela(const ipIdentificador: string = ''; ipChatPanelConversaAba: TChatPanelConversaAba = nil; const ipSomenteStatus: Boolean = False);
    procedure ppvCarregarAnexos(const ipChatPanelConversaAba: TChatPanelConversaAba);
    procedure ppvCarregarArquivos(const ipIdentificador: string);
    procedure ppvCarregarImagemArquivo(ipChatPanelArquivo: TChatPanelArquivo; ipExtArquivo: string; ipImagem: TPicture = nil);
    procedure ppvCarregarMensgensBancoDados(const ipIdentificador: string);
    procedure ppvClickLink(Sender: TObject; id: Integer);
    procedure ppvConfigFonteAtualizarVisualizacao;
    procedure ppvCriarEspacoArmazenamentoConversa(const ipIdentificador: string);
    procedure ppvDeletarAnexo(Sender: TObject);
    procedure ppvDescompactarArquivo(const ipArquivo: TBytesStream; const ipDestinoArquivo: string); overload;
    procedure ppvDescompactarArquivo(const ipArquivo: TBytesStream; var ioArquivoDescompactado: TBytesStream); overload;
    procedure ppvFecharConversa(Sender: TObject);
    procedure ppvFecharTelaVisualizacoesMensagem(Sender: TObject); overload;
    procedure ppvFecharTelaVisualizacoesMensagem(Sender: TObject; var Key: Word; Shift: TShiftState); overload;
    procedure ppvIncluirStatusMensagem(ipCelula: TRVTableCellData; const ipParagrafo: Integer; const ipCodigoLeitura: string; ipMsgLida: Boolean);
    procedure ppvMudarStatusConversa(const ipIdentificador: string; const ipConversaAtiva: Boolean);
    procedure ppvPanelConversaAnexosVisivel(const ipVisivel: Boolean);
    procedure ppvPanelEnviarMensagemUsuariosConectados(const ipVisivel: Boolean);
    procedure ppvPegarArquivoArrastato(var Msg: TMessage); message WM_DROPFILES;
    procedure ppvPesquisaUsuario;
    procedure ppvPreencherRichViewEdit(const ipMensagem: OleVariant; ipRVE: TRichViewEdit; const ipIdentificador: string; const ipPosicaoScroll: Integer); overload;
    procedure ppvPreencherRichViewEdit(const ipMensagem: OleVariant; ipRVE: TRichViewEdit; const ipIdentificador: string; const ipPosicaoScroll: Integer; ipLimparRichViewEdit: Boolean); overload;
    procedure ppvPreencherRichViewEdit(const ipMensagem: OleVariant; ipRVE: TRichViewEdit; const ipIdentificador: string; const ipPosicaoScroll: Integer; const ipDestacarTextoPesquisa: string;
      const ipExibirLinkVisualizacaoPesquisa, ipExibirLinkVoltarPesquisa, ipLimparRichViewEdit: Boolean; const ipCodigoMensagemDestacar: Integer; const ipEstilo: TChatEstiloRich); overload;
    procedure ppvSelecionarArquivo(Sender: TObject);
    procedure ppvSelecionarConversa(Sender: TObject);
    procedure ppvSelecionarConversaCtrl(Sender: TObject);
    procedure ppvSelecionarUsuarioGrupo(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ppvTelaVisualizacoesMensagemMouseWeelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure ppvTelaVisualizacoesMensagemMouseWeelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure SetAoCapturarImagem(const Value: TNotifyEvent);
    procedure SetAoConfirmarLeituraMensagens(const Value: TChatConfirmarLeituraMensagens);
    procedure SetAoEnviarMensagem(const Value: TChatEnviarMensagem);
    procedure SetAoFazerDownloadArquivo(const Value: TChatDownloadArquivo);
    procedure SetAoMudarStatusConversa(const Value: TChatMudarStatusConversa);
    procedure SetAoPesquisarAnexos(const Value: TChatPesquisarAnexos);
    procedure SetAoPesquisarConfiguracoes(const Value: TChatPesquisarConfiguracoes);
    procedure SetAoPesquisarGrupos(const Value: TChatPesquisarGrupos);
    procedure SetAoPesquisarLeitores(const Value: TChatPesquisarLeitoresMensagens);
    procedure SetAoPesquisarMensagens(const Value: TChatPesquisarMensagens);
    procedure SetAoPesquisarUsuarios(const Value: TChatPesquisarUsuarios);
    procedure SetAoSalvarConfiguracoes(const Value: TChatSalvarConfiguracoes);
    procedure SetCodigoUsuarioConversaInicial(const Value: Integer);
    procedure SetTelaModalSimplificada(const Value: Boolean);
    { Private declarations }
  public
    function fpuAdicionarProgressaoUpLoad(const ipFotoThumbnail: TPicture; const ipTitulo: string; const ipValorMinimo, ipValorMaximo: Integer): string;
    function fpuAtualizarConfiguracoes(const ipConfiguracoes: TChatConfiguracoes): string;
    function fpuAtualizarHospitais(const ipListaHospitais: TList<TChatHospital>): string;
    function fpuAtualizarStatus(const ipListaStatus: TList<TChatStatus>): string;
    function fpuRetornaImagem(const ipBytesStream: TBytesStream): TPicture;
    procedure ppuAbrirConversas(const ipUsuarios: TList<TChatConversa>);
    procedure ppuAtualizarFotoConfig(const ipFoto: TPicture);
    procedure ppuAtualizarProgressaoUpLoad(const ipNome: string); overload;
    procedure ppuAtualizarProgressaoUpLoad(const ipNome: string; const ipIncrementarProgresso: Integer); overload;
    procedure ppuMensagensLidas(const ipCodigoUsuarioConversa, ipCodigoHospital: Integer; const ipCodigosMensagens: string);
    procedure ppuNovaMensagem(const ipCodigoMensagem, ipCodigoRemetente, ipCodigoHospital, ipCodigoDestinatario: Integer; const ipNotificar: Boolean);
    procedure ppuNovaMensagemModal(const ipCodigoMensagem, ipCodigoRemetente, ipCodigoHospital, ipCodigoDestinatario: Integer);
    procedure ppuNovaMensagemModalLock;
    procedure ppuNovaMensagemModalUnlock;
    procedure ppuRemoverProgressaoUpLoad(const ipNome: string);
    procedure ppuUsuarioLogado(const ipIdUsuario: TChatUsuarioLogado);
    property AoCapturarImagem: TNotifyEvent read FAoCapturarImagem write SetAoCapturarImagem;
    property AoConfirmarLeituraMensagens: TChatConfirmarLeituraMensagens read FAoConfirmarLeituraMensagens write SetAoConfirmarLeituraMensagens;
    property AoEnviarMensagem: TChatEnviarMensagem read FAoEnviarMensagem write SetAoEnviarMensagem;
    property AoFazerDownloadArquivo: TChatDownloadArquivo read FAoFazerDownloadArquivo write SetAoFazerDownloadArquivo;
    property AoMudarStatusConversa: TChatMudarStatusConversa read FAoMudarStatusConversa write SetAoMudarStatusConversa;
    property AoPesquisarAnexos: TChatPesquisarAnexos read FAoPesquisarAnexos write SetAoPesquisarAnexos;
    property AoPesquisarConfiguracoes: TChatPesquisarConfiguracoes read FAoPesquisarConfiguracoes write SetAoPesquisarConfiguracoes;
    property AoPesquisarGrupos: TChatPesquisarGrupos read FAoPesquisarGrupos write SetAoPesquisarGrupos;
    property AoPesquisarLeitores: TChatPesquisarLeitoresMensagens read FAoPesquisarLeitores write SetAoPesquisarLeitores;
    property AoPesquisarMensagens: TChatPesquisarMensagens read FAoPesquisarMensagens write SetAoPesquisarMensagens;
    property AoPesquisarUsuarios: TChatPesquisarUsuarios read FAoPesquisarUsuarios write SetAoPesquisarUsuarios;
    property AoSalvarConfiguracoes: TChatSalvarConfiguracoes read FAoSalvarConfiguracoes write SetAoSalvarConfiguracoes;
    property CodigoUsuarioConversaInicial: Integer read FCodigoUsuarioConversaInicial write SetCodigoUsuarioConversaInicial;
    property DataSourceFotoConfig: TDataSource read GetDataSourceFotoConfig;
    property TelaModalSimplificada: Boolean read FTelaModalSimplificada write SetTelaModalSimplificada;
    { Public declarations }
  end;

var
  frmChatTela: TfrmChatTela;

implementation

{$R *.dfm}


procedure TfrmChatTela.cbConfigFonteNomePropertiesChange(Sender: TObject);
begin
  ppvConfigFonteAtualizarVisualizacao;
end;

procedure TfrmChatTela.cbGrupoPropertiesEditValueChanged(Sender: TObject);
begin
  ppvPesquisaUsuario;
end;

procedure TfrmChatTela.cbStatusPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  ppvPesquisaUsuario;
end;

procedure TfrmChatTela.cbTodosGruposPropertiesEditValueChanged(Sender: TObject);
begin
  cbGrupo.Enabled := not ckbTodosGrupos.Checked;
  ppvPesquisaUsuario;
end;

procedure TfrmChatTela.ckbStatusClick(Sender: TObject);
begin
  inherited;
  cbStatus.Enabled := not ckbStatus.Checked;
  ppvPesquisaUsuario;
end;

procedure TfrmChatTela.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if DMChat.cdsUsuarios.RecordCount > 0 then
    begin
      // N�o inverter a ordem destas duas linhas, pois ao fechar o dockPanelPesqUsuario a pesquisa � perdida (OnHideControl)
      ppvAdicionarConversa(TChatFuncoes.fpuMontaIdentificador(DMChat.cdsUsuariosCODIGO.AsInteger, DMChat.cdsUsuariosCODIGO_HOSPITAL.AsInteger), True, False);
      dockPanelPesqUsuarios.Hide;
    end;
end;

procedure TfrmChatTela.dockSitePesqUsuariosHideControl(Sender: TdxDockSite;
  AControl: TdxCustomDockControl);
begin
  dockSitePesqUsuarios.Visible := False;
  EditNomeUsuario.Clear;
end;

procedure TfrmChatTela.dockSitePesqUsuariosShowControl(Sender: TdxDockSite;
  AControl: TdxCustomDockControl);
begin
  // Limpando os dados de pesquisa de hospital
  ckbStatus.Checked := True;
  cbStatus.Enabled := False;
  DMChat.cdsHospitais.Filtered := False;
  DMChat.cdsHospitais.Filter := '';
  DMChat.cdsHospitais.First;

  // Limpando os dados de pesquisa de grupo
  ckbTodosGrupos.Checked := True;
  cbGrupo.Enabled := False;
  DMChat.cdsGrupos.Filtered := False;
  DMChat.cdsGrupos.Filter := '';
  DMChat.cdsGrupos.First;

  if DMChat.cdsGrupos.RecordCount > 0 then
    cbGrupo.EditValue := DMChat.cdsGruposCODIGO.AsInteger;
end;

procedure TfrmChatTela.EditConfigFonteTamanhoPropertiesChange(Sender: TObject);
begin
  ppvConfigFonteAtualizarVisualizacao;
end;

procedure TfrmChatTela.EditNomeUsuarioPropertiesChange(Sender: TObject);
begin
  ppvPesquisaUsuario;
end;

procedure TfrmChatTela.EditPesquisaPropertiesChange(Sender: TObject);
begin
  ppvAbrirTelaPesqUsuario;
end;

procedure TfrmChatTela.EditPesquisaUsuarioEnter(Sender: TObject);
var
  vaPoint: TPoint;
begin
  inherited;
  DMChat.BalloonHint1.Title := 'Pesquisar usu�rio ou grupo';
  DMChat.BalloonHint1.Description := EditPesquisaUsuario.Hint;
  vaPoint.X := 185;
  vaPoint.Y := 158;
  DMChat.BalloonHint1.ShowHint(vaPoint);
end;

procedure TfrmChatTela.EditPesquisaUsuarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  if DMChat.BalloonHint1.ShowingHint then
    DMChat.BalloonHint1.HideHint;
end;

procedure TfrmChatTela.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  i: Integer;
begin
  inherited;
  FSecaoCriticaNovaMensagemModal.Enter;

  try
    if (fsModal in Self.FormState) then
      begin
        i := 0;

        while (i < slbConversasListaUsuarios.ComponentCount) and CanClose do
          begin
            if (slbConversasListaUsuarios.Components[i] is TChatPanelConversaAba) and
              (TChatPanelConversaAba(slbConversasListaUsuarios.Components[i]).TipoAba in [TChatTipoAba.taConversaGrupo, TChatTipoAba.taConversaUsuario]) and
              (TChatPanelConversaAba(slbConversasListaUsuarios.Components[i]).Notificacao) then
              CanClose := False;

            Inc(i);
          end;
      end;
  finally
    FSecaoCriticaNovaMensagemModal.Release;
  end;

  if not CanClose then
    MessageTela('Existem mensagens n�o lidas. Para fechar a' + sLineBreak + 'tela � necess�rio ler todas as mensagens.');
end;

procedure TfrmChatTela.FormCreate(Sender: TObject);
var
  vaPath: array [0 .. Max_Path] of Char;
begin
  inherited;

  // Pesquisando o endere�o da �rea de trabalho
  if ShGetSpecialFolderPath(0, vaPath, CSIDL_DESKTOPDIRECTORY, False) then
    FPastaInicialSalvarImagem := vaPath
  else
    begin
      // Se entrou aqui, foi porque n�o conseguiu encontrar a pasta da �rea de trabalho, ent�o seleciona a pasta "Meus documentos"
      FPastaInicialSalvarImagem := '%homepath%\documents'; // Meus documentos
    end;

  // Inicializando as vari�veis globais
  DMChat := TDMChat.Create(Self);
  DMChat.Name := '';
  FAoCapturarImagem := nil;
  FAoConfirmarLeituraMensagens := nil;
  FAoEnviarMensagem := nil;
  FAoPesquisarAnexos := nil;
  FAoPesquisarConfiguracoes := nil;
  FAoPesquisarLeitores := nil;
  FAoPesquisarMensagens := nil;
  FAoPesquisarUsuarios := nil;
  FAoSalvarConfiguracoes := nil;
  FChatPanelSelecionado := nil;
  FChatPanelSelecionadoCtrl := TDictionary<string, TChatPanelConversaAba>.Create;
  FCodigoUsuarioConversaInicial := 0;
  FCodigoUsuarioSistema := -2147483648;
  FConfiguracao := TChatConfiguracoes.Create;
  FConversasModal := TDictionary < string, System.TArray < string >>.Create;
  FDadosConversas := TDictionary<string, TChatDadosConversa>.Create;

  FDadosUltimaPesquisa.Anexos := null;
  FDadosUltimaPesquisa.Mensagens := null;
  FDadosUltimaPesquisa.PosicaoScroll := 0;

  FDadosUltimasPesquisas := TDictionary<string, TChatDadosPesquisa>.Create;
  FTelaModalSimplificada := True;
  FSecaoCriticaBancoDadosConversas := TCriticalSection.Create;
  FSecaoCriticaBancoDadosUsuarios := TCriticalSection.Create;
  FSecaoCriticaNovaMensagemModal := TCriticalSection.Create;
  FSecaoCriticaPreencherRichViewEdit := TCriticalSection.Create;
  FSecaoCriticaProgressaoUpLoad := TCriticalSection.Create;
  FSecaoCriticaUsuarioLogado := TCriticalSection.Create;
  FUsuarioLogado := TDictionary<Integer, TChatUsuarioLogado>.Create;

  // Configura��es iniciais da tela
  DMChat.Ac_UltimasPesquisas1.Visible := False;
  DMChat.Ac_UltimasPesquisas1.Enabled := False;
  DMChat.Ac_UltimasPesquisas2.Visible := False;
  DMChat.Ac_UltimasPesquisas2.Enabled := False;
  DMChat.Ac_UltimasPesquisas3.Visible := False;
  DMChat.Ac_UltimasPesquisas3.Enabled := False;
  DMChat.Ac_UltimasPesquisas4.Visible := False;
  DMChat.Ac_UltimasPesquisas4.Enabled := False;
  DMChat.Ac_UltimasPesquisas5.Visible := False;
  DMChat.Ac_UltimasPesquisas5.Enabled := False;

  pgcPrincipal.ActivePage := TabInicial;
  pgcPrincipal.HideTabs := True;

  dockSitePesqUsuarios.Visible := False;
  dockPanelPesqUsuarios.AutoHide := True;
  dockPanelPesqUsuarios.CaptionButtons := [cbMaximize];

  dockSiteSmileys.Visible := False;
  dockSiteSmileys.AutoSize := False;
  dockPanelSmileys.AutoHide := True;
  dockPanelSmileys.CaptionButtons := [cbMaximize];

  pnlEnviarMensagemUsuariosConectados.Visible := False;
  pnlConversaAnexos.Visible := False;
  pnlConversaRodape.Height := pnlConversaRodape.Constraints.MinHeight;
  pnlDadosConversaEnvioMensagem.Visible := False;

  // Adicionando eventos aos RichViewEdits
  rveMensagens.OnJump := ppvClickLink;
  rvePesquisa.OnJump := ppvClickLink;

  // Configurando os actions
  DMChat.Ac_Anexar.OnExecute := ppvAcAnexar;
  DMChat.Ac_ConfigCapturarImagem.OnExecute := ppvAcConfigCapturarImagem;
  DMChat.Ac_ConfigGravar.OnExecute := ppvAcConfigGravar;
  DMChat.Ac_ConfigPegarArquivoImagem.OnExecute := ppvAcConfigPegarArquivoImagem;
  DMChat.Ac_ConfigRestaurar.OnExecute := ppvAcConfigRestaurar;
  DMChat.Ac_Configuracao.OnExecute := ppvAcConfiguracao;
  DMChat.Ac_Enviar.OnExecute := ppvAcEnviar;
  DMChat.Ac_PesquisarConversa.OnExecute := ppvAcPesquisarConversa;
  DMChat.Ac_Retornar.OnExecute := ppvAcRetornar;
  DMChat.Ac_Smiles.OnExecute := ppvAcSmiles;
  DMChat.Ac_UltimasPesquisas1.OnExecute := ppvAcPesquisarConversa;
  DMChat.Ac_UltimasPesquisas2.OnExecute := ppvAcPesquisarConversa;
  DMChat.Ac_UltimasPesquisas3.OnExecute := ppvAcPesquisarConversa;
  DMChat.Ac_UltimasPesquisas4.OnExecute := ppvAcPesquisarConversa;
  DMChat.Ac_UltimasPesquisas5.OnExecute := ppvAcPesquisarConversa;

  // Criando as tabelas
  DMChat.cdsFotoUsuarioLogado.CreateDataSet;

  DMChat.cdsGrupos.CreateDataSet;
  DMChat.cdsGrupos.LogChanges := False;
  DMChat.cdsGrupos_Aux.DisableControls;

  DMChat.cdsHospitais.CreateDataSet;
  DMChat.cdsHospitais.LogChanges := False;

  DMChat.cdsMensagem.DisableControls;
  DMChat.cdsMensagem_Aux.DisableControls;

  DMChat.cdsMensagem_Anexo.DisableControls;
  DMChat.cdsMensagem_Anexo_Aux.DisableControls;

  DMChat.cdsUsuarios.CreateDataSet;
  DMChat.cdsUsuarios.LogChanges := False;
  DMChat.cdsUsuarios_Aux.DisableControls;

  // Montando os smileys
  TChatFuncoes.ppuAdicionarSmileysTela(dockSiteSmileys.Width, slbSmileys, DMChat.ImgCollectionSmileys.Items, ppvAdicionarSmileys, FSmileysExpressaoRegular, FSmileys);
end;

procedure TfrmChatTela.FormDestroy(Sender: TObject);
var
  vaDadosPesquisa: TChatDadosPesquisa;
  vaDadosPesquisasPairEnumerator: TDictionary<string, TChatDadosPesquisa>.TPairEnumerator;
begin
  if Assigned(FDadosUltimasPesquisas) then
    begin
      vaDadosPesquisasPairEnumerator := FDadosUltimasPesquisas.GetEnumerator;

      while vaDadosPesquisasPairEnumerator.MoveNext do
        begin
          vaDadosPesquisa := vaDadosPesquisasPairEnumerator.Current.Value;

          if Assigned(vaDadosPesquisa) then
            FreeAndNil(vaDadosPesquisa);
        end;

      FDadosUltimasPesquisas.Clear;
      FreeAndNil(FDadosUltimasPesquisas);
    end;

  if Assigned(FConversasModal) then
    begin
      FConversasModal.Clear;
      FreeAndNil(FConversasModal);
    end;

  if Assigned(FChatPanelSelecionadoCtrl) then
    begin
      FChatPanelSelecionadoCtrl.Clear;
      FreeAndNil(FChatPanelSelecionadoCtrl);
    end;

  if Assigned(FDadosConversas) then
    begin
      FDadosConversas.Clear;
      FreeAndNil(FDadosConversas);
    end;

  if Assigned(FUsuarioLogado) then
    begin
      FUsuarioLogado.Clear;
      FreeAndNil(FUsuarioLogado);
    end;

  if Assigned(FSmileys) then
    begin
      FSmileys.Clear;
      FreeAndNil(FSmileys);
    end;

  if Assigned(FConfiguracao) then
    FreeAndNil(FConfiguracao);

  if Assigned(FSecaoCriticaBancoDadosConversas) then
    FreeAndNil(FSecaoCriticaBancoDadosConversas);

  if Assigned(FSecaoCriticaBancoDadosUsuarios) then
    FreeAndNil(FSecaoCriticaBancoDadosUsuarios);

  if Assigned(FSecaoCriticaNovaMensagemModal) then
    FreeAndNil(FSecaoCriticaNovaMensagemModal);

  if Assigned(FSecaoCriticaProgressaoUpLoad) then
    FreeAndNil(FSecaoCriticaProgressaoUpLoad);

  if Assigned(FSecaoCriticaUsuarioLogado) then
    FreeAndNil(FSecaoCriticaUsuarioLogado);

  inherited;
end;

procedure TfrmChatTela.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  procedure plcFoco;
  begin
    if pgcPrincipal.ActivePage = TabConversa then
      begin
        if rveMensagensEdit.Showing and rveMensagensEdit.Visible then
          rveMensagensEdit.SetFocus
      end
    else
      begin
        if EditPesquisaUsuario.Showing and EditPesquisaUsuario.Visible then
          EditPesquisaUsuario.SetFocus;
      end;
  end;

begin
  inherited;

  case Key of
    VK_RETURN:
      begin
        if dockPanelPesqUsuarios.Visible then
          begin
            if DMChat.cdsUsuarios.RecordCount > 0 then
              begin
                // N�o inverter a ordem destas duas linhas, pois ao fechar o dockPanelPesqUsuario a pesquisa � perdida (OnHideControl)
                ppvAdicionarConversa(TChatFuncoes.fpuMontaIdentificador(DMChat.cdsUsuariosCODIGO.AsInteger, DMChat.cdsUsuariosCODIGO_HOSPITAL.AsInteger), True, False);
                dockPanelPesqUsuarios.Hide;
              end;
          end;
      end;
    VK_ESCAPE:
      begin
        if dockPanelPesqUsuarios.Visible then
          begin
            if EditNomeUsuario.Focused then
              begin
                if VarIsNull(EditNomeUsuario.EditingText) or (EditNomeUsuario.EditingText = '') then
                  begin
                    dockPanelPesqUsuarios.Hide;
                    plcFoco;
                  end;
              end
            else
              begin
                if cbGrupo.Focused then
                  begin
                    if not cbGrupo.DroppedDown then
                      begin
                        dockPanelPesqUsuarios.Hide;
                        plcFoco;
                      end;
                  end
                else
                  begin
                    if cbStatus.Focused then
                      begin
                        if not cbStatus.DroppedDown then
                          begin
                            dockPanelPesqUsuarios.Hide;
                            plcFoco;
                          end;
                      end
                    else
                      begin
                        dockPanelPesqUsuarios.Hide;
                        plcFoco;
                      end;
                  end;
              end;
          end;

        if dockPanelSmileys.Visible then
          begin
            dockPanelSmileys.Hide;
            rveMensagensEdit.SetFocus;
          end;
      end;
    VK_UP:
      begin
        if dockPanelPesqUsuarios.Visible and EditNomeUsuario.Focused then
          DMChat.cdsUsuarios.Prior;
      end;
    VK_DOWN:
      begin
        if dockPanelPesqUsuarios.Visible and EditNomeUsuario.Focused then
          DMChat.cdsUsuarios.Next;
      end;
    VK_F2:
      begin
        if ssAlt in Shift then
          ppvPanelEnviarMensagemUsuariosConectados(not pnlEnviarMensagemUsuariosConectados.Visible)
        else
          ppvAbrirTelaPesqUsuario;
      end;
    VK_F4:
      begin
        if ssAlt in Shift then
          Key := 0;
      end;
  end;
end;

procedure TfrmChatTela.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if (pgcPrincipal.ActivePage = TabConversa) and bttEnviar.Focused and rveMensagensEdit.Showing and rveMensagensEdit.Visible then
    rveMensagensEdit.SetFocus;
end;

procedure TfrmChatTela.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  inherited;

  if Sender is TRichViewEdit then
    begin
      if fpvMouseSobreComponente(TControl(Sender), MousePos) and
        ((not dockPanelSmileys.Visible) or (not fpvMouseSobreComponente(TControl(dockPanelSmileys), MousePos))) then
        TRichViewEdit(Sender).WheelStep := 2
      else
        TRichViewEdit(Sender).WheelStep := 0;
    end;
end;

procedure TfrmChatTela.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);

  procedure locRolarScroll(ipScrollBar: TcxScrollBoxScrollBarOptions);
  begin
    if (ipScrollBar.Position + ipScrollBar.Increment) <= ipScrollBar.Range then
      ipScrollBar.Position := ipScrollBar.Position + ipScrollBar.Increment
    else
      ipScrollBar.Position := ipScrollBar.Range;
  end;

  procedure locRolarScrollRVE(ipRVE: TRichViewEdit);
  begin
    if (ipRVE.VScrollPos + ipRVE.WheelStep) <= ipRVE.VScrollMax then
      ipRVE.VScrollPos := ipRVE.VScrollPos + ipRVE.WheelStep
    else
      ipRVE.VScrollPos := ipRVE.VScrollMax;
  end;

begin
  inherited;

  // Verificando se o mouse est� sobre o componente
  if fpvMouseSobreComponente(slbConversasListaUsuarios) then
    locRolarScroll(slbConversasListaUsuarios.VertScrollBar);

  if (pgcPrincipal.ActivePage = TabConversa) then
    begin
      if (pgcDadosConversa.ActivePage = tabArquivos) and fpvMouseSobreComponente(slbListaArquivos) then
        locRolarScroll(slbListaArquivos.VertScrollBar)
      else
        begin
          if (pgcDadosConversa.ActivePage = tabGrupo) and fpvMouseSobreComponente(slbListaUsuariosGrupo) then
            locRolarScroll(slbListaUsuariosGrupo.VertScrollBar);
        end;

      if (dockPanelSmileys.Visible and fpvMouseSobreComponente(TControl(dockPanelSmileys), MousePos)) then
        locRolarScroll(slbSmileys.VertScrollBar)
      else
        begin
          if (not rveMensagens.Focused) and fpvMouseSobreComponente(rveMensagens) then
            locRolarScrollRVE(rveMensagens)
          else
            begin
              if (not rveMensagensEdit.Focused) and fpvMouseSobreComponente(rveMensagensEdit) then
                locRolarScrollRVE(rveMensagensEdit);
            end;
        end;
    end
  else
    begin
      if pgcPrincipal.ActivePage = TabPesquisa then
        begin
          if (not rvePesquisa.Focused) and fpvMouseSobreComponente(rvePesquisa) then
            locRolarScrollRVE(rvePesquisa);
        end;
    end;
end;

procedure TfrmChatTela.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);

  procedure locRolarScroll(ipScrollBar: TcxScrollBoxScrollBarOptions);
  begin
    if (ipScrollBar.Position - ipScrollBar.Increment) >= 0 then
      ipScrollBar.Position := ipScrollBar.Position - ipScrollBar.Increment
    else
      ipScrollBar.Position := 0;
  end;

  procedure locRolarScrollRVE(ipRVE: TRichViewEdit);
  begin
    if (ipRVE.VScrollPos - ipRVE.WheelStep) >= 0 then
      ipRVE.VScrollPos := ipRVE.VScrollPos - ipRVE.WheelStep
    else
      ipRVE.VScrollPos := 0;
  end;

begin
  inherited;

  // Verificando se o mouse est� sobre o componente
  if fpvMouseSobreComponente(slbConversasListaUsuarios) then
    locRolarScroll(slbConversasListaUsuarios.VertScrollBar);

  if (pgcPrincipal.ActivePage = TabConversa) then
    begin
      if (pgcDadosConversa.ActivePage = tabArquivos) and fpvMouseSobreComponente(slbListaArquivos) then
        locRolarScroll(slbListaArquivos.VertScrollBar)
      else
        begin
          if (pgcDadosConversa.ActivePage = tabGrupo) and fpvMouseSobreComponente(slbListaUsuariosGrupo) then
            locRolarScroll(slbListaUsuariosGrupo.VertScrollBar);
        end;

      if (dockPanelSmileys.Visible and fpvMouseSobreComponente(TControl(dockPanelSmileys), MousePos)) then
        locRolarScroll(slbSmileys.VertScrollBar)
      else
        begin
          if (not rveMensagens.Focused) and fpvMouseSobreComponente(rveMensagens) then
            locRolarScrollRVE(rveMensagens)
          else
            begin
              if (not rveMensagensEdit.Focused) and fpvMouseSobreComponente(rveMensagensEdit) then
                locRolarScrollRVE(rveMensagensEdit);
            end;
        end;
    end
  else
    begin
      if pgcPrincipal.ActivePage = TabPesquisa then
        begin
          if (not rvePesquisa.Focused) and fpvMouseSobreComponente(rvePesquisa) then
            locRolarScrollRVE(rvePesquisa);
        end;
    end;
end;

procedure TfrmChatTela.FormResize(Sender: TObject);
var
  vaMaxWidth: TConstraintSize;
begin
  inherited;
  vaMaxWidth := Trunc(Self.Width / 3);

  if vaMaxWidth < 200 then
    vaMaxWidth := 200;

  pnlConversasListaUsuarios.Constraints.MaxWidth := vaMaxWidth;
  pgcDadosConversa.Constraints.MaxWidth := vaMaxWidth;
end;

procedure TfrmChatTela.FormShow(Sender: TObject);
begin
  inherited;
  DragAcceptFiles(Self.Handle, pgcPrincipal.ActivePage = TabConversa);

  if (fsModal in Self.FormState) and FTelaModalSimplificada then
    begin
      DMChat.Ac_Configuracao.Enabled := False;
      DMChat.Ac_Configuracao.Visible := False;
      pnlPesquisa.Visible := False;
      DMChat.Ac_PesquisarConversa.Enabled := False;
      DMChat.Ac_PesquisarConversa.Visible := False;
    end
  else
    begin
      pnlUsuario.BevelOuter := TBevelCut.bvNone;
      DMChat.Ac_Retornar.Enabled := (fsModal in Self.FormState);
      DMChat.Ac_Retornar.Visible := DMChat.Ac_Retornar.Enabled;
    end;

  EditPesquisaUsuario.ShowHint := True;
end;

function TfrmChatTela.fpvMouseSobreComponente(ipControl: TControl): Boolean;
var
  vaMousePos: TPoint;
begin
  Result := False;

  if GetCursorPos(vaMousePos) then
    Result := fpvMouseSobreComponente(ipControl, vaMousePos);
end;

function TfrmChatTela.fpuAdicionarProgressaoUpLoad(
  const ipFotoThumbnail: TPicture; const ipTitulo: string; const ipValorMinimo,
  ipValorMaximo: Integer): string;
var
  vaChatPanelBarraProgresso: TChatPanelBarraProgresso;
begin
  Result := '';
  FSecaoCriticaProgressaoUpLoad.Enter;

  try
    pnlDadosConversaEnvioMensagem.Tag := pnlDadosConversaEnvioMensagem.Tag + 1;
    Result := 'pnlEnvioMensagens_' + IntToStr(pnlDadosConversaEnvioMensagem.Tag);
    pnlDadosConversaEnvioMensagem.Visible := True;
    vaChatPanelBarraProgresso := TChatPanelBarraProgresso.Create(slbEnvioMensagens);
    vaChatPanelBarraProgresso.Parent := slbEnvioMensagens;
    vaChatPanelBarraProgresso.Name := Result;
    vaChatPanelBarraProgresso.CorIndicadorProgresso := clBlue;
    vaChatPanelBarraProgresso.FotoThumbnail := ipFotoThumbnail;
    vaChatPanelBarraProgresso.Titulo := ipTitulo;
    vaChatPanelBarraProgresso.ValorMaximo := ipValorMaximo;
    vaChatPanelBarraProgresso.ValorMinimo := ipValorMinimo;
    vaChatPanelBarraProgresso.Progresso := ipValorMinimo;
    vaChatPanelBarraProgresso.Align := alTop;
    vaChatPanelBarraProgresso.Refresh;
  finally
    FSecaoCriticaProgressaoUpLoad.Release;
  end;
end;

function TfrmChatTela.fpuAtualizarConfiguracoes(
  const ipConfiguracoes: TChatConfiguracoes): string;
var
  vaFontes: TStringList;
begin
  Result := '';

  try
    try
      // Configura��es de fonte
      // Validando as informa��es
      vaFontes := TUtils.fpuPegarFontesComputador;

      if (Trim(ipConfiguracoes.FonteNome) <> '') and TRegEx.IsMatch(vaFontes.Text, TRegEx.Escape(ipConfiguracoes.FonteNome), [roIgnoreCase, roSingleLine]) then
        FConfiguracao.FonteNome := ipConfiguracoes.FonteNome
      else
        FConfiguracao.FonteNome := 'Calibri';

      case ipConfiguracoes.FonteTamanho of
        0 .. 100:
          FConfiguracao.FonteTamanho := ipConfiguracoes.FonteTamanho;
      else
        FConfiguracao.FonteTamanho := 11;
      end;

      // Configurando a fonte da mensagem
      DMChat.RVStyle1.TextStyles[0].FontName := FConfiguracao.FonteNome;
      DMChat.RVStyle1.TextStyles[0].Size := FConfiguracao.FonteTamanho;

      // Configurando a fonte dos links
      DMChat.RVStyle1.TextStyles[4].FontName := FConfiguracao.FonteNome;
      DMChat.RVStyle1.TextStyles[4].Size := FConfiguracao.FonteTamanho;
    except
      on E: Exception do
        Result := E.Message;
    end;
  finally
    if Assigned(vaFontes) then
      FreeAndNil(vaFontes);
  end;
end;

function TfrmChatTela.fpuAtualizarHospitais(
  const ipListaHospitais: TList<TChatHospital>): string;
  procedure plcAdicionarUsuariosGrupos(const ipCodigoHospital: Integer);
  var
    vaFoto: TBytesStream;
    vaDataGrupos, vaDataUsuarios: OleVariant;
  begin
    // Pesquisando os grupos do hospital
    vaDataGrupos := FAoPesquisarGrupos(ipCodigoHospital, '', True, False);

    if not VarIsNull(vaDataGrupos) then
      begin
        if (not DMChat.cdsGrupos.Active) or (DMChat.cdsGrupos.IsEmpty) then
          begin
            DMChat.cdsGrupos.Close;
            DMChat.cdsGrupos.Data := vaDataGrupos;

            if ipCodigoHospital <> 1 then
              begin
                DMChat.cdsGrupos.DisableControls;
                DMChat.cdsGrupos.First;

                try
                  while not DMChat.cdsGrupos.Eof do
                    begin
                      if not(DMChat.cdsGrupos.State in [dsEdit, dsInsert]) then
                        DMChat.cdsGrupos.Edit;

                      DMChat.cdsGruposCODIGO_HOSPITAL.AsInteger := ipCodigoHospital;
                      DMChat.cdsGrupos.Post;
                      DMChat.cdsGrupos.Next;
                    end;
                finally
                  DMChat.cdsGrupos.EnableControls;
                end;
              end;
          end
        else
          begin
            DMChat.cdsGrupos.DisableControls;

            try
              DMChat.cdsGrupos_Aux.Close;
              DMChat.cdsGrupos_Aux.Data := vaDataGrupos;
              DMChat.cdsGrupos_Aux.First;

              while not DMChat.cdsGrupos_Aux.Eof do
                begin
                  DMChat.cdsGrupos.Append;
                  DMChat.cdsGruposCODIGO.AsInteger := DMChat.cdsGrupos_AuxCODIGO.AsInteger;
                  DMChat.cdsGruposCODIGO_HOSPITAL.AsInteger := ipCodigoHospital;
                  DMChat.cdsGruposNOME.AsString := DMChat.cdsGrupos_AuxNOME.AsString;
                  DMChat.cdsGrupos.Post;
                  DMChat.cdsGrupos_Aux.Next;
                end;
            finally
              DMChat.cdsGrupos_Aux.Close;
              DMChat.cdsGrupos.EnableControls;
            end;
          end;
      end;

    // Pesquisando os usu�rios do hospital
    vaDataUsuarios := FAoPesquisarUsuarios(ipCodigoHospital, '', True, False, Ord(TTiposPapeis.tpUsuarioSistema));

    if not VarIsNull(vaDataUsuarios) then
      begin
        if (not DMChat.cdsUsuarios.Active) or (DMChat.cdsUsuarios.IsEmpty) then
          begin
            DMChat.cdsUsuarios.Close;
            DMChat.cdsUsuarios.Data := vaDataUsuarios;

            if ipCodigoHospital <> 1 then
              begin
                DMChat.cdsUsuarios.DisableControls;
                DMChat.cdsUsuarios.First;

                try
                  while not DMChat.cdsUsuarios.Eof do
                    begin
                      if not(DMChat.cdsUsuarios.State in [dsEdit, dsInsert]) then
                        DMChat.cdsUsuarios.Edit;

                      DMChat.cdsUsuariosCODIGO_HOSPITAL.AsInteger := ipCodigoHospital;
                      DMChat.cdsUsuarios.Post;
                      DMChat.cdsUsuarios.Next;
                    end;
                finally
                  DMChat.cdsUsuarios.EnableControls;
                end;
              end;
          end
        else
          begin
            DMChat.cdsUsuarios.DisableControls;
            vaFoto := TBytesStream.Create;

            try
              DMChat.cdsUsuarios_Aux.Close;
              DMChat.cdsUsuarios_Aux.Data := vaDataUsuarios;
              DMChat.cdsUsuarios_Aux.First;

              while not DMChat.cdsUsuarios_Aux.Eof do
                begin
                  DMChat.cdsUsuarios.Append;
                  DMChat.cdsUsuariosCODIGO.AsInteger := DMChat.cdsUsuarios_AuxCODIGO.AsInteger;
                  DMChat.cdsUsuariosCODIGO_HOSPITAL.AsInteger := DMChat.cdsUsuarios_AuxCODIGO_HOSPITAL.AsInteger;
                  DMChat.cdsUsuariosEMAIL.AsString := DMChat.cdsUsuarios_AuxEMAIL.AsString;
                  DMChat.cdsUsuariosNOME.AsString := DMChat.cdsUsuarios_AuxNOME.AsString;
                  DMChat.cdsUsuariosFUNCAO.AsString := DMChat.cdsUsuarios_AuxFUNCAO.AsString;
                  DMChat.cdsUsuariosPROMEDICO.AsInteger := DMChat.cdsUsuarios_AuxPROMEDICO.AsInteger;
                  DMChat.cdsUsuariosUSUARIO_GRUPO.AsInteger := DMChat.cdsUsuarios_AuxUSUARIO_GRUPO.AsInteger;

                  if DMChat.cdsUsuarios_AuxFOTO.isNull then
                    DMChat.cdsUsuariosFOTO.Clear
                  else
                    begin
                      vaFoto.Clear;
                      DMChat.cdsUsuarios_AuxFOTO.SaveToStream(vaFoto);
                      vaFoto.Position := 0;
                      DMChat.cdsUsuariosFOTO.LoadFromStream(vaFoto);
                    end;

                  DMChat.cdsUsuariosFOTO_AJUSTAR.AsInteger := DMChat.cdsUsuarios_AuxFOTO_AJUSTAR.AsInteger;

                  if DMChat.cdsUsuarios_AuxFOTO_THUMBNAIL.isNull then
                    DMChat.cdsUsuariosFOTO_THUMBNAIL.Clear
                  else
                    begin
                      vaFoto.Clear;
                      DMChat.cdsUsuarios_AuxFOTO_THUMBNAIL.SaveToStream(vaFoto);
                      vaFoto.Position := 0;
                      DMChat.cdsUsuariosFOTO_THUMBNAIL.LoadFromStream(vaFoto);
                    end;

                  DMChat.cdsUsuariosFOTO_THUMBNAIL_AJUSTAR.AsInteger := DMChat.cdsUsuarios_AuxFOTO_THUMBNAIL_AJUSTAR.AsInteger;
                  DMChat.cdsUsuariosSTATUS.AsInteger := DMChat.cdsUsuarios_AuxSTATUS.AsInteger;
                  DMChat.cdsUsuariosATIVO_INATIVO.AsInteger := DMChat.cdsUsuarios_AuxATIVO_INATIVO.AsInteger;
                  DMChat.cdsUsuariosTIPO_PAPEL.AsInteger := DMChat.cdsUsuarios_AuxTIPO_PAPEL.AsInteger;
                  DMChat.cdsUsuariosGRUPOS_USUARIO.AsString := DMChat.cdsUsuarios_AuxGRUPOS_USUARIO.AsString;
                  DMChat.cdsUsuarios.Post;
                  DMChat.cdsUsuarios_Aux.Next;
                end;
            finally
              FreeAndNil(vaFoto);
              DMChat.cdsUsuarios_Aux.Close;
              DMChat.cdsUsuarios.EnableControls;
            end;
          end;

        // Incluindo o usu�rio do sistema
        DMChat.cdsUsuarios.Append;
        DMChat.cdsUsuariosCODIGO.AsInteger := FCodigoUsuarioSistema;
        DMChat.cdsUsuariosCODIGO_HOSPITAL.AsInteger := ipCodigoHospital;
        DMChat.cdsUsuariosEMAIL.AsString := '';
        DMChat.cdsUsuariosNOME.AsString := 'PRO-M�DICO';
        DMChat.cdsUsuariosFUNCAO.AsString := 'MENSAGENS DO SISTEMA';
        DMChat.cdsUsuariosPROMEDICO.AsInteger := 0;
        DMChat.cdsUsuariosUSUARIO_GRUPO.AsInteger := 0;
        vaFoto := TBytesStream.Create;

        try
          DMChat.ImgCollectionItemIconeProMedico72x72.Picture.Graphic.SaveToStream(vaFoto);
          vaFoto.Position := 0;
          DMChat.cdsUsuariosFOTO.LoadFromStream(vaFoto);

          DMChat.cdsUsuariosFOTO_AJUSTAR.AsInteger := 0;

          vaFoto.Clear;
          DMChat.ImgCollectionItemIconeProMedico32x32.Picture.Graphic.SaveToStream(vaFoto);
          vaFoto.Position := 0;
          DMChat.cdsUsuariosFOTO_THUMBNAIL.LoadFromStream(vaFoto);
        finally
          FreeAndNil(vaFoto);
        end;

        DMChat.cdsUsuariosFOTO_THUMBNAIL_AJUSTAR.AsInteger := 0;
        DMChat.cdsUsuariosSTATUS.AsInteger := 1;
        DMChat.cdsUsuariosATIVO_INATIVO.AsInteger := 0;
        DMChat.cdsUsuariosGRUPOS_USUARIO.AsString := '';
        DMChat.cdsUsuarios.Post;
      end;
  end;

var
  vaChatHospital: TChatHospital;
  vaCdsHospitais: TpmClientDataSet;
  vaAdicionarUsuariosGrupos: Boolean;
begin
  Result := '';
  vaAdicionarUsuariosGrupos := False;

  if Assigned(ipListaHospitais) then
    begin
      vaCdsHospitais := fpvClonarClientDataSet(DMChat.cdsHospitais);
      vaCdsHospitais.IndexFieldNames := 'CODIGO';

      try
        try
          for vaChatHospital in ipListaHospitais do
            begin
              if vaCdsHospitais.Locate('codigo', vaChatHospital.Codigo, []) then
                vaCdsHospitais.Edit
              else
                begin
                  vaAdicionarUsuariosGrupos := True;
                  vaCdsHospitais.Append;
                  vaCdsHospitais.FieldByName('CODIGO').AsInteger := vaChatHospital.Codigo;
                end;

              vaCdsHospitais.FieldByName('NOME_FANTASIA').AsString := vaChatHospital.NomeFantasia;
              vaCdsHospitais.FieldByName('RAZAO_SOCIAL').AsString := vaChatHospital.RazaoSocial;
              vaCdsHospitais.Post;

              if vaAdicionarUsuariosGrupos then
                plcAdicionarUsuariosGrupos(vaChatHospital.Codigo);
            end;
        except
          on E: Exception do
            Result := E.Message;
        end;
      finally
        if Assigned(vaCdsHospitais) then
          begin
            vaCdsHospitais.Close;
            FreeAndNil(vaCdsHospitais);
          end;
      end;
    end;
end;

function TfrmChatTela.fpuAtualizarStatus(
  const ipListaStatus: TList<TChatStatus>): string;
var
  vaStatus: TChatStatus;
  vaCdsUsuarios: TpmClientDataSet;
begin
  Result := '';

  if Assigned(ipListaStatus) then
    begin
      vaCdsUsuarios := fpvClonarClientDataSet(DMChat.cdsUsuarios);
      vaCdsUsuarios.IndexFieldNames := 'CODIGO;CODIGO_HOSPITAL';

      try
        try
          // Atualizando os registros no ClientDataSet
          for vaStatus in ipListaStatus do
            begin
              if vaCdsUsuarios.Locate('CODIGO;CODIGO_HOSPITAL', VarArrayOf([vaStatus.IdentificacaoUsuario.CodigoUsuario, vaStatus.IdentificacaoUsuario.CodigoHospital]), []) then
                begin
                  // Se o usu�rio for um grupo, n�o tem que atualizar o status, pois grupo n�o possui status
                  if vaCdsUsuarios.FieldByName('USUARIO_GRUPO').AsInteger = 0 then
                    begin
                      vaCdsUsuarios.Edit;
                      vaCdsUsuarios.FieldByName('STATUS').AsInteger := vaStatus.Status;
                      vaCdsUsuarios.Post;
                    end;
                end
              else
                begin
                  if Result <> '' then
                    Result := Result + ';';

                  Result := Result + IntToStr(vaStatus.IdentificacaoUsuario.CodigoUsuario) + '_' + IntToStr(vaStatus.IdentificacaoUsuario.CodigoHospital);
                end;
            end;

          // Fechando e liberando da memm�ia a tabela tempor�ria de usu�rios antes de executar o procedimento ppvAtualizarDadosUsuarioTela,
          // pois nesse procedimento ela � novamente criada, caso necess�rio, e a partir deste ponto ela n�o � mais necess�ria nesta fun��o
          vaCdsUsuarios.Close;
          FreeAndNil(vaCdsUsuarios);

          // Atulizando os dados da tela (Otimizando a atuliza��o da tela, escolhendo a forma que far� menos looping)
          if ipListaStatus.Count >= slbConversasListaUsuarios.ComponentCount then
            ppvAtualizarDadosUsuarioTela('', nil, True)
          else
            begin
              for vaStatus in ipListaStatus do
                ppvAtualizarDadosUsuarioTela(TChatFuncoes.fpuMontaIdentificador(vaStatus.IdentificacaoUsuario.CodigoUsuario, vaStatus.IdentificacaoUsuario.CodigoHospital), nil, True);
            end;
        except
          on E: Exception do
            Result := E.Message;
        end;
      finally
        if Assigned(vaCdsUsuarios) then
          begin
            vaCdsUsuarios.Close;
            FreeAndNil(vaCdsUsuarios);
          end;
      end;
    end;
end;

function TfrmChatTela.fpuRetornaImagem(
  const ipBytesStream: TBytesStream): TPicture;
var
  vaGraphic: TGraphic;
  vaGraphicClass: TGraphicClass;
begin
  Result := nil;

  try
    vaGraphic := TChatFuncoes.fpuImagem(ipBytesStream, TWICImageFormat.wifJpeg);

    if Assigned(vaGraphic) then
      begin
        Result := TPicture.Create;
        Result.Graphic := vaGraphic;
      end;
  finally
    if Assigned(vaGraphic) then
      FreeAndNil(vaGraphic);
  end;
end;

function TfrmChatTela.fpvClonarClientDataSet(
  const ipCdsOrigem: TpmClientDataSet): TpmClientDataSet;
begin
  Result := nil;

  if Assigned(ipCdsOrigem) then
    begin
      Result := TpmClientDataSet.Create(nil);
      Result.CloneCursor(ipCdsOrigem, True);
      Result.pmAutoRefresh := False;
      Result.pmApplyUpdatesAutomatico := False;
      Result.pmGerarLog := False;
      Result.Filtered := False;
      Result.Filter := '';
      Result.First;
    end;
end;

function TfrmChatTela.fpvDownloadArquivo(const ipCodigoHospital: Integer;
  const ipEnerecoArquivo: string): TBytesStream;
begin
  Result := nil;

  if Assigned(FAoFazerDownloadArquivo) then
    Result := FAoFazerDownloadArquivo(ipCodigoHospital, ipEnerecoArquivo);
end;

function TfrmChatTela.fpvMouseSobreComponente(ipControl: TControl;
  ipMousePos: TPoint): Boolean;
var
  vaPosSE, vaPosID: TPoint;
begin
  vaPosSE := ipControl.ClientOrigin;
  vaPosID.X := vaPosSE.X + ipControl.Width;
  vaPosID.Y := vaPosSE.Y + ipControl.Height;
  Result := (ipMousePos.X >= vaPosSE.X) and (ipMousePos.X <= vaPosID.X) and (ipMousePos.Y >= vaPosSE.Y) and (ipMousePos.Y <= vaPosID.Y);
end;

function TfrmChatTela.fpvPesquisarConversa(const ipTipoPesquisa: TChatTipoPesquisa;
  const ipTexto: string; const ipDataInicial, ipDataFinal: TDate;
  const ipUsuarioLogado, ipUsuarioConversa: TChatIdentificacaoUsuario;
  const ipUsuarioSistema, ipPesquisarAnexosAdicionais: Boolean; var ioMensagem,
  ioMensagemAnexo: OleVariant): Boolean;
var
  vaPesqSomenteMsgEnviadas: Boolean;
begin
  Result := True;
  ioMensagem := null;
  ioMensagemAnexo := null;
  vaPesqSomenteMsgEnviadas := fpvVisualizarSomenteMensagensEnviadas(ipUsuarioConversa);

  try
    if Assigned(FAoPesquisarMensagens) then
      ioMensagem := FAoPesquisarMensagens(ipTipoPesquisa, ipTexto, ipDataInicial, ipDataFinal, ipUsuarioLogado, ipUsuarioConversa, ipUsuarioSistema, vaPesqSomenteMsgEnviadas);

    if ipPesquisarAnexosAdicionais and Assigned(FAoPesquisarAnexos) then
      begin
        if ipTipoPesquisa = TChatTipoPesquisa.tpqCodigo then
          ioMensagemAnexo := FAoPesquisarAnexos(ipUsuarioLogado, ipUsuarioConversa, 0, StrToInt(ipTexto), ipUsuarioSistema, vaPesqSomenteMsgEnviadas)
        else
          ioMensagemAnexo := FAoPesquisarAnexos(ipUsuarioLogado, ipUsuarioConversa, 40, 0, ipUsuarioSistema, vaPesqSomenteMsgEnviadas);
      end;
  except
    on E: Exception do
      begin
        Result := False;
        MessageTela('Falha ao pesquisar as mensagens.' + sLineBreak + E.Message);
      end;
  end;
end;

function TfrmChatTela.fpvPesquisarLeitoresMensagens(const ipCodigoHospital,
  ipCodigoMensagem: Integer): OleVariant;
begin
  Result := null;

  if Assigned(FAoPesquisarLeitores) then
    Result := FAoPesquisarLeitores(ipCodigoHospital, ipCodigoMensagem);
end;

function TfrmChatTela.fpvUsuarioLogado(const ipCodigoHospital: Integer;
  var ioUsuarioLogado: Integer): Boolean;
var
  vaUsuarioLogado: TChatUsuarioLogado;
begin
  Result := fpvUsuarioLogado(ipCodigoHospital, vaUsuarioLogado);
  ioUsuarioLogado := vaUsuarioLogado.IdentificacaoUsuario.CodigoUsuario;
end;

function TfrmChatTela.fpvUsuarioLogado(const ipCodigoHospital: Integer;
  var ioUsuarioLogado: TChatIdentificacaoUsuario): Boolean;
var
  vaUsuarioLogado: TChatUsuarioLogado;
begin
  Result := fpvUsuarioLogado(ipCodigoHospital, vaUsuarioLogado);
  ioUsuarioLogado.CodigoHospital := vaUsuarioLogado.IdentificacaoUsuario.CodigoHospital;
  ioUsuarioLogado.CodigoUsuario := vaUsuarioLogado.IdentificacaoUsuario.CodigoUsuario;
end;

function TfrmChatTela.fpvUsuarioLogado(const ipCodigoHospital: Integer;
  var ioUsuarioLogado: TChatUsuarioLogado): Boolean;
begin
  Result := FUsuarioLogado.ContainsKey(ipCodigoHospital);

  if Result then
    begin
      ioUsuarioLogado.IdentificacaoUsuario.CodigoHospital := FUsuarioLogado.Items[ipCodigoHospital].IdentificacaoUsuario.CodigoHospital;
      ioUsuarioLogado.IdentificacaoUsuario.CodigoUsuario := FUsuarioLogado.Items[ipCodigoHospital].IdentificacaoUsuario.CodigoUsuario;
      ioUsuarioLogado.EnviaMensagemGrupoTodos := FUsuarioLogado.Items[ipCodigoHospital].EnviaMensagemGrupoTodos;
    end
  else
    begin
      ioUsuarioLogado.IdentificacaoUsuario.CodigoHospital := 0;
      ioUsuarioLogado.IdentificacaoUsuario.CodigoUsuario := 0;
      ioUsuarioLogado.EnviaMensagemGrupoTodos := False;
    end;
end;

function TfrmChatTela.fpvVisualizarSomenteMensagensEnviadas(
  const ipIdentificadorConversa: string): Boolean;
begin
  Result := fpvVisualizarSomenteMensagensEnviadas(TChatFuncoes.fpuCodigoUsuario(ipIdentificadorConversa), TChatFuncoes.fpuCodigoHospital(ipIdentificadorConversa));
end;

function TfrmChatTela.fpvVisualizarSomenteMensagensEnviadas(
  const ipUsuarioConversa: TChatIdentificacaoUsuario): Boolean;
begin
  Result := fpvVisualizarSomenteMensagensEnviadas(ipUsuarioConversa.CodigoUsuario, ipUsuarioConversa.CodigoHospital);
end;

function TfrmChatTela.fpvVisualizarSomenteMensagensEnviadas(
  const ipCodigoUsuarioConversa, ipCodigoHospital: Integer): Boolean;
begin
  Result := False;

  // Zero � o grupo "Todos", ent�o todos os usu�rios fazem parte dele, portanto todos podem ver todas as mensagens
  if ipCodigoUsuarioConversa <> 0 then
    begin
      if FUsuarioLogado.ContainsKey(ipCodigoHospital) then
        begin
          DMChat.cdsUsuarios_Aux.Close;

          try
            DMChat.cdsUsuarios_Aux.Data := DMChat.cdsUsuarios.Data;
            DMChat.cdsUsuarios_Aux.Filtered := False;
            DMChat.cdsUsuarios_Aux.Filter :=
              'codigo = ' + IntToStr(ipCodigoUsuarioConversa) + ' and ' +
              'codigo_hospital = ' + IntToStr(ipCodigoHospital) + ' and ' +
              'usuario_grupo = 1';
            DMChat.cdsUsuarios_Aux.Filtered := True;

            if DMChat.cdsUsuarios_Aux.RecordCount > 0 then
              begin
                DMChat.cdsUsuarios_Aux.Filtered := False;
                DMChat.cdsUsuarios_Aux.Filter :=
                  'codigo = ' + IntToStr(FUsuarioLogado.Items[ipCodigoHospital].IdentificacaoUsuario.CodigoUsuario) + ' and ' +
                  'codigo_hospital = ' + IntToStr(ipCodigoHospital) + ' and ' +
                  'grupos_usuario like (' + QuotedStr('%;' + IntToStr(ipCodigoUsuarioConversa) + ';%') + ')';
                DMChat.cdsUsuarios_Aux.Filtered := True;
                Result := (DMChat.cdsUsuarios_Aux.RecordCount = 0);
              end;
          finally
            DMChat.cdsUsuarios_Aux.Filtered := False;
            DMChat.cdsUsuarios_Aux.Filter := '';
            DMChat.cdsUsuarios_Aux.Close;
          end;
        end
      else
        Result := True;
    end;
end;

function TfrmChatTela.GetDataSourceFotoConfig: TDataSource;
begin
  Result := DMChat.dsFotoUsuarioLogado;
end;

procedure TfrmChatTela.pgcPrincipalPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  // Ativando e desativando a fun��o arrastar e soltar arquivos de acordo com a aba selecionada
  DragAcceptFiles(Self.Handle, NewPage = TabConversa);

  if (NewPage = TabInicial) and EditPesquisaUsuario.Showing and EditPesquisaUsuario.Visible and pnlPesquisa.Visible then
    EditPesquisaUsuario.SetFocus;
end;

procedure TfrmChatTela.ppuAbrirConversas(
  const ipUsuarios: TList<TChatConversa>);
var
  vaConversa: TChatConversa;
begin
  for vaConversa in ipUsuarios do
    ppvAdicionarConversa(TChatFuncoes.fpuMontaIdentificador(vaConversa.IdentificacaoUsuario.CodigoUsuario, vaConversa.IdentificacaoUsuario.CodigoHospital), vaConversa.Selecionar, vaConversa.Notificar);
end;

procedure TfrmChatTela.ppuAtualizarProgressaoUpLoad(const ipNome: string);
begin
  ppuAtualizarProgressaoUpLoad(ipNome, 1);
end;

procedure TfrmChatTela.ppuAtualizarFotoConfig(const ipFoto: TPicture);
var
  vaPicture: TPicture;
  vaGraphic: TGraphic;
begin
  vaPicture := nil;
  vaGraphic := nil;

  if Assigned(ipFoto) then
    begin
      try
        vaGraphic := TChatFuncoes.fpuImagemTamanhoMaximo(ipFoto.Graphic, 256, 256);

        if Assigned(vaGraphic) then
          begin
            vaPicture := TPicture.Create;
            vaPicture.Graphic := vaGraphic;
            imgConfigFotoUsuario.Picture := vaPicture;
          end;
      finally
        if Assigned(vaPicture) then
          FreeAndNil(vaPicture);

        if Assigned(vaGraphic) then
          FreeAndNil(vaGraphic);
      end;
    end;
end;

procedure TfrmChatTela.ppuAtualizarProgressaoUpLoad(const ipNome: string;
  const ipIncrementarProgresso: Integer);
var
  vaChatPanelBarraProgresso: TChatPanelBarraProgresso;
begin
  FSecaoCriticaProgressaoUpLoad.Enter;

  try
    vaChatPanelBarraProgresso := TChatPanelBarraProgresso(slbEnvioMensagens.FindComponent(ipNome));

    if Assigned(vaChatPanelBarraProgresso) then
      vaChatPanelBarraProgresso.Progresso := vaChatPanelBarraProgresso.Progresso + ipIncrementarProgresso;
  finally
    FSecaoCriticaProgressaoUpLoad.Release;
  end;
end;

procedure TfrmChatTela.ppuMensagensLidas(const ipCodigoUsuarioConversa,
  ipCodigoHospital: Integer; const ipCodigosMensagens: string);
var
  vaCustomRVItemInfo: TCustomRVItemInfo;
  vaCelula: TRVTableCellData;
  i: Integer;
  vaDadosConversa: TChatDadosConversa;
  vaIdentificador: string;
  vaMatchCollection: TMatchCollection;
  vaMatch: TMatch;
begin
  vaIdentificador := TChatFuncoes.fpuMontaIdentificador(ipCodigoUsuarioConversa, ipCodigoHospital);
  vaMatchCollection := TRegEx.Matches(ipCodigosMensagens, '\d{1,}', []);

  if FDadosConversas.ContainsKey(vaIdentificador) and (vaMatchCollection.Count > 0) then
    begin
      try
        vaDadosConversa := FDadosConversas.Items[vaIdentificador];
        DMChat.cdsMensagem.Data := vaDadosConversa.Mensagens;

        for vaMatch in vaMatchCollection do
          begin
            if DMChat.cdsMensagem.Locate('CODIGO', StrToInt(vaMatch.Value), []) and (DMChat.cdsMensagemMENSAGEM_LIDA_USUARIO_LOGADO.AsInteger = 0) then
              begin
                if not(DMChat.cdsMensagem.State in [dsEdit, dsInsert]) then
                  DMChat.cdsMensagem.Edit;

                DMChat.cdsMensagemMENSAGEM_LIDA.AsInteger := 1;
                DMChat.cdsMensagemMENSAGEM_LIDA_USUARIO_LOGADO.AsInteger := 1;
                DMChat.cdsMensagem.Post;

                if Assigned(FChatPanelSelecionado) and
                  (FChatPanelSelecionado.Identificador = vaIdentificador) and
                  (FChatPanelSelecionado.TipoAba in [TChatTipoAba.taConversaGrupo, TChatTipoAba.taConversaUsuario]) then
                  begin
                    vaCelula := nil;
                    i := 0;

                    while (i < rveMensagens.ItemCount) and (vaCelula = nil) do
                      begin
                        vaCustomRVItemInfo := rveMensagens.GetItem(i);

                        if (vaCustomRVItemInfo.Tag = vaMatch.Value + '_' + IntToStr(ipCodigoHospital)) and (vaCustomRVItemInfo is TRVTableItemInfo) then
                          begin
                            vaCelula := TRVTableItemInfo(vaCustomRVItemInfo).Cells[TRVTableItemInfo(vaCustomRVItemInfo).RowCount - 1, 3];

                            ppvIncluirStatusMensagem(vaCelula, 2, vaMatch.Value + '_' + IntToStr(ipCodigoHospital), True);
                          end;

                        Inc(i);
                      end;
                  end;
              end;
          end;

        rveMensagens.Change;
        rveMensagens.Format;

        vaDadosConversa.Mensagens := DMChat.cdsMensagem.Data;
        FDadosConversas.Items[vaIdentificador] := vaDadosConversa;
      finally
        DMChat.cdsMensagem.EmptyDataSet;
        DMChat.cdsMensagem.Close;
      end;
    end;
end;

procedure TfrmChatTela.ppuNovaMensagem(const ipCodigoMensagem,
  ipCodigoRemetente, ipCodigoHospital, ipCodigoDestinatario: Integer;
  const ipNotificar: Boolean);
var
  vaMensagem, vaMensagem_Anexo: OleVariant;
  vaIdentificador: string;
  vaDestinatario: TChatIdentificacaoUsuario;
  vaBytesStream: TBytesStream;
  vaDadosConversa: TChatDadosConversa;
begin
  vaBytesStream := nil;
  FSecaoCriticaBancoDadosUsuarios.Enter;
  FSecaoCriticaBancoDadosConversas.Enter;

  try
    // Verificando se existe usu�rio logado
    if FUsuarioLogado.ContainsKey(ipCodigoHospital) then
      begin
        // Montando o identificador da conversa
        if FUsuarioLogado.Items[ipCodigoHospital].IdentificacaoUsuario.CodigoUsuario = ipCodigoRemetente then
          vaIdentificador := TChatFuncoes.fpuMontaIdentificador(ipCodigoDestinatario, ipCodigoHospital)
        else
          vaIdentificador := TChatFuncoes.fpuMontaIdentificador(ipCodigoRemetente, ipCodigoHospital);

        // Adicionando a conversa na tela
        ppvAdicionarConversa(vaIdentificador, False, ipNotificar);

        // Verificando se os dados da conversa j� foram carregados
        if not VarIsNull(FDadosConversas.Items[vaIdentificador].Mensagens) then
          begin
            // Os dados j� foram carregados, ent�o vamos adicionar a nova mensagem

            vaDestinatario.CodigoHospital := ipCodigoHospital;
            vaDestinatario.CodigoUsuario := ipCodigoDestinatario;

            if fpvPesquisarConversa(
              TChatTipoPesquisa.tpqCodigo,
              IntToStr(ipCodigoMensagem),
              StrToDate('01/01/1900'),
              StrToDate('01/01/1900'),
              vaDestinatario, // usuario logado � quem esta fazendo a requisicao
              vaDestinatario, // usuario da conversa, nesse caso � o proprio usuario logado, eu sei, ta confuso.
              ipCodigoRemetente = 0,
              True,
              vaMensagem,
              vaMensagem_Anexo) then
              begin
                try
                  // Carregando os dados da pesquisa para os ClientDataSets auxiliares
                  DMChat.cdsMensagem_Aux.Data := vaMensagem;
                  DMChat.cdsMensagem_Anexo_Aux.Data := vaMensagem_Anexo;

                  // Carregando os dados da conversa
                  DMChat.cdsMensagem.Data := FDadosConversas.Items[vaIdentificador].Mensagens;
                  DMChat.cdsMensagem.LogChanges := False;

                  DMChat.cdsMensagem_Anexo.Data := FDadosConversas.Items[vaIdentificador].Anexos;
                  DMChat.cdsMensagem_Anexo.LogChanges := False;

                  // Adicinando as mensagens
                  DMChat.cdsMensagem_Aux.First;

                  while not DMChat.cdsMensagem_Aux.Eof do
                    begin
                      if not(DMChat.cdsMensagem.State in [dsEdit, dsInsert]) then
                        DMChat.cdsMensagem.Append;

                      DMChat.cdsMensagemCODIGO.AsInteger := DMChat.cdsMensagem_AuxCODIGO.AsInteger;
                      DMChat.cdsMensagemCODIGO_SENHAUS_REMETENTE.AsInteger := DMChat.cdsMensagem_AuxCODIGO_SENHAUS_REMETENTE.AsInteger;
                      DMChat.cdsMensagemCODIGO_SENHA_DESTINATARIO.AsInteger := DMChat.cdsMensagem_AuxCODIGO_SENHA_DESTINATARIO.AsInteger;
                      DMChat.cdsMensagemTEXTO.AsString := DMChat.cdsMensagem_AuxTEXTO.AsString;
                      DMChat.cdsMensagemDATA_HORA_ENVIO.AsDateTime := DMChat.cdsMensagem_AuxDATA_HORA_ENVIO.AsDateTime;
                      DMChat.cdsMensagemTIPO.AsInteger := DMChat.cdsMensagem_AuxTIPO.AsInteger;
                      DMChat.cdsMensagemMENSAGEM_LIDA.AsInteger := DMChat.cdsMensagem_AuxMENSAGEM_LIDA.AsInteger;
                      DMChat.cdsMensagemMENSAGEM_LIDA_USUARIO_LOGADO.AsInteger := DMChat.cdsMensagem_AuxMENSAGEM_LIDA_USUARIO_LOGADO.AsInteger;
                      DMChat.cdsMensagemCODIGO_MENSAGEM_ANEXO.AsInteger := DMChat.cdsMensagem_AuxCODIGO_MENSAGEM_ANEXO.AsInteger;
                      DMChat.cdsMensagemENDERECO_ANEXO.AsString := DMChat.cdsMensagem_AuxENDERECO_ANEXO.AsString;
                      DMChat.cdsMensagemTAMANHO_KB.AsInteger := DMChat.cdsMensagem_AuxTAMANHO_KB.AsInteger;
                      DMChat.cdsMensagemEXTENSAO.AsString := DMChat.cdsMensagem_AuxEXTENSAO.AsString;

                      if DMChat.cdsMensagem_AuxTHUMBNAIL.isNull then
                        DMChat.cdsMensagemTHUMBNAIL.Clear
                      else
                        begin
                          try
                            vaBytesStream := TBytesStream.Create;
                            DMChat.cdsMensagem_AuxTHUMBNAIL.SaveToStream(vaBytesStream);
                            vaBytesStream.Position := 0;
                            DMChat.cdsMensagemTHUMBNAIL.LoadFromStream(vaBytesStream);
                          finally
                            FreeAndNil(vaBytesStream);
                          end;
                        end;

                      DMChat.cdsMensagemNOME_REMETENTE.AsString := DMChat.cdsMensagem_AuxNOME_REMETENTE.AsString;
                      DMChat.cdsMensagemNOME_DESTINATARIO.AsString := DMChat.cdsMensagem_AuxNOME_DESTINATARIO.AsString;
                      DMChat.cdsMensagemUSUARIO_GRUPO_DESTINATARIO.AsInteger := DMChat.cdsMensagem_AuxUSUARIO_GRUPO_DESTINATARIO.AsInteger;

                      DMChat.cdsMensagem.Post;
                      DMChat.cdsMensagem_Aux.Next;
                    end;

                  // Adicionando os anexos
                  while not DMChat.cdsMensagem_Anexo_Aux.Eof do
                    begin
                      if not(DMChat.cdsMensagem_Anexo.State in [dsEdit, dsInsert]) then
                        DMChat.cdsMensagem_Anexo.Append;

                      DMChat.cdsMensagem_AnexoCODIGO.AsInteger := DMChat.cdsMensagem_Anexo_AuxCODIGO.AsInteger;
                      DMChat.cdsMensagem_AnexoCODIGO_MENSAGEM.AsInteger := DMChat.cdsMensagem_Anexo_AuxCODIGO_MENSAGEM.AsInteger;
                      DMChat.cdsMensagem_AnexoENDERECO_ANEXO.AsString := DMChat.cdsMensagem_Anexo_AuxENDERECO_ANEXO.AsString;
                      DMChat.cdsMensagem_AnexoTAMANHO_KB.AsInteger := DMChat.cdsMensagem_Anexo_AuxTAMANHO_KB.AsInteger;
                      DMChat.cdsMensagem_AnexoEXTENSAO.AsString := DMChat.cdsMensagem_Anexo_AuxEXTENSAO.AsString;

                      if DMChat.cdsMensagem_Anexo_AuxTHUMBNAIL.isNull then
                        DMChat.cdsMensagem_AnexoTHUMBNAIL.Clear
                      else
                        begin
                          try
                            vaBytesStream := TBytesStream.Create;
                            DMChat.cdsMensagem_Anexo_AuxTHUMBNAIL.SaveToStream(vaBytesStream);
                            vaBytesStream.Position := 0;
                            DMChat.cdsMensagem_AnexoTHUMBNAIL.LoadFromStream(vaBytesStream);
                          finally
                            FreeAndNil(vaBytesStream);
                          end;
                        end;

                      DMChat.cdsMensagem_AnexoDATA_HORA_ENVIO.AsDateTime := DMChat.cdsMensagem_Anexo_AuxDATA_HORA_ENVIO.AsDateTime;
                      DMChat.cdsMensagem_AnexoNOME_REMETENTE.AsString := DMChat.cdsMensagem_Anexo_AuxNOME_REMETENTE.AsString;
                      DMChat.cdsMensagem_Anexo.Post;
                      DMChat.cdsMensagem_Anexo_Aux.Next;
                    end;

                  // Armazenado os novos dados
                  vaDadosConversa := FDadosConversas.Items[vaIdentificador];
                  vaDadosConversa.Mensagens := DMChat.cdsMensagem.Data;
                  vaDadosConversa.Anexos := DMChat.cdsMensagem_Anexo.Data;
                  FDadosConversas.Items[vaIdentificador] := vaDadosConversa;
                finally
                  if DMChat.cdsMensagem.Active then
                    begin
                      DMChat.cdsMensagem.EmptyDataSet;
                      DMChat.cdsMensagem.Close;
                    end;

                  if DMChat.cdsMensagem_Aux.Active then
                    begin
                      DMChat.cdsMensagem_Aux.EmptyDataSet;
                      DMChat.cdsMensagem_Aux.Close;
                    end;

                  if DMChat.cdsMensagem_Anexo.Active then
                    begin
                      DMChat.cdsMensagem_Anexo.EmptyDataSet;
                      DMChat.cdsMensagem_Anexo.Close;
                    end;

                  if DMChat.cdsMensagem_Anexo_Aux.Active then
                    begin
                      DMChat.cdsMensagem_Anexo_Aux.EmptyDataSet;
                      DMChat.cdsMensagem_Anexo_Aux.Close;
                    end;
                end;

                // Se a conversa estiver selecionada, ent�o vamos adicionar a nova mensagem no RichViewEdit
                if Assigned(FChatPanelSelecionado) and (FChatPanelSelecionado.Identificador = vaIdentificador) and (FChatPanelSelecionado.TipoAba in [TChatTipoAba.taConversaGrupo, TChatTipoAba.taConversaUsuario]) then
                  ppvPreencherRichViewEdit(vaMensagem, rveMensagens, vaIdentificador, -1, False); // Scroll = -1 rola at� o final da p�gina
              end;
          end;
      end;
  finally
    FSecaoCriticaBancoDadosConversas.Release;
    FSecaoCriticaBancoDadosUsuarios.Release;
  end;
end;

procedure TfrmChatTela.ppuNovaMensagemModal(const ipCodigoMensagem,
  ipCodigoRemetente, ipCodigoHospital, ipCodigoDestinatario: Integer);
var
  vaIdentificador, vaDadosMensagem: string;
  vaArray: System.TArray<string>;
begin
  vaIdentificador := TChatFuncoes.fpuMontaIdentificador(ipCodigoRemetente, ipCodigoHospital);
  FSecaoCriticaUsuarioLogado.Enter;

  if FUsuarioLogado.Count = 0 then
    begin
      FSecaoCriticaUsuarioLogado.Release;
      vaDadosMensagem := IntToStr(ipCodigoMensagem) + ';' + IntToStr(ipCodigoRemetente) + ';' + IntToStr(ipCodigoHospital) + ';' + IntToStr(ipCodigoDestinatario);

      if FConversasModal.ContainsKey(vaIdentificador) then
        begin
          vaArray := FConversasModal.Items[vaIdentificador];
          SetLength(vaArray, Length(vaArray) + 1);
          vaArray[Length(vaArray) - 1] := vaDadosMensagem;
          FConversasModal.Items[vaIdentificador] := vaArray;
        end
      else
        FConversasModal.Add(vaIdentificador, [vaDadosMensagem]);
    end
  else
    begin
      FSecaoCriticaUsuarioLogado.Release;
      ppuNovaMensagem(ipCodigoMensagem, ipCodigoRemetente, ipCodigoHospital, ipCodigoDestinatario, True);
    end;
end;

procedure TfrmChatTela.ppuNovaMensagemModalLock;
begin
  FSecaoCriticaNovaMensagemModal.Enter;
end;

procedure TfrmChatTela.ppuNovaMensagemModalUnlock;
begin
  FSecaoCriticaNovaMensagemModal.Release;
end;

procedure TfrmChatTela.ppuRemoverProgressaoUpLoad(const ipNome: string);
var
  vaChatPanelBarraProgresso: TChatPanelBarraProgresso;
begin
  FSecaoCriticaProgressaoUpLoad.Enter;

  try
    vaChatPanelBarraProgresso := TChatPanelBarraProgresso(slbEnvioMensagens.FindComponent(ipNome));

    if Assigned(vaChatPanelBarraProgresso) then
      FreeAndNil(vaChatPanelBarraProgresso);

    pnlDadosConversaEnvioMensagem.Visible := slbEnvioMensagens.ComponentCount > 0;
  finally
    FSecaoCriticaProgressaoUpLoad.Release;
  end;
end;

procedure TfrmChatTela.ppuUsuarioLogado(Const ipIdUsuario: TChatUsuarioLogado);
var
  vaUsuarioLogado: TChatUsuarioLogado;
  vaConversasModal: TDictionary < string, System.TArray < string >>.TPairEnumerator;
  vaArray: System.TArray<string>;
  vaDadosNovaMensagem: TMatchCollection;
  vaDadosArray: string;
  vaConfiguracao: TChatConfiguracoes;
begin
  FSecaoCriticaUsuarioLogado.Enter;

  try
    if DMChat.cdsUsuarios.Locate('CODIGO;CODIGO_HOSPITAL', VarArrayOf([ipIdUsuario.IdentificacaoUsuario.CodigoUsuario, ipIdUsuario.IdentificacaoUsuario.CodigoHospital]), []) then
      begin
        vaUsuarioLogado.IdentificacaoUsuario.CodigoHospital := ipIdUsuario.IdentificacaoUsuario.CodigoHospital;
        vaUsuarioLogado.IdentificacaoUsuario.CodigoUsuario := ipIdUsuario.IdentificacaoUsuario.CodigoUsuario;
        vaUsuarioLogado.EnviaMensagemGrupoTodos := ipIdUsuario.EnviaMensagemGrupoTodos;
        FUsuarioLogado.AddOrSetValue(ipIdUsuario.IdentificacaoUsuario.CodigoHospital, vaUsuarioLogado);
      end
    else
      begin
        if FUsuarioLogado.ContainsKey(ipIdUsuario.IdentificacaoUsuario.CodigoHospital) then
          FUsuarioLogado.Remove(ipIdUsuario.IdentificacaoUsuario.CodigoHospital);
      end;
  finally
    FSecaoCriticaUsuarioLogado.Release;
  end;

  // Carregando as configura��es do usu�rio
  vaConfiguracao := FAoPesquisarConfiguracoes(ipIdUsuario.IdentificacaoUsuario);

  if Assigned(vaConfiguracao) then
    begin
      FConfiguracao.ppuCopiarDe(vaConfiguracao);
      fpuAtualizarConfiguracoes(FConfiguracao);
    end;

  // Atualizando os dado do usu�rio na tela
  ppvAtualizarDadosUsuarioLogado;

  // Verificando se existem conversas para abrir, caso esteja em modal
  if (fsModal in Self.FormState) then
    begin
      FSecaoCriticaNovaMensagemModal.Enter;

      try
        if (FConversasModal.Count > 0) then
          begin
            vaConversasModal := FConversasModal.GetEnumerator;

            while vaConversasModal.MoveNext do
              begin
                vaArray := vaConversasModal.Current.Value;

                for vaDadosArray in vaArray do
                  begin
                    vaDadosNovaMensagem := TRegEx.Matches(vaDadosArray, '\d{1,}', []);
                    ppuNovaMensagem(
                      StrToInt(vaDadosNovaMensagem.Item[0].Value),
                      StrToInt(vaDadosNovaMensagem.Item[1].Value),
                      StrToInt(vaDadosNovaMensagem.Item[2].Value),
                      StrToInt(vaDadosNovaMensagem.Item[3].Value),
                      True);
                  end;
              end;

            FConversasModal.Clear;
          end;

        if (slbConversasListaUsuarios.ComponentCount > 0) and (slbConversasListaUsuarios.Components[0] is TChatPanelConversaAba) then
          TChatPanelConversaAba(slbConversasListaUsuarios.Components[0]).Selecionado := True;
      finally
        FSecaoCriticaNovaMensagemModal.Release;
      end;
    end;
end;

procedure TfrmChatTela.ppvAbrirTelaPesqUsuario;
begin
  if pnlPesquisa.Visible then
    begin
      if DMChat.BalloonHint1.ShowingHint then
        DMChat.BalloonHint1.HideHint;

      DMChat.cdsUsuarios.DisableControls;
      DMChat.cdsUsuarios.IndexFieldNames := 'NOME;CODIGO;CODIGO_HOSPITAL';
      DMChat.cdsUsuarios.EnableControls;

      DMChat.cdsGrupos.DisableControls;
      DMChat.cdsGrupos.IndexFieldNames := 'NOME;CODIGO;CODIGO_HOSPITAL';
      DMChat.cdsGrupos.EnableControls;

      // Este c�digo faz com que n�o apare�a aba no dock site, pois heigth � muito pequeno, ent�o a aba n�o fica vis�vel
      dockSitePesqUsuarios.AutoSize := False;
      dockSitePesqUsuarios.Height := 1;
      dockSitePesqUsuarios.Visible := True;

      // Ativando o dock panel
      dockPanelPesqUsuarios.Visible := True;
      dockPanelPesqUsuarios.Activate;

      if (not VarIsNull(EditPesquisaUsuario.EditingText)) and (Trim(EditPesquisaUsuario.EditingText) <> '') then
        EditNomeUsuario.EditingText := EditPesquisaUsuario.EditingText;

      if not VarIsNull(EditNomeUsuario.EditValue) then
        EditNomeUsuario.SelStart := Length(EditNomeUsuario.EditingText);

      EditPesquisaUsuario.Clear;
    end;
end;

procedure TfrmChatTela.ppvAcAnexar(Sender: TObject);
begin
  DMChat.OpenDialog1.Filter := '';
  DMChat.OpenDialog1.Options := [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing];

  if DMChat.OpenDialog1.Execute then
    ppvAnexarArquivos(DMChat.OpenDialog1.Files);

  if rveMensagensEdit.Showing and rveMensagensEdit.Visible then
    rveMensagensEdit.SetFocus;
end;

procedure TfrmChatTela.ppvAcConfigCapturarImagem(Sender: TObject);
begin
  if Assigned(FAoCapturarImagem) then
    FAoCapturarImagem(Self);
end;

procedure TfrmChatTela.ppvAcConfigGravar(Sender: TObject);
var
  vaUsuarioLogado: TDictionary<Integer, TChatUsuarioLogado>.TPairEnumerator;
begin
  // Dados do usu�rio
  FConfiguracao.EMail := EditConfigEMail.EditValue;
  FConfiguracao.Telefone := EditConfigTelefone.EditValue;
  FConfiguracao.Foto := imgConfigFotoUsuario.Picture;

  // Configura��es de fonte
  if (not VarIsNull(cbConfigFonteNome.EditValue)) and (cbConfigFonteNome.EditValue <> '') then
    FConfiguracao.FonteNome := cbConfigFonteNome.EditValue;

  EditConfigFonteTamanho.PostEditValue;
  FConfiguracao.FonteTamanho := EditConfigFonteTamanho.EditValue;

  // Outras configura��es
  FConfiguracao.NovasMensagensApenasAlerta := rgConfigNovaMensagemApenasAlerta.EditValue;

  // Atulizando as configura��es e gravando no banco
  fpuAtualizarConfiguracoes(FConfiguracao);
  FChatPanelSelecionado.Close;

  if Assigned(FAoSalvarConfiguracoes) then
    begin
      vaUsuarioLogado := FUsuarioLogado.GetEnumerator;

      while vaUsuarioLogado.MoveNext do
        FAoSalvarConfiguracoes(FConfiguracao, vaUsuarioLogado.Current.Value.IdentificacaoUsuario);
    end;
end;

procedure TfrmChatTela.ppvAcConfigPegarArquivoImagem(Sender: TObject);
var
  vaBytesStream: TBytesStream;
  vaGraphic: TGraphic;
begin
  vaBytesStream := nil;
  vaGraphic := nil;

  DMChat.OpenDialog1.Filter := 'Imagens|*.bmp;*.gif;*.ico;*.jpeg;*.jpg;*.png;*.tiff|BMP|*.bmp|GIF|*.gif|ICO|*.ico|JPG|*.jpeg;*.jpg|PNG|*.png|TIFF|*.tiff';
  DMChat.OpenDialog1.Options := [ofHideReadOnly, ofEnableSizing];

  if (DMChat.OpenDialog1.Execute) and FileExists(Trim(DMChat.OpenDialog1.Files.Text)) then
    begin
      try
        vaBytesStream := TBytesStream.Create;
        vaBytesStream.LoadFromFile(Trim(DMChat.OpenDialog1.Files.Text));
        vaBytesStream.Position := 0;
        vaGraphic := TChatFuncoes.fpuImagemTamanhoMaximo(vaBytesStream, 256, 256);
        imgConfigFotoUsuario.Picture.Graphic := vaGraphic;
      finally
        if Assigned(vaBytesStream) then
          FreeAndNil(vaBytesStream);

        if Assigned(vaGraphic) then
          FreeAndNil(vaGraphic);
      end;
    end;
end;

procedure TfrmChatTela.ppvAcConfigRestaurar(Sender: TObject);
var
  i, vaIndiceApenasAlerta: Integer;
begin
  // Dados do usu�rio
  EditConfigEMail.EditValue := FConfiguracao.EMail;
  EditConfigTelefone.EditValue := FConfiguracao.Telefone;
  imgConfigFotoUsuario.Picture := FConfiguracao.Foto;

  // Configura��es de fonte
  cbConfigFonteNome.EditValue := FConfiguracao.FonteNome;
  EditConfigFonteTamanho.EditValue := FConfiguracao.FonteTamanho;

  // Outras configura��es

  // Alerta de mensagens
  // 0|null - tela em modal completa
  // 1 - apenas alerta
  // 2 - modal resumida

  vaIndiceApenasAlerta := -1;
  i := 0;

  while (i < rgConfigNovaMensagemApenasAlerta.Properties.Items.Count) and (vaIndiceApenasAlerta < 0) do
    begin
      if rgConfigNovaMensagemApenasAlerta.Properties.Items[i].Value = 1 then
        vaIndiceApenasAlerta := i;

      Inc(i);
    end;

  if FConfiguracao.PermitirAlterarAlertaMensagens then
    rgConfigNovaMensagemApenasAlerta.Properties.Items[vaIndiceApenasAlerta].Caption := 'Apenas alerta'
  else
    begin
      rgConfigNovaMensagemApenasAlerta.Properties.Items[vaIndiceApenasAlerta].Caption := 'Apenas alerta (Sem permiss�o)';

      if FConfiguracao.NovasMensagensApenasAlerta = 1 then
        FConfiguracao.NovasMensagensApenasAlerta := 0;
    end;

  rgConfigNovaMensagemApenasAlerta.EditValue := FConfiguracao.NovasMensagensApenasAlerta;
  rgConfigNovaMensagemApenasAlerta.Controls[vaIndiceApenasAlerta].Enabled := FConfiguracao.PermitirAlterarAlertaMensagens;
end;

procedure TfrmChatTela.ppvAcConfiguracao(Sender: TObject);
var
  vaChatPanelConversaAba: TChatPanelConversaAba;
  vaIcon: TIcon;
  vaBytesStream: TBytesStream;
  vaGraphic: TGraphic;
  vaPicture: TPicture;
  vaFontes: TStringList;
  vaFonte: string;
  vaComboBoxItem: TcxImageComboBoxItem;
  vaConfiguracao: TChatConfiguracoes;
  vaUsuarioLogado: TDictionary<Integer, TChatUsuarioLogado>.TPairEnumerator;
begin
  // Pesquisando a conversa para saber se ela est� no painel de conversas ou se tem que adicion�-la
  vaChatPanelConversaAba := TChatPanelConversaAba(slbConversasListaUsuarios.FindComponent('pnlConfiguracoes'));

  if not Assigned(vaChatPanelConversaAba) then
    begin
      // A tela de configura��o ainda n�o existe, ent�o vamos cri�-la

      // Carregando as fontes dispon�veis
      try
        vaFontes := TUtils.fpuPegarFontesComputador;
        cbConfigFonteNome.Properties.Items.Clear;

        for vaFonte in vaFontes do
          begin
            if TRegEx.IsMatch(vaFonte, '^[a-z]', [roSingleLine, roIgnoreCase]) then
              begin
                vaComboBoxItem := cbConfigFonteNome.Properties.Items.Add;
                vaComboBoxItem.Description := vaFonte;
                vaComboBoxItem.Value := vaFonte;
              end;
          end;
      finally
        if Assigned(vaFontes) then
          FreeAndNil(vaFontes);
      end;

      // Pesquisando as configura��es
      if Assigned(FAoPesquisarConfiguracoes) then
        begin
          vaUsuarioLogado := FUsuarioLogado.GetEnumerator;
          vaUsuarioLogado.MoveNext;

          // N�o pode dar "Free" na vari�vel vaConfiguracao porque ela veio do server e o DataSnap j� faz
          // isso, ent�o se der "Free" vai gerar um erro
          vaConfiguracao := FAoPesquisarConfiguracoes(vaUsuarioLogado.Current.Value.IdentificacaoUsuario);

          if Assigned(vaConfiguracao) then
            begin
              FConfiguracao.EMail := vaConfiguracao.EMail;
              FConfiguracao.FonteNome := vaConfiguracao.FonteNome;
              FConfiguracao.FonteTamanho := vaConfiguracao.FonteTamanho;
              FConfiguracao.NovasMensagensApenasAlerta := vaConfiguracao.NovasMensagensApenasAlerta;
              FConfiguracao.PermitirAlterarAlertaMensagens := vaConfiguracao.PermitirAlterarAlertaMensagens;
              FConfiguracao.Telefone := vaConfiguracao.Telefone;

              vaGraphic := nil;
              vaPicture := nil;

              if Assigned(vaConfiguracao.Foto) then
                begin
                  try
                    vaGraphic := TChatFuncoes.fpuImagemTamanhoMaximo(vaConfiguracao.Foto.Graphic, 256, 256);
                    vaPicture := TPicture.Create;
                    vaPicture.Graphic := vaGraphic;
                    FConfiguracao.Foto := vaPicture;
                  finally
                    if Assigned(vaGraphic) then
                      FreeAndNil(vaGraphic);

                    if Assigned(vaPicture) then
                      FreeAndNil(vaPicture);
                  end;
                end;
            end;
        end;

      // Criando o panel e definindo suas caracter�sticas. Este panel ser� uma a "guia do usu�rio" na tela
      vaChatPanelConversaAba := TChatPanelConversaAba.Create(slbConversasListaUsuarios);
      vaChatPanelConversaAba.Align := alTop;
      vaChatPanelConversaAba.Visible := False;
      vaChatPanelConversaAba.Name := 'pnlConfiguracoes';
      vaChatPanelConversaAba.Identificador := '';
      vaChatPanelConversaAba.Parent := TWinControl(slbConversasListaUsuarios);
      vaChatPanelConversaAba.Top := slbConversasListaUsuarios.ComponentCount * vaChatPanelConversaAba.Height;
      vaChatPanelConversaAba.Visible := True;
      vaChatPanelConversaAba.Selecionado := True;
      vaChatPanelConversaAba.OnClose := ppvFecharConversa;
      vaChatPanelConversaAba.OnChangeSelect := ppvAcConfiguracao;
      vaChatPanelConversaAba.TextoSuperior := 'Configura��es';
      vaChatPanelConversaAba.TipoAba := TChatTipoAba.taConfiguracao;
      vaChatPanelConversaAba.Status := -1;
      vaChatPanelConversaAba.ppuImagemBotaoFechar(DMChat.ImgListBotoes16x16, 0);
      vaChatPanelConversaAba.SelecionarCtrlPermitido := False;

      vaIcon := TIcon.Create;
      vaBytesStream := TBytesStream.Create;
      vaGraphic := TGraphicClass(Vcl.Graphics.TIcon).Create;

      try
        DMChat.ImgListBotoes32x32.GetIcon(2, vaIcon);
        vaIcon.SaveToStream(vaBytesStream);
        vaBytesStream.Position := 0;
        vaGraphic.LoadFromStream(vaBytesStream);
        vaChatPanelConversaAba.FotoThumbnail.Graphic := vaGraphic;
      finally
        FreeAndNil(vaIcon);
        FreeAndNil(vaBytesStream);
        FreeAndNil(vaGraphic);
      end;

      // Posicionando a barra de rolagem no lugar do novo panel
      if (vaChatPanelConversaAba.Top + vaChatPanelConversaAba.Height) > slbConversasListaUsuarios.Height then
        slbConversasListaUsuarios.VertScrollBar.Position := slbConversasListaUsuarios.VertScrollBar.Range;
    end;

  // Se foi chamado pelo action, ent�o vamos selecion�-lo, caso n�o esteja selecionado
  if (not vaChatPanelConversaAba.Selecionado) and (not(Sender is TChatPanel)) then
    vaChatPanelConversaAba.Selecionado := True;

  // Verificando se a tela de configura��o foi selecionada
  if vaChatPanelConversaAba.Selecionado and ((not Assigned(FChatPanelSelecionado)) or (FChatPanelSelecionado <> vaChatPanelConversaAba)) then
    begin
      if Assigned(FChatPanelSelecionado) then
        FChatPanelSelecionado.Selecionado := False;

      FChatPanelSelecionado := vaChatPanelConversaAba;

      // Selecionando a aba de configura��es
      pgcPrincipal.ActivePage := TabConfiguracao;

      if EditConfigEMail.Showing and EditConfigEMail.Visible then
        EditConfigEMail.SetFocus;
    end;

  // Carregando as configura��es para a tela
  ppvAcConfigRestaurar(Self);
end;

procedure TfrmChatTela.ppvAcEnviar(Sender: TObject);
var
  i, p: Integer;
  vaPicture: TPicture;
  vaBytesStream: TBytesStream;
  vaUsuarioSelecionado: Boolean;
  vaUsuarioLogado: TChatUsuarioLogado;
  vaDestinatarios: TArray<TChatDadosUsuario>;
  vaChatPanelSelecionadoCtrl: TDictionary<string, TChatPanelConversaAba>.TPairEnumerator;
begin
  if fpvUsuarioLogado(TChatFuncoes.fpuCodigoHospital(FChatPanelSelecionado.Identificador), vaUsuarioLogado) and
    (vaUsuarioLogado.IdentificacaoUsuario.CodigoHospital = FChatPanelSelecionado.Mensagem.Remetente.CodigoHospital) and
    (vaUsuarioLogado.IdentificacaoUsuario.CodigoUsuario = FChatPanelSelecionado.Mensagem.Remetente.CodigoUsuario) then
    begin
      if DMChat.cdsUsuarios.Locate('CODIGO;CODIGO_HOSPITAL', TChatFuncoes.fpuCodigosUsuarioHospital(FChatPanelSelecionado.Identificador), []) then
        begin
          if DMChat.cdsUsuariosCODIGO.AsInteger = FCodigoUsuarioSistema then
            begin
              MessageTela('Usu�rio do sistema. A mensagem n�o pode ser enviada.' + sLineBreak + 'Este usu�rio � exclusivo para recebimento de mensagens do sistema.');
              Exit;
            end
          else
            begin
              if DMChat.cdsUsuariosATIVO_INATIVO.AsInteger = 1 then
                begin
                  MessageTela('Usu�rio inativo. A mensagem n�o pode ser enviada.');
                  Exit;
                end
              else
                begin
                  if (not vaUsuarioLogado.EnviaMensagemGrupoTodos) and ((DMChat.cdsUsuariosTIPO_PAPEL.AsInteger = Ord(TTiposPapeis.tpUsuarioSistema)) or pnlEnviarMensagemUsuariosConectados.Visible) then
                    begin
                      if DMChat.cdsUsuariosNOME.AsString = 'TODOS' then
                        MessageTela('Usu�rio sem permiss�o para enviar mensagem para o grupo "Todos"')
                      else
                        begin
                          MessageTela('Usu�rio sem permiss�o para enviar mensagem para o grupo "Todos".' + sLineBreak +
                            'Para enviar mensagem para todos os usu�rios logados � necess�rio' + sLineBreak +
                            'ter permiss�o para enviar mensagem para o grupo "Todos".');
                        end;

                      Exit;
                    end;
                end;
            end;
        end
      else
        begin
          MessageTela('Usu�rio n�o localizado.');
          Exit;
        end;

      // Convertendo os smileys em texto
      TChatFuncoes.ppuConverterSmileysParaTexto(rveMensagensEdit);

      // Salvando a mensagem para envi�-la
      vaBytesStream := TBytesStream.Create;

      try
        rveMensagensEdit.SaveRVFToStream(vaBytesStream, False);
        FChatPanelSelecionado.Mensagem.MensagemRVF := vaBytesStream;
      finally
        FreeAndNil(vaBytesStream);
      end;

      if (FChatPanelSelecionado.Mensagem.AnexosQtde = 0) and (Trim(FChatPanelSelecionado.Mensagem.MensagemTXT) = '') then
        begin
          rveMensagensEdit.SetFocus;
          Exit;
        end;

      // Enviando a mensagem
      if Assigned(FAoEnviarMensagem) then
        begin
          // Enviando a mensagem para o destinat�rio
          SetLength(vaDestinatarios, 1);
          i := 0;
          vaDestinatarios[i] := TChatDadosUsuario.Create;
          vaDestinatarios[i].FotoUsuario := FChatPanelSelecionado.FotoThumbnail;
          vaDestinatarios[i].Identificacao.ppuCopiarDe(FChatPanelSelecionado.Mensagem.Destinatario);
          vaDestinatarios[i].Nome := FChatPanelSelecionado.TextoSuperior;

          vaChatPanelSelecionadoCtrl := FChatPanelSelecionadoCtrl.GetEnumerator;

          // Enviando a mensagem para todos os usu�rios ativos
          if pnlEnviarMensagemUsuariosConectados.Visible then
            begin
              FSecaoCriticaBancoDadosUsuarios.Enter;
              DMChat.cdsUsuarios.DisableControls;

              try
                DMChat.cdsUsuarios.Filtered := False;
                DMChat.cdsUsuarios.Filter := 'status = 1 and usuario_grupo = 0 and codigo_hospital = ' + IntToStr(FChatPanelSelecionado.Mensagem.Remetente.CodigoHospital);
                DMChat.cdsUsuarios.Filtered := True;
                DMChat.cdsUsuarios.First;

                while not DMChat.cdsUsuarios.Eof do
                  begin
                    SetLength(vaDestinatarios, i + 1);
                    vaDestinatarios[i] := TChatDadosUsuario.Create;

                    if DMChat.cdsUsuariosFOTO_THUMBNAIL_AJUSTAR.AsInteger = 1 then
                      ppvAjustarImagem(DMChat.cdsUsuarios, False, True);

                    vaBytesStream := nil;
                    vaPicture := nil;

                    try
                      if not DMChat.cdsUsuariosFOTO_THUMBNAIL.isNull then
                        begin
                          vaBytesStream := TBytesStream.Create;
                          DMChat.cdsUsuariosFOTO_THUMBNAIL.SaveToStream(vaBytesStream);
                          vaBytesStream.Position := 0;
                          vaPicture := fpuRetornaImagem(vaBytesStream);

                          if Assigned(vaPicture) then
                            vaDestinatarios[i].FotoUsuario := vaPicture
                          else
                            begin
                              vaPicture := TPicture.Create;
                              vaPicture.Assign(DMChat.ImgCollectionItemUsuario.Picture);
                            end;
                        end
                      else
                        begin
                          vaPicture := TPicture.Create;
                          vaPicture.Assign(DMChat.ImgCollectionItemUsuario.Picture);
                        end;
                    finally
                      if Assigned(vaBytesStream) then
                        FreeAndNil(vaBytesStream);

                      if Assigned(vaPicture) then
                        FreeAndNil(vaPicture);
                    end;

                    vaDestinatarios[i].Identificacao.CodigoHospital := DMChat.cdsUsuariosCODIGO_HOSPITAL.AsInteger;
                    vaDestinatarios[i].Identificacao.CodigoUsuario := DMChat.cdsUsuariosCODIGO.AsInteger;
                    vaDestinatarios[i].Nome := DMChat.cdsUsuariosNOME.AsString;
                    Inc(i);
                  end;
              finally
                DMChat.cdsUsuarios.Filtered := False;
                DMChat.cdsUsuarios.Filter := '';
                DMChat.cdsUsuarios.EnableControls;
                FSecaoCriticaBancoDadosUsuarios.Release;
              end;
            end;

          // Enviando a mensagem para todos os usu�rios selecionados na lista de usu�rios
          while vaChatPanelSelecionadoCtrl.MoveNext do
            begin
              begin
                vaUsuarioSelecionado := False;
                p := 0;

                while (p <= i) and (not vaUsuarioSelecionado) do
                  begin
                    vaUsuarioSelecionado :=
                      (vaDestinatarios[p].Identificacao.CodigoHospital = vaChatPanelSelecionadoCtrl.Current.Value.Mensagem.Destinatario.CodigoHospital) and
                      (vaDestinatarios[p].Identificacao.CodigoUsuario = vaChatPanelSelecionadoCtrl.Current.Value.Mensagem.Destinatario.CodigoUsuario);
                    Inc(p);
                  end;

                if not vaUsuarioSelecionado then
                  begin
                    SetLength(vaDestinatarios, i + 1);
                    vaDestinatarios[i] := TChatDadosUsuario.Create;
                    vaDestinatarios[i].FotoUsuario := vaChatPanelSelecionadoCtrl.Current.Value.FotoThumbnail;
                    vaDestinatarios[i].Identificacao.ppuCopiarDe(vaChatPanelSelecionadoCtrl.Current.Value.Mensagem.Destinatario);
                    vaDestinatarios[i].Nome := vaChatPanelSelecionadoCtrl.Current.Value.TextoSuperior;
                    Inc(i);
                  end;

                vaChatPanelSelecionadoCtrl.Current.Value.SelecionadoCtrl := False;
              end;
            end;

          FAoEnviarMensagem(FChatPanelSelecionado.Mensagem, vaDestinatarios);
        end;

      // Limpando a lista de destinatarios
      for i := Low(vaDestinatarios) to High(vaDestinatarios) do
        begin
          if Assigned(vaDestinatarios[i]) then
            FreeAndNil(vaDestinatarios[i]);
        end;

      // Limpando a mensagem
      FChatPanelSelecionado.Mensagem.ppuLimparAnexos;
      FChatPanelSelecionado.Mensagem.ppuLimparMensagem;
      rveMensagensEdit.Clear;
      rveMensagensEdit.Change;
      rveMensagensEdit.Format;

      // Limpando os anexos da conversa
      while slbAnexos.ComponentCount > 0 do
        slbAnexos.Components[0].Free;

      // Fechando o panel dos anexos e avisos
      ppvPanelConversaAnexosVisivel(False);
      ppvPanelEnviarMensagemUsuariosConectados(False);

      // Voltando o foco para o edit da mensagem
      rveMensagensEdit.SetFocus;
    end
  else
    begin
      if (vaUsuarioLogado.IdentificacaoUsuario.CodigoHospital <> FChatPanelSelecionado.Mensagem.Remetente.CodigoHospital) or
        (vaUsuarioLogado.IdentificacaoUsuario.CodigoUsuario <> FChatPanelSelecionado.Mensagem.Remetente.CodigoUsuario) then
        MessageTela('O usu�rio logado est� diferente do usu�rio remetente da mensagem.' + sLineBreak + 'A mensagem n�o foi enviada.')
      else
        MessageTela('O usu�rio logado n�o foi localizado.' + sLineBreak + 'A mensagem n�o foi enviada.');
    end;
end;

procedure TfrmChatTela.ppvAcPesquisarConversa(Sender: TObject);
  procedure plcPreencherCaptionMenu(const ipDadosPesquisa: TChatDadosPesquisa; ipAction: TAction);
  begin
    ipAction.Caption := ipDadosPesquisa.NomeUsuario;

    if ipDadosPesquisa.Texto <> '' then
      ipAction.Caption := ipAction.Caption + ' | ' + ipDadosPesquisa.Texto;

    if ipDadosPesquisa.PesquisarData then
      ipAction.Caption := ipAction.Caption + ' | ' + DateToStr(ipDadosPesquisa.DataInicial) + ' � ' + DateToStr(ipDadosPesquisa.DataFinal);
  end;

var
  vaChatPanelConversaAba, vaChatPanelConversaAbaSelecionado: TChatPanelConversaAba;
  vaIdUsuarioConversa: TChatIdentificacaoUsuario;
  vaDataInicial, vaDataFinal: TDate;
  vaTipoPesquisa: TChatTipoPesquisa;
  vaIcon: TIcon;
  vaBytesStream: TBytesStream;
  vaGraphic: TGraphic;
  vaMensagens, vaAnexos: OleVariant;
  vaDadosConversa: TChatDadosConversa;
  vaDadosPesquisa: TChatDadosPesquisa;
  vaDadosPesquisaPairEnumerator: TDictionary<string, TChatDadosPesquisa>.TPairEnumerator;
  vaChatTelaPesquisa: TfrmChatTelaPesquisa;
  vaMatchCollection: TMatchCollection;
  vaAction: TAction absolute Sender;
begin
  vaDadosPesquisa := nil;
  vaChatTelaPesquisa := nil;
  vaChatPanelConversaAbaSelecionado := nil;
  FSecaoCriticaBancoDadosUsuarios.Enter;
  FSecaoCriticaBancoDadosConversas.Enter;

  try
    // Pesquisando a conversa para saber se ela est� no painel de conversas ou se tem que adicion�-la
    vaChatPanelConversaAba := TChatPanelConversaAba(slbConversasListaUsuarios.FindComponent('pnlPesquisa'));

    if not Assigned(vaChatPanelConversaAba) then
      begin
        // Criando o panel e definindo suas caracter�sticas. Este panel ser� uma a "guia do usu�rio" na tela
        vaChatPanelConversaAba := TChatPanelConversaAba.Create(slbConversasListaUsuarios);
        vaChatPanelConversaAba.Align := alTop;
        vaChatPanelConversaAba.Visible := False;
        vaChatPanelConversaAba.Name := 'pnlPesquisa';
        vaChatPanelConversaAba.Identificador := '';
        vaChatPanelConversaAba.Parent := TWinControl(slbConversasListaUsuarios);
        vaChatPanelConversaAba.Top := slbConversasListaUsuarios.ComponentCount * vaChatPanelConversaAba.Height;
        vaChatPanelConversaAba.Visible := True;
        vaChatPanelConversaAba.Selecionado := True;
        vaChatPanelConversaAba.OnClose := ppvFecharConversa;
        vaChatPanelConversaAba.OnChangeSelect := ppvAcPesquisarConversa;
        vaChatPanelConversaAba.TextoSuperior := 'Resultado da';
        vaChatPanelConversaAba.TextoInferior := 'Pesquisa';
        vaChatPanelConversaAba.TipoAba := TChatTipoAba.taPesquisa;
        vaChatPanelConversaAba.Status := -1;
        vaChatPanelConversaAba.ppuImagemBotaoFechar(DMChat.ImgListBotoes16x16, 0);
        vaChatPanelConversaAba.SelecionarCtrlPermitido := False;

        lblDadosPesquisaLinha1.Caption := '';
        lblDadosPesquisaLinha1.Visible := False;
        lblDadosPesquisaLinha2.Caption := '';
        lblDadosPesquisaLinha2.Visible := False;

        vaIcon := TIcon.Create;
        vaBytesStream := TBytesStream.Create;
        vaGraphic := TGraphicClass(Vcl.Graphics.TIcon).Create;

        try
          DMChat.ImgListBotoes32x32.GetIcon(3, vaIcon);
          vaIcon.SaveToStream(vaBytesStream);
          vaBytesStream.Position := 0;
          vaGraphic.LoadFromStream(vaBytesStream);
          vaChatPanelConversaAba.FotoThumbnail.Graphic := vaGraphic;
        finally
          FreeAndNil(vaIcon);
          FreeAndNil(vaBytesStream);
          FreeAndNil(vaGraphic);
        end;

        // Posicionando a barra de rolagem no lugar do novo panel
        if (vaChatPanelConversaAba.Top + vaChatPanelConversaAba.Height) > slbConversasListaUsuarios.Height then
          slbConversasListaUsuarios.VertScrollBar.Position := slbConversasListaUsuarios.VertScrollBar.Range;
      end;

    // Foi chamado por um action de pesquisa j� realizada
    if (Sender is TAction) and TRegEx.IsMatch(vaAction.Name, '^Ac_UltimasPesquisas\d{1,}$', [roIgnoreCase]) and FDadosUltimasPesquisas.ContainsKey(vaAction.Name) then
      begin
        vaDadosPesquisa := FDadosUltimasPesquisas.Items[vaAction.Name];
        vaChatPanelConversaAba.Identificador := vaDadosPesquisa.Identificador;

        // Preenchendo os dados da pesquisa
        FDadosUltimaPesquisa := vaDadosPesquisa.DadosConversa;

        // Preenchendo os dados do usu�rio
        imgFotoTabPesquisa.Picture := vaDadosPesquisa.FotoUsuario;
        lblNomeUsuarioTabPesquisa.Caption := vaDadosPesquisa.NomeUsuario;
        lblFuncaoTabPesquisa.Caption := vaDadosPesquisa.NomeFuncao;
        lblFuncaoTabPesquisa.Visible := lblFuncaoTabPesquisa.Caption <> '';
        lblHospitalTabPesquisa.Caption := vaDadosPesquisa.NomeHospital;

        // Ajustando o posicionamento dos labels
        if lblFuncaoTabPesquisa.Visible then
          begin
            lblNomeUsuarioTabPesquisa.Top := imgFotoTabPesquisa.Top;
            lblHospitalTabPesquisa.Top := lblFuncaoTabPesquisa.Top + lblFuncaoTabPesquisa.Height - 1;
          end
        else
          begin
            lblNomeUsuarioTabPesquisa.Top := ((imgFotoTabPesquisa.Height - 27) div 2) + imgFotoTabPesquisa.Top;
            lblHospitalTabPesquisa.Top := lblNomeUsuarioTabPesquisa.Top + lblNomeUsuarioTabPesquisa.Height - 1;
          end;

        // Preenchendo os dados da pesquisa
        lblDadosPesquisaLinha1.Caption := vaDadosPesquisa.Texto;
        lblDadosPesquisaLinha1.Visible := (lblDadosPesquisaLinha1.Caption <> '');
        lblDadosPesquisaLinha2.Caption := 'Per�odo: ' + FormatDateTime('dd/mm/yyyy', vaDadosPesquisa.DataInicial) + ' � ' + FormatDateTime('dd/mm/yyyy', vaDadosPesquisa.DataFinal);
        lblDadosPesquisaLinha2.Visible := vaDadosPesquisa.PesquisarData;

        if lblDadosPesquisaLinha1.Visible then
          lblDadosPesquisaLinha2.Top := lblDadosPesquisaLinha1.Top + lblDadosPesquisaLinha1.Height - 1
        else
          lblDadosPesquisaLinha2.Top := lblDadosPesquisaLinha1.Top;

        // Carregando os dados da pesquisa
        ppvPreencherRichViewEdit(
          vaDadosPesquisa.DadosConversa.Mensagens,
          rvePesquisa,
          vaChatPanelConversaAba.Identificador,
          vaDadosPesquisa.DadosConversa.PosicaoScroll,
          vaDadosPesquisa.Texto,
          True,
          False,
          True,
          0,
          erResultadoPesquisa);

        if not vaChatPanelConversaAba.Selecionado then
          vaChatPanelConversaAba.Selecionado := True;
      end;

    // Foi chamado pelo action do bot�o pesquisar
    if (Sender is TAction) and (vaAction.Name = DMChat.Ac_PesquisarConversa.Name) then
      begin
        // Se tem um panel selecionado com identificador v�lido, a TabConversa est� selecionada e nome do panel n�o � pnlPesquisa,
        // ent�o vamos carregar os dados do usu�rio e os par�metros da pesquisa
        if Assigned(FChatPanelSelecionado) and TRegEx.IsMatch(FChatPanelSelecionado.Identificador, '^n?\d{1,}_n?\d{1,}$', [roIgnoreCase, roSingleLine]) and
          (pgcPrincipal.ActivePage = TabConversa) and (not TRegEx.IsMatch(FChatPanelSelecionado.Name, 'pnlPesquisa', [roIgnoreCase])) then
          begin
            vaChatPanelConversaAba.Identificador := FChatPanelSelecionado.Identificador;

            // Passando para o panel da pesquisa o remetente da mensagem, para poder pesquisar a conversa
            vaChatPanelConversaAba.Mensagem.Remetente := FChatPanelSelecionado.Mensagem.Remetente;

            // Carregando os dados do usu�rio
            DMChat.cdsUsuarios.Filtered := False;
            DMChat.cdsUsuarios.Filter := '';

            if DMChat.cdsUsuarios.Locate('CODIGO;CODIGO_HOSPITAL', TChatFuncoes.fpuCodigosUsuarioHospital(FChatPanelSelecionado.Identificador), []) then
              begin
                imgFotoTabPesquisa.Picture := FChatPanelSelecionado.FotoThumbnail;
                lblNomeUsuarioTabPesquisa.Caption := TUtils.fpuCapitalize(DMChat.cdsUsuariosNOME.AsString);
                lblFuncaoTabPesquisa.Caption := TUtils.fpuCapitalize(DMChat.cdsUsuariosFUNCAO.AsString);
                lblFuncaoTabPesquisa.Visible := DMChat.cdsUsuariosUSUARIO_GRUPO.AsInteger = 0;

                // Ajustando o posicionamento dos labels
                if DMChat.cdsUsuariosUSUARIO_GRUPO.AsInteger = 0 then
                  begin
                    // Usu�rio
                    lblNomeUsuarioTabPesquisa.Top := imgFotoTabPesquisa.Top;
                    lblHospitalTabPesquisa.Top := lblFuncaoTabPesquisa.Top + lblFuncaoTabPesquisa.Height - 1;
                  end
                else
                  begin
                    // Grupo
                    lblNomeUsuarioTabPesquisa.Top := ((imgFotoTabPesquisa.Height - 27) div 2) + imgFotoTabPesquisa.Top;
                    lblHospitalTabPesquisa.Top := lblNomeUsuarioTabPesquisa.Top + lblNomeUsuarioTabPesquisa.Height + 1;
                  end;

                DMChat.cdsHospitais.Filtered := False;
                DMChat.cdsHospitais.Filter := '';

                if DMChat.cdsHospitais.Locate('codigo', TChatFuncoes.fpuCodigoHospital(FChatPanelSelecionado.Identificador), []) then
                  lblHospitalTabPesquisa.Caption := TUtils.fpuCapitalize(DMChat.cdsHospitaisRAZAO_SOCIAL.AsString);
              end
          end;

        // Selecionando o panel da pesquisa
        if not vaChatPanelConversaAba.Selecionado then
          vaChatPanelConversaAba.Selecionado := True;
      end;

    // Verificando se a tela de pesquisa foi selecionada
    if vaChatPanelConversaAba.Selecionado and ((not Assigned(FChatPanelSelecionado)) or (FChatPanelSelecionado <> vaChatPanelConversaAba)) then
      begin
        if Assigned(FChatPanelSelecionado) then
          begin
            vaChatPanelConversaAbaSelecionado := FChatPanelSelecionado;
            FChatPanelSelecionado.Selecionado := False;
          end;

        FChatPanelSelecionado := vaChatPanelConversaAba;

        // Selecionando a aba de configura��es
        pgcPrincipal.ActivePage := TabPesquisa;
        pnlAlertaPesquisa.Visible := fpvVisualizarSomenteMensagensEnviadas(vaChatPanelConversaAba.Identificador);
        rvePesquisa.SetFocus;
      end;

    // Foi chamado pelo action do bot�o pesquisar
    if (Sender is TAction) and (vaAction.Name = DMChat.Ac_PesquisarConversa.Name) then
      begin
        vaChatTelaPesquisa := TfrmChatTelaPesquisa.Create(Self);

        try
          // Carregando para a tela de pesquisa, os dados da �ltima pesquisa realizada
          if lblDadosPesquisaLinha1.Visible then
            vaChatTelaPesquisa.EditPesquisa.Text := lblDadosPesquisaLinha1.Caption;

          vaChatTelaPesquisa.cbxPesquisarPeriodo.Checked := lblDadosPesquisaLinha2.Visible;

          if lblDadosPesquisaLinha2.Visible then
            begin
              vaMatchCollection := TRegEx.Matches(lblDadosPesquisaLinha2.Caption, '\d{1,2}\/\d{1,2}\/\d{4}', []);
              vaChatTelaPesquisa.EditDataInicial.EditValue := StrToDate(vaMatchCollection.Item[0].Value);
              vaChatTelaPesquisa.EditDataFinal.EditValue := StrToDate(vaMatchCollection.Item[1].Value);
            end;

          // Exibindo a tela de pesquisa
          vaChatTelaPesquisa.ShowModal;

          if not vaChatTelaPesquisa.RealizarPesquisa then
            begin
              if Assigned(vaChatPanelConversaAbaSelecionado) then
                begin
                  vaChatPanelConversaAbaSelecionado.Selecionado := True;
                  vaChatPanelConversaAba.Close;
                end;
            end
          else
            begin
              // Preenchendo os dados da pesquisa
              lblDadosPesquisaLinha1.Caption := vaChatTelaPesquisa.EditPesquisa.Text;
              lblDadosPesquisaLinha1.Visible := (lblDadosPesquisaLinha1.Caption <> '');

              if vaChatTelaPesquisa.cbxPesquisarPeriodo.Checked then
                lblDadosPesquisaLinha2.Caption := 'Per�odo: ' + FormatDateTime('dd/mm/yyyy', vaChatTelaPesquisa.EditDataInicial.EditValue) + ' � ' + FormatDateTime('dd/mm/yyyy', vaChatTelaPesquisa.EditDataFinal.EditValue);

              lblDadosPesquisaLinha2.Visible := vaChatTelaPesquisa.cbxPesquisarPeriodo.Checked;

              if lblDadosPesquisaLinha1.Visible then
                lblDadosPesquisaLinha2.Top := lblDadosPesquisaLinha1.Top + lblDadosPesquisaLinha1.Height - 1
              else
                lblDadosPesquisaLinha2.Top := lblDadosPesquisaLinha1.Top;

              // Pesquisando para saber se esta pesquisa j� foi realizada
              if FDadosUltimasPesquisas.Count > 0 then
                begin
                  vaDadosPesquisaPairEnumerator := FDadosUltimasPesquisas.GetEnumerator;

                  while vaDadosPesquisaPairEnumerator.MoveNext and (not Assigned(vaDadosPesquisa)) do
                    begin
                      if TRegEx.IsMatch(vaDadosPesquisaPairEnumerator.Current.Value.Texto, '^' + TRegEx.Escape(vaChatTelaPesquisa.EditPesquisa.Text) + '$', [roIgnoreCase]) and
                        (vaChatTelaPesquisa.cbxPesquisarPeriodo.Checked = vaDadosPesquisaPairEnumerator.Current.Value.PesquisarData) and
                        (vaDadosPesquisaPairEnumerator.Current.Value.PesquisarData or
                        ((not VarIsNull(vaChatTelaPesquisa.EditDataInicial.EditValue)) and (StrToDate(vaChatTelaPesquisa.EditDataInicial.EditValue) = vaDadosPesquisaPairEnumerator.Current.Value.DataInicial) and
                        (not VarIsNull(vaChatTelaPesquisa.EditDataFinal.EditValue)) and (StrToDate(vaChatTelaPesquisa.EditDataFinal.EditValue) = vaDadosPesquisaPairEnumerator.Current.Value.DataFinal))) then
                        vaDadosPesquisa := vaDadosPesquisaPairEnumerator.Current.Value;
                    end;
                end;

              if Assigned(vaDadosPesquisa) then
                begin
                  FDadosUltimaPesquisa := vaDadosPesquisa.DadosConversa;
                  ppvPreencherRichViewEdit(
                    vaDadosPesquisa.DadosConversa.Mensagens,
                    rvePesquisa,
                    vaChatPanelConversaAba.Identificador,
                    vaDadosPesquisa.DadosConversa.PosicaoScroll,
                    vaDadosPesquisa.Texto,
                    True,
                    False,
                    True,
                    0,
                    erResultadoPesquisa);

                  rvePesquisa.SetFocus;
                end
              else
                begin
                  if vaChatTelaPesquisa.cbxPesquisarPeriodo.Checked then
                    begin
                      vaDataInicial := vaChatTelaPesquisa.EditDataInicial.EditValue;
                      vaDataFinal := vaChatTelaPesquisa.EditDataFinal.EditValue;
                    end
                  else
                    begin
                      vaDataInicial := StrToDate('01/01/1900');
                      vaDataFinal := StrToDate('01/01/1900');
                    end;

                  // Definindo o tipo da pesquisa
                  if (vaChatTelaPesquisa.EditPesquisa.Text <> '') and vaChatTelaPesquisa.cbxPesquisarPeriodo.Checked then
                    vaTipoPesquisa := TChatTipoPesquisa.tpqDataTexto
                  else
                    begin
                      if vaChatTelaPesquisa.cbxPesquisarPeriodo.Checked then
                        vaTipoPesquisa := TChatTipoPesquisa.tpqData
                      else
                        vaTipoPesquisa := TChatTipoPesquisa.tpqTexto;
                    end;

                   // Identificando o usu�rio da Mensagens
                  vaIdUsuarioConversa.CodigoHospital := TChatFuncoes.fpuCodigoHospital(vaChatPanelConversaAba.Identificador);

                  if TChatFuncoes.fpuCodigoUsuario(vaChatPanelConversaAba.Identificador) = FCodigoUsuarioSistema then
                    vaIdUsuarioConversa.CodigoUsuario := 0
                  else
                    vaIdUsuarioConversa.CodigoUsuario := TChatFuncoes.fpuCodigoUsuario(vaChatPanelConversaAba.Identificador);

                  // Realizando a pesquisa
                  if fpvPesquisarConversa(
                    vaTipoPesquisa,
                    vaChatTelaPesquisa.EditPesquisa.Text,
                    vaDataInicial,
                    vaDataFinal,
                    vaChatPanelConversaAba.Mensagem.Remetente,
                    vaIdUsuarioConversa,
                    (TChatFuncoes.fpuCodigoUsuario(vaChatPanelConversaAba.Identificador) = FCodigoUsuarioSistema),
                    False,
                    vaMensagens,
                    vaAnexos) then
                    begin
                      if FDadosUltimasPesquisas.ContainsKey(DMChat.Ac_UltimasPesquisas5.Name) then
                        begin
                          vaDadosPesquisa := FDadosUltimasPesquisas.Items[DMChat.Ac_UltimasPesquisas5.Name];
                          FreeAndNil(vaDadosPesquisa);
                          DMChat.Ac_UltimasPesquisas5.Caption := DMChat.Ac_UltimasPesquisas4.Caption;
                          DMChat.Ac_UltimasPesquisas4.Caption := '';
                          FDadosUltimasPesquisas.Items[DMChat.Ac_UltimasPesquisas5.Name] := FDadosUltimasPesquisas.Items[DMChat.Ac_UltimasPesquisas4.Name];
                          FDadosUltimasPesquisas.Items[DMChat.Ac_UltimasPesquisas4.Name] := nil;
                        end;

                      if FDadosUltimasPesquisas.ContainsKey(DMChat.Ac_UltimasPesquisas4.Name) then
                        begin
                          if not FDadosUltimasPesquisas.ContainsKey(DMChat.Ac_UltimasPesquisas5.Name) then
                            begin
                              FDadosUltimasPesquisas.Add(DMChat.Ac_UltimasPesquisas5.Name, FDadosUltimasPesquisas.Items[DMChat.Ac_UltimasPesquisas4.Name]);
                              DMChat.Ac_UltimasPesquisas5.Caption := DMChat.Ac_UltimasPesquisas4.Caption;
                              DMChat.Ac_UltimasPesquisas5.Visible := True;
                              DMChat.Ac_UltimasPesquisas5.Enabled := True;
                            end;

                          DMChat.Ac_UltimasPesquisas4.Caption := DMChat.Ac_UltimasPesquisas3.Caption;
                          DMChat.Ac_UltimasPesquisas3.Caption := '';
                          FDadosUltimasPesquisas.Items[DMChat.Ac_UltimasPesquisas4.Name] := FDadosUltimasPesquisas.Items[DMChat.Ac_UltimasPesquisas3.Name];
                          FDadosUltimasPesquisas.Items[DMChat.Ac_UltimasPesquisas3.Name] := nil;
                        end;

                      if FDadosUltimasPesquisas.ContainsKey(DMChat.Ac_UltimasPesquisas3.Name) then
                        begin
                          if not FDadosUltimasPesquisas.ContainsKey(DMChat.Ac_UltimasPesquisas4.Name) then
                            begin
                              FDadosUltimasPesquisas.Add(DMChat.Ac_UltimasPesquisas4.Name, FDadosUltimasPesquisas.Items[DMChat.Ac_UltimasPesquisas3.Name]);
                              DMChat.Ac_UltimasPesquisas4.Caption := DMChat.Ac_UltimasPesquisas3.Caption;
                              DMChat.Ac_UltimasPesquisas4.Visible := True;
                              DMChat.Ac_UltimasPesquisas4.Enabled := True;
                            end;

                          DMChat.Ac_UltimasPesquisas3.Caption := DMChat.Ac_UltimasPesquisas2.Caption;
                          DMChat.Ac_UltimasPesquisas2.Caption := '';
                          FDadosUltimasPesquisas.Items[DMChat.Ac_UltimasPesquisas3.Name] := FDadosUltimasPesquisas.Items[DMChat.Ac_UltimasPesquisas2.Name];
                          FDadosUltimasPesquisas.Items[DMChat.Ac_UltimasPesquisas2.Name] := nil;
                        end;

                      if FDadosUltimasPesquisas.ContainsKey(DMChat.Ac_UltimasPesquisas2.Name) then
                        begin
                          if not FDadosUltimasPesquisas.ContainsKey(DMChat.Ac_UltimasPesquisas3.Name) then
                            begin
                              FDadosUltimasPesquisas.Add(DMChat.Ac_UltimasPesquisas3.Name, FDadosUltimasPesquisas.Items[DMChat.Ac_UltimasPesquisas2.Name]);
                              DMChat.Ac_UltimasPesquisas3.Visible := True;
                              DMChat.Ac_UltimasPesquisas3.Enabled := True;
                              DMChat.Ac_UltimasPesquisas3.Caption := DMChat.Ac_UltimasPesquisas2.Caption;
                            end;

                          DMChat.Ac_UltimasPesquisas2.Caption := DMChat.Ac_UltimasPesquisas1.Caption;
                          DMChat.Ac_UltimasPesquisas1.Caption := '';
                          FDadosUltimasPesquisas.Items[DMChat.Ac_UltimasPesquisas2.Name] := FDadosUltimasPesquisas.Items[DMChat.Ac_UltimasPesquisas1.Name];
                          FDadosUltimasPesquisas.Items[DMChat.Ac_UltimasPesquisas1.Name] := nil;
                        end;

                      try
                        vaDadosPesquisa := TChatDadosPesquisa.Create;
                        vaDadosConversa.Anexos := vaMensagens;
                        vaDadosConversa.Mensagens := vaMensagens;
                        vaDadosConversa.PosicaoScroll := -1;
                        vaDadosPesquisa.DadosConversa := vaDadosConversa;
                        vaDadosPesquisa.DataInicial := vaDataInicial;
                        vaDadosPesquisa.DataFinal := vaDataFinal;
                        vaDadosPesquisa.FotoUsuario := vaChatPanelConversaAba.FotoThumbnail;
                        vaDadosPesquisa.Identificador := vaChatPanelConversaAba.Identificador;
                        vaDadosPesquisa.NomeHospital := lblHospitalTabPesquisa.Caption;
                        vaDadosPesquisa.NomeFuncao := lblFuncaoTabPesquisa.Caption;
                        vaDadosPesquisa.NomeUsuario := lblNomeUsuarioTabPesquisa.Caption;
                        vaDadosPesquisa.PesquisarData := vaChatTelaPesquisa.cbxPesquisarPeriodo.Checked;
                        vaDadosPesquisa.Texto := vaChatTelaPesquisa.EditPesquisa.Text;

                        if FDadosUltimasPesquisas.ContainsKey(DMChat.Ac_UltimasPesquisas1.Name) then
                          begin
                            if not FDadosUltimasPesquisas.ContainsKey(DMChat.Ac_UltimasPesquisas2.Name) then
                              begin
                                FDadosUltimasPesquisas.Add(DMChat.Ac_UltimasPesquisas2.Name, FDadosUltimasPesquisas.Items[DMChat.Ac_UltimasPesquisas1.Name]);
                                DMChat.Ac_UltimasPesquisas2.Caption := DMChat.Ac_UltimasPesquisas1.Caption;
                                DMChat.Ac_UltimasPesquisas2.Visible := True;
                                DMChat.Ac_UltimasPesquisas2.Enabled := True;
                              end;

                            FDadosUltimasPesquisas.Items[DMChat.Ac_UltimasPesquisas1.Name] := vaDadosPesquisa;
                          end
                        else
                          begin
                            FDadosUltimasPesquisas.Add(DMChat.Ac_UltimasPesquisas1.Name, vaDadosPesquisa);
                            DMChat.Ac_UltimasPesquisas1.Visible := True;
                            DMChat.Ac_UltimasPesquisas1.Enabled := True;
                          end;

                        plcPreencherCaptionMenu(FDadosUltimasPesquisas.Items[DMChat.Ac_UltimasPesquisas1.Name], DMChat.Ac_UltimasPesquisas1);
                      except
                        if Assigned(vaDadosPesquisa) then
                          FreeAndNil(vaDadosPesquisa);
                      end;

                      if Assigned(vaDadosPesquisa) then
                        begin
                          FDadosUltimaPesquisa := vaDadosPesquisa.DadosConversa;
                          ppvPreencherRichViewEdit(
                            vaDadosPesquisa.DadosConversa.Mensagens,
                            rvePesquisa,
                            vaChatPanelConversaAba.Identificador,
                            vaDadosPesquisa.DadosConversa.PosicaoScroll,
                            vaDadosPesquisa.Texto,
                            True,
                            False,
                            True,
                            0,
                            erResultadoPesquisa);

                          rvePesquisa.SetFocus;
                        end;
                    end;
                end;
            end;
        finally
          if Assigned(vaChatTelaPesquisa) then
            FreeAndNil(vaChatTelaPesquisa);
        end;
      end;
  finally
    FSecaoCriticaBancoDadosConversas.Release;
    FSecaoCriticaBancoDadosUsuarios.Release;
  end;
end;

procedure TfrmChatTela.ppvAcRetornar(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmChatTela.ppvAcSmiles(Sender: TObject);
begin
  dockSiteSmileys.AutoSize := False;
  dockSiteSmileys.Height := 1;
  dockPanelSmileys.Height := 190;
  dockSiteSmileys.Top := pnlConversaRodape.Top + pnlConversaEdit.Top - dockPanelSmileys.Height - 2;
  dockSiteSmileys.Left := pnlConversaEditBotoes.Left - dockSiteSmileys.Width + bttEnviar.Width + bttSmiley.Width - 1;

  dockPanelSmileys.Visible := True;
  dockPanelSmileys.Activate;
end;

procedure TfrmChatTela.ppvAdicionarConversa(const ipIdentificador: string;
  const ipSelecionarConversa, ipNotificar: Boolean);
var
  vaChatPanelConversaAba: TChatPanelConversaAba;
  vaUsuarioLogado: TChatIdentificacaoUsuario;
  vaCdsHospitais, vaCdsUsuarios: TpmClientDataSet;
  vaNomeHospital: string;
begin
  // Observa��es:
  // A op��o ipSelecionarConversa � superior a ipNotificar, ou seja, se a
  // op��o ipSelecionarConversa estivar "True" a op��o ipNotificar ser� ignorada.

  // Pesquisando a conversa para saber se ela est� no painel de conversas ou se tem que adicion�-la
  vaChatPanelConversaAba := TChatPanelConversaAba(slbConversasListaUsuarios.FindComponent('pnl' + ipIdentificador));

  if Assigned(vaChatPanelConversaAba) then
    begin
      // A conversa j� existe, ent�o vamos selecion�-la, caso tenha sido solicitado
      if ipSelecionarConversa then
        vaChatPanelConversaAba.Selecionado := True;
    end
  else
    begin
      // A conversa ainda n�o existe, ent�o vamos montar todos os itens da conversa

      // Pesquisando o usuario logado de acordo com o hospital do destinat�rio
      if not fpvUsuarioLogado(TChatFuncoes.fpuCodigoHospital(ipIdentificador), vaUsuarioLogado) then
        begin
          try
            vaCdsHospitais := fpvClonarClientDataSet(DMChat.cdsHospitais);

            if vaCdsHospitais.Locate('CODIGO', TChatFuncoes.fpuCodigoHospital(ipIdentificador), []) then
              vaNomeHospital := Capitalize(vaCdsHospitais.FieldByName('RAZAO_SOCIAL').AsString)
            else
              vaNomeHospital := '(' + IntToStr(TChatFuncoes.fpuCodigoHospital(ipIdentificador)) + ')';
          finally
            if Assigned(vaCdsHospitais) then
              begin
                vaCdsHospitais.Close;
                FreeAndNil(vaCdsHospitais);
              end;
          end;

          MessageTela('N�o foi poss�vel identificar o usu�rio logado para' + sLineBreak + 'o hospital ' + vaNomeHospital + '.');
          Exit;
        end;

      // Criando o panel e definindo suas caracter�sticas. Este panel ser� uma a "guia do usu�rio" na tela
      vaChatPanelConversaAba := TChatPanelConversaAba.Create(slbConversasListaUsuarios);
      vaChatPanelConversaAba.Align := alTop;
      vaChatPanelConversaAba.Visible := False;
      vaChatPanelConversaAba.Name := 'pnl' + ipIdentificador;
      vaChatPanelConversaAba.Identificador := ipIdentificador;
      vaChatPanelConversaAba.Parent := TWinControl(slbConversasListaUsuarios);
      vaChatPanelConversaAba.Top := ((slbConversasListaUsuarios.ControlCount - 1) * vaChatPanelConversaAba.Height) + 1;
      vaChatPanelConversaAba.Visible := True;
      vaChatPanelConversaAba.OnClose := ppvFecharConversa;
      vaChatPanelConversaAba.OnBeforeChangeSelectCtrl := ppvAntesSelecionarConversaCtrl;
      vaChatPanelConversaAba.OnChangeSelect := ppvSelecionarConversa;
      vaChatPanelConversaAba.OnChangeSelectCtrl := ppvSelecionarConversaCtrl;
      vaChatPanelConversaAba.Mensagem.AnexosLimite := 5242880; // Definindo um limite de 5MB para os anexos
      vaChatPanelConversaAba.Mensagem.AoAtingirLimiteAnexos := ppvAnexosLimiteAtingido;
      vaChatPanelConversaAba.Mensagem.TipoMensagem := 0; // Mensagem normal
      vaChatPanelConversaAba.PodeFechar := (not(fsModal in Self.FormState)) or (not FTelaModalSimplificada);
      vaChatPanelConversaAba.ppuImagemBotaoFechar(DMChat.ImgListBotoes16x16, 0);
      vaChatPanelConversaAba.SelecionarCtrlPermitido := ((TChatFuncoes.fpuCodigoUsuario(ipIdentificador) <> 0) and (TChatFuncoes.fpuCodigoUsuario(ipIdentificador) <> FCodigoUsuarioSistema));

      // Selecionando o tipo da conversa (usu�rio ou grupo)
      vaCdsUsuarios := fpvClonarClientDataSet(DMChat.cdsUsuarios);

      try
        if vaCdsUsuarios.Locate('CODIGO;CODIGO_HOSPITAL', TChatFuncoes.fpuCodigosUsuarioHospital(ipIdentificador), []) and (vaCdsUsuarios.FieldByName('USUARIO_GRUPO').AsInteger = 1) then
          vaChatPanelConversaAba.TipoAba := TChatTipoAba.taConversaGrupo
        else
          vaChatPanelConversaAba.TipoAba := TChatTipoAba.taConversaUsuario;
      finally
        vaCdsUsuarios.Close;
        FreeAndNil(vaCdsUsuarios);
      end;

      // Definindo o destinat�rio da mensagem
      vaChatPanelConversaAba.Mensagem.Destinatario.CodigoHospital := TChatFuncoes.fpuCodigoHospital(ipIdentificador);
      vaChatPanelConversaAba.Mensagem.Destinatario.CodigoUsuario := TChatFuncoes.fpuCodigoUsuario(ipIdentificador);

      // Definindo o remetente da mensagem
      vaChatPanelConversaAba.Mensagem.Remetente := vaUsuarioLogado;

      ppvAtualizarDadosUsuarioTela(vaChatPanelConversaAba.Identificador, vaChatPanelConversaAba);

      // Criando um espa�o para armazenar os dados da conversa
      ppvCriarEspacoArmazenamentoConversa(ipIdentificador);

      // A conversa ser� selecionada, caso tenha sido solicitado
      if ipSelecionarConversa then
        vaChatPanelConversaAba.Selecionado := True;

      // Posicionando a barra de rolagem no lugar do novo panel
      if (vaChatPanelConversaAba.Top + vaChatPanelConversaAba.Height) > slbConversasListaUsuarios.Height then
        slbConversasListaUsuarios.VertScrollBar.Position := slbConversasListaUsuarios.VertScrollBar.Range;

      // Verificando se deve ser notificada a abertura da conversa
      if (not(TChatFuncoes.fpuCodigoUsuario(vaChatPanelConversaAba.Identificador) in [0, FCodigoUsuarioSistema])) then
        begin
          // Informando que a conversa est� ativa
          ppvMudarStatusConversa(vaChatPanelConversaAba.Identificador, True);
        end;
    end;

  // A notifica��o ocorrer� se houve a solicita��o e a conversa n�o estiver selecionada
  if ipNotificar and (vaChatPanelConversaAba <> FChatPanelSelecionado) then
    begin
      vaChatPanelConversaAba.PodeFechar := (not(fsModal in Self.FormState)) or (not FTelaModalSimplificada);
      vaChatPanelConversaAba.Notificacao := True;
    end;
end;

procedure TfrmChatTela.ppvAdicionarPanelAnexo(
  const ipDadosArquivo: TChatAnexoPropriedades);
var
  vaChatPanelArquivo: TChatPanelArquivo;
begin
  ppvPanelConversaAnexosVisivel(True);

  vaChatPanelArquivo := TChatPanelArquivo.Create(slbAnexos);
  vaChatPanelArquivo.Align := alLeft;
  vaChatPanelArquivo.Visible := False;
  vaChatPanelArquivo.Parent := slbAnexos;
  vaChatPanelArquivo.Left := slbAnexos.ControlCount * vaChatPanelArquivo.Width;
  vaChatPanelArquivo.Tag := ipDadosArquivo.id;
  vaChatPanelArquivo.TextoSuperior := ipDadosArquivo.Nome;
  vaChatPanelArquivo.TextoInferior := 'Comp.: ' + ipDadosArquivo.TamanhoFomatado + ' Desc.: ' + ipDadosArquivo.TamanhoOriginalFtd;
  vaChatPanelArquivo.Width := 220;
  vaChatPanelArquivo.OnClose := ppvDeletarAnexo;
  vaChatPanelArquivo.ppuImagemBotaoFechar(DMChat.ImgListBotoes16x16, 0);

  ppvCarregarImagemArquivo(vaChatPanelArquivo, ipDadosArquivo.Extencao);
  vaChatPanelArquivo.Visible := True;
  slbAnexos.HorzScrollBar.Position := slbAnexos.HorzScrollBar.Range;
  lblAnexos.Caption := TRegEx.Replace(lblAnexos.Caption, '(?<=Tot: ).*', FormatFloat(',0.00', FChatPanelSelecionado.Mensagem.AnexosTotal / 1048576) + 'MB', [roIgnoreCase, roSingleLine]);
  lblAnexosQtde.Caption := TRegEx.Replace(lblAnexosQtde.Caption, '\d{1,}', IntToStr(FChatPanelSelecionado.Mensagem.AnexosQtde), [roIgnoreCase, roSingleLine]);
end;

procedure TfrmChatTela.ppvAdicionarSmileys(Sender: TObject);
begin
  if (Sender is TImage) and (TImage(Sender).Hint <> '') then
    TChatFuncoes.ppuInserirSmileysRichViewEdit(TImage(Sender).Picture.Graphic, TImage(Sender).Hint, rveMensagensEdit);
end;

procedure TfrmChatTela.ppvAjustarImagem(const ipCdsUsuarios: TpmClientDataSet;
  const ipFoto, ipFotoThumbnail: Boolean);
  function flcCalculaLarguraAltura(const ipOldHeight, ipOldWidth, ipTamMax: Integer; var ioNewHeight, ioNewWidth: Integer): Boolean;
  begin
    Result := False;

    if (ipOldHeight > ipTamMax) or (ipOldWidth > ipTamMax) then
      begin
        Result := True;

        if ipOldHeight >= ipOldWidth then
          begin
            ioNewHeight := ipTamMax;

            if ipOldHeight = ipOldWidth then
              ioNewWidth := ioNewHeight
            else
              ioNewWidth := Trunc(SimpleRoundTo(ipTamMax / ipOldHeight * ipOldWidth, 0));
          end
        else
          begin
            ioNewHeight := Trunc(SimpleRoundTo(ipTamMax / ipOldWidth * ipOldHeight, 0));
            ioNewWidth := ipTamMax;
          end;
      end;
  end;

var
  vadxSmartImage: TdxSmartImage;
  vaImagem: TBytesStream;
  vaBitmap, vaBitmapAjustado: TBitmap;
  vaJPEGImage: TJPEGImage;
  vaNewHeight, vaNewWidth: Integer;
begin
  vadxSmartImage := nil;
  vaImagem := nil;
  vaBitmap := nil;
  vaBitmapAjustado := nil;
  vaJPEGImage := nil;

  if ipFoto then
    begin
      if (not ipCdsUsuarios.FieldByName('FOTO').isNull) then
        begin
          // Ajustando a imagem
          try
            // Lendo a imagem do ClientDataSet
            vaImagem := TBytesStream.Create;
            TBlobField(ipCdsUsuarios.FieldByName('FOTO')).SaveToStream(vaImagem);
            vaImagem.Position := 0;

            vadxSmartImage := TdxSmartImage.Create;
            vadxSmartImage.LoadFromStream(vaImagem);
            vaBitmap := vadxSmartImage.GetAsBitmap;

            // Ajustando o tamanho da imagem
            if flcCalculaLarguraAltura(vaBitmap.Height, vaBitmap.Width, 128, vaNewHeight, vaNewWidth) then
              begin
                // Redimencionando
                vaBitmapAjustado := TBitmap.Create;
                vaBitmapAjustado.Height := vaNewHeight;
                vaBitmapAjustado.Width := vaNewWidth;
                vaBitmapAjustado.Canvas.StretchDraw(vaBitmapAjustado.Canvas.ClipRect, vaBitmap);

                // Convertentdo a imagem ajusta para JPG
                vaJPEGImage := TJPEGImage.Create;
                vaJPEGImage.Assign(vaBitmapAjustado);
                vaImagem.Clear;
                vaJPEGImage.SaveToStream(vaImagem);
                vaImagem.Position := 0;

                // Gravando a nova imagem
                if not(ipCdsUsuarios.State in [dsEdit, dsInsert]) then
                  ipCdsUsuarios.Edit;

                TBlobField(ipCdsUsuarios.FieldByName('FOTO')).LoadFromStream(vaImagem);
                ipCdsUsuarios.FieldByName('FOTO_AJUSTAR').AsInteger := 0;
                ipCdsUsuarios.Post;
              end
            else
              begin
                // A imagem est� dentro do tamanho m�ximo, n�o foi preciso ajustar
                if not(ipCdsUsuarios.State in [dsEdit, dsInsert]) then
                  ipCdsUsuarios.Edit;

                ipCdsUsuarios.FieldByName('FOTO_AJUSTAR').AsInteger := 0;
                ipCdsUsuarios.Post;
              end;
          finally
            if Assigned(vadxSmartImage) then
              FreeAndNil(vadxSmartImage);

            if Assigned(vaBitmap) then
              FreeAndNil(vaBitmap);

            if Assigned(vaBitmapAjustado) then
              FreeAndNil(vaBitmapAjustado);

            if Assigned(vaJPEGImage) then
              FreeAndNil(vaJPEGImage);

            if Assigned(vaImagem) then
              FreeAndNil(vaImagem);
          end;
        end
      else
        begin
          // N�o tem como ajustar porque o campo referente a imagem est� nulo
          if not(ipCdsUsuarios.State in [dsEdit, dsInsert]) then
            ipCdsUsuarios.Edit;

          ipCdsUsuarios.FieldByName('FOTO_AJUSTAR').AsInteger := 0;
          ipCdsUsuarios.Post;
        end;
    end;

  if ipFotoThumbnail then
    begin
      // O thumbnail est� nulo, ent�o vamos copiar da foto
      if (not ipCdsUsuarios.FieldByName('FOTO_THUMBNAIL').isNull) or (not ipCdsUsuarios.FieldByName('FOTO').isNull) then
        begin
          // Copiando a imagem da foto e ajustando para o thumbnail
          try
            // Lendo a imagem do ClientDataSet
            vaImagem := TBytesStream.Create;

            if not ipCdsUsuarios.FieldByName('FOTO_THUMBNAIL').isNull then
              TBlobField(ipCdsUsuarios.FieldByName('FOTO_THUMBNAIL')).SaveToStream(vaImagem)
            else
              TBlobField(ipCdsUsuarios.FieldByName('FOTO')).SaveToStream(vaImagem);

            vaImagem.Position := 0;

            vadxSmartImage := TdxSmartImage.Create;
            vadxSmartImage.LoadFromStream(vaImagem);
            vaBitmap := vadxSmartImage.GetAsBitmap;

            // Ajustando o tamanho da imagem
            if flcCalculaLarguraAltura(vaBitmap.Height, vaBitmap.Width, 32, vaNewHeight, vaNewWidth) then
              begin
                // Redimencionando
                vaBitmapAjustado := TBitmap.Create;
                vaBitmapAjustado.Height := vaNewHeight;
                vaBitmapAjustado.Width := vaNewWidth;
                vaBitmapAjustado.Canvas.StretchDraw(vaBitmapAjustado.Canvas.ClipRect, vaBitmap);

                // Convertentdo a imagem ajusta para JPG
                vaJPEGImage := TJPEGImage.Create;
                vaJPEGImage.Assign(vaBitmapAjustado);
                vaImagem.Clear;
                vaJPEGImage.SaveToStream(vaImagem);
                vaImagem.Position := 0;

                // Gravando a nova imagem
                if not(ipCdsUsuarios.State in [dsEdit, dsInsert]) then
                  ipCdsUsuarios.Edit;

                TBlobField(ipCdsUsuarios.FieldByName('FOTO_THUMBNAIL')).LoadFromStream(vaImagem);
                ipCdsUsuarios.FieldByName('FOTO_THUMBNAIL_AJUSTAR').AsInteger := 0;
                ipCdsUsuarios.Post;
              end
            else
              begin
                // A imagem est� dentro do tamanho m�ximo, n�o foi preciso ajustar
                if not(ipCdsUsuarios.State in [dsEdit, dsInsert]) then
                  ipCdsUsuarios.Edit;

                ipCdsUsuarios.FieldByName('FOTO_THUMBNAIL_AJUSTAR').AsInteger := 0;
                ipCdsUsuarios.Post;
              end;
          finally
            if Assigned(vadxSmartImage) then
              FreeAndNil(vadxSmartImage);

            if Assigned(vaBitmap) then
              FreeAndNil(vaBitmap);

            if Assigned(vaBitmapAjustado) then
              FreeAndNil(vaBitmapAjustado);

            if Assigned(vaJPEGImage) then
              FreeAndNil(vaJPEGImage);

            if Assigned(vaImagem) then
              FreeAndNil(vaImagem);
          end;
        end
      else
        begin
          // N�o tem como ajustar porque os dois campos referentes a imagem est�o nulos
          if not(ipCdsUsuarios.State in [dsEdit, dsInsert]) then
            ipCdsUsuarios.Edit;

          ipCdsUsuarios.FieldByName('FOTO_THUMBNAIL_AJUSTAR').AsInteger := 0;
          ipCdsUsuarios.Post;
        end;
    end;
end;

procedure TfrmChatTela.ppvAnexarArquivos(ipArquivos: TStrings);
var
  vaPropriedades: TChatAnexoPropriedades;
  vaDadosAnexos: System.TArray<TChatAnexoPropriedades>;
begin
  if Assigned(FChatPanelSelecionado) then
    begin
      vaDadosAnexos := FChatPanelSelecionado.Mensagem.fpuAnexarArquivos(ipArquivos);

      for vaPropriedades in vaDadosAnexos do
        ppvAdicionarPanelAnexo(vaPropriedades);
    end;
end;

procedure TfrmChatTela.ppvAnexosLimiteAtingido(
  const ipArquivosRecusados: TStrings);
var
  vaArquivo, vaMensagem: string;
begin
  vaMensagem := '';

  for vaArquivo in ipArquivosRecusados do
    begin
      if vaMensagem <> '' then
        vaMensagem := vaMensagem + sLineBreak;

      vaMensagem := vaMensagem + vaArquivo;
    end;

  if vaMensagem <> '' then
    MessageTela('O arquivo possui um tamanho maior que o permitido' + sLineBreak + 'ou o limite de anexos foi atingido.' + sLineBreak + 'Os arquivos abaixo n�o foram anexados:' + sLineBreak + vaMensagem);
end;

procedure TfrmChatTela.ppvAntesSelecionarConversaCtrl(var SelecionadoCtrl: Boolean);
begin
  SelecionadoCtrl :=
    SelecionadoCtrl and
    Assigned(FChatPanelSelecionado) and
    (FChatPanelSelecionado.TipoAba in [TChatTipoAba.taConversaGrupo, TChatTipoAba.taConversaUsuario]) and
    (TChatFuncoes.fpuCodigoUsuario(FChatPanelSelecionado.Identificador) <> 0) and
    (TChatFuncoes.fpuCodigoUsuario(FChatPanelSelecionado.Identificador) <> FCodigoUsuarioSistema);
end;

procedure TfrmChatTela.ppvAtualizarDadosUsuarioLogado;
var
  vaCdsUsuarios: TpmClientDataSet;
  vaBytesStream: TBytesStream;
  vaPicture: TPicture;
  vaAjustarFoto, vaAjustarThumbnail: Boolean;
  i: Integer;
begin
  vaCdsUsuarios := fpvClonarClientDataSet(DMChat.cdsUsuarios);
  vaBytesStream := nil;
  vaPicture := nil;

  if FUsuarioLogado.Count > 0 then
    i := FUsuarioLogado.Keys.ToArray[0]
  else
    i := 0;

  try
    if (FUsuarioLogado.Count > 0) and
      (FUsuarioLogado.Items[i].IdentificacaoUsuario.CodigoUsuario <> 0) and
      (FUsuarioLogado.Items[i].IdentificacaoUsuario.CodigoHospital <> 0) and
      vaCdsUsuarios.Locate('CODIGO;CODIGO_HOSPITAL', VarArrayOf([FUsuarioLogado.Items[i].IdentificacaoUsuario.CodigoUsuario, FUsuarioLogado.Items[i].IdentificacaoUsuario.CodigoHospital]), []) then
      begin
        // Ajustando as fotos
        vaAjustarFoto := vaCdsUsuarios.FieldByName('FOTO_AJUSTAR').AsInteger = 1;
        vaAjustarThumbnail := vaCdsUsuarios.FieldByName('FOTO_THUMBNAIL_AJUSTAR').AsInteger = 1;
        ppvAjustarImagem(vaCdsUsuarios, vaAjustarFoto, vaAjustarThumbnail);

        // Atualizando o nome do usuario
        lblNomeUsuarioLogado.Caption := TUtils.fpuCapitalize(vaCdsUsuarios.FieldByName('NOME').AsString);

        // Atualizando o status do usu�rio
        case vaCdsUsuarios.FieldByName('STATUS').AsInteger of
          0: // Desconectado
            begin
              lblStatusUsuarioLogado.Caption := 'Desconectado';
              spStatusUsuarioLogado.Brush.Color := clGrayText;
            end;
          1: // Conectado
            begin
              lblStatusUsuarioLogado.Caption := 'Conectado';
              spStatusUsuarioLogado.Brush.Color := clGreen;
            end;
        else // Ausente
          begin
            lblStatusUsuarioLogado.Caption := 'Ausente';
            spStatusUsuarioLogado.Brush.Color := $0001C8EB;
          end;
        end;

        // Atualizando a foto do usu�rio
        if not vaCdsUsuarios.FieldByName('FOTO_THUMBNAIL').isNull then
          begin
            vaBytesStream := TBytesStream.Create;
            TBlobField(vaCdsUsuarios.FieldByName('FOTO_THUMBNAIL')).SaveToStream(vaBytesStream);
            vaBytesStream.Position := 0;
            vaPicture := fpuRetornaImagem(vaBytesStream);

            if Assigned(vaPicture) then
              imgFotoUsuarioLogado.Picture := vaPicture
            else
              imgFotoUsuarioLogado.Picture := DMChat.ImgCollectionItemUsuario.Picture;
          end
        else
          imgFotoUsuarioLogado.Picture := DMChat.ImgCollectionItemUsuario.Picture;
      end
    else
      begin
        // Atualizando o nome do usuario
        lblNomeUsuarioLogado.Caption := '';

        // Atualizando o status do usu�rio
        lblStatusUsuarioLogado.Caption := 'Desconectado';
        spStatusUsuarioLogado.Brush.Color := clGrayText;

        // Atualizando a foto do usu�rio
        imgFotoUsuarioLogado.Picture := DMChat.ImgCollectionItemUsuario.Picture;
      end;

    lblNomeUsuarioLogado.Refresh;
    lblStatusUsuarioLogado.Refresh;
    bttConfiguracoes.Refresh;
  finally
    if Assigned(vaPicture) then
      FreeAndNil(vaPicture);

    if Assigned(vaBytesStream) then
      FreeAndNil(vaBytesStream);

    vaCdsUsuarios.Close;
    FreeAndNil(vaCdsUsuarios);
  end;
end;

procedure TfrmChatTela.ppvAtualizarDadosUsuarioTela(
  const ipIdentificador: string; ipChatPanelConversaAba: TChatPanelConversaAba;
  const ipSomenteStatus: Boolean);

  // Este procedimento concentra as atuliza��es de infoma��es nos panels
  // O ClientDataSet passado como par�metro, deve est� posicionado no registro correto
  procedure plcAtualizarChatPanel(ipChatPanelConversa: TChatPanelConversa; const ipCdsUsuarios: TpmClientDataSet; const ipAtualizarSomenteStatus: Boolean);
  var
    vaPicture: TPicture;
    vaBytesStream: TBytesStream;
  begin
    // Atualizando o status
    ipChatPanelConversa.Status := ipCdsUsuarios.FieldByName('STATUS').AsInteger;

    // Atualizando os demais dados
    if not ipAtualizarSomenteStatus then
      begin
        ipChatPanelConversa.TextoSuperior := TUtils.fpuCapitalize(ipCdsUsuarios.FieldByName('NOME').AsString);

        if ipCdsUsuarios.FieldByName('USUARIO_GRUPO').AsInteger = 0 then
          ipChatPanelConversa.TextoInferior := TUtils.fpuCapitalize(ipCdsUsuarios.FieldByName('FUNCAO').AsString);

        // Antes de incluir a imagem tem ajust�-la, caso necess�rio
        if ipCdsUsuarios.FieldByName('FOTO_THUMBNAIL_AJUSTAR').AsInteger = 1 then
          ppvAjustarImagem(ipCdsUsuarios, False, True);

        // Thumbnail
        if not ipCdsUsuarios.FieldByName('FOTO_THUMBNAIL').isNull then
          begin
            vaPicture := nil;

            try
              vaBytesStream := TBytesStream.Create;
              TBlobField(ipCdsUsuarios.FieldByName('FOTO_THUMBNAIL')).SaveToStream(vaBytesStream);
              vaBytesStream.Position := 0;
              vaPicture := fpuRetornaImagem(vaBytesStream);

              if Assigned(vaPicture) then
                ipChatPanelConversa.FotoThumbnail.Graphic := vaPicture.Graphic
              else
                begin
                  if ipCdsUsuarios.FieldByName('USUARIO_GRUPO').AsInteger = 0 then
                    ipChatPanelConversa.FotoThumbnail.Assign(DMChat.ImgCollectionItemUsuario.Picture)
                  else
                    ipChatPanelConversa.FotoThumbnail.Assign(DMChat.ImgCollectionItemGrupo.Picture);
                end;
            finally
              FreeAndNil(vaBytesStream);

              if Assigned(vaPicture) then
                FreeAndNil(vaPicture);
            end;
          end
        else
          begin
            if ipCdsUsuarios.FieldByName('USUARIO_GRUPO').AsInteger = 0 then
              ipChatPanelConversa.FotoThumbnail.Assign(DMChat.ImgCollectionItemUsuario.Picture)
            else
              ipChatPanelConversa.FotoThumbnail.Assign(DMChat.ImgCollectionItemGrupo.Picture);
          end;
      end;
  end;

  // Este procedimento exclui todos os usu�rios do grupo que est�o na tela
  procedure plcRemoverUsuariosGrupo;
  begin
    if Assigned(slbListaUsuariosGrupo) then
      FreeAndNil(slbListaUsuariosGrupo);

    slbListaUsuariosGrupo := TcxScrollBox.Create(Self);
    slbListaUsuariosGrupo.Parent := tabGrupo;
    slbListaUsuariosGrupo.Align := alClient;
    slbListaUsuariosGrupo.Name := 'slbListaUsuariosGrupo';
  end;

  // Este procedimento atualiza somente o panel de um usu�rio espec�fico e se estiver selecionado a aba do perfil do usu�rio
  // O ClientDataSet passado como par�metro, deve est� posicionado no registro correto
  procedure plcAtualizarUsuario(ipChatPanelConversaAba: TChatPanelConversaAba; const ipCdsUsuarios: TpmClientDataSet; const ipAtualizarSomenteStatus: Boolean);
  var
    vaGraphic: TGraphic;
    vaBytesStream: TBytesStream;
    vaCdsHospitais: TpmClientDataSet;
  begin
    // Atualizando os dados o panel
    plcAtualizarChatPanel(ipChatPanelConversaAba, ipCdsUsuarios, ipAtualizarSomenteStatus);

    // Se a conversa est� selecionada, ent�o vamos atualizar tamb�m a aba do perfil do usu�rio
    if ipChatPanelConversaAba = FChatPanelSelecionado then
      begin
        tabPerfil.TabVisible := True;
        tabGrupo.TabVisible := False;
        pgcDadosConversa.ActivePage := tabPerfil;
        plcRemoverUsuariosGrupo;

        // Atualizando o status do usu�rio
        case ipCdsUsuarios.FieldByName('STATUS').AsInteger of
          0: // Desconectado
            begin
              lblStatus.Caption := 'Desconectado';
              spStatus.Brush.Color := clGrayText;
            end;
          1: // Conectado
            begin
              lblStatus.Caption := 'Conectado';
              spStatus.Brush.Color := clGreen;
            end;
        else // Ausente
          begin
            lblStatus.Caption := 'Ausente';
            spStatus.Brush.Color := $0001C8EB;
          end;
        end;

        // Atualizando os demais dados
        if not ipAtualizarSomenteStatus then
          begin
            // Antes de incluir a imagem tem ajust�-la, caso necess�rio
            if ipCdsUsuarios.FieldByName('FOTO_AJUSTAR').AsInteger = 1 then
              ppvAjustarImagem(ipCdsUsuarios, True, False);

            // Carregando a foto do perfil
            if not ipCdsUsuarios.FieldByName('FOTO').isNull then
              begin
                vaGraphic := nil;

                try
                  vaBytesStream := TBytesStream.Create;
                  TBlobField(ipCdsUsuarios.FieldByName('FOTO')).SaveToStream(vaBytesStream);
                  vaBytesStream.Position := 0;
                  vaGraphic := TChatFuncoes.fpuImagem(vaBytesStream, TWICImageFormat.wifJpeg);

                  if Assigned(vaGraphic) then
                    imgFotoUsuario.Picture.Graphic := vaGraphic
                  else
                    imgFotoUsuario.Picture := DMChat.ImgCollectionItemUsuarioPerfil.Picture;
                finally
                  FreeAndNil(vaGraphic);
                  FreeAndNil(vaBytesStream);
                end;
              end
            else
              imgFotoUsuario.Picture := DMChat.ImgCollectionItemUsuarioPerfil.Picture;

            lblNomeUsuario.Caption := TUtils.fpuCapitalize(ipCdsUsuarios.FieldByName('NOME').AsString);
            lblFuncao.Caption := TUtils.fpuCapitalize(ipCdsUsuarios.FieldByName('FUNCAO').AsString);
            lblEmail.Caption := AnsiLowerCase(ipCdsUsuarios.FieldByName('EMAIL').AsString);

            if ipCdsUsuarios.FieldByName('PROMEDICO').AsInteger = 1 then
              lblHospital.Caption := 'Pr�-M�dico'
            else
              begin
                vaCdsHospitais := fpvClonarClientDataSet(DMChat.cdsHospitais);

                try
                  if vaCdsHospitais.Locate('CODIGO', ipCdsUsuarios.FieldByName('CODIGO_HOSPITAL').AsInteger, []) then
                    lblHospital.Caption := TUtils.fpuCapitalize(vaCdsHospitais.FieldByName('RAZAO_SOCIAL').AsString)
                  else
                    lblHospital.Caption := '';
                finally
                  vaCdsHospitais.Close;
                  FreeAndNil(vaCdsHospitais);
                end;
              end;
          end;
      end;
  end;

  // Este procedimento atualiza os dados do grupo e se esitver selecionada a conversa,
  // atualiza tamb�m os dados dos integrantes do grupo
  // O ClientDataSet passado como par�metro, deve est� posicionado no registro correto
  procedure plcAtualizarGrupo(ipChatPanelConversaAba: TChatPanelConversaAba; const ipCdsUsuarios: TpmClientDataSet; const ipAtualizarSomenteStatus: Boolean);
  var
    i: Integer;
    vaChatPanelConversa: TChatPanelConversa;
    vaCdsHospitais: TpmClientDataSet;
    vaUsuarioLogado: TChatIdentificacaoUsuario;
  begin
    // Atualizando o panel da conversa do grupo
    plcAtualizarChatPanel(ipChatPanelConversaAba, ipCdsUsuarios, False);

    // Se o grupo estiver selecionado, ent�o vamos atualizar o perfil do grupo e os dados dos usu�rios do grupo
    if ipChatPanelConversaAba = FChatPanelSelecionado then
      begin
        // Atualizando o perfil do grupo
        tabPerfil.TabVisible := False;
        tabGrupo.TabVisible := True;
        pgcDadosConversa.ActivePage := tabGrupo;

        if not ipAtualizarSomenteStatus then
          begin
            lblNomeGrupo.Caption := TUtils.fpuCapitalize(ipCdsUsuarios.FieldByName('NOME').AsString);
            vaCdsHospitais := fpvClonarClientDataSet(DMChat.cdsHospitais);

            try
              vaCdsHospitais.Filtered := False;
              vaCdsHospitais.Filter := 'codigo = ' + ipCdsUsuarios.FieldByName('CODIGO_HOSPITAL').AsString;
              vaCdsHospitais.Filtered := True;

              lblHospitalGrupo.Caption := TUtils.fpuCapitalize(vaCdsHospitais.FieldByName('RAZAO_SOCIAL').AsString);
            finally
              vaCdsHospitais.Close;
              FreeAndNil(vaCdsHospitais);
            end;
          end;

        // Atualizando as informa��es dos usu�rios do grupo
        if ipAtualizarSomenteStatus then
          begin
            // ***************************************************
            // Atualizando somente o status dos usu�ros do grupo *
            // ***************************************************

            // Percorrendo os usu�rios que est�o sendo exibidos e atualizando somente o status
            for i := 0 to slbListaUsuariosGrupo.ComponentCount - 1 do
              begin
                if ipCdsUsuarios.Locate('CODIGO;CODIGO_HOSPITAL', TChatFuncoes.fpuCodigosUsuarioHospital(TChatPanel(slbListaUsuariosGrupo.Components[i]).Identificador), []) then
                  plcAtualizarUsuario(TChatPanelConversaAba(slbListaUsuariosGrupo.Components[i]), ipCdsUsuarios, True);
              end;
          end
        else
          begin
            // *******************************************************
            // Atualizando todas a informa��es dos usu�rios do grupo *
            // *******************************************************

            // Removendo todos os usu�rios do grupo
            tabGrupo.Visible := False;
            Application.ProcessMessages;
            plcRemoverUsuariosGrupo;
            slbListaUsuariosGrupo.LockScrollBars;

            // Pesquisando os usu�rios do grupo, exceto o usu�rio logado
            try
              fpvUsuarioLogado(TChatFuncoes.fpuCodigoHospital(ipChatPanelConversaAba.Identificador), vaUsuarioLogado);
              DMChat.cdsUsuarios_Aux.Close;
              DMChat.cdsUsuarios_Aux.Data := DMChat.cdsUsuarios.Data;
              DMChat.cdsUsuarios_Aux.Filtered := False;
              DMChat.cdsUsuarios_Aux.Filter :=
                'codigo_hospital = ' + IntToStr(TChatFuncoes.fpuCodigoHospital(ipChatPanelConversaAba.Identificador)) + ' and ' +
                'usuario_grupo = 0 and ' +
                'grupos_usuario like (' + QuotedStr('%;' + IntToStr(TChatFuncoes.fpuCodigoUsuario(ipChatPanelConversaAba.Identificador)) + ';%') + ') and ' +
                'codigo <> ' + IntToStr(vaUsuarioLogado.CodigoUsuario);
              DMChat.cdsUsuarios_Aux.Filtered := True;
              DMChat.cdsUsuarios_Aux.First;

              // Adicionando todos os usu�rios do grupo
              while not DMChat.cdsUsuarios_Aux.Eof do
                begin
                  // Criando o panel e definindo suas caracter�sticas. Este panel pertence a lista de usu�rios do grupo
                  vaChatPanelConversa := TChatPanelConversa.Create(slbListaUsuariosGrupo);
                  vaChatPanelConversa.Align := alTop;
                  vaChatPanelConversa.Visible := False;
                  vaChatPanelConversa.Identificador := TChatFuncoes.fpuMontaIdentificador(DMChat.cdsUsuarios_AuxCODIGO.AsInteger, DMChat.cdsUsuarios_AuxCODIGO_HOSPITAL.AsInteger);
                  vaChatPanelConversa.Name := 'pnl' + vaChatPanelConversa.Identificador;
                  vaChatPanelConversa.Parent := TWinControl(slbListaUsuariosGrupo);
                  vaChatPanelConversa.ppuImagemBotaoFechar(DMChat.ImgListBotoes16x16, 0);

                  // Incluir o panel na �ltima posi��o
                  vaChatPanelConversa.Top := slbListaUsuariosGrupo.ComponentCount * vaChatPanelConversa.Height;

                  vaChatPanelConversa.PodeFechar := False;
                  vaChatPanelConversa.Visible := True;
                  vaChatPanelConversa.OnMouseUp := ppvSelecionarUsuarioGrupo;

                  plcAtualizarChatPanel(vaChatPanelConversa, DMChat.cdsUsuarios_Aux, False);
                  DMChat.cdsUsuarios_Aux.Next;
                end;
            finally
              slbListaUsuariosGrupo.UnlockScrollBars;
              DMChat.cdsUsuarios_Aux.Filtered := False;
              DMChat.cdsUsuarios_Aux.Filter := '';
              DMChat.cdsUsuarios_Aux.Close;
            end;

            tabGrupo.Visible := True;
          end;
      end;
  end;

var
  i: Integer;
  vaUsuarioPertenceAoGrupox: Boolean;
  vaCdsUsuarios: TpmClientDataSet;
  vaChatPanelConversaAba: TChatPanelConversaAba;
begin
  vaCdsUsuarios := nil;

  try
    if TRegEx.IsMatch(ipIdentificador, '^n?\d{1,}_n?\d{1,}$', [roSingleLine]) then
      begin
        // ********************************************
        // Atualizando um usu�rio ou grupo espec�fico *
        // ********************************************

        // Pesquisando o panel da conversa
        if Assigned(ipChatPanelConversaAba) and (ipChatPanelConversaAba.Parent = slbConversasListaUsuarios) then
          // Se passou o panel como par�metro, ent�o n�o precisa pesquisar a conversa aberta
          vaChatPanelConversaAba := ipChatPanelConversaAba
        else
          // Pesquisando uma conversa aberta do us�rio
          vaChatPanelConversaAba := TChatPanelConversaAba(slbConversasListaUsuarios.FindComponent('pnl' + ipIdentificador));

        // Se a conversa existe, ent�o vamos atualiz�-la
        if Assigned(vaChatPanelConversaAba) then
          begin
            // Clonando o ClientDataSet de usu�rios, caso haja alguma conversa aberta
            vaCdsUsuarios := fpvClonarClientDataSet(DMChat.cdsUsuarios);
            vaCdsUsuarios.IndexFieldNames := 'CODIGO;CODIGO_HOSPITAL';

            // Localizando o registro do usu�rio
            if vaCdsUsuarios.Locate('CODIGO;CODIGO_HOSPITAL', TChatFuncoes.fpuCodigosUsuarioHospital(ipIdentificador), []) then
              begin
                case vaCdsUsuarios.FieldByName('USUARIO_GRUPO').AsInteger of
                  0: // Usu�rio espec�fico
                    begin
                      // Atualizando os dados do usu�rio
                      plcAtualizarUsuario(vaChatPanelConversaAba, vaCdsUsuarios, ipSomenteStatus);

                      // Esta parte ser� executada, somente se n�o passou um TChatPanel como par�metros.
                      // Verificando se existe uma conversa selecionada e se esta conversa � em grupo
                      if (not Assigned(ipChatPanelConversaAba)) and
                        Assigned(FChatPanelSelecionado) and
                        (FChatPanelSelecionado.TipoAba = TChatTipoAba.taConversaGrupo) and
                         // Verificando se o usu�rio pertence ao grupo
                        ((TChatFuncoes.fpuCodigoUsuario(FChatPanelSelecionado.Identificador) = 0) or
                        TRegEx.IsMatch(vaCdsUsuarios.FieldByName('GRUPOS_USUARIO').AsString, ';' + IntToStr(TChatFuncoes.fpuCodigoUsuario(FChatPanelSelecionado.Identificador)) + ';', [])) then
                        begin
                          plcAtualizarGrupo(FChatPanelSelecionado, vaCdsUsuarios, ipSomenteStatus);
                        end;
                    end;
                  1: // Grupo espec�fico
                    plcAtualizarGrupo(vaChatPanelConversaAba, vaCdsUsuarios, ipSomenteStatus);
                end;
              end;
          end;
      end
    else
      begin
        // ****************************************
        // Atualizando todas as conversas abertas *
        // ****************************************

        // Clonando o ClientDataSet de usu�rios, caso haja alguma conversa aberta
        if slbConversasListaUsuarios.ComponentCount > 0 then
          begin
            vaCdsUsuarios := fpvClonarClientDataSet(DMChat.cdsUsuarios);
            vaCdsUsuarios.IndexFieldNames := 'CODIGO;CODIGO_HOSPITAL';
          end;

        // Passando em todas as conversas abertas
        for i := 0 to slbConversasListaUsuarios.ComponentCount - 1 do
          begin
            vaChatPanelConversaAba := TChatPanelConversaAba(slbConversasListaUsuarios.Components[i]);

            if vaCdsUsuarios.Locate('CODIGO;CODIGO_HOSPITAL', TChatFuncoes.fpuCodigosUsuarioHospital(vaChatPanelConversaAba.Identificador), []) then
              begin
                case vaCdsUsuarios.FieldByName('USUARIO_GRUPO').AsInteger of
                  0: // Usu�rio
                    plcAtualizarUsuario(vaChatPanelConversaAba, vaCdsUsuarios, ipSomenteStatus);
                  1: // Grupo
                    plcAtualizarGrupo(vaChatPanelConversaAba, vaCdsUsuarios, ipSomenteStatus);
                end;
              end;
          end;
      end;
  finally
    if Assigned(vaCdsUsuarios) then
      begin
        vaCdsUsuarios.Close;
        FreeAndNil(vaCdsUsuarios);
      end;
  end;
end;

procedure TfrmChatTela.ppvCarregarAnexos(const ipChatPanelConversaAba: TChatPanelConversaAba);
var
  vaListaPropAnexos: System.TArray<TChatAnexoPropriedades>;
  vaPropAnexo: TChatAnexoPropriedades;
begin
  // Limpando os anexos da conversa anterior e carregando os anexos da nova conversa
  while slbAnexos.ComponentCount > 0 do
    slbAnexos.Components[0].Free;

  // Carregando os novos anexos
  vaListaPropAnexos := ipChatPanelConversaAba.Mensagem.AnexosPropriedades;
  ppvPanelConversaAnexosVisivel(Length(vaListaPropAnexos) > 0);

  for vaPropAnexo in vaListaPropAnexos do
    ppvAdicionarPanelAnexo(vaPropAnexo);
end;

procedure TfrmChatTela.ppvCarregarArquivos(
  const ipIdentificador: string);
var
  vaChatPanelArquivo: TChatPanelArquivo;
  vaPicture: TPicture;
  vaGraphic: TGraphic;
  vaBytesStream: TBytesStream;
  vaCodigoHospital: Integer;
begin
  vaPicture := nil;
  vaGraphic := nil;
  vaBytesStream := nil;
  vaCodigoHospital := TChatFuncoes.fpuCodigoHospital(ipIdentificador);

  // Removendo da listas todos os arquivos antes de incluir os novos
  while slbListaArquivos.ComponentCount > 0 do
    slbListaArquivos.Components[0].Free;

  // Verificando se existe os dados da conversa
  if FDadosConversas.ContainsKey(ipIdentificador) and (not VarIsNull(FDadosConversas.Items[ipIdentificador].Anexos)) then
    begin
      try
        DMChat.cdsMensagem_Anexo.Data := FDadosConversas.Items[ipIdentificador].Anexos;
        DMChat.cdsMensagem_Anexo.First;

        while not DMChat.cdsMensagem_Anexo.Eof do
          begin
            // Adicionando o panel do arquivo
            vaChatPanelArquivo := TChatPanelArquivo.Create(slbListaArquivos);
            vaChatPanelArquivo.Visible := False;
            vaChatPanelArquivo.Align := alTop;
            vaChatPanelArquivo.PodeFechar := False;
            vaChatPanelArquivo.Identificador := TChatFuncoes.fpuMontaIdentificador(DMChat.cdsMensagem_AnexoCODIGO.AsInteger, vaCodigoHospital);
            vaChatPanelArquivo.Name := 'pnl' + vaChatPanelArquivo.Identificador;
            vaChatPanelArquivo.Parent := TWinControl(slbListaArquivos);
            vaChatPanelArquivo.Top := ((slbListaArquivos.ControlCount - 1) * vaChatPanelArquivo.Height) + 1;
            vaChatPanelArquivo.EnderecoArquivo := DMChat.cdsMensagem_AnexoENDERECO_ANEXO.AsString;
            vaChatPanelArquivo.OnClick := ppvSelecionarArquivo;
            vaChatPanelArquivo.TextoSuperior := DMChat.cdsMensagem_AnexoNOME_ARQUIVO.AsString;
            vaChatPanelArquivo.TextoInferior := FormatDateTime('dd/mm/yyyy', DMChat.cdsMensagem_AnexoDATA_HORA_ENVIO.AsDateTime) + ' | ' + TChatFuncoes.fpuTamanhoFormatado(DMChat.cdsMensagem_AnexoTAMANHO_KB.AsLargeInt * 1024) + ' | ' +
              DMChat.cdsUsuariosNOME.AsString;
            vaChatPanelArquivo.ppuImagemBotaoFechar(DMChat.ImgListBotoes16x16, 0);

            try
              if DMChat.cdsMensagem_AnexoTHUMBNAIL.isNull then
                vaChatPanelArquivo.TipoArquivo := TChatTipoArquivo.taqOutros
              else
                begin
                  vaChatPanelArquivo.TipoArquivo := TChatTipoArquivo.taqImagem;
                  vaBytesStream := TBytesStream.Create;
                  DMChat.cdsMensagem_AnexoTHUMBNAIL.SaveToStream(vaBytesStream);
                  vaBytesStream.Position := 0;
                  vaGraphic := TChatFuncoes.fpuImagem(vaBytesStream, TWICImageFormat.wifJpeg);

                  if Assigned(vaGraphic) then
                    begin
                      vaPicture := TPicture.Create;
                      vaPicture.Graphic := vaGraphic;
                    end;
                end;

              ppvCarregarImagemArquivo(vaChatPanelArquivo, ExtractFileExt(DMChat.cdsMensagem_AnexoNOME_ARQUIVO.AsString), vaPicture);
            finally
              if Assigned(vaPicture) then
                FreeAndNil(vaPicture);

              if Assigned(vaGraphic) then
                FreeAndNil(vaGraphic);

              if Assigned(vaBytesStream) then
                FreeAndNil(vaBytesStream);
            end;

            vaChatPanelArquivo.Visible := True;

            if (vaChatPanelArquivo.Top + vaChatPanelArquivo.Height) > slbListaArquivos.Height then
              slbListaArquivos.VertScrollBar.Position := slbListaArquivos.VertScrollBar.Range;

            DMChat.cdsMensagem_Anexo.Next;
          end;
      finally
        if DMChat.cdsMensagem_Anexo.Active then
          begin
            DMChat.cdsMensagem_Anexo.EmptyDataSet;
            DMChat.cdsMensagem_Anexo.Close;
          end;
      end;
    end;
end;

procedure TfrmChatTela.ppvCarregarImagemArquivo(
  ipChatPanelArquivo: TChatPanelArquivo; ipExtArquivo: string;
  ipImagem: TPicture);
var
  vaPicture: TPicture;
begin
  vaPicture := nil;

  // Incluindo o �cone de acordo com a extens�o do arquivo
  if Assigned(ipImagem) and Assigned(ipImagem.Graphic) then
    ipChatPanelArquivo.FotoThumbnail := ipImagem
  else
    begin
      try
        vaPicture := TChatFuncoes.fpuIconeArquivo(ipExtArquivo, DMChat);
        ipChatPanelArquivo.FotoThumbnail := vaPicture;
      finally
        if Assigned(vaPicture) then
          FreeAndNil(vaPicture);
      end;
    end;
end;

procedure TfrmChatTela.ppvCarregarMensgensBancoDados(
  const ipIdentificador: string);
var
  vaMensagens, vaAnexos: OleVariant;
  vaIdUsuarioConversa, vaUsuarioLogado: TChatIdentificacaoUsuario;
  vaDadosConversa: TChatDadosConversa;
  vaTotalPaginas: Integer;
begin
  if not fpvUsuarioLogado(TChatFuncoes.fpuCodigoHospital(ipIdentificador), vaUsuarioLogado) then
    begin
      MessageTela('Falha ao pesquisar as mensagens.' + sLineBreak + 'N�o foi poss�vel identificar o usu�rio logado.');
      Exit;
    end;

  vaIdUsuarioConversa.CodigoHospital := TChatFuncoes.fpuCodigoHospital(ipIdentificador);

  if TChatFuncoes.fpuCodigoUsuario(ipIdentificador) = FCodigoUsuarioSistema then
    vaIdUsuarioConversa.CodigoUsuario := 0
  else
    vaIdUsuarioConversa.CodigoUsuario := TChatFuncoes.fpuCodigoUsuario(ipIdentificador);

  if fpvPesquisarConversa(
    TChatTipoPesquisa.tpqUltimasMensagens,
    '',
    StrToDate('01/01/1900'),
    StrToDate('01/01/1900'),
    vaUsuarioLogado,
    vaIdUsuarioConversa,
    (TChatFuncoes.fpuCodigoUsuario(ipIdentificador) = FCodigoUsuarioSistema),
    True,
    vaMensagens,
    vaAnexos) then
    begin
      DMChat.cdsMensagem.Data := vaMensagens;

      try
        vaTotalPaginas := DMChat.cdsMensagem.RecordCount div 500;

        if (DMChat.cdsMensagem.RecordCount mod 500) > 0 then
          Inc(vaTotalPaginas);
      finally
        DMChat.cdsMensagem.EmptyDataSet;
        DMChat.cdsMensagem.Close;
      end;

      // Armazenando os dados da pesquisa
      vaDadosConversa := FDadosConversas.Items[ipIdentificador];
      vaDadosConversa.Mensagens := vaMensagens;
      vaDadosConversa.Anexos := vaAnexos;
      vaDadosConversa.PosicaoScroll := -1;
      FDadosConversas.Items[ipIdentificador] := vaDadosConversa;
    end;
end;

procedure TfrmChatTela.ppvClickLink(Sender: TObject; id: Integer);

  procedure plcPesquisar(const ipTag: string);
  var
    vaIdUsuarioConversa, vaUsuarioLogado: TChatIdentificacaoUsuario;
    vaUsuarioSistema: Boolean;
    vaIdentificador: string;
    vaMensagem, vaMensagemAnexo: OleVariant;
  begin
    vaIdentificador := TRegEx.Match(ipTag, '(?<=#idUserConversa).*?(?=#DestacarTexto)', [roIgnoreCase]).Value;

    if TRegEx.IsMatch(ipTag, '#VoltarPesquisa', [roIgnoreCase]) then
      begin
        // O usu�rio est� voltando a pesquisa
        FChatPanelSelecionado.Tag := 0;

        ppvPreencherRichViewEdit(
          FDadosUltimaPesquisa.Mensagens,
          rvePesquisa,
          vaIdentificador,
          FDadosUltimaPesquisa.PosicaoScroll,
          TRegEx.Match(ipTag, '(?<=#DestacarTexto).*', [roIgnoreCase]).Value,
          True,
          False,
          True,
          0,
          erResultadoPesquisa);
      end
    else
      begin
        // O usu�rio est� pesquisando a continuidade de uma conversa
        vaMensagem := null;
        vaMensagemAnexo := null;
        vaIdUsuarioConversa.CodigoHospital := TChatFuncoes.fpuCodigoHospital(vaIdentificador);
        vaUsuarioSistema := TChatFuncoes.fpuCodigoUsuario(vaIdentificador) = FCodigoUsuarioSistema;
        fpvUsuarioLogado(vaIdUsuarioConversa.CodigoHospital, vaUsuarioLogado);

        if vaUsuarioSistema then
          vaIdUsuarioConversa.CodigoUsuario := 0
        else
          vaIdUsuarioConversa.CodigoUsuario := TChatFuncoes.fpuCodigoUsuario(TRegEx.Match(ipTag, '(?<=#idUserConversa).*?(?=#DestacarTexto)', [roIgnoreCase]).Value);

        if fpvPesquisarConversa(
          TChatTipoPesquisa.tpqCodigoMesagensProximas,
          TRegEx.Match(ipTag, '(?<=#CodMsg)-?\d{1,}', [roIgnoreCase]).Value,
          StrToDate('01/01/1900'),
          StrToDate('01/01/1900'),
          vaUsuarioLogado,
          vaIdUsuarioConversa,
          vaUsuarioSistema,
          True,
          vaMensagem,
          vaMensagemAnexo) then
          begin
            // Gravando o posicionamento na pesquisa, antes de preencher o RichViewEdit
            FDadosUltimaPesquisa.PosicaoScroll := rvePesquisa.VScrollPos;
            FChatPanelSelecionado.Tag := 1;

            // Preenchendo o RichViewEdit
            ppvPreencherRichViewEdit(
              vaMensagem,
              rvePesquisa,
              vaIdentificador,
              0,
              TRegEx.Match(ipTag, '(?<=#DestacarTexto).*', [roIgnoreCase]).Value,
              False,
              True,
              True,
              StrToIntDef(TRegEx.Match(ipTag, '(?<=#CodMsg)-?\d{1,}', [roIgnoreCase]).Value, 0),
              erResultadoPesquisa);
          end;
      end;

    rvePesquisa.SetFocus;
  end;

var
  vaRVE: TRichViewEdit absolute Sender;
  vaRVFormattedData: TCustomRVFormattedData;
  vaCustomRVItemInfo: TCustomRVItemInfo;
  vaItemNo: Integer;
  vaTag: TRVTag;
begin
  FSecaoCriticaBancoDadosUsuarios.Enter;
  FSecaoCriticaBancoDadosConversas.Enter;

  try
    if (Sender is TRichViewEdit) then
      begin
        vaRVE.GetJumpPointLocation(id, vaRVFormattedData, vaItemNo);
        vaCustomRVItemInfo := vaRVFormattedData.GetItem(vaItemNo);
        vaTag := vaCustomRVItemInfo.Tag;

        if TRegEx.IsMatch(vaTag, '^(e-mail|link)', [roIgnoreCase, roSingleLine]) then
          TChatFuncoes.ppuLink(vaTag, vaItemNo, vaRVFormattedData)
        else
          begin
            if TRegEx.IsMatch(vaTag, '^status', [roIgnoreCase, roSingleLine]) then
              TChatFuncoes.ppuLeitoresMensagem(vaTag, fpvPesquisarLeitoresMensagens)
            else
              begin
                if TRegEx.IsMatch(vaTag, '^pesquisar', [roIgnoreCase]) then
                  plcPesquisar(vaTag)
                else
                  begin
                    if TRegEx.IsMatch(vaTag, '^arquivo', [roIgnoreCase]) then
                      TChatFuncoes.ppuArquivo(vaTag, FPastaInicialSalvarImagem, fpvDownloadArquivo);
                  end;
              end;
          end;
      end;
  finally
    FSecaoCriticaBancoDadosConversas.Release;
    FSecaoCriticaBancoDadosUsuarios.Release;
  end;
end;

procedure TfrmChatTela.ppvConfigFonteAtualizarVisualizacao;
begin
  if (not VarIsNull(cbConfigFonteNome.EditValue)) and (cbConfigFonteNome.EditValue <> '') then
    begin
      lblConfigFonteVisualizacao.Style.Font.Name := cbConfigFonteNome.EditValue;
      lblConfigFonteVisualizacao.Caption := cbConfigFonteNome.EditValue;
    end;

  lblConfigFonteVisualizacao.Style.Font.Size := StrToIntDef(EditConfigFonteTamanho.EditingText, 8);
end;

procedure TfrmChatTela.ppvCriarEspacoArmazenamentoConversa(
  const ipIdentificador: string);
var
  vaDadosConversa: TChatDadosConversa;
begin
  // Criando um espa�o para armazenar os dados da conversa
  if not FDadosConversas.ContainsKey(ipIdentificador) then
    begin
      vaDadosConversa.Anexos := null;
      vaDadosConversa.Mensagens := null;
      vaDadosConversa.PosicaoScroll := 0;
      FDadosConversas.Add(ipIdentificador, vaDadosConversa);
    end;
end;

procedure TfrmChatTela.ppvDeletarAnexo(Sender: TObject);
begin
  if (Sender is TChatPanel) and Assigned(FChatPanelSelecionado) and (TChatPanel(Sender).Parent = slbAnexos) then
    begin
      FChatPanelSelecionado.Mensagem.fpuDeletarAnexo(TChatPanel(Sender).Tag);
      lblAnexos.Caption := TRegEx.Replace(lblAnexos.Caption, '(?<=Tot: ).*', FormatFloat(',0.00', FChatPanelSelecionado.Mensagem.AnexosTotal / 1048576) + 'MB', [roIgnoreCase, roSingleLine]);
      lblAnexosQtde.Caption := TRegEx.Replace(lblAnexosQtde.Caption, '\d{1,}', IntToStr(FChatPanelSelecionado.Mensagem.AnexosQtde), [roIgnoreCase, roSingleLine]);
      ppvPanelConversaAnexosVisivel(FChatPanelSelecionado.Mensagem.AnexosQtde > 0);
    end;
end;

procedure TfrmChatTela.ppvDescompactarArquivo(const ipArquivo: TBytesStream;
  const ipDestinoArquivo: string);
var
  vaBytesStream: TBytesStream;
begin
  if Assigned(ipArquivo) then
    begin
      try
        ppvDescompactarArquivo(ipArquivo, vaBytesStream);
        vaBytesStream.SaveToFile(ipDestinoArquivo);
      finally
        if Assigned(vaBytesStream) then
          FreeAndNil(vaBytesStream);
      end;
    end;
end;

procedure TfrmChatTela.ppvDescompactarArquivo(const ipArquivo: TBytesStream;
  var ioArquivoDescompactado: TBytesStream);
  function ExtractTempDir: String;
  var
    vaBuffer: array [0 .. 144] of Char;
  begin
    GetTempPath(144, vaBuffer);
    Result := IncludeTrailingPathDelimiter(StrPas(vaBuffer));
  end;

  function DescompactarArquivo(ipPastaDestino: string): string;
  var
    vaZip: TZipFile;
  begin
    vaZip := TZipFile.Create;
    Result := '';

    try
      vaZip.Open(ipArquivo, zmRead);
      vaZip.ExtractAll(IncludeTrailingPathDelimiter(ipPastaDestino)); // Local onde o arquivo ser� descompactado
      Result := vaZip.FileName[0];
    finally
      FreeAndNil(vaZip);
    end;
  end;

var
  vaPastaTemp, vaNomeArquivo: string;
begin
  ioArquivoDescompactado := TBytesStream.Create;

  try
    vaPastaTemp := ExtractTempDir + 'ProMedicoArquivosTemp';
    vaNomeArquivo := DescompactarArquivo(vaPastaTemp);
    ioArquivoDescompactado.LoadFromFile(IncludeTrailingPathDelimiter(vaPastaTemp) + vaNomeArquivo);
    DeleteFile(IncludeTrailingPathDelimiter(vaPastaTemp) + vaNomeArquivo);
  except
    on E: Exception do
      begin
        if Assigned(ioArquivoDescompactado) then
          FreeAndNil(ioArquivoDescompactado);

        MessageTela('Falha ao descompactar o arquivo.' + sLineBreak + E.Message);
      end;
  end;
end;

procedure TfrmChatTela.ppvFecharConversa(Sender: TObject);
var
  i: Integer;
  vaChatPanelConversaAba: TChatPanelConversaAba absolute Sender;
begin
  if Sender is TChatPanelConversaAba then
    begin
      if vaChatPanelConversaAba.SelecionadoCtrl then
        vaChatPanelConversaAba.SelecionadoCtrl := False;

      if vaChatPanelConversaAba = FChatPanelSelecionado then
        begin
          i := 0;

          while (i < slbConversasListaUsuarios.ComponentCount) and (vaChatPanelConversaAba.Name <> slbConversasListaUsuarios.Components[i].Name) do
            Inc(i);

          if i < (slbConversasListaUsuarios.ComponentCount - 1) then
            TChatPanelConversaAba(slbConversasListaUsuarios.Components[i + 1]).Selecionado := True
          else
            begin
              if i > 0 then
                TChatPanelConversaAba(slbConversasListaUsuarios.Components[i - 1]).Selecionado := True
              else
                begin
                  vaChatPanelConversaAba.Selecionado := False;
                  FChatPanelSelecionado := nil;
                  pgcPrincipal.ActivePage := TabInicial;

                  if (fsModal in Self.FormState) then
                    Self.Close;
                end;
            end;
        end;

      // Se a aba (panel) que foi fechada � uma conversa e n�o se refere ao usu�rio do sistema e nem ao grupo
      // "Todos", ent�o tem informar que a conversa foi fechada para n�o abr�-la automaticamente quando o
      // chat for aberto futuramente
      if (vaChatPanelConversaAba.TipoAba in [TChatTipoAba.taConversaGrupo, TChatTipoAba.taConversaUsuario]) and
        (not(TChatFuncoes.fpuCodigoUsuario(vaChatPanelConversaAba.Identificador) in [0, FCodigoUsuarioSistema])) then
        begin
          // Informando que o panel foi fechado (Conversa inativa)
          ppvMudarStatusConversa(vaChatPanelConversaAba.Identificador, False);
        end;

      // Se aba (panel) que foi fechada � uma pesquisa, ent�o vamos limpar
      // os dados para liberar espa�o da mem�ria, pois esta pesquisa n�o
      // ser� recuperada novamente
      if vaChatPanelConversaAba.TipoAba = TChatTipoAba.taPesquisa then
        begin
          FDadosUltimaPesquisa.Anexos := null;
          FDadosUltimaPesquisa.Mensagens := null;
          FDadosUltimaPesquisa.PosicaoScroll := 0;
        end;
    end;
end;

procedure TfrmChatTela.ppvFecharTelaVisualizacoesMensagem(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) and (Sender is TForm) then
    TForm(Sender).Close;
end;

procedure TfrmChatTela.ppvFecharTelaVisualizacoesMensagem(Sender: TObject);
begin
  if (Sender is TButton) and (TButton(Sender).Owner is TForm) then
    TForm(TButton(Sender).Owner).Close;
end;

procedure TfrmChatTela.ppvIncluirStatusMensagem(ipCelula: TRVTableCellData;
  const ipParagrafo: Integer; const ipCodigoLeitura: string; ipMsgLida: Boolean);
var
  vaGraphic: TGraphic;
  vaPicture: TPicture;
  i: Integer;
begin
  if ipMsgLida then
    vaPicture := DMChat.ImgCollectionItemStatusMensagemLida.Picture
  else
    vaPicture := DMChat.ImgCollectionItemStatusMensagemRecebida.Picture;

  if Assigned(vaPicture) then
    begin
      if ipCelula.ItemCount > 0 then
        ipCelula.DeleteItems(0, ipCelula.ItemCount);

      vaGraphic := TGraphicClass(vaPicture.Graphic.ClassType).Create;
      vaGraphic.Assign(vaPicture.Graphic);
      ipCelula.AddHotPictureTag('', vaGraphic, ipParagrafo, rvvaMiddle, 'status' + ipCodigoLeitura);
    end;
end;

procedure TfrmChatTela.ppvMudarStatusConversa(const ipIdentificador: string;
  const ipConversaAtiva: Boolean);
var
  vaUsuarioLoagado, vaUsuarioConversa: TChatIdentificacaoUsuario;
begin
  vaUsuarioConversa.CodigoUsuario := TChatFuncoes.fpuCodigoUsuario(ipIdentificador);

  if Assigned(FAoMudarStatusConversa) and
    (vaUsuarioConversa.CodigoUsuario <> 0) and
    (vaUsuarioConversa.CodigoUsuario <> FCodigoUsuarioSistema) and
    ((not(fsModal in Self.FormState)) or (not FTelaModalSimplificada)) then
    begin
      vaUsuarioConversa.CodigoHospital := TChatFuncoes.fpuCodigoHospital(ipIdentificador);

      vaUsuarioLoagado.CodigoHospital := vaUsuarioConversa.CodigoHospital;
      vaUsuarioLoagado.CodigoUsuario := FUsuarioLogado.Items[vaUsuarioConversa.CodigoHospital].IdentificacaoUsuario.CodigoUsuario;

      FAoMudarStatusConversa(vaUsuarioLoagado, vaUsuarioConversa, ipConversaAtiva);
    end;
end;

procedure TfrmChatTela.ppvPanelConversaAnexosVisivel(const ipVisivel: Boolean);
begin
  if pnlConversaAnexos.Visible <> ipVisivel then
    begin
      if not ipVisivel then
        begin
          pnlConversaRodape.Height := pnlConversaRodape.Height + pnlConversaAnexos.Height;
          pnlConversaAnexos.Visible := True;
        end
      else
        begin
          pnlConversaAnexos.Visible := False;
          pnlConversaRodape.Height := pnlConversaRodape.Height - pnlConversaAnexos.Height;
        end;
    end;
end;

procedure TfrmChatTela.ppvPanelEnviarMensagemUsuariosConectados(
  const ipVisivel: Boolean);
begin
  if (pgcPrincipal.ActivePage = TabConversa) and (pnlEnviarMensagemUsuariosConectados.Visible <> ipVisivel) then
    begin
      if ipVisivel then
        begin
          pnlConversaRodape.Height := pnlConversaRodape.Height + pnlEnviarMensagemUsuariosConectados.Height;
          pnlEnviarMensagemUsuariosConectados.Visible := True;
        end
      else
        begin
          pnlEnviarMensagemUsuariosConectados.Visible := False;
          pnlConversaRodape.Height := pnlConversaRodape.Height - pnlEnviarMensagemUsuariosConectados.Height;
        end;
    end;
end;

procedure TfrmChatTela.ppvPegarArquivoArrastato(var Msg: TMessage);
var
  i, FileCount, BufferSize: Word;
  Drop: HDROP;
  FileName: string;
  vaArquivos: TStringList;
begin
  // Pega o manipulador (handle) da opera��o "arrastar e soltar" (drag-and-drop)
  if Msg.Msg = WM_DROPFILES then
    begin
      Drop := Msg.wParam;
      FileCount := DragQueryFile(Drop, $FFFFFFFF, nil, 0); // Pega a quantidade de arquivos soltos (dropped)

      if FileCount = 0 then
        begin
          MessageTela('Nenhum arquivo selecinado.');
          Exit;
        end;

      try
        // Anexando os arquivos
        vaArquivos := TStringList.Create;

        for i := 0 to FileCount - 1 do // Pega todos os nomes de arquivos e Adiciona-os na lista
          begin
            BufferSize := DragQueryFile(Drop, i, nil, 0); // Obt�m o comprimento necess�rio para o nome do arquivo, sem contar o caractere nulo do fim da string
            SetLength(FileName, BufferSize + 1); // O +1 � p/ nulo do fim da string

            if DragQueryFile(Drop, i, PChar(FileName), BufferSize + 1) = BufferSize then
              vaArquivos.Add(string(PChar(FileName)))
            else
              MessageTela('Erro ao obter nome do arquivo.');
          end;

        if vaArquivos.Count > 0 then
          ppvAnexarArquivos(vaArquivos);
      finally
        FreeAndNil(vaArquivos);
      end;

      Msg.Result := 0;
    end
  else
    FOriginalWindowProc(Msg);
end;

procedure TfrmChatTela.ppvPesquisaUsuario;
var
  vaCodigoHospital: string;
  vaUsuarioLogado: System.TArray<TPair<Integer, TChatUsuarioLogado>>;
  vaPair: TPair<Integer, TChatUsuarioLogado>;
begin
  EditNomeUsuario.PostEditValue;
  DMChat.cdsUsuarios.Filtered := False;

  // Filtrando o usu�rio pelo nome
  if VarIsNull(EditNomeUsuario.EditValue) or (EditNomeUsuario.EditValue = '') then
    DMChat.cdsUsuarios.Filter := ''
  else
    DMChat.cdsUsuarios.Filter := 'nome like (' + QuotedStr(EditNomeUsuario.EditValue + '%') + ')';

  // Filtrando por status
  if not ckbStatus.Checked then
    begin
      if DMChat.cdsUsuarios.Filter = '' then
        DMChat.cdsUsuarios.Filter := DMChat.cdsUsuarios.Filter + 'status = ' + IntToStr(cbStatus.EditValue)
      else
        DMChat.cdsUsuarios.Filter := DMChat.cdsUsuarios.Filter + 'and status = ' + IntToStr(cbStatus.EditValue);
    end;

  // Filtrando os usu�rio por grupo
  if (not ckbTodosGrupos.Checked) and (not DMChat.cdsUsuarios.Filtered) then
    begin
      if DMChat.cdsUsuarios.Filter = '' then
        DMChat.cdsUsuarios.Filter := DMChat.cdsUsuarios.Filter + ' ('
      else
        DMChat.cdsUsuarios.Filter := DMChat.cdsUsuarios.Filter + ' and (';

      if VarIsNull(cbGrupo.EditValue) or (cbGrupo.EditValue = 0) then
        begin
          if VarIsNull(cbGrupo.EditValue) then
            // N�o selecionou nenhum grupo, ent�o n�o vamos trazer nenhum registro
            DMChat.cdsUsuarios.Filter := DMChat.cdsUsuarios.Filter + 'codigo = 0 and codigo > 1'
          else
            begin
              // Grupo "Todos", ent�o vamos trazer todos os usu�rios mais o pr�prio grupo
              DMChat.cdsUsuarios.Filter := DMChat.cdsUsuarios.Filter +
                'codigo_hospital = ' + IntToStr(DMChat.cdsGruposCODIGO_HOSPITAL.AsInteger) + ' and ' +
                '(usuario_grupo = 0 or codigo = 0)';
            end;
        end
      else
        begin
          // Selecionou um grupo, ent�o vamos trazer todos os usu�rios do grupo mais o pr�prio grupo
          DMChat.cdsUsuarios.Filter := DMChat.cdsUsuarios.Filter +
            'codigo_hospital = ' + IntToStr(DMChat.cdsGruposCODIGO_HOSPITAL.AsInteger) + ' and ' +
            'grupos_usuario like (' + QuotedStr('%;' + IntToStr(cbGrupo.EditValue) + ';%') + ')';
        end;

      DMChat.cdsUsuarios.Filter := DMChat.cdsUsuarios.Filter + ')';
    end;

  // Eliminando da pesquisa o usu�rio logado, pois o usu�rio n�o vai enviar mensagem para ele mesmo
  if not DMChat.cdsUsuarios.Filtered then
    begin
      vaUsuarioLogado := FUsuarioLogado.ToArray;

      for vaPair in vaUsuarioLogado do
        begin
          if DMChat.cdsUsuarios.Filter <> '' then
            DMChat.cdsUsuarios.Filter := DMChat.cdsUsuarios.Filter + ' and ';

          DMChat.cdsUsuarios.Filter := DMChat.cdsUsuarios.Filter +
            '((codigo <> ' + IntToStr(vaPair.Value.IdentificacaoUsuario.CodigoUsuario) +
            ' and codigo_hospital = ' + IntToStr(vaPair.Value.IdentificacaoUsuario.CodigoHospital) +
            ') or (codigo_hospital <> ' + IntToStr(vaPair.Value.IdentificacaoUsuario.CodigoHospital) + '))';
        end;
    end;

  // Efetuando a pesquisa
  DMChat.cdsUsuarios.Filtered := True;
end;

procedure TfrmChatTela.ppvPreencherRichViewEdit(const ipMensagem: OleVariant;
  ipRVE: TRichViewEdit; const ipIdentificador: string;
  const ipPosicaoScroll: Integer; ipLimparRichViewEdit: Boolean);
begin
  ppvPreencherRichViewEdit(ipMensagem, ipRVE, ipIdentificador, ipPosicaoScroll, '', False, False, ipLimparRichViewEdit, 0, erNormal);
end;

procedure TfrmChatTela.ppvPreencherRichViewEdit(const ipMensagem: OleVariant;
  ipRVE: TRichViewEdit; const ipIdentificador: string;
  const ipPosicaoScroll: Integer);
begin
  ppvPreencherRichViewEdit(ipMensagem, ipRVE, ipIdentificador, ipPosicaoScroll, '', False, False, True, 0, erNormal);
end;

procedure TfrmChatTela.ppvPreencherRichViewEdit(const ipMensagem: OleVariant;
  ipRVE: TRichViewEdit; const ipIdentificador: string;
  const ipPosicaoScroll: Integer; const ipDestacarTextoPesquisa: string;
  const ipExibirLinkVisualizacaoPesquisa, ipExibirLinkVoltarPesquisa,
  ipLimparRichViewEdit: Boolean; const ipCodigoMensagemDestacar: Integer;
  const ipEstilo: TChatEstiloRich);

var
  vaCodigoHospital, vaCodigoPrimeiraMsgNaoLida: Integer;
  vaUsuarioLogado: TChatIdentificacaoUsuario;
begin
  // Pesquisando o c�digo do hospital
  vaCodigoHospital := TChatFuncoes.fpuCodigoHospital(ipIdentificador);

  // Pesquisando o usu�rio logado
  if not fpvUsuarioLogado(vaCodigoHospital, vaUsuarioLogado) then
    begin
      MessageTela('Falha ao carregar as mensagens.' + sLineBreak + 'N�o foi poss�vel identificar o usu�rio logado.');
      Exit;
    end;

  // Preenchendo o RichViewEdit
  TChatFuncoes.ppuPreencherRichViewEdit(
    ipMensagem,
    ipRVE,
    ipIdentificador,
    ipPosicaoScroll,
    ipDestacarTextoPesquisa,
    ipExibirLinkVisualizacaoPesquisa,
    ipExibirLinkVoltarPesquisa,
    ipLimparRichViewEdit,
    ipCodigoMensagemDestacar,
    ipEstilo,
    DMChat,
    FSmileys,
    FSmileysExpressaoRegular,
    FAoConfirmarLeituraMensagens,
    vaUsuarioLogado,
    FDadosConversas,
    vaCodigoPrimeiraMsgNaoLida);

  // Posicionando o scroll na tela
  if ipCodigoMensagemDestacar <> 0 then
    ipRVE.VScrollPos := ipRVE.VScrollMax div 2
  else
    begin
      if (vaCodigoPrimeiraMsgNaoLida = 0) or (not fpvPosicionarMensagemNoRich(vaCodigoPrimeiraMsgNaoLida, vaCodigoHospital, ipRVE)) then
        begin
          if (ipPosicaoScroll >= 0) and (ipPosicaoScroll <= ipRVE.VScrollMax) then
            ipRVE.VScrollPos := ipPosicaoScroll
          else
            ipRVE.VScrollPos := ipRVE.VScrollMax;
        end;
    end;
end;

function TfrmChatTela.fpvPosicionarMensagemNoRich(ipCodigoMensagem, ipCodigoHospital: Integer; ipRVE: TRichViewEdit): Boolean;
var
  i, vaLeft, vaTop: Integer;
  vaItem: TCustomRVItemInfo;
  vaIdentificador: String;
begin
  Result := False;
  vaIdentificador := ipCodigoMensagem.ToString() + '_' + ipCodigoHospital.ToString();

  for i := 0 to ipRVE.ItemCount - 1 do
    begin
      vaItem := ipRVE.GetItem(i);

      if (vaItem.Tag = vaIdentificador) and (vaItem is TRVTableItemInfo) then
        begin
          ipRVE.SetSelectionBounds(i, 0, i, 0);
          ipRVE.GetItemCoords(i, vaLeft, vaTop);
          ipRVE.ScrollTo(vaTop);

          Result := True;
          break;
        end;
    end;
end;

procedure TfrmChatTela.ppvSelecionarArquivo(Sender: TObject);
var
  vaChatPanelArquivo: TChatPanelArquivo absolute Sender;
begin
  if (Sender is TChatPanelArquivo) then
    begin
      if vaChatPanelArquivo.TipoArquivo = TChatTipoArquivo.taqImagem then
        TChatFuncoes.ppuVisualizarArquivo(TChatFuncoes.fpuCodigoHospital(vaChatPanelArquivo.Identificador), vaChatPanelArquivo.EnderecoArquivo, FPastaInicialSalvarImagem, fpvDownloadArquivo)
      else
        TChatFuncoes.ppuSalvarArquivo(TChatFuncoes.fpuCodigoHospital(vaChatPanelArquivo.Identificador), vaChatPanelArquivo.EnderecoArquivo, FPastaInicialSalvarImagem, fpvDownloadArquivo);
    end;
end;

procedure TfrmChatTela.ppvSelecionarConversa(Sender: TObject);
var
  vaChatPanelConversaAba: TChatPanelConversaAba absolute Sender;
  vaStringStream: TStringStream;
  vaOffSet, vaRecNo: Integer;
  vaUsuarioLogado: TChatUsuarioLogado;
  vaDadosConversa: TChatDadosConversa;
  vaChatPanelSelecionadoCtrl: TDictionary<string, TChatPanelConversaAba>.TPairEnumerator;
begin
  if Sender is TChatPanelConversaAba then
    begin
      // Houve mudan�a na sele��o da conversa, ent�o vamos o aviso da mensagem
      ppvPanelEnviarMensagemUsuariosConectados(False);

      // Houve mudan�a na sele��o da conversa, ent�o vamos limpar todos os panels que est�o
      // selecionados com "control"
      vaChatPanelSelecionadoCtrl := FChatPanelSelecionadoCtrl.GetEnumerator;

      while vaChatPanelSelecionadoCtrl.MoveNext do
        vaChatPanelSelecionadoCtrl.Current.Value.SelecionadoCtrl := False;

      // A��es do panel que acabou de ser desmarcado
      if (not vaChatPanelConversaAba.Selecionado) then
        begin
          // Antes de carregar a nova conversa, vamos salvar o que est� escrito, mas n�o foi enviado ainda
          vaStringStream := TStringStream.Create;

          try
            rveMensagensEdit.SaveTextToStream('', vaStringStream, 0, False, True);
            vaStringStream.Position := 0;
            vaChatPanelConversaAba.Mensagem.MensagemTXT := vaStringStream.ReadString(vaStringStream.Size);
          finally
            FreeAndNil(vaStringStream);
          end;

          // Gravando a p�gina e a posi��o do scroll na p�gina
          vaDadosConversa := FDadosConversas.Items[vaChatPanelConversaAba.Identificador];
          vaDadosConversa.PosicaoScroll := rveMensagens.VScrollPos;
          FDadosConversas.Items[vaChatPanelConversaAba.Identificador] := vaDadosConversa;
        end;

      // A��es do panel que acabou de ser selecionado
      if vaChatPanelConversaAba.Selecionado and ((not Assigned(FChatPanelSelecionado)) or (vaChatPanelConversaAba <> FChatPanelSelecionado)) then
        begin
          FSecaoCriticaBancoDadosUsuarios.Enter;
          FSecaoCriticaBancoDadosConversas.Enter;

          try
            if Assigned(FChatPanelSelecionado) then
              FChatPanelSelecionado.Selecionado := False;

            FChatPanelSelecionado := vaChatPanelConversaAba;

            if not vaChatPanelConversaAba.PodeFechar then
              vaChatPanelConversaAba.PodeFechar := True;

            // Carregando os dados do usu�rio logado
            if not fpvUsuarioLogado(TChatFuncoes.fpuCodigoHospital(FChatPanelSelecionado.Identificador), vaUsuarioLogado) then
              begin
                MessageTela('N�o foi poss�vel identificar o usu�rio logado.');
                Exit;
              end;

            // Carregando os dados do usu�rio selecionado
            ppvAtualizarDadosUsuarioTela(vaChatPanelConversaAba.Identificador, vaChatPanelConversaAba);

            // Limpando os dados da conversa anterior
            rveMensagens.Clear;

            // Verificando se h� a necessidade de pesquisar as conversas no banco de dados
            if VarIsNull(FDadosConversas.Items[vaChatPanelConversaAba.Identificador].Mensagens) then
              ppvCarregarMensgensBancoDados(vaChatPanelConversaAba.Identificador);

            // Carregando as conversas na tela
            vaDadosConversa := FDadosConversas.Items[vaChatPanelConversaAba.Identificador];
            ppvPreencherRichViewEdit(
              FDadosConversas.Items[vaChatPanelConversaAba.Identificador].Mensagens,
              rveMensagens,
              vaChatPanelConversaAba.Identificador,
              vaDadosConversa.PosicaoScroll);

            // Carregando os arquivos da conversa selecionada (Arquivos que j� foram enviados)
            ppvCarregarArquivos(vaChatPanelConversaAba.Identificador);

            // Carregando os anexos da conversa selecionada (Arquivos que ainda n�o foram enviados)
            ppvCarregarAnexos(vaChatPanelConversaAba);

            // Limpando o campo de mensagem da conversa anterior e carregando a mensagem da nova conversa que ainda n�o foi enviada
            rveMensagensEdit.Clear;

            // Selecionando a aba do editor de conversa
            pgcPrincipal.ActivePage := TabConversa;
            pnlAlertaConversa.Visible := fpvVisualizarSomenteMensagensEnviadas(vaChatPanelConversaAba.Identificador);

            try
              vaStringStream := TStringStream.Create(vaChatPanelConversaAba.Mensagem.MensagemTXT);

              if Assigned(vaStringStream) then
                begin
                  vaStringStream.Position := 0;
                  rveMensagensEdit.LoadTextFromStream(vaStringStream, 0, 0, True);
                end;
            finally
              if Assigned(vaStringStream) then
                FreeAndNil(vaStringStream);
            end;

            rveMensagensEdit.Change;
            rveMensagensEdit.Format;

            // Posicionando o cursor no final do texto
            vaOffSet := rveMensagensEdit.GetOffsAfterItem(rveMensagensEdit.ItemCount - 1);
            rveMensagensEdit.SetSelectionBounds(rveMensagensEdit.ItemCount - 1, vaOffSet, rveMensagensEdit.ItemCount - 1, vaOffSet);

            // Focando no RichViewEdit
            if Self.Showing then
              rveMensagensEdit.SetFocus;

            try
              DMChat.cdsUsuarios.DisableConstraints;
              vaRecNo := DMChat.cdsUsuarios.RecNo;

              if DMChat.cdsUsuarios.Locate('CODIGO;CODIGO_HOSPITAL', TChatFuncoes.fpuCodigosUsuarioHospital(FChatPanelSelecionado.Identificador), []) then
                begin
                  if DMChat.cdsUsuariosATIVO_INATIVO.AsInteger = 0 then
                    begin
                      if DMChat.cdsUsuariosNOME.AsString = 'TODOS' then
                        DMChat.Ac_Smiles.Enabled := vaUsuarioLogado.EnviaMensagemGrupoTodos
                      else
                        DMChat.Ac_Smiles.Enabled := True;
                    end
                  else
                    DMChat.Ac_Smiles.Enabled := False;

                  DMChat.Ac_Anexar.Enabled := DMChat.Ac_Smiles.Enabled;
                end;
            finally
              DMChat.cdsUsuarios.RecNo := vaRecNo;
              DMChat.cdsUsuarios.EnableConstraints;
            end;
          finally
            FSecaoCriticaBancoDadosConversas.Release;
            FSecaoCriticaBancoDadosUsuarios.Release;
          end;
        end;

      // A��es do panel que est� selecionado e foi selecionado novamente
      if Assigned(FChatPanelSelecionado) and (vaChatPanelConversaAba = FChatPanelSelecionado) then
        begin
          if vaChatPanelConversaAba.Selecionado and (pgcPrincipal.ActivePage = TabConversa) and Self.Showing and rveMensagensEdit.Showing then
            rveMensagensEdit.SetFocus;
        end;
    end;
end;

procedure TfrmChatTela.ppvSelecionarConversaCtrl(Sender: TObject);
var
  vaChatPanelConversaAba: TChatPanelConversaAba absolute Sender;
begin
  if (Sender is TChatPanelConversaAba) then
    begin
      if vaChatPanelConversaAba.SelecionadoCtrl then
        begin
          if not FChatPanelSelecionadoCtrl.ContainsKey(vaChatPanelConversaAba.Name) then
            FChatPanelSelecionadoCtrl.Add(vaChatPanelConversaAba.Name, vaChatPanelConversaAba);
        end
      else
        begin
          if FChatPanelSelecionadoCtrl.ContainsKey(vaChatPanelConversaAba.Name) then
            FChatPanelSelecionadoCtrl.Remove(vaChatPanelConversaAba.Name);
        end;
    end;
end;

procedure TfrmChatTela.ppvSelecionarUsuarioGrupo(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Sender is TChatPanelConversa) and ((not(fsModal in Self.FormState)) or (not FTelaModalSimplificada)) then
    ppvAdicionarConversa(TChatPanelConversa(Sender).Identificador, True, False);
end;

procedure TfrmChatTela.ppvTelaVisualizacoesMensagemMouseWeelDown(
  Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
  vaComponente: TComponent;
  vaVertScrollBar: TcxScrollBoxScrollBarOptions;
begin
  if Sender is TForm then
    begin
      vaComponente := TForm(Sender).FindComponent('sbxListaNomes');

      if Assigned(vaComponente) and (vaComponente is TcxScrollBox) then
        begin
          vaVertScrollBar := TcxScrollBox(vaComponente).VertScrollBar;

          if (vaVertScrollBar.Position + vaVertScrollBar.Increment) <= vaVertScrollBar.Range then
            vaVertScrollBar.Position := vaVertScrollBar.Position + vaVertScrollBar.Increment
          else
            vaVertScrollBar.Position := vaVertScrollBar.Range;
        end;
    end;
end;

procedure TfrmChatTela.ppvTelaVisualizacoesMensagemMouseWeelUp(
  Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
  vaComponente: TComponent;
  vaVertScrollBar: TcxScrollBoxScrollBarOptions;
begin
  if Sender is TForm then
    begin
      vaComponente := TForm(Sender).FindComponent('sbxListaNomes');

      if Assigned(vaComponente) and (vaComponente is TcxScrollBox) then
        begin
          vaVertScrollBar := TcxScrollBox(vaComponente).VertScrollBar;

          if (vaVertScrollBar.Position - vaVertScrollBar.Increment) >= 0 then
            vaVertScrollBar.Position := vaVertScrollBar.Position - vaVertScrollBar.Increment
          else
            vaVertScrollBar.Position := 0;
        end;
    end;
end;

procedure TfrmChatTela.rveMensagensEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if (Key = VK_RETURN) and (not((ssCtrl in Shift) or (ssShift in Shift))) then
    begin
      Key := 0;
      DMChat.Ac_Enviar.Execute;
    end;
end;

procedure TfrmChatTela.rveMensagensEditKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  // Este evento foi criado apenas para que o "Enter" n�o funcione como "Tab" no rveMensagensEdit,
  // pois este possui suas pr�prias funcionalidades
end;

procedure TfrmChatTela.rveMensagensEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  TChatFuncoes.ppuConverterTextoParaSmileys(rveMensagensEdit, DMChat, FSmileys, FSmileysExpressaoRegular);
end;

procedure TfrmChatTela.rveMensagensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if (not(ssCtrl in Shift)) and (not(Key in [VK_RETURN, VK_F1 .. VK_F24])) then
    rveMensagensEdit.SetFocus;
end;

procedure TfrmChatTela.SetAoCapturarImagem(const Value: TNotifyEvent);
begin
  FAoCapturarImagem := Value;
end;

procedure TfrmChatTela.SetAoConfirmarLeituraMensagens(const Value: TChatConfirmarLeituraMensagens);
begin
  FAoConfirmarLeituraMensagens := Value;
end;

procedure TfrmChatTela.SetAoEnviarMensagem(const Value: TChatEnviarMensagem);
begin
  FAoEnviarMensagem := Value;
end;

procedure TfrmChatTela.SetAoFazerDownloadArquivo(
  const Value: TChatDownloadArquivo);
begin
  FAoFazerDownloadArquivo := Value;
end;

procedure TfrmChatTela.SetAoMudarStatusConversa(
  const Value: TChatMudarStatusConversa);
begin
  FAoMudarStatusConversa := Value;
end;

procedure TfrmChatTela.SetAoPesquisarAnexos(const Value: TChatPesquisarAnexos);
begin
  FAoPesquisarAnexos := Value;
end;

procedure TfrmChatTela.SetAoPesquisarConfiguracoes(
  const Value: TChatPesquisarConfiguracoes);
begin
  FAoPesquisarConfiguracoes := Value;
end;

procedure TfrmChatTela.SetAoPesquisarGrupos(const Value: TChatPesquisarGrupos);
begin
  FAoPesquisarGrupos := Value;
end;

procedure TfrmChatTela.SetAoPesquisarLeitores(
  const Value: TChatPesquisarLeitoresMensagens);
begin
  FAoPesquisarLeitores := Value;
end;

procedure TfrmChatTela.SetAoPesquisarMensagens(
  const Value: TChatPesquisarMensagens);
begin
  FAoPesquisarMensagens := Value;
end;

procedure TfrmChatTela.SetAoPesquisarUsuarios(
  const Value: TChatPesquisarUsuarios);
begin
  FAoPesquisarUsuarios := Value;
end;

procedure TfrmChatTela.SetAoSalvarConfiguracoes(
  const Value: TChatSalvarConfiguracoes);
begin
  FAoSalvarConfiguracoes := Value;
end;

procedure TfrmChatTela.SetCodigoUsuarioConversaInicial(const Value: Integer);
begin
  FCodigoUsuarioConversaInicial := Value;
end;

procedure TfrmChatTela.SetTelaModalSimplificada(const Value: Boolean);
begin
  FTelaModalSimplificada := Value;
end;

end.
