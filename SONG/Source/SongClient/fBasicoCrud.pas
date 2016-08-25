unit fBasicoCrud;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasico, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, Vcl.StdCtrls, System.Actions, Vcl.ActnList,
  Vcl.ExtCtrls, cxPC, cxButtonEdit, dmuPrincipal, cxImageComboBox, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCalendar, uMensagem, Datasnap.DBClient, System.Generics.Collections, System.Generics.Defaults,
  uTypes, uExceptions, uClientDataSet, System.Rtti, MidasLib, uUtils,
  uControleAcesso, System.TypInfo, cxGroupBox, cxRadioGroup, cxLocalization, dmuLookup,
  cxGridExportLink, Vcl.ExtDlgs;

type
  TfrmBasicoCrud = class(TfrmBasico)
    pcPrincipal: TcxPageControl;
    tabPesquisa: TcxTabSheet;
    tabCadastro: TcxTabSheet;
    pnPesquisa: TPanel;
    pnGrid: TPanel;
    ActionList1: TActionList;
    Ac_Incluir: TAction;
    pnEditsPesquisa: TPanel;
    Label1: TLabel;
    EditPesquisa: TcxButtonEdit;
    Ac_Pesquisar: TAction;
    cbPesquisarPor: TcxImageComboBox;
    viewRegistros: TcxGridDBTableView;
    level: TcxGridLevel;
    cxGridRegistros: TcxGrid;
    pnData: TPanel;
    EditDataInicialPesquisa: TcxDateEdit;
    EditDataFinalPesquisa: TcxDateEdit;
    De: TLabel;
    Label2: TLabel;
    ColumnAlterar: TcxGridDBColumn;
    ColumnExcluir: TcxGridDBColumn;
    Ac_Alterar: TAction;
    Ac_Excluir: TAction;
    pnBotoesCadastro: TPanel;
    pnEditsCadastro: TPanel;
    btnSalvar: TButton;
    Ac_Salvar: TAction;
    btnCancelar: TButton;
    Ac_Cancelar: TAction;
    dsMaster: TDataSource;
    btnPesquisar: TButton;
    pnBotoes: TPanel;
    btnIncluir: TButton;
    rgStatus: TcxRadioGroup;
    btnSalvarIncluir: TButton;
    Ac_Salvar_Incluir: TAction;
    btnUtilizar: TButton;
    Ac_Utilizar_Selecionado: TAction;
    btnExportarExcel: TButton;
    Ac_Exportar_Excel: TAction;
    fdExportDialog: TSaveTextFileDialog;
    procedure FormCreate(Sender: TObject);
    procedure Ac_IncluirExecute(Sender: TObject);
    procedure Ac_AlterarExecute(Sender: TObject);
    procedure Ac_ExcluirExecute(Sender: TObject);
    procedure Ac_SalvarExecute(Sender: TObject);
    procedure Ac_CancelarExecute(Sender: TObject);
    procedure Ac_PesquisarExecute(Sender: TObject);
    procedure cbPesquisarPorPropertiesEditValueChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Ac_SalvarUpdate(Sender: TObject);
    procedure viewRegistrosDblClick(Sender: TObject);
    procedure EditPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure ColumnExcluirGetProperties(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AProperties: TcxCustomEditProperties);
    procedure Ac_Salvar_IncluirExecute(Sender: TObject);
    procedure Ac_Utilizar_SelecionadoExecute(Sender: TObject);
    procedure Ac_AlterarUpdate(Sender: TObject);
    procedure Ac_ExcluirUpdate(Sender: TObject);
    procedure Ac_Exportar_ExcelExecute(Sender: TObject);
  private
    FPesquisaRealizada: Boolean;
    FPesquisaPadrao: Integer;
    FModoExecucao: TModoExecucao;
    FIdEscolhido: Integer;
    FModelo: TModelo;
    FModoSilencioso: Boolean;
    procedure SetPesquisaPadrao(const Value: Integer);
    procedure SetModelo(const Value: TModelo);
    procedure SetModoSilencioso(const Value: Boolean);

  protected
    FShowExecutado: Boolean;
    // CRUD
    procedure pprPreencherCamposPadroes(ipDataSet: TDataSet); virtual;
    procedure pprValidarDados; virtual;
    procedure pprValidarCamposObrigatorios(ipDataSet: TDataSet); virtual;
    procedure pprBeforeSalvar; virtual;
    procedure pprExecutarSalvar; virtual;
    procedure pprAfterSalvar(ipAcaoExecutada: TDataSetState); virtual;
    function fprHabilitarSalvar(): Boolean; virtual;
    function fprHabilitarAlterar: Boolean; virtual;
    function fprHabilitarExcluir: Boolean; virtual;
    procedure ppuRetornar(); overload; virtual;
    procedure ppuRetornar(ipAtualizar: Boolean); overload; virtual;
    procedure pprBeforeIncluir; virtual;
    procedure pprBeforeAlterar; virtual;
    procedure pprBeforeExcluir(ipId: Integer; ipAcao: TAcaoTela); virtual;
    procedure pprExecutarExcluir(ipId: Integer; ipAcao: TAcaoTela); virtual;
    procedure pprCarregarDadosModelo; virtual;
    // PESQUISA
    procedure pprRealizarPesquisaInicial; virtual;
    procedure pprValidarPesquisa; virtual;
    procedure pprEfetuarPesquisa; virtual;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); virtual;
    function fprConfigurarControlesPesquisa: TWinControl; virtual;
    // GERAL
    procedure pprConfigurarLabelsCamposObrigatorios; virtual;
    // procedure pprVerificarExisteStatus; virtual;
    // PERMISSOES
    procedure pprValidarPermissao(ipAcao: TAcaoTela; ipPermissao: string);
    // TODA tela deve sobrescrever essa procedure e definir qual a permissao da tela
    function fprGetPermissao: String; virtual; abstract;

    function fprProcurarControlePorFieldName(ipFieldName: string): TWinControl; virtual;

    procedure pprExecutarCancelar; virtual;

  public
    property PesquisaPadrao: Integer read FPesquisaPadrao write SetPesquisaPadrao;
    property Permissao: string read fprGetPermissao;
    property ModoExecucao: TModoExecucao read FModoExecucao;
    property ModoSilencioso: Boolean read FModoSilencioso write SetModoSilencioso;
    // objeto modelo para ser utilizado em caso da tela ser aberta somente para cadastros
    property Modelo: TModelo read FModelo write SetModelo;
    property IdEscolhido: Integer read FIdEscolhido;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    // CRUD
    procedure ppuIncluir; virtual;
    procedure ppuAlterar(ipId: Integer); virtual;
    function fpuExcluir(ipIds: TArray<Integer>): Boolean; virtual;
    procedure ppuSalvar; virtual;
    function fpuCancelar: Boolean; virtual;
    // PESQUISA
    // utilizado normalmente somente por telas exteriores que querem realizar uma pesquisa automatica
    procedure ppuConfigurarPesquisa(ipPesquisarPor: Integer; ipValor: String); virtual;
    procedure ppuPesquisar; virtual;
    // MODO DE EXECUCAO DA TELA
    // ipModelo somente será utilizado quando ModoExeucacao for somentecadastro. Ele ira conter as informacoes que se deseja que já venha pre preenchidas
    procedure ppuConfigurarModoExecucao(ipModo: TModoExecucao; ipModelo: TModelo = nil); virtual;
  end;

