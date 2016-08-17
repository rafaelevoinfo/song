unit fRelatorioViveiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fRelatorioBasico, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, Data.DB, System.Actions, Vcl.ActnList, cxCheckBox,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Vcl.StdCtrls, Vcl.ExtCtrls, dmuLookup, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxPC, dmuRelatorio, ppDB, ppDBPipe, ppParameter,
  ppDesignLayer, ppModule, raCodMod, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, uClientDataSet, uTypes,
  dmuPrincipal, fmGrids, Datasnap.DBClient, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCalendar, uMensagem, uExceptions, System.DateUtils,
  System.Generics.Collections, uUtils, aduna_ds_list, cxGroupBox,
  dxCheckGroupBox;

type
  TfrmRelatorioViveiro = class(TfrmRelatorioBasico)
    pcPrincipal: TcxPageControl;
    tabSaldos: TcxTabSheet;
    Label2: TLabel;
    cbSaldoEspecie: TcxLookupComboBox;
    chkSaldoTodasEspecies: TcxCheckBox;
    ppSaldo_Especie: TppReport;
    ppParameterList4: TppParameterList;
    DBPipeSaldoEspecie: TppDBPipeline;
    DBPipeOrganizacao: TppDBPipeline;
    tabPrevisaoProducao: TcxTabSheet;
    frameEspecies: TframeGrids;
    pnConfiguracoesPrevisao: TPanel;
    btnInformacao: TButton;
    Ac_Informacao_Previsao_Producao: TAction;
    EditDataPrevisao: TcxDateEdit;
    Label1: TLabel;
    Label3: TLabel;
    cdsEspecieSelecionada: TRFClientDataSet;
    cdsEspecieSelecionadaID: TIntegerField;
    cdsEspecieSelecionadaNOME: TStringField;
    cdsEspecieSelecionadaNOME_CIENTIFICO: TStringField;
    cdsEspecieSelecionadaFAMILIA_BOTANICA: TStringField;
    cdsEspecieSelecionadaTEMPO_GERMINACAO: TIntegerField;
    cdsEspecieSelecionadaTEMPO_DESENVOLVIMENTO: TIntegerField;
    cdsEspecieSelecionadaTAXA_CLASSIFICACAO: TBCDField;
    cdsEspecieSelecionadaTAXA_GERMINACAO: TBCDField;
    cdsEspecieSelecionadaQTDE_MUDA_PRONTA: TIntegerField;
    cdsEspecieSelecionadaQTDE_MUDA_DESENVOLVIMENTO: TIntegerField;
    ppPrevisao_Producao: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel6: TppLabel;
    ppDBImage1: TppDBImage;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLine2: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel12: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppSystemVariable3: TppSystemVariable;
    raCodeModule1: TraCodeModule;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    cdsParametros: TClientDataSet;
    DBPipePrevisaoProducao: TppDBPipeline;
    cdsParametrosDATA_PREVISAO: TDateField;
    DBPipeParametros: TppDBPipeline;
    dsParametros: TDataSource;
    ppDBText8: TppDBText;
    cdsEspecieSelecionadaQTDE_SEMENTE_ESTOQUE: TBCDField;
    cdsEspecieSelecionadaQTDE_SEMENTE_KILO: TIntegerField;
    cdsPrevisaoProducao: TRFClientDataSet;
    cdsPrevisaoProducaoID: TIntegerField;
    cdsPrevisaoProducaoNOME: TStringField;
    cdsPrevisaoProducaoNOME_CIENTIFICO: TStringField;
    cdsPrevisaoProducaoFAMILIA_BOTANICA: TStringField;
    cdsPrevisaoProducaoQTDE_MUDA_PRONTA: TIntegerField;
    cdsPrevisaoProducaoQTDE_MUDA_DESENVOLVIMENTO: TIntegerField;
    cdsPrevisaoProducaoQTDE_SEMENTE_ESTOQUE: TBCDField;
    cdsPrevisaoProducaoQTDE_SEMENTE_KILO: TIntegerField;
    dsPrevisaoProducao: TDataSource;
    tabProducaoMatriz: TcxTabSheet;
    lb1: TLabel;
    cbEspecieMatrizProdutiva: TcxLookupComboBox;
    chkTodasEspecieMatrizProdutiva: TcxCheckBox;
    DBPipeMatrizProdutiva: TppDBPipeline;
    ppMatriz_Produtiva: TppReport;
    ppHeaderBand2: TppHeaderBand;
    pplbTituloMatrizProdutiva: TppLabel;
    ppDBImage2: TppDBImage;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppLabel16: TppLabel;
    ppLabel21: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText17: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel22: TppLabel;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppSystemVariable6: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    raCodeModule3: TraCodeModule;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppParameterList2: TppParameterList;
    dsMatriz_Produtiva: TDataSource;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText20: TppDBText;
    cgbDataMatrizProdutiva: TdxCheckGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    EditDataInicialMatrizProdutiva: TcxDateEdit;
    EditDataFinalMatrizProdutiva: TcxDateEdit;
    ppShape2: TppShape;
    tabLoteMudaComprado: TcxTabSheet;
    tabLoteSementeComprado: TcxTabSheet;
    ppLote_Muda_Comprado: TppReport;
    ppHeaderBand3: TppHeaderBand;
    pplbTituloLoteMudaComprado: TppLabel;
    ppDBImage3: TppDBImage;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel26: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLabel27: TppLabel;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppSystemVariable9: TppSystemVariable;
    ppSummaryBand3: TppSummaryBand;
    raCodeModule4: TraCodeModule;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppParameterList3: TppParameterList;
    DBPipeLote_Muda_Comprado: TppDBPipeline;
    dsLote_Muda_Comprado: TDataSource;
    ppDBText21: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText22: TppDBText;
    ppShape1: TppShape;
    Label4: TLabel;
    cbEspecieLoteMudaComprada: TcxLookupComboBox;
    cgbLoteMudaComprada: TdxCheckGroupBox;
    Label5: TLabel;
    Label8: TLabel;
    EditDataInicialLoteMudaComprada: TcxDateEdit;
    EditDataFinalLoteMudaComprada: TcxDateEdit;
    chkTodosEspecieLoteMudaComprada: TcxCheckBox;
    Label9: TLabel;
    cbEspecieLoteSementeComprado: TcxLookupComboBox;
    cgbLoteSementeComprado: TdxCheckGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    EditDataInicialLoteSementeComprado: TcxDateEdit;
    EditDataFinalLoteSementeComprado: TcxDateEdit;
    chkTodosEspecieLoteSementeComprado: TcxCheckBox;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel15: TppLabel;
    ppLote_Semente_Comprado: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLbTituloLoteSementeComprado: TppLabel;
    ppDBImage5: TppDBImage;
    ppSystemVariable13: TppSystemVariable;
    ppSystemVariable14: TppSystemVariable;
    ppDetailBand5: TppDetailBand;
    ppDBText27: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLabel28: TppLabel;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppSystemVariable15: TppSystemVariable;
    ppSummaryBand4: TppSummaryBand;
    ppDBCalc5: TppDBCalc;
    ppLabel29: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppShape3: TppShape;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppDBText36: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBCalc6: TppDBCalc;
    raCodeModule5: TraCodeModule;
    ppDesignLayers5: TppDesignLayers;
    ppDesignLayer5: TppDesignLayer;
    ppParameterList5: TppParameterList;
    DBPipeLote_Semente_Comprado: TppDBPipeline;
    dsLote_Semente_Comprado: TDataSource;
    ppHeaderBand4: TppHeaderBand;
    ppLabel23: TppLabel;
    ppDBImage4: TppDBImage;
    ppSystemVariable10: TppSystemVariable;
    ppSystemVariable11: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppLabel9: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText11: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLabel24: TppLabel;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppSystemVariable12: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    raCodeModule2: TraCodeModule;
    ppDesignLayers4: TppDesignLayers;
    ppDesignLayer4: TppDesignLayer;
    procedure FormCreate(Sender: TObject);
    procedure Ac_GerarRelatorioExecute(Sender: TObject);
    procedure chkSaldoTodasEspeciesPropertiesEditValueChanged(Sender: TObject);
    procedure Ac_Informacao_Previsao_ProducaoExecute(Sender: TObject);
    procedure tabPrevisaoProducaoShow(Sender: TObject);
    procedure chkTodasEspecieProducaoMatrizPropertiesEditValueChanged(
      Sender: TObject);
    procedure chkTodosEspecieLoteMudaCompradaPropertiesEditValueChanged(
      Sender: TObject);
    procedure chkTodosEspecieLoteSementeCompradoPropertiesEditValueChanged(
      Sender: TObject);
  private
    dmRelatorio: TdmRelatorio;
    procedure ppvConfigurarGrids;
    procedure ppvGerarPrevisao;
    procedure ppvGerarRelatorio(ipTitulo: String; ipReport: TppReport;
      ipCds: TRFClientDataSet; ipCheckGroup: TdxCheckGroupBox; ipDataInicial, ipDataFinal: TcxDateEdit;
      ipComboEspecie: TcxLookupComboBox; ipCheckTodas:TcxCheckBox; ipLabelTitulo: TppLabel);
  public
    { Public declarations }
  end;

