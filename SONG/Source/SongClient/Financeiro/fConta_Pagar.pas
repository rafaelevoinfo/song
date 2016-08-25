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
  System.Math, System.DateUtils, uMensagem, System.Generics.Collections,
  cxCheckBox, Vcl.ExtDlgs, fFornecedor, fPlano_Contas;

type
  TContaPagar = class(TModelo)
  private
    FIdFornecedor: Integer;
    FValorTotal: Double;
    FIdCompra: Integer;
    FIdResponsavel: Integer;
    procedure SetIdFornecedor(const Value: Integer);
    procedure SetValorTotal(const Value: Double);
    procedure SetIdCompra(const Value: Integer);
    procedure SetIdResponsavel(const Value: Integer);
  public
    property IdCompra: Integer read FIdCompra write SetIdCompra;
    property IdFornecedor: Integer read FIdFornecedor write SetIdFornecedor;
    property ValorTotal: Double read FValorTotal write SetValorTotal;
    property IdResponsavel: Integer read FIdResponsavel write SetIdResponsavel;
  end;

  TfrmContaPagar = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_FORNECEDOR: TcxGridDBColumn;
    viewRegistrosID_PLANO_CONTAS: TcxGridDBColumn;
    viewRegistrosID_CONTA_CORRENTE: TcxGridDBColumn;
    viewRegistrosDESCRICAO: TcxGridDBColumn;
    viewRegistrosVALOR_TOTAL: TcxGridDBColumn;
    viewRegistrosFORMA_PAGTO: TcxGridDBColumn;
    viewRegistrosFORNECEDOR: TcxGridDBColumn;
    viewRegistrosPLANO_CONTAS: TcxGridDBColumn;
    viewRegistrosCONTA_CORRENTE: TcxGridDBColumn;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailVENCIMENTO: TcxGridDBColumn;
    viewRegistrosDetailVALOR: TcxGridDBColumn;
    viewRegistrosDetailPARCELA: TcxGridDBColumn;
    Ac_Gerar_Parcelas: TAction;
    Ac_Incluir_Vinculo: TAction;
    dsVinculos: TDataSource;
    Ac_Excluir_Vinculo: TAction;
    cbPesquisaFornecedor: TcxLookupComboBox;
    cbPesquisaPlanoConta: TcxLookupComboBox;
    btnQuitarReabrir: TButton;
    Ac_Quitar_Reabrir: TAction;
    viewRegistrosDetailSTATUS: TcxGridDBColumn;
    viewRegistrosDetailDATA_PAGAMENTO: TcxGridDBColumn;
    viewRegistrosNUMERO_DOCUMENTO: TcxGridDBColumn;
    pcEditsCadastro: TcxPageControl;
    tabInfoGeral: TcxTabSheet;
    tabVinculo: TcxTabSheet;
    Label3: TLabel;
    EditDescricao: TcxDBTextEdit;
    Label8: TLabel;
    EditValorTotal: TcxDBCurrencyEdit;
    cbFormaPagamento: TcxDBImageComboBox;
    Label6: TLabel;
    cbFornecedor: TcxDBLookupComboBox;
    Label4: TLabel;
    Label17: TLabel;
    cbContaCorrente: TcxDBLookupComboBox;
    cbPlanoContas: TcxDBLookupComboBox;
    Label5: TLabel;
    Label13: TLabel;
    EditNroDocumento: TcxDBTextEdit;
    rgParcelas: TcxGroupBox;
    cxGrid1: TcxGrid;
    viewParcelas: TcxGridDBTableView;
    viewParcelasID: TcxGridDBColumn;
    viewParcelasID_CONTA_PAGAR: TcxGridDBColumn;
    viewParcelasPARCELA: TcxGridDBColumn;
    viewParcelasVENCIMENTO: TcxGridDBColumn;
    viewParcelasVALOR: TcxGridDBColumn;
    levelGrid1Level1: TcxGridLevel;
    pnParcelas: TPanel;
    Label9: TLabel;
    Label11: TLabel;
    EditQtdeParcelas: TcxSpinEdit;
    EditVencimentoParcela: TcxDateEdit;
    btnIncluirParcelas: TButton;
    Label7: TLabel;
    EditObservacao: TcxDBMemo;
    pnVinculoTop: TPanel;
    rgTipoOrigemRecurso: TcxRadioGroup;
    pcOrigemRecurso: TcxPageControl;
    tabProjeto: TcxTabSheet;
    Label10: TLabel;
    cbProjetoOrigem: TcxLookupComboBox;
    tabFundo: TcxTabSheet;
    Label15: TLabel;
    cbFundoOrigem: TcxLookupComboBox;
    rgRecursoAlocado: TcxRadioGroup;
    gbOrigem: TcxGroupBox;
    pcRecursoAlocado: TcxPageControl;
    tabRecursoNaoAlocado: TcxTabSheet;
    Label14: TLabel;
    Label12: TLabel;
    lbl3: TLabel;
    cbRubricaAtividadeOrigem: TcxLookupComboBox;
    cbAtividadeOrigem: TcxLookupComboBox;
    cbAreaAtuacaoOrigem: TcxLookupComboBox;
    tabRecursoAlocado: TcxTabSheet;
    lb1: TLabel;
    cbRubricaProjetoOrigem: TcxLookupComboBox;
    gbAlocado: TcxGroupBox;
    pnValor: TPanel;
    btnAdicionarVinculo: TButton;
    cxGrid2: TcxGrid;
    viewVinculos: TcxGridDBTableView;
    ColumnDeletarVinculo: TcxGridDBColumn;
    level1: TcxGridLevel;
    dsAtividadeAlocada: TDataSource;
    dsRubricaAlocada: TDataSource;
    dsAreaAlocada: TDataSource;
    viewVinculosID: TcxGridDBColumn;
    viewVinculosNOME_FUNDO: TcxGridDBColumn;
    viewVinculosPROJETO_ORIGEM: TcxGridDBColumn;
    viewVinculosATIVIDADE_ORIGEM: TcxGridDBColumn;
    viewVinculosRUBRICA_ORIGEM: TcxGridDBColumn;
    viewVinculosAREA_ATUACAO_ORIGEM: TcxGridDBColumn;
    viewVinculosPROJETO_ALOCADO: TcxGridDBColumn;
    viewVinculosATIVIDADE_ALOCADA: TcxGridDBColumn;
    viewVinculosRUBRICA_ALOCADA: TcxGridDBColumn;
    viewVinculosAREA_ATUACAO_ALOCADA: TcxGridDBColumn;
    viewVinculosVALOR: TcxGridDBColumn;
    viewVinculosID_CONTA_PAGAR: TcxGridDBColumn;
    viewVinculosID_FUNDO: TcxGridDBColumn;
    viewVinculosID_PROJETO_ORIGEM: TcxGridDBColumn;
    viewVinculosID_ATIVIDADE_ORIGEM: TcxGridDBColumn;
    viewVinculosID_RUBRICA_ORIGEM: TcxGridDBColumn;
    viewVinculosID_AREA_ATUACAO_ORIGEM: TcxGridDBColumn;
    viewVinculosID_PROJETO_ALOCADO: TcxGridDBColumn;
    viewVinculosID_ATIVIDADE_ALOCADO: TcxGridDBColumn;
    viewVinculosID_RUBRICA_ALOCADO: TcxGridDBColumn;
    viewVinculosID_AREA_ATUACAO_ALOCADO: TcxGridDBColumn;
    EditValorVinculo: TcxCurrencyEdit;
    Label21: TLabel;
    dsVinculo: TDataSource;
    tabVinculoPesquisa: TcxTabSheet;
    cxGrid3: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxGridDBTableView1ID: TcxGridDBColumn;
    cxGridDBTableView1ID_CONTA_PAGAR: TcxGridDBColumn;
    cxGridDBTableView1ID_FUNDO: TcxGridDBColumn;
    cxGridDBTableView1NOME_FUNDO: TcxGridDBColumn;
    cxGridDBTableView1ID_PROJETO_ORIGEM: TcxGridDBColumn;
    cxGridDBTableView1PROJETO_ORIGEM: TcxGridDBColumn;
    cxGridDBTableView1ID_ATIVIDADE_ORIGEM: TcxGridDBColumn;
    cxGridDBTableView1ATIVIDADE_ORIGEM: TcxGridDBColumn;
    cxGridDBTableView1ID_RUBRICA_ORIGEM: TcxGridDBColumn;
    cxGridDBTableView1RUBRICA_ORIGEM: TcxGridDBColumn;
    cxGridDBTableView1ID_AREA_ATUACAO_ORIGEM: TcxGridDBColumn;
    cxGridDBTableView1AREA_ATUACAO_ORIGEM: TcxGridDBColumn;
    cxGridDBTableView1AREA_ATUACAO_ALOCADA: TcxGridDBColumn;
    cxGridDBTableView1VALOR: TcxGridDBColumn;
    cbPesquisaProjeto: TcxLookupComboBox;
    lb2: TLabel;
    cbOrganizacaoOrigem: TcxLookupComboBox;
    viewVinculosNOME_ORGANIZACAO: TcxGridDBColumn;
    cxGridDBTableView1ID_ORGANIZACAO_ORIGEM: TcxGridDBColumn;
    cxGridDBTableView1NOME_ORGANIZACAO: TcxGridDBColumn;
    lbl1: TLabel;
    cbResponsavel: TcxDBLookupComboBox;
    viewRegistrosID_COMPRA: TcxGridDBColumn;
    viewRegistrosID_RESPONSAVEL: TcxGridDBColumn;
    viewRegistrosNOME_RESPONSAVEL: TcxGridDBColumn;
    pnDataPagamento: TPanel;
    EditDataPagamento: TcxDateEdit;
    btnCancelarQuitacao: TButton;
    btnQuitar: TButton;
    cbPesquisaRubricas: TcxLookupComboBox;
    cdsLocalRubricas: TClientDataSet;
    dsLocalRubricas: TDataSource;
    cdsLocalRubricasID: TIntegerField;
    cdsLocalRubricasNOME: TStringField;
    chkSemVinculo: TcxCheckBox;
    cbPesquisaResponsavel: TcxLookupComboBox;
    cbPesquisaFundo: TcxLookupComboBox;
    tabAutorizacoes: TcxTabSheet;
    pnBotoesAutorizacoes: TPanel;
    btnAutorizar: TButton;
    Ac_Autorizar: TAction;
    cxGrid4: TcxGrid;
    viewAutorizacao: TcxGridDBTableView;
    ColumnExcluirAutorizacao: TcxGridDBColumn;
    level2: TcxGridLevel;
    dsConta_Pagar_Autorizacao: TDataSource;
    viewAutorizacaoID: TcxGridDBColumn;
    viewAutorizacaoID_PESSOA: TcxGridDBColumn;
    viewAutorizacaoPESSOA_AUTORIZOU: TcxGridDBColumn;
    Ac_Excluir_Autorizacao: TAction;
    rgAlocadoPara: TcxRadioGroup;
    pcAlocadoPara: TcxPageControl;
    tabAlocadoProjeto: TcxTabSheet;
    tabAlocadoFundo: TcxTabSheet;
    Label19: TLabel;
    cbAreaAtuacaoAlocada: TcxLookupComboBox;
    cbRubricaAtividadeAlocada: TcxLookupComboBox;
    Label18: TLabel;
    cbAtividadeAlocada: TcxLookupComboBox;
    Label16: TLabel;
    cbProjetoAlocado: TcxLookupComboBox;
    Label20: TLabel;
    cbFundoAlocado: TcxLookupComboBox;
    lb3: TLabel;
    viewVinculosNOME_FUNDO_ALOCADO: TcxGridDBColumn;
    btnAdicionarFornecedor: TButton;
    Ac_Adicionar_Fornecedor: TAction;
    btnAdicionar_Plano_Contas: TButton;
    Ac_Adicionar_Plano_Contas: TAction;
    procedure FormCreate(Sender: TObject);
    procedure Ac_Incluir_VinculoExecute(Sender: TObject);
    procedure Ac_Gerar_ParcelasExecute(Sender: TObject);
    procedure Ac_Excluir_VinculoExecute(Sender: TObject);
    procedure Ac_Quitar_ReabrirUpdate(Sender: TObject);
    procedure Ac_Quitar_ReabrirExecute(Sender: TObject);
    procedure viewRegistrosDetailCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cbAtividadePropertiesEditValueChanged(Sender: TObject);
    procedure rgTipoOrigemRecursoPropertiesEditValueChanged(Sender: TObject);
    procedure rgRecursoAlocadoPropertiesEditValueChanged(Sender: TObject);
    procedure cbProjetoAlocadoPropertiesEditValueChanged(Sender: TObject);
    procedure cbProjetoOrigemPropertiesEditValueChanged(Sender: TObject);
    procedure cbAtividadeAlocadaPropertiesEditValueChanged(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure chkSemVinculoPropertiesEditValueChanged(Sender: TObject);
    procedure Ac_AutorizarExecute(Sender: TObject);
    procedure Ac_Excluir_AutorizacaoExecute(Sender: TObject);
    procedure Ac_Adicionar_FornecedorExecute(Sender: TObject);
    procedure cbFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ac_Adicionar_Plano_ContasExecute(Sender: TObject);
    procedure cbPlanoContasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    dmFinanceiro: TdmFinanceiro;
    dmLookup: TdmLookup;
    FParcelasQuitadas: Boolean;
    FIdsParcelasCancelar: TList<Integer>;
    procedure ppvAddVinculo();
    procedure ppvAdicionarParcela(ipParcela: Integer; ipVencimento: TDate;
      ipValor: Double);
    procedure ppvQuitarParcela;
    procedure ppvReabrirParcela;
    procedure ppvConfigurarControles;
    function fpvContaSemPagamentos: Boolean;
    procedure ppvAdicionarFornecedor;
    procedure ppvCarregarFornecedores;
    procedure ppvAdicionarPlanoContas;
    procedure ppvCarregarPlanoContas;
    // procedure ppvValidarSaldos;
  protected
    function fprGetPermissao: string; override;
    procedure pprExecutarSalvar; override;
    procedure pprBeforeAlterar; override;
    procedure pprBeforeIncluir; override;
    procedure pprValidarDados; override;
    procedure pprEfetuarPesquisa; override;
    procedure pprExecutarCancelar; override;
    function fprHabilitarSalvar(): Boolean; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    function fprConfigurarControlesPesquisa: TWinControl; override;
    function fprHabilitarAlterarDetail: Boolean; override;
    procedure pprBeforeExcluir(ipId: Integer; ipAcao: TAcaoTela); override;
    procedure pprValidarPesquisa; override;

    procedure pprCarregarDadosModelo; override;
  public
    procedure ppuIncluir; override;
  public const
    coProjeto = 1;
    coAtividade = 2;

    coOrigemProjeto = 0;
    coOrigemFundo = 1;

    coAlocadoProjeto = 0;
    coAlocadoFundo = 1;

    coSim = 1;
    coNao = 0;

    coPesquisaDescricao = 5;
    coPesquisaFornecedor = 6;
    coPesquisaPlanoConta = 7;
    coPesquisaProjetoOrigemRecurso = 8;
    coPesquisaProjetoAlocado = 9;
    coPesquisaRubricaOrigemRecurso = 10;
    coPesquisaResponsavelDespesa = 11;
    coPesquisaFundo = 12;

  end;

var
  frmContaPagar: TfrmContaPagar;

implementation

uses
  uExceptions;

{$R *.dfm}

{ TfrmContaPagar }

procedure TfrmContaPagar.pprBeforeAlterar;
begin
  inherited;
  pcEditsCadastro.ActivePage := tabInfoGeral;

  EditQtdeParcelas.Value := 1;
  EditVencimentoParcela.Clear;

  EditValorVinculo.Clear;

  cbProjetoOrigem.Clear;
  cbProjetoAlocado.Clear;

  FIdsParcelasCancelar.Clear;

  FParcelasQuitadas := False;
  TUtils.ppuPercorrerCds(dmFinanceiro.cdsConta_Pagar_Parcela,
    function: Boolean
    begin
      if dmFinanceiro.cdsConta_Pagar_ParcelaSTATUS.AsInteger = 1 then // quitada
        begin
          FParcelasQuitadas := True;
          Exit(False);
        end
      else
        Exit(True);
    end);

  tabVinculo.Enabled := not FParcelasQuitadas;
  viewParcelasVALOR.Options.Editing := not FParcelasQuitadas;

  if FParcelasQuitadas then
    begin
      TMensagem.ppuShowMessage
        ('Algumas parcelas já foram quitadas, portanto não será mais possível editar os vínculos e nem o valor individual de uma parcela.');
    end;
end;

procedure TfrmContaPagar.pprBeforeExcluir(ipId: Integer; ipAcao: TAcaoTela);
begin
  inherited;
  dmPrincipal.FuncoesFinanceiro.ppuReabrirTodasParcelasContaPagar(ipId);
end;

procedure TfrmContaPagar.pprBeforeIncluir;
begin
  inherited;
  pcEditsCadastro.ActivePage := tabInfoGeral;

  EditQtdeParcelas.Value := 1;
  EditVencimentoParcela.Clear;

  cbProjetoOrigem.Clear;
  cbProjetoAlocado.Clear;

  FIdsParcelasCancelar.Clear;

  tabVinculo.Enabled := True;
  viewParcelasVALOR.Options.Editing := True;
  FParcelasQuitadas := False;

  EditValorVinculo.Clear;
end;

procedure TfrmContaPagar.pprCarregarDadosModelo;
var
  vaContaPagar: TContaPagar;
begin
  inherited;
  if (ModoExecucao in [meSomenteCadastro, meSomenteEdicao]) and Assigned(Modelo) and (Modelo is TContaPagar) then
    begin
      vaContaPagar := TContaPagar(Modelo);

      cbFornecedor.EditValue := vaContaPagar.IdFornecedor;
      cbFornecedor.PostEditValue;

      EditValorTotal.EditValue := vaContaPagar.ValorTotal;
      EditValorTotal.PostEditValue;

      if vaContaPagar.IdCompra <> 0 then
        dmFinanceiro.cdsConta_PagarID_COMPRA.AsInteger := vaContaPagar.IdCompra;

      if vaContaPagar.IdResponsavel <> 0 then
        dmFinanceiro.cdsConta_PagarID_RESPONSAVEL.AsInteger := vaContaPagar.IdResponsavel;
    end;
end;

procedure TfrmContaPagar.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.EditValue = coPesquisaDescricao then
    ipCds.ppuAddParametro(TParametros.coDescricao, EditPesquisa.Text)
  else if cbPesquisarPor.EditValue = coPesquisaFornecedor then
    ipCds.ppuAddParametro(TParametros.coFornecedor, cbPesquisaFornecedor.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaPlanoConta then
    ipCds.ppuAddParametro(TParametros.coPlanoConta, cbPesquisaPlanoConta.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaProjetoOrigemRecurso then
    ipCds.ppuAddParametro(TParametros.coProjeto, cbPesquisaProjeto.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaProjetoAlocado then
    ipCds.ppuAddParametro(TParametros.coProjetoAlocado, cbPesquisaProjeto.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaRubricaOrigemRecurso then
    ipCds.ppuAddParametro(TParametros.coRubricaOrigemRecurso, cbPesquisaRubricas.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaResponsavelDespesa then
    ipCds.ppuAddParametro(TParametros.coResponsavelDespesa, cbPesquisaResponsavel.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaFundo then
    ipCds.ppuAddParametro(TParametros.coFundo, cbPesquisaFundo.EditValue);

  if rgStatus.EditValue <> 2 then // ambos
    ipCds.ppuAddParametro(TParametros.coStatus, rgStatus.EditValue);

end;

procedure TfrmContaPagar.pprEfetuarPesquisa;
begin
  dmFinanceiro.cdsConta_Pagar_Vinculo.Close;
  dmFinanceiro.cdsConta_Pagar_Autorizacao.Close;
  inherited;
  dmFinanceiro.cdsConta_Pagar_Autorizacao.Open;
  dmFinanceiro.cdsConta_Pagar_Vinculo.Open;
end;

procedure TfrmContaPagar.pprExecutarCancelar;
begin
  dmFinanceiro.cdsConta_Pagar_Parcela.CancelUpdates;
  dmFinanceiro.cdsConta_Pagar_Vinculo.CancelUpdates;
  inherited;
end;

procedure TfrmContaPagar.pprExecutarSalvar;
var
  vaIdParcela: Integer;
begin
  inherited;
  for vaIdParcela in FIdsParcelasCancelar do
    begin
      dmPrincipal.FuncoesFinanceiro.ppuReabrirParcela(vaIdParcela);
    end;

  if dmFinanceiro.cdsConta_Pagar.ChangeCount > 0 then
    dmFinanceiro.cdsConta_Pagar.ApplyUpdates(0);

  if dmFinanceiro.cdsConta_Pagar_Parcela.ChangeCount > 0 then
    dmFinanceiro.cdsConta_Pagar_Parcela.ApplyUpdates(0);

  if dmFinanceiro.cdsConta_Pagar_Vinculo.ChangeCount > 0 then
    dmFinanceiro.cdsConta_Pagar_Vinculo.ApplyUpdates(0);
end;

procedure TfrmContaPagar.pprValidarDados;
var
  vaValorParcelado: Double;
  vaValorTotalVinculo: Double;
begin
  inherited;
  vaValorTotalVinculo := 0;
  if dmFinanceiro.cdsConta_Pagar_Vinculo.RecordCount = 0 then
    raise Exception.Create('É necessário incluir pelo menos um vínculo.');

  TUtils.ppuPercorrerCds(dmFinanceiro.cdsConta_Pagar_Vinculo,
    procedure
    begin
      vaValorTotalVinculo := vaValorTotalVinculo + dmFinanceiro.cdsConta_Pagar_VinculoVALOR.AsFloat;
    end);

  if vaValorTotalVinculo <> dmFinanceiro.cdsConta_PagarVALOR_TOTAL.AsFloat then
    raise Exception.Create('A soma dos valores de todos os vínculos deve ser igual ao valor total a se pagar da conta.');

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

procedure TfrmContaPagar.pprValidarPesquisa;
begin
  inherited;
  if cbPesquisarPor.EditValue = coPesquisaRubricaOrigemRecurso then
    begin
      if VarIsNull(cbPesquisaRubricas.EditValue) then
        raise Exception.Create('Informe a rubrica para pesquisa.');
    end;
end;

procedure TfrmContaPagar.ppuIncluir;
begin
  inherited;
  dmFinanceiro.cdsConta_PagarID.AsInteger := dmPrincipal.FuncoesGeral.fpuGetId('CONTA_PAGAR');
end;

procedure TfrmContaPagar.ppvAddVinculo();
  procedure plValidarInformacoesAlocado;
  begin
    if rgAlocadoPara.EditValue = coAlocadoProjeto then
      begin
        if VarIsNull(cbProjetoAlocado.EditValue) then
          raise TControlException.Create('Informe o projeto para qual foi alocado o recurso.', cbProjetoAlocado);

        dmFinanceiro.cdsConta_Pagar_VinculoID_PROJETO_ALOCADO.AsInteger := cbProjetoAlocado.EditValue;
        dmFinanceiro.cdsConta_Pagar_VinculoPROJETO_ALOCADO.AsString := cbProjetoAlocado.Text;

        if VarIsNull(cbAtividadeAlocada.EditValue) then
          raise TControlException.Create('Informe a atividade para qual foi alocado o recurso.', cbAtividadeAlocada);

        dmFinanceiro.cdsConta_Pagar_VinculoID_ATIVIDADE_ALOCADO.AsInteger := cbAtividadeAlocada.EditValue;
        dmFinanceiro.cdsConta_Pagar_VinculoATIVIDADE_ALOCADA.AsString := cbAtividadeAlocada.Text;

        if VarIsNull(cbRubricaAtividadeAlocada.EditValue) then
          raise TControlException.Create('Informe a rubrica para qual foi alocado o recurso.', cbRubricaAtividadeAlocada);

        dmFinanceiro.cdsConta_Pagar_VinculoID_RUBRICA_ALOCADO.AsInteger := cbRubricaAtividadeAlocada.EditValue;
        dmFinanceiro.cdsConta_Pagar_VinculoRUBRICA_ALOCADA.AsString := cbRubricaAtividadeAlocada.Text;

        if VarIsNull(cbAreaAtuacaoAlocada.EditValue) then
          raise TControlException.Create('Informe a área de atuação para qual foi alocado o recurso.', cbAreaAtuacaoAlocada);

        dmFinanceiro.cdsConta_Pagar_VinculoID_AREA_ATUACAO_ALOCADO.AsInteger := cbAreaAtuacaoAlocada.EditValue;
        dmFinanceiro.cdsConta_Pagar_VinculoAREA_ATUACAO_ALOCADA.AsString := cbAreaAtuacaoAlocada.Text;
      end
    else
      begin
        if VarIsNull(cbFundoAlocado.EditValue) then
          raise TControlException.Create('Informe a conta para qual foi alocado o recurso.', cbFundoAlocado);

        dmFinanceiro.cdsConta_Pagar_VinculoID_FUNDO_ALOCADO.AsInteger := cbFundoAlocado.EditValue;
        dmFinanceiro.cdsConta_Pagar_VinculoNOME_FUNDO_ALOCADO.AsString := cbFundoAlocado.Text;
      end;
  end;

var
  vaIdOrganizacao: Integer;

begin
  dmFinanceiro.cdsConta_Pagar_Vinculo.Append;
  try
    if VarIsNull(EditValorVinculo.EditValue) then
      raise TControlException.Create('Informe o valor a ser utilizado neste vínculo.', EditValorVinculo);

    if rgTipoOrigemRecurso.EditValue = coOrigemProjeto then
      begin
        if VarIsNull(cbProjetoOrigem.EditValue) then
          raise TControlException.Create('Informe o projeto de origem do recurso.', cbProjetoOrigem);

        if VarIsNull(cbOrganizacaoOrigem.EditValue) then
          raise TControlException.Create('Informe a organização de origem do recurso.', cbOrganizacaoOrigem);

        dmFinanceiro.cdsConta_Pagar_VinculoID_PROJETO_ORIGEM.AsInteger := cbProjetoOrigem.EditValue;
        dmFinanceiro.cdsConta_Pagar_VinculoPROJETO_ORIGEM.AsString := cbProjetoOrigem.Text;
        if rgRecursoAlocado.EditValue = coNao then
          begin
            if VarIsNull(cbAtividadeOrigem.EditValue) then
              raise TControlException.Create('Informe a atividade de origem do recurso.', cbAtividadeOrigem);

            dmFinanceiro.cdsConta_Pagar_VinculoID_ATIVIDADE_ORIGEM.AsInteger := cbAtividadeOrigem.EditValue;
            dmFinanceiro.cdsConta_Pagar_VinculoATIVIDADE_ORIGEM.AsString := cbAtividadeOrigem.Text;

            if VarIsNull(cbRubricaAtividadeOrigem.EditValue) then
              raise TControlException.Create('Informe a rubrica de origem do recurso.', cbRubricaAtividadeOrigem);

            dmFinanceiro.cdsConta_Pagar_VinculoID_RUBRICA_ORIGEM.AsInteger := cbRubricaAtividadeOrigem.EditValue;
            dmFinanceiro.cdsConta_Pagar_VinculoRUBRICA_ORIGEM.AsString := cbRubricaAtividadeOrigem.Text;

            if VarIsNull(cbAreaAtuacaoOrigem.EditValue) then
              raise TControlException.Create('Informe a área de atuação de origem do recurso.', cbAreaAtuacaoOrigem);

            dmFinanceiro.cdsConta_Pagar_VinculoID_AREA_ATUACAO_ORIGEM.AsInteger := cbAreaAtuacaoOrigem.EditValue;
            dmFinanceiro.cdsConta_Pagar_VinculoAREA_ATUACAO_ORIGEM.AsString := cbAreaAtuacaoOrigem.Text;
          end
        else
          begin
            if VarIsNull(cbRubricaProjetoOrigem.EditValue) then
              raise TControlException.Create('Informe a rubrica de origem do recurso.', cbRubricaProjetoOrigem);

            dmFinanceiro.cdsConta_Pagar_VinculoID_RUBRICA_ORIGEM.AsInteger := cbRubricaProjetoOrigem.EditValue;
            dmFinanceiro.cdsConta_Pagar_VinculoRUBRICA_ORIGEM.AsString := cbRubricaProjetoOrigem.Text;

            plValidarInformacoesAlocado;
          end;

        vaIdOrganizacao := cbOrganizacaoOrigem.EditValue;

      end
    else // Fundo
      begin
        if VarIsNull(cbFundoOrigem.EditValue) then
          raise TControlException.Create('Informe a conta de origem do recurso.', cbFundoOrigem);

        if dmLookup.cdslkFundo.Locate(TBancoDados.coId, cbFundoOrigem.EditValue, []) then
          begin
            dmFinanceiro.cdsConta_Pagar_VinculoID_FUNDO.AsInteger := cbFundoOrigem.EditValue;
            dmFinanceiro.cdsConta_Pagar_VinculoNOME_FUNDO.AsString := cbFundoOrigem.Text;
            vaIdOrganizacao := dmLookup.cdslkFundoID_ORGANIZACAO.AsInteger;
          end
        else
          begin
            raise Exception.Create('Conta não encontrada.');
          end;

        // if not chkSemVinculo.Checked then
        // plValidarInformacoesAlocado;
      end;

    dmFinanceiro.cdsConta_Pagar_VinculoID_ORGANIZACAO_ORIGEM.AsInteger := vaIdOrganizacao;
    if dmLookup.cdslkOrganizacao.Locate(TBancoDados.coId, vaIdOrganizacao, []) then
      dmFinanceiro.cdsConta_Pagar_VinculoNOME_ORGANIZACAO.AsString := dmLookup.cdslkOrganizacaoNOME.AsString;

    dmFinanceiro.cdsConta_Pagar_VinculoID.AsInteger := dmPrincipal.FuncoesGeral.fpuGetId('CONTA_PAGAR_VINCULO');
    dmFinanceiro.cdsConta_Pagar_VinculoVALOR.AsFloat := EditValorVinculo.EditValue;
    dmFinanceiro.cdsConta_Pagar_Vinculo.Post;
  except
    dmFinanceiro.cdsConta_Pagar_Vinculo.Cancel;
    raise;
  end;
end;

function TfrmContaPagar.fpvContaSemPagamentos: Boolean;
var
  vaRecNo: Integer;
begin
  Result := True;
  dmFinanceiro.cdsConta_Pagar_Parcela.DisableControls;
  try
    vaRecNo := dmFinanceiro.cdsConta_Pagar_Parcela.RecNo;
    if dmFinanceiro.cdsConta_Pagar_Parcela.Locate(dmFinanceiro.cdsConta_Pagar_ParcelaSTATUS.FieldName, 1, []) then
      Result := False;

  finally
    dmFinanceiro.cdsConta_Pagar_Parcela.RecNo := vaRecNo;
    dmFinanceiro.cdsConta_Pagar_Parcela.EnableControls;
  end;
end;

procedure TfrmContaPagar.Ac_Adicionar_FornecedorExecute(Sender: TObject);
begin
  inherited;
  ppvAdicionarFornecedor;
end;

procedure TfrmContaPagar.ppvAdicionarFornecedor;
var
  vaFrmFornecedor: TfrmFornecedor;
begin
  vaFrmFornecedor := TfrmFornecedor.Create(nil);
  try
    vaFrmFornecedor.ppuConfigurarModoExecucao(meSomenteCadastro);
    vaFrmFornecedor.ShowModal;
    if vaFrmFornecedor.IdEscolhido <> 0 then
      begin
        ppvCarregarFornecedores;
        if dmLookup.cdslkFornecedor.Locate(TBancoDados.coId, vaFrmFornecedor.IdEscolhido, []) then
          begin
            cbFornecedor.EditValue := vaFrmFornecedor.IdEscolhido;
            cbFornecedor.PostEditValue;
          end;
      end;
  finally
    vaFrmFornecedor.Free;
  end;
end;

procedure TfrmContaPagar.ppvAdicionarPlanoContas;
var
  vaFrmPlanoContas: TfrmPlanoContas;
begin
  vaFrmPlanoContas := TfrmPlanoContas.Create(nil);
  try
    vaFrmPlanoContas.ppuConfigurarModoExecucao(meSomenteCadastro);
    vaFrmPlanoContas.ShowModal;
    if vaFrmPlanoContas.IdEscolhido <> 0 then
      begin
        ppvCarregarPlanoContas;
        if dmLookup.cdslkPlano_Contas.Locate(TBancoDados.coId, vaFrmPlanoContas.IdEscolhido, []) then
          begin
            cbPlanoContas.EditValue := vaFrmPlanoContas.IdEscolhido;
            cbPlanoContas.PostEditValue;
          end;
      end;
  finally
    vaFrmPlanoContas.Free;
  end;
end;

procedure TfrmContaPagar.ppvCarregarFornecedores;
begin
  dmLookup.cdslkFornecedor.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);
end;

procedure TfrmContaPagar.Ac_Adicionar_Plano_ContasExecute(Sender: TObject);
begin
  inherited;
  ppvAdicionarPlanoContas;
end;

procedure TfrmContaPagar.Ac_AutorizarExecute(Sender: TObject);
var
  vaRecNo: Integer;
begin
  inherited;
  pprValidarPermissao(atIncluir, GetEnumName(TypeInfo(TPermissaoFinanceiro), Ord(finAutorizarUsoFundo)));

  if not fpvContaSemPagamentos then
    raise Exception.Create('Já existe uma quitação para esta conta. Não é possível incluir autorizações.');

  dmFinanceiro.cdsConta_Pagar_Autorizacao.DisableControls;
  try
    vaRecNo := dmFinanceiro.cdsConta_Pagar_Autorizacao.RecNo;
    if dmFinanceiro.cdsConta_Pagar_Autorizacao.Locate(dmFinanceiro.cdsConta_Pagar_AutorizacaoID_PESSOA.FieldName,
      TInfoLogin.fpuGetInstance.Usuario.Id, []) then
      raise Exception.Create('O usuário atual já realizou a autorização para esta conta.');

    if TMensagem.fpuPerguntar('Tem certeza que deseja autorizar o pagamento desta conta?', ppSimNao) = rpSim then
      begin
        dmFinanceiro.cdsConta_Pagar_Autorizacao.Append;
        dmFinanceiro.cdsConta_Pagar_AutorizacaoID.AsInteger := dmPrincipal.FuncoesGeral.fpuGetId('CONTA_PAGAR_AUTORIZACAO');
        dmFinanceiro.cdsConta_Pagar_AutorizacaoID_PESSOA.AsInteger := TInfoLogin.fpuGetInstance.Usuario.Id;
        dmFinanceiro.cdsConta_Pagar_AutorizacaoPESSOA_AUTORIZOU.AsString := TInfoLogin.fpuGetInstance.Usuario.Nome;
        dmFinanceiro.cdsConta_Pagar_Autorizacao.Post;
      end;
  finally
    if vaRecNo > 0 then
      dmFinanceiro.cdsConta_Pagar_Autorizacao.RecNo := vaRecNo;

    dmFinanceiro.cdsConta_Pagar_Autorizacao.EnableControls;
  end;

end;

procedure TfrmContaPagar.Ac_Excluir_AutorizacaoExecute(Sender: TObject);
begin
  inherited;
  if not fpvContaSemPagamentos then
    raise Exception.Create('Já existe uma quitação para esta conta. Não é possível excluir a autorização.');

  if TMensagem.fpuPerguntar('Confirma a exclusão desta autorização?', ppSimNao) = rpSim then
    begin
      if (not TInfoLogin.fpuGetInstance.Usuario.Administrador) and
        (dmFinanceiro.cdsConta_Pagar_AutorizacaoID_PESSOA.AsInteger <> TInfoLogin.fpuGetInstance.Usuario.Id) then
        raise Exception.Create('Somente a pessoa que autorizou pode excluir sua autorização.');

      dmFinanceiro.cdsConta_Pagar_Autorizacao.Delete;
    end;

end;

procedure TfrmContaPagar.Ac_Excluir_VinculoExecute(Sender: TObject);
begin
  inherited;
  dmFinanceiro.cdsConta_Pagar_Vinculo.Delete;
end;

procedure TfrmContaPagar.Ac_Gerar_ParcelasExecute(Sender: TObject);
var
  vaValorParcela: Double;
  vaValorParcelado: Double;
  I: Integer;
begin
  inherited;
  if FParcelasQuitadas then
    begin
      if TMensagem.fpuPerguntar('Ao gerar novas parcelas todas as parcelas quitadas ' +
        'serão reabertas. Tem certeza que deseja fazer isso?', ppSimNao) = rpNao then
        Exit;
    end;

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
      begin
        if dmFinanceiro.cdsConta_Pagar_ParcelaSTATUS.AsInteger = 1 then
          FIdsParcelasCancelar.Add(dmFinanceiro.cdsConta_Pagar_ParcelaID.AsInteger);

        dmFinanceiro.cdsConta_Pagar_Parcela.Delete;
      end;

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

    viewParcelasVALOR.Options.Editing := True;
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
  dmFinanceiro.cdsConta_Pagar_ParcelaSTATUS.AsInteger := 0;
  dmFinanceiro.cdsConta_Pagar_Parcela.Post;
end;

procedure TfrmContaPagar.Ac_Incluir_VinculoExecute(Sender: TObject);
begin
  inherited;
  ppvAddVinculo;
end;

procedure TfrmContaPagar.Ac_Quitar_ReabrirExecute(Sender: TObject);
begin
  inherited;
  if dmFinanceiro.cdsConta_Pagar_ParcelaSTATUS.AsInteger = 0 then
    ppvQuitarParcela
  else
    ppvReabrirParcela;
end;

procedure TfrmContaPagar.ppvQuitarParcela;
var
  vaForm: TForm;
begin
  vaForm := TUtils.fpuEncapsularPanelForm('Data do Pagamento', pnDataPagamento);
  try
    EditDataPagamento.Date := Now;
    if vaForm.ShowModal = mrOk then
      begin
        // ja alterar a tabela conta_pagar_parcel tbm
        dmPrincipal.FuncoesFinanceiro.ppuQuitarParcela(dmFinanceiro.cdsConta_Pagar_ParcelaID.AsInteger, DateToStr(EditDataPagamento.Date));
        // pra nao precisar fazer um refresh vou alterar manualmente
        dmFinanceiro.cdsConta_Pagar_Parcela.Edit;
        dmFinanceiro.cdsConta_Pagar_ParcelaDATA_PAGAMENTO.AsDateTime := EditDataPagamento.Date;
        dmFinanceiro.cdsConta_Pagar_ParcelaSTATUS.AsInteger := 1;
        dmFinanceiro.cdsConta_Pagar_Parcela.Post;

        // faz o cds achar q nada aconteceu
        dmFinanceiro.cdsConta_Pagar_Parcela.MergeChangeLog;
      end;
  finally
    pnDataPagamento.Visible := False;
    pnDataPagamento.Parent := Self;

    vaForm.Free;
  end;
end;

procedure TfrmContaPagar.ppvReabrirParcela;
begin

  dmPrincipal.FuncoesFinanceiro.ppuReabrirParcela(dmFinanceiro.cdsConta_Pagar_ParcelaID.AsInteger);
  // pra nao precisar fazer um refresh vou alterar manualmente
  dmFinanceiro.cdsConta_Pagar_Parcela.Edit;
  dmFinanceiro.cdsConta_Pagar_ParcelaDATA_PAGAMENTO.Clear;
  dmFinanceiro.cdsConta_Pagar_ParcelaSTATUS.AsInteger := 0;
  dmFinanceiro.cdsConta_Pagar_Parcela.Post;

  dmFinanceiro.cdsConta_Pagar_Parcela.MergeChangeLog;
end;

procedure TfrmContaPagar.rgRecursoAlocadoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  ppvConfigurarControles;
end;

procedure TfrmContaPagar.rgTipoOrigemRecursoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  ppvConfigurarControles;
end;

procedure TfrmContaPagar.viewRegistrosDetailCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if AViewInfo.GridRecord.Values[viewRegistrosDetailSTATUS.Index] = 1 then
    begin
      ACanvas.Font.Color := clWhite;
      if AViewInfo.GridRecord.Selected then
        ACanvas.Brush.Color := $00274F00
      else
        ACanvas.Brush.Color := clGreen;
    end
  else if AViewInfo.GridRecord.Values[viewRegistrosDetailVENCIMENTO.Index] < Today then
    begin
      ACanvas.Font.Color := clWhite;
      if AViewInfo.GridRecord.Selected then
        ACanvas.Brush.Color := clMaroon
      else
        ACanvas.Brush.Color := clRed;
    end;

end;

procedure TfrmContaPagar.Ac_Quitar_ReabrirUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := dmFinanceiro.cdsConta_Pagar_Parcela.Active and (dmFinanceiro.cdsConta_Pagar_Parcela.RecordCount > 0);

  if dmFinanceiro.cdsConta_Pagar_Parcela.Active and (dmFinanceiro.cdsConta_Pagar_ParcelaSTATUS.AsInteger = 0) then
    begin
      Ac_Quitar_Reabrir.ImageIndex := 8;
      Ac_Quitar_Reabrir.Caption := 'Quitar Parcela';
    end
  else
    begin
      Ac_Quitar_Reabrir.ImageIndex := 3;
      Ac_Quitar_Reabrir.Caption := 'Reabrir Parcela';
    end;
end;

procedure TfrmContaPagar.cbAtividadeAlocadaPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if not VarIsNull(cbAtividadeAlocada.EditValue) then
    begin
      dmLookup.cdslkRubrica_Atividade_Alocada.ppuDataRequest([TParametros.coAtividade], [cbAtividadeAlocada.EditValue], TOperadores.coAnd, True);
      dmLookup.cdslkProjeto_Area_Atividade_Alocada.ppuDataRequest([TParametros.coAtividade], [cbAtividadeAlocada.EditValue],
        TOperadores.coAnd, True);
    end
  else
    begin
      dmLookup.cdslkRubrica_Atividade_Alocada.Close;
      dmLookup.cdslkProjeto_Area_Atividade_Alocada.Close;
    end;

  if (not dmLookup.cdslkRubrica_Atividade_Alocada.Active) or
    ((not VarIsNull(cbRubricaAtividadeAlocada.EditValue)) and (not dmLookup.cdslkRubrica_Atividade_Alocada.Locate(TBancoDados.coId,
    cbRubricaAtividadeAlocada.EditValue, []))) then
    begin
      cbRubricaAtividadeAlocada.Clear;
    end;

  if (not dmLookup.cdslkProjeto_Area_Atividade_Alocada.Active) or
    ((not VarIsNull(cbAreaAtuacaoAlocada.EditValue)) and (not dmLookup.cdslkProjeto_Area_Atividade_Alocada.Locate(TBancoDados.coId,
    cbAreaAtuacaoAlocada.EditValue, []))) then
    begin
      cbAreaAtuacaoAlocada.Clear;
    end;
end;

procedure TfrmContaPagar.cbAtividadePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if not VarIsNull(cbAtividadeOrigem.EditValue) then
    begin
      dmLookup.cdslkRubrica_Atividade.ppuDataRequest([TParametros.coAtividade], [cbAtividadeOrigem.EditValue], TOperadores.coAnd, True);
      dmLookup.cdslkProjeto_Area_Atividade.ppuDataRequest([TParametros.coAtividade], [cbAtividadeOrigem.EditValue], TOperadores.coAnd, True);
    end
  else
    begin
      dmLookup.cdslkRubrica_Atividade.Close;
      dmLookup.cdslkProjeto_Area_Atividade.Close;
    end;

  if (not dmLookup.cdslkRubrica_Atividade.Active) or ((not VarIsNull(cbRubricaAtividadeOrigem.EditValue)) and
    (not dmLookup.cdslkRubrica_Atividade.Locate(TBancoDados.coId, cbRubricaAtividadeOrigem.EditValue, []))) then
    begin
      cbRubricaAtividadeOrigem.Clear;
    end;

  if (not dmLookup.cdslkProjeto_Area_Atividade.Active) or ((not VarIsNull(cbAreaAtuacaoOrigem.EditValue)) and
    (not dmLookup.cdslkProjeto_Area_Atividade.Locate(TBancoDados.coId, cbAreaAtuacaoOrigem.EditValue, []))) then
    begin
      cbAreaAtuacaoOrigem.Clear;
    end;
end;

procedure TfrmContaPagar.cbFornecedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvAdicionarFornecedor;
end;

procedure TfrmContaPagar.cbPlanoContasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvAdicionarPlanoContas;
end;

procedure TfrmContaPagar.cbProjetoAlocadoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if not VarIsNull(cbProjetoAlocado.EditValue) then
    begin
      dmLookup.cdslkAtividade_Alocada.ppuLimparParametros;
      dmLookup.cdslkAtividade_Alocada.ppuAddParametro(TParametros.coProjeto, cbProjetoAlocado.EditValue);
      dmLookup.cdslkAtividade_Alocada.ppuAddParametro(TParametros.coStatusDiferente, Ord(saCancelada).ToString + ';' + Ord(saFinalizada).ToString,
        TOperadores.coOR);
      dmLookup.cdslkAtividade_Alocada.ppuDataRequest();

      // dmLookup.cdslkProjeto_Area_Atividade_Alocada.ppuDataRequest([TParametros.coProjeto], [cbProjetoAlocado.EditValue], TOperadores.coAnd, true);
    end
  else
    begin
      dmLookup.cdslkAtividade_Alocada.Close;
      // dmLookup.cdslkRubrica_Atividade_Alocada.Close;
      // dmLookup.cdslkProjeto_Area_Atividade_Alocada.Close;
    end;

  if (not dmLookup.cdslkAtividade_Alocada.Active) or
    ((not VarIsNull(cbAtividadeAlocada.EditValue)) and
    (not dmLookup.cdslkAtividade_Alocada.Locate(TBancoDados.coId, cbAtividadeAlocada.EditValue, [])))
  then
    begin
      cbAtividadeAlocada.Clear;
    end;
end;

procedure TfrmContaPagar.cbProjetoOrigemPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;

  if not VarIsNull(cbProjetoOrigem.EditValue) then
    begin
      dmLookup.cdslkAtividade.ppuLimparParametros;
      dmLookup.cdslkAtividade.ppuAddParametro(TParametros.coProjeto, cbProjetoOrigem.EditValue);
      dmLookup.cdslkAtividade.ppuAddParametro(TParametros.coStatusDiferente, Ord(saCancelada).ToString + ';' + Ord(saFinalizada).ToString,
        TOperadores.coOR);
      dmLookup.cdslkAtividade.ppuDataRequest();

      dmLookup.cdslkRubrica.ppuDataRequest([TParametros.coProjeto], [cbProjetoOrigem.EditValue], TOperadores.coAnd, True);
      dmLookup.cdslkProjeto_Organizacao.ppuDataRequest([TParametros.coProjeto], [cbProjetoOrigem.EditValue], TOperadores.coAnd, True);
    end
  else
    begin
      dmLookup.cdslkAtividade.Close;
      dmLookup.cdslkRubrica.Close; // rubricas do projeto
      dmLookup.cdslkProjeto_Organizacao.Close;
    end;

  cbOrganizacaoOrigem.Enabled := dmLookup.cdslkProjeto_Organizacao.Active and (dmLookup.cdslkProjeto_Organizacao.RecordCount > 1);
  if dmLookup.cdslkProjeto_Organizacao.Active and (dmLookup.cdslkProjeto_Organizacao.RecordCount = 1) then
    cbOrganizacaoOrigem.EditValue := dmLookup.cdslkProjeto_OrganizacaoID_ORGANIZACAO.AsInteger
  else
    cbOrganizacaoOrigem.Clear;

  cbOrganizacaoOrigem.PostEditValue;

  if (not dmLookup.cdslkAtividade.Active) or ((not VarIsNull(cbAtividadeOrigem.EditValue)) and
    (not dmLookup.cdslkAtividade.Locate(TBancoDados.coId, cbAtividadeOrigem.EditValue, []))) then
    begin
      cbAtividadeOrigem.Clear;
    end;

  if (not dmLookup.cdslkRubrica.Active) or ((not VarIsNull(cbRubricaProjetoOrigem.EditValue)) and
    (not dmLookup.cdslkRubrica.Locate(TBancoDados.coId, cbRubricaProjetoOrigem.EditValue, []))) then
    begin
      cbRubricaProjetoOrigem.Clear;
    end;

end;

procedure TfrmContaPagar.chkSemVinculoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  ppvConfigurarControles;
end;

procedure TfrmContaPagar.ppvConfigurarControles;
begin
  // Lembre-se: Foi solicitado que o recurso alocado fosse desabilitado.
  // rgRecursoAlocado.Visible := rgTipoOrigemRecurso.EditValue = coOrigemProjeto;
  // rgAlocadoPara.Visible := rgRecursoAlocado.Visible;

  if rgTipoOrigemRecurso.EditValue = coOrigemProjeto then
    pcOrigemRecurso.ActivePage := tabProjeto
  else
    pcOrigemRecurso.ActivePage := tabFundo;

  gbOrigem.Visible := rgTipoOrigemRecurso.EditValue = coOrigemProjeto;
  gbAlocado.Visible := False;
  // gbAlocado.Visible := ((rgTipoOrigemRecurso.EditValue = coOrigemFundo) and (not chkSemVinculo.Checked)) or
  // ((rgTipoOrigemRecurso.EditValue = coOrigemProjeto) and (rgRecursoAlocado.EditValue = coSim));

  if rgRecursoAlocado.EditValue = coSim then
    pcRecursoAlocado.ActivePage := tabRecursoAlocado
  else
    pcRecursoAlocado.ActivePage := tabRecursoNaoAlocado;

  if rgAlocadoPara.EditValue = coAlocadoProjeto then
    pcAlocadoPara.ActivePage := tabAlocadoProjeto
  else
    pcAlocadoPara.ActivePage := tabAlocadoFundo;

  gbOrigem.Top := pnVinculoTop.Top + 5;
  gbAlocado.Top := gbOrigem.Top + 5;
  pnValor.Top := gbAlocado.Top + 5;
end;

procedure TfrmContaPagar.FormCreate(Sender: TObject);
begin
  dmFinanceiro := TdmFinanceiro.Create(Self);
  dmFinanceiro.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';
  inherited;

  FIdsParcelasCancelar := TList<Integer>.Create;;

  rgStatus.EditValue := 2; // ambos
  rgStatus.PostEditValue;

  pcRecursoAlocado.Properties.HideTabs := True;
  pcOrigemRecurso.Properties.HideTabs := True;
  pcAlocadoPara.Properties.HideTabs := True;
  pcOrigemRecurso.Height := 42;
  pcAlocadoPara.Height := 42;
  gbOrigem.Height := 64;
  gbAlocado.Height := 64;
  pcRecursoAlocado.Height := 46;

  pcRecursoAlocado.ActivePage := tabRecursoNaoAlocado;
  pcOrigemRecurso.ActivePage := tabProjeto;
  pcAlocadoPara.ActivePage := tabAlocadoProjeto;
  pcEditsCadastro.ActivePage := tabInfoGeral;

  PesquisaPadrao := Ord(tppData);

  EditDataInicialPesquisa.Date := Now;
  EditDataFinalPesquisa.Date := IncDay(Now, 7);

  dmLookup.ppuCarregarPessoas(0, [trpFuncionario, trpEstagiario, trpVoluntario, trpMembroDiretoria]);
  ppvCarregarFornecedores;
  ppvCarregarPlanoContas;
  
  dmLookup.cdslkConta_Corrente.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);
  dmLookup.cdslkRubrica.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);;
  dmLookup.cdslkOrganizacao.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);
  // preciso de um cds pq o lkRubrica vai ser utilizado para outras coisas mais pra frente
  cdsLocalRubricas.Data := dmLookup.cdslkRubrica.Data;

  dmLookup.cdslkProjeto.ppuDataRequest([TParametros.coStatusDiferente],
    [Ord(spRecusado).ToString + ';' + Ord(spExecutado).ToString + ';' + Ord(spCancelado).ToString]);
  dmLookup.cdslkFundo.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);
end;

procedure TfrmContaPagar.ppvCarregarPlanoContas;
begin
  dmLookup.cdslkPlano_Contas.ppuDataRequest([TParametros.coTipo], [Ord(tpcDespesa)], TOperadores.coAnd, True);
end;

procedure TfrmContaPagar.FormDestroy(Sender: TObject);
begin
  inherited;
  FIdsParcelasCancelar.Free;
end;

function TfrmContaPagar.fprConfigurarControlesPesquisa: TWinControl;
begin
  Result := inherited;
  cbPesquisaFornecedor.Visible := cbPesquisarPor.EditValue = coPesquisaFornecedor;
  cbPesquisaPlanoConta.Visible := cbPesquisarPor.EditValue = coPesquisaPlanoConta;
  cbPesquisaProjeto.Visible := (cbPesquisarPor.EditValue = coPesquisaProjetoOrigemRecurso) or (cbPesquisarPor.EditValue = coPesquisaProjetoAlocado);
  cbPesquisaRubricas.Visible := cbPesquisarPor.EditValue = coPesquisaRubricaOrigemRecurso;
  cbPesquisaResponsavel.Visible := cbPesquisarPor.EditValue = coPesquisaResponsavelDespesa;
  cbPesquisaFundo.Visible := cbPesquisarPor.EditValue = coPesquisaFundo;
  EditPesquisa.Visible := EditPesquisa.Visible and
    (not(cbPesquisaFornecedor.Visible or cbPesquisaPlanoConta.Visible or
    cbPesquisaProjeto.Visible or cbPesquisaRubricas.Visible or cbPesquisaResponsavel.Visible or cbPesquisaFundo.Visible));

  if cbPesquisaFornecedor.Visible then
    Result := cbPesquisaFornecedor
  else if cbPesquisaPlanoConta.Visible then
    Result := cbPesquisaPlanoConta
  else if cbPesquisaProjeto.Visible then
    Result := cbPesquisaProjeto
  else if cbPesquisaRubricas.Visible then
    Result := cbPesquisaRubricas
  else if cbPesquisaResponsavel.Visible then
    Result := cbPesquisaResponsavel
  else if cbPesquisaFundo.Visible then
    Result := cbPesquisaFundo;
end;

function TfrmContaPagar.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoFinanceiro), Ord(finContaPagar));
end;

function TfrmContaPagar.fprHabilitarAlterarDetail: Boolean;
begin
  // nao chamar o inherited
  Result := False;
end;

function TfrmContaPagar.fprHabilitarSalvar: Boolean;
begin
  Result := inherited or fprHabilitarSalvarDetail or
    (dmFinanceiro.cdsConta_Pagar_Vinculo.Active and (dmFinanceiro.cdsConta_Pagar_Vinculo.ChangeCount > 0));
end;

{ TContaPagar }

procedure TContaPagar.SetIdCompra(const Value: Integer);
begin
  FIdCompra := Value;
end;

procedure TContaPagar.SetIdFornecedor(const Value: Integer);
begin
  FIdFornecedor := Value;
end;

procedure TContaPagar.SetIdResponsavel(const Value: Integer);
begin
  FIdResponsavel := Value;
end;

procedure TContaPagar.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

end.