var

  frmBasicoCrud: TfrmBasicoCrud;

implementation

uses
  fPessoa, fReconexao;

{$R *.dfm}


procedure TfrmBasicoCrud.Ac_AlterarExecute(Sender: TObject);
begin
  inherited;
  ppuAlterar(dsMaster.DataSet.FieldByName(TBancoDados.coID).AsInteger);
end;

procedure TfrmBasicoCrud.Ac_AlterarUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := fprHabilitarAlterar;
end;

procedure TfrmBasicoCrud.Ac_CancelarExecute(Sender: TObject);
begin
  inherited;
  if fpuCancelar then
    ppuRetornar(False)
  else // salvou
    ppuRetornar(True);
end;

procedure TfrmBasicoCrud.Ac_ExcluirExecute(Sender: TObject);
var
  vaIds: TArray<Integer>;
begin
  inherited;
  SetLength(vaIds, 1);
  vaIds[0] := dsMaster.DataSet.FieldByName(TBancoDados.coID).AsInteger;
  fpuExcluir(vaIds);
end;

procedure TfrmBasicoCrud.Ac_ExcluirUpdate(Sender: TObject);
begin
  inherited;
  if Sender is TAction then
    TAction(Sender).Enabled := fprHabilitarExcluir();
end;

procedure TfrmBasicoCrud.Ac_Exportar_ExcelExecute(Sender: TObject);
var
  vaAlterar, vaExcluir: Boolean;
