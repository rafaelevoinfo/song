unit fPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasico, fLogin, uTypes,
  cxLookAndFeelPainters, cxGraphics, dxSkinsCore, dxSkinBlack, cxClasses,
  dxAlertWindow, System.Actions, Vcl.ActnList, Vcl.Menus, uUtils, fPerfil,
  cxControls, cxLookAndFeels, dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC,
  fPessoa, dxSkinsForm, Vcl.StdCtrls, fOrganizacao, fProjeto, fFinanciador,
  fBanco, fAtividade, fEspecie, fFornecedor, fMatriz, fCanteiro,
  fLote_Semente, fLote_Muda, fPlano_Contas, fRubrica, fConta_Pagar, Vcl.ExtCtrls,
  fConta_Receber, fCliente, fItem, fEntrada, fSolicitacaoCompra;

type
  TfrmPrincipal = class(TfrmBasico)
    mmMenuPrincipal: TMainMenu;
    ActionList1: TActionList;
    Ac_Pessoas: TAction;
    miRecursosHumanos: TMenuItem;
    Pessoa1: TMenuItem;
    Ac_Perfis: TAction;
    PerfisdeUsurios1: TMenuItem;
    pcPrincipal: TcxPageControl;
    tabDashBoard: TcxTabSheet;
    dxSkinController1: TdxSkinController;
    Ac_Organizacao: TAction;
    Ac_Projeto: TAction;
    Ac_Financiador: TAction;
    miGestao: TMenuItem;
    Financiadores2: TMenuItem;
    Organizaes1: TMenuItem;
    Projetos1: TMenuItem;
    Ac_Banco: TAction;
    miFinanceiro: TMenuItem;
    Bancos1: TMenuItem;
    Ac_Atividade: TAction;
    Atividades1: TMenuItem;
    miViveiro: TMenuItem;
    Ac_Especie: TAction;
    Espcie1: TMenuItem;
    Ac_Fornecedor: TAction;
    Fornecedores1: TMenuItem;
    Ac_Matriz: TAction;
    Matrizes1: TMenuItem;
    Ac_Lote_Semente: TAction;
    Lotes1: TMenuItem;
    Ac_Canteiro: TAction;
    Canteiros1: TMenuItem;
    Ac_Lote_Muda: TAction;
    LotesdeMudas1: TMenuItem;
    Ac_Plano_Contas: TAction;
    readeCusto1: TMenuItem;
    Ac_Rubricas: TAction;
    Rubricas1: TMenuItem;
    Ac_Conta_Pagar: TAction;
    ContasaPagar1: TMenuItem;
    Ac_Conta_Receber: TAction;
    ContasaReceber1: TMenuItem;
    Ac_Cliente: TAction;
    Clientes1: TMenuItem;
    Estoque1: TMenuItem;
    Ac_Item: TAction;
    Itens1: TMenuItem;
    Ac_Entrada: TAction;
    Entradas1: TMenuItem;
    Ac_Solicitacao_Compra: TAction;
    SolicitaodeCompra1: TMenuItem;
    procedure Ac_PerfisExecute(Sender: TObject);
    procedure Ac_PessoasExecute(Sender: TObject);
    procedure dxSkinController1SkinControl(Sender: TObject; AControl: TWinControl; var UseSkin: Boolean);
    procedure Ac_OrganizacaoExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Ac_ProjetoExecute(Sender: TObject);
    procedure Ac_FinanciadorExecute(Sender: TObject);
    procedure Ac_BancoExecute(Sender: TObject);
    procedure Ac_AtividadeExecute(Sender: TObject);
    procedure Ac_EspecieExecute(Sender: TObject);
    procedure Ac_FornecedorExecute(Sender: TObject);
    procedure Ac_MatrizExecute(Sender: TObject);
    procedure Ac_Lote_SementeExecute(Sender: TObject);
    procedure Ac_CanteiroExecute(Sender: TObject);
    procedure Ac_Lote_MudaExecute(Sender: TObject);
    procedure Ac_Plano_ContasExecute(Sender: TObject);
    procedure Ac_RubricasExecute(Sender: TObject);
    procedure Ac_Conta_PagarExecute(Sender: TObject);
    procedure Ac_Conta_ReceberExecute(Sender: TObject);
    procedure Ac_ClienteExecute(Sender: TObject);
    procedure Ac_ItemExecute(Sender: TObject);
    procedure Ac_EntradaExecute(Sender: TObject);
    procedure Ac_Solicitacao_CompraExecute(Sender: TObject);
  protected
    procedure pprAfterShow(var ipMsg: TMessage); override;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}


