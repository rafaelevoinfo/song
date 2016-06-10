unit fFamilia_Botanica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrud, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, System.Actions, Vcl.ActnList,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxGroupBox, cxRadioGroup, Vcl.StdCtrls,
  cxDropDownEdit, cxImageComboBox, cxTextEdit, cxMaskEdit, cxCalendar,
  Vcl.ExtCtrls, cxPC, dmuViveiro, cxDBEdit, System.TypInfo, uControleAcesso,
  uTypes;

type
  TfrmFamiliaBotanica = class(TfrmBasicoCrud)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    EditNome: TcxDBTextEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    dmViveiro: TdmViveiro;
  protected
    function fprGetPermissao: String; override;
  public

  end;

var
  frmFamiliaBotanica: TfrmFamiliaBotanica;

implementation

{$R *.dfm}

{ TfrmFamiliaBotanica }

procedure TfrmFamiliaBotanica.FormCreate(Sender: TObject);
begin
  dmViveiro := TdmViveiro.Create(Self);
  dmViveiro.name := '';

  inherited;
end;

function TfrmFamiliaBotanica.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro), Ord(vivFamiliaBotanica));
end;

end.
