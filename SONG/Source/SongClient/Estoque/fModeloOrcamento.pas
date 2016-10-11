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
  uControleAcesso, System.TypInfo, dmuEstoque, cxMemo, cxDBEdit, uTypes;

type
  TfrmModeloOrcamento = class(TfrmBasicoCrud)
    frameEditor: TframeEditor;
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    pnNomeDescricao: TPanel;
    EditNome: TcxDBTextEdit;
    Label3: TLabel;
    EditDescricao: TcxDBMemo;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tabCadastroShow(Sender: TObject);
  private
    dmEstoque: TdmEstoque;
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

procedure TfrmModeloOrcamento.FormCreate(Sender: TObject);
begin
  dmEstoque := TdmEstoque.Create(Self);
  dmEstoque.name := '';

  inherited;

  PesquisaPadrao := Ord(tppTodos);

end;

function TfrmModeloOrcamento.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro), Ord(estModeloOrcamento));
end;

procedure TfrmModeloOrcamento.tabCadastroShow(Sender: TObject);
begin
  inherited;
  frameEditor.ppuIniciar;
end;

end.