begin
  inherited;
  if fdExportDialog.Execute then
    begin
      vaAlterar := ColumnAlterar.Visible;
      vaExcluir := ColumnExcluir.Visible;

      ColumnAlterar.Visible := False;
      ColumnExcluir.Visible := False;
      try
        ExportGridToXLSX(fdExportDialog.FileName, cxGridRegistros);
      finally
        ColumnAlterar.Visible := vaAlterar;
        ColumnExcluir.Visible := vaExcluir;
      end;
    end;
end;

procedure TfrmBasicoCrud.Ac_IncluirExecute(Sender: TObject);
begin
  inherited;
  ppuIncluir;
end;

procedure TfrmBasicoCrud.Ac_PesquisarExecute(Sender: TObject);
begin
  inherited;
  ppuPesquisar;
end;

procedure TfrmBasicoCrud.Ac_SalvarExecute(Sender: TObject);
begin
  inherited;
  ppuSalvar;
  ppuRetornar;
end;

procedure TfrmBasicoCrud.Ac_SalvarUpdate(Sender: TObject);
begin
  inherited;
  if Sender is TAction then
    TAction(Sender).Enabled := fprHabilitarSalvar();
end;

procedure TfrmBasicoCrud.Ac_Salvar_IncluirExecute(Sender: TObject);
begin
  inherited;
  ppuSalvar;
  ppuIncluir;
end;

procedure TfrmBasicoCrud.Ac_Utilizar_SelecionadoExecute(Sender: TObject);
begin
  inherited;
  if dsMaster.DataSet.Active and (dsMaster.DataSet.RecordCount > 0) then
    begin
      FIdEscolhido := dsMaster.DataSet.FieldByName(TBancoDados.coID).AsInteger;
      Close;
    end
  else
    TMensagem.ppuShowMessage('Nenhum registro foi escolhido.');
end;

procedure TfrmBasicoCrud.cbPesquisarPorPropertiesEditValueChanged(Sender: TObject);
var
  vaControleFoco: TWinControl;
begin
  inherited;
  vaControleFoco := fprConfigurarControlesPesquisa();

  TUtils.fpuFocar(vaControleFoco);
end;

function TfrmBasicoCrud.fprConfigurarControlesPesquisa(): TWinControl;
begin
  EditPesquisa.Clear;

  EditPesquisa.Properties.EditMask := '.*';
  if cbPesquisarPor.EditValue = Ord(tppId) then
    EditPesquisa.Properties.EditMask := '\d+(;\d+)*';

  pnData.Visible := cbPesquisarPor.EditValue = Ord(tppData);
  EditPesquisa.Visible := not pnData.Visible;
  EditPesquisa.Enabled := cbPesquisarPor.EditValue <> Ord(tppTodos);

  if EditPesquisa.Visible then
    Result := EditPesquisa
  else
    Result := EditDataInicialPesquisa
end;

procedure TfrmBasicoCrud.ColumnExcluirGetProperties(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AProperties: TcxCustomEditProperties);
var
  vaField: TField;
begin
  inherited;
  if Assigned(dsMaster.DataSet) and dsMaster.DataSet.Active and (dsMaster.DataSet.RecordCount > 0) then
    begin
      vaField := dsMaster.DataSet.FindField(TBancoDados.coAtivo);
      if Assigned(vaField) then
        begin
          if vaField.AsInteger = coRegistroAtivo then
            AProperties.Buttons.Items[0].ImageIndex := 7
          else
            AProperties.Buttons.Items[0].ImageIndex := 6;
        end;
    end;

end;

constructor TfrmBasicoCrud.Create(AOwner: TComponent);
begin
  inherited;
  FPesquisaPadrao := Ord(tppActive);
  pprValidarPermissao(atVisualizar, fprGetPermissao);
end;

destructor TfrmBasicoCrud.Destroy;
begin
  if Assigned(FModelo) then
    FreeAndNil(FModelo);
  inherited;
end;

procedure TfrmBasicoCrud.EditPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = Char(VK_RETURN) then
    begin
      ppuPesquisar;
      TUtils.fpuFocar(EditPesquisa);
      Key := #0;
    end;
end;

