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
  dxCheckGroupBox, cxRadioGroup, uControleAcesso, System.TypInfo,
  cxImageComboBox, cxCheckGroup;

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
    dsLote_Semente_Vendido: TDataSource;
    ppLote_Semente_Vendido: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLbTituloLoteSementeVendia: TppLabel;
    ppDBImage6: TppDBImage;
    ppSystemVariable16: TppSystemVariable;
    ppSystemVariable17: TppSystemVariable;
    ppDetailBand6: TppDetailBand;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLabel35: TppLabel;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppSystemVariable18: TppSystemVariable;
    ppSummaryBand5: TppSummaryBand;
    ppDBCalc7: TppDBCalc;
    ppLabel36: TppLabel;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppShape4: TppShape;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppDBText44: TppDBText;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppDBCalc8: TppDBCalc;
    raCodeModule6: TraCodeModule;
    ppDesignLayers6: TppDesignLayers;
    ppDesignLayer6: TppDesignLayer;
    ppParameterList6: TppParameterList;
    DBPipeLote_Semente_Vendido: TppDBPipeline;
    dsLote_Muda_Vendido: TDataSource;
    DBPipeLote_Muda_Vendido: TppDBPipeline;
    ppLote_Muda_Vendido: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLbTituloLoteMudaVendida: TppLabel;
    ppDBImage7: TppDBImage;
    ppSystemVariable19: TppSystemVariable;
    ppSystemVariable20: TppSystemVariable;
    ppDetailBand7: TppDetailBand;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppLabel43: TppLabel;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppSystemVariable21: TppSystemVariable;
    ppSummaryBand6: TppSummaryBand;
    ppDBCalc9: TppDBCalc;
    ppLabel44: TppLabel;
    ppShape5: TppShape;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppDBText52: TppDBText;
    ppDBCalc10: TppDBCalc;
    raCodeModule7: TraCodeModule;
    ppDesignLayers7: TppDesignLayers;
    ppDesignLayer7: TppDesignLayer;
    ppParameterList7: TppParameterList;
    rgCompraVendaMuda: TcxRadioGroup;
    rgCompraVendaSemente: TcxRadioGroup;
    ppDBCalc11: TppDBCalc;
    ppLabel25: TppLabel;
    ppDBCalc12: TppDBCalc;
    ppLabel42: TppLabel;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    tabTubetesSemeados: TcxTabSheet;
    lb3: TLabel;
    cbEspecieTubete: TcxLookupComboBox;
    chkTodasEspecieTubete: TcxCheckBox;
    dsTubete_Semeado: TDataSource;
    DBPipeTubete_Semeado: TppDBPipeline;
    ppTubete_Semeado: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppLabel50: TppLabel;
    ppDBImage8: TppDBImage;
    ppSystemVariable22: TppSystemVariable;
    ppSystemVariable23: TppSystemVariable;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLine3: TppLine;
    ppDetailBand8: TppDetailBand;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppLabel57: TppLabel;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppSystemVariable24: TppSystemVariable;
    ppSummaryBand7: TppSummaryBand;
    ppLabel58: TppLabel;
    ppDBCalc15: TppDBCalc;
    raCodeModule8: TraCodeModule;
    ppDesignLayers8: TppDesignLayers;
    ppDesignLayer8: TppDesignLayer;
    ppParameterList8: TppParameterList;
    cbClassificacaoEspecie: TcxImageComboBox;
    Label12: TLabel;
    chkTodasClassificacao: TcxCheckBox;
    Label13: TLabel;
    cbCategoriaArmazenagem: TcxImageComboBox;
    chkTodasCategoriaArmazenamento: TcxCheckBox;
    lb4: TLabel;
    chkTodosTipoEspecie: TcxCheckBox;
    chkApenasEspecieComSaldo: TcxCheckBox;
    cbTipo_Especie: TcxLookupComboBox;
    cgBioma: TcxCheckGroup;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppDBCalc16: TppDBCalc;
    ppDBText53: TppDBText;
    ppLabel56: TppLabel;
    ppDBText57: TppDBText;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppDBText58: TppDBText;
    ppLabel59: TppLabel;
    ppDBImage9: TppDBImage;
    ppDBImage10: TppDBImage;
    ppLabel61: TppLabel;
    ppDBText61: TppDBText;
    ppLabel62: TppLabel;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBImage11: TppDBImage;
    ppDBText62: TppDBText;
    ppLabel60: TppLabel;
    ppLabel63: TppLabel;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDBImage12: TppDBImage;
    ppDBText63: TppDBText;
    ppLabel64: TppLabel;
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
    procedure chkTodasEspecieTubetePropertiesEditValueChanged(Sender: TObject);
    procedure chkTodasClassificacaoPropertiesEditValueChanged(Sender: TObject);
    procedure chkTodasCategoriaArmazenamentoPropertiesEditValueChanged(
      Sender: TObject);
    procedure chkTodosTipoEspeciePropertiesEditValueChanged(Sender: TObject);
  private
    dmRelatorio: TdmRelatorio;
    procedure ppvConfigurarGrids;
    procedure ppvGerarPrevisao;
    procedure ppvGerarRelatorio(ipTitulo: String; ipReport: TppReport;
      ipCds: TRFClientDataSet; ipCheckGroup: TdxCheckGroupBox; ipDataInicial, ipDataFinal: TcxDateEdit;
      ipComboEspecie: TcxLookupComboBox; ipCheckTodas: TcxCheckBox; ipLabelTitulo: TppLabel);
  protected
    function fprGetPermissao: String; override;
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
  i, vaCategoria, vaTipo, vaIdEspecie: Integer;
  vaBiomas: String;
