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
  FMX.Helpers.Android, Androidapi.JNI.App, FMX.Ani, uConexao, Data.SqlExpr,
  uFuncoes;

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
    lbiSenha: TListBoxItem;
    ListBoxGroupHeader4: TListBoxGroupHeader;
    ListBoxItem5: TListBoxItem;
    EditLogin: TEdit;
    EditSenha: TEdit;
    lbIdAparelho: TLabel;
    btnRegistrarAparelho: TButton;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkControlToField3: TLinkControlToField;
    ListBoxGroupHeader5: TListBoxGroupHeader;
    lbiSincronizacao: TListBoxItem;
    lbDataUltimaAtualizacao: TLabel;
    btnLimparSincronizacao: TButton;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    PositionAnimate: TFloatAnimation;
    procedure EditSenhaChange(Sender: TObject);
    procedure btnRegistrarAparelhoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLimparSincronizacaoClick(Sender: TObject);
    procedure LinkPropertyToFieldText2AssigningValue(Sender: TObject; AssignValueRec: TBindingAssignValueRec;
      var Value: TValue; var Handled: Boolean);
    procedure FormVirtualKeyboardShown(Sender: TObject; KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormVirtualKeyboardHidden(Sender: TObject; KeyboardVisible: Boolean; const Bounds: TRect);
    procedure FormDestroy(Sender: TObject);
  private
    FGerenciadorConexao: TGerenciadorConexao;
    FPosicaoAnterior: Double;
    function fpvPegarIMEI: String;
    function fpvPegarNomeDispositivo: String;
    procedure ppvFinalizarAnimacao(Sender: TObject);
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

procedure TfrmConfiguracoes.LinkPropertyToFieldText2AssigningValue(Sender: TObject;
  AssignValueRec: TBindingAssignValueRec; var Value: TValue; var Handled: Boolean);
begin
  inherited;
  if Value.AsString = '' then
    Value := TValue.FromVariant('Não Sincronizado');
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

procedure TfrmConfiguracoes.btnLimparSincronizacaoClick(Sender: TObject);
begin
  inherited;
  dmPrincipal.qConfig.Edit;
  dmPrincipal.qConfigDATA_ULTIMA_SYNC.Clear;
end;

procedure TfrmConfiguracoes.btnRegistrarAparelhoClick(Sender: TObject);

begin
  inherited;
  ppuSalvar; // vamos salvar as configuracoes ja feitas

  if not Assigned(FGerenciadorConexao) then
    FGerenciadorConexao := TGerenciadorConexao.Create;

  FGerenciadorConexao.ppuConectarServidor(
    procedure(ipConexao: TSQLConnection)
    var
      vaNome, vaIMEI: String;
      vaIdAparelho: Integer;
      vaFuncoesSistema: TsmFuncoesSistemaClient;
    begin
      if Assigned(ipConexao) then
        begin
          try
            try
              vaIMEI := fpvPegarIMEI;
              vaNome := fpvPegarNomeDispositivo;
              vaFuncoesSistema := TsmFuncoesSistemaClient.Create(ipConexao.DBXConnection);
              try
                vaIdAparelho := vaFuncoesSistema.fpuRegistrarAparelhoExterno(vaNome, vaIMEI);
              finally
                vaFuncoesSistema.Free;
              end;

              dmPrincipal.qConfig.Edit;
              dmPrincipal.qConfigID_APARELHO.AsInteger := vaIdAparelho;
              dmPrincipal.qConfig.Post;

              lbIdAparelho.Text := vaIdAparelho.ToString;
              lbIdAparelho.Visible := true;
              btnRegistrarAparelho.Visible := false;

            except
              on e: Exception do
                showmessage(e.Message);
            end;
          finally
            ipConexao.Close;
            ipConexao.Free;
          end;
        end;
    end);
  // dmPrincipal.ppuConectarServidor;

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

procedure TfrmConfiguracoes.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(FGerenciadorConexao) then
    FreeAndNil(FGerenciadorConexao);
end;

procedure TfrmConfiguracoes.ppvFinalizarAnimacao(Sender: TObject);
begin
  lbxConfiguracoes.Align := TAlignLayout.Client;
end;

procedure TfrmConfiguracoes.FormVirtualKeyboardHidden(Sender: TObject; KeyboardVisible: Boolean; const Bounds: TRect);
begin
  inherited;
  if lbxConfiguracoes.Align <> TAlignLayout.Client then
    begin
      PositionAnimate.StopValue := FPosicaoAnterior;
      PositionAnimate.OnFinish := ppvFinalizarAnimacao;
      PositionAnimate.Start;

      // sleep(PositionAnimate.Duration*1000);
    end;
end;

procedure TfrmConfiguracoes.FormVirtualKeyboardShown(Sender: TObject; KeyboardVisible: Boolean; const Bounds: TRect);
var
  vaControl: IControl;
  vaItem: TListBoxItem;
  vaEdit: TEdit;
  vaPoint: TPointF;
begin
  inherited;
  vaControl := Focused;
  if Assigned(vaControl) and (vaControl.GetObject is TEdit) and (TEdit(vaControl.GetObject).Parent is TListBoxItem) then
    begin
      vaEdit := TEdit(vaControl.GetObject);
      vaItem := vaEdit.Parent as TListBoxItem;
      vaPoint := vaItem.LocalToAbsolute(TPointF.Create(0, vaItem.Height));
      if Bounds.Location.Y < (vaPoint.Y) then
        begin
          PositionAnimate.OnFinish := nil;
          FPosicaoAnterior := lbxConfiguracoes.Position.Y;
          lbxConfiguracoes.Align := TAlignLayout.None;
          lbxConfiguracoes.SendToBack;
          PositionAnimate.StopValue := lbxConfiguracoes.Position.Y - (vaPoint.Y - Bounds.Location.Y);
          PositionAnimate.Start;
        end;

    end;

end;

procedure TfrmConfiguracoes.pprBeforeSalvar;
var
  vaSha1: TIdHashSHA1;
begin
  inherited;
  if EditSenha.Text.Trim <> '' then
    begin
      vaSha1 := TIdHashSHA1.Create;
      try
        dmPrincipal.qConfigSENHA.AsString := vaSha1.HashStringAsHex(EditSenha.Text);
      finally
        vaSha1.Free;
      end;
    end;
end;

end.
