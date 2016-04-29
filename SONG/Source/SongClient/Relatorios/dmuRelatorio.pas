unit dmuRelatorio;

interface

uses
  System.SysUtils, System.Classes, dmuBasico, dmuPrincipal, Data.DB,
  Datasnap.DBClient, uClientDataSet;

type
  TdmRelatorio = class(TdmBasico)
    cdsSaldoProjeto: TRFClientDataSet;
    cdsSaldoProjetoID: TIntegerField;
    cdsSaldoProjetoNOME: TStringField;
    cdsSaldoProjetoORCAMENTO: TBCDField;
    cdsSaldoProjetoVALOR_RECEBIDO: TBCDField;
    cdsSaldoProjetoVALOR_GASTO: TFMTBCDField;
    cdsSaldoProjetoSALDO_REAL: TFMTBCDField;
    cdsSaldoProjetoSALDO_PREVISTO: TFMTBCDField;
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

end.
