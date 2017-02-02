unit fPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, fMatriz, System.ImageList,
  FMX.ImgList, System.Actions, FMX.ActnList, FMX.Objects, FMX.TabControl,
  FMX.ListView.Types, FMX.ListView, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  FireDAC.FMXUI.Wait, FireDAC.Comp.UI, System.IOUtils, uQuery, FMX.Gestures,
  dmuPrincipal, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  System.Threading, uTypes, System.Generics.Collections, REST.Json,
  IdBaseComponent, IdCoder, IdCoder3to4, IdCoderMIME, fSincronizacao;

type
  TfrmPrincipal = class(TForm)
    pnTop: TPanel;
    btnAdicionar: TButton;
    ActionList1: TActionList;
    Ac_Adicionar: TAction;
    btnSincronizar: TButton;
    Ac_Sincronizar: TAction;
    lbTitulo: TLabel;
    imgLogo: TImage;
    tbcPrincipal: TTabControl;
    tabLotes: TTabItem;
    tabMatrizes: TTabItem;
    lvLotes: TListView;
    lvMatrizes: TListView;
    qMatriz: TRFQuery;
    qMatrizID: TFDAutoIncField;
    qMatrizNOME: TStringField;
    ImageList1: TImageList;
    qLote: TRFQuery;
    qLoteID: TFDAutoIncField;
    qLoteLOTE: TStringField;
    qLoteQTDE: TBCDField;
    tmrAbrirLote: TTimer;
    tmrAbrirMatriz: TTimer;
    qMatrizSYNC: TIntegerField;
    qLoteESPECIE: TStringField;
    procedure Ac_AdicionarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lvMatrizesPullRefresh(Sender: TObject);
    procedure lvMatrizesItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure lvLotesPullRefresh(Sender: TObject);
    procedure tmrAbrirLoteTimer(Sender: TObject);
    procedure lvLotesItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure tbcPrincipalChange(Sender: TObject);
    procedure tmrAbrirMatrizTimer(Sender: TObject);
    procedure lvMatrizesDeletingItem(Sender: TObject; AIndex: Integer; var ACanDelete: Boolean);
    procedure lvLotesDeletingItem(Sender: TObject; AIndex: Integer; var ACanDelete: Boolean);
    procedure Ac_SincronizarExecute(Sender: TObject);
  private
    procedure ppvAbrirMatriz(ipId: Integer);
    procedure ppvAbrirLote(ipId: Integer);
    procedure ppvCarregarMatrizes;
    procedure ppvCarregarLotes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  fLote;

{$R *.fmx}

procedure TfrmPrincipal.Ac_AdicionarExecute(Sender: TObject);
begin
  if tbcPrincipal.ActiveTab = tabMatrizes then
    ppvAbrirMatriz(0)
  else if tbcPrincipal.ActiveTab = tabLotes then
    ppvAbrirLote(0);

end;

procedure TfrmPrincipal.ppvAbrirMatriz(ipId: Integer);
begin
  Application.CreateForm(TfrmMatriz, frmMatriz);
  if ipId = 0 then
    frmMatriz.ppuIncluir
  else
    frmMatriz.ppuAlterar(ipId);

  frmMatriz.OnSalvar := procedure
    begin
      ppvCarregarMatrizes;
    end;
  frmMatriz.Show;
end;

procedure TfrmPrincipal.ppvCarregarMatrizes;
var
  vaItem: TListViewItem;
begin
  if not qMatriz.Active then
    qMatriz.Open()
  else
    qMatriz.Refresh;

  qMatriz.DisableControls;
  lvMatrizes.BeginUpdate;
  try
    lvMatrizes.Items.Clear;
    qMatriz.First;
    while not qMatriz.Eof do
      begin
        vaItem := lvMatrizes.Items.Add;
        vaItem.Tag := qMatrizID.AsInteger;
        vaItem.Text := qMatrizNOME.AsString;

        qMatriz.Next;
      end;
  finally
    lvMatrizes.EndUpdate;
    qMatriz.EnableControls;
  end;
