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
  cxMemo, cxRichEdit, cxDBRichEdit, fPessoa;

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
    Label6: TLabel;
    Label7: TLabel;
    cbEspecie: TcxDBLookupComboBox;
    EditData: TcxDBDateEdit;
    Label5: TLabel;
    EditQtdeMudas: TcxDBSpinEdit;
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
    procedure FormCreate(Sender: TObject);
    procedure cbPessoaClassificouKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ac_Pesquisar_Pessoa_ClassificouExecute(Sender: TObject);
  private
    dmViveiro: TdmViveiro;
    dmLookup: TdmLookup;
    procedure ppvCarregarPessoas(ipIdEspecifico: Integer);
    procedure ppvPesquisarPessoa(ipEditResultado: TcxDBLookupComboBox);
  protected
    function fprGetPermissao: String; override;
    procedure pprExecutarSalvar;override;
    procedure pprAfterSalvarDetail; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
  public
    { Public declarations }
  end;

var
  frmLoteMuda: TfrmLoteMuda;

implementation

{$R *.dfm}


procedure TfrmLoteMuda.Ac_Pesquisar_Pessoa_ClassificouExecute(Sender: TObject);
begin
  inherited;
  ppvPesquisarPessoa(cbPessoaClassificou);
end;

procedure TfrmLoteMuda.cbPessoaClassificouKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvPesquisarPessoa(cbPessoaClassificou);
end;

procedure TfrmLoteMuda.ppvPesquisarPessoa(ipEditResultado: TcxDBLookupComboBox);
var
  vaFrmPessoa: TfrmPessoa;
begin
  inherited;
  vaFrmPessoa := TfrmPessoa.Create(nil);
  try
    vaFrmPessoa.ppuConfigurarModoExecucao(mePesquisa);

    vaFrmPessoa.ShowModal;
    if vaFrmPessoa.IdEscolhido <> 0 then
      begin
        if dmLookup.cdslkPessoa.Locate(TBancoDados.coID, vaFrmPessoa.IdEscolhido, []) then
          begin
            ipEditResultado.EditValue := vaFrmPessoa.IdEscolhido;
            ipEditResultado.PostEditValue;
          end
        else
          begin
            ppvCarregarPessoas(vaFrmPessoa.IdEscolhido);
            if dmLookup.cdslkPessoa.Locate(TBancoDados.coID, vaFrmPessoa.IdEscolhido, []) then
              begin
                ipEditResultado.EditValue := vaFrmPessoa.IdEscolhido;
                ipEditResultado.PostEditValue;
              end;
          end;

      end;
  finally
    vaFrmPessoa.Free;
  end;
end;

procedure TfrmLoteMuda.FormCreate(Sender: TObject);
begin
  dmViveiro := TdmViveiro.Create(Self);
  dmViveiro.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';
  inherited;

  PesquisaPadrao := tppData;

  ppvCarregarPessoas(0);
  dmLookup.cdslkEspecie.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);
  EditDataInicialPesquisa.Date := IncDay(Now, -7);
  EditDataFinalPesquisa.Date := Now;

end;

procedure TfrmLoteMuda.pprAfterSalvarDetail;
begin
  inherited;
  //todo; chamar funcao que vai atualizar a quantidade atual de mudas no lote
end;

procedure TfrmLoteMuda.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if not VarIsNull(cbEspeciePesquisa.EditValue) then
    ipCds.ppuAddParametro(TParametros.coEspecie, cbEspeciePesquisa.EditValue);
end;

procedure TfrmLoteMuda.pprExecutarSalvar;
var
  vaEditando:Boolean;
begin
  vaEditando := dmViveiro.cdsLote_Semente.State = dsEdit;
  inherited;
  if vaEditando then;
    //todo; fazer funcao que vai atualizar a quantidade
end;

procedure TfrmLoteMuda.ppvCarregarPessoas(ipIdEspecifico: Integer);
begin
  dmLookup.cdslkPessoa.ppuLimparParametros;
  if ipIdEspecifico <> 0 then
    dmLookup.cdslkPessoa.ppuAddParametro(TParametros.coID, ipIdEspecifico, TOperadores.coOR);

  // recusado, cancelado, executado
  dmLookup.cdslkPessoa.ppuDataRequest([TParametros.coTipo], [Ord(trpFuncionario).ToString + ',' + Ord(trpEstagiario).ToString + ',' +
    Ord(trpVoluntario).ToString + ',' + Ord(trpMembroDiretoria).ToString]);
end;

function TfrmLoteMuda.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro), Ord(vivLoteMuda));
end;

end.
