unit fConta_Pagar;

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
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuFinanceiro, uControleAcesso,
  System.TypInfo, uTypes, dmuLookup, cxMemo, cxDBEdit, dmuPrincipal,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCalc, cxCurrencyEdit,
  cxSpinEdit, dxCheckGroupBox, Datasnap.DBClient, uClientDataSet, uUtils,
  System.Math, System.DateUtils;

type
  TfrmContaPagar = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_FORNECEDOR: TcxGridDBColumn;
    viewRegistrosID_RUBRICA: TcxGridDBColumn;
    viewRegistrosID_PLANO_CONTAS: TcxGridDBColumn;
    viewRegistrosID_CONTA_CORRENTE: TcxGridDBColumn;
    viewRegistrosDESCRICAO: TcxGridDBColumn;
    viewRegistrosVALOR_TOTAL: TcxGridDBColumn;
    viewRegistrosFORMA_PAGTO: TcxGridDBColumn;
    viewRegistrosFORNECEDOR: TcxGridDBColumn;
    viewRegistrosRUBRICA: TcxGridDBColumn;
    viewRegistrosPLANO_CONTAS: TcxGridDBColumn;
    viewRegistrosCONTA_CORRENTE: TcxGridDBColumn;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailVENCIMENTO: TcxGridDBColumn;
    viewRegistrosDetailVALOR: TcxGridDBColumn;
    viewRegistrosDetailPARCELA: TcxGridDBColumn;
    Label3: TLabel;
    EditDescricao: TcxDBTextEdit;
    Label7: TLabel;
    EditObservacao: TcxDBMemo;
    Label17: TLabel;
    cbContaCorrente: TcxDBLookupComboBox;
    Label4: TLabel;
    cbFornecedor: TcxDBLookupComboBox;
    cbRubrica: TcxDBLookupComboBox;
    lbl1: TLabel;
    cbPlanoContas: TcxDBLookupComboBox;
    Label5: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    cbFormaPagamento: TcxDBImageComboBox;
    EditValorTotal: TcxDBCurrencyEdit;
    rgParcelas: TcxGroupBox;
    Label9: TLabel;
    EditQtdeParcelas: TcxSpinEdit;
    cxGrid1: TcxGrid;
    viewParcelas: TcxGridDBTableView;
    viewParcelasID: TcxGridDBColumn;
    viewParcelasID_CONTA_PAGAR: TcxGridDBColumn;
    viewParcelasVENCIMENTO: TcxGridDBColumn;
    viewParcelasVALOR: TcxGridDBColumn;
    viewParcelasPARCELA: TcxGridDBColumn;
    levelGrid1Level1: TcxGridLevel;
    Label11: TLabel;
    btnIncluirParcelas: TButton;
    Ac_Gerar_Parcelas: TAction;
    rgVinculos: TcxGroupBox;
    Label10: TLabel;
    Label12: TLabel;
    cxGrid2: TcxGrid;
    viewVinculos: TcxGridDBTableView;
    level1: TcxGridLevel;
    cdsLocalVinculo: TClientDataSet;
    cdsLocalVinculoID: TIntegerField;
    cdsLocalVinculoTIPO: TIntegerField;
    cdsLocalVinculoNOME: TStringField;
    btnAddProjeto: TButton;
    btnAddAtividade: TButton;
    Ac_Incluir_Vinculo_Projeto: TAction;
    Ac_Incluir_Vinculo_Atividade: TAction;
    dsVinculos: TDataSource;
    viewVinculosID: TcxGridDBColumn;
    viewVinculosTIPO: TcxGridDBColumn;
    viewVinculosNOME: TcxGridDBColumn;
    ColumnDeletarVinculo: TcxGridDBColumn;
    Ac_Excluir_Vinculo: TAction;
    EditVencimentoParcela: TcxDateEdit;
    cbProjeto: TcxLookupComboBox;
    cbAtividade: TcxLookupComboBox;
    cbPesquisaFornecedor: TcxLookupComboBox;
    cbPesquisaRubrica: TcxLookupComboBox;
    cbPesquisaPlanoConta: TcxLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cbProjetoPropertiesEditValueChanged(Sender: TObject);
    procedure Ac_Incluir_Vinculo_ProjetoExecute(Sender: TObject);
    procedure Ac_Incluir_Vinculo_AtividadeExecute(Sender: TObject);
    procedure Ac_Gerar_ParcelasExecute(Sender: TObject);
    procedure Ac_Excluir_VinculoExecute(Sender: TObject);
  private
    dmFinanceiro: TdmFinanceiro;
    dmLookup: TdmLookup;
    procedure ppvAddVinculo(ipId, ipTipo: Integer; ipNome: string);
    procedure ppvAdicionarParcela(ipParcela: Integer; ipVencimento: TDate;
      ipValor: Double);
  protected
    function fprGetPermissao: string; override;
    procedure pprBeforeSalvar; override;
    procedure pprExecutarSalvar; override;
    procedure pprBeforeAlterar; override;
    procedure pprValidarDados; override;
    procedure pprEfetuarPesquisa; override;
    function fprHabilitarSalvar(): Boolean; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    function fprConfigurarControlesPesquisa: TWinControl; override;
  public
    procedure ppuIncluir; override;
  public const
    coProjeto = 1;
    coAtividade = 2;

    coPesquisaDescricao = 5;
    coPesquisaFornecedor = 6;
    coPesquisaRubrica = 7;
    coPesquisaPlanoConta = 8;


  end;

