unit smuFuncoesAdministrativo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, uQuery;

type
  TsmFuncoesAdministrativo = class(TsmBasico)
  private
    { Private declarations }
  public
    function fpuPermissoesUsuario(ipLogin: String): OleVariant;
  end;

var
  smFuncoesAdministrativo: TsmFuncoesAdministrativo;

implementation

{$R *.dfm}
{ TsmFuncoesAdministrativo }

function TsmFuncoesAdministrativo.fpuPermissoesUsuario(ipLogin: String): OleVariant;
var
  vaResult:OleVariant;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select PERFIL_PERMISSAO.ID_PERFIL, ' +
        '       PERFIL_PERMISSAO.PERMISSAO,' +
        '       PERFIL_PERMISSAO.VISUALIZAR,' +
        '       PERFIL_PERMISSAO.INCLUIR,' +
        '       PERFIL_PERMISSAO.ALTERAR,' +
        '       PERFIL_PERMISSAO.EXCLUIR' +
        ' from PESSOA' +
        ' inner join PESSOA_PERFIL on (PESSOA.ID = PESSOA_PERFIL.ID_PESSOA)' +
        ' inner join PERFIL_PERMISSAO on (PERFIL_PERMISSAO.ID_PERFIL = PESSOA_PERFIL.ID_PERFIL)' +
        ' where PESSOA.LOGIN = :LOGIN';

      ipDataSet.ParamByName('LOGIN').AsString := ipLogin;
      ipDataSet.Open();

      vaResult := ipDataSet.fpuConvertToOleVariant;
    end);

  Result := vaResult;
end;

end.
