unit dmuBasico;

interface

uses
  System.SysUtils, System.Classes;

type
  TdmBasico = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmBasico: TdmBasico;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
