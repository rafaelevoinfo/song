unit fLote;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBasicoCadastro, Data.DB, FMX.MediaLibrary.Actions, FMX.StdActns,
  System.Actions, FMX.ActnList, FMX.Controls.Presentation, FMX.Objects, dmPrincipal,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uQuery, FMX.Edit, FMX.Layouts, FMX.ListBox, FMX.DateTimeCtrls,
  Data.Bind.Components, Data.Bind.DBScope, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TfrmLote = class(TfrmBasicoCadastro)
    qLote: TRFQuery;
    qLoteID: TFDAutoIncField;
    qLoteNOME: TStringField;
    qLoteQTDE: TBCDField;
    qLoteDATA: TDateTimeField;
    GridPanel: TGridPanelLayout;
    lbNome: TLabel;
    EditNome: TEdit;
    pnPrincipal: TPanel;
    lbQtde: TLabel;
    EditQtde: TEdit;
    lbData: TLabel;
    BindSourceLote: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    cbMatriz: TComboBox;
    Ac_Adicionar_Matriz: TAction;
    LinkComboMatriz: TLinkFillControlToField;
    BindSourceMatriz: TBindSourceDB;
    recMatriz: TRectangle;
    Label1: TLabel;
    btnAddMatriz: TButton;
    lvMatrizes: TListView;
    qLote_Matriz: TRFQuery;
    qLote_MatrizID: TFDAutoIncField;
    qLote_MatrizID_LOTE: TIntegerField;
    qLote_MatrizID_MATRIZ: TIntegerField;
    Ac_Vincular_Matriz: TAction;
    EditData: TDateEdit;
    btnVincularMatriz: TButton;
    Line1: TLine;
    qLoteID_TEMP: TIntegerField;
    qLote_MatrizMATRIZ: TStringField;
    SchemaAdapter: TFDSchemaAdapter;
    procedure Ac_Adicionar_MatrizExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Ac_Vincular_MatrizExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lvMatrizesDeletingItem(Sender: TObject; AIndex: Integer; var ACanDelete: Boolean);
    procedure qLoteCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    procedure ppvCarregarMatrizes;
    procedure ppvLimparCache(Sender:Tobject);
  protected
    procedure pprAfterSalvar; override;
    procedure ppuIncluir; override;
    procedure ppuAlterar(ipId: Integer); override;
  public
    procedure ppuSalvar; override;
  end;

var
  frmLote: TfrmLote;

const
  coIDTemporario = -1;

implementation

uses
  fPrincipal, fMatriz;

{$R *.fmx}

procedure TfrmLote.Ac_Adicionar_MatrizExecute(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmMatriz, frmMatriz);
  frmMatriz.ppuIncluir;
  frmMatriz.OnSalvar := procedure
    begin
      frmPrincipal.qMatriz.Refresh;
      LinkComboMatriz.BindList.FillList;
    end;
  frmMatriz.Show;
end;

procedure TfrmLote.Ac_Vincular_MatrizExecute(Sender: TObject);
var
  vaItem: TListViewItem;
  vaIdMatriz: Integer;
begin
  inherited;
  qLote_Matriz.Append;
  SE JA EXISTIR ALGUMA MATRIZ VALIDAR SE A ESPECIE É A MESMA, SE NAO FORR NAO DEIXAR ADICIONARS 
  vaIdMatriz := LinkComboMatriz.BindList.GetSelectedValue.AsString.ToInteger;

  qLote_MatrizID_MATRIZ.AsInteger := vaIdMatriz; // frmPrincipal.qMatrizID.AsInteger;
  qLote_Matriz.Post;

  vaItem := lvMatrizes.Items.Add;
  vaItem.Tag := qLote_MatrizID.AsInteger;
  vaItem.Text := cbMatriz.Selected.Text;
end;

procedure TfrmLote.FormCreate(Sender: TObject);
begin
  inherited;
  SchemaAdapter.AfterApplyUpdate := ppvLimparCache;
end;

procedure TfrmLote.ppvLimparCache(Sender:Tobject);
begin
  qLote.CommitUpdates;
  qLote_Matriz.CommitUpdates;
end;

procedure TfrmLote.FormDestroy(Sender: TObject);
begin
  inherited;
  qLote_Matriz.Close;
end;

procedure TfrmLote.FormShow(Sender: TObject);
begin
  inherited;
  if EditNome.CanFocus then
    EditNome.SetFocus;
end;

procedure TfrmLote.lvMatrizesDeletingItem(Sender: TObject; AIndex: Integer; var ACanDelete: Boolean);
begin
  inherited;
  ACanDelete := false;
  if qLote_Matriz.Locate('ID', lvMatrizes.Items[AIndex].Tag) then
    begin
      qLote_Matriz.Delete;
      ACanDelete := true;
    end;
end;

procedure TfrmLote.pprAfterSalvar;
begin
  inherited;
  // qLote_Matriz.First;
  // while not qLote_Matriz.Eof do
  // begin
  // qLote_Matriz.Edit;
  // qLote_MatrizID_LOTE.AsInteger := qLoteID.AsInteger;
  // qLote_Matriz.Post;
  //
  // qLote_Matriz.Next;
  // end;
  //
  // if qLote_Matriz.ChangeCount > 0 then
  // begin
  // qLote_Matriz.ApplyUpdates(0);
  // qLote_Matriz.CommitUpdates;
  // end;

end;

procedure TfrmLote.ppuAlterar(ipId: Integer);
begin
  qLote_Matriz.Close;
  inherited;
  qLote_Matriz.Open();
  ppvCarregarMatrizes;

end;

procedure TfrmLote.ppvCarregarMatrizes;
var
  vaItem: TListViewItem;
begin
  qLote_Matriz.DisableControls;
  lvMatrizes.BeginUpdate;
  try
    lvMatrizes.Items.Clear;
    qLote_Matriz.First;
    while not qLote_Matriz.Eof do
      begin
        vaItem := lvMatrizes.Items.Add;
        vaItem.Tag := qLote_MatrizID.AsInteger;
        vaItem.Text := qLote_MatrizMATRIZ.AsString;

        qLote_Matriz.Next;
      end;
  finally
    lvMatrizes.EndUpdate;
    qLote_Matriz.EnableControls;
  end;
end;

procedure TfrmLote.ppuIncluir;
begin
  qLote_Matriz.Close;
  inherited;
  qLoteDATA.AsDateTime := now;

  qLote_Matriz.Open;
end;

procedure TfrmLote.ppuSalvar;
begin
  // nao chamar o inherited;
  qLote.DisableControls;
  try
    pprBeforeSalvar;
    SchemaAdapter.ApplyUpdates(0);

    pprAfterSalvar;

    if Assigned(OnSalvar) then
      OnSalvar();
  finally
    qLote.EnableControls;
  end;
end;

procedure TfrmLote.qLoteCalcFields(DataSet: TDataSet);
begin
  inherited;
  if qLoteID.IsNull then
    qLoteID_TEMP.AsInteger := coIDTemporario
  else
    qLoteID_TEMP.AsInteger := qLoteID.AsInteger;
end;

end.