var
  frmContaPagar: TfrmContaPagar;

implementation

{$R *.dfm}

{ TfrmContaPagar }

procedure TfrmContaPagar.pprBeforeAlterar;
begin
  inherited;
  if cdsLocalVinculo.Active then
    cdsLocalVinculo.EmptyDataSet;

  TUtils.ppuPercorrerCds(dmFinanceiro.cdsConta_Pagar_Projeto,
    procedure
    begin
      ppvAddVinculo(dmFinanceiro.cdsConta_Pagar_ProjetoID_PROJETO.AsInteger, coProjeto, dmFinanceiro.cdsConta_Pagar_ProjetoPROJETO.AsString);
    end);

  TUtils.ppuPercorrerCds(dmFinanceiro.cdsConta_Pagar_Atividade,
    procedure
    begin
      ppvAddVinculo(dmFinanceiro.cdsConta_Pagar_AtividadeID_ATIVIDADE.AsInteger, coAtividade,
        dmFinanceiro.cdsConta_Pagar_AtividadeATIVIDADE.AsString);
    end);
end;

procedure TfrmContaPagar.pprBeforeSalvar;
begin
  inherited;
  dmFinanceiro.cdsConta_Pagar_Projeto.DisableControls;
  dmFinanceiro.cdsConta_Pagar_Atividade.DisableControls;
  try
    // vamos remover os registros nao existem mais
    dmFinanceiro.cdsConta_Pagar_Projeto.First;
    while not dmFinanceiro.cdsConta_Pagar_Projeto.Eof do
      begin
        if cdsLocalVinculo.Active and cdsLocalVinculo.Locate('ID;TIPO',
          VarArrayOf([dmFinanceiro.cdsConta_Pagar_ProjetoID_PROJETO.AsInteger, coProjeto]), []) then
          dmFinanceiro.cdsConta_Pagar_Projeto.Next
        else
          dmFinanceiro.cdsConta_Pagar_Projeto.Delete;
      end;

    // vamos remover os registros nao existem mais
    dmFinanceiro.cdsConta_Pagar_Atividade.First;
    while not dmFinanceiro.cdsConta_Pagar_Atividade.Eof do
      begin
        if cdsLocalVinculo.Active and cdsLocalVinculo.Locate('ID;TIPO', VarArrayOf([dmFinanceiro.cdsConta_Pagar_AtividadeID_ATIVIDADE.AsInteger,
          coAtividade]), [])
        then
          dmFinanceiro.cdsConta_Pagar_Atividade.Next
        else
          dmFinanceiro.cdsConta_Pagar_Atividade.Delete;
      end;

    TUtils.ppuPercorrerCds(cdsLocalVinculo,
      procedure
      begin
        if cdsLocalVinculoTIPO.AsInteger = coProjeto then
          begin
            if not dmFinanceiro.cdsConta_Pagar_Projeto.Locate(dmFinanceiro.cdsConta_Pagar_ProjetoID_PROJETO.FieldName, cdsLocalVinculoID.AsInteger, [])
            then
              begin
                dmFinanceiro.cdsConta_Pagar_Projeto.Append;
                dmFinanceiro.cdsConta_Pagar_ProjetoID.AsInteger := dmPrincipal.FuncoesGeral.fpuGetId('CONTA_PAGAR_PROJETO');
                dmFinanceiro.cdsConta_Pagar_ProjetoID_CONTA_PAGAR.AsInteger := dmFinanceiro.cdsConta_PagarID.AsInteger;
                dmFinanceiro.cdsConta_Pagar_ProjetoID_PROJETO.AsInteger := cdsLocalVinculoID.AsInteger;
                dmFinanceiro.cdsConta_Pagar_Projeto.Post;
              end;
          end
        else
          begin
            if not dmFinanceiro.cdsConta_Pagar_Atividade.Locate(dmFinanceiro.cdsConta_Pagar_AtividadeID_ATIVIDADE.FieldName,
              cdsLocalVinculoID.AsInteger, [])
            then
              begin
                dmFinanceiro.cdsConta_Pagar_Atividade.Append;
                dmFinanceiro.cdsConta_Pagar_AtividadeID.AsInteger := dmPrincipal.FuncoesGeral.fpuGetId('CONTA_PAGAR_ATIVIDADE');
                dmFinanceiro.cdsConta_Pagar_AtividadeID_CONTA_PAGAR.AsInteger := dmFinanceiro.cdsConta_PagarID.AsInteger;
                dmFinanceiro.cdsConta_Pagar_AtividadeID_ATIVIDADE.AsInteger := cdsLocalVinculoID.AsInteger;
                dmFinanceiro.cdsConta_Pagar_Atividade.Post;
              end;
          end;
      end);
  finally
    dmFinanceiro.cdsConta_Pagar_Projeto.EnableControls;
    dmFinanceiro.cdsConta_Pagar_Atividade.EnableControls;
  end;
