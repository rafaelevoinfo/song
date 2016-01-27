unit uClientDataSet;

interface

uses
  Datasnap.DBClient, Classes;

type
  TRFClientDataSet = class(TClientDataSet)
  private
    FRFApplyAutomatico: Boolean;
    procedure SetRFApplyAutomatico(const Value: Boolean);

  public
    constructor Create(AOwner: TComponent); override;
    procedure Post; override;
    procedure InternalDelete; override;
  published
    property RFApplyAutomatico: Boolean read FRFApplyAutomatico write SetRFApplyAutomatico default true;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RafaelComponentes', [TRFClientDataSet]);
end;

{ TRFClientDataSet }

constructor TRFClientDataSet.Create(AOwner: TComponent);
begin
  inherited;
  FRFApplyAutomatico := True;
end;

procedure TRFClientDataSet.InternalDelete;
begin
  inherited;
  if FRFApplyAutomatico and (ChangeCount > 0) then
    ApplyUpdates(0);
end;

procedure TRFClientDataSet.Post;
begin
  inherited;
  if FRFApplyAutomatico and (ChangeCount > 0) then
    ApplyUpdates(0);
end;

procedure TRFClientDataSet.SetRFApplyAutomatico(const Value: Boolean);
begin
  FRFApplyAutomatico := Value;
end;

end.
