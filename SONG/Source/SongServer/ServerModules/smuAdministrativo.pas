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
    qPerfilDESCRICAO: TStringField;
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
    qOrganizacaoCIDADE: TStringField;
    qOrganizacaoTELEFONE: TStringField;
    qOrganizacao_PessoaID: TIntegerField;
    qOrganizacao_PessoaID_PESSOA: TIntegerField;
    qOrganizacao_PessoaID_ORGANIZACAO: TIntegerField;
    qOrganizacao_PessoaFUNCAO: TStringField;
    qOrganizacao_PessoaOBSERVACAO: TStringField;
    qPessoaCIDADE: TStringField;
    qProjeto: TRfQuery;
    qProjetoID: TIntegerField;
    qProjetoNOME: TStringField;
    qProjetoDATA_INICIO: TDateField;
    qProjetoDATA_TERMINO: TDateField;
    qProjetoDESCRICAO: TStringField;
    qPerfilTIPO: TSmallintField;
    qProjetoORCAMENTO: TBCDField;
    qProjeto_Organizacao: TRfQuery;
    qProjeto_Financiador: TRfQuery;
    qProjeto_FinanciadorID: TIntegerField;
    qProjeto_FinanciadorID_PROJETO: TIntegerField;
    qProjeto_FinanciadorID_FINANCIADOR: TIntegerField;
    qProjeto_FinanciadorOBSERVACAO: TStringField;
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
    qProjetoSITUACAO: TSmallintField;
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
    qAtividade_ProjetoOBSERVACAO: TStringField;
    qAtividade_PessoaID: TIntegerField;
    qAtividade_PessoaID_ATIVIDADE: TIntegerField;
    qAtividade_PessoaID_PESSOA: TIntegerField;
    qAtividade_PessoaFUNCAO: TStringField;
    qAtividade_Arquivo: TRfQuery;
    qAtividade_ArquivoID: TIntegerField;
    qAtividade_ArquivoID_ATIVIDADE: TIntegerField;
    qAtividade_ArquivoNOME: TStringField;
    qAtividade_ArquivoNOME_ORIGINAL: TStringField;
    qAtividade_ArquivoDESCRICAO: TStringField;
    qAtividade_Vinculo: TRfQuery;
    qAtividade_VinculoID: TIntegerField;
    qAtividade_VinculoTIPO_VINCULO: TSmallintField;
    qAtividade_VinculoOBSERVACAO: TStringField;
    qAtividade_Comentario: TRfQuery;
    qAtividade_ComentarioID: TIntegerField;
    qAtividade_ComentarioID_ATIVIDADE: TIntegerField;
    qAtividade_ComentarioID_PESSOA: TIntegerField;
    qAtividade_ComentarioCOMENTARIO: TStringField;
    qAtividade_ComentarioDATA_HORA: TSQLTimeStampField;
    qAtividade_ArquivoARQUIVO: TBlobField;
    qAtividadeDESCRICAO: TStringField;
    qAtividade_VinculoID_ATIVIDADE_ORIGEM: TIntegerField;
    qAtividade_VinculoID_ATIVIDADE_ALVO: TIntegerField;
    qAtividadeID_PROJETO: TIntegerField;
    qAtividade_ArquivoDATA_UPLOAD: TSQLTimeStampField;
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
          if vaParam.Name = TParametros.coLogin then
            Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'login', vaParam.Text)
        end
      else if ipTabela = 'PROJETO' then
        begin
          if vaParam.Name = TParametros.coSituacao then
            Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'SITUACAO', vaParam.Text.ToInteger())
        end
      else if ipTabela = 'ATIVIDADE' then
        begin
          if vaParam.Name = TParametros.coData then
            begin
              Result := TSQLGenerator.fpuFilterData(Result, ipTabela, 'DATA_INICIAL', TUtils.fpuExtrairData(vaParam.Text, 0),
                TUtils.fpuExtrairData(vaParam.Text, 1), false);
              Result := TSQLGenerator.fpuFilterData(Result, ipTabela, 'DATA_FINAL', TUtils.fpuExtrairData(vaParam.Text, 0),
                TUtils.fpuExtrairData(vaParam.Text, 1), true);
            end
          else if vaParam.Name = 'PROJETOS' then
            begin
              Result := TSQLGenerator.fpuFilterInteger(Result, 'ATIVIDADE','ID_PROJETO', TUtils.fpuConverterStringToArrayInteger(vaParam.Text));
              Result := TSQLGenerator.fpuFilterInteger(Result, 'ATIVIDADE_PROJETO','ID_PROJETO', TUtils.fpuConverterStringToArrayInteger(vaParam.Text));
            end;
         //   Result := Result + '(ATIVIDADE.ID_PROJETO IN ('+vaParam.Text+')) OR (ATIVIDADE_PROJETO.ID_PROJETO IN (' + vaParam.Text + ')) AND ';
        end;
    end;

end;

end.
