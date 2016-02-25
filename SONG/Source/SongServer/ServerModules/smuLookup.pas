unit smuLookup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, dmuPrincipal,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uQuery, uUtils, uSQLGenerator, uClientDataSet,
  System.RegularExpressions;

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
begin
  Result := inherited;
  for i := 0 to ipParams.Count - 1 do
    begin
      vaParam := ipParams[i];
      if ipTabela = 'ATIVIDADE' then
        begin
          if vaParam.Name = 'PROJETO' then
            begin
              Result := TSQLGenerator.fpuFilterInteger(Result, 'ATIVIDADE', 'ID_PROJETO', TUtils.fpuConverterStringToArrayInteger(vaParam.Text));
              Result := TSQLGenerator.fpuFilterInteger(Result, 'ATIVIDADE_PROJETO', 'ID_PROJETO',
                TUtils.fpuConverterStringToArrayInteger(vaParam.Text));
            end;
        end
      else if ipTabela = 'PROJETO' then
        begin
          if vaParam.Name = TParametros.coSituacaoDiferente then
            begin
              Result := Result + 'PROJETO.SITUACAO NOT IN (' + StringReplace(vaParam.Text, ';', ',',[rfReplaceAll]) + ') and ';
            end;
        end;
    end;

end;

end.
