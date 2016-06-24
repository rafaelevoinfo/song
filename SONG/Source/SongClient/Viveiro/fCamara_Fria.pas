unit fCamara_Fria;

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
  Vcl.ExtCtrls, cxPC, dmuViveiro, cxDBEdit, uTypes, uControleAcesso,
  System.TypInfo, uExceptions, dmuPrincipal;

type
  TfrmCamaraFria = class(TfrmBasicoCrud)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    EditNome: TcxDBTextEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    dmViveiro: TdmViveiro;
  protected
    function fprGetPermissao:String;override;
    procedure pprValidarDados;override;
    { Public declarations }
  end;

var
  frmCamaraFria: TfrmCamaraFria;

implementation

{$R *.dfm}


procedure TfrmCamaraFria.FormCreate(Sender: TObject);
begin
  dmViveiro := TdmViveiro.Create(Self);
  dmViveiro.Name := '';

  inherited;

  PesquisaPadrao := Ord(tppTodos);

end;

function TfrmCamaraFria.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro),Ord(vivCamaraFria));
end;

procedure TfrmCamaraFria.pprValidarDados;
begin
  inherited;
  if not dmPrincipal.FuncoesViveiro.fpuValidarNomeCamaraFria(dmViveiro.cdsCamara_FriaID.AsInteger,dmViveiro.cdsCamara_FriaNOME.AsString) then
    raise TControlException.Create('Nome já cadastrado.',EditNome);
end;

end.
