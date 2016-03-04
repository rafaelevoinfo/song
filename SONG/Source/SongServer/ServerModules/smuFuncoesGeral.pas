unit smuFuncoesGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, Datasnap.DSAuth, uRoles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uQuery, dmuPrincipal, uUtils, uTypes, System.IOUtils,
  System.RegularExpressions,  MidasLib, Midas;

type
  TsmFuncoesGeral = class(TsmBasico)
    qId: TRFQuery;
    qIdID: TIntegerField;
  private
    { Private declarations }
  public
    function fpuVerificarNovaVersao(ipVersaoAtual: string): String;
    function fpuGetId(ipTabela: string): Integer;
    function fpuBaixarAtualizacao(ipVersao: string): TStream;
    function fpuDataHoraAtual:string;
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
  vaFile := coPastaAtualizacoes+coNomePadraoSongClient+ipVersao+coExtensaoCompactacao;
  if TFile.Exists(vaFile) then
    begin
      Result := TBytesStream.Create();
      TBytesStream(Result).LoadFromFile(vaFile);
      Result.Position := 0;
    end;
end;

function TsmFuncoesGeral.fpuDataHoraAtual: string;
begin
  Result := DateTimeToStr(now);
end;

function TsmFuncoesGeral.fpuGetId(ipTabela: string): Integer;
begin
  qId.Connection := dmPrincipal.Connection;

  qId.Close;
  qId.MacroByName('GENERATOR').AsRaw := 'GEN_' + ipTabela.ToUpper;
  qId.Open();

  Result := qIdID.AsInteger;
end;

function TsmFuncoesGeral.fpuVerificarNovaVersao(ipVersaoAtual: string): String;
var
  vaVersaoServer: string;
begin
  Result := '';
  vaVersaoServer := TUtils.fpuVersaoExecutavel(Application.ExeName, viBuild);
  if vaVersaoServer <> ipVersaoAtual then
    begin
      if TFile.Exists(coPastaAtualizacoes + coNomePadraoSongClient + vaVersaoServer+coExtensaoCompactacao) then
        Result := vaVersaoServer
      else
        raise Exception.Create('Vers�o incompat�vel com a vers�o do servidor.');
    end;
end;

end.
