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
