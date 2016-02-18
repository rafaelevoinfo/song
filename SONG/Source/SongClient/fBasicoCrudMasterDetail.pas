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
  cxGroupBox, cxRadioGroup;

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
    procedure Ac_Incluir_DetailExecute(Sender: TObject);
    procedure Ac_Alterar_DetailExecute(Sender: TObject);
    procedure Ac_Excluir_DetailExecute(Sender: TObject);
    procedure Ac_Salvar_DetailExecute(Sender: TObject);
    procedure Ac_Cancelar_DetailExecute(Sender: TObject);
    procedure Ac_Salvar_DetailUpdate(Sender: TObject);
    procedure viewRegistrosDetailDblClick(Sender: TObject);
    procedure Ac_Salvar_Incluir_DetailExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  protected
    procedure pprBeforeSalvarDetail; virtual;
    procedure pprExecutarSalvarDetail; virtual;
    procedure pprAfterSalvarDetail; virtual;
    function fprHabilitarSalvarDetail(): Boolean; virtual;
    procedure pprBeforeIncluirDetail; virtual;
    procedure pprBeforeAlterarDetail; virtual;
    procedure pprDefinirTabDetailCadastro;virtual;

    procedure pprValidarDadosDetail; virtual;
    // OVERRIDE
    procedure pprEfetuarPesquisa; override;
  public

    procedure ppuIncluirDetail; virtual;
    procedure ppuAlterarDetail(ipId: Integer); virtual;
    function fpuExcluirDetail(ipIds: TArray<Integer>): Boolean; virtual;
    procedure ppuCancelarDetail; virtual;

    function fpuSalvarDetail: Boolean;
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

procedure TfrmBasicoCrudMasterDetail.Ac_Cancelar_DetailExecute(Sender: TObject);
begin
  inherited;
  ppuCancelarDetail;
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

procedure TfrmBasicoCrudMasterDetail.Ac_Incluir_DetailExecute(Sender: TObject);
begin
  inherited;
  ppuIncluirDetail;
end;

procedure TfrmBasicoCrudMasterDetail.Ac_Salvar_DetailExecute(Sender: TObject);
begin
  inherited;
  if fpuSalvarDetail then
    pcPrincipal.ActivePage := tabPesquisa;
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
  if fpuSalvarDetail then
    ppuIncluirDetail;
end;

procedure TfrmBasicoCrudMasterDetail.FormCreate(Sender: TObject);
begin
  inherited;
  pcDetails.ActivePage := tabDetail;
end;

function TfrmBasicoCrudMasterDetail.fprHabilitarSalvarDetail(): Boolean;
begin
  Result := dsDetail.DataSet.Active and ((dsDetail.DataSet.State in [dsEdit, dsInsert]) or
    (TClientDataSet(dsDetail.DataSet).ChangeCount > 0));
end;

procedure TfrmBasicoCrudMasterDetail.pprAfterSalvarDetail;
begin

end;

procedure TfrmBasicoCrudMasterDetail.pprBeforeSalvarDetail;
begin
  pprPreencherCamposPadroes(dsDetail.DataSet);
  pprValidarDadosDetail;
end;

procedure TfrmBasicoCrudMasterDetail.pprEfetuarPesquisa;
begin
  viewRegistrosDetail.BeginUpdate(lsimImmediate);
  try
    inherited;
    dsDetail.DataSet.Open;
  finally
    viewRegistrosDetail.EndUpdate;
  end;

end;

procedure TfrmBasicoCrudMasterDetail.pprExecutarSalvarDetail;
begin
  if (dsDetail.DataSet.State in [dsEdit, dsInsert]) then
    dsDetail.DataSet.Post;

  if (TClientDataSet(dsDetail.DataSet).ChangeCount > 0) then
    TClientDataSet(dsDetail.DataSet).ApplyUpdates(0);
end;

procedure TfrmBasicoCrudMasterDetail.pprValidarDadosDetail;
begin
  pprValidarCamposObrigatorios(dsDetail.DataSet);
end;

procedure TfrmBasicoCrudMasterDetail.ppuAlterarDetail(ipId: Integer);
begin
  pprBeforeAlterarDetail;
  pprDefinirTabDetailCadastro;
end;

procedure TfrmBasicoCrudMasterDetail.ppuCancelarDetail;
begin
  if fprHabilitarSalvarDetail then
    begin
      if TMensagem.fpuPerguntar('Desejar salvar?', ppSimNao) = rpSim then
        begin
          fpuSalvarDetail;
          Exit;
        end;
    end;

  TClientDataSet(dsDetail.DataSet).CancelUpdates;
  ppuRetornar;
end;

function TfrmBasicoCrudMasterDetail.fpuExcluirDetail(ipIds: TArray<Integer>): Boolean;
var
  vaId: Integer;
begin
  pprValidarPermissao(atExcluir, Permissao);
  Result := False;
  if TMensagem.fpuPerguntar('Realmente deseja excluir?', ppSimNao) = rpSim then
    begin
      for vaId in ipIds do
        begin
          if dsDetail.DataSet.Locate(TBancoDados.coId, vaId, []) then
            dsDetail.DataSet.Delete;
        end;

      if (TClientDataSet(dsDetail.DataSet).ChangeCount > 0) then
        TClientDataSet(dsDetail.DataSet).ApplyUpdates(0);
      Result := True;
    end;
end;

procedure TfrmBasicoCrudMasterDetail.pprBeforeAlterarDetail;
begin
   pprValidarPermissao(atAlterar, Permissao);
end;

procedure TfrmBasicoCrudMasterDetail.pprBeforeIncluirDetail;
begin
  pprValidarPermissao(atIncluir, Permissao);
end;

procedure TfrmBasicoCrudMasterDetail.ppuIncluirDetail;
begin
  pprBeforeIncluirDetail;
  dsDetail.DataSet.Append;
  pprDefinirTabDetailCadastro;
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

function TfrmBasicoCrudMasterDetail.fpuSalvarDetail: Boolean;
begin
  Result := False;
  pprBeforeSalvarDetail;
  pprExecutarSalvarDetail;
  pprAfterSalvarDetail;
  Result := True;
end;

end.
