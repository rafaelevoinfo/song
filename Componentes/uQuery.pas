unit uQuery;

interface

uses
  FireDAC.Comp.Client, Classes, Datasnap.DBClient, Data.DB;

type
  [ComponentPlatformsAttribute(pidWin32 or pidWin64 or pidOSX32 or pidiOSSimulator or pidiOSDevice or pidAndroid)]
  TRFQuery = class(TFDQuery)
  public
    function fpuCopiarToClientDataSet: TClientDataSet;
    function fpuConvertToOleVariant: OleVariant;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RafaelComponentes', [TRFQuery]);
end;

{ TRFQuery }

function TRFQuery.fpuConvertToOleVariant: OleVariant;
var
  vaCds:TClientDataSet;
begin
  vaCds := fpuCopiarToClientDataSet;
  try
    Result := vaCds.Data;
  finally
    vaCds.free;
  end;
end;

function TRFQuery.fpuCopiarToClientDataSet: TClientDataSet;
var
  i: Integer;
  vaField: TField;
begin
  Result := TClientDataSet.Create(nil);

  Result.FieldDefs.Assign(Self.FieldDefs);
  if not Result.Active then
    Result.CreateDataSet;

  First;
  while not Eof do
    begin
      Result.Append;

      for i := 0 to Self.FieldCount - 1 do
        begin
          vaField := Self.Fields[i];
          Result.Fields[i].Assign(vaField);
        end;

      Result.Post;

      Next;
    end;
end;

end.
