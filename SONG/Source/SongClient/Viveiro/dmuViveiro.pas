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
