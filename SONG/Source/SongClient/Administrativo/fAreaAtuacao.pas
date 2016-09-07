unit fAreaAtuacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrudMasterDetail, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, Vcl.ExtDlgs, System.Actions,
  Vcl.ActnList, cxSplitter, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxGroupBox,
  cxRadioGroup, Vcl.StdCtrls, cxDropDownEdit, cxImageComboBox, cxTextEdit,
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuAdministrativo, cxDBEdit,
  System.TypInfo, uControleAcesso, uTypes, dmuPrincipal, uExceptions;

type
  TfrmAreaAtuacao = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailNOME: TcxGridDBColumn;
    Label3: TLabel;
    EditAreaAtuacao: TcxDBTextEdit;
    EditAreaExecucao: TcxDBTextEdit;
    lb1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    dmAdministrativo: TdmAdministrativo;
  protected
    function fprGetPermissao: String; override;
    procedure pprValidarDados; override;
  public
    { Public declarations }
  end;

var
  frmAreaAtuacao: TfrmAreaAtuacao;

implementation

{$R *.dfm}


procedure TfrmAreaAtuacao.FormCreate(Sender: TObject);
begin
  dmAdministrativo := TdmAdministrativo.Create(Self);
  dmAdministrativo.Name := '';
  inherited;
  PesquisaPadrao := Ord(tppNome);
end;

function TfrmAreaAtuacao.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoAdministrativo), Ord(admAreaAtuacao));
end;

procedure TfrmAreaAtuacao.pprValidarDados;
begin
  inherited;
  if not dmPrincipal.FuncoesAdm.fpuValidarNomeAreaAtuacao(dmAdministrativo.cdsArea_AtuacaoID.AsInteger, dmAdministrativo.cdsArea_AtuacaoNOME.AsString) then
    raise TControlException.Create('Já existe uma Área de Atuação com o novo informado.', EditAreaAtuacao);
end;

end.
