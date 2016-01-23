unit smuFuncoesGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, Datasnap.DSAuth, uRoles;

type
  TsmFuncoesGeral = class(TsmBasico)
  private
    { Private declarations }
  public
    function fpuVerificarNovaVersao(ipVersaoAtual: string): String;
    procedure teste;
  end;

var
  smFuncoesGeral: TsmFuncoesGeral;

implementation

{$R *.dfm}
{ TsmFuncoesGeral }

function TsmFuncoesGeral.fpuVerificarNovaVersao(ipVersaoAtual: string): String;
begin
   Result := 'ok';
end;

procedure TsmFuncoesGeral.teste;
begin

end;

end.
