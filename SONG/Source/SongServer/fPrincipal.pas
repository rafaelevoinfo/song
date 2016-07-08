unit fPrincipal;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  IPPeerServer,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxBarBuiltInMenu, cxClasses, dxSkinsForm, cxPC, Vcl.ExtCtrls, dxSkinBlue,
  dxSkinBlack, Vcl.StdCtrls,
  cxPropertiesStore, dxLayoutcxEditAdapters, cxContainer, cxEdit, cxTextEdit,
  dxLayoutContainer, dxLayoutControl, cxGroupBox, cxMaskEdit, cxSpinEdit,
  dxGDIPlusClasses, cxImage, Vcl.Menus, cxButtons, dmuPrincipal, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, Datasnap.DBClient,
  cxGridLevel, cxGridCustomView, cxGrid, dxSkinscxPCPainter, System.IOUtils,
  uMensagem, fAtualizacao, uUtils, uTypes, cxButtonEdit, cxTimeEdit,
  System.DateUtils, uBackup, FireDAC.Comp.Client, FireDAC.Stan.Def,
  FireDAC.Phys.IBWrapper, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.IBBase,
  System.Actions, Vcl.ActnList, cxCheckBox, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP,
  Vcl.ComCtrls, smuFuncoesSistema, aduna_ds_list;

type
  TfrmPrincipal = class(TForm)
    pnTop: TPanel;
    skinController: TdxSkinController;
    Label1: TLabel;
    cxPageControl1: TcxPageControl;
    tabConfiguracoes: TcxTabSheet;
    store: TcxPropertiesStore;
    gbBanco: TcxGroupBox;
    EditEnderecoBanco: TcxTextEdit;
    Label2: TLabel;
    EditServidor: TcxTextEdit;
    Label3: TLabel;
    EditUsuario: TcxTextEdit;
    Label4: TLabel;
    EditSenha: TcxTextEdit;
    Label5: TLabel;
    Servidor: TcxGroupBox;
    Label6: TLabel;
    EditPorta: TcxSpinEdit;
    imgLogo: TcxImage;
    Label7: TLabel;
    Label8: TLabel;
    tabLog: TcxTabSheet;
    pnStatus: TPanel;
    lbStatus: TLabel;
    bttLigarDesligar: TcxButton;
    viewLog: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cdsLog: TClientDataSet;
    cdsLogDATA: TDateTimeField;
    cdsLogERRO: TStringField;
    dsLog: TDataSource;
    viewLogDATA: TcxGridDBColumn;
    viewLogERRO: TcxGridDBColumn;
    tabAtualizacoes: TcxTabSheet;
    viewAtualizacoes: TcxGridDBTableView;
    levelGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    dsAtualizacoes: TDataSource;
    pnAtualizacoes: TPanel;
    btnAddAtualizacao: TButton;
    btnDelAtualizacao: TButton;
    cdsAtualizacoes: TClientDataSet;
    cdsAtualizacoesMAJOR: TIntegerField;
    cdsAtualizacoesMINOR: TIntegerField;
    cdsAtualizacoesRELEASE: TIntegerField;
    cdsAtualizacoesBUILD: TIntegerField;
    cdsAtualizacoesENDERECO: TStringField;
    viewAtualizacoesMAJOR: TcxGridDBColumn;
    viewAtualizacoesMINOR: TcxGridDBColumn;
    viewAtualizacoesRELEASE: TcxGridDBColumn;
    viewAtualizacoesBUILD: TcxGridDBColumn;
    viewAtualizacoesENDERECO: TcxGridDBColumn;
    viewAtualizacoesCALC_VERSAO: TcxGridDBColumn;
    cdsAtualizacoesVERSAO: TStringField;
    tabBackup: TcxTabSheet;
    EditEnderecoBackup: TcxButtonEdit;
    Label10: TLabel;
    Label9: TLabel;
    EditEnderecoBackupRede: TcxButtonEdit;
    Label11: TLabel;
    EditEnderecoBackupFTP: TcxTextEdit;
    tmrTempo: TTimer;
    EditHoraBackup: TcxTimeEdit;
    Label12: TLabel;
    Label13: TLabel;
    lbHoraUltimoBackup: TLabel;
    ActionList1: TActionList;
    Ac_Localizar_Pasta: TAction;
    foDialog: TFileOpenDialog;
    Ac_Localizar_Pasta_Rede: TAction;
    chkHabilitarBackup: TcxCheckBox;
    EditUsuarioFTP: TcxTextEdit;
    EditSenhaFTP: TcxTextEdit;
    Label14: TLabel;
    Label15: TLabel;
    btnSalvarConfiguracoes: TButton;
    Ac_Salvar_Configuracoes: TAction;
    btnSalvarConfigBackup: TButton;
    Label16: TLabel;
    EditHostFtp: TcxTextEdit;
    btnRealizarBackup: TButton;
    statusBar: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bttLigarDesligarClick(Sender: TObject);
    procedure btnAddAtualizacaoClick(Sender: TObject);
    procedure btnDelAtualizacaoClick(Sender: TObject);
    procedure tmrTempoTimer(Sender: TObject);
    procedure Ac_Localizar_PastaExecute(Sender: TObject);
    procedure Ac_Localizar_Pasta_RedeExecute(Sender: TObject);
    procedure Ac_Salvar_ConfiguracoesExecute(Sender: TObject);
    procedure btnRealizarBackupClick(Sender: TObject);
  private
    FThreadBackup: TThreadBackup;
    FUltimaData: TDate;
    FHoraUltimoBackup: TDateTime;
    procedure ppvIniciarFinalizarServidor(ipIniciar: Boolean);

    procedure ppvAtualizarStatus;
    procedure ppvEfetuarBackup;
    procedure ppvEnviarEmailNotificacao;
    procedure ppvFinalizarThreadBackup;
    procedure ppvConfigurarThreadBackup;
    { Private declarations }
  public
    procedure ppuAdicionarErroLog(ipException: Exception); overload;
    procedure ppuAdicionarErroLog(ipErro: String); overload;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}


