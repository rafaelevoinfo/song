unit fAgendamento_Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxSchedulerEventEditor, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack,
  cxControls, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCheckBox, cxSpinEdit, cxCheckComboBox, cxMemo, cxDropDownEdit, cxTimeEdit,
  cxCalendar, cxMaskEdit, cxImageComboBox, cxTextEdit, cxLabel, cxGroupBox,
  dxBevel, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxSchedulerEditorFormManager,
  cxSchedulerCustomControls, cxSchedulerStorage;

type
  TRFShedulerCustomizadoEventEditorFormStyleInfo = class(TcxShedulerEventEditorFormStyleInfo)
  public
    class function CreateEditor(AEvent: TcxSchedulerControlEvent): IcxSchedulerEventEditorForm; override;
    class function GetName: string; override;
  public const
    coEditorEventoCustomizado = 'EditorEventoAgendaCustomizado';
  end;

  TfrmAgendamentoCadastro = class(TcxSchedulerEventEditorForm, IcxShedulerCustomEditorForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgendamentoCadastro: TfrmAgendamentoCadastro;

implementation

{$R *.dfm}

{ TRFShedulerStandardEventEditorFormStyleInfo }

class function TRFShedulerCustomizadoEventEditorFormStyleInfo.CreateEditor(
  AEvent: TcxSchedulerControlEvent): IcxSchedulerEventEditorForm;
begin
  Result := TfrmAgendamentoCadastro.CreateEx(AEvent);
end;

class function TRFShedulerCustomizadoEventEditorFormStyleInfo.GetName: string;
begin
  Result := coEditorEventoCustomizado;
end;

procedure Initialize;
begin
  cxSchedulerEditorManager.RegisterShedulerEditorForm(TRFShedulerCustomizadoEventEditorFormStyleInfo);
end;

procedure Finalize;
begin
  cxSchedulerEditorManager.UnregisterShedulerEditorForm(TRFShedulerCustomizadoEventEditorFormStyleInfo);
end;

initialization

dxUnitsLoader.AddUnit(@Initialize, @Finalize);

finalization

dxUnitsLoader.RemoveUnit(@Finalize);

end.