end;

procedure TfrmContaPagar.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.EditValue = coPesquisaDescricao then
    ipCds.ppuAddParametro(TParametros.coDescricao, EditPesquisa.Text)
  else if cbPesquisarPor.EditValue = coPesquisaFornecedor then
    ipCds.ppuAddParametro(TParametros.coFornecedor, cbPesquisaFornecedor.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaRubrica then
    ipCds.ppuAddParametro(TParametros.coRubrica, cbPesquisaRubrica.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaPlanoConta then
    ipCds.ppuAddParametro(TParametros.coPlanoConta, cbPesquisaPlanoConta.EditValue)


end;

procedure TfrmContaPagar.pprEfetuarPesquisa;
begin
  dmFinanceiro.cdsConta_Pagar_Projeto.Close;
  dmFinanceiro.cdsConta_Pagar_Atividade.Close;
  inherited;
  dmFinanceiro.cdsConta_Pagar_Projeto.Open;
  dmFinanceiro.cdsConta_Pagar_Atividade.Open;
end;

procedure TfrmContaPagar.pprExecutarSalvar;
begin
  inherited;
  if dmFinanceiro.cdsConta_Pagar.ChangeCount > 0 then
    dmFinanceiro.cdsConta_Pagar.ApplyUpdates(0);

  if dmFinanceiro.cdsConta_Pagar_Parcela.ChangeCount > 0 then
    dmFinanceiro.cdsConta_Pagar_Parcela.ApplyUpdates(0);

  if dmFinanceiro.cdsConta_Pagar_Projeto.ChangeCount > 0 then
    dmFinanceiro.cdsConta_Pagar_Projeto.ApplyUpdates(0);

  if dmFinanceiro.cdsConta_Pagar_Atividade.ChangeCount > 0 then
    dmFinanceiro.cdsConta_Pagar_Atividade.ApplyUpdates(0);
end;

procedure TfrmContaPagar.pprValidarDados;
var
  vaValorParcelado: Double;
begin
  inherited;
  vaValorParcelado := 0;
  TUtils.ppuPercorrerCds(dmFinanceiro.cdsConta_Pagar_Parcela,
    procedure
    begin
      vaValorParcelado := vaValorParcelado + dmFinanceiro.cdsConta_Pagar_ParcelaVALOR.AsFloat;
    end);

  if dmFinanceiro.cdsConta_Pagar_Parcela.RecordCount <> 0 then
    begin
      if not SameValue(vaValorParcelado, dmFinanceiro.cdsConta_PagarVALOR_TOTAL.AsFloat) then
        raise Exception.Create('O valor total está diferente do valor parcelado.');
    end
  else
    raise Exception.Create('É necessário gerar pelo menos uma parcela.');
end;

procedure TfrmContaPagar.ppuIncluir;
begin
  inherited;
  dmFinanceiro.cdsConta_PagarID.AsInteger := dmPrincipal.FuncoesGeral.fpuGetId('CONTA_PAGAR');
end;

procedure TfrmContaPagar.ppvAddVinculo(ipId, ipTipo: Integer; ipNome: string);
begin
  if not cdsLocalVinculo.Active then
    cdsLocalVinculo.CreateDataSet;

  cdsLocalVinculo.Append;
  cdsLocalVinculoID.AsInteger := ipId;
  cdsLocalVinculoTIPO.AsInteger := ipTipo;
  cdsLocalVinculoNOME.AsString := ipNome;
  cdsLocalVinculo.Post;
end;

procedure TfrmContaPagar.Ac_Excluir_VinculoExecute(Sender: TObject);
begin
  inherited;
  cdsLocalVinculo.Delete;
end;

procedure TfrmContaPagar.Ac_Gerar_ParcelasExecute(Sender: TObject);
var
  vaValorParcela: Double;
  vaValorParcelado: Double;
  I: Integer;
begin
  inherited;
  if dmFinanceiro.cdsConta_PagarVALOR_TOTAL.IsNull then
    raise Exception.Create('Informe o valor total para que seja possível gerar as parcelas.');

  if VarIsNull(EditQtdeParcelas.Value) then
    raise Exception.Create('Informe o valor total para que seja possível gerar as parcelas.');

  if VarIsNull(EditVencimentoParcela.EditValue) then
    raise Exception.Create('Informe o vencimento da primeira parcela.');

  dmFinanceiro.cdsConta_Pagar_Parcela.DisableControls;
  try
    dmFinanceiro.cdsConta_Pagar_Parcela.First;
    while not dmFinanceiro.cdsConta_Pagar_Parcela.Eof do
      dmFinanceiro.cdsConta_Pagar_Parcela.Delete;

    vaValorParcela := dmFinanceiro.cdsConta_PagarVALOR_TOTAL.AsFloat / EditQtdeParcelas.Value;
    vaValorParcelado := 0;
    for I := 1 to EditQtdeParcelas.Value do
      begin
        vaValorParcela := RoundTo(vaValorParcela, -2); // arredonda para 2 casas

        if I = EditQtdeParcelas.Value then
          vaValorParcela := dmFinanceiro.cdsConta_PagarVALOR_TOTAL.AsFloat - vaValorParcelado
        else
          vaValorParcelado := vaValorParcelado + vaValorParcela;

        ppvAdicionarParcela(I, IncMonth(EditVencimentoParcela.Date, I - 1), vaValorParcela);
      end;
  finally
    dmFinanceiro.cdsConta_Pagar_Parcela.EnableControls;
  end;

end;

procedure TfrmContaPagar.ppvAdicionarParcela(ipParcela: Integer; ipVencimento: TDate; ipValor: Double);
begin
  dmFinanceiro.cdsConta_Pagar_Parcela.Append;
  dmFinanceiro.cdsConta_Pagar_ParcelaID.AsInteger := dmPrincipal.FuncoesGeral.fpuGetId('CONTA_PAGAR_PARCELA');
  dmFinanceiro.cdsConta_Pagar_ParcelaVENCIMENTO.AsDateTime := ipVencimento;
  dmFinanceiro.cdsConta_Pagar_ParcelaPARCELA.AsInteger := ipParcela;
  dmFinanceiro.cdsConta_Pagar_ParcelaVALOR.AsFloat := ipValor;
  dmFinanceiro.cdsConta_Pagar_Parcela.Post;
end;

procedure TfrmContaPagar.Ac_Incluir_Vinculo_AtividadeExecute(Sender: TObject);
begin
  inherited;
  if not VarIsNull(cbAtividade.EditValue) then
    begin
      if dmLookup.cdslkAtividade.Locate(TBancoDados.coId, cbAtividade.EditValue, []) then
        begin
          ppvAddVinculo(cbAtividade.EditValue, coAtividade, cbAtividade.Text);
        end;
    end;
end;

procedure TfrmContaPagar.Ac_Incluir_Vinculo_ProjetoExecute(Sender: TObject);
begin
  inherited;
  if not VarIsNull(cbProjeto.EditValue) then
    begin

      if dmLookup.cdslkProjeto.Locate(TBancoDados.coId, cbProjeto.EditValue, []) then
        begin
          ppvAddVinculo(cbProjeto.EditValue, coProjeto, cbProjeto.Text);
        end;
    end;
end;

procedure TfrmContaPagar.cbProjetoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if not VarIsNull(cbProjeto.EditValue) then
    begin
      dmLookup.cdslkAtividade.ppuLimparParametros;
      dmLookup.cdslkAtividade.ppuAddParametro(TParametros.coProjeto, cbProjeto.EditValue);
      dmLookup.cdslkAtividade.ppuAddParametro(TParametros.coStatusDiferente, Ord(saCancelada).ToString + ';' + Ord(saFinalizada).ToString,
        TOperadores.coOR);
      dmLookup.cdslkAtividade.ppuDataRequest();
    end
  else
    dmLookup.cdslkAtividade.Close;
end;

procedure TfrmContaPagar.FormCreate(Sender: TObject);
begin
  dmFinanceiro := TdmFinanceiro.Create(Self);
  dmFinanceiro.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';
  inherited;

  PesquisaPadrao := tppData;


  EditDataInicialPesquisa.Date := Now;
  EditDataFinalPesquisa.Date := IncDay(Now, 7);

  dmLookup.cdslkFornecedor.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, true);
  dmLookup.cdslkRubrica.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, true);
  dmLookup.cdslkPlano_Contas.ppuDataRequest([TParametros.coTipo], [Ord(tpcDespesa)], TOperadores.coAnd, true);
  dmLookup.cdslkConta_Corrente.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, true);

  dmLookup.cdslkProjeto.ppuDataRequest([TParametros.coStatusDiferente],
    [Ord(spRecusado).ToString + ';' + Ord(spExecutado).ToString + ';' + Ord(spCancelado).ToString]);
