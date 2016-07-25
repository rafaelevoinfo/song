unit fDoacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrud, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, System.Actions, Vcl.ActnList,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxGroupBox, cxRadioGroup, Vcl.StdCtrls,
  cxDropDownEdit, cxImageComboBox, cxTextEdit, cxMaskEdit, cxCalendar,
  Vcl.ExtCtrls, cxPC, System.TypInfo, uTypes, uControleAcesso, dmuFinanceiro,
  dmuLookup, uClientDataSet, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxMemo, cxDBEdit, cxCurrencyEdit, System.DateUtils, System.Types,
  System.Math, uExceptions;

type
  TfrmDoacao = class(TfrmBasicoCrud)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_PESSOA_DOADORA: TcxGridDBColumn;
    viewRegistrosNOME_DOADOR: TcxGridDBColumn;
    viewRegistrosID_PESSOA_RECEBEU: TcxGridDBColumn;
    viewRegistrosNOME_FUNCIONARIO: TcxGridDBColumn;
    viewRegistrosID_FUNDO: TcxGridDBColumn;
    viewRegistrosFUNDO_DESTINO: TcxGridDBColumn;
    viewRegistrosVALOR: TcxGridDBColumn;
    viewRegistrosDATA: TcxGridDBColumn;
    cbPessoaRecebeu: TcxDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    cbPessoaDoadora: TcxDBLookupComboBox;
    btnPesquisarProjeto: TButton;
    Ac_Pesquisar_Doador: TAction;
    lb1: TLabel;
    cbFundo: TcxDBLookupComboBox;
    EditValor: TcxDBCurrencyEdit;
    Label5: TLabel;
    EditDataDoacao: TcxDBDateEdit;
    Label6: TLabel;
    Label7: TLabel;
    EditObservacao: TcxDBMemo;
    dslkDoador: TDataSource;
    Label8: TLabel;
    cbFormaPagamento: TcxDBImageComboBox;
    viewRegistrosFORMA_PAGTO: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure Ac_Pesquisar_DoadorExecute(Sender: TObject);
    procedure cbPessoaDoadoraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    dmLookup: TdmLookup;
    dmFinanceiro: TdmFinanceiro;
    procedure ppvPesquisarDaoador;
    procedure ppvInformarDoador(ipIdPessoa: integer; ipNome: String);

  protected
    function fprGetPermissao: String; override;
    procedure pprValidarDados;override;
  public
    procedure ppuIncluir; override;
    procedure ppuAlterar(ipId: integer); override;
  end;

var
  frmDoacao: TfrmDoacao;

implementation

uses
  fPessoa;

{$R *.dfm}


procedure TfrmDoacao.ppvPesquisarDaoador;
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
        ppvInformarDoador(vaFrmPessoa.IdEscolhido,vaFrmPessoa.dsMaster.DataSet.FieldByName('NOME').AsString);
      end;
  finally
    vaFrmPessoa.Free;
  end;

end;

procedure TfrmDoacao.ppvInformarDoador(ipIdPessoa: integer; ipNome: String);
begin
  if not (dmFinanceiro.cdsDoacao.State in [dsEdit, dsInsert]) then
    dmFinanceiro.cdsDoacao.Edit;

  if dmLookup.cdslkDoador.Locate(dmLookup.cdslkDoadorID_PESSOA_DOADORA.FieldName, ipIdPessoa, []) then
    begin
      dmFinanceiro.cdsDoacaoID_PESSOA_DOADORA.AsInteger;
    end
  else
    begin
      dmLookup.cdslkDoador.Append;
      dmLookup.cdslkDoadorID_PESSOA_DOADORA.AsInteger := ipIdPessoa;
      dmLookup.cdslkDoadorNOME.AsString := ipNome;
      dmLookup.cdslkDoador.Post;

      dmFinanceiro.cdsDoacaoID_PESSOA_DOADORA.AsInteger := ipIdPessoa;
    end;
end;

procedure TfrmDoacao.Ac_Pesquisar_DoadorExecute(Sender: TObject);
begin
  ppvPesquisarDaoador;
end;

procedure TfrmDoacao.pprValidarDados;
begin
  inherited;
  if CompareValue(dmFinanceiro.cdsDoacaoVALOR.AsFloat, 0) = EqualsValue then
    raise TControlException.Create('Informe um valor superior a zero.',EditValor);
end;

procedure TfrmDoacao.ppuAlterar(ipId: integer);
begin
  inherited;
  ppvInformarDoador(dmFinanceiro.cdsDoacaoID_PESSOA_DOADORA.AsInteger,dmFinanceiro.cdsDoacaoNOME_DOADOR.AsString);

end;

procedure TfrmDoacao.ppuIncluir;
begin
  inherited;
  dmFinanceiro.cdsDoacaoID_PESSOA_RECEBEU.AsInteger := TInfoLogin.fpuGetInstance.Usuario.Id;
  dmFinanceiro.cdsDoacaoDATA.AsDateTime := now;
end;

procedure TfrmDoacao.cbPessoaDoadoraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvPesquisarDaoador;
end;

procedure TfrmDoacao.FormCreate(Sender: TObject);
begin
  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  dmFinanceiro := TdmFinanceiro.Create(Self);
  dmFinanceiro.Name := '';
  inherited;

  EditDataInicialPesquisa.Date := IncDay(now, -7);
  EditDataFinalPesquisa.Date := now;

  PesquisaPadrao := Ord(tppData);

  dmLookup.cdslkFundo.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);
  dmLookup.cdslkDoador.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);
  dmLookup.ppuCarregarPessoas(0, [trpFuncionario, trpEstagiario, trpVoluntario, trpMembroDiretoria]);
end;

function TfrmDoacao.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoFinanceiro), Ord(finDoacao));
end;

end.
