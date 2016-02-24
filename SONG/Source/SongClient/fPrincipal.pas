unit fPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasico, fLogin, uTypes,
  cxLookAndFeelPainters, cxGraphics, dxSkinsCore, dxSkinBlack, cxClasses,
  dxAlertWindow, System.Actions, Vcl.ActnList, Vcl.Menus, uUtils, fPerfil,
  cxControls, cxLookAndFeels, dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC,
  fPessoa, dxSkinsForm, Vcl.StdCtrls, fOrganizacao, fProjeto, fFinanciador,
  fBanco, fAtividade;

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
    procedure Ac_PerfisExecute(Sender: TObject);
    procedure Ac_PessoasExecute(Sender: TObject);
    procedure dxSkinController1SkinControl(Sender: TObject; AControl: TWinControl; var UseSkin: Boolean);
    procedure Ac_OrganizacaoExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Ac_ProjetoExecute(Sender: TObject);
    procedure Ac_FinanciadorExecute(Sender: TObject);
    procedure Ac_BancoExecute(Sender: TObject);
    procedure Ac_AtividadeExecute(Sender: TObject);
  protected
    procedure pprAfterShow(var ipMsg: TMessage); override;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}


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

procedure TfrmPrincipal.Ac_FinanciadorExecute(Sender: TObject);
begin
  inherited;
  TUtils.ppuAbrirFormAba<TfrmFinanciador>(pcPrincipal, TfrmFinanciador, frmFinanciador);
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

procedure TfrmPrincipal.dxSkinController1SkinControl(Sender: TObject; AControl: TWinControl; var UseSkin: Boolean);
begin
  inherited;
  UseSkin := not(AControl is TButton);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  ReportMemoryLeaksOnShutdown := True;
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
