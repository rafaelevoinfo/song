unit smuFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery, dmuPrincipal,
  Datasnap.Provider, uUtils, uClientDataSet, uSQLGenerator;

type
  TsmFinanceiro = class(TsmBasico)
    qBanco: TRFQuery;
    qBanco_Conta_Corrente: TRFQuery;
    qBancoID: TIntegerField;
    qBancoNOME: TStringField;
    qBanco_Conta_CorrenteID: TIntegerField;
    qBanco_Conta_CorrenteID_BANCO: TIntegerField;
    qBanco_Conta_CorrenteAGENCIA: TStringField;
    qBanco_Conta_CorrenteCONTA: TStringField;
    qFin_For_Cli: TRFQuery;
    qFin_For_CliID: TIntegerField;
    qFin_For_CliID_CONTATO: TIntegerField;
    qFin_For_CliID_CIDADE: TIntegerField;
    qFin_For_CliNOME_FANTASIA: TStringField;
    qFin_For_CliRAZAO_SOCIAL: TStringField;
    qFin_For_CliENDERECO: TStringField;
    qFin_For_CliBAIRRO: TStringField;
    qFin_For_CliCOMPLEMENTO: TStringField;
    qFin_For_CliTIPO: TIntegerField;
    qFin_For_CliTELEFONE: TStringField;
    qFin_For_CliCELULAR: TStringField;
    qFin_For_CliEMAIL: TStringField;
    qFin_For_CliSITE: TStringField;
    qFin_For_CliCPF_CNPJ: TStringField;
    qFin_For_CliINSCRICAO_ESTADUAL: TStringField;
    qFin_For_CliINSCRICAO_MUNICIPAL: TStringField;
    qFin_For_CliRAMO_ATIVIDADE: TStringField;
    qFin_For_CliPESQUISA: TStringField;
    qFin_For_CliOBSERVACAO: TStringField;
  private
    { Private declarations }
  protected
    function fprMontarWhere(ipTabela: string; ipParams: TParams): string; override;
  public
    { Public declarations }
  end;

var
  smFinanceiro: TsmFinanceiro;

implementation

{$R *.dfm}

{ TsmFinanceiro }

function TsmFinanceiro.fprMontarWhere(ipTabela: string;
  ipParams: TParams): string;
var
  i: Integer;
  vaParam: TParam;
  vaValor, vaOperador: string;
begin
  Result := inherited;
  for i := 0 to ipParams.Count - 1 do
    begin
      vaParam := ipParams[i];
      TUtils.ppuExtrairValorOperadorParametro(vaParam.Text, vaValor, vaOperador, TParametros.coDelimitador);
      if ipTabela = 'FIN_FOR_CLI' then
        begin
          if vaParam.Name = TParametros.coTipo then
            Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'TIPO', vaValor.ToInteger, vaOperador)
          else if vaParam.Name = TParametros.coNomeFantasia then
            Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'NOME_FANTASIA', vaValor, vaOperador)
          else if vaParam.Name = TParametros.coRazaoSocial then
            Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'RAZAO_SOCIAL', vaValor, vaOperador)
          else if vaParam.Name = TParametros.coCpfCnpj then
            Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'CPF_CNPJ', vaValor, vaOperador)
        end
    end;
end;

end.
