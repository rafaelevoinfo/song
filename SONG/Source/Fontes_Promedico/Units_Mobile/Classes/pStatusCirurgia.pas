unit pStatusCirurgia;

interface

uses
  pAtributos;

type
  TStatusCirurgia = class
  private
    FExibirNoPainel: Integer;
    FCor: Integer;
    FDataHoraUltimaAlteracao: String;
    FDescricao: string;
    FUsuarioIncluiu: Integer;
    FCodigo: Integer;
    FUsuarioAlterou: Integer;
    FStatus: string;
    FExcluido: Boolean;
    procedure SetCodigo(const Value: Integer);
    procedure SetCor(const Value: Integer);
    procedure SetDataHoraUltimaAlteracao(const Value: String);
    procedure SetDescricao(const Value: string);
    procedure SetExibirNoPainel(const Value: Integer);
    procedure SetStatus(const Value: string);
    procedure SetUsuarioAlterou(const Value: Integer);
    procedure SetUsuarioIncluiu(const Value: Integer);
    procedure SetExcluido(const Value: Boolean);
  public
    [TColumn, TJson]
    property Codigo: Integer read FCodigo write SetCodigo;
    [TColumn, TJson]
    property Status: string read FStatus write SetStatus;
    [TColumn, TJson]
    property Descricao: string read FDescricao write SetDescricao;
    [TColumn, TJson]
    property Cor: Integer read FCor write SetCor;
    [TColumn('Exibir_Painel_Cirurgico'), TJson]
    property ExibirNoPainel: Integer read FExibirNoPainel write SetExibirNoPainel;
    [TColumn, TJson]
    property DataHoraUltimaAlteracao: String read FDataHoraUltimaAlteracao write SetDataHoraUltimaAlteracao;
    [TJson]
    property Excluido:Boolean read FExcluido write SetExcluido;
  end;

implementation

{ TStatusCirurgia }

procedure TStatusCirurgia.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TStatusCirurgia.SetCor(const Value: Integer);
begin
  FCor := Value;
end;

procedure TStatusCirurgia.SetDataHoraUltimaAlteracao(const Value: String);
begin
  FDataHoraUltimaAlteracao := Value;
end;

procedure TStatusCirurgia.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TStatusCirurgia.SetExcluido(const Value: Boolean);
begin
  FExcluido := Value;
end;

procedure TStatusCirurgia.SetExibirNoPainel(const Value: Integer);
begin
  FExibirNoPainel := Value;
end;

procedure TStatusCirurgia.SetStatus(const Value: string);
begin
  FStatus := Value;
end;

procedure TStatusCirurgia.SetUsuarioAlterou(const Value: Integer);
begin
  FUsuarioAlterou := Value;
end;

procedure TStatusCirurgia.SetUsuarioIncluiu(const Value: Integer);
begin
  FUsuarioIncluiu := Value;
end;

end.
