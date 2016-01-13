unit pCirurgia;

interface

uses
  pAtributos, System.DateUtils, System.SysUtils, System.Generics.Collections, pUtils,
  System.RegularExpressions;

type
  TCirurgia = class
  private
    FNomePaciente: String;
    FTempo: String;
    FCirurgia: String;
    FAgenda: String;
    FCirurgiao: String;
    FCodigoAgenda: Integer;
    FHoraEvento: String;
    FCor: Integer;
    FHora: String;
    FCodigo: Integer;
    FCodigoMedicoAnestesista: Integer;
    FStatus: String;
    FAnestesista: String;
    FDataEvento: String;
    FCodigoStatus: Integer;
    FCodigoCirurgiao: Integer;
    FNroFicha: Integer;
    FData: String;
    FObservacao: String;
    FNaturezaTratamento: String;
    FNInternacao: Integer;
    FCodigoNaturezaTratamento: Integer;
    FCodigoUsuarioAlterou: Integer;
    FDataHoraUltimaAlteracao: String;
    FConfirmado: String;
    FLiberado: String;
    FExcluido: Boolean;
    FTipoCirurgia: Integer;
    FLeito: String;
    procedure SetCirurgia(const Value: String);
    procedure SetCirurgiao(const Value: String);
    procedure SetNomePaciente(const Value: String);
    procedure SetAgenda(const Value: String);
    procedure SetTempo(const Value: String);
    procedure SetCodigoAgenda(const Value: Integer);
    procedure SetAnestesista(const Value: String);
    procedure SetCodigo(const Value: Integer);
    procedure SetCodigoCirurgiao(const Value: Integer);
    procedure SetCodigoMedicoAnestesista(const Value: Integer);
    procedure SetCodigoStatus(const Value: Integer);
    procedure SetCor(const Value: Integer);
    procedure SetData(const Value: String);
    procedure SetDataEvento(const Value: String);
    procedure SetHora(const Value: String);
    procedure SetHoraEvento(const Value: String);
    procedure SetNroFicha(const Value: Integer);
    procedure SetStatus(const Value: String);
    function GetTempo: String;
    function GetNomePaciente: String;
    function GetAgenda: String;
    function GetData: String;
    function GetHora: String;
    procedure SetCodigoNaturezaTratamento(const Value: Integer);
    procedure SetNaturezaTratamento(const Value: String);
    procedure SetNInternacao(const Value: Integer);
    procedure SetObservacao(const Value: String);
    procedure SetCodigoUsuarioAlterou(const Value: Integer);
    procedure SetDataHoraUltimaAlteracao(const Value: String);
    procedure SetConfirmado(const Value: String);
    procedure SetLiberado(const Value: String);
    procedure SetExcluido(const Value: Boolean);
    procedure SetTipoCirurgia(const Value: Integer);
    procedure SetLeito(const Value: String);
  public

    [TColumn,TJson]
    property Codigo: Integer read FCodigo write SetCodigo;

    [TColumn('codigo_agenda'),TJson]
    property CodigoAgenda: Integer read FCodigoAgenda write SetCodigoAgenda;

    [TLiveBinding, TColumn, TJson]
    property Hora: String read GetHora write SetHora;

    [TLiveBinding, TColumn, TJson]
    property Data: String read GetData write SetData; // vou deixar a data como string para melhor compatibilidade caso futuramente o firemonkey seja abandonado

    [TColumn('nroficha_ficha'),TJson]
    property NroFicha: Integer read FNroFicha write SetNroFicha;

    [TColumn('codigo_medico_anestesista'), TJson]
    property CodigoMedicoAnestesista: Integer read FCodigoMedicoAnestesista write SetCodigoMedicoAnestesista;

    [TColumn('codigo_cirurgiao'), TJson]
    property CodigoCirurgiao: Integer read FCodigoCirurgiao write SetCodigoCirurgiao;

    [TLiveBinding, TColumn, TJson]
    property Cirurgia: String read FCirurgia write SetCirurgia;

    [TLiveBinding('paciente'), TColumn('nome_paciente'), TJson]
    property NomePaciente: String read GetNomePaciente write SetNomePaciente;

    [TLiveBinding('sala'), TColumn, TJson]
    property Agenda: String read GetAgenda write SetAgenda;

    [TLiveBinding('cirurgiao'), TColumn, TJson]
    property Cirurgiao: String read FCirurgiao write SetCirurgiao;

    [TColumn, TJson]
    property Anestesista: String read FAnestesista write SetAnestesista;

    [TColumn('codigo_status'), TJson]
    property CodigoStatus: Integer read FCodigoStatus write SetCodigoStatus;

    [TLiveBinding, TColumn, TJson]
    property Status: String read FStatus write SetStatus;

    [TColumn, TJson]
    property Cor: Integer read FCor write SetCor;

    [TColumn('data_evento'), TJson]
    property DataEvento: String read FDataEvento write SetDataEvento;

    [TColumn('hora_evento'), TJson]
    property HoraEvento: String read FHoraEvento write SetHoraEvento;

    [TLiveBinding, TColumn, TJson]
    property Tempo: String read GetTempo write SetTempo;

    [TColumn('numero_internacao')]
    property NInternacao:Integer read FNInternacao write SetNInternacao;

    [TColumn('codigo_natureza_tratamento')]
    property CodigoNaturezaTratamento:Integer read FCodigoNaturezaTratamento write SetCodigoNaturezaTratamento;

    [TLiveBinding('natureza'), TColumn('natureza_tratamento'),TJson]
    property NaturezaTratamento:String read FNaturezaTratamento write SetNaturezaTratamento;

    [TLiveBinding('observacao'), TColumn, TJson]
    property Observacao:String read FObservacao write SetObservacao;

    [TColumn('usuario'), TJson]
    property CodigoUsuarioAlterou:Integer read FCodigoUsuarioAlterou write SetCodigoUsuarioAlterou;

    [TColumn, TJson]
    property DataHoraUltimaAlteracao:String read FDataHoraUltimaAlteracao write SetDataHoraUltimaAlteracao;

    [TColumn('Confirma'), TJson, TLiveBinding('confirmado')]
    property Confirmado: String read FConfirmado write SetConfirmado;

    [TColumn('Liberado'), TJson, TLiveBinding('liberado')]
    property Liberado: String read FLiberado write SetLiberado;

    [TColumn('Leito'), TJson, TLiveBinding('leito')]
    property Leito:String read FLeito write SetLeito;

    property Excluido:Boolean read FExcluido write SetExcluido;

    {
		  Precisei desse campo para que o PMobile saiba em qual tabela o registro esta.
			0|null - Cirurgia Normal (Agendamento)
			1 - Cirurgia de Urgencia
		}
    property TipoCirurgia:integer read FTipoCirurgia write SetTipoCirurgia;

    // variavel static(nao precisa de instancia para ser acessada)
    class var SomenteIniciaisPaciente: Boolean;

    constructor Create;
  end;

