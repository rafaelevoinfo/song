unit fAparelhosRegistrados;

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
  cxTextEdit, cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuSistema, cxDBEdit,
  uTypes, uControleAcesso, System.TypInfo;

type
  TfrmAparelhoRegistrado = class(TfrmBasicoCrud)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosSERIAL: TcxGridDBColumn;
    EditNome: TcxDBTextEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    dmSistema: TdmSistema;
  protected
    function fprGetPermissao: String; override;
  public
    { Public declarations }
  end;

var
  frmAparelhoRegistrado: TfrmAparelhoRegistrado;

implementation

{$R *.dfm}

{ TfrmAparelhoRegistrado }

procedure TfrmAparelhoRegistrado.FormCreate(Sender: TObject);
begin
  dmSistema := TdmSistema.Create(Self);
  dmSistema.name := '';

  inherited;
  PesquisaPadrao := Ord(tppTodos);
end;

function TfrmAparelhoRegistrado.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro), Ord(sisAparelhoExterno));
end;

end.
