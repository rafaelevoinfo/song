unit dmuAdministrativo;

interface

uses
  System.SysUtils, System.Classes, dmuBasico, dmuPrincipal, Data.DB,
  Datasnap.DBClient, uClientDataSet, Datasnap.DSConnect;

type
  TdmAdministrativo = class(TdmBasico)
    cdsPerfil: TRFClientDataSet;
    cdsPerfilNOME: TStringField;
    cdsPerfilDESCRICAO: TStringField;
    cdsPerfil_Permissao: TRFClientDataSet;
    dsPerfil: TDataSource;
    cdsPerfil_PermissaoPERMISSAO: TStringField;
    cdsPerfil_PermissaoVISUALIZAR: TSmallintField;
    cdsPerfil_PermissaoINCLUIR: TSmallintField;
    cdsPerfil_PermissaoALTERAR: TSmallintField;
    cdsPerfil_PermissaoEXCLUIR: TSmallintField;
    cdsPerfilID: TIntegerField;
    cdsPerfil_PermissaoID: TIntegerField;
    cdsPerfil_PermissaoID_PERFIL: TIntegerField;
    cdsPessoa: TRFClientDataSet;
    cdsPessoa_Perfil: TRFClientDataSet;
    cdsPessoaID: TIntegerField;
    cdsPessoaNOME: TStringField;
    cdsPessoaRG: TStringField;
    cdsPessoaCPF: TStringField;
    cdsPessoaENDERECO: TStringField;
    cdsPessoaLOGIN: TStringField;
    cdsPessoaSENHA: TStringField;
    cdsPessoaBAIRRO: TStringField;
    cdsPessoaCOMPLEMENTO: TStringField;
    cdsPessoa_PerfilID: TIntegerField;
    cdsPessoa_PerfilID_PESSOA: TIntegerField;
    cdsPessoa_PerfilID_PERFIL: TIntegerField;
    cdsPessoaEMAIL: TStringField;
    cdsPessoaCELULAR: TStringField;
    cdsPessoaTELEFONE: TStringField;
    dsPessoa: TDataSource;
    cdsPessoaATIVO: TSmallintField;
    cdsOrganizacao: TRFClientDataSet;
    cdsOrganizacao_Pessoa: TRFClientDataSet;
    cdsOrganizacaoID: TIntegerField;
    cdsOrganizacaoNOME: TStringField;
    cdsOrganizacaoCNPJ: TStringField;
    cdsOrganizacaoINSCRICAO_ESTADUAL: TStringField;
    cdsOrganizacaoENDERECO: TStringField;
    cdsOrganizacaoBAIRRO: TStringField;
    cdsOrganizacaoCOMPLEMENTO: TStringField;
    cdsOrganizacaoCIDADE: TStringField;
    cdsOrganizacaoTELEFONE: TStringField;
    cdsOrganizacao_PessoaID: TIntegerField;
    cdsOrganizacao_PessoaID_PESSOA: TIntegerField;
    cdsOrganizacao_PessoaID_ORGANIZACAO: TIntegerField;
    cdsOrganizacao_PessoaFUNCAO: TStringField;
    cdsOrganizacao_PessoaOBSERVACAO: TStringField;
    dsOrganizacao: TDataSource;
    cdsPessoaCIDADE: TStringField;
    cdsFinanciador: TRFClientDataSet;
    cdsFinanciadorID: TIntegerField;
    cdsFinanciadorNOME: TStringField;
    cdsFinanciadorID_PESSOA: TIntegerField;
    cdsPerfilTIPO: TSmallintField;
    cdsProjeto: TRFClientDataSet;
    cdsProjeto_Pessoa: TRFClientDataSet;
    cdsProjeto_Organizacao: TRFClientDataSet;
    cdsProjeto_Financiador: TRFClientDataSet;
    cdsProjeto_Documento: TRFClientDataSet;
    cdsProjeto_FinanciadorID: TIntegerField;
    cdsProjeto_FinanciadorID_PROJETO: TIntegerField;
    cdsProjeto_FinanciadorID_FINANCIADOR: TIntegerField;
    cdsProjeto_FinanciadorVALOR_FINANCIADO: TBCDField;
    cdsProjeto_FinanciadorDATA_PAGAMENTO: TSQLTimeStampField;
    cdsProjeto_FinanciadorOBSERVACAO: TStringField;
    cdsProjeto_OrganizacaoID: TIntegerField;
    cdsProjeto_OrganizacaoID_PROJETO: TIntegerField;
    cdsProjeto_OrganizacaoID_ORGANIZACAO: TIntegerField;
    cdsProjeto_PessoaID: TIntegerField;
    cdsProjeto_PessoaID_PROJETO: TIntegerField;
    cdsProjeto_PessoaID_PESSOA: TIntegerField;
    cdsProjeto_PessoaFUNCAO: TStringField;
    cdsProjeto_DocumentoID: TIntegerField;
    cdsProjeto_DocumentoID_PROJETO: TIntegerField;
    cdsProjeto_DocumentoNOME: TStringField;
    cdsProjeto_DocumentoDATA_UPLOAD: TSQLTimeStampField;
    cdsProjeto_DocumentoDOCUMENTO: TBlobField;
    cdsProjetoID: TIntegerField;
    cdsProjetoNOME: TStringField;
    cdsProjetoDATA_INICIO: TDateField;
    cdsProjetoDATA_TERMINO: TDateField;
    cdsProjetoDESCRICAO: TStringField;
    cdsProjetoORCAMENTO: TBCDField;
    cdsProjetoSITUACAO: TSmallintField;
    dsProjeto: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmAdministrativo: TdmAdministrativo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
