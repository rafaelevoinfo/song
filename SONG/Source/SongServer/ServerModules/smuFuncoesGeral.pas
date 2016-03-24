unit smuFuncoesGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, Datasnap.DSAuth, uRoles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uQuery, dmuPrincipal, uUtils, uTypes, System.IOUtils,
  System.RegularExpressions,  MidasLib, Midas, smuFuncoesBasico;

type
  TsmFuncoesGeral = class(TsmFuncoesBasico)
  private
    { Private declarations }
  public
    function fpuVerificarNovaVersao(ipVersaoAtual: string): String;

    function fpuBaixarAtualizacao(ipVersao: string): TStream;

  end;

var
  smFuncoesGeral: TsmFuncoesGeral;

implementation

{$R *.dfm}
{ TsmFuncoesGeral }

function TsmFuncoesGeral.fpuBaixarAtualizacao(ipVersao: string): TStream;
var
  vaFile:string;
begin
  Result := nil;  //tem q retornar algo pq senao da erro
  vaFile := dmPrincipal.fpuPegarArquivoAtualizacao(ipVersao);
  if TFile.Exists(vaFile) then
    begin
    Result := TBytesStream.Create;
      TBytesStream(Result).LoadFromFile(vaFile);
      Result.Position := 0;
    end;
end;

function TsmFuncoesGeral.fpuVerificarNovaVersao(ipVersaoAtual: string): String;
begin
   dmPrincipal.fpuBuscarAtualizacao(ipVersaoAtual,Result);
end;

end.
