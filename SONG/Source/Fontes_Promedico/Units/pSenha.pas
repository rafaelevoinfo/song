unit pSenha;

interface

uses
{$IFDEF WORKSTATION} // definido em Project->Options->Delphi Compiler -> Conditional Defines
  pFuncoesServer,
{$ELSE}
  ufservidor,
{$ENDIF}
  pTypes, pMessageTela,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, pZero, cxPCdxBarPopupMenu, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxPC, Vcl.StdCtrls,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.ExtCtrls, cxContainer, cxEdit,
  dxGDIPlusClasses, cxImage, cxTextEdit, System.RegularExpressions,
  pMethod2009, dxSkinsCore, pmPromedicoSkin, dxSkinscxPCPainter,
  dxBarBuiltInMenu, System.ImageList, cxGroupBox, cxRadioGroup;

type
  TResultadoTrocaSenha = (rtsNada, rtsSenhaAlterada, rtsFecharSistema);
  TTipoRecuperacaoSenha = (trsEmail, trsSms, trsManual);

  TfrmSenha = class(TfrmZero)
    pcPrincipal: TcxPageControl;
    tabAviso: TcxTabSheet;
    tabTrocaSenha: TcxTabSheet;
    lbDias: TLabel;
    lbAviso2: TLabel;
    bttAlterar: TButton;
    Panel1: TPanel;
    bttRetornar: TButton;
    ActionList1: TActionList;
    Ac_FecharSistema: TAction;
    Ac_AlterarAgora: TAction;
    Ac_Gravar: TAction;
    bttFecharSistema: TButton;
    Ac_Retornar: TAction;
    bttGravar: TButton;
    ImageList1: TImageList;
    pnTopo: TPanel;
    lbAviso: TLabel;
    cxImage1: TcxImage;
    tabRecuperarSenha: TcxTabSheet;
    rgRecuperarSenha: TcxRadioGroup;
    pnSenhas: TPanel;
    lbSenhaAtual: TLabel;
    EditSenhaAtual: TcxTextEdit;
    lbSenha1: TLabel;
    EditSenha: TcxTextEdit;
    lbConfirmeSenha: TLabel;
    EditSenha2: TcxTextEdit;
    lbCodigoNomeUsuario: TLabel;
    EditUsuario: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure Ac_RetornarExecute(Sender: TObject);
    procedure Ac_GravarExecute(Sender: TObject);
    procedure EditSenhaPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure EditSenha2PropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure Ac_FecharSistemaExecute(Sender: TObject);
    procedure Ac_AlterarAgoraExecute(Sender: TObject);
    procedure pmfrmZeroFormShow(Sender: TObject);
    procedure pmfrmZeroFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pmfrmZeroFormKeyPress(Sender: TObject; var Key: Char);
    procedure tabTrocaSenhaShow(Sender: TObject);
    procedure rgRecuperarSenhaPropertiesEditValueChanged(Sender: TObject);
  private
    FExibirMsgValidation: Boolean;
    FCodigoUsuario: Integer;
    FOperacao: TOperacaoSenha;
    FResultado: TResultadoTrocaSenha;
    FProxyUsuario: TFunc<TSMFuncoesUsuarioClient>;
    FPermitirRetornar: Boolean;
    FUsarRestricoesSeguranca: Boolean;
    FSenhaAtual: String;
    FOnBeforeEnviarSmsEmail: TFunc<String, TTipoRecuperacaoSenha, Boolean>;
    FOpcaoPadraoRecuperacaoSenha: TTipoRecuperacaoSenha;
    procedure SetCodigoUsuario(const Value: Integer);
    procedure SetOperacao(const Value: TOperacaoSenha);
    procedure SetProxyUsuario(const Value: TFunc<TSMFuncoesUsuarioClient>);
    procedure SetPermitirRetornar(const Value: Boolean);
    procedure SetUsarRestricoesSeguranca(const Value: Boolean);
    procedure SetSenhaAtual(const Value: String);
    procedure SetOnBeforeEnviarSmsEmail(const Value: TFunc<String, TTipoRecuperacaoSenha, Boolean>);
    procedure SetOpcaoPadraoRecuperacaoSenha(
      const Value: TTipoRecuperacaoSenha);
    { Private declarations }
  public
    property CodigoUsuario: Integer read FCodigoUsuario write SetCodigoUsuario;
    property Operacao: TOperacaoSenha read FOperacao write SetOperacao;
    // usado apenas pelo WS para que mesmo quando a operacao exigir a troca da senha a tela ainda permita sair
    property PermitirRetornar: Boolean read FPermitirRetornar write SetPermitirRetornar;
    property ProxyUsuario: TFunc<TSMFuncoesUsuarioClient> read FProxyUsuario write SetProxyUsuario;
    property Resultado: TResultadoTrocaSenha read FResultado;
    property UsarRestricoesSeguranca: Boolean read FUsarRestricoesSeguranca write SetUsarRestricoesSeguranca;
    property SenhaAtual: String read FSenhaAtual write SetSenhaAtual;
    property OpcaoPadraoRecuperacaoSenha:TTipoRecuperacaoSenha read FOpcaoPadraoRecuperacaoSenha write SetOpcaoPadraoRecuperacaoSenha;
    property OnBeforeEnviarSmsEmail: TFunc<String, TTipoRecuperacaoSenha, Boolean> read FOnBeforeEnviarSmsEmail write SetOnBeforeEnviarSmsEmail;

    class function fpuValidarSenha(ipSenha: String; ipExibirMsg: Boolean): String;
  end;

