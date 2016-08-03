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
  System.DateUtils, cxRadioGroup, cxImageComboBox, uTypes, uUtils;

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
    lbDataPagamentoRecebimento: TppLabel;
    lbFormaPagamento: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    cdsMovimentacaoDESCRICAO_FORMA_PAGAMENTO: TStringField;
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
    cdsMovimentacaoTIPO_ORIGEM: TIntegerField;
    tabGastoAreaAtuacao: TcxTabSheet;
    cgbDataGasto: TdxCheckGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    EditDataFinalGasto: TcxDateEdit;
    EditDataInicialGasto: TcxDateEdit;
    DBPipeGastoAreaAtuacao: TppDBPipeline;
    ppGastoAreaAtuacao: TppReport;
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
    cdsMovimentacaoID_UNICO_ORIGEM_RECURSO: TStringField;
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
  private
    procedure ppvGerarRelatorioGastoAreaAtuacao;
    procedure ppvGerarRelatorioTransferenciaRecurso;
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

      cdsMovimentacao.IndexFieldNames := cdsMovimentacaoID_ORGANIZACAO.FieldName + ';' +
        cdsMovimentacaoID_UNICO_ORIGEM_RECURSO.FieldName+';'+ cdsMovimentacaoTIPO.FieldName + ';' +
        cdsMovimentacaoDATA_PAGAMENTO_RECEBIMENTO.FieldName;

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
    end;
end;

procedure TfrmRelatorioFinanceiro.ppvGerarRelatorioTransferenciaRecurso;
begin
  dmRelatorio.cdsTrasnferencia_Financeira.ppuLimparParametros;
  if cgbDataTransferenciaRecurso.CheckBox.Checked then
    dmRelatorio.cdsTrasnferencia_Financeira.ppuAddParametro(TParametros.coData,TUtils.fpuMontarDataBetween(EditDataInicialTransfRecurso.Date,EditDataFinalTransfRecurso.Date))
  else
    dmRelatorio.cdsTrasnferencia_Financeira.ppuAddParametro(TParametros.coData,TUtils.fpuMontarDataBetween(0,EncodeDate(9999,12,31)));

  if (not chkTodosTransferencia.Checked) and (Not VarIsNull(cbTipoTransferencia.EditValue)) then
    dmRelatorio.cdsTrasnferencia_Financeira.ppuAddParametro(TParametros.coTipo,cbTipoTransferencia.EditValue);

  if (Not VarIsNull(cbPessoaTransferencia.EditValue)) then
    dmRelatorio.cdsTrasnferencia_Financeira.ppuAddParametro(TParametros.coPessoa,cbPessoaTransferencia.EditValue);

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

  ppGastoAreaAtuacao.PrintReport;
end;

procedure TfrmRelatorioFinanceiro.tabTransferenciaRecursoShow(Sender: TObject);
begin
  inherited;
  if not dmLookup.cdslkPessoa.Active then
    dmLookup.ppuCarregarPessoas(0,[trpFuncionario,trpMembroDiretoria]);
end;

procedure TfrmRelatorioFinanceiro.cgbProjetoSaldoPropertiesEditValueChanged(
  Sender: TObject);
var
  i:Integer;
begin
  inherited;
  if Sender is TdxCheckGroupBox then
    begin
      if TdxCheckGroupBox(Sender).CheckBox.Checked then
        begin
          for I := 0 to TdxCheckGroupBox(Sender).ControlCount-1 do
            begin
              //vamos desmacar o checkTdos pq o combo acabou de ser habilitado pelo TdxCheckGroupBox
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

end.
