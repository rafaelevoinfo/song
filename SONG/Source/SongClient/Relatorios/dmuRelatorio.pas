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
    cdsSaldo_Semente_MudaQTDE_MUDA_ESTOQUE: TIntegerField;
    cdsSaldo_Semente_MudaCALC_QTDE_SEMENTE: TStringField;
    cdsSaldo_Semente_MudaCALC_QTDE_MUDA: TStringField;
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
  cdsSaldo_Semente_MudaCALC_QTDE_MUDA.AsString := FormatFloat(',0',cdsSaldo_Semente_MudaQTDE_MUDA_ESTOQUE.AsInteger);
end;

end.
