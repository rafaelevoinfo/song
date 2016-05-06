unit smuRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery,
  Datasnap.DBClient, uClientDataSet, uUtils;

type
  TsmRelatorio = class(TsmBasico)
    qSaldoProjeto: TRFQuery;
    qSaldoProjetoNOME: TStringField;
    qSaldoProjetoORCAMENTO: TBCDField;
    qSaldoProjetoVALOR_RECEBIDO: TBCDField;
    qSaldoProjetoVALOR_GASTO: TFMTBCDField;
    qSaldoProjetoSALDO_REAL: TFMTBCDField;
    qSaldoProjetoSALDO_PREVISTO: TFMTBCDField;
    qSaldoProjetoID: TIntegerField;
    qSaldoDetalhado: TRFQuery;
    qSaldoDetalhadoORIGEM: TStringField;
    qSaldoDetalhadoDESCRICAO: TStringField;
    qSaldoDetalhadoVALOR: TBCDField;
    dtfldSaldoDetalhadoDATA: TDateField;
    qSaldoDetalhadoPROJETO_FUNDO: TStringField;
    qSaldoDetalhadoTIPO: TStringField;
    qSaldoGeral: TRFQuery;
  private
    { Private declarations }
  public
    
  end;

var
  smRelatorio: TsmRelatorio;



implementation

uses
  dmuPrincipal;

{$R *.dfm}

{ TsmRelatorio }

end.