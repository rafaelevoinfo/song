unit uUtils;

interface

uses
  System.SysUtils, Vcl.Dialogs, cxPC, Vcl.Forms, Vcl.Controls;

type
  TUtils = class
  public
    class procedure ppuAbrirFormAba<T: TForm>(ipPageControl: TcxPageControl; ipClassForm: TFormClass; ipForm: T);

  end;

implementation

{ TUtils }

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
