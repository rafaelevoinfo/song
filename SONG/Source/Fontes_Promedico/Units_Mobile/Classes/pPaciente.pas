unit pPaciente;

interface

uses pAtributos, System.DateUtils, System.SysUtils;

type
  TPaciente = class
  private
    FNomePai: string;
    FConvenio: string;
    FTipoSanguineo: string;
    FRG: string;
    FDataNascimento: TDateTime;
    FBairro: string;
    FNomeResponsavel: string;
    FAlergia: string;
    FCPF: string;
    FPlanoConvenio: string;
    FNomeMae: string;
    FSexo: string;
    FNome: string;
    FMatriculaConvenio: string;
    FCodigoCidade: integer;
    FEndereco: string;
    FTelefone: String;
    FCelular: string;
    FEstadoCivil: string;
    FNomeCidade: string;
    FDataHoraAlteracao: TDateTime;
    FCodigoUsuarioAlterou: Integer;
    FEmail: string;
    FNFicha: integer;
    FIdade: String;
    procedure SetAlergia(const Value: string);
    procedure SetBairro(const Value: string);
    procedure SetCelular(const Value: string);
    procedure SetCodigoCidade(const Value: Integer);
    procedure SetConvenio(const Value: string);
    procedure SetCPF(const Value: string);
    procedure SetDataNascimento(const Value: TDAteTime);
    procedure SetEndereco(const Value: string);
    procedure SetMatriculaConvenio(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetNomeMae(const Value: string);
    procedure SetNomePai(const Value: string);
    procedure SetNomeResponsavel(const Value: string);
    procedure SetPlanoConvenio(const Value: string);
    procedure SetRG(const Value: string);
    procedure SetSexo(const Value: string);
    procedure SetTelefone(const Value: String);
    procedure SetTipoSanguineo(const Value: string);
    procedure SetEstadoCivil(const Value: string);
    procedure SetNomeCidade(const Value: string);
    procedure SetCodigoUsuarioAlterou(const Value: Integer);
    procedure SetDataHoraAlteracao(const Value: TDateTime);
    procedure SetEmail(const Value: string);
    procedure SetNFicha(const Value: integer);
    procedure SetIdade(const Value: String);
  public
    [TJson,TColumn('nroficha')]
    property NFicha: integer read FNFicha write SetNFicha;

    [TColumn('nomepaciente'),TJson]
    property Nome: string read FNome write SetNome;

    [TJson,TColumn]
    property Sexo: string read FSexo write SetSexo;

    [TJson,TColumn]
    property Endereco: string read FEndereco write SetEndereco;

    [TJson,TColumn]
    property Bairro: string read FBairro write SetBairro;

    [TJson,TColumn]
    property CodigoCidade: Integer read FCodigoCidade write SetCodigoCidade;

    [TJson,TColumn('ecivil')]
    property EstadoCivil: string read FEstadoCivil write SetEstadoCivil;

    [TJson,TColumn('dtnascimento')]
    property DataNascimento: TDateTime read FDataNascimento write SetDataNascimento;

    [TJson,TColumn('nrocpf')]
    property CPF: string read FCPF write SetCPF;

    [TJson,TColumn('nrorg')]
    property RG: string read FRG write SetRG;

    [TJson,TColumn('foneresidencial')]
    property Telefone: String read FTelefone write SetTelefone;

    [TJson,TColumn('fonecelular')]
    property Celular: string read FCelular write SetCelular;

    [TJson,TColumn]
    property NomeResponsavel: string read FNomeResponsavel write SetNomeResponsavel;

    [TJson,TColumn]
    property NomeMae: string read FNomeMae write SetNomeMae;

    [TJson,TColumn]
    property NomePai: string read FNomePai write SetNomePai;

    [TJson,TColumn]
    property Alergia: string read FAlergia write SetAlergia;

    [TJson,TColumn('tpsangue')]
    property TipoSanguineo: string read FTipoSanguineo write SetTipoSanguineo;

    [TJson,TColumn('nome_convenio')]
    property Convenio: string read FConvenio write SetConvenio;

    [TJson,TColumn('convenio_matricula')]
    property MatriculaConvenio: string read FMatriculaConvenio write SetMatriculaConvenio;

    [TJson,TColumn('convenio_nome_plano')]
    property PlanoConvenio: string read FPlanoConvenio write SetPlanoConvenio;

    [TJson,TColumn]
    property NomeCidade:string read FNomeCidade write SetNomeCidade;

    [TJson,TColumn]
    property Email:string read FEmail write SetEmail;

    [TJson,TColumn('usuariodh')]
    property DataHoraAlteracao:TDateTime read FDataHoraAlteracao write SetDataHoraAlteracao;

    [TJson,TColumn('usuario')]
    property CodigoUsuarioAlterou:Integer read FCodigoUsuarioAlterou write SetCodigoUsuarioAlterou;

    property Idade:String read FIdade write SetIdade;

    constructor Create;

  end;

implementation

{ TPaciente }

constructor TPaciente.Create;
begin

end;

procedure TPaciente.SetAlergia(const Value: string);
begin
  FAlergia := Value;
end;

procedure TPaciente.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TPaciente.SetCelular(const Value: string);
begin
  FCelular := Value;
end;

procedure TPaciente.SetCodigoCidade(const Value: Integer);
begin
  FCodigoCidade := Value;
end;

procedure TPaciente.SetCodigoUsuarioAlterou(const Value: Integer);
begin
  FCodigoUsuarioAlterou := Value;
end;

procedure TPaciente.SetConvenio(const Value: string);
begin
  FConvenio := Value;
end;

procedure TPaciente.SetCPF(const Value: string);
begin
  FCPF := Value;
end;

procedure TPaciente.SetDataHoraAlteracao(const Value: TDateTime);
begin
  FDataHoraAlteracao := Value;
end;

procedure TPaciente.SetDataNascimento(const Value: TDateTime);
begin
  FDataNascimento := Value;
end;

procedure TPaciente.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TPaciente.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TPaciente.SetEstadoCivil(const Value: string);
begin
  FEstadoCivil := Value;
end;

procedure TPaciente.SetIdade(const Value: String);
begin
  FIdade := Value;
end;

procedure TPaciente.SetMatriculaConvenio(const Value: string);
begin
  FMatriculaConvenio := Value;
end;

procedure TPaciente.SetNFicha(const Value: integer);
begin
  FNFicha := Value;
end;

procedure TPaciente.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TPaciente.SetNomeCidade(const Value: string);
begin
  FNomeCidade := Value;
end;

procedure TPaciente.SetNomeMae(const Value: string);
begin
  FNomeMae := Value;
end;

procedure TPaciente.SetNomePai(const Value: string);
begin
  FNomePai := Value;
end;

procedure TPaciente.SetNomeResponsavel(const Value: string);
begin
  FNomeResponsavel := Value;
end;

procedure TPaciente.SetPlanoConvenio(const Value: string);
begin
  FPlanoConvenio := Value;
end;

procedure TPaciente.SetRG(const Value: string);
begin
  FRG := Value;
end;

procedure TPaciente.SetSexo(const Value: string);
begin
  FSexo := Value;
end;

procedure TPaciente.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

procedure TPaciente.SetTipoSanguineo(const Value: string);
begin
  FTipoSanguineo := Value;
end;

end.
