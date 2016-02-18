unit smuLookup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, dmuPrincipal,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uQuery;

type
  TsmLookup = class(TsmBasico)
    qlkPerfil: TRFQuery;
    qlkPerfilID: TIntegerField;
    qlkPerfilNOME: TStringField;
    qlkPessoa: TRFQuery;
    qlkOrganizacao: TRFQuery;
    qlkOrganizacaoID: TIntegerField;
    qlkOrganizacaoNOME: TStringField;
    qlkFinanciador: TRFQuery;
    qlkFinanciadorID: TIntegerField;
    qlkFinanciadorNOME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  smLookup: TsmLookup;

implementation

{$R *.dfm}

end.
