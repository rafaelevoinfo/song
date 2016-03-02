unit fEspecie;

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
  Vcl.ExtCtrls, cxPC, dmuViveiro, uControleAcesso, System.TypInfo, uTypes,
  cxMemo, cxDBEdit, uClientDataSet;

type
  TfrmEspecie = class(TfrmBasicoCrud)
    EditNome: TcxDBTextEdit;
    Label3: TLabel;
    EditNomeCientifico: TcxDBTextEdit;
    Label4: TLabel;
    EditFamiliaBotanica: TcxDBTextEdit;
    Label5: TLabel;
    Label6: TLabel;
    EditObsevacao: TcxDBMemo;
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosNOME_CIENTIFICO: TcxGridDBColumn;
    viewRegistrosFAMILIA_BOTANICA: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    dmViveiro: TdmViveiro;
  protected
    function fprGetPermissao: String; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
  public
    { Public declarations }
  end;

var
  frmEspecie: TfrmEspecie;

const
  coNomeCientifico = 5;
  coFamiliaBotanica = 6;

implementation

{$R *.dfm}

{ TfrmEspecie }

procedure TfrmEspecie.FormCreate(Sender: TObject);
begin
  dmViveiro := TdmViveiro.Create(Self);
  dmViveiro.Name := '';

  inherited;

  PesquisaPadrao := tppNome;
end;

function TfrmEspecie.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro), Ord(vivEspecie));
end;

procedure TfrmEspecie.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.EditValue = coNomeCientifico then
    ipCds.ppuAddParametro(TParametros.coNomeCientifico, EditPesquisa.Text)
  else if cbPesquisarPor.EditValue = coFamiliaBotanica then
    ipCds.ppuAddParametro(TParametros.coFamiliaBotanica, EditPesquisa.Text)
end;

end.