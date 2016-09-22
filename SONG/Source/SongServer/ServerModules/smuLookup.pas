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
    qlkFornecedor: TRFQuery;
    qlkFornecedorID: TIntegerField;
    qlkFin_For_Cli: TRFQuery;
    qlkFin_For_CliID: TIntegerField;
    qlkItem: TRFQuery;
    qlkItemID: TIntegerField;
    qlkItemNOME: TStringField;
    qlkItemTIPO: TSmallintField;
    qlkItemUNIDADE: TStringField;
    qlkRubrica_Atividade: TRFQuery;
    qlkProjeto_Area: TRFQuery;
    qlkProjeto_Area_Atividade: TRFQuery;
    qlkProjeto_Area_AtividadeID: TIntegerField;
    qlkProjeto_Area_AtividadeID_PROJETO: TIntegerField;
    qlkProjeto_Area_AtividadeNOME: TStringField;
    qlkProjeto_AreaID: TIntegerField;
    qlkProjeto_AreaID_PROJETO: TIntegerField;
    qlkProjeto_AreaNOME: TStringField;
    qlkRubrica_AtividadeID: TIntegerField;
    qlkRubrica_AtividadeNOME: TStringField;
    qlkCompra: TRFQuery;
    qlkCompraID: TIntegerField;
    qlkCompraID_FORNECEDOR: TIntegerField;
    qlkCompraDATA: TSQLTimeStampField;
    qlkCompraNOME_FANTASIA: TStringField;
    qlkFundo: TRFQuery;
    qlkFundoID: TIntegerField;
    qlkFundoNOME: TStringField;
    qlkFundoSALDO: TBCDField;
    qlkOrganizacaoCNPJ: TStringField;
    qlkOrganizacaoLOGO: TBlobField;
    qlkProjetoID: TIntegerField;
    qlkProjetoNOME: TStringField;
    qlkFundoORGANIZACAO: TStringField;
    qlkProjeto_Organizacao: TRFQuery;
    qlkProjeto_OrganizacaoID: TIntegerField;
    qlkProjeto_OrganizacaoNOME: TStringField;
    qlkFundoID_ORGANIZACAO: TIntegerField;
    qlkProjeto_OrganizacaoID_ORGANIZACAO: TIntegerField;
    qlkLote_Semente: TRFQuery;
    qlkLote_SementeID: TIntegerField;
    qlkLote_SementeNOME: TStringField;
    qlkLote_SementeQTDE_ARMAZENADA: TBCDField;
    qlkEspecieQTDE_SEMENTE_ESTOQUE: TBCDField;
    qlkLote_Muda: TRFQuery;
    qlkLote_MudaID: TIntegerField;
    qlkLote_MudaNOME: TStringField;
    qlkLote_MudaSALDO: TIntegerField;
    qlkPessoaID: TIntegerField;
    qlkPessoaNOME: TStringField;
    qlkItemSALDO: TBCDField;
    qlkProjeto_Rubrica: TRFQuery;
    qlkProjeto_RubricaID: TIntegerField;
    qlkProjeto_RubricaORCAMENTO: TBCDField;
    qlkProjeto_RubricaSALDO_REAL: TFMTBCDField;
    qlkProjeto_RubricaNOME_RUBRICA: TStringField;
    qlkLote_MudaID_ESPECIE: TIntegerField;
    qlkLote_SementeID_ESPECIE: TIntegerField;
    qlkFornecedorNOME_FANTASIA: TStringField;
    qlkFornecedorRAZAO_SOCIAL: TStringField;
    qlkFinanciadorNOME_FANTASIA: TStringField;
    qlkFinanciadorRAZAO_SOCIAL: TStringField;
    qlkFin_For_CliNOME_FANTASIA: TStringField;
    qlkFin_For_CliRAZAO_SOCIAL: TStringField;
    qlkLocal_Uso: TRFQuery;
    qlkLocal_UsoID: TIntegerField;
    qlkLocal_UsoNOME: TStringField;
    qlkLote_MudaSTATUS: TSmallintField;
    qlkEspecieQTDE_MUDA_PRONTA: TIntegerField;
    qlkEspecieQTDE_MUDA_DESENVOLVIMENTO: TIntegerField;
    qlkFamilia_Botanica: TRFQuery;
    qlkFamilia_BotanicaID: TIntegerField;
    qlkFamilia_BotanicaNOME: TStringField;
    qlkEspecieQTDE_SEMENTE_TUBETE: TIntegerField;
    qlkCamara_Fria: TRFQuery;
    qlkCamara_FriaID: TIntegerField;
    qlkCamara_FriaNOME: TStringField;
    qlkEspeciePESO_MEDIO_SEMENTE: TBCDField;
    qlkAgenda: TRFQuery;
    qlkAgendaID: TIntegerField;
    qlkAgendaNOME: TStringField;
    qlkAgendaTIPO: TSmallintField;
    qlkAgenda_Pessoa: TRFQuery;
    qlkAgenda_PessoaID: TIntegerField;
    qlkAgenda_PessoaID_AGENDA: TIntegerField;
    qlkAgenda_PessoaID_PESSOA: TIntegerField;
    qlkAgenda_PessoaSOMENTE_VISUALIZACAO: TSmallintField;
    qlkItem_Patrimonio: TRFQuery;
    qlkItem_PatrimonioID: TIntegerField;
    qlkItem_PatrimonioNOME: TStringField;
    qlkItem_PatrimonioATIVO: TSmallintField;
    qlkItem_PatrimonioTAXA_DEPRECIACAO_ANUAL: TIntegerField;
    qlkDoador: TRFQuery;
    qlkDoadorID_PESSOA_DOADORA: TIntegerField;
    qlkDoadorNOME: TStringField;
    qlkDoadorTOTAL: TBCDField;
    qlkRubrica_AtividadeSALDO_REAL: TFMTBCDField;
    qlkOrganizacaoENDERECO: TStringField;
    qlkOrganizacaoBAIRRO: TStringField;
    qlkOrganizacaoCOMPLEMENTO: TStringField;
    qlkOrganizacaoTELEFONE: TStringField;
    qlkOrganizacaoSITE: TStringField;
    qlkOrganizacaoEMAIL: TStringField;
    qlkOrganizacaoCIDADE: TStringField;
    qlkArea_Atuacao_Projeto: TRFQuery;
    qlkArea_Atuacao_ProjetoID: TIntegerField;
    qlkArea_Atuacao_ProjetoNOME: TStringField;
    qlkArea_Execucao: TRFQuery;
    qlkArea_ExecucaoID: TIntegerField;
    qlkArea_ExecucaoID_AREA_ATUACAO: TIntegerField;
    qlkArea_ExecucaoNOME: TStringField;
    qlkArea_Atuacao_ProjetoID_PROJETO: TIntegerField;
    qlkArea_Atuacao: TRFQuery;
    qlkArea_AtuacaoID: TIntegerField;
    qlkArea_AtuacaoNOME: TStringField;
    qlkOrganizacaoLOGO_SECUNDARIA: TBlobField;
    qlkTipo_Especie: TRFQuery;
    qlkTipo_EspecieID: TIntegerField;
    qlkTipo_EspecieNOME: TStringField;
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
    end
  else if ipTabela = 'ITEM' then
    begin
      if ipParam.Name = TParametros.coTipo then
        begin
          Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'tipo', TUtils.fpuConverterStringToArrayInteger(vaValor), vaOperador)
        end;
    end
  else if ipTabela = 'RUBRICA' then
    begin
      if ipParam.Name = TParametros.coProjeto then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'PROJETO_RUBRICA', 'ID_PROJETO', vaValor.ToInteger, vaOperador);
    end
  else if ipTabela = 'RUBRICA_ATIVIDADE' then
    begin
      if ipParam.Name = TParametros.coAtividade then
        Result := TSQLGenerator.fpuFilterInteger(Result,'ATIVIDADE','ID',vaValor.ToInteger,vaOperador)
      else if ipParam.Name = TParametros.coProjeto then
        Result := TSQLGenerator.fpuFilterInteger(Result,'PROJETO_RUBRICA','ID_PROJETO',vaValor.ToInteger,vaOperador);
    end
  else if ipTabela = 'PROJETO_AREA' then
    begin
      if ipParam.Name = TParametros.coProjeto then
        Result := TSQLGenerator.fpuFilterInteger(Result, 'PROJETO_AREA', 'ID_PROJETO', vaValor.ToInteger, vaOperador);
    end
  else if ipTabela = 'PROJETO_AREA_ATIVIDADE' then
    begin
      if ipParam.Name = TParametros.coAtividade then
        Result := Result + '(atividade.id = ' + vaValor + ')';
    end
  else if ipTabela = 'COMPRA' then
    begin
      if ipParam.Name = TParametros.coStatusEntrega then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'STATUS_ENTREGA', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coData then
        Result := TSQLGenerator.fpuFilterData(Result, ipTabela, 'DATA', TUtils.fpuExtrairData(vaValor, 0), TUtils.fpuExtrairData(vaValor, 1),
          vaOperador);
    end
  else if ipTabela = 'PROJETO_ORGANIZACAO' then
    begin
      if ipParam.Name = TParametros.coProjeto then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_PROJETO', vaValor.ToInteger, vaOperador)
    end
  else if (ipTabela = 'LOTE_SEMENTE') then
    begin
      if ipParam.Name = TParametros.coEspecie then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_ESPECIE', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coPossuiEstoque then
        begin
          if StrToBool(vaValor) then
            Result := Result+ ' (LOTE_SEMENTE.QTDE_ARMAZENADA > 0) '+vaOperador
          else
            Result := Result+ ' (LOTE_SEMENTE.QTDE_ARMAZENADA <= 0) '+vaOperador;
        end
      else if ipParam.Name = TParametros.coStatus then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'STATUS', vaValor.ToInteger, vaOperador);
    end
  else if (ipTabela = 'LOTE_MUDA') then
    begin
      if ipParam.Name = TParametros.coEspecie then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_ESPECIE', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coStatus then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'STATUS', vaValor.ToInteger, vaOperador)
      else if ipParam.Name = TParametros.coPossuiEstoque then
        begin
          if StrToBool(vaValor) then
            Result := Result+ ' LOTE_MUDA.SALDO > 0 '+vaOperador
          else
            Result := Result+ ' LOTE_MUDA.SALDO <= 0) '+vaOperador;
        end
    end
  else if (ipTabela = 'PROJETO_RUBRICA') then
    begin
      if ipParam.Name = TParametros.coProjeto then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_PROJETO', vaValor.ToInteger, vaOperador)
    end;
end;

end.
