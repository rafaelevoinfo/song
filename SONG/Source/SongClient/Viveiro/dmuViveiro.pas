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
    cdsMatrizLATITUDE: TBCDField;
    cdsMatrizLONGITUDE: TBCDField;
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
    dsLote_Muda: TDataSource;
    cdsSemeaduraOBSERVACAO: TStringField;
    cdsCanteiroDESCRICAO: TStringField;
    cdsMatrizDESCRICAO: TStringField;
    cdsEspecieOBSERVACAO: TStringField;
    cdsLote_MudaOBSERVACAO: TStringField;
    cdsGerminacaoDATA: TDateField;
    cdsLote_MudaDATA: TDateField;
    cdsLote_MudaTAXA_CLASSIFICACAO: TBCDField;
    cdsEspecieQTDE_SEMENTE_ESTOQUE: TBCDField;
    cdsLote_SementeID_COMPRA_ITEM: TIntegerField;
    cdsLote_MudaID_COMPRA_ITEM: TIntegerField;
    cdsLote_MudaID_LOTE_SEMENTE: TIntegerField;
    cdsLote_MudaSALDO: TIntegerField;
    cdsLote_MudaSTATUS: TSmallintField;
    cdsEspecieTEMPO_DESENVOLVIMENTO: TIntegerField;
    cdsEspecieQTDE_MUDA_PRONTA: TIntegerField;
    cdsEspecieQTDE_MUDA_DESENVOLVIMENTO: TIntegerField;
    cdsLote_Muda_Canteiro: TRFClientDataSet;
    cdsLote_Muda_CanteiroID: TIntegerField;
    cdsLote_Muda_CanteiroID_LOTE_MUDA: TIntegerField;
    cdsLote_Muda_CanteiroID_CANTEIRO: TIntegerField;
    cdsLote_Muda_CanteiroNOME_CANTEIRO: TStringField;
    cdsClassificacao: TRFClientDataSet;
    cdsClassificacaoID: TIntegerField;
    cdsClassificacaoID_LOTE_MUDA: TIntegerField;
    cdsClassificacaoID_PESSOA_CLASSIFICOU: TIntegerField;
    cdsClassificacaoDATA: TDateField;
    cdsClassificacaoQTDE: TIntegerField;
    cdsClassificacaoOBSERVACAO: TStringField;
    cdsClassificacaoPESSOA_CLASSIFICOU: TStringField;
    cdsEspecieMES_INICIO_COLETA: TIntegerField;
    cdsEspecieMES_FIM_COLETA: TIntegerField;
    cdsEspecieID_FAMILIA_BOTANICA: TIntegerField;
    cdsFamilia_Botanica: TRFClientDataSet;
    cdsFamilia_BotanicaID: TIntegerField;
    cdsFamilia_BotanicaNOME: TStringField;
    cdsEspeciePESO_MEDIO_SEMENTE: TBCDField;
    cdsEspecieCALC_TOTAL_MUDAS: TIntegerField;
    cdsEspecieQTDE_SEMENTE_TUBETE: TIntegerField;
    cdsCamara_Fria: TRFClientDataSet;
    cdsCamara_FriaID: TIntegerField;
    cdsCamara_FriaNOME: TStringField;
    cdsLote_SementeID_CAMARA_FRIA: TIntegerField;
    cdsLote_SementeCAMARA_FRIA: TStringField;
    cdsLote_SementeID_LOTE_SEMENTE_ORIGEM: TIntegerField;
    cdsLote_SementeRAZAO_SOCIAL: TStringField;
    cdsLote_MudaRAZAO_SOCIAL: TStringField;
    cdsEspecieCLASSIFICACAO: TSmallintField;
    dsEspecie: TDataSource;
    cdsEspecie_Bioma: TRFClientDataSet;
    cdsEspecie_BiomaID: TIntegerField;
    cdsEspecie_BiomaID_ESPECIE: TIntegerField;
    cdsEspecie_BiomaBIOMA: TSmallintField;
    cdsEspecieID_TIPO_ESPECIE: TIntegerField;
    cdsEspecieTIPO_ESPECIE: TStringField;
    cdsEspecieCATEGORIA_ARMAZENAMENTO: TSmallintField;
    cdsTipo_Especie: TRFClientDataSet;
    cdsTipo_EspecieID: TIntegerField;
    cdsTipo_EspecieNOME: TStringField;
    cdsTipo_EspecieDESCRICAO: TStringField;
    cdsMix_Muda: TRFClientDataSet;
    cdsMix_MudaID: TIntegerField;
    cdsMix_MudaID_CLIENTE: TIntegerField;
    cdsMix_MudaCLIENTE: TStringField;
    cdsMix_MudaID_PESSOA_RESPONSAVEL: TIntegerField;
    cdsMix_MudaRESPONSAVEL: TStringField;
    cdsMix_MudaDATA: TDateField;
    cdsMix_MudaQTDE_MUDA: TIntegerField;
    cdsMix_MudaQTDE_MUDA_ROCAMBOLE: TIntegerField;
    cdsMix_MudaDESCRICAO: TStringField;
    cdsMix_Muda_Especie: TRFClientDataSet;
    cdsMix_Muda_EspecieID: TIntegerField;
    cdsMix_Muda_EspecieID_MIX_MUDA: TIntegerField;
    cdsMix_Muda_EspecieID_ESPECIE: TIntegerField;
    cdsMix_Muda_EspecieESPECIE: TStringField;
    cdsMix_Muda_EspecieNOME_CIENTIFICO: TStringField;
    cdsMix_Muda_Especie_Lote: TRFClientDataSet;
    cdsMix_Muda_Especie_LoteID: TIntegerField;
    cdsMix_Muda_Especie_LoteID_LOTE_MUDA: TIntegerField;
    cdsMix_Muda_Especie_LoteLOTE: TStringField;
    cdsMix_Muda_Especie_LoteID_MIX_MUDA_ESPECIE: TIntegerField;
    dsMix_Muda: TDataSource;
    dsMix_Muda_Especie: TDataSource;
    cdsMix_MudaID_VENDA: TIntegerField;
    cdsMix_MudaID_SAIDA: TIntegerField;
    cdsMix_Muda_Especie_LoteCANTEIROS: TMemoField;
    cdsMix_Muda_EspecieQTDE_MUDA_PRONTA: TIntegerField;
    cdsMix_Muda_Especie_LoteQTDE: TIntegerField;
    cdsMix_Muda_Especie_Lote_Canteiro: TRFClientDataSet;
    cdsMix_Muda_Especie_Lote_CanteiroID_CANTEIRO: TIntegerField;
    cdsMix_Muda_Especie_Lote_CanteiroCANTEIRO: TStringField;
    cdsMix_Muda_Especie_Lote_CanteiroID_ESPECIE: TIntegerField;
    cdsMix_Muda_Especie_Lote_CanteiroESPECIE: TStringField;
    cdsMix_Muda_Especie_Lote_CanteiroLOTE: TStringField;
    cdsMix_Muda_Especie_Lote_CanteiroQTDE_MUDA_RETIRAR: TIntegerField;
    cdsMix_Muda_Especie_Lote_CanteiroID_CLIENTE: TIntegerField;
    cdsMix_Muda_Especie_Lote_CanteiroID_PESSOA_RESPONSAVEL: TIntegerField;
    cdsMix_Muda_Especie_Lote_CanteiroRESPONSAVEL: TStringField;
    cdsMix_Muda_Especie_Lote_CanteiroCLIENTE: TStringField;
    cdsMix_Muda_Especie_Lote_CanteiroQTDE_MUDA: TIntegerField;
    cdsMix_Muda_Especie_Lote_CanteiroQTDE_MUDA_ROCAMBOLE: TIntegerField;
    cdsTipo_EspecieNATIVA: TSmallintField;
    cdsMix_Muda_Especie_Lote_CanteiroID_LOTE: TIntegerField;
    cdsLote_SementeID_COLETA: TStringField;
    procedure cdsEspecieCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmViveiro: TdmViveiro;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}


procedure TdmViveiro.cdsEspecieCalcFields(DataSet: TDataSet);
begin
  inherited;
  cdsEspecieCALC_TOTAL_MUDAS.AsInteger := cdsEspecieQTDE_MUDA_DESENVOLVIMENTO.AsInteger + cdsEspecieQTDE_MUDA_PRONTA.AsInteger;
end;

end.