begin
  inherited;
  fprExtrairValor(chkTodasOrganizacoes, cbOrganizacao, 'Informe a organiza��o ou marque todas');
  if pcPrincipal.ActivePage = tabSaldos then
    begin
      vaIdEspecie := fprExtrairValor(chkSaldoTodasEspecies, cbSaldoEspecie, 'Informe a esp�cie ou marque todas');
      vaCategoria := fprExtrairValor(chkTodasCategoriaArmazenamento, cbCategoriaArmazenagem, 'Informe a categoria de armazenagem ou marque todas');
      vaTipo := fprExtrairValor(chkTodosTipoEspecie, cbTipo_Especie, 'Informe o tipo de esp�cie ou marque todas');
      vaBiomas := '';
      for i := 0 to TcxCheckGroupProperties(cgBioma.RepositoryItem.Properties).Items.Count - 1 do
        begin
          if (cgBioma.States[i] = cbsChecked) then
            begin
              if vaBiomas = '' then
                vaBiomas := i.ToString
              else
                vaBiomas := vaBiomas + coDelimitadorPadrao + i.ToString();
            end;
        end;

      if vaBiomas = '' then
        raise Exception.Create('Informe pelo menos um tipo de bioma.');

      // vamos garantir que o saldo esteja correto, para isso vamos chamar a fun��o de ajustar os saldos
      dmPrincipal.FuncoesViveiro.ppuAjustarSaldoEspecie(vaIdEspecie);

      dmRelatorio.cdsSaldo_Semente_Muda.Close;
      dmRelatorio.cdsSaldo_Semente_Muda.ppuLimparParametros;
      if vaIdEspecie <> 0 then
        dmRelatorio.cdsSaldo_Semente_Muda.ppuAddParametro(TParametros.coID_ESPECIE, vaIdEspecie);

      if not chkTodasClassificacao.Checked then
        dmRelatorio.cdsSaldo_Semente_Muda.ppuAddParametro(TParametros.coClassificacao, cbClassificacaoEspecie.EditValue);

      if not chkTodasCategoriaArmazenamento.Checked then
        dmRelatorio.cdsSaldo_Semente_Muda.ppuAddParametro(TParametros.coCategoria, vaCategoria);

      if vaTipo <> 0 then
        dmRelatorio.cdsSaldo_Semente_Muda.ppuAddParametro(TParametros.coTipo, vaTipo);

      if chkApenasEspecieComSaldo.Checked then
        dmRelatorio.cdsSaldo_Semente_Muda.ppuAddParametro(TParametros.coSaldoPositivo, 'NAO_IMPORTA');

      dmRelatorio.cdsSaldo_Semente_Muda.ppuAddParametro(TParametros.coBioma, vaBiomas);

      dmRelatorio.cdsSaldo_Semente_Muda.ppuDataRequest;
      ppSaldo_Especie.PrintReport;
    end
  else if pcPrincipal.ActivePage = tabPrevisaoProducao then
    begin
      if VarIsNull(EditDataPrevisao.EditValue) then
        raise TControlException.Create('Informe a data para qual deseja saber a previs�o de produ��o.', EditDataPrevisao);

      if (not cdsEspecieSelecionada.Active) or (cdsEspecieSelecionada.recordCount = 0) then
        raise Exception.Create('Selecione pelo menos uma esp�cie.');

      if cdsParametros.Active then
        cdsParametros.EmptyDataSet
      else
        cdsParametros.CreateDataSet;

      cdsParametros.Append;
      cdsParametrosDATA_PREVISAO.AsDateTime := EditDataPrevisao.Date;
      cdsParametros.Post;

      ppvGerarPrevisao;

      ppPrevisao_Producao.PrintReport;
    end
  else if pcPrincipal.ActivePage = tabProducaoMatriz then
    begin
      ppvGerarRelatorio('Matrizes mais Produtivas', ppMatriz_Produtiva, dmRelatorio.cdsMatriz_Produtiva, cgbDataMatrizProdutiva,
        EditDataInicialMatrizProdutiva, EditDataFinalMatrizProdutiva, cbEspecieMatrizProdutiva, chkTodasEspecieMatrizProdutiva, pplbTituloMatrizProdutiva);
    end
  else if pcPrincipal.ActivePage = tabLoteMudaComprado then
    begin
      if rgCompraVendaMuda.ItemIndex = 0 then // compra
        begin
          ppvGerarRelatorio('Mudas Compradas', ppLote_Muda_Comprado, dmRelatorio.cdsLote_Muda_Comprado, cgbLoteMudaComprada,
            EditDataInicialLoteMudaComprada, EditDataFinalLoteMudaComprada, cbEspecieLoteMudaComprada, chkTodosEspecieLoteMudaComprada,
            pplbTituloLoteMudaComprado)
        end
      else
        begin
          ppvGerarRelatorio('Mudas Vendidas', ppLote_Muda_Vendido, dmRelatorio.cdsLote_Muda_Vendido, cgbLoteMudaComprada,
            EditDataInicialLoteMudaComprada, EditDataFinalLoteMudaComprada, cbEspecieLoteMudaComprada, chkTodosEspecieLoteMudaComprada,
            ppLbTituloLoteMudaVendida)
        end;
    end
  else if pcPrincipal.ActivePage = tabLoteSementeComprado then
    begin
      if rgCompraVendaSemente.ItemIndex = 0 then
        begin
          ppvGerarRelatorio('Sementes Compradas', ppLote_Semente_Comprado, dmRelatorio.cdsLote_Semente_Comprado, cgbLoteSementeComprado,
            EditDataInicialLoteSementeComprado, EditDataFinalLoteSementeComprado, cbEspecieLoteSementeComprado, chkTodosEspecieLoteSementeComprado,
            ppLbTituloLoteSementeComprado);
        end
      else // venda
        begin
          ppvGerarRelatorio('Sementes Vendidas', ppLote_Semente_Vendido, dmRelatorio.cdsLote_Semente_Vendido, cgbLoteSementeComprado,
            EditDataInicialLoteSementeComprado, EditDataFinalLoteSementeComprado, cbEspecieLoteSementeComprado, chkTodosEspecieLoteSementeComprado,
            ppLbTituloLoteSementeVendia);
        end;
    end
  else if pcPrincipal.ActivePage = tabTubetesSemeados then
    begin
      ppvGerarRelatorio('', ppTubete_Semeado, dmRelatorio.cdsTubete_Semeado, nil, nil, nil, cbEspecieTubete, chkTodasEspecieTubete, nil);
    end;
