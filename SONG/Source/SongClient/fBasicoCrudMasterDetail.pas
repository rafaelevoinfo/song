unit fBasicoCrudMasterDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrud, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, System.Actions, Vcl.ActnList,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls, cxDropDownEdit,
  cxImageComboBox, cxTextEdit, cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC,
  cxSplitter, dmuPrincipal, uTypes, Datasnap.DBClient, uMensagem, MidasLib,
  cxGroupBox, cxRadioGroup, cxLocalization;

type
  TfrmBasicoCrudMasterDetail = class(TfrmBasicoCrud)
    cxSplitter1: TcxSplitter;
    pnDetail: TPanel;
    pcDetails: TcxPageControl;
    tabDetail: TcxTabSheet;
    Ac_Incluir_Detail: TAction;
    Ac_Alterar_Detail: TAction;
    Ac_Excluir_Detail: TAction;
    pnBotoesDetail: TPanel;
    btnIncluirDetail: TButton;
    cxGridRegistrosDetail: TcxGrid;
    viewRegistrosDetail: TcxGridDBTableView;
    ColumnAlterarDetail: TcxGridDBColumn;
    ColumnExcluirDetail: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    tabCadastroDetail: TcxTabSheet;
    Ac_Salvar_Detail: TAction;
    Ac_Cancelar_Detail: TAction;
    pnBotoesCadastroDetail: TPanel;
    btnSalvarDetail: TButton;
    btnCancelarDetail: TButton;
    dsDetail: TDataSource;
    pnEditsCadastroDetail: TPanel;
    btnSalvarIncluirDetail: TButton;
    Ac_Salvar_Incluir_Detail: TAction;
    btnUtilizarDetailSelecionado: TButton;
    Ac_Utilizar_Detail_Selecionado: TAction;
    procedure Ac_Incluir_DetailExecute(Sender: TObject);
    procedure Ac_Alterar_DetailExecute(Sender: TObject);
    procedure Ac_Excluir_DetailExecute(Sender: TObject);
    procedure Ac_Salvar_DetailExecute(Sender: TObject);
    procedure Ac_Cancelar_DetailExecute(Sender: TObject);
    procedure Ac_Salvar_DetailUpdate(Sender: TObject);
    procedure viewRegistrosDetailDblClick(Sender: TObject);
    procedure Ac_Salvar_Incluir_DetailExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Ac_Incluir_DetailUpdate(Sender: TObject);
    procedure Ac_Utilizar_Detail_SelecionadoExecute(Sender: TObject);
    procedure Ac_Alterar_DetailUpdate(Sender: TObject);
    procedure Ac_Excluir_DetailUpdate(Sender: TObject);
  private
    FIdDetailEscolhido: Integer;
    procedure SetIdDetailEscolhido(const Value: Integer);

  protected
    procedure pprBeforeSalvarDetail; virtual;
    procedure pprExecutarSalvarDetail; virtual;
    procedure pprAfterSalvarDetail; virtual;
    function fprHabilitarSalvarDetail(): Boolean; virtual;
    function fprHabilitarIncluirDetail: Boolean; virtual;
    function fprHabilitarAlterarDetail: Boolean; virtual;
    function fprHabilitarExcluirDetail: Boolean; virtual;
    procedure pprBeforeIncluirDetail; virtual;
    procedure pprBeforeAlterarDetail; virtual;
    procedure pprDefinirTabDetailCadastro; virtual;
    procedure pprEfetuarCancelarDetail; virtual;
    procedure pprEfetuarExcluirDetail(ipId: Integer); virtual;

    procedure pprValidarDadosDetail; virtual;
    procedure pprCarregarDadosModeloDetail; virtual;
    // OVERRIDE
    procedure pprEfetuarPesquisa; override;

  public
    property IdDetailEscolhido: Integer read FIdDetailEscolhido write SetIdDetailEscolhido;

    procedure ppuIncluirDetail; virtual;
    procedure ppuAlterarDetail(ipId: Integer); virtual;
    function fpuExcluirDetail(ipIds: TArray<Integer>): Boolean; virtual;
    function fpuCancelarDetail: Boolean; virtual;

    procedure ppuSalvarDetail;
    procedure ppuConfigurarModoExecucao(ipModo: TModoExecucao; ipModelo: TModelo = nil); override;
  end;

var
  frmBasicoCrudMasterDetail: TfrmBasicoCrudMasterDetail;

implementation

{$R *.dfm}
{ TfrmBasicoCrudMasterDetail }

procedure TfrmBasicoCrudMasterDetail.Ac_Alterar_DetailExecute(Sender: TObject);
begin
  inherited;
  ppuAlterarDetail(dsDetail.DataSet.FieldByName(TBancoDados.coId).AsLargeInt);
