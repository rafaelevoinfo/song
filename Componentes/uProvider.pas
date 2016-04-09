unit uProvider;

interface

uses
  Datasnap.DSConnect, Classes;

type

  TRFProviderConnection = class(TDSProviderConnection)
  published
    property Connected stored False default false;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RafaelComponentes', [TRFProviderConnection]);
end;

end.
