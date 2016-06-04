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
  cxCalendar, uMensagem, uExceptions, System.DateUtils;

type
  TfrmRelatorioViveiro = class(TfrmRelatorioBasico)
    pcPrincipal: TcxPageControl;
    tabSaldos: TcxTabSheet;
    Label2: TLabel;
    cbSaldoEspecie: TcxLookupComboBox;
    chkSaldoTodasEspecies: TcxCheckBox;
    ppSaldoEspecie: TppReport;
    ppParameterList4: TppParameterList;
    DBPipeSaldoEspecie: TppDBPipeline;
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
    ppDetailBand4: TppDetailBand;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLabel24: TppLabel;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppSystemVariable12: TppSystemVariable;
    raCodeModule2: TraCodeModule;
    ppDesignLayers4: TppDesignLayers;
    ppDesignLayer4: TppDesignLayer;
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
    ppPrevisaoProducao: TppReport;
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
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    cdsEspecieSelecionadaQTDE_SEMENTE_ESTOQUE: TBCDField;
    cdsEspecieSelecionadaQTDE_SEMENTE_KILO: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure Ac_GerarRelatorioExecute(Sender: TObject);
    procedure chkSaldoTodasEspeciesPropertiesEditValueChanged(Sender: TObject);
    procedure Ac_Informacao_Previsao_ProducaoExecute(Sender: TObject);
    procedure tabPrevisaoProducaoShow(Sender: TObject);
  private
    dmRelatorio: TdmRelatorio;
    procedure ppvConfigurarGrids;
    procedure ppvGerarPrevisao;
  public
    { Public declarations }
  end;

var
  frmRelatorioViveiro: TfrmRelatorioViveiro;

implementation

{$R *.dfm}


procedure TfrmRelatorioViveiro.Ac_GerarRelatorioExecute(Sender: TObject);
var
  vaIdOrganizacao: Integer;
  vaIdEspecie: Integer;
begin
  inherited;
  vaIdOrganizacao := fprExtrairValor(chkTodasOrganizacoes, cbOrganizacao, 'Informe a organização ou marque todas');
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
      ppSaldoEspecie.PrintReport;
    end
  else if pcPrincipal.ActivePage = tabPrevisaoProducao then
    begin
      if VarIsNull(EditDataPrevisao.EditValue) then
        raise TControlException.Create('Informe a data para qual deseja saber a previsão de produção.',EditDataPrevisao);

      if cdsParametros.Active then
        cdsParametros.EmptyDataSet
      else
        cdsParametros.CreateDataSet;

      cdsParametros.Append;
      cdsParametrosDATA_PREVISAO.AsDateTime := EditDataPrevisao.Date;
      cdsParametros.Post;

      ppvGerarPrevisao;

      ppPrevisaoProducao.PrintReport;
      //TODO:Repensar isso aqui, talvez seja melhor criar dois campos a mais pra guardar as quantidades do que ter q limpar toda vez q gerar o relatorio
      dmRelatorio.cdsTaxas_Especie.Close;
      dmRelatorio.cdsTaxas_Especie.Open;

      cdsEspecieSelecionada.Clear;
    end;
end;

procedure TfrmRelatorioViveiro.ppvGerarPrevisao;
var
  vaQtdeMudasGerminadas,vaQtdeSementeEstoque:Integer;
  vaDataGerminacao:TDateTime;
begin
  cdsEspecieSelecionada.DisableControls;
  try
    cdsEspecieSelecionada.First;
    while cdsEspecieSelecionada.Eof do
      begin
        cdsEspecieSelecionada.Edit;
        vaQtdeSementeEstoque := Trunc(cdsEspecieSelecionadaQTDE_SEMENTE_ESTOQUE.AsFloat * cdsEspecieSelecionadaQTDE_SEMENTE_KILO.AsInteger);
        vaQtdeMudasGerminadas := Trunc(vaQtdeSementeEstoque *  (cdsEspecieSelecionadaTAXA_GERMINACAO.AsFloat/100));
        vaDataGerminacao := now;
        IncDay(vaDataGerminacao,cdsEspecieSelecionadaTEMPO_GERMINACAO.AsInteger);
        if vaDataGerminacao <= EditDataPrevisao.Date then
          begin
            Repensar isso aqui, pois preciso levar em consideracao as mudas que estao em desenvolvimento, ou seja
            preciso percorrer todos os lotes de mudas e ver quando as mudas estarao prontas para plantio


          end;

        cdsEspecieSelecionada.Post;
        cdsEspecieSelecionada.Next;
      end;
  finally
    cdsEspecieSelecionada.EnableControls;
  end;
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

procedure TfrmRelatorioViveiro.FormCreate(Sender: TObject);
begin
  dmRelatorio := TdmRelatorio.Create(Self);
  dmRelatorio.Name := '';
  inherited;

  pcPrincipal.ActivePageIndex := 0;

  ppvConfigurarGrids;
  dmLookup.cdslkEspecie.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, true);
  cdsEspecieSelecionada.CreateDataSet;
end;

procedure TfrmRelatorioViveiro.ppvConfigurarGrids;
begin
  // Esquerda
  frameEspecies.ppuAdicionarField(frameEspecies.viewEsquerda, TBancoDados.coId);
  frameEspecies.ppuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieNOME.FieldName);
  frameEspecies.ppuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieNOME_CIENTIFICO.FieldName, false);
  frameEspecies.ppuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieFAMILIA_BOTANICA.FieldName, false);
  frameEspecies.ppuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieTEMPO_GERMINACAO.FieldName, false);
  frameEspecies.ppuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieTEMPO_DESENVOLVIMENTO.FieldName, false);
  frameEspecies.ppuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieTAXA_CLASSIFICACAO.FieldName, false);
  frameEspecies.ppuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieTAXA_GERMINACAO.FieldName, false);
  frameEspecies.ppuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieQTDE_SEMENTE_ESTOQUE.FieldName, false);
  frameEspecies.ppuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieQTDE_MUDA_DESENVOLVIMENTO.FieldName, false);
  frameEspecies.ppuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieQTDE_MUDA_PRONTA.FieldName, false);
  frameEspecies.ppuAdicionarField(frameEspecies.viewEsquerda, dmRelatorio.cdsTaxas_EspecieQTDE_SEMENTE_KILO.FieldName, false);

  // Direita
  frameEspecies.ppuAdicionarField(frameEspecies.viewDireita, TBancoDados.coId);
  frameEspecies.ppuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieNOME.FieldName);
  frameEspecies.ppuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieNOME_CIENTIFICO.FieldName, false);
  frameEspecies.ppuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieFAMILIA_BOTANICA.FieldName, false);
  frameEspecies.ppuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieTEMPO_GERMINACAO.FieldName);
  frameEspecies.ppuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieTEMPO_DESENVOLVIMENTO.FieldName);
  frameEspecies.ppuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieTAXA_CLASSIFICACAO.FieldName);
  frameEspecies.ppuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieTAXA_GERMINACAO.FieldName);
  frameEspecies.ppuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieQTDE_SEMENTE_ESTOQUE.FieldName, false);
  frameEspecies.ppuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieQTDE_MUDA_DESENVOLVIMENTO.FieldName, false);
  frameEspecies.ppuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieQTDE_MUDA_PRONTA.FieldName, false);
  frameEspecies.ppuAdicionarField(frameEspecies.viewDireita, dmRelatorio.cdsTaxas_EspecieQTDE_SEMENTE_KILO.FieldName, false);
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