procedure TfrmPrincipal.Ac_Localizar_PastaExecute(Sender: TObject);
begin
  if foDialog.Execute then
    EditEnderecoBackup.Text := foDialog.FileName;
end;

procedure TfrmPrincipal.Ac_Localizar_Pasta_RedeExecute(Sender: TObject);
begin
  if foDialog.Execute then
    EditEnderecoBackupRede.Text := foDialog.FileName;
end;

procedure TfrmPrincipal.Ac_Salvar_ConfiguracoesExecute(Sender: TObject);
begin
  store.StoreTo();
  ppvConfigurarThreadBackup;
end;

procedure TfrmPrincipal.btnAddAtualizacaoClick(Sender: TObject);
begin
  if cdsAtualizacoes.Active and (cdsAtualizacoes.RecordCount > 0) then
    begin
      if TMensagem.fpuPerguntar('Confirma a exclusão?', ppSimNao) = rpSim then
        begin
          dmPrincipal.ppuExcluirAtualizacao(cdsAtualizacoesVERSAO.AsString);
          cdsAtualizacoes.Data := dmPrincipal.fpuCarregarAtualizacoes();
        end;
    end
  else
    TMensagem.ppuShowMessage('Não existem atualizações para serem excluídas.');
end;

procedure TfrmPrincipal.btnDelAtualizacaoClick(Sender: TObject);
var
  vaFrmAtualizacao: TfrmAtualizacao;
begin
  vaFrmAtualizacao := TfrmAtualizacao.Create(nil);
  try
    if vaFrmAtualizacao.ShowModal <> mrCancel then
      cdsAtualizacoes.Data := dmPrincipal.fpuCarregarAtualizacoes();
  finally
    vaFrmAtualizacao.Free;
  end;
end;

procedure TfrmPrincipal.btnRealizarBackupClick(Sender: TObject);
begin
  ppvEfetuarBackup;
end;

procedure TfrmPrincipal.bttLigarDesligarClick(Sender: TObject);
begin
  if dmPrincipal.Server.Started then
    ppvIniciarFinalizarServidor(false)
  else
    ppvIniciarFinalizarServidor(true);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  store.StoreTo();
  ppvFinalizarThreadBackup;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  Self.Caption := Self.Caption + ' - Versão: ' + TUtils.fpuVersaoExecutavel(Application.ExeName, viBuild);
  store.RestoreFrom;

  FHoraUltimoBackup := StrToDateTimeDef(lbHoraUltimoBackup.Caption, 0);

  ppvIniciarFinalizarServidor(true);

  cdsAtualizacoes.Data := dmPrincipal.fpuCarregarAtualizacoes;
end;

procedure TfrmPrincipal.ppuAdicionarErroLog(ipException: Exception);
begin
  ppuAdicionarErroLog(ipException);
end;

procedure TfrmPrincipal.ppuAdicionarErroLog(ipErro: String);
var
  vaProc: TThreadProcedure;
begin
  vaProc := procedure
    begin
      if not cdsLog.Active then
        cdsLog.CreateDataSet;

      cdsLog.Append;
      cdsLogDATA.AsDateTime := Now;
      cdsLogERRO.AsString := ipErro;
      cdsLog.Post;
    end;

  if TThread.CurrentThread.ThreadID <> MainThreadID then
    TThread.Synchronize(nil, vaProc)
  else
    vaProc;
end;

procedure TfrmPrincipal.ppvAtualizarStatus;
begin
  if dmPrincipal.Server.Started then
    lbStatus.Caption := 'Ligado'
  else
    lbStatus.Caption := 'Desligado';
end;

procedure TfrmPrincipal.ppvConfigurarThreadBackup;
var
  vaBackup: TBackup;
