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
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, uTypes, dmuPrincipal,
  FMX.Maps;

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
    btnAddMatriz: TButton;
    qLote_MatrizID_ESPECIE: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure Ac_Vincular_MatrizExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lvMatrizesDeletingItem(Sender: TObject; AIndex: Integer; var ACanDelete: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure cbEspecieChange(Sender: TObject);
    procedure Ac_Adicionar_MatrizExecute(Sender: TObject);
    procedure lvMatrizesDeleteItem(Sender: TObject; AIndex: Integer);
  private
    procedure ppvCarregarMatrizes;
    procedure ppvLimparCache(Sender: TObject);
    procedure ppvFiltrarMatrizes;
  protected
    procedure pprExecutarSalvar; override;
    function fprValidarDados(var opMsgErro: String): Boolean; override;
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

procedure TfrmLote.ppvFiltrarMatrizes;
var
  vaIdEspecie: Integer;
  vaItem: TListBoxItem;
begin
  if not qLote_Matriz.Active then
    Exit;

  if (not LinkEspecie.BindList.GetSelectedValue.IsEmpty) then
    begin
      cbMatriz.Clear;
      frmPrincipal.qMatriz.DisableControls;
      try
        vaIdEspecie := LinkEspecie.BindList.GetSelectedValue.AsString.ToInteger;
        frmPrincipal.qMatriz.First;
        while not frmPrincipal.qMatriz.Eof do
          begin
            if (frmPrincipal.qMatrizID_ESPECIE.AsInteger = vaIdEspecie) and
              (not qLote_Matriz.Locate(qLote_MatrizID_MATRIZ.FieldName, frmPrincipal.qMatrizID.AsInteger)) then
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
end;

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

procedure TfrmLote.Ac_Vincular_MatrizExecute(Sender: TObject);
var
  vaItem: TListViewItem;
  vaIdMatriz: Integer;
begin
  inherited;
  if (LinkEspecie.BindList.GetSelectedValue.IsEmpty) or (not Assigned(cbMatriz.Selected)) then
    begin
      ShowMessage('Selecione a esp�cie e a matriz a ser vinculada.');
      Exit;
    end;

  if (qLote_Matriz.RecordCount > 0) and
    (qLote_MatrizID_ESPECIE.AsInteger <> LinkEspecie.BindList.GetSelectedValue.AsString.ToInteger) then
    begin
      ShowMessage('Um lote s� pode conter matrizes de uma mesma esp�cie.');
      Exit;
    end;

  if (qLote.State in [dsEdit, dsInsert]) then
    qLote.Post;

  qLote_Matriz.Append;

  vaIdMatriz := cbMatriz.Selected.Tag;
  qLote_MatrizID_LOTE.AsInteger := qLoteID.AsInteger;
  qLote_MatrizID_MATRIZ.AsInteger := vaIdMatriz;
  qLote_MatrizID_ESPECIE.AsInteger := LinkEspecie.BindList.GetSelectedValue.AsString.ToInteger;
  qLote_Matriz.Post;

  vaItem := lvMatrizes.Items.Add;
  vaItem.Tag := qLote_MatrizID.AsInteger;
  vaItem.Text := cbMatriz.Selected.Text;

  cbMatriz.ListBox.RemoveObject(cbMatriz.Selected);
  cbMatriz.ListBox.ClearSelection;

  qLote.Edit;
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

function TfrmLote.fprValidarDados(var opMsgErro: String): Boolean;
begin
  Result := inherited;
  if Result and (qLote_Matriz.Active) and (qLote_Matriz.RecordCount > 0) then
    begin
      if qLoteID_ESPECIE.AsInteger <> qLote_MatrizID_ESPECIE.AsInteger then
        begin
          opMsgErro := 'A esp�cie do lote deve ser a mesma das matrizes vinculadas.';
          Result := false;
        end;
    end;
end;

procedure TfrmLote.lvMatrizesDeleteItem(Sender: TObject; AIndex: Integer);
begin
  inherited;
  ppvFiltrarMatrizes;
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
  // e tbm j� atualiza as chaves no detail para o novo valor gerado no master.
  // Para melhores explica��es procurar por Centralized Cache Updates na documenta��o do FireDac
  SchemaAdapter.ApplyUpdates(0);

end;

procedure TfrmLote.ppuAlterar(ipId: Integer);
begin
  qLote_Matriz.Close;
  inherited;
  qLote_Matriz.Open();
  ppvCarregarMatrizes;
  ppvFiltrarMatrizes;
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
