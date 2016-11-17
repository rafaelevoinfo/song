unit fPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
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
  dmuPrincipal;

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
    LinkListControlToField1: TLinkListControlToField;
    procedure Ac_AdicionarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lvMatrizesGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure lvMatrizesItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure lvMatrizesPullRefresh(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}
{$R *.SmXhdpiPh.fmx ANDROID}
{$R *.NmXhdpiPh.fmx ANDROID}


procedure TfrmPrincipal.Ac_AdicionarExecute(Sender: TObject);
begin
  if tbcPrincipal.ActiveTab = tabMatrizes then
    begin
      Application.CreateForm(TfrmMatriz, frmMatriz);
      frmMatriz.ppuIncluir;
      frmMatriz.Show;
    end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  if not qMatriz.Active then
    qMatriz.Open();
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  qMatriz.Refresh;
end;

procedure TfrmPrincipal.lvMatrizesGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  if EventInfo.GestureID = igiLongTap then
    begin
      // lvMatrizes.EditMode := not lvMatrizes.EditMode;
    end
  else if EventInfo.GestureID = igiPressAndTap then
    begin
      ShowMessage('Gesture: ' + qMatrizNOME.AsString);
    end;
end;

procedure TfrmPrincipal.lvMatrizesItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  Application.CreateForm(TfrmMatriz, frmMatriz);
  frmMatriz.ppuAlterar(qMatrizID.AsInteger);
  frmMatriz.Show;
end;

procedure TfrmPrincipal.lvMatrizesPullRefresh(Sender: TObject);
begin
  qMatriz.Refresh;
end;

end.
