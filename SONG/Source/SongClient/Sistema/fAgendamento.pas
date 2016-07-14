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
  System.TypInfo, dmuLookup, dmuSistema, uClientDataSet, dmuPrincipal, Data.DB,
  uUtils, System.Actions, Vcl.ActnList;

type
  TfrmAgendamento = class(TfrmBasico)
    pnControlBox: TPanel;
    Calendario: TcxScheduler;
    StorageAgendamento: TcxSchedulerDBStorage;
    cbAgenda: TcxLookupComboBox;
    Label1: TLabel;
    dslkAgenda: TDataSource;
    dsAgenda_Registro: TDataSource;
    btnIncluir: TButton;
    ActionList1: TActionList;
    Ac_Incluir: TAction;
    PopupMenu1: TPopupMenu;
    procedure FormCreate(Sender: TObject);
    procedure CalendarioDateNavigatorPeriodChanged(Sender: TObject;
      const AStart, AFinish: TDateTime);
    procedure StorageAgendamentoEventInserted(Sender: TObject;
      AEvent: TcxSchedulerEvent; var AHandled: Boolean);
    procedure Ac_IncluirExecute(Sender: TObject);
    procedure cbAgendaPropertiesEditValueChanged(Sender: TObject);
  private
    dmLookup: TdmLookup;
    dmSistema: TdmSistema;
    FDataInicial: TDate;
    FDataFinal: TDate;
    FCodigoAgenda: Integer;
    procedure ppvCarregarRegistros;
  public
    constructor Create(Owner: TComponent); override;
    procedure ppuCarregarAgendamentos();
  end;

var
  frmAgendamento: TfrmAgendamento;

implementation

{$R *.dfm}

{ TfrmAgendamento }

procedure TfrmAgendamento.Ac_IncluirExecute(Sender: TObject);
begin
  inherited;
  Calendario.CreateEventUsingDialog();
end;

procedure TfrmAgendamento.CalendarioDateNavigatorPeriodChanged(Sender: TObject;
  const AStart, AFinish: TDateTime);
begin
  inherited;
  if Showing then
    ppvCarregarRegistros;
end;

procedure TfrmAgendamento.cbAgendaPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  ppvCarregarRegistros;
end;

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

  cbAgenda.LockChangeEvents(true);
  try
    cbAgenda.EditValue := dmLookup.cdslkAgendaID.AsInteger;
    cbAgenda.PostEditValue;
  finally
    cbAgenda.LockChangeEvents(false, false);
  end;
end;

procedure TfrmAgendamento.ppvCarregarRegistros;
begin
  if VarIsNull(cbAgenda.EditValue) then
    begin
      dmSistema.cdsAgenda_Registro.Close;
      Exit;
    end;

  if (not dmSistema.cdsAgenda_Registro.Active) or (FCodigoAgenda <> cbAgenda.EditValue) or
    (Calendario.DateNavigator.FirstDate <> FDataInicial) or (Calendario.DateNavigator.LastDate <> FDataFinal) then
    begin
      FDataInicial := Calendario.DateNavigator.FirstDate;
      FDataFinal := Calendario.DateNavigator.LastDate;
      FCodigoAgenda := cbAgenda.EditValue;

      StorageAgendamento.BeginUpdate;
      try
        dmSistema.cdsAgenda_Registro.ppuLimparParametros;
        dmSistema.cdsAgenda_Registro.ppuAddParametro(TParametros.coData, TUtils.fpuMontarDataBetween(FDataInicial, FDataFinal), TOperadores.coOR);
        dmSistema.cdsAgenda_Registro.ppuAddParametro(TParametros.coTipo, Ord(etPattern));
        dmSistema.cdsAgenda_Registro.ppuAddParametro(TParametros.coIdPai, FCodigoAgenda);
        dmSistema.cdsAgenda_Registro.ppuDataRequest();
      finally
        StorageAgendamento.EndUpdate;
      end;
    end;

end;

procedure TfrmAgendamento.StorageAgendamentoEventInserted(Sender: TObject;
  AEvent: TcxSchedulerEvent; var AHandled: Boolean);
begin
  inherited;
  AEvent.SetCustomFieldValueByName('ID_AGENDA', FCodigoAgenda);
end;

procedure TfrmAgendamento.ppuCarregarAgendamentos;
begin
  if dmLookup.cdslkAgenda.RecordCount = 0 then
    raise Exception.Create('Nenhuma agenda foi encontrada para o usuário atual.');

  if not dmLookup.cdslkAgenda.Locate('TIPO', Ord(taPessoal), []) then
    dmLookup.cdslkAgenda.First;

  ppvCarregarRegistros;
end;

end.
