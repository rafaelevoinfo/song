unit fLote_Muda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, System.Actions, Vcl.ActnList,
  cxSplitter, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxGroupBox,
  cxRadioGroup, Vcl.StdCtrls, cxDropDownEdit, cxImageComboBox, cxTextEdit,
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, uControleAcesso, System.TypInfo,
  dmuViveiro, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dmuLookup,
  uTypes, uClientDataSet, System.DateUtils, cxCalc, cxDBEdit, cxSpinEdit,
  cxMemo, fPessoa, dmuPrincipal, uUtils, uExceptions, fBasicoCrud,
  fBasicoCrudMasterDetail, fCanteiro, Vcl.ExtDlgs, Vcl.Menus;

type
  TLoteMuda = class(TLote)
  private
    FIdLoteSemente: Integer;
    FStatus: TStatusMuda;
    procedure SetIdLoteSemente(const Value: Integer);
    procedure SetStatus(const Value: TStatusMuda);
  public
    property IdLoteSemente: Integer read FIdLoteSemente write SetIdLoteSemente;
    property Status: TStatusMuda read FStatus write SetStatus;
  end;

  TClassificacao = class(TModelo)
  private
    FObservacao: String;
    FQtde: Integer;
    FIdPessoaClassificou: Integer;
    FData: TDate;
    procedure SetData(const Value: TDate);
    procedure SetIdPessoaClassificou(const Value: Integer);
    procedure SetObservacao(const Value: String);
    procedure SetQtde(const Value: Integer);
  public
    property Qtde: Integer read FQtde write SetQtde;
    property Data: TDate read FData write SetData;
    property IdPessoaClassificou: Integer read FIdPessoaClassificou write SetIdPessoaClassificou;
    property Observacao: String read FObservacao write SetObservacao;
  end;

  TfrmLoteMuda = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_ESPECIE: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosQTDE_INICIAL: TcxGridDBColumn;
    viewRegistrosDATA: TcxGridDBColumn;
    viewRegistrosNOME_ESPECIE: TcxGridDBColumn;
    lbl1: TLabel;
    cbEspeciePesquisa: TcxLookupComboBox;
    Label3: TLabel;
    EditNome: TcxDBTextEdit;
    Label7: TLabel;
    cbEspecie: TcxDBLookupComboBox;
    EditData: TcxDBDateEdit;
    Label5: TLabel;
    lbl2: TLabel;
    Ac_Pesquisar_Pessoa_Classificou: TAction;
    EditObsLote: TcxDBMemo;
    viewRegistrosTAXA_CLASSIFICACAO: TcxGridDBColumn;
    Label4: TLabel;
    EditQtdeInicial: TcxDBSpinEdit;
    viewRegistrosID_COMPRA_ITEM: TcxGridDBColumn;
    viewRegistrosID_LOTE_SEMENTE: TcxGridDBColumn;
    viewRegistrosSALDO: TcxGridDBColumn;
    cbStatusMuda: TcxDBImageComboBox;
    Label6: TLabel;
    viewRegistrosSTATUS: TcxGridDBColumn;
    cbPesquisaStatusMuda: TcxImageComboBox;
    tabDetailCanteiros: TcxTabSheet;
    pnBotoesCanteiro: TPanel;
    btnIncluirCanteiro: TButton;
    cxGrid1: TcxGrid;
    viewCanteiros: TcxGridDBTableView;
    ColumnAlterarCanteiro: TcxGridDBColumn;
    ColumnExcluirCanteiro: TcxGridDBColumn;
    level1: TcxGridLevel;
    Label8: TLabel;
    cbPessoaClassificou: TcxDBLookupComboBox;
    btnPesquisar_Pessoa_Semeadura: TButton;
    Label10: TLabel;
    EditDataClassificacao: TcxDBDateEdit;
    Label11: TLabel;
    EditObservacaoClassificacao: TcxDBMemo;
    tabCadastroCanteiro: TcxTabSheet;
    pnBotoesCadastrarCanteiro: TPanel;
    btnSalvarCanteiro: TButton;
    btnCancelarCanteiro: TButton;
    btnSalvarIncluirCanteiro: TButton;
    lb1: TLabel;
    cbCanteiro: TcxDBLookupComboBox;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_PESSOA_CLASSIFICOU: TcxGridDBColumn;
    viewRegistrosDetailDATA: TcxGridDBColumn;
    viewRegistrosDetailQTDE: TcxGridDBColumn;
    viewRegistrosDetailPESSOA_CLASSIFICOU: TcxGridDBColumn;
    dsLote_Muda_Canteiro: TDataSource;
    viewCanteirosID: TcxGridDBColumn;
    viewCanteirosID_CANTEIRO: TcxGridDBColumn;
    viewCanteirosNOME_CANTEIRO: TcxGridDBColumn;
    viewRegistrosRAZAO_SOCIAL: TcxGridDBColumn;
    pnQtdeMuda: TPanel;
    pnQtdeMudaPerdida: TPanel;
    Label9: TLabel;
    EditQtdeClassificada: TcxDBSpinEdit;
    pnQtdeMudaAtual: TPanel;
    Label12: TLabel;
    EditQtdeMudaAtual: TcxSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure cbPessoaClassificouKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ac_Pesquisar_Pessoa_ClassificouExecute(Sender: TObject);
    procedure pcDetailsChange(Sender: TObject);
    procedure EditQtdeMudaAtualPropertiesEditValueChanged(Sender: TObject);
  private
    dmViveiro: TdmViveiro;
    dmLookup: TdmLookup;
    procedure ppvLimparEditQtdeMudaAtual;
  protected
    function fprGetPermissao: String; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    procedure pprEfetuarPesquisa; override;
    procedure pprValidarDados; override;
    procedure pprValidarPesquisa; override;
    function fprConfigurarControlesPesquisa: TWinControl; override;
    procedure pprCarregarDadosModelo; override;

    procedure pprBeforeSalvar; override;
    procedure pprBeforeSalvarDetail; override;

    // Detail
    procedure pprValidarDadosDetail; override;
    procedure pprDefinirTabDetailCadastro; override;
    procedure pprBeforeAlterarDetail; override;
    procedure pprCarregarDadosModeloDetail; override;

    function fprMontarTextoPanelFiltro(ipParametro: String; ipValor: Variant): String; override;

  public
    procedure ppuIncluir; override;
    procedure ppuIncluirDetail; override;
    procedure ppuAlterarDetail(ipId: Integer); override;
    procedure ppuRetornar(ipAtualizar: Boolean); override;

  public const
    coTiposPessoaPadrao: Set of TTipoRelacionamentoPessoa = [trpFuncionario, trpEstagiario, trpVoluntario, trpMembroDiretoria];
    coPesquisaStatus = 5;
    coPesquisaLoteSemente = 6;
  end;

