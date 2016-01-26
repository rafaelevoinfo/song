unit uUtils;

interface

uses
  System.SysUtils, Vcl.Dialogs;

type
  TUtils = class

  end;

  TMsg = class
    class procedure ppuShowException(ipMsg: string; ipEx: Exception);overload;
    class procedure ppuShowException(ipEx: Exception); overload;
  end;

implementation

{ TExceptionManager }

{ TMsg }

class procedure TMsg.ppuShowException(ipMsg: string; ipEx: Exception);
begin
  ShowMessage(ipMsg + slinebreak + ipEx.Message);
end;

class procedure TMsg.ppuShowException(ipEx: Exception);
begin
  ShowMessage(ipEx.Message);
end;

end.