var
  frmRelatorioViveiro: TfrmRelatorioViveiro;

implementation

{$R *.dfm}


procedure TfrmRelatorioViveiro.ppvGerarPrevisao;
var
  vaEspecies: TadsObjectlist<TEspecie>;
  vaEspecie: TEspecie;
begin
  vaEspecies := TadsObjectlist<TEspecie>.Create;
  TUtils.ppuPercorrerCds(cdsEspecieSelecionada,
    procedure
    begin
      vaEspecie := TEspecie.Create;
      vaEspecie.Id := cdsEspecieSelecionadaID.AsInteger;
      vaEspecie.TaxaGerminacao := cdsEspecieSelecionadaTAXA_GERMINACAO.AsFloat;
      vaEspecie.TaxaClassificacao := cdsEspecieSelecionadaTAXA_CLASSIFICACAO.AsFloat;
      vaEspecie.TempoDesenvolvimento := cdsEspecieSelecionadaTEMPO_DESENVOLVIMENTO.AsInteger;
      vaEspecie.TempoGerminacao := cdsEspecieSelecionadaTEMPO_GERMINACAO.AsInteger;

      vaEspecies.Add(vaEspecie);
    end);

  cdsPrevisaoProducao.Data := dmPrincipal.FuncoesViveiro.fpuCalcularPrevisaoProducaoMuda(vaEspecies, DateToStr(EditDataPrevisao.Date));
