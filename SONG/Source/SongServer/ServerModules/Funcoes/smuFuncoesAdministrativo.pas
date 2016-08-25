unit smuFuncoesAdministrativo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, uQuery,
  uClientDataSet, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uTypes;

type
  TsmFuncoesAdministrativo = class(TsmBasico)

  public
    function fpuPermissoesUsuario(ipLogin: String): OleVariant;

    function fpuValidarFinanciadorFornecedorCliente(ipId, ipTipo: integer; ipRazaoSocial, ipCpfCnpj: String): Boolean;
    function fpuValidarLogin(ipId: integer; ipLogin: String): Boolean;
    function fpuValidarNomeProjeto(ipIdProjeto: integer; ipNome: String): Boolean;
    function fpuValidarNomeAreaProjeto(ipIdProjeto, ipIdAreaProjeto: integer; ipNome: String): Boolean;
    function fpuInfoPessoa(ipLogin: string): TPessoa;
    procedure ppuValidarFinalizarAtividade(ipIdAtividade: integer);
    function fpuValidarNomeCpfPessoa(ipIdPessoa: integer; ipNome, ipCpf: String): Boolean;

    function fpuSomaOrcamentoRubrica(ipIdProjeto: integer): Double;
    function fpuSomaPagametosFinanciador(ipIdProjetoFinanciador: integer): Double;

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

function TsmFuncoesAdministrativo.fpuValidarFinanciadorFornecedorCliente(ipId, ipTipo: integer; ipRazaoSocial, ipCpfCnpj: String): Boolean;
begin
  Result := fprValidarCamposUnicos('FIN_FOR_CLI', ['RAZAO_SOCIAL', 'CPF_CNPJ', 'TIPO'], [ipRazaoSocial, ipCpfCnpj, ipTipo.ToString], ipId);
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

function TsmFuncoesAdministrativo.fpuValidarNomeCpfPessoa(ipIdPessoa: integer;
ipNome, ipCpf: String): Boolean;
var
  vaResult: Boolean;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'Select ID from pessoa ' +
        '                      where pessoa.id <> :ID and' +
        '                            pessoa.nome = :NOME and ' +
        '                            (pessoa.cpf = :CPF or  '+
        '                            ((pessoa.cpf = '''') and (:CPF is null)) or '+
        '                            ((pessoa.cpf is null) and (:CPF is null)))';
      ipDataSet.ParamByName('ID').AsInteger := ipIdPessoa;
      ipDataSet.ParamByName('NOME').AsString := ipNome;
      if ipCpf = '' then
        ipDataSet.ParamByName('CPF').Clear
      else
        ipDataSet.ParamByName('CPF').AsString := ipCpf;
      ipDataSet.Open;

      vaResult := ipDataSet.Eof;
    end);
  Result := vaResult;
end;

function TsmFuncoesAdministrativo.fpuValidarNomeProjeto(ipIdProjeto: integer;
ipNome: String): Boolean;
begin
  Result := fprValidarCampoUnico('PROJETO', 'NOME', ipIdProjeto, ipNome);
end;

function TsmFuncoesAdministrativo.fpuSomaOrcamentoRubrica(ipIdProjeto: integer): Double;
var
  vaSaldo: Double;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select sum(Projeto_Rubrica.Orcamento) as Soma_Orcamentos ' +
        ' from Projeto_Rubrica' +
        ' inner join projeto on (projeto.id = projeto_rubrica.id_projeto)' +
        ' where Projeto_Rubrica.Id_Projeto = :Id_Projeto ';
      ipDataSet.ParamByName('Id_Projeto').AsInteger := ipIdProjeto;
      ipDataSet.Open();
      vaSaldo := ipDataSet.FieldByName('SOMA_ORCAMENTOS').AsFloat;
    end);

  Result := vaSaldo;
end;

function TsmFuncoesAdministrativo.fpuSomaPagametosFinanciador(
  ipIdProjetoFinanciador: integer): Double;
var
  vaSaldo: Double;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'select sum(Projeto_Financiador_Pagto.Valor) as Soma_Valor ' +
        ' from Projeto_Financiador_Pagto' +
        ' where Projeto_Financiador_Pagto.Id_Projeto_Financiador = :Id_Projeto_Financiador ';
      ipDataSet.ParamByName('Id_Projeto_Financiador').AsInteger := ipIdProjetoFinanciador;
      ipDataSet.Open();
      vaSaldo := ipDataSet.FieldByName('SOMA_VALOR').AsFloat;
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
