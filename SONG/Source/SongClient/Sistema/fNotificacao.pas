unit fNotificacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrudMasterDetail, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, System.Actions, Vcl.ActnList,
  cxSplitter, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxGroupBox,
  cxRadioGroup, Vcl.StdCtrls, cxDropDownEdit, cxImageComboBox, cxTextEdit,
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuSistema, dmuLookup, cxDBEdit,
  cxSpinEdit, fmGrids, Datasnap.DBClient, uClientDataSet, uUtils,
  System.TypInfo, uTypes, uConnection, uControleAcesso, dmuPrincipal,
  cxCurrencyEdit, cxCalc;

type
  TfrmNotificacao = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosTIPO: TcxGridDBColumn;
    viewRegistrosTEMPO_ANTECEDENCIA: TcxGridDBColumn;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_PESSOA: TcxGridDBColumn;
    viewRegistrosDetailNOME_PESSOA: TcxGridDBColumn;
    viewRegistrosDetailNOTIFICACAO_SISTEMA: TcxGridDBColumn;
    viewRegistrosDetailNOTIFICACAO_EMAIL: TcxGridDBColumn;
    frameUsuarios: TframeGrids;
    cdsLocalPessoa: TClientDataSet;
    cdsLocalPessoaID: TIntegerField;
    cdsLocalPessoaNOME: TStringField;
    pnEditsVariaveis: TPanel;
    pnDiasProcedencia: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    EditTempoProcedencia: TcxDBSpinEdit;
    pnDiasAntecedencia: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    EditTempoAntecedencia: TcxDBSpinEdit;
    pnValorGatilho: TPanel;
    Label9: TLabel;
    EditValorGatilho: TcxDBCurrencyEdit;
    viewRegistrosVALOR_GATILHO: TcxGridDBColumn;
    pnDiasAtividades: TPanel;
    EditDiasAtividade: TcxDBSpinEdit;
    lb1: TLabel;
    pnTipo: TPanel;
    Label3: TLabel;
    cbTipo: TcxDBImageComboBox;
    pnPercentualGatilho: TPanel;
    Label8: TLabel;
    EditPercentualGatilho: TcxDBCalcEdit;
    pnDiasSolicitacao: TPanel;
    lb2: TLabel;
    EditDiasAposSolicitacao: TcxDBSpinEdit;
    Label10: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cbTipoPropertiesEditValueChanged(Sender: TObject);
  private
    dmSistema: TdmSistema;
    dmLookup: TdmLookup;
    procedure ppvConfigurarGrids;
    procedure ppvCarregarPessoas;
    { Private declarations }
  protected
    function fprGetPermissao: String; override;
    procedure pprValidarDados; override;
    procedure pprBeforeSalvar; override;
    procedure pprExecutarSalvarDetail; override;
  public
    procedure ppuIncluirDetail; override;
    procedure ppuAlterarDetail(ipId: Integer); override;
  end;

var
  frmNotificacao: TfrmNotificacao;

implementation

{$R *.dfm}


procedure TfrmNotificacao.cbTipoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if Not VarIsNull(cbTipo.EditValue) then
    begin
      pnDiasAntecedencia.Visible := TTipoNotificacao(VarToStr(cbTipo.EditValue).ToInteger) in [tnContaPagarVencendo, tnAtividadeVencendo];
      pnDiasAtividades.Visible := TTipoNotificacao(VarToStr(cbTipo.EditValue).ToInteger) in [tnAtividadeCadastrada, tnAtividadeAlterada];
      pnDiasProcedencia.Visible := (not pnDiasAntecedencia.Visible) and
        (TTipoNotificacao(VarToStr(cbTipo.EditValue).ToInteger) = tnContaReceberVencida);
      pnValorGatilho.Visible := TTipoNotificacao(VarToStr(cbTipo.EditValue).ToInteger) = tnFundoFicandoSemSaldo;
      pnPercentualGatilho.Visible := TTipoNotificacao(VarToStr(cbTipo.EditValue).ToInteger) = tnRubricaAtigindoSaldo;
      pnDiasSolicitacao.Visible := TTipoNotificacao(VarToStr(cbTipo.EditValue).ToInteger) = tnSolicitacaoCompra;
    end
  else
    begin
      pnDiasAntecedencia.Visible := false;
      pnDiasProcedencia.Visible := false;
      pnDiasAtividades.Visible := false;
      pnValorGatilho.Visible := false;
      pnPercentualGatilho.Visible := false;
      pnDiasSolicitacao.Visible := false;
    end;

end;

procedure TfrmNotificacao.FormCreate(Sender: TObject);
var
  vaTipo: TTipoNotificacao;
  vaItem: TcxImageComboBoxItem;
