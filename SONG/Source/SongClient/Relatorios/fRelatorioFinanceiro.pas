unit fRelatorioFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fRelatorioBasico, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, dmuPrincipal, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxPC, dmuLookup, uClientDataSet, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, dmuRelatorio, uExceptions, Data.DB, ppCtrls, ppPrnabl,
  ppBands, ppCache, ppDesignLayer, ppParameter, ppVar, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.Components, cxCheckBox, CodeSiteLogging,
  System.Bindings.Expression, System.Bindings.NotifierContracts, System.Bindings.NotifierDefaults,
  System.Bindings.Helper, ppChrt, ppChrtDP, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCalendar, cxGroupBox, dxCheckGroupBox, Datasnap.DBClient, ppModule, raCodMod,
  System.DateUtils, cxRadioGroup, cxImageComboBox, uTypes, uUtils,
  System.TypInfo, uControleAcesso;

type
  TfrmRelatorioFinanceiro = class(TfrmRelatorioBasico)
    pcPrincipal: TcxPageControl;
    tabSaldos: TcxTabSheet;
    tabSaldoRubrica: TcxTabSheet;
    tabMovimentacao: TcxTabSheet;
    cgbData: TdxCheckGroupBox;
    EditDataFinal: TcxDateEdit;
    lbDataInicial: TLabel;
    Label1: TLabel;
    EditDataInicial: TcxDateEdit;
    DBPipeMovimentacao: TppDBPipeline;
    dsView_Movimentacao_Financeira: TDataSource;
    ppMovimentacao: TppReport;
    ppParameterList3: TppParameterList;
    ppHeaderBand3: TppHeaderBand;
    ppLbTituloMovimentacaoFinanceira: TppLabel;
    ppDBImage3: TppDBImage;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppDetailBandMovimentacao: TppDetailBand;
    ppDBText19: TppDBText;
    ppDBText12: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLabel17: TppLabel;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppSystemVariable9: TppSystemVariable;
    ppGroupOrganizacao: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText18: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroupTipo: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppLabelDescricao: TppLabel;
    ppLabelValorPagoRecebido: TppLabel;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppDBCalc2: TppDBCalc;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppLabel22: TppLabel;
    ppDBText21: TppDBText;
    ppShape1: TppShape;
    raCodeModule1: TraCodeModule;
    ppDBCalc3: TppDBCalc;
    ppSaldo: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel23: TppLabel;
    ppDBImage4: TppDBImage;
    ppSystemVariable10: TppSystemVariable;
    ppSystemVariable11: TppSystemVariable;
    ppDetailBand4: TppDetailBand;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLabel24: TppLabel;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppSystemVariable12: TppSystemVariable;
    GrupoOrganizacao: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppShape3: TppShape;
    ppDBText30: TppDBText;
    ppGroupFooterBand5: TppGroupFooterBand;
    raCodeModule2: TraCodeModule;
    ppDesignLayers4: TppDesignLayers;
    ppDesignLayer4: TppDesignLayer;
    ppParameterList4: TppParameterList;
    cdsSaldo: TClientDataSet;
    cdsSaldoID_ORGANIZACAO: TIntegerField;
    cdsSaldoNOME_ORGANIZACAO: TStringField;
    cdsSaldoID_PROJETO_FUNDO: TIntegerField;
    cdsSaldoNOME_PROJETO_FUNDO: TStringField;
    cdsSaldoSALDO: TBCDField;
    cdsSaldoSALDO_GERAL: TBCDField;
    DBPipeSaldo: TppDBPipeline;
    dsSaldo: TDataSource;
    ppDBCalc4: TppDBCalc;
    cdsSaldoTIPO_ORIGEM: TIntegerField;
    chkReceitas: TcxCheckBox;
    chkDespesas: TcxCheckBox;
    chkSomenteTotais: TcxCheckBox;
    ppLabel20: TppLabel;
    ppDBText24: TppDBText;
    ppDBCalc5: TppDBCalc;
    chkSomenteRegistrosAbertos: TcxCheckBox;
    lb1: TLabel;
    cbProjetoRubrica: TcxLookupComboBox;
    chkTodosProjetosRubricas: TcxCheckBox;
    ppSaldoRubrica: TppReport;
    ppParameterList1: TppParameterList;
    DBPipeRubrica: TppDBPipeline;
    DBPipeOrganizacao: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppDBImage1: TppDBImage;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText9: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel2: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppSystemVariable3: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText8: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    raCodeModule3: TraCodeModule;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppShape2: TppShape;
    lbDataPagamentoRecebimento: TppLabel;
    lbFormaPagamento: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    cgbProjetoMovimentacao: TdxCheckGroupBox;
    cbProjetoMovimentacao: TcxLookupComboBox;
    chkTodosProjetosMovimentacao: TcxCheckBox;
    cgbFundoMovimentacao: TdxCheckGroupBox;
    cbFundoMovimentacao: TcxLookupComboBox;
    chkTodosFundoMovimentacao: TcxCheckBox;
    cgbProjetoSaldo: TdxCheckGroupBox;
    cbProjetoSaldo: TcxLookupComboBox;
    chkTodosProjetosSaldo: TcxCheckBox;
    cgbFundoSaldo: TdxCheckGroupBox;
    cbFundoSaldo: TcxLookupComboBox;
    chkTodosFundoSaldos: TcxCheckBox;
    tabGastoAreaAtuacao: TcxTabSheet;
    cgbDataGasto: TdxCheckGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    EditDataFinalGasto: TcxDateEdit;
    EditDataInicialGasto: TcxDateEdit;
    DBPipeGasto_Area_Atuacao: TppDBPipeline;
    ppGasto_Area_Atuacao: TppReport;
    ppParameterList2: TppParameterList;
    dsGasto_Area_Atuacao: TDataSource;
    ppHeaderBand2: TppHeaderBand;
    ppLabel12: TppLabel;
    ppDBImage2: TppDBImage;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppDetailBand2: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel13: TppLabel;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppSystemVariable6: TppSystemVariable;
    raCodeModule4: TraCodeModule;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppSummaryBand1: TppSummaryBand;
    ppLabel14: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel18: TppLabel;
    ppDBText17: TppDBText;
    tabTransferenciaRecurso: TcxTabSheet;
    cgbDataTransferenciaRecurso: TdxCheckGroupBox;
    lb3: TLabel;
    lb4: TLabel;
    EditDataInicialTransfRecurso: TcxDateEdit;
    EditDataFinalTransfRecurso: TcxDateEdit;
    cbTipoTransferencia: TcxImageComboBox;
    Label5: TLabel;
    chkTodosTransferencia: TcxCheckBox;
    DBPipeTransferencia: TppDBPipeline;
    dsTransferencia: TDataSource;
    ppTransferencia: TppReport;
    ppParameterList5: TppParameterList;
    Label4: TLabel;
    cbPessoaTransferencia: TcxLookupComboBox;
    ppHeaderBand5: TppHeaderBand;
    ppLabel19: TppLabel;
    ppDBImage5: TppDBImage;
    ppSystemVariable13: TppSystemVariable;
    ppSystemVariable14: TppSystemVariable;
    ppDetailBand3: TppDetailBand;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLabel27: TppLabel;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppSystemVariable15: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppShape4: TppShape;
    ppDBText36: TppDBText;
    ppLabel26: TppLabel;
    ppLabel21: TppLabel;
    ppLabel25: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel28: TppLabel;
    ppDBCalc6: TppDBCalc;
    raCodeModule5: TraCodeModule;
    ppDesignLayers5: TppDesignLayers;
    ppDesignLayer5: TppDesignLayer;
    ppLabel31: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppGroup3: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    EditOrigemRecurso: TppGroupFooterBand;
    EditOrigemRecurso1: TppDBText;
    ppDBText27: TppDBText;
    tabGastoFornecedor: TcxTabSheet;
    cbFornecedor: TcxLookupComboBox;
    chkTodosFornecedor: TcxCheckBox;
    cgbDataGastoFornecedor: TdxCheckGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    EditDataInicialFornecedor: TcxDateEdit;
    EditDataFinalFornecedor: TcxDateEdit;
    Label8: TLabel;
    DBPipeGasto_Fornecedor: TppDBPipeline;
    dsGasto_Fornecedor: TDataSource;
    ppGasto_Fornecedor: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel10: TppLabel;
    ppDBImage6: TppDBImage;
    ppSystemVariable16: TppSystemVariable;
    ppSystemVariable17: TppSystemVariable;
    ppLabel11: TppLabel;
    ppLabel32: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLabel34: TppLabel;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppSystemVariable18: TppSystemVariable;
    ppSummaryBand3: TppSummaryBand;
    ppDBCalc8: TppDBCalc;
    raCodeModule6: TraCodeModule;
    ppDesignLayers6: TppDesignLayers;
    ppDesignLayer6: TppDesignLayer;
    ppParameterList6: TppParameterList;
    ppGroup4: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppShape5: TppShape;
    ppLabel33: TppLabel;
    ppDBText44: TppDBText;
    tabGastoAtividade: TcxTabSheet;
    cbProjetoGastoAtividade: TcxLookupComboBox;
    Label9: TLabel;
    cbAtividadeGastoAtividade: TcxLookupComboBox;
    lb5: TLabel;
    chkTodasAtividades: TcxCheckBox;
    dsGasto_Atividade: TDataSource;
    DBPipeGasto_Atividade: TppDBPipeline;
    ppGasto_Atividade: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel36: TppLabel;
    ppDBImage7: TppDBImage;
    ppSystemVariable19: TppSystemVariable;
    ppSystemVariable20: TppSystemVariable;
    ppDetailBand6: TppDetailBand;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppLabel37: TppLabel;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppSystemVariable21: TppSystemVariable;
    ppSummaryBand4: TppSummaryBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppShape6: TppShape;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppDBText50: TppDBText;
    ppLabel40: TppLabel;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppLabel41: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppDesignLayers7: TppDesignLayers;
    ppDesignLayer7: TppDesignLayer;
    ppParameterList7: TppParameterList;
    ppLbProjetoGastoAtividade: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppLabel44: TppLabel;
    ppDBText53: TppDBText;
    tabGastoPlanoContas: TcxTabSheet;
    cgbProjetoGastoPlanoConta: TdxCheckGroupBox;
    cbProjetoPlanoConta: TcxLookupComboBox;
    chkTodosProjetoPlanoContas: TcxCheckBox;
    cgbFundoPlanoConta: TdxCheckGroupBox;
    cbFundoPlanoConta: TcxLookupComboBox;
    chkTodosFundoPlanoContas: TcxCheckBox;
    cbPlanoConta: TcxLookupComboBox;
    Label10: TLabel;
    chkTodosPlanoConta: TcxCheckBox;
    dsGasto_Plano_Contas: TDataSource;
    DBPipeGasto_Plano_Contas: TppDBPipeline;
    ppGasto_Plano_Contas: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppLabel45: TppLabel;
    ppDBImage8: TppDBImage;
    ppSystemVariable22: TppSystemVariable;
    ppSystemVariable23: TppSystemVariable;
    ppDetailBand7: TppDetailBand;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppLabel47: TppLabel;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppSystemVariable24: TppSystemVariable;
    ppSummaryBand5: TppSummaryBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppShape7: TppShape;
    ppLabel48: TppLabel;
    ppDBText62: TppDBText;
    ppLabel53: TppLabel;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppDBCalc10: TppDBCalc;
    ppDesignLayers8: TppDesignLayers;
    ppDesignLayer8: TppDesignLayer;
    ppParameterList8: TppParameterList;
    ppGroup7: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppLabel50: TppLabel;
    ppDBText63: TppDBText;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    chkGastoPlanoContasDetalhado: TcxCheckBox;
    dsGasto_Plano_Contas_Detalhado: TDataSource;
    DBPipeGasto_Plano_Contas_Detalhado: TppDBPipeline;
    ppGasto_Plano_Contas_Detalhado: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel35: TppLabel;
    ppDBImage9: TppDBImage;
    ppSystemVariable25: TppSystemVariable;
    ppSystemVariable26: TppSystemVariable;
    ppDetailBand8: TppDetailBand;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppLabel46: TppLabel;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppSystemVariable27: TppSystemVariable;
    ppSummaryBand6: TppSummaryBand;
    ppGroup8: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppShape8: TppShape;
    ppDBText66: TppDBText;
    ppGroupFooterBand10: TppGroupFooterBand;
    ppGroup9: TppGroup;
    ppGroupHeaderBand12: TppGroupHeaderBand;
    ppLabel49: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppDBText67: TppDBText;
    ppGroupFooterBand11: TppGroupFooterBand;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDesignLayers9: TppDesignLayers;
    ppDesignLayer9: TppDesignLayer;
    ppParameterList9: TppParameterList;
    ppGroup10: TppGroup;
    ppGroupHeaderBand13: TppGroupHeaderBand;
    ppGroupFooterBand12: TppGroupFooterBand;
    ppDBText68: TppDBText;
    ppDBCalc15: TppDBCalc;
    procedure FormCreate(Sender: TObject);
    procedure Ac_GerarRelatorioExecute(Sender: TObject);
    procedure chkTodosSaldosProjetosPropertiesEditValueChanged(Sender: TObject);
    procedure chkSaldoTodosProjetoPropertiesEditValueChanged(Sender: TObject);
    procedure chkSaldoTodosFundoPropertiesEditValueChanged(Sender: TObject);
    procedure chkTodosFundoMovimentacaoPropertiesEditValueChanged(
      Sender: TObject);
    procedure chkTodosProjetoRubricasPropertiesEditValueChanged(
      Sender: TObject);
    procedure chkTodosTransferenciaPropertiesEditValueChanged(Sender: TObject);
    procedure tabTransferenciaRecursoShow(Sender: TObject);
    procedure cgbProjetoSaldoPropertiesEditValueChanged(Sender: TObject);
    procedure chkTodosFornecedorPropertiesEditValueChanged(Sender: TObject);
    procedure tabGastoFornecedorShow(Sender: TObject);
    procedure chkTodasAtividadesPropertiesEditValueChanged(Sender: TObject);
    procedure cbProjetoGastoAtividadePropertiesEditValueChanged(
      Sender: TObject);
    procedure chkTodosPlanoContaPropertiesEditValueChanged(Sender: TObject);
    procedure chkTodosFundoPlanoContasPropertiesEditValueChanged(
      Sender: TObject);
    procedure chkTodosProjetoPlanoContasPropertiesEditValueChanged(
      Sender: TObject);
    procedure tabGastoPlanoContasShow(Sender: TObject);
  private
    procedure ppvGerarRelatorioGastoAreaAtuacao;
    procedure ppvGerarRelatorioTransferenciaRecurso;
    procedure ppvGerarlRelatorioGastoFornecedor;
    procedure ppvGerarRelatorioGastoAtividade;
    procedure ppvGerarRelatorioGastoPlanoContas;
  protected
    function fprGetPermissao: String; override;
  public
    { Public declarations }
  end;

