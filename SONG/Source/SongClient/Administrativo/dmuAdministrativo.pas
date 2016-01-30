unit dmuAdministrativo;

interface

uses
  System.SysUtils, System.Classes, dmuBasico, dmuPrincipal, Data.DB,
  Datasnap.DBClient, uClientDataSet, Datasnap.DSConnect;

type
  TdmAdministrativo = class(TdmBasico)
    cdsPerfil: TRFClientDataSet;
    cdsPerfilID: TLargeintField;
    cdsPerfilNOME: TStringField;
    cdsPerfilDESCRICAO: TStringField;
    cdsPerfil_Permissao: TRFClientDataSet;
    dsPerfil: TDataSource;
    cdsPerfil_PermissaoID: TLargeintField;
    cdsPerfil_PermissaoPERFIL_ID: TLargeintField;
    cdsPerfil_PermissaoPERMISSAO: TStringField;
    cdsPerfil_PermissaoVISUALIZAR: TSmallintField;
    cdsPerfil_PermissaoINCLUIR: TSmallintField;
    cdsPerfil_PermissaoALTERAR: TSmallintField;
    cdsPerfil_PermissaoEXCLUIR: TSmallintField;
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
