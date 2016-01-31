unit dmuLookup;

interface

uses
  System.SysUtils, System.Classes, dmuBasico, cxEdit, cxEditRepositoryItems,
  cxClasses;

type
  TdmLookup = class(TdmBasico)
    Repositorio: TcxEditRepository;
    RepIcbNaoSim: TcxEditRepositoryImageComboBoxItem;
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