var
  frmRelatorioFinanceiro: TfrmRelatorioFinanceiro;

implementation

{$R *.dfm}


procedure TfrmRelatorioFinanceiro.Ac_GerarRelatorioExecute(Sender: TObject);
var
  vaIdOrganizacao, vaIdProjeto, vaIdFundo: Integer;
  vaTipos: String;
begin
  inherited;
  vaIdOrganizacao := fprExtrairValor(chkTodasOrganizacoes, cbOrganizacao, 'Informe a organização ou marque todas');

  if pcPrincipal.ActivePage = tabMovimentacao then
    begin
      vaIdProjeto := fprExtrairValor(chkTodosProjetosMovimentacao, cbProjetoMovimentacao, 'Informe o projeto, ou marque o todos.');
      vaIdFundo := fprExtrairValor(chkTodosFundoMovimentacao, cbFundoMovimentacao, 'Informe o fundo, ou marque o todos.');

      dmRelatorio.cdsView_Movimentacao_Financeira.ppuLimparParametros;
      if vaIdOrganizacao <> 0 then
        dmRelatorio.cdsView_Movimentacao_Financeira.ppuAddParametro(TParametros.coOrganizacao, vaIdOrganizacao);
      if vaIdProjeto <> 0 then
        dmRelatorio.cdsView_Movimentacao_Financeira.ppuAddParametro(TParametros.coProjeto, vaIdProjeto);
      if vaIdFundo <> 0 then
        dmRelatorio.cdsView_Movimentacao_Financeira.ppuAddParametro(TParametros.coFundo, vaIdFundo);

      if cgbData.CheckBox.Checked then
        dmRelatorio.cdsView_Movimentacao_Financeira.ppuAddParametro(TParametros.coData, TUtils.fpuMontarDataBetween(EditDataInicial.Date, EditDataFinal.Date));

      vaTipos := '';
      if chkReceitas.Checked then
        vaTipos := Ord(tmReceita).ToString;

      if chkDespesas.Checked then
        begin
          if vaTipos <> '' then
            vaTipos := vaTipos + coDelimitadorPadrao + Ord(tmDespesa).ToString
          else
            vaTipos := Ord(tmDespesa).ToString;
        end;

      if vaTipos <> '' then
        dmRelatorio.cdsView_Movimentacao_Financeira.ppuAddParametro(TParametros.coTipo, vaTipos);

      if chkSomenteRegistrosAbertos.Enabled and chkSomenteRegistrosAbertos.Checked then
        dmRelatorio.cdsView_Movimentacao_Financeira.ppuAddParametro(TParametros.coAberto, 'NAO_IMPORTA');
      // if cgbData.CheckBox.Checked then
      // cdsMovimentacao.Data := dmPrincipal.FuncoesRelatorio.fpuMovimentacaoFinanceira(vaIdOrganizacao, vaIdProjeto, vaIdFundo,
      // DateToStr(EditDataInicial.Date), DateToStr(EditDataFinal.Date), chkReceitas.Checked, chkDespesas.Checked, vaSomenteRegistrosAberto)
      // else
      // cdsMovimentacao.Data := dmPrincipal.FuncoesRelatorio.fpuMovimentacaoFinanceira(vaIdOrganizacao, vaIdProjeto, vaIdFundo, '', '',
      // chkReceitas.Checked, chkDespesas.Checked, vaSomenteRegistrosAberto);
      //

      dmRelatorio.cdsView_Movimentacao_Financeira.ppuDataRequest();

      ppDetailBandMovimentacao.Visible := not chkSomenteTotais.Checked;
      lbFormaPagamento.Visible := ppDetailBandMovimentacao.Visible;
      lbDataPagamentoRecebimento.Visible := ppDetailBandMovimentacao.Visible;
      ppLabelDescricao.Visible := ppDetailBandMovimentacao.Visible;

      if cgbData.CheckBox.Checked then
        ppLbTituloMovimentacaoFinanceira.Caption := 'Movimentação Financeira - ' + FormatDateTime('dd/mm/yyyy', EditDataInicial.Date) + ' a ' +
          FormatDateTime('dd/mm/yyyy', EditDataFinal.Date)
      else
        ppLbTituloMovimentacaoFinanceira.Caption := 'Movimentação Financeira';

      ppMovimentacao.PrintReport;
    end
  else if pcPrincipal.ActivePage = tabSaldos then
    begin
      vaIdProjeto := fprExtrairValor(chkTodosProjetosSaldo, cbProjetoSaldo, 'Informe o projeto, ou marque o todos.');
      vaIdFundo := fprExtrairValor(chkTodosFundoSaldos, cbFundoSaldo, 'Informe o fundo, ou marque o todos.');

      cdsSaldo.Data := dmPrincipal.FuncoesRelatorio.fpuSaldo(vaIdOrganizacao, vaIdProjeto, vaIdFundo);

      ppSaldo.PrintReport;
    end
  else if pcPrincipal.ActivePage = tabSaldoRubrica then
    begin
      vaIdProjeto := fprExtrairValor(chkTodosProjetosRubricas, cbProjetoRubrica, 'Informe o projeto, ou marque o todos.');

      dmRelatorio.cdsSaldo_Rubrica.Close;
      if vaIdProjeto <> 0 then
        dmRelatorio.cdsSaldo_Rubrica.ParamByName('ID_PROJETO').AsInteger := vaIdProjeto
      else
        dmRelatorio.cdsSaldo_Rubrica.ParamByName('ID_PROJETO').Clear;

      dmRelatorio.cdsSaldo_Rubrica.Open;

      ppSaldoRubrica.PrintReport;
    end
  else if pcPrincipal.ActivePage = tabGastoAreaAtuacao then
    begin
      ppvGerarRelatorioGastoAreaAtuacao;
    end
  else if pcPrincipal.ActivePage = tabTransferenciaRecurso then
    begin
      ppvGerarRelatorioTransferenciaRecurso;
    end
  else if pcPrincipal.ActivePage = tabGastoFornecedor then
    ppvGerarlRelatorioGastoFornecedor
  else if pcPrincipal.ActivePage = tabGastoAtividade then
    ppvGerarRelatorioGastoAtividade
  else if pcPrincipal.ActivePage = tabGastoPlanoContas then
    ppvGerarRelatorioGastoPlanoContas;

