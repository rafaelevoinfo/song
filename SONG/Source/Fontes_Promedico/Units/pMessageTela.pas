unit pMessageTela;

interface

uses
  AdvSmoothMessageDialog, GDIPFill, advstyleif, AdvSmartMessageBox,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, ComCtrls, RichEdit, dxGDIPlusClasses,
  jpeg;

type
  TIconCaption = (icINTERROGACAO, icCUIDADO);
  TIconBotao = (ibOK_SIM, ibNAO, ibRETORNAR);
  TPerguntaPadrao = (ppSIM_NAO, ppSIM_RETORNAR_NAO);

  TfrmMessageTela = class(TForm)
    TimerFechar: TTimer;
    ImgNAO: TImage;
    imgCuidado: TImage;
    imgInterrogacao: TImage;
    imgOKSIM: TImage;
    imgRETORNAR: TImage;
    msg: TAdvSmoothMessageDialog;
    procedure TimerFecharTimer(Sender: TObject);
  private
    class procedure fpvConfigurarMsg(ipCaption, ipMensagem: string; ipDefaultButton: integer; ipIcon: TIconCaption; ipTamanhoIcon: integer; ipEnabledKey, ipPermitirEnter: Boolean; ipMsgTela: TfrmMessageTela);
    class procedure ppvAddBotoes(ipTextos: array of string; ipIcones: Array of TIconBotao; ipHabilitarKeyBotoes: Boolean; ipMsgTela: TfrmMessageTela);
    { Private declarations }
  public
    puMsg: TAdvSmoothMessageDialog;

    class procedure ppuMsg(const ipMensagem: string); overload;
    class procedure ppuMsg(const ipMensagem: string; ipEnabledKey: Boolean); overload;
    class procedure ppuMsg(const ipMensagem: string; ipEnabledKey: Boolean; ipPermitirEnter: Boolean); overload;
    class procedure ppuMsgPopUp(const ipMensagem: String; ipDuracao: integer); overload;
    class procedure ppuMsgPopUp(const ipMensagem: String); overload;

    class function fpuMsg(const ipMensagem: String; ipPerguntaPadrao: TPerguntaPadrao): integer; overload;
    class function fpuMsg(const ipMensagem: String; ipTextosBotoes: array of string; ipIconesBotoes: array of TIconBotao; ipIcon: TIconCaption; ipDefaultButton: integer; ipEnabledKey,
      ipPermitirEnter: Boolean): integer; overload;
    class function fpuMsg(const ipMensagem: String; ipTextosBotoes: Array of string; ipIconesBotoes: Array of TIconBotao; ipIcon: TIconCaption; ipDefaultButton: integer; ipEnabledKey: Boolean): integer; overload;
    class function fpuMsg(const ipMensagem: String; ipTextosBotoes: Array of string; ipIconesBotoes: Array of TIconBotao; ipIcon: TIconCaption): integer; overload;
    class function fpuMsg(const ipGravarLog: Boolean; const ipMensagem: String; ipTextosBotoes: Array of string; ipIconesBotoes: Array of TIconBotao; ipIcon: TIconCaption; const ipTempoSegundos, ipTempoMilesegundos: integer): integer; overload;
    class function fpuMsg(const ipGravarLog: Boolean; const ipMensagem: String; ipTextosBotoes: Array of string; ipIconesBotoes: Array of TIconBotao; ipIcon: TIconCaption; const ipTempoSegundos, ipTempoMilesegundos: integer;
      ipEnabledKey, ipPermitirEnter: Boolean;
      ipDefaultButton: integer)
      : integer; overload;
  end;

var
  frmMessageTela: TfrmMessageTela;
  AdvMsg:TAdvSmartMessageBox;

const
  TTextoBotaoOk: Array [TIconBotao] of String = ('Ok', 'Não', 'Retornar');
  TTextoBotaoSim: Array [TIconBotao] of String = ('Sim', 'Não', 'Retornar');

implementation

uses
  pMethod2009, ppmClasse, pTypes;

{$R *.dfm}