end;

procedure TfrmPrincipal.ppvCarregarLotes;
var
  vaItem: TListViewItem;
begin
  if not qLote.Active then
    qLote.Open()
  else
    qLote.Refresh;

  qLote.DisableControls;
  lvLotes.BeginUpdate;
  try
    lvLotes.Items.Clear;
    qLote.First;
    while not qLote.Eof do
      begin
        vaItem := lvLotes.Items.Add;
        vaItem.Tag := qLoteID.AsInteger;

        vaItem.Data['txtNome'] := qLoteLOTE.AsString;
        vaItem.Data['txtEspecie'] := qLoteESPECIE.AsString;
        vaItem.Data['txtQtde'] := FormatFloat(',0.00', qLoteQTDE.AsFloat);

        qLote.Next;
      end;
  finally
    lvLotes.EndUpdate;
    qLote.EnableControls;
  end;
end;

procedure TfrmPrincipal.ppvAbrirLote(ipId: Integer);
begin
  ppvCarregarMatrizes;

  Application.CreateForm(TfrmLote, frmLote);
  if ipId = 0 then
    frmLote.ppuIncluir
  else
    frmLote.ppuAlterar(ipId);

  frmLote.OnSalvar := procedure
    begin
      ppvCarregarLotes;
    end;
  frmLote.Show;
end;

procedure TfrmPrincipal.tbcPrincipalChange(Sender: TObject);
begin
  if tbcPrincipal.ActiveTab = tabLotes then
    begin
      ppvCarregarLotes;
    end
  else if tbcPrincipal.ActiveTab = tabMatrizes then
    begin
      ppvCarregarMatrizes;
    end;
end;

procedure TfrmPrincipal.tmrAbrirLoteTimer(Sender: TObject);
begin
  tmrAbrirLote.Enabled := false;
  ppvAbrirLote(TListViewItem(lvLotes.Selected).Tag);
end;

procedure TfrmPrincipal.tmrAbrirMatrizTimer(Sender: TObject);
begin
  tmrAbrirMatriz.Enabled := false;
  ppvAbrirMatriz(TListViewItem(lvMatrizes.Selected).Tag);
end;

procedure TfrmPrincipal.Ac_SincronizarExecute(Sender: TObject);

begin
  Application.CreateForm(TfrmSincronizacao, frmSincronizacao);

//  frmSincronizacao.OnSalvar := procedure
//    begin
//      ppvCarregarMatrizes;
//      ppvCarregarLotes;
//    end;
  frmSincronizacao.Show;

end;




procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  tbcPrincipal.ActiveTab := tabLotes;

  ppvCarregarLotes;
end;

procedure TfrmPrincipal.lvLotesDeletingItem(Sender: TObject; AIndex: Integer; var ACanDelete: Boolean);
begin
  ACanDelete := false;
  if qLote.Locate('ID', lvLotes.Items[AIndex].Tag) then
    begin
      qLote.Delete;
      ACanDelete := true;
    end;
end;

procedure TfrmPrincipal.lvLotesItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  tmrAbrirLote.Enabled := true;
end;

procedure TfrmPrincipal.lvLotesPullRefresh(Sender: TObject);
begin
  ppvCarregarLotes;
end;

procedure TfrmPrincipal.lvMatrizesDeletingItem(Sender: TObject; AIndex: Integer; var ACanDelete: Boolean);
begin
  ACanDelete := false;
  if qMatriz.Locate('ID', lvMatrizes.Items[AIndex].Tag) then
    begin
      qMatriz.Delete;
      ACanDelete := true;
    end;
end;

procedure TfrmPrincipal.lvMatrizesItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  tmrAbrirMatriz.Enabled := true;
end;

procedure TfrmPrincipal.lvMatrizesPullRefresh(Sender: TObject);
begin
  ppvCarregarMatrizes;
end;

end.