end;

procedure TfrmRelatorioFinanceiro.ppvGerarRelatorioGastoPlanoContas;
var
  vaIdProjeto, vaIdFundo, vaIdPlanoContas: Integer;
  vaCds: TRFClientDataSet;
  vaReport: TppReport;
begin
  if chkGastoPlanoContasDetalhado.Checked then
    begin
      vaCds := dmRelatorio.cdsGasto_Plano_Contas_Detalhado;
      vaReport := ppGasto_Plano_Contas_Detalhado;
    end
  else
    begin
      vaCds := dmRelatorio.cdsGasto_Plano_Contas;
      vaReport := ppGasto_Plano_Contas;
    end;

  vaCds.ppuLimparParametros;

  vaIdProjeto := fprExtrairValor(chkTodosProjetoPlanoContas, cbProjetoPlanoConta, 'Informe o projeto');
  vaIdFundo := fprExtrairValor(chkTodosFundoPlanoContas, cbFundoPlanoConta, 'Informe a conta');

  if (vaIdProjeto > 0) and (vaIdFundo > 0) then
    vaCds.ppuAddParametros([TParametros.coProjeto, TParametros.coFundo], [vaIdProjeto, vaIdFundo], TOperadores.coOR)
  else
    begin
      if vaIdFundo <> 0 then
        vaCds.ppuAddParametro(TParametros.coFundo, vaIdFundo);

      if (vaIdProjeto <> 0) then
        vaCds.ppuAddParametro(TParametros.coProjeto, vaIdProjeto);
    end;

  vaIdPlanoContas := fprExtrairValor(chkTodosPlanoConta, cbPlanoConta, 'Informe o plano de contas');
  if vaIdPlanoContas > 0 then
    vaCds.ppuAddParametro(TParametros.coPlanoConta, vaIdPlanoContas);

  if vaCds.Parametros.Count = 0 then
    vaCds.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'])
  else
    vaCds.ppuDataRequest();

  vaReport.PrintReport;