end;

procedure TfrmRelatorioViveiro.Ac_GerarRelatorioExecute(Sender: TObject);
var
  vaIdEspecie: Integer;
begin
  inherited;
  fprExtrairValor(chkTodasOrganizacoes, cbOrganizacao, 'Informe a organização ou marque todas');
  if pcPrincipal.ActivePage = tabSaldos then
    begin
      vaIdEspecie := fprExtrairValor(chkSaldoTodasEspecies, cbSaldoEspecie, 'Informe a espécie ou marque todas');

      // vamos garantir que o saldo esteja correto, para isso vamos chamar a função de ajustar os saldos
      dmPrincipal.FuncoesViveiro.ppuAjustarSaldoEspecie(vaIdEspecie);

      dmRelatorio.cdsSaldo_Semente_Muda.Close;
      if vaIdEspecie <> 0 then
        dmRelatorio.cdsSaldo_Semente_Muda.ParamByName('ID_ESPECIE').AsInteger := vaIdEspecie
      else
        dmRelatorio.cdsSaldo_Semente_Muda.ParamByName('ID_ESPECIE').Clear;

      dmRelatorio.cdsSaldo_Semente_Muda.Open;
      ppSaldo_Especie.PrintReport;
    end
  else if pcPrincipal.ActivePage = tabPrevisaoProducao then
    begin
      if VarIsNull(EditDataPrevisao.EditValue) then
        raise TControlException.Create('Informe a data para qual deseja saber a previsão de produção.', EditDataPrevisao);

      if cdsParametros.Active then
        cdsParametros.EmptyDataSet
      else
        cdsParametros.CreateDataSet;

      cdsParametros.Append;
      cdsParametrosDATA_PREVISAO.AsDateTime := EditDataPrevisao.Date;
      cdsParametros.Post;

      ppvGerarPrevisao;

      ppPrevisao_Producao.PrintReport;
      // TODO:Repensar isso aqui, talvez seja melhor criar dois campos a mais pra guardar as quantidades do que ter q limpar toda vez q gerar o relatorio
      // dmRelatorio.cdsTaxas_Especie.Close;
      // dmRelatorio.cdsTaxas_Especie.Open;
      //
      // cdsEspecieSelecionada.Clear;
    end
  else if pcPrincipal.ActivePage = tabProducaoMatriz then
    begin
      ppvGerarRelatorio('Matrizes mais Produtivas', ppMatriz_Produtiva, dmRelatorio.cdsMatriz_Produtiva, cgbDataMatrizProdutiva,
        EditDataInicialMatrizProdutiva, EditDataFinalMatrizProdutiva, cbEspecieMatrizProdutiva, chkTodasEspecieMatrizProdutiva, pplbTituloMatrizProdutiva);
    end
  else if pcPrincipal.ActivePage = tabLoteMudaComprado then
    ppvGerarRelatorio('Mudas Compradas', ppLote_Muda_Comprado, dmRelatorio.cdsLote_Muda_Comprado, cgbLoteMudaComprada,
      EditDataInicialLoteMudaComprada, EditDataFinalLoteMudaComprada, cbEspecieLoteMudaComprada, chkTodosEspecieLoteMudaComprada, pplbTituloLoteMudaComprado)
  else if pcPrincipal.ActivePage = tabLoteSementeComprado then
    ppvGerarRelatorio('Sementes Compradas', ppLote_Semente_Comprado, dmRelatorio.cdsLote_Semente_Comprado, cgbLoteSementeComprado,
      EditDataInicialLoteSementeComprado, EditDataFinalLoteSementeComprado, cbEspecieLoteSementeComprado, chkTodosEspecieLoteSementeComprado, ppLbTituloLoteSementeComprado);
