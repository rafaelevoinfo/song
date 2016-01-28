unit uQuery;

interface

uses
  FireDAC.Comp.Client, Classes;

type
  TRFQuery = class(TFDQuery)

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RafaelComponentes', [TRFQuery]);
end;

end.