end;

procedure TfrmRelatorioFinanceiro.ppvGerarRelatorioGastoAtividade;
var
  vaIdAtividade: Integer;
begin
  if VarIsNull(cbProjetoGastoAtividade.EditValue) then
    raise Exception.Create('Informe o projeto');

  vaIdAtividade := fprExtrairValor(chkTodasAtividades, cbAtividadeGastoAtividade, 'Informe a atividade ou marque o todas.');

  dmRelatorio.cdsGasto_Atividade.ppuLimparParametros;
  dmRelatorio.cdsGasto_Atividade.ppuAddParametro(TParametros.coProjeto, cbProjetoGastoAtividade.EditValue);
  if vaIdAtividade <> 0 then
    dmRelatorio.cdsGasto_Atividade.ppuAddParametro(TParametros.coAtividade, vaIdAtividade);

  dmRelatorio.cdsGasto_Atividade.ppuDataRequest();
  ppLbProjetoGastoAtividade.Text := 'Projeto: ' + cbProjetoGastoAtividade.Text;

  ppGasto_Atividade.PrintReport;
end;

procedure TfrmRelatorioFinanceiro.ppvGerarlRelatorioGastoFornecedor;
begin
  dmRelatorio.cdsGasto_Fornecedor.ppuLimparParametros;
  if cgbDataGastoFornecedor.CheckBox.Checked then
    begin
      dmRelatorio.cdsGasto_Fornecedor.ppuAddParametro(TParametros.coData, TUtils.fpuMontarDataBetween(EditDataInicialFornecedor.Date,
        EditDataFinalFornecedor.Date));
    end;

  if (not chkTodosFornecedor.Checked) and (Not VarIsNull(cbFornecedor.EditValue)) then
    dmRelatorio.cdsGasto_Fornecedor.ppuAddParametro(TParametros.coFornecedor, cbFornecedor.EditValue);

  if dmRelatorio.cdsGasto_Fornecedor.Parametros.Count = 0 then
    dmRelatorio.cdsGasto_Fornecedor.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'])
  else
    dmRelatorio.cdsGasto_Fornecedor.ppuDataRequest();

  ppGasto_Fornecedor.PrintReport;
