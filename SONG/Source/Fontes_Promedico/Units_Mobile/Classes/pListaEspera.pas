unit pListaEspera;

interface

uses pAtributos, System.DateUtils, System.SysUtils;

type
//
  TListaEspera = class
  private
    FConvenio: String;
    FCodigo: integer;
    FNFicha: integer;
    FNomePaciente: String;
    FCriterioAtendimento: String;
    FCodigoExame: Integer;
    FValorTotalAtendimento: Double;
    FStatus: String;
    FTipoAtendimento: String;
    FCodigoCategoria: Integer;
    FStatusSolicitacao: String;
    FDataAtendimento: String;
    FHoraCadastro: String;
    FHistorico: String;
    FDataNascimento: String;
    FDataHoraUltimaAlteracao: String;
    FAgendado: String;
    FRotinaEmergencia: integer;
    FIdade: String;
    FNomeUsuario: String;
    FSexo: String;
    FAlertaPrioridade: Integer;
    FHoraAgendamento: String;
    FExcluido: Boolean;
    FCodigoMedico: Integer;
    procedure SetStatus(const Value: String);
    procedure SetCodigoCategoria(const Value: Integer);
    procedure SetCodigoExame(const Value: Integer);
    procedure SetConvenio(const Value: String);
    procedure SetCriterioAtendimento(const Value: String);
    procedure SetDataAtendimento(const Value: String);
    procedure SetHoraCadastro(const Value: String);
    procedure SetCodigo(const Value: integer);
    procedure SetNFicha(const Value: integer);
    procedure SetNomePaciente(const Value: String);
    procedure SetStatusSolicitacao(const Value: String);
    procedure SetTipoAtendimento(const Value: String);
    procedure SetValorTotalAtendimento(const Value: Double);
    procedure SetAgendado(const Value: String);
    procedure SetAlertaPrioridade(const Value: Integer);
    procedure SetDataHoraUltimaAlteracao(const Value: String);
    procedure SetDataNascimento(const Value: String);
    procedure SetHistorico(const Value: String);
    procedure SetHoraAgendamento(const Value: String);
    procedure SetIdade(const Value: String);
    procedure SetNomeUsuario(const Value: String);
    procedure SetRotinaEmergencia(const Value: integer);
    procedure SetSexo(const Value: String);
    procedure SetExcluido(const Value: Boolean);
    procedure SetCodigoMedico(const Value: Integer);
  public
    [TColumn('NAtendimento'), TJson]
    property Codigo: integer read FCodigo write SetCodigo;

    [TColumn]
    property NFicha: integer read FNFicha write SetNFicha;

    [TColumn('EXAME_CODIGO')]
    property CodigoExame:Integer read FCodigoExame write SetCodigoExame;

    [TColumn('CTEXAMES_CODIGO')]
    property CodigoCategoria:Integer read FCodigoCategoria write SetCodigoCategoria;

    [TColumn]
    property NomePaciente: String read FNomePaciente write SetNomePaciente;

    [TColumn('ATENDIDO')]
    property Status: String read FStatus write SetStatus;

    [TColumn('DTATENDIMENTO')]
    property DataAtendimento: String read FDataAtendimento write SetDataAtendimento;

    [TColumn('VALTOTALATENDIMENTO')]
    property ValorTotalAtendimento: Double read FValorTotalAtendimento write SetValorTotalAtendimento;

    [TColumn('HORCADASTRO')]
    property HoraCadastro: String read FHoraCadastro write SetHoraCadastro;

    [TColumn('CONVENIO_NOME')]
    property Convenio: String read FConvenio write SetConvenio;

    [TColumn('NOME_PRIORIDADE')]
    property CriterioAtendimento: String read FCriterioAtendimento write SetCriterioAtendimento;

    [TColumn('SOLICITACAO_SECRETARIA')]
    property StatusSolicitacao: String read FStatusSolicitacao write SetStatusSolicitacao;

    [TColumn('TIPO_ATENDIMENTO'), TJson]
    property TipoAtendimento:String read FTipoAtendimento write SetTipoAtendimento;

    [TColumn]
    property Agendado:String read FAgendado write SetAgendado;

    [TColumn('USUARIODH')]
    property DataHoraUltimaAlteracao:String read FDataHoraUltimaAlteracao write SetDataHoraUltimaAlteracao;

    [TColumn('ROTINA_EMERGENCIA')]
    property RotinaEmergencia: integer read FRotinaEmergencia write SetRotinaEmergencia;

    [TColumn('HORA_AGENDAMENTO')]
    property HoraAgendamento: String read FHoraAgendamento write SetHoraAgendamento;

    [TColumn('SENHAUS_NOME')]
    property NomeUsuario: String read FNomeUsuario write SetNomeUsuario;

    [TColumn]
    property Idade:String read FIdade write SetIdade;

    [TColumn]
    property Sexo:String read FSexo write SetSexo;

    [TColumn('ALERTA_PRIORIDADE')]
    property AlertaPrioridade:Integer read FAlertaPrioridade write SetAlertaPrioridade;

    [TColumn]
    property Historico:String read FHistorico write SetHistorico;

    [TColumn('DTNASCIMENTO')]
    property DataNascimento:String read FDataNascimento write SetDataNascimento;

    [TColumn('CMEDICO')]
    property CodigoMedico:Integer read FCodigoMedico write SetCodigoMedico;

    [TJson]
    property Excluido:Boolean read FExcluido write SetExcluido;
  end;


