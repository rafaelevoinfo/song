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
  cxMemo, fPessoa, dmuPrincipal;

type
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
    procedure pprAfterSalvarDetail; override;
  public
    function fpuExcluirDetail(ipIds: TArray<Integer>): Boolean; override;
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

function TfrmLoteMuda.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro), Ord(vivLoteMuda));
end;

function TfrmLoteMuda.fpuExcluirDetail(ipIds: TArray<Integer>): Boolean;
begin
  Result := inherited;
  if Result then
    begin
      dmPrincipal.FuncoesViveiro.ppuAtualizarTaxaClassificacaoMuda(dmViveiro.cdsLote_MudaID.AsInteger);
      pprEfetuarPesquisa;
    end;

end;

end.
