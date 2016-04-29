unit smuRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  smRelatorio: TsmRelatorio;

implementation

uses
  dmuPrincipal;

{$R *.dfm}

end.
