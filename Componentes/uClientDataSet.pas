unit uClientDataSet;

interface

uses
  Datasnap.DBClient, Classes;

type
  TRFClientDataSet = class(TClientDataSet)

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RafaelComponentes', [TRFClientDataSet]);
end;

end.
