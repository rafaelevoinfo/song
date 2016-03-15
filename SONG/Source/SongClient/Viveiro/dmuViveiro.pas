unit dmuViveiro;

interface

uses
  System.SysUtils, System.Classes, dmuBasico, dmuPrincipal, Data.DB,
  Datasnap.DBClient, uClientDataSet;

type
  TdmViveiro = class(TdmBasico)
    cdsEspecie: TRFClientDataSet;
    cdsEspecieID: TIntegerField;
    cdsEspecieNOME: TStringField;
    cdsEspecieNOME_CIENTIFICO: TStringField;
    cdsEspecieFAMILIA_BOTANICA: TStringField;
    cdsEspecieOBSERVACAO: TStringField;
    cdsMatriz: TRFClientDataSet;
    cdsMatrizID: TIntegerField;
    cdsMatrizID_ESPECIE: TIntegerField;
    cdsMatrizENDERECO: TStringField;
    cdsMatrizLATITUDE: TFMTBCDField;
    cdsMatrizLONGITUDE: TFMTBCDField;
    cdsMatrizDESCRICAO: TStringField;
    cdsMatrizESPECIE: TStringField;
    cdsMatrizNOME: TStringField;
    cdsMatrizFOTO: TBlobField;
    cdsEspecieQTDE_SEMENTE_KILO: TIntegerField;
    cdsLote: TRFClientDataSet;
    cdsLoteID: TIntegerField;
    cdsLoteID_ESPECIE: TIntegerField;
    cdsLoteID_PESSOA_COLETOU: TIntegerField;
    cdsLoteNOME: TStringField;
    cdsLoteDATA: TDateField;
    cdsLoteQTDE_GRAMAS: TBCDField;
    cdsLoteTIPO: TSmallintField;
    cdsLoteNOME_ESPECIE: TStringField;
    cdsLote_Matriz: TRFClientDataSet;
    cdsLote_MatrizID: TIntegerField;
    cdsLote_MatrizID_LOTE: TIntegerField;
    cdsLote_MatrizID_MATRIZ: TIntegerField;
    dsLote: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmViveiro: TdmViveiro;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
