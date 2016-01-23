unit uClientDataSet;

interface

uses
  Datasnap.DBClient, Classes;

type
  TRfClientDataSet = class(TClientDataSet)

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RafaelComponentes', [TRfClientDataSet]);
end;

end.
