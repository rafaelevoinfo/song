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
  System.DateUtils, cxRadioGroup;

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
    cdsMovimentacao: TRFClientDataSet;
    cdsMovimentacaoID_MOVIMENTACAO: TIntegerField;
    cdsMovimentacaoID_ORGANIZACAO: TIntegerField;
    cdsMovimentacaoNOME_ORGANIZACAO: TStringField;
    cdsMovimentacaoTIPO_ORIGEM_RECURSO: TIntegerField;
    cdsMovimentacaoID_ORIGEM_RECURSO: TIntegerField;
    cdsMovimentacaoORIGEM_RECURSO: TStringField;
    cdsMovimentacaoTIPO: TIntegerField;
    cdsMovimentacaoDESCRICAO_TIPO: TStringField;
    cdsMovimentacaoDESCRICAO_MOVIMENTACAO: TStringField;
    cdsMovimentacaoVALOR_TOTAL: TBCDField;
    cdsMovimentacaoVALOR_PARCIAL: TBCDField;
    DBPipeMovimentacao: TppDBPipeline;
    dsMovimentacao: TDataSource;
    ppMovimentacao: TppReport;
    ppParameterList3: TppParameterList;
    cdsMovimentacaoVALOR: TBCDField;
    cdsMovimentacaoSALDO_GERAL: TBCDField;
    Label3: TLabel;
    cbProjetoMovimentacao: TcxLookupComboBox;
    chkTodosProjetosMovimentacao: TcxCheckBox;
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
    ppDBText20: TppDBText;
    ppGroupTipo: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    EditDescricaoTipo: TppDBText;
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
    cbFundoMovimentacao: TcxLookupComboBox;
    chkTodosFundoMovimentacao: TcxCheckBox;
    DBPipeSaldo: TppDBPipeline;
    dsSaldo: TDataSource;
    cbProjetoSaldo: TcxLookupComboBox;
    chkTodosProjetosSaldo: TcxCheckBox;
    chkTodosFundoSaldos: TcxCheckBox;
    cbFundoSaldo: TcxLookupComboBox;
    ppDBCalc4: TppDBCalc;
    ppLabelProjetoFundo: TppLabel;
    ppDBText27: TppDBText;
    cdsSaldoTIPO_ORIGEM: TIntegerField;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    chkReceitas: TcxCheckBox;
    chkDespesas: TcxCheckBox;
    chkSomenteTotais: TcxCheckBox;
    ppLabel20: TppLabel;
    cdsMovimentacaoVALOR_RESTANTE: TBCDField;
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
    cdsMovimentacaoVALOR_TOTAL_PAGO_RECEBIDO: TBCDField;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppShape2: TppShape;
    cdsMovimentacaoDATA_PAGAMENTO_RECEBIMENTO: TDateField;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    cdsMovimentacaoDESCRICAO_FORMA_PAGAMENTO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure Ac_GerarRelatorioExecute(Sender: TObject);
    procedure chkTodosSaldosProjetosPropertiesEditValueChanged(Sender: TObject);
    procedure chkSaldoTodosProjetoPropertiesEditValueChanged(Sender: TObject);
    procedure chkSaldoTodosFundoPropertiesEditValueChanged(Sender: TObject);
    procedure chkTodosFundoMovimentacaoPropertiesEditValueChanged(
      Sender: TObject);
    procedure chkTodosProjetoRubricasPropertiesEditValueChanged(
      Sender: TObject);
  private
    dmRelatorio: TdmRelatorio;
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
  vaSomenteRegistrosAberto: Boolean;
begin
  inherited;
  vaIdOrganizacao := fprExtrairValor(chkTodasOrganizacoes, cbOrganizacao, 'Informe a organização ou marque todas');

  if pcPrincipal.ActivePage = tabMovimentacao then
    begin
      vaIdProjeto := fprExtrairValor(chkTodosProjetosMovimentacao, cbProjetoMovimentacao, 'Informe o projeto, ou marque o todos.');
      vaIdFundo := fprExtrairValor(chkTodosFundoMovimentacao, cbFundoMovimentacao, 'Informe o fundo, ou marque o todos.');

      vaSomenteRegistrosAberto := chkSomenteRegistrosAbertos.Enabled and chkSomenteRegistrosAbertos.Checked;

      if cgbData.CheckBox.Checked then
        cdsMovimentacao.Data := dmPrincipal.FuncoesRelatorio.fpuMovimentacaoFinanceira(vaIdOrganizacao, vaIdProjeto, vaIdFundo,
          DateToStr(EditDataInicial.Date), DateToStr(EditDataFinal.Date), chkReceitas.Checked, chkDespesas.Checked, vaSomenteRegistrosAberto)
      else
        cdsMovimentacao.Data := dmPrincipal.FuncoesRelatorio.fpuMovimentacaoFinanceira(vaIdOrganizacao, vaIdProjeto, vaIdFundo, '', '',
          chkReceitas.Checked, chkDespesas.Checked, vaSomenteRegistrosAberto);

      cdsMovimentacao.IndexFieldNames := cdsMovimentacaoID_ORGANIZACAO.FieldName + ';' + cdsMovimentacaoTIPO_ORIGEM_RECURSO.FieldName + ';' +
        cdsMovimentacaoID_ORIGEM_RECURSO.FieldName + ';' +
        cdsMovimentacaoTIPO.FieldName;

      ppDetailBandMovimentacao.Visible := not chkSomenteTotais.Checked;
      ppLabelProjetoFundo.Visible := ppDetailBandMovimentacao.Visible;
      ppLabelDescricao.Visible := ppDetailBandMovimentacao.Visible;

      if cgbData.CheckBox.Checked then
        ppLbTituloMovimentacaoFinanceira.Caption := 'Movimentação Financeira - '+FormatDateTime('dd/mm/yyyy',EditDataInicial.Date)+ ' a '+FormatDateTime('dd/mm/yyyy',EditDataFinal.Date)
      else
        ppLbTituloMovimentacaoFinanceira.Caption := 'Movimentação Financeira';


      ppMovimentacao.PrintReport;
    end
  else
    if pcPrincipal.ActivePage = tabSaldos then
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

procedure TfrmRelatorioFinanceiro.chkTodosFundoMovimentacaoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbFundoMovimentacao.Enabled := not chkTodosFundoMovimentacao.Checked;
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

procedure TfrmRelatorioFinanceiro.FormCreate(Sender: TObject);
begin

  dmRelatorio := TdmRelatorio.Create(Self);
  dmRelatorio.Name := '';
  inherited;

  pcPrincipal.ActivePage := tabSaldos;

  dmLookup.cdslkProjeto.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);
  dmLookup.cdslkFundo.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);

  EditDataInicial.Date := IncDay(now, -30);
  EditDataFinal.Date := now;

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

end.