end;

procedure TfrmRelatorioFinanceiro.ppvGerarRelatorioTransferenciaRecurso;
begin
  dmRelatorio.cdsTrasnferencia_Financeira.ppuLimparParametros;
  if cgbDataTransferenciaRecurso.CheckBox.Checked then
    dmRelatorio.cdsTrasnferencia_Financeira.ppuAddParametro(TParametros.coData, TUtils.fpuMontarDataBetween(EditDataInicialTransfRecurso.Date,
      EditDataFinalTransfRecurso.Date))
  else
    dmRelatorio.cdsTrasnferencia_Financeira.ppuAddParametro(TParametros.coData, TUtils.fpuMontarDataBetween(0, EncodeDate(9999, 12, 31)));

  if (not chkTodosTransferencia.Checked) and (Not VarIsNull(cbTipoTransferencia.EditValue)) then
    dmRelatorio.cdsTrasnferencia_Financeira.ppuAddParametro(TParametros.coTipo, cbTipoTransferencia.EditValue);

  if (Not VarIsNull(cbPessoaTransferencia.EditValue)) then
    dmRelatorio.cdsTrasnferencia_Financeira.ppuAddParametro(TParametros.coPessoa, cbPessoaTransferencia.EditValue);

  dmRelatorio.cdsTrasnferencia_Financeira.ppuDataRequest();
  ppTransferencia.PrintReport;