begin
  if chkHabilitarBackup.Checked then
    begin
      vaBackup := TBackup.Create(dmPrincipal.conSong, dmPrincipal.FDPhysFBDriverLink1);
      vaBackup.EnderecoBackup := EditEnderecoBackup.Text;
      vaBackup.EnderecoBackupRede := EditEnderecoBackupRede.Text;
      if EditHostFtp.Text <> '' then
        begin
          vaBackup.Ftp.Host := EditHostFtp.Text;
          vaBackup.Ftp.usuario := EditUsuarioFTP.Text;
          vaBackup.Ftp.Senha := EditSenhaFTP.Text;
          vaBackup.Ftp.Pasta := EditEnderecoBackupFTP.Text;
        end;

      if Assigned(FThreadBackup) then
        ppvFinalizarThreadBackup;

      FThreadBackup := TThreadBackup.Create;
      FThreadBackup.DataUltimoBackup := FHoraUltimoBackup;
      FThreadBackup.HoraBackup := EditHoraBackup.Time;
      FThreadBackup.Backup := vaBackup;

      FThreadBackup.OnStartBackup := procedure
        begin
          statusBar.Panels[0].Text := 'Efetuando backup...';
          Application.ProcessMessages;
        end;

      FThreadBackup.OnFinishBackup := procedure
        begin
          FHoraUltimoBackup := Now;
          statusBar.Panels[0].Text := '';
          lbHoraUltimoBackup.Caption := FormatDateTime('dd/mm/yyy hh:nn', FHoraUltimoBackup);
          Application.ProcessMessages;
        end;

      FThreadBackup.Start;
    end
  else
    ppvFinalizarThreadBackup;

end;

procedure TfrmPrincipal.ppvIniciarFinalizarServidor(ipIniciar: Boolean);
begin
  try
    if ipIniciar then
      begin
        dmPrincipal.ppuIniciarServidor(EditServidor.Text, EditEnderecoBanco.Text,
          EditUsuario.Text, EditSenha.Text, EditPorta.Value);

        tmrTempo.Enabled := true;

        ppvConfigurarThreadBackup;
      end
    else
      begin
        dmPrincipal.Server.Stop;
        tmrTempo.Enabled := false;

        ppvFinalizarThreadBackup;
      end;

    ppvAtualizarStatus;
  except
    on E: Exception do
      begin
        ppuAdicionarErroLog(E);
      end;
  end;
end;

procedure TfrmPrincipal.ppvFinalizarThreadBackup;
begin
  if Assigned(FThreadBackup) then
    begin
      FThreadBackup.Terminate;
      FThreadBackup.Event.SetEvent;
      FThreadBackup.WaitFor;

      FreeAndNil(FThreadBackup);
    end;
end;

procedure TfrmPrincipal.ppvEnviarEmailNotificacao;
var
  vaFuncoesSistema: TsmFuncoesSistema;
  vaNotificacoes: TadsObjectlist<TNotificacao>;
begin
  vaFuncoesSistema := TsmFuncoesSistema.Create(nil);
  try
    // preciso apenas enviar os email aqui.
    vaNotificacoes := vaFuncoesSistema.fpuVerificarNotificacoes(-1, -1, true);
    if Assigned(vaNotificacoes) then
      vaNotificacoes.Free;
  finally
    vaFuncoesSistema.Free;
  end;
end;

procedure TfrmPrincipal.tmrTempoTimer(Sender: TObject);
var
  vaHoraAtual: TDateTime;

begin
  vaHoraAtual := Now;
  statusBar.Panels[1].Text := FormatDateTime('dd/mm/yyyy hh:nn:ss', vaHoraAtual);
  if (FUltimaData = 0) or (DayOf(vaHoraAtual) <> DayOf(FUltimaData)) then
    begin
      ppvEnviarEmailNotificacao;
    end;

  FUltimaData := vaHoraAtual;

end;

procedure TfrmPrincipal.ppvEfetuarBackup;
var
  vaBackup: TBackup;
begin
  try
    statusBar.Panels[0].Text := 'Efetuando backup...';
    Application.ProcessMessages;
    vaBackup := TBackup.Create(dmPrincipal.conSong, dmPrincipal.FDPhysFBDriverLink1);
    try
      try
        vaBackup.EnderecoBackup := EditEnderecoBackup.Text;
        vaBackup.EnderecoBackupRede := EditEnderecoBackupRede.Text;
        if EditHostFtp.Text <> '' then
          begin
            vaBackup.Ftp.Host := EditHostFtp.Text;
            vaBackup.Ftp.usuario := EditUsuarioFTP.Text;
            vaBackup.Ftp.Senha := EditSenhaFTP.Text;
            vaBackup.Ftp.Pasta := EditEnderecoBackupFTP.Text;
          end;

        vaBackup.ppuRealizarBackup;

        FHoraUltimoBackup := Now;
        lbHoraUltimoBackup.Caption := FormatDateTime('dd/mm/yyy hh:nn', FHoraUltimoBackup);
      except
        on E: Exception do
          ppuAdicionarErroLog('Erro ao realizar o backup. Detalhes: ' + E.Message);
      end;
    finally
      vaBackup.Free;
    end;
  finally
    statusBar.Panels[0].Text := '';
    Application.ProcessMessages;
  end;
end;

end.
