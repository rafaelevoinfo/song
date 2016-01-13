unit pMonitorPasta;

interface

uses
  System.Classes, Winapi.Windows, Winapi.Messages;

type
  TMonitorPasta = class(TThread)
  private
    { Private declarations }
  public
    FDiretorio: string;
  protected
    procedure Execute; override;
  end;

implementation

uses
  Winapi.ShellAPI, System.SysUtils, pControleDocumentos;

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TMonitorPasta.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end;

    or

    Synchronize(
      procedure
      begin
        Form1.Caption := 'Updated in thread via an anonymous method'
      end
      )
    );

  where an anonymous method is passed.

  Similarly, the developer can call the Queue method with similar parameters as
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.

}

{ TMonitorPasta }

procedure TMonitorPasta.Execute;
var
  FHandle: THandle;
  Result: Cardinal;
begin
  FHandle := FindFirstChangeNotification(PChar(FDiretorio), False, FILE_NOTIFY_CHANGE_LAST_WRITE);
  while not Terminated do // Fica em loop até a thread ser finalizada
    begin
      Result := WaitForSingleObject(FHandle, 10000); // Fica esperando alguma notificação por 10 segundos
      if (Result = WAIT_OBJECT_0) and (not Terminated) then // se teve notificação entra
        begin
          TThread.Synchronize(Self,
            procedure
            begin
              frmControleDocumentos.TeveAlteracao := True; // avisa o Controle de Documentos que teve alteração
            end);
          // FindNextChangeNotification(FHandle); // repete o codigo pq senao ele entra aqui novamente sem ter feito nada
          FindNextChangeNotification(FHandle); // finaliza a notificação anterior e aguarde a próxima notificação
        end;
    end;
end;

end.
