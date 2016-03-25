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
    qFin_For_CliCARGO_CONTATO: TStringField;
    qPlano_Contas: TRFQuery;
    qPlano_ContasID: TIntegerField;
    qPlano_ContasNOME: TStringField;
    qPlano_ContasIDENTIFICADOR: TStringField;
    qPlano_ContasTIPO: TSmallintField;
    qPlano_ContasID_CONTA_PAI: TIntegerField;
  private
    { Private declarations }
  protected
    function fprMontarWhere(ipTabela, ipWhere: string; ipParam: TParam): string; override;
  public
    { Public declarations }
  end;

var
  smFinanceiro: TsmFinanceiro;

implementation

{$R *.dfm}

{ TsmFinanceiro }

function TsmFinanceiro.fprMontarWhere(ipTabela, ipWhere: string; ipParam: TParam): string;
var
  vaValor, vaOperador: string;
begin
  Result := inherited;
  TUtils.ppuExtrairValorOperadorParametro(ipParam.Text, vaValor, vaOperador, TParametros.coDelimitador);
  if ipTabela = 'FIN_FOR_CLI' then
    begin
      if ipParam.Name = TParametros.coTipo then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'TIPO', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coNomeFantasia then
        Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'NOME_FANTASIA', vaValor, vaOperador)
      else if ipParam.Name = TParametros.coRazaoSocial then
        Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'RAZAO_SOCIAL', vaValor, vaOperador)
      else if ipParam.Name = TParametros.coCpfCnpj then
        Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'CPF_CNPJ', vaValor, vaOperador)
    end
  else if ipTabela = 'PLANO_CONTAS' then
    begin
      if ipParam.Name = TParametros.coTipo then
        begin
          if vaValor.ToInteger <> 0 then
            Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'TIPO', vaValor.ToInteger(), vaOperador)
          else
            Result := Result + '((PLANO_CONTAS.Tipo = 0) OR (PLANO_CONTAS.Tipo is null)) ' + vaOperador;
        end
      else if ipParam.Name = TParametros.coIdentificadorPlanoContas then
        begin
          Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'IDENTIFICADOR', vaValor, True, False, vaOperador)
        end;
    end;

end;

end.
