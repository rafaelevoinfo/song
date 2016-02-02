unit uConnection;

interface

uses
  Data.SqlExpr, Classes;

type
  TRFSQLConnection = class(TSQLConnection)
  published
    property Connected stored False;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RafaelComponentes', [TRFSQLConnection]);
end;

end.
