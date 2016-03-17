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
    cdsLoteNOME_ESPECIE: TStringField;
    cdsLote_Matriz: TRFClientDataSet;
    cdsLote_MatrizID: TIntegerField;
    cdsLote_MatrizID_LOTE: TIntegerField;
    cdsLote_MatrizID_MATRIZ: TIntegerField;
    dsLote: TDataSource;
    cdsLoteQTDE: TBCDField;
    cdsLoteQTDE_ARMAZENADA: TBCDField;
    cdsLoteQTDE_SEMEADA: TBCDField;
    cdsLoteTAXA_GERMINACAO: TBCDField;
    cdsLoteTAXA_DESCARTE: TBCDField;
    cdsLoteSTATUS: TSmallintField;
    cdsGerminacao: TRFClientDataSet;
    cdsGerminacaoID: TIntegerField;
    cdsGerminacaoID_LOTE: TIntegerField;
    cdsGerminacaoID_PESSOA_VERIFICOU: TIntegerField;
    cdsGerminacaoDATA: TSQLTimeStampField;
    cdsGerminacaoQTDE_GERMINADA: TIntegerField;
    cdsSemeadura: TRFClientDataSet;
    cdsSemeaduraID: TIntegerField;
    cdsSemeaduraID_LOTE: TIntegerField;
    cdsSemeaduraID_PESSOA_SEMEOU: TIntegerField;
    cdsSemeaduraQTDE_SEMEADA: TBCDField;
    cdsSemeaduraDATA: TSQLTimeStampField;
    cdsSemeaduraOBSERVACAO: TStringField;
    cdsSemeaduraID_CANTEIRO: TIntegerField;
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