procedure TfrmPrincipal.Ac_Plano_ContasExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmPlanoContas>(pcPrincipal, TfrmPlanoContas, frmPlanoContas);
end;

procedure TfrmPrincipal.Ac_AtividadeExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmAtividade>(pcPrincipal, TfrmAtividade, frmAtividade);
end;

procedure TfrmPrincipal.Ac_BancoExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmBanco>(pcPrincipal, TfrmBanco, frmBanco);
end;

procedure TfrmPrincipal.Ac_CanteiroExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmCanteiro>(pcPrincipal, TfrmCanteiro, frmCanteiro);
end;

procedure TfrmPrincipal.Ac_ClienteExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TFrmCliente>(pcPrincipal, TFrmCliente, frmCliente);
end;

procedure TfrmPrincipal.Ac_Conta_PagarExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TFrmContaPagar>(pcPrincipal, TFrmContaPagar, frmContaPagar);
end;

procedure TfrmPrincipal.Ac_Conta_ReceberExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmContaReceber>(pcPrincipal, TfrmContaReceber, frmContaReceber);
end;

procedure TfrmPrincipal.Ac_EntradaExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmEntrada>(pcPrincipal, TfrmEntrada, frmEntrada);
end;

procedure TfrmPrincipal.Ac_EspecieExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmEspecie>(pcPrincipal, TfrmEspecie, frmEspecie);
end;

procedure TfrmPrincipal.Ac_FinanciadorExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmFinanciador>(pcPrincipal, TfrmFinanciador, frmFinanciador);
end;

procedure TfrmPrincipal.Ac_FornecedorExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmFornecedor>(pcPrincipal, TfrmFornecedor, frmFornecedor);
end;

procedure TfrmPrincipal.Ac_ItemExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmItem>(pcPrincipal, TfrmItem, frmItem);
end;

procedure TfrmPrincipal.Ac_Lote_MudaExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmLoteMuda>(pcPrincipal, TfrmLoteMuda, frmLoteMuda);
end;

procedure TfrmPrincipal.Ac_Lote_SementeExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmLoteSemente>(pcPrincipal, TfrmLoteSemente, frmLoteSemente);
end;

procedure TfrmPrincipal.Ac_MatrizExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmMatriz>(pcPrincipal, TfrmMatriz, frmMatriz);
end;

procedure TfrmPrincipal.Ac_OrganizacaoExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmOrganizacao>(pcPrincipal, TfrmOrganizacao, frmOrganizacao);
end;

procedure TfrmPrincipal.Ac_PerfisExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmPerfil>(pcPrincipal, TfrmPerfil, frmPerfil);
end;

procedure TfrmPrincipal.Ac_PessoasExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmPessoa>(pcPrincipal, TfrmPessoa, frmPessoa);
end;

procedure TfrmPrincipal.Ac_ProjetoExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmProjeto>(pcPrincipal, TfrmProjeto, frmProjeto);
end;

procedure TfrmPrincipal.Ac_RubricasExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TFrmRubrica>(pcPrincipal, TFrmRubrica, frmRubrica);
end;

procedure TfrmPrincipal.Ac_Solicitacao_CompraExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmSolicitacaoCompra>(pcPrincipal, TfrmSolicitacaoCompra, frmSolicitacaoCompra);
end;

procedure TfrmPrincipal.dxSkinController1SkinControl(Sender: TObject; AControl: TWinControl; var UseSkin: Boolean);
begin
  inherited;
  UseSkin := not(AControl is TButton);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}
  Self.Caption := Self.Caption + ' - Versão: ' + TUtils.fpuVersaoExecutavel(Application.ExeName, viBuild);
end;

procedure TfrmPrincipal.pprAfterShow(var ipMsg: TMessage);
begin
  Application.CreateForm(TfrmLogin, frmLogin);
  frmLogin.ShowModal;
  if not frmLogin.LoginEfetuado then
    begin
      Application.Terminate;
    end;

end;

end.