class procedure TfrmMessageTela.fpvConfigurarMsg(ipCaption, ipMensagem: string; ipDefaultButton: integer; ipIcon: TIconCaption; ipTamanhoIcon: integer; ipEnabledKey, ipPermitirEnter: Boolean; ipMsgTela: TfrmMessageTela);
begin
  ipMsgTela.msg.Caption := ipCaption;
  //removendo a msg Remote Error
  ipMensagem := StringReplace(ipMensagem,coRemoteError,'RE',[rfReplaceAll,rfIgnoreCase]);

  ipMsgTela.msg.HTMLText.Text := ipMensagem;
  ipMsgTela.msg.Position := poMainFormCenter;
  ipMsgTela.msg.CaptionFill.BackGroundPicturePosition := ppTopLeft;
  // caso nao permita o enter desabilitado o keyEvents, porem isso nao impede que as teclas S e N ainda funcionem para quando estiver fazendo perguntas
  if ipPermitirEnter then
    ipMsgTela.msg.EnableKeyEvents := ipEnabledKey
  else
    ipMsgTela.msg.EnableKeyEvents := false;

  if ipEnabledKey then
    ipMsgTela.msg.DefaultButton := ipDefaultButton
  else
    ipMsgTela.msg.DefaultButton := -1;

  case ipIcon of
    icINTERROGACAO:
      ipMsgTela.msg.CaptionFill.Picture.Assign(ipMsgTela.imgInterrogacao.Picture);
    icCUIDADO:
      ipMsgTela.msg.CaptionFill.Picture.Assign(ipMsgTela.imgCuidado.Picture);
  end;

  ipMsgTela.msg.SetComponentStyle(tsOffice2010Silver);
  ipMsgTela.msg.Fill.Opacity := 255;
  ipMsgTela.msg.Fill.OpacityTo := 255;
  ipMsgTela.msg.Fill.OpacityMirror := 255;
  ipMsgTela.msg.Fill.OpacityMirrorTo := 255;
  ipMsgTela.msg.CaptionFill.PictureSize := psCustom;
  ipMsgTela.msg.CaptionFill.PictureWidth := ipTamanhoIcon;
  ipMsgTela.msg.CaptionFill.PictureHeight := ipTamanhoIcon;
  ipMsgTela.msg.CaptionFill.PicturePosition := ppTopLeft;
  ipMsgTela.msg.CaptionFill.PictureAspectRatio := TRUE;
  ipMsgTela.msg.CaptionFill.PictureAspectMode := pmStretch;
end;

class procedure TfrmMessageTela.ppvAddBotoes(ipTextos: Array of string; ipIcones: Array of TIconBotao; ipHabilitarKeyBotoes: Boolean; ipMsgTela: TfrmMessageTela);
var
  i: integer;
begin
  for i := low(ipTextos) to high(ipTextos) do
    begin
      with ipMsgTela.msg.Buttons.Add do
        begin
          if ipHabilitarKeyBotoes then
            Caption := '&' + ipTextos[i]
          else
            Caption := ipTextos[i];

          // ATENCAO: Nao retirar o +1 pq o valor ZERO nao pode ser atribuido para ButtonResult, pq senao a tela nao fecha
          ButtonResult := i + 1;
          if i <= High(ipIcones) then
            begin
              case ipIcones[i] of
                ibOK_SIM:
                  Picture.Assign(ipMsgTela.imgOKSIM.Picture);
                ibNAO:
                  Picture.Assign(ipMsgTela.ImgNAO.Picture);
                ibRETORNAR:
                  Picture.Assign(ipMsgTela.imgRETORNAR.Picture);
              end;
            end;

        end;
    end;
end;

class procedure TfrmMessageTela.ppuMsg(const ipMensagem: string);
begin
  ppuMsg(ipMensagem, TRUE);
end;

class procedure TfrmMessageTela.ppuMsg(const ipMensagem: string; ipEnabledKey: Boolean; ipPermitirEnter: Boolean);
begin
  fpuMsg(false, ipMensagem, [TTextoBotaoOk[ibOK_SIM]], [ibOK_SIM], icCUIDADO, 0, 0, ipEnabledKey, ipPermitirEnter, 0);
end;

class procedure TfrmMessageTela.ppuMsgPopUp(const ipMensagem: String);
begin
  ppuMsgPopUp(ipMensagem, 2000);
end;

class procedure TfrmMessageTela.ppuMsgPopUp(const ipMensagem: String;
  ipDuracao: integer);
begin

    AdvMsg.DisplayRelative := drForm;
    AdvMsg.DisplayType := dtStackedInOut;
    with AdvMsg.Messages.Add do
      Begin
        MinDuration := ipDuracao;
        MaxDuration := ipDuracao;
        Text := ipMensagem;
        show;
      End;
end;

class procedure TfrmMessageTela.ppuMsg(const ipMensagem: string; ipEnabledKey: Boolean);
begin
  fpuMsg(false, ipMensagem, [TTextoBotaoOk[ibOK_SIM]], [ibOK_SIM], icCUIDADO, 0, 0, ipEnabledKey, TRUE, 0);
end;

class function TfrmMessageTela.fpuMsg(const ipMensagem: String; ipTextosBotoes: array of string; ipIconesBotoes: array of TIconBotao; ipIcon: TIconCaption; ipDefaultButton: integer;
  ipEnabledKey: Boolean): integer;
begin
  Result := fpuMsg(false, ipMensagem, ipTextosBotoes, ipIconesBotoes, ipIcon, 0, 0, ipEnabledKey, TRUE, ipDefaultButton);
end;

class function TfrmMessageTela.fpuMsg(const ipMensagem: String; ipTextosBotoes: array of string; ipIconesBotoes: array of TIconBotao; ipIcon: TIconCaption; ipDefaultButton: integer;
  ipEnabledKey, ipPermitirEnter: Boolean): integer;
