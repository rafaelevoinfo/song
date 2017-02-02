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
  FMX.Bind.Editors, Data.Bind.EngExt, FMX.Bind.DBEngExt;

type
  TfrmLote = class(TfrmBasicoCadastro)
    qLote: TRFQuery;
    qLoteID: TFDAutoIncField;
    qLoteNOME: TStringField;
    qLoteID_MATRIZ: TIntegerField;
    qLoteQTDE: TBCDField;
    qLoteDATA: TDateTimeField;
    GridPanel: TGridPanelLayout;
    lbNome: TLabel;
    EditNome: TEdit;
    pnPrincipal: TPanel;
    lbMatriz: TLabel;
    lbQtde: TLabel;
    EditQtde: TEdit;
    lbData: TLabel;
    EditData: TDateEdit;
    BindSourceLote: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    pnMatriz: TPanel;
    cbMatriz: TComboBox;
    btnAdd: TButton;
    Ac_Adicionar_Matriz: TAction;
    LinkComboMatriz: TLinkFillControlToField;
    BindSourceMatriz: TBindSourceDB;
    procedure Ac_Adicionar_MatrizExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
     procedure ppuIncluir;override;
  end;

var
  frmLote: TfrmLote;

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

procedure TfrmLote.FormShow(Sender: TObject);
begin
  inherited;
  if EditNome.CanFocus then
    EditNome.SetFocus;
end;

procedure TfrmLote.ppuIncluir;
begin
  inherited;
  qLoteDATA.AsDateTime := now;
end;

end.
