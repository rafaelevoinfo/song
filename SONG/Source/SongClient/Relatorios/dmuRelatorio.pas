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
    cdsSaldoDetalhado: TRFClientDataSet;
    cdsSaldoDetalhadoTIPO: TStringField;
    cdsSaldoDetalhadoORIGEM: TStringField;
    cdsSaldoDetalhadoDESCRICAO: TStringField;
    cdsSaldoDetalhadoVALOR: TBCDField;
    dtfldSaldoDetalhadoDATA: TDateField;
    cdsSaldoDetalhadoPROJETO_FUNDO: TStringField;
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