implementation

{$R *.dfm}


procedure TfrmSenha.Ac_AlterarAgoraExecute(Sender: TObject);
begin
  inherited;
  Operacao := osSolicitacaoUsuario;
  pcPrincipal.ActivePage := tabTrocaSenha;
end;

procedure TfrmSenha.Ac_FecharSistemaExecute(Sender: TObject);
begin
  inherited;
  FResultado := rtsFecharSistema;
  Close;
end;

procedure TfrmSenha.Ac_GravarExecute(Sender: TObject);
var
  vaNovaSenha: String;
begin
  inherited;
  if not Assigned(ProxyUsuario) then
    raise Exception.Create('A fun��o de grava��o n�o foi definida.');

  if (FOperacao = osRecuperacaoSenha) and (rgRecuperarSenha.ItemIndex <> Ord(trsManual)) then
    begin
      if EditUsuario.Text = '' then
        raise Exception.Create('Informe o c�digo ou o nome do usu�rio.');

      if Assigned(OnBeforeEnviarSmsEmail) then
        begin
          if not OnBeforeEnviarSmsEmail(EditUsuario.Text, TTipoRecuperacaoSenha(rgRecuperarSenha.ItemIndex)) then
            Exit;
        end;

      if rgRecuperarSenha.ItemIndex = Ord(trsEmail) then
        ProxyUsuario.ppuGerarSenhaEnviarEmail(EditUsuario.Text)
      else
        ProxyUsuario.ppuGerarSenhaEnviarSms(EditUsuario.Text);

      FResultado := rtsSenhaAlterada;

      Close;
    end
  else
    begin
      FExibirMsgValidation := false;
      try

        EditSenha.ValidateEdit(true);
        EditSenha2.ValidateEdit(true);

        vaNovaSenha := CriptografarSha1ComSaltPadrao(EditSenha.Text);

        if EditSenhaAtual.Visible then
          ProxyUsuario.ppuAlterarSenha(CodigoUsuario, CriptografarSha1ComSaltPadrao(EditSenhaAtual.Text), vaNovaSenha)
        else
          ProxyUsuario.ppuAlterarSenha(CodigoUsuario, SenhaAtual, vaNovaSenha);
        FResultado := rtsSenhaAlterada;
        Close;

      finally
        FExibirMsgValidation := true;
      end;
    end;

end;

procedure TfrmSenha.Ac_RetornarExecute(Sender: TObject);
begin
  inherited;
  FResultado := rtsNada;
  Close;
end;

procedure TfrmSenha.EditSenha2PropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  EditSenhaPropertiesValidate(Sender, DisplayValue, ErrorText, Error);
  if not Error then
    begin
      if VarToStrDef(DisplayValue, '') <> EditSenha.Text then
        begin
          Error := true;
          ErrorText := 'As senhas n�o conferem';
          if FExibirMsgValidation then
            TfrmMessageTela.ppuMsgPopUp(ErrorText);
        end;
    end;
end;

procedure TfrmSenha.EditSenhaPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if UsarRestricoesSeguranca then
    begin
      ErrorText := TfrmSenha.fpuValidarSenha(VarToStrDef(DisplayValue, ''), FExibirMsgValidation);
      if ErrorText <> '' then
        Error := true;
    end;
end;

procedure TfrmSenha.FormCreate(Sender: TObject);
begin
  inherited;
  FPermitirRetornar := false;
  FExibirMsgValidation := true;
  FUsarRestricoesSeguranca := true;
  Operacao := osAviso; // caso o programador nao troque, durante o show a propria tela ira buscar e mostrar a quant. de dias restante para troca da senha
  pcPrincipal.Properties.HideTabs := true;
end;

class function TfrmSenha.fpuValidarSenha(ipSenha: String; ipExibirMsg: Boolean): String;
begin
  Result := '';
  if Length(ipSenha) < 8 then
    begin
      Result := 'Senha deve conter pelo menos 8 caracteres';
      if ipExibirMsg then
        TfrmMessageTela.ppuMsgPopUp(Result);
    end
  else
    begin
      if not(TRegEx.IsMatch(ipSenha, '[a-zA-Z]') and (TRegEx.IsMatch(ipSenha, '\d'))) then
        begin
          Result := 'Senha deve conter no m�nimo um caracter e um d�gito.';
          if ipExibirMsg then
            TfrmMessageTela.ppuMsgPopUp(Result);
        end;
    end;
end;

