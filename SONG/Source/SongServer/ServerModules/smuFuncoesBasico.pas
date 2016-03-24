unit smuFuncoesBasico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery;

type
  TsmFuncoesBasico = class(TsmBasico)
    qId: TRFQuery;
    qIdID: TIntegerField;
  private
    { Private declarations }
  public
    function fpuGetId(ipTabela: string): Integer; virtual;
    function fpuDataHoraAtual: string; virtual;
  end;

var
  smFuncoesBasico: TsmFuncoesBasico;

implementation

uses
  dmuPrincipal;

{$R *.dfm}

{ TsmFuncoesBasico }

function TsmFuncoesBasico.fpuDataHoraAtual: string;
begin
  Result := DateTimeToStr(now);
end;

function TsmFuncoesBasico.fpuGetId(ipTabela: string): Integer;
begin
  qId.Connection := dmPrincipal.Connection;

  qId.Close;
  qId.MacroByName('GENERATOR').AsRaw := 'GEN_' + ipTabela.ToUpper;
  qId.Open();

  Result := qIdID.AsInteger;
end;

end.
