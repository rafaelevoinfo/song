unit dmuFinanceiro;

interface

uses
  System.SysUtils, System.Classes, dmuBasico, dmuPrincipal, Data.DB,
  Datasnap.DBClient, uClientDataSet;

type
  TdmFinanceiro = class(TdmBasico)
    cdsBanco: TRFClientDataSet;
    cdsBancoID: TIntegerField;
    cdsBancoNOME: TStringField;
    cdsBanco_Conta_Corrente: TRFClientDataSet;
    cdsBanco_Conta_CorrenteID: TIntegerField;
    cdsBanco_Conta_CorrenteID_BANCO: TIntegerField;
    cdsBanco_Conta_CorrenteAGENCIA: TStringField;
    cdsBanco_Conta_CorrenteCONTA: TStringField;
    dsBanco: TDataSource;
    cdsFin_For_Cli: TRFClientDataSet;
    cdsFin_For_CliID: TIntegerField;
    cdsFin_For_CliID_CONTATO: TIntegerField;
    cdsFin_For_CliID_CIDADE: TIntegerField;
    cdsFin_For_CliNOME_FANTASIA: TStringField;
    cdsFin_For_CliRAZAO_SOCIAL: TStringField;
    cdsFin_For_CliENDERECO: TStringField;
    cdsFin_For_CliBAIRRO: TStringField;
    cdsFin_For_CliCOMPLEMENTO: TStringField;
    cdsFin_For_CliTIPO: TIntegerField;
    cdsFin_For_CliTELEFONE: TStringField;
    cdsFin_For_CliCELULAR: TStringField;
    cdsFin_For_CliEMAIL: TStringField;
    cdsFin_For_CliSITE: TStringField;
    cdsFin_For_CliCPF_CNPJ: TStringField;
    cdsFin_For_CliINSCRICAO_ESTADUAL: TStringField;
    cdsFin_For_CliINSCRICAO_MUNICIPAL: TStringField;
    cdsFin_For_CliRAMO_ATIVIDADE: TStringField;
    cdsFin_For_CliPESQUISA: TStringField;
    cdsFin_For_CliOBSERVACAO: TStringField;
    cdsFin_For_CliCARGO_CONTATO: TStringField;
    cdsPlano_Contas: TRFClientDataSet;
    cdsPlano_ContasID: TIntegerField;
    cdsPlano_ContasNOME: TStringField;
    cdsPlano_ContasIDENTIFICADOR: TStringField;
    cdsPlano_ContasTIPO: TSmallintField;
    cdsPlano_ContasID_CONTA_PAI: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFinanceiro: TdmFinanceiro;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
