unit fFinanciador;

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
  Vcl.ExtCtrls, cxPC, dmuAdministrativo, dmuLookup, uTypes, uControleAcesso,
  System.TypInfo, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxDBEdit;

type
  TfrmFinanciador = class(TfrmBasicoCrud)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosID_PESSOA: TcxGridDBColumn;
    Label3: TLabel;
    EditNome: TcxDBTextEdit;
    Label4: TLabel;
    cbContato: TcxDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
  private
    dmAdministrativo: TdmAdministrativo;
    dmLookup: TdmLookup;
  protected
     function fprGetPermissao: String; override;
     procedure pprValidarDados; override;
  public
    { Public declarations }
  end;

var
  frmFinanciador: TfrmFinanciador;

implementation

{$R *.dfm}


procedure TfrmFinanciador.FormCreate(Sender: TObject);
begin
  dmAdministrativo := TdmAdministrativo.Create(Self);
  dmAdministrativo.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';
  inherited;
  PadraoPesquisa := tpTodos;

  dmLookup.cdslkPessoa.Open;
end;

function TfrmFinanciador.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissao), Ord(admFinanciador));
end;

procedure TfrmFinanciador.pprValidarDados;
begin
  inherited;
  //TODO: Validar nome duplicado
end;

end.
