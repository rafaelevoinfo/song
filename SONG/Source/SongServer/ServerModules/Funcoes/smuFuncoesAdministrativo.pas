unit smuFuncoesAdministrativo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, uQuery, uControleAcesso,
  uClientDataSet;

type
  TsmFuncoesAdministrativo = class(TsmBasico)

  public
    function fpuPermissoesUsuario(ipLogin: String): OleVariant;

    function fpuValidarFinanciadorFornecedorCliente(ipId, ipTipo: integer; ipRazaoSocial, ipNomeFantasia, ipCpfCnpj: String): String;
    function fpuValidarLogin(ipId: integer; ipLogin: String): Boolean;
    function fpuValidarNomeProjeto(ipIdProjeto: integer; ipNome: String): Boolean;
    function fpuValidarNomeAreaProjeto(ipIdProjeto, ipIdAreaProjeto: integer; ipNome: String): Boolean;
    function fpuInfoPessoa(ipLogin: string): TPessoa;
    procedure ppuValidarFinalizarAtividade(ipIdAtividade: integer);

    function fpuSomaOrcamentoRubrica(ipIdProjeto: integer):Double;

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
  Result := fprValidarCampoUnico('PESSOA', 'LOGIN', ipId, ipLogin);
end;

function TsmFuncoesAdministrativo.fpuValidarFinanciadorFornecedorCliente(ipId, ipTipo: integer;
ipRazaoSocial, ipNomeFantasia, ipCpfCnpj: String): string;
var
  vaResult: TStringList;
begin
  vaResult := TStringList.Create;
  try
    vaResult.StrictDelimiter := True;
    vaResult.Delimiter := TParametros.coDelimitador;

    pprEncapsularConsulta(
      procedure(ipDataSet: TRFQuery)
      begin
        ipDataSet.SQL.Text := Format('select ID ' +
          ' from %s ' +
          ' where ID <> :ID and ' +
          '       (%s = :NOME or ' +
          '        %s = :RAZAO or ' +
          '        %s = :CPF_CNPJ) and ' +
          '        %s = :TIPO', ['FIN_FOR_CLI', 'NOME_FANTASIA', 'RAZAO_SOCIAL', 'CPF_CNPJ', 'TIPO']);

        ipDataSet.ParamByName('ID').AsInteger := ipId;
        ipDataSet.ParamByName('NOME').AsString := ipNomeFantasia;
        ipDataSet.ParamByName('RAZAO').AsString := '';
        ipDataSet.ParamByName('CPF_CNPJ').AsString := '';
        ipDataSet.ParamByName('TIPO').AsInteger := ipTipo;
        ipDataSet.Open();

        if not ipDataSet.Eof then
          vaResult.Add('NOME_FANTASIA');

        ipDataSet.Close;
        ipDataSet.ParamByName('ID').AsInteger := ipId;
        ipDataSet.ParamByName('NOME').AsString := '';
        ipDataSet.ParamByName('RAZAO').AsString := ipRazaoSocial;
        ipDataSet.ParamByName('CPF_CNPJ').AsString := '';
        ipDataSet.ParamByName('TIPO').AsInteger := ipTipo;
        ipDataSet.Open();

        if not ipDataSet.Eof then
          vaResult.Add('RAZAO_SOCIAL');

        ipDataSet.Close;
        ipDataSet.ParamByName('ID').AsInteger := ipId;
        ipDataSet.ParamByName('NOME').AsString := '';
        ipDataSet.ParamByName('RAZAO').AsString := '';
        ipDataSet.ParamByName('CPF_CNPJ').AsString := ipCpfCnpj;
        ipDataSet.ParamByName('TIPO').AsInteger := ipTipo;
        ipDataSet.Open();

        if not ipDataSet.Eof then
          vaResult.Add('CPF_CNPJ');
      end);
    Result := vaResult.DelimitedText;
  finally
    vaResult.Free;
  end;

end;

function TsmFuncoesAdministrativo.fpuValidarNomeAreaProjeto(
  ipIdProjeto, ipIdAreaProjeto: integer; ipNome: String): Boolean;
var
  vaResult: Boolean;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select count(*) as Quant ' +
        '  from Projeto_Area ' +
        ' where Projeto_Area.Id <> :Id and ' +
        '       Projeto_Area.Id_Projeto <> :Id_Projeto and ' +
        '       Projeto_area.nome = :nome';
      ipDataSet.ParamByName('ID').AsInteger := ipIdAreaProjeto;
      ipDataSet.ParamByName('ID_PROJETO').AsInteger := ipIdProjeto;
      ipDataSet.ParamByName('NOME').AsString := ipNome;
      ipDataSet.Open();

      vaResult := ipDataSet.FieldByName('QUANT').AsInteger = 0;
    end);
  Result := vaResult;
end;

function TsmFuncoesAdministrativo.fpuValidarNomeProjeto(ipIdProjeto: integer;
ipNome: String): Boolean;
begin
  Result := fprValidarCampoUnico('PROJETO', 'NOME', ipIdProjeto, ipNome);
end;

function TsmFuncoesAdministrativo.fpuSomaOrcamentoRubrica(ipIdProjeto: integer):Double;
var
  vaSaldo:Double;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select sum(Projeto_Rubrica.Orcamento) as Soma_Orcamentos, ' +
        '                           Projeto.Orcamento ' +
        ' from Projeto_Rubrica' +
        ' inner join projeto on (projeto.id = projeto_rubrica.id_projeto)' +
        ' where Projeto_Rubrica.Id_Projeto = :Id_Projeto ' +
        ' group by Projeto.Orcamento';
      ipDataSet.ParamByName('Id_Projeto').AsInteger := ipIdProjeto;
      ipDataSet.Open();
      vaSaldo := ipDataSet.FieldByName('SOMA_ORCAMENTOS').AsFloat;
    end);

  Result := vaSaldo;
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