end;

procedure TfrmBasicoCrudMasterDetail.Ac_Alterar_DetailUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := fprHabilitarAlterarDetail;
end;

procedure TfrmBasicoCrudMasterDetail.Ac_Cancelar_DetailExecute(Sender: TObject);
begin
  inherited;
  if fpuCancelarDetail then
    ppuRetornar(False)
  else // salvou
    ppuRetornar(True);
end;

procedure TfrmBasicoCrudMasterDetail.Ac_Excluir_DetailExecute(Sender: TObject);
var
  vaIds: TArray<Integer>;
begin
  inherited;
  SetLength(vaIds, 1);
  vaIds[0] := dsDetail.DataSet.FieldByName(TBancoDados.coId).AsInteger;
  fpuExcluirDetail(vaIds);
end;

procedure TfrmBasicoCrudMasterDetail.Ac_Excluir_DetailUpdate(Sender: TObject);
begin
  inherited;
  if Sender is TAction then
    TAction(Sender).Enabled := fprHabilitarExcluirDetail();
end;

procedure TfrmBasicoCrudMasterDetail.Ac_Incluir_DetailExecute(Sender: TObject);
begin
  inherited;
  ppuIncluirDetail;
end;

procedure TfrmBasicoCrudMasterDetail.Ac_Incluir_DetailUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := fprHabilitarIncluirDetail;
end;

procedure TfrmBasicoCrudMasterDetail.Ac_Salvar_DetailExecute(Sender: TObject);
begin
  inherited;
  ppuSalvarDetail;
  ppuRetornar;
end;

procedure TfrmBasicoCrudMasterDetail.Ac_Salvar_DetailUpdate(Sender: TObject);
begin
  inherited;
  if Sender is TAction then
    TAction(Sender).Enabled := fprHabilitarSalvarDetail();
end;

procedure TfrmBasicoCrudMasterDetail.Ac_Salvar_Incluir_DetailExecute(
  Sender: TObject);
begin
  inherited;
  ppuSalvarDetail;
  ppuIncluirDetail;
end;

procedure TfrmBasicoCrudMasterDetail.Ac_Utilizar_Detail_SelecionadoExecute(
  Sender: TObject);
begin
  inherited;
  if dsDetail.DataSet.Active and (dsDetail.DataSet.RecordCount > 0) then
    begin
      FIdDetailEscolhido := dsDetail.DataSet.FieldByName(TBancoDados.coId).AsInteger;
      Close;
    end
  else
    TMensagem.ppuShowMessage('Nenhum registro foi escolhido.');
end;

procedure TfrmBasicoCrudMasterDetail.FormCreate(Sender: TObject);
begin
  inherited;
  pcDetails.ActivePage := tabDetail;
end;

function TfrmBasicoCrudMasterDetail.fprHabilitarAlterarDetail: Boolean;
begin
  Result := dsDetail.DataSet.Active and (dsDetail.DataSet.RecordCount > 0);
end;

function TfrmBasicoCrudMasterDetail.fprHabilitarExcluirDetail: Boolean;
begin
  Result := fprHabilitarAlterarDetail;
end;

function TfrmBasicoCrudMasterDetail.fprHabilitarIncluirDetail: Boolean;
begin
  Result := dsMaster.DataSet.Active and (dsMaster.DataSet.RecordCount > 0) and dsDetail.DataSet.Active;
end;

function TfrmBasicoCrudMasterDetail.fprHabilitarSalvarDetail(): Boolean;
begin
  Result := dsDetail.DataSet.Active and ((dsDetail.DataSet.State in [dsEdit, dsInsert]) or (TClientDataSet(dsDetail.DataSet).ChangeCount > 0));
end;

procedure TfrmBasicoCrudMasterDetail.pprAfterSalvarDetail;
begin
  if ModoExecucao in [meSomenteCadastro, meSomenteEdicao] then
    FIdDetailEscolhido := dsDetail.DataSet.FieldByName(TBancoDados.coId).AsInteger;
end;

procedure TfrmBasicoCrudMasterDetail.pprBeforeSalvarDetail;
begin
  pprPreencherCamposPadroes(dsDetail.DataSet);
  pprValidarDadosDetail;
end;

procedure TfrmBasicoCrudMasterDetail.pprCarregarDadosModeloDetail;
begin
  // Implementar nas classes filhas
end;

procedure TfrmBasicoCrudMasterDetail.pprEfetuarPesquisa;
begin
  viewRegistrosDetail.BeginUpdate(lsimImmediate);
  try
    dsDetail.DataSet.Close;
    inherited;
    dsDetail.DataSet.Open;
  finally
    viewRegistrosDetail.EndUpdate;
  end;

end;

