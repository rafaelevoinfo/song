unit fLote_Muda;

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
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, uControleAcesso, System.TypInfo,
  dmuViveiro, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dmuLookup,
  uTypes, uClientDataSet, System.DateUtils, cxCalc, cxDBEdit, cxSpinEdit,
  cxMemo, fPessoa, dmuPrincipal, uUtils;

type
  TLoteMuda = class(TLote)

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
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_PESSOA_CLASSIFICOU: TcxGridDBColumn;
    viewRegistrosDetailDATA: TcxGridDBColumn;
    viewRegistrosDetailQTDE: TcxGridDBColumn;
    viewRegistrosDetailPESSOA_CLASSIFICOU: TcxGridDBColumn;
    Label8: TLabel;
    cbPessoaClassificou: TcxDBLookupComboBox;
    btnPesquisar_Pessoa_Semeadura: TButton;
    Label9: TLabel;
    Label10: TLabel;
    EditDataClassificacao: TcxDBDateEdit;
    Label11: TLabel;
    EditObservacaoClassificacao: TcxDBMemo;
    EditQtdeClassificada: TcxDBSpinEdit;
    Ac_Pesquisar_Pessoa_Classificou: TAction;
    EditObsLote: TcxDBMemo;
    viewRegistrosQTDE_ATUAL: TcxGridDBColumn;
    viewRegistrosTAXA_CLASSIFICACAO: TcxGridDBColumn;
    Label4: TLabel;
    EditQtdeInicial: TcxDBSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure cbPessoaClassificouKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ac_Pesquisar_Pessoa_ClassificouExecute(Sender: TObject);
  private
    dmViveiro: TdmViveiro;
    dmLookup: TdmLookup;
  protected
    function fprGetPermissao: String; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    procedure pprEfetuarPesquisa; override;

    procedure pprExecutarSalvar; override;
    procedure pprExecutarSalvarDetail; override;

    procedure pprAfterSalvarDetail; override;

    procedure pprCarregarDadosModelo; override;
    procedure pprBeforeIncluirDetail; override;

    function fprHabilitarIncluirDetail: Boolean; override;

    procedure pprExecutarExcluir(ipId: integer; ipAcao: TAcaoTela); override;
  public
    function fpuExcluirDetail(ipIds: TArray<integer>): Boolean; override;
  public const
    coTiposPessoaPadrao: Set of TTipoRelacionamentoPessoa = [trpFuncionario, trpEstagiario, trpVoluntario, trpMembroDiretoria];
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

procedure TfrmLoteMuda.FormCreate(Sender: TObject);
begin
  dmViveiro := TdmViveiro.Create(Self);
  dmViveiro.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';
  inherited;

  PesquisaPadrao := tppData;

  dmLookup.ppuCarregarPessoas(0, [trpFuncionario, trpEstagiario, trpVoluntario, trpMembroDiretoria]);
  dmLookup.cdslkEspecie.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);
  EditDataInicialPesquisa.Date := IncDay(Now, -7);
  EditDataFinalPesquisa.Date := Now;

end;

procedure TfrmLoteMuda.pprAfterSalvarDetail;
begin
  inherited;
  dmPrincipal.FuncoesViveiro.ppuAtualizarTaxaClassificacaoMuda(dmViveiro.cdsLote_MudaID.AsInteger)
end;

procedure TfrmLoteMuda.pprBeforeIncluirDetail;
begin
  if dmViveiro.cdsClassificacao.RecordCount > 0 then
    raise Exception.Create('Só pode haver uma classificação por lote.');

  inherited;
end;

procedure TfrmLoteMuda.pprCarregarDadosModelo;
var
  vaLote: TLoteMuda;

  procedure plSetEdit(ipEdit: TcxCustomEdit; ipValor: Variant);
  begin
    if not VarIsNull(ipValor) then
      begin
        ipEdit.EditValue := ipValor;
        ipEdit.PostEditValue;
      end;
  end;

