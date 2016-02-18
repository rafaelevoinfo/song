unit smuFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery, dmuPrincipal;

type
  TsmFinanceiro = class(TsmBasico)
    qBanco: TRFQuery;
    qBanco_Conta_Corrente: TRFQuery;
    qBancoID: TIntegerField;
    qBancoNOME: TStringField;
    qBanco_Conta_CorrenteID: TIntegerField;
    qBanco_Conta_CorrenteID_BANCO: TIntegerField;
    qBanco_Conta_CorrenteAGENCIA: TStringField;
    qBanco_Conta_CorrenteCONTA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  smFinanceiro: TsmFinanceiro;

implementation

{$R *.dfm}

end.
