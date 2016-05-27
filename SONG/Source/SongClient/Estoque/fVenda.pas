unit fVenda;

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
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuEstoque, dmuLookup, cxMemo,
  cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCalc,
  cxCurrencyEdit, uTypes, System.DateUtils, uClientDataSet, uControleAcesso,
  System.TypInfo, uExceptions, dmuPrincipal, uMensagem, fSaida;

type
  TfrmVenda = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_CLIENTE: TcxGridDBColumn;
    viewRegistrosID_PESSOA_VENDEU: TcxGridDBColumn;
    viewRegistrosDATA: TcxGridDBColumn;
    viewRegistrosDESCRICAO: TcxGridDBColumn;
    viewRegistrosCLIENTE: TcxGridDBColumn;
    viewRegistrosVENDEDOR: TcxGridDBColumn;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_VENDA: TcxGridDBColumn;
    viewRegistrosDetailID_ITEM: TcxGridDBColumn;
    viewRegistrosDetailID_ESPECIE: TcxGridDBColumn;
    viewRegistrosDetailQTDE: TcxGridDBColumn;
    viewRegistrosDetailVALOR_UNITARIO: TcxGridDBColumn;
    viewRegistrosDetailITEM: TcxGridDBColumn;
    viewRegistrosDetailESPECIE: TcxGridDBColumn;
    viewRegistrosVALOR_TOTAL: TcxGridDBColumn;
    lbl5: TLabel;
    cbCliente: TcxDBLookupComboBox;
    lbl1: TLabel;
    cbVendedor: TcxDBLookupComboBox;
    lbl2: TLabel;
    EditDataVenda: TcxDBDateEdit;
    lbl4: TLabel;
    EditDescricao: TcxDBMemo;
    Label4: TLabel;
    cbItem: TcxDBLookupComboBox;
    lbl6: TLabel;
    EditValorUnitario: TcxDBCurrencyEdit;
    EditQtde: TcxDBCalcEdit;
    Label7: TLabel;
    lbUnidade: TLabel;
    cbPesquisaCliente: TcxLookupComboBox;
    cbItemPesquisa: TcxLookupComboBox;
    cbPesquisaPessoa: TcxLookupComboBox;
    pnEspecieLotes: TPanel;
    pnLoteSemente: TPanel;
    lb1: TLabel;
    cbLoteSemente: TcxDBLookupComboBox;
    pnLoteMuda: TPanel;
    Label3: TLabel;
    cbLoteMuda: TcxDBLookupComboBox;
    pnEspecie: TPanel;
    lb2: TLabel;
    cbEspecie: TcxDBLookupComboBox;
    btnGerarContaReceber: TButton;
    btnGerarSaida: TButton;
    Ac_Gerar_Conta_Receber: TAction;
    Ac_Gerar_Saida: TAction;
    procedure cbItemPropertiesEditValueChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    dmEstoque: TdmEstoque;
    dmLookup: TdmLookup;
    procedure ppvConfigurarEdits;
    procedure ppvCarregarLotes;
    procedure ppvExcluirItemSaida(ipIds: TArray<Integer>);

  protected
    function fprConfigurarControlesPesquisa: TWinControl; override;
    function fprGetPermissao: string; override;
    procedure pprBeforeSalvarDetail; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    procedure pprValidarPesquisa; override;

    procedure pprBeforeExcluirDetail(ipId: Integer); override;
    procedure pprBeforeExcluir(ipId: Integer; ipAcao: TAcaoTela); override;

  public
    procedure ppuIncluirDetail; override;
    procedure ppuAlterarDetail(ipId: Integer); override;
  public const
    coPesquisaItem = 7;
    coPesquisaVendedor = 5;
    coPesquisaCliente = 6;
  end;

var
  frmVenda: TfrmVenda;

implementation

{$R *.dfm}


function TfrmVenda.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoEstoque), Ord(estVenda));
end;

