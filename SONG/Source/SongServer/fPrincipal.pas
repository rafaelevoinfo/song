unit fPrincipal;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  IPPeerServer,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxBarBuiltInMenu, cxClasses, dxSkinsForm, cxPC, Vcl.ExtCtrls, dxSkinBlue, dxSkinBlack, Vcl.StdCtrls,
  cxPropertiesStore, dxLayoutcxEditAdapters, cxContainer, cxEdit, cxTextEdit,
  dxLayoutContainer, dxLayoutControl, cxGroupBox, cxMaskEdit, cxSpinEdit,
  dxGDIPlusClasses, cxImage, Vcl.Menus, cxButtons, dmuPrincipal, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, Datasnap.DBClient,
  cxGridLevel, cxGridCustomView, cxGrid, dxSkinscxPCPainter;

type
  TfrmPrincipal = class(TForm)
    pnTop: TPanel;
    skinController: TdxSkinController;
    Label1: TLabel;
    cxPageControl1: TcxPageControl;
    tabConfiguracoes: TcxTabSheet;
    store: TcxPropertiesStore;
    gbBanco: TcxGroupBox;
    EditEnderecoBanco: TcxTextEdit;
    Label2: TLabel;
    EditServidor: TcxTextEdit;
    Label3: TLabel;
    EditUsuario: TcxTextEdit;
    Label4: TLabel;
    EditSenha: TcxTextEdit;
    Label5: TLabel;
    Servidor: TcxGroupBox;
    Label6: TLabel;
    EditPorta: TcxSpinEdit;
    imgLogo: TcxImage;
    Label7: TLabel;
    Label8: TLabel;
    tabLog: TcxTabSheet;
    pnStatus: TPanel;
    lbStatus: TLabel;
    bttLigarDesligar: TcxButton;
    viewLog: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cdsLog: TClientDataSet;
    cdsLogDATA: TDateTimeField;
    cdsLogERRO: TStringField;
    dsLog: TDataSource;
    viewLogDATA: TcxGridDBColumn;
    viewLogERRO: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bttLigarDesligarClick(Sender: TObject);
  private
    procedure ppvIniciarFinalizarServidor(ipIniciar: Boolean);
    procedure ppuAdicionarErroLog(ipException: Exception);
    procedure ppvAtualizarStatus;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.bttLigarDesligarClick(Sender: TObject);
begin
  if dmPrincipal.Server.Started then
    ppvIniciarFinalizarServidor(false)
  else
    ppvIniciarFinalizarServidor(true);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  store.StoreTo();
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  store.RestoreFrom;

  ppvIniciarFinalizarServidor(true);
end;

procedure TfrmPrincipal.ppuAdicionarErroLog(ipException: Exception);
begin
  if not cdsLog.Active then
    cdsLog.CreateDataSet;

  cdsLog.Append;
  cdsLogDATA.AsDateTime := Now;
  cdsLogERRO.AsString := ipException.Message;
  cdsLog.Post;

end;

procedure TfrmPrincipal.ppvAtualizarStatus;
begin
  if dmPrincipal.Server.Started then
    lbStatus.Caption := 'Online'
  else
    lbStatus.Caption := 'Offline';
end;

procedure TfrmPrincipal.ppvIniciarFinalizarServidor(ipIniciar: Boolean);
begin
  try
    if ipIniciar then
      dmPrincipal.ppuIniciarServidor(EditServidor.text, EditEnderecoBanco.text,
        EditUsuario.text, EditSenha.text, EditPorta.Value)
    else
      dmPrincipal.Server.Stop;

    ppvAtualizarStatus;
  except
    on E: Exception do
    begin
      ppuAdicionarErroLog(E);
    end;
  end;
end;

end.
