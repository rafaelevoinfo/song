unit uMensagem;

interface

uses
  System.SysUtils, Vcl.Dialogs;

type
  TPerguntaPadrao = (ppSimNao, ppSimNaoCancelar);
  TRespostaPadrao = (rpSim, rpNao, rpCancelar);

  TMsg = class
    class procedure ppuShowException(ipMsg: string; ipEx: Exception); overload;
    class procedure ppuShowException(ipEx: Exception); overload;

    class function fpuPerguntar(ipPergunta: string; ipBotoes: TPerguntaPadrao): TRespostaPadrao;
  end;

implementation

{ TMsg }

class procedure TMsg.ppuShowException(ipMsg: string; ipEx: Exception);
begin
  ShowMessage(ipMsg + slinebreak + ipEx.Message);
end;

class function TMsg.fpuPerguntar(ipPergunta: string; ipBotoes: TPerguntaPadrao): TRespostaPadrao;
var
  vaResp: Integer;
begin
  case ipBotoes of
    ppSimNao:
      vaResp := MessageDlg(ipPergunta, mtInformation, [mbYes, mbNo],0);
    ppSimNaoCancelar:
      vaResp := MessageDlg(ipPergunta, mtInformation, [mbYes, mbNo, mbCancel],0);
    else
      vaResp := Ord(rpCancelar);
  end;

  Result := TRespostaPadrao(vaResp);

end;

class procedure TMsg.ppuShowException(ipEx: Exception);
begin
  ShowMessage(ipEx.Message);
end;

end.
