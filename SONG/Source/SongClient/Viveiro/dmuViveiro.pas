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
    cdsMatriz: TRFClientDataSet;
    cdsMatrizID: TIntegerField;
    cdsMatrizID_ESPECIE: TIntegerField;
    cdsMatrizENDERECO: TStringField;
    cdsMatrizLATITUDE: TFMTBCDField;
    cdsMatrizLONGITUDE: TFMTBCDField;
    cdsMatrizESPECIE: TStringField;
    cdsMatrizNOME: TStringField;
    cdsMatrizFOTO: TBlobField;
    cdsEspecieQTDE_SEMENTE_KILO: TIntegerField;
    cdsLote_Semente: TRFClientDataSet;
    cdsLote_SementeID: TIntegerField;
    cdsLote_SementeID_ESPECIE: TIntegerField;
    cdsLote_SementeID_PESSOA_COLETOU: TIntegerField;
    cdsLote_SementeNOME: TStringField;
    cdsLote_SementeDATA: TDateField;
    cdsLote_SementeNOME_ESPECIE: TStringField;
    cdsLote_Semente_Matriz: TRFClientDataSet;
    cdsLote_Semente_MatrizID: TIntegerField;
    cdsLote_Semente_MatrizID_MATRIZ: TIntegerField;
    dsLote_Semente: TDataSource;
    cdsLote_SementeQTDE: TBCDField;
    cdsLote_SementeQTDE_ARMAZENADA: TBCDField;
    cdsLote_SementeTAXA_GERMINACAO: TBCDField;
    cdsLote_SementeTAXA_DESCARTE: TBCDField;
    cdsLote_SementeSTATUS: TSmallintField;
    cdsGerminacao: TRFClientDataSet;
    cdsGerminacaoID: TIntegerField;
    cdsGerminacaoID_PESSOA_VERIFICOU: TIntegerField;
    cdsGerminacaoQTDE_GERMINADA: TIntegerField;
    cdsSemeadura: TRFClientDataSet;
    cdsSemeaduraID: TIntegerField;
    cdsSemeaduraID_PESSOA_SEMEOU: TIntegerField;
    cdsSemeaduraQTDE_SEMEADA: TBCDField;
    cdsSemeaduraDATA: TSQLTimeStampField;
    cdsSemeaduraID_CANTEIRO: TIntegerField;
    cdsCanteiro: TRFClientDataSet;
    cdsCanteiroID: TIntegerField;
    cdsCanteiroNOME: TStringField;
    cdsSemeaduraPESSOA_SEMEOU: TStringField;
    cdsSemeaduraNOME_CANTEIRO: TStringField;
    cdsGerminacaoPESSOA_VERIFICOU: TStringField;
    cdsLote_SementeQTDE_SEMEADA: TBCDField;
    cdsSemeaduraDATA_PREVISTA_GERMINACAO: TSQLTimeStampField;
    cdsEspecieVALOR_MUDA: TBCDField;
    cdsEspecieVALOR_KG_SEMENTE: TBCDField;
    cdsEspecieTEMPO_GERMINACAO: TIntegerField;
    cdsEspecieINICIO_PERIODO_COLETA: TDateField;
    cdsEspecieFIM_PERIODO_COLETA: TDateField;
    cdsLote_Semente_MatrizID_LOTE_SEMENTE: TIntegerField;
    cdsGerminacaoID_LOTE_SEMENTE: TIntegerField;
    cdsSemeaduraID_LOTE_SEMENTE: TIntegerField;
    cdsSemeaduraQTDE_TUBETE: TIntegerField;
    cdsLote_Muda: TRFClientDataSet;
    cdsLote_MudaID: TIntegerField;
    cdsLote_MudaID_ESPECIE: TIntegerField;
    cdsLote_MudaNOME: TStringField;
    cdsLote_MudaQTDE_INICIAL: TIntegerField;
    cdsLote_SementePESSOA_COLETOU: TStringField;
    cdsLote_MudaNOME_ESPECIE: TStringField;
    cdsClassificacao: TRFClientDataSet;
    dsLote_Muda: TDataSource;
    cdsClassificacaoID: TIntegerField;
    cdsClassificacaoID_LOTE_MUDA: TIntegerField;
    cdsClassificacaoID_PESSOA_CLASSIFICOU: TIntegerField;
    cdsClassificacaoDATA: TDateField;
    cdsClassificacaoQTDE: TIntegerField;
    cdsClassificacaoPESSOA_CLASSIFICOU: TStringField;
    cdsSemeaduraOBSERVACAO: TStringField;
    cdsCanteiroDESCRICAO: TStringField;
    cdsClassificacaoOBSERVACAO: TStringField;
    cdsMatrizDESCRICAO: TStringField;
    cdsEspecieOBSERVACAO: TStringField;
    cdsLote_MudaOBSERVACAO: TStringField;
    cdsLote_MudaQTDE_ATUAL: TIntegerField;
    cdsGerminacaoDATA: TDateField;
    cdsLote_MudaDATA: TDateField;
    cdsLote_MudaTAXA_CLASSIFICACAO: TBCDField;
    cdsEspecieQTDE_SEMENTE_ESTOQUE: TBCDField;
    cdsEspecieQTDE_MUDA_ESTOQUE: TIntegerField;
    cdsLote_SementeID_COMPRA_ITEM: TIntegerField;
    cdsLote_MudaID_COMPRA_ITEM: TIntegerField;
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
