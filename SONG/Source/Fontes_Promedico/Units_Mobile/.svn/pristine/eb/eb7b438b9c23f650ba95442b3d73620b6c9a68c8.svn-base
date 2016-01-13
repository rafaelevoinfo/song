unit pLinha;

interface

uses
  pColuna, System.SysUtils, System.UITypes, System.Generics.Collections;

type
  TTipoCor = (tcGradiente, tcSolida);

  TLinha = class
  private
    FColunas: TDictionary<string, TColuna>;
    FQuantidadeLinhas: Integer;
    FDiferenciaLinhasPorCor: Boolean;
    FLinhaParCor2: TAlphaColor;
    FLinhaParTipoCorFundo: Integer;
    FLinhaParCor1: TAlphaColor;
    FTempoExibicao: Integer;
    FLinhaImparCor2: TAlphaColor;
    FLinhaImparTipoCorFundo: Integer;
    FLinhaImparCor1: TAlphaColor;
    FExibirIniciaisPaciente: Boolean;
    FAlturaListBox: Single;
    FDadosDuasLinhas: Boolean;
    FExibirSomenteNumerosSala: Boolean;
    FNomeOpcionalSalaUrgencia: string;
    function GetAlturaLinha: Single;
    function GetLinhaImparCor2: TAlphaColor;
    function GetLinhaParCor1: TAlphaColor;
    function GetLinhaParCor2: TAlphaColor;
    function GetLinhaParTipoCorFundo: Integer;
    procedure SetDiferenciaLinhasPorCor(const Value: Boolean);
    procedure SetExibirIniciaisPaciente(const Value: Boolean);
    procedure SetLinhaImparCor1(const Value: TAlphaColor);
    procedure SetLinhaImparCor2(const Value: TAlphaColor);
    procedure SetLinhaImparTipoCorFundo(const Value: Integer);
    procedure SetLinhaParCor1(const Value: TAlphaColor);
    procedure SetLinhaParCor2(const Value: TAlphaColor);
    procedure SetLinhaParTipoCorFundo(const Value: Integer);
    procedure SetQuantidadeLinhas(const Value: Integer);
    procedure SetTempoExibicao(const Value: Integer);
    procedure SetAlturaListBox(const Value: Single);
    procedure SetDadosDuasLinhas(const Value: Boolean);
    procedure SetExibirSomenteNumerosSala(const Value: Boolean);
    procedure ppvLimparColunas;
    procedure SetNomeOpcionalSalaUrgencia(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    property Colunas: TDictionary<string, TColuna> read FColunas;
    property DadosDuasLinhas: Boolean read FDadosDuasLinhas write SetDadosDuasLinhas;
    property ExibirIniciaisPaciente: Boolean read FExibirIniciaisPaciente write SetExibirIniciaisPaciente;
    property ExibirSomenteNumerosSala: Boolean read FExibirSomenteNumerosSala write SetExibirSomenteNumerosSala;
    property NomeOpcionalSalaUrgencia: string read FNomeOpcionalSalaUrgencia write SetNomeOpcionalSalaUrgencia;
    property QuantidadeLinhas: Integer read FQuantidadeLinhas write SetQuantidadeLinhas;
    property AlturaListBox: Single read FAlturaListBox write SetAlturaListBox;
    property AlturaLinha: Single read GetAlturaLinha;
    property TempoExibicao: Integer read FTempoExibicao write SetTempoExibicao;
    property DiferenciaLinhasPorCor: Boolean read FDiferenciaLinhasPorCor write SetDiferenciaLinhasPorCor;
    property LinhaImparCor1: TAlphaColor read FLinhaImparCor1 write SetLinhaImparCor1;
    property LinhaImparCor2: TAlphaColor read GetLinhaImparCor2 write SetLinhaImparCor2;
    property LinhaImparTipoCorFundo: Integer read FLinhaImparTipoCorFundo write SetLinhaImparTipoCorFundo;
    property LinhaParCor1: TAlphaColor read GetLinhaParCor1 write SetLinhaParCor1;
    property LinhaParCor2: TAlphaColor read GetLinhaParCor2 write SetLinhaParCor2;
    property LinhaParTipoCorFundo: Integer read GetLinhaParTipoCorFundo write SetLinhaParTipoCorFundo;
  end;

implementation

{ TLinha }

constructor TLinha.Create;
begin
  FColunas := TDictionary<string, TColuna>.Create;
  FQuantidadeLinhas := 1;
end;

destructor TLinha.Destroy;
begin
  ppvLimparColunas;
  FreeAndNil(FColunas);
  inherited;
end;

function TLinha.GetAlturaLinha: Single;
begin
  Result := FAlturaListBox/FQuantidadeLinhas;
end;

function TLinha.GetLinhaImparCor2: TAlphaColor;
begin
  if FLinhaImparTipoCorFundo <> 2 then
    Result := FLinhaImparCor2
  else
    Result := LinhaImparCor1;
end;

function TLinha.GetLinhaParCor1: TAlphaColor;
begin
  if FDiferenciaLinhasPorCor then
    Result := FLinhaParCor1
  else
    Result := LinhaImparCor1;
end;

function TLinha.GetLinhaParCor2: TAlphaColor;
begin
  if FDiferenciaLinhasPorCor then
    begin
      if FLinhaParTipoCorFundo <> 2 then
        Result := FLinhaParCor2
      else
        Result := LinhaParCor1;
    end
  else
    Result := LinhaImparCor2;
end;

function TLinha.GetLinhaParTipoCorFundo: Integer;
begin
  if FDiferenciaLinhasPorCor then
    Result := FLinhaParTipoCorFundo
  else
    Result := LinhaImparTipoCorFundo;
end;

procedure TLinha.ppvLimparColunas;
var
  vaColuna: TColuna;
begin
  if Assigned(FColunas) then
    begin
      for vaColuna in FColunas.Values do
        begin
          if Assigned(vaColuna) then
            vaColuna.Free;
        end;

      FColunas.Clear;
    end;
end;

procedure TLinha.SetAlturaListBox(const Value: Single);
begin
  FAlturaListBox := Value;
end;

procedure TLinha.SetDadosDuasLinhas(const Value: Boolean);
begin
  FDadosDuasLinhas := Value;
end;

procedure TLinha.SetDiferenciaLinhasPorCor(const Value: Boolean);
begin
  FDiferenciaLinhasPorCor := Value;
end;

procedure TLinha.SetExibirIniciaisPaciente(const Value: Boolean);
begin
  FExibirIniciaisPaciente := Value;
end;

procedure TLinha.SetExibirSomenteNumerosSala(const Value: Boolean);
begin
  FExibirSomenteNumerosSala := Value;
end;

procedure TLinha.SetLinhaImparCor1(const Value: TAlphaColor);
begin
  FLinhaImparCor1 := Value;
end;

procedure TLinha.SetLinhaImparCor2(const Value: TAlphaColor);
begin
  FLinhaImparCor2 := Value;
end;

procedure TLinha.SetLinhaImparTipoCorFundo(const Value: Integer);
begin
  FLinhaImparTipoCorFundo := Value;
end;

procedure TLinha.SetLinhaParCor1(const Value: TAlphaColor);
begin
  FLinhaParCor1 := Value;
end;

procedure TLinha.SetLinhaParCor2(const Value: TAlphaColor);
begin
  FLinhaParCor2 := Value;
end;

procedure TLinha.SetLinhaParTipoCorFundo(const Value: Integer);
begin
  FLinhaParTipoCorFundo := Value;
end;

procedure TLinha.SetNomeOpcionalSalaUrgencia(const Value: string);
begin
  FNomeOpcionalSalaUrgencia := Value;
end;

procedure TLinha.SetQuantidadeLinhas(const Value: Integer);
begin
  if Value > 0 then
    FQuantidadeLinhas := Value;
end;

procedure TLinha.SetTempoExibicao(const Value: Integer);
begin
  FTempoExibicao := Value;
end;

end.