var
  frmLoteMuda: TfrmLoteMuda;

implementation

{$R *.dfm}


procedure TfrmLoteMuda.Ac_Pesquisar_Pessoa_ClassificouExecute(Sender: TObject);
begin
  inherited;
  dmLookup.ppuPesquisarPessoa(cbPessoaClassificou, coTiposPessoaPadrao);
end;

procedure TfrmLoteMuda.cbPessoaClassificouKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    dmLookup.ppuPesquisarPessoa(cbPessoaClassificou, coTiposPessoaPadrao);
end;

procedure TfrmLoteMuda.EditQtdeMudaAtualPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastroDetail then
    begin
      if not(dmViveiro.cdsClassificacao.State in [dsEdit, dsInsert]) then
        dmViveiro.cdsClassificacao.Edit;

      if dmViveiro.cdsClassificacao.State = dsInsert then
        dmViveiro.cdsClassificacaoQTDE.AsInteger := dmViveiro.cdsLote_MudaSALDO.AsInteger - StrToIntDef(VarToStr(EditQtdeMudaAtual.Value), 0)
      else
        dmViveiro.cdsClassificacaoQTDE.AsInteger := (dmViveiro.cdsLote_MudaSALDO.AsInteger + dmViveiro.cdsClassificacaoQTDE.AsInteger) - StrToIntDef(VarToStr(EditQtdeMudaAtual.Value), 0);
    end;
end;

procedure TfrmLoteMuda.FormCreate(Sender: TObject);
begin
  dmViveiro := TdmViveiro.Create(Self);
  dmViveiro.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';
  inherited;

  PesquisaPadrao := Ord(tppData);

  EditDataInicialPesquisa.Date := IncDay(Now, -7);
  EditDataFinalPesquisa.Date := Now;

  dmLookup.ppuCarregarPessoas(0, [trpFuncionario, trpEstagiario, trpVoluntario, trpMembroDiretoria]);

  dmLookup.cdslkEspecie.ppuAddParametro(TParametros.coTodos, 'NAO_IMPORTA');
  dmLookup.ppuAbrirCache(dmLookup.cdslkEspecie);

  dmLookup.cdslkCanteiro.ppuAddParametro(TParametros.coTodos, 'NAO_IMPORTA');
  dmLookup.ppuAbrirCache(dmLookup.cdslkCanteiro);

