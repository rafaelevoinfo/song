unit smuAdministrativo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, dmuPrincipal, uTypes,
  uSQLGenerator, uQuery, Datasnap.Provider, uClientDataSet, uUtils,
  System.RegularExpressions;

type
  TsmAdministrativo = class(TsmBasico)
    qPessoa: TRfQuery;
    qPerfil: TRfQuery;
    qPerfilNOME: TStringField;
    qPessoaNOME: TStringField;
    qPessoaRG: TStringField;
    qPessoaCPF: TStringField;
    qPessoaENDERECO: TStringField;
    qPessoaLOGIN: TStringField;
    qPessoaSENHA: TStringField;
    qPerfil_Permissao: TRfQuery;
    qPerfil_PermissaoPERMISSAO: TStringField;
    qPerfil_PermissaoVISUALIZAR: TSmallintField;
    qPerfil_PermissaoINCLUIR: TSmallintField;
    qPerfil_PermissaoALTERAR: TSmallintField;
    qPerfil_PermissaoEXCLUIR: TSmallintField;
    qPessoaID: TIntegerField;
    qPessoaBAIRRO: TStringField;
    qPessoaCOMPLEMENTO: TStringField;
    qPerfilID: TIntegerField;
    qPerfil_PermissaoID: TIntegerField;
    qPerfil_PermissaoID_PERFIL: TIntegerField;
    qPessoa_Perfil: TRfQuery;
    qPessoa_PerfilID: TIntegerField;
    qPessoa_PerfilID_PESSOA: TIntegerField;
    qPessoa_PerfilID_PERFIL: TIntegerField;
    qPessoaEMAIL: TStringField;
    qPessoaCELULAR: TStringField;
    qPessoaTELEFONE: TStringField;
    qPessoaATIVO: TSmallintField;
    qOrganizacao: TRfQuery;
    qOrganizacao_Pessoa: TRfQuery;
    qOrganizacaoID: TIntegerField;
    qOrganizacaoNOME: TStringField;
    qOrganizacaoCNPJ: TStringField;
    qOrganizacaoINSCRICAO_ESTADUAL: TStringField;
    qOrganizacaoENDERECO: TStringField;
    qOrganizacaoBAIRRO: TStringField;
    qOrganizacaoCOMPLEMENTO: TStringField;
    qOrganizacaoTELEFONE: TStringField;
    qOrganizacao_PessoaID: TIntegerField;
    qOrganizacao_PessoaID_PESSOA: TIntegerField;
    qOrganizacao_PessoaID_ORGANIZACAO: TIntegerField;
    qOrganizacao_PessoaFUNCAO: TStringField;
    qProjeto: TRfQuery;
    qProjetoID: TIntegerField;
    qProjetoNOME: TStringField;
    qProjetoDATA_INICIO: TDateField;
    qProjetoDATA_TERMINO: TDateField;
    qPerfilTIPO: TSmallintField;
    qProjetoORCAMENTO: TBCDField;
    qProjeto_Organizacao: TRfQuery;
    qProjeto_Financiador: TRfQuery;
    qProjeto_FinanciadorID: TIntegerField;
    qProjeto_FinanciadorID_PROJETO: TIntegerField;
    qProjeto_FinanciadorID_FINANCIADOR: TIntegerField;
    qProjeto_OrganizacaoID: TIntegerField;
    qProjeto_OrganizacaoID_PROJETO: TIntegerField;
    qProjeto_OrganizacaoID_ORGANIZACAO: TIntegerField;
    qProjeto_Documento: TRfQuery;
    qProjeto_DocumentoID: TIntegerField;
    qProjeto_DocumentoID_PROJETO: TIntegerField;
    qProjeto_DocumentoNOME: TStringField;
    qProjeto_DocumentoDATA_UPLOAD: TSQLTimeStampField;
    qProjeto_DocumentoDOCUMENTO: TBlobField;
    qProjeto_Pessoa: TRfQuery;
    qProjeto_PessoaID: TIntegerField;
    qProjeto_PessoaID_PROJETO: TIntegerField;
    qProjeto_PessoaID_PESSOA: TIntegerField;
    qProjeto_PessoaFUNCAO: TStringField;
    qProjetoID_BANCO_CONTA_CORRENTE: TIntegerField;
    qProjeto_Financiador_Pagto: TRfQuery;
    qProjeto_Financiador_PagtoID: TIntegerField;
    qProjeto_Financiador_PagtoID_PROJETO_FINANCIADOR: TIntegerField;
    qProjeto_Financiador_PagtoVALOR: TBCDField;
    qProjeto_Financiador_PagtoDATA: TDateField;
    qProjeto_DocumentoNOME_ORIGINAL: TStringField;
    qPessoaTIPO: TSmallintField;
    qAtividade: TRfQuery;
    qAtividadeID: TIntegerField;
    qAtividadeNOME: TStringField;
    qAtividadeID_SOLICITANTE: TIntegerField;
    qAtividadeID_RESPONSAVEL: TIntegerField;
    qAtividadeSTATUS: TSmallintField;
    qAtividadeDATA_INICIAL: TSQLTimeStampField;
    qAtividadeDATA_FINAL: TSQLTimeStampField;
    qAtividadeNOTIFICAR_ENVOLVIDOS: TSmallintField;
    qAtividade_Pessoa: TRfQuery;
    qAtividade_Projeto: TRfQuery;
    qAtividade_ProjetoID: TIntegerField;
    qAtividade_ProjetoID_ATIVIDADE: TIntegerField;
    qAtividade_ProjetoID_PROJETO: TIntegerField;
    qAtividade_PessoaID: TIntegerField;
    qAtividade_PessoaID_ATIVIDADE: TIntegerField;
    qAtividade_PessoaID_PESSOA: TIntegerField;
    qAtividade_PessoaFUNCAO: TStringField;
    qAtividade_Arquivo: TRfQuery;
    qAtividade_ArquivoID: TIntegerField;
    qAtividade_ArquivoID_ATIVIDADE: TIntegerField;
    qAtividade_ArquivoNOME: TStringField;
    qAtividade_ArquivoNOME_ORIGINAL: TStringField;
    qAtividade_Vinculo: TRfQuery;
    qAtividade_VinculoID: TIntegerField;
    qAtividade_VinculoTIPO_VINCULO: TSmallintField;
    qAtividade_Comentario: TRfQuery;
    qAtividade_ComentarioID: TIntegerField;
    qAtividade_ComentarioID_ATIVIDADE: TIntegerField;
    qAtividade_ComentarioID_PESSOA: TIntegerField;
    qAtividade_ComentarioDATA_HORA: TSQLTimeStampField;
    qAtividade_ArquivoARQUIVO: TBlobField;
    qAtividade_VinculoID_ATIVIDADE_ORIGEM: TIntegerField;
    qAtividadeID_PROJETO: TIntegerField;
    qAtividade_ArquivoDATA_UPLOAD: TSQLTimeStampField;
    qAtividade_ProjetoNOME_PROJETO: TStringField;
    qAtividade_VinculoNOME_ATIVIDADE_ORIGEM: TStringField;
    qAtividade_VinculoID_ATIVIDADE_VINCULO: TIntegerField;
    qAtividade_VinculoNOME_ATIVIDADE_VINCULO: TStringField;
    qProjetoSTATUS: TSmallintField;
    qAtividadeNOME_PROJETO: TStringField;
    qPessoaID_CIDADE: TIntegerField;
    qPessoaCIDADE: TStringField;
    qOrganizacaoID_CIDADE: TIntegerField;
    qOrganizacaoCIDADE: TStringField;
    qPessoaDATA_NASCIMENTO: TDateField;
    qPessoaOBSERVACAO: TStringField;
    qAtividadeDESCRICAO: TStringField;
    qAtividade_ArquivoDESCRICAO: TStringField;
    qAtividade_ComentarioCOMENTARIO: TStringField;
    qAtividade_ProjetoOBSERVACAO: TStringField;
    qAtividade_VinculoOBSERVACAO: TStringField;
    qOrganizacao_PessoaOBSERVACAO: TStringField;
    qPerfilDESCRICAO: TStringField;
    qProjetoDESCRICAO: TStringField;
    qProjeto_FinanciadorOBSERVACAO: TStringField;
    qAtividade_PessoaNOME_PESSOA: TStringField;
    qAtividade_PessoaNOME_ATIVIDADE: TStringField;
    qProjeto_Rubrica: TRFQuery;
    qProjeto_RubricaID: TIntegerField;
    qProjeto_RubricaID_PROJETO: TIntegerField;
    qProjeto_RubricaID_RUBRICA: TIntegerField;
    qProjeto_RubricaORCAMENTO: TBCDField;
    qProjeto_RubricaNOME_RUBRICA: TStringField;
    qProjeto_Area: TRFQuery;
    qProjeto_AreaID: TIntegerField;
    qProjeto_AreaID_PROJETO: TIntegerField;
    qProjeto_AreaNOME: TStringField;
    qProjeto_RubricaRECEBIDO: TBCDField;
    qProjeto_RubricaGASTO: TBCDField;
    qProjeto_Financiador_PagtoPERCENTUAL: TBCDField;
  private
    { Private declarations }
  protected
    function fprMontarWhere(ipTabela, ipWhere: string; ipParam: TParam): string; override;
  public
    { Public declarations }
  end;

