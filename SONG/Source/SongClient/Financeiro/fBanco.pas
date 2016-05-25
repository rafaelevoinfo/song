unit fBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrudMasterDetail, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, System.Actions, Vcl.ActnList,
  cxSplitter, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxGroupBox,
  cxRadioGroup, Vcl.StdCtrls, cxDropDownEdit, cxImageComboBox, cxTextEdit,
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuFinanceiro, cxDBEdit,
  uControleAcesso, System.TypInfo, uTypes, cxLocalization;

type
  TfrmBanco = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailAGENCIA: TcxGridDBColumn;
    viewRegistrosDetailCONTA: TcxGridDBColumn;
    Label3: TLabel;
    EditNome: TcxDBTextEdit;
    Label4: TLabel;
    EditAgencia: TcxDBTextEdit;
    EditContaCorrente: TcxDBTextEdit;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    dmFinanceiro: TdmFinanceiro;
  protected
    function fprGetPermissao: string; override;
  public

  end;

var
  frmBanco: TfrmBanco;

implementation

{$R *.dfm}


procedure TfrmBanco.FormCreate(Sender: TObject);
begin
  dmFinanceiro := TdmFinanceiro.Create(Self);
  dmFinanceiro.Name := '';

  inherited;
  PesquisaPadrao := Ord(tppTodos);
end;

function TfrmBanco.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoFinanceiro), Ord(finBanco));
end;

end.
