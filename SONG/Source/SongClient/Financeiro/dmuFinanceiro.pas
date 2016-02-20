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
    cdsFinanciador: TRFClientDataSet;
    cdsFinanciadorID: TIntegerField;
    cdsFinanciadorNOME: TStringField;
    cdsFinanciadorID_PESSOA: TIntegerField;
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