end;

procedure TfrmLoteMuda.pcDetailsChange(Sender: TObject);
begin
  inherited;
  if pcDetails.ActivePage = tabDetail then
    dsDetail.DataSet := dmViveiro.cdsClassificacao
  else if pcDetails.ActivePage = tabDetailCanteiros then
    dsDetail.DataSet := dmViveiro.cdsLote_Muda_Canteiro;

  if not dsDetail.DataSet.Active then
    dsDetail.DataSet.Open;
end;

procedure TfrmLoteMuda.pprBeforeAlterarDetail;
begin
  inherited;
  if dsDetail.DataSet = dmViveiro.cdsClassificacao then
    begin
      dmLookup.ppuCarregarPessoasAvulsas(dmViveiro.cdsClassificacao, dmViveiro.cdsClassificacaoID_PESSOA_CLASSIFICOU.FieldName,
        dmViveiro.cdsClassificacaoPESSOA_CLASSIFICOU.FieldName);
    end;
end;

procedure TfrmLoteMuda.pprBeforeSalvar;
begin
  inherited;

  if dmViveiro.cdsLote_Muda.State = dsInsert then
    begin
      dmViveiro.cdsLote_MudaTAXA_CLASSIFICACAO.AsInteger := 100;
      dmViveiro.cdsLote_MudaSALDO.AsInteger := dmViveiro.cdsLote_MudaQTDE_INICIAL.AsInteger;
    end;

  if not(dmViveiro.cdsLote_Muda.State in [dsEdit, dsInsert]) then
    dmViveiro.cdsLote_Muda.Edit;

  dmViveiro.cdsLote_MudaNOME_ESPECIE.AsString := cbEspecie.Text;
end;

procedure TfrmLoteMuda.pprBeforeSalvarDetail;
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastroDetail then
    dmViveiro.cdsClassificacaoPESSOA_CLASSIFICOU.AsString := cbPessoaClassificou.Text
  else if pcPrincipal.ActivePage = tabCadastroCanteiro then
    dmViveiro.cdsLote_Muda_CanteiroNOME_CANTEIRO.AsString := cbCanteiro.Text;
end;

procedure TfrmLoteMuda.pprCarregarDadosModelo;
var
  vaLote: TLoteMuda;
begin
  inherited;
  if (ModoExecucao in [meSomenteCadastro, meSomenteEdicao]) and Assigned(Modelo) and (Modelo is TLoteMuda) then
    begin
      vaLote := TLoteMuda(Modelo);
      dmViveiro.cdsLote_Muda.Edit;
      if (vaLote.Id <> 0) and (dmViveiro.cdsLote_MudaID.IsNull) then
        dmViveiro.cdsLote_MudaID.AsInteger := vaLote.Id;

      if (vaLote.Nome <> '') and (dmViveiro.cdsLote_MudaNOME.AsString <> vaLote.Nome) then
        dmViveiro.cdsLote_MudaNOME.AsString := vaLote.Nome;

      if (vaLote.Data <> 0) and (dmViveiro.cdsLote_MudaDATA.AsDateTime <> vaLote.Data) then
        dmViveiro.cdsLote_MudaDATA.AsDateTime := vaLote.Data;

      if (vaLote.Qtde <> 0) and (dmViveiro.cdsLote_MudaQTDE_INICIAL.AsInteger <> vaLote.Qtde) then
        dmViveiro.cdsLote_MudaQTDE_INICIAL.AsInteger := Trunc(vaLote.Qtde);

      if (vaLote.IdEspecie <> 0) and (dmViveiro.cdsLote_MudaID_ESPECIE.AsInteger <> vaLote.IdEspecie) then
        dmViveiro.cdsLote_MudaID_ESPECIE.AsInteger := vaLote.IdEspecie;

      if (vaLote.IdItemCompra <> 0) and (dmViveiro.cdsLote_MudaID_COMPRA_ITEM.AsInteger <> vaLote.IdItemCompra) then
        dmViveiro.cdsLote_MudaID_COMPRA_ITEM.AsInteger := vaLote.IdItemCompra;

      if (vaLote.IdLoteSemente <> 0) and (dmViveiro.cdsLote_MudaID_LOTE_SEMENTE.AsInteger <> vaLote.IdLoteSemente) then
        dmViveiro.cdsLote_MudaID_LOTE_SEMENTE.AsInteger := vaLote.IdLoteSemente;
    end;

