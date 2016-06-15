unit smuFuncoesSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuFuncoesBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery;

type
  TsmFuncoesSistema = class(TsmFuncoesBasico)
  private
    { Private declarations }
  public
     function fpuValidarTipoNotificacao(ipIdNotificacao, ipTipo: integer): Boolean;
  end;

var
  smFuncoesSistema: TsmFuncoesSistema;

implementation

{$R *.dfm}

{ TsmFuncoesSistema }

function TsmFuncoesSistema.fpuValidarTipoNotificacao(ipIdNotificacao,
  ipTipo: integer): Boolean;
begin
  result := fprValidarCampoUnico('NOTIFICACAO','TIPO',ipIdNotificacao,ipTipo.ToString());
end;

end.
