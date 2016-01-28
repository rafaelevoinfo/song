unit uExceptions;

interface

uses
  System.SysUtils, Vcl.Controls;

type
  TControlException = class(Exception)
  private
    FControl: TWinControl;
    procedure SetControl(const Value: TWinControl);
  public
    property Control: TWinControl read FControl write SetControl;
    constructor Create(ipMsg: string; ipControl: TWinControl); reintroduce;

  end;

implementation

{ TEditException }

constructor TControlException.Create(ipMsg: string; ipControl: TWinControl);
begin
  inherited Create(ipMsg);
  FControl := ipControl;
end;

procedure TControlException.SetControl(const Value: TWinControl);
begin
  FControl := Value;
end;

end.
