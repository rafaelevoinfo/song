unit fmGrids;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, System.Actions, Vcl.ActnList, uUtils, System.Generics.Collections, System.Generics.Defaults,
  uTypes;

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
    ActionListFrame: TActionList;
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
    procedure viewEsquerdaDblClick(Sender: TObject);
    procedure viewDireitaDblClick(Sender: TObject);
  private
    FMapaFields: TDictionary<String, string>;
    procedure ppvPreencherCamposPadroes(ipDataSet: TDataSet);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ppuAdicionarField(ipView: TcxGridDBTableView; ipFieldName: string; ipRepositorio: TcxEditRepositoryItem); overload;
    procedure ppuAdicionarField(ipView: TcxGridDBTableView; ipFieldName: string; ipVisible: Boolean); overload;
    procedure ppuAdicionarField(ipView: TcxGridDBTableView; ipFieldName: string; ipVisible: Boolean; ipRepositorio: TcxEditRepositoryItem); overload;
    procedure ppuAdicionarField(ipView: TcxGridDBTableView; ipFieldName: string); overload;

    procedure ppuMapearFields(ipFieldEsquerda, ipFieldDireita: String);
  end;

implementation

uses
  dmuPrincipal;

{$R *.dfm}


procedure TframeGrids.Ac_AddExecute(Sender: TObject);
var
  vaField, vaFieldDestino: TField;
  vaFieldName: String;
begin
  dsDireita.DataSet.Append;
  if FMapaFields.ContainsKey('*') then // vamos copiar todos os campos
    begin
      for vaField in dsEsquerda.DataSet.Fields do
        begin
          vaFieldDestino := dsDireita.DataSet.FindField(vaField.FieldName);
          if Assigned(vaFieldDestino) then
            vaFieldDestino.Assign(vaField);
        end;
    end
  else
    begin
      for vaFieldName in FMapaFields.Keys do
        begin
          vaField := dsEsquerda.DataSet.FindField(vaFieldName);
          if Assigned(vaField) then
            begin
              vaFieldDestino := dsDireita.DataSet.FindField(FMapaFields.Items[vaFieldName]);
              if Assigned(vaFieldDestino) then
                vaFieldDestino.Assign(vaField);
            end;
        end;
    end;
  ppvPreencherCamposPadroes(dsDireita.DataSet);
  // for vaField in dsEsquerda.DataSet.Fields do
  // begin
  // vaFieldDestino := dsDireita.DataSet.FindField(vaField.FieldName);
  // if Assigned(vaFieldDestino) then
  // vaFieldDestino.Assign(vaField);
  // end;
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

procedure TframeGrids.ppvPreencherCamposPadroes(ipDataSet: TDataSet);
var
  vaField: TField;
  vaTabela: String;
begin
  vaField := ipDataSet.FindField(TBancoDados.coID);
  if Assigned(vaField) then
    begin
      if vaField.IsNull and vaField.Required then
        begin
          if ipDataSet.State in [dsEdit, dsInsert] then
            begin
              vaTabela := Copy(ipDataSet.Name, 4, Length(ipDataSet.Name) - 3);
              vaField.AsInteger := dmPrincipal.FuncoesGeral.fpuGetId(vaTabela);
            end;
        end;
    end;
end;

procedure TframeGrids.viewDireitaDblClick(Sender: TObject);
begin
  Ac_Remover.Execute;
end;

procedure TframeGrids.viewEsquerdaDblClick(Sender: TObject);
begin
  Ac_Add.Execute;
end;

procedure TframeGrids.Ac_RemoverExecute(Sender: TObject);
var
  vaField, vaFieldDestino: TField;
  vaFieldName: string;
begin
  dsEsquerda.DataSet.Append;
  if FMapaFields.ContainsKey('*') then // vamos copiar todos os campos
    begin
      for vaField in dsDireita.DataSet.Fields do
        begin
          vaFieldDestino := dsEsquerda.DataSet.FindField(vaField.FieldName);
          if Assigned(vaFieldDestino) then
            vaFieldDestino.Assign(vaField);
        end;
    end
  else
    begin
      for vaFieldName in FMapaFields.Keys do
        begin
          vaFieldDestino := dsEsquerda.DataSet.FindField(vaFieldName);
          if Assigned(vaFieldDestino) then
            begin
              vaField := dsDireita.DataSet.FindField(FMapaFields.Items[vaFieldName]);
              if Assigned(vaField) then
                vaFieldDestino.Assign(vaField);
            end;
        end;
    end;
  // for vaField in dsDireita.DataSet.Fields do
  // begin
  // vaFieldDestino := dsEsquerda.DataSet.FindField(vaField.FieldName);
  // if Assigned(vaFieldDestino) then
  // vaFieldDestino.Assign(vaField);
  // end;

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

constructor TframeGrids.Create(AOwner: TComponent);
begin
  inherited;
  FMapaFields := TDictionary<string, String>.Create;
end;

destructor TframeGrids.Destroy;
begin
  FMapaFields.Free;
  inherited;
end;

procedure TframeGrids.ppuAdicionarField(ipView: TcxGridDBTableView; ipFieldName: string;
  ipRepositorio: TcxEditRepositoryItem);
begin
  ppuAdicionarField(ipView, ipFieldName, true, ipRepositorio);
end;

procedure TframeGrids.ppuAdicionarField(ipView: TcxGridDBTableView; ipFieldName: string; ipVisible: Boolean);
begin
  ppuAdicionarField(ipView, ipFieldName, ipVisible, nil);
end;

procedure TframeGrids.ppuAdicionarField(ipView: TcxGridDBTableView; ipFieldName: string; ipVisible: Boolean;
  ipRepositorio: TcxEditRepositoryItem);
var
  vaColumn: TcxGridDBColumn;
begin
  vaColumn := ipView.CreateColumn;
  vaColumn.DataBinding.FieldName := ipFieldName;
  vaColumn.RepositoryItem := ipRepositorio;
  vaColumn.Visible := ipVisible;
  vaColumn.Width := 150;
end;

procedure TframeGrids.ppuMapearFields(ipFieldEsquerda, ipFieldDireita: String);
begin
  FMapaFields.Add(ipFieldEsquerda, ipFieldDireita);
end;

procedure TframeGrids.ppuAdicionarField(ipView: TcxGridDBTableView;
  ipFieldName: string);
begin
  ppuAdicionarField(ipView, ipFieldName, true);
end;

end.
