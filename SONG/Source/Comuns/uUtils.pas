unit uUtils;

interface

uses
  System.SysUtils, Vcl.Dialogs;

type
  TUtils = class

  end;

  TMsg = class
    class procedure ppuShowException(ipMsg: string; ipEx: Exception);
  end;

implementation

{ TExceptionManager }

{ TMsg }

class procedure TMsg.ppuShowException(ipMsg: string; ipEx: Exception);
begin
  ShowMessage(ipMsg + slinebreak + ipEx.Message);
end;

end.