var
  smAdministrativo: TsmAdministrativo;

implementation

{$R *.dfm}
{ TsmAdministrativo }

function TsmAdministrativo.fprMontarWhere(ipTabela, ipWhere: string; ipParam: TParam): string;
var
  vaValor, vaOperador: string;
  vaCodigos: TArray<Integer>;
begin
  Result := inherited;

  TUtils.ppuExtrairValorOperadorParametro(ipParam.Text, vaValor, vaOperador, TParametros.coDelimitador);
  if ipTabela = 'PESSOA' then
    begin
      if ipParam.Name = TParametros.coLogin then
        Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'login', vaValor, vaOperador)
      else if ipParam.Name = TParametros.coTipo then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'tipo', TUtils.fpuConverterStringToArrayInteger(vaValor), vaOperador)
    end
  else if ipTabela = 'PROJETO' then
    begin
      if ipParam.Name = TParametros.coStatus then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'STATUS', vaValor.ToInteger(), vaOperador)
    end
  else if ipTabela = 'ATIVIDADE' then
    begin
      if ipParam.Name = TParametros.coData then
        begin
          Result := Result + ' ((ATIVIDADE.DATA_INICIAL between ' + QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 0))) + ' AND ' +
            QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 1)))+') or '+
              '(ATIVIDADE.DATA_FINAL between ' + QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 0))) + ' AND ' +
            QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 1)))+')) '+vaOperador;
        end
      else if ipParam.Name = TParametros.coProjeto then
        begin
          vaCodigos := TUtils.fpuConverterStringToArrayInteger(vaValor);
          Result := TSQLGenerator.fpuFilterInteger(Result, ['ATIVIDADE', 'ATIVIDADE_PROJETO'],
            ['ID_PROJETO', 'ID_PROJETO'], [vaCodigos, vaCodigos], TOperadores.coOR, vaOperador);
        end;
    end;
end;

end.