procedure TfrmSenha.pmfrmZeroFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F4 then
    Key := VK_F1;
end;

procedure TfrmSenha.pmfrmZeroFormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Tab_To_Enter(Self, Key);
end;

procedure TfrmSenha.pmfrmZeroFormShow(Sender: TObject);
var
  vaQuantDias: Integer;
begin
  inherited;
  if FOperacao = osAviso then
    begin
      if Assigned(ProxyUsuario) then
        begin
          vaQuantDias := ProxyUsuario.fpuQtdeDiasRestanteTrocaSenha(CodigoUsuario);
          case vaQuantDias of
            0: // expirou a senha
              Operacao := osSenhaExpirada;
            -1: // nao foi definido nas config do sistema
              lbDias.Caption := 'N�o definido';
          else
            lbDias.Caption := IntToStr(vaQuantDias);
          end;
        end
      else
        raise Exception.Create('A fun��o de grava��o n�o foi definida.');
    end;

end;

procedure TfrmSenha.rgRecuperarSenhaPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  pnSenhas.Visible := rgRecuperarSenha.ItemIndex = Ord(trsManual);
end;

procedure TfrmSenha.SetCodigoUsuario(const Value: Integer);
begin
  FCodigoUsuario := Value;
end;

procedure TfrmSenha.SetOnBeforeEnviarSmsEmail(const Value: TFunc<String, TTipoRecuperacaoSenha, Boolean>);
begin
  FOnBeforeEnviarSmsEmail := Value;
end;

procedure TfrmSenha.SetOpcaoPadraoRecuperacaoSenha(
  const Value: TTipoRecuperacaoSenha);
begin
  FOpcaoPadraoRecuperacaoSenha := Value;
  rgRecuperarSenha.ItemIndex := Ord(Value);
end;

procedure TfrmSenha.SetOperacao(const Value: TOperacaoSenha);
begin
  FOperacao := Value;
  bttGravar.Visible := FOperacao <> osAviso;
  bttRetornar.Visible := FPermitirRetornar or (FOperacao = osSolicitacaoUsuario) or (FOperacao = osAviso);
  bttFecharSistema.Visible := (not FPermitirRetornar) and ((FOperacao = osSolicitacaoAdmin) or (FOperacao = osSenhaExpirada));; // so deve ser obrigado a fechar o sistema quando a senha estiver expirada ou o admin tenha solicitado
  EditSenhaAtual.Visible := FOperacao = osSolicitacaoUsuario;
  lbSenhaAtual.Visible := EditSenhaAtual.Visible;

  case FOperacao of
    osAviso:
      pcPrincipal.ActivePage := tabAviso;
    osRecuperacaoSenha:
      begin
        pnSenhas.Visible := false;
        pnSenhas.Parent := tabRecuperarSenha;
        pcPrincipal.ActivePage := tabRecuperarSenha;
      end
  else
    pcPrincipal.ActivePage := tabTrocaSenha;
  end;

  // colocando os botoes na ordem correta
  bttGravar.Top := 0;
  bttRetornar.Top := bttGravar.Top + 5;
  bttFecharSistema.Top := bttRetornar.Top + 5;

  case FOperacao of
    osAviso:
      Self.Caption := 'Aviso de troca de senha';
    osSenhaExpirada:
      Self.Caption := 'Aten��o, sua senha expirou, � necess�rio informar uma nova senha';
    osSolicitacaoAdmin:
      Self.Caption := 'O Administrador do sistema solicitou que voc� atualize sua senha';
    osSolicitacaoUsuario:
      Self.Caption := 'Altera��o de Senha';
    osRecuperacaoSenha:
      begin
        Self.Caption := 'Recupera��o de Senha';
        Ac_Gravar.Caption := 'Redefinir senha';
      end;
  end;

end;

procedure TfrmSenha.SetPermitirRetornar(const Value: Boolean);
begin
  FPermitirRetornar := Value;
end;

procedure TfrmSenha.SetProxyUsuario(
  const Value: TFunc<TSMFuncoesUsuarioClient>);
begin
  FProxyUsuario := Value;
end;

procedure TfrmSenha.SetSenhaAtual(const Value: String);
begin
  FSenhaAtual := Value;
end;

procedure TfrmSenha.SetUsarRestricoesSeguranca(const Value: Boolean);
begin
  FUsarRestricoesSeguranca := Value;
  if FUsarRestricoesSeguranca then
    begin
      if rgRecuperarSenha.Properties.Items.Count > 2 then
        rgRecuperarSenha.Properties.Items.Delete(2);
    end
  else
    begin
      if rgRecuperarSenha.Properties.Items.Count < 3 then
        rgRecuperarSenha.Properties.Items.Add.Caption := 'Informar a nova senha manualmente';
    end;
end;

procedure TfrmSenha.tabTrocaSenhaShow(Sender: TObject);
begin
  inherited;
  if EditSenhaAtual.Visible then
    pmSetFocus(EditSenhaAtual)
  else
    pmSetFocus(EditSenha);
end;

end.