end;

procedure TfrmRelatorioViveiro.ppvGerarRelatorio(ipTitulo: String; ipReport: TppReport;
ipCds: TRFClientDataSet; ipCheckGroup: TdxCheckGroupBox; ipDataInicial, ipDataFinal: TcxDateEdit;
ipComboEspecie: TcxLookupComboBox; ipCheckTodas: TcxCheckBox; ipLabelTitulo: TppLabel);
var
  vaIdEspecie: Integer;
begin
  vaIdEspecie := fprExtrairValor(ipCheckTodas, ipComboEspecie, 'Informe a espécie desejada.');

  ipCds.ppuLimparParametros;

  if vaIdEspecie > 0 then
    ipCds.ppuAddParametro(TParametros.coEspecie, vaIdEspecie);

  if ipCheckGroup.CheckBox.Checked then
    begin
      if VarIsNull(ipDataInicial.EditValue) or VarIsNull(ipDataFinal.EditValue) then
        raise Exception.Create('Informe uma data inicial e final para gerar o relatório.');

      ipCds.ppuAddParametro(TParametros.coData, TUtils.fpuMontarDataBetween(ipDataInicial.Date,
        ipDataFinal.Date));

      ipLabelTitulo.Caption := ipTitulo + ' (' + DateToStr(ipDataInicial.Date) + ' - ' + DateToStr(ipDataFinal.Date) + ')';
    end
  else
    ipLabelTitulo.Caption := ipTitulo;

  ipCds.ppuAddParametro(TParametros.coTodos, 'NAO_IMPORTA');

  ipCds.ppuDataRequest;
  ipReport.PrintReport;
end;

procedure TfrmRelatorioViveiro.Ac_Informacao_Previsao_ProducaoExecute(
  Sender: TObject);
begin
  inherited;
  TMensagem.ppuShowMessage('Este relatório exibe a quantidade prevista de mudas em desenvolvimento e prontas para ' +
    'plantio que existirão na data selecionada. Para isso, leva-se em consideração a quantidade atual ' +
    'de sementes em estoque, a média da taxa de germinação, a média da taxa de classificação ' +
    ' e o tempos de germinação e desenvolvimento da espécie.');
end;

