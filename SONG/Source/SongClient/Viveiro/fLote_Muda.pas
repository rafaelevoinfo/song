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
  fBasicoCrudMasterDetail;

type
  TLoteMuda = class(TLote)
  private
    FQtdeClassificada: Integer;
    procedure SetQtdeClassificada(const Value: Integer);
  public
    property QtdeClassificada: Integer read FQtdeClassificada write SetQtdeClassificada;
  end;

  TfrmLoteMuda = class(TfrmBasicoCrud)
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
    cxGroupBox1: TcxGroupBox;
    Label8: TLabel;
    cbPessoaClassificou: TcxDBLookupComboBox;
    btnPesquisar_Pessoa_Semeadura: TButton;
    Label10: TLabel;
    EditDataClassificacao: TcxDBDateEdit;
    Label9: TLabel;
    EditQtdeClassificada: TcxDBSpinEdit;
    Label11: TLabel;
    EditObservacaoClassificacao: TcxDBMemo;
    viewRegistrosID_COMPRA_ITEM: TcxGridDBColumn;
    viewRegistrosID_LOTE_SEMENTE: TcxGridDBColumn;
    viewRegistrosDATA_CLASSIFICACAO: TcxGridDBColumn;
    viewRegistrosQTDE_CLASSIFICADA: TcxGridDBColumn;
    viewRegistrosID_PESSOA_CLASSIFICOU: TcxGridDBColumn;
    viewRegistrosSALDO: TcxGridDBColumn;
    viewRegistrosPESSOA_CLASSIFICOU: TcxGridDBColumn;
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
    procedure pprValidarDados; override;

    procedure pprExecutarSalvar; override;

    procedure pprCarregarDadosModelo; override;
    procedure pprBeforeExcluir(ipId: Integer; ipAcao: TAcaoTela); override;
  public

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

      if vaLote.QtdeClassificada > 0 then
        dmViveiro.cdsLote_MudaQTDE_CLASSIFICADA.AsInteger := vaLote.QtdeClassificada;
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
  dmLookup.ppuCarregarPessoasAvulsas(dmViveiro.cdsLote_Muda, dmViveiro.cdsLote_MudaID_PESSOA_CLASSIFICOU.FieldName,
    dmViveiro.cdsLote_MudaPESSOA_CLASSIFICOU.FieldName);
end;

procedure TfrmLoteMuda.pprBeforeExcluir(ipId: Integer; ipAcao: TAcaoTela);
begin
  // ja vai estar posicionado no registro certo
  dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeMudaEstoque(dmViveiro.cdsLote_MudaID_ESPECIE.AsInteger,
    dmViveiro.cdsLote_MudaID.AsInteger, dmViveiro.cdsLote_MudaQTDE_CLASSIFICADA.AsInteger, 0);

  inherited;
end;

procedure TfrmLoteMuda.pprExecutarSalvar;
var
  vaQtdeClassificadaAnterior: Integer;
begin
  vaQtdeClassificadaAnterior := StrToIntDef(VarToStrDef(dmViveiro.cdsLote_MudaQTDE_CLASSIFICADA.OldValue, '0'), 0);
  inherited;
  dmPrincipal.FuncoesViveiro.ppuAtualizarQtdeMudaEstoque(dmViveiro.cdsLote_MudaID_ESPECIE.AsInteger, dmViveiro.cdsLote_MudaID.AsInteger,
    vaQtdeClassificadaAnterior, dmViveiro.cdsLote_MudaQTDE_CLASSIFICADA.AsInteger);
end;

procedure TfrmLoteMuda.pprValidarDados;
begin
  inherited;
  if dmViveiro.cdsLote_MudaQTDE_CLASSIFICADA.AsInteger > dmViveiro.cdsLote_MudaQTDE_INICIAL.AsInteger then
    raise TControlException.Create('A quantidade classificada não pode ser superior a quantidade inicial.', EditQtdeClassificada);
end;

function TfrmLoteMuda.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro), Ord(vivLoteMuda));
end;

{ TLoteMuda }

procedure TLoteMuda.SetQtdeClassificada(const Value: Integer);
begin
  FQtdeClassificada := Value;
end;

end.
