unit fCliente;

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
  cxCalendar, Vcl.ExtCtrls, cxPC, uTypes, uControleAcesso, System.TypInfo;

type
  TfrmCliente = class(TfrmFinanciador)
  private
    { Private declarations }
  protected
    function fprGetTipo: TTipoFinForCli; override;
    function fprGetTipoPessoa: TTipoRelacionamentoPessoa; override;
    function fprGetPermissao: String; override;
  end;

var
  frmCliente: TfrmCliente;

implementation

{$R *.dfm}

{ TfrmFinanciador1 }

function TfrmCliente.fprGetPermissao: String;
begin
   Result := GetEnumName(TypeInfo(TPermissaoFinanceiro), Ord(finCliente));
end;

function TfrmCliente.fprGetTipo: TTipoFinForCli;
begin
  Result := tfCliente;
end;

function TfrmCliente.fprGetTipoPessoa: TTipoRelacionamentoPessoa;
begin
  Result := trpcliente;
end;

end.
