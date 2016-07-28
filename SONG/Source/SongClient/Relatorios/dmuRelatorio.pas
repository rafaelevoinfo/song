unit dmuRelatorio;

interface

uses
  System.SysUtils, System.Classes, dmuBasico, dmuPrincipal, Data.DB,
  Datasnap.DBClient, uClientDataSet;

type
  TdmRelatorio = class(TdmBasico)
    cdsSaldo_Rubrica: TRFClientDataSet;
    cdsSaldo_RubricaID_RUBRICA: TIntegerField;
    cdsSaldo_RubricaID_PROJETO: TIntegerField;
    cdsSaldo_RubricaNOME_PROJETO: TStringField;
    cdsSaldo_RubricaNOME_RUBRICA: TStringField;
    cdsSaldo_RubricaRECEBIDO: TBCDField;
    cdsSaldo_RubricaGASTO: TFMTBCDField;
    cdsSaldo_RubricaAPROVISIONADO: TFMTBCDField;
    cdsSaldo_RubricaSALDO_REAL: TFMTBCDField;
    dsSaldo_Rubrica: TDataSource;
    cdsSaldo_RubricaORCAMENTO: TBCDField;
    cdsSaldo_Semente_Muda: TRFClientDataSet;
    dsSaldo_Semente_Muda: TDataSource;
    cdsSaldo_Semente_MudaNOME: TStringField;
    cdsSaldo_Semente_MudaNOME_CIENTIFICO: TStringField;
    cdsSaldo_Semente_MudaFAMILIA_BOTANICA: TStringField;
    cdsSaldo_Semente_MudaQTDE_SEMENTE_ESTOQUE: TBCDField;
    cdsSaldo_Semente_MudaCALC_QTDE_SEMENTE: TStringField;
    cdsTaxas_Especie: TRFClientDataSet;
    cdsTaxas_EspecieID: TIntegerField;
    cdsTaxas_EspecieNOME: TStringField;
    cdsTaxas_EspecieNOME_CIENTIFICO: TStringField;
    cdsTaxas_EspecieFAMILIA_BOTANICA: TStringField;
    cdsTaxas_EspecieTEMPO_GERMINACAO: TIntegerField;
    cdsTaxas_EspecieTEMPO_DESENVOLVIMENTO: TIntegerField;
    cdsTaxas_EspecieTAXA_CLASSIFICACAO: TBCDField;
    cdsTaxas_EspecieTAXA_GERMINACAO: TBCDField;
    cdsSaldo_Semente_MudaQTDE_MUDA_PRONTA: TIntegerField;
    cdsSaldo_Semente_MudaQTDE_MUDA_DESENVOLVIMENTO: TIntegerField;
    cdsSaldo_Semente_MudaCALC_QTDE_MUDA_PRONTA: TStringField;
    cdsSaldo_Semente_MudaCALC_QTDE_MUDA_DESENVOLVIMENTO: TStringField;
    cdsTaxas_EspecieQTDE_SEMENTE_ESTOQUE: TBCDField;
    cdsTaxas_EspecieQTDE_MUDA_DESENVOLVIMENTO: TIntegerField;
    cdsTaxas_EspecieQTDE_MUDA_PRONTA: TIntegerField;
    cdsTaxas_EspecieQTDE_SEMENTE_KILO: TIntegerField;
    cdsSaldo_Semente_MudaCALC_TOTAL_MUDA: TIntegerField;
    cdsPatrimonio: TRFClientDataSet;
    cdsPatrimonioIDENTIFICACAO: TStringField;
    cdsPatrimonioNOME_ITEM: TStringField;
    cdsPatrimonioDATA_AQUISICAO: TSQLTimeStampField;
    cdsPatrimonioVALOR_INICIAL: TBCDField;
    cdsPatrimonioLOCALIZACAO: TStringField;
    cdsPatrimonioSTATUS: TSmallintField;
    cdsPatrimonioCALC_VALOR_ATUAL: TBCDField;
    cdsPatrimonioTAXA_DEPRECIACAO_ANUAL: TIntegerField;
    cdsPatrimonioID_ITEM_PATRIMONIO: TIntegerField;
    cdsGasto_Area_Atuacao: TRFClientDataSet;
    cdsGasto_Area_AtuacaoGASTO: TBCDField;
    cdsGasto_Area_AtuacaoID_AREA_ATUACAO_ORIGEM: TIntegerField;
    cdsGasto_Area_AtuacaoAREA_ATUACAO: TStringField;
    procedure cdsSaldo_Semente_MudaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRelatorio: TdmRelatorio;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmRelatorio.cdsSaldo_Semente_MudaCalcFields(DataSet: TDataSet);
begin
  inherited;
  cdsSaldo_Semente_MudaCALC_QTDE_SEMENTE.AsString := FormatFloat(',0.00',cdsSaldo_Semente_MudaQTDE_SEMENTE_ESTOQUE.AsFloat);
  cdsSaldo_Semente_MudaCALC_QTDE_MUDA_DESENVOLVIMENTO.AsString := FormatFloat(',0',cdsSaldo_Semente_MudaQTDE_MUDA_DESENVOLVIMENTO.AsInteger);
  cdsSaldo_Semente_MudaCALC_QTDE_MUDA_PRONTA.AsString := FormatFloat(',0',cdsSaldo_Semente_MudaQTDE_MUDA_PRONTA.AsInteger);
  cdsSaldo_Semente_MudaCALC_TOTAL_MUDA.AsInteger := cdsSaldo_Semente_MudaCALC_QTDE_MUDA_DESENVOLVIMENTO.AsInteger+ cdsSaldo_Semente_MudaQTDE_MUDA_PRONTA.AsInteger;
end;

end.
