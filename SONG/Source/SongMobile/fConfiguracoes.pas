unit fConfiguracoes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBasicoCadastro, Data.DB, FMX.MediaLibrary.Actions, FMX.StdActns,
  System.Actions, FMX.ActnList, FMX.Controls.Presentation, FMX.Objects,
  FMX.ListBox, FMX.Layouts, FMX.Edit, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, IdHashSHA,
  FMX.Platform.Android,
  Androidapi.JNI.Telephony,
  Androidapi.Helpers,
  Androidapi.JNI.Provider,
  Androidapi.JNI.Os,
  Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  FMX.Helpers.Android;

type
  TfrmConfiguracoes = class(TfrmBasicoCadastro)
    lbxConfiguracoes: TListBox;
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
    ListBoxGroupHeader3: TListBoxGroupHeader;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxGroupHeader4: TListBoxGroupHeader;
    ListBoxItem5: TListBoxItem;
    EditLogin: TEdit;
    EditSenha: TEdit;
    lbIdAparelho: TLabel;
    btnRegistrarAparelho: TButton;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkControlToField3: TLinkControlToField;
    procedure EditSenhaChange(Sender: TObject);
    procedure btnRegistrarAparelhoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function fpvPegarIMEI: String;
    function fpvPegarNomeDispositivo: String;
    { Private declarations }
  protected
    procedure pprBeforeSalvar; override;
  public
    { Public declarations }
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

uses
  dmuPrincipal;

{$R *.fmx}

function TfrmConfiguracoes.fpvPegarNomeDispositivo: String;
begin
  Result := JStringToString(TJBuild.JavaClass.MODEL); // Model name
end;

function TfrmConfiguracoes.fpvPegarIMEI: String;
var
  vaObj: JObject;
  vaTm: JTelephonyManager;
begin
  vaObj := TAndroidHelper.Context.getSystemService(TJContext.JavaClass.TELEPHONY_SERVICE);
  if vaObj <> nil then
    begin
      vaTm := TJTelephonyManager.Wrap((vaObj as ILocalObject).GetObjectID);
      if vaTm <> nil then
        Result := JStringToString(vaTm.getDeviceId);
    end;
  if Result = '' then
    Result := JStringToString(TJSettings_Secure.JavaClass.getString(TAndroidHelper.Activity.getContentResolver,
      TJSettings_Secure.JavaClass.ANDROID_ID));
end;

procedure TfrmConfiguracoes.btnRegistrarAparelhoClick(Sender: TObject);
var
  vaNome, vaIMEI: String;
  vaIdAparelho:Integer;
begin
  inherited;
  ppuSalvar; // vamos salvar as configuracoes ja feitas
  dmPrincipal.ppuConectarServidor;
  vaIMEI := fpvPegarIMEI;
  vaNome := fpvPegarNomeDispositivo;
  vaIdAparelho := dmPrincipal.FuncoesSistema.fpuRegistrarAparelhoExterno(vaNome, vaIMEI);

  dmPrincipal.qConfig.Edit;
  dmPrincipal.qConfigID_APARELHO.AsInteger := vaIdAparelho;
  dmPrincipal.qConfig.Post;

  lbIdAparelho.Text := vaIdAparelho.ToString;
  lbIdAparelho.Visible := true;
  btnRegistrarAparelho.Visible := false;
end;

procedure TfrmConfiguracoes.EditSenhaChange(Sender: TObject);
begin
  inherited;
  if not(dsPrincipal.DataSet.State in [dsEdit, dsInsert]) then
    dsPrincipal.DataSet.Edit;
end;

procedure TfrmConfiguracoes.FormCreate(Sender: TObject);
begin
  inherited;
  lbIdAparelho.Visible := not dmPrincipal.qConfigID_APARELHO.IsNull;
  btnRegistrarAparelho.Visible := not lbIdAparelho.Visible;
  if lbIdAparelho.Visible then
    lbIdAparelho.Text := dmPrincipal.qConfigID_APARELHO.AsString;
end;

procedure TfrmConfiguracoes.pprBeforeSalvar;
var
  vaSha1: TIdHashSHA1;
begin
  inherited;

  vaSha1 := TIdHashSHA1.Create;
  try
    dmPrincipal.qConfigSENHA.AsString := vaSha1.HashStringAsHex(EditSenha.text);
  finally
    vaSha1.free;
  end;
end;

end.
