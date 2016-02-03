unit dmuLookup;

interface

uses
  System.SysUtils, System.Classes, dmuBasico, cxEdit, cxEditRepositoryItems,
  cxClasses, Data.DB, Datasnap.DBClient, dmuPrincipal, cxDBEditRepository;

type
  TdmLookup = class(TdmBasico)
    Repositorio: TcxEditRepository;
    RepIcbNaoSim: TcxEditRepositoryImageComboBoxItem;
    cdslkPerfil: TClientDataSet;
    cdslkPerfilID: TIntegerField;
    cdslkPerfilNOME: TStringField;
    repLcbPerfil: TcxEditRepositoryLookupComboBoxItem;
    dslkPerfil: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmLookup: TdmLookup;

implementation



{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
