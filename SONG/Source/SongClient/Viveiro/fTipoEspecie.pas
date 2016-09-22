unit fTipoEspecie;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrud, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, Vcl.ExtDlgs, System.Actions,
  Vcl.ActnList, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxGroupBox,
  cxRadioGroup, Vcl.StdCtrls, cxDropDownEdit, cxImageComboBox, cxTextEdit,
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuViveiro, cxMemo, cxDBEdit,
  uControleAcesso, System.TypInfo, dmuPrincipal, uTypes;

type
  TfrmTipoEspecie = class(TfrmBasicoCrud)
    EditNome: TcxDBTextEdit;
    Label3: TLabel;
    EditDescricao: TcxDBMemo;
    Label4: TLabel;
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    dmViveiro: TdmViveiro;
  protected
    function fprGetPermissao: String; override;
    procedure pprValidarDados; override;
  public

  end;

var
  frmTipoEspecie: TfrmTipoEspecie;

implementation

{$R *.dfm}


procedure TfrmTipoEspecie.FormCreate(Sender: TObject);
begin
  dmViveiro := TdmViveiro.Create(Self);
  dmViveiro.Name := '';
  inherited;

  PesquisaPadrao := Ord(tppTodos);

end;

function TfrmTipoEspecie.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro), Ord(vivTipoEspecie));
end;

procedure TfrmTipoEspecie.pprValidarDados;
begin
  inherited;
  if not dmPrincipal.FuncoesViveiro.fpuValidarNomeTipoEspecie(dmViveiro.cdsTipo_EspecieID.AsInteger, dmViveiro.cdsTipo_EspecieNOME.AsString) then
    raise Exception.Create('Já existe um tipo de espécie com este nome. Por favor, informe outro nome.');
end;

end.
