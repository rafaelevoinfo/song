unit fModeloOrcamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrud, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, Vcl.Menus, Vcl.ExtDlgs,
  System.Actions, Vcl.ActnList, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxGroupBox, cxRadioGroup, Vcl.StdCtrls, cxDropDownEdit, cxImageComboBox,
  cxTextEdit, cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, fmEditor,
  uControleAcesso, System.TypInfo;

type
  TfrmModeloOrcamento = class(TfrmBasicoCrud)
    frameEditor1: TframeEditor;
  private
  protected
    function fprGetPermissao: string; override;
  public
    { Public declarations }
  end;

var
  frmModeloOrcamento: TfrmModeloOrcamento;

implementation

{$R *.dfm}

{ TfrmModeloOrcamento }

function TfrmModeloOrcamento.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro), Ord(estModeloOrcamento));
end;

end.
