unit fMatriz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrud, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, cxLocalization, System.Actions,
  Vcl.ActnList, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxGroupBox,
  cxRadioGroup, Vcl.StdCtrls, cxDropDownEdit, cxImageComboBox, cxTextEdit,
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuLookup, uTypes,
  uControleAcesso, System.TypInfo, dmuViveiro, cxCalc, cxDBEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxMemo;

type
  TfrmMatriz = class(TfrmBasicoCrud)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_ESPECIE: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosENDERECO: TcxGridDBColumn;
    viewRegistrosLATITUDE: TcxGridDBColumn;
    viewRegistrosLONGITUDE: TcxGridDBColumn;
    viewRegistrosESPECIE: TcxGridDBColumn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EditEndereco: TcxDBTextEdit;
    Label6: TLabel;
    EditDescricao: TcxDBMemo;
    cbEspecie: TcxDBLookupComboBox;
    EditLatitude: TcxDBCalcEdit;
    Label7: TLabel;
    Label8: TLabel;
    EditLongitude: TcxDBCalcEdit;
    EditNome: TcxDBTextEdit;
    procedure FormCreate(Sender: TObject);
  private
    dmLookup: TdmLookup;
    dmViveiro: TdmViveiro;
  protected
    function fprGetPermissao: string; override;
  public
  end;

var
  frmMatriz: TfrmMatriz;

implementation

{$R *.dfm}

procedure TfrmMatriz.FormCreate(Sender: TObject);
begin
  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  dmViveiro := TdmViveiro.Create(Self);
  dmViveiro.Name := '';

  inherited;
  PesquisaPadrao := tppNome;

  dmLookup.cdslkEspecie.Open;
end;

function TfrmMatriz.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro), Ord(vivMatriz));
end;

end.