end;

procedure TfrmRelatorioFinanceiro.ppvGerarRelatorioGastoAreaAtuacao;
begin

  dmRelatorio.cdsGasto_Area_Atuacao.Close;
  dmRelatorio.cdsGasto_Area_Atuacao.ParamByName('TODAS_DATAS').Clear;
  dmRelatorio.cdsGasto_Area_Atuacao.ParamByName('DATA_INICIAL').Clear;
  dmRelatorio.cdsGasto_Area_Atuacao.ParamByName('DATA_FINAL').Clear;

  if cgbDataGasto.CheckBox.Checked then
    begin
      dmRelatorio.cdsGasto_Area_Atuacao.ParamByName('DATA_INICIAL').AsDateTime := EditDataInicialGasto.Date;
      dmRelatorio.cdsGasto_Area_Atuacao.ParamByName('DATA_FINAL').AsDateTime := EditDataFinalGasto.Date;
    end
  else
    dmRelatorio.cdsGasto_Area_Atuacao.ParamByName('TODAS_DATAS').AsInteger := 1;

  dmRelatorio.cdsGasto_Area_Atuacao.Open;

  ppGasto_Area_Atuacao.PrintReport;
end;

procedure TfrmRelatorioFinanceiro.tabGastoFornecedorShow(Sender: TObject);
begin
  inherited;
  if not dmLookup.cdslkFornecedor.Active then
    dmLookup.cdslkFornecedor.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, false);
