unit smuAdministrativo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, dmuPrincipal;

type
  TsmAdministrativo = class(TsmBasico)
    qPessoa: TFDQuery;
    qPerfil: TFDQuery;
    qPerfilID: TLargeintField;
    qPerfilNOME: TStringField;
    qPerfilDESCRICAO: TStringField;
    qPessoaID: TLargeintField;
    qPessoaNOME: TStringField;
    qPessoaCELULAR: TIntegerField;
    qPessoaRG: TStringField;
    qPessoaCPF: TStringField;
    qPessoaENDERECO: TStringField;
    qPessoaLOGIN: TStringField;
    qPessoaSENHA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  smAdministrativo: TsmAdministrativo;

implementation

{$R *.dfm}

end.