begin
  dmSistema := TdmSistema.Create(Self);
  dmSistema.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  inherited;

  PesquisaPadrao := Ord(tppTodos);

  dmLookup.ppuCarregarPessoas(0, [trpFuncionario, trpEstagiario, trpMembroDiretoria]);

  ppvConfigurarGrids;

  dmLookup.repIcbTipoNotificacao.Properties.Items.Clear;
  for vaTipo := Low(TTipoNotificacao) to High(TTipoNotificacao) do
    begin
      vaItem := dmLookup.repIcbTipoNotificacao.Properties.Items.Add;
      vaItem.Value := Ord(vaTipo);
      vaItem.Description := TiposNotificacao[vaTipo];
    end;

end;

function TfrmNotificacao.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoSistema), Ord(sisNotificacao));
end;

procedure TfrmNotificacao.pprBeforeSalvar;
begin
  inherited;
  if not(pnDiasAntecedencia.Visible or pnDiasProcedencia.Visible or pnDiasAtividades.Visible or pnDiasSolicitacao.Visible) then
    begin
      dmSistema.cdsNotificacaoTEMPO_ANTECEDENCIA.Clear;
    end;
  if not (pnValorGatilho.Visible or pnPercentualGatilho.Visible) then
    dmSistema.cdsNotificacaoVALOR_GATILHO.Clear;
end;

procedure TfrmNotificacao.pprExecutarSalvarDetail;
begin
  inherited;
  if dmSistema.cdsNotificacao_Pessoa.ChangeCount > 0 then
    dmSistema.cdsNotificacao_Pessoa.ApplyUpdates(0);

end;

procedure TfrmNotificacao.pprValidarDados;
begin
  inherited;
  if not dmPrincipal.FuncoesSistema.fpuValidarTipoNotificacao(dmSistema.cdsNotificacaoID.AsInteger, dmSistema.cdsNotificacaoTIPO.AsInteger) then
    raise Exception.Create('Este tipo de notificação já foi cadastrada.');

end;

procedure TfrmNotificacao.ppuAlterarDetail(ipId: Integer);
begin
  inherited;
  ppvCarregarPessoas;
end;

procedure TfrmNotificacao.ppuIncluirDetail;
begin
  // nao chamar o inherited;
  pprBeforeIncluirDetail;
  ppvCarregarPessoas;
  pcPrincipal.ActivePage := tabCadastroDetail;
end;

procedure TfrmNotificacao.ppvCarregarPessoas;
begin
  cdsLocalPessoa.Data := dmLookup.cdslkPessoa.Data;
  cdsLocalPessoa.DisableControls;
  try
    TUtils.ppuPercorrerCds(dmSistema.cdsNotificacao_Pessoa,
      procedure
      begin
        if cdsLocalPessoa.Locate(cdsLocalPessoaID.FieldName, dmSistema.cdsNotificacao_PessoaID_PESSOA.AsInteger, []) then
          begin
            cdsLocalPessoa.Delete;
          end;
      end);
  finally
    cdsLocalPessoa.EnableControls;
  end;
end;

procedure TfrmNotificacao.ppvConfigurarGrids;
var
  vaColumn: TcxGridDBColumn;
begin
  // Esquerda
  frameUsuarios.fpuAdicionarField(frameUsuarios.viewEsquerda, 'ID', false);
  vaColumn := frameUsuarios.fpuAdicionarField(frameUsuarios.viewEsquerda, 'NOME');
  vaColumn.Width := 300;
  // Direita
  frameUsuarios.fpuAdicionarField(frameUsuarios.viewDireita, dmSistema.cdsNotificacao_PessoaID_PESSOA.FieldName, false);
  vaColumn := frameUsuarios.fpuAdicionarField(frameUsuarios.viewDireita, dmSistema.cdsNotificacao_PessoaNOME_PESSOA.FieldName);
  vaColumn.Width := 300;
  frameUsuarios.fpuAdicionarField(frameUsuarios.viewDireita, dmSistema.cdsNotificacao_PessoaNOTIFICACAO_SISTEMA.FieldName, true, true,
    dmLookup.repChkNaoSim);
  frameUsuarios.fpuAdicionarField(frameUsuarios.viewDireita, dmSistema.cdsNotificacao_PessoaNOTIFICACAO_EMAIL.FieldName, true, true,
    dmLookup.repChkNaoSim);
  // mapeando
  frameUsuarios.ppuMapearFields('ID', 'ID_PESSOA');
  frameUsuarios.ppuMapearFields('NOME', 'NOME_PESSOA');

  frameUsuarios.OnAddRemoveRegistro := procedure(ipDataSetOrigem, ipDataSetDestino: TDataSet; ipAcao: TTipoAcao)
    begin
      if ipAcao = tcAdd then
        begin
          ipDataSetDestino.FieldByName(dmSistema.cdsNotificacao_PessoaNOTIFICACAO_SISTEMA.FieldName).AsInteger := 1;
          ipDataSetDestino.FieldByName(dmSistema.cdsNotificacao_PessoaNOTIFICACAO_EMAIL.FieldName).AsInteger := 0;
        end;
    end;
end;

end.