procedure TfrmBasicoCrudMasterDetail.pprExecutarSalvarDetail;
begin

  try
    if (dsDetail.DataSet.State in [dsEdit, dsInsert]) then
      dsDetail.DataSet.Post;
  except
    if dsDetail.DataSet.State = dsBrowse then
      dsDetail.DataSet.Edit;
    raise;
  end;

end;

procedure TfrmBasicoCrudMasterDetail.pprValidarDadosDetail;
begin
  pprValidarCamposObrigatorios(dsDetail.DataSet);
end;

procedure TfrmBasicoCrudMasterDetail.ppuAlterarDetail(ipId: Integer);
begin
  if fprHabilitarAlterarDetail then
    begin
      pprBeforeAlterarDetail;
      pprDefinirTabDetailCadastro;

      pprCarregarDadosModeloDetail;
    end;
end;

function TfrmBasicoCrudMasterDetail.fpuCancelarDetail: Boolean;
begin
  Result := True;
  if fprHabilitarSalvarDetail then
    begin
      if TMensagem.fpuPerguntar('Desejar salvar?', ppSimNao) = rpSim then
        begin
          ppuSalvarDetail;
          Exit(False);
        end;
    end;

  pprEfetuarCancelarDetail;
end;

procedure TfrmBasicoCrudMasterDetail.ppuConfigurarModoExecucao(ipModo: TModoExecucao; ipModelo: TModelo);
begin
  inherited;
  case ipModo of
    mePesquisaDetail:
      begin
        btnUtilizar.Visible := False;
        btnUtilizarDetailSelecionado.Visible := True;
      end;
    meSomentePesquisa:
      btnIncluirDetail.Visible := False;
  end;
end;

procedure TfrmBasicoCrudMasterDetail.pprEfetuarCancelarDetail;
begin
  TClientDataSet(dsDetail.DataSet).CancelUpdates;
end;

procedure TfrmBasicoCrudMasterDetail.pprEfetuarExcluirDetail(ipId: Integer);
begin
  if dsDetail.DataSet.Locate(TBancoDados.coId, ipId, []) then
    dsDetail.DataSet.Delete;
end;

function TfrmBasicoCrudMasterDetail.fpuExcluirDetail(ipIds: TArray<Integer>): Boolean;
var
  vaId: Integer;
begin
  if fprHabilitarExcluirDetail then
    begin
      pprValidarPermissao(atExcluir, Permissao);
      Result := False;
      if TMensagem.fpuPerguntar('Realmente deseja excluir?', ppSimNao) = rpSim then
        begin
          try
            for vaId in ipIds do
              begin
                pprEfetuarExcluirDetail(vaId);
              end;

            if (TClientDataSet(dsDetail.DataSet).ChangeCount > 0) then
              TClientDataSet(dsDetail.DataSet).ApplyUpdates(0);
            Result := True;
          except
            if (TClientDataSet(dsDetail.DataSet).ChangeCount > 0) then
              TClientDataSet(dsDetail.DataSet).CancelUpdates;
            raise;
          end;
        end;
    end;
end;

procedure TfrmBasicoCrudMasterDetail.pprBeforeAlterarDetail;
begin
  pprValidarPermissao(atAlterar, Permissao);
end;

procedure TfrmBasicoCrudMasterDetail.pprBeforeIncluirDetail;
begin
  if not fprHabilitarIncluirDetail then
    raise Exception.Create('Não é possível incluir um registro filho sem um vínculo a um registro pai.');
  pprValidarPermissao(atIncluir, Permissao);
end;

procedure TfrmBasicoCrudMasterDetail.ppuIncluirDetail;
begin
  pprBeforeIncluirDetail;
  dsDetail.DataSet.Append;
  pprDefinirTabDetailCadastro;

  pprCarregarDadosModeloDetail;
end;

procedure TfrmBasicoCrudMasterDetail.pprDefinirTabDetailCadastro;
begin
  pcPrincipal.ActivePage := tabCadastroDetail;
end;

procedure TfrmBasicoCrudMasterDetail.viewRegistrosDetailDblClick(Sender: TObject);
begin
  inherited;
  if dsDetail.DataSet.Active and (dsDetail.DataSet.RecordCount > 0) then
    ppuAlterarDetail(dsDetail.DataSet.FieldByName(TBancoDados.coId).AsInteger);
end;

procedure TfrmBasicoCrudMasterDetail.ppuSalvarDetail;
begin
  pprBeforeSalvarDetail;
  pprExecutarSalvarDetail;
  pprAfterSalvarDetail;
end;

procedure TfrmBasicoCrudMasterDetail.SetIdDetailEscolhido(const Value: Integer);
begin
  FIdDetailEscolhido := Value;
end;

end.
