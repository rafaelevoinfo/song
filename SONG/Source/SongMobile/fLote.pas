unit fLote;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBasicoCadastro, Data.DB, FMX.MediaLibrary.Actions, FMX.StdActns,
  System.Actions, FMX.ActnList, FMX.Controls.Presentation, FMX.Objects,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uQuery, FMX.Edit, FMX.Layouts, FMX.ListBox, FMX.DateTimeCtrls,
  Data.Bind.Components, Data.Bind.DBScope, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.EngExt, FMX.Bind.DBEngExt, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, uTypes, dmuPrincipal;

type
  TfrmLote = class(TfrmBasicoCadastro)
    qLote: TRFQuery;
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
    BindSourceMatriz: TBindSourceDB;
    recMatriz: TRectangle;
    lbMatrizes: TLabel;
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
    qLote_MatrizMATRIZ: TStringField;
    SchemaAdapter: TFDSchemaAdapter;
    lbEspecie: TLabel;
    cbEspecie: TComboBox;
    LinkEspecie: TLinkFillControlToField;
    qLoteID_ESPECIE: TIntegerField;
    qLoteID: TFDAutoIncField;
    LinkControlToField3: TLinkControlToField;
    procedure Ac_Adicionar_MatrizExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Ac_Vincular_MatrizExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lvMatrizesDeletingItem(Sender: TObject; AIndex: Integer; var ACanDelete: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure cbEspecieChange(Sender: TObject);
    procedure Ac_SalvarExecute(Sender: TObject);
  private
    procedure ppvCarregarMatrizes;
    procedure ppvLimparCache(Sender: TObject);
    procedure ppvFiltrarMatrizes;
  protected
    procedure pprExecutarSalvar; override;

  public
    procedure ppuIncluir; override;
    procedure ppuAlterar(ipId: Integer); override;
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
      ppvFiltrarMatrizes;
    end;
  frmMatriz.Show;
end;

procedure TfrmLote.ppvFiltrarMatrizes;
var
  vaIdEspecie: Integer;
  vaItem: TListBoxItem;
begin
  if not qLote_Matriz.Active then
    Exit;

  cbMatriz.Clear;
  frmPrincipal.qMatriz.DisableControls;
  try
    vaIdEspecie := LinkEspecie.BindList.GetSelectedValue.AsString.ToInteger;
    frmPrincipal.qMatriz.First;
    while not frmPrincipal.qMatriz.Eof do
      begin
        if (frmPrincipal.qMatrizID_ESPECIE.AsInteger = vaIdEspecie) and
          (not qLote_Matriz.Locate('ID', frmPrincipal.qMatrizID.AsInteger)) then
          begin
            vaItem := TListBoxItem.Create(cbMatriz);
            vaItem.Tag := frmPrincipal.qMatrizID.AsInteger;
            vaItem.Text := frmPrincipal.qMatrizNOME.AsString;

            cbMatriz.AddObject(vaItem);
          end;

        frmPrincipal.qMatriz.Next;
      end;
  finally
    frmPrincipal.qMatriz.EnableControls;
  end;
end;

procprocedure TfrmLote.Ac_SalvarExecute(Sender: TObject);
begin
  inherited;

end;

edure TfrmLote.Ac_Vincular_MatrizExecute(Sender: TObject);
var
  vaItem: TListViewItem;
  vaIdMatriz: Integer;
begin
  inherited;
  if not Assigned(cbMatriz.Selected) then
    begin
      ShowMessage('Selecione a matriz a ser vinculada.');
      Exit;
    end;

  if (qLote.State in [dsEdit, dsInsert]) then
    qLote.Post;

  qLote_Matriz.Append;
  // SE JA EXISTIR ALGUMA MATRIZ VALIDAR SE A ESPECIE É A MESMA, SE NAO FORR NAO DEIXAR ADICIONARS
  // vaIdMatriz := LinkComboMatriz.BindList.GetSelectedValue.AsString.ToInteger;

  vaIdMatriz := cbMatriz.Selected.Tag;
  qLote_MatrizID_LOTE.AsInteger := qLoteID.AsInteger;
  qLote_MatrizID_MATRIZ.AsInteger := vaIdMatriz; // frmPrincipal.qMatrizID.AsInteger;
  qLote_Matriz.Post;

  vaItem := lvMatrizes.Items.Add;
  vaItem.Tag := qLote_MatrizID.AsInteger;
  vaItem.Text := cbMatriz.Selected.Text;

  cbMatriz.RemoveObject(cbMatriz.Selected);
end;

procedure TfrmLote.cbEspecieChange(Sender: TObject);
begin
  inherited;
  ppvFiltrarMatrizes;
end;

procedure TfrmLote.FormCreate(Sender: TObject);
begin
  inherited;
  dmPrincipal.ppuAbrirEspecie;
  SchemaAdapter.AfterApplyUpdate := ppvLimparCache;
end;

procedure TfrmLote.ppvLimparCache(Sender: TObject);
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

procedure TfrmLote.pprExecutarSalvar;
begin
  inherited;
  if qLote_Matriz.State in [dsEdit, dsInsert] then
    qLote_Matriz.Post;

  // Esse schemaAdapter serve para fazer o commitUpdates de uma so vez tanto no Master como no Detail
  // e tbm já atualiza as chaves no detail para o novo valor gerado no master.
  // Para melhores explicações procurar por Centralized Cache Updates na documentação do FireDac
  SchemaAdapter.ApplyUpdates(0);

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

end.