implementation


{ TListaEspera }

procedure TListaEspera.SetAgendado(const Value: String);
begin
  FAgendado := Value;
end;

procedure TListaEspera.SetAlertaPrioridade(const Value: Integer);
begin
  FAlertaPrioridade := Value;
end;

procedure TListaEspera.SetStatus(const Value: String);
begin
  FStatus := Value;
end;

procedure TListaEspera.SetCodigoCategoria(const Value: Integer);
begin
  FCodigoCategoria := Value;
end;

procedure TListaEspera.SetCodigoExame(const Value: Integer);
begin
  FCodigoExame := Value;
end;

procedure TListaEspera.SetCodigoMedico(const Value: Integer);
begin
  FCodigoMedico := Value;
end;

procedure TListaEspera.SetConvenio(const Value: String);
begin
  FConvenio := Value;
end;

procedure TListaEspera.SetCriterioAtendimento(const Value: String);
begin
  FCriterioAtendimento := Value;
end;

procedure TListaEspera.SetDataAtendimento(const Value: String);
begin
  FDataAtendimento := Value;
end;

procedure TListaEspera.SetDataHoraUltimaAlteracao(const Value: String);
begin
  FDataHoraUltimaAlteracao := Value;
end;

procedure TListaEspera.SetDataNascimento(const Value: String);
begin
  FDataNascimento := Value;
end;

procedure TListaEspera.SetExcluido(const Value: Boolean);
begin
  FExcluido := Value;
end;

procedure TListaEspera.SetHistorico(const Value: String);
begin
  FHistorico := Value;
end;

procedure TListaEspera.SetHoraAgendamento(const Value: String);
begin
  FHoraAgendamento := Value;
end;

procedure TListaEspera.SetHoraCadastro(const Value: String);
begin
  FHoraCadastro := Value;
end;

procedure TListaEspera.SetIdade(const Value: String);
begin
  FIdade := Value;
end;

procedure TListaEspera.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TListaEspera.SetNFicha(const Value: integer);
begin
  FNFicha := Value;
end;

procedure TListaEspera.SetNomePaciente(const Value: String);
begin
  FNomePaciente := Value;
end;

procedure TListaEspera.SetNomeUsuario(const Value: String);
begin
  FNomeUsuario := Value;
end;

procedure TListaEspera.SetRotinaEmergencia(const Value: integer);
begin
  FRotinaEmergencia := Value;
end;

procedure TListaEspera.SetSexo(const Value: String);
begin
  FSexo := Value;
end;

procedure TListaEspera.SetStatusSolicitacao(const Value: String);
begin
  FStatusSolicitacao := Value;
end;

procedure TListaEspera.SetTipoAtendimento(const Value: String);
begin
  FTipoAtendimento := Value;
end;

procedure TListaEspera.SetValorTotalAtendimento(const Value: Double);
begin
  FValorTotalAtendimento := Value;
end;

end.
