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
  uControleAcesso, System.TypInfo, dmuEstoque, cxMemo, cxDBEdit, uTypes,
  dmuPrincipal, uExceptions;

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
    Label6: TLabel;
    EditMarcador: TcxTextEdit;
    btnAdicionarMarcador: TButton;
    Ac_Add_Marcador: TAction;
    cbMarcador: TcxImageComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Ac_Add_MarcadorExecute(Sender: TObject);
    procedure tabCadastroShow(Sender: TObject);
    procedure cbMarcadorPropertiesEditValueChanged(Sender: TObject);
  private
    dmEstoque: TdmEstoque;
    procedure ppvLimparControls;
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

procedure TfrmModeloOrcamento.Ac_Add_MarcadorExecute(Sender: TObject);
var
  vaMarcador: String;
begin
  inherited;
  if VarIsNull(cbMarcador.EditValue) then
    raise TControlException.Create('Informe o marcador.', cbMarcador);

  if (cbMarcador.EditValue = Ord(moCustomizado)) then
    begin
      if (Trim(EditMarcador.Text) = '') then
        raise TControlException.Create('Informe o nome do marcador.', EditMarcador);

      vaMarcador := EditMarcador.Text;
    end
  else
    vaMarcador := cbMarcador.Properties.Items[cbMarcador.SelectedItem].Description;

  frameEditor.Rich.SelText := coInicioMarcador + vaMarcador + coFimMarcador;
end;

procedure TfrmModeloOrcamento.cbMarcadorPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  EditMarcador.Enabled := (not VarIsNull(cbMarcador.EditValue)) and (cbMarcador.EditValue = Ord(moCustomizado));
end;

procedure TfrmModeloOrcamento.FormCreate(Sender: TObject);
var
  i: TMarcadorOrcamento;
  vaMarcador: TcxImageComboBoxItem;
begin
  dmEstoque := TdmEstoque.Create(Self);
  dmEstoque.name := '';

  inherited;

  PesquisaPadrao := Ord(tppTodos);

  cbMarcador.Properties.Items.Clear;
  for i := Low(TMarcadorOrcamento) to High(TMarcadorOrcamento) do
    begin
      vaMarcador := cbMarcador.Properties.Items.Add;
      vaMarcador.Value := Ord(i);
      vaMarcador.Description := MarcadorOrcamento[i];
    end;
end;

function TfrmModeloOrcamento.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro), Ord(estModeloOrcamento));
end;

procedure TfrmModeloOrcamento.ppvLimparControls;
begin
  frameEditor.ppuIniciar;
  EditMarcador.Clear;
end;

procedure TfrmModeloOrcamento.tabCadastroShow(Sender: TObject);
begin
  inherited;
  ppvLimparControls;
end;

end.
