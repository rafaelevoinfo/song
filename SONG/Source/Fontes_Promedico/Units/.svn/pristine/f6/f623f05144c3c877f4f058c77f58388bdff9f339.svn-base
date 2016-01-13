unit aduna_ds_list;

interface

uses System.Generics.Collections;

type

  TadsObjectlist<T: Class> = class;

  TadsObjectlistEnumerator<T: Class> = class
  private
    FadsObjectlist: TadsObjectlist<T>;
    FIndex: integer;
  protected
    function GetCurrent: T; virtual;
  public
    constructor Create(aList: TadsObjectlist<T>);
    function MoveNext: Boolean;
    property Current: T read GetCurrent;
  end;

  TadsObjectlist<T: Class> = class
  private
    FData: TArray<T>;
    function GetItem(AIndex: integer): T;
    procedure SetItem(AIndex: integer; const Value: T);
  public
    constructor Create;
    destructor Destroy; override;

    procedure Clear;
    procedure Add(AItem: T);
    procedure AddRange(ipLista: TList<T>);
    function Last: T;
    function ToArray(): TArray<T>;
    function Count: integer;
    function GetEnumerator: TadsObjectlistEnumerator<T>;
    function IndexOf(AItem: T): integer;

    property Items[AIndex: integer]: T read GetItem write SetItem; default;
  end;

implementation

{ TadsObjectlist<T> }

procedure TadsObjectlist<T>.Add(AItem: T);
var
  LIndex: integer;
begin
  LIndex := Length(FData);
  SetLengtH(FData, LIndex + 1);
  FData[LIndex] := AItem;
end;

procedure TadsObjectlist<T>.AddRange(ipLista: TList<T>);
var
  vaItem: T;
begin
  for vaItem in ipLista do
    begin
      Add(vaItem);
    end;
end;

procedure TadsObjectlist<T>.Clear;
var
  LItem: T;
begin
  for LItem in FData do
    LItem.Free;
  SetLengtH(FData, 0);
end;

function TadsObjectlist<T>.Count: integer;
begin
  result := Length(FData);
end;

constructor TadsObjectlist<T>.Create;
begin
  inherited;
  SetLengtH(FData, 0);
end;

destructor TadsObjectlist<T>.Destroy;
begin
  Clear;
  inherited;
end;

function TadsObjectlist<T>.GetEnumerator: TadsObjectlistEnumerator<T>;
begin
  result := TadsObjectlistEnumerator<T>.Create(Self);
end;

function TadsObjectlist<T>.GetItem(AIndex: integer): T;
begin
  result := FData[AIndex];
end;

function TadsObjectlist<T>.IndexOf(AItem: T): integer;
 { DONE : Implement IndexOf Method }
var
  i: integer;
begin
  for i := 0 to Length(FData) - 1 do
    if AItem = FData[i] then
      begin
        result := i;
        exit
      end;
  result := -1;
end;

function TadsObjectlist<T>.Last: T;
begin
  result := nil;
  if Count > 0 then
    result := FData[High(FData)];
end;

procedure TadsObjectlist<T>.SetItem(AIndex: integer; const Value: T);
begin
  FData[AIndex] := Value;
end;

function TadsObjectlist<T>.ToArray: TArray<T>;
var
  vaItem: T;
  i: integer;
begin
  SetLengtH(result, Count);
  for i := 0 to High(FData) do
    result[i] := FData[i];
end;

{ TadsObjectlistEnumerator<T> }

constructor TadsObjectlistEnumerator<T>.Create(aList: TadsObjectlist<T>);
begin
  FIndex := -1;
  FadsObjectlist := aList;
end;

function TadsObjectlistEnumerator<T>.GetCurrent: T;
begin
  result := FadsObjectlist.GetItem(FIndex);
end;

function TadsObjectlistEnumerator<T>.MoveNext: Boolean;
begin
  result := FIndex < FadsObjectlist.Count - 1;
  if result then
    begin
      Inc(FIndex);
    end;
end;

end.
