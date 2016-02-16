unit dmuLookup;

interface

uses
  System.SysUtils, System.Classes, dmuBasico, cxEdit, cxEditRepositoryItems,
  cxClasses, Data.DB, Datasnap.DBClient, dmuPrincipal, cxDBEditRepository,
  uClientDataSet;

type
  TdmLookup = class(TdmBasico)
    Repositorio: TcxEditRepository;
    RepIcbNaoSim: TcxEditRepositoryImageComboBoxItem;
    cdslkPerfil: TClientDataSet;
    cdslkPerfilID: TIntegerField;
    cdslkPerfilNOME: TStringField;
    repLcbPerfil: TcxEditRepositoryLookupComboBoxItem;
    dslkPerfil: TDataSource;
    cdslkPessoa: TRFClientDataSet;
    cdslkPessoaID: TIntegerField;
    cdslkPessoaNOME: TStringField;
    repLcbPessoa: TcxEditRepositoryLookupComboBoxItem;
    dslkPessoa: TDataSource;
    repIcbTipoPerfil: TcxEditRepositoryImageComboBoxItem;
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
