unit fMatriz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrud, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, cxLocalization, System.Actions,
  Vcl.ActnList, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxGroupBox,
  cxRadioGroup, Vcl.StdCtrls, cxDropDownEdit, cxImageComboBox, cxTextEdit,
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuLookup, uTypes,
  uControleAcesso, System.TypInfo, dmuViveiro, cxCalc, cxDBEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxMemo, uUtils, uClientDataSet,
  dmuPrincipal, cxImage, uMensagem;

type
  TfrmMatriz = class(TfrmBasicoCrud)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_ESPECIE: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosENDERECO: TcxGridDBColumn;
    viewRegistrosLATITUDE: TcxGridDBColumn;
    viewRegistrosLONGITUDE: TcxGridDBColumn;
    viewRegistrosESPECIE: TcxGridDBColumn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EditEndereco: TcxDBTextEdit;
    Label6: TLabel;
    EditDescricao: TcxDBMemo;
    cbEspecie: TcxDBLookupComboBox;
    EditLatitude: TcxDBCalcEdit;
    Label7: TLabel;
    Label8: TLabel;
    EditLongitude: TcxDBCalcEdit;
    EditNome: TcxDBTextEdit;
    cbEspeciePesquisa: TcxLookupComboBox;
    Label9: TLabel;
    EditFoto: TcxDBImage;
    btnCarregarFoto: TButton;
    btnLimparFoto: TButton;
    Ac_LimparFoto: TAction;
    Ac_CarregarFoto: TAction;
    foDialogFoto: TFileOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure Ac_LimparFotoExecute(Sender: TObject);
    procedure Ac_CarregarFotoExecute(Sender: TObject);
  private
    dmLookup: TdmLookup;
    dmViveiro: TdmViveiro;
  protected
    function fprGetPermissao: string; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    procedure pprValidarDados; override;
    function fprConfigurarControlesPesquisa(): TWinControl; override;
  public const
    coPesqPorEspecie = 5;
  end;

var
  frmMatriz: TfrmMatriz;

implementation

{$R *.dfm}


procedure TfrmMatriz.Ac_CarregarFotoExecute(Sender: TObject);
begin
  inherited;
  try
    EditFoto.LoadFromFile;
  except
    on e: Exception do
      TMensagem.ppuShowException('Imagem inválida.', e);
  end;
end;

procedure TfrmMatriz.Ac_LimparFotoExecute(Sender: TObject);
begin
  inherited;
  try
    if not(dmViveiro.cdsMatriz.State in [dsEdit, dsInsert]) then
      dmViveiro.cdsMatriz.Edit;

    dmViveiro.cdsMatrizFOTO.Clear;
  except
    on e: Exception do
      TMensagem.ppuShowException('Erro ao remover a foto.', e);
  end;
end;

procedure TfrmMatriz.FormCreate(Sender: TObject);
begin
  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  dmViveiro := TdmViveiro.Create(Self);
  dmViveiro.Name := '';

  inherited;
  PesquisaPadrao := tppNome;

  dmLookup.cdslkEspecie.Open;
end;

function TfrmMatriz.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro), Ord(vivMatriz));
end;

procedure TfrmMatriz.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if cbEspeciePesquisa.Visible and (not VarIsNull(cbEspeciePesquisa.EditValue)) then
    ipCds.ppuAddParametro(TParametros.coEspecie, cbEspeciePesquisa.EditValue);
end;

function TfrmMatriz.fprConfigurarControlesPesquisa: TWinControl;
begin
  cbEspeciePesquisa.Visible := cbPesquisarPor.EditValue = coPesqPorEspecie;
  if cbEspeciePesquisa.Visible then
    begin
      EditPesquisa.Visible := False;
      pnData.Visible := False;
      Result := cbEspeciePesquisa;
    end
  else
    Result := inherited;
end;

procedure TfrmMatriz.pprValidarDados;
begin
  inherited;
  if not dmPrincipal.FuncoesViveiro.fpuValidarNomeMatriz(dmViveiro.cdsMatrizID.AsInteger, dmViveiro.cdsMatrizNOME.AsString) then
    raise Exception.Create('Já existe uma matriz com este nome. Por favor, informe outro nome.');
end;

end.