implementation

{ TCirurgia }

procedure TCirurgia.SetAnestesista(const Value: String);
begin
  FAnestesista := Value;
end;

procedure TCirurgia.SetCirurgia(const Value: String);
begin
  FCirurgia := Value;
end;

procedure TCirurgia.SetCirurgiao(const Value: String);
begin
  FCirurgiao := Value;
end;

procedure TCirurgia.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TCirurgia.SetCodigoAgenda(const Value: Integer);
begin
  FCodigoAgenda := Value;
end;

procedure TCirurgia.SetCodigoCirurgiao(const Value: Integer);
begin
  FCodigoCirurgiao := Value;
end;

procedure TCirurgia.SetCodigoMedicoAnestesista(const Value: Integer);
begin
  FCodigoMedicoAnestesista := Value;
end;

procedure TCirurgia.SetCodigoNaturezaTratamento(const Value: Integer);
begin
  FCodigoNaturezaTratamento := Value;
end;

procedure TCirurgia.SetCodigoStatus(const Value: Integer);
begin
  FCodigoStatus := Value;
end;

procedure TCirurgia.SetCodigoUsuarioAlterou(const Value: Integer);
begin
  FCodigoUsuarioAlterou := Value;
end;

procedure TCirurgia.SetConfirmado(const Value: String);
begin
  FConfirmado := Value;
end;

procedure TCirurgia.SetCor(const Value: Integer);
begin
  FCor := Value;
