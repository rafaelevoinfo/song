unit pAgenda;

interface

uses pAtributos;

type
  TAgenda = class
  private
    FNome_Cirurgiao: string;
    FNome_Historico_Atendimento: string;
    FConfirma: string;
    FNome_Anestesista: string;
    FHora: string;
    FCodigo: Integer;
    FCodigo_Medico: Integer;
    FNome_convenio: string;
    FCodigo_Cirurgiao: Integer;
    FBloqueado: string;
    FNroficha_ficha: Integer;
    FNome_paciente: string;
    FNome_Cirurgia: string;
    FCodigo_Agenda: Integer;
    FData: string;
    FNome_Usuario_Incluiu: string;
    FTipo_Agenda: Integer;
    FTipo_Agenda_Descricao: string;
    FNome_Agenda: string;
    FDataHoraUltimaAlteracao:string;
    FNomeAnestesista: string;
    FDataHoraInclusao: string;
    FExcluido: Boolean;

    procedure SetBloqueado(const Value: string);
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigo_Agenda(const Value: Integer);

    procedure SetCodigo_Cirurgiao(const Value: Integer);
    procedure SetCodigo_Medico(const Value: Integer);
    procedure SetConfirma(const Value: string);
    procedure SetData(const Value: string);
    procedure SetHora(const Value: string);

    procedure SetNome_Anestesista(const Value: string);
    procedure SetNome_Cirurgia(const Value: string);
    procedure SetNome_Cirurgiao(const Value: string);
    procedure SetNome_convenio(const Value: string);
    procedure SetNome_Historico_Atendimento(const Value: string);
    procedure SetNome_paciente(const Value: string);
    procedure SetNroficha_ficha(const Value: Integer);

    procedure SetDataHoraUltimaAlteracao(const Value: string);
    procedure SetNome_Usuario_Incluiu(const Value: string);
    procedure SetTipo_Agenda(const Value: Integer);
    procedure SetTipo_Agenda_Descricao(const Value: string);
    procedure SetNome_Agenda(const Value: string);
    procedure SetNomeAnestesista(const Value: string);
    procedure SetDataHoraInclusao(const Value: string);
    procedure SetExcluido(const Value: Boolean);

  public
    [TColumn,TJson]
    property Codigo: Integer read FCodigo write SetCodigo;
    [TColumn('codigo_agenda')]
    property CodigoAgenda: Integer read FCodigo_Agenda write SetCodigo_Agenda;
    [TColumn]
    property Data: string read FData write SetData;
    [TColumn]
    property Hora: string read FHora write SetHora;

    [TColumn]
    property Confirma: string read FConfirma write SetConfirma;

    [TColumn]
    property Bloqueado: string read FBloqueado write SetBloqueado;

    [TColumn('nome_convenio')]
    property NomeConvenio: string read FNome_convenio write SetNome_convenio;

    [TColumn('nroficha_ficha')]
    property NFicha: Integer read FNroficha_ficha write SetNroficha_ficha;

    [TColumn('nome_paciente')]
    property NomePaciente: string read FNome_paciente write SetNome_paciente;

    [TColumn('nome_historico_atendimento')]
    property NomeHistoricoAtendimento: string read FNome_Historico_Atendimento write SetNome_Historico_Atendimento;

    [TColumn('codigo_medico')]
    property CodigoMedico: Integer read FCodigo_Medico write SetCodigo_Medico;
    [TColumn('codigo_cirurgiao')]
    property CodigoCirurgiao: Integer read FCodigo_Cirurgiao write SetCodigo_Cirurgiao;
    [TColumn('nome_cirurgiao')]
    property NomeCirurgiao: string read FNome_Cirurgiao write SetNome_Cirurgiao;
    [TColumn('nome_cirurgia')]
    property NomeCirurgia: string read FNome_Cirurgia write SetNome_Cirurgia;

    [TColumn('nome_anestesista')]
    property NomeAnestesista: string read FNomeAnestesista write SetNomeAnestesista;

    [TColumn('usuariodh')]
    property DataHoraUltimaAlteracao: string read FDataHoraUltimaAlteracao write SetDataHoraUltimaAlteracao;

    [TColumn('nome_agenda')]
    property NomeAgenda: string read FNome_Agenda write SetNome_Agenda;
    [TColumn('tipo_agenda')]
    property TipoAgenda: Integer read FTipo_Agenda write SetTipo_Agenda;
    [TColumn('tipo_agenda_descricao')]
    property TipoAgendaDescricao: string read FTipo_Agenda_Descricao write SetTipo_Agenda_Descricao;
    [TColumn('nome_usuario_incluiu')]
    property NomeUsuarioIncluiu: string read FNome_Usuario_Incluiu write SetNome_Usuario_Incluiu;
    [TColumn('usuariodhinc')]
    property DataHoraInclusao:string read FDataHoraInclusao write SetDataHoraInclusao;

    //Utilizado apenas quando é solicitado a averiguacao da existencia de alguns codigos, caso nao existam mais, um novo objeto TAgenda é criado apenas com a informacao do codigo e essa flag marcada como true
    [TJson]
    property Excluido:Boolean read FExcluido write SetExcluido;


  end;