procedure TfrmBasicoCrud.FormCreate(Sender: TObject);
begin
  inherited;
  pcPrincipal.HideTabs := True;
  pcPrincipal.ActivePage := tabPesquisa;

  pprConfigurarLabelsCamposObrigatorios;
  cbPesquisarPor.Properties.DropDownRows := cbPesquisarPor.Properties.Items.Count;
  if pnBotoesCadastro.TabOrder = 0 then
    pnBotoesCadastro.TabOrder := 1;
  // pprVerificarExisteStatus;
end;

procedure TfrmBasicoCrud.FormShow(Sender: TObject);
begin
  if FShowExecutado then
    Exit;

  inherited;
  // se for mePesquisa significa que ja fez a pesquisa antes de dar show na tela
  if not FPesquisaRealizada then
    begin
      pprRealizarPesquisaInicial;
      if FModoExecucao = meSomenteCadastro then
        ppuIncluir;
    end;

  FShowExecutado := True;
end;

procedure TfrmBasicoCrud.pprAfterSalvar(ipAcaoExecutada: TDataSetState);
begin
  if FModoExecucao in [meSomenteCadastro, meSomenteEdicao] then
    FIdEscolhido := dsMaster.DataSet.FieldByName(TBancoDados.coID).AsInteger;
end;

procedure TfrmBasicoCrud.ppuAlterar(ipId: Integer);
begin
  // if (ModoExecucao = meSomenteEdicao) and ((not fprHabilitarAlterar) or (not dsMaster.DataSet.Locate(TBancoDados.coID, ipId, []))) then
  // begin
  // cbPesquisarPor.EditValue := Ord(tppId);
  // cbPesquisarPor.PostEditValue;
  //
  // EditPesquisa.EditValue := FModelo.Id;
  // EditPesquisa.PostEditValue;
  //
  // ppuPesquisar;
  // end;

  if fprHabilitarAlterar then
    begin
      if dsMaster.DataSet.Locate(TBancoDados.coID, ipId, []) then
        begin
          pprBeforeAlterar;
          pcPrincipal.ActivePage := tabCadastro;

          pprCarregarDadosModelo;
        end;
    end;
end;

function TfrmBasicoCrud.fpuCancelar: Boolean;
begin
  Result := True;
  // se tiver no modo selecioso vou descartar qualquer mudanca nao salva
  if (not ModoSilencioso) and fprHabilitarSalvar then
    begin
      if TMensagem.fpuPerguntar('Desejar salvar o registro?', ppSimNao) = rpSim then
        begin
          ppuSalvar;
          Exit(False);
        end;
    end;

  pprExecutarCancelar;
end;

procedure TfrmBasicoCrud.ppuConfigurarModoExecucao(ipModo: TModoExecucao; ipModelo: TModelo);
begin
  FModoExecucao := ipModo;
  if Assigned(FModelo) then
    FreeAndNil(FModelo);

  FModelo := ipModelo;
  { TODO -orafae -c :   Implementar comportamentos diferentes para cada tipo de modo de execucao 26/02/2016 23:14:38 }
  case ipModo of
    meNormal, mePesquisaRealizada:
      begin
        btnIncluir.Visible := True;
        btnUtilizar.Visible := False;
      end;
    mePesquisa:
      btnUtilizar.Visible := True;
    meSomenteCadastro:
      begin
        btnSalvarIncluir.Visible := False;
      end;
    meSomenteEdicao:
      begin
        btnSalvarIncluir.Visible := False;
      end;
  end;
end;

procedure TfrmBasicoCrud.ppuConfigurarPesquisa(ipPesquisarPor: Integer;
  ipValor: String);
begin
  cbPesquisarPor.LockChangeEvents(True);
  try
    cbPesquisarPor.EditValue := ipPesquisarPor;
    cbPesquisarPor.PostEditValue;

    fprConfigurarControlesPesquisa();
  finally
    cbPesquisarPor.LockChangeEvents(False, False);
  end;

  EditPesquisa.EditValue := ipValor;
  EditPesquisa.PostEditValue;
end;

procedure TfrmBasicoCrud.pprBeforeSalvar;
begin
  pprPreencherCamposPadroes(dsMaster.DataSet);
  pprValidarDados;
end;

