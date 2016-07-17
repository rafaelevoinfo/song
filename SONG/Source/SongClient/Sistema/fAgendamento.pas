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
  uUtils, System.Actions, Vcl.ActnList, uMensagem, fAtividade,
  cxSchedulerEditorFormManager,
  fAgendamento_Cadastro; // fAgendamento_Cadastro sempre deve vir por ultimo

type
  TfrmAgendamento = class(TfrmBasico)
    pnControlBox: TPanel;
    Calendario: TcxScheduler;
    StorageAgendamento: TcxSchedulerDBStorage;
    dsAgenda_Registro: TDataSource;
    btnIncluir: TButton;
    ActionList1: TActionList;
    Ac_Incluir: TAction;
    PopupMenu1: TPopupMenu;
    btnAlterar: TButton;
    btnExcluir: TButton;
    Ac_Alterar: TAction;
    Ac_Excluir: TAction;
    Ac_Pesquisar: TAction;
    pnPesquisa: TPanel;
    Label1: TLabel;
    cbAgenda: TcxLookupComboBox;
    btnAtualizar: TButton;
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
    procedure Ac_PesquisarExecute(Sender: TObject);
    procedure CalendarioBeforeEditing(Sender: TcxCustomScheduler;
      AEvent: TcxSchedulerControlEvent; AInplace: Boolean; var Allow: Boolean);
    procedure CalendarioBeforeSizingEvent(Sender: TcxCustomScheduler;
      AEvent: TcxSchedulerControlEvent; X, Y: Integer; var Allow: Boolean);
    procedure CalendarioBeforeDeleting(Sender: TcxCustomScheduler;
      AEvent: TcxSchedulerControlEvent; var Allow: Boolean);
    procedure Ac_IncluirUpdate(Sender: TObject);
  private
    dmLookup: TdmLookup;
    dmSistema: TdmSistema;
    FInserindo: Boolean;
    FEditando: Boolean;
    FDeletando: Boolean;
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

      if vaEvent.GetCustomFieldValueByName('TIPO') = Ord(teEventoAgenda) then
        begin
          FEditando := true;
          try
            Calendario.EditEventUsingDialog(vaEvent);
          finally
            FEditando := false;
          end;
        end
      else if TMensagem.fpuPerguntar('O evento selecionado é uma atividade do projeto vinculado a esta agenda. Deseja alterar a atividade?',
        ppSimNao) = rpSim then
        begin
          // os codigos das atividades estao com valor negativo pra nao conflitar
          vaId := Abs(VarToStr(vaEvent.ID).ToInteger());
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

procedure TfrmAgendamento.Ac_AlterarUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := (Calendario.SelectedEventCount > 0) and (not Calendario.EventOperations.ReadOnly);
end;

procedure TfrmAgendamento.Ac_PesquisarExecute(Sender: TObject);
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
      if TMensagem.fpuPerguntar('Confirma a exclusão?', ppSimNao) = rpSim then
        begin
          if vaEvent.GetCustomFieldValueByName('TIPO') = Ord(teEventoAgenda) then
            begin
              FDeletando := true;
              try
                Calendario.DeleteEvent(vaEvent);
              finally
                FDeletando := false;
              end;
            end
          else if TMensagem.fpuPerguntar
            ('O evento selecionado é uma atividade do projeto vinculado a esta agenda. Tem certeza que deseja excluir a atividade?',
            ppSimNao) = rpSim then
            begin
              // os codigos das atividades estao com valor negativo pra nao conflitar
              vaId := Abs(VarToStr(vaEvent.ID).ToInteger());
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

procedure TfrmAgendamento.Ac_IncluirExecute(Sender: TObject);
begin
  inherited;
  FInserindo := true;
  try
    Calendario.CreateEventUsingDialog();
  finally
    FInserindo := false;
  end;
end;

procedure TfrmAgendamento.Ac_IncluirUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := not Calendario.EventOperations.ReadOnly;
end;

procedure TfrmAgendamento.CalendarioBeforeDeleting(Sender: TcxCustomScheduler;
  AEvent: TcxSchedulerControlEvent; var Allow: Boolean);
begin
  inherited;
  if not FDeletando then
    begin
      Allow := false;
      Ac_Excluir.Execute;
    end;
end;

procedure TfrmAgendamento.CalendarioBeforeEditing(Sender: TcxCustomScheduler;
  AEvent: TcxSchedulerControlEvent; AInplace: Boolean; var Allow: Boolean);
begin
  inherited;
  if (not FInserindo) and (not FEditando) then
    begin
      Allow := false;
      Ac_Alterar.Execute;
    end;
end;

procedure TfrmAgendamento.CalendarioBeforeSizingEvent(
  Sender: TcxCustomScheduler; AEvent: TcxSchedulerControlEvent; X, Y: Integer;
  var Allow: Boolean);
begin
  inherited;
  // qualquer coisa diferente de 0 significa que não é da tabela agenda_registro
  Allow := AEvent.GetCustomFieldValueByName('TIPO') = Ord(teEventoAgenda);
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
    dmLookup.cdslkAgenda.Locate(dmLookup.cdslkAgendaTIPO.FieldName,Ord(taPessoal),[]);

    cbAgenda.EditValue := dmLookup.cdslkAgendaID.AsInteger;
    cbAgenda.PostEditValue;
  finally
    cbAgenda.LockChangeEvents(false, false);
  end;

  cxSchedulerEditorManager.CurrentEditorFormStyle := TRFShedulerCustomizadoEventEditorFormStyleInfo.coEditorEventoCustomizado;
end;

procedure TfrmAgendamento.ppvCarregarRegistros(ipForcar: Boolean);
var
  vaEvent: TcxSchedulerEvent;
begin
  dmLookup.cdslkAgenda_Pessoa.Close;
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

        dmSistema.cdsAgenda_Registro.First;
        while not dmSistema.cdsAgenda_Registro.Eof do
          begin
            vaEvent := StorageAgendamento.GetEventByID(dmSistema.cdsAgenda_RegistroID.AsInteger);
            if Assigned(vaEvent) then
              vaEvent.SetCustomFieldValueByName('TIPO', dmSistema.cdsAgenda_RegistroTIPO.AsInteger);
            dmSistema.cdsAgenda_Registro.Next;
          end;
      finally
        StorageAgendamento.EndUpdate;
      end;

      dmLookup.cdslkAgenda_Pessoa.Open;
      if dmLookup.cdslkAgenda_Pessoa.Locate(dmLookup.cdslkAgenda_PessoaID_PESSOA.FieldName, TInfoLogin.fpuGetInstance.Usuario.ID, []) then
        begin
          Calendario.EventOperations.ReadOnly := dmLookup.cdslkAgenda_PessoaSOMENTE_VISUALIZACAO.AsInteger = 1;
        end;

    end;

end;

procedure TfrmAgendamento.StorageAgendamentoEventInserted(Sender: TObject;
  AEvent: TcxSchedulerEvent; var AHandled: Boolean);
begin
  inherited;
  AEvent.SetCustomFieldValueByName('ID_AGENDA', FCodigoAgenda);
  AEvent.SetCustomFieldValueByName('TIPO', Ord(teEventoAgenda));
  // AEvent.SetCustomFieldValueByName('ID', dmPrincipal.FuncoesGeral.fpuGetId('AGENDA_REGISTRO'));

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
