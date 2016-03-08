{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N-,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
{$WARN IMMUTABLE_STRINGS OFF}
unit smuFuncoesAdministrativo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, uQuery, uControleAcesso,
  uClientDataSet;

type
  TsmFuncoesAdministrativo = class(TsmBasico)
  private
    function fpvValidarCampoUnico(ipTabela, ipCampo: string; ipIdIgnorar: integer; ipValor: String): Boolean;
  public
    function fpuPermissoesUsuario(ipLogin: String): OleVariant;

    function fpuValidarFinanciadorFornecedorCliente(ipId, ipTipo: integer; ipRazaoSocial, ipNomeFantasia, ipCpfCnpj: String): String;
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
