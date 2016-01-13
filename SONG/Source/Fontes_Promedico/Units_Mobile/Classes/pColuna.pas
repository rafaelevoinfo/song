unit pColuna;

interface

uses
  System.Types, System.Classes, FMX.Graphics, FMX.Types;

type
  TColuna = class(TPersistent)
  private
    FPointF: TPointF;
    FPosition: TPosition;
    FTextSettings: TTextSettings;
    FVisible: Boolean;
    FWidth: Single;
    FCapitalize: Boolean;
    procedure SetPosition(const Value: TPosition);
    procedure SetTextSettings(const Value: TTextSettings);
    procedure SetVisible(const Value: Boolean);
    procedure SetWidth(const Value: Single);
    procedure SetCapitalize(const Value: Boolean);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent) ; override;
    property Capitalize: Boolean read FCapitalize write SetCapitalize;
    property Position: TPosition read FPosition write SetPosition;
    property TextSettings: TTextSettings read FTextSettings write SetTextSettings;
    property Visible: Boolean read FVisible write SetVisible;
    property Width: Single read FWidth write SetWidth;
  end;

implementation

{ TColuna }

procedure TColuna.Assign(Source: TPersistent);
begin
  if Source is TColuna then
    begin
      Capitalize := TColuna(Source).Capitalize;
      Position := TColuna(Source).Position;
      TextSettings := TColuna(Source).TextSettings;
      Visible := TColuna(Source).Visible;
      Width := TColuna(Source).Width;
    end
  else
    inherited;
end;

constructor TColuna.Create;
begin
  inherited Create;
  FCapitalize := True;
  FPosition := TPosition.Create(FPointF);
  FPosition.X := 0;
  FPosition.Y := 0;
  FTextSettings := TTextSettings.Create(Self);
  FVisible := True;
  FWidth := 20;
end;

destructor TColuna.Destroy;
begin
  FPosition.Free;
  FTextSettings.Free;
  inherited;
end;

procedure TColuna.SetCapitalize(const Value: Boolean);
begin
  FCapitalize := Value;
end;

procedure TColuna.SetPosition(const Value: TPosition);
begin
  FPosition.Assign(Value);
end;

procedure TColuna.SetTextSettings(const Value: TTextSettings);
begin
  FTextSettings.Assign(Value);
end;

procedure TColuna.SetVisible(const Value: Boolean);
begin
  FVisible := Value;
end;

procedure TColuna.SetWidth(const Value: Single);
begin
  FWidth := Value;
end;

end.

