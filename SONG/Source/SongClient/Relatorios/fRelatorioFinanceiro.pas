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
  cxCalendar, cxGroupBox, dxCheckGroupBox, Datasnap.DBClient;

type
  TfrmRelatorioFinanceiro = class(TfrmRelatorioBasico)
    pcPrincipal: TcxPageControl;
    tabSaldoProjeto: TcxTabSheet;
    cbProjetoSaldoProjeto: TcxLookupComboBox;
    lb1: TLabel;
    ppSaldoProjeto: TppReport;
    dsSaldoProjeto: TDataSource;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    DBPipeSaldoProjeto: TppDBPipeline;
    ppDBImage1: TppDBImage;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDBText7: TppDBText;
    ppDBText1: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    DBPipeOrganizacao: TppDBPipeline;
    ppSystemVariable3: TppSystemVariable;
    chkTodosSaldosProjetos: TcxCheckBox;
    tabSaldoDetalhado: TcxTabSheet;
    ppSaldoDetalhado: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBImage2: TppDBImage;
    ppLine2: TppLine;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppDetailBand2: TppDetailBand;
    ppDBText13: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel16: TppLabel;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppSystemVariable6: TppSystemVariable;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppParameterList2: TppParameterList;
    ppDBText14: TppDBText;
    DBPipeSaldoDetalhado: TppDBPipeline;
    dsSaldoDetalhado: TDataSource;
    GrupoTipo: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText17: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLabel14: TppLabel;
    ppDBCalc1: TppDBCalc;
    lb3: TLabel;
    cbProjetoSaldoDetalhado: TcxLookupComboBox;
    ppLine3: TppLine;
    tabMovimentacao: TcxTabSheet;
    cgbData: TdxCheckGroupBox;
    EditDataFinal: TcxDateEdit;
    Label2: TLabel;
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
    cdsMovimentacaoVALOR_REAL: TBCDField;
    DBPipeMovimentacao: TppDBPipeline;
    dsMovimentacao: TDataSource;
    ppMovimentacao: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel15: TppLabel;
    ppDBImage3: TppDBImage;
    ppLine4: TppLine;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppDetailBand3: TppDetailBand;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLabel17: TppLabel;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppSystemVariable9: TppSystemVariable;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppParameterList3: TppParameterList;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    cdsMovimentacaoVALOR: TBCDField;
    ppDBText12: TppDBText;
    ppLabel21: TppLabel;
    procedure FormCreate(Sender: TObject);
    procedure Ac_GerarRelatorioExecute(Sender: TObject);
    procedure SaldoProjetoBindAssignedValue(Sender: TObject;
      AssignValueRec: TBindingAssignValueRec; const Value: TValue);
    procedure chkTodosSaldosProjetosPropertiesEditValueChanged(Sender: TObject);
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
  vaIdOrganizacao:Integer;
begin
  inherited;
  vaIdOrganizacao := 0;
  if not chkTodasOrganizacoes.Checked then
    vaIdOrganizacao := cbOrganizacao.EditValue;

  if pcPrincipal.ActivePage = tabMovimentacao then
    begin
       if cgbData.CheckBox.Checked then
        cdsMovimentacao.Data := dmPrincipal.FuncoesRelatorio.fpuMovimentacaoFinanceira(vaIdOrganizacao,DateToStr(EditDataInicial.Date),DateToStr(EditDataFinal.Date))
       else
        cdsMovimentacao.Data := dmPrincipal.FuncoesRelatorio.fpuMovimentacaoFinanceira(vaIdOrganizacao,'','');

       ppMovimentacao.PrintReport;
    end
  else
    if pcPrincipal.ActivePage = tabSaldoProjeto then
    begin
      if VarIsNull(cbProjetoSaldoProjeto.EditValue) then
        raise TControlException.Create('Informe o projeto.', cbProjetoSaldoProjeto);

      dmRelatorio.cdsSaldoProjeto.Close;
      if chkTodosSaldosProjetos.Checked then
        dmRelatorio.cdsSaldoProjeto.ParamByName('ID_PROJETO').Clear
      else
        dmRelatorio.cdsSaldoProjeto.ParamByName('ID_PROJETO').AsInteger := cbProjetoSaldoProjeto.EditValue;
      dmRelatorio.cdsSaldoProjeto.Open;

      ppSaldoProjeto.PrintReport;
    end
  else if pcPrincipal.ActivePage = tabSaldoDetalhado then
    begin
      if VarIsNull(cbProjetoSaldoDetalhado.EditValue) then
        raise TControlException.Create('Informe o projeto.', cbProjetoSaldoDetalhado);

      dmRelatorio.cdsSaldoDetalhado.Close;
      dmRelatorio.cdsSaldoDetalhado.ParamByName('ID_PROJETO').AsInteger := cbProjetoSaldoDetalhado.EditValue;
      dmRelatorio.cdsSaldoDetalhado.ParamByName('ID_FUNDO').Clear;
      dmRelatorio.cdsSaldoDetalhado.Open;

      ppSaldoDetalhado.PrintReport;
    end;
end;

procedure TfrmRelatorioFinanceiro.SaldoProjetoBindAssignedValue(Sender: TObject;
  AssignValueRec: TBindingAssignValueRec; const Value: TValue);
begin
  inherited;
  CodeSite.Send('teste');
end;

procedure TfrmRelatorioFinanceiro.chkTodosSaldosProjetosPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbProjetoSaldoProjeto.Enabled := not chkTodosSaldosProjetos.Checked;
end;

procedure TfrmRelatorioFinanceiro.FormCreate(Sender: TObject);
begin

  dmRelatorio := TdmRelatorio.Create(Self);
  dmRelatorio.Name := '';
  inherited;

  dmLookup.cdslkProjeto.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);

end;

end.
