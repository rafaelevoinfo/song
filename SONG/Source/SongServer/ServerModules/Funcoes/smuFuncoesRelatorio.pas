unit smuFuncoesRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuFuncoesBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery, uClientDataSet,
  uUtils, Datasnap.DBClient, uTypes;

type
  TsmFuncoesRelatorio = class(TsmFuncoesBasico)
  private
    { Private declarations }
  public

  end;

var
  smFuncoesRelatorio: TsmFuncoesRelatorio;

implementation

{$R *.dfm}


end.