procedure TfrmVenda.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.EditValue = coPesquisaItem then
    ipCds.ppuAddParametro(TParametros.coItem, cbItemPesquisa.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaVendedor then
    ipCds.ppuAddParametro(TParametros.coVendedor, cbPesquisaPessoa.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaCliente then
    ipCds.ppuAddParametro(TParametros.coFornecedor, cbPesquisaCliente.EditValue);
end;

procedure TfrmVenda.pprValidarPesquisa;
begin
  inherited;
  if cbPesquisaPessoa.Visible and (VarIsNull(cbPesquisaPessoa.EditValue)) then
    begin
      if cbPesquisarPor.EditValue = coPesquisaVendedor then
        raise TControlException.Create('Informe o vendedor.', cbPesquisaPessoa);
    end;

  if cbItemPesquisa.Visible and (VarIsNull(cbItemPesquisa.EditValue)) then
    raise Exception.Create('Informe o item a ser pesquisado.');

  if cbPesquisaCliente.Visible and (VarIsNull(cbPesquisaCliente.EditValue)) then
    raise Exception.Create('Informe o cliente a ser pesquisado.');
end;

procedure TfrmVenda.pprBeforeExcluir(ipId: Integer; ipAcao: TAcaoTela);
begin
end;

procedure TfrmVenda.pprBeforeExcluirDetail(ipId: Integer);
var
  vaIdExcluir: Integer;
begin
  inherited;
  vaIdExcluir := dmPrincipal.FuncoesEstoque.fpuBuscarItemSaida(ipId);
  if vaIdExcluir <> 0 then
    begin
      if not ModoSilencioso then
        begin
          if TMensagem.fpuPerguntar('Existe um item de uma saída vinculado a esta venda. Deseja excluí-lo também?', ppSimNao) = rpSim then
            ppvExcluirItemSaida([vaIdExcluir]);
        end;
    end;
end;

procedure TfrmVenda.ppvExcluirItemSaida(ipIds: TArray<Integer>);
var
  vaFrmSaida: TfrmSaida;
begin
  vaFrmSaida := TfrmSaida.Create(nil);
  try
    vaFrmSaida.ModoSilencioso := True;
    vaFrmSaida.ppuConfigurarPesquisa(TfrmSaida.coPesquisaVenda, dmEstoque.cdsVendaID.AsString);
    vaFrmSaida.ppuPesquisar;

    vaFrmSaida.fpuExcluirDetail(ipIds);
    //TODO:Chamar alguma funcao aqui para excluir o a saida caso todos os itens tenham sido excluidos
  finally
    vaFrmSaida.Free;
  end;
end;

procedure TfrmVenda.pprBeforeSalvarDetail;
begin
  inherited;
  // vamos garantir que somente itens do tipo smente e muda vao estar vinculados a uma especie
  if dmLookup.cdslkItemTIPO.AsInteger = Ord(tiOutro) then
    dmEstoque.cdsVenda_ItemID_ESPECIE.Clear;
end;

function TfrmVenda.fprConfigurarControlesPesquisa: TWinControl;
begin
  Result := inherited;
  cbPesquisaPessoa.Visible := (cbPesquisarPor.EditValue = coPesquisaVendedor);
  cbItemPesquisa.Visible := cbPesquisarPor.EditValue = coPesquisaItem;
  cbPesquisaCliente.Visible := cbPesquisarPor.EditValue = coPesquisaCliente;

  EditPesquisa.Visible := EditPesquisa.Visible and (not(cbItemPesquisa.Visible or cbPesquisaPessoa.Visible or cbPesquisaCliente.Visible));

  if cbPesquisaPessoa.Visible then
    Result := cbPesquisaPessoa
  else if cbItemPesquisa.Visible then
    Result := cbItemPesquisa
  else if cbPesquisaCliente.Visible then
    Result := cbPesquisaCliente;
end;

procedure TfrmVenda.cbItemPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastroDetail then
    ppvConfigurarEdits;
end;

procedure TfrmVenda.ppvCarregarLotes;
const
  coAberto = 0;
begin
  if (not VarIsNull(cbEspecie.EditValue)) and dmLookup.cdslkEspecie.Locate(TBancoDados.coId, cbEspecie.EditValue, []) then
    begin
      if dmLookup.cdslkItemTIPO.AsInteger = Ord(tiSemente) then
        begin
          if (not dmLookup.cdslkLote_Semente.Active) or (dmLookup.cdslkLote_SementeID_ESPECIE.AsInteger <> cbEspecie.EditValue) then
            begin
              dmLookup.cdslkLote_Semente.ppuDataRequest([TParametros.coEspecie, TParametros.coStatus, TParametros.coPossuiEstoque],
                [cbEspecie.EditValue, coAberto, true], TOperadores.coAnd, true);
            end;
        end
      else if dmLookup.cdslkItemTIPO.AsInteger = Ord(tiMuda) then
        begin
          if (not dmLookup.cdslkLote_Muda.Active) or (dmLookup.cdslkLote_MudaID_ESPECIE.AsInteger <> cbEspecie.EditValue) then
            begin
              dmLookup.cdslkLote_Muda.ppuDataRequest([TParametros.coEspecie, TParametros.coPossuiEstoque],
                [cbEspecie.EditValue, true], TOperadores.coAnd, true);
            end;
        end;
    end
  else
    begin
      dmLookup.cdslkLote_Semente.Close;
      dmLookup.cdslkLote_Muda.Close;
    end;
end;

procedure TfrmVenda.ppuAlterarDetail(ipId: Integer);
begin
  inherited;
  ppvConfigurarEdits;
  ppvCarregarLotes;
end;

procedure TfrmVenda.ppuIncluirDetail;
begin
  inherited;
  ppvConfigurarEdits;
  ppvCarregarLotes;
end;

procedure TfrmVenda.ppvConfigurarEdits;
var
  vaVisivel: Boolean;
begin
  vaVisivel := (not VarIsNull(cbItem.EditValue));
  if vaVisivel then
    begin
      vaVisivel := dmLookup.cdslkItem.Locate(TBancoDados.coId, cbItem.EditValue, []) and
        (dmLookup.cdslkItemTIPO.AsInteger in [Ord(tiSemente), Ord(tiMuda)]);

      pnLoteSemente.Visible := dmLookup.cdslkItemTIPO.AsInteger = Ord(tiSemente);
      pnLoteMuda.Visible := dmLookup.cdslkItemTIPO.AsInteger = Ord(tiMuda);
      pnEspecieLotes.Visible := vaVisivel;

      lbUnidade.Caption := dmLookup.cdslkItemUNIDADE.AsString;
    end;
end;

procedure TfrmVenda.FormCreate(Sender: TObject);
begin
  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  dmEstoque := TdmEstoque.Create(Self);
  dmEstoque.Name := '';
  inherited;

  PesquisaPadrao := Ord(tppData);
  EditDataInicialPesquisa.Date := IncDay(Now, -7);;
  EditDataFinalPesquisa.Date := IncDay(Now, 7);

  dmLookup.ppuCarregarPessoas(0, [trpFuncionario, trpEstagiario, trpVoluntario, trpMembroDiretoria]);
  dmLookup.cdslkItem.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, true);
  dmLookup.cdslkEspecie.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, true);
  dmLookup.cdslkFin_For_Cli.ppuDataRequest([TParametros.coTipo], [Ord(tfCliente)], TOperadores.coAnd, true);

end;

end.
