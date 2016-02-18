unit smuAdministrativo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, dmuPrincipal, uTypes,
  uSQLGenerator, uQuery, Datasnap.Provider, uClientDataSet;

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
    qOrganizacao: TRFQuery;
    qOrganizacao_Pessoa: TRFQuery;
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
    qFinanciador: TRFQuery;
    qProjeto: TRFQuery;
    qFinanciadorID: TIntegerField;
    qFinanciadorNOME: TStringField;
    qFinanciadorID_PESSOA: TIntegerField;
    qProjetoID: TIntegerField;
    qProjetoNOME: TStringField;
    qProjetoDATA_INICIO: TDateField;
    qProjetoDATA_TERMINO: TDateField;
    qProjetoDESCRICAO: TStringField;
    qPerfilTIPO: TSmallintField;
    qProjetoORCAMENTO: TBCDField;
    qProjeto_Organizacao: TRFQuery;
    qProjeto_Financiador: TRFQuery;
    qProjeto_FinanciadorID: TIntegerField;
    qProjeto_FinanciadorID_PROJETO: TIntegerField;
    qProjeto_FinanciadorID_FINANCIADOR: TIntegerField;
    qProjeto_FinanciadorVALOR_FINANCIADO: TBCDField;
    qProjeto_FinanciadorDATA_PAGAMENTO: TSQLTimeStampField;
    qProjeto_FinanciadorOBSERVACAO: TStringField;
    qProjeto_OrganizacaoID: TIntegerField;
    qProjeto_OrganizacaoID_PROJETO: TIntegerField;
    qProjeto_OrganizacaoID_ORGANIZACAO: TIntegerField;
    qProjeto_Documento: TRFQuery;
    qProjeto_DocumentoID: TIntegerField;
    qProjeto_DocumentoID_PROJETO: TIntegerField;
    qProjeto_DocumentoNOME: TStringField;
    qProjeto_DocumentoDATA_UPLOAD: TSQLTimeStampField;
    qProjeto_DocumentoDOCUMENTO: TBlobField;
    qProjeto_Pessoa: TRFQuery;
    qProjeto_PessoaID: TIntegerField;
    qProjeto_PessoaID_PROJETO: TIntegerField;
    qProjeto_PessoaID_PESSOA: TIntegerField;
    qProjeto_PessoaFUNCAO: TStringField;
    qProjetoSITUACAO: TSmallintField;
    qProjetoID_BANCO_CONTA_CORRENTE: TIntegerField;
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
        end;
    end;

end;

end.
