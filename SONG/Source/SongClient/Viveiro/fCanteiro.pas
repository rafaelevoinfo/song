unit fCanteiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrud, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, cxLocalization, System.Actions,
  Vcl.ActnList, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxGroupBox,
  cxRadioGroup, Vcl.StdCtrls, cxDropDownEdit, cxImageComboBox, cxTextEdit,
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuViveiro, cxDBEdit,
  System.TypInfo, uControleAcesso, dmuPrincipal, uTypes, Vcl.ExtDlgs;

type
  TCanteiro = class(TModelo)
  private
    FNome: String;
    procedure SetNome(const Value: String);
  public
    property Nome: String read FNome write SetNome;
  end;

  TfrmCanteiro = class(TfrmBasicoCrud)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    Label3: TLabel;
    EditNome: TcxDBTextEdit;
    procedure FormCreate(Sender: TObject);
  private
    dmViveiro: TdmViveiro;
  protected
    function fprGetPermissao: String; override;
    procedure pprValidarDados; override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCanteiro: TfrmCanteiro;

implementation

{$R *.dfm}


procedure TfrmCanteiro.FormCreate(Sender: TObject);
begin
  dmViveiro := TdmViveiro.Create(Self);
  dmViveiro.Name := '';

  inherited;
  PesquisaPadrao := Ord(tppTodos);
end;

function TfrmCanteiro.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro), Ord(vivCanteiro));
end;

procedure TfrmCanteiro.pprValidarDados;
begin
  inherited;
  if not dmPrincipal.FuncoesViveiro.fpuValidarNomeCanteiro(dmViveiro.cdsMatrizID.AsInteger, dmViveiro.cdsMatrizNOME.AsString) then
    raise Exception.Create('Já existe um canteiro com este nome. Por favor, informe outro nome.');
end;

{ TCanteiro }

procedure TCanteiro.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