procedure TfrmRelatorioViveiro.chkSaldoTodasEspeciesPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbSaldoEspecie.Enabled := not chkSaldoTodasEspecies.Checked;
end;

procedure TfrmRelatorioViveiro.chkTodasEspecieProducaoMatrizPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbEspecieMatrizProdutiva.Enabled := not chkTodasEspecieMatrizProdutiva.Checked;
end;

procedure TfrmRelatorioViveiro.chkTodosEspecieLoteMudaCompradaPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbEspecieLoteMudaComprada.Enabled := not chkTodosEspecieLoteMudaComprada.Checked;
end;

procedure TfrmRelatorioViveiro.chkTodosEspecieLoteSementeCompradoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbEspecieLoteSementeComprado.Enabled := not chkTodosEspecieLoteSementeComprado.Checked;
end;

procedure TfrmRelatorioViveiro.FormCreate(Sender: TObject);
begin
  dmRelatorio := TdmRelatorio.Create(Self);
  dmRelatorio.Name := '';
  inherited;

  pcPrincipal.ActivePageIndex := 0;

  ppvConfigurarGrids;
  dmLookup.cdslkEspecie.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, true);
  cdsEspecieSelecionada.CreateDataSet;

  EditDataInicialMatrizProdutiva.Date := IncYear(now, -1);
  EditDataFinalMatrizProdutiva.Date := now;
end;

procedure TfrmRelatorioViveiro.ppvConfigurarGrids;
begin
  // Esquerda
  frameEspecies.fpuAdicionarField(frameEspecies.viewEsquerda, TBancoDados.coId);
  frameEspecies.fpuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieNOME.FieldName);
  frameEspecies.fpuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieNOME_CIENTIFICO.FieldName, false);
  frameEspecies.fpuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieFAMILIA_BOTANICA.FieldName, false);
  frameEspecies.fpuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieTEMPO_GERMINACAO.FieldName, false);
  frameEspecies.fpuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieTEMPO_DESENVOLVIMENTO.FieldName, false);
  frameEspecies.fpuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieTAXA_CLASSIFICACAO.FieldName, false);
  frameEspecies.fpuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieTAXA_GERMINACAO.FieldName, false);
  frameEspecies.fpuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieQTDE_SEMENTE_ESTOQUE.FieldName, false);
  frameEspecies.fpuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieQTDE_MUDA_DESENVOLVIMENTO.FieldName, false);
  frameEspecies.fpuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieQTDE_MUDA_PRONTA.FieldName, false);
  frameEspecies.fpuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieQTDE_SEMENTE_KILO.FieldName, false);

  // Direita
  frameEspecies.fpuAdicionarField(frameEspecies.viewDireita, TBancoDados.coId, false);
  frameEspecies.fpuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieNOME.FieldName);
  frameEspecies.fpuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieNOME_CIENTIFICO.FieldName, false);
  frameEspecies.fpuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieFAMILIA_BOTANICA.FieldName, false);
  frameEspecies.fpuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieTEMPO_GERMINACAO.FieldName, true, true);
  frameEspecies.fpuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieTEMPO_DESENVOLVIMENTO.FieldName, true, true);
  frameEspecies.fpuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieTAXA_CLASSIFICACAO.FieldName, true, true);
  frameEspecies.fpuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieTAXA_GERMINACAO.FieldName, true, true);
  frameEspecies.fpuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieQTDE_SEMENTE_ESTOQUE.FieldName, false);
  frameEspecies.fpuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieQTDE_MUDA_DESENVOLVIMENTO.FieldName, false);
  frameEspecies.fpuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieQTDE_MUDA_PRONTA.FieldName, false);
  frameEspecies.fpuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieQTDE_SEMENTE_KILO.FieldName, false);
  // mapeando todos os campos do dataset
  frameEspecies.ppuMapearFields('*', '*');
end;

procedure TfrmRelatorioViveiro.tabPrevisaoProducaoShow(Sender: TObject);
begin
  inherited;
  if not dmRelatorio.cdsTaxas_Especie.Active then
    dmRelatorio.cdsTaxas_Especie.Open;

end;

end.
