unit fItem;

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
  Vcl.ExtCtrls, cxPC, dmuEstoque, cxDBEdit, dmuLookup, uControleAcesso,
  System.TypInfo, dmuPrincipal, uTypes;

type
  TfrmItem = class(TfrmBasicoCrud)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosTIPO: TcxGridDBColumn;
    EditNome: TcxDBTextEdit;
    Label3: TLabel;
    cbTipo: TcxDBImageComboBox;
    Label4: TLabel;
    lbl1: TLabel;
    EditUnidade: TcxDBTextEdit;
    viewRegistrosUNIDADE: TcxGridDBColumn;
    viewRegistrosCALC_SALDO: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure cbTipoPropertiesEditValueChanged(Sender: TObject);
  private
    dmEstoque: TdmEstoque;
    dmLookup: TdmLookup;
  protected
    function fprGetPermissao: String; override;
    procedure pprValidarDados; override;
    { Public declarations }
  end;

var
  frmItem: TfrmItem;

implementation

{$R *.dfm}


procedure TfrmItem.cbTipoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  cbTipo.PostEditValue;

  EditUnidade.Enabled := dmEstoque.cdsItemTIPO.AsInteger = Ord(tiOutro);
  if pcPrincipal.ActivePage = tabCadastro then
    begin
      if dmEstoque.cdsItemTIPO.AsInteger = Ord(tiSemente) then
        begin
          EditUnidade.EditValue := 'Kg';
          EditUnidade.PostEditValue;
        end
      else if dmEstoque.cdsItemTIPO.AsInteger = Ord(tiMuda) then
        begin
          EditUnidade.EditValue := 'Und';
          EditUnidade.PostEditValue;
        end;
    end;
end;

procedure TfrmItem.FormCreate(Sender: TObject);
begin
  dmEstoque := TdmEstoque.Create(Self);
  dmEstoque.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  inherited;

  PesquisaPadrao := tppTodos;

end;

function TfrmItem.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoEstoque), Ord(estItem));
end;

procedure TfrmItem.pprValidarDados;
begin
  inherited;
  if not dmPrincipal.FuncoesEstoque.fpuValidarTipoItem(dmEstoque.cdsItemID.AsInteger, dmEstoque.cdsItemTIPO.AsInteger) then
    raise Exception.Create
      ('Para os tipos de item Semente e Muda só pode existir um único item, o qual já foi cadastrado. Por favor, informe outro tipo de item.');

end;

end.