end;

procedure TfrmRelatorioFinanceiro.tabGastoPlanoContasShow(Sender: TObject);
begin
  inherited;
  if not dmLookup.cdslkPlano_Contas.Active then
    dmLookup.cdslkPlano_Contas.ppuDataRequest([TParametros.coTipo], [0], TOperadores.coAnd, true); // tipo despesa
end;

procedure TfrmRelatorioFinanceiro.tabTransferenciaRecursoShow(Sender: TObject);
begin
  inherited;
  if not dmLookup.cdslkPessoa.Active then
    dmLookup.ppuCarregarPessoas(0, [trpFuncionario, trpMembroDiretoria]);
end;

procedure TfrmRelatorioFinanceiro.cbProjetoGastoAtividadePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  dmLookup.cdslkAtividade.Close;
  if not VarIsNull(cbProjetoGastoAtividade.EditValue) then
    dmLookup.cdslkAtividade.ppuDataRequest([TParametros.coProjeto], [cbProjetoGastoAtividade.EditValue], TOperadores.coAnd, true);
end;

procedure TfrmRelatorioFinanceiro.cgbProjetoSaldoPropertiesEditValueChanged(
  Sender: TObject);
var
  i: Integer;
begin
  inherited;
  if Sender is TdxCheckGroupBox then
    begin
      if TdxCheckGroupBox(Sender).CheckBox.Checked then
        begin
          for i := 0 to TdxCheckGroupBox(Sender).ControlCount - 1 do
            begin
              // vamos desmacar o checkTdos pq o combo acabou de ser habilitado pelo TdxCheckGroupBox
              if TdxCheckGroupBox(Sender).Controls[i] is TcxCheckBox then
                TcxCheckBox(TdxCheckGroupBox(Sender).Controls[i]).Checked := false;
            end;
        end;
    end;
