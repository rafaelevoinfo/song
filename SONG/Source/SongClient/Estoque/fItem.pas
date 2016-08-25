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
  System.TypInfo, dmuPrincipal, uTypes, uClientDataSet, Vcl.ExtDlgs;

type
  TfrmItem = class(TfrmBasicoCrud)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosTIPO: TcxGridDBColumn;
    EditNome: TcxDBTextEdit;
    Label3: TLabel;
    lbl1: TLabel;
    EditUnidade: TcxDBTextEdit;
    viewRegistrosUNIDADE: TcxGridDBColumn;
    viewRegistrosCALC_SALDO: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    dmEstoque: TdmEstoque;
    dmLookup: TdmLookup;
  protected
    function fprGetPermissao: String; override;
    procedure pprValidarDados; override;

    procedure pprBeforeExcluir(ipId:Integer;ipAcao: TAcaoTela);override;
    procedure pprBeforeAlterar;override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
  public
    procedure ppuIncluir;override;
    { Public declarations }
  end;

var
  frmItem: TfrmItem;

implementation

{$R *.dfm}


procedure TfrmItem.FormCreate(Sender: TObject);
begin
  dmEstoque := TdmEstoque.Create(Self);
  dmEstoque.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  inherited;

  PesquisaPadrao := Ord(tppNome);

end;

function TfrmItem.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoEstoque), Ord(estItem));
end;

procedure TfrmItem.ppuIncluir;
begin
  inherited;
  //o item de tipo SEMENTE e MUDA já deve existe no banco no momento da implantação.
  dmEstoque.cdsItemTIPO.AsInteger := Ord(tiOutro);
end;

procedure TfrmItem.pprBeforeAlterar;
begin
  inherited;
  if dmEstoque.cdsItemTIPO.AsInteger in [Ord(tiSemente),Ord(tiMuda)] then
    raise Exception.Create('Não é possível editar um item do tipo Semente ou Muda');
end;

procedure TfrmItem.pprBeforeExcluir(ipId: Integer; ipAcao: TAcaoTela);
begin
  inherited;
  //ja esta posicionado no registro correto
  if dmEstoque.cdsItemTIPO.AsInteger in [Ord(tiSemente),Ord(tiMuda)] then
    raise Exception.Create('Não é possível excluir um item do tipo Semente ou Muda');

end;

procedure TfrmItem.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  //nao faz sentido mostrar na pesquisa itens de outros tipos pois nao posso alterar e nem exclui-los
  ipCds.ppuAddParametro(TParametros.coTipo,Ord(tiOutro));
end;

procedure TfrmItem.pprValidarDados;
begin
  inherited;
  if not dmPrincipal.FuncoesEstoque.fpuValidarNomeItem(dmEstoque.cdsItemID.AsInteger,dmEstoque.cdsItemNOME.AsString) then
    raise Exception.Create('Já existe um item cadastrado com esse nome.');

end;

end.
