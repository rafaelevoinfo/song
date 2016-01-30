unit uUtils;

interface

uses
  System.SysUtils, Vcl.Dialogs, cxPC, Vcl.Forms, Vcl.Controls,
  Datasnap.DBClient;

type
  TUtils = class
  public
    class procedure ppuAbrirFormAba<T: TForm>(ipPageControl: TcxPageControl; ipClassForm: TFormClass; ipForm: T);
    class procedure fpuPercorrerCds(ipCDS: TClientDataSet; ipProc: TProc; ipManterPosicao: Boolean = True; ipOtimizarLoop: Boolean = True);overload;
    class procedure fpuPercorrerCds(ipCDS: TClientDataSet; ipFunc: TFunc<Boolean>; ipManterPosicao: Boolean = True; ipOtimizarLoop: Boolean = True);overload;
  end;

implementation

{ TUtils }

class procedure TUtils.fpuPercorrerCds(ipCDS: TClientDataSet; ipProc: TProc; ipManterPosicao: Boolean = True; ipOtimizarLoop: Boolean = True);
var
  vaRecNo: Integer;
begin
  TUtils.fpuPercorrerCds(ipCDS,
    function: Boolean
    begin
      ipProc;
      Exit(True);
    end,
    ipManterPosicao, ipOtimizarLoop);
end;

class procedure TUtils.fpuPercorrerCds(ipCDS: TClientDataSet; ipFunc: TFunc<Boolean>; ipManterPosicao: Boolean = True; ipOtimizarLoop: Boolean = True);
var
  vaRecNo: Integer;
begin
  if ipCDS.Active and (ipCDS.RecordCount > 0) then
    begin
      vaRecNo := 1;
      if ipManterPosicao then
        vaRecNo := ipCDS.RecNo;

      if ipOtimizarLoop then
        ipCDS.DisableControls;

      try
        ipCDS.First;
        while not ipCDS.Eof do
          begin
            if not ipFunc then // se retornar false, paro o loop
              Exit;
            ipCDS.Next;
          end;
      finally
        if ipManterPosicao then
          if ipCDS.Active and (ipCDS.RecordCount > 0) and (vaRecNo <= ipCDS.RecordCount) then
            ipCDS.RecNo := vaRecNo;

        if ipOtimizarLoop then
          ipCDS.EnableControls;
      end;
    end;

end;

class procedure TUtils.ppuAbrirFormAba<T>(ipPageControl: TcxPageControl; ipClassForm: TFormClass; ipForm: T);
var
  vaTab: TcxTabSheet;
  vaFormCriado: Boolean;
  I: Integer;
begin
  vaFormCriado := False;

  if ipForm = nil then
    begin
      ipForm := T(ipClassForm.Create(nil));
      vaFormCriado := True;
    end;

  for I := 0 to ipPageControl.PageCount - 1 do
    begin
      vaTab := ipPageControl.Pages[I];
      if vaTab.Caption = ipForm.Caption then
        begin
          if vaFormCriado then
            FreeAndNil(ipForm);
          ipPageControl.ActivePage := vaTab;
          Exit;
        end;
    end;

  vaTab := TcxTabSheet.Create(ipPageControl);
  vaTab.Caption := ipForm.Caption;
  vaTab.Parent := ipPageControl;

  ipForm.Align := alClient;
  ipForm.BorderStyle := bsNone;
  ipForm.Parent := vaTab;

  ipPageControl.ActivePage := vaTab;
  ipForm.show;

end;

end.