procedure TfrmBasicoCrud.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  ipCds.ppuLimparParametros;
  if cbPesquisarPor.EditValue = Ord(tppTodos) then
    ipCds.ppuAddParametro(TParametros.coTodos, 'NAO_IMPORTA')
  else if (cbPesquisarPor.EditValue = Ord(tppId)) then
    ipCds.ppuAddParametro(TParametros.coID, EditPesquisa.Text)
  else if (cbPesquisarPor.EditValue = Ord(tppNome)) then
    ipCds.ppuAddParametro(TParametros.coNome, EditPesquisa.Text)
  else if (cbPesquisarPor.EditValue = Ord(tppData)) then
    ipCds.ppuAddParametro(TParametros.coData, DateToStr(EditDataInicialPesquisa.Date) + ';' + DateToStr(EditDataFinalPesquisa.Date));

end;

procedure TfrmBasicoCrud.pprEfetuarPesquisa;
var
  vaRecNo: Integer;
begin
  vaRecNo := -1;
  viewRegistros.BeginUpdate(lsimImmediate);
  try
    if dsMaster.DataSet.Active then
      vaRecNo := dsMaster.DataSet.RecNo;
    TRFClientDataSet(dsMaster.DataSet).ppuDataRequest();
    if dsMaster.DataSet.RecordCount > 0 then
      begin
        if (vaRecNo > 0) and (vaRecNo <= dsMaster.DataSet.RecordCount) then
          dsMaster.DataSet.RecNo := vaRecNo
        else if (vaRecNo > 0) then
          dsMaster.DataSet.RecNo := dsMaster.DataSet.RecordCount;
      end;

  finally
    viewRegistros.EndUpdate;
  end;

end;

procedure TfrmBasicoCrud.pprExecutarCancelar;
begin
  TClientDataSet(dsMaster.DataSet).CancelUpdates;
end;

procedure TfrmBasicoCrud.pprExecutarSalvar;
begin
  try
    if (dsMaster.DataSet.State in [dsEdit, dsInsert]) then
      dsMaster.DataSet.Post;
  except
    if dsMaster.DataSet.State = dsBrowse then
      dsMaster.DataSet.Edit;

    raise;
  end;
end;

function TfrmBasicoCrud.fprHabilitarAlterar: Boolean;
begin
  Result := dsMaster.DataSet.Active and (dsMaster.DataSet.RecordCount > 0);
end;

function TfrmBasicoCrud.fprHabilitarExcluir: Boolean;
begin
  Result := dsMaster.DataSet.Active and (dsMaster.DataSet.RecordCount > 0);
end;

function TfrmBasicoCrud.fprHabilitarSalvar(): Boolean;
begin
  Result := dsMaster.DataSet.Active and ((dsMaster.DataSet.State in [dsEdit, dsInsert]) or (TClientDataSet(dsMaster.DataSet).ChangeCount > 0));
end;

procedure TfrmBasicoCrud.pprPreencherCamposPadroes(ipDataSet: TDataSet);
var
  vaField: TField;
  vaTabela: String;
  vaDataHoraAtual: TDatetime;
begin
  vaDataHoraAtual := 0;
  vaField := ipDataSet.FindField(TBancoDados.coID);
  if Assigned(vaField) then
    begin
      if vaField.IsNull then
        begin
          if ipDataSet.State in [dsEdit, dsInsert] then
            begin
              vaTabela := Copy(ipDataSet.Name, 4, Length(ipDataSet.Name) - 3);
              vaField.AsInteger := dmPrincipal.FuncoesGeral.fpuGetId(vaTabela);
            end;
        end;
    end;

  vaField := ipDataSet.FindField(TBancoDados.coDataCadastro);
  if Assigned(vaField) then
    begin
      if vaField.IsNull then
        begin
          if ipDataSet.State in [dsEdit, dsInsert] then
            begin
              vaDataHoraAtual := StrToDateTimeDef(dmPrincipal.FuncoesGeral.fpuDataHoraAtual, 0);
              vaField.AsDateTime := vaDataHoraAtual;
            end;
        end;
    end;

  vaField := ipDataSet.FindField(TBancoDados.coDataAlteracao);
  if Assigned(vaField) then
    begin
      if ipDataSet.State in [dsEdit, dsInsert] then
        begin
          if vaDataHoraAtual = 0 then
            vaDataHoraAtual := StrToDateTimeDef(dmPrincipal.FuncoesGeral.fpuDataHoraAtual, 0);

          vaField.AsDateTime := vaDataHoraAtual;
        end;
    end;