end;

procedure TfrmLoteMuda.pprCarregarDadosModeloDetail;
var
  vaClassificacao: TClassificacao;
  vaCanteiro: TCanteiro;
begin
  inherited;
  if (ModoExecucao in [meSomenteCadastro, meSomenteEdicao]) and Assigned(Modelo) then
    begin
      if (Modelo is TClassificacao) then
        begin
          vaClassificacao := TClassificacao(Modelo);
          if not(dmViveiro.cdsClassificacao.State in [dsEdit, dsInsert]) then
            dmViveiro.cdsClassificacao.Edit;

          if (vaClassificacao.Qtde <> 0) and (dmViveiro.cdsClassificacaoQTDE.AsInteger <> vaClassificacao.Qtde) then
            dmViveiro.cdsClassificacaoQTDE.AsInteger := vaClassificacao.Qtde;

          if (vaClassificacao.Data <> 0) and (dmViveiro.cdsClassificacaoDATA.AsDateTime <> vaClassificacao.Data) then
            dmViveiro.cdsClassificacaoDATA.AsDateTime := vaClassificacao.Data;

          if (vaClassificacao.Observacao <> '') and (dmViveiro.cdsClassificacaoOBSERVACAO.AsString <> vaClassificacao.Observacao) then
            dmViveiro.cdsClassificacaoOBSERVACAO.AsString := vaClassificacao.Observacao;

          if (vaClassificacao.IdPessoaClassificou <> 0) and
            (dmViveiro.cdsClassificacaoID_PESSOA_CLASSIFICOU.AsInteger <> vaClassificacao.IdPessoaClassificou) then
            dmViveiro.cdsClassificacaoID_PESSOA_CLASSIFICOU.AsInteger := vaClassificacao.IdPessoaClassificou;
        end
      else if Modelo is TCanteiro then
        begin
          vaCanteiro := TCanteiro(Modelo);
          if not(dmViveiro.cdsLote_Muda_Canteiro.State in [dsEdit, dsInsert]) then
            dmViveiro.cdsLote_Muda_Canteiro.Edit;

          if (vaCanteiro.Id <> 0) and (dmViveiro.cdsLote_Muda_CanteiroID_CANTEIRO.AsInteger <> vaCanteiro.Id) then
            dmViveiro.cdsLote_Muda_CanteiroID_CANTEIRO.AsInteger := vaCanteiro.Id;

        end;
    end;
end;

