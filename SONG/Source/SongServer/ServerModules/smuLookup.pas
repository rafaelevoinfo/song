unit smuLookup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, dmuPrincipal,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uQuery, uUtils, uSQLGenerator, uClientDataSet,
  System.RegularExpressions, uTypes;

type
  TsmLookup = class(TsmBasico)
    qlkPerfil: TRFQuery;
    qlkPerfilID: TIntegerField;
    qlkPerfilNOME: TStringField;
    qlkPessoa: TRFQuery;
    qlkOrganizacao: TRFQuery;
    qlkOrganizacaoID: TIntegerField;
    qlkOrganizacaoNOME: TStringField;
    qlkFinanciador: TRFQuery;
    qlkFinanciadorID: TIntegerField;
    qlkBanco: TRFQuery;
    qlkBancoID: TIntegerField;
    qlkBancoNOME: TStringField;
    qlkBanco_Conta_Corrente: TRFQuery;
    qlkBanco_Conta_CorrenteID: TIntegerField;
    qlkBanco_Conta_CorrenteID_BANCO: TIntegerField;
    qlkBanco_Conta_CorrenteAGENCIA: TStringField;
    qlkBanco_Conta_CorrenteCONTA: TStringField;
    qlkConta_Corrente: TRFQuery;
    qlkConta_CorrenteID: TIntegerField;
    qlkConta_CorrenteID_BANCO: TIntegerField;
    qlkConta_CorrenteNOME: TStringField;
    qlkConta_CorrenteAGENCIA: TStringField;
    qlkConta_CorrenteCONTA: TStringField;
    qlkAtividade: TRFQuery;
    qlkAtividadeID: TIntegerField;
    qlkAtividadeNOME: TStringField;
    qlkAtividadeSTATUS: TSmallintField;
    qlkProjeto: TRFQuery;
    qlkCidade: TRFQuery;
    qlkCidadeID: TIntegerField;
    qlkCidadeUF: TStringField;
    qlkCidadeNOME: TStringField;
    qlkEspecie: TRFQuery;
    qlkEspecieID: TIntegerField;
    qlkEspecieNOME: TStringField;
    qlkMatriz: TRFQuery;
    qlkCanteiro: TRFQuery;
    qlkCanteiroID: TIntegerField;
    qlkCanteiroNOME: TStringField;
    qlkEspecieVALOR_MUDA: TBCDField;
    qlkEspecieVALOR_KG_SEMENTE: TBCDField;
    qlkEspecieTEMPO_GERMINACAO: TIntegerField;
    qlkPlano_Contas: TRFQuery;
    qlkPlano_ContasID: TIntegerField;
    qlkPlano_ContasID_CONTA_PAI: TIntegerField;
    qlkPlano_ContasTIPO: TSmallintField;
    qlkPlano_ContasNOME: TStringField;
    qlkRubrica: TRFQuery;
    qlkRubricaID: TIntegerField;
    qlkRubricaID_RUBRICA_PAI: TIntegerField;
    qlkRubricaNOME: TStringField;
    qlkFinanciadorNOME: TStringField;
    qlkFornecedor: TRFQuery;
    qlkFornecedorID: TIntegerField;
    qlkFornecedorNOME: TStringField;
    qlkFin_For_Cli: TRFQuery;
    qlkFin_For_CliID: TIntegerField;
    qlkFin_For_CliNOME: TStringField;
    qlkItem: TRFQuery;
    qlkItemID: TIntegerField;
    qlkItemNOME: TStringField;
    qlkItemTIPO: TSmallintField;
  private
    { Private declarations }
  protected
    function fprMontarWhere(ipTabela, ipWhere: string; ipParam: TParam): string; override;
  end;

var
  smLookup: TsmLookup;

implementation


{$R *.dfm}

{ TsmLookup }

function TsmLookup.fprMontarWhere(ipTabela, ipWhere: string; ipParam: TParam): string;
var
  vaValor, vaOperador: string;
  vaCodigos: TArray<Integer>;
begin
  Result := inherited;
  TUtils.ppuExtrairValorOperadorParametro(ipParam.Text, vaValor, vaOperador, TParametros.coDelimitador);

  if ipTabela = 'ATIVIDADE' then
    begin
      if ipParam.Name = TParametros.coProjeto then
        begin
          vaCodigos := TUtils.fpuConverterStringToArrayInteger(vaValor);
          Result := TSQLGenerator.fpuFilterInteger(Result, ['ATIVIDADE', 'ATIVIDADE_PROJETO'],
            ['ID_PROJETO', 'ID_PROJETO'], [vaCodigos, vaCodigos], TOperadores.coOr, vaOperador);
        end
      else if ipParam.Name = TParametros.coStatusDiferente then
        begin
          Result := '(' + Result + 'ATIVIDADE.STATUS NOT IN (' + StringReplace(vaValor, ';', ', ', [rfReplaceAll]) + ')) ' + vaOperador;
        end;
    end
  else if ipTabela = 'PROJETO' then
    begin
      if ipParam.Name = TParametros.coStatusDiferente then
        begin
          Result := Result + 'PROJETO.STATUS NOT IN (' + StringReplace(vaValor, ';', ', ', [rfReplaceAll]) + ') ' + vaOperador;
        end;
    end
  else if ipTabela = 'PESSOA' then
    begin
      if ipParam.Name = TParametros.coLogin then
        Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'login', vaValor, vaOperador)
      else if ipParam.Name = TParametros.coTipo then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'tipo', TUtils.fpuConverterStringToArrayInteger(vaValor), vaOperador)
    end
  else if ipTabela = 'MATRIZ' then
    begin
      if ipParam.Name = TParametros.coEspecie then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_ESPECIE', vaValor.ToInteger(), vaOperador);
    end
  else if ipTabela = 'PLANO_CONTAS' then
    begin
      if ipParam.Name = TParametros.coTipo then
        begin
          if vaValor.ToInteger <> 0 then
            Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'TIPO', vaValor.ToInteger(), vaOperador)
          else
            Result := Result + '((PLANO_CONTAS.Tipo = 0) OR (PLANO_CONTAS.Tipo is null)) ' + vaOperador;
        end;
    end
  else if ipTabela = 'FIN_FOR_CLI' then
    begin
      if ipParam.Name = TParametros.coTipo then
        begin
            Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'tipo', TUtils.fpuConverterStringToArrayInteger(vaValor), vaOperador)
        end;
    end;

end;

end.
