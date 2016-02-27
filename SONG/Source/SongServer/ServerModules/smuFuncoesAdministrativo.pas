unit smuFuncoesAdministrativo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, uQuery, uControleAcesso;

type
  TsmFuncoesAdministrativo = class(TsmBasico)
  private
    function fpvValidarCampoUnico(ipTabela, ipCampo: string; ipIdIgnorar: integer; ipValor: String): Boolean;
  public
    function fpuPermissoesUsuario(ipLogin: String): OleVariant;

    function fpuValidarNomeFinanciador(ipIdFinanciador: integer; ipNome: String): Boolean;
    function fpuValidarLogin(ipId: integer; ipLogin: String): Boolean;
    function fpuValidarNomeProjeto(ipIdProjeto: integer; ipNome: String): Boolean;
    function fpuInfoPessoa(ipLogin: string): TPessoa;
    procedure ppuValidarFinalizarAtividade(ipIdAtividade: integer);

  end;

var
  smFuncoesAdministrativo: TsmFuncoesAdministrativo;

implementation

{$R *.dfm}
{ TsmFuncoesAdministrativo }

function TsmFuncoesAdministrativo.fpuInfoPessoa(ipLogin: string): TPessoa;
var
  vaPessoa: TPessoa;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)

    begin
      ipDataSet.SQL.Text := 'select PESSOA.ID, ' +
        '                           PESSOA.NOME ' +
        ' from PESSOA' +
        ' where PESSOA.LOGIN = :LOGIN';

      ipDataSet.ParamByName('LOGIN').AsString := ipLogin;
      ipDataSet.Open();

      vaPessoa := TPessoa.Create;
      vaPessoa.Id := ipDataSet.FieldByName('ID').AsInteger;
      vaPessoa.Nome := ipDataSet.FieldByName('NOME').AsString;
    end);

  Result := vaPessoa;
end;

function TsmFuncoesAdministrativo.fpuPermissoesUsuario(ipLogin: String): OleVariant;
var
  vaResult: OleVariant;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select PERFIL_PERMISSAO.ID_PERFIL, ' +
        '       PERFIL_PERMISSAO.PERMISSAO,' +
        '       PERFIL_PERMISSAO.VISUALIZAR,' +
        '       PERFIL_PERMISSAO.INCLUIR,' +
        '       PERFIL_PERMISSAO.ALTERAR,' +
        '       PERFIL_PERMISSAO.EXCLUIR, ' +
        '       PERFIL.TIPO ' +
        ' from PESSOA' +
        ' inner join PESSOA_PERFIL on (PESSOA.ID = PESSOA_PERFIL.ID_PESSOA)' +
        ' inner join PERFIL on (PESSOA_PERFIL.ID_PERFIL = PERFIL.ID) ' +
        ' left join PERFIL_PERMISSAO on (PERFIL_PERMISSAO.ID_PERFIL = PESSOA_PERFIL.ID_PERFIL)' +
        ' where PESSOA.LOGIN = :LOGIN';

      ipDataSet.ParamByName('LOGIN').AsString := ipLogin;
      ipDataSet.Open();

      vaResult := ipDataSet.fpuConvertToOleVariant;
    end);

  Result := vaResult;
end;

function TsmFuncoesAdministrativo.fpuValidarLogin(ipId: integer; ipLogin: String): Boolean;
begin
  Result := fpvValidarCampoUnico('PESSOA', 'LOGIN', ipId, ipLogin);
end;

function TsmFuncoesAdministrativo.fpuValidarNomeFinanciador(
  ipIdFinanciador: integer; ipNome: String): Boolean;
begin
  Result := fpvValidarCampoUnico('financiador', 'nome', ipIdFinanciador, ipNome);
end;

function TsmFuncoesAdministrativo.fpuValidarNomeProjeto(ipIdProjeto: integer;
ipNome: String): Boolean;
begin
  Result := fpvValidarCampoUnico('PROJETO', 'NOME', ipIdProjeto, ipNome);
end;

function TsmFuncoesAdministrativo.fpvValidarCampoUnico(ipTabela,
  ipCampo: string; ipIdIgnorar: integer; ipValor: String): Boolean;
var
  vaResult: Boolean;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := Format('select ID ' +
        ' from %s ' +
        ' where ID <> :ID and ' +
        '       %s = :NOME', [ipTabela, ipCampo]);

      ipDataSet.ParamByName('ID').AsInteger := ipIdIgnorar;
      ipDataSet.ParamByName('NOME').AsString := ipValor;
      ipDataSet.Open();

      vaResult := ipDataSet.Eof;
    end);

  Result := vaResult;

end;

procedure TsmFuncoesAdministrativo.ppuValidarFinalizarAtividade(ipIdAtividade: integer);
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select count(*) as qtde ' +
        ' from ATIVIDADE_VINCULO ' +
        ' inner join ATIVIDADE on (ATIVIDADE.ID = ATIVIDADE_VINCULO.ID_ATIVIDADE_VINCULO)' +
        ' where ATIVIDADE_VINCULO.ID_ATIVIDADE_ORIGEM = :ID_ATIVIDADE and' +
        '       ATIVIDADE_VINCULO.TIPO_VINCULO = 1 and' +
        '       ATIVIDADE.STATUS not in (4, 5) ';
      ipDataSet.ParamByName('ID_ATIVIDADE').AsInteger := ipIdAtividade;
      ipDataSet.Open();
      if ipDataSet.FieldByName('QTDE').AsInteger > 0 then
        raise Exception.Create('Não é possível finalizar um atividade com dependências não finalizadas.');
    end);
end;

end.
