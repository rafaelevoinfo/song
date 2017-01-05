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
  System.Threading;

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
    BindSourceMatriz: TBindSourceDB;
    BindingsList1: TBindingsList;
    qMatriz: TRFQuery;
    qMatrizID: TFDAutoIncField;
    qMatrizNOME: TStringField;
    LinkListMatrizToDataSet: TLinkListControlToField;
    ImageList1: TImageList;
    qLote: TRFQuery;
    qLoteID: TFDAutoIncField;
    qLoteLOTE: TStringField;
    qLoteESPECIE: TStringField;
    BindSourceLote: TBindSourceDB;
    LinkListLotesToDataSet: TLinkListControlToField;
    qLoteQTDE: TBCDField;
    tmrAbrirLote: TTimer;
    tmrAbrirMatriz: TTimer;
    procedure Ac_AdicionarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lvMatrizesPullRefresh(Sender: TObject);
    procedure lvMatrizesDeleteItem(Sender: TObject; AIndex: Integer);
    procedure lvMatrizesItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure lvLotesPullRefresh(Sender: TObject);
    procedure tmrAbrirLoteTimer(Sender: TObject);
    procedure lvLotesItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure tbcPrincipalChange(Sender: TObject);
    procedure tmrAbrirMatrizTimer(Sender: TObject);
    procedure lvLotesDeleteItem(Sender: TObject; AIndex: Integer);
    procedure LinkListMatrizToDataSetFillingListItem(Sender: TObject;
      const AEditor: IBindListEditorItem);
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
      qMatriz.Refresh;
    end;
  frmMatriz.Show;
end;

procedure TfrmPrincipal.ppvCarregarMatrizes;
begin
  if not qMatriz.Active then
    qMatriz.Open();
end;

procedure TfrmPrincipal.ppvCarregarLotes;
begin
  if not qLote.Active then
    qLote.Open();
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
      qLote.Refresh;
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
  ppvAbrirLote(qLoteID.AsInteger);
end;

procedure TfrmPrincipal.tmrAbrirMatrizTimer(Sender: TObject);
begin
  tmrAbrirMatriz.Enabled := false;
  ppvAbrirMatriz(qMatrizID.AsInteger);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  tbcPrincipal.ActiveTab := tabLotes;

  ppvCarregarLotes;
end;

procedure TfrmPrincipal.LinkListMatrizToDataSetFillingListItem(Sender: TObject;
  const AEditor: IBindListEditorItem);
begin
  showMessage(Sender.ClassName+' - '+AEditor.CurrentObject.ClassName);
  TListViewItem(AEditor.CurrentObject).Tag := qMatrizID.AsInteger;
end;

procedure TfrmPrincipal.lvLotesDeleteItem(Sender: TObject; AIndex: Integer);
begin
  qLote.Delete;
end;

procedure TfrmPrincipal.lvLotesItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  tmrAbrirLote.Enabled := true;
end;

procedure TfrmPrincipal.lvLotesPullRefresh(Sender: TObject);
begin
  qLote.Refresh;
end;

procedure TfrmPrincipal.lvMatrizesDeleteItem(Sender: TObject; AIndex: Integer);
begin
  qMatriz.Delete;
end;

procedure TfrmPrincipal.lvMatrizesItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  tmrAbrirMatriz.Enabled := true;
end;

procedure TfrmPrincipal.lvMatrizesPullRefresh(Sender: TObject);
begin
  qMatriz.Refresh;
end;

end.
