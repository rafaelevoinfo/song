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
    qlkFinanciadorNOME: TStringField;
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
  private
    { Private declarations }
  protected
    function fprMontarWhere(ipTabela: string; ipParams: TParams): string; override;
  end;

var
  smLookup: TsmLookup;

implementation


{$R *.dfm}

{ TsmLookup }

function TsmLookup.fprMontarWhere(ipTabela: string; ipParams: TParams): string;
var
  i: Integer;
  vaParam: TParam;
  vaValor, vaOperador:string;
begin
  Result := inherited;
  for i := 0 to ipParams.Count - 1 do
    begin
      vaParam := ipParams[i];
      TUtils.ppuExtrairValorOperadorParametro(vaParam.Text, vaValor, vaOperador, TParametros.coDelimitador);

      if ipTabela = 'ATIVIDADE' then
        begin
          if vaParam.Name = TParametros.coProjeto then
            begin
              Result := TSQLGenerator.fpuFilterInteger(Result, 'ATIVIDADE', 'ID_PROJETO', TUtils.fpuConverterStringToArrayInteger(vaValor),
                TOperadores.coOr);
              Result := TSQLGenerator.fpuFilterInteger(Result, 'ATIVIDADE_PROJETO', 'ID_PROJETO',
                TUtils.fpuConverterStringToArrayInteger(vaValor), vaOperador);
            end
          else if vaParam.Name = TParametros.coStatusDiferente then
            begin
              Result := Result + 'ATIVIDADE.STATUS NOT IN (' + StringReplace(vaValor, ';', ', ', [rfReplaceAll]) + ') '+vaOperador;
            end;
        end
      else if ipTabela = 'PROJETO' then
        begin
          if vaParam.Name = TParametros.coStatusDiferente then
            begin
              Result := Result + 'PROJETO.STATUS NOT IN (' + StringReplace(vaValor, ';', ', ', [rfReplaceAll]) + ') '+ vaOperador;
            end;
        end;
    end;

end;

end.
