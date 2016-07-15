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
  uUtils, System.Actions, Vcl.ActnList, uMensagem, fAtividade;

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
    btnAlterar: TButton;
    btnExcluir: TButton;
    Ac_Alterar: TAction;
    Ac_Excluir: TAction;
    btnAtualizar: TButton;
    Ac_Atualizar: TAction;
    procedure FormCreate(Sender: TObject);
    procedure CalendarioDateNavigatorPeriodChanged(Sender: TObject;
      const AStart, AFinish: TDateTime);
    procedure StorageAgendamentoEventInserted(Sender: TObject;
      AEvent: TcxSchedulerEvent; var AHandled: Boolean);
    procedure Ac_IncluirExecute(Sender: TObject);
    procedure cbAgendaPropertiesEditValueChanged(Sender: TObject);
    procedure Ac_AlterarExecute(Sender: TObject);
    procedure Ac_ExcluirExecute(Sender: TObject);
    procedure Ac_AlterarUpdate(Sender: TObject);
    procedure Ac_AtualizarExecute(Sender: TObject);
  private
    dmLookup: TdmLookup;
    dmSistema: TdmSistema;
    FDataInicial: TDate;
    FDataFinal: TDate;
    FCodigoAgenda: Integer;
    procedure ppvCarregarRegistros(ipForcar: Boolean = false);
  public
    constructor Create(Owner: TComponent); override;
    procedure ppuCarregarAgendamentos();
  end;

var
  frmAgendamento: TfrmAgendamento;

implementation

{$R *.dfm}

{ TfrmAgendamento }

procedure TfrmAgendamento.Ac_AlterarExecute(Sender: TObject);
var
  vaFrmAtividade: TfrmAtividade;
  vaEvent: TcxSchedulerControlEvent;
  vaId: Integer;
begin
  inherited;
  if Calendario.SelectedEventCount > 0 then
    begin
      vaEvent := Calendario.SelectedEvents[0];
      vaId := vaEvent.GetCustomFieldValueByName('ID');
      if dmSistema.cdsAgenda_Registro.Locate(TBancoDados.coId, vaId, []) then
        begin
          if dmSistema.cdsAgenda_RegistroTIPO.AsInteger = 0 then
            begin
              Calendario.EditEventUsingDialog(vaEvent)
            end
          else if TMensagem.fpuPerguntar('O evento selecionado é uma atividade do projeto vinculado a esta agenda. Deseja alterar a atividade?',
            ppSimNao) = rpSim then
            begin
              // os codigos das atividades estao com valor negativo pra nao conflitar
              vaId := Abs(vaId);
              vaFrmAtividade := TfrmAtividade.Create(nil);
              try
                vaFrmAtividade.ppuConfigurarPesquisa(Ord(tppId), vaId.ToString());
                vaFrmAtividade.ppuPesquisar;
                vaFrmAtividade.ppuConfigurarModoExecucao(meSomenteEdicao);

                vaFrmAtividade.ppuAlterar(vaId);
                vaFrmAtividade.ShowModal;
                if vaFrmAtividade.IdEscolhido <> 0 then
                  ppvCarregarRegistros(true);
              finally
                vaFrmAtividade.free;
              end;
            end;
        end;
    end;
end;

procedure TfrmAgendamento.Ac_AlterarUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := Calendario.SelectedEventCount > 0;
end;

procedure TfrmAgendamento.Ac_AtualizarExecute(Sender: TObject);
begin
  inherited;
  ppvCarregarRegistros;
end;

procedure TfrmAgendamento.Ac_ExcluirExecute(Sender: TObject);
var
  vaFrmAtividade: TfrmAtividade;
  vaEvent: TcxSchedulerControlEvent;
  vaId: Integer;
begin
  inherited;
  if Calendario.SelectedEventCount > 0 then
    begin
      vaEvent := Calendario.SelectedEvents[0];
      vaId := vaEvent.GetCustomFieldValueByName('ID');
      if dmSistema.cdsAgenda_Registro.Locate(TBancoDados.coId, vaId, []) then
        begin
          if TMensagem.fpuPerguntar('Confirma a exclusão?', ppSimNao) = rpSim then
            begin
              if dmSistema.cdsAgenda_RegistroTIPO.AsInteger = 0 then
                begin
                  Calendario.DeleteEvent(vaEvent);
                end
              else if TMensagem.fpuPerguntar
                ('O evento selecionado é uma atividade do projeto vinculado a esta agenda. Tem certeza que deseja excluir a atividade?',
                ppSimNao) = rpSim then
                begin
                  // os codigos das atividades estao com valor negativo pra nao conflitar
                  vaId := Abs(vaId);
                  vaFrmAtividade := TfrmAtividade.Create(nil);
                  try
                    vaFrmAtividade.ModoSilencioso := true;
                    vaFrmAtividade.ppuConfigurarPesquisa(Ord(tppId), vaId.ToString());
                    vaFrmAtividade.ppuPesquisar;

                    if vaFrmAtividade.fpuExcluir([vaId]) then
                      ppvCarregarRegistros(true);
                  finally
                    vaFrmAtividade.free;
                  end;
                end;
            end;
        end;
    end;
end;

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
  dmPrincipal.FuncoesSistema.ppuCriarAgendaPessoal(TInfoLogin.fpuGetInstance.Usuario.ID);

  dmLookup.cdslkAgenda.ParamByName('ID_PESSOA').AsInteger := TInfoLogin.fpuGetInstance.Usuario.ID;
  dmLookup.cdslkAgenda.Open;

  cbAgenda.LockChangeEvents(true);
  try
    cbAgenda.EditValue := dmLookup.cdslkAgendaID.AsInteger;
    cbAgenda.PostEditValue;
  finally
    cbAgenda.LockChangeEvents(false, false);
  end;
end;

procedure TfrmAgendamento.ppvCarregarRegistros(ipForcar: Boolean);
begin
  if VarIsNull(cbAgenda.EditValue) then
    begin
      dmSistema.cdsAgenda_Registro.Close;
      Exit;
    end;

  if ipForcar or ((not dmSistema.cdsAgenda_Registro.Active) or (FCodigoAgenda <> cbAgenda.EditValue) or
    (Calendario.DateNavigator.FirstDate <> FDataInicial) or (Calendario.DateNavigator.LastDate <> FDataFinal)) then
    begin
      FDataInicial := Calendario.DateNavigator.FirstDate;
      FDataFinal := Calendario.DateNavigator.LastDate;
      FCodigoAgenda := cbAgenda.EditValue;

      StorageAgendamento.BeginUpdate;
      try
        dmSistema.cdsAgenda_Registro.Close;
        dmSistema.cdsAgenda_Registro.ParamByName('ID_AGENDA').AsInteger := FCodigoAgenda;
        dmSistema.cdsAgenda_Registro.ParamByName('DATA_INICIAL').AsDateTime := FDataInicial;
        dmSistema.cdsAgenda_Registro.ParamByName('DATA_FINAL').AsDateTime := FDataFinal;
        dmSistema.cdsAgenda_Registro.Open;
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
  AEvent.SetCustomFieldValueByName('ID', dmPrincipal.FuncoesGeral.fpuGetId('AGENDA_REGISTRO'));

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