end;

procedure TfrmRelatorioFinanceiro.chkSaldoTodosFundoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbFundoSaldo.Enabled := not chkTodosFundoSaldos.Checked
end;

procedure TfrmRelatorioFinanceiro.chkSaldoTodosProjetoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbProjetoSaldo.Enabled := not chkTodosProjetosSaldo.Checked;
end;

procedure TfrmRelatorioFinanceiro.chkTodasAtividadesPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbAtividadeGastoAtividade.Enabled := not chkTodasAtividades.Checked;
end;

procedure TfrmRelatorioFinanceiro.chkTodosFornecedorPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbFornecedor.Enabled := not chkTodosFornecedor.Checked;
end;

procedure TfrmRelatorioFinanceiro.chkTodosFundoMovimentacaoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbFundoMovimentacao.Enabled := not chkTodosFundoMovimentacao.Checked;
end;

procedure TfrmRelatorioFinanceiro.chkTodosFundoPlanoContasPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbFundoPlanoConta.Enabled := not chkTodosFundoPlanoContas.Checked;
end;

procedure TfrmRelatorioFinanceiro.chkTodosPlanoContaPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbPlanoConta.Enabled := not chkTodosPlanoConta.Checked;
end;

procedure TfrmRelatorioFinanceiro.chkTodosProjetoPlanoContasPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbProjetoPlanoConta.Enabled := not chkTodosProjetoPlanoContas.Checked;
end;

procedure TfrmRelatorioFinanceiro.chkTodosProjetoRubricasPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbProjetoRubrica.Enabled := not chkTodosProjetosRubricas.Checked;
end;

procedure TfrmRelatorioFinanceiro.chkTodosSaldosProjetosPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbProjetoMovimentacao.Enabled := not chkTodosProjetosMovimentacao.Checked;
end;

procedure TfrmRelatorioFinanceiro.chkTodosTransferenciaPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbTipoTransferencia.Enabled := not chkTodosTransferencia.Checked;
end;

procedure TfrmRelatorioFinanceiro.FormCreate(Sender: TObject);
begin
  inherited;

  pcPrincipal.ActivePage := tabSaldos;

  dmLookup.cdslkProjeto.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);
  dmLookup.cdslkFundo.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);

  EditDataInicial.Date := IncDay(now, -30);
  EditDataFinal.Date := now;

  EditDataInicialGasto.Date := IncDay(now, -30);
  EditDataFinalGasto.Date := now;

  EditDataInicialFornecedor.Date := IncDay(now, -30);
  EditDataFinalFornecedor.Date := now;

  EditDataInicialTransfRecurso.Date := IncDay(now, -30);
  EditDataFinalTransfRecurso.Date := now;

  if dmLookup.cdslkProjeto.RecordCount > 0 then
    begin
      cbProjetoMovimentacao.EditValue := dmLookup.cdslkProjetoID.AsInteger;
      cbProjetoMovimentacao.PostEditValue;

      cbProjetoSaldo.EditValue := dmLookup.cdslkProjetoID.AsInteger;
      cbProjetoSaldo.PostEditValue;
    end;

  if dmLookup.cdslkFundo.RecordCount > 0 then
    begin
      cbFundoMovimentacao.EditValue := dmLookup.cdslkFundoID.AsInteger;
      cbFundoMovimentacao.PostEditValue;

      cbFundoSaldo.EditValue := dmLookup.cdslkFundoID.AsInteger;
      cbFundoSaldo.PostEditValue;
    end;

end;

function TfrmRelatorioFinanceiro.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoRelatorio), Ord(relFinanceiro));
end;

end.
