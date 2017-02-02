unit fConfiguracoes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBasicoCadastro, Data.DB, FMX.MediaLibrary.Actions, FMX.StdActns,
  System.Actions, FMX.ActnList, FMX.Controls.Presentation, FMX.Objects,
  FMX.ListBox, FMX.Layouts, FMX.Edit, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope;

type
  TfrmConfiguracoes = class(TfrmBasicoCadastro)
    ListBox1: TListBox;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    ListBoxItem1: TListBoxItem;
    ListBoxGroupHeader2: TListBoxGroupHeader;
    ListBoxItem2: TListBoxItem;
    EditEnderecoExterno: TEdit;
    EditEnderecoInterno: TEdit;
    BindSource: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

uses
  dmuPrincipal;

{$R *.fmx}

end.
