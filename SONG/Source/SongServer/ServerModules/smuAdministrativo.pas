unit smuAdministrativo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, dmuPrincipal, uTypes,
  uSQLGenerator;

type
  TsmAdministrativo = class(TsmBasico)
    qPessoa: TFDQuery;
    qPerfil: TFDQuery;
    qPerfilID: TLargeintField;
    qPerfilNOME: TStringField;
    qPerfilDESCRICAO: TStringField;
    qPessoaID: TLargeintField;
    qPessoaNOME: TStringField;
    qPessoaCELULAR: TIntegerField;
    qPessoaRG: TStringField;
    qPessoaCPF: TStringField;
    qPessoaENDERECO: TStringField;
    qPessoaLOGIN: TStringField;
    qPessoaSENHA: TStringField;
  private
    { Private declarations }
  protected
    function fprMontarWhere(ipTabela: string; ipParams: TParams): string; override;
  public
    { Public declarations }
  end;

var
  smAdministrativo: TsmAdministrativo;

implementation

{$R *.dfm}
{ TsmAdministrativo }

function TsmAdministrativo.fprMontarWhere(ipTabela: string; ipParams: TParams): string;
var
  vaParam: TParam;
  i: Integer;
begin
  Result := inherited;
  for i := 0 to ipParams.Count - 1 do
    begin
      vaParam := ipParams[i];
      if ipTabela = 'PESSOA' then
        begin

        end
      else if ipTabela = 'PERFIL' then
        begin

        end;
    end;

end;

end.