implementation

uses
  pMethod2009, System.SysUtils;

{ TAgenda }


procedure TAgenda.SetBloqueado(const Value: string);
begin
  FBloqueado := Value;
end;

procedure TAgenda.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TAgenda.SetCodigo_Agenda(const Value: Integer);
begin
  FCodigo_Agenda := Value;
end;


procedure TAgenda.SetCodigo_Cirurgiao(const Value: Integer);
begin
  FCodigo_Cirurgiao := Value;
end;

procedure TAgenda.SetCodigo_Medico(const Value: Integer);
begin
  FCodigo_Medico := Value;
end;

procedure TAgenda.SetConfirma(const Value: string);
begin
  FConfirma := Value;
end;

procedure TAgenda.SetData(const Value: string);
begin
  FData := Value;
end;

procedure TAgenda.SetDataHoraInclusao(const Value: string);
begin
  FDataHoraInclusao := Value;
end;

procedure TAgenda.SetDataHoraUltimaAlteracao(const Value: string);
begin
  FDataHoraUltimaAlteracao := Value;
end;

procedure TAgenda.SetExcluido(const Value: Boolean);
begin
  FExcluido := Value;
end;

procedure TAgenda.SetHora(const Value: string);
begin
  FHora := Value;
end;

procedure TAgenda.SetNomeAnestesista(const Value: string);
begin
  FNomeAnestesista := Value;
end;

procedure TAgenda.SetNome_Agenda(const Value: string);
begin
  FNome_Agenda := Value;
end;

procedure TAgenda.SetNome_Anestesista(const Value: string);
begin
  FNome_Anestesista := Value;
end;

procedure TAgenda.SetNome_Cirurgia(const Value: string);
begin
  FNome_Cirurgia := Value;
end;

procedure TAgenda.SetNome_Cirurgiao(const Value: string);
begin
  FNome_Cirurgiao := Value;
end;

procedure TAgenda.SetNome_convenio(const Value: string);
begin
  FNome_convenio := Value;
end;

procedure TAgenda.SetNome_Historico_Atendimento(const Value: string);
begin
  FNome_Historico_Atendimento := Value;
end;

procedure TAgenda.SetNome_paciente(const Value: string);
begin
  FNome_paciente := Value;
end;

procedure TAgenda.SetNome_Usuario_Incluiu(const Value: string);
begin
  FNome_Usuario_Incluiu := Value;
end;

procedure TAgenda.SetNroficha_ficha(const Value: Integer);
begin
  FNroficha_ficha := Value;
end;

procedure TAgenda.SetTipo_Agenda(const Value: Integer);
begin
  FTipo_Agenda := Value;
end;

procedure TAgenda.SetTipo_Agenda_Descricao(const Value: string);
begin
  FTipo_Agenda_Descricao := Value;
end;

end.