end;

procedure TfrmBasicoCrud.pprRealizarPesquisaInicial;
begin
  if PesquisaPadrao <> Ord(tppActive) then
    begin
      cbPesquisarPor.LockChangeEvents(True);
      try
        cbPesquisarPor.EditValue := PesquisaPadrao;
        cbPesquisarPor.PostEditValue;
      finally
        cbPesquisarPor.LockChangeEvents(False, False);
      end;
    end;

  fprConfigurarControlesPesquisa;

  if (PesquisaPadrao = Ord(tppTodos)) or ((PesquisaPadrao = Ord(tppData)) and (not VarIsNull(EditDataInicialPesquisa.EditValue)) and
    (not VarIsNull(EditDataFinalPesquisa.EditValue))) then
    ppuPesquisar
  else if (PesquisaPadrao = Ord(tppId)) and Assigned(FModelo) and (FModelo.Id <> 0) then
    begin
      EditPesquisa.EditValue := FModelo.Id;
      EditPesquisa.PostEditValue;

      ppuPesquisar;
    end
  else // vai apenas abrir o cds sem trazer nada
    pprEfetuarPesquisa;
end;

procedure TfrmBasicoCrud.pprExecutarExcluir(ipId: Integer; ipAcao: TAcaoTela);
begin
  case ipAcao of
    atExcluir:
      begin
        if dsMaster.DataSet.Locate(TBancoDados.coID, ipId, []) then
          dsMaster.DataSet.Delete;
      end;
    atAtivar:
      begin
        if dsMaster.DataSet.Locate(TBancoDados.coID, ipId, []) then
          begin
            dsMaster.DataSet.Edit;
            dsMaster.DataSet.FieldByName(TBancoDados.coAtivo).AsInteger := coRegistroAtivo;
            dsMaster.DataSet.Post;
          end;
      end;
    atInativar:
      begin
        if dsMaster.DataSet.Locate(TBancoDados.coID, ipId, []) then
          begin
            dsMaster.DataSet.Edit;
            dsMaster.DataSet.FieldByName(TBancoDados.coAtivo).AsInteger := coRegistroInativo;
            dsMaster.DataSet.Post;
          end;
      end;
  end;
end;

function TfrmBasicoCrud.fpuExcluir(ipIds: TArray<Integer>): Boolean;
var
  vaId: Integer;
  vaPergunta: string;
  vaAcao: TAcaoTela;
  vaField: TField;
begin
  Result := False;
  if fprHabilitarExcluir then
    begin
      vaAcao := atExcluir;

      vaField := dsMaster.DataSet.FindField(TBancoDados.coAtivo);
      if Assigned(vaField) then
        begin
          if vaField.AsInteger = coRegistroAtivo then
            vaAcao := atInativar
          else
            vaAcao := atAtivar;
        end;

      vaPergunta := 'Realmente deseja ' + AcaoTelaDescricao[vaAcao] + '?';

      pprValidarPermissao(vaAcao, fprGetPermissao);

      if ModoSilencioso or (TMensagem.fpuPerguntar(vaPergunta, ppSimNao) = rpSim) then
        begin
          viewRegistros.BeginUpdate(lsimImmediate);
          try
            try
              for vaId in ipIds do
                begin
                  // nao posso dar disablecontrols aqui pq telas filhas podem precisar que o master-detail funcione
                  if dsMaster.DataSet.Locate(TBancoDados.coID, vaId, []) then
                    begin
                      pprBeforeExcluir(vaId, vaAcao);
                      pprExecutarExcluir(vaId, vaAcao);
                    end;
                end;

              if (TClientDataSet(dsMaster.DataSet).ChangeCount > 0) then
                TClientDataSet(dsMaster.DataSet).ApplyUpdates(0);

              Result := True;

              if vaAcao in [atAtivar, atInativar] then
                pprEfetuarPesquisa;

            except
              if (TClientDataSet(dsMaster.DataSet).ChangeCount > 0) then
                TClientDataSet(dsMaster.DataSet).CancelUpdates;
              raise;
            end;
          finally
            viewRegistros.EndUpdate;
          end;
        end;
    end;
end;

procedure TfrmBasicoCrud.pprBeforeAlterar;
begin
  if not dsMaster.DataSet.Active then
    pprRealizarPesquisaInicial;

  pprValidarPermissao(atAlterar, fprGetPermissao);