end;

procedure TCirurgia.SetData(const Value: String);
begin
  FData := Value;
end;

procedure TCirurgia.SetDataEvento(const Value: String);
begin
  FDataEvento := Value;
end;

procedure TCirurgia.SetDataHoraUltimaAlteracao(const Value: String);
begin
  FDataHoraUltimaAlteracao := Value;
end;

procedure TCirurgia.SetExcluido(const Value: Boolean);
begin
  FExcluido := Value;
end;

procedure TCirurgia.SetHora(const Value: String);
begin
  FHora := Value;
end;

procedure TCirurgia.SetHoraEvento(const Value: String);
begin
  FHoraEvento := Value;
end;

procedure TCirurgia.SetLeito(const Value: String);
begin
  FLeito := Value;
end;

procedure TCirurgia.SetLiberado(const Value: String);
begin
  FLiberado := Value;
end;

procedure TCirurgia.SetNaturezaTratamento(const Value: String);
begin
  FNaturezaTratamento := Value;
end;

procedure TCirurgia.SetNInternacao(const Value: Integer);
begin
  FNInternacao := Value;
end;

procedure TCirurgia.SetNomePaciente(const Value: String);
begin
  FNomePaciente := Value;
end;

procedure TCirurgia.SetNroFicha(const Value: Integer);
begin
  FNroFicha := Value;
end;

procedure TCirurgia.SetObservacao(const Value: String);
begin
  FObservacao := Value;
end;

procedure TCirurgia.SetStatus(const Value: String);
begin
  FStatus := Value;
end;

constructor TCirurgia.Create;
begin
  FCor := -1;
end;

function TCirurgia.GetAgenda: String;
begin
  if (FCodigoAgenda = 0) and (FCodigo <> 0) then
    Result := 'URGÊNCIA'
  else
    Result := FAgenda;
end;

function TCirurgia.GetData: String;
var
  vaData: TDateTime;
begin
  if TryStrToDateTime(FData, vaData) then
    Result := FormatDateTime('dd/mm/yy',vaData)
  else
    Result := '';
end;

function TCirurgia.GetHora: String;
var
  vaHora: TDateTime;
begin
  if TryStrToDateTime(FHora, vaHora) then
    Result := FormatDateTime('hh:mm', vaHora)
  else
    Result := '';
end;

function TCirurgia.GetNomePaciente: String;
var
  vaMatch: TMatch;
begin
  Result := '';
  if not SomenteIniciaisPaciente then
    Result := FNomePaciente
  else
    begin
      vaMatch := TRegEx.Match(FNomePaciente, '(?<=^|\s)\s*\w');
      while vaMatch.Success do
        begin
          Result := Result + vaMatch.Value.Trim;

          vaMatch := vaMatch.NextMatch;
        end;
    end;
end;

function TCirurgia.GetTempo: String;
var
  vaUltimoTempo, vaAgora: TDatetime;
  vaSegs, vaMins, vaHoras: Integer;
begin
  if (Self.DataEvento <> '') and (Self.HoraEvento <> '') then
    begin
      vaUltimoTempo := StrToDateTime(Self.DataEvento) + StrToDateTime(Self.HoraEvento);
      vaAgora := now;

      vaSegs := MilliSecondsBetween(vaAgora, vaUltimoTempo) div 1000; // quantidade em segundos
      vaMins := vaSegs div 60; // em minutos
      vaHoras := vaMins div 60; // em horas

      if vaMins > 59 then
        vaMins := vaMins mod 60;

      FTempo := Format('%.2d', [vaHoras]) + ':' + Format('%.2d', [vaMins]);
    end
  else
    begin
      if FCodigo <> 0 then
        FTempo := '00:00'
      else
        FTempo := '';
    end;

  Result := Self.FTempo;
end;

procedure TCirurgia.SetAgenda(const Value: String);
begin
  FAgenda := Value;
end;

procedure TCirurgia.SetTempo(const Value: String);
begin
  FTempo := Value;
end;

procedure TCirurgia.SetTipoCirurgia(const Value: Integer);
begin
  FTipoCirurgia := Value;
end;

initialization
TCirurgia.SomenteIniciaisPaciente := False;

finalization

end.
