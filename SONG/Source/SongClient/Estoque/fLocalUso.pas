unit fLocalUso;

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
  Vcl.ExtCtrls, cxPC, dmuEstoque, cxDBEdit, System.TypInfo, uTypes,
  dmuPrincipal, uExceptions, uControleAcesso;

type
  TfrmLocalUso = class(TfrmBasicoCrud)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    EditNome: TcxDBTextEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    dmEstoque: TdmEstoque;
    { Private declarations }
  protected
    function fprGetPermissao: string; override;
    procedure pprValidarDados; override;
  end;

var
  frmLocalUso: TfrmLocalUso;

implementation

{$R *.dfm}


procedure TfrmLocalUso.FormCreate(Sender: TObject);
begin
  dmEstoque := TdmEstoque.Create(Self);
  dmEstoque.name := '';

  inherited;

  PesquisaPadrao := Ord(tppTodos);

end;

function TfrmLocalUso.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoEstoque), Ord(estLocalUso));
end;

procedure TfrmLocalUso.pprValidarDados;
begin
  inherited;
  if not dmPrincipal.FuncoesEstoque.fpuValidarNomeLocalUso(dmEstoque.cdsLocal_UsoID.AsInteger, dmEstoque.cdsLocal_UsoNOME.AsString.Trim) then
    raise TControlException.Create('Já existe um local de uso com o nome informado.', EditNome);
end;

end.
