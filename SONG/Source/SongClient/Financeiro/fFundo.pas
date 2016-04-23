unit fFundo;

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
  Vcl.ExtCtrls, cxPC, dmuFinanceiro, cxMemo, cxDBEdit, dmuLookup, uTypes,
  uConnection, uControleAcesso, System.TypInfo;

type
  TfrmFundo = class(TfrmBasicoCrud)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosSALDO: TcxGridDBColumn;
    viewRegistrosDESCRICAO: TcxGridDBColumn;
    EditNome: TcxDBTextEdit;
    Label3: TLabel;
    Label4: TLabel;
    EditDescricao: TcxDBMemo;
    procedure FormCreate(Sender: TObject);
  private
    dmFinanceiro: TdmFinanceiro;
    dmLookup: TdmLookup;
    { Private declarations }
  protected
    function fprGetPermissao: String; override;
    procedure pprPreencherCamposPadroes(ipDataSet: TDataSet);override;
  public
    { Public declarations }
  end;

var
  frmFundo: TfrmFundo;

implementation

{$R *.dfm}


procedure TfrmFundo.FormCreate(Sender: TObject);
begin
  dmFinanceiro := TdmFinanceiro.Create(Self);
  dmFinanceiro.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';
  inherited;

  PesquisaPadrao := tppTodos;

end;

function TfrmFundo.fprGetPermissao: String;
begin
   Result := GetEnumName(TypeInfo(TPermissaoFinanceiro), Ord(finFundo));
end;



procedure TfrmFundo.pprPreencherCamposPadroes(ipDataSet: TDataSet);
begin
  inherited;
  if dmFinanceiro.cdsFundoSALDO.IsNull then
    dmFinanceiro.cdsFundoSALDO.AsFloat := 0;
end;

end.