begin
  inherited;
  if (ModoExecucao = meSomenteCadastro) and Assigned(Modelo) and (Modelo is TLoteMuda) then
    begin
      vaLote := TLoteMuda(Modelo);

      plSetEdit(EditNome, vaLote.Nome);
      if vaLote.Data <> 0 then
        plSetEdit(EditData, vaLote.Data);

      if vaLote.Qtde <> 0 then
        plSetEdit(EditQtdeInicial, vaLote.Qtde);

      if vaLote.IdEspecie <> 0 then
        plSetEdit(cbEspecie, vaLote.IdEspecie);

      if vaLote.IdItemCompra <> 0 then
        dmViveiro.cdsLote_MudaID_COMPRA_ITEM.AsInteger := vaLote.IdItemCompra;
    end;

end;

procedure TfrmLoteMuda.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if not VarIsNull(cbEspeciePesquisa.EditValue) then
    ipCds.ppuAddParametro(TParametros.coEspecie, cbEspeciePesquisa.EditValue);
end;

procedure TfrmLoteMuda.pprEfetuarPesquisa;
begin
  inherited;
  dmLookup.ppuCarregarPessoasAvulsas(dmViveiro.cdsClassificacao, dmViveiro.cdsClassificacaoID_PESSOA_CLASSIFICOU.FieldName,
    dmViveiro.cdsClassificacaoPESSOA_CLASSIFICOU.FieldName);
end;

procedure TfrmLoteMuda.pprExecutarExcluir(ipId: integer; ipAcao: TAcaoTela);
var
  vaIdEspecie, vaQtdeDiminuir: integer;
begin
  // ja vai estar posicionado no registro certo
  vaIdEspecie := dmViveiro.cdsLote_MudaID_ESPECIE.AsInteger;
  if dmViveiro.cdsClassificacao.RecordCount > 0 then
    vaQtdeDiminuir := dmViveiro.cdsClassificacaoQTDE.AsInteger
  else
    vaQtdeDiminuir := dmViveiro.cdsLote_MudaQTDE_INICIAL.AsInteger;

  inherited;

  dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeMudaEstoque(vaIdEspecie, vaQtdeDiminuir, 0);
end;

procedure TfrmLoteMuda.pprExecutarSalvar;
var
  vaQtdeAnterior: integer;
begin
  vaQtdeAnterior := StrToIntDef(VarToStrDef(dmViveiro.cdsLote_MudaQTDE_INICIAL.OldValue, '0'), 0);
  inherited;
  dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeMudaEstoque(dmViveiro.cdsLote_MudaID_ESPECIE.AsInteger,
    vaQtdeAnterior, dmViveiro.cdsLote_MudaQTDE_INICIAL.AsInteger);
end;

procedure TfrmLoteMuda.pprExecutarSalvarDetail;
var
  vaQtdeAnterior: integer;
  vaEditando: Boolean;
begin
  if dmViveiro.cdsClassificacao.State = dsEdit then
    vaQtdeAnterior := StrToIntDef(VarToStrDef(dmViveiro.cdsClassificacaoQTDE.OldValue, '0'), 0)
  else
    vaQtdeAnterior := dmViveiro.cdsLote_MudaQTDE_INICIAL.AsInteger;

  inherited;

  dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeMudaEstoque(dmViveiro.cdsLote_MudaID_ESPECIE.AsInteger,
    vaQtdeAnterior, dmViveiro.cdsClassificacaoQTDE.AsInteger);

end;

function TfrmLoteMuda.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro), Ord(vivLoteMuda));
end;

function TfrmLoteMuda.fprHabilitarIncluirDetail: Boolean;
begin
  Result := inherited and (dsDetail.DataSet.RecordCount = 0);
end;

function TfrmLoteMuda.fpuExcluirDetail(ipIds: TArray<integer>): Boolean;
var
  vaQtde: integer;
begin
  vaQtde := dmViveiro.cdsClassificacaoQTDE.AsInteger;

  Result := inherited;
  if Result then
    begin
      dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeMudaEstoque(dmViveiro.cdsLote_MudaID_ESPECIE.AsInteger,
        vaQtde, dmViveiro.cdsLote_MudaQTDE_INICIAL.AsInteger);

      dmPrincipal.FuncoesViveiro.ppuAtualizarTaxaClassificacaoMuda(dmViveiro.cdsLote_MudaID.AsInteger);
      pprEfetuarPesquisa;
    end;

end;

end.
