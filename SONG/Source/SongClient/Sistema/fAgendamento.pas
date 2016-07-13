unit fAgendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasico, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxStyles, cxEdit,
  cxScheduler, cxSchedulerStorage, cxSchedulerCustomControls,
  cxSchedulerCustomResourceView, cxSchedulerDayView, cxSchedulerDateNavigator,
  cxSchedulerHolidays, cxSchedulerTimeGridView, cxSchedulerUtils,
  cxSchedulerWeekView, cxSchedulerYearView, cxSchedulerGanttView,
  cxSchedulerRecurrence, cxSchedulerTreeListBrowser,
  cxSchedulerRibbonStyleEventEditor, dxSkinsCore, dxSkinBlack,
  dxSkinscxSchedulerPainter, cxClasses, cxSchedulerDBStorage, Vcl.ExtCtrls,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Vcl.StdCtrls, uControleAcesso, uTypes,
  System.TypInfo, dmuLookup, dmuSistema, uClientDataSet, dmuPrincipal;

type
  TfrmAgendamento = class(TfrmBasico)
    pnControlBox: TPanel;
    Calendario: TcxScheduler;
    StorageAgendamento: TcxSchedulerDBStorage;
    cbAgenda: TcxLookupComboBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    dmLookup: TdmLookup;
    dmSistema: TdmSistema;
  public
    constructor Create(Owner: TComponent); override;
    procedure ppuCarregarAgendamentos();
  end;

var
  frmAgendamento: TfrmAgendamento;

implementation

{$R *.dfm}

{ TfrmAgendamento }

constructor TfrmAgendamento.Create(Owner: TComponent);
var
  vaPermissao: String;
begin
  inherited;
  vaPermissao := GetEnumName(TypeInfo(TPermissaoSistema), Ord(sisAgendamento));
  if not TInfoLogin.fpuGetInstance.Usuario.fpuValidarPermissao(atVisualizar, vaPermissao) then
    raise Exception.Create('Operação não permitida.' + slineBreak + 'O usuário logado não possui a ação de ' +
      AcaoTelaDescricao[atVisualizar].ToUpper + ' para a permissão ' + TModulos.fpuGetInstance.fpuGetDescricao(vaPermissao).ToUpper);

end;

procedure TfrmAgendamento.FormCreate(Sender: TObject);
begin
  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  dmSistema := TdmSistema.Create(Self);
  dmSistema.Name := '';
  inherited;

  // vamos garantir que exista no minimo a agenda pessoal cadastrada
  dmPrincipal.FuncoesSistema.ppuCriarAgendaPessoal(TInfoLogin.fpuGetInstance.Usuario.Id);

  dmLookup.cdslkAgenda.ParamByName('ID_PESSOA').AsInteger := TInfoLogin.fpuGetInstance.Usuario.Id;
  dmLookup.cdslkAgenda.Open;
end;

procedure TfrmAgendamento.FormShow(Sender: TObject);
begin
  inherited;
  ppuCarregarAgendamentos;
end;

procedure TfrmAgendamento.ppuCarregarAgendamentos;
begin
  if dmLookup.cdslkAgenda.RecordCount = 0 then
    raise Exception.Create('Nenhuma agenda foi encontrada para o usuário atual.');

  if not dmLookup.cdslkAgenda.Locate('TIPO', Ord(taPessoal), []) then
    dmLookup.cdslkAgenda.First;

end;

end.
