unit TestaCPF_CNPJ;

interface

uses
  SysUtils, Messages, Classes, Graphics, Controls,
  Forms, Dialogs;

type
  TMode = (moCPF, moCNPJ);

  TTestaCPF_CNPJ = class(TComponent)
  private
    FInput: string;
    FResult: Boolean;
    FMode: TMode;
    procedure SetInput(Value: string);
    procedure SetMode(Value: TMode);
    procedure SetCPF(Value: string);
    procedure SetCNPJ(Value: string);
    procedure SetResult(Value: Boolean);
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Input: string read FInput write SetInput;
    property Mode: TMode read FMode write SetMode;
    property Result: Boolean read FResult write SetResult;
  end;

implementation

uses pMethod2009;

constructor TTestaCPF_CNPJ.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FInput := '';
  FResult := False;
  FMode := moCPF;
end;

destructor TTestaCPF_CNPJ.Destroy;
begin
  inherited Destroy;
end;

procedure TTestaCPF_CNPJ.SetMode(Value: TMode);
begin
  if FMode <> Value then
    begin
      FMode := Value;
      SetInput(FInput);
    end;
end;

procedure TTestaCPF_CNPJ.SetInput(Value: string);
begin
  FInput := Value;
  case FMode of
    moCPF:
      SetCPF(Value);
    moCNPJ:
      SetCNPJ(Value);
  end;
end;

procedure TTestaCPF_CNPJ.SetCPF(Value: string);
var
  localCPF: string;
  localResult: Boolean;
  digit1, digit2: integer;
  ii, soma: integer;
begin
  localCPF := SoNumeros(FInput);
  localResult := Length(localCPF) = 11; { pegando somente os numeros para ficar CPF no formato 99999999900 }
  if ((localCPF = '00000000000') or (localCPF = '11111111111') or (localCPF = '22222222222') or
      (localCPF = '33333333333') or (localCPF = '44444444444') or (localCPF = '55555555555') or
      (localCPF = '66666666666') or (localCPF = '77777777777') or (localCPF = '88888888888') or (localCPF = '99999999999')) then
    localResult := False;

  { comeca a verificacao do digito }
  if localResult then
    try
      { 1° digito }
      soma := 0;
      for ii := 1 to 9 do
        Inc(soma, StrToInt(Copy(localCPF, 10 - ii, 1)) * (ii + 1));
      digit1 := 11 - (soma mod 11);
      if digit1 > 9 then
        digit1 := 0;

      { 2° digito }
      soma := 0;
      for ii := 1 to 10 do
        Inc(soma, StrToInt(Copy(localCPF, 11 - ii, 1)) * (ii + 1));
      digit2 := 11 - (soma mod 11);
      if digit2 > 9 then
        digit2 := 0;

      { Checa os dois dígitos }
      localResult := ( (digit1 = StrToInt(Copy(localCPF, 10, 1))) and (digit2 = StrToInt(Copy(localCPF, 11, 1))) );
    except
      localResult := False;
    end;

  FResult := localResult;
end;

procedure TTestaCPF_CNPJ.SetCNPJ(Value: string);
var
  localCNPJ: string;
  localResult: Boolean;
  digit1, digit2: integer;
  ii, soma: integer;
begin
  localCNPJ := '';
  localResult := False;

  { analisa CNPJ no formato 99.999.999/9999-00 }
  if Length(FInput) = 18 then
    if (Copy(FInput, 3, 1) + Copy(FInput, 7, 1) + Copy(FInput, 11, 1) + Copy(FInput, 16, 1) = '../-') then
      begin
        localCNPJ := Copy(FInput, 1, 2) + Copy(FInput, 4, 3) + Copy(FInput, 8, 3) + Copy(FInput, 12, 4) + Copy(FInput, 17, 2);
        localResult := True;
      end;

  { analisa CNPJ no formato 99999999999900 }
  if Length(FInput) = 14 then
    begin
      localCNPJ := FInput;
      localResult := True;
    end;

  { comeca a verificacao do digito }
  if localResult then
    try
      { 1° digito }
      soma := 0;
      for ii := 1 to 12 do
        begin
          if ii < 5 then
            Inc(soma, StrToInt(Copy(localCNPJ, ii, 1)) * (6 - ii))
          else
            Inc(soma, StrToInt(Copy(localCNPJ, ii, 1)) * (14 - ii))
        end;
      digit1 := 11 - (soma mod 11);
      if digit1 > 9 then
        digit1 := 0;

      { 2° digito }
      soma := 0;
      for ii := 1 to 13 do
        begin
          if ii < 6 then
            Inc(soma, StrToInt(Copy(localCNPJ, ii, 1)) * (7 - ii))
          else
            Inc(soma, StrToInt(Copy(localCNPJ, ii, 1)) * (15 - ii))
        end;
      digit2 := 11 - (soma mod 11);
      if digit2 > 9 then
        digit2 := 0;

      { Checa os dois dígitos }
      if (digit1 = StrToInt(Copy(localCNPJ, 13, 1))) and (digit2 = StrToInt(Copy(localCNPJ, 14, 1))) then
        localResult := True
      else
        localResult := False;
    except
      localResult := False;
    end;

  FResult := localResult;
end;

procedure TTestaCPF_CNPJ.SetResult(Value: Boolean);
begin
  { do nothing  //  read only }
end;

end.