end;

procedure TfrmBasicoCrud.pprBeforeExcluir(ipId: Integer; ipAcao: TAcaoTela);
begin
  // TODO;implementar nas classes filhas
end;

procedure TfrmBasicoCrud.pprBeforeIncluir;
begin
  if not dsMaster.DataSet.Active then
    pprRealizarPesquisaInicial;

  pprValidarPermissao(atIncluir, fprGetPermissao);
end;

procedure TfrmBasicoCrud.pprCarregarDadosModelo;
begin
  // TODO;implementar nas classes filhs que desejam dar suporte ao Modo SomenteCadastro
end;

procedure TfrmBasicoCrud.ppuIncluir;
begin
  pprBeforeIncluir;
  dsMaster.DataSet.Append;
  pcPrincipal.ActivePage := tabCadastro;
  pprCarregarDadosModelo;
end;

procedure TfrmBasicoCrud.ppuPesquisar;
begin
  pprValidarPesquisa;
  pprCarregarParametrosPesquisa(dsMaster.DataSet as TRFClientDataSet);
  pprEfetuarPesquisa;

  FPesquisaRealizada := True;
end;

procedure TfrmBasicoCrud.ppuRetornar(ipAtualizar: Boolean);
var
  vaIdAtual: Integer;
begin
  if FModoExecucao in [meSomenteCadastro, meSomenteEdicao] then
    Close
  else
    begin
      pcPrincipal.ActivePage := tabPesquisa;
      if ipAtualizar then
        begin
          vaIdAtual := dsMaster.DataSet.FieldByName(TBancoDados.coID).AsInteger;
          pprEfetuarPesquisa;
          dsMaster.DataSet.Locate(TBancoDados.coID, vaIdAtual, []);
        end;
    end;
end;

procedure TfrmBasicoCrud.ppuRetornar;
begin
  ppuRetornar(True);
end;

procedure TfrmBasicoCrud.SetModelo(const Value: TModelo);
begin
  if Assigned(FModelo) then
    FreeAndNil(FModelo);

  FModelo := Value;
end;

procedure TfrmBasicoCrud.SetModoSilencioso(const Value: Boolean);
begin
  FModoSilencioso := Value;
end;

procedure TfrmBasicoCrud.SetPesquisaPadrao(const Value: Integer);
begin
  FPesquisaPadrao := Value;
end;

procedure TfrmBasicoCrud.viewRegistrosDblClick(Sender: TObject);
begin
  inherited;
  if dsMaster.DataSet.Active and (dsMaster.DataSet.RecordCount > 0) then
    ppuAlterar(dsMaster.DataSet.FieldByName(TBancoDados.coID).AsInteger);
end;

procedure TfrmBasicoCrud.ppuSalvar;
var
  vaState: TDataSetState;
begin
  pprBeforeSalvar;
  vaState := dsMaster.DataSet.State;
  pprExecutarSalvar;
  pprAfterSalvar(vaState);
end;

procedure TfrmBasicoCrud.pprConfigurarLabelsCamposObrigatorios();
var
  vaField: TField;
  I: Integer;
  vaContext: TRTTIContext;
  vaLabel: TLabel;
  vaProp: TRttiProperty;
  vaDataBind, vaDataSource: TObject;
  vaDataSet: TDataSet;
  vaFieldName: string;
begin
  for I := 0 to ComponentCount - 1 do
    begin
      if (Components[I] is TLabel) then
        begin
          vaLabel := TLabel(Components[I]);
          if Assigned(vaLabel.FocusControl) then
            begin
              vaContext := TRTTIContext.Create;
              vaProp := vaContext.GetType(vaLabel.FocusControl.ClassType).GetProperty('DataBinding');
              if Assigned(vaProp) then
                begin
                  vaDataBind := vaProp.GetValue(vaLabel.FocusControl).AsObject;
                  vaFieldName := vaContext.GetType(vaDataBind.ClassType).GetProperty('DataField')
                    .GetValue(vaDataBind).AsString;
                  vaProp := vaContext.GetType(vaDataBind.ClassType).GetProperty('DataSource');
                  if Assigned(vaProp) then
                    begin
                      vaDataSource := vaProp.GetValue(vaDataBind).AsObject;
                      if Assigned(vaDataSource) then
                        begin
                          vaDataSet := (vaDataSource as TDataSource).DataSet;
                          if Assigned(vaDataSet) then
                            begin
                              vaField := vaDataSet.FindField(vaFieldName);
                              if Assigned(vaField) and vaField.Required then
                                begin
                                  vaLabel.Font.Color := clRed;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;

