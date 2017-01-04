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
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt;

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
    cbMatriz: TComboBox;
    lbQtde: TLabel;
    EditQtde: TEdit;
    lbData: TLabel;
    EditData: TDateEdit;
    BindSourceLote: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkFillControlToFieldID: TLinkFillControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLote: TfrmLote;

implementation

uses
  fPrincipal;

{$R *.fmx}

end.
