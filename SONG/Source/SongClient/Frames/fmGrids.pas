unit fmGrids;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, System.Actions, Vcl.ActnList, uUtils;

type
  TframeGrids = class(TFrame)
    gpGrids: TGridPanel;
    pnLabels: TPanel;
    gpLabels: TGridPanel;
    lbInfoGridEsquerda: TLabel;
    lbInfoGridDireita: TLabel;
    viewEsquerda: TcxGridDBTableView;
    levelGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    pnBotoes: TPanel;
    cxGrid2: TcxGrid;
    viewDireita: TcxGridDBTableView;
    level1: TcxGridLevel;
    btnAdd: TButton;
    btnAddTodos: TButton;
    btnRemover: TButton;
    btnRemoverTodos: TButton;
    dsEsquerda: TDataSource;
    dsDireita: TDataSource;
    ActionList1: TActionList;
    Ac_Add: TAction;
    Ac_AddTodos: TAction;
    Ac_Remover: TAction;
    Ac_RemoverTodos: TAction;
    procedure Ac_AddUpdate(Sender: TObject);
    procedure Ac_RemoverUpdate(Sender: TObject);
    procedure Ac_AddExecute(Sender: TObject);
    procedure Ac_AddTodosExecute(Sender: TObject);
    procedure Ac_RemoverExecute(Sender: TObject);
    procedure Ac_RemoverTodosExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TframeGrids.Ac_AddExecute(Sender: TObject);
var
  vaField, vaFieldDestino: TField;
begin
  dsDireita.DataSet.Append;
  for vaField in dsEsquerda.DataSet.Fields do
    begin
      vaFieldDestino := dsDireita.DataSet.FindField(vaField.FieldName);
      if Assigned(vaFieldDestino) then
        vaFieldDestino.Assign(vaField);
    end;
  dsEsquerda.DataSet.Delete;
  dsDireita.DataSet.Post;
end;

procedure TframeGrids.Ac_AddTodosExecute(Sender: TObject);
begin
  dsEsquerda.DataSet.DisableControls;
  try
     dsEsquerda.DataSet.First;
     while not dsEsquerda.DataSet.Eof do
      Ac_Add.Execute;
  finally
    dsEsquerda.DataSet.EnableControls;
  end;
end;

procedure TframeGrids.Ac_AddUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := dsEsquerda.DataSet.Active and (dsEsquerda.DataSet.RecordCount > 0);
end;

procedure TframeGrids.Ac_RemoverExecute(Sender: TObject);
var
  vaField, vaFieldDestino: TField;
begin
  dsEsquerda.DataSet.Append;
  for vaField in dsDireita.DataSet.Fields do
    begin
      vaFieldDestino := dsEsquerda.DataSet.FindField(vaField.FieldName);
      if Assigned(vaFieldDestino) then
        vaFieldDestino.Assign(vaField);
    end;

  dsDireita.DataSet.Delete;

  dsEsquerda.DataSet.Post;

end;

procedure TframeGrids.Ac_RemoverTodosExecute(Sender: TObject);
begin
  dsDireita.DataSet.DisableControls;
  try
     dsDireita.DataSet.First;
     while not dsDireita.DataSet.Eof do
      Ac_Remover.Execute;
  finally
    dsDireita.DataSet.EnableControls;
  end;

end;

procedure TframeGrids.Ac_RemoverUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := dsDireita.DataSet.Active and (dsDireita.DataSet.RecordCount > 0);
end;

end.