function TfrmBasicoCrud.fprProcurarControlePorFieldName(ipFieldName: string): TWinControl;
var
  I: Integer;
  vaContext: TRTTIContext;
  vaProp: TRttiProperty;
  vaDataBind: TObject;
  vaFieldName: string;
begin
  Result := nil;
  for I := 0 to ComponentCount - 1 do
    begin
      if Components[I] is TcxCustomEdit then
        begin
          vaContext := TRTTIContext.Create;
          vaProp := vaContext.GetType(Components[I].ClassType).GetProperty('DataBinding');
          if Assigned(vaProp) then
            begin
              vaDataBind := vaProp.GetValue(Components[I]).AsObject;
              vaFieldName := vaContext.GetType(vaDataBind.ClassType).GetProperty('DataField')
                .GetValue(vaDataBind).AsString;
              if vaFieldName = ipFieldName then
                Exit(Components[I] as TWinControl);
            end;
        end;
    end;
end;

procedure TfrmBasicoCrud.pprValidarCamposObrigatorios(ipDataSet: TDataSet);
var
  vaField: TField;
  vaMsg: TStringList;
  vaControl: TWinControl;
begin
  vaControl := nil;
  // tem q estar em edit ou insert ou entao tem q ter algo no cds. Se isso nao acontecer é pq o usuario
  // deletou todos os registros e mandou gravar. Isso é possivel quando se usa o frameGrids
  if (ipDataSet.State in [dsInsert, dsEdit]) or (ipDataSet.RecordCount > 0) then
    begin
      vaMsg := TStringList.Create;
      try
        for vaField in ipDataSet.Fields do
          begin
            if vaField.Required and (vaField.IsNull or (vaField.AsString.Trim = '')) then
              begin
                vaMsg.Add(vaField.DisplayLabel);
                if not Assigned(vaControl) then
                  vaControl := fprProcurarControlePorFieldName(vaField.FieldName);
              end;
          end;

        if vaMsg.Count > 0 then
          begin
            if Assigned(vaControl) then
              raise TControlException.Create('Os seguintes campos são obrigatórios e não foram preenchidos:' + slineBreak + vaMsg.Text, vaControl)
            else
              raise Exception.Create('Os seguintes campos são obrigatórios e não foram preenchidos:' + slineBreak + vaMsg.Text);
          end;

      finally
        vaMsg.Free;
      end;
    end;

end;

procedure TfrmBasicoCrud.pprValidarDados;
begin
  pprValidarCamposObrigatorios(dsMaster.DataSet);
end;

procedure TfrmBasicoCrud.pprValidarPermissao(ipAcao: TAcaoTela; ipPermissao: string);
begin
  if not TInfoLogin.fpuGetInstance.Usuario.fpuValidarPermissao(ipAcao, ipPermissao) then
    raise Exception.Create('Operação não permitida.' + slineBreak + 'O usuário logado não possui a ação de ' +
      AcaoTelaDescricao[ipAcao].ToUpper + ' para a permissão ' + TModulos.fpuGetInstance.fpuGetDescricao(ipPermissao).ToUpper);
end;

procedure TfrmBasicoCrud.pprValidarPesquisa;
begin
  if EditPesquisa.Visible and (cbPesquisarPor.EditValue <> Ord(tppTodos)) then
    begin
      if Trim(EditPesquisa.Text) = '' then
        raise TControlException.Create('Informe algo a ser pesquisado', EditPesquisa);
    end;
  if pnData.Visible then
    begin
      if (EditDataInicialPesquisa.Date = 0) then
        raise Exception.Create('Informe a data inicial.');

      if (EditDataFinalPesquisa.Date = 0) then
        raise Exception.Create('Informe a data final.');
    end;

end;

// procedure TfrmBasicoCrud.pprVerificarExisteStatus;
// var
// vaField: TField;
// I: Integer;
// begin
// for I := 0 to dsMaster.DataSet.FieldCount - 1 do
// begin
// vaField := dsMaster.DataSet.Fields[I];
// if vaField.FieldName = TBancoDados.coAtivo then
// begin
// rgStatus.Visible := True;
// Break;
// end;
// end;
// end;

end.