end;

procedure TfrmRelatorioViveiro.ppvGerarRelatorio(ipTitulo: String; ipReport: TppReport;
ipCds: TRFClientDataSet; ipCheckGroup: TdxCheckGroupBox; ipDataInicial, ipDataFinal: TcxDateEdit;
ipComboEspecie: TcxLookupComboBox; ipCheckTodas: TcxCheckBox; ipLabelTitulo: TppLabel);
var
  vaIdEspecie: Integer;
begin
  vaIdEspecie := fprExtrairValor(ipCheckTodas, ipComboEspecie, 'Informe a esp�cie desejada.');

  ipCds.ppuLimparParametros;

  if vaIdEspecie > 0 then
    ipCds.ppuAddParametro(TParametros.coEspecie, vaIdEspecie);

  if Assigned(ipCheckGroup) and Assigned(ipLabelTitulo) then
    begin
      if ipCheckGroup.CheckBox.Checked then
        begin
          if VarIsNull(ipDataInicial.EditValue) or VarIsNull(ipDataFinal.EditValue) then
            raise Exception.Create('Informe uma data inicial e final para gerar o relat�rio.');

          ipCds.ppuAddParametro(TParametros.coData, TUtils.fpuMontarDataBetween(ipDataInicial.Date,
            ipDataFinal.Date));

          ipLabelTitulo.Caption := ipTitulo + ' (' + DateToStr(ipDataInicial.Date) + ' - ' + DateToStr(ipDataFinal.Date) + ')';
        end
      else
        ipLabelTitulo.Caption := ipTitulo;
    end;

  ipCds.ppuAddParametro(TParametros.coTodos, 'NAO_IMPORTA');

  ipCds.ppuDataRequest;
  ipReport.PrintReport;