end;

function TfrmContaPagar.fprConfigurarControlesPesquisa: TWinControl;
begin
  Result := inherited;
  cbPesquisaFornecedor.Visible := cbPesquisarPor.EditValue = coPesquisaFornecedor;
  cbPesquisaRubrica.Visible := cbPesquisarPor.EditValue = coPesquisaRubrica;
  cbPesquisaPlanoConta.Visible := cbPesquisarPor.EditValue = coPesquisaPlanoConta;
  EditPesquisa.Visible := EditPesquisa.Visible and (not (cbPesquisaFornecedor.Visible or cbPesquisaRubrica.Visible or cbPesquisaPlanoConta.Visible));

  if cbPesquisaFornecedor.Visible then
    Result := cbPesquisaFornecedor
  else if cbPesquisaRubrica.Visible then
    Result := cbPesquisaRubrica
  else if cbPesquisaPlanoConta.Visible then
    Result := cbPesquisaPlanoConta;
end;

function TfrmContaPagar.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoFinanceiro), Ord(finContaPagar));
end;

function TfrmContaPagar.fprHabilitarSalvar: Boolean;
begin
  Result := inherited or fprHabilitarSalvarDetail or (cdsLocalVinculo.Active and (cdsLocalVinculo.ChangeCount > 0));
end;

end.
