unit smuFuncoesGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, Datasnap.DSAuth, uRoles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uQuery, dmuPrincipal;

type
  TsmFuncoesGeral = class(TsmBasico)
    qId: TRFQuery;
    qIdID: TIntegerField;
  private
    { Private declarations }
  public
    function fpuVerificarNovaVersao(ipVersaoAtual: string): String;
    function fpuGetId(ipTabela: string): Integer;
  end;

var
  smFuncoesGeral: TsmFuncoesGeral;

implementation

{$R *.dfm}
{ TsmFuncoesGeral }

function TsmFuncoesGeral.fpuGetId(ipTabela: string): Integer;
begin
  qId.Connection := dmPrincipal.Connection;

  qId.Close;
  qId.MacroByName('GENERATOR').AsRaw := 'GEN_'+ipTabela.ToUpper;
  qId.Open();

  Result := qIdID.AsInteger;
end;

function TsmFuncoesGeral.fpuVerificarNovaVersao(ipVersaoAtual: string): String;
begin
   Result := 'ok';
end;


end.