end;

procedure TfrmRelatorioViveiro.Ac_Informacao_Previsao_ProducaoExecute(
  Sender: TObject);
begin
  inherited;
  TMensagem.ppuShowMessage('Este relat�rio exibe a quantidade prevista de mudas em desenvolvimento e prontas para ' +
    'plantio que existir�o na data selecionada. Para isso, leva-se em considera��o a quantidade atual ' +
    'de sementes em estoque, a m�dia da taxa de germina��o, a m�dia da taxa de classifica��o ' +
    ' e o tempos de germina��o e desenvolvimento da esp�cie.');
end;

procedure TfrmRelatorioViveiro.chkSaldoTodasEspeciesPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbSaldoEspecie.Enabled := not chkSaldoTodasEspecies.Checked;
end;

procedure TfrmRelatorioViveiro.chkTodasCategoriaArmazenamentoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbCategoriaArmazenagem.Enabled := not chkTodasCategoriaArmazenamento.Checked;
end;

procedure TfrmRelatorioViveiro.chkTodasClassificacaoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbClassificacaoEspecie.Enabled := not chkTodasClassificacao.Checked;
end;

procedure TfrmRelatorioViveiro.chkTodasEspecieProducaoMatrizPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbEspecieMatrizProdutiva.Enabled := not chkTodasEspecieMatrizProdutiva.Checked;
end;

procedure TfrmRelatorioViveiro.chkTodasEspecieTubetePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbEspecieTubete.Enabled := not chkTodasEspecieTubete.Checked;
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

procedure TfrmRelatorioViveiro.chkTodosTipoEspeciePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbTipo_Especie.Enabled := not chkTodosTipoEspecie.Checked;
end;

procedure TfrmRelatorioViveiro.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  dmRelatorio := TdmRelatorio.Create(Self);
  dmRelatorio.Name := '';
  inherited;

  pcPrincipal.ActivePageIndex := 0;

  ppvConfigurarGrids;
  dmLookup.cdslkEspecie.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, true);
  dmLookup.cdslkTipo_Especie.ppuDataRequest([TParametros.coTodos],['NAO_IMPORTA']);
  cdsEspecieSelecionada.CreateDataSet;


  EditDataInicialMatrizProdutiva.Date := IncYear(now, -1);
  EditDataFinalMatrizProdutiva.Date := now;

  for i := 0 to TcxCheckGroupProperties(cgBioma.RepositoryItem.Properties).Items.Count - 1 do
    cgBioma.States[i] := cbschecked;
end;

function TfrmRelatorioViveiro.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoRelatorio), ord(relViveiro));
end;

procedure TfrmRelatorioViveiro.ppvConfigurarGrids;
begin
  // Esquerda
  frameEspecies.fpuAdicionarField(frameEspecies.viewEsquerda, TBancoDados.coID);
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
  frameEspecies.fpuAdicionarField(frameEspecies.viewDireita, TBancoDados.coID, false);
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
