unit fFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fFinanciador, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, System.Actions, Vcl.ActnList,
  cxMemo, cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxGroupBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxRadioGroup,
  Vcl.StdCtrls, cxDropDownEdit, cxImageComboBox, cxTextEdit, cxMaskEdit,
  cxCalendar, Vcl.ExtCtrls, cxPC, System.TypInfo, uControleAcesso, uTypes;

type
  TfrmFornecedor = class(TfrmFinanciador)
    lbl1: TLabel;
    EditCargoContato: TcxDBTextEdit;
  private
    { Private declarations }
  protected
    function fprGetTipo: TTipoFinForCli;override;
    function fprGetTipoPessoa:TTipoRelacionamentoPessoa;override;
    function fprGetPermissao: String; override;
    { Public declarations }
  end;

var
  frmFornecedor: TfrmFornecedor;

implementation

{$R *.dfm}

{ TfrmFornecedor }

function TfrmFornecedor.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoFinanceiro), Ord(finFinanciador));
end;

function TfrmFornecedor.fprGetTipo: TTipoFinForCli;
begin
   Result := tfFornecedor;
end;

function TfrmFornecedor.fprGetTipoPessoa: TTipoRelacionamentoPessoa;
begin
  Result := trpFornecedor;
end;

end.