begin
  Result := fpuMsg(false, ipMensagem, ipTextosBotoes, ipIconesBotoes, ipIcon, 0, 0, ipEnabledKey, ipPermitirEnter, ipDefaultButton);
end;

class function TfrmMessageTela.fpuMsg(const ipMensagem: String; ipTextosBotoes: Array of string; ipIconesBotoes: Array of TIconBotao; ipIcon: TIconCaption): integer;
begin
  Result := fpuMsg(false, ipMensagem, ipTextosBotoes, ipIconesBotoes, ipIcon, 0, 0, TRUE, false, 0);
end;

class function TfrmMessageTela.fpuMsg(const ipGravarLog: Boolean; const ipMensagem: String; ipTextosBotoes: Array of string; ipIconesBotoes: Array of TIconBotao; ipIcon: TIconCaption; const ipTempoSegundos, ipTempoMilesegundos: integer): integer;
begin
  Result := fpuMsg(false, ipMensagem, ipTextosBotoes, ipIconesBotoes, ipIcon, ipTempoSegundos, ipTempoMilesegundos, false, false, 0);
end;

class function TfrmMessageTela.fpuMsg(const ipGravarLog: Boolean; const ipMensagem: String; ipTextosBotoes: Array of string; ipIconesBotoes: Array of TIconBotao; ipIcon: TIconCaption; const ipTempoSegundos, ipTempoMilesegundos: integer;
  ipEnabledKey, ipPermitirEnter: Boolean; ipDefaultButton: integer): integer;
var
  vaMsgTela: TfrmMessageTela;
begin
  if ipGravarLog then
    GravaLog(coEndConfig + 'Error\', ipMensagem);

  // vaMsg := TAdvSmoothMessageDialog.Create(Nil);
  vaMsgTela := TfrmMessageTela.Create(Nil);
  try
    fpvConfigurarMsg(sLineBreak, ipMensagem, ipDefaultButton, ipIcon, 38, ipEnabledKey, ipPermitirEnter, vaMsgTela);
    // adicionando botoes
    ppvAddBotoes(ipTextosBotoes, ipIconesBotoes, ipEnabledKey, vaMsgTela);

    if (ipTempoSegundos > 0) or (ipTempoMilesegundos > 0) then
      Begin
        vaMsgTela.msg.ProgressVisible := TRUE;
        vaMsgTela.msg.ProgressMaximum := (ipTempoSegundos) + (ipTempoMilesegundos / 1000);
        vaMsgTela.puMsg := vaMsgTela.msg;
        // vaMsgTela.msg.TimeOut := (ipTempoSegundos * 1000) + (ipTempoMilesegundos);
        vaMsgTela.TimerFechar.Enabled := TRUE;
      End
    else
      vaMsgTela.msg.TimeOut := 15000;

    try
      // se NAO foi passado explicitamente o tempo para fechar, Vou fechar e abrir novamente(isso é pra tentar evitar o problema da janela ficar no fundo e o usuario nao ver)
      if (ipTempoSegundos = 0) and (ipTempoMilesegundos = 0) then
        begin
          repeat
            Result := vaMsgTela.msg.ExecuteDialog - 1;
          until (Result <> 7);
        end
      else
        Result := vaMsgTela.msg.ExecuteDialog - 1; // NAO RETIRAR O -1 pq ele foi add pq na funcao de add é utilizado um +1 (por causa do buttonresult q nao aceita o valor zero)

    except
      on E: Exception do
        Result := -1;
    end;

  finally
    vaMsgTela.Free;
  end;

end;

class function TfrmMessageTela.fpuMsg(const ipMensagem: String;
  ipPerguntaPadrao: TPerguntaPadrao): integer;
begin
  case ipPerguntaPadrao of
    ppSIM_NAO:
      Result := fpuMsg(ipMensagem, [TTextoBotaoSim[ibOK_SIM], TTextoBotaoSim[ibNAO]], [ibOK_SIM, ibNAO], icINTERROGACAO);
    ppSIM_RETORNAR_NAO:
      Result := fpuMsg(ipMensagem, [TTextoBotaoSim[ibOK_SIM], TTextoBotaoSim[ibRETORNAR], TTextoBotaoSim[ibNAO]], [ibOK_SIM,ibRETORNAR, ibNAO], icINTERROGACAO);
  end;

end;

procedure TfrmMessageTela.TimerFecharTimer(Sender: TObject);
begin
  try
    if Assigned(puMsg) then
      Begin
        puMsg.ProgressValue := puMsg.ProgressValue + 1;
        if puMsg.ProgressValue >= puMsg.ProgressMaximum then
          begin
            TimerFechar.Enabled := false;
            puMsg.CloseDialog;
          end;
      End;
  except
    on E:
      Exception do
      Begin
        TimerFechar.Enabled := false;
      End;
  end;

end;

initialization
  AdvMsg:= TAdvSmartMessageBox.Create(nil);

finalization
  FreeAndNil(AdvMsg);

end.
