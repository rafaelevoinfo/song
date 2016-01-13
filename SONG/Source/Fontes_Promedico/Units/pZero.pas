unit pZero;

interface

uses
  pmClientDataSet, pMethod2009, ppmClasse, pmZeroForm, pmControleAbas, Forms,

  TypInfo {Acessada no mudarcor} , cxControls,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Dialogs,
  cxGridDBTableView, DB, DBClient, AdvAlertWindow, cxPC;

type
  TfrmZero = class(TpmfrmZeroForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pmfrmZeroFormShow(Sender: TObject);
    procedure pmfrmZeroFormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FTelaPai: String;
{$REGION 'Função que diz se o form foi aberto em aba'}
    /// <summary>Função que diz se o form foi aberto em aba</summary>
{$ENDREGION}
    function fpvFormAbertoAba: Boolean;
  protected
    { Protected declarations }
{$REGION 'Form de Origem (Usado quando o form é aberto dentro de uma aba) - Ponteiro'}
    /// <summary>Classe contendo o form de Origem (Usado quando o form é aberto dentro de uma
    /// aba) - Ponteiro</summary>
{$ENDREGION}
    ptFormOrigem: TpmClassForms;

{$REGION 'Aba onde o form se encontra (Usado quando o form é aberto dentro de uma aba)'}
    /// <summary>Aba onde o form se encontra (Usado quando o form é aberto
    /// dentro de uma aba)</summary>
{$ENDREGION}
    ptAbaAtual: TcxTabSheet;

{$REGION 'Aba que sera aberta quando o form for fechado'}
    /// <summary>Aba que sera aberta quando o form for fechado</summary>
{$ENDREGION}
    ptAbaRetorno: TcxTabSheet;

{$REGION 'Caso seja true, iremos impedir que o sistema seja fechado enquanto este f...'}
    /// <summary>Caso seja true, iremos impedir que o sistema seja fechado
    /// enquanto este form estiver aberto</summary>
{$ENDREGION}
    ptPodeFecharForm: Boolean;
    // funcoes e variaveis para poder minimizar corretamente o promedico quando algum form em showmodal estiver aberto
    pvAntigoRestore: TNotifyEvent;
    procedure ppvMinimizarModal(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
    procedure ppvRestaurar(Sender: TObject);

  public

    puAlertaAdv: TAdvAlertWindow;

    puEditarTableError: Boolean;
    puParams: TParams;
    puPermissao: String;

{$REGION 'Propriedade que guarda o nome do form que abriu esta tela. Ex.: Tela de v...'}
    /// <summary>Propriedade que guarda o nome do form que abriu esta tela.
    /// Ex.: Tela de visitantes abre o form de pesquisa de fichas. Então o
    /// telaPai irá guardar a string frmVisitantes.</summary>
{$ENDREGION}
    property TelaPai: String read FTelaPai write FTelaPai;

{$REGION 'Váriavel para controlar a pesquisa'}
    /// <summary>Váriavel para controlar a pesquisa</summary>
    /// <remarks>Caso a váriavel esteja false a pesquisa fica desabilitada,
    /// usada para que não seja realizadas várias pesquisas em sequência
    /// (Devido aos eventos do componentes)</remarks>
{$ENDREGION}
    function LerIni(ipComponenteNome: String): String; overload;
    function LerIni(arquivo_endereco, arquivo_nome, tabela_ini, campo_ini: String): String; overload;
    procedure GravarIni(arquivo_endereco, arquivo_nome, tabela_ini, campo_ini, valor_ini: String); overload;
    procedure GravarIni(ipComponenteNome, ipValor: String); overload;
    function fpuFiltraCodigo(ipClientDataSet: TClientDataSet; ipNomeFiltragem: String; ipCodigo: Integer): Integer;
    // abre tabela com o codigo do registro que foi passado;
{$REGION 'Função para abrir o form dentro de uma aba de outro formulário'}
    /// <summary>Função para abrir o form dentro de uma aba de outro
    /// formulário</summary>
    /// <param name="ipNomeFormOrigem">Nome do Form que esta querendo executar
    /// a função</param>
    /// <param name="ipAbaSeraAberto">tabSheet onde o form irá ficar (Pode ser
    /// passado nil, caso não queira nenhuma ação quando o form for
    /// fechado)</param>
    /// <param name="ipAbaRetorno">Quando o form for fechado, qual aba deverá
    /// ser mostrada</param>
    /// <param name="ipPodeFecharForm">Caso seja True, iremos impedir que o
    /// sistema seja fechado enquanto este form estiver aberto (Default =
    /// True)</param>
    /// <exception cref="Form de Origem não localizado">Acontece quando o
    /// ipNomeFormOrigem aponta para 1 form que não existe</exception>
{$ENDREGION}
    procedure ShowEmAba(ipNomeFormOrigem: String; ipAbaSeraAberto, ipAbaRetorno: TcxTabSheet; ipPodeFecharForm: Boolean = False);
  published
{$REGION 'Troca a cor dos componentes'}
    /// <summary>Troca a cor dos componentes</summary>
    /// <remarks>
    /// <note type="note">Ela precisa estar em published para a rtti
    /// capturar</note>
    /// </remarks>
    /// <example>
    /// <para>Funcao usada para tb mudar a fonte:</para>
    /// <para>var PropInfo: PPropInfo; //vaFont : TFont; begin // vaFont :=
    /// TFont.Create; // vaFont.Color:=clBlack; // vaFont.Name:='MS Sans
    /// Serif'; //pegando a propriedade color PropInfo := GetPropInfo(sender,
    /// 'Color'); //setando a nova cor if Assigned(PropInfo) then
    /// SetOrdProp(sender, PropInfo,clInfoBK);</para>
    /// <para>// //pegando a propriedade font.color // PropInfo :=
    /// GetPropInfo(sender, 'Font'); // //setando a nova cor // if
    /// Assigned(PropInfo) then // SetOrdProp(sender,
    /// PropInfo,LongInt(vaFont)); // FreeAndNil(vaFont);</para>
    /// </example>
{$ENDREGION}
    procedure MudaCor_Entra(Sender: TObject);
    procedure MudaCor_Sai(Sender: TObject);

  end;

var
  frmZero: TfrmZero;

implementation

uses pPrincipal;

{$R *.dfm}


function TfrmZero.fpuFiltraCodigo(ipClientDataSet: TClientDataSet; ipNomeFiltragem: String; ipCodigo: Integer): Integer;
begin
  puParams.CreateParam(ftString, 'TABELA', ptInput).AsString := UpperCase(ipClientDataSet.Name);
  puParams.CreateParam(ftString, ipNomeFiltragem, ptInput).AsInteger := ipCodigo;
  ipClientDataSet.DataRequest(PackageParams(puParams)); // faz a requisição empacotando os parâmetros para OLE
  puParams.Clear;
end;

function TfrmZero.fpvFormAbertoAba: Boolean;
begin
  if Assigned(ptFormOrigem) and Assigned(ptAbaAtual) then
    begin
      if (ptAbaAtual.Parent is TcxPageControl) then
        Result := True
    end
  else
    Result := False;
end;

procedure TfrmZero.GravarIni(arquivo_endereco, arquivo_nome, tabela_ini, campo_ini, valor_ini: String);
begin
  pMethod2009.GravarIni(arquivo_endereco, arquivo_nome, tabela_ini, campo_ini, valor_ini);
end;

procedure TfrmZero.GravarIni(ipComponenteNome, ipValor: String);
begin
  pMethod2009.GravarIni(coEndConfig, coParametrosIni, Self.Name, ipComponenteNome, ipValor);
end;

function TfrmZero.LerIni(arquivo_endereco, arquivo_nome, tabela_ini, campo_ini: String): String;
begin
  Result := pMethod2009.LerIni(arquivo_endereco, arquivo_nome, tabela_ini, campo_ini);
end;

procedure TfrmZero.MudaCor_Entra(Sender: TObject);
var
  PropInfo: PPropInfo;
begin
  // pegando a propriedade color
  PropInfo := GetPropInfo(Sender, 'Color');
  // setando a nova cor
  if Assigned(PropInfo) then
    SetOrdProp(Sender, PropInfo, clInfoBK);

end;

procedure TfrmZero.MudaCor_Sai(Sender: TObject);
var
  PropInfo: PPropInfo;
begin
  // pegando a propriedade color
  PropInfo := GetPropInfo(Sender, 'Color');
  // setando a nova cor
  if Assigned(PropInfo) then
    SetOrdProp(Sender, PropInfo, clWindow);
end;

procedure TfrmZero.ShowEmAba(ipNomeFormOrigem: String; ipAbaSeraAberto, ipAbaRetorno: TcxTabSheet; ipPodeFecharForm: Boolean);
begin
  ptFormOrigem := frmPrincipal.pmControleAbas1.LocalizarForm(ipNomeFormOrigem);
  ptAbaAtual := ipAbaSeraAberto;
  ptAbaRetorno := ipAbaRetorno;
  if fpvFormAbertoAba then
    Begin
      ptPodeFecharForm := ipPodeFecharForm;
      if not ptPodeFecharForm then
        ptFormOrigem.PodeFechar := ptPodeFecharForm;
      TcxPageControl(ptAbaAtual.Parent).ActivePage := ptAbaAtual;
      Self.pmAutoDestruir := True;
      Self.Parent := ptAbaAtual;
      Self.Align := alClient;
      Self.BorderStyle := bsNone;
      Self.Show;
    End
  else // caso nao tenha encontrado o form de origem
    Begin
      MessageTela('Módulo de Origem não encontrado');
      Self.ShowModal;
    End;
end;

function TfrmZero.LerIni(ipComponenteNome: String): String;
begin
  Result := pMethod2009.LerIni(coEndConfig, coParametrosIni, Self.Name, ipComponenteNome);
end;

procedure TfrmZero.pmfrmZeroFormClose(Sender: TObject; var Action: TCloseAction);
begin
  if fpvFormAbertoAba then
    Begin
      TcxPageControl(ptAbaAtual.Parent).ActivePage := ptAbaRetorno;
      if not ptPodeFecharForm then
        ptFormOrigem.PodeFechar := True;
    End;
end;

procedure TfrmZero.pmfrmZeroFormShow(Sender: TObject);
begin
  if fpvFormAbertoAba then // foi aberto em aba
    Begin
      Self.Align := alClient;
      Self.BorderStyle := bsNone;
      Self.Parent := ptAbaAtual;
      ptFormOrigem.PodeFechar := False;
    End;
end;

procedure TfrmZero.ppvMinimizarModal(var Msg: TWMSysCommand);
begin
  if (Msg.cmdtype and $FFF0) = SC_MINIMIZE then
    begin
    { a linha abaixo é por causa de um bug antigo do d5, vamos manter por garantia }
      EnableWindow(Application.handle, True);
      Application.Minimize;
      pvAntigoRestore := Application.OnRestore;
      Application.OnRestore := ppvRestaurar;
      Msg.Result := 0;
    end
  else
    inherited;
end;

procedure TfrmZero.ppvRestaurar(Sender: TObject);
begin
  Application.OnRestore := pvAntigoRestore;
  SetForegroundWindow(handle);
end;

procedure TfrmZero.FormCreate(Sender: TObject);
var
  hSysMenu: HMENU;
begin
  PodeRealizarPesquisa := False;
  puParams := TParams.Create; // cria um params para solicitacao
  puAlertaAdv := TAdvAlertWindow.Create(Self); // criando a variavel para poder monstar mensagem de alerta;
  puEditarTableError := False; // isso para a table não volte a ficar com edição caso seja herado diretamente do pzero;
  // desabilitando o x do systembar
  hSysMenu := GetSystemMenu(Self.handle, False);
  if hSysMenu <> 0 then
    begin
      EnableMenuItem(hSysMenu, SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
      DrawMenuBar(Self.handle);
    end;
  KeyPreview := True;
end;

procedure TfrmZero.FormDestroy(Sender: TObject);
begin
  if Assigned(puParams) then
    FreeAndNil(puParams);
  if Assigned(puAlertaAdv) then
    FreeAndNil(puAlertaAdv);
end;

end.
