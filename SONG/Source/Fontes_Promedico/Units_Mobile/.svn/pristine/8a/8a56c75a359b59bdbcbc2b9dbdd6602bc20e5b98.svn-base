unit pAgendaDetalhe;

interface

uses pAtributos, pMethod2009,System.SysUtils;

type
  TAgendaDetalhe = class
  private
    Fprioridade: string;
    Fnome_medico_agendamento: string;
    Fnome_medico_ultima_consulta: string;
    Fdata_ultima_consulta: string;
    Fnome_cidade: string;
    Fdias_ultima_consulta: integer;
    Festado: string;
    Fdata_hora_confirmacao: string;
    Fnome_usuario_incluiu: string;
    Fnome_usuario_alterou: string;
    Fnome_confirmou: string;
    FAvisar: string;
    FFone: string;
    FPrimeiroAtendimento: integer;
    FObservacao: string;
    FCodigExame: integer;
    FHaviso: string;
    FEmail: string;
    FHoraAtendimento: string;
    FDescricao: string;
    FLiberado: string;
    FDtNascimento: string;
    FCodigoAtendim: integer;
    FAtendido: integer;
    FTipo: integer;
    FIdadePaciente: string;
    procedure Setdata_ultima_consulta(const Value: string);
    procedure Setdias_ultima_consulta(const Value: integer);
    procedure Setestado(const Value: string);
    procedure Setnome_cidade(const Value: string);
    procedure Setnome_medico_agendamento(const Value: string);
    procedure Setnome_medico_ultima_consulta(const Value: string);
    procedure Setprioridade(const Value: string);
    procedure Setdata_hora_confirmacao(const Value: string);

    procedure Setnome_usuario_alterou(const Value: string);
    procedure Setnome_usuario_incluiu(const Value: string);
    procedure Setnome_confirmou(const Value: string);
    procedure SetAtendido(const Value: integer);
    procedure SetAvisar(const Value: string);
    procedure SetCodigExame(const Value: integer);
    procedure SetCodigoAtendim(const Value: integer);
    procedure SetDescricao(const Value: string);
    procedure SetDtNascimento(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetFone(const Value: string);
    procedure SetHaviso(const Value: string);
    procedure SetHoraAtendimento(const Value: string);
    procedure SetIdadePaciente(const Value: string);
    procedure SetLiberado(const Value: string);
    procedure SetObservacao(const Value: string);
    procedure SetPrimeiroAtendimento(const Value: integer);
    procedure SetTipo(const Value: integer);
  public
    [TColumn('nome_cidade')]
    property NomeCidade: string read Fnome_cidade write Setnome_cidade;

    [TColumn]
    property Estado: string read Festado write Setestado;

    [TColumn('nome_medico_agendamento')]
    property NomeMedicoAgendamento: string read Fnome_medico_agendamento write Setnome_medico_agendamento;

    [TColumn('data_ultima_consulta')]
    property DataUltimaConsulta: string read Fdata_ultima_consulta write Setdata_ultima_consulta;

    [TColumn('nome_medico_ultima_consulta')]
    property NomeMedicoUltimaConsulta: string read Fnome_medico_ultima_consulta write Setnome_medico_ultima_consulta;

    [TColumn('dias_ultima_consulta')]
    property DiasUltimaConsulta: integer read Fdias_ultima_consulta write Setdias_ultima_consulta;

    [TColumn]
    property Prioridade: string read Fprioridade write Setprioridade;

    [TColumn('nome_usuario_alterou')]
    property NomeUsuarioAlterou: string read Fnome_usuario_alterou write Setnome_usuario_alterou;

    [TColumn('nome_confirmou')]
    property NomeConfirmou: string read Fnome_confirmou write Setnome_confirmou;

    [TColumn('data_hora_confirmacao')]
    property DataHoraConfirmacao: string read Fdata_hora_confirmacao write Setdata_hora_confirmacao;

    [TColumn]
    property Fone: string read FFone write SetFone;

    [TColumn]
    property DtNascimento: string read FDtNascimento write SetDtNascimento;

    [TColumn]
    property Descricao: string read FDescricao write SetDescricao;

    [TColumn]
    property Avisar: string read FAvisar write SetAvisar;

    [TColumn]
    property Haviso: string read FHaviso write SetHaviso;

    [TColumn]
    property Liberado: string read FLiberado write SetLiberado;

    [TColumn('hora_atendimento')]
    property HoraAtendimento: string read FHoraAtendimento write SetHoraAtendimento;

    [TColumn('primeiro_atendimento')]
    property PrimeiroAtendimento: integer read FPrimeiroAtendimento write SetPrimeiroAtendimento;

    [TColumn]
    property Atendido: integer read FAtendido write SetAtendido;

    [TColumn]
    property Email: string read FEmail write SetEmail;

    [TColumn]
    property Tipo: integer read FTipo write SetTipo;

    [TColumn('codigo_atendim')]
    property CodigoAtendim: integer read FCodigoAtendim write SetCodigoAtendim;

    [TColumn('codigo_exame')]
    property CodigExame: integer read FCodigExame write SetCodigExame;

    [TColumn('observacoes')]
    property Observacao: string read FObservacao write SetObservacao;

    [TColumn]
    property IdadePaciente: string read FIdadePaciente write SetIdadePaciente;
  end;

implementation

{ TAgendaDetalhe }

procedure TAgendaDetalhe.SetAtendido(const Value: integer);
begin
  FAtendido := Value;
end;

procedure TAgendaDetalhe.SetAvisar(const Value: string);
begin
  FAvisar := Value;
end;

procedure TAgendaDetalhe.SetCodigExame(const Value: integer);
begin
  FCodigExame := Value;
end;

procedure TAgendaDetalhe.SetCodigoAtendim(const Value: integer);
begin
  FCodigoAtendim := Value;
end;

procedure TAgendaDetalhe.Setdata_hora_confirmacao(const Value: string);
begin
  Fdata_hora_confirmacao := Value;
end;

procedure TAgendaDetalhe.Setdata_ultima_consulta(const Value: string);
begin
  Fdata_ultima_consulta := Value;
end;

procedure TAgendaDetalhe.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TAgendaDetalhe.Setdias_ultima_consulta(const Value: integer);
begin
  Fdias_ultima_consulta := Value;
end;

procedure TAgendaDetalhe.SetDtNascimento(const Value: string);
begin
  IdadePaciente := Pegar_Idade(StrToDate(Value), Now);
  FDtNascimento := Value;
end;

procedure TAgendaDetalhe.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TAgendaDetalhe.Setestado(const Value: string);
begin
  Festado := Value;
end;

procedure TAgendaDetalhe.SetFone(const Value: string);
begin
  FFone := Value;
end;

procedure TAgendaDetalhe.SetHaviso(const Value: string);
begin
  FHaviso := Value;
end;

procedure TAgendaDetalhe.SetHoraAtendimento(const Value: string);
begin
  FHoraAtendimento := Value;
end;

procedure TAgendaDetalhe.SetIdadePaciente(const Value: string);
begin
  FIdadePaciente := Value;
end;

procedure TAgendaDetalhe.SetLiberado(const Value: string);
begin
  FLiberado := Value;
end;

procedure TAgendaDetalhe.Setnome_cidade(const Value: string);
begin
  Fnome_cidade := Value;
end;

procedure TAgendaDetalhe.Setnome_confirmou(const Value: string);
begin
  Fnome_confirmou := Value;
end;

procedure TAgendaDetalhe.Setnome_medico_agendamento(const Value: string);
begin
  Fnome_medico_agendamento := Value;
end;

procedure TAgendaDetalhe.Setnome_medico_ultima_consulta(const Value: string);
begin
  Fnome_medico_ultima_consulta := Value;
end;

procedure TAgendaDetalhe.Setnome_usuario_alterou(const Value: string);
begin
  Fnome_usuario_alterou := Value;
end;

procedure TAgendaDetalhe.Setnome_usuario_incluiu(const Value: string);
begin
  Fnome_usuario_incluiu := Value;
end;

procedure TAgendaDetalhe.SetObservacao(const Value: string);
begin
  FObservacao := Value;
end;

procedure TAgendaDetalhe.SetPrimeiroAtendimento(const Value: integer);
begin
  FPrimeiroAtendimento := Value;
end;

procedure TAgendaDetalhe.Setprioridade(const Value: string);
begin
  Fprioridade := Value;
end;

procedure TAgendaDetalhe.SetTipo(const Value: integer);
begin
  FTipo := Value;
end;

end.
