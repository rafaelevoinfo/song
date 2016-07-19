unit fItemPatrimonio;

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
  Vcl.ExtCtrls, cxPC, dmuEstoque, System.TypInfo, uControleAcesso, cxSpinEdit,
  cxDBEdit, uTypes, uClientDataSet;

type
  TfrmItemPatrimonio = class(TfrmBasicoCrud)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosTAXA_DEPRECIACAO_ANUAL: TcxGridDBColumn;
    Label3: TLabel;
    EditNome: TcxDBTextEdit;
    EditTaxaDepreciacao: TcxDBSpinEdit;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ColumnExcluirCustomDrawHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
  private
    dmEstoque: TdmEstoque;
  protected
    function fprGetPermissao: String; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
  public
    procedure ppuIncluir;override;
  end;

var
  frmItemPatrimonio: TfrmItemPatrimonio;

implementation

{$R *.dfm}


procedure TfrmItemPatrimonio.ColumnExcluirCustomDrawHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  inherited;
  if dmEstoque.cdsItem_Patrimonio.Active and (dmEstoque.cdsItem_Patrimonio.RecordCount > 0) then
    begin
      if dmEstoque.cdsItem_PatrimonioATIVO.AsInteger = coRegistroAtivo then
        AViewInfo.Text := 'Inativar'
      else
        AViewInfo.Text := 'Ativar';
    end
  else
    AViewInfo.Text := 'Ativar/Inativar';
end;

procedure TfrmItemPatrimonio.FormCreate(Sender: TObject);
begin
  dmEstoque := TdmEstoque.Create(Self);
  dmEstoque.Name := '';

  inherited;

  PesquisaPadrao := Ord(tppTodos);
end;

function TfrmItemPatrimonio.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoPatrimonio), Ord(patItem));
end;

procedure TfrmItemPatrimonio.pprCarregarParametrosPesquisa(
  ipCds: TRFClientDataSet);
begin
  inherited;
  ipCds.ppuAddParametro(TParametros.coAtivo, rgStatus.ItemIndex);
end;

procedure TfrmItemPatrimonio.ppuIncluir;
begin
  inherited;
  dmEstoque.cdsItem_PatrimonioATIVO.AsInteger := 0;
end;

end.
