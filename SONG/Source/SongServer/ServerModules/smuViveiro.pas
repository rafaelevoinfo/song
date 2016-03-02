unit smuViveiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uQuery, dmuPrincipal, uUtils, uClientDataSet,
  uSQLGenerator;

type
  TsmViveiro = class(TsmBasico)
    qEspecie: TRFQuery;
    qEspecieID: TIntegerField;
    qEspecieNOME: TStringField;
    qEspecieNOME_CIENTIFICO: TStringField;
    qEspecieFAMILIA_BOTANICA: TStringField;
    qEspecieOBSERVACAO: TStringField;
  private
    { Private declarations }
  protected
     function fprMontarWhere(ipTabela: string; ipParams: TParams): string; override;
  public
    { Public declarations }
  end;

var
  smViveiro: TsmViveiro;

implementation

{$R *.dfm}

{ TsmViveiro }

function TsmViveiro.fprMontarWhere(ipTabela: string; ipParams: TParams): string;
var
  i:Integer;
  vaParam:TParam;
  vaValor, vaOperador:string;
begin
  Result := inherited;
  for i := 0 to ipParams.Count - 1 do
    begin
      vaParam := ipParams[i];
      TUtils.ppuExtrairValorOperadorParametro(vaParam.Text, vaValor, vaOperador, TParametros.coDelimitador);
      if ipTabela = 'ESPECIE' then
        begin
          if vaParam.Name = TParametros.coNome then
            Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'NOME', vaValor, vaOperador)
          else if vaParam.Name = TParametros.coNomeCientifico then
            Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'NOME_CIENTIFICO', vaValor, vaOperador)
          else if vaParam.Name = TParametros.coFamiliaBotanica then
            Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'FAMILIA_BOTANICA', vaValor, vaOperador)
        end;
    end;
end;

end.