procedure TfrmLoteMuda.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if not VarIsNull(cbEspeciePesquisa.EditValue) then
    ipCds.ppuAddParametro(TParametros.coEspecie, cbEspeciePesquisa.EditValue);

  if cbPesquisarPor.EditValue = coPesquisaStatus then
    ipCds.ppuAddParametro(TParametros.coStatus, cbPesquisaStatusMuda.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaLoteSemente then
    ipCds.ppuAddParametro(TParametros.coLoteSemente, EditPesquisa.Text);
end;

procedure TfrmLoteMuda.pprDefinirTabDetailCadastro;
begin
  inherited;
  if pcDetails.ActivePage = tabDetail then
    pcPrincipal.ActivePage := tabCadastroDetail
  else if pcDetails.ActivePage = tabDetailCanteiros then
    pcPrincipal.ActivePage := tabCadastroCanteiro;
end;

procedure TfrmLoteMuda.pprEfetuarPesquisa;
begin
  dmViveiro.cdsClassificacao.Close;
  dmViveiro.cdsLote_Muda_Canteiro.Close;
  inherited;
  dmViveiro.cdsLote_Muda_Canteiro.Open;
  dmViveiro.cdsClassificacao.Open;
end;

procedure TfrmLoteMuda.pprValidarDados;
begin
  inherited;

end;

procedure TfrmLoteMuda.pprValidarDadosDetail;
begin
  inherited;
  if dsDetail.DataSet = dmViveiro.cdsClassificacao then
    begin
      if True then

      try
        dmPrincipal.FuncoesEstoque.ppuValidarClassificacao(dmViveiro.cdsLote_MudaID.AsInteger, dmViveiro.cdsClassificacaoQTDE.AsInteger);
      except
        on E: Exception do
          raise TControlException.Create(E.Message, EditQtdeClassificada);
      end;
    end;
end;

procedure TfrmLoteMuda.pprValidarPesquisa;
begin
  inherited;
  if cbPesquisaStatusMuda.visible and VarIsNull(cbPesquisaStatusMuda.EditValue) then
    raise TControlException.Create('Informe o status a ser pesquisado.', cbPesquisaStatusMuda);

end;

procedure TfrmLoteMuda.ppuAlterarDetail(ipId: Integer);
begin
  inherited;
  if dsDetail.DataSet = dmViveiro.cdsClassificacao then
    begin
      ppvLimparEditQtdeMudaAtual
    end;

end;

procedure TfrmLoteMuda.ppvLimparEditQtdeMudaAtual;
begin
  EditQtdeMudaAtual.LockChangeEvents(true);
  try
    EditQtdeMudaAtual.Clear;
  finally
    EditQtdeMudaAtual.LockChangeEvents(false, false);
  end;
end;

procedure TfrmLoteMuda.ppuIncluir;
begin
  inherited;
  if dmViveiro.cdsLote_MudaSTATUS.IsNull then
    dmViveiro.cdsLote_MudaSTATUS.AsInteger := Ord(smDesenvolvimento);

  if dmViveiro.cdsLote_MudaDATA.IsNull then
    dmViveiro.cdsLote_MudaDATA.AsDateTime := Now;

  if dmViveiro.cdsLote_MudaID.IsNull then
    pprPreencherCamposPadroes(dmViveiro.cdsLote_Muda);

  if dmViveiro.cdsLote_MudaNOME.AsString = '' then
    dmViveiro.cdsLote_MudaNOME.AsString := 'Lote ' + dmViveiro.cdsLote_MudaID.AsString
  else
    dmViveiro.cdsLote_MudaNOME.AsString := dmViveiro.cdsLote_MudaNOME.AsString + ' ' + dmViveiro.cdsLote_MudaID.AsString;
end;

procedure TfrmLoteMuda.ppuIncluirDetail;
begin
  inherited;
  if dsDetail.DataSet = dmViveiro.cdsClassificacao then
    begin
      ppvLimparEditQtdeMudaAtual;
    end;
end;

procedure TfrmLoteMuda.ppuRetornar(ipAtualizar: Boolean);
begin
  // inherited;
  if pcPrincipal.ActivePage = tabCadastroDetail then
    inherited
  else
    pcPrincipal.ActivePage := tabPesquisa;
end;

function TfrmLoteMuda.fprConfigurarControlesPesquisa: TWinControl;
begin
  Result := inherited;
  cbPesquisaStatusMuda.visible := cbPesquisarPor.EditValue = coPesquisaStatus;
  EditPesquisa.visible := EditPesquisa.visible and (not(cbPesquisaStatusMuda.visible));
  if cbPesquisarPor.EditValue = coPesquisaLoteSemente then
    EditPesquisa.Properties.EditMask := '\d+(;\d+)*';

  if cbPesquisaStatusMuda.visible then
    Result := cbPesquisaStatusMuda;
end;

function TfrmLoteMuda.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro), Ord(vivLoteMuda));
end;

function TfrmLoteMuda.fprMontarTextoPanelFiltro(ipParametro: String;
  ipValor: Variant): String;
begin
  if ipParametro = TParametros.coEspecie then
    Result := 'Espécie = ' + cbEspeciePesquisa.Text
  else
    Result := inherited;
end;

{ TLoteMuda }

procedure TLoteMuda.SetIdLoteSemente(const Value: Integer);
begin
  FIdLoteSemente := Value;
end;

procedure TLoteMuda.SetStatus(const Value: TStatusMuda);
begin
  FStatus := Value;
end;

{ TClassificacao }

procedure TClassificacao.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TClassificacao.SetIdPessoaClassificou(const Value: Integer);
begin
  FIdPessoaClassificou := Value;
end;

procedure TClassificacao.SetObservacao(const Value: String);
begin
  FObservacao := Value;
end;

procedure TClassificacao.SetQtde(const Value: Integer);
begin
  FQtde := Value;
end;

end.